@implementation CCPBDataReader

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (CCPBDataReader)initWithData:(id)a3
{
  id v5;
  CCPBDataReader *v6;
  CCPBDataReader *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CCPBDataReader;
  v6 = -[CCPBDataReader init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_pos = 0;
    v7->_error = 0;
    v7->_length = -[NSData length](v7->_data, "length");
    v7->_bytes = (const char *)-[NSData bytes](v7->_data, "bytes");
  }

  return v7;
}

- (BOOL)hasError
{
  return self->_error != 0;
}

- (id)data
{
  return self->_data;
}

- (BOOL)isAtEnd
{
  return self->_pos >= self->_length;
}

- (BOOL)hasMoreData
{
  return !-[CCPBDataReader isAtEnd](self, "isAtEnd");
}

- (unint64_t)offset
{
  return self->_pos;
}

- (void)updateData:(id)a3
{
  NSData *data;
  NSData *v6;

  data = (NSData *)a3;
  v6 = data;
  if (self->_data != data)
  {
    objc_storeStrong((id *)&self->_data, a3);
    data = self->_data;
  }
  self->_bytes = (const char *)-[NSData bytes](data, "bytes");
  self->_length = -[NSData length](self->_data, "length");

}

- (BOOL)seekToOffset:(unint64_t)a3
{
  unint64_t length;

  length = self->_length;
  if (length >= a3)
  {
    self->_pos = a3;
    self->_error = 0;
  }
  return length >= a3;
}

- (void)readTag:(unsigned int *)a3 type:(char *)a4
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t pos;
  unint64_t v8;
  char v9;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  pos = self->_pos;
  while (1)
  {
    v8 = pos + 1;
    if (pos == -1 || v8 > self->_length)
      break;
    v9 = self->_bytes[pos];
    self->_pos = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0)
      goto LABEL_9;
    v4 += 7;
    pos = v8;
    if (v5++ >= 9)
    {
      v6 = 0;
      goto LABEL_11;
    }
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    v6 = 0;
LABEL_11:
  *a4 = v6 & 7;
  *a3 = v6 >> 3;
}

- (BOOL)skipValueWithTag:(unsigned int)a3 type:(unsigned __int8)a4
{
  return _CCPBReaderSkipValueWithTag(self, a3, a4, 0);
}

- (void)readTag:(unsigned __int16 *)a3 andType:(char *)a4
{
  char v4;
  unsigned int v5;
  unint64_t v6;
  unint64_t pos;
  unint64_t v8;
  char v9;

  v4 = 0;
  v5 = 0;
  v6 = 0;
  pos = self->_pos;
  while (1)
  {
    v8 = pos + 1;
    if (pos == -1 || v8 > self->_length)
      break;
    v9 = self->_bytes[pos];
    self->_pos = v8;
    v6 |= (unint64_t)(v9 & 0x7F) << v4;
    if ((v9 & 0x80) == 0)
      goto LABEL_9;
    v4 += 7;
    pos = v8;
    if (v5++ >= 9)
    {
      v6 = 0;
      goto LABEL_11;
    }
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    v6 = 0;
LABEL_11:
  *a4 = v6 & 7;
  *a3 = v6 >> 3;
}

- (BOOL)skipValueWithTag:(unsigned __int16)a3 andType:(unsigned __int8)a4
{
  return _CCPBReaderSkipValueWithTag(self, a3, a4, 0);
}

- (id)readProtoBuffer
{
  unsigned int v3;
  unint64_t pos;
  unint64_t length;
  uint64_t v6;
  void *v7;

  v3 = -[CCPBDataReader readBigEndianFixed32](self, "readBigEndianFixed32");
  pos = self->_pos;
  length = self->_length;
  if (pos + v3 <= length && (v6 = v3, length - pos >= v3))
  {
    -[NSData subdataWithRange:](self->_data, "subdataWithRange:");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    self->_pos += v6;
  }
  else
  {
    v7 = 0;
    self->_error = 1;
  }
  return v7;
}

- (char)readInt8
{
  unint64_t pos;
  unint64_t v3;
  char v4;

  pos = self->_pos;
  v3 = pos + 1;
  if (pos == -1 || v3 > self->_length)
  {
    v4 = 0;
    self->_error = 1;
  }
  else
  {
    v4 = self->_bytes[pos];
    self->_pos = v3;
  }
  return v4;
}

- (int64_t)readVarInt
{
  char v2;
  unsigned int v3;
  int64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
      return 0;
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    return 0;
  else
    return v4;
}

- (double)readDouble
{
  unint64_t pos;
  double result;

  pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFF7 && pos + 8 <= self->_length)
  {
    result = *(double *)&self->_bytes[pos];
    self->_pos = pos + 8;
  }
  else
  {
    self->_error = 1;
    return 0.0;
  }
  return result;
}

- (float)readFloat
{
  unint64_t pos;
  float result;

  pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFFBLL && pos + 4 <= self->_length)
  {
    result = *(float *)&self->_bytes[pos];
    self->_pos = pos + 4;
  }
  else
  {
    self->_error = 1;
    return 0.0;
  }
  return result;
}

- (int)readInt32
{
  char v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
      return 0;
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    return 0;
  else
    return v4;
}

- (int64_t)readInt64
{
  char v2;
  unsigned int v3;
  int64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
      return 0;
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    return 0;
  else
    return v4;
}

- (unsigned)readUint32
{
  char v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
      return 0;
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    return 0;
  else
    return v4;
}

- (unint64_t)readUint64
{
  char v2;
  unsigned int v3;
  unint64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
      return 0;
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    return 0;
  else
    return v4;
}

- (int)readSint32
{
  char v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
    {
      LODWORD(v4) = 0;
      return -(v4 & 1) ^ ((int)v4 >> 1);
    }
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    LODWORD(v4) = 0;
  return -(v4 & 1) ^ ((int)v4 >> 1);
}

- (int64_t)readSint64
{
  char v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
    {
      v4 = 0;
      return -(v4 & 1) ^ (v4 >> 1);
    }
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    v4 = 0;
  return -(v4 & 1) ^ (v4 >> 1);
}

- (unsigned)readFixed32
{
  unint64_t pos;
  unint64_t v3;
  unsigned int v4;

  pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFFBLL && (v3 = pos + 4, pos + 4 <= self->_length))
  {
    v4 = *(_DWORD *)&self->_bytes[pos];
    self->_pos = v3;
  }
  else
  {
    v4 = 0;
    self->_error = 1;
  }
  return v4;
}

- (unint64_t)readFixed64
{
  unint64_t pos;
  unint64_t v3;
  unint64_t v4;

  pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFF7 && (v3 = pos + 8, pos + 8 <= self->_length))
  {
    v4 = *(_QWORD *)&self->_bytes[pos];
    self->_pos = v3;
  }
  else
  {
    v4 = 0;
    self->_error = 1;
  }
  return v4;
}

- (int)readSfixed32
{
  unint64_t pos;
  unint64_t v3;
  int v4;

  pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFFBLL && (v3 = pos + 4, pos + 4 <= self->_length))
  {
    v4 = *(_DWORD *)&self->_bytes[pos];
    self->_pos = v3;
  }
  else
  {
    v4 = 0;
    self->_error = 1;
  }
  return v4;
}

- (int64_t)readSfixed64
{
  unint64_t pos;
  unint64_t v3;
  int64_t v4;

  pos = self->_pos;
  if (pos <= 0xFFFFFFFFFFFFFFF7 && (v3 = pos + 8, pos + 8 <= self->_length))
  {
    v4 = *(_QWORD *)&self->_bytes[pos];
    self->_pos = v3;
  }
  else
  {
    v4 = 0;
    self->_error = 1;
  }
  return v4;
}

- (BOOL)readBOOL
{
  char v2;
  unsigned int v3;
  uint64_t v4;
  unint64_t pos;
  unint64_t v6;
  char v7;
  BOOL v10;

  v2 = 0;
  v3 = 0;
  v4 = 0;
  pos = self->_pos;
  while (1)
  {
    v6 = pos + 1;
    if (pos == -1 || v6 > self->_length)
      break;
    v7 = self->_bytes[pos];
    self->_pos = v6;
    v4 |= (unint64_t)(v7 & 0x7F) << v2;
    if ((v7 & 0x80) == 0)
      goto LABEL_9;
    v2 += 7;
    pos = v6;
    if (v3++ >= 9)
      return 0;
  }
  self->_error = 1;
LABEL_9:
  if (self->_error)
    v10 = 1;
  else
    v10 = v4 == 0;
  return !v10;
}

- (BOOL)mark:(id *)a3
{
  return CCPBReaderPlaceMark(self, &a3->var0);
}

- (void)recall:(id *)a3
{
  self->_pos = a3->var0;
  self->_length = a3->var1;
}

- (id)readBytes:(unsigned int)a3
{
  void *v5;
  unint64_t pos;

  if (-[CCPBDataReader hasError](self, "hasError"))
  {
    v5 = 0;
  }
  else
  {
    pos = self->_pos;
    if (__CFADD__(pos, a3) || pos + a3 > self->_length)
    {
      v5 = 0;
      self->_error = 1;
    }
    else
    {
      -[NSData subdataWithRange:](self->_data, "subdataWithRange:");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      self->_pos += a3;
    }
  }
  return v5;
}

- (id)readBigEndianShortThenString
{
  unsigned int v3;
  void *v4;
  unint64_t pos;
  BOOL v6;
  unint64_t v7;
  const void *v8;

  v3 = -[CCPBDataReader readBigEndianFixed16](self, "readBigEndianFixed16");
  if (-[CCPBDataReader hasError](self, "hasError"))
  {
    v4 = 0;
  }
  else
  {
    pos = self->_pos;
    v6 = __CFADD__(pos, v3);
    v7 = pos + v3;
    if (v6 || v7 > self->_length)
    {
      v4 = 0;
      self->_error = 1;
    }
    else
    {
      v8 = -[NSData bytes](self->_data, "bytes") + self->_pos;
      v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithBytes:length:encoding:", v8, v3, 4);
      self->_pos += v3;
    }
  }
  return v4;
}

- (unint64_t)length
{
  return self->_length;
}

- (void)setLength:(unint64_t)a3
{
  self->_length = a3;
}

- (unint64_t)position
{
  return self->_pos;
}

- (void)setPosition:(unint64_t)a3
{
  self->_pos = a3;
}

@end

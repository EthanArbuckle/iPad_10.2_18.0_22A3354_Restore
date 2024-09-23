@implementation ENProtobufCoder

- (ENProtobufCoder)init
{
  ENProtobufCoder *v2;
  ENProtobufCoder *v3;
  ENProtobufCoder *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ENProtobufCoder;
  v2 = -[ENProtobufCoder init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_bufferMaxSize = 0x20000;
    v4 = v2;
  }

  return v3;
}

- (void)setReadMemory:(const void *)a3 length:(unint64_t)a4
{
  ENArchive *readArchive;
  NSMutableData *bufferData;

  readArchive = self->_readArchive;
  self->_readArchive = 0;

  self->_readBase = (const char *)a3;
  self->_readSrc = (const char *)a3;
  self->_readEnd = (char *)a3 + a4;
  *(_OWORD *)&self->_writeBase = 0u;
  *(_OWORD *)&self->_writeLim = 0u;
  bufferData = self->_bufferData;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (void)setWriteMemory:(void *)a3 length:(unint64_t)a4
{
  ENArchive *readArchive;
  NSMutableData *bufferData;

  readArchive = self->_readArchive;
  self->_readArchive = 0;

  self->_readBase = 0;
  self->_readSrc = 0;
  self->_readEnd = 0;
  self->_writeBase = (char *)a3;
  self->_writeDst = (char *)a3;
  self->_writeLim = (char *)a3 + a4;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (void)setWriteMutableData:(id)a3
{
  NSMutableData *v4;
  ENArchive *readArchive;
  NSMutableData *bufferData;

  v4 = (NSMutableData *)a3;
  readArchive = self->_readArchive;
  self->_readArchive = 0;

  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  *(_OWORD *)&self->_readBase = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = v4;

  self->_bufferOffset = 0;
}

- (void)setFileHandle:(__sFILE *)a3
{
  ENArchive *readArchive;
  NSMutableData *bufferData;

  readArchive = self->_readArchive;
  self->_readArchive = 0;

  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  *(_OWORD *)&self->_readBase = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = a3;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (void)setReadArchive:(id)a3
{
  id v5;
  NSMutableData *bufferData;

  objc_storeStrong((id *)&self->_readArchive, a3);
  v5 = a3;
  *(_OWORD *)&self->_readBase = 0u;
  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (id)dequeueOrCreateSubCoder
{
  ENProtobufCoder *v2;
  ENProtobufCoder *v3;

  -[NSMutableArray popFirstObject](self->_subCoders, "popFirstObject");
  v2 = (ENProtobufCoder *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = v2;
    -[ENProtobufCoder prepareForReuse](v2, "prepareForReuse");
  }
  else
  {
    v3 = objc_alloc_init(ENProtobufCoder);
  }
  return v3;
}

- (void)enqueueSubCoder:(id)a3
{
  id v4;
  NSMutableArray *subCoders;
  NSMutableArray *v6;
  NSMutableArray *v7;
  id v8;

  v4 = a3;
  subCoders = self->_subCoders;
  v8 = v4;
  if (!subCoders)
  {
    v6 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v7 = self->_subCoders;
    self->_subCoders = v6;

    v4 = v8;
    subCoders = self->_subCoders;
  }
  -[NSMutableArray addObject:](subCoders, "addObject:", v4);

}

- (void)prepareForReuse
{
  ENArchive *readArchive;
  NSMutableData *bufferData;

  readArchive = self->_readArchive;
  self->_readArchive = 0;

  *(_OWORD *)&self->_readEnd = 0u;
  *(_OWORD *)&self->_writeDst = 0u;
  *(_OWORD *)&self->_readBase = 0u;
  bufferData = self->_bufferData;
  self->_fileHandle = 0;
  self->_bufferData = 0;

  self->_bufferOffset = 0;
}

- (BOOL)readType:(char *)a3 tag:(unint64_t *)a4 eofOkay:(BOOL)a5 error:(id *)a6
{
  _BOOL4 v8;
  char v9;
  unint64_t v11;

  v11 = 0;
  v8 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v11, a5, a6);
  if (v8)
  {
    v9 = v11;
    *a4 = v11 >> 3;
    *a3 = v9 & 7;
  }
  return v8;
}

- (const)readLengthDelimited:(unint64_t *)a3 error:(id *)a4
{
  ENProtobufCoder *v7;
  const char *result;
  unint64_t v9;

  v9 = 0;
  if (!-[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v9, 0, a4))
    return 0;
  v7 = objc_retainAutorelease(self);
  result = -[ENProtobufCoder _readLength:eofOkay:error:](v7, "_readLength:eofOkay:error:", v9, 0, a4);
  if (result)
    *a3 = v9;
  return result;
}

- (BOOL)writeLengthDelimitedPtr:(const void *)a3 length:(unint64_t)a4 tag:(unint64_t)a5 error:(id *)a6
{
  return -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a5) | 2, a6)
      && -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", a4, a6)
      && -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", a3, a4, a6);
}

- (BOOL)skipType:(unsigned __int8)a3 error:(id *)a4
{
  ENProtobufCoder *v5;
  BOOL v6;
  _BOOL4 v7;
  uint64_t v8;
  id v9;
  uint64_t v11;

  v5 = self;
  switch(a3)
  {
    case 0u:
      v11 = 0;
      v6 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v11, 0, a4);
      LOBYTE(v7) = 0;
      if (v6)
        goto LABEL_11;
      return v7;
    case 1u:
      v8 = 8;
      goto LABEL_10;
    case 2u:
      v11 = 0;
      v7 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v11, 0, a4);
      if (!v7)
        return v7;
      v8 = v11;
      self = v5;
LABEL_10:
      if (-[ENProtobufCoder _skipLength:error:](self, "_skipLength:error:", v8, a4))
LABEL_11:
        LOBYTE(v7) = 1;
      else
LABEL_12:
        LOBYTE(v7) = 0;
      break;
    case 5u:
      v8 = 4;
      goto LABEL_10;
    default:
      if (!a4)
        goto LABEL_12;
      NSErrorF();
      v9 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v7) = 0;
      *a4 = v9;
      break;
  }
  return v7;
}

- (id)readNSDataAndReturnError:(id *)a3
{
  ENProtobufCoder *v5;
  char *v6;
  id v7;
  char *v8;
  char *v9;
  uint64_t v11;

  v11 = 0;
  if (!-[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v11, 0, a3))
    return 0;
  if (v11 == -1)
  {
    if (a3)
    {
      NSErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  v5 = objc_retainAutorelease(self);
  v6 = -[ENProtobufCoder _readLength:eofOkay:error:](v5, "_readLength:eofOkay:error:", v11, 0, a3);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDBCE50]);
    v8 = (char *)objc_msgSend(v7, "initWithBytes:length:", v6, v11);
    v6 = v8;
    if (v8)
    {
      v9 = v8;
    }
    else if (a3)
    {
      NSErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

- (BOOL)writeNSData:(id)a3 tag:(unint64_t)a4 error:(id *)a5
{
  id v8;
  uint64_t v9;
  uint64_t v10;

  v8 = objc_retainAutorelease(a3);
  v9 = objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  return -[ENProtobufCoder writeLengthDelimitedPtr:length:tag:error:](self, "writeLengthDelimitedPtr:length:tag:error:", v9, v10, a4, a5);
}

- (id)readNSStringAndReturnError:(id *)a3
{
  ENProtobufCoder *v5;
  char *v6;
  id v7;
  char *v8;
  char *v9;
  uint64_t v11;

  v11 = 0;
  if (!-[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v11, 0, a3))
    return 0;
  if (v11 == -1)
  {
    if (a3)
    {
      NSErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
      return 0;
    }
    return 0;
  }
  v5 = objc_retainAutorelease(self);
  v6 = -[ENProtobufCoder _readLength:eofOkay:error:](v5, "_readLength:eofOkay:error:", v11, 0, a3);
  if (v6)
  {
    v7 = objc_alloc(MEMORY[0x24BDD17C8]);
    v8 = (char *)objc_msgSend(v7, "initWithBytes:length:encoding:", v6, v11, 4);
    v6 = v8;
    if (v8)
    {
      v9 = v8;
    }
    else if (a3)
    {
      NSErrorF();
      *a3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
  return v6;
}

- (BOOL)writeNSString:(id)a3 tag:(unint64_t)a4 error:(id *)a5
{
  const char *v8;

  v8 = (const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String");
  return -[ENProtobufCoder writeLengthDelimitedPtr:length:tag:error:](self, "writeLengthDelimitedPtr:length:tag:error:", v8, strlen(v8), a4, a5);
}

- (BOOL)readVarInt:(unint64_t *)a3 eofOkay:(BOOL)a4 error:(id *)a5
{
  _BOOL8 v6;
  unint64_t v9;
  unint64_t v10;
  const char *v11;
  unint64_t v12;
  id v13;

  v6 = a4;
  v9 = 0;
  v10 = -7;
  while (1)
  {
    v11 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 1, v6, a5);
    if (!v11)
      return (char)v11;
    v12 = (unint64_t)(*v11 & 0x7F) << (v10 + 7);
    if (v12 >> (v10 + 7) != (*v11 & 0x7F))
      break;
    v9 |= v12;
    if ((*v11 & 0x80000000) == 0)
    {
      *a3 = v9;
      LOBYTE(v11) = 1;
      return (char)v11;
    }
    v10 += 7;
    if (v10 >= 0x39)
    {
      if (a5)
        goto LABEL_11;
      goto LABEL_12;
    }
  }
  if (a5)
  {
LABEL_11:
    NSErrorF();
    v13 = (id)objc_claimAutoreleasedReturnValue();
    LOBYTE(v11) = 0;
    *a5 = v13;
    return (char)v11;
  }
LABEL_12:
  LOBYTE(v11) = 0;
  return (char)v11;
}

- (BOOL)writeVarInt:(unint64_t)a3 error:(id *)a4
{
  char v8;
  char v9;

  while (a3 >= 0x80)
  {
    v9 = a3 | 0x80;
    a3 >>= 7;
    if (!-[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", &v9, 1, a4))
      return 0;
  }
  v8 = a3;
  return -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", &v8, 1, a4);
}

- (BOOL)readVarIntSInt32:(int *)a3 error:(id *)a4
{
  _BOOL4 v5;
  uint64_t v7;

  v7 = 0;
  v5 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v7, 0, a4);
  if (v5)
    *a3 = -(v7 & 1) ^ ((int)v7 >> 1);
  return v5;
}

- (BOOL)writeVarIntSInt32:(int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", 8 * a4, a5);
  if (v8)
    LOBYTE(v8) = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (2 * a3) ^ (a3 >> 31), a5);
  return v8;
}

- (BOOL)readVarIntInt32:(int *)a3 error:(id *)a4
{
  _BOOL4 v6;
  id v7;
  uint64_t v9;

  v9 = 0;
  v6 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v9, 0, a4);
  if (v6)
  {
    if (v9 == (int)v9)
    {
      *a3 = v9;
      LOBYTE(v6) = 1;
    }
    else if (a4)
    {
      NSErrorF();
      v7 = (id)objc_claimAutoreleasedReturnValue();
      LOBYTE(v6) = 0;
      *a4 = v7;
    }
    else
    {
      LOBYTE(v6) = 0;
    }
  }
  return v6;
}

- (BOOL)readVarIntUInt32:(unsigned int *)a3 error:(id *)a4
{
  _BOOL4 v6;
  id v7;
  unint64_t v9;

  v9 = 0;
  v6 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v9, 0, a4);
  if (v6)
  {
    if (HIDWORD(v9))
    {
      if (a4)
      {
        NSErrorF();
        v7 = (id)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = 0;
        *a4 = v7;
      }
      else
      {
        LOBYTE(v6) = 0;
      }
    }
    else
    {
      *a3 = v9;
      LOBYTE(v6) = 1;
    }
  }
  return v6;
}

- (BOOL)writeVarIntUInt32:(unsigned int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", 8 * a4, a5);
  if (v8)
    LOBYTE(v8) = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", a3, a5);
  return v8;
}

- (BOOL)readVarIntSInt64:(int64_t *)a3 error:(id *)a4
{
  _BOOL4 v5;
  uint64_t v7;

  v7 = 0;
  v5 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v7, 0, a4);
  if (v5)
    *a3 = -(v7 & 1) ^ (v7 >> 1);
  return v5;
}

- (BOOL)writeVarIntSInt64:(int64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", 8 * a4, a5);
  if (v8)
    LOBYTE(v8) = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (2 * a3) ^ (a3 >> 63), a5);
  return v8;
}

- (BOOL)readVarIntUInt64:(unint64_t *)a3 error:(id *)a4
{
  _BOOL4 v5;
  unint64_t v7;

  v7 = 0;
  v5 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v7, 0, a4);
  if (v5)
    *a3 = v7;
  return v5;
}

- (BOOL)writeVarIntUInt64:(unint64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", 8 * a4, a5);
  if (v8)
    LOBYTE(v8) = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", a3, a5);
  return v8;
}

- (BOOL)readVarIntBoolean:(BOOL *)a3 error:(id *)a4
{
  _BOOL4 v5;
  uint64_t v7;

  v7 = 0;
  v5 = -[ENProtobufCoder readVarInt:eofOkay:error:](self, "readVarInt:eofOkay:error:", &v7, 0, a4);
  if (v5)
    *a3 = v7 != 0;
  return v5;
}

- (BOOL)writeVarIntBoolean:(BOOL)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v6;
  _BOOL4 v8;

  v6 = a3;
  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", 8 * a4, a5);
  if (v8)
    LOBYTE(v8) = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", v6, a5);
  return v8;
}

- (BOOL)readFixedFloat:(float *)a3 error:(id *)a4
{
  const char *v5;

  v5 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 4, 0, a4);
  if (v5)
    *a3 = *(float *)v5;
  return v5 != 0;
}

- (BOOL)writeFixedFloat:(float)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;
  float v10;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 5);
  if (v8)
  {
    v10 = a3;
    LOBYTE(v8) = -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", &v10, 4, a5);
  }
  return v8;
}

- (BOOL)readFixedSInt32:(int *)a3 error:(id *)a4
{
  const char *v5;

  v5 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 4, 0, a4);
  if (v5)
    *a3 = *(_DWORD *)v5;
  return v5 != 0;
}

- (BOOL)writeFixedSInt32:(int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;
  int v10;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 5, a5);
  if (v8)
  {
    v10 = a3;
    LOBYTE(v8) = -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", &v10, 4, a5);
  }
  return v8;
}

- (BOOL)readFixedUInt32:(unsigned int *)a3 error:(id *)a4
{
  const char *v5;

  v5 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 4, 0, a4);
  if (v5)
    *a3 = *(_DWORD *)v5;
  return v5 != 0;
}

- (BOOL)writeFixedUInt32:(unsigned int)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;
  unsigned int v10;

  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 5, a5);
  if (v8)
  {
    v10 = a3;
    LOBYTE(v8) = -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", &v10, 4, a5);
  }
  return v8;
}

- (BOOL)readFixedDouble:(double *)a3 error:(id *)a4
{
  const char *v5;

  v5 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 8, 0, a4);
  if (v5)
    *a3 = *(double *)v5;
  return v5 != 0;
}

- (BOOL)writeFixedDouble:(double)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 1);
  if (v8)
  {
    *(double *)v10 = a3;
    LOBYTE(v8) = -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", v10, 8, a5);
  }
  return v8;
}

- (BOOL)readFixedSInt64:(int64_t *)a3 error:(id *)a4
{
  const char *v5;

  v5 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 8, 0, a4);
  if (v5)
    *a3 = *(_QWORD *)v5;
  return v5 != 0;
}

- (BOOL)writeFixedSInt64:(int64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 1, a5);
  if (v8)
  {
    v10[0] = a3;
    LOBYTE(v8) = -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", v10, 8, a5);
  }
  return v8;
}

- (BOOL)readFixedUInt64:(unint64_t *)a3 error:(id *)a4
{
  const char *v5;

  v5 = -[ENProtobufCoder _readLength:eofOkay:error:](objc_retainAutorelease(self), "_readLength:eofOkay:error:", 8, 0, a4);
  if (v5)
    *a3 = *(_QWORD *)v5;
  return v5 != 0;
}

- (BOOL)writeFixedUInt64:(unint64_t)a3 tag:(unint64_t)a4 error:(id *)a5
{
  _BOOL4 v8;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  v8 = -[ENProtobufCoder writeVarInt:error:](self, "writeVarInt:error:", (8 * a4) | 1, a5);
  if (v8)
  {
    v10[0] = a3;
    LOBYTE(v8) = -[ENProtobufCoder _writeBytes:length:error:](self, "_writeBytes:length:error:", v10, 8, a5);
  }
  return v8;
}

- (const)_readLength:(unint64_t)a3 eofOkay:(BOOL)a4 error:(id *)a5
{
  char *readSrc;
  FILE *fileHandle;
  unint64_t v10;
  NSMutableData *v11;
  NSMutableData *v12;
  NSMutableData *v13;
  id v14;
  id v16;
  ENProtobufCoder *v17;
  SEL v18;
  unint64_t v19;
  id *v20;

  readSrc = (char *)self->_readSrc;
  if (readSrc)
  {
    if (self->_readEnd - (const char *)readSrc < a3)
    {
      if (a5)
      {
        if (a4)
        {
          readSrc = 0;
          *a5 = 0;
          return readSrc;
        }
        NSErrorF();
        v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v16;

      }
      return 0;
    }
    self->_readSrc = &readSrc[a3];
    return readSrc;
  }
  fileHandle = self->_fileHandle;
  v10 = self->_readArchive;
  if (!((unint64_t)fileHandle | v10))
  {
    if (!a5)
      goto LABEL_23;
    goto LABEL_13;
  }
  if (self->_bufferMaxSize < a3)
  {
    if (!a5)
      goto LABEL_23;
LABEL_13:
    NSErrorF();
    readSrc = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (a3 <= 0x100)
  {
    readSrc = (char *)self->_staticBuffer;
    if (!fileHandle)
      goto LABEL_8;
LABEL_18:
    if (fread(readSrc, 1uLL, a3, fileHandle) != a3)
    {
      if (a5)
      {
        if (feof(fileHandle))
        {
          readSrc = 0;
          *a5 = 0;
          goto LABEL_24;
        }
        __error();
        NSErrorF();
        v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
        *a5 = v14;

      }
LABEL_23:
      readSrc = 0;
    }
LABEL_24:

    return readSrc;
  }
  v11 = self->_bufferData;
  if (v11)
  {
    v12 = v11;
    -[NSMutableData setLength:](v11, "setLength:", a3);
  }
  else
  {
    v12 = (NSMutableData *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEC8]), "initWithLength:", a3);
    objc_storeStrong((id *)&self->_bufferData, v12);
  }
  v13 = objc_retainAutorelease(v12);
  readSrc = -[NSMutableData mutableBytes](v13, "mutableBytes");

  if (fileHandle)
    goto LABEL_18;
LABEL_8:
  if (v10)
  {
    if ((objc_msgSend((id)v10, "readDataIntoBuffer:length:error:", readSrc, a3, a5) & 1) == 0)
      readSrc = 0;
    goto LABEL_24;
  }
  v17 = (ENProtobufCoder *)FatalErrorF();
  return (const char *)-[ENProtobufCoder _skipLength:error:](v17, v18, v19, v20);
}

- (BOOL)_skipLength:(unint64_t)a3 error:(id *)a4
{
  const char *readSrc;
  char v7;
  ENArchive *v9;
  ENArchive *v10;

  readSrc = self->_readSrc;
  if (readSrc)
  {
    if (self->_readEnd - readSrc >= a3)
    {
      self->_readSrc = &readSrc[a3];
      return 1;
    }
    if (!a4)
      return 0;
LABEL_13:
    NSErrorF();
    v7 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    return v7;
  }
  if (self->_fileHandle)
  {
    v7 = 1;
    if (fseeko(self->_fileHandle, a3, 1) && (!*__error() || *__error()))
    {
      if (!a4)
        return 0;
      goto LABEL_13;
    }
  }
  else
  {
    v9 = self->_readArchive;
    v10 = v9;
    if (v9)
    {
      v7 = -[ENArchive skipBytes:error:](v9, "skipBytes:error:", a3, a4);
    }
    else if (a4)
    {
      NSErrorF();
      v7 = 0;
      *a4 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (BOOL)_writeBytes:(const void *)a3 length:(unint64_t)a4 error:(id *)a5
{
  char *writeDst;
  BOOL v10;
  FILE *fileHandle;
  NSMutableData *v12;
  NSMutableData *v13;

  writeDst = self->_writeDst;
  if (!writeDst)
  {
    fileHandle = self->_fileHandle;
    if (fileHandle)
    {
      v10 = 1;
      if (fwrite(a3, 1uLL, a4, fileHandle) == a4)
        return v10;
      if (a5)
      {
        __error();
LABEL_14:
        NSErrorF();
        v10 = 0;
        *a5 = (id)objc_claimAutoreleasedReturnValue();
        return v10;
      }
      return 0;
    }
    v12 = self->_bufferData;
    v13 = v12;
    if (v12)
    {
      if (self->_bufferMaxSize - self->_bufferOffset >= a4)
      {
        -[NSMutableData appendBytes:length:](v12, "appendBytes:length:", a3, a4);
        self->_bufferOffset += a4;
        v10 = 1;
LABEL_18:

        return v10;
      }
      if (!a5)
      {
LABEL_17:
        v10 = 0;
        goto LABEL_18;
      }
    }
    else if (!a5)
    {
      goto LABEL_17;
    }
    NSErrorF();
    v10 = 0;
    *a5 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  if (self->_writeLim - writeDst < a4)
  {
    if (a5)
      goto LABEL_14;
    return 0;
  }
  memcpy(self->_writeDst, a3, a4);
  self->_writeDst = &writeDst[a4];
  return 1;
}

- (ENArchive)readArchive
{
  return self->_readArchive;
}

- (const)readBase
{
  return self->_readBase;
}

- (const)readSrc
{
  return self->_readSrc;
}

- (const)readEnd
{
  return self->_readEnd;
}

- (char)writeBase
{
  return self->_writeBase;
}

- (char)writeDst
{
  return self->_writeDst;
}

- (char)writeLim
{
  return self->_writeLim;
}

- (__sFILE)fileHandle
{
  return self->_fileHandle;
}

- (NSMutableData)bufferData
{
  return self->_bufferData;
}

- (unint64_t)bufferOffset
{
  return self->_bufferOffset;
}

- (void)setBufferOffset:(unint64_t)a3
{
  self->_bufferOffset = a3;
}

- (unint64_t)bufferMaxSize
{
  return self->_bufferMaxSize;
}

- (void)setBufferMaxSize:(unint64_t)a3
{
  self->_bufferMaxSize = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bufferData, 0);
  objc_storeStrong((id *)&self->_readArchive, 0);
  objc_storeStrong((id *)&self->_subCoders, 0);
}

@end

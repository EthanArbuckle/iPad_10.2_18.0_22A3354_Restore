@implementation CCPBDataWriter

- (id)immutableData
{
  return self->_data;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

- (CCPBDataWriter)init
{
  CCPBDataWriter *v2;
  CCPBMutableData *v3;
  CCPBMutableData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCPBDataWriter;
  v2 = -[CCPBDataWriter init](&v6, sel_init);
  if (v2)
  {
    v3 = -[CCPBMutableData initWithCapacity:]([CCPBMutableData alloc], "initWithCapacity:", 256);
    data = v2->_data;
    v2->_data = v3;

  }
  return v2;
}

- (CCPBDataWriter)initWithInitialCapacity:(unint64_t)a3
{
  CCPBDataWriter *v4;
  CCPBMutableData *v5;
  unint64_t v6;
  uint64_t v7;
  CCPBMutableData *data;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCPBDataWriter;
  v4 = -[CCPBDataWriter init](&v10, sel_init);
  if (v4)
  {
    v5 = [CCPBMutableData alloc];
    if (a3 <= 0x100)
      v6 = 256;
    else
      v6 = a3;
    v7 = -[CCPBMutableData initWithCapacity:](v5, "initWithCapacity:", v6);
    data = v4->_data;
    v4->_data = (CCPBMutableData *)v7;

  }
  return v4;
}

- (void)writeInt32:(int)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteInt32Field((uint64_t)self, a3, a4);
}

- (void)writeInt64:(int64_t)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteInt64Field((uint64_t)self, a3, a4);
}

- (void)writeUint32:(unsigned int)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteUint32Field((uint64_t)self, a3, a4);
}

- (void)writeUint64:(unint64_t)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteUint64Field((uint64_t)self, a3, a4);
}

- (void)writeBOOL:(BOOL)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteBOOLField((uint64_t)self, a3, a4);
}

- (void)writeSint32:(int)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteSint32Field((uint64_t)self, a3, a4);
}

- (void)writeSint64:(int64_t)a3 forTag:(unsigned int)a4
{
  int64_t v7;
  CCPBMutableData *data;
  unint64_t end;
  unint64_t v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  char *p;
  unint64_t v15;
  unint64_t v16;
  char *v17;
  int64_t v18;
  unint64_t v19;

  v7 = 2 * a3;
  data = self->_data;
  end = (unint64_t)data->end;
  if ((char *)end < data->p + 16)
  {
    v10 = end - (unint64_t)data->buffer;
    if (v10 <= 0x10)
      v11 = 16;
    else
      v11 = v10;
    -[CCPBMutableData _pb_growCapacityBy:](data, v11);
    data = self->_data;
  }
  v12 = v7 ^ (a3 >> 63);
  if (a4 != -1)
  {
    v13 = 8 * a4;
    p = data->p;
    if (v13 < 0x80)
    {
      LOBYTE(v15) = 8 * a4;
    }
    else
    {
      do
      {
        *p++ = v13 | 0x80;
        v15 = v13 >> 7;
        v16 = v13 >> 14;
        v13 >>= 7;
      }
      while (v16);
    }
    *p = v15;
    self->_data->p = p + 1;
    data = self->_data;
  }
  v17 = data->p;
  if (v12 < 0x80)
  {
    v18 = v7 ^ (a3 >> 63);
  }
  else
  {
    do
    {
      *v17++ = v12 | 0x80;
      v18 = v12 >> 7;
      v19 = v12 >> 14;
      v12 >>= 7;
    }
    while (v19);
  }
  *v17 = v18;
  self->_data->p = v17 + 1;
}

- (void)writeDouble:(double)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteDoubleField((uint64_t)self, a4, a3);
}

- (void)writeFloat:(float)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteFloatField((uint64_t)self, a4, a3);
}

- (void)writeFixed32:(unsigned int)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteFixed32Field((uint64_t)self, a3, a4);
}

- (void)writeFixed64:(unint64_t)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteFixed64Field((uint64_t)self, a3, a4);
}

- (void)writeSfixed32:(int)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteSfixed32Field((uint64_t)self, a3, a4);
}

- (void)writeSfixed64:(int64_t)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteSfixed64Field((uint64_t)self, a3, a4);
}

- (void)writeString:(id)a3 forTag:(unsigned int)a4
{
  CCPBDataWriterWriteStringField((uint64_t)self, a3, a4);
}

- (void)writeData:(id)a3 forTag:(unsigned int)a4
{
  if (a3)
    CCPBDataWriterWriteDataField((uint64_t)self, a3, a4);
}

- (unint64_t)write:(const char *)a3 maxLength:(unint64_t)a4
{
  CCPBMutableData *data;
  char *end;
  char *p;
  unint64_t v10;

  data = self->_data;
  end = data->end;
  p = data->p;
  if (end < &p[a4])
  {
    if (end - data->buffer <= a4)
      v10 = a4;
    else
      v10 = end - data->buffer;
    -[CCPBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  memcpy(p, a3, a4);
  self->_data->p += a4;
  return a4;
}

- (BOOL)writeData:(id)a3
{
  id v4;
  size_t v5;
  CCPBMutableData *data;
  char *end;
  char *p;
  size_t v9;
  uint64_t v10;
  id v11;

  v4 = a3;
  v5 = objc_msgSend(v4, "length");
  data = self->_data;
  end = data->end;
  p = data->p;
  if (end < &p[v5])
  {
    v9 = end - data->buffer;
    if (v9 <= v5)
      v10 = v5;
    else
      v10 = v9;
    -[CCPBMutableData _pb_growCapacityBy:](data, v10);
    p = self->_data->p;
  }
  v11 = objc_retainAutorelease(v4);
  memcpy(p, (const void *)objc_msgSend(v11, "bytes"), v5);
  self->_data->p += v5;

  return 1;
}

@end

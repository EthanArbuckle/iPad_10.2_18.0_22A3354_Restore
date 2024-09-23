@implementation _DPBigEndianDataEncoder

- (_DPBigEndianDataEncoder)init
{
  _DPBigEndianDataEncoder *v2;
  NSMutableData *v3;
  NSMutableData *buffer;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_DPBigEndianDataEncoder;
  v2 = -[_DPBigEndianDataEncoder init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableData *)objc_alloc_init(MEMORY[0x1E0C99DF0]);
    buffer = v2->_buffer;
    v2->_buffer = v3;

  }
  return v2;
}

- (_DPBigEndianDataEncoder)initWithCapacity:(unint64_t)a3
{
  _DPBigEndianDataEncoder *v4;
  uint64_t v5;
  NSMutableData *buffer;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)_DPBigEndianDataEncoder;
  v4 = -[_DPBigEndianDataEncoder init](&v8, sel_init);
  if (v4)
  {
    v5 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithCapacity:", a3);
    buffer = v4->_buffer;
    v4->_buffer = (NSMutableData *)v5;

  }
  return v4;
}

- (void)writeUInt64:(unint64_t)a3
{
  void *v3;
  unint64_t v4;

  v4 = bswap64(a3);
  -[_DPBigEndianDataEncoder buffer](self, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 8);

}

- (void)writeUInt32:(unsigned int)a3
{
  void *v3;
  unsigned int v4;

  v4 = bswap32(a3);
  -[_DPBigEndianDataEncoder buffer](self, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 4);

}

- (BOOL)writeUInt24:(unsigned int)a3
{
  unsigned int v3;
  __int16 v4;

  v3 = HIBYTE(a3);
  if (!HIBYTE(a3))
  {
    v4 = a3;
    -[_DPBigEndianDataEncoder writeUChar:](self, "writeUChar:", BYTE2(a3));
    -[_DPBigEndianDataEncoder writeUChar:](self, "writeUChar:", HIBYTE(v4));
    -[_DPBigEndianDataEncoder writeUChar:](self, "writeUChar:", v4);
  }
  return v3 == 0;
}

- (void)writeInt16:(signed __int16)a3
{
  -[_DPBigEndianDataEncoder writeUInt16:](self, "writeUInt16:", (unsigned __int16)a3);
}

- (void)writeUInt16:(unsigned __int16)a3
{
  void *v3;
  __int16 v4;

  v4 = __rev16(a3);
  -[_DPBigEndianDataEncoder buffer](self, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 2);

}

- (void)writeFloat64:(double)a3
{
  -[_DPBigEndianDataEncoder writeUInt64:](self, "writeUInt64:", *(_QWORD *)&a3);
}

- (void)writeFloat32:(float)a3
{
  -[_DPBigEndianDataEncoder writeUInt32:](self, "writeUInt32:", LODWORD(a3));
}

- (void)writeUChar:(unsigned __int8)a3
{
  void *v3;
  unsigned __int8 v4;

  v4 = a3;
  -[_DPBigEndianDataEncoder buffer](self, "buffer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "appendBytes:length:", &v4, 1);

}

- (void)appendData:(id)a3
{
  id v4;
  id v5;

  if (a3)
  {
    v4 = a3;
    -[_DPBigEndianDataEncoder buffer](self, "buffer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "appendData:", v4);

  }
}

- (NSMutableData)buffer
{
  return self->_buffer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end

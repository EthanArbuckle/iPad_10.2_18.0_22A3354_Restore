@implementation BLDAAPBuffer

- (BLDAAPBuffer)init
{
  BLDAAPBuffer *v2;
  NSData *v3;
  NSData *data;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)BLDAAPBuffer;
  v2 = -[BLDAAPBuffer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSData *)objc_alloc_init(MEMORY[0x24BDBCEC8]);
    data = v2->_data;
    v2->_data = v3;

  }
  return v2;
}

- (int64_t)appendUInt8:(unsigned __int8)a3 withCode:(unsigned int)a4
{
  uint64_t v4;
  NSData *v6;
  int64_t v7;
  unsigned __int8 v9;

  v4 = *(_QWORD *)&a4;
  v9 = a3;
  v6 = self->_data;
  -[BLDAAPBuffer appendHeader:size:](self, "appendHeader:size:", v4, 1);
  v7 = -[NSData length](v6, "length");
  -[NSData appendBytes:length:](v6, "appendBytes:length:", &v9, 1);

  return v7;
}

- (int64_t)appendUInt32:(unsigned int)a3 withCode:(unsigned int)a4
{
  uint64_t v4;
  NSData *data;
  NSData *v7;
  int64_t v8;
  unsigned int v10;

  v4 = *(_QWORD *)&a4;
  data = self->_data;
  v10 = bswap32(a3);
  v7 = data;
  -[BLDAAPBuffer appendHeader:size:](self, "appendHeader:size:", v4, 4);
  v8 = -[NSData length](v7, "length");
  -[NSData appendBytes:length:](v7, "appendBytes:length:", &v10, 4);

  return v8;
}

- (int64_t)appendUInt64:(unint64_t)a3 withCode:(unsigned int)a4
{
  uint64_t v4;
  NSData *data;
  NSData *v7;
  int64_t v8;
  unint64_t v10;

  v4 = *(_QWORD *)&a4;
  data = self->_data;
  v10 = bswap64(a3);
  v7 = data;
  -[BLDAAPBuffer appendHeader:size:](self, "appendHeader:size:", v4, 8);
  v8 = -[NSData length](v7, "length");
  -[NSData appendBytes:length:](v7, "appendBytes:length:", &v10, 8);

  return v8;
}

- (int64_t)appendHeader:(unsigned int)a3 size:(unsigned int)a4
{
  NSData *v6;
  uint64_t v7;
  _DWORD v9[2];
  uint64_t v10;

  v10 = *MEMORY[0x24BDAC8D0];
  v6 = self->_data;
  v7 = -[NSData length](v6, "length");
  v9[0] = bswap32(a3);
  v9[1] = bswap32(a4);
  -[NSData appendBytes:length:](v6, "appendBytes:length:", v9, 8);

  return v7 + 4;
}

- (NSData)data
{
  return (NSData *)(id)-[NSData copy](self->_data, "copy");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

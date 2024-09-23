@implementation GEONetworkDataReader

- (GEONetworkDataReader)initWithData:(id)a3
{
  id v4;
  GEONetworkDataReader *v5;
  uint64_t v6;
  NSMutableData *data;
  id v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)GEONetworkDataReader;
  v5 = -[GEONetworkDataReader init](&v10, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "mutableCopy");
    data = v5->_data;
    v5->_data = (NSMutableData *)v6;

    v8 = objc_retainAutorelease(v4);
    v5->_bytes = (const void *)objc_msgSend(v8, "bytes");
    v5->_dataLength = objc_msgSend(v8, "length");
  }

  return v5;
}

- (void)dealloc
{
  NSMutableData *data;
  objc_super v4;

  data = self->_data;
  self->_data = 0;

  self->_bookmarkOffset = -1;
  self->_offset = -1;
  self->_dataLength = 0;
  self->_bytes = 0;
  v4.receiver = self;
  v4.super_class = (Class)GEONetworkDataReader;
  -[GEONetworkDataReader dealloc](&v4, sel_dealloc);
}

- (id)allData
{
  return self->_data;
}

- (void)appendNetworkData:(id)a3
{
  NSMutableData *data;
  id v5;
  uint64_t v6;
  NSMutableData *v7;

  data = self->_data;
  v5 = a3;
  -[NSMutableData appendData:](data, "appendData:", v5);
  v6 = objc_msgSend(v5, "length");

  v7 = self->_data;
  self->_dataLength += v6;
  self->_bytes = (const void *)-[NSMutableData bytes](v7, "bytes");
}

- (id)readString
{
  void *v3;
  id v5;
  unsigned __int16 v6;

  v6 = 0;
  if (-[GEONetworkDataReader readUnsignedShort:](self, "readUnsignedShort:", &v6)
    && v6
    && self->_offset + v6 <= self->_dataLength)
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3940]);
    v3 = (void *)objc_msgSend(v5, "initWithBytes:length:encoding:", (char *)self->_bytes + self->_offset, v6, 1);
    self->_offset += v6;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)readUnsignedShort:(unsigned __int16 *)a3
{
  unint64_t offset;
  unsigned int v5;

  if (!a3)
    return 0;
  offset = self->_offset;
  if (offset + 2 > self->_dataLength)
    return 0;
  v5 = *(unsigned __int16 *)((char *)self->_bytes + offset);
  *a3 = v5;
  self->_offset += 2;
  *a3 = bswap32(v5) >> 16;
  return 1;
}

- (BOOL)readUnsignedInt:(unsigned int *)a3
{
  unint64_t offset;
  unsigned int v5;

  if (!a3)
    return 0;
  offset = self->_offset;
  if (offset + 4 > self->_dataLength)
    return 0;
  v5 = *(_DWORD *)((char *)self->_bytes + offset);
  *a3 = v5;
  self->_offset += 4;
  *a3 = bswap32(v5);
  return 1;
}

- (id)readData:(unsigned int)a3
{
  void *v3;
  uint64_t v5;

  if (self->_offset + a3 <= self->_dataLength)
  {
    v5 = a3;
    -[NSMutableData subdataWithRange:](self->_data, "subdataWithRange:");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    self->_offset += v5;
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)markOffset
{
  self->_bookmarkOffset = self->_offset;
}

- (void)seekToMarkedOffset
{
  self->_offset = self->_bookmarkOffset;
}

- (BOOL)hasUnreadData
{
  return self->_offset < self->_dataLength;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

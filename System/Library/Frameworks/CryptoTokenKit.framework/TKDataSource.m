@implementation TKDataSource

- (BOOL)bytesSafeToRead:(int64_t)a3
{
  const char *v3;

  v3 = &self->_ptr[a3];
  return v3 <= -[TKDataSource end](self, "end");
}

- (const)end
{
  char *v3;

  v3 = -[NSData bytes](self->_data, "bytes");
  return &v3[-[NSData length](self->_data, "length")];
}

- (id)fetchDataWithLength:(int64_t)a3
{
  void *v5;

  if (-[TKDataSource bytesSafeToRead:](self, "bytesSafeToRead:"))
  {
    objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", self->_ptr, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    self->_ptr += a3;
  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (TKDataSource)initWithData:(id)a3
{
  id v5;
  TKDataSource *v6;
  TKDataSource *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)TKDataSource;
  v6 = -[TKDataSource init](&v9, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_data, a3);
    v7->_ptr = (const char *)objc_msgSend(objc_retainAutorelease(v5), "bytes");
  }

  return v7;
}

- (id)dataFromPtr:(const char *)a3
{
  if (-[NSData bytes](self->_data, "bytes") > a3 || self->_ptr < a3)
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("Invalid argument ptr"));
  return -[NSData subdataWithRange:](self->_data, "subdataWithRange:", &a3[-(uint64_t)-[NSData bytes](self->_data, "bytes")], self->_ptr - a3);
}

- (const)ptr
{
  return self->_ptr;
}

- (unsigned)fetchByte
{
  const char *ptr;

  ptr = self->_ptr;
  self->_ptr = ptr + 1;
  return *ptr;
}

- (NSData)data
{
  return (NSData *)objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytes:length:", -[NSData bytes](self->_data, "bytes"), &self->_ptr[-(uint64_t)-[NSData bytes](self->_data, "bytes")]);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_data, 0);
}

@end

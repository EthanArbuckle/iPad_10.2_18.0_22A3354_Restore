@implementation _NUImageBufferRenderResult

- (NSString)debugDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[_NUImageRenderResult region](self, "region");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageBufferRenderResult buffer](self, "buffer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_NUImageRenderResult geometry](self, "geometry");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p> region=%@, buffer=%@, geometry=%@"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (NUStorageImageBuffer)buffer
{
  return (NUStorageImageBuffer *)objc_getProperty(self, a2, 32, 1);
}

- (void)setBuffer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buffer, 0);
}

@end

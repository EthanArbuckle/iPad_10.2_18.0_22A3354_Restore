@implementation NSFilePromiseWriteToken

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)NSFilePromiseWriteToken;
  -[NSFilePromiseWriteToken dealloc](&v3, sel_dealloc);
}

- (NSURL)promiseURL
{
  return (NSURL *)objc_getProperty(self, a2, 8, 1);
}

- (void)setPromiseURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 8);
}

- (NSURL)logicalURL
{
  return (NSURL *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLogicalURL:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 16);
}

@end

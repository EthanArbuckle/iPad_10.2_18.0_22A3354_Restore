@implementation SSUCacheDirectoryProviderSandbox

- (SSUCacheDirectoryProviderSandbox)initWithDirectory:(id)a3
{
  NSURL *v4;
  SSUCacheDirectoryProviderSandbox *v5;
  NSURL *directory;
  objc_super v8;

  v4 = (NSURL *)a3;
  v8.receiver = self;
  v8.super_class = (Class)SSUCacheDirectoryProviderSandbox;
  v5 = -[SSUCacheDirectoryProviderSandbox init](&v8, sel_init);
  directory = v5->_directory;
  v5->_directory = v4;

  return v5;
}

- (id)lookupOrCreateCacheDirectory:(id *)a3
{
  return self->_directory;
}

- (NSURL)directory
{
  return self->_directory;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_directory, 0);
}

@end

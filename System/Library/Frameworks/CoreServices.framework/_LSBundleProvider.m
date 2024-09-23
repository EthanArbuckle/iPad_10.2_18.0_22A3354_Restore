@implementation _LSBundleProvider

- (void)provider
{
  return self->_provider;
}

- (id)bundleURL
{
  return *(id *)-[_LSBundleProvider provider](self, "provider");
}

- (id)bundlePath
{
  return (id)(id)CFURLCopyFileSystemPath(*(CFURLRef *)-[_LSBundleProvider provider](self, "provider"), kCFURLPOSIXPathStyle);
}

- (id)bundleIdentifier
{
  return LSBundleProvider::bundleIdentifier((LSBundleProvider *)-[_LSBundleProvider provider](self, "provider"));
}

- (id)infoDictionary
{
  return LSBundleProvider::infoDictionary((LSBundleProvider *)-[_LSBundleProvider provider](self, "provider"));
}

- (BOOL)usingCachedItem
{
  -[_LSBundleProvider provider](self, "provider");
  return 0;
}

- (_LSBundleProvider)initWithCFBundle:(__CFBundle *)a3
{
  _LSBundleProvider *v4;
  LSBundleProvider *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)_LSBundleProvider;
  v4 = -[_LSBundleProvider init](&v7, sel_init);
  if (v4)
  {
    v5 = (LSBundleProvider *)operator new();
    LSBundleProvider::LSBundleProvider(v5, a3);
    v4->_provider = v5;
  }
  return v4;
}

- (_LSBundleProvider)initWithURL:(id)a3 useCacheIfPossible:(BOOL)a4
{
  id v5;
  _LSBundleProvider *v6;
  LSBundleProvider *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_LSBundleProvider;
  v6 = -[_LSBundleProvider init](&v9, sel_init);
  if (v6)
  {
    v7 = (LSBundleProvider *)operator new();
    LSBundleProvider::LSBundleProvider(v7, v5);
    v6->_provider = v7;
  }

  return v6;
}

- (__CFBundle)cfBundleRef
{
  return -[_LSBundleProvider cfBundleRef:reason:](self, "cfBundleRef:reason:", 1, CFSTR("cfBundleRef property"));
}

- (__CFBundle)cfBundleRef:(BOOL)a3 reason:(id)a4
{
  id v5;
  _QWORD *v6;
  __CFBundle *v7;

  v5 = a4;
  v6 = -[_LSBundleProvider provider](self, "provider");
  if (v5)
    objc_msgSend(objc_retainAutorelease(v5), "cStringUsingEncoding:", 4);
  v7 = (__CFBundle *)v6[1];

  return v7;
}

- (id)bundle
{
  return -[_LSBundleProvider bundle:reason:](self, "bundle:reason:", 1, 0);
}

- (id)bundle:(BOOL)a3 reason:(id)a4
{
  -[_LSBundleProvider cfBundleRef:reason:](self, "cfBundleRef:reason:", 1, a4);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (void)dealloc
{
  LSBundleProvider *provider;
  objc_super v4;

  provider = (LSBundleProvider *)self->_provider;
  if (provider)
  {
    LSBundleProvider::~LSBundleProvider(provider);
    MEMORY[0x186DADEF4]();
  }
  v4.receiver = self;
  v4.super_class = (Class)_LSBundleProvider;
  -[_LSBundleProvider dealloc](&v4, sel_dealloc);
}

@end

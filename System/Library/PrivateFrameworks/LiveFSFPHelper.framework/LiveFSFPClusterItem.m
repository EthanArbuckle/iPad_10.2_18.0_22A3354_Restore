@implementation LiveFSFPClusterItem

- (LiveFSFPClusterItem)initWithName:(id)a3 extension:(id)a4
{
  id v7;
  id v8;
  LiveFSFPClusterItem *v9;
  LiveFSFPClusterItem *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  NSString *fp_domainIdentifier;
  objc_super v16;

  v7 = a3;
  v8 = a4;
  v16.receiver = self;
  v16.super_class = (Class)LiveFSFPClusterItem;
  v9 = -[LiveFSFPClusterItem init](&v16, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_extension, a4);
    objc_storeStrong((id *)&v10->_filename, a3);
    -[NSFileProviderExtension domain](v10->_extension, "domain");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "identifier");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringByAppendingString:", v7);
    v13 = objc_claimAutoreleasedReturnValue();
    fp_domainIdentifier = v10->_fp_domainIdentifier;
    v10->_fp_domainIdentifier = (NSString *)v13;

  }
  return v10;
}

+ (id)newWithName:(id)a3 extension:(id)a4
{
  id v6;
  id v7;
  void *v8;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:extension:", v7, v6);

  return v8;
}

- (UTType)contentType
{
  return (UTType *)(id)*MEMORY[0x24BDF83C0];
}

- (NSString)itemIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BDC8228];
}

- (NSString)parentItemIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BDC8228];
}

- (NSString)fp_parentDomainIdentifier
{
  void *v2;
  void *v3;

  -[NSFileProviderExtension domain](self->_extension, "domain");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (LiveFSFPExtensionHelper)extension
{
  return (LiveFSFPExtensionHelper *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)fp_domainIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSString)filename
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_filename, 0);
  objc_storeStrong((id *)&self->_fp_domainIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
}

@end

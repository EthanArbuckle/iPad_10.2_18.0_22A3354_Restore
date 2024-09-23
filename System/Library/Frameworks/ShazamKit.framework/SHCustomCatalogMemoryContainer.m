@implementation SHCustomCatalogMemoryContainer

- (SHCustomCatalogMemoryContainer)init
{
  SHCustomCatalogMemoryContainer *v2;
  SHCustomCatalogMemoryStorage *v3;
  SHCustomCatalogStorage *container;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SHCustomCatalogMemoryContainer;
  v2 = -[SHCustomCatalogMemoryContainer init](&v6, sel_init);
  if (v2)
  {
    v3 = objc_alloc_init(SHCustomCatalogMemoryStorage);
    container = v2->_container;
    v2->_container = (SHCustomCatalogStorage *)v3;

  }
  return v2;
}

- (void)addSignature:(id)a3 representingMediaItems:(id)a4
{
  id v6;
  id v7;
  id v8;

  v6 = a4;
  v7 = a3;
  -[SHCustomCatalogMemoryContainer container](self, "container");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addSignature:representingMediaItems:", v7, v6);

}

- (BOOL)loadFromData:(id)a3 error:(id *)a4
{
  annotateUnsupportedError((uint64_t)a4);
  return 0;
}

- (BOOL)loadFromURL:(id)a3 error:(id *)a4
{
  annotateUnsupportedError((uint64_t)a4);
  return 0;
}

- (id)mediaItemsForReferenceSignature:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[SHCustomCatalogMemoryContainer container](self, "container");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "mediaItemsForReferenceSignature:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)referenceSignatureForTrackID:(unint64_t)a3
{
  void *v4;
  void *v5;

  -[SHCustomCatalogMemoryContainer container](self, "container");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "referenceSignatureForTrackID:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)writeToURL:(id)a3 error:(id *)a4
{
  annotateUnsupportedError((uint64_t)a4);
  return 0;
}

- (NSArray)referenceSignatures
{
  void *v2;
  void *v3;

  -[SHCustomCatalogMemoryContainer container](self, "container");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "referenceSignatures");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (NSData)dataRepresentation
{
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("In memory Custom Catalog containers cannot be written to disk"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v4, 0);
  v5 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v5);
}

- (SHCustomCatalogStorage)container
{
  return self->_container;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_container, 0);
}

@end

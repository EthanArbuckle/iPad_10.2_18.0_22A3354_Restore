@implementation MPStoreModelObjectBuilder

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestedPropertySet, 0);
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 userIdentity:(id)a4
{
  return -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", a3, 0, a4);
}

- (BOOL)preventStoreItemMetadataCaching
{
  return self->_preventStoreItemMetadataCaching;
}

- (MPStoreModelObjectBuilder)initWithRequestedPropertySet:(id)a3
{
  id v4;
  MPStoreModelObjectBuilder *v5;
  uint64_t v6;
  MPPropertySet *requestedPropertySet;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MPStoreModelObjectBuilder;
  v5 = -[MPStoreModelObjectBuilder init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    requestedPropertySet = v5->_requestedPropertySet;
    v5->_requestedPropertySet = (MPPropertySet *)v6;

  }
  return v5;
}

- (void)setPreventStoreItemMetadataCaching:(BOOL)a3
{
  self->_preventStoreItemMetadataCaching = a3;
}

- (MPPropertySet)requestedPropertySet
{
  return self->_requestedPropertySet;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DDC100];
  v5 = a3;
  objc_msgSend(v4, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](self, "modelObjectWithStoreItemMetadata:userIdentity:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;

  v6 = (void *)MEMORY[0x1E0DDC100];
  v7 = a4;
  v8 = a3;
  objc_msgSend(v6, "activeAccount");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:](self, "modelObjectWithStoreItemMetadata:sourceModelObject:userIdentity:", v8, v7, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (id)modelObjectWithStorePlatformDictionary:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0DDC100];
  v5 = a3;
  objc_msgSend(v4, "activeAccount");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MPStoreModelObjectBuilder modelObjectWithStorePlatformDictionary:userIdentity:](self, "modelObjectWithStorePlatformDictionary:userIdentity:", v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)modelObjectWithStoreItemMetadata:(id)a3 sourceModelObject:(id)a4 userIdentity:(id)a5
{
  return 0;
}

- (id)modelObjectWithStorePlatformDictionary:(id)a3 userIdentity:(id)a4
{
  id v6;
  id v7;
  MPStoreItemMetadata *v8;
  void *v9;

  v6 = a4;
  if (a3)
  {
    v7 = a3;
    v8 = -[MPStoreItemMetadata initWithStorePlatformDictionary:]([MPStoreItemMetadata alloc], "initWithStorePlatformDictionary:", v7);

    if (v8)
    {
      -[MPStoreModelObjectBuilder modelObjectWithStoreItemMetadata:userIdentity:](self, "modelObjectWithStoreItemMetadata:userIdentity:", v8, v6);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

+ (id)allSupportedProperties
{
  return +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
}

@end

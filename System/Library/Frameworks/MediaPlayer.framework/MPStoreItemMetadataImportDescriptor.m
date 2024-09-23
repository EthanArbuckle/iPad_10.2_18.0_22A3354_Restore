@implementation MPStoreItemMetadataImportDescriptor

- (MPStoreItemMetadataImportDescriptor)initWithPayload:(id)a3 userIdentity:(id)a4
{
  id v7;
  id v8;
  MPStoreItemMetadataImportDescriptor *v9;
  MPStoreItemMetadataImportDescriptor *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPStoreItemMetadataImportDescriptor;
  v9 = -[MPStoreItemMetadataImportDescriptor init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_userIdentity, a4);
    objc_storeStrong((id *)&v10->_platformDictionary, a3);
  }

  return v10;
}

- (NSDictionary)platformDictionary
{
  return self->_platformDictionary;
}

- (ICUserIdentity)userIdentity
{
  return self->_userIdentity;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_userIdentity, 0);
  objc_storeStrong((id *)&self->_platformDictionary, 0);
}

@end

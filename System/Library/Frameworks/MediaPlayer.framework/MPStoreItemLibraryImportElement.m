@implementation MPStoreItemLibraryImportElement

- (MPStoreItemLibraryImportElement)initWithStoreItemID:(int64_t)a3 additionalTrackMetadata:(id)a4
{
  id v6;
  MPStoreItemLibraryImportElement *v7;
  MPStoreItemLibraryImportElement *v8;
  uint64_t v9;
  NSDictionary *additionalTrackMetadata;
  objc_super v12;

  v6 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MPStoreItemLibraryImportElement;
  v7 = -[MPStoreItemLibraryImportElement init](&v12, sel_init);
  v8 = v7;
  if (v7)
  {
    v7->_storeItemID = a3;
    v9 = objc_msgSend(v6, "copy");
    additionalTrackMetadata = v8->_additionalTrackMetadata;
    v8->_additionalTrackMetadata = (NSDictionary *)v9;

  }
  return v8;
}

- (id)storeItem
{
  return 0;
}

- (int64_t)storeItemID
{
  return self->_storeItemID;
}

- (NSDictionary)additionalTrackMetadata
{
  return self->_additionalTrackMetadata;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_additionalTrackMetadata, 0);
}

@end

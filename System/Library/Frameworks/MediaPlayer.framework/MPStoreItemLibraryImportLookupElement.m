@implementation MPStoreItemLibraryImportLookupElement

- (MPStoreItemLibraryImportLookupElement)initWithLookupDictionary:(id)a3 additionalTrackMetadata:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  MPStoreItemLibraryImportLookupElement *v10;
  uint64_t v11;
  NSDictionary *lookupDictionary;
  uint64_t v13;
  ICStorePlatformMetadata *storeItem;
  objc_super v16;

  v6 = a3;
  v7 = a4;
  objc_msgSend(v6, "valueForKey:", CFSTR("id"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "longLongValue");

  v16.receiver = self;
  v16.super_class = (Class)MPStoreItemLibraryImportLookupElement;
  v10 = -[MPStoreItemLibraryImportElement initWithStoreItemID:additionalTrackMetadata:](&v16, sel_initWithStoreItemID_additionalTrackMetadata_, v9, v7);

  if (v10)
  {
    v11 = objc_msgSend(v6, "copy");
    lookupDictionary = v10->_lookupDictionary;
    v10->_lookupDictionary = (NSDictionary *)v11;

    v13 = objc_msgSend(objc_alloc(MEMORY[0x1E0DDC090]), "initWithMetadataDictionary:", v6);
    storeItem = v10->_storeItem;
    v10->_storeItem = (ICStorePlatformMetadata *)v13;

  }
  return v10;
}

- (id)storeItem
{
  return self->_storeItem;
}

- (NSDictionary)lookupDictionary
{
  return self->_lookupDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lookupDictionary, 0);
  objc_storeStrong((id *)&self->_storeItem, 0);
}

@end

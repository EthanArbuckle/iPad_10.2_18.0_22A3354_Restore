@implementation PHBatchFetchedAssetPropertySet

- (PHBatchFetchedAssetPropertySet)initWithObjectID:(id)a3 knownKeysDictionary:(id)a4 photoLibrary:(id)a5
{
  id v8;
  id v9;
  PHBatchFetchedAssetPropertySet *v10;
  PHBatchFetchedAssetPropertySet *v11;
  objc_super v13;

  v8 = a3;
  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)PHBatchFetchedAssetPropertySet;
  v10 = -[PHBatchFetchedAssetPropertySet init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_objectID, a3);
    objc_storeStrong((id *)&v11->_knownKeysDictionary, a4);
  }

  return v11;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[PHBatchFetchedAssetPropertySet objectID](self, "objectID");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (NSManagedObjectID)objectID
{
  return self->_objectID;
}

- (NSKnownKeysDictionary)knownKeysDictionary
{
  return self->_knownKeysDictionary;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knownKeysDictionary, 0);
  objc_storeStrong((id *)&self->_objectID, 0);
}

+ (NSString)entityName
{
  return (NSString *)objc_msgSend(MEMORY[0x1E0D71880], "entityName");
}

+ (NSArray)propertiesToFetch
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (NSString)fetchType
{
  return (NSString *)+[PHAsset fetchType](PHAsset, "fetchType");
}

+ (int64_t)batchSize
{
  return 2000;
}

+ (int64_t)cacheSize
{
  return 100000;
}

+ (BOOL)useNoIndexSelf
{
  id v2;
  id v3;

  v2 = a1;
  PLAbstractMethodException();
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_exception_throw(v3);
}

+ (BOOL)useObjectFetchingContext
{
  return 1;
}

+ (NSArray)propertiesToSortBy
{
  return 0;
}

@end

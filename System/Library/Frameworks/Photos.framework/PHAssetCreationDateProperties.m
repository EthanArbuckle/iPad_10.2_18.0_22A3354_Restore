@implementation PHAssetCreationDateProperties

+ (id)propertiesToFetch
{
  pl_dispatch_once();
  return (id)propertiesToFetch_pl_once_object_68;
}

void __50__PHAssetCreationDateProperties_propertiesToFetch__block_invoke()
{
  void *v0;
  uint64_t v1;
  void *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("dateCreated");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "copy");
  v2 = (void *)propertiesToFetch_pl_once_object_68;
  propertiesToFetch_pl_once_object_68 = v1;

}

+ (int64_t)batchSize
{
  return 5000;
}

+ (int64_t)cacheSize
{
  return 20000;
}

+ (BOOL)useNoIndexSelf
{
  return 1;
}

+ (BOOL)useObjectFetchingContext
{
  return 0;
}

- (NSDate)creationDate
{
  void *v2;
  void *v3;

  -[PHBatchFetchedAssetPropertySet knownKeysDictionary](self, "knownKeysDictionary");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueAtIndex:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSDate *)v3;
}

@end

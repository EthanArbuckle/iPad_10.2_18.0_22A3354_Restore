@implementation NSOrderedCollectionDifference(AppleMediaServices)

- (id)ams_insertedObjects
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "insertions");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_mapWithTransform:", &__block_literal_global_148);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)ams_removedObjects
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "removals");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "ams_mapWithTransform:", &__block_literal_global_1_0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

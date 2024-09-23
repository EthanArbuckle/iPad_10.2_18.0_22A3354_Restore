@implementation HDNotificationCategorySampleSyncEntity

+ (int)nanoSyncObjectType
{
  return 49;
}

+ (id)syncEntityIdentifier
{
  return +[HDSyncEntityIdentifier identifierWithSchema:entity:](HDSyncEntityIdentifier, "identifierWithSchema:entity:", 0, 55);
}

+ (id)_predicateForCategoryTypesToSync
{
  void *v2;
  void *v3;

  +[HDCategorySampleSyncEntity _categoryTypesDerivedFromQuantitySamples]();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  HDSampleEntityPredicateForDataTypes(v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

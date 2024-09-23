@implementation NSObject(MPStoreLibraryPersonalizingAdditions)

- (uint64_t)relativeModelObjectForStoreLibraryPersonalization
{
  return 0;
}

+ (id)requiredStoreLibraryPersonalizationProperties
{
  return +[MPPropertySet emptyPropertySet](MPPropertySet, "emptyPropertySet");
}

- (id)personalizationScopedPropertiesForProperties:()MPStoreLibraryPersonalizingAdditions
{
  return a3;
}

- (uint64_t)objectWithStoreLibraryPersonalizationRelativeModelObject:()MPStoreLibraryPersonalizingAdditions
{
  return 0;
}

@end

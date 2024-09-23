@implementation GDSystemPreferencesImpl

+ (BOOL)personalizationDataCollectionAllowed
{
  return static SystemPreferencesImpl.personalizationDataCollectionAllowed()() & 1;
}

+ (void)updatePersonalizationDataCollectionAllowed:(BOOL)a3
{
  static SystemPreferencesImpl.updatePersonalizationDataCollectionAllowed(_:)();
}

- (GDSystemPreferencesImpl)init
{
  return (GDSystemPreferencesImpl *)SystemPreferencesImpl.init()();
}

@end

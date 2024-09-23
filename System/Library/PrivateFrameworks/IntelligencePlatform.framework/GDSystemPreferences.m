@implementation GDSystemPreferences

+ (void)updateSystemPersonalizationDataCollectionAllowed:(BOOL)a3
{
  MEMORY[0x1E0DE7D20](GDSystemPreferencesImpl, sel_updatePersonalizationDataCollectionAllowed_, a3);
}

+ (BOOL)systemPersonalizationDataCollectionAllowed
{
  return ((uint64_t (*)(__objc2_class *, char *))MEMORY[0x1E0DE7D20])(GDSystemPreferencesImpl, sel_personalizationDataCollectionAllowed);
}

@end

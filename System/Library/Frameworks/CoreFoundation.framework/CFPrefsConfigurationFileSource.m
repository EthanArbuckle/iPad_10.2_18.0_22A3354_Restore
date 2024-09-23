@implementation CFPrefsConfigurationFileSource

- (CFPrefsConfigurationFileSource)initWithConfigurationPropertyList:(__CFDictionary *)a3 containingPreferences:(id)a4
{
  CFPrefsConfigurationFileSource *v5;
  objc_super v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v7.receiver = self;
  v7.super_class = (Class)CFPrefsConfigurationFileSource;
  v5 = -[CFPrefsSource initWithContainingPreferences:](&v7, sel_initWithContainingPreferences_, a4);
  if (v5)
    CFDictionaryApplyFunction(a3, (CFDictionaryApplierFunction)mergeFunc, v5);
  return v5;
}

@end

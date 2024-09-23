@implementation CCUIControlCenterDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1)
    dispatch_once(&standardDefaults___once, &__block_literal_global_9);
  return (id)standardDefaults___instance;
}

void __45__CCUIControlCenterDefaults_standardDefaults__block_invoke()
{
  CCUIControlCenterDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(CCUIControlCenterDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;

}

- (CCUIControlCenterDefaults)init
{
  return (CCUIControlCenterDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.springboard"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldAlwaysBeEnabled");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C9AAA0];
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBControlCenterShouldAlwaysBeEnabled"), MEMORY[0x1E0C9AAA0], 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "shouldExcludeControlCenterFromStatusBarOverrides");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("SBExcludeControlCenterFromStatusBarOverrides"), v4, 4);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hasForceTouchedToExpandModule");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("CCUIHasForceTouchedToExpandControlCenterModule"), v4, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "hasLongPressedToExpandModule");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("CCUIHasLongPressedToExpandControlCenterModule"), v4, 1);

}

@end

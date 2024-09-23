@implementation BKSLockdownDefaults

- (BKSLockdownDefaults)init
{
  return (BKSLockdownDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.mobile.demo"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "tetheredDisplayPortMode");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("EnableTetheredDisplayPortMode"), MEMORY[0x1E0C9AAA0], 1);

}

@end

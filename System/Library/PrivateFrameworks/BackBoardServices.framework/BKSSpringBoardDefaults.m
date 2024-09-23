@implementation BKSSpringBoardDefaults

- (BKSSpringBoardDefaults)init
{
  return (BKSSpringBoardDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.springboard"));
}

- (void)_bindAndRegisterDefaults
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "brightness");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("SBBacklightLevel2"), &unk_1E1EBC618, 1);

}

@end

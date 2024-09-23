@implementation CCSControlCenterDefaults

+ (id)standardDefaults
{
  if (standardDefaults___once != -1)
    dispatch_once(&standardDefaults___once, &__block_literal_global_0);
  return (id)standardDefaults___instance;
}

void __44__CCSControlCenterDefaults_standardDefaults__block_invoke()
{
  CCSControlCenterDefaults *v0;
  void *v1;

  v0 = objc_alloc_init(CCSControlCenterDefaults);
  v1 = (void *)standardDefaults___instance;
  standardDefaults___instance = (uint64_t)v0;

}

- (CCSControlCenterDefaults)init
{
  return (CCSControlCenterDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.springboard"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "presentationGesture");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[CCSControlCenterDefaults _defaultPresentationGesture](self, "_defaultPresentationGesture"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("CCSPresentationGesture"), v4, 4);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "userInvocationCount");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v5, CFSTR("CCUIUserInvocationCount"), &unk_24D4646F8, 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "shouldEnablePrototypeFeatures");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v6, CFSTR("SBEnableControlCenterPrototypeFeatures"), MEMORY[0x24BDBD1C0], 1);

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithUTF8String:", "shouldEnableInternalModules");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v7, CFSTR("CCUIEnableInternalControlCenterModules"), MEMORY[0x24BDBD1C8], 1);

}

- (unint64_t)_defaultPresentationGesture
{
  void *v2;
  unint64_t v3;

  objc_msgSend(MEMORY[0x24BE0BE68], "sharedInstance");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "homeButtonType") == 2 || objc_msgSend(v2, "deviceClass") == 2;

  return v3;
}

@end

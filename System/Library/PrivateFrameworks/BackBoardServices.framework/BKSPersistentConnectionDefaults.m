@implementation BKSPersistentConnectionDefaults

- (BKSPersistentConnectionDefaults)init
{
  return (BKSPersistentConnectionDefaults *)-[BSAbstractDefaultDomain _initWithDomain:](self, "_initWithDomain:", CFSTR("com.apple.persistentconnection"));
}

- (void)_bindAndRegisterDefaults
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "forceDemoMaxHBI");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v3, CFSTR("PCForceDemoMaxHBI"), &unk_1E1EBC4A0, 1);

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "wifiInterfaceName");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[BSAbstractDefaultDomain _bindProperty:withDefaultKey:toDefaultValue:options:](self, "_bindProperty:withDefaultKey:toDefaultValue:options:", v4, CFSTR("PCWiFiInterface"), 0, 1);

}

@end

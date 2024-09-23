@implementation CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CDPRemoteDeviceSecretValidator");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CDPRemoteDeviceSecretValidator"), CFSTR("supportedEscapeOfferMask"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CDPRemoteDeviceSecretValidator"), CFSTR("initWithContext:validator:"), "@", "@", 0);

}

- (CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup)initWithContext:(id)a3 validator:(id)a4
{
  CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *v4;
  NSObject *v5;
  CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *v6;
  CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *v7;
  CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *v8;
  _QWORD v10[4];
  CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *v11;
  CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup;
  v4 = -[CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup initWithContext:validator:](&v13, sel_initWithContext_validator_, a3, a4);
  dispatch_get_global_queue(0, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __91__CDPRemoteDeviceSecretValidatorAccessibility__CoreCDPUI__Setup_initWithContext_validator___block_invoke;
  v10[3] = &unk_250344028;
  v11 = v4;
  v6 = v11;
  v12 = v6;
  dispatch_async(v5, v10);

  v7 = v12;
  v8 = v6;

  return v8;
}

@end

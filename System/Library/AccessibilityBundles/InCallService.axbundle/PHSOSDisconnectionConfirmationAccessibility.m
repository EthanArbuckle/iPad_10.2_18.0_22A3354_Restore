@implementation PHSOSDisconnectionConfirmationAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PHSOSDisconnectionConfirmation");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHSOSDisconnectionConfirmation"), CFSTR("showSOSDisconnectConfirmation:"), "v", "@?", 0);
}

- (void)showSOSDisconnectConfirmation:(id)a3
{
  void (**v4)(id, uint64_t);
  objc_super v5;

  v4 = (void (**)(id, uint64_t))a3;
  if (UIAccessibilityIsVoiceOverRunning())
  {
    v4[2](v4, 1);
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)PHSOSDisconnectionConfirmationAccessibility;
    -[PHSOSDisconnectionConfirmationAccessibility showSOSDisconnectConfirmation:](&v5, sel_showSOSDisconnectConfirmation_, v4);
  }

}

@end

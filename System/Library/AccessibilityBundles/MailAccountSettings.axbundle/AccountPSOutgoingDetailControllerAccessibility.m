@implementation AccountPSOutgoingDetailControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AccountPSOutgoingDetailController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("AccountPSOutgoingDetailController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AccountPSOutgoingDetailController"), CFSTR("processValidationResult:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("navigationItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UINavigationItem"), CFSTR("prompt"), "@", 0);

}

- (void)processValidationResult:(int64_t)a3
{
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)AccountPSOutgoingDetailControllerAccessibility;
  -[AccountPSOutgoingDetailControllerAccessibility processValidationResult:](&v7, sel_processValidationResult_);
  if (!a3)
  {
    -[AccountPSOutgoingDetailControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("prompt"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v6);

  }
}

@end

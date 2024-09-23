@implementation EKEventAttachmentsEditItemAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("EKEventAttachmentsEditItem");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("EKEventAttachmentsEditItem"), CFSTR("cellForSubitemAtIndex:"), "@", "Q", 0);
}

- (id)cellForSubitemAtIndex:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)EKEventAttachmentsEditItemAccessibility;
  -[EKEventAttachmentsEditItemAccessibility cellForSubitemAtIndex:](&v6, sel_cellForSubitemAtIndex_, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v4);
  return v3;
}

@end

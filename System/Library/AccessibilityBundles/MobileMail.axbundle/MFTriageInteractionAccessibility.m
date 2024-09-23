@implementation MFTriageInteractionAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MFTriageInteraction");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFTriageInteraction"), CFSTR("swipeActionWithPreparation:completion:"), "@", "@?", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MFTriageInteraction"), CFSTR("title"), "@", 0);

}

- (id)swipeActionWithPreparation:(id)a3 completion:(id)a4
{
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MFTriageInteractionAccessibility;
  -[MFTriageInteractionAccessibility swipeActionWithPreparation:completion:](&v8, sel_swipeActionWithPreparation_completion_, a3, a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFTriageInteractionAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("title"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v6);

  return v5;
}

@end

@implementation QLImageAnalysisManagerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("QLImageAnalysisManager");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("QLImageAnalysisManager"), CFSTR("imageAnalysisToolbarButton"), "@", 0);
}

- (id)imageAnalysisToolbarButton
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)QLImageAnalysisManagerAccessibility;
  -[QLImageAnalysisManagerAccessibility imageAnalysisToolbarButton](&v5, sel_imageAnalysisToolbarButton);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("ql.visual.lookup.button.label"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityLabel:", v3);

  return v2;
}

@end

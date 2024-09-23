@implementation PreviewDetailsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PreviewDetailsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PreviewDetailsViewControllerAccessibility"), CFSTR("setupViewsAndConstraints"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PreviewDetailsViewController"), CFSTR("_filenameTextField"), "UITextField");

}

- (void)setupViewsAndConstraints
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)PreviewDetailsViewControllerAccessibility;
  -[PreviewDetailsViewControllerAccessibility setupViewsAndConstraints](&v2, sel_setupViewsAndConstraints);
}

@end

@implementation SLDisambiguationCollectionViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SLDisambiguationCollectionViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:isKindOfClass:", CFSTR("SLDisambiguationCollectionViewController"), CFSTR("UIViewController"));
}

- (BOOL)accessibilityPerformEscape
{
  void *v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "dismissViewControllerAnimated:completion:", 1, 0);

  return 1;
}

@end

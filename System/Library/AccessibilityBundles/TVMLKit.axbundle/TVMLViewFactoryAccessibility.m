@implementation TVMLViewFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVMLViewFactory");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVMLViewFactory"), CFSTR("_imageViewForBadgeElement:existingView:"), "@", "@", 0);
}

- (id)_imageViewForBadgeElement:(id)a3 existingView:(id)a4
{
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)TVMLViewFactoryAccessibility;
  -[TVMLViewFactoryAccessibility _imageViewForBadgeElement:existingView:](&v6, sel__imageViewForBadgeElement_existingView_, a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);
  return v4;
}

@end

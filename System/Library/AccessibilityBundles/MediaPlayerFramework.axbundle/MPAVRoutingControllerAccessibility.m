@implementation MPAVRoutingControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MPAVRoutingController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MPAVRoutingController"), CFSTR("_iconImageForRoute:"), "@", 0);
}

+ (id)_iconImageForRoute:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = a1;
  v7.super_class = (Class)&OBJC_METACLASS___MPAVRoutingControllerAccessibility;
  v3 = a3;
  objc_msgSendSuper2(&v7, sel__iconImageForRoute_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForMediaRoute(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityLabel:", v5, v7.receiver, v7.super_class);
  return v4;
}

@end

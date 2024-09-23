@implementation PXPhotosDetailsBarsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosDetailsBarsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsBarsController"), CFSTR("_barButtonItemForBarItemIdentifier:"), "@", 0);
}

- (id)_barButtonItemForBarItemIdentifier:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PXPhotosDetailsBarsControllerAccessibility;
  v3 = a3;
  -[PXPhotosDetailsBarsControllerAccessibility _barButtonItemForBarItemIdentifier:](&v8, sel__barButtonItemForBarItemIdentifier_, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v3, "isEqualToString:", CFSTR("PXBarItemIdentifierActionMenu"), v8.receiver, v8.super_class);

  if (v5)
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("action.menu"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setAccessibilityLabel:", v6);

  }
  return v4;
}

@end

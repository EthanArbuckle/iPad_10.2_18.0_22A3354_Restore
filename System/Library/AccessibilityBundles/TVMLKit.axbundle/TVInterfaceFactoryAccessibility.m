@implementation TVInterfaceFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVInterfaceFactory");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVInterfaceFactory"), CFSTR("_viewFromElement:existingView:"), "@", "@", 0);
}

- (id)_viewFromElement:(id)a3 existingView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)TVInterfaceFactoryAccessibility;
  v5 = a3;
  -[TVInterfaceFactoryAccessibility _viewFromElement:existingView:](&v12, sel__viewFromElement_existingView_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityText", v12.receiver, v12.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "accessibilityLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "length");

  if (!v9)
  {
    if (objc_msgSend(v7, "length"))
    {
      objc_msgSend(v6, "setAccessibilityLabel:", v7);
    }
    else
    {
      accessibilityLabelForTVView(v6);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setAccessibilityLabel:", v10);

    }
  }

  return v6;
}

@end

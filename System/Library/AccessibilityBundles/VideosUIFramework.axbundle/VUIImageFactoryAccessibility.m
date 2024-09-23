@implementation VUIImageFactoryAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VUIImageFactory");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VUIResourceImageDescriptor"), CFSTR("name"), "@", 0);
  objc_msgSend(v3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("VUIImageFactory"), CFSTR("makeImageViewWithResourceDescriptor:existingView:"), "@", "@", "@", 0);

}

+ (id)makeImageViewWithResourceDescriptor:(id)a3 existingView:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = a1;
  v10.super_class = (Class)&OBJC_METACLASS___VUIImageFactoryAccessibility;
  v5 = a3;
  objc_msgSendSuper2(&v10, sel_makeImageViewWithResourceDescriptor_existingView_, v5, a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeStringForKey:", CFSTR("name"), v10.receiver, v10.super_class);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v5) = objc_msgSend(v7, "isEqualToString:", CFSTR("AppleTV-Channels"));
  if ((_DWORD)v5)
  {
    objc_msgSend(v6, "setIsAccessibilityElement:", 1);
    accessibilityLocalizedString(CFSTR("channels.AppleTV"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v8);

  }
  return v6;
}

@end

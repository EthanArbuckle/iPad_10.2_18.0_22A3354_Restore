@implementation MKPlaceViewStyleProviderAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlaceViewStyleProvider");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasClassMethod:withFullSignature:", CFSTR("MKPlaceViewStyleProvider"), CFSTR("attributionStringWithTitle: displayName: logo: isSnippetLogo:"), "@", "@", "@", "B", 0);
}

+ (id)attributionStringWithTitle:(id)a3 displayName:(id)a4 logo:(id)a5 isSnippetLogo:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  void *v11;
  void *v12;
  objc_super v14;

  v6 = a6;
  v10 = a4;
  v14.receiver = a1;
  v14.super_class = (Class)&OBJC_METACLASS___MKPlaceViewStyleProviderAccessibility;
  objc_msgSendSuper2(&v14, sel_attributionStringWithTitle_displayName_logo_isSnippetLogo_, a3, v10, a5, v6);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v10)
    objc_msgSend(v11, "addAttribute:value:range:", CFSTR("AXAttributeDisplayName"), v10, 0, objc_msgSend(v11, "length"));

  return v12;
}

@end

@implementation SFAttributedRichLinkCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SFAttributedRichLinkCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAttributedRichLinkCell"), CFSTR("_attributionView"), "SLAttributionView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SFAttributedRichLinkCell"), CFSTR("_linkView"), "LPLinkView");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)_accessibilityAXAttributedLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[SFAttributedRichLinkCellAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_linkView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFAttributedRichLinkCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_attributionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityAXAttributedLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDFEA60]), "initWithString:", v4);
    objc_msgSend(v7, "appendString:", CFSTR(", "));
    objc_msgSend(v7, "appendStringOrAXAttributedString:", v6);

    v4 = v7;
  }

  return v4;
}

@end

@implementation SUUIButtonViewElementAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIButtonViewElement");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIButtonViewElement"), CFSTR("buttonImage"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIButtonViewElement"), CFSTR("buttonText"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SUUIButtonViewElement"), CFSTR("IKViewElement"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IKViewElement"), CFSTR("accessibilityText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIImageViewElement"), CFSTR("resourceName"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  __CFString *v7;
  id v8;

  -[SUUIButtonViewElementAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonText"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v4, "length"))
  {
    -[SUUIButtonViewElementAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "isEqualToString:", CFSTR("post")))
    {
      v7 = CFSTR("post.label");
    }
    else if (objc_msgSend(v6, "isEqualToString:", CFSTR("LoveHateControlNeutral")))
    {
      v7 = CFSTR("connect.comment.likes");
    }
    else
    {
      if (!objc_msgSend(v6, "isEqualToString:", CFSTR("share")))
      {
        v8 = v4;
        goto LABEL_10;
      }
      v7 = CFSTR("share.label");
    }
    accessibilityLocalizedString(v7);
    v8 = (id)objc_claimAutoreleasedReturnValue();
LABEL_10:
    v5 = v8;

    goto LABEL_11;
  }
  v5 = v4;
LABEL_11:

  return v5;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  void *v5;

  objc_opt_class();
  -[SUUIButtonViewElementAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttonImage"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("resourceName"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)accessibilityText
{
  void *v3;
  void *v4;
  objc_super v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIButtonViewElementAccessibility;
  -[SUUIButtonViewElementAccessibility accessibilityText](&v7, sel_accessibilityText);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v6.receiver = self;
    v6.super_class = (Class)SUUIButtonViewElementAccessibility;
    -[SUUIButtonViewElementAccessibility accessibilityText](&v6, sel_accessibilityText);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  objc_super v4;

  v2 = *MEMORY[0x24BDF73B0];
  v4.receiver = self;
  v4.super_class = (Class)SUUIButtonViewElementAccessibility;
  return -[SUUIButtonViewElementAccessibility accessibilityTraits](&v4, sel_accessibilityTraits) | v2;
}

@end

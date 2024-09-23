@implementation _TVTextBadgeAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVTextBadge");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)_TVTextBadgeAccessibility;
  -[_TVTextBadgeAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    accessibilityLocalizedString(CFSTR("unknown.badge"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[_TVTextBadgeAccessibility _processTextBadgeAXLabel:](self, "_processTextBadgeAXLabel:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return 0;
}

- (id)_processTextBadgeAXLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  const __CFString *v6;
  id v7;

  v3 = a3;
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ATV.Search.Product.ADAvailable")))
  {
    objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("axid.icon.ad");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("ATV.Search.Product.SDHAvailable")))
    {
      v7 = v3;
      goto LABEL_7;
    }
    objc_msgSend(MEMORY[0x24BDFFA50], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("axid.icon.sdh");
  }
  objc_msgSend(v4, "atvaccessibilityLocalizedString:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();

LABEL_7:
  return v7;
}

@end

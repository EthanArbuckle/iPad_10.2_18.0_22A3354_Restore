@implementation SUItemOfferButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUItemOfferButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (void)_reloadButton
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)SUItemOfferButtonAccessibility;
  -[SUItemOfferButtonAccessibility _reloadButton](&v2, sel__reloadButton);
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("press.buy"));
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v7;
  objc_super v8;
  objc_super v9;

  -[SUItemOfferButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("itemOfferButtonStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", *MEMORY[0x24BEC8E78]))
  {
    v9.receiver = self;
    v9.super_class = (Class)SUItemOfferButtonAccessibility;
    -[SUItemOfferButtonAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    accessibilityLocalizedString(CFSTR("iTunesPlus"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)SUItemOfferButtonAccessibility;
    -[SUItemOfferButtonAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v5;
}

@end

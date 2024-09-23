@implementation MobilePhoneUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  -[MobilePhoneUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneNumberLabel"));

  if (v4)
  {
    -[MobilePhoneUILabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = *MEMORY[0x24BDBD270];
    objc_msgSend(v6, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC08]);
    objc_msgSend(v6, "setAttribute:forKey:", v7, *MEMORY[0x24BDFEC00]);

    return v6;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MobilePhoneUILabelAccessibility;
    -[MobilePhoneUILabelAccessibility accessibilityValue](&v9, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  __CFString *v6;
  void *v7;
  objc_super v9;

  -[MobilePhoneUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneNumberLabel"));

  if (v4)
  {
    -[MobilePhoneUILabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("text"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
      v6 = CFSTR("phone.display");
    else
      v6 = CFSTR("empty.phone.display");
    accessibilityLocalizedString(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    return v7;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MobilePhoneUILabelAccessibility;
    -[MobilePhoneUILabelAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  int v4;
  objc_super v6;

  -[MobilePhoneUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneNumberLabel"));

  if (v4)
    return *MEMORY[0x24BDF7410] | *MEMORY[0x24BDF7418] | *MEMORY[0x24BDF7430];
  v6.receiver = self;
  v6.super_class = (Class)MobilePhoneUILabelAccessibility;
  return -[MobilePhoneUILabelAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
}

- (BOOL)_accessibilityAlwaysOrderedFirst
{
  void *v3;
  char v4;
  objc_super v6;

  -[MobilePhoneUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("PhoneNumberLabel"));

  if ((v4 & 1) != 0)
    return 1;
  v6.receiver = self;
  v6.super_class = (Class)MobilePhoneUILabelAccessibility;
  return -[MobilePhoneUILabelAccessibility _accessibilityAlwaysOrderedFirst](&v6, sel__accessibilityAlwaysOrderedFirst);
}

@end

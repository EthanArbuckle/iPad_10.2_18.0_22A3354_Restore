@implementation SiriUIContentButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIContentButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  -[SiriUIContentButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriUIContentButtonAccessibility isAccessibilityUserDefinedElement](self, "isAccessibilityUserDefinedElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    LOBYTE(v5) = objc_msgSend(v4, "BOOLValue");
  }
  else
  {
    -[SiriUIContentButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("text"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("length"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v7 != 0;

  }
  return v5;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;

  -[SiriUIContentButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[SiriUIContentButtonAccessibility accessibilityUserDefinedLabel](self, "accessibilityUserDefinedLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[SiriUIContentButtonAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilityLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

@end

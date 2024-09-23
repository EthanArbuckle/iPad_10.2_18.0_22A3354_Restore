@implementation SessionStackedLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SeymourUI.SessionStackedLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionStackedLabelView"), CFSTR("primaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionStackedLabelView"), CFSTR("secondaryLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SeymourUI.SessionStackedLabelView"), CFSTR("noDataIndicator"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  __CFString *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  void *v12;
  void *v13;
  const char *v14;
  void *v15;

  -[SessionStackedLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("primaryLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[SessionStackedLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("secondaryLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  -[SessionStackedLabelViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("noDataIndicator"));
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7)
    v8 = (__CFString *)v7;
  else
    v8 = CFSTR("--");
  if (objc_msgSend(v6, "containsString:", v8))
  {
    accessibilityLocalizedString(CFSTR("no.data"));
    v9 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v9;
  }
  if (v6)
  {
    if (objc_msgSend(v6, "containsString:", CFSTR(":")))
    {
      AXDurationForDurationString();
      if (v10 > 0.0)
      {
        AXDurationStringForDuration();
        v11 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v11;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v4, v6);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  AXLabelForElements();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  _accessibilityReplaceStylsticBulletsForSpeaking(v13, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SessionStackedLabelViewAccessibility;
  return *MEMORY[0x24BDF7410] | -[SessionStackedLabelViewAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

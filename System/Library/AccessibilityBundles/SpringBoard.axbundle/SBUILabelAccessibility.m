@implementation SBUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  unsigned __int8 v4;
  BOOL v5;
  objc_super v7;

  -[SBUILabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenTimeLabel")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenDateLabel")))
  {
    v4 = -[SBUILabelAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible");
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILabelAccessibility;
    v4 = -[SBUILabelAccessibility isAccessibilityElement](&v7, sel_isAccessibilityElement);
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityValue
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  char v7;
  objc_super v9;
  objc_super v10;
  objc_super v11;

  -[SBUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("AirPlay"));

  if (!v4)
    goto LABEL_3;
  -[SBUILabelAccessibility accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)SBUILabelAccessibility;
  -[SBUILabelAccessibility accessibilityLabel](&v11, sel_accessibilityLabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "isEqualToString:", v6);

  if ((v7 & 1) == 0)
    -[SBUILabelAccessibility accessibilityLabel](&v10, sel_accessibilityLabel, v9.receiver, v9.super_class, self, SBUILabelAccessibility);
  else
LABEL_3:
    -[SBUILabelAccessibility accessibilityValue](&v9, sel_accessibilityValue, self, SBUILabelAccessibility, v10.receiver, v10.super_class);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  -[SBUILabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenTimeLabel")))
  {
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[SBUILabelAccessibility accessibilityIdentifier](self, "accessibilityIdentifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("AirPlay"));

    if (v7)
    {
      accessibilityLocalizedString(CFSTR("airplay.button"));
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)SBUILabelAccessibility;
      -[SBUILabelAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v5 = (void *)v8;
  }

  return v5;
}

- (BOOL)_accessibilityViewIsVisible
{
  void *v3;
  void *v4;
  unsigned __int8 v5;
  objc_super v7;

  -[SBUILabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenTimeLabel")) & 1) != 0
    || objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenDateLabel")))
  {
    -[SBUILabelAccessibility _accessibilityViewAncestorIsKindOf:](self, "_accessibilityViewAncestorIsKindOf:", NSClassFromString(CFSTR("CSTimerView")));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityViewIsVisible");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILabelAccessibility;
    v5 = -[SBUILabelAccessibility _accessibilityViewIsVisible](&v7, sel__accessibilityViewIsVisible);
  }

  return v5;
}

- (CGRect)accessibilityFrame
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  objc_super v20;
  CGRect result;

  v20.receiver = self;
  v20.super_class = (Class)SBUILabelAccessibility;
  -[SBUILabelAccessibility accessibilityFrame](&v20, sel_accessibilityFrame);
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  if (-[SBUILabelAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("UseSuperviewAsFrame")))
  {
    -[SBUILabelAccessibility superview](self, "superview");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityFrame");
    v4 = v12;
    v6 = v13;
    v8 = v14;
    v10 = v15;

  }
  v16 = v4;
  v17 = v6;
  v18 = v8;
  v19 = v10;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

@end

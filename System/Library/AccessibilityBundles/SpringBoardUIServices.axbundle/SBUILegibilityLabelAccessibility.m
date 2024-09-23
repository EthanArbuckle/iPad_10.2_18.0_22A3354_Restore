@implementation SBUILegibilityLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBUILegibilityLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("SBFLockScreenDateView"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBUILegibilityLabel"), CFSTR("_lookasideLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("SBFLockScreenDateView"), CFSTR("UIView"));
  if (NSClassFromString(CFSTR("SBFLockScreenDateViewAccessibility")))
    objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SBFLockScreenDateViewAccessibility"), CFSTR("_axTimeLabelFrame"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "containsString:", CFSTR("LockScreenTimeLabel"));

  if (v4)
  {
    v5 = (void *)MEMORY[0x24BDFEA60];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axAttributedStringWithString:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x24BDBD270];
    v10 = (_QWORD *)MEMORY[0x24BDFEB00];
  }
  else
  {
    -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsString:", CFSTR("LockScreenDateLabel"));

    if (!v12)
    {
      -[SBUILegibilityLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lookasideLabel"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "accessibilityLabel");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
    v13 = (void *)MEMORY[0x24BDFEA60];
    -[SBUILegibilityLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_lookasideLabel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "accessibilityLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "axAttributedStringWithString:", v15);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = *MEMORY[0x24BDBD270];
    v10 = (_QWORD *)MEMORY[0x24BDFEB10];
  }
  objc_msgSend(v8, "setAttribute:forKey:", v9, *v10);
  return v8;
}

- (BOOL)_accessibilityOverridesInvisibility
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  objc_super v10;

  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HomeAffordanceLabel"));

  if ((v4 & 1) != 0)
    return 1;
  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("LockScreenTimeLabel")))
  {

  }
  else
  {
    -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LockScreenDateLabel"));

    if (!v7)
      goto LABEL_7;
  }
  -[SBUILegibilityLabelAccessibility alpha](self, "alpha");
  if (v8 > 0.0)
    return 1;
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityLabelAccessibility;
  return -[SBUILegibilityLabelAccessibility _accessibilityOverridesInvisibility](&v10, sel__accessibilityOverridesInvisibility);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  char isKindOfClass;
  void *v7;
  BOOL v8;
  objc_super v10;

  -[SBUILegibilityLabelAccessibility _accessibilityWindow](self, "_accessibilityWindow");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("SBCoverSheetWindow"));
  isKindOfClass = objc_opt_isKindOfClass();
  if (a3 == 1 && (isKindOfClass & 1) != 0)
  {
    accessibilitySBLocalizedString(CFSTR("did.show.today.view.announcement"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityLabelAccessibility;
  v8 = -[SBUILegibilityLabelAccessibility accessibilityScroll:](&v10, sel_accessibilityScroll_, a3);

  return v8;
}

- (BOOL)_accessibilityViewIsVisible
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  double v8;
  objc_super v10;

  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HomeAffordanceLabel"));

  if ((v4 & 1) != 0)
    return 1;
  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("LockScreenTimeLabel")))
  {

  }
  else
  {
    -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LockScreenDateLabel"));

    if (!v7)
      goto LABEL_7;
  }
  -[SBUILegibilityLabelAccessibility alpha](self, "alpha");
  if (v8 > 0.0)
    return 1;
LABEL_7:
  v10.receiver = self;
  v10.super_class = (Class)SBUILegibilityLabelAccessibility;
  return -[SBUILegibilityLabelAccessibility _accessibilityViewIsVisible](&v10, sel__accessibilityViewIsVisible);
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;

  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("HomeAffordanceLabel"));

  if ((v4 & 1) != 0)
    return 1;
  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("LockScreenTimeLabel")))
  {

  }
  else
  {
    -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("LockScreenDateLabel"));

    if (!v7)
      return 1;
  }
  -[SBUILegibilityLabelAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SBFLockScreenDateView")));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

- (unint64_t)accessibilityTraits
{
  uint64_t v2;
  void *v3;
  char isKindOfClass;
  uint64_t v5;

  v2 = *MEMORY[0x24BDF7410];
  -[SBUILegibilityLabelAccessibility accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("NCNotificationListHeaderTitleView"));
  isKindOfClass = objc_opt_isKindOfClass();

  v5 = *MEMORY[0x24BDF73C0];
  if ((isKindOfClass & 1) == 0)
    v5 = 0;
  return v5 | v2;
}

- (CGRect)accessibilityFrame
{
  void *v3;
  int v4;
  void *v5;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  objc_super v18;
  CGRect v19;
  CGRect result;

  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenTimeLabel"));

  if (v4)
  {
    -[SBUILegibilityLabelAccessibility _accessibilityParentView](self, "_accessibilityParentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("SBFLockScreenDateView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeCGRectForKey:", CFSTR("_axTimeLabelFrame"));
      x = v19.origin.x;
      y = v19.origin.y;
      width = v19.size.width;
      height = v19.size.height;
      if (!CGRectIsNull(v19))
      {

        goto LABEL_6;
      }
    }

  }
  v18.receiver = self;
  v18.super_class = (Class)SBUILegibilityLabelAccessibility;
  -[SBUILegibilityLabelAccessibility accessibilityFrame](&v18, sel_accessibilityFrame);
  x = v10;
  y = v11;
  width = v12;
  height = v13;
LABEL_6:
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  void *v3;
  char v4;
  objc_super v6;

  -[SBUILegibilityLabelAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", CFSTR("LockScreenTimeLabel"));

  if ((v4 & 1) != 0)
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)SBUILegibilityLabelAccessibility;
  return -[SBUILegibilityLabelAccessibility accessibilityRespondsToUserInteraction](&v6, sel_accessibilityRespondsToUserInteraction);
}

- (unsigned)_accessibilityMediaAnalysisOption
{
  return 0;
}

- (id)_accessibilityParentView
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[SBUILegibilityLabelAccessibility accessibilityContainer](self, "accessibilityContainer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    && (NSClassFromString(CFSTR("SBFLockScreenDateView")), (objc_opt_isKindOfClass() & 1) != 0)
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)SBUILegibilityLabelAccessibility;
    -[SBUILegibilityLabelAccessibility _accessibilityParentView](&v7, sel__accessibilityParentView);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

@end

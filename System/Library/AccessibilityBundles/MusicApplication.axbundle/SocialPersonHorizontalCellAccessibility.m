@implementation SocialPersonHorizontalCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MusicApplication.SocialPersonHorizontalCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilitySocialPersonCustomActions
{
  JUMPOUT(0x234917684);
}

- (void)setAccessibilitySocialPersonCustomActions:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonHorizontalCell"), CFSTR("accessibilityPersonName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonHorizontalCell"), CFSTR("accessibilityPersonSubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonHorizontalCell"), CFSTR("accessibilityFollowButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonHorizontalCell"), CFSTR("accessibilityApproveButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonHorizontalCell"), CFSTR("accessibilityDeclineButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MusicApplication.SocialPersonHorizontalCell"), CFSTR("accessibilityIsFollowRequest"), "B", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[SocialPersonHorizontalCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityPersonName, accessibilityPersonSubtitle"));
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SocialPersonHorizontalCellAccessibility;
  -[SocialPersonHorizontalCellAccessibility automationElements](&v10, sel_automationElements);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(v3, "mutableCopy");
  v5 = v4;
  if (v4)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  -[SocialPersonHorizontalCellAccessibility _axFollowButton](self, "_axFollowButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "axSafelyAddObject:", v8);

  return v7;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SocialPersonHorizontalCellAccessibility _axFollowButton](self, "_axFollowButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SocialPersonHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityPersonName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityValue:", v5);

  if (v4)
    objc_msgSend(v3, "addObject:", v4);

  return v3;
}

- (void)_accessibilityApproveButtonAction:(id)a3
{
  id v3;

  -[SocialPersonHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityApproveButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

}

- (void)_accessibilityDeclineButtonAction:(id)a3
{
  id v3;

  -[SocialPersonHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityDeclineButton"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityActivate");

}

- (id)accessibilityCustomActions
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD v11[3];

  v11[2] = *MEMORY[0x24BDAC8D0];
  if (!-[SocialPersonHorizontalCellAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsFollowRequest")))return 0;
  v3 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityMusicLocalizedString(CFSTR("approve.action"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithName:target:selector:", v4, self, sel__accessibilityApproveButtonAction_);

  v6 = objc_alloc(MEMORY[0x24BDF6788]);
  accessibilityMusicLocalizedString(CFSTR("decline.action"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v6, "initWithName:target:selector:", v7, self, sel__accessibilityDeclineButtonAction_);

  v11[0] = v5;
  v11[1] = v8;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SocialPersonHorizontalCellAccessibility;
  return *MEMORY[0x24BDF73E0] | -[SocialPersonHorizontalCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

- (id)_axFollowButton
{
  return (id)-[SocialPersonHorizontalCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityFollowButton"));
}

@end

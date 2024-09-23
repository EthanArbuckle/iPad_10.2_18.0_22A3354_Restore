@implementation AchievementCardAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("GameCenterUI.AchievementCard");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementCard"), CFSTR("accessibilityBadge"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityIsAchievementLocked"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityIsAchievementCompleted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityIsAchievementInProgress"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementCard"), CFSTR("accessibilityTitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementCard"), CFSTR("accessibilitySubtitleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementCard"), CFSTR("accessibilityAchievementCompletedDate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("GameCenterUI.AchievementBadge"), CFSTR("accessibilityProgress"), "d", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  int v4;
  int v5;
  int v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  double v17;
  float v18;
  void *v20;

  -[AchievementCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityBadge"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsAchievementLocked"));
  v5 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsAchievementCompleted"));
  v6 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("accessibilityIsAchievementInProgress"));
  -[AchievementCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityTitleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[AchievementCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySubtitleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[AchievementCardAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityAchievementCompletedDate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeCGFloatForKey:", CFSTR("accessibilityProgress"));
  if (v4)
  {
    AXGameCenterUIFrameworkLocString(CFSTR("LOCKED"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v5)
    {
      AXGameCenterUIFrameworkLocString(CFSTR("COMPLETED"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      AXDateStringForFormat();
      v16 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!v6)
      {
        objc_msgSend(v7, "accessibilityLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "accessibilityLabel");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      v17 = v11;
      AXGameCenterUIFrameworkLocString(CFSTR("IN_PROGRESS"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = v17 / 100.0;
      MEMORY[0x23490F8EC](0, v18);
      v16 = objc_claimAutoreleasedReturnValue();
    }
    v13 = (void *)v16;
    objc_msgSend(v7, "accessibilityLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

  }
LABEL_9:

  return v15;
}

@end

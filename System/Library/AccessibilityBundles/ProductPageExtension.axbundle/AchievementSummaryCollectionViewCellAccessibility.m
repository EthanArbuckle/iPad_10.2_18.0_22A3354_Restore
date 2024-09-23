@implementation AchievementSummaryCollectionViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ProductPageExtension.AchievementSummaryCollectionViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.AchievementSummaryCollectionViewCell"), CFSTR("achievementGroupView"), "Optional<AchievementGroupView>");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.AchievementSummaryCollectionViewCell"), CFSTR("numberCompletedLabel"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ProductPageExtension.AchievementSummaryCollectionViewCell"), CFSTR("outOfTotalLabel"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("AppStoreKitInternal.AchievementGroupView"), CFSTR("achievement"), "Optional<AchievementCard>");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  -[AchievementSummaryCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("achievementGroupView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeSwiftValueForKey:", CFSTR("achievement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AchievementSummaryCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("numberCompletedLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[AchievementSummaryCollectionViewCellAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("outOfTotalLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");
  objc_msgSend(v6, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\u202A/ "), &stru_25031BA20);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = objc_msgSend(v10, "intValue");
  v12 = (void *)MEMORY[0x24BDD17C8];
  accessibilityAppStoreLocalizedString(CFSTR("game.achievements.completed"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "stringWithFormat:", v13, v8, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (unint64_t)accessibilityTraits
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)AchievementSummaryCollectionViewCellAccessibility;
  return *MEMORY[0x24BDF73B0] | -[AchievementSummaryCollectionViewCellAccessibility accessibilityTraits](&v3, sel_accessibilityTraits);
}

@end

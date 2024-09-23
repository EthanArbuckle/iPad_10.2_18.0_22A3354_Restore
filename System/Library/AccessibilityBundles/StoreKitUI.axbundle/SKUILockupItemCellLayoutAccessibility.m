@implementation SKUILockupItemCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUILockupItemCellLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupItemCellLayout"), CFSTR("numberOfUserRatings"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupItemCellLayout"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUILockupItemCellLayout"), CFSTR("categoryString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUILockupMetadataView"), CFSTR("_userRatingImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUILockupItemCellLayout"), CFSTR("_metadataView"), "SKUILockupMetadataView");

}

- (id)accessibilityLabel
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;

  -[SKUILockupItemCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("numberOfUserRatings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  if (v4 < 1)
  {
    v7 = 0;
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD17C8];
    accessibilitySKUILocalizedString(CFSTR("USER_RATING_COUNT"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringWithFormat:", v6, v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SKUILockupItemCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("categoryString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUILockupItemCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_metadataView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("_userRatingImageView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

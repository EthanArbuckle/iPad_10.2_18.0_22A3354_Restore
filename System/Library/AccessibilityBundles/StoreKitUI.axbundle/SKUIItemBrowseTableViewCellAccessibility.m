@implementation SKUIItemBrowseTableViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIItemBrowseTableViewCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIItemBrowseTableViewCell"), CFSTR("layout"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIItemBrowseCellLayout"), CFSTR("category"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIItemBrowseCellLayout"), CFSTR("numberOfUserRatings"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIItemBrowseCellLayout"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIItemBrowseCellLayout"), CFSTR("indexNumberString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIItemBrowseCellLayout"), CFSTR("_userRating"), "d");

}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v13;

  -[SKUIItemBrowseTableViewCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("layout"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("title"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_userRating"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "floatValue");

  objc_msgSend(v2, "safeValueForKey:", CFSTR("category"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("numberOfUserRatings"));
  v7 = (void *)MEMORY[0x24BDD17C8];
  accessibilitySKUILocalizedString(CFSTR("USER_RATING_COUNT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedStringWithFormat:", v8, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "safeValueForKey:", CFSTR("indexNumberString"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  UIAXStarRatingStringForRating();
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

@end

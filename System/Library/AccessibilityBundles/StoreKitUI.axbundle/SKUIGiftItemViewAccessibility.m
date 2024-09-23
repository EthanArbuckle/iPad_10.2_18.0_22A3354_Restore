@implementation SKUIGiftItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIGiftItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftItemView"), CFSTR("_subtitleLabel1"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftItemView"), CFSTR("_subtitleLabel2"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftItemView"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftItemView"), CFSTR("_price"), "NSString");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftItemView"), CFSTR("_numberOfUserRatings"), "NSInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIGiftItemView"), CFSTR("_userRating"), "f");

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
  void *v11;
  void *v12;
  void *v14;

  -[SKUIGiftItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel1"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel2"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SKUIGiftItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRating"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "floatValue");

  -[SKUIGiftItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_numberOfUserRatings"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "integerValue");

  v9 = (void *)MEMORY[0x24BDD17C8];
  accessibilitySKUILocalizedString(CFSTR("USER_RATING_COUNT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  UIAXStarRatingStringForRating();
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

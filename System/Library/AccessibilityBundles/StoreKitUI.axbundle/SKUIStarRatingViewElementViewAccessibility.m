@implementation SKUIStarRatingViewElementViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIStarRatingViewElementView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
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
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  -[SKUIStarRatingViewElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textLayout"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("attributedString"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("string"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "componentsSeparatedByString:", CFSTR(" "));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (v7 == 1)
  {
    objc_msgSend(v5, "stringByReplacingOccurrencesOfString:withString:options:range:", CFSTR("[^0-9]"), &stru_24FF2D518, 1024, 0, objc_msgSend(v5, "length"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilitySKUILocalizedString(CFSTR("USER_RATING_COUNT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, objc_msgSend(v8, "integerValue"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[SKUIStarRatingViewElementViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_starRatingImage"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "accessibilityLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

@end

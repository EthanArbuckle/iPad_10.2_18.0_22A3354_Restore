@implementation SKUIItemBrowseCellLayoutAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIItemBrowseCellLayout");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIItemBrowseCellLayout"), CFSTR("_cellContentView"), "_SKUIItemBrowseCellContentView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SKUIItemBrowseCellContentView"), CFSTR("userRatingImageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SKUIItemBrowseCellContentView"), CFSTR("userRatingLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SKUIItemBrowseCellContentView"), CFSTR("titleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_SKUIItemBrowseCellContentView"), CFSTR("subtitleLabel"), "@", 0);

}

- (id)accessibilityLabel
{
  void *v2;
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
  void *v16;
  void *v17;
  void *v19;

  -[SKUIItemBrowseCellLayoutAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_cellContentView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("userRatingLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "decimalDigitCharacterSet");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "invertedSet");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = objc_msgSend(v7, "integerValue");
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilitySKUILocalizedString(CFSTR("USER_RATING_COUNT"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringWithFormat:", v10, v8);
    v11 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v11;
  }
  objc_msgSend(v2, "safeValueForKey:", CFSTR("titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "accessibilityLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("subtitleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("userRatingImageView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "accessibilityLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  return v17;
}

@end

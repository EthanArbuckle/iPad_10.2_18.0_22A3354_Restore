@implementation SUUIProductPageHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SUUIProductPageHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageHeaderView"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageHeaderView"), CFSTR("initWithClientContext:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageHeaderView"), CFSTR("setUserRating:"), "v", "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageHeaderView"), CFSTR("setIconImage:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageHeaderView"), CFSTR("setNumberOfUserRatings:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageHeaderView"), CFSTR("_ageBandLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageHeaderView"), CFSTR("_iconImageView"), "UIImageView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageHeaderView"), CFSTR("_userRatingLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageHeaderView"), CFSTR("_titleLabel"), "SUUIProductPageHeaderLabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageHeaderView"), CFSTR("_artistButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SUUIProductPageHeaderView"), CFSTR("_itemOfferButton"), "SUUIItemOfferButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SUUIProductPageHeaderView"), CFSTR("inAppPurchasesString"), "@", 0);

}

- (SUUIProductPageHeaderViewAccessibility)initWithClientContext:(id)a3
{
  SUUIProductPageHeaderViewAccessibility *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)SUUIProductPageHeaderViewAccessibility;
  v3 = -[SUUIProductPageHeaderViewAccessibility initWithClientContext:](&v7, sel_initWithClientContext_, a3);
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](v3, "safeValueForKey:", CFSTR("_shareButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("share.button"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v5);

  return v3;
}

- (void)setIconImage:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)SUUIProductPageHeaderViewAccessibility;
  -[SUUIProductPageHeaderViewAccessibility setIconImage:](&v10, sel_setIconImage_, a3);
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconImageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);

  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconImageView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("icon.image.with.title"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("title"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringWithFormat:", v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v9);

}

- (void)setNumberOfUserRatings:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SUUIProductPageHeaderViewAccessibility;
  -[SUUIProductPageHeaderViewAccessibility setNumberOfUserRatings:](&v9, sel_setNumberOfUserRatings_);
  if (a3 >= 1)
  {
    -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingLabel"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("USER_RATING_COUNT"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringWithFormat:", v7, a3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAccessibilityLabel:", v8);

  }
}

- (void)setUserRating:(double)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SUUIProductPageHeaderViewAccessibility;
  -[SUUIProductPageHeaderViewAccessibility setUserRating:](&v5, sel_setUserRating_, a3);
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingStarsView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsAccessibilityElement:", 1);

}

- (CGRect)accessibilityFrame:(id)a3
{
  void *v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect result;
  CGRect v29;

  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityFrame");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  objc_msgSend(v5, "accessibilityFrame");
  v29.origin.x = v14;
  v29.origin.y = v15;
  v29.size.width = v16;
  v29.size.height = v17;
  v26.origin.x = v7;
  v26.origin.y = v9;
  v26.size.width = v11;
  v26.size.height = v13;
  v27 = CGRectUnion(v26, v29);
  x = v27.origin.x;
  y = v27.origin.y;
  width = v27.size.width;
  height = v27.size.height;

  v22 = x;
  v23 = y;
  v24 = width;
  v25 = height;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)_accessibilityHitTestReverseOrder
{
  return 1;
}

- (id)accessibilityLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v18;
  id v19;

  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingStarsView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_userRatingLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inAppPurchasesString"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ageBandLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SUUIProductPageHeaderViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("facebookCount"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "integerValue");

  if (v10 < 1)
  {
    v13 = 0;
  }
  else
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("FACEBOOK_FRIEND_LIKE_COUNT"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringWithFormat:", v12, v10);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(v4, "accessibilityLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityLabel");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v19 = (id)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (id)accessibilityElements
{
  _QWORD *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v3 = (_QWORD *)MEMORY[0x24BEBB308];
  -[SUUIProductPageHeaderViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", *MEMORY[0x24BEBB308]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF67A0]), "initWithAccessibilityContainer:", self);
    objc_msgSend(v5, "setAccessibilityDelegate:", self);
    objc_msgSend(v4, "addObject:", v5);
    -[SUUIProductPageHeaderViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, *v3);

  }
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_artistButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (v7 && objc_msgSend(v7, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v8);
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_shareButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9 && objc_msgSend(v9, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v10);
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_iconImageView"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (v11 && objc_msgSend(v11, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "insertObject:atIndex:", v12, 0);
  -[SUUIProductPageHeaderViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_itemOfferButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13 && objc_msgSend(v13, "_accessibilityViewIsVisible"))
    objc_msgSend(v6, "axSafelyAddObject:", v14);

  return v6;
}

@end

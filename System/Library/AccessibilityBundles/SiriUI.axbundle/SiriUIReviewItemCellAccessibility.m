@implementation SiriUIReviewItemCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIReviewItemCell");
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
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SiriUIReviewItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ratingView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "length"))
    objc_msgSend(v3, "addObject:", v5);
  -[SiriUIReviewItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_authorLabel"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "length"))
    objc_msgSend(v3, "addObject:", v7);
  -[SiriUIReviewItemCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_commentLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v9, "length"))
    objc_msgSend(v3, "addObject:", v9);
  objc_msgSend(v3, "componentsJoinedByString:", CFSTR(", "));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

@end

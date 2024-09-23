@implementation _TVRatingViewCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("_TVRatingViewCell");
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
  char *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_TVRatingViewCellAccessibility;
  v3 = (char *)-[_TVRatingViewCellAccessibility accessibilityRowRange](&v9, sel_accessibilityRowRange) + 1;
  if ((unint64_t)v3 > 0x7FFFFFFFFFFFFFFELL)
  {
    v8.receiver = self;
    v8.super_class = (Class)_TVRatingViewCellAccessibility;
    -[_TVRatingViewCellAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("star.rating"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    return v6;
  }
}

- (id)accessibilityHint
{
  return accessibilityLocalizedString(CFSTR("star.rating.hint"));
}

- (BOOL)_isAccessibilityExplorerElement
{
  return 0;
}

- (_NSRange)accessibilityRowRange
{
  NSUInteger v2;
  NSUInteger v3;
  _NSRange result;

  v2 = 0x7FFFFFFFLL;
  v3 = 0;
  result.length = v3;
  result.location = v2;
  return result;
}

@end

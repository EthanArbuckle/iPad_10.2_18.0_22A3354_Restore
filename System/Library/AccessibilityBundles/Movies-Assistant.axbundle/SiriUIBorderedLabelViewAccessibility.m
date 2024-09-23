@implementation SiriUIBorderedLabelViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SiriUIBorderedLabelView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[SiriUIBorderedLabelViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_ratingLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("movie.rating"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v5, v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

@end

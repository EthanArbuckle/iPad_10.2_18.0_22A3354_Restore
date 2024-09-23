@implementation COSDiscoverCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("COSDiscoverCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSDiscoverCell"), CFSTR("_titleLabel"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("COSDiscoverCell"), CFSTR("_subtitleLabel"), "UILabel");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[COSDiscoverCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("_titleLabel"));
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;

  -[COSDiscoverCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (-[COSDiscoverCellAccessibility _hasArrowUnicodeInSubtitleLabel](self, "_hasArrowUnicodeInSubtitleLabel"))
  {
    objc_msgSend(v4, "stringByReplacingCharactersInRange:withString:", objc_msgSend(v4, "length") - 1, 1, &stru_2501974F8);
    v5 = objc_claimAutoreleasedReturnValue();

    v4 = (void *)v5;
  }
  return v4;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[COSDiscoverCellAccessibility _hasArrowUnicodeInSubtitleLabel](self, "_hasArrowUnicodeInSubtitleLabel"))
  {
    accessibilityLocalizedString(CFSTR("discovery.link.to.content"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)COSDiscoverCellAccessibility;
    -[COSDiscoverCellAccessibility accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_hasArrowUnicodeInSubtitleLabel
{
  void *v2;
  void *v3;
  uint64_t v4;
  BOOL v5;
  void *v6;
  int v7;
  BOOL v8;

  -[COSDiscoverCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "length");
  if (v3)
    v5 = v4 < 1;
  else
    v5 = 1;
  if (v5)
    goto LABEL_9;
  objc_msgSend(v3, "substringWithRange:", v4 - 1, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "length") != 1)
  {

    goto LABEL_9;
  }
  v7 = objc_msgSend(v6, "characterAtIndex:", 0);

  if (v7 != 8599)
  {
LABEL_9:
    v8 = 0;
    goto LABEL_10;
  }
  v8 = 1;
LABEL_10:

  return v8;
}

@end

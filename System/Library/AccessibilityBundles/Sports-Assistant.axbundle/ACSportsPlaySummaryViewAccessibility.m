@implementation ACSportsPlaySummaryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ACSportsPlaySummaryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsPlaySummaryView"), CFSTR("goalTime"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ACSportsPlaySummaryView"), CFSTR("goalScorer"), "@", 0);

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
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id v16;
  objc_super v18;
  char v19;

  objc_opt_class();
  -[ACSportsPlaySummaryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("goalTime"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v19 = 0;
  objc_opt_class();
  -[ACSportsPlaySummaryViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("goalScorer"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 && v6)
  {
    v7 = objc_msgSend(v4, "rangeOfString:", CFSTR(":"));
    if (v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v4, "substringToIndex:", v7);
      v8 = objc_claimAutoreleasedReturnValue();

      v4 = (void *)v8;
    }
    v9 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("sport.soccer.goal"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringWithFormat:", v10, v4, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "rangeOfString:", v4);
    v15 = v11;
    if (v13 != 0x7FFFFFFFFFFFFFFFLL)
    {
      objc_msgSend(v12, "setAttribute:forKey:withRange:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB00], v13, v14);
      v15 = v12;
    }
    v16 = v15;

  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)ACSportsPlaySummaryViewAccessibility;
    -[ACSportsPlaySummaryViewAccessibility accessibilityLabel](&v18, sel_accessibilityLabel);
    v16 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end

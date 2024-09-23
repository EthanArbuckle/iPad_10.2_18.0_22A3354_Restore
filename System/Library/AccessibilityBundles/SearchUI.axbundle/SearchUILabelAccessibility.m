@implementation SearchUILabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SearchUILabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SearchUILabelAccessibility;
  -[SearchUILabelAccessibility accessibilityLabel](&v9, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (!v6)
    return 0;
  v8.receiver = self;
  v8.super_class = (Class)SearchUILabelAccessibility;
  return -[SearchUILabelAccessibility isAccessibilityElement](&v8, sel_isAccessibilityElement);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SearchUILabelAccessibility;
  -[SearchUILabelAccessibility accessibilityLabel](&v6, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SearchUILabelAccessibility _axValidateString:](self, "_axValidateString:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axValidateString:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  v3 = (void *)MEMORY[0x24BDD14A8];
  v4 = a3;
  objc_msgSend(v3, "whitespaceCharacterSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByTrimmingCharactersInSet:", v5);
  v6 = (id)objc_claimAutoreleasedReturnValue();

  v7 = (void *)objc_msgSend(v4, "length");
  if (v7)
  {
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("(\\b\\d{4})(-)(\\d{4}\\b)"), 0, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v6, "length");
    v10 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("vibrant.label.time.to"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("$1 %@ $3"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringByReplacingMatchesInString:options:range:withTemplate:", v6, 0, 0, v9, v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("^(?:([01]?\\d|2[0-3]):)?([0-5]?\\d):([0-5]?\\d)$"), 0, 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "matchesInString:options:range:", v13, 0, 0, objc_msgSend(v13, "length"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "count"))
    {
      objc_msgSend(v15, "firstObject");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "range");
      v19 = v18;
      v20 = objc_msgSend(v16, "range");
      objc_msgSend(v13, "substringWithRange:", v20, v21);
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      AXLocalizeDurationTime();
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "stringByReplacingCharactersInRange:withString:", v17, v19, v23);
      v24 = objc_claimAutoreleasedReturnValue();

      v13 = (void *)v24;
    }
    objc_msgSend(MEMORY[0x24BDD1798], "regularExpressionWithPattern:options:error:", CFSTR("((?:[01]?\\d|2[0-3]):(?:[0-5]?\\d)) (-) ((?:[01]?\\d|2[0-3]):(?:[0-5]?\\d))"), 0, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = objc_msgSend(v13, "length");
    v27 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("vibrant.label.time.to"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "stringWithFormat:", CFSTR("$1 %@ $3"), v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "stringByReplacingMatchesInString:options:range:withTemplate:", v13, 0, 0, v26, v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v30;
    v7 = v6;
  }

  return v7;
}

@end

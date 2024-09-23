@implementation BSUIRelativeDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("BSUIRelativeDateLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BSUIRelativeDateLabel"), CFSTR("_value"), "NSUInteger");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BSUIRelativeDateLabel"), CFSTR("_resolution"), "Q");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("BSUIRelativeDateLabel"), CFSTR("_comparedToNow"), "q");

}

- (id)accessibilityLabel
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v10;
  __CFString *v11;
  void *v12;
  void *v13;
  objc_super v14;
  objc_super v15;
  objc_super v16;

  v3 = -[BSUIRelativeDateLabelAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_value"));
  v4 = -[BSUIRelativeDateLabelAccessibility safeUnsignedIntegerForKey:](self, "safeUnsignedIntegerForKey:", CFSTR("_resolution"));
  v5 = -[BSUIRelativeDateLabelAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("_comparedToNow"));
  switch(v4)
  {
    case 0:
      if (v5 != 1)
      {
        v15.receiver = self;
        v15.super_class = (Class)BSUIRelativeDateLabelAccessibility;
        -[BSUIRelativeDateLabelAccessibility accessibilityLabel](&v15, sel_accessibilityLabel);
        return (id)objc_claimAutoreleasedReturnValue();
      }
      v6 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("minutes.ahead"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "stringWithFormat:", v7, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    case 1:
      v10 = (void *)MEMORY[0x24BDD17C8];
      if (v5 == 1)
        v11 = CFSTR("minutes.ahead");
      else
        v11 = CFSTR("minutes.ago");
      goto LABEL_16;
    case 2:
      v10 = (void *)MEMORY[0x24BDD17C8];
      if (v5 == 1)
        v11 = CFSTR("hours.ahead");
      else
        v11 = CFSTR("hours.ago");
      goto LABEL_16;
    case 3:
      if (v5 == 1)
      {
        v16.receiver = self;
        v16.super_class = (Class)BSUIRelativeDateLabelAccessibility;
        -[BSUIRelativeDateLabelAccessibility accessibilityLabel](&v16, sel_accessibilityLabel);
        return (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v10 = (void *)MEMORY[0x24BDD17C8];
        v11 = CFSTR("days.ago");
LABEL_16:
        accessibilityLocalizedString(v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "localizedStringWithFormat:", v12, v3);
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        return v13;
      }
    default:
      v14.receiver = self;
      v14.super_class = (Class)BSUIRelativeDateLabelAccessibility;
      -[BSUIRelativeDateLabelAccessibility accessibilityLabel](&v14, sel_accessibilityLabel);
      return (id)objc_claimAutoreleasedReturnValue();
  }
}

@end

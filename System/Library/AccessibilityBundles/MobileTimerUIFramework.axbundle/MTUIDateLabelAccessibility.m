@implementation MTUIDateLabelAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MTUIDateLabel");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("MTUIDateLabel"), CFSTR("_dateLabel"), "UILabel");
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;
  void *v4;

  -[MTUIDateLabelAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_dateLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "containsString:", CFSTR(":")))
  {
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEB00]);
    v3 = v4;
  }
  return v3;
}

@end

@implementation CCUIMenuModuleItemViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CCUIMenuModuleItemView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIMenuModuleItemView"), CFSTR("_titleLabel"), "BSUIEmojiLabelView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CCUIMenuModuleItemView"), CFSTR("_subtitleLabel"), "BSUIEmojiLabelView");
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CCUIMenuModuleItemView"), CFSTR("menuItem"), "@");
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("CCUIMenuModuleItem"), CFSTR("selected"), CFSTR("isSelected"), 0, "B");
  objc_msgSend(v3, "validateClass:hasProperty:customGetter:customSetter:withType:", CFSTR("CCUIMenuModuleItem"), CFSTR("placeholder"), CFSTR("isPlaceholder"), 0, "B");

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int v4;

  if (-[CCUIMenuModuleItemViewAccessibility _accessibilityViewIsVisible](self, "_accessibilityViewIsVisible"))
  {
    -[CCUIMenuModuleItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("menuItem"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("isPlaceholder")) ^ 1;

  }
  else
  {
    LOBYTE(v4) = 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  void *v2;
  void *v3;

  -[CCUIMenuModuleItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_titleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[CCUIMenuModuleItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_subtitleLabel"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v2;
  int v3;
  uint64_t v4;

  -[CCUIMenuModuleItemViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("menuItem"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isSelected"));

  v4 = *MEMORY[0x24BDF7400];
  if (!v3)
    v4 = 0;
  return v4 | *MEMORY[0x24BDF73B0];
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v9.receiver = self;
  v9.super_class = (Class)CCUIMenuModuleItemViewAccessibility;
  -[CCUIMenuModuleItemViewAccessibility description](&v9, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemViewAccessibility accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIMenuModuleItemViewAccessibility accessibilityValue](self, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[%@ label:%@ value:%@]"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

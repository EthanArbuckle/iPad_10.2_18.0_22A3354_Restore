@implementation ShelfHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASMessagesProvider.ShelfHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.ShelfHeaderView"), CFSTR("eyebrowButton"), "DynamicTypeButton");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.ShelfHeaderView"), CFSTR("titleButton"), "DynamicTypeButton");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.ShelfHeaderView"), CFSTR("subtitleLabel"), "DynamicTypeLabel");
  objc_msgSend(v3, "validateClass:hasSwiftField:withSwiftType:", CFSTR("ASMessagesProvider.ShelfHeaderView"), CFSTR("accessoryButton"), "DynamicTypeButton");

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  unint64_t v7;
  unint64_t v8;
  objc_super v10;
  objc_super v11;
  char v12;

  v12 = 0;
  objc_opt_class();
  -[ShelfHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "currentAttributedTitle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v5, "containsAttachmentsInRange:", 0, objc_msgSend(v5, "length")))
  {
    v11.receiver = self;
    v11.super_class = (Class)ShelfHeaderViewAccessibility;
    v6 = *MEMORY[0x24BDF73C0] | -[ShelfHeaderViewAccessibility accessibilityTraits](&v11, sel_accessibilityTraits);
    v7 = *MEMORY[0x24BDF73B0];
  }
  else
  {
    v10.receiver = self;
    v10.super_class = (Class)ShelfHeaderViewAccessibility;
    v7 = -[ShelfHeaderViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
    v6 = *MEMORY[0x24BDF73C0];
  }
  v8 = v6 | v7;

  return v8;
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
  void *v11;
  void *v12;

  -[ShelfHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("eyebrowButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ShelfHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("subtitleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[ShelfHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("titleButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "currentAttributedTitle");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "string");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByReplacingOccurrencesOfString:withString:", CFSTR("\uFFFC"), &stru_2501342D0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7.receiver = self;
  v7.super_class = (Class)ShelfHeaderViewAccessibility;
  -[ShelfHeaderViewAccessibility _accessibilitySupplementaryFooterViews](&v7, sel__accessibilitySupplementaryFooterViews);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[ShelfHeaderViewAccessibility safeSwiftValueForKey:](self, "safeSwiftValueForKey:", CFSTR("accessoryButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObject:", v5);

  return v3;
}

@end

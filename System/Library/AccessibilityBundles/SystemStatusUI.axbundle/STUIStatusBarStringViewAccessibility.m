@implementation STUIStatusBarStringViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarStringView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("STUIStatusBarStringView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIView"), CFSTR("canBecomeFocused"), "B", 0);

}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  _QWORD *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  objc_super v16;
  objc_super v17;
  char v18;

  v18 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDFEA60];
  objc_msgSend(v3, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "axAttributedStringWithString:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = -[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsTime"));
  v8 = (_QWORD *)MEMORY[0x24BDBD270];
  if ((v7 & 1) != 0
    || -[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsPillTime")))
  {
    v9 = (void *)MEMORY[0x24BDFEA60];
    objc_msgSend(MEMORY[0x24BDBCE60], "date");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AXDateStringForFormat();
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "axAttributedStringWithString:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setAttribute:forKey:", *v8, *MEMORY[0x24BDFEB00]);
    v6 = v12;
  }
  if (-[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsDate")))objc_msgSend(v6, "setAttribute:forKey:", *v8, *MEMORY[0x24BDFEB10]);
  if (-[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsBreadcrumb")))
  {
    v17.receiver = self;
    v17.super_class = (Class)STUIStatusBarStringViewAccessibility;
    -[STUIStatusBarStringViewAccessibility accessibilityLabel](&v17, sel_accessibilityLabel);
    v13 = (id)objc_claimAutoreleasedReturnValue();
LABEL_11:
    v14 = v13;
    goto LABEL_12;
  }
  if (!-[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsDataNetwork"))|| (v16.receiver = self, v16.super_class = (Class)STUIStatusBarStringViewAccessibility, -[STUIStatusBarStringViewAccessibility accessibilityLabel](&v16, sel_accessibilityLabel), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v13 = v6;
    goto LABEL_11;
  }
LABEL_12:

  return v14;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)STUIStatusBarStringViewAccessibility;
  v3 = *MEMORY[0x24BEBB180] | -[STUIStatusBarStringViewAccessibility accessibilityTraits](&v5, sel_accessibilityTraits) | *MEMORY[0x24BEBB0F8];
  if ((-[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsTime")) & 1) != 0|| -[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsPillTime")))
  {
    v3 |= *MEMORY[0x24BDF7430];
  }
  return v3;
}

- (BOOL)_accessibilityInTopLevelTabLoop
{
  return 1;
}

- (BOOL)isAccessibilityElement
{
  objc_super v4;

  if ((-[STUIStatusBarStringViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("AccessibilityStatusBarStringIsPillTime")) & 1) != 0)return 0;
  v4.receiver = self;
  v4.super_class = (Class)STUIStatusBarStringViewAccessibility;
  return -[STUIStatusBarStringViewAccessibility isAccessibilityElement](&v4, sel_isAccessibilityElement);
}

- (BOOL)_accessibilityIsNonDismissableStatusBarElement
{
  return 1;
}

- (BOOL)canBecomeFocused
{
  BOOL v3;
  void *v4;
  void *v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)STUIStatusBarStringViewAccessibility;
  v3 = -[STUIStatusBarStringViewAccessibility canBecomeFocused](&v8, sel_canBecomeFocused);
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if ((unint64_t)(v6 - 4) <= 0xFFFFFFFFFFFFFFFDLL)
    return -[STUIStatusBarStringViewAccessibility accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction");
  return v3;
}

@end

@implementation MobileCalUIViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("UIView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_accessibilitySupportsContentSizeCategory:(id)a3
{
  id v4;
  void *v5;
  int v6;
  BOOL v7;
  void *v8;
  int v9;
  unsigned __int8 v10;
  objc_super v12;

  v4 = a3;
  -[MobileCalUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("_AXYearViewIdentifier"));

  if (v6)
  {
    if ((objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF76A0]) & 1) != 0)
    {
      v7 = 1;
      goto LABEL_11;
    }
    v10 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BDF7640]);
LABEL_9:
    v7 = v10;
    goto LABEL_11;
  }
  -[MobileCalUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("_AXMonthViewIdentifier"));

  if (!v9)
  {
    v12.receiver = self;
    v12.super_class = (Class)MobileCalUIViewAccessibility;
    v10 = -[MobileCalUIViewAccessibility _accessibilitySupportsContentSizeCategory:](&v12, sel__accessibilitySupportsContentSizeCategory_, v4);
    goto LABEL_9;
  }
  v7 = UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x24BDF76A8]) == NSOrderedDescending
    && UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x24BDF7658]) == NSOrderedAscending;
LABEL_11:

  return v7;
}

- (BOOL)_accessibilityDrawsFocusRingWhenChildrenFocused
{
  void *v3;
  char v4;
  void *v5;

  if (!-[MobileCalUIViewAccessibility _accessibilityIsFKARunningForFocusItem](self, "_accessibilityIsFKARunningForFocusItem"))return 0;
  -[MobileCalUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("_AXMonthViewIdentifier")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[MobileCalUIViewAccessibility accessibilityIdentification](self, "accessibilityIdentification");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("_AXYearViewIdentifier"));

  }
  return v4;
}

@end

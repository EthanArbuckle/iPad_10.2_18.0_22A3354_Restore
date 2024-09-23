@implementation STUIStatusBarCellularSignalViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("STUIStatusBarCellularSignalView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:", CFSTR("STUIStatusBarDualCellularSignalView"));
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
  uint64_t v10;
  const __CFString *v11;
  void *v12;
  void *v13;

  -[STUIStatusBarCellularSignalViewAccessibility _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", MEMORY[0x2349217D4](CFSTR("STUIStatusBarDualCellularSignalView"), a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3
    || (-[STUIStatusBarCellularSignalViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXStatusBarSignalViewServiceKey")), (v4 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    v5 = (void *)MEMORY[0x24BDFEA60];
    accessibilityLocalizedString(CFSTR("status.cellular.service"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "axAttributedStringWithString:", v6);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (-[STUIStatusBarCellularSignalViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("PrimaryCellular")))
    {
      v7 = (void *)MEMORY[0x24BDFEA60];
      accessibilityLocalizedString(CFSTR("primary.cellular"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "axAttributedStringWithString:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *MEMORY[0x24BDFEC30];
      v11 = CFSTR("Primary");
LABEL_7:
      objc_msgSend(v9, "setAttribute:forKey:", v11, v10);
      v4 = v9;
      return v4;
    }
    if (-[STUIStatusBarCellularSignalViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("SecondaryCellular")))
    {
      v12 = (void *)MEMORY[0x24BDFEA60];
      accessibilityLocalizedString(CFSTR("secondary.cellular"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "axAttributedStringWithString:", v13);
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      v10 = *MEMORY[0x24BDFEC30];
      v11 = CFSTR("Secondary");
      goto LABEL_7;
    }
  }
  return v4;
}

@end

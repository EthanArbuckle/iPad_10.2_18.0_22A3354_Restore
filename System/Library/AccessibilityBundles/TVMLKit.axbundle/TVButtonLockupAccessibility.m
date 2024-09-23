@implementation TVButtonLockupAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TVButtonLockup");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVButtonLockup"), CFSTR("titleView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVButtonLockup"), CFSTR("imageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("TVButtonLockup"), CFSTR("_textView"), "UILabel");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TVButtonLockup"), CFSTR("_selectButtonAction:"), "v", "@", 0);

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
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  id v12;
  void *v14;
  void *v15;
  const __CFString *v16;
  const __CFString *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)TVButtonLockupAccessibility;
  -[TVButtonLockupAccessibility accessibilityLabel](&v18, sel_accessibilityLabel);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[TVButtonLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("titleView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[TVButtonLockupAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_textView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v3, "length"))
  {
    v8 = v3;
    if ((objc_msgSend(v8, "axContainsString:options:", v7, 2) & 1) == 0)
    {
      v14 = v7;
      v16 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v9 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v9;
    }
    if ((objc_msgSend(v8, "axContainsString:options:", v5, 2, v14, v16) & 1) == 0)
    {
      v15 = v5;
      v17 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (id)v10;
    }
  }
  else
  {
    v15 = v5;
    v17 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  -[TVButtonLockupAccessibility _accessibilityLastAxLabel](self, "_accessibilityLastAxLabel", v15, v17);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[TVButtonLockupAccessibility _accessibilityShouldAnnounceAxLabelChange](self, "_accessibilityShouldAnnounceAxLabelChange")&& (objc_msgSend(v8, "isEqualToString:", v11) & 1) == 0)
  {
    -[TVButtonLockupAccessibility _accessibilitySetShouldAnnounceAxLabelChange:](self, "_accessibilitySetShouldAnnounceAxLabelChange:", 0);
  }
  -[TVButtonLockupAccessibility _accessibilitySetLastAxLabel:](self, "_accessibilitySetLastAxLabel:", v8);
  v12 = v8;

  return v12;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (BOOL)_accessibilityShouldAnnounceAxLabelChange
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_accessibilitySetShouldAnnounceAxLabelChange:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_accessibilityLastAxLabel
{
  JUMPOUT(0x234921DE0);
}

- (void)_accessibilitySetLastAxLabel:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_selectButtonAction:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)TVButtonLockupAccessibility;
  -[TVButtonLockupAccessibility _selectButtonAction:](&v4, sel__selectButtonAction_, a3);
  -[TVButtonLockupAccessibility _accessibilitySetShouldAnnounceAxLabelChange:](self, "_accessibilitySetShouldAnnounceAxLabelChange:", 1);
}

@end

@implementation AVTSimpleAvatarPickerHeaderViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTSimpleAvatarPickerHeaderView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTSimpleAvatarPickerHeaderView"), CFSTR("currentSymbolName"), "@", 0);
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (unint64_t)accessibilityTraits
{
  return *MEMORY[0x24BDF73B0];
}

- (id)accessibilityLabel
{
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AVTSimpleAvatarPickerHeaderViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("currentSymbolName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("ellipsis")))
  {
    v4 = CFSTR("more.options");
  }
  else
  {
    if (!objc_msgSend(v3, "isEqualToString:", CFSTR("plus")))
    {
      v8.receiver = self;
      v8.super_class = (Class)AVTSimpleAvatarPickerHeaderViewAccessibility;
      -[AVTSimpleAvatarPickerHeaderViewAccessibility accessibilityLabel](&v8, sel_accessibilityLabel);
      v5 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    }
    v4 = CFSTR("starfish.add");
  }
  accessibilityLocalizedString(v4);
  v5 = objc_claimAutoreleasedReturnValue();
LABEL_7:
  v6 = (void *)v5;

  return v6;
}

@end

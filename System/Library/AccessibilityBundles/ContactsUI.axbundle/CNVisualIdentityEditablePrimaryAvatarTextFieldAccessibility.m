@implementation CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CNVisualIdentityEditablePrimaryAvatarTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsTextEditable
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsTextEditable:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (BOOL)_axIsEmoji
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsEmoji:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axColorName
{
  JUMPOUT(0x23490B9A0);
}

- (void)_axSetColorName:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)accessibilityLabel
{
  _BOOL4 v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  if (-[CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility _axIsTextEditable](self, "_axIsTextEditable"))
  {
    v3 = -[CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility _axIsEmoji](self, "_axIsEmoji");
    v4 = (void *)MEMORY[0x24BDD17C8];
    if (v3)
      v5 = CFSTR("emoji.description.button");
    else
      v5 = CFSTR("monogram.description.button");
    accessibilityLocalizedString(v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility _axColorName](self, "_axColorName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", v7, v8, v9);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    accessibilityLocalizedString(CFSTR("contact.image.type.photo"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (unint64_t)accessibilityTraits
{
  objc_super v4;

  if (!-[CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility _axIsTextEditable](self, "_axIsTextEditable"))
    return *MEMORY[0x24BDF73C8];
  v4.receiver = self;
  v4.super_class = (Class)CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility;
  return -[CNVisualIdentityEditablePrimaryAvatarTextFieldAccessibility accessibilityTraits](&v4, sel_accessibilityTraits);
}

@end

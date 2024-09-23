@implementation SBFolderTitleTextFieldAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SBFolderTitleTextField");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  objc_msgSend(a3, "validateClass:hasInstanceVariable:withType:", CFSTR("SBFolderTitleTextField"), CFSTR("_showingEditUI"), "B");
}

- (id)accessibilityLabel
{
  void *v2;

  if (-[SBFolderTitleTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showingEditUI")))
  {
    accessibilityLocalizedString(CFSTR("folder.name.textfield"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (BOOL)_accessibilityServesAsFirstElement
{
  return 1;
}

- (id)accessibilityIdentifier
{
  void *v2;
  void *v3;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SBFolderTitleTextFieldAccessibility;
  -[SBFolderTitleTextFieldAccessibility accessibilityValue](&v6, sel_accessibilityValue);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("folder.name.textfield"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilitySupportsHandwriting
{
  unint64_t v3;
  objc_super v5;

  if (-[SBFolderTitleTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showingEditUI")))
  {
    v3 = -[SBFolderTitleTextFieldAccessibility accessibilityTraits](self, "accessibilityTraits");
    if ((*MEMORY[0x24BEBB128] & ~v3) == 0)
      return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)SBFolderTitleTextFieldAccessibility;
  return -[SBFolderTitleTextFieldAccessibility _accessibilitySupportsHandwriting](&v5, sel__accessibilitySupportsHandwriting);
}

- (unint64_t)accessibilityTraits
{
  id v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)SBFolderTitleTextFieldAccessibility;
  v3 = -[SBFolderTitleTextFieldAccessibility accessibilityTraits](&v5, sel_accessibilityTraits);
  if ((-[SBFolderTitleTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showingEditUI")) & 1) == 0)
    return *MEMORY[0x24BDF73C0] | _AXTraitsRemoveTrait();
  return (unint64_t)v3;
}

- (BOOL)_accessibilityOverridesInstructionsHint
{
  return 1;
}

- (id)accessibilityHint
{
  void *v3;
  int v4;
  __CFString *v5;
  void *v6;

  if ((-[SBFolderTitleTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditing")) & 1) != 0)
    goto LABEL_7;
  -[SBFolderTitleTextFieldAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearButtonMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "intValue");

  if (v4 != 3)
  {
    if (-[SBFolderTitleTextFieldAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isEditable")))
    {
      v5 = CFSTR("folder.name.enter.edit.mode.hint");
      goto LABEL_6;
    }
LABEL_7:
    v6 = 0;
    return v6;
  }
  v5 = CFSTR("folder.name.enter.edit.textfield.hint");
LABEL_6:
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  return v6;
}

@end

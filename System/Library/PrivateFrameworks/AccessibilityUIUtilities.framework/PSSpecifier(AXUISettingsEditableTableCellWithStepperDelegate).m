@implementation PSSpecifier(AXUISettingsEditableTableCellWithStepperDelegate)

- (uint64_t)ax_stepperDelegate
{
  return __UIAccessibilityGetAssociatedNonRetainedObject();
}

- (uint64_t)ax_setStepperDelegate:()AXUISettingsEditableTableCellWithStepperDelegate
{
  return __UIAccessibilitySetAssociatedNonRetainedObject();
}

+ (id)ax_stepperSpecifierWithDelegate:()AXUISettingsEditableTableCellWithStepperDelegate
{
  void *v3;

  objc_msgSend(MEMORY[0x1E0D804E8], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, a3, 0, sel_stringValueForSpecifier_, 0, 4, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x1E0D80780]);
  return v3;
}

@end

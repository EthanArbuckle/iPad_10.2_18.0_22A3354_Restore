@implementation HKMedicalIDEditorHeightCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDEditorHeightCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMedicalIDEditorHeightCell"), CFSTR("_picker"), "UIPickerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorHeightCell"), CFSTR("_showPicker"), "v", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKMedicalIDEditorHeightCell"), CFSTR("HKMedicalIDEditorCell"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorCell"), CFSTR("inputTextField"), "@", 0);

}

- (void)_showPicker
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  _QWORD v6[5];
  char v7;

  v7 = 0;
  -[HKMedicalIDEditorHeightCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inputTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityValueChangesAreReplacements:", 1);
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke;
  v6[3] = &unk_25022ACE0;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke_2;
  v5[3] = &unk_25022AD08;
  AXMoveFocusToPicker(v6, v5);
}

id __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HKMedicalIDEditorHeightCellAccessibility;
  return objc_msgSendSuper2(&v2, sel__showPicker);
}

uint64_t __55__HKMedicalIDEditorHeightCellAccessibility__showPicker__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_picker"));
}

@end

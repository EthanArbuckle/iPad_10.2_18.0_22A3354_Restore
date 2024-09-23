@implementation HKMedicalIDEditorPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDEditorPickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorPickerCell"), CFSTR("_showPicker"), "v", 0);
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("HKMedicalIDEditorPickerCell"), CFSTR("UIPickerViewDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorPickerCell"), CFSTR("pickerView: titleForRow: forComponent:"), "@", "@", "q", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMedicalIDEditorPickerCell"), CFSTR("_picker"), "UIPickerView");
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HKMedicalIDEditorPickerCell"), CFSTR("HKMedicalIDEditorCell"));
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
  -[HKMedicalIDEditorPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("inputTextField"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "setAccessibilityValueChangesAreReplacements:", 1);
  v5[4] = self;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke;
  v6[3] = &unk_25022ACE0;
  v6[4] = self;
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke_2;
  v5[3] = &unk_25022AD08;
  AXMoveFocusToPicker(v6, v5);
}

id __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke(uint64_t a1)
{
  objc_super v2;

  v2.receiver = *(id *)(a1 + 32);
  v2.super_class = (Class)HKMedicalIDEditorPickerCellAccessibility;
  return objc_msgSendSuper2(&v2, sel__showPicker);
}

uint64_t __55__HKMedicalIDEditorPickerCellAccessibility__showPicker__block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_picker"));
}

- (id)pickerView:(id)a3 titleForRow:(int64_t)a4 forComponent:(int64_t)a5
{
  id v6;
  id v7;
  id v8;
  void *v9;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  v6 = a3;
  AXPerformSafeBlock();
  v7 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  -[HKMedicalIDEditorPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_picker"));
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8 == v6)
  {
    AXBloodTypeStringFromString(v7, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setAccessibilityLabel:", v9);

  }
  return v7;
}

void __80__HKMedicalIDEditorPickerCellAccessibility_pickerView_titleForRow_forComponent___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  objc_super v8;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 56);
  v4 = *(_QWORD *)(a1 + 64);
  v8.receiver = *(id *)(a1 + 40);
  v8.super_class = (Class)HKMedicalIDEditorPickerCellAccessibility;
  objc_msgSendSuper2(&v8, sel_pickerView_titleForRow_forComponent_, v2, v3, v4);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

}

@end

@implementation AKCandidatePickerView_iOSAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AKCandidatePickerView_iOS");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKCandidatePickerView_iOS"), CFSTR("_createButtonsWithBlurStyle:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKCandidatePickerView_iOS"), CFSTR("_selectBackground: animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKCandidatePickerView_iOS"), CFSTR("annotations"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AKCandidatePickerView_iOS"), CFSTR("buttons"), "@", 0);

}

- (void)_createButtonsWithBlurStyle:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  char v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AKCandidatePickerView_iOSAccessibility;
  -[AKCandidatePickerView_iOSAccessibility _createButtonsWithBlurStyle:](&v12, sel__createButtonsWithBlurStyle_, a3);
  objc_opt_class();
  -[AKCandidatePickerView_iOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotations"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = 0;
  objc_opt_class();
  -[AKCandidatePickerView_iOSAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("buttons"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __70__AKCandidatePickerView_iOSAccessibility__createButtonsWithBlurStyle___block_invoke;
  v9[3] = &unk_25014EDB0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v9);

}

- (void)_selectBackground:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v5;
  objc_super v6;

  v4 = a4;
  v6.receiver = self;
  v6.super_class = (Class)AKCandidatePickerView_iOSAccessibility;
  v5 = a3;
  -[AKCandidatePickerView_iOSAccessibility _selectBackground:animated:](&v6, sel__selectBackground_animated_, v5, v4);
  objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0], v6.receiver, v6.super_class);

}

@end

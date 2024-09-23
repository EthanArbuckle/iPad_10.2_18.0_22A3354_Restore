@implementation HKMedicalIDEditorNameAndPhotoCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HKMedicalIDEditorNameAndPhotoCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("HKMedicalIDEditorNameAndPhotoCell"), CFSTR("_editPhotoButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorNameAndPhotoCell"), CFSTR("photo"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HKMedicalIDEditorNameAndPhotoCell"), CFSTR("setPhoto:"), "v", "@", 0);

}

- (HKMedicalIDEditorNameAndPhotoCellAccessibility)initWithStyle:(int64_t)a3 reuseIdentifier:(id)a4
{
  HKMedicalIDEditorNameAndPhotoCellAccessibility *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HKMedicalIDEditorNameAndPhotoCellAccessibility;
  v4 = -[HKMedicalIDEditorNameAndPhotoCellAccessibility initWithStyle:reuseIdentifier:](&v6, sel_initWithStyle_reuseIdentifier_, a3, a4);
  -[HKMedicalIDEditorNameAndPhotoCellAccessibility _accessibilityLoadAccessibilityInformation](v4, "_accessibilityLoadAccessibilityInformation");
  return v4;
}

- (BOOL)_accessibilityIgnoreInternalLabels
{
  return 1;
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)HKMedicalIDEditorNameAndPhotoCellAccessibility;
  -[HKMedicalIDEditorNameAndPhotoCellAccessibility _accessibilityLoadAccessibilityInformation](&v11, sel__accessibilityLoadAccessibilityInformation);
  -[HKMedicalIDEditorNameAndPhotoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("photo"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKMedicalIDEditorNameAndPhotoCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_editPhotoButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v4, "_accessibilityPhotoDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0]);
    accessibilityLocalizedString(CFSTR("medical.id.photo"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v9, v7, CFSTR("__AXStringForVariablesSentinel"));

    accessibilityLocalizedString(CFSTR("medicalid.edit.photo.hint"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityHint:", v10);

  }
  else
  {
    objc_msgSend(v5, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
    objc_msgSend(v6, "setAccessibilityHint:", 0);
    accessibilityLocalizedString(CFSTR("add.photo"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAccessibilityLabel:", v7);
  }

}

- (void)setPhoto:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)HKMedicalIDEditorNameAndPhotoCellAccessibility;
  -[HKMedicalIDEditorNameAndPhotoCellAccessibility setPhoto:](&v4, sel_setPhoto_, a3);
  -[HKMedicalIDEditorNameAndPhotoCellAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end

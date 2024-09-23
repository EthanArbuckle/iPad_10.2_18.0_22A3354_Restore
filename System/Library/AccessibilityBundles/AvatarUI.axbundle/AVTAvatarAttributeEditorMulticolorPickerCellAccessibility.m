@implementation AVTAvatarAttributeEditorMulticolorPickerCellAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("AVTAvatarAttributeEditorMulticolorPickerCell");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorMulticolorPickerCell"), CFSTR("item"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorMulticolorPickerSectionItem"), CFSTR("colorItem"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorSectionColorItem"), CFSTR("color"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTCoreModelColor"), CFSTR("localizedName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AVTAvatarAttributeEditorMulticolorPickerCell"), CFSTR("clearButton"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return (id)-[AVTAvatarAttributeEditorMulticolorPickerCellAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("label"));
}

- (id)accessibilityValue
{
  void *v2;
  void *v3;

  -[AVTAvatarAttributeEditorMulticolorPickerCellAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("item.colorItem.color"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeStringForKey:", CFSTR("localizedName"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)AVTAvatarAttributeEditorMulticolorPickerCellAccessibility;
  -[AVTAvatarAttributeEditorMulticolorPickerCellAccessibility accessibilityCustomActions](&v17, sel_accessibilityCustomActions);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "mutableCopy");

  if (!v4)
    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  LOBYTE(location) = 0;
  objc_opt_class();
  -[AVTAvatarAttributeEditorMulticolorPickerCellAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("clearButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    objc_initWeak(&location, v6);
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    v8 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("clear.memoji.trait"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[AVTAvatarAttributeEditorMulticolorPickerCellAccessibility accessibilityLabel](self, "accessibilityLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringWithFormat:", v9, v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __87__AVTAvatarAttributeEditorMulticolorPickerCellAccessibility_accessibilityCustomActions__block_invoke;
    v14[3] = &unk_250182230;
    objc_copyWeak(&v15, &location);
    v12 = (void *)objc_msgSend(v7, "initWithName:actionHandler:", v11, v14);

    objc_msgSend(v4, "addObject:", v12);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }

  return v4;
}

uint64_t __87__AVTAvatarAttributeEditorMulticolorPickerCellAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "sendActionsForControlEvents:", 64);

  return 1;
}

@end

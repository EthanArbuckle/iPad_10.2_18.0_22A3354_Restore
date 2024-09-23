@implementation TKTonePickerViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("TKTonePickerViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("TKTonePickerViewController"), CFSTR("UITableViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("TKTonePickerViewController"), CFSTR("_configureTextColorOfLabelInCell:shouldTintText:checked:"), "v", "@", "B", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  char v14;
  objc_super v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v15.receiver = self;
  v15.super_class = (Class)TKTonePickerViewControllerAccessibility;
  -[TKTonePickerViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v15, sel__accessibilityLoadAccessibilityInformation);
  v14 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tableView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = 0u;
  v13 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(v4, "visibleCells", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        -[TKTonePickerViewControllerAccessibility _axUpdateCell:](self, "_axUpdateCell:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * i));
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v16, 16);
    }
    while (v7);
  }

}

- (void)_configureTextColorOfLabelInCell:(id)a3 shouldTintText:(BOOL)a4 checked:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  id v8;
  objc_super v9;

  v5 = a5;
  v6 = a4;
  v9.receiver = self;
  v9.super_class = (Class)TKTonePickerViewControllerAccessibility;
  v8 = a3;
  -[TKTonePickerViewControllerAccessibility _configureTextColorOfLabelInCell:shouldTintText:checked:](&v9, sel__configureTextColorOfLabelInCell_shouldTintText_checked_, v8, v6, v5);
  -[TKTonePickerViewControllerAccessibility _axUpdateCell:](self, "_axUpdateCell:", v8, v9.receiver, v9.super_class);

}

- (void)_axUpdateCell:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  v3 = objc_msgSend(v7, "accessibilityTraits");
  objc_msgSend(v7, "imageView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "image");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v6 = *MEMORY[0x24BDF7400] | v3;
  else
    v6 = v3 & ~*MEMORY[0x24BDF7400];
  objc_msgSend(v7, "setAccessibilityTraits:", v6);

}

@end

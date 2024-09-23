@implementation HSPCPasscodeEntryViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("HSPCPasscodeEntryView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("HSPCPasscodeEntryView"), CFSTR("UIControl"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCPasscodeEntryView"), CFSTR("insertText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCPasscodeEntryView"), CFSTR("deleteBackward"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCPasscodeEntryView"), CFSTR("text"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("HSPCPasscodeEntryView"), CFSTR("numberOfDigits"), "Q", 0);

}

- (id)_axText
{
  return (id)-[HSPCPasscodeEntryViewAccessibility safeStringForKey:](self, "safeStringForKey:", CFSTR("text"));
}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  return accessibilityLocalizedString(CFSTR("setupcode.field.label"));
}

- (unint64_t)accessibilityTraits
{
  unint64_t v2;
  uint64_t v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HSPCPasscodeEntryViewAccessibility;
  v2 = -[HSPCPasscodeEntryViewAccessibility accessibilityTraits](&v8, sel_accessibilityTraits);
  v3 = *MEMORY[0x24BEBB198];
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 | v2;
  LODWORD(v2) = objc_msgSend(v4, "isFirstResponder");

  v6 = *MEMORY[0x24BEBB128];
  if (!(_DWORD)v2)
    v6 = 0;
  return v5 | v6;
}

- (id)accessibilityValue
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BDFEA60]);
  -[HSPCPasscodeEntryViewAccessibility _axText](self, "_axText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithString:", v4);

  v8 = *MEMORY[0x24BDFEC78];
  v9[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, &v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAttributes:", v6);

  return v5;
}

- (void)insertText:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  objc_super v13;

  v4 = a3;
  -[HSPCPasscodeEntryViewAccessibility _axText](self, "_axText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  v13.receiver = self;
  v13.super_class = (Class)HSPCPasscodeEntryViewAccessibility;
  -[HSPCPasscodeEntryViewAccessibility insertText:](&v13, sel_insertText_, v4);
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HSPCPasscodeEntryViewAccessibility safeIntegerForKey:](self, "safeIntegerForKey:", CFSTR("numberOfDigits"));
  if (objc_msgSend(v7, "length"))
    v9 = v6 < v8;
  else
    v9 = 0;
  if (v9)
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v7);
  -[HSPCPasscodeEntryViewAccessibility _axText](self, "_axText");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "length");

  if (v11 == v8)
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BEBAFE0], 0);
    v12 = dispatch_time(0, 750000000);
    dispatch_after(v12, MEMORY[0x24BDAC9B8], &__block_literal_global_0);
  }

}

void __49__HSPCPasscodeEntryViewAccessibility_insertText___block_invoke()
{
  UIAccessibilityNotifications v0;
  id v1;

  v0 = *MEMORY[0x24BDF71E8];
  accessibilityLocalizedString(CFSTR("setupcode.completed.manual.entry"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v0, v1);

}

- (void)deleteBackward
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  UIAccessibilityNotifications v7;
  objc_super v8;

  -[HSPCPasscodeEntryViewAccessibility _axText](self, "_axText");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)HSPCPasscodeEntryViewAccessibility;
  -[HSPCPasscodeEntryViewAccessibility deleteBackward](&v8, sel_deleteBackward);
  if (objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "substringWithRange:", objc_msgSend(v3, "length") - 1, 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }
  v5 = objc_msgSend(v4, "length");
  if (v5)
    v6 = v4;
  else
    v6 = 0;
  if (v5)
    v7 = *MEMORY[0x24BDF71E8];
  else
    v7 = *MEMORY[0x24BEBAFE0];
  UIAccessibilityPostNotification(v7, v6);

}

@end

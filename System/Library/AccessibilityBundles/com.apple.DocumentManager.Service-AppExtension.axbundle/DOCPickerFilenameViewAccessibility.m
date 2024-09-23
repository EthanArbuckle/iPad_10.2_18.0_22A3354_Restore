@implementation DOCPickerFilenameViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCPickerFilenameView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCPickerFilenameView"), CFSTR("updateTagButtonAccessibility:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCPickerFilenameView"), CFSTR("tags"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCPickerFilenameView"), CFSTR("tagButton"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)DOCPickerFilenameViewAccessibility;
  -[DOCPickerFilenameViewAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  objc_opt_class();
  -[DOCPickerFilenameViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tagButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[DOCPickerFilenameViewAccessibility updateTagButtonAccessibility:](self, "updateTagButtonAccessibility:", v4);
}

- (void)updateTagButtonAccessibility:(id)a3
{
  id v4;
  __CFString *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[DOCPickerFilenameViewAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("tags"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    v5 = CFSTR("Tags");
  else
    v5 = CFSTR("Add Tags");
  accessibilityLocalizedString(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v6);

}

@end

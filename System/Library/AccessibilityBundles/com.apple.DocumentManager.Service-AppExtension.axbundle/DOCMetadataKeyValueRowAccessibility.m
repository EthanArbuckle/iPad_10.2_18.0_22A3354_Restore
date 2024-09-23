@implementation DOCMetadataKeyValueRowAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("com_apple_DocumentManager_Service.DOCMetadataKeyValueRow");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCMetadataKeyValueRow"), CFSTR("accessibilityElementWithLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("com_apple_DocumentManager_Service.DOCMetadataKeyValueRow"), CFSTR("accessibilityElementWithValue"), "@", 0);

}

- (BOOL)isAccessibilityElement
{
  return 1;
}

- (id)accessibilityLabel
{
  void *v3;
  id v4;
  void *v5;
  objc_super v7;

  -[DOCMetadataKeyValueRowAccessibility _accessibilityStringForLabelKeyValues:](self, "_accessibilityStringForLabelKeyValues:", CFSTR("accessibilityElementWithLabel, accessibilityElementWithValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)DOCMetadataKeyValueRowAccessibility;
    -[DOCMetadataKeyValueRowAccessibility accessibilityLabel](&v7, sel_accessibilityLabel);
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  return v5;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v8.receiver = self;
  v8.super_class = (Class)DOCMetadataKeyValueRowAccessibility;
  -[DOCMetadataKeyValueRowAccessibility accessibilityCustomActions](&v8, sel_accessibilityCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[DOCMetadataKeyValueRowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityElementWithValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "accessibilityCustomActions");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v6);

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  char v3;

  -[DOCMetadataKeyValueRowAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityElementWithValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "accessibilityActivate");

  return v3;
}

@end

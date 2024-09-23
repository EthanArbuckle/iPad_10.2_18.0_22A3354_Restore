@implementation ENUILegalDocumentViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ENUILegalDocumentViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ENUILegalDocumentViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ENUILegalDocumentViewController"), CFSTR("legalTextView"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ENUILegalDocumentViewControllerAccessibility;
  -[ENUILegalDocumentViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[ENUILegalDocumentViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("view"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __90__ENUILegalDocumentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v4[3] = &unk_2502056A0;
  v4[4] = self;
  objc_msgSend(v3, "_setAccessibilityElementsBlock:", v4);

}

id __90__ENUILegalDocumentViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;

  v1 = (void *)MEMORY[0x24BDBCE30];
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("legalTextView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "axArrayByIgnoringNilElementsWithCount:", 1, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

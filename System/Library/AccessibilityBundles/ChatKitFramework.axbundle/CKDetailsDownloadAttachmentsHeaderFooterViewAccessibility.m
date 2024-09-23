@implementation CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsDownloadAttachmentsHeaderFooterView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("CKDetailsDownloadAttachmentsHeaderFooterView"), CFSTR("_buttonTextView"), "UITextView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsDownloadAttachmentsHeaderFooterView"), CFSTR("initWithReuseIdentifier:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsDownloadAttachmentsHeaderFooterView"), CFSTR("handleUserTap:"), "v", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  uint64_t v4;
  _QWORD v5[4];
  id v6;
  id location;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility;
  -[CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility _accessibilityLoadAccessibilityInformation](&v8, sel__accessibilityLoadAccessibilityInformation);
  objc_initWeak(&location, self);
  -[CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("_buttonTextView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setIsAccessibilityElement:", 1);
  v4 = objc_msgSend(v3, "accessibilityTraits");
  objc_msgSend(v3, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0] | v4);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __103__CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v5[3] = &unk_2501B1C70;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v3, "_setAccessibilityActivateBlock:", v5);
  objc_destroyWeak(&v6);

  objc_destroyWeak(&location);
}

uint64_t __103__CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  id v2;

  objc_copyWeak(&v2, (id *)(a1 + 32));
  AXPerformSafeBlock();
  objc_destroyWeak(&v2);
  return 1;
}

void __103__CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "handleUserTap:", 0);

}

- (CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility)initWithReuseIdentifier:(id)a3
{
  CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility;
  v3 = -[CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility initWithReuseIdentifier:](&v5, sel_initWithReuseIdentifier_, a3);
  -[CKDetailsDownloadAttachmentsHeaderFooterViewAccessibility _accessibilityLoadAccessibilityInformation](v3, "_accessibilityLoadAccessibilityInformation");
  return v3;
}

@end

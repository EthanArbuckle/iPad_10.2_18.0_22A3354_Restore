@implementation CKDetailsControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKDetailsController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKDetailsController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasProperty:withType:", CFSTR("CKDetailsController"), CFSTR("tableView"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsController"), CFSTR("screenShareContextButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsController"), CFSTR("groupPhotoHeaderViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CNGroupIdentityHeaderViewController"), CFSTR("actionButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsController"), CFSTR("locationSendOrRequestCell"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKDetailsController"), CFSTR("locationStartShareCell"), "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CKDetailsControllerAccessibility;
  -[CKDetailsControllerAccessibility _accessibilityLoadAccessibilityInformation](&v5, sel__accessibilityLoadAccessibilityInformation);
  -[CKDetailsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("tableView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("details.table.label"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAccessibilityLabel:", v4);

}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  objc_super v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  id v13;
  CKDetailsControllerAccessibility *v14;
  char v15;

  -[CKDetailsControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("rightBarButtonItem"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __62__CKDetailsControllerAccessibility_accessibilityPerformEscape__block_invoke;
    v12 = &unk_2501B1CE0;
    v13 = v5;
    v14 = self;
    AXPerformSafeBlock();

    v6 = 1;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKDetailsControllerAccessibility;
    v6 = -[CKDetailsControllerAccessibility accessibilityPerformEscape](&v8, sel_accessibilityPerformEscape);
  }

  return v6;
}

void __62__CKDetailsControllerAccessibility_accessibilityPerformEscape__block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "target");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "performSelectorOnMainThread:withObject:waitUntilDone:", objc_msgSend(*(id *)(a1 + 32), "action"), *(_QWORD *)(a1 + 40), 0);

}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CKDetailsControllerAccessibility;
  -[CKDetailsControllerAccessibility loadView](&v3, sel_loadView);
  -[CKDetailsControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)locationSendOrRequestCell
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsControllerAccessibility;
  -[CKDetailsControllerAccessibility locationSendOrRequestCell](&v4, sel_locationSendOrRequestCell);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  return v2;
}

- (id)locationStartShareCell
{
  void *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CKDetailsControllerAccessibility;
  -[CKDetailsControllerAccessibility locationStartShareCell](&v4, sel_locationStartShareCell);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  return v2;
}

@end

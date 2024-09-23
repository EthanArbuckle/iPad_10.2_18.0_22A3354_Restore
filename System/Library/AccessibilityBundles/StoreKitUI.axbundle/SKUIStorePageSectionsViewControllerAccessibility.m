@implementation SKUIStorePageSectionsViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("SKUIStorePageSectionsViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("SKUIStorePageSectionsViewController"), CFSTR("loadView"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("SKUIStorePageSectionsViewController"), CFSTR("_collectionView"), "SKUICollectionView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("UIViewController"), CFSTR("_title"), "NSString");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)SKUIStorePageSectionsViewControllerAccessibility;
  -[SKUIStorePageSectionsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v6, sel__accessibilityLoadAccessibilityInformation);
  -[SKUIStorePageSectionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_collectionView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  -[SKUIStorePageSectionsViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_title"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setAccessibilityLabel:", v5);
}

- (void)loadView
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SKUIStorePageSectionsViewControllerAccessibility;
  -[SKUIStorePageSectionsViewControllerAccessibility loadView](&v3, sel_loadView);
  -[SKUIStorePageSectionsViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

@end

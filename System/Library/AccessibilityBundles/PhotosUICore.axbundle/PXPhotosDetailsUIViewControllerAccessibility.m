@implementation PXPhotosDetailsUIViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("PXPhotosDetailsUIViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXUIScrollViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXPhotosDetailsUIViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsUIViewController"), CFSTR("_scrollViewController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsUIViewController"), CFSTR("_widgets"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXUIScrollViewController"), CFSTR("_scrollView"), "_PXUIScrollView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsUIViewController"), CFSTR("_loadWidgets"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsUIViewController"), CFSTR("_ensureScrollViewController"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXPhotosDetailsUIViewController"), CFSTR("widgetComposition:requestViewControllerDismissalAnimated:"), "@", "B", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  char v18;
  objc_super v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v19.receiver = self;
  v19.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  -[PXPhotosDetailsUIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v19, sel__accessibilityLoadAccessibilityInformation);
  -[PXPhotosDetailsUIViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_scrollViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MEMORY[0x2348C1678](CFSTR("PXUIScrollViewController"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = v3;
    objc_msgSend(v4, "safeValueForKey:", CFSTR("_scrollView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "accessibilitySetIdentification:", CFSTR("AXPhotoDetailsScrollView"));
    objc_msgSend(v4, "accessibilitySetIdentification:", CFSTR("AXPhotosDetailsUIViewController"));
    v18 = 0;
    objc_opt_class();
    -[PXPhotosDetailsUIViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("navigationController"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "_axAdjustScrollViewInsetsWithNavController:", v7);
  }
  -[PXPhotosDetailsUIViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_widgets"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "conformsToProtocol:", &unk_255EB0500))
          objc_msgSend(v13, "_accessibilityLoadAccessibilityInformation");
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v20, 16);
    }
    while (v10);
  }

}

- (void)_loadWidgets
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  -[PXPhotosDetailsUIViewControllerAccessibility _loadWidgets](&v3, sel__loadWidgets);
  -[PXPhotosDetailsUIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_ensureScrollViewController
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  -[PXPhotosDetailsUIViewControllerAccessibility _ensureScrollViewController](&v3, sel__ensureScrollViewController);
  -[PXPhotosDetailsUIViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (id)_axDetailsDismissedBlock
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAXDetailsDismissedBlock:(id)a3
{
  id v3;

  v3 = (id)MEMORY[0x2348C19FC](a3, a2);
  __UIAccessibilitySetAssociatedObject();

}

- (void)_axSetDetailsDismissedBlock:(id)a3
{
  id v4;

  v4 = (id)objc_msgSend(a3, "copy");
  -[PXPhotosDetailsUIViewControllerAccessibility _setAXDetailsDismissedBlock:](self, "_setAXDetailsDismissedBlock:", v4);

}

- (BOOL)widgetComposition:(id)a3 requestViewControllerDismissalAnimated:(BOOL)a4
{
  _BOOL4 v5;
  uint64_t v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PXPhotosDetailsUIViewControllerAccessibility;
  v5 = -[PXPhotosDetailsUIViewControllerAccessibility widgetComposition:requestViewControllerDismissalAnimated:](&v9, sel_widgetComposition_requestViewControllerDismissalAnimated_, a3, a4);
  -[PXPhotosDetailsUIViewControllerAccessibility _axDetailsDismissedBlock](self, "_axDetailsDismissedBlock");
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)v6;
  if (v6 && v5)
    (*(void (**)(uint64_t))(v6 + 16))(v6);

  return v5;
}

@end

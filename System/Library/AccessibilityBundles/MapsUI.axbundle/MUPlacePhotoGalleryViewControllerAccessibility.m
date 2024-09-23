@implementation MUPlacePhotoGalleryViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MUPlacePhotoGalleryViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("scrollView"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItemPhoto"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItemPhoto"), CFSTR("subtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("_photoViews"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("_photos"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("rapBarButtonView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("currentPhoto"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItemPhoto"), CFSTR("attribution"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_MKMapItemPhotosAttribution"), CFSTR("_MKMapItemAttribution"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKMapItemAttribution"), CFSTR("providerName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("attributionView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoGalleryAttributionView"), CFSTR("accessoryButton"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MUPlacePhotoGalleryViewController"), CFSTR("downloadImageForVisibleViews"), "v", 0);

}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MUPlacePhotoGalleryViewControllerAccessibility;
  -[MUPlacePhotoGalleryViewControllerAccessibility viewWillAppear:](&v4, sel_viewWillAppear_, a3);
  -[MUPlacePhotoGalleryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  id obj;
  _QWORD v18[4];
  id v19;
  uint64_t v20;
  uint64_t v21;
  void (*v22)(uint64_t);
  void *v23;
  id v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  objc_super v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v37.receiver = self;
  v37.super_class = (Class)MUPlacePhotoGalleryViewControllerAccessibility;
  -[MUPlacePhotoGalleryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v37, sel__accessibilityLoadAccessibilityInformation);
  -[MUPlacePhotoGalleryViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("scrollView"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setIsAccessibilityOpaqueElementProvider:", 1);
  -[MUPlacePhotoGalleryViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_photoViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = 0u;
  v36 = 0u;
  v33 = 0u;
  v34 = 0u;
  -[MUPlacePhotoGalleryViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_photos"));
  obj = (id)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v3)
  {
    v4 = 0;
    v5 = *(_QWORD *)v34;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v34 != v5)
          objc_enumerationMutation(obj);
        v7 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v6);
        v27 = 0;
        v28 = &v27;
        v29 = 0x3032000000;
        v30 = __Block_byref_object_copy_;
        v31 = __Block_byref_object_dispose_;
        v32 = 0;
        v20 = MEMORY[0x24BDAC760];
        v21 = 3221225472;
        v22 = __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
        v23 = &unk_25026A098;
        v25 = &v27;
        v24 = v2;
        v26 = v4 + v6;
        AXPerformSafeBlock();
        v8 = (id)v28[5];

        _Block_object_dispose(&v27, 8);
        objc_msgSend(v7, "safeStringForKey:", CFSTR("title"));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safeStringForKey:", CFSTR("subtitle"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "setAccessibilityLabel:", v11, v10, CFSTR("__AXStringForVariablesSentinel"));

        ++v6;
      }
      while (v3 != v6);
      v3 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
      v4 += v6;
    }
    while (v3);
  }

  -[MUPlacePhotoGalleryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("rapBarButtonView"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("REPORT_A_PROBLEM"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityLabel:", v13);

  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2;
  v18[3] = &unk_25026A0C0;
  v19 = v12;
  v14 = v12;
  objc_msgSend(v14, "_setAccessibilityValueBlock:", v18);
  -[MUPlacePhotoGalleryViewControllerAccessibility _accessibilityLabelAttributionButton](self, "_accessibilityLabelAttributionButton");

}

void __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "objectAtIndexedSubscript:", *(_QWORD *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

id __92__MUPlacePhotoGalleryViewControllerAccessibility__accessibilityLoadAccessibilityInformation__block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "customView");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    accessibilityLocalizedString(CFSTR("REPORT_A_PROBLEM_LOADING"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)downloadImageForVisibleViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MUPlacePhotoGalleryViewControllerAccessibility;
  -[MUPlacePhotoGalleryViewControllerAccessibility downloadImageForVisibleViews](&v3, sel_downloadImageForVisibleViews);
  -[MUPlacePhotoGalleryViewControllerAccessibility _accessibilityLoadAccessibilityInformation](self, "_accessibilityLoadAccessibilityInformation");
}

- (void)_accessibilityLabelAttributionButton
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  -[MUPlacePhotoGalleryViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentPhoto"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("attribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("providerName"));
  v7 = (id)objc_claimAutoreleasedReturnValue();

  -[MUPlacePhotoGalleryViewControllerAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("attributionView"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeUIViewForKey:", CFSTR("accessoryButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v7);

}

@end

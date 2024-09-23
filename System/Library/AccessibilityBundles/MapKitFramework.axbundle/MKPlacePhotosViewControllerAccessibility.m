@implementation MKPlacePhotosViewControllerAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKPlacePhotosViewController");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MKPlacePhotosViewController"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_mapItem"), "MKMapItem");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_externalView"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_photoViews"), "NSArray");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_photosContainer"), "UIView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_previousPageButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_nextPageButton"), "UIButton");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKPlacePhotosViewController"), CFSTR("_createImageViews"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKPlacePhotosViewController"), CFSTR("_canUseFullscreenViewer"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapItem"), CFSTR("_photosAttribution"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("_MKMapItemPhotosAttribution"), CFSTR("_MKMapItemAttribution"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("_MKMapItemAttribution"), CFSTR("providerName"), "@", 0);

}

- (id)_axPhotoViews
{
  return (id)-[MKPlacePhotosViewControllerAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("_photoViews"));
}

- (void)_axAnnotateViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_opt_class();
  -[MKPlacePhotosViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_previousPageButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  -[MKPlacePhotosViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_nextPageButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  AXMapKitLocString(CFSTR("PREVIOUS_PAGE"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAccessibilityLabel:", v7);

  AXMapKitLocString(CFSTR("NEXT_PAGE"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityLabel:", v8);

}

- (void)_axAnnotateImageViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  uint64_t v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  MKPlacePhotosViewControllerAccessibility *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  char v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v30 = 0;
  objc_opt_class();
  v25 = self;
  -[MKPlacePhotosViewControllerAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapItem"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("_photosAttribution"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("providerName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v23 = v6;
  if (objc_msgSend(v6, "length"))
  {
    v7 = (void *)MEMORY[0x24BDD17C8];
    AXMapKitLocString(CFSTR("REVIEW_PHOTO_WITH_PROVIDER_FORMAT"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", v8, v6, v6);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    AXMapKitLocString(CFSTR("REVIEW_PHOTO"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();
  }
  -[MKPlacePhotosViewControllerAccessibility _axPhotoViews](v25, "_axPhotoViews");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v27;
    v13 = *MEMORY[0x24BDF73C8];
    v14 = *MEMORY[0x24BDF73B0];
    v15 = *MEMORY[0x24BDF73D8];
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v27 != v12)
          objc_enumerationMutation(v9);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v17, "setIsAccessibilityElement:", 1);
          objc_msgSend(v17, "setAccessibilityLabel:", v24);
          if (-[MKPlacePhotosViewControllerAccessibility safeBoolForKey:](v25, "safeBoolForKey:", CFSTR("_canUseFullscreenViewer")))v18 = v14;
          else
            v18 = v15;
          objc_msgSend(v17, "setAccessibilityTraits:", v18 | v13);
        }
      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    }
    while (v11);
  }
  v19 = v9;
  -[MKPlacePhotosViewControllerAccessibility safeValueForKey:](v25, "safeValueForKey:", CFSTR("_externalView"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v19;
  if (v20)
  {
    v21 = (void *)objc_msgSend(v19, "mutableCopy");
    objc_msgSend(v21, "insertObject:atIndex:", v20, 0);

  }
  -[MKPlacePhotosViewControllerAccessibility safeUIViewForKey:](v25, "safeUIViewForKey:", CFSTR("_photosContainer"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setAccessibilityElements:", v21);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewControllerAccessibility;
  -[MKPlacePhotosViewControllerAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MKPlacePhotosViewControllerAccessibility _axAnnotateImageViews](self, "_axAnnotateImageViews");
  -[MKPlacePhotosViewControllerAccessibility _axAnnotateViews](self, "_axAnnotateViews");
}

- (void)_createImageViews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKPlacePhotosViewControllerAccessibility;
  -[MKPlacePhotosViewControllerAccessibility _createImageViews](&v3, sel__createImageViews);
  -[MKPlacePhotosViewControllerAccessibility _axAnnotateImageViews](self, "_axAnnotateImageViews");
}

@end

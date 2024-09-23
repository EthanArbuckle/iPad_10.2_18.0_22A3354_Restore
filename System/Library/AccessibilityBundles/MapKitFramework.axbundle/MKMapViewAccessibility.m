@implementation MKMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKMapView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_setCompassVisible:animationAllowed:force:"), "v", "B", "B", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_mapLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_didEndZoom"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKMapView"), CFSTR("_basicMapView"), "MKBasicMapView");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKMapView"), CFSTR("_showsZoomControls"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKMapView"), CFSTR("_compassVisible"), "B");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKMapView"), CFSTR("_compassView"), "UIView<MKCompassView>");
  objc_msgSend(v3, "validateClass:", CFSTR("MKAttributionLabel"));

}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  id v19;
  id v20;
  id v21;
  void *v22;
  id v23;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(id *, void *);
  void *v28;
  id v29;
  id v30;
  id v31;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  char v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v37 = 0;
  objc_opt_class();
  -[MKMapViewAccessibility _axMapsDelegate](self, "_axMapsDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("chromeViewController"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  objc_msgSend(v6, "childViewControllers");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v34;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v34 != v10)
        objc_enumerationMutation(v7);
      v12 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * v11);
      NSClassFromString(CFSTR("LookAroundPuckViewController"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v33, v38, 16);
        if (v9)
          goto LABEL_3;
        goto LABEL_9;
      }
    }
    v13 = v12;

    if (!v13)
      goto LABEL_13;
    objc_msgSend(v13, "view");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v7);
  }
  else
  {
LABEL_9:
    v13 = 0;
  }

LABEL_13:
  if (-[MKMapViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_compassVisible")))
  {
    -[MKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_compassView"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    if (v14)
    {
      objc_msgSend(v14, "setAccessibilityContainer:", self);
      objc_msgSend(v3, "addObject:", v15);
    }

  }
  -[MKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_basicMapView"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __47__MKMapViewAccessibility_accessibilityElements__block_invoke;
  v28 = &unk_250250800;
  v18 = v3;
  v29 = v18;
  v19 = v16;
  v30 = v19;
  v31 = 0;
  v32 = v17;
  v20 = v17;
  v21 = (id)-[MKMapViewAccessibility _accessibilityFindUnsortedSubviewDescendantsPassingTest:](self, "_accessibilityFindUnsortedSubviewDescendantsPassingTest:", &v25);
  if (v19)
  {
    objc_msgSend(v19, "setAccessibilityContainer:", self, v25, v26, v27, v28, v29, v30, v31);
    objc_msgSend(v18, "addObject:", v19);
  }
  -[MKMapViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_showsZoomControls"), v25, v26, v27, v28);
  objc_msgSend(v18, "addObjectsFromArray:", v20);
  v22 = v32;
  v23 = v18;

  return v23;
}

uint64_t __47__MKMapViewAccessibility_accessibilityElements__block_invoke(id *a1, void *a2)
{
  id v3;
  char isKindOfClass;
  uint64_t v5;
  uint64_t v6;

  v3 = a2;
  if ((objc_msgSend(a1[4], "containsObject:", v3) & 1) != 0 || a1[5] == v3 || a1[6] == v3)
  {
    v6 = 1;
  }
  else
  {
    if (objc_msgSend(v3, "isAccessibilityElement"))
    {
      NSClassFromString(CFSTR("MKAttributionLabel"));
      isKindOfClass = objc_opt_isKindOfClass();
      v5 = 4;
      if ((isKindOfClass & 1) != 0)
        v5 = 7;
      objc_msgSend(a1[v5], "addObject:", v3);
    }
    v6 = 0;
  }

  return v6;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v4;

  -[MKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapLayer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(a3) = objc_msgSend(v4, "accessibilityScroll:", a3);

  return a3;
}

- (int64_t)_accessibilitySortPriority
{
  void *v2;
  void *v3;
  int64_t v4;

  __UIAccessibilitySafeClass();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "horizontalSizeClass") == 1)
    v4 = 1;
  else
    v4 = -1;

  return v4;
}

- (id)_axMapsDelegate
{
  void *v2;

  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDF6800], "safeValueForKey:", CFSTR("sharedMapsDelegate"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

- (void)_setCompassVisible:(BOOL)a3 animationAllowed:(BOOL)a4 force:(BOOL)a5
{
  _BOOL8 v5;
  _BOOL8 v6;
  _BOOL8 v7;
  int v9;
  objc_super v10;

  v5 = a5;
  v6 = a4;
  v7 = a3;
  v9 = -[MKMapViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_compassVisible"));
  v10.receiver = self;
  v10.super_class = (Class)MKMapViewAccessibility;
  -[MKMapViewAccessibility _setCompassVisible:animationAllowed:force:](&v10, sel__setCompassVisible_animationAllowed_force_, v7, v6, v5);
  if (v9 != -[MKMapViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_compassVisible")))
    UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_didEndZoom
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKMapViewAccessibility;
  -[MKMapViewAccessibility _didEndZoom](&v4, sel__didEndZoom);
  -[MKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapLayer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("ZoomNotification"));

}

@end

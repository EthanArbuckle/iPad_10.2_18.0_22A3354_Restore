@implementation MKAnnotationContainerViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKAnnotationContainerView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKAnnotationContainerView"), CFSTR("deselectAnnotationView: animated:"), "v", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKAnnotationContainerView"), CFSTR("_annotationViews"), "NSMutableOrderedSet");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKAnnotationView"), CFSTR("_calloutView"), "MKCalloutView");

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKAnnotationContainerViewAccessibility;
  -[MKAnnotationContainerViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MKAnnotationContainerViewAccessibility _accessibilitySetViewIsVisible:](self, "_accessibilitySetViewIsVisible:", 0);
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  void *v22;
  void *v23;
  void *v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;
  CGRect v33;

  v31 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[MKAnnotationContainerViewAccessibility _accessibilityAnnotationViews](self, "_accessibilityAnnotationViews", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v27;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v27 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * v8);
        -[MKAnnotationContainerViewAccessibility accessibilityFrame](self, "accessibilityFrame");
        v11 = v10;
        v13 = v12;
        v15 = v14;
        v17 = v16;
        objc_msgSend(v9, "accessibilityFrame");
        v33.origin.x = v18;
        v33.origin.y = v19;
        v33.size.width = v20;
        v33.size.height = v21;
        v32.origin.x = v11;
        v32.origin.y = v13;
        v32.size.width = v15;
        v32.size.height = v17;
        if (CGRectContainsRect(v32, v33))
        {
          objc_msgSend(v9, "setAccessibilityContainer:", self);
          objc_msgSend(v3, "axSafelyAddObject:", v9);
        }
        if (_CFMZEnabled())
        {
          objc_msgSend(v9, "safeUIViewForKey:", CFSTR("_calloutView"));
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          AXMapKitLocString(CFSTR("INFO_PANEL"));
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setAccessibilityLabel:", v23);

          objc_msgSend(v22, "setAccessibilityContainer:", self);
          objc_msgSend(v3, "axSafelyAddObject:", v22);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v6);
  }

  -[MKAnnotationContainerViewAccessibility _accessibilityFilterVisibleElements:](self, "_accessibilityFilterVisibleElements:", v3);
  v24 = (void *)objc_claimAutoreleasedReturnValue();

  return v24;
}

- (id)_accessibilityFilterVisibleElements:(id)a3
{
  id v4;
  void *v5;
  int PossiblyNilObjectForKey;
  id v7;
  void *v8;
  id v9;
  void *v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;
  _BYTE v35[128];
  uint64_t v36;
  CGRect v37;
  CGRect v38;

  v36 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityFilterVisibleElements"), self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = 0;
  PossiblyNilObjectForKey = _AXServerCacheGetPossiblyNilObjectForKey();
  v7 = 0;
  v8 = v7;
  if (PossiblyNilObjectForKey)
  {
    v9 = v7;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[MKAnnotationContainerViewAccessibility window](self, "window");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "accessibilityFrame");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;

    v32 = 0u;
    v33 = 0u;
    v30 = 0u;
    v31 = 0u;
    v19 = v4;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v31;
      do
      {
        v23 = 0;
        do
        {
          if (*(_QWORD *)v31 != v22)
            objc_enumerationMutation(v19);
          v24 = *(void **)(*((_QWORD *)&v30 + 1) + 8 * v23);
          if (AXRequestingClient() == 11)
            goto LABEL_10;
          objc_msgSend(v24, "accessibilityFrame");
          v38.origin.x = v25;
          v38.origin.y = v26;
          v38.size.width = v27;
          v38.size.height = v28;
          v37.origin.x = v12;
          v37.origin.y = v14;
          v37.size.width = v16;
          v37.size.height = v18;
          if (CGRectIntersectsRect(v37, v38))
LABEL_10:
            objc_msgSend(v9, "addObject:", v24);
          ++v23;
        }
        while (v21 != v23);
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
      }
      while (v21);
    }

    _AXServerCacheInsertPossiblyNilObjectForKey();
  }

  return v9;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  return -[MKAnnotationContainerViewAccessibility _accessibilityZoom:point:](self, "_accessibilityZoom:point:", 1, a3.x, a3.y);
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  return -[MKAnnotationContainerViewAccessibility _accessibilityZoom:point:](self, "_accessibilityZoom:point:", 0, a3.x, a3.y);
}

- (BOOL)isAccessibilityElement
{
  return 0;
}

- (id)_accessibilityAnnotationViews
{
  void *v2;
  void *v3;

  -[MKAnnotationContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("annotationViews"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilitySafeClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityZoom:(BOOL)a3 point:(CGPoint)a4
{
  double y;
  double x;
  _BOOL4 v6;
  void *v8;
  void *v9;
  char v10;
  BOOL v11;

  y = a4.y;
  x = a4.x;
  v6 = a3;
  if (_accessibilityZoom_point___VKMapViewClassOnceToken != -1)
    dispatch_once(&_accessibilityZoom_point___VKMapViewClassOnceToken, &__block_literal_global_1);
  -[MKAnnotationContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("_mapView"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (v6)
      v10 = objc_msgSend(v9, "accessibilityZoomInAtPoint:", x, y);
    else
      v10 = objc_msgSend(v9, "accessibilityZoomOutAtPoint:", x, y);
    v11 = v10;
  }
  else
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDC0]);
    v11 = 1;
  }

  return v11;
}

Class __67__MKAnnotationContainerViewAccessibility__accessibilityZoom_point___block_invoke()
{
  Class result;

  result = NSClassFromString(CFSTR("VKMapView"));
  _accessibilityZoom_point___VKMapViewClass = (uint64_t)result;
  return result;
}

- (void)deselectAnnotationView:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidX;
  double MidY;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  uint64_t i;
  void *v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGRect v31;
  CGRect v32;

  v4 = a4;
  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v28.receiver = self;
  v28.super_class = (Class)MKAnnotationContainerViewAccessibility;
  -[MKAnnotationContainerViewAccessibility deselectAnnotationView:animated:](&v28, sel_deselectAnnotationView_animated_, v6, v4);
  objc_msgSend(v6, "accessibilityFrame");
  x = v31.origin.x;
  y = v31.origin.y;
  width = v31.size.width;
  height = v31.size.height;
  MidX = CGRectGetMidX(v31);
  v32.origin.x = x;
  v32.origin.y = y;
  v32.size.width = width;
  v32.size.height = height;
  MidY = CGRectGetMidY(v32);
  -[MKAnnotationContainerViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("_mapView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "accessibilityElements");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v16 = v15;
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
  if (v17)
  {
    v18 = v17;
    v19 = 0;
    v20 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v18; ++i)
      {
        if (*(_QWORD *)v25 != v20)
          objc_enumerationMutation(v16);
        v22 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        NSClassFromString(CFSTR("VKFeatureAccessibilityElement"));
        if ((objc_opt_isKindOfClass() & 1) != 0
          && ((objc_msgSend(v22, "safeBoolForKey:", CFSTR("isPOI"), (_QWORD)v24) & 1) != 0
           || objc_msgSend(v22, "safeBoolForKey:", CFSTR("isRouteEta"))))
        {
          if (objc_msgSend(v22, "pointInside:", MidX, MidY))
          {
            v23 = v22;

            v19 = v23;
          }
        }
      }
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
    }
    while (v18);
  }
  else
  {
    v19 = 0;
  }

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v19);
}

@end

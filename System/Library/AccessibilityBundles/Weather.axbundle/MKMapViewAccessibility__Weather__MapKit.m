@implementation MKMapViewAccessibility__Weather__MapKit

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MKMapView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (BOOL)_axIsInitialized
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsInitialized:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (id)_axModelCache
{
  JUMPOUT(0x234925060);
}

- (void)_axSetModelCache:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axInFlightRequests
{
  JUMPOUT(0x234925060);
}

- (void)_axSetInFlightRequests:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axCurrentOverlayKey
{
  JUMPOUT(0x234925060);
}

- (void)_axSetCurrentOverlayKey:(id)a3
{
  __UIAccessibilitySetAssociatedCopiedObject();
}

- (id)_axUpdateDebounceTimer
{
  JUMPOUT(0x234925060);
}

- (void)_axSetUpdateDebounceTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axInFlightRequestCleanupTimer
{
  JUMPOUT(0x234925060);
}

- (void)_axSetInFlightRequestCleanupTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axFavoritesRotor
{
  JUMPOUT(0x234925060);
}

- (void)_axSetFavoritesRotor:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_mapLayer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("setDelegate:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("MKMapView"), CFSTR("_annotationContainer"), "MKAnnotationContainerView");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("accessibilityElementManager"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("convertPoint:toCoordinateFromView:"), "{CLLocationCoordinate2D=dd}", "{CGPoint=dd}", "@", 0);

}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  -[MKMapViewAccessibility__Weather__MapKit _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[MKMapViewAccessibility__Weather__MapKit _axUpdateModelsForCurrentOverlayKind](self, "_axUpdateModelsForCurrentOverlayKind");
}

- (void)_axInitialize
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_opt_new();
  -[MKMapViewAccessibility__Weather__MapKit _axSetModelCache:](self, "_axSetModelCache:", v3);

  v4 = (void *)objc_opt_new();
  -[MKMapViewAccessibility__Weather__MapKit _axSetInFlightRequests:](self, "_axSetInFlightRequests:", v4);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__axDidToggleAXSetting_, *MEMORY[0x24BDF7458], 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObserver:selector:name:object:", self, sel__axDidToggleAXSetting_, *MEMORY[0x24BDF7380], 0);

  -[MKMapViewAccessibility__Weather__MapKit _axMapLayer](self, "_axMapLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityElementManager"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (v9)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__axUpdateElementsComplete_, CFSTR("UpdateAccessibilityElementsComplete"), v9);

  }
  -[MKMapViewAccessibility__Weather__MapKit _axSetIsInitialized:](self, "_axSetIsInitialized:", 1);

}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  uint64_t v9;
  objc_super v11;
  CGPoint v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[MKMapViewAccessibility__Weather__MapKit _axAttributionElement](self, "_axAttributionElement");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "accessibilityFrame");
  v12.x = x;
  v12.y = y;
  if (!CGRectContainsPoint(v13, v12))
  {
    v11.receiver = self;
    v11.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
    -[MKMapViewAccessibility__Weather__MapKit _accessibilityHitTest:withEvent:](&v11, sel__accessibilityHitTest_withEvent_, v7, x, y);
    v9 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v9;
  }

  return v8;
}

- (void)setDelegate:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  -[MKMapViewAccessibility__Weather__MapKit setDelegate:](&v4, sel_setDelegate_, a3);
  -[MKMapViewAccessibility__Weather__MapKit _axUpdateModelsForCurrentOverlayKind](self, "_axUpdateModelsForCurrentOverlayKind");
}

- (void)setAccessibilityLabel:(id)a3
{
  id v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  v4 = a3;
  -[MKMapViewAccessibility__Weather__MapKit setAccessibilityLabel:](&v6, sel_setAccessibilityLabel_, v4);
  -[MKMapViewAccessibility__Weather__MapKit _axMapLayer](self, "_axMapLayer", v6.receiver, v6.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAccessibilityLabel:", v4);

}

- (void)addOverlay:(id)a3 level:(int64_t)a4
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  -[MKMapViewAccessibility__Weather__MapKit addOverlay:level:](&v5, sel_addOverlay_level_, a3, a4);
  -[MKMapViewAccessibility__Weather__MapKit _axUpdateModelsForCurrentOverlayKind](self, "_axUpdateModelsForCurrentOverlayKind");
}

- (void)mapLayerDidFinishLoadingTiles:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MKMapViewAccessibility__Weather__MapKit;
  -[MKMapViewAccessibility__Weather__MapKit mapLayerDidFinishLoadingTiles:](&v4, sel_mapLayerDidFinishLoadingTiles_, a3);
  -[MKMapViewAccessibility__Weather__MapKit _axScheduleUpdate](self, "_axScheduleUpdate");
}

- (id)accessibilityCustomRotors
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  id (*v10)(uint64_t, void *);
  void *v11;
  id v12;
  id location;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (accessibilityCustomRotors_onceToken != -1)
    dispatch_once(&accessibilityCustomRotors_onceToken, &__block_literal_global_1);
  -[MKMapViewAccessibility__Weather__MapKit _axFavoritesRotor](self, "_axFavoritesRotor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_initWeak(&location, self);
    v4 = objc_alloc(MEMORY[0x24BDF6790]);
    AXWeatherLocString(CFSTR("FAVORITES_TITLE"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v9 = 3221225472;
    v10 = __68__MKMapViewAccessibility__Weather__MapKit_accessibilityCustomRotors__block_invoke_2;
    v11 = &unk_2503E5CE8;
    objc_copyWeak(&v12, &location);
    v3 = (void *)objc_msgSend(v4, "initWithName:itemSearchBlock:", v5, &v8);

    -[MKMapViewAccessibility__Weather__MapKit _axSetFavoritesRotor:](self, "_axSetFavoritesRotor:", v3, v8, v9, v10, v11);
    objc_destroyWeak(&v12);
    objc_destroyWeak(&location);
  }
  v14[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)_axScheduleUpdate
{
  void *v3;
  id v4;

  -[MKMapViewAccessibility__Weather__MapKit _axUpdateDebounceTimer](self, "_axUpdateDebounceTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "invalidate");

  objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__axApplyModelsToVKFeatureAccessibilityElementsIfNeeded, 0, 0, 0.25);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapViewAccessibility__Weather__MapKit _axSetUpdateDebounceTimer:](self, "_axSetUpdateDebounceTimer:", v4);

}

- (void)_axUpdateModelsForCurrentOverlayKind
{
  void *v3;
  void *v4;
  id v5;

  -[MKMapViewAccessibility__Weather__MapKit _axGetCurrentOverlayKeyFromDelegate](self, "_axGetCurrentOverlayKeyFromDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    -[MKMapViewAccessibility__Weather__MapKit _axCurrentOverlayKey](self, "_axCurrentOverlayKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3 || (objc_msgSend(v5, "isEqualToString:", v3) & 1) == 0)
    {
      -[MKMapViewAccessibility__Weather__MapKit _axSetCurrentOverlayKey:](self, "_axSetCurrentOverlayKey:", v5);
      -[MKMapViewAccessibility__Weather__MapKit _axModelCache](self, "_axModelCache");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "removeAllObjects");

      -[MKMapViewAccessibility__Weather__MapKit _axApplyModelsToVKFeatureAccessibilityElementsIfNeeded](self, "_axApplyModelsToVKFeatureAccessibilityElementsIfNeeded");
    }

  }
}

- (id)_axGetCurrentOverlayKeyFromDelegate
{
  void *v3;
  void *v4;

  -[MKMapViewAccessibility__Weather__MapKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityModelOverlayKeyForMapView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (void)_axApplyModelsToVKFeatureAccessibilityElementsIfNeeded
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  if (!-[MKMapViewAccessibility__Weather__MapKit _axIsInitialized](self, "_axIsInitialized"))
    -[MKMapViewAccessibility__Weather__MapKit _axInitialize](self, "_axInitialize");
  if (UIAccessibilityIsVoiceOverRunning() || UIAccessibilityIsSwitchControlRunning())
  {
    -[MKMapViewAccessibility__Weather__MapKit _axCurrentOverlayKey](self, "_axCurrentOverlayKey");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v3)
    {
      -[MKMapViewAccessibility__Weather__MapKit _axGetCurrentOverlayKeyFromDelegate](self, "_axGetCurrentOverlayKeyFromDelegate");
      v4 = objc_claimAutoreleasedReturnValue();
      if (!v4)
        return;
      v5 = (void *)v4;
      -[MKMapViewAccessibility__Weather__MapKit _axSetCurrentOverlayKey:](self, "_axSetCurrentOverlayKey:", v4);

    }
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    -[MKMapViewAccessibility__Weather__MapKit _axVKFeaturePOIElements](self, "_axVKFeaturePOIElements", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          -[MKMapViewAccessibility__Weather__MapKit _axApplyModelToVKFeatureAccessibilityElement:](self, "_axApplyModelToVKFeatureAccessibilityElement:", *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v8);
    }

  }
}

- (void)_axApplyModelToVKFeatureAccessibilityElement:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  int v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void (*v17)(uint64_t, void *, void *);
  void *v18;
  id v19;
  id location;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_axVKFeatureAccessibilityElementClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[MKMapViewAccessibility__Weather__MapKit _axLocationForVKFeatureAccessibilityElement:](self, "_axLocationForVKFeatureAccessibilityElement:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
LABEL_15:

      goto LABEL_16;
    }
    -[MKMapViewAccessibility__Weather__MapKit _axModelForLocation:](self, "_axModelForLocation:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      -[MKMapViewAccessibility__Weather__MapKit _axCurrentOverlayKey](self, "_axCurrentOverlayKey");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (v7
        && (objc_msgSend(v6, "overlayDescriptionKey"),
            v8 = (void *)objc_claimAutoreleasedReturnValue(),
            v9 = objc_msgSend(v7, "isEqualToString:", v8),
            v8,
            v9))
      {
        objc_msgSend(v6, "expiration");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDBCE60], "date");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v10, "compare:", v11);

        objc_msgSend(v6, "accessibilityDescription");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "setAccessibilityValue:", v13);

        if (v12 == 1)
        {
LABEL_14:

          goto LABEL_15;
        }
      }
      else
      {
        objc_msgSend(v4, "setAccessibilityValue:", 0);

      }
    }
    -[MKMapViewAccessibility__Weather__MapKit safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_initWeak(&location, self);
      if (!-[MKMapViewAccessibility__Weather__MapKit _axRequestIsInFlightForLocation:](self, "_axRequestIsInFlightForLocation:", v5))
      {
        v15 = MEMORY[0x24BDAC760];
        v16 = 3221225472;
        v17 = __88__MKMapViewAccessibility__Weather__MapKit__axApplyModelToVKFeatureAccessibilityElement___block_invoke;
        v18 = &unk_2503E5D10;
        objc_copyWeak(&v19, &location);
        objc_msgSend(v14, "mapView:requestedAccessibilityModelForLocation:completion:", self, v5, &v15);
        -[MKMapViewAccessibility__Weather__MapKit _axSetRequestIsInFlight:forLocation:](self, "_axSetRequestIsInFlight:forLocation:", 1, v5, v15, v16, v17, v18);
        objc_destroyWeak(&v19);
      }
      objc_destroyWeak(&location);
    }

    goto LABEL_14;
  }
LABEL_16:

}

- (void)_axUpdateLocation:(id)a3 withModel:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  int v9;
  id v10;

  v10 = a3;
  v6 = a4;
  -[MKMapViewAccessibility__Weather__MapKit _axCurrentOverlayKey](self, "_axCurrentOverlayKey");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v6, "overlayDescriptionKey");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "isEqualToString:", v7);

    if (v9)
    {
      -[MKMapViewAccessibility__Weather__MapKit _axStoreModel:location:](self, "_axStoreModel:location:", v6, v10);
      -[MKMapViewAccessibility__Weather__MapKit _axSetAccessibilityModel:forElementWithLocation:](self, "_axSetAccessibilityModel:forElementWithLocation:", v6, v10);
    }
  }

}

- (id)_axLocationFromVKLocationCoordinates:(VKLocationCoordinate2D)a3
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", a3.var0, a3.var1);
}

- (id)_axLocationForVKFeatureAccessibilityElement:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_axVKFeatureAccessibilityElementClass");
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "accessibilityActivationPoint");
    UIAccessibilityPointToPoint();
    -[MKMapViewAccessibility__Weather__MapKit convertPoint:toCoordinateFromView:](self, "convertPoint:toCoordinateFromView:", self);
    -[MKMapViewAccessibility__Weather__MapKit _axLocationFromVKLocationCoordinates:](self, "_axLocationFromVKLocationCoordinates:");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_axCacheKeyForLocation:(id)a3
{
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;

  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = a3;
  objc_msgSend(v5, "coordinate");
  v7 = v6;
  objc_msgSend(v5, "coordinate");
  v9 = v8;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localeIdentifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapViewAccessibility__Weather__MapKit _axCurrentOverlayKey](self, "_axCurrentOverlayKey");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%.3f %.3f %@ %@"), v7, v9, v11, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (BOOL)_axApplyModel:(id)a3 ifElement:(id)a4 hasLocation:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  BOOL v17;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  -[MKMapViewAccessibility__Weather__MapKit _axLocationForVKFeatureAccessibilityElement:](self, "_axLocationForVKFeatureAccessibilityElement:", v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[MKMapViewAccessibility__Weather__MapKit _axLocationCoordinatesMatch:location:](self, "_axLocationCoordinatesMatch:location:", v11, v10);

  if (v12)
  {
    -[MKMapViewAccessibility__Weather__MapKit _axCurrentOverlayKey](self, "_axCurrentOverlayKey");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13
      && (objc_msgSend(v8, "overlayDescriptionKey"),
          v14 = (void *)objc_claimAutoreleasedReturnValue(),
          v15 = objc_msgSend(v13, "isEqualToString:", v14),
          v14,
          v15))
    {
      objc_msgSend(v8, "accessibilityDescription");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "setAccessibilityValue:", v16);

      v17 = 1;
    }
    else
    {
      v17 = 0;
    }

  }
  else
  {
    v17 = 0;
  }

  return v17;
}

- (void)_axSetAccessibilityModel:(id)a3 forElementWithLocation:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[MKMapViewAccessibility__Weather__MapKit _axVKFeaturePOIElements](self, "_axVKFeaturePOIElements", 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v14;
LABEL_3:
    v12 = 0;
    while (1)
    {
      if (*(_QWORD *)v14 != v11)
        objc_enumerationMutation(v8);
      if (-[MKMapViewAccessibility__Weather__MapKit _axApplyModel:ifElement:hasLocation:](self, "_axApplyModel:ifElement:hasLocation:", v6, *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * v12), v7))
      {
        break;
      }
      if (v10 == ++v12)
      {
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
        if (v10)
          goto LABEL_3;
        break;
      }
    }
  }

}

- (BOOL)_axLocationCoordinatesMatch:(id)a3 location:(id)a4
{
  id v5;
  id v6;
  double v7;
  double v8;
  double v9;
  BOOL v10;
  double v11;
  double v12;
  double v13;
  double v14;

  v5 = a4;
  v6 = a3;
  objc_msgSend(v6, "coordinate");
  v8 = v7;
  objc_msgSend(v5, "coordinate");
  v10 = vabdd_f64(v8, v9) < 2.22044605e-16;
  objc_msgSend(v6, "coordinate");
  v12 = v11;

  objc_msgSend(v5, "coordinate");
  v14 = v13;

  return vabdd_f64(v12, v14) < 2.22044605e-16 && v10;
}

- (id)_axMapLayer
{
  return (id)-[MKMapViewAccessibility__Weather__MapKit safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapLayer"));
}

- (void)_axStoreModel:(id)a3 location:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v6 = a3;
  -[MKMapViewAccessibility__Weather__MapKit _axCacheKeyForLocation:](self, "_axCacheKeyForLocation:", a4);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  -[MKMapViewAccessibility__Weather__MapKit _axModelCache](self, "_axModelCache");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setObject:forKey:", v6, v8);

}

- (id)_axModelForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;

  v4 = a3;
  -[MKMapViewAccessibility__Weather__MapKit _axModelCache](self, "_axModelCache");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapViewAccessibility__Weather__MapKit _axCacheKeyForLocation:](self, "_axCacheKeyForLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "objectForKey:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_axRequestIsInFlightForLocation:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequests](self, "_axInFlightRequests");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapViewAccessibility__Weather__MapKit _axCacheKeyForLocation:](self, "_axCacheKeyForLocation:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  LOBYTE(v4) = objc_msgSend(v5, "containsObject:", v6);
  return (char)v4;
}

- (void)_axClearInFlightRequests
{
  void *v3;
  void *v4;

  -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequests](self, "_axInFlightRequests");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAllObjects");

  -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequestCleanupTimer](self, "_axInFlightRequestCleanupTimer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "invalidate");

  -[MKMapViewAccessibility__Weather__MapKit _axSetInFlightRequestCleanupTimer:](self, "_axSetInFlightRequestCleanupTimer:", 0);
}

- (void)_axSetRequestIsInFlight:(BOOL)a3 forLocation:(id)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = a3;
  v6 = a4;
  if (!v4)
  {
    -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequestCleanupTimer](self, "_axInFlightRequestCleanupTimer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "invalidate");

    -[MKMapViewAccessibility__Weather__MapKit _axSetInFlightRequestCleanupTimer:](self, "_axSetInFlightRequestCleanupTimer:", 0);
    -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequests](self, "_axInFlightRequests");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[MKMapViewAccessibility__Weather__MapKit _axCacheKeyForLocation:](self, "_axCacheKeyForLocation:", v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "removeObject:", v11);
LABEL_6:

    return;
  }
  -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequests](self, "_axInFlightRequests");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[MKMapViewAccessibility__Weather__MapKit _axCacheKeyForLocation:](self, "_axCacheKeyForLocation:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addObject:", v8);
  -[MKMapViewAccessibility__Weather__MapKit _axInFlightRequestCleanupTimer](self, "_axInFlightRequestCleanupTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCF40], "scheduledTimerWithTimeInterval:target:selector:userInfo:repeats:", self, sel__axClearInFlightRequests, 0, 0, 60.0);
    v12 = (id)objc_claimAutoreleasedReturnValue();
    -[MKMapViewAccessibility__Weather__MapKit _axSetInFlightRequestCleanupTimer:](self, "_axSetInFlightRequestCleanupTimer:");
    goto LABEL_6;
  }
}

+ (Class)_axVKFeatureAccessibilityElementClass
{
  if (_axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClassOnceToken != -1)
    dispatch_once(&_axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClassOnceToken, &__block_literal_global_247);
  return (Class)(id)_axVKFeatureAccessibilityElementClass__VKFeatureAccessibilityElementClass;
}

+ (Class)_axMKAttributionLabelClass
{
  if (_axMKAttributionLabelClass__MKAttributionLabelClassOnceToken != -1)
    dispatch_once(&_axMKAttributionLabelClass__MKAttributionLabelClassOnceToken, &__block_literal_global_250);
  return (Class)(id)_axMKAttributionLabelClass__MKAttributionLabelClass;
}

- (id)_axVKFeaturePOIElements
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  -[MKMapViewAccessibility__Weather__MapKit _axMapLayer](self, "_axMapLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "_axVKFeatureAccessibilityElementClass");
  objc_msgSend(v2, "accessibilityElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", objc_msgSend(v3, "count"));
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v9);
        if ((objc_opt_isKindOfClass() & 1) != 0
          && objc_msgSend(v10, "safeBoolForKey:", CFSTR("isPOI"), (_QWORD)v13))
        {
          objc_msgSend(v4, "addObject:", v10);
        }
        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v7);
  }

  v11 = (void *)objc_msgSend(v4, "copy");
  return v11;
}

- (id)_axAttributionElement
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  id v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[MKMapViewAccessibility__Weather__MapKit accessibilityElements](self, "accessibilityElements", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reverseObjectEnumerator");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v12;
    while (2)
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v12 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v7);
        objc_msgSend((id)objc_opt_class(), "_axMKAttributionLabelClass");
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v9 = v8;
          goto LABEL_11;
        }
        ++v7;
      }
      while (v5 != v7);
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v5)
        continue;
      break;
    }
  }
  v9 = 0;
LABEL_11:

  return v9;
}

@end

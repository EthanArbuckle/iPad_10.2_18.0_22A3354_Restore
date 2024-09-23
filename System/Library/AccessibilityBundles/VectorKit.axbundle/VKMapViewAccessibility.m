@implementation VKMapViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("VKMapView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axCurrentLocationText
{
  JUMPOUT(0x234923C00);
}

- (void)_axSetCurrentLocationText:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("initShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:"), "@", "B", "B", "d", "@", "q", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("setMapType:"), "v", "i", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("zoomToLevel: withFocusPoint:"), "v", "d", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("zoom: withFocusPoint: completionHandler:"), "v", "d", "{CGPoint=dd}", "@?", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("setCurrentLocationText:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("mapDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("cameraDelegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("didUpdateSceneStatus:"), "v", "C", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapView"), CFSTR("labelManagerDidLayout"), "v", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VKMapCameraController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKMapView"), CFSTR("_navigationCameraController"), "VKNavCameraController");
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKMapView"), CFSTR("_mapCameraController"), "VKMapCameraController");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKMapCameraController"), CFSTR("tapZoom: levels: completionHandler:"), "v", "{CGPoint=dd}", "d", "@?", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("VKScreenCameraController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VKMapCameraController"), CFSTR("VKScreenCameraController"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKScreenCameraController"), CFSTR("startPanningAtPoint: panAtStartPoint:"), "v", "{CGPoint=dd}", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("VKScreenCameraController"), CFSTR("updatePanWithTranslation:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKScreenCameraController"), CFSTR("_gestureCameraControllerBehavior"), "VKGestureCameraBehavior");
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKGestureCameraBehavior"), CFSTR("_panLastScreenPoint"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKMapView"), CFSTR("_canvas"), "VKMapCanvas");
  objc_msgSend(v3, "validateClass:", CFSTR("VKScreenCanvas"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("VKMapCanvas"), CFSTR("VKScreenCanvas"));
  objc_msgSend(v3, "validateClass:", CFSTR("VKCamera"));
  objc_opt_class();
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("VKScreenCanvas"), CFSTR("_vkCamera"), __ax_verbose_encode_with_type_encoding_group_class());
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("userTrackingMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("setUserTrackingMode:"), "v", "q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("MKUserLocation"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_zoomLevel"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_maximumZoomLevel"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKMapView"), CFSTR("_minimumZoomLevel"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MKAnnotationContainerView"), CFSTR("userLocationView"), "@", 0);

}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  return 0x100000;
}

- (void)_axInitializeTimers
{
  void *v3;
  id v4;
  id v5;

  -[VKMapViewAccessibility _axMapLabelLayoutTimer](self, "_axMapLabelLayoutTimer");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
  {
    v4 = objc_alloc(MEMORY[0x24BE005F0]);
    v5 = (id)objc_msgSend(v4, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    objc_msgSend(v5, "setAutomaticallyCancelPendingBlockUponSchedulingNewBlock:", 1);
    -[VKMapViewAccessibility _axSetMapLabelLayoutTimer:](self, "_axSetMapLabelLayoutTimer:", v5);

  }
}

- (void)_accessibilityLoadAccessibilityInformation
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility _accessibilityLoadAccessibilityInformation](&v3, sel__accessibilityLoadAccessibilityInformation);
  -[VKMapViewAccessibility _accessibilityMapViewDidChangeVisibleRegion](self, "_accessibilityMapViewDidChangeVisibleRegion");
  -[VKMapViewAccessibility _axInitializeTimers](self, "_axInitializeTimers");
}

- (id)accessibilityElements
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 v5;
  int v6;
  _QWORD *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  void *v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t i;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _BYTE v40[128];
  _QWORD v41[2];

  v41[1] = *MEMORY[0x24BDAC8D0];
  -[VKMapViewAccessibility _axLoadAccessibility](self, "_axLoadAccessibility");
  if (-[VKMapViewAccessibility accessibilityIsShowingRoutes](self, "accessibilityIsShowingRoutes"))
    v3 = -[VKMapViewAccessibility accessibilityOnlyShowRouteNodesDuringTransit](self, "accessibilityOnlyShowRouteNodesDuringTransit");
  else
    v3 = 0;
  v4 = -[VKMapViewAccessibility accessibilityIsInTourGuideMode](self, "accessibilityIsInTourGuideMode");
  v5 = -[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView");
  v6 = AXRequiresMapAccessibilityPurelyForAutomation();
  v7 = (_QWORD *)MEMORY[0x24BEBB308];
  v8 = *MEMORY[0x24BEBB308];
  if (v6 || !v4 && !v5)
  {
    -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[VKMapViewAccessibility _accessibilityMapsExplorationIsActive](self, "_accessibilityMapsExplorationIsActive"))
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "currentExplorationElement");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "axSafelyAddObject:", v14);

      -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "neighborExplorationElements");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "axSafelyAddObjectsFromArray:", v16);

      v17 = v12;
      +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "currentExplorationVertex");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v18, "setCurrentExplorationVertex:", v20);

      v11 = v17;
    }
    else if (!v11)
    {
      if (v3)
      {
        v22 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v36 = 0u;
        v37 = 0u;
        v38 = 0u;
        v39 = 0u;
        -[VKMapViewAccessibility _axElements](self, "_axElements");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
        if (v24)
        {
          v25 = *(_QWORD *)v37;
          do
          {
            for (i = 0; i != v24; ++i)
            {
              if (*(_QWORD *)v37 != v25)
                objc_enumerationMutation(v23);
              v27 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * i);
              if (objc_msgSend(v27, "isRouteEta"))
                objc_msgSend(v22, "addObject:", v27);
            }
            v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v36, v40, 16);
          }
          while (v24);
        }

        v11 = (void *)objc_msgSend(v22, "copy");
      }
      else
      {
        -[VKMapViewAccessibility _axElements](self, "_axElements");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
      }
      -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v11, *v7);
    }
    +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removePointsAndPaths");
    v28 = objc_opt_class();
    AXVKAccessibilityPaths(v11, v28, 25);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addBuildingPaths:", v29);

    v30 = objc_opt_class();
    AXVKAccessibilityPaths(v11, v30, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addPOIPaths:", v31);

    v32 = objc_opt_class();
    AXVKAccessibilityPaths(v11, v32, 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addRoadPaths:", v33);

    v34 = objc_opt_class();
    AXVKAccessibilityPoints(v11, v34, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addRoadPoints:", v35);

  }
  else
  {
    -[VKMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", v8);
    if (v5 || v3)
    {
      +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "removePointsAndPaths");

    }
    if (!v4)
      return 0;
    -[VKMapViewAccessibility _axTourGuideElement](self, "_axTourGuideElement");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v41[0] = v10;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v11;
}

- (CGPoint)accessibilityConvertCoordinateToWindow:(id)a3
{
  double var1;
  double var0;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  var1 = a3.var1;
  var0 = a3.var0;
  -[VKMapViewAccessibility _axWindow](self, "_axWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "layer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibility convertCoordinate:toPointToLayer:](self, "convertCoordinate:toPointToLayer:", v7, var0, var1);
  v9 = v8;
  v11 = v10;

  if (v6)
  {
    objc_msgSend(v6, "convertPoint:toWindow:", 0, v9, v11);
    v9 = v12;
    v11 = v13;
  }

  v14 = v9;
  v15 = v11;
  result.y = v15;
  result.x = v14;
  return result;
}

- (BOOL)accessibilityActivate
{
  objc_super v4;

  if (-[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView"))
  {
    return -[VKMapViewAccessibility accessibilityPerformEscape](self, "accessibilityPerformEscape");
  }
  v4.receiver = self;
  v4.super_class = (Class)VKMapViewAccessibility;
  return -[VKMapViewAccessibility accessibilityActivate](&v4, sel_accessibilityActivate);
}

- (id)accessibilityHint
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 IsVoiceOverRunning;
  void *v6;
  uint64_t v7;
  void *v8;
  objc_super v10;

  v3 = -[VKMapViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v4 = -[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView");
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v10.receiver = self;
  v10.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility accessibilityHint](&v10, sel_accessibilityHint);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (!-[VKMapViewAccessibility accessibilityMapLoadingComplete](self, "accessibilityMapLoadingComplete")
    && IsVoiceOverRunning)
  {
    AXVectorKitLocString(CFSTR("MAP_LOADING_HINT"));
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v8 = (void *)v7;

    v6 = v8;
    return v6;
  }
  if (v3 && IsVoiceOverRunning)
  {
    if (v4)
      UIKitAccessibilityLocalizedString();
    else
      AXVectorKitLocString(CFSTR("MAP_NO_ELEMENTS_HINT"));
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  return v6;
}

- (id)accessibilityLabel
{
  _BOOL4 v3;
  _BOOL4 v4;
  _BOOL4 IsVoiceOverRunning;
  void *v6;
  void *v7;
  id v8;
  objc_super v10;

  v3 = -[VKMapViewAccessibility isAccessibilityElement](self, "isAccessibilityElement");
  v4 = -[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView");
  IsVoiceOverRunning = UIAccessibilityIsVoiceOverRunning();
  v10.receiver = self;
  v10.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility accessibilityLabel](&v10, sel_accessibilityLabel);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 && v4 && IsVoiceOverRunning)
  {
    UIKitAccessibilityLocalizedString();
    v7 = v6;
    v6 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

    return v6;
  }
  if (AXDoesRequestingClientDeserveAutomation())
  {
    -[VKMapViewAccessibility _axCurrentLocationText](self, "_axCurrentLocationText");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v8 = v7;

      v6 = v8;
    }
    goto LABEL_8;
  }
  if (!v6)
  {
    AXVectorKitLocString(CFSTR("MAP"));
    return (id)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)accessibilityIdentifier
{
  _BOOL4 v3;
  __CFString *v4;
  objc_super v6;

  v3 = -[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView");
  v6.receiver = self;
  v6.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility accessibilityIdentifier](&v6, sel_accessibilityIdentifier);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {

    v4 = CFSTR("PopoverDismissRegion");
  }
  return v4;
}

- (BOOL)accessibilityPerformEscape
{
  void *v3;
  void *v4;
  char v5;
  objc_super v7;

  if (-[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView"))
  {
    -[VKMapViewAccessibility _axMapViewDelegate](self, "_axMapViewDelegate");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("_annotationContainer"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "accessibilityPerformEscape");

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)VKMapViewAccessibility;
    return -[VKMapViewAccessibility accessibilityPerformEscape](&v7, sel_accessibilityPerformEscape);
  }
  return v5;
}

- (CGRect)accessibilityPositionFrameForElement:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  BOOL v20;
  BOOL v21;
  double v22;
  double v23;
  CGRect result;

  if (UIAccessibilityIsVoiceOverRunning()
    && !-[VKMapViewAccessibility accessibilityMapTypeSupportsAccessibility](self, "accessibilityMapTypeSupportsAccessibility"))
  {
    v16 = *MEMORY[0x24BDBF090];
    v17 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v22 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v23 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  else
  {
    VKLocationCoordinate2DForVKPoint();
    v5 = v4;
    v7 = v6;
    VKLocationCoordinate2DForVKPoint();
    v9 = v8;
    v11 = v10;
    -[VKMapViewAccessibility convertCoordinate:toPointToLayer:](self, "convertCoordinate:toPointToLayer:", self, v5, v7);
    v13 = v12;
    v15 = v14;
    -[VKMapViewAccessibility convertCoordinate:toPointToLayer:](self, "convertCoordinate:toPointToLayer:", self, v9, v11);
    v18 = v16;
    v19 = v17;
    v20 = v13 <= v16;
    if (v13 < v16)
      v16 = v13;
    if (!v20)
      v18 = v13;
    v21 = v15 <= v17;
    if (v15 < v17)
      v17 = v15;
    if (!v21)
      v19 = v15;
    v22 = v18 - v16;
    v23 = v19 - v17;
  }
  result.size.height = v23;
  result.size.width = v22;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

- (float)accessibilityRealDistanceBetweenPoint:(CGPoint)a3 screenPoint2:(CGPoint)a4
{
  double y;
  double x;
  double v7;
  double v8;
  double v9;
  double v10;
  long double v11;
  double v12;
  long double v13;
  double v14;
  double v15;
  long double v16;
  double v17;
  long double v18;
  long double v19;
  long double v20;
  long double v21;
  long double v22;
  long double v23;

  y = a4.y;
  x = a4.x;
  -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](self, "accessibilityConvertScreenPointToCoordinate:", a3.x, a3.y);
  v8 = v7;
  v10 = v9;
  -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](self, "accessibilityConvertScreenPointToCoordinate:", x, y);
  v11 = v8 * 0.0174532925;
  v13 = v12 * 0.0174532925;
  v15 = v14 * 0.0174532925;
  v16 = v13 - v8 * 0.0174532925;
  v17 = v15 - v10 * 0.0174532925;
  v18 = sin(v16 * 0.5);
  v19 = v18 * v18;
  v20 = sin(v17 * 0.5);
  v21 = cos(v11) * (v20 * v20);
  v22 = cos(v13);
  v23 = atan2(sqrt(v19 + v21 * v22), sqrt(1.0 - (v19 + v21 * v22)));
  return (v23 + v23) * 6378137.0;
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  BOOL v13;
  id v15;

  -[VKMapViewAccessibility _axMapViewDelegate](self, "_axMapViewDelegate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeValueForKey:", CFSTR("scrollEnabled"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6 && (objc_msgSend(v6, "BOOLValue") & 1) == 0)
  {
    v13 = 0;
  }
  else
  {
    -[VKMapViewAccessibility frame](self, "frame");
    if (-[VKMapViewAccessibility mapType](self, "mapType") == 5)
    {
      -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_navigationCameraController"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      AX_CGRectGetCenter();
    }
    else
    {
      -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_mapCameraController"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "safeValueForKey:", CFSTR("_gestureCameraControllerBehavior"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("_panLastScreenPoint"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "CGPointValue");

    }
    v12 = v8;
    AXPerformSafeBlock();
    switch(a3)
    {
      case 1:
      case 2:
      case 3:
      case 4:
        v15 = v12;
        AXPerformSafeBlock();
        -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("ScrollNotification"));
        AXPerformSafeBlock();

        v13 = 1;
        break;
      default:
        v13 = 0;
        break;
    }

  }
  return v13;
}

uint64_t __46__VKMapViewAccessibility_accessibilityScroll___block_invoke(uint64_t a1)
{
  void *v1;

  v1 = *(void **)(a1 + 32);
  AX_CGRectGetCenter();
  return objc_msgSend(v1, "startPanningAtPoint:panAtStartPoint:", 1);
}

uint64_t __46__VKMapViewAccessibility_accessibilityScroll___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updatePanWithTranslation:", *(double *)(a1 + 40), *(double *)(a1 + 48));
}

void __46__VKMapViewAccessibility_accessibilityScroll___block_invoke_3(uint64_t a1)
{
  id v1;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("cameraDelegate"));
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "mapLayerDidChangeVisibleRegion");

}

- (unint64_t)_accessibilityAutomationType
{
  return 57;
}

- (int64_t)accessibilityContainerType
{
  if (-[VKMapViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 0;
  else
    return 4;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  unint64_t v6;
  _BOOL4 v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)VKMapViewAccessibility;
  v3 = -[VKMapViewAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  v4 = -[VKMapViewAccessibility accessibilityIsShowingCalloutAnnotationView](self, "accessibilityIsShowingCalloutAnnotationView");
  v5 = *MEMORY[0x24BEBB138];
  if (v4)
    v5 = 0;
  v6 = v5 | v3;
  v7 = -[VKMapViewAccessibility accessibilityIsInTourGuideMode](self, "accessibilityIsInTourGuideMode");
  v8 = *MEMORY[0x24BDFEFE0];
  if (!v7)
    v8 = 0;
  return v6 | v8;
}

- (CGPoint)_axIntersectionBetweenRoad:(id)a3 andOtherRoad:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  double *v30;
  uint64_t v31;
  __n128 (*v32)(__n128 *, __n128 *);
  uint64_t (*v33)();
  void *v34;
  int64x2_t v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;
  CGPoint result;

  v38 = *MEMORY[0x24BDAC8D0];
  v20 = a4;
  v29 = 0;
  v30 = (double *)&v29;
  v31 = 0x4012000000;
  v32 = __Block_byref_object_copy__1;
  v33 = __Block_byref_object_dispose__1;
  v34 = &unk_232B640CA;
  v35 = vdupq_n_s64(0x47EFFFFFE0000000uLL);
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  objc_msgSend(a3, "paths");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v5;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v26;
    v17 = *(_QWORD *)v26;
    do
    {
      v8 = 0;
      v18 = v6;
      do
      {
        if (*(_QWORD *)v26 != v7)
          objc_enumerationMutation(v5);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v20, "originalPaths", v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v22;
          while (2)
          {
            for (i = 0; i != v10; ++i)
            {
              if (*(_QWORD *)v22 != v11)
                objc_enumerationMutation(v9);
              AX_CGPathEnumerateElementsUsingBlock();
              v13 = v30[6];
              if (v13 < 3.40282347e38)
              {
                v14 = v30[7];

                goto LABEL_18;
              }
            }
            v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v36, 16);
            if (v10)
              continue;
            break;
          }
        }

        ++v8;
        v5 = v19;
        v7 = v17;
      }
      while (v8 != v18);
      v6 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v25, v37, 16);
    }
    while (v6);
  }

  v13 = v30[6];
  v14 = v30[7];
LABEL_18:
  _Block_object_dispose(&v29, 8);

  v15 = v13;
  v16 = v14;
  result.y = v16;
  result.x = v15;
  return result;
}

BOOL __66__VKMapViewAccessibility__axIntersectionBetweenRoad_andOtherRoad___block_invoke(uint64_t a1, uint64_t a2, CGFloat *a3, uint64_t a4, uint64_t a5, _BYTE *a6)
{
  CGFloat v8;
  CGFloat v9;
  _BOOL8 result;
  uint64_t v11;
  CGPoint v12;

  v8 = *a3;
  v9 = a3[1];
  v12.x = *a3;
  v12.y = v9;
  result = CGPathContainsPoint(*(CGPathRef *)(a1 + 32), 0, v12, 0);
  if (result)
  {
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    *(CGFloat *)(v11 + 48) = v8;
    *(CGFloat *)(v11 + 56) = v9;
    *a6 = 1;
  }
  return result;
}

- (void)_accessibilityMapsExplorationContinueWithVertexIndex:(unint64_t)a3
{
  id v4;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "accessibilityMapsExplorationContinueWithVertexIndex:", a3);

}

- (void)_accessibilityMapsExplorationRecordTouchpoint:(CGPoint)a3
{
  double y;
  double x;
  id v5;

  y = a3.y;
  x = a3.x;
  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExplorationLastTouchPoint:", x, y);

}

- (id)_accessibilityMapsExplorationCurrentRoadsWithAngles
{
  void *v2;
  void *v3;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityMapsExplorationCurrentRoadsWithAngles");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityMapsExplorationCurrentIntersectionDescription
{
  void *v2;
  void *v3;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityMapsExplorationCurrentIntersectionDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityMapsExplorationIncreaseVerbosity
{
  void *v2;
  void *v3;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityMapsExplorationChangeVerbosityIncreasing:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityMapsExplorationDecreaseVerbosity
{
  void *v2;
  void *v3;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityMapsExplorationChangeVerbosityIncreasing:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityMapsExplorationIsActive
{
  void *v2;
  BOOL v3;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "explorationState") == 2;

  return v3;
}

- (BOOL)_accessibilityMapsExplorationIsPending
{
  void *v2;
  BOOL v3;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "explorationState") == 1;

  return v3;
}

- (void)_accessibilityMapsExplorationEnd
{
  id v2;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityMapsExplorationEnd");

}

- (id)accessibilityIntersectorsForRoad:(id)a3 withPoint:(CGPoint)a4
{
  double y;
  double x;
  uint64_t v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unsigned int *v13;
  unsigned int v14;
  unsigned int v15;
  unsigned int *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  AXVKIntersector *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  AXVKIntersector *v42;
  void *v43;
  void *v44;
  AXVKIntersector *v45;
  AXVKIntersector *v46;
  void *v47;
  void *v48;
  AXVKIntersector *v49;
  void *v50;
  VKMapViewAccessibility *v52;
  id v53;
  id obj;
  uint64_t v55;
  void *v56;
  uint64_t i;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  void *v61;
  void *v62;
  id v63;
  void *v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _QWORD v69[200];
  _BYTE v70[128];
  uint64_t v71;

  y = a4.y;
  x = a4.x;
  v52 = self;
  v71 = *MEMORY[0x24BDAC8D0];
  v53 = a3;
  v63 = objc_alloc_init(MEMORY[0x24BDBCEF0]);
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  objc_msgSend(v53, "featureSet");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
  if (v6)
  {
    v55 = *(_QWORD *)v66;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v66 != v55)
          objc_enumerationMutation(obj);
        objc_msgSend(*(id *)(*((_QWORD *)&v65 + 1) + 8 * i), "feature", v52);
        v56 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v56, "feature");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "containingTile");
        v64 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v64)
          _AXAssert();
        v58 = objc_msgSend(v64, "geoConnectivityPointOnRoad");
        objc_msgSend(v64, "junctionsWithoutFeature");
        v61 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v64, "lines");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        v9 = v56;
        v10 = objc_msgSend(v64, "geoSortedConnectivityPointOnRoad");
        v11 = objc_msgSend(v9, "roadPointIndex");
        v60 = objc_msgSend(v9, "roadPointCount");
        if (v60)
        {
          v12 = 0;
          v59 = v10 + 8 * v11;
          do
          {
            v13 = *(unsigned int **)(v59 + 8 * v12);
            objc_msgSend(v61, "objectAtIndexedSubscript:", *v13);
            v62 = (void *)objc_claimAutoreleasedReturnValue();
            v14 = objc_msgSend(v62, "pointsOnRoadIndex");
            v15 = objc_msgSend(v62, "pointsOnRoadCount");
            if (v15)
            {
              v16 = (unsigned int *)(v58 + 16 * v14);
              v17 = v15;
              do
              {
                if (v16 != v13)
                {
                  objc_msgSend(v8, "objectAtIndexedSubscript:", v16[1]);
                  v18 = (void *)objc_claimAutoreleasedReturnValue();
                  if ((GEOMultiSectionFeatureIsSameRoad() & 1) == 0)
                  {
                    v20 = v13[2];
                    v19 = v13[3];
                    GEOMultiSectionFeatureGetSectionData();
                    v21 = v69[2 * v20 + 100];
                    objc_msgSend(v64, "geoTileKey");
                    VKWorldBoundsFromGEOTileKey();
                    AXVKPointForTileGLPoint(v22, v23, v24, v25, *(float *)&v69[v21 + v19]);
                    VKLocationCoordinate2DForVKPoint();
                    v28 = -[AXVKIntersector initWithFeature:coordinates:isDeadEnd:]([AXVKIntersector alloc], "initWithFeature:coordinates:isDeadEnd:", v18, 0, v26, v27);
                    objc_msgSend(v63, "addObject:", v28);

                  }
                }
                v16 += 4;
                --v17;
              }
              while (v17);
            }

            ++v12;
          }
          while (v12 != v60);
        }

      }
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v65, v70, 16);
    }
    while (v6);
  }

  v29 = objc_msgSend(v53, "featureAndPointIndicesForPoint:", x, y);
  if (v29 != -1)
  {
    objc_msgSend(v53, "consolidatedAndOrderedFeatures");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectAtIndex:", v29);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "firstObject");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "lastObject");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "CGPointValue");
    v35 = v34;
    v37 = v36;
    objc_msgSend(v33, "CGPointValue");
    v39 = v38;
    v41 = v40;
    v42 = [AXVKIntersector alloc];
    objc_msgSend(v53, "pointToFeatureDict");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "objectForKey:", v32);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](v52, "accessibilityConvertScreenPointToCoordinate:", v35, v37);
    v45 = -[AXVKIntersector initWithFeatureWrapper:coordinates:isDeadEnd:](v42, "initWithFeatureWrapper:coordinates:isDeadEnd:", v44, 1);

    v46 = [AXVKIntersector alloc];
    objc_msgSend(v53, "pointToFeatureDict");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "objectForKey:", v33);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibility accessibilityConvertScreenPointToCoordinate:](v52, "accessibilityConvertScreenPointToCoordinate:", v39, v41);
    v49 = -[AXVKIntersector initWithFeatureWrapper:coordinates:isDeadEnd:](v46, "initWithFeatureWrapper:coordinates:isDeadEnd:", v48, 1);

    objc_msgSend(v63, "addObject:", v45);
    objc_msgSend(v63, "addObject:", v49);

  }
  objc_msgSend(v63, "allObjects", v52);
  v50 = (void *)objc_claimAutoreleasedReturnValue();

  return v50;
}

- (void)accessibilitySetMapZoomLevel:(double)a3 center:(id)a4 yaw:(double)a5 completionHandler:(id)a6
{
  double var1;
  double var0;
  id v11;
  id v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  _QWORD v17[5];
  id v18;
  double v19;
  double v20;
  double v21;

  var1 = a4.var1;
  var0 = a4.var0;
  v11 = a6;
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __84__VKMapViewAccessibility_accessibilitySetMapZoomLevel_center_yaw_completionHandler___block_invoke;
  v17[3] = &unk_2503C5190;
  v17[4] = self;
  v19 = a3;
  v20 = var0;
  v21 = var1;
  v12 = v11;
  v18 = v12;
  v13 = (void *)MEMORY[0x234923E94](v17);
  -[VKMapViewAccessibility altitude](self, "altitude");
  v15 = v14;
  -[VKMapViewAccessibility pitch](self, "pitch");
  -[VKMapViewAccessibility setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:](self, "setCenterCoordinate:altitude:yaw:pitch:duration:timingCurve:completion:", *MEMORY[0x24BEBFBE0], v13, var0, var1, v15, a5, v16, 0.1);

}

uint64_t __84__VKMapViewAccessibility_accessibilitySetMapZoomLevel_center_yaw_completionHandler___block_invoke(uint64_t a1)
{
  double v2;
  float v3;
  double v4;
  double v5;
  double v6;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "accessibilityZoomLevel");
  v4 = v2 - v3;
  objc_msgSend(*(id *)(a1 + 32), "accessibilityConvertCoordinateToWindow:", *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityZoom:point:animated:completionHandler:", 0, *(_QWORD *)(a1 + 40), v4, v5, v6);
}

- (id)accessibilityUpcomingRoadsForPoint:(CGPoint)a3 forAngle:(float)a4 withElement:(id)a5
{
  CGFloat y;
  CGFloat x;
  id v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  double *v15;
  uint64_t i;
  id v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  uint64_t v31;
  double v32;
  uint64_t j;
  void *v34;
  void *v35;
  double v36;
  CGFloat v37;
  double v38;
  CGFloat v39;
  double v40;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  id v51;
  void *v52;
  void *v53;
  id obj;
  id obja;
  id v56;
  double v57;
  double v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  _QWORD v67[2];
  _QWORD v68[2];
  _BYTE v69[128];
  _QWORD v70[2];
  _BYTE v71[128];
  uint64_t v72;
  CGPoint v73;
  CGPoint v74;

  y = a3.y;
  x = a3.x;
  v72 = *MEMORY[0x24BDAC8D0];
  v56 = a5;
  objc_msgSend(v56, "intersectingRoads");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  if (!v9)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    obj = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setIntersectingRoads:");
    -[VKMapViewAccessibility accessibilityElements](self, "accessibilityElements");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "copy");

    v65 = 0u;
    v66 = 0u;
    v63 = 0u;
    v64 = 0u;
    v12 = v11;
    v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
    if (v13)
    {
      v14 = *(_QWORD *)v64;
      v15 = (double *)MEMORY[0x24BDBEFB0];
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v64 != v14)
            objc_enumerationMutation(v12);
          v17 = *(id *)(*((_QWORD *)&v63 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & (v17 != v56)) != 0)
          {
            -[VKMapViewAccessibility _axIntersectionBetweenRoad:andOtherRoad:](self, "_axIntersectionBetweenRoad:andOtherRoad:", v56, v17);
            v20 = v19;
            v21 = fabs(v19 + -3.40282347e38);
            if (v21 >= 0.001)
            {
              v24 = v18;
            }
            else
            {
              -[VKMapViewAccessibility _axIntersectionBetweenRoad:andOtherRoad:](self, "_axIntersectionBetweenRoad:andOtherRoad:", v17, v56);
              v20 = v22;
              v24 = v23;
              v21 = fabs(v22 + -3.40282347e38);
            }
            if (v21 > 0.001 && (*v15 != v20 || v15[1] != v24))
            {
              v70[0] = v17;
              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v20, v24);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v70[1] = v26;
              objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v70, 2);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(obj, "addObject:", v27);

              objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGPoint:", v20, v24);
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v52, "addObject:", v28);

            }
          }
        }
        v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v63, v71, 16);
      }
      while (v13);
    }

    v9 = obj;
    +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "addIntersectionPoints:", v52);

  }
  if (objc_msgSend(v9, "count"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    v61 = 0u;
    v62 = 0u;
    v59 = 0u;
    v60 = 0u;
    v51 = v9;
    obja = v9;
    v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v69, 16);
    if (v30)
    {
      v31 = *(_QWORD *)v60;
      v32 = a4;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v60 != v31)
            objc_enumerationMutation(obja);
          v34 = *(void **)(*((_QWORD *)&v59 + 1) + 8 * j);
          objc_msgSend(v34, "objectAtIndex:", 1);
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "CGPointValue");
          v37 = v36;
          v39 = v38;

          v57 = 0.0;
          v58 = 0.0;
          v73.x = x;
          v73.y = y;
          v74.x = v37;
          v74.y = v39;
          AXVKMathGetVectorAndDistanceForPoints(&v58, &v57, v73, v74);
          v40 = v57;
          if (vabdd_f64(v58, v32) < 35.0 && v57 < 40.0)
          {
            v67[0] = CFSTR("distance");
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v57);
            v42 = (void *)objc_claimAutoreleasedReturnValue();
            v67[1] = CFSTR("item");
            v68[0] = v42;
            objc_msgSend(v34, "firstObject");
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v68[1] = v43;
            objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v68, v67, 2);
            v44 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v53, "addObject:", v44);

          }
        }
        v30 = objc_msgSend(obja, "countByEnumeratingWithState:objects:count:", &v59, v69, 16, v40);
      }
      while (v30);
    }

    objc_msgSend(v53, "sortUsingComparator:", &__block_literal_global_4);
    objc_msgSend(v53, "firstObject");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "objectForKey:", CFSTR("item"));
    v46 = (void *)objc_claimAutoreleasedReturnValue();

    if ((unint64_t)objc_msgSend(v53, "count") < 2)
    {
      v48 = 0;
    }
    else
    {
      objc_msgSend(v53, "objectAtIndex:", 1);
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "objectForKey:", CFSTR("item"));
      v48 = (void *)objc_claimAutoreleasedReturnValue();

    }
    objc_msgSend(MEMORY[0x24BDBCE30], "axArrayByIgnoringNilElementsWithCount:", 2, v46, v48);
    v49 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = v51;
  }
  else
  {
    v49 = 0;
  }

  return v49;
}

uint64_t __82__VKMapViewAccessibility_accessibilityUpcomingRoadsForPoint_forAngle_withElement___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "objectForKeyedSubscript:", CFSTR("distance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("distance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "compare:", v6);

  return v7;
}

- (float)accessibilityDistance:(CGPoint)a3 forAngle:(float)a4 toRoad:(id)a5 withElement:(id)a6
{
  CGFloat y;
  CGFloat x;
  CGFloat v8;
  CGFloat v9;
  double v11;
  double v12;
  CGPoint v13;
  CGPoint v14;

  y = a3.y;
  x = a3.x;
  -[VKMapViewAccessibility _axIntersectionBetweenRoad:andOtherRoad:](self, "_axIntersectionBetweenRoad:andOtherRoad:", a6, a5);
  v14.x = v8;
  v14.y = v9;
  v11 = 0.0;
  v12 = 0.0;
  v13.x = x;
  v13.y = y;
  AXVKMathGetVectorAndDistanceForPoints(&v12, &v11, v13, v14);
  return v11;
}

- (float)accessibilityDistanceToEndOfRoad:(CGPoint)a3 forAngle:(float)a4 withElement:(id)a5
{
  CGFloat y;
  CGFloat x;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  float v10;
  double v11;
  float v12;
  float v13;
  double v15;
  double v16;
  CGPoint v17;
  CGPoint v18;
  CGPoint v19;
  CGPoint v20;

  y = a3.y;
  x = a3.x;
  objc_msgSend(a5, "originalPaths");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "count");
  if (v8 < 1)
  {
    v10 = 3.4028e38;
  }
  else
  {
    v9 = 0;
    v10 = 3.4028e38;
    do
    {
      objc_msgSend(v7, "objectAtIndex:", v9);
      AX_CGPathGetStartingAndEndingPoints();
      v15 = 0.0;
      v16 = 0.0;
      v19.x = x;
      v19.y = y;
      AXVKMathGetVectorAndDistanceForPoints(&v16, &v15, v18, v19);
      v11 = v15;
      v20.x = x;
      v20.y = y;
      AXVKMathGetVectorAndDistanceForPoints(&v16, &v15, v17, v20);
      if (v11 >= v10)
      {
        v13 = v10;
      }
      else
      {
        v12 = v11;
        v13 = v12;
      }
      if (v15 >= v13)
        v10 = v13;
      else
        v10 = v15;
      ++v9;
    }
    while (v8 != v9);
  }

  return v10;
}

- (CGRect)accessibilityVisibleAXViewBounds
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXStoredVisibleViewBounds"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "CGRectValue");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;

  v11 = v4;
  v12 = v6;
  v13 = v8;
  v14 = v10;
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (void)accessibilityClearVisibleAXBoundsFrame
{
  -[VKMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", CFSTR("AXStoredVisibleViewBounds"));
}

- (BOOL)accessibilityViewBoundsContainsPathPoint:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  void *v23;
  BOOL v24;
  CGPoint v26;
  CGRect v27;
  CGRect v28;

  y = a3.y;
  x = a3.x;
  -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXStoredVisibleViewBounds"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "CGRectValue");
    v9 = v8;
    v11 = v10;
    v13 = v12;
    v15 = v14;
  }
  else
  {
    -[VKMapViewAccessibility bounds](self, "bounds");
    -[VKMapViewAccessibility _axWindow](self, "_axWindow");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "_accessibilityFindSubviewDescendant:", &__block_literal_global_335);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v17, "isHidden") & 1) == 0)
    {
      objc_msgSend(v17, "frame");
      CGRectGetMaxY(v27);
    }
    -[VKMapViewAccessibility accessibilityContainer](self, "accessibilityContainer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityFrameForBounds();
    v9 = v19;
    v11 = v20;
    v13 = v21;
    v15 = v22;

    objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", v9, v11, v13, v15);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v23, CFSTR("AXStoredVisibleViewBounds"));

  }
  v28.origin.x = v9;
  v28.origin.y = v11;
  v28.size.width = v13;
  v28.size.height = v15;
  v26.x = x;
  v26.y = y;
  v24 = CGRectContainsPoint(v28, v26);

  return v24;
}

uint64_t __67__VKMapViewAccessibility_accessibilityViewBoundsContainsPathPoint___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (CGPoint)_accessibilityMapViewPointForZoomPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGPoint result;

  if (a3.x < 0.0 || (y = a3.y, a3.y < 0.0))
  {
    -[VKMapViewAccessibility bounds](self, "bounds");
    AX_CGRectGetCenter();
  }
  else
  {
    x = a3.x;
    -[VKMapViewAccessibility _accessibilityWindow](self, "_accessibilityWindow");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKMapViewAccessibility convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v7, x, y);
    v9 = v8;
    v11 = v10;

    v12 = v9;
    v13 = v11;
  }
  result.y = v13;
  result.x = v12;
  return result;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double v4;
  double v5;

  -[VKMapViewAccessibility _accessibilityMapViewPointForZoomPoint:](self, "_accessibilityMapViewPointForZoomPoint:", a3.x, a3.y);
  return -[VKMapViewAccessibility accessibilityZoom:point:completionHandler:](self, "accessibilityZoom:point:completionHandler:", 0, 1.0, v4, v5);
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double v4;
  double v5;

  -[VKMapViewAccessibility _accessibilityMapViewPointForZoomPoint:](self, "_accessibilityMapViewPointForZoomPoint:", a3.x, a3.y);
  return -[VKMapViewAccessibility accessibilityZoom:point:completionHandler:](self, "accessibilityZoom:point:completionHandler:", 0, -1.0, v4, v5);
}

- (void)accessibilityIncreaseTrackingDetail
{
  +[VKMapViewTourGuideManager increaseDetailLevel](VKMapViewTourGuideManager, "increaseDetailLevel");
}

- (void)accessibilityDecreaseTrackingDetail
{
  +[VKMapViewTourGuideManager decreaseDetailLevel](VKMapViewTourGuideManager, "decreaseDetailLevel");
}

- (BOOL)_allowCustomActionHintSpeakOverride
{
  return 0;
}

- (BOOL)accessibilityMapLoadingComplete
{
  void *v2;
  void *v3;
  char v4;

  -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("MapLoadingComplete"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "BOOLValue");
  else
    v4 = 1;

  return v4;
}

- (BOOL)accessibilityIsInTourGuideMode
{
  void *v2;
  char v3;

  -[VKMapViewAccessibility _axTourGuideManager](self, "_axTourGuideManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isRunning");

  return v3;
}

- (id)accessibilityCalloutAnnotationView
{
  return 0;
}

- (BOOL)accessibilityIsShowingCalloutAnnotationView
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  CGRect v13;
  CGRect v14;
  CGRect v15;

  -[VKMapViewAccessibility accessibilityCalloutAnnotationView](self, "accessibilityCalloutAnnotationView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  v13.origin.x = v5;
  v13.origin.y = v7;
  v13.size.width = v9;
  v13.size.height = v11;
  if (CGRectIsEmpty(v13))
    return 0;
  -[VKMapViewAccessibility accessibilityFrame](self, "accessibilityFrame");
  v15.origin.x = v5;
  v15.origin.y = v7;
  v15.size.width = v9;
  v15.size.height = v11;
  return CGRectContainsRect(v14, v15);
}

- (BOOL)accessibilityZoom:(double)a3 point:(CGPoint)a4 completionHandler:(id)a5
{
  return -[VKMapViewAccessibility accessibilityZoom:point:animated:completionHandler:](self, "accessibilityZoom:point:animated:completionHandler:", 0, a5, a3, a4.x, a4.y);
}

- (BOOL)accessibilityZoom:(double)a3 point:(CGPoint)a4 animated:(BOOL)a5 completionHandler:(id)a6
{
  void (**v8)(_QWORD);
  void *v9;
  void *v10;
  void *v11;
  float v12;
  float v13;
  void *v14;
  float v15;
  float v16;
  void *v17;
  float v18;
  float v19;
  BOOL v20;
  void *v22;
  void *v23;
  void *v24;
  void (**v25)(_QWORD);
  CGRect v26;
  CGRect v27;

  v8 = (void (**)(_QWORD))a6;
  -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapDelegate"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (a3 == 0.0)
  {
    if (v8)
      goto LABEL_10;
    goto LABEL_11;
  }
  if (!objc_msgSend(v9, "conformsToProtocol:", &unk_256009908))
    goto LABEL_11;
  objc_msgSend(v10, "safeValueForKey:", CFSTR("maximumZoomLevel"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "floatValue");
  v13 = v12;

  objc_msgSend(v10, "safeValueForKey:", CFSTR("minimumZoomLevel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "floatValue");
  v16 = v15;

  objc_msgSend(v10, "safeValueForKey:", CFSTR("_zoomLevel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "floatValue");
  v19 = roundf(v18);

  if (a3 > 0.0 && v19 >= roundf(v13) || a3 < 0.0 && v19 <= roundf(v16))
  {
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDC0]);
    if (v8)
LABEL_10:
      v8[2](v8);
LABEL_11:
    v20 = 0;
    goto LABEL_12;
  }
  if (-[VKMapViewAccessibility _axTrackingEnabled](self, "_axTrackingEnabled")
    || -[VKMapViewAccessibility _axTrackingWithHeadingEnabled](self, "_axTrackingWithHeadingEnabled"))
  {
    objc_opt_class();
    -[VKMapViewAccessibility _axUserLocationMarker](self, "_axUserLocationMarker");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    if (v23)
    {
      objc_msgSend(v23, "_presentationCoordinate");
      VKLocationCoordinate2DMake();
      -[VKMapViewAccessibility accessibilityConvertCoordinateToWindow:](self, "accessibilityConvertCoordinateToWindow:");
    }
    else
    {
      _AXAssert();
      -[VKMapViewAccessibility bounds](self, "bounds");
      CGRectGetMidX(v26);
      -[VKMapViewAccessibility bounds](self, "bounds");
      CGRectGetMidY(v27);
    }

  }
  -[VKMapViewAccessibility accessibilityLayerHostingView](self, "accessibilityLayerHostingView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPointToPoint();

  -[VKMapViewAccessibility bounds](self, "bounds");
  if (!-[VKMapViewAccessibility accessibilityIsInTourGuideMode](self, "accessibilityIsInTourGuideMode"))
    -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("ZoomNotification"));
  _AXLogWithFacility();
  v25 = v8;
  AXPerformSafeBlock();

  v20 = 1;
LABEL_12:

  return v20;
}

void __77__VKMapViewAccessibility_accessibilityZoom_point_animated_completionHandler___block_invoke(uint64_t a1)
{
  int v2;
  void *v3;
  uint64_t v4;
  id v5;

  v2 = *(unsigned __int8 *)(a1 + 72);
  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("_mapCameraController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(a1 + 40);
  v5 = v3;
  if (v2)
    objc_msgSend(v3, "zoom:withFocusPoint:completionHandler:", v4, *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  else
    objc_msgSend(v3, "tapZoom:levels:completionHandler:", v4, *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 48));

}

- (float)accessibilityZoomLevel
{
  void *v2;
  float v3;
  float v4;

  -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MKMapView"));
  v3 = 0.0;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v2, "safeFloatForKey:", CFSTR("_zoomLevel"));
    v3 = roundf(v4);
  }

  return v3;
}

- (int)_accessibilityMapType
{
  void *v2;
  int v3;

  -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapType"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerValue");

  return v3;
}

- (BOOL)accessibilityMapTypeSupportsAccessibility
{
  return (-[VKMapViewAccessibility _accessibilityMapType](self, "_accessibilityMapType") & 0xFFFFFFF7) == 0;
}

- (BOOL)accessibilityMapTypeShouldShowTransit
{
  return -[VKMapViewAccessibility _accessibilityMapType](self, "_accessibilityMapType") == 8;
}

- (BOOL)accessibilityOnlyShowRouteNodesDuringTransit
{
  return 0;
}

- (BOOL)isAccessibilityElement
{
  BOOL v3;
  void *v4;
  uint64_t v5;

  if (-[VKMapViewAccessibility accessibilityIsShowingRoutes](self, "accessibilityIsShowingRoutes"))
    v3 = -[VKMapViewAccessibility accessibilityMapTypeShouldShowTransit](self, "accessibilityMapTypeShouldShowTransit");
  else
    v3 = 1;
  -[VKMapViewAccessibility accessibilityElements](self, "accessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "count");

  return !v5 && v3;
}

- (id)_accessibilityHitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  id v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  VKMapViewAccessibility *v16;
  VKMapViewAccessibility *v17;
  _QWORD v19[5];
  id v20;
  uint64_t *v21;
  uint64_t v22;
  uint64_t v23;
  CGFloat v24;
  CGFloat v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t (*v29)(uint64_t, uint64_t);
  void (*v30)(uint64_t);
  id v31;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[VKMapViewAccessibility _accessibilityParentView](self, "_accessibilityParentView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPointForPoint();
  v10 = v9;
  v12 = v11;

  -[VKMapViewAccessibility accessibilityElements](self, "accessibilityElements");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_msgSend(v13, "copy");

  v26 = 0;
  v27 = &v26;
  v28 = 0x3032000000;
  v29 = __Block_byref_object_copy__468;
  v30 = __Block_byref_object_dispose__469;
  v31 = 0;
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __58__VKMapViewAccessibility__accessibilityHitTest_withEvent___block_invoke;
  v19[3] = &unk_2503C5240;
  v22 = v10;
  v23 = v12;
  v24 = x;
  v25 = y;
  v21 = &v26;
  v19[4] = self;
  v15 = v7;
  v20 = v15;
  objc_msgSend(v14, "enumerateObjectsUsingBlock:", v19);
  v16 = (VKMapViewAccessibility *)v27[5];
  if (!v16)
    v16 = self;
  v17 = v16;

  _Block_object_dispose(&v26, 8);
  return v17;
}

void __58__VKMapViewAccessibility__accessibilityHitTest_withEvent___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  double v7;
  double v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  id v14;

  v14 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    if (objc_msgSend(v14, "pointInside:", *(double *)(a1 + 56), *(double *)(a1 + 64)))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), a2);
      *a4 = 1;
    }
  }
  else
  {
    v7 = *(double *)(a1 + 72);
    v8 = *(double *)(a1 + 80);
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v9 = *(void **)(a1 + 32);
      objc_msgSend(v14, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertPoint:toLayer:", v10, v7, v8);
      v7 = v11;
      v8 = v12;

    }
    objc_msgSend(v14, "_accessibilityHitTest:withEvent:", *(_QWORD *)(a1 + 40), v7, v8);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "isAccessibilityElement"))
    {
      objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), v13);
      *a4 = 1;
    }

  }
}

- (id)_accessibilityScrollStatus
{
  void *v3;
  objc_super v5;

  if (-[VKMapViewAccessibility _axTrackingWithHeadingEnabled](self, "_axTrackingWithHeadingEnabled"))
  {
    -[VKMapViewAccessibility accessibilityTourStatus](self, "accessibilityTourStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)VKMapViewAccessibility;
    -[VKMapViewAccessibility _accessibilityScrollStatus](&v5, sel__accessibilityScrollStatus);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)accessibilityBounds
{
  __int128 v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  _QWORD v19[6];
  uint64_t v20;
  uint64_t v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  VKMapViewAccessibility *v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  __n128 (*v34)(uint64_t, uint64_t);
  uint64_t (*v35)();
  void *v36;
  __int128 v37;
  __int128 v38;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  v31 = 0;
  v32 = &v31;
  v33 = 0x5012000000;
  v34 = __Block_byref_object_copy__476;
  v35 = __Block_byref_object_dispose__477;
  v36 = &unk_232B640CA;
  v2 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v37 = *MEMORY[0x24BDBF090];
  v38 = v2;
  v25 = MEMORY[0x24BDAC760];
  v26 = 3221225472;
  v27 = __45__VKMapViewAccessibility_accessibilityBounds__block_invoke;
  v28 = &unk_2503C5268;
  v29 = self;
  v30 = &v31;
  AXPerformSafeBlock();
  CGRectGetMaxX(*(CGRect *)(v32 + 6));
  CGRectGetMaxY(*(CGRect *)(v32 + 6));
  CGRectGetMinX(*(CGRect *)(v32 + 6));
  CGRectGetMinY(*(CGRect *)(v32 + 6));
  v22[0] = 0;
  v22[1] = v22;
  v22[2] = 0x4012000000;
  v22[3] = __Block_byref_object_copy__479;
  v22[4] = __Block_byref_object_dispose__480;
  v23 = 0;
  v24 = 0;
  v22[5] = &unk_232B640CA;
  VKLocationCoordinate2DMake();
  v23 = v3;
  v24 = v4;
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x4012000000;
  v19[3] = __Block_byref_object_copy__479;
  v19[4] = __Block_byref_object_dispose__480;
  v20 = 0;
  v21 = 0;
  v19[5] = &unk_232B640CA;
  VKLocationCoordinate2DMake();
  v20 = v5;
  v21 = v6;
  AXPerformSafeBlock();
  VKPointForVKLocationCoordinate2D();
  v8 = v7;
  v10 = v9;
  VKPointForVKLocationCoordinate2D();
  if (v8 <= v11)
    v13 = v11;
  else
    v13 = v8;
  if (v8 >= v11)
    v8 = v11;
  if (v10 <= v12)
    v14 = v12;
  else
    v14 = v10;
  if (v10 >= v12)
    v10 = v12;
  _Block_object_dispose(v19, 8);
  _Block_object_dispose(v22, 8);
  _Block_object_dispose(&v31, 8);
  v15 = v8;
  v16 = v13;
  v17 = v10;
  v18 = v14;
  result.var3 = v18;
  result.var2 = v17;
  result.var1 = v16;
  result.var0 = v15;
  return result;
}

uint64_t __45__VKMapViewAccessibility_accessibilityBounds__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "bounds");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  v3[9] = v7;
  return result;
}

uint64_t __45__VKMapViewAccessibility_accessibilityBounds__block_invoke_483(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t result;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  objc_msgSend(*(id *)(a1 + 32), "convertPoint:toCoordinateFromLayer:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 56), *(double *)(a1 + 64));
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v2 + 48) = v3;
  *(_QWORD *)(v2 + 56) = v4;
  result = objc_msgSend(*(id *)(a1 + 32), "convertPoint:toCoordinateFromLayer:", *(_QWORD *)(a1 + 32), *(double *)(a1 + 72), *(double *)(a1 + 80));
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  *(_QWORD *)(v6 + 48) = v7;
  *(_QWORD *)(v6 + 56) = v8;
  return result;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)accessibilityCenter
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  _QWORD v11[6];
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x4812000000;
  v11[3] = __Block_byref_object_copy__484;
  v11[4] = __Block_byref_object_dispose__485;
  v11[5] = &unk_232B640CA;
  v12 = 0;
  v13 = 0;
  v14 = 0;
  VKLocationCoordinate3DMake();
  v12 = v2;
  v13 = v3;
  v14 = v4;
  AXPerformSafeBlock();
  VKLocationCoordinate2DMake();
  v6 = v5;
  v8 = v7;
  _Block_object_dispose(v11, 8);
  v9 = v6;
  v10 = v8;
  result.var1 = v10;
  result.var0 = v9;
  return result;
}

uint64_t __45__VKMapViewAccessibility_accessibilityCenter__block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "centerCoordinate");
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  return result;
}

- (int64_t)accessibilityOrientation
{
  void *v2;
  void *v3;
  void *v4;
  int64_t v5;

  -[VKMapViewAccessibility _accessibilityParentView](self, "_accessibilityParentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "windowScene");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "interfaceOrientation");

  return v5;
}

- (double)accessibilityYaw
{
  double v2;
  uint64_t v4;
  double *v5;
  uint64_t v6;
  uint64_t v7;

  v4 = 0;
  v5 = (double *)&v4;
  v6 = 0x2020000000;
  v7 = 0;
  AXPerformSafeBlock();
  v2 = v5[3];
  _Block_object_dispose(&v4, 8);
  return v2;
}

uint64_t __42__VKMapViewAccessibility_accessibilityYaw__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "yaw");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

- (id)_axMapViewDelegate
{
  void *v2;
  void *v3;

  -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("MKLookAroundView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    objc_opt_class();
    __UIAccessibilityCastAsClass();
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v3;
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

- (id)_axWindow
{
  void *v2;
  void *v3;

  -[VKMapViewAccessibility accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("window"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- ($F24F406B2B787EFB06265DBA3D28CBD5)accessibilityConvertScreenPointToCoordinate:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  _QWORD v21[9];
  $F24F406B2B787EFB06265DBA3D28CBD5 result;

  y = a3.y;
  x = a3.x;
  -[VKMapViewAccessibility frame](self, "frame");
  -[VKMapViewAccessibility _axWindow](self, "_axWindow");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:fromWindow:", 0, x, y);
  v8 = v7;
  v10 = v9;

  -[VKMapViewAccessibility _axWindow](self, "_axWindow");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "layer");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibility convertPoint:fromLayer:](self, "convertPoint:fromLayer:", v12, v8, v10);

  -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("currentCanvas"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "valueForKey:", CFSTR("_vkCamera"));
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x4812000000;
  v21[3] = __Block_byref_object_copy__499;
  v21[4] = __Block_byref_object_dispose__500;
  v21[5] = &unk_232B640CA;
  v20 = (id)objc_claimAutoreleasedReturnValue();
  AXPerformSafeBlock();
  VKLocationCoordinate2DForVKPoint();
  v15 = v14;
  v17 = v16;

  _Block_object_dispose(v21, 8);
  v18 = v15;
  v19 = v17;
  result.var1 = v19;
  result.var0 = v18;
  return result;
}

uint64_t __70__VKMapViewAccessibility_accessibilityConvertScreenPointToCoordinate___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  result = objc_msgSend(*(id *)(a1 + 32), "groundPointFromScreenPoint:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 40) + 8);
  v3[6] = v4;
  v3[7] = v5;
  v3[8] = v6;
  return result;
}

- (id)_axLastSummaryForVisibleBounds
{
  JUMPOUT(0x234923C00);
}

- (void)_axSetLastSummaryForVisibleBounds:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axSummaryForVisibleBounds
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  char v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  VKMapViewAccessibility *v31;
  void *v32;
  const __CFString *v33;
  void *v35;
  uint64_t v36;
  uint64_t v37;
  void *v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  -[VKMapViewAccessibility accessibilityElements](self, "accessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "copy");

  v41 = 0u;
  v42 = 0u;
  v39 = 0u;
  v40 = 0u;
  v4 = v3;
  v5 = 0;
  v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
  if (v6)
  {
    v35 = 0;
    v36 = 0;
    v37 = 0;
    v7 = *(_QWORD *)v40;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v40 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v39 + 1) + 8 * i);
        if ((objc_msgSend(v9, "_accessibilityIsFrameOutOfBounds", v32, v33) & 1) == 0)
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v10 = v9;
            if (objc_msgSend(v10, "mapFeatureType") == 25)
            {
              ++v5;
            }
            else if (objc_msgSend(v10, "isRoad"))
            {
              ++v37;
            }
            else if (objc_msgSend(v10, "mapFeatureType") && v36 <= 2)
            {
              objc_msgSend(v10, "accessibilityLabel");
              v32 = (void *)objc_claimAutoreleasedReturnValue();
              v33 = CFSTR("__AXStringForVariablesSentinel");
              __UIAXStringForVariables();
              v11 = objc_claimAutoreleasedReturnValue();

              v35 = (void *)v11;
              ++v36;
            }

          }
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v39, v43, 16);
    }
    while (v6);
  }
  else
  {
    v35 = 0;
    v37 = 0;
  }

  v12 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(CFSTR("ROAD_SUMMARY_FORMAT"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "localizedStringWithFormat:", v13, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(CFSTR("POI_SUMMARY"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v35;
  if (!v35)
  {
    AXFormatInteger();
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v14, "localizedStringWithFormat:", v15, v16);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v35)

  v18 = (void *)MEMORY[0x24BDD17C8];
  AXVectorKitLocString(CFSTR("BUILDING_SUMMARY_FORMAT"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "localizedStringWithFormat:", v19, v5);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  __UIAXStringForVariables();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[VKMapViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("TransitionNotification"), v38, v20, CFSTR("__AXStringForVariablesSentinel")))
  {
    if (!objc_msgSend(v21, "length"))
      goto LABEL_31;
    -[VKMapViewAccessibility _axLastSummaryForVisibleBounds](self, "_axLastSummaryForVisibleBounds");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v23 = objc_msgSend(v21, "isEqualToString:", v22);

    if ((v23 & 1) != 0)
      goto LABEL_31;
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEC18]);
    +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "queueOutput:", v24);
  }
  else
  {
    if (!-[VKMapViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("ZoomNotification")))
    {
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72E0], v21);
      v31 = self;
      goto LABEL_33;
    }
    -[VKMapViewAccessibility accessibilityZoomLevel](self, "accessibilityZoomLevel");
    v26 = (void *)MEMORY[0x24BDD17C8];
    AXVectorKitLocString(CFSTR("ZOOM_STEP_LEVEL"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    AXFormatInteger();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v27, v28);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v29 = objc_claimAutoreleasedReturnValue();

    +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager", 0, v21, CFSTR("__AXStringForVariablesSentinel"));
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "clearOutputQueue");

    +[VKMapViewOutputManager sharedOutputManager](VKMapViewOutputManager, "sharedOutputManager");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "queueOutput:", v29);
    v21 = (void *)v29;
  }

LABEL_31:
  v31 = self;
LABEL_33:
  -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](v31, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("ScrollNotification"));
  -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](v31, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("TransitionNotification"));
  -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](v31, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("ZoomNotification"));
  -[VKMapViewAccessibility _axSetLastSummaryForVisibleBounds:](v31, "_axSetLastSummaryForVisibleBounds:", v21);

}

- (void)_accessibilityMapViewDidChangeVisibleRegion
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if (_UIAccessibilityIsEnabled()
    && !-[VKMapViewAccessibility _axTrackingWithHeadingEnabled](self, "_axTrackingWithHeadingEnabled")
    && (-[VKMapViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) == 0)
  {
    -[VKMapViewAccessibility _axMapLabelLayoutTimer](self, "_axMapLabelLayoutTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __69__VKMapViewAccessibility__accessibilityMapViewDidChangeVisibleRegion__block_invoke;
    v4[3] = &unk_2503C52E0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "afterDelay:processBlock:", v4, 0.25);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);

  }
}

void __69__VKMapViewAccessibility__accessibilityMapViewDidChangeVisibleRegion__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axUpdateElements");

}

- (void)_accessibilityMapViewDidChangeRegionAnimated:(BOOL)a3
{
  if (_UIAccessibilityIsEnabled())
  {
    if (-[VKMapViewAccessibility _axTrackingEnabled](self, "_axTrackingEnabled"))
      AXPerformBlockOnMainThreadAfterDelay();
  }
}

void __71__VKMapViewAccessibility__accessibilityMapViewDidChangeRegionAnimated___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "_axElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "count");

  if (!v3)
  {
    objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetBoolValue:forKey:", 1, CFSTR("TransitionNotification"));
    objc_msgSend(*(id *)(a1 + 32), "_axUpdateElements");
  }
}

- (BOOL)_axElementsInvalidForVisibleBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;

  -[VKMapViewAccessibility accessibilityBounds](self, "accessibilityBounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[VKMapViewAccessibility _axBoundsOfElements](self, "_axBoundsOfElements");
  return !AXVKRectEqualToRect(v4, v6, v8, v10, v11, v12, v13, v14);
}

- (int64_t)_axTrackingMode
{
  void *v2;
  void *v3;
  int64_t v4;

  -[VKMapViewAccessibility _axMapViewDelegate](self, "_axMapViewDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("userTrackingMode"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

- (void)_axSetTrackingMode:(int64_t)a3
{
  AXPerformSafeBlock();
}

void __45__VKMapViewAccessibility__axSetTrackingMode___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "_axMapViewDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setUserTrackingMode:", *(_QWORD *)(a1 + 40));

}

- (BOOL)_axTrackingWithHeadingEnabled
{
  return -[VKMapViewAccessibility _axTrackingMode](self, "_axTrackingMode") == 2;
}

- (BOOL)_axTrackingEnabled
{
  return -[VKMapViewAccessibility _axTrackingMode](self, "_axTrackingMode") == 1;
}

- (BOOL)accessibilityIsShowingRoutes
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  BOOL v7;

  -[VKMapViewAccessibility _axMapsDelegate](self, "_axMapsDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("chromeViewController"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "safeValueForKey:", CFSTR("routeAnnotationsController"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("configuration"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("routes"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  v7 = (objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend(v6, "count") != 0;
  if (!objc_msgSend(v5, "safeIntegerForKey:", CFSTR("routeMarkerOptions")))
    v7 = 0;

  return v7;
}

- (id)_retrieveAXElementManager
{
  return (id)-[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityElementManager"));
}

- (id)accessibilityElementManager
{
  void *v3;

  if (AXRequiresMapAccessibility())
  {
    -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AccessibilityElementManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = (void *)objc_opt_new();
      objc_msgSend(v3, "setDelegate:", self);
      -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AccessibilityElementManager"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_axTourGuideManager
{
  VKMapViewTourGuideManager *v3;
  VKMapViewTourGuideManager *v4;
  void *v5;

  if (UIAccessibilityIsVoiceOverRunning())
  {
    -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("TourGuideManager"));
    v3 = (VKMapViewTourGuideManager *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v4 = [VKMapViewTourGuideManager alloc];
      -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = -[VKMapViewTourGuideManager initWithMapView:elementManager:](v4, "initWithMapView:elementManager:", self, v5);

      -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("TourGuideManager"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_axWalkAssistManager
{
  void *v3;

  if (UIAccessibilityIsVoiceOverRunning() && (AXDeviceIsPad() & 1) == 0)
  {
    -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("WalkAssistManager"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      v3 = (void *)objc_opt_new();
      -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("WalkAssistManager"));
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (void)_axStartListeningForUpdateAccessibilityElementsComplete
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__axUpdateElementsComplete_, CFSTR("UpdateAccessibilityElementsComplete"), v3);

}

- (void)_axStartListeningForUserTrackingModeChange
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axUserTrackingModeChange_, CFSTR("MKUserTrackingViewDidUpdateUserLocationNotification"), 0);

}

- (void)_axStartListeningForMapAccessibilityEnabled
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  AXNotificationsForMapAccessibilityClients();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v10 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v9 + 1) + 8 * i);
        objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter", (_QWORD)v9);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "addObserver:selector:name:object:", self, sel__axMapsAccessibilityPotentiallyEnabled, v7, 0);

      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v4);
  }

}

- (void)_axStartListeningForMapVisibleRegionChanged
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObserver:selector:name:object:", self, sel__axMapVisibleRegionDidChange, CFSTR("AXMapVisibleRegionDidChange"), 0);

}

- (BOOL)_axShouldSummarizeVisibleBounds
{
  char v3;
  char v4;

  v3 = -[VKMapViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("ScrollNotification"));
  v4 = -[VKMapViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("TransitionNotification"));
  return v3 | v4 | -[VKMapViewAccessibility _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("ZoomNotification"));
}

- (id)_axUserLocationMarker
{
  void *v2;
  void *v3;
  void *v4;

  -[VKMapViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("mapDelegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_annotationContainer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("userLocationView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axTourGuideElement
{
  void *v3;
  VKTourGuideAccessibilityElement *v4;
  VKTourGuideAccessibilityElement *v5;
  void *v6;
  VKTourGuideAccessibilityElement *v7;

  -[VKMapViewAccessibility _axUserLocationMarker](self, "_axUserLocationMarker");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("TourGuideElement"));
  v4 = (VKTourGuideAccessibilityElement *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4
    || (-[VKTourGuideAccessibilityElement userLocationMarker](v4, "userLocationMarker"),
        v6 = (void *)objc_claimAutoreleasedReturnValue(),
        v6,
        v6 != v3))
  {
    v7 = -[VKTourGuideAccessibilityElement initWithAccessibilityContainer:userLocationMarker:]([VKTourGuideAccessibilityElement alloc], "initWithAccessibilityContainer:userLocationMarker:", self, v3);

    v5 = v7;
    -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v7, CFSTR("TourGuideElement"));
  }

  return v5;
}

- (void)_axLoadAccessibility
{
  void *v3;
  char v4;

  -[VKMapViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("didLoadAccessibility"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "BOOLValue");

  if ((v4 & 1) == 0)
  {
    -[VKMapViewAccessibility _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", MEMORY[0x24BDBD1C8], CFSTR("didLoadAccessibility"));
    -[VKMapViewAccessibility _axStartListeningForUpdateAccessibilityElementsComplete](self, "_axStartListeningForUpdateAccessibilityElementsComplete");
    -[VKMapViewAccessibility _axStartListeningForUserTrackingModeChange](self, "_axStartListeningForUserTrackingModeChange");
    -[VKMapViewAccessibility _axStartListeningForMapAccessibilityEnabled](self, "_axStartListeningForMapAccessibilityEnabled");
    -[VKMapViewAccessibility _axStartListeningForMapVisibleRegionChanged](self, "_axStartListeningForMapVisibleRegionChanged");
  }
}

- (id)_axElements
{
  void *v3;
  void *v4;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "accessibilityElementsForMapView:", self);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- ($01BB1521EC52D44A8E7628F5261DCEC8)_axBoundsOfElements
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  $01BB1521EC52D44A8E7628F5261DCEC8 result;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "boundsForMapView:", self);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
  }
  else
  {
    v5 = 0.0;
    v7 = 0.0;
    v9 = 0.0;
    v11 = 0.0;
  }

  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.var3 = v15;
  result.var2 = v14;
  result.var1 = v13;
  result.var0 = v12;
  return result;
}

- (int64_t)_axOrientationOfElements
{
  void *v3;
  int64_t v4;

  -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v3, "orientationForMapView:", self);
  else
    v4 = 1;

  return v4;
}

- (void)_axUpdateElements
{
  id v3;

  if ((-[VKMapViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) == 0)
  {
    -[VKMapViewAccessibility accessibilityElementManager](self, "accessibilityElementManager");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "updateAccessibilityElementsForMapView:", self);

  }
}

- (id)accessibilityTourStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  -[VKMapViewAccessibility _axTourGuideManager](self, "_axTourGuideManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isRunning") & 1) != 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "tourStatusForMapView:", self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v4 = 0;
    }
    -[VKMapViewAccessibility _axUserLocationMarker](self, "_axUserLocationMarker");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("annotation"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityLocality"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    __UIAXStringForVariables();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)_axUpdateElementsComplete:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (!-[VKMapViewAccessibility accessibilityIsInTourGuideMode](self, "accessibilityIsInTourGuideMode"))
  {
    if (-[VKMapViewAccessibility _axElementsInvalidForVisibleBounds](self, "_axElementsInvalidForVisibleBounds")
      || (-[VKMapViewAccessibility _axElements](self, "_axElements"),
          v4 = (void *)objc_claimAutoreleasedReturnValue(),
          v4,
          !v4))
    {
      -[VKMapViewAccessibility _axUpdateElements](self, "_axUpdateElements");
    }
    else
    {
      -[VKMapViewAccessibility _accessibilityRemoveValueForKey:](self, "_accessibilityRemoveValueForKey:", *MEMORY[0x24BEBB308]);
      objc_msgSend(v7, "userInfo");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "objectForKey:", CFSTR("AXVKUpdateAccessibilityElementsFocusedElementKey"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], v6);
      if (-[VKMapViewAccessibility _axShouldSummarizeVisibleBounds](self, "_axShouldSummarizeVisibleBounds"))
        -[VKMapViewAccessibility _axSummaryForVisibleBounds](self, "_axSummaryForVisibleBounds");

    }
  }

}

- (void)_axUserTrackingModeChange:(id)a3
{
  void *v4;
  id v5;

  -[VKMapViewAccessibility _axTourGuideManager](self, "_axTourGuideManager", a3);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (-[VKMapViewAccessibility _axTrackingWithHeadingEnabled](self, "_axTrackingWithHeadingEnabled"))
  {
    if ((objc_msgSend(v5, "isRunning") & 1) == 0)
      objc_msgSend(v5, "startTour");
  }
  else if (objc_msgSend(v5, "isRunning"))
  {
    objc_msgSend(v5, "stopTour");
  }
  -[VKMapViewAccessibility _axWalkAssistManager](self, "_axWalkAssistManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "isInWalkingNavigatingState") && (objc_msgSend(v4, "hasArrived") & 1) == 0)
  {
    if ((objc_msgSend(v4, "isRunning") & 1) == 0)
      objc_msgSend(v4, "start");
  }
  else if (objc_msgSend(v4, "isRunning"))
  {
    objc_msgSend(v4, "stop");
  }

}

- (void)_axMapsAccessibilityPotentiallyEnabled
{
  void *v3;

  +[VKMapDebugView sharedInstance](VKMapDebugView, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removePointsAndPaths");

  if (AXRequiresMapAccessibility())
    -[VKMapViewAccessibility _axUpdateElements](self, "_axUpdateElements");
}

- (void)_axMapVisibleRegionDidChange
{
  if (AXRequiresMapAccessibility())
    -[VKMapViewAccessibility _axUpdateElements](self, "_axUpdateElements");
}

- (id)_axMapLabelLayoutTimer
{
  JUMPOUT(0x234923C00);
}

- (void)_axSetMapLabelLayoutTimer:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)initShouldRasterize:(BOOL)a3 inBackground:(BOOL)a4 contentScale:(double)a5 auditToken:(id)a6 mapViewPurpose:(int64_t)a7 allowsAntialiasing:(BOOL)a8
{
  _BOOL8 v8;
  _BOOL8 v11;
  _BOOL8 v12;
  id v14;
  id v15;
  void *v16;
  objc_super v18;

  v8 = a8;
  v11 = a4;
  v12 = a3;
  v14 = a6;
  v18.receiver = self;
  v18.super_class = (Class)VKMapViewAccessibility;
  v15 = -[VKMapViewAccessibility initShouldRasterize:inBackground:contentScale:auditToken:mapViewPurpose:allowsAntialiasing:](&v18, sel_initShouldRasterize_inBackground_contentScale_auditToken_mapViewPurpose_allowsAntialiasing_, v12, v11, v14, a7, v8, a5);
  v16 = v15;
  if (v15)
    objc_msgSend(v15, "_axInitializeTimers");

  return v16;
}

- (void)didUpdateSceneStatus:(unsigned __int8)a3
{
  int v3;
  objc_super v5;

  v3 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility didUpdateSceneStatus:](&v5, sel_didUpdateSceneStatus_);
  if (v3)
  {
    UIAccessibilityPostNotification(0xBD4u, 0);
    -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("MapLoadingComplete"));
    -[VKMapViewAccessibility _accessibilityMapViewDidChangeVisibleRegion](self, "_accessibilityMapViewDidChangeVisibleRegion");
  }
  else
  {
    -[VKMapViewAccessibility _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("MapLoadingComplete"));
  }
}

- (void)labelManagerDidLayout
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility labelManagerDidLayout](&v3, sel_labelManagerDidLayout);
  -[VKMapViewAccessibility _axHandleLabelsDidLayout](self, "_axHandleLabelsDidLayout");
}

- (void)_axHandleLabelsDidLayout
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  if ((-[VKMapViewAccessibility accessibilityElementsHidden](self, "accessibilityElementsHidden") & 1) == 0)
  {
    -[VKMapViewAccessibility _axInitializeTimers](self, "_axInitializeTimers");
    -[VKMapViewAccessibility _axMapLabelLayoutTimer](self, "_axMapLabelLayoutTimer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_initWeak(&location, self);
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __50__VKMapViewAccessibility__axHandleLabelsDidLayout__block_invoke;
    v4[3] = &unk_2503C52E0;
    objc_copyWeak(&v5, &location);
    objc_msgSend(v3, "afterDelay:processBlock:", v4, 0.25);
    objc_destroyWeak(&v5);
    objc_destroyWeak(&location);

  }
}

void __50__VKMapViewAccessibility__axHandleLabelsDidLayout__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_axUpdateElements");

}

- (void)setMapType:(int)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility setMapType:](&v3, sel_setMapType_, *(_QWORD *)&a3);
  AXPerformBlockOnMainThreadAfterDelay();
}

uint64_t __37__VKMapViewAccessibility_setMapType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axUpdateElements");
}

- (void)setCurrentLocationText:(id)a3
{
  id v4;
  objc_super v5;

  v4 = a3;
  v5.receiver = self;
  v5.super_class = (Class)VKMapViewAccessibility;
  -[VKMapViewAccessibility setCurrentLocationText:](&v5, sel_setCurrentLocationText_, v4);
  -[VKMapViewAccessibility _axSetCurrentLocationText:](self, "_axSetCurrentLocationText:", v4);

}

@end

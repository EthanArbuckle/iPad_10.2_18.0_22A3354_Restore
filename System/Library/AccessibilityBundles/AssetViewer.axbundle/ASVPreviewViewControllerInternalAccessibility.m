@implementation ASVPreviewViewControllerInternalAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("ASVPreviewViewControllerInternal");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("UIViewController"));
  objc_msgSend(v3, "validateClass:conformsToProtocol:", CFSTR("AssetViewer.EntityController"), CFSTR("ASVUnifiedGestureRecognizerDelegate"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("currentlyDisallowsUnifiedGestureRecognizerAction"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("handleTapAtPointWithPoint:"), "v", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("overlayController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("accessibilityEntityControllers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("accessibilityRootEntityController"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("accessibilityARView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("updateInterfaceState"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("entityController:doubleTappedAt:"), "v", "@", "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("accessibilityDidSetUpEntityControllers"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("accessibilityShowControls"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("ASVPreviewViewControllerInternal"), CFSTR("accessibilityDistanceInMetersFromEntityController:"), "f", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQuickLookOverlayController"), CFSTR("controlsViewStack"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("accessibilityAssetURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("assetYaw"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("assetPitch"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("assetScale"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("assetScreenPosition"), "1", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("rotateByDeltaYaw:deltaPitch:"), "v", "f", "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("worldGestureRecognizer:translatedAssetToScreenPoint:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("worldGestureRecognizer:levitatedAssetToScreenPoint:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("scaleTo:updateARScale:"), "v", "f", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("worldGestureRecognizer"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("levitationHeight"), "f", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("calculateAssetScreenBoundingRectIn:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.EntityController"), CFSTR("entityAccessibilityWrappers"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewDidAppear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIViewController"), CFSTR("viewDidDisappear:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("AssetViewer.ARQLView"), CFSTR("emitterMode"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("isEntityRoot"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("entityLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("rootEntityWrapper"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("isEntityActive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.__EntityAccessibilityWrapper"), CFSTR("calculateScreenBoundingRectIn:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("RealityKit.ARView"), CFSTR("accessibilityElementsForEntityWrappers:"), "@", "@", 0);

}

- (BOOL)_axHasHandledLoadAX
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetHasHandledLoadAX:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_accessibilityLoadAccessibilityInformation
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  double (*v8)(uint64_t);
  void *v9;
  id v10;
  id v11;
  id from;
  id location;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility _accessibilityLoadAccessibilityInformation](&v14, sel__accessibilityLoadAccessibilityInformation);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v3);
  objc_initWeak(&from, self);
  v6 = MEMORY[0x24BDAC760];
  v7 = 3221225472;
  v8 = __91__ASVPreviewViewControllerInternalAccessibility__accessibilityLoadAccessibilityInformation__block_invoke;
  v9 = &unk_25017AC08;
  objc_copyWeak(&v10, &location);
  objc_copyWeak(&v11, &from);
  objc_msgSend(v3, "_setAccessibilityFrameBlock:", &v6);
  objc_msgSend(v3, "setAccessibilityNavigationStyle:", 2, v6, v7, v8, v9);
  -[ASVPreviewViewControllerInternalAccessibility _axUpdateARViewAccessibilityElements](self, "_axUpdateARViewAccessibilityElements");
  if (!-[ASVPreviewViewControllerInternalAccessibility _axHasHandledLoadAX](self, "_axHasHandledLoadAX"))
  {
    -[ASVPreviewViewControllerInternalAccessibility _axToggleVisibilityAnnouncementsIfNeeded](self, "_axToggleVisibilityAnnouncementsIfNeeded");
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__axDidToggleAXSetting_, *MEMORY[0x24BDF7458], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", self, sel__axDidToggleAXSetting_, *MEMORY[0x24BDF7380], 0);

    -[ASVPreviewViewControllerInternalAccessibility _axUpdateForAXSettings](self, "_axUpdateForAXSettings");
    -[ASVPreviewViewControllerInternalAccessibility _axSetHasHandledLoadAX:](self, "_axSetHasHandledLoadAX:", 1);
  }
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v10);
  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

}

double __91__ASVPreviewViewControllerInternalAccessibility__accessibilityLoadAccessibilityInformation__block_invoke(uint64_t a1)
{
  UIView *WeakRetained;
  id v3;
  double v4;
  CGRect v6;

  WeakRetained = (UIView *)objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(v3, "_axBoundsForControls");
  *(_QWORD *)&v4 = (unint64_t)UIAccessibilityConvertFrameToScreenCoordinates(v6, WeakRetained);

  return v4;
}

- (void)_axUpdateForAXSettings
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t (*v7)(uint64_t);
  void *v8;
  ASVPreviewViewControllerInternalAccessibility *v9;

  objc_opt_class();
  -[ASVPreviewViewControllerInternalAccessibility _axOverlayController](self, "_axOverlayController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsSafeCategory();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "axShouldDisableAutoHidingControls"))
  {
    v5 = MEMORY[0x24BDAC760];
    v6 = 3221225472;
    v7 = __71__ASVPreviewViewControllerInternalAccessibility__axUpdateForAXSettings__block_invoke;
    v8 = &unk_25017AC30;
    v9 = self;
    AXPerformSafeBlock();
  }
  objc_msgSend(v4, "axUpdateAutoHideControlsTimer", v5, v6, v7, v8, v9);

}

uint64_t __71__ASVPreviewViewControllerInternalAccessibility__axUpdateForAXSettings__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityShowControls");
}

- (id)_axARView
{
  return (id)-[ASVPreviewViewControllerInternalAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("accessibilityARView"));
}

- (id)_axControlsViewStack
{
  void *v2;
  void *v3;

  -[ASVPreviewViewControllerInternalAccessibility _axOverlayController](self, "_axOverlayController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("controlsViewStack"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axOverlayController
{
  return (id)-[ASVPreviewViewControllerInternalAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("overlayController"));
}

- (id)_axEntityWrappersForEntityController:(id)a3
{
  return (id)objc_msgSend(a3, "safeArrayForKey:", CFSTR("entityAccessibilityWrappers"));
}

- (id)_axRootEntityWrapperForEntityController:(id)a3
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[ASVPreviewViewControllerInternalAccessibility _axEntityWrappersForEntityController:](self, "_axEntityWrappersForEntityController:", a3, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "safeBoolForKey:", CFSTR("isEntityRoot")))
        {
          v9 = v8;
LABEL_13:
          v10 = v9;
          goto LABEL_14;
        }
        objc_msgSend(v8, "safeValueForKey:", CFSTR("rootEntityWrapper"));
        v9 = (id)objc_claimAutoreleasedReturnValue();
        if (v9)
          goto LABEL_13;
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      v10 = 0;
      if (v5)
        continue;
      break;
    }
  }
  else
  {
    v10 = 0;
  }
LABEL_14:

  return v10;
}

- (id)_axNameForEntityWrapper:(id)a3
{
  return (id)objc_msgSend(a3, "safeStringForKey:", CFSTR("entityLabel"));
}

- (id)_axNameForEntityController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;

  v4 = a3;
  -[ASVPreviewViewControllerInternalAccessibility _axEntityControllers](self, "_axEntityControllers");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "firstObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axRootEntityWrapperForEntityController:](self, "_axRootEntityWrapperForEntityController:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axNameForEntityWrapper:](self, "_axNameForEntityWrapper:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v8, "length"))
  {
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityAssetURL"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "URLByDeletingPathExtension");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "lastPathComponent");
    v12 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v12;
  }
  if (!objc_msgSend(v8, "length"))
  {
    accessibilityLocalizedString(CFSTR("DEFAULT_ASSET_NAME"));
    v13 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v13;
  }

  return v8;
}

- (CGRect)_axBoundsForControls
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
  void *v12;
  void *v13;
  CGFloat MaxY;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect v19;
  CGRect result;

  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  -[ASVPreviewViewControllerInternalAccessibility _axControlsViewStack](self, "_axControlsViewStack");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (v12)
  {
    objc_msgSend(v12, "bounds");
    objc_msgSend(v3, "convertRect:fromView:", v13);
    MaxY = CGRectGetMaxY(v19);
    v11 = v11 - (MaxY - v7);
    v7 = MaxY;
  }

  v15 = v5;
  v16 = v7;
  v17 = v9;
  v18 = v11;
  result.size.height = v18;
  result.size.width = v17;
  result.origin.y = v16;
  result.origin.x = v15;
  return result;
}

- (void)_axGetAccessibilityFrame:(CGRect *)a3 path:(id *)a4 forArrowTowardsEdge:(unint64_t)a5 isDoubleArrow:(BOOL)a6
{
  _BOOL4 v6;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  double v19;
  double v20;
  CGFloat v21;
  CGFloat v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  UIBezierPath *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double MinX;
  double MidX;
  double MaxY;
  double v37;
  double MaxX;
  double v39;
  double v40;
  double MinY;
  double v42;
  double v43;
  double v44;
  double v45;
  UIView *v46;
  unint64_t v47;
  UIBezierPath *path;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;
  CGRect v87;
  CGRect v88;
  CGRect v89;
  CGRect v90;
  CGRect v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;
  CGRect v95;

  v6 = a6;
  -[ASVPreviewViewControllerInternalAccessibility _axBoundsForControls](self, "_axBoundsForControls");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPath");
  path = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  if (a5 != 8 && a5 != 2)
  {
    v22 = 75.0;
    if (v6)
      v33 = 75.0;
    else
      v33 = 50.0;
    v64.origin.x = v12;
    v64.origin.y = v14;
    v64.size.width = v16;
    v64.size.height = v18;
    MinX = CGRectGetMinX(v64);
    v65.origin.x = v12;
    v65.origin.y = v14;
    v65.size.width = v16;
    v65.size.height = v18;
    v29 = MinX + (CGRectGetWidth(v65) + -80.0) * 0.5;
    if (a5 != 4)
    {
      if (a5 == 1)
      {
        v21 = 80.0;
        v66.origin.x = v29;
        v66.origin.y = v14;
        v66.size.width = 80.0;
        v66.size.height = v33;
        MidX = CGRectGetMidX(v66);
        v67.origin.x = v29;
        v67.origin.y = v14;
        v67.size.width = 80.0;
        v67.size.height = v33;
        -[UIBezierPath moveToPoint:](path, "moveToPoint:", MidX, CGRectGetMinY(v67));
        v68.origin.x = v29;
        v68.origin.y = v14;
        v68.size.width = 80.0;
        v68.size.height = v33;
        MaxY = CGRectGetMaxY(v68);
        if (v6)
        {
          v28 = MaxY + -25.0;
          v69.origin.x = v29;
          v69.origin.y = v14;
          v69.size.width = 80.0;
          v69.size.height = v33;
          -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v69), v28);
          v70.origin.x = v29;
          v70.origin.y = v14;
          v70.size.width = 80.0;
          v70.size.height = v33;
          -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v70) + 20.0, v28);
          v71.origin.x = v29;
          v71.origin.y = v14;
          v71.size.width = 80.0;
          v71.size.height = v33;
          v37 = CGRectGetMinX(v71);
          v72.origin.x = v29;
          v72.origin.y = v14;
          v72.size.width = 80.0;
          v72.size.height = v33;
          -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v37, CGRectGetMaxY(v72));
          v73.origin.x = v29;
          v73.origin.y = v14;
          v73.size.width = 80.0;
          v73.size.height = v33;
          MaxX = CGRectGetMaxX(v73);
          v74.origin.x = v29;
          v74.origin.y = v14;
          v74.size.width = 80.0;
          v74.size.height = v33;
          v39 = CGRectGetMaxY(v74);
LABEL_17:
          -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", MaxX, v39, v47);
          v85.origin.x = v29;
          v85.origin.y = v14;
          v85.size.width = 80.0;
          v85.size.height = v33;
          -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMaxX(v85) + -20.0, v28);
          v86.origin.x = v29;
          v86.origin.y = v14;
          v86.size.width = 80.0;
          v86.size.height = v33;
          v25 = CGRectGetMaxX(v86);
LABEL_21:
          v27 = path;
          goto LABEL_22;
        }
        v91.origin.x = v29;
        v91.origin.y = v14;
        v91.size.width = 80.0;
        v91.size.height = v33;
        v45 = CGRectGetMinX(v91);
        v92.origin.x = v29;
        v92.origin.y = v14;
        v92.size.width = 80.0;
        v92.size.height = v33;
        -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v45, CGRectGetMaxY(v92));
        v93.origin.x = v29;
        v93.origin.y = v14;
        v93.size.width = 80.0;
        v93.size.height = v33;
        v25 = CGRectGetMaxX(v93);
        v94.origin.x = v29;
        v94.origin.y = v14;
        v94.size.width = 80.0;
        v94.size.height = v33;
        v44 = CGRectGetMaxY(v94);
        goto LABEL_20;
      }
      v47 = a5;
      _AXAssert();
    }
    v75.origin.x = v12;
    v75.origin.y = v14;
    v75.size.width = v16;
    v75.size.height = v18;
    v14 = CGRectGetMaxY(v75) - v33;
    v21 = 80.0;
    v76.origin.x = v29;
    v76.origin.y = v14;
    v76.size.width = 80.0;
    v76.size.height = v33;
    v40 = CGRectGetMidX(v76);
    v77.origin.x = v29;
    v77.origin.y = v14;
    v77.size.width = 80.0;
    v77.size.height = v33;
    -[UIBezierPath moveToPoint:](path, "moveToPoint:", v40, CGRectGetMaxY(v77));
    v78.origin.x = v29;
    v78.origin.y = v14;
    v78.size.width = 80.0;
    v78.size.height = v33;
    MinY = CGRectGetMinY(v78);
    if (v6)
    {
      v28 = MinY + 25.0;
      v79.origin.x = v29;
      v79.origin.y = v14;
      v79.size.width = 80.0;
      v79.size.height = v33;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v79), v28);
      v80.origin.x = v29;
      v80.origin.y = v14;
      v80.size.width = 80.0;
      v80.size.height = v33;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", CGRectGetMinX(v80) + 20.0, v28);
      v81.origin.x = v29;
      v81.origin.y = v14;
      v81.size.width = 80.0;
      v81.size.height = v33;
      v42 = CGRectGetMinX(v81);
      v82.origin.x = v29;
      v82.origin.y = v14;
      v82.size.width = 80.0;
      v82.size.height = v33;
      -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v42, CGRectGetMinY(v82));
      v83.origin.x = v29;
      v83.origin.y = v14;
      v83.size.width = 80.0;
      v83.size.height = v33;
      MaxX = CGRectGetMaxX(v83);
      v84.origin.x = v29;
      v84.origin.y = v14;
      v84.size.width = 80.0;
      v84.size.height = v33;
      v39 = CGRectGetMinY(v84);
      goto LABEL_17;
    }
    v87.origin.x = v29;
    v87.origin.y = v14;
    v87.size.width = 80.0;
    v87.size.height = v33;
    v43 = CGRectGetMinX(v87);
    v88.origin.x = v29;
    v88.origin.y = v14;
    v88.size.width = 80.0;
    v88.size.height = v33;
    -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v43, CGRectGetMinY(v88));
    v89.origin.x = v29;
    v89.origin.y = v14;
    v89.size.width = 80.0;
    v89.size.height = v33;
    v25 = CGRectGetMaxX(v89);
    v90.origin.x = v29;
    v90.origin.y = v14;
    v90.size.width = 80.0;
    v90.size.height = v33;
    v44 = CGRectGetMinY(v90);
LABEL_20:
    v28 = v44;
    v22 = 50.0;
    goto LABEL_21;
  }
  v49.origin.x = v12;
  v49.origin.y = v14;
  v49.size.width = v16;
  v49.size.height = v18;
  v19 = CGRectGetMinY(v49);
  v50.origin.x = v12;
  v50.origin.y = v14;
  v50.size.width = v16;
  v50.size.height = v18;
  v20 = v19 + (CGRectGetHeight(v50) + -80.0) * 0.5;
  if (a5 == 2)
  {
    v21 = 50.0;
    v22 = 80.0;
    v51.origin.x = v12;
    v51.origin.y = v20;
    v51.size.width = 50.0;
    v51.size.height = 80.0;
    v23 = CGRectGetMinX(v51);
    v52.origin.x = v12;
    v52.origin.y = v20;
    v52.size.width = 50.0;
    v52.size.height = 80.0;
    -[UIBezierPath moveToPoint:](path, "moveToPoint:", v23, CGRectGetMidY(v52));
    v53.origin.x = v12;
    v53.origin.y = v20;
    v53.size.width = 50.0;
    v53.size.height = 80.0;
    v24 = CGRectGetMaxX(v53);
    v54.origin.x = v12;
    v54.origin.y = v20;
    v54.size.width = 50.0;
    v54.size.height = 80.0;
    -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v24, CGRectGetMinY(v54));
    v55.origin.x = v12;
    v55.origin.y = v20;
    v55.size.width = 50.0;
    v55.size.height = 80.0;
    v25 = CGRectGetMaxX(v55);
    v56.origin.x = v12;
    v56.origin.y = v20;
    v56.size.width = 50.0;
    v56.size.height = 80.0;
    v26 = CGRectGetMaxY(v56);
    v27 = path;
    v28 = v26;
    v29 = v12;
  }
  else
  {
    v57.origin.x = v12;
    v57.origin.y = v14;
    v57.size.width = v16;
    v57.size.height = v18;
    v29 = CGRectGetMaxX(v57) + -50.0;
    v21 = 50.0;
    v22 = 80.0;
    v58.origin.x = v29;
    v58.origin.y = v20;
    v58.size.width = 50.0;
    v58.size.height = 80.0;
    v30 = CGRectGetMaxX(v58);
    v59.origin.x = v29;
    v59.origin.y = v20;
    v59.size.width = 50.0;
    v59.size.height = 80.0;
    -[UIBezierPath moveToPoint:](path, "moveToPoint:", v30, CGRectGetMidY(v59));
    v60.origin.x = v29;
    v60.origin.y = v20;
    v60.size.width = 50.0;
    v60.size.height = 80.0;
    v31 = CGRectGetMinX(v60);
    v61.origin.x = v29;
    v61.origin.y = v20;
    v61.size.width = 50.0;
    v61.size.height = 80.0;
    -[UIBezierPath addLineToPoint:](path, "addLineToPoint:", v31, CGRectGetMinY(v61));
    v62.origin.x = v29;
    v62.origin.y = v20;
    v62.size.width = 50.0;
    v62.size.height = 80.0;
    v25 = CGRectGetMinX(v62);
    v63.origin.x = v29;
    v63.origin.y = v20;
    v63.size.width = 50.0;
    v63.size.height = 80.0;
    v32 = CGRectGetMaxY(v63);
    v27 = path;
    v28 = v32;
  }
  v14 = v20;
LABEL_22:
  -[UIBezierPath addLineToPoint:](v27, "addLineToPoint:", v25, v28, v47);
  -[UIBezierPath closePath](path, "closePath");
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v46 = (UIView *)objc_claimAutoreleasedReturnValue();
  v95.origin.x = v29;
  v95.origin.y = v14;
  v95.size.width = v21;
  v95.size.height = v22;
  *a3 = UIAccessibilityConvertFrameToScreenCoordinates(v95, v46);
  UIAccessibilityConvertPathToScreenCoordinates(path, v46);
  *a4 = (id)objc_claimAutoreleasedReturnValue();

}

- (void)_axGetAccessibilityFrame:(CGRect *)a3 path:(id *)a4 forRotationControlClockwise:(BOOL)a5
{
  _BOOL8 v5;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIBezierPath *v16;
  __double2 v17;
  UIView *v18;
  void *v19;
  id v20;
  id v21;

  v5 = a5;
  -[ASVPreviewViewControllerInternalAccessibility _axBoundsForControls](self, "_axBoundsForControls");
  AX_CGRectGetCenter();
  v11 = v9;
  v12 = v10;
  if (v5)
    v13 = 2.35619449;
  else
    v13 = 0.785398163;
  if (v5)
    v14 = 3.92699082;
  else
    v14 = -0.785398163;
  if (v5)
    v15 = 4.3196899;
  else
    v15 = -1.17809725;
  objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithArcCenter:radius:startAngle:endAngle:clockwise:", v5, v9, v10, 125.0, v13, v14);
  v16 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v17 = __sincos_stret(v15);
  -[UIBezierPath addLineToPoint:](v16, "addLineToPoint:", v11 + v17.__cosval * 100.0, v12 + v17.__sinval * 100.0);
  -[UIBezierPath addArcWithCenter:radius:startAngle:endAngle:clockwise:](v16, "addArcWithCenter:radius:startAngle:endAngle:clockwise:", v5 ^ 1, v11, v12, 75.0, v14, v13);
  -[UIBezierPath closePath](v16, "closePath");
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v18 = (UIView *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityConvertPathToScreenCoordinates(v16, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = objc_retainAutorelease(v19);
  *a4 = v20;
  v21 = objc_retainAutorelease(v20);
  *a3 = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(v21, "CGPath"));

}

- (BOOL)_axShouldExposeControls
{
  return -[ASVPreviewViewControllerInternalAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("currentlyDisallowsUnifiedGestureRecognizerAction")) ^ 1;
}

- (void)_axAnnotateAsControl:(id)a3
{
  id v4;
  _QWORD v5[4];
  id v6;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __70__ASVPreviewViewControllerInternalAccessibility__axAnnotateAsControl___block_invoke;
  v5[3] = &unk_25017AC58;
  objc_copyWeak(&v6, &location);
  objc_msgSend(v4, "_setIsAccessibilityElementBlock:", v5);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);

}

uint64_t __70__ASVPreviewViewControllerInternalAccessibility__axAnnotateAsControl___block_invoke(uint64_t a1)
{
  id WeakRetained;
  uint64_t v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_msgSend(WeakRetained, "_axShouldExposeControls");

  return v2;
}

- (id)_axDescriptionForRotationInDegrees:(int64_t)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = round((double)a3 / 5.0) * 5.0;
  v4 = (uint64_t)v3;
  v5 = 180;
  if ((uint64_t)v3 < 180)
    v5 = (uint64_t)v3;
  v6 = 360 * ((v4 - v5 + 359) / 0x168uLL);
  v7 = v4 - v6;
  v8 = -180;
  if ((uint64_t)(v4 - v6) > -180)
    v8 = v4 - v6;
  v9 = v8 + v6;
  v10 = v9 == v4;
  v11 = (v9 - v4 - (v9 != v4)) / 0x168;
  if (!v10)
    ++v11;
  v12 = v7 + 360 * v11;
  if (v12 == -180 || v12 == 180)
  {
    v13 = CFSTR("ROTATE_TO_180_ANNOUNCEMENT");
    goto LABEL_12;
  }
  if (!v12)
  {
    v13 = CFSTR("ROTATE_TO_ZERO_ANNOUNCEMENT");
LABEL_12:
    accessibilityLocalizedString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    return v14;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  if ((v12 & 0x8000000000000000) != 0)
  {
    accessibilityLocalizedString(CFSTR("ROTATE_TO_CLOCKWISE_ANNOUNCEMENT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, -(uint64_t)v12);
  }
  else
  {
    accessibilityLocalizedString(CFSTR("ROTATE_TO_COUNTERCLOCKWISE_ANNOUNCEMENT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, v12);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_axDescriptionForPitchInDegrees:(int64_t)a3
{
  double v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t v7;
  uint64_t v8;
  unint64_t v9;
  BOOL v10;
  unint64_t v11;
  unint64_t v12;
  __CFString *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = round((double)a3 / 5.0) * 5.0;
  v4 = (uint64_t)v3;
  v5 = 180;
  if ((uint64_t)v3 < 180)
    v5 = (uint64_t)v3;
  v6 = 360 * ((v4 - v5 + 359) / 0x168uLL);
  v7 = v4 - v6;
  v8 = -180;
  if ((uint64_t)(v4 - v6) > -180)
    v8 = v4 - v6;
  v9 = v8 + v6;
  v10 = v9 == v4;
  v11 = (v9 - v4 - (v9 != v4)) / 0x168;
  if (!v10)
    ++v11;
  v12 = v7 + 360 * v11;
  if (v12 == -180 || v12 == 180)
  {
    v13 = CFSTR("UPSIDE_DOWN_ANNOUNCEMENT");
    goto LABEL_12;
  }
  if (!v12)
  {
    v13 = CFSTR("NOT_TILTED_ANNOUNCEMENT");
LABEL_12:
    accessibilityLocalizedString(v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    return v14;
  }
  v15 = (void *)MEMORY[0x24BDD17C8];
  if ((v12 & 0x8000000000000000) != 0)
  {
    accessibilityLocalizedString(CFSTR("TILTED_AWAY_ANNOUNCEMENT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, -(uint64_t)v12);
  }
  else
  {
    accessibilityLocalizedString(CFSTR("TILTED_TOWARD_ANNOUNCEMENT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringWithFormat:", v16, v12);
  }
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_axDescriptionForCurrentRotationForEntityController:(id)a3
{
  float v4;

  objc_msgSend(a3, "safeFloatForKey:", CFSTR("assetYaw"));
  return -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForRotationInDegrees:](self, "_axDescriptionForRotationInDegrees:", (uint64_t)(v4 / 0.0174532925));
}

- (id)_axDescriptionForCurrentPitchForEntityController:(id)a3
{
  float v4;

  objc_msgSend(a3, "safeFloatForKey:", CFSTR("assetPitch"));
  return -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForPitchInDegrees:](self, "_axDescriptionForPitchInDegrees:", (uint64_t)(v4 / 0.0174532925));
}

- (id)_axLabelForEntityController:(id)a3
{
  id v4;
  void *v5;
  int64_t v6;
  __CFString *v7;
  void *v8;
  uint64_t v9;
  uint64_t v11;

  v4 = a3;
  -[ASVPreviewViewControllerInternalAccessibility _axNameForEntityController:](self, "_axNameForEntityController:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[ASVPreviewViewControllerInternalAccessibility _axEmitterMode](self, "_axEmitterMode");
  if ((v6 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    if ((v6 & 0xFFFFFFFFFFFFFFFDLL) == 1)
    {
      v7 = CFSTR("ASSET_IS_NOT_PLACED");
LABEL_8:
      accessibilityLocalizedString(v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v9 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    }
    if (-[ASVPreviewViewControllerInternalAccessibility _axIsOffScreenForEntityController:](self, "_axIsOffScreenForEntityController:", v4))
    {
      v7 = CFSTR("ASSET_IS_OFF_SCREEN");
      goto LABEL_8;
    }
  }
  else if (-[ASVPreviewViewControllerInternalAccessibility _axShouldExposeControls](self, "_axShouldExposeControls"))
  {
    -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForCurrentRotationForEntityController:](self, "_axDescriptionForCurrentRotationForEntityController:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForCurrentPitchForEntityController:](self, "_axDescriptionForCurrentPitchForEntityController:", v4);
    v11 = objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v9 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v11;
LABEL_9:

    v5 = (void *)v9;
  }

  return v5;
}

- (CGRect)_axFrameForEntityController:(id)a3
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double x;
  double y;
  double width;
  double height;
  UIView *v17;
  CGFloat v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGRect v26;
  CGRect v27;
  CGRect v28;
  CGRect v29;
  CGRect result;
  CGRect v31;

  v4 = a3;
  -[ASVPreviewViewControllerInternalAccessibility _axBoundsForControls](self, "_axBoundsForControls");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  if ((-[ASVPreviewViewControllerInternalAccessibility _axEmitterMode](self, "_axEmitterMode") & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    -[ASVPreviewViewControllerInternalAccessibility _axBoundingRectForEntityController:](self, "_axBoundingRectForEntityController:", v4);
    v31.origin.x = v6;
    v31.origin.y = v8;
    v31.size.width = v10;
    v31.size.height = v12;
    v27 = CGRectIntersection(v26, v31);
    x = v27.origin.x;
    y = v27.origin.y;
    width = v27.size.width;
    height = v27.size.height;
    if (!CGRectIsNull(v27))
    {
      v12 = height;
      v10 = width;
      v8 = y;
      v6 = x;
    }
  }
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v17 = (UIView *)objc_claimAutoreleasedReturnValue();
  v28.origin.x = v6;
  v28.origin.y = v8;
  v28.size.width = v10;
  v28.size.height = v12;
  v29 = UIAccessibilityConvertFrameToScreenCoordinates(v28, v17);
  v18 = v29.origin.x;
  v19 = v29.origin.y;
  v20 = v29.size.width;
  v21 = v29.size.height;

  v22 = v18;
  v23 = v19;
  v24 = v20;
  v25 = v21;
  result.size.height = v25;
  result.size.width = v24;
  result.origin.y = v23;
  result.origin.x = v22;
  return result;
}

- (BOOL)_axIsAccessibilityElementForEntityController:(id)a3
{
  void *v3;
  BOOL v4;

  -[ASVPreviewViewControllerInternalAccessibility _axEntityElementsForEntityController:](self, "_axEntityElementsForEntityController:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count") == 0;

  return v4;
}

- (id)_axCreateAssetElementForEntityController:(id)a3
{
  id v4;
  AXEntityControllerElement *v5;
  void *v6;
  AXEntityControllerElement *v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD v16[4];
  id v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id from;
  id location[2];

  v4 = a3;
  v5 = [AXEntityControllerElement alloc];
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[AXEntityControllerElement initWithAccessibilityContainer:entityController:previewViewController:](v5, "initWithAccessibilityContainer:entityController:previewViewController:", v6, v4, self);

  objc_initWeak(location, self);
  objc_initWeak(&from, v4);
  v8 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke;
  v19[3] = &unk_25017AC80;
  objc_copyWeak(&v20, location);
  objc_copyWeak(&v21, &from);
  -[AXEntityControllerElement _setAccessibilityLabelBlock:](v7, "_setAccessibilityLabelBlock:", v19);
  v16[0] = v8;
  v16[1] = 3221225472;
  v16[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_2;
  v16[3] = &unk_25017AC08;
  objc_copyWeak(&v17, location);
  objc_copyWeak(&v18, &from);
  -[AXEntityControllerElement _setAccessibilityFrameBlock:](v7, "_setAccessibilityFrameBlock:", v16);
  v13[0] = v8;
  v13[1] = 3221225472;
  v13[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_3;
  v13[3] = &unk_25017ACA8;
  objc_copyWeak(&v14, location);
  objc_copyWeak(&v15, &from);
  -[AXEntityControllerElement _setIsAccessibilityElementBlock:](v7, "_setIsAccessibilityElementBlock:", v13);
  v10[0] = v8;
  v10[1] = 3221225472;
  v10[2] = __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_4;
  v10[3] = &unk_25017ACD0;
  objc_copyWeak(&v11, location);
  objc_copyWeak(&v12, &from);
  -[AXEntityControllerElement _setAccessibilityElementsBlock:](v7, "_setAccessibilityElementsBlock:", v10);
  objc_destroyWeak(&v12);
  objc_destroyWeak(&v11);
  objc_destroyWeak(&v15);
  objc_destroyWeak(&v14);
  objc_destroyWeak(&v18);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&v21);
  objc_destroyWeak(&v20);
  objc_destroyWeak(&from);
  objc_destroyWeak(location);

  return v7;
}

id __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axLabelForEntityController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

double __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  id v3;
  double v4;
  double v5;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axFrameForEntityController:", v3);
  v5 = v4;

  return v5;
}

uint64_t __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  uint64_t v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  v4 = objc_msgSend(WeakRetained, "_axIsAccessibilityElementForEntityController:", v3);

  return v4;
}

id __90__ASVPreviewViewControllerInternalAccessibility__axCreateAssetElementForEntityController___block_invoke_4(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axEntityElementsForEntityController:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (BOOL)_axActivateForEntityController:(id)a3 deltaYaw:(float)a4 deltaPitch:(float)a5
{
  id v8;
  uint64_t v9;
  id v10;
  void *v11;
  dispatch_time_t v12;
  id v13;
  _QWORD block[4];
  id v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, double, double);
  void *v20;
  id v21;
  float v22;
  float v23;

  v8 = a3;
  v9 = MEMORY[0x24BDAC760];
  v17 = MEMORY[0x24BDAC760];
  v18 = 3221225472;
  v19 = __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke;
  v20 = &unk_25017ACF8;
  v10 = v8;
  v21 = v10;
  v22 = a4;
  v23 = a5;
  AXPerformSafeBlock();
  if (a4 == 0.0)
    -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForCurrentPitchForEntityController:](self, "_axDescriptionForCurrentPitchForEntityController:", v10);
  else
    -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForCurrentRotationForEntityController:](self, "_axDescriptionForCurrentRotationForEntityController:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = dispatch_time(0, 100000000);
  block[0] = v9;
  block[1] = 3221225472;
  block[2] = __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke_2;
  block[3] = &unk_25017AC30;
  v16 = v11;
  v13 = v11;
  dispatch_after(v12, MEMORY[0x24BDAC9B8], block);

  return 1;
}

uint64_t __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke(uint64_t a1, double a2, double a3)
{
  LODWORD(a2) = *(_DWORD *)(a1 + 40);
  LODWORD(a3) = *(_DWORD *)(a1 + 44);
  return objc_msgSend(*(id *)(a1 + 32), "rotateByDeltaYaw:deltaPitch:", a2, a3);
}

void __100__ASVPreviewViewControllerInternalAccessibility__axActivateForEntityController_deltaYaw_deltaPitch___block_invoke_2(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (id)_axControlForRotationWithDeltaYaw:(float)a3 deltaPitch:(float)a4 nameFormat:(id)a5 hintFormat:(id)a6 shouldUseArrows:(BOOL)a7 entityController:(id)a8
{
  _BOOL4 v9;
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  __int128 v20;
  uint64_t v21;
  id *v22;
  uint64_t *v23;
  id v24;
  uint64_t v25;
  id v26;
  id v27;
  _QWORD v29[4];
  id v30;
  id v31;
  float v32;
  float v33;
  _QWORD v34[4];
  id v35;
  id v36;
  id v37;
  _QWORD v38[4];
  id v39;
  id v40;
  id v41;
  id from;
  id location;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;

  v9 = a7;
  v14 = a5;
  v15 = a6;
  v16 = a8;
  v17 = objc_alloc(MEMORY[0x24BDF67A0]);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)objc_msgSend(v17, "initWithAccessibilityContainer:", v18);

  -[ASVPreviewViewControllerInternalAccessibility _axAnnotateAsControl:](self, "_axAnnotateAsControl:", v19);
  v20 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v47 = *MEMORY[0x24BDBF090];
  v48 = v20;
  if (a3 == 0.0)
  {
    v44 = 0;
    if (a4 < 0.0)
      v21 = 1;
    else
      v21 = 4;
    v22 = (id *)&v44;
    v23 = &v44;
  }
  else
  {
    if (!v9)
    {
      v45 = 0;
      v22 = (id *)&v45;
      -[ASVPreviewViewControllerInternalAccessibility _axGetAccessibilityFrame:path:forRotationControlClockwise:](self, "_axGetAccessibilityFrame:path:forRotationControlClockwise:", &v47, &v45, a3 < 0.0);
      goto LABEL_13;
    }
    v46 = 0;
    if (a3 >= 0.0)
      v21 = 8;
    else
      v21 = 2;
    v22 = (id *)&v46;
    v23 = &v46;
  }
  -[ASVPreviewViewControllerInternalAccessibility _axGetAccessibilityFrame:path:forArrowTowardsEdge:isDoubleArrow:](self, "_axGetAccessibilityFrame:path:forArrowTowardsEdge:isDoubleArrow:", &v47, v23, v21, 0);
LABEL_13:
  v24 = *v22;
  objc_msgSend(v19, "setAccessibilityFrame:", v47, v48);
  objc_msgSend(v19, "setAccessibilityPath:", v24);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v16);
  v25 = MEMORY[0x24BDAC760];
  v38[0] = MEMORY[0x24BDAC760];
  v38[1] = 3221225472;
  v38[2] = __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke;
  v38[3] = &unk_25017AD20;
  v26 = v14;
  v39 = v26;
  objc_copyWeak(&v40, &location);
  objc_copyWeak(&v41, &from);
  objc_msgSend(v19, "_setAccessibilityLabelBlock:", v38);
  v34[0] = v25;
  v34[1] = 3221225472;
  v34[2] = __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_2;
  v34[3] = &unk_25017AD20;
  v27 = v15;
  v35 = v27;
  objc_copyWeak(&v36, &location);
  objc_copyWeak(&v37, &from);
  objc_msgSend(v19, "_setAccessibilityHintBlock:", v34);
  objc_msgSend(v19, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v29[0] = v25;
  v29[1] = 3221225472;
  v29[2] = __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_3;
  v29[3] = &unk_25017AD48;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, &from);
  v32 = a3;
  v33 = a4;
  objc_msgSend(v19, "_setAccessibilityActivateBlock:", v29);
  objc_msgSend(v19, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);
  objc_destroyWeak(&v37);
  objc_destroyWeak(&v36);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v40);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v19;
}

id __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_axNameForEntityController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_2(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_axNameForEntityController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __149__ASVPreviewViewControllerInternalAccessibility__axControlForRotationWithDeltaYaw_deltaPitch_nameFormat_hintFormat_shouldUseArrows_entityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  id v3;
  double v4;
  double v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v4) = *(_DWORD *)(a1 + 48);
  LODWORD(v5) = *(_DWORD *)(a1 + 52);
  v6 = objc_msgSend(WeakRetained, "_axActivateForEntityController:deltaYaw:deltaPitch:", v3, v4, v5);

  return v6;
}

- (float)_axAssetScaleForEntityController:(id)a3
{
  float result;

  objc_msgSend(a3, "safeFloatForKey:", CFSTR("assetScale"));
  return result;
}

- (id)_axUnifiedGestureRecognizerForEntityController:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  objc_opt_class();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("worldGestureRecognizer"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)_axAdjustScaleByMultiplier:(float)a3 entityController:(id)a4
{
  id v5;
  id v6;
  id v7;
  void *v8;
  void *v9;

  v5 = a4;
  -[ASVPreviewViewControllerInternalAccessibility _axAssetScaleForEntityController:](self, "_axAssetScaleForEntityController:", v5);
  -[ASVPreviewViewControllerInternalAccessibility _axUnifiedGestureRecognizerForEntityController:](self, "_axUnifiedGestureRecognizerForEntityController:", v5);
  v8 = v5;
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v9;
  v7 = v5;
  AXPerformSafeBlock();

}

uint64_t __93__ASVPreviewViewControllerInternalAccessibility__axAdjustScaleByMultiplier_entityController___block_invoke(uint64_t a1)
{
  double v2;

  objc_msgSend(*(id *)(a1 + 32), "unifiedGestureRecognizerBeganScaling:", *(_QWORD *)(a1 + 40));
  LODWORD(v2) = *(_DWORD *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "unifiedGestureRecognizer:scaledAssetToScale:", *(_QWORD *)(a1 + 40), v2);
  return objc_msgSend(*(id *)(a1 + 32), "unifiedGestureRecognizerEndedScaling:", *(_QWORD *)(a1 + 40));
}

- (void)_axResetToInitialScaleForEntityAction:(id)a3
{
  id v3;
  id v4;

  objc_msgSend(a3, "entityController");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  v3 = v4;
  AXPerformSafeBlock();

}

void __87__ASVPreviewViewControllerInternalAccessibility__axResetToInitialScaleForEntityAction___block_invoke(uint64_t a1)
{
  double v2;
  double v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "assetScreenPosition");
  v3 = v2;
  v4 = *(void **)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 48), "_axUnifiedGestureRecognizerForEntityController:", *(_QWORD *)(a1 + 32));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "unifiedGestureRecognizer:doubleTappedAtScreenPoint:onAsset:", v5, 1, v3);

}

- (id)_axControlForScalingForEntityController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MaxX;
  double MaxY;
  double v13;
  double MinX;
  CGFloat v15;
  void *v16;
  double v17;
  UIBezierPath *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat MidX;
  CGFloat MidY;
  double v27;
  CGFloat v28;
  void *v29;
  id v30;
  uint64_t v31;
  AXEntityControllerAction *v32;
  void *v33;
  AXEntityControllerAction *v34;
  void *v35;
  id val;
  UIView *view;
  _QWORD v39[4];
  id v40;
  id v41;
  _QWORD v42[4];
  id v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;
  _QWORD v48[4];
  id v49;
  id v50;
  _QWORD v51[4];
  id v52;
  id v53;
  CGAffineTransform v54;
  CGAffineTransform v55;
  CGAffineTransform v56;
  _QWORD v57[3];
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect PathBoundingBox;

  v57[1] = *MEMORY[0x24BDAC8D0];
  val = a3;
  v4 = objc_alloc(MEMORY[0x24BDF67A0]);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "initWithAccessibilityContainer:", v5);

  -[ASVPreviewViewControllerInternalAccessibility _axAnnotateAsControl:](self, "_axAnnotateAsControl:", v6);
  -[ASVPreviewViewControllerInternalAccessibility _axBoundsForControls](self, "_axBoundsForControls");
  x = v58.origin.x;
  y = v58.origin.y;
  width = v58.size.width;
  height = v58.size.height;
  MaxX = CGRectGetMaxX(v58);
  v59.origin.x = x;
  v59.origin.y = y;
  v59.size.width = width;
  v59.size.height = height;
  MaxY = CGRectGetMaxY(v59);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  view = (UIView *)objc_claimAutoreleasedReturnValue();
  v13 = MaxY + -100.0;
  if (-[UIView effectiveUserInterfaceLayoutDirection](view, "effectiveUserInterfaceLayoutDirection") == UIUserInterfaceLayoutDirectionRightToLeft)
  {
    v60.origin.x = x;
    v60.origin.y = y;
    v60.size.width = width;
    v60.size.height = height;
    MinX = CGRectGetMinX(v60);
  }
  else
  {
    MinX = MaxX + -100.0;
  }
  v16 = (void *)MEMORY[0x24BDF6870];
  v61.origin.x = MinX + 25.0;
  v15 = v61.origin.x;
  v61.origin.y = v13;
  v61.size.width = 50.0;
  v61.size.height = 100.0;
  v17 = CGRectGetMinX(v61);
  v62.origin.x = v15;
  v62.origin.y = v13;
  v62.size.width = 50.0;
  v62.size.height = 100.0;
  objc_msgSend(v16, "bezierPathWithOvalInRect:", v17, CGRectGetMinY(v62), 50.0, 50.0);
  v18 = (UIBezierPath *)objc_claimAutoreleasedReturnValue();
  v63.origin.x = v15;
  v63.origin.y = v13;
  v63.size.width = 50.0;
  v63.size.height = 100.0;
  v19 = CGRectGetMinX(v63);
  v64.origin.x = v15;
  v64.origin.y = v13;
  v64.size.width = 50.0;
  v64.size.height = 100.0;
  v20 = v19 + (CGRectGetWidth(v64) + -10.0) * 0.5;
  v65.origin.x = v15;
  v65.origin.y = v13;
  v65.size.width = 50.0;
  v65.size.height = 100.0;
  v21 = CGRectGetMinX(v65);
  v66.origin.x = v15;
  v66.origin.y = v13;
  v66.size.width = 50.0;
  v66.size.height = 100.0;
  v22 = v21 + (CGRectGetWidth(v66) + 10.0) * 0.5;
  v67.origin.x = v15;
  v67.origin.y = v13;
  v67.size.width = 50.0;
  v67.size.height = 100.0;
  v23 = CGRectGetMinY(v67) + 50.0;
  v68.origin.x = v15;
  v68.origin.y = v13;
  v68.size.width = 50.0;
  v68.size.height = 100.0;
  v24 = CGRectGetMaxY(v68);
  -[UIBezierPath moveToPoint:](v18, "moveToPoint:", v20, v23);
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v22, v23);
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v22, v24);
  -[UIBezierPath addLineToPoint:](v18, "addLineToPoint:", v20, v24);
  -[UIBezierPath closePath](v18, "closePath");
  memset(&v56, 0, sizeof(v56));
  v69.origin.x = v15;
  v69.origin.y = v13;
  v69.size.width = 50.0;
  v69.size.height = 100.0;
  MidX = CGRectGetMidX(v69);
  v70.origin.x = v15;
  v70.origin.y = v13;
  v70.size.width = 50.0;
  v70.size.height = 100.0;
  MidY = CGRectGetMidY(v70);
  CGAffineTransformMakeTranslation(&v56, MidX, MidY);
  v54 = v56;
  CGAffineTransformRotate(&v55, &v54, -0.785398163);
  v56 = v55;
  v71.origin.x = v15;
  v71.origin.y = v13;
  v71.size.width = 50.0;
  v71.size.height = 100.0;
  v27 = CGRectGetMidX(v71);
  v72.origin.x = v15;
  v72.origin.y = v13;
  v72.size.width = 50.0;
  v72.size.height = 100.0;
  v28 = CGRectGetMidY(v72);
  v54 = v56;
  CGAffineTransformTranslate(&v55, &v54, -v27, -v28);
  v56 = v55;
  -[UIBezierPath applyTransform:](v18, "applyTransform:", &v55);
  UIAccessibilityConvertPathToScreenCoordinates(v18, view);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityPath:", v29);

  objc_msgSend(v6, "accessibilityPath");
  v30 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  PathBoundingBox = CGPathGetPathBoundingBox((CGPathRef)objc_msgSend(v30, "CGPath"));
  objc_msgSend(v6, "setAccessibilityFrame:", PathBoundingBox.origin.x, PathBoundingBox.origin.y, PathBoundingBox.size.width, PathBoundingBox.size.height);

  objc_initWeak((id *)&v55, self);
  objc_initWeak((id *)&v54, val);
  v31 = MEMORY[0x24BDAC760];
  v51[0] = MEMORY[0x24BDAC760];
  v51[1] = 3221225472;
  v51[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke;
  v51[3] = &unk_25017AC80;
  objc_copyWeak(&v52, (id *)&v55);
  objc_copyWeak(&v53, (id *)&v54);
  objc_msgSend(v6, "_setAccessibilityLabelBlock:", v51);
  v48[0] = v31;
  v48[1] = 3221225472;
  v48[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_2;
  v48[3] = &unk_25017AC80;
  objc_copyWeak(&v49, (id *)&v55);
  objc_copyWeak(&v50, (id *)&v54);
  objc_msgSend(v6, "_setAccessibilityHintBlock:", v48);
  objc_msgSend(v6, "setAccessibilityTraits:", *MEMORY[0x24BDF73A0]);
  v45[0] = v31;
  v45[1] = 3221225472;
  v45[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_3;
  v45[3] = &unk_25017ADC0;
  objc_copyWeak(&v46, (id *)&v55);
  objc_copyWeak(&v47, (id *)&v54);
  objc_msgSend(v6, "_setAccessibilityIncrementBlock:", v45);
  v42[0] = v31;
  v42[1] = 3221225472;
  v42[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_4;
  v42[3] = &unk_25017ADC0;
  objc_copyWeak(&v43, (id *)&v55);
  objc_copyWeak(&v44, (id *)&v54);
  objc_msgSend(v6, "_setAccessibilityDecrementBlock:", v42);
  v39[0] = v31;
  v39[1] = 3221225472;
  v39[2] = __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_5;
  v39[3] = &unk_25017AC80;
  objc_copyWeak(&v40, (id *)&v55);
  objc_copyWeak(&v41, (id *)&v54);
  objc_msgSend(v6, "_setAccessibilityValueBlock:", v39);
  v32 = [AXEntityControllerAction alloc];
  accessibilityLocalizedString(CFSTR("SCALING_CONTROL_RESET"));
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = -[AXEntityControllerAction initWithName:target:selector:](v32, "initWithName:target:selector:", v33, self, sel__axResetToInitialScaleForEntityAction_);

  -[AXEntityControllerAction setEntityController:](v34, "setEntityController:", val);
  v57[0] = v34;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 1);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setAccessibilityCustomActions:", v35);

  objc_destroyWeak(&v41);
  objc_destroyWeak(&v40);
  objc_destroyWeak(&v44);
  objc_destroyWeak(&v43);
  objc_destroyWeak(&v47);
  objc_destroyWeak(&v46);
  objc_destroyWeak(&v50);
  objc_destroyWeak(&v49);
  objc_destroyWeak(&v53);
  objc_destroyWeak(&v52);
  objc_destroyWeak((id *)&v54);
  objc_destroyWeak((id *)&v55);

  return v6;
}

id __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("SCALING_CONTROL"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axNameForEntityController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

id __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("SCALING_CONTROL_HINT"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axNameForEntityController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_3(uint64_t a1)
{
  id v2;
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v3) = 1068149419;
  objc_msgSend(WeakRetained, "_axAdjustScaleByMultiplier:entityController:", v2, v3);

}

void __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_4(uint64_t a1)
{
  id v2;
  double v3;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = objc_loadWeakRetained((id *)(a1 + 40));
  LODWORD(v3) = 0.75;
  objc_msgSend(WeakRetained, "_axAdjustScaleByMultiplier:entityController:", v2, v3);

}

id __89__ASVPreviewViewControllerInternalAccessibility__axControlForScalingForEntityController___block_invoke_5(uint64_t a1)
{
  id WeakRetained;
  id v3;
  void *v4;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axAssetScaleForAnnouncementsForEntityController:", v3);
  AXFormatFloatWithPercentage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (float)_axLevitationHeightForEntityController:(id)a3
{
  float result;

  objc_msgSend(a3, "safeFloatForKey:", CFSTR("levitationHeight"));
  return result;
}

- (BOOL)_axTranslateForLevitation:(BOOL)a3 delta:(id)a4 entityController:
{
  float32x2_t v4;
  float32x2_t v5;
  _BOOL4 v6;
  id v8;
  uint64_t v9;
  id v10;
  float32x2_t v11;
  float v12;
  float v13;
  void *v14;
  void *v15;
  float32x2_t v16;
  uint64_t (*v17)(uint64_t);
  uint64_t *v18;
  id v19;
  id v20;
  id v21;
  float32x2_t v22;
  int8x8_t v23;
  float v24;
  __CFString *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  dispatch_time_t v30;
  id v31;
  uint64_t v33;
  _QWORD block[4];
  id v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t (*v38)(uint64_t);
  void *v39;
  id v40;
  uint64_t *v41;
  uint64_t v42;
  _QWORD v43[13];
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  uint64_t v47;

  v5 = v4;
  v6 = a3;
  v8 = a4;
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v9 = MEMORY[0x24BDAC760];
  v47 = 0;
  v43[7] = MEMORY[0x24BDAC760];
  v43[8] = 3221225472;
  v43[9] = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke;
  v43[10] = &unk_25017ADE8;
  v43[12] = &v44;
  v10 = v8;
  v43[11] = v10;
  AXPerformSafeBlock();
  v11 = (float32x2_t)v45[3];

  _Block_object_dispose(&v44, 8);
  -[ASVPreviewViewControllerInternalAccessibility _axLevitationHeightForEntityController:](self, "_axLevitationHeightForEntityController:", v10);
  v13 = v12;
  LOBYTE(v44) = 0;
  objc_opt_class();
  objc_msgSend(v10, "safeValueForKey:", CFSTR("worldGestureRecognizer"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if ((_BYTE)v44)
    abort();
  v16 = vadd_f32(v11, v5);
  if (v6)
  {
    v43[0] = v9;
    v17 = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_2;
    v18 = v43;
  }
  else
  {
    v42 = v9;
    v17 = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_3;
    v18 = &v42;
  }
  v18[1] = 3221225472;
  v18[2] = (uint64_t)v17;
  v18[3] = (uint64_t)&unk_25017AE10;
  v19 = v10;
  v18[4] = (uint64_t)v19;
  v20 = v15;
  v18[5] = (uint64_t)v20;
  v18[6] = (uint64_t)v16;
  AXPerformSafeBlock();

  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v36 = v9;
  v37 = 3221225472;
  v38 = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_4;
  v39 = &unk_25017ADE8;
  v41 = &v44;
  v21 = v19;
  v40 = v21;
  AXPerformSafeBlock();
  v22 = (float32x2_t)v45[3];

  _Block_object_dispose(&v44, 8);
  v23 = vmvn_s8((int8x8_t)vceq_f32(v11, v22));
  if (((v23.i32[0] | v23.i32[1]) & 1) != 0)
  {
    if (!v6)
    {
      -[ASVPreviewViewControllerInternalAccessibility _axDescriptionForCurrentPositionForEntityController:](self, "_axDescriptionForCurrentPositionForEntityController:", v21);
      v33 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    -[ASVPreviewViewControllerInternalAccessibility _axLevitationHeightForEntityController:](self, "_axLevitationHeightForEntityController:", v21);
    if (v13 <= 0.0 == v24 > 0.0)
    {
      if (v24 <= 0.0)
        v25 = CFSTR("NOT_FLOATING");
      else
        v25 = CFSTR("FLOATING");
      accessibilityLocalizedString(v25);
      v33 = objc_claimAutoreleasedReturnValue();
LABEL_16:
      v29 = (void *)v33;
      if (!v33)
        goto LABEL_12;
      goto LABEL_11;
    }
  }
  else
  {
    v26 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("UNABLE_TO_MOVE"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVPreviewViewControllerInternalAccessibility _axNameForEntityController:](self, "_axNameForEntityController:", v21);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringWithFormat:", v27, v28);
    v29 = (void *)objc_claimAutoreleasedReturnValue();

    if (v29)
    {
LABEL_11:
      v30 = dispatch_time(0, 100000000);
      block[0] = v9;
      block[1] = 3221225472;
      block[2] = __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_5;
      block[3] = &unk_25017AC30;
      v35 = v29;
      v31 = v29;
      dispatch_after(v30, MEMORY[0x24BDAC9B8], block);

    }
  }
LABEL_12:

  return 1;
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "assetScreenPosition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "worldGestureRecognizer:levitatedAssetToScreenPoint:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "worldGestureRecognizer:translatedAssetToScreenPoint:", *(_QWORD *)(a1 + 40), *(double *)(a1 + 48));
}

uint64_t __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_4(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  result = objc_msgSend(*(id *)(a1 + 32), "assetScreenPosition");
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = v3;
  return result;
}

void __98__ASVPreviewViewControllerInternalAccessibility__axTranslateForLevitation_delta_entityController___block_invoke_5(uint64_t a1)
{
  UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], *(id *)(a1 + 32));
}

- (id)_axControlForTranslationForLevitation:(BOOL)a3 delta:(id)a4 nameFormat:(id)a5 entityController:
{
  void *v5;
  _BOOL8 v7;
  id v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  __int128 v14;
  double v15;
  uint64_t v16;
  id v17;
  uint64_t v18;
  id v19;
  double v21;
  double v22;
  void *v23;
  _QWORD v24[4];
  id v25;
  id v26[2];
  BOOL v27;
  _QWORD v28[4];
  id v29;
  id v30;
  id v31;
  id from;
  id location;
  id v34;
  __int128 v35;
  __int128 v36;

  v23 = v5;
  v7 = a3;
  v9 = a4;
  v10 = a5;
  v11 = objc_alloc(MEMORY[0x24BDF67A0]);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_msgSend(v11, "initWithAccessibilityContainer:", v12);

  -[ASVPreviewViewControllerInternalAccessibility _axAnnotateAsControl:](self, "_axAnnotateAsControl:", v13);
  v14 = *(_OWORD *)(MEMORY[0x24BDBF090] + 16);
  v35 = *MEMORY[0x24BDBF090];
  v36 = v14;
  v15 = *(double *)&v23;
  if (*(float *)&v23 >= 0.0)
  {
    if (*(float *)&v23 <= 0.0)
    {
      HIDWORD(v15) = HIDWORD(v23);
      LODWORD(v15) = HIDWORD(v23);
      if (*((float *)&v23 + 1) >= 0.0)
      {
        if (*((float *)&v23 + 1) <= 0.0)
        {
          v21 = *(float *)&v23;
          v22 = *((float *)&v23 + 1);
          _AXAssert();
        }
        v16 = 4;
      }
      else
      {
        v16 = 1;
      }
    }
    else
    {
      v16 = 8;
    }
  }
  else
  {
    v16 = 2;
  }
  v34 = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axGetAccessibilityFrame:path:forArrowTowardsEdge:isDoubleArrow:](self, "_axGetAccessibilityFrame:path:forArrowTowardsEdge:isDoubleArrow:", &v35, &v34, v16, v7, v15, *(_QWORD *)&v21, *(_QWORD *)&v22);
  v17 = v34;
  objc_msgSend(v13, "setAccessibilityFrame:", v35, v36);
  objc_msgSend(v13, "setAccessibilityPath:", v17);
  objc_initWeak(&location, self);
  objc_initWeak(&from, v10);
  v18 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke;
  v28[3] = &unk_25017AD20;
  v19 = v9;
  v29 = v19;
  objc_copyWeak(&v30, &location);
  objc_copyWeak(&v31, &from);
  objc_msgSend(v13, "_setAccessibilityLabelBlock:", v28);
  objc_msgSend(v13, "setAccessibilityTraits:", *MEMORY[0x24BDF73B0]);
  v24[0] = v18;
  v24[1] = 3221225472;
  v24[2] = __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke_2;
  v24[3] = &unk_25017AE38;
  objc_copyWeak(&v25, &location);
  v27 = v7;
  v26[1] = v23;
  objc_copyWeak(v26, &from);
  objc_msgSend(v13, "_setAccessibilityActivateBlock:", v24);
  objc_msgSend(v13, "_accessibilitySetScannerActivateBehavior:", 1);
  objc_destroyWeak(v26);
  objc_destroyWeak(&v25);
  objc_destroyWeak(&v31);
  objc_destroyWeak(&v30);

  objc_destroyWeak(&from);
  objc_destroyWeak(&location);

  return v13;
}

id __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  id WeakRetained;
  id v5;
  void *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD17C8];
  v3 = *(_QWORD *)(a1 + 32);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v5 = objc_loadWeakRetained((id *)(a1 + 48));
  objc_msgSend(WeakRetained, "_axNameForEntityController:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringWithFormat:", v3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __121__ASVPreviewViewControllerInternalAccessibility__axControlForTranslationForLevitation_delta_nameFormat_entityController___block_invoke_2(uint64_t a1)
{
  id WeakRetained;
  uint64_t v3;
  double v4;
  id v5;
  uint64_t v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v3 = *(unsigned __int8 *)(a1 + 56);
  v4 = *(double *)(a1 + 48);
  v5 = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = objc_msgSend(WeakRetained, "_axTranslateForLevitation:delta:entityController:", v3, v5, v4);

  return v6;
}

- (id)_axDescriptionForCurrentPositionForEntityController:(id)a3
{
  id v4;
  void *v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  void *v26;
  double MidY;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  __CFString *v32;
  const __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  void *v37;
  double MidX;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;

  v4 = a3;
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;

  -[ASVPreviewViewControllerInternalAccessibility _axBoundingRectForEntityController:](self, "_axBoundingRectForEntityController:", v4);
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v40.origin.x = v15;
  v40.origin.y = v17;
  v40.size.width = v19;
  v40.size.height = v21;
  v48.origin.x = v7;
  v48.origin.y = v9;
  v48.size.width = v11;
  v48.size.height = v13;
  v41 = CGRectIntersection(v40, v48);
  x = v41.origin.x;
  y = v41.origin.y;
  width = v41.size.width;
  height = v41.size.height;
  if (!CGRectIsNull(v41))
  {
    v42.origin.x = x;
    v42.origin.y = y;
    v42.size.width = width;
    v42.size.height = height;
    MidX = CGRectGetMidX(v42);
    v43.origin.x = x;
    v43.origin.y = y;
    v43.size.width = width;
    v43.size.height = height;
    MidY = CGRectGetMidY(v43);
    v44.origin.x = v7;
    v44.origin.y = v9;
    v44.size.width = v11;
    v44.size.height = v13;
    v28 = CGRectGetWidth(v44) * 0.333333333;
    v45.origin.x = v7;
    v45.origin.y = v9;
    v45.size.width = v11;
    v45.size.height = v13;
    v29 = CGRectGetWidth(v45);
    v46.origin.x = v7;
    v46.origin.y = v9;
    v46.size.width = v11;
    v46.size.height = v13;
    v30 = CGRectGetHeight(v46) * 0.333333333;
    v47.origin.x = v7;
    v47.origin.y = v9;
    v47.size.width = v11;
    v47.size.height = v13;
    v31 = CGRectGetHeight(v47) * 0.666666667;
    if (MidX >= v28)
    {
      if (MidX >= v29 * 0.666666667)
      {
        if (MidY < v30)
        {
          v32 = CFSTR("TOP_RIGHT");
          goto LABEL_17;
        }
        v33 = CFSTR("BOTTOM_RIGHT");
        v34 = CFSTR("MIDDLE_RIGHT");
      }
      else
      {
        if (MidY < v30)
        {
          v32 = CFSTR("TOP_CENTER");
          goto LABEL_17;
        }
        v33 = CFSTR("BOTTOM_CENTER");
        v34 = CFSTR("MIDDLE_CENTER");
      }
    }
    else
    {
      if (MidY < v30)
      {
        v32 = CFSTR("TOP_LEFT");
LABEL_17:
        accessibilityLocalizedString(v32);
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = (void *)MEMORY[0x24BDD17C8];
        accessibilityLocalizedString(CFSTR("POSITIONED_AT_ANNOUNCEMENT"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "localizedStringWithFormat:", v37, v35);
        v26 = (void *)objc_claimAutoreleasedReturnValue();

        return v26;
      }
      v33 = CFSTR("BOTTOM_LEFT");
      v34 = CFSTR("MIDDLE_LEFT");
    }
    if (MidY >= v31)
      v32 = (__CFString *)v33;
    else
      v32 = (__CFString *)v34;
    goto LABEL_17;
  }
  v26 = 0;
  return v26;
}

- (CGRect)_axBoundingRectForEntityController:(id)a3
{
  id v4;
  __int128 *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  CGRect *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  CGRect result;

  v4 = a3;
  v5 = (__int128 *)MEMORY[0x24BDBF070];
  v6 = *MEMORY[0x24BDBF070];
  v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 24);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v22 = 0;
    v23 = (CGRect *)&v22;
    v24 = 0x4010000000;
    v25 = "";
    v11 = v5[1];
    v26 = *v5;
    v27 = v11;
    v20 = v4;
    v21 = v10;
    AXPerformSafeBlock();
    if (!CGRectIsNull(v23[1]))
    {
      UIAccessibilityFrameForBounds();
      v6 = v12;
      v7 = v13;
      v8 = v14;
      v9 = v15;
    }

    _Block_object_dispose(&v22, 8);
  }

  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

uint64_t __84__ASVPreviewViewControllerInternalAccessibility__axBoundingRectForEntityController___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "calculateAssetScreenBoundingRectIn:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (CGRect)_axBoundingRectForEntityWrapper:(id)a3
{
  id v4;
  __int128 *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  __int128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  id v20;
  id v21;
  uint64_t v22;
  CGRect *v23;
  uint64_t v24;
  const char *v25;
  __int128 v26;
  __int128 v27;
  CGRect result;

  v4 = a3;
  v5 = (__int128 *)MEMORY[0x24BDBF070];
  v6 = *MEMORY[0x24BDBF070];
  v7 = *(double *)(MEMORY[0x24BDBF070] + 8);
  v8 = *(double *)(MEMORY[0x24BDBF070] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF070] + 24);
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v22 = 0;
    v23 = (CGRect *)&v22;
    v24 = 0x4010000000;
    v25 = "";
    v11 = v5[1];
    v26 = *v5;
    v27 = v11;
    v20 = v4;
    v21 = v10;
    AXPerformSafeBlock();
    if (!CGRectIsNull(v23[1]))
    {
      UIAccessibilityFrameForBounds();
      v6 = v12;
      v7 = v13;
      v8 = v14;
      v9 = v15;
    }

    _Block_object_dispose(&v22, 8);
  }

  v16 = v6;
  v17 = v7;
  v18 = v8;
  v19 = v9;
  result.size.height = v19;
  result.size.width = v18;
  result.origin.y = v17;
  result.origin.x = v16;
  return result;
}

uint64_t __81__ASVPreviewViewControllerInternalAccessibility__axBoundingRectForEntityWrapper___block_invoke(uint64_t a1)
{
  uint64_t result;
  _QWORD *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  result = objc_msgSend(*(id *)(a1 + 32), "calculateScreenBoundingRectIn:", *(_QWORD *)(a1 + 40));
  v3 = *(_QWORD **)(*(_QWORD *)(a1 + 48) + 8);
  v3[4] = v4;
  v3[5] = v5;
  v3[6] = v6;
  v3[7] = v7;
  return result;
}

- (int64_t)_axEmitterMode
{
  void *v2;
  int64_t v3;

  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("emitterMode"));

  return v3;
}

- (id)_axRootEntityController
{
  return (id)-[ASVPreviewViewControllerInternalAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRootEntityController"));
}

- (id)_axEntityControllers
{
  return (id)-[ASVPreviewViewControllerInternalAccessibility safeArrayForKey:](self, "safeArrayForKey:", CFSTR("accessibilityEntityControllers"));
}

- (id)_axEntityElementsForEntityController:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  NSObject *v16;
  uint64_t v17;
  id v18;
  id v19;
  id v20;
  void *v21;
  id v22;
  _QWORD v24[5];
  id v25;
  uint64_t v26;
  uint64_t v27;
  void (*v28)(uint64_t);
  void *v29;
  id v30;
  id v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  char v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axRootEntityController](self, "_axRootEntityController");
  v6 = (id)objc_claimAutoreleasedReturnValue();

  if (v6 == v4)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = 0u;
    v43 = 0u;
    v40 = 0u;
    v41 = 0u;
    -[ASVPreviewViewControllerInternalAccessibility _axEntityControllers](self, "_axEntityControllers");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
    if (v9)
    {
      v10 = *(_QWORD *)v41;
      while (2)
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v41 != v10)
            objc_enumerationMutation(v8);
          v12 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          -[ASVPreviewViewControllerInternalAccessibility _axRootEntityController](self, "_axRootEntityController");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = v12 == v13;

          if (v14)
          {
            AXLogAppAccessibility();
            v16 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
              -[ASVPreviewViewControllerInternalAccessibility _axEntityElementsForEntityController:].cold.1(v16);

            goto LABEL_15;
          }
          -[ASVPreviewViewControllerInternalAccessibility _axEntityWrappersForEntityController:](self, "_axEntityWrappersForEntityController:", v12);
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "addObjectsFromArray:", v15);

        }
        v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v9)
          continue;
        break;
      }
    }
LABEL_15:

  }
  else
  {
    -[ASVPreviewViewControllerInternalAccessibility _axEntityWrappersForEntityController:](self, "_axEntityWrappersForEntityController:", v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v39 = 0;
  objc_opt_class();
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v17 = MEMORY[0x24BDAC760];
  v38 = 0;
  v26 = MEMORY[0x24BDAC760];
  v27 = 3221225472;
  v28 = __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke;
  v29 = &unk_25017ABE0;
  v32 = &v33;
  v18 = v5;
  v30 = v18;
  v19 = v7;
  v31 = v19;
  AXPerformSafeBlock();
  v20 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  __UIAccessibilityCastAsClass();
  v21 = (void *)objc_claimAutoreleasedReturnValue();

  if (v39)
    abort();
  v24[0] = v17;
  v24[1] = 3221225472;
  v24[2] = __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_2;
  v24[3] = &unk_25017AE88;
  v24[4] = self;
  v25 = v19;
  v22 = v19;
  objc_msgSend(v21, "enumerateObjectsUsingBlock:", v24);

  return v21;
}

void __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityElementsForEntityWrappers:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  id v10;
  id location;

  v5 = a2;
  objc_initWeak(&location, *(id *)(a1 + 32));
  objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_3;
  v8[3] = &unk_25017AE60;
  objc_copyWeak(&v10, &location);
  v7 = v6;
  v9 = v7;
  objc_msgSend(v5, "_setAccessibilityLabelBlock:", v8);

  objc_destroyWeak(&v10);
  objc_destroyWeak(&location);

}

id __86__ASVPreviewViewControllerInternalAccessibility__axEntityElementsForEntityController___block_invoke_3(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  __CFString *v4;
  uint64_t v5;
  void *v7;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "_axNameForEntityWrapper:", *(_QWORD *)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(WeakRetained, "_axEmitterMode") & 0xFFFFFFFFFFFFFFFDLL) == 1)
  {
    v4 = CFSTR("ASSET_IS_NOT_PLACED");
LABEL_5:
    accessibilityLocalizedString(v4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
    goto LABEL_6;
  }
  if (objc_msgSend(WeakRetained, "_axIsOffScreenForEntityWrapper:", *(_QWORD *)(a1 + 32)))
  {
    v4 = CFSTR("ASSET_IS_OFF_SCREEN");
    goto LABEL_5;
  }
LABEL_6:

  return v3;
}

- (id)_axObjectModeControlsForEntityController:(id)a3 isRTL:(BOOL)a4
{
  _BOOL4 v4;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  void *v29;

  v4 = a4;
  v6 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axCreateAssetElementForEntityController:](self, "_axCreateAssetElementForEntityController:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v8);

  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_YAW_HINT"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_PITCH_HINT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_CLOCKWISE"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = -1090123118;
  LODWORD(v13) = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:](self, "_axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:", v11, v9, 1, v6, v12, v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_COUNTERCLOCKWISE"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = 1057360530;
  LODWORD(v17) = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:](self, "_axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:", v15, v9, 1, v6, v16, v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v19 = v18;
  else
    v19 = v14;
  if (v4)
    v20 = v14;
  else
    v20 = v18;
  objc_msgSend(v7, "addObject:", v19);
  objc_msgSend(v7, "addObject:", v20);
  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_AWAY"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v22) = -1098511726;
  LODWORD(v23) = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:](self, "_axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:", v21, v10, 1, v6, v23, v22);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v24);

  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_TOWARD"));
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v26) = 1048971922;
  LODWORD(v27) = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:](self, "_axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:", v25, v10, 1, v6, v27, v26);
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v28);

  -[ASVPreviewViewControllerInternalAccessibility _axControlForScalingForEntityController:](self, "_axControlForScalingForEntityController:", v6);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "addObject:", v29);

  return v7;
}

- (id)_axARModeControlsForEntityController:(id)a3 isRTL:(BOOL)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  uint64_t v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _BOOL4 v42;
  _QWORD v43[5];

  v42 = a4;
  v43[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axCreateAssetElementForEntityController:](self, "_axCreateAssetElementForEntityController:", v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v7);

  accessibilityLocalizedString(CFSTR("TRANSLATION_CONTROL_LEFT"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axControlForTranslationForLevitation:delta:nameFormat:entityController:](self, "_axControlForTranslationForLevitation:delta:nameFormat:entityController:", 0, v8, v5, COERCE_DOUBLE(3259498496));
  v9 = objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("TRANSLATION_CONTROL_RIGHT"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axControlForTranslationForLevitation:delta:nameFormat:entityController:](self, "_axControlForTranslationForLevitation:delta:nameFormat:entityController:", 0, v10, v5, COERCE_DOUBLE(1112014848));
  v11 = objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("TRANSLATION_CONTROL_BACKWARD"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axControlForTranslationForLevitation:delta:nameFormat:entityController:](self, "_axControlForTranslationForLevitation:delta:nameFormat:entityController:", 0, v12, v5, -2.0615843e11);
  v13 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v13;

  accessibilityLocalizedString(CFSTR("TRANSLATION_CONTROL_FORWARD"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axControlForTranslationForLevitation:delta:nameFormat:entityController:](self, "_axControlForTranslationForLevitation:delta:nameFormat:entityController:", 0, v14, v5, 2.0615843e11);
  v15 = objc_claimAutoreleasedReturnValue();
  v38 = (void *)v15;

  accessibilityLocalizedString(CFSTR("TRANSLATION_CONTROL_UP"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axControlForTranslationForLevitation:delta:nameFormat:entityController:](self, "_axControlForTranslationForLevitation:delta:nameFormat:entityController:", 1, v16, v5, -2.0615843e11);
  v17 = objc_claimAutoreleasedReturnValue();
  v37 = (void *)v17;

  accessibilityLocalizedString(CFSTR("TRANSLATION_CONTROL_DOWN"));
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASVPreviewViewControllerInternalAccessibility _axControlForTranslationForLevitation:delta:nameFormat:entityController:](self, "_axControlForTranslationForLevitation:delta:nameFormat:entityController:", 1, v18, v5, 2.0615843e11);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v40 = (void *)v11;
  v41 = (void *)v9;
  if (v42)
    v20 = v11;
  else
    v20 = v9;
  if (v42)
    v21 = v9;
  else
    v21 = v11;
  objc_msgSend(v6, "addObject:", v20);
  objc_msgSend(v6, "addObject:", v21);
  v43[0] = v13;
  v43[1] = v15;
  v43[2] = v17;
  v43[3] = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v43, 4);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObjectsFromArray:", v22);

  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_YAW_HINT"));
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_CLOCKWISE"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v25) = -1090123118;
  LODWORD(v26) = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:](self, "_axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:", v24, v23, 0, v5, v25, v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  accessibilityLocalizedString(CFSTR("ROTATION_CONTROL_COUNTERCLOCKWISE"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v29) = 1057360530;
  LODWORD(v30) = 0;
  -[ASVPreviewViewControllerInternalAccessibility _axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:](self, "_axControlForRotationWithDeltaYaw:deltaPitch:nameFormat:hintFormat:shouldUseArrows:entityController:", v28, v23, 0, v5, v29, v30);
  v31 = objc_claimAutoreleasedReturnValue();
  v32 = (void *)v31;
  if (v42)
    v33 = (void *)v31;
  else
    v33 = v27;
  if (v42)
    v34 = v27;
  else
    v34 = (void *)v31;

  objc_msgSend(v6, "addObject:", v33);
  objc_msgSend(v6, "addObject:", v34);
  -[ASVPreviewViewControllerInternalAccessibility _axControlForScalingForEntityController:](self, "_axControlForScalingForEntityController:", v5);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "addObject:", v35);

  return v6;
}

- (id)_axObjectModeControls
{
  JUMPOUT(0x234906A7CLL);
}

- (void)_axSetObjectModeControls:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axARModeControls
{
  JUMPOUT(0x234906A7CLL);
}

- (void)_axSetARModeControls:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (void)_axUpdateARViewAccessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  -[ASVPreviewViewControllerInternalAccessibility _axARView](self, "_axARView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "effectiveUserInterfaceLayoutDirection");
    if ((-[ASVPreviewViewControllerInternalAccessibility _axEmitterMode](self, "_axEmitterMode") & 0xFFFFFFFFFFFFFFFELL) == 2)
    {
      -[ASVPreviewViewControllerInternalAccessibility _axARModeControls](self, "_axARModeControls");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (v6)
      {
LABEL_15:
        objc_msgSend(v4, "setAccessibilityElements:", v6, (_QWORD)v14);

        goto LABEL_16;
      }
      -[ASVPreviewViewControllerInternalAccessibility _axEntityControllers](self, "_axEntityControllers");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0u;
      v15 = 0u;
      v16 = 0u;
      v17 = 0u;
      v8 = v7;
      v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
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
            -[ASVPreviewViewControllerInternalAccessibility _axARModeControlsForEntityController:isRTL:](self, "_axARModeControlsForEntityController:isRTL:", *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * i), v5 == 1, (_QWORD)v14);
            v13 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObjectsFromArray:", v13);

          }
          v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
        }
        while (v10);
      }

      -[ASVPreviewViewControllerInternalAccessibility _axSetARModeControls:](self, "_axSetARModeControls:", v6);
    }
    else
    {
      -[ASVPreviewViewControllerInternalAccessibility _axRootEntityController](self, "_axRootEntityController");
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[ASVPreviewViewControllerInternalAccessibility _axObjectModeControls](self, "_axObjectModeControls");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        -[ASVPreviewViewControllerInternalAccessibility _axObjectModeControlsForEntityController:isRTL:](self, "_axObjectModeControlsForEntityController:isRTL:", v8, v5 == 1);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[ASVPreviewViewControllerInternalAccessibility _axSetObjectModeControls:](self, "_axSetObjectModeControls:", v6);
      }
    }

    goto LABEL_15;
  }
LABEL_16:

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility viewDidAppear:](&v4, sel_viewDidAppear_, a3);
  -[ASVPreviewViewControllerInternalAccessibility _axToggleVisibilityAnnouncementsIfNeeded](self, "_axToggleVisibilityAnnouncementsIfNeeded");
}

- (void)viewDidDisappear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility viewDidDisappear:](&v4, sel_viewDidDisappear_, a3);
  -[ASVPreviewViewControllerInternalAccessibility _axToggleVisibilityAnnouncementsIfNeeded](self, "_axToggleVisibilityAnnouncementsIfNeeded");
}

- (void)handleTapAtPointWithPoint:(CGPoint)a3
{
  void *v4;
  double v5;
  double v6;
  UIAccessibilityNotifications v7;
  __CFString *v8;
  void *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility handleTapAtPointWithPoint:](&v10, sel_handleTapAtPointWithPoint_, a3.x, a3.y);
  -[ASVPreviewViewControllerInternalAccessibility _axControlsViewStack](self, "_axControlsViewStack");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alpha");
  v6 = v5;

  v7 = *MEMORY[0x24BDF71E8];
  if (v6 == 1.0)
    v8 = CFSTR("CONTROLS_SHOWN");
  else
    v8 = CFSTR("CONTROLS_HIDDEN");
  accessibilityLocalizedString(v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v7, v9);

  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_axSetOffScreen:(BOOL)a3 forEntityController:(id)a4
{
  objc_msgSend(a4, "_accessibilitySetBoolValue:forKey:", a3, CFSTR("IsOffScreen"));
}

- (BOOL)_axIsOffScreenForEntityController:(id)a3
{
  return objc_msgSend(a3, "_accessibilityBoolValueForKey:", CFSTR("IsOffScreen"));
}

- (id)_axEntityIdentifiersToOffScreenState
{
  JUMPOUT(0x234906A7CLL);
}

- (void)_axSetEntityIdentifiersToOffScreenState:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axIdentifierForEntityWrapper:(id)a3
{
  return (id)objc_msgSend(a3, "safeValueForKey:", CFSTR("identifier"));
}

- (void)_axSetOffScreen:(BOOL)a3 forEntityWrapper:(id)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[ASVPreviewViewControllerInternalAccessibility _axIdentifierForEntityWrapper:](self, "_axIdentifierForEntityWrapper:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v9 = v6;
    -[ASVPreviewViewControllerInternalAccessibility _axEntityIdentifiersToOffScreenState](self, "_axEntityIdentifiersToOffScreenState");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v7)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVPreviewViewControllerInternalAccessibility _axSetEntityIdentifiersToOffScreenState:](self, "_axSetEntityIdentifiersToOffScreenState:", v7);
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setObject:forKeyedSubscript:", v8, v9);

    v6 = v9;
  }

}

- (BOOL)_axIsOffScreenForEntityWrapper:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[ASVPreviewViewControllerInternalAccessibility _axIdentifierForEntityWrapper:](self, "_axIdentifierForEntityWrapper:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[ASVPreviewViewControllerInternalAccessibility _axEntityIdentifiersToOffScreenState](self, "_axEntityIdentifiersToOffScreenState");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "BOOLValue");

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (void)_axCheckForAppearanceOfObjectsWithTimer:(id)a3
{
  uint64_t i;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t j;
  void *v12;
  _BOOL4 v13;
  _BOOL8 IsNull;
  _BOOL4 v15;
  _BOOL8 v16;
  _BOOL4 v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  const __CFString *v30;
  void *v31;
  void *v32;
  id obj;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v47 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array", a3);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  -[ASVPreviewViewControllerInternalAccessibility _axEntityControllers](self, "_axEntityControllers");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
  if (v35)
  {
    v34 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v35; ++i)
      {
        if (*(_QWORD *)v42 != v34)
          objc_enumerationMutation(obj);
        v5 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * i);
        -[ASVPreviewViewControllerInternalAccessibility _axEntityWrappersForEntityController:](self, "_axEntityWrappersForEntityController:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "count"))
        {
          v39 = 0u;
          v40 = 0u;
          v37 = 0u;
          v38 = 0u;
          v36 = v6;
          v7 = v6;
          v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
          if (!v8)
            goto LABEL_20;
          v9 = v8;
          v10 = *(_QWORD *)v38;
          while (1)
          {
            for (j = 0; j != v9; ++j)
            {
              if (*(_QWORD *)v38 != v10)
                objc_enumerationMutation(v7);
              v12 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * j);
              v13 = -[ASVPreviewViewControllerInternalAccessibility _axIsOffScreenForEntityWrapper:](self, "_axIsOffScreenForEntityWrapper:", v12);
              if ((objc_msgSend(v12, "safeBoolForKey:", CFSTR("isEntityActive")) & 1) == 0)
              {
                if (v13)
                  continue;
                IsNull = 1;
LABEL_17:
                -[ASVPreviewViewControllerInternalAccessibility _axSetOffScreen:forEntityWrapper:](self, "_axSetOffScreen:forEntityWrapper:", IsNull, v12);
                continue;
              }
              -[ASVPreviewViewControllerInternalAccessibility _axBoundingRectForEntityWrapper:](self, "_axBoundingRectForEntityWrapper:", v12);
              IsNull = CGRectIsNull(v48);
              if (v13 != IsNull)
                goto LABEL_17;
            }
            v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v37, v45, 16);
            if (!v9)
            {
LABEL_20:

              v6 = v36;
              break;
            }
          }
        }
        v15 = -[ASVPreviewViewControllerInternalAccessibility _axIsOffScreenForEntityController:](self, "_axIsOffScreenForEntityController:", v5);
        -[ASVPreviewViewControllerInternalAccessibility _axBoundingRectForEntityController:](self, "_axBoundingRectForEntityController:", v5);
        v16 = CGRectIsNull(v49);
        if (v15 != v16)
        {
          v17 = v16;
          -[ASVPreviewViewControllerInternalAccessibility _axSetOffScreen:forEntityController:](self, "_axSetOffScreen:forEntityController:", v16, v5);
          -[ASVPreviewViewControllerInternalAccessibility _axNameForEntityController:](self, "_axNameForEntityController:", v5);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          if (v17)
            v19 = v32;
          else
            v19 = v31;
          objc_msgSend(v19, "addObject:", v18);

        }
      }
      v35 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v41, v46, 16);
    }
    while (v35);
  }

  v20 = v32;
  if (!-[ASVPreviewViewControllerInternalAccessibility _axIsFirstVisibilityAnnouncement](self, "_axIsFirstVisibilityAnnouncement")&& (objc_msgSend(v31, "count") || objc_msgSend(v32, "count")))
  {
    if (objc_msgSend(v32, "count"))
    {
      v21 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("ASSETS_MOVED_OFF_SCREEN"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x2349069D4](v32);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "localizedStringWithFormat:", v22, v23);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v24 = 0;
    }
    if (objc_msgSend(v31, "count", v29, v30))
    {
      v25 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("ASSETS_MOVED_ON_SCREEN"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      MEMORY[0x2349069D4](v31);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "localizedStringWithFormat:", v26, v27);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v30 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v28 = objc_claimAutoreleasedReturnValue();

      v24 = (void *)v28;
    }
    UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v24);

    v20 = v32;
  }
  -[ASVPreviewViewControllerInternalAccessibility _axSetIsFirstVisibilityAnnouncement:](self, "_axSetIsFirstVisibilityAnnouncement:", 0, v29, v30);

}

- (id)_axTimerForVisibilityAnnouncements
{
  JUMPOUT(0x234906A7CLL);
}

- (void)_axSetTimerForVisibilityAnnouncements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (BOOL)_axIsFirstVisibilityAnnouncement
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetIsFirstVisibilityAnnouncement:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (void)_axToggleVisibilityAnnouncementsIfNeeded
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
  void (*v12)(uint64_t, void *);
  void *v13;
  id v14;
  id location;

  if (-[ASVPreviewViewControllerInternalAccessibility _axEmitterMode](self, "_axEmitterMode") != 2)
    goto LABEL_5;
  LOBYTE(location) = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[ASVPreviewViewControllerInternalAccessibility _axTimerForVisibilityAnnouncements](self, "_axTimerForVisibilityAnnouncements");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
    {
      -[ASVPreviewViewControllerInternalAccessibility _axSetIsFirstVisibilityAnnouncement:](self, "_axSetIsFirstVisibilityAnnouncement:", 1);
      objc_initWeak(&location, self);
      v7 = (void *)MEMORY[0x24BDBCF40];
      v10 = MEMORY[0x24BDAC760];
      v11 = 3221225472;
      v12 = __89__ASVPreviewViewControllerInternalAccessibility__axToggleVisibilityAnnouncementsIfNeeded__block_invoke;
      v13 = &unk_25017AEB0;
      objc_copyWeak(&v14, &location);
      objc_msgSend(v7, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v10, 1.0);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVPreviewViewControllerInternalAccessibility _axSetTimerForVisibilityAnnouncements:](self, "_axSetTimerForVisibilityAnnouncements:", v8, v10, v11, v12, v13);

      objc_destroyWeak(&v14);
      objc_destroyWeak(&location);
    }
  }
  else
  {
LABEL_5:
    -[ASVPreviewViewControllerInternalAccessibility _axTimerForVisibilityAnnouncements](self, "_axTimerForVisibilityAnnouncements");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "invalidate");

    -[ASVPreviewViewControllerInternalAccessibility _axSetTimerForVisibilityAnnouncements:](self, "_axSetTimerForVisibilityAnnouncements:", 0);
  }
}

void __89__ASVPreviewViewControllerInternalAccessibility__axToggleVisibilityAnnouncementsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id *v2;
  id v3;
  id WeakRetained;

  v2 = (id *)(a1 + 32);
  v3 = a2;
  WeakRetained = objc_loadWeakRetained(v2);
  objc_msgSend(WeakRetained, "_axCheckForAppearanceOfObjectsWithTimer:", v3);

}

- (void)_axUpdateForOldEmitterMode:(int64_t)a3
{
  int64_t v5;
  UIAccessibilityNotifications v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = -[ASVPreviewViewControllerInternalAccessibility _axEmitterMode](self, "_axEmitterMode");
  if (v5 != a3)
  {
    if (a3 == 3 && v5 == 2)
    {
      v6 = *MEMORY[0x24BDF71E8];
      v7 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("ASSET_PLACED_IN_WORLD"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVPreviewViewControllerInternalAccessibility _axRootEntityController](self, "_axRootEntityController");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[ASVPreviewViewControllerInternalAccessibility _axNameForEntityController:](self, "_axNameForEntityController:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      UIAccessibilityPostNotification(v6, v11);

    }
    else if (((a3 & 0xFFFFFFFFFFFFFFFELL) == 2) != ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2))
    {
      -[ASVPreviewViewControllerInternalAccessibility _axUpdateARViewAccessibilityElements](self, "_axUpdateARViewAccessibilityElements");
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
    }
    -[ASVPreviewViewControllerInternalAccessibility _axToggleVisibilityAnnouncementsIfNeeded](self, "_axToggleVisibilityAnnouncementsIfNeeded");
  }
}

- (void)updateInterfaceState
{
  int64_t v3;
  objc_super v4;

  v3 = -[ASVPreviewViewControllerInternalAccessibility _axEmitterMode](self, "_axEmitterMode");
  v4.receiver = self;
  v4.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility updateInterfaceState](&v4, sel_updateInterfaceState);
  -[ASVPreviewViewControllerInternalAccessibility _axUpdateForOldEmitterMode:](self, "_axUpdateForOldEmitterMode:", v3);
}

- (void)entityController:(id)a3 doubleTappedAt:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  dispatch_time_t v8;
  id v9;
  _QWORD v10[5];
  id v11;
  objc_super v12;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v12.receiver = self;
  v12.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility entityController:doubleTappedAt:](&v12, sel_entityController_doubleTappedAt_, v7, x, y);
  v8 = dispatch_time(0, 500000000);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __81__ASVPreviewViewControllerInternalAccessibility_entityController_doubleTappedAt___block_invoke;
  v10[3] = &unk_25017AED8;
  v10[4] = self;
  v11 = v7;
  v9 = v7;
  dispatch_after(v8, MEMORY[0x24BDAC9B8], v10);

}

void __81__ASVPreviewViewControllerInternalAccessibility_entityController_doubleTappedAt___block_invoke(uint64_t a1)
{
  UIAccessibilityNotifications v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v2 = *MEMORY[0x24BDF71E8];
  v3 = (void *)MEMORY[0x24BDD17C8];
  accessibilityLocalizedString(CFSTR("RESET_SCALE_ANNOUNCEMENT"));
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axAssetScaleForAnnouncementsForEntityController:", *(_QWORD *)(a1 + 40));
  AXFormatFloatWithPercentage();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringWithFormat:", v6, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  UIAccessibilityPostNotification(v2, v5);

}

- (void)accessibilityDidSetUpEntityControllers
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASVPreviewViewControllerInternalAccessibility;
  -[ASVPreviewViewControllerInternalAccessibility accessibilityDidSetUpEntityControllers](&v3, sel_accessibilityDidSetUpEntityControllers);
  -[ASVPreviewViewControllerInternalAccessibility _axSetARModeControls:](self, "_axSetARModeControls:", 0);
  -[ASVPreviewViewControllerInternalAccessibility _axSetObjectModeControls:](self, "_axSetObjectModeControls:", 0);
  -[ASVPreviewViewControllerInternalAccessibility _axUpdateARViewAccessibilityElements](self, "_axUpdateARViewAccessibilityElements");
  UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);
}

- (void)_axEntityElementsForEntityController:(os_log_t)log .cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_232422000, log, OS_LOG_TYPE_FAULT, "Unexpectedly found root entity controller in list of entity controllers.", v1, 2u);
}

@end

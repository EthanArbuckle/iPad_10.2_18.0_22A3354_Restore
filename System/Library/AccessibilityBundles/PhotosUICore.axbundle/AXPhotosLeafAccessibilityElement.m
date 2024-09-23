@implementation AXPhotosLeafAccessibilityElement

- (Class)_axCuratedLibraryUIViewControllerClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axContentKind"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axAsset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axSubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axIsSelected"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("mainFileURL"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("px_isUnsavedSyndicatedAsset"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAsset"), CFSTR("px_wasSavedThroughSyndication"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axInfoSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"), CFSTR("_axStyleTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("viewProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewDelegate"), CFSTR("curatedLibraryViewControllerExpand:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewProvider"), CFSTR("viewModel"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewModel"), CFSTR("isFullyExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryRelatedOverlayLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXGPageControl"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryUIViewController"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("UIViewController"));

}

- (AXPhotosLeafAccessibilityElement)initWithAccessibilityContainer:(id)a3 forLeaf:(id)a4
{
  id v5;
  AXPhotosLeafAccessibilityElement *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
  v5 = a4;
  v6 = -[AXPhotosLeafAccessibilityElement initWithAccessibilityContainer:](&v8, sel_initWithAccessibilityContainer_, a3);
  -[AXPhotosLeafAccessibilityElement setLeaf:](v6, "setLeaf:", v5, v8.receiver, v8.super_class);

  return v6;
}

- (CGRect)accessibilityFrame
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

  -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityFrame");
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

- (BOOL)isAccessibilityElement
{
  void *v3;
  char v4;

  if (-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") != 5)
    return 1;
  -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_accessibilityViewIsVisible");

  return v4;
}

- (int64_t)_accessibilityContentKind
{
  void *v2;
  int64_t v3;

  -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("axContentKind"));

  return v3;
}

- (id)accessibilityURL
{
  void *v3;
  void *v4;
  void *v5;

  if (-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") != 6)
    goto LABEL_8;
  -[AXPhotosLeafAccessibilityElement _axLeafAsset](self, "_axLeafAsset");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v3, "safeValueForKey:", CFSTR("mainFileURL"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_6;
    }

LABEL_8:
    v4 = 0;
    return v4;
  }
  objc_msgSend(v3, "accessibilityURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_6:

  return v4;
}

- (id)_accessibilityPHAssetLocalIdentifier
{
  void *v2;
  void *v3;

  -[AXPhotosLeafAccessibilityElement _axLeafAsset](self, "_axLeafAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPHAssetLocalIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_accessibilityPhotoLibraryURL
{
  void *v2;
  void *v3;

  -[AXPhotosLeafAccessibilityElement _axLeafAsset](self, "_axLeafAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityPhotoLibraryURL");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityIsPHAssetLocallyAvailable
{
  void *v2;
  char v3;

  -[AXPhotosLeafAccessibilityElement _axLeafAsset](self, "_axLeafAsset");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityIsPHAssetLocallyAvailable");

  return v3;
}

- (id)accessibilityCustomContent
{
  void *v3;
  void *v4;

  if (-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") == 6)
  {
    -[AXPhotosLeafAccessibilityElement _axLeafAsset](self, "_axLeafAsset");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityCustomContent");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  const __CFString *v5;
  uint64_t v6;
  id result;
  void *v8;
  void *v9;
  objc_super v10;

  switch(-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind"))
  {
    case 1:
      -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("axTitle");
      goto LABEL_4;
    case 2:
    case 3:
      -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = v3;
      v5 = CFSTR("axText");
LABEL_4:
      objc_msgSend(v3, "safeValueForKey:", v5);
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 5:
      -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 6:
      -[AXPhotosLeafAccessibilityElement _axLeafAsset](self, "_axLeafAsset");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v4 = v8;
      objc_msgSend(v8, "accessibilityLabel");
      v6 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v9 = (void *)v6;

      result = v9;
      break;
    default:
      v10.receiver = self;
      v10.super_class = (Class)AXPhotosLeafAccessibilityElement;
      -[AXPhotosLeafAccessibilityElement accessibilityLabel](&v10, sel_accessibilityLabel);
      result = (id)objc_claimAutoreleasedReturnValue();
      break;
  }
  return result;
}

- (id)accessibilityValue
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __CFString *v11;
  uint64_t v13;
  void *v14;
  void *v15;
  objc_super v16;
  objc_super v17;

  v3 = -[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind");
  if (v3 == 6)
  {
    -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "safeValueForKey:", CFSTR("axAsset"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17.receiver = self;
      v17.super_class = (Class)AXPhotosLeafAccessibilityElement;
      -[AXPhotosLeafAccessibilityElement accessibilityValue](&v17, sel_accessibilityValue);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "safeBoolForKey:", CFSTR("px_isUnsavedSyndicatedAsset")) & 1) != 0)
      {
        v11 = CFSTR("not.yet.saved");
      }
      else
      {
        if (!objc_msgSend(v4, "safeBoolForKey:", CFSTR("px_wasSavedThroughSyndication")))
          goto LABEL_19;
        v11 = CFSTR("saved");
      }
      accessibilityPhotosUICoreLocalizedString(v11);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v13 = objc_claimAutoreleasedReturnValue();

      v5 = (void *)v13;
      goto LABEL_19;
    }

LABEL_15:
    v16.receiver = self;
    v16.super_class = (Class)AXPhotosLeafAccessibilityElement;
    -[AXPhotosLeafAccessibilityElement accessibilityValue](&v16, sel_accessibilityValue);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  if (v3 == 5)
  {
    -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2348C1678](CFSTR("PXGPageControl"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[AXPhotosLeafAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "group");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "safeValueForKey:", CFSTR("axInfoSource"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        MEMORY[0x2348C1678](CFSTR("PXStoryStyleSwitchingFullsizeLayout"));
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v8, "safeStringForKey:", CFSTR("_axStyleTitle"));
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAXStringForVariables();
          v9 = objc_claimAutoreleasedReturnValue();

          v5 = (void *)v9;
        }

      }
    }
    goto LABEL_19;
  }
  if (v3 != 1)
    goto LABEL_15;
  -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("axSubtitle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_19:

  return v5;
}

- (BOOL)_accessibilitySkipImageTraitDescription
{
  return 1;
}

- (BOOL)accessibilityRespondsToUserInteraction
{
  return -[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") == 6;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _QWORD *v4;
  void *v5;
  void *v6;
  void *v7;
  char isKindOfClass;
  uint64_t v9;
  void *v10;
  int v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXPhotosLeafAccessibilityElement;
  v3 = -[AXPhotosLeafAccessibilityElement accessibilityTraits](&v13, sel_accessibilityTraits);
  switch(-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind"))
  {
    case 1:
      v4 = (_QWORD *)MEMORY[0x24BDF73C0];
      goto LABEL_11;
    case 2:
      -[AXPhotosLeafAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v5, "group");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "safeValueForKey:", CFSTR("axInfoSource"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        MEMORY[0x2348C1678](CFSTR("PXStoryRelatedOverlayLayout"));
        isKindOfClass = objc_opt_isKindOfClass();
        v9 = *MEMORY[0x24BDF73C0];
        if ((isKindOfClass & 1) == 0)
          v9 = 0;
        v3 |= v9;

      }
      goto LABEL_9;
    case 3:
      v4 = (_QWORD *)MEMORY[0x24BDF73B0];
      goto LABEL_11;
    case 5:
      -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v3 |= objc_msgSend(v5, "accessibilityTraits");
LABEL_9:

      break;
    case 6:
      v4 = (_QWORD *)MEMORY[0x24BDF73C8];
LABEL_11:
      v3 |= *v4;
      break;
    default:
      break;
  }
  -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("axIsSelected"));

  if (v11)
    return *MEMORY[0x24BDF7400] | v3;
  else
    return v3 & ~*MEMORY[0x24BDF7400];
}

- (unint64_t)_accessibilityAutomationType
{
  objc_super v4;

  if (-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") == 6)
    return 43;
  v4.receiver = self;
  v4.super_class = (Class)AXPhotosLeafAccessibilityElement;
  return -[AXPhotosLeafAccessibilityElement _accessibilityAutomationType](&v4, sel__accessibilityAutomationType);
}

- (id)_axLeafContentView
{
  uint64_t v3;
  void *v4;
  void *v5;

  if (-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") != 5
    || (-[AXPhotosLeafAccessibilityElement leaf](self, "leaf"), (v3 = objc_claimAutoreleasedReturnValue()) == 0)
    || (v4 = (void *)v3,
        -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView"),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v4,
        !v5))
  {
    v5 = 0;
  }
  return v5;
}

- (id)accessibilityIdentifier
{
  void *v3;
  void *v4;
  objc_class *v5;
  void *v6;
  void *v7;
  objc_super v9;

  -[AXPhotosLeafAccessibilityElement _axLeafContentView](self, "_axLeafContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = (void *)MEMORY[0x24BDD17C8];
    v5 = (objc_class *)objc_opt_class();
    NSStringFromClass(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("%@_AX"), v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)AXPhotosLeafAccessibilityElement;
    -[AXPhotosLeafAccessibilityElement accessibilityIdentifier](&v9, sel_accessibilityIdentifier);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v7;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AXPhotosLeafAccessibilityElement _axLeafContentView](self, "_axLeafContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "_accessibilitySupplementaryFooterViews");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
    -[AXPhotosLeafAccessibilityElement _accessibilitySupplementaryFooterViews](&v8, sel__accessibilitySupplementaryFooterViews);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AXPhotosLeafAccessibilityElement _axLeafContentView](self, "_axLeafContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "accessibilityCustomRotors");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
    -[AXPhotosLeafAccessibilityElement accessibilityCustomRotors](&v8, sel_accessibilityCustomRotors);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  -[AXPhotosLeafAccessibilityElement _axLeafContentView](self, "_axLeafContentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "automationElements");
    v5 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosLeafAccessibilityElement;
    -[AXPhotosLeafAccessibilityElement automationElements](&v8, sel_automationElements);
    v5 = objc_claimAutoreleasedReturnValue();
  }
  v6 = (void *)v5;

  return v6;
}

- (int64_t)_accessibilityScannerActivateBehavior
{
  return 1;
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  return 0;
}

- (void)accessibilityIncrement
{
  id v2;

  -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityIncrement");

}

- (void)accessibilityDecrement
{
  id v2;

  -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessibilityDecrement");

}

- (int64_t)_accessibilityPageCount
{
  void *v2;
  int64_t v3;

  -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityPageCount");

  return v3;
}

- (int64_t)_accessibilityPageIndex
{
  void *v2;
  int64_t v3;

  -[AXPhotosLeafAccessibilityElement _axLeafView](self, "_axLeafView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_accessibilityPageIndex");

  return v3;
}

- (id)_axLeafView
{
  void *v2;
  void *v3;

  -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeUIViewForKey:", CFSTR("axView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)_axLeafAsset
{
  void *v3;
  void *v4;

  if (-[AXPhotosLeafAccessibilityElement _accessibilityContentKind](self, "_accessibilityContentKind") == 6)
  {
    -[AXPhotosLeafAccessibilityElement leaf](self, "leaf");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("axAsset"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (void)_axExpandLibrary
{
  void *v2;
  id v3;
  id v4;
  _QWORD v5[3];
  char v6;

  -[AXPhotosLeafAccessibilityElement _accessibilityCuratedLibraryUIViewController](self, "_accessibilityCuratedLibraryUIViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("delegate"));
  v5[0] = 0;
  v5[1] = v5;
  v5[2] = 0x2020000000;
  v6 = 0;
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = v2;
  AXPerformSafeBlock();

  _Block_object_dispose(v5, 8);
}

uint64_t __52__AXPhotosLeafAccessibilityElement__axExpandLibrary__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "curatedLibraryViewControllerExpand:", *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  -[AXPhotosLeafAccessibilityElement _accessibilityCuratedLibraryUIViewController](self, "_accessibilityCuratedLibraryUIViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("viewProvider"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("viewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v5, "safeBoolForKey:", CFSTR("isFullyExpanded")) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    v7 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityPULocalizedString(CFSTR("expand.library"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(v7, "initWithName:target:selector:", v8, self, sel__axExpandLibrary);

    v11[0] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v6;
}

- (id)_accessibilityCuratedLibraryUIViewController
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!-[AXPhotosLeafAccessibilityElement _axCuratedLibraryUIViewControllerClass](self, "_axCuratedLibraryUIViewControllerClass"))-[AXPhotosLeafAccessibilityElement _setAxCuratedLibraryUIViewControllerClass:](self, "_setAxCuratedLibraryUIViewControllerClass:", MEMORY[0x2348C1678](CFSTR("PXCuratedLibraryUIViewController")));
  if (!-[AXPhotosLeafAccessibilityElement _axCuratedLibraryUIViewControllerClass](self, "_axCuratedLibraryUIViewControllerClass"))return 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __80__AXPhotosLeafAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke;
  v6[3] = &unk_24FF068F8;
  v6[4] = self;
  -[AXPhotosLeafAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __80__AXPhotosLeafAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axCuratedLibraryUIViewControllerClass");
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (id)leaf
{
  return objc_loadWeakRetained(&self->_leaf);
}

- (void)setLeaf:(id)a3
{
  objc_storeWeak(&self->_leaf, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak(&self->_leaf);
}

@end

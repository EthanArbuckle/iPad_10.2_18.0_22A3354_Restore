@implementation AXPhotosGroupAccessibilityElement

- (id)_axCachedSubgroupElements
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCachedSubgroupElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axCachedLeafElements
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCachedLeafElements:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (id)_axCachedLeafSpriteIndexes
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCachedLeafSpriteIndexes:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axAssetsSectionLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxAssetsSectionLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axCuratedLibraryChapterHeaderLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryChapterHeaderLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axCuratedLibrarySectionHeaderLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibrarySectionHeaderLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axDecoratingLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxDecoratingLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axCuratedLibraryCardSectionBodyLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryCardSectionBodyLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axInlineHeadersSpriteLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxInlineHeadersSpriteLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axGridLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxGridLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryColorGradeEditorItemLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryColorGradeEditorItemLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryColorGradeEditorItemOverlayLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryColorGradeEditorItemOverlayLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryThumbnailChromeLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryThumbnailChromeLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryFullsizeLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryFullsizeLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryClipLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryClipLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryTransitionLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryTransitionLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axFeedContentLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxFeedContentLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryScrubberContentLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryScrubberContentLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryStyleSwitchingFullsizeLayoutClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryStyleSwitchingFullsizeLayoutClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axCuratedLibraryUIViewControllerClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryUIViewControllerClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axFeedViewControllerClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxFeedViewControllerClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryViewControllerClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryViewControllerClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axCuratedLibraryOverlayButtonClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxCuratedLibraryOverlayButtonClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

- (Class)_axStoryChromeButtonClass
{
  JUMPOUT(0x2348C1804);
}

- (void)_setAxStoryChromeButtonClass:(Class)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("PXGBasicAXGroup"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryChapterHeaderLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibrarySectionHeaderLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXGDecoratingLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryCardSectionBodyLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXInlineHeadersSpriteLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXAssetsSectionLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXGReusableAXInfo"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXGView"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXGEngine"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXCuratedLibraryUIViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PhotosUIApps.PUStoryColorGradeEditorItemLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PUStoryColorGradeEditorItemOverlayLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXFeedViewController"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryThumbnailChromeLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryFullsizeLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryClipLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryTransitionLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXFeedContentLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryChromeButton"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXGBasicAXGroup"), CFSTR("_axInfoSource"), "id<PXGAXInfoSource>");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axRole"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axSubgroups"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axLeafs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("subgroupIndex"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("loadedSubgroupIndexes"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axNextResponder"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("_axInfoSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axIsVisible"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXAssetsSectionLayout"), CFSTR("zoomLevel"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHObject"), CFSTR("localIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PHAsset"), CFSTR("PHObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axText"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axAsset"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axSubtitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axImageName"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("spriteIndex"), "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGAXInfo"), CFSTR("axContentKind"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGReusableAXInfo"), CFSTR("axContainingGroup"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGView"), CFSTR("engine"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGEngine"), CFSTR("ensureUpdatedLayout"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryUIViewController"), CFSTR("viewProvider"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewProvider"), CFSTR("viewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXCuratedLibraryViewModel"), CFSTR("zoomablePhotosViewModel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXZoomablePhotosViewModel"), CFSTR("isDisplayingIndividualItems"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXInfoSource"), CFSTR("axVisibleSpriteIndexes"), 1, 1);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXInfoSource"), CFSTR("axSpriteIndexClosestToSpriteIndex:inDirection:"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("loadLeafAtSpriteIndexIfNeeded:usingOptions:"), "@", "I", "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("loadedLeafAtSpriteIndex:"), "@", "I", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("unloadLeafAtSpriteIndex:usingOptions:"), "@", "I", "Q", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXResponder"), CFSTR("axGroup:didRequestToPerformAction:userInfo:"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFeedViewController"), CFSTR("configuration"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXFeedConfiguration"), CFSTR("gadgetSpec"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGadgetSpec"), CFSTR("interItemSpacing"), "d", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryChromeButton"), CFSTR("userData"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryChromeButtonConfiguration"), CFSTR("menu"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("PXCuratedLibraryOverlayButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIButton"), CFSTR("menu"), "@", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryScrubberContentLayout"));
  objc_msgSend(v3, "validateClass:", CFSTR("PUStoryViewController"));
  objc_msgSend(v3, "validateClass:hasInstanceVariable:withType:", CFSTR("PXGReusableAXInfo"), CFSTR("_content"), "@");
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryScrubberContentLayout"), CFSTR("_axScrubberFractionNumerator"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryScrubberContentLayout"), CFSTR("_axScrubberFractionDenominator"), "Q", 0);
  objc_msgSend(v3, "validateClass:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"), CFSTR("_axSwitcherFractionNumerator"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"), CFSTR("_axSwitcherFractionDenominator"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"), CFSTR("_axStyleTitle"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PXGBasicAXGroup"), CFSTR("axScrollParent"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasMethod:isInstanceMethod:isRequired:", CFSTR("PXGAXResponder"), CFSTR("axContainingScrollViewForAXGroup:"), 1, 1);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityHasVisibleFrame"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAssetCollection"), CFSTR("kind"), "S", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAssetCollection"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("PHAssetCollection"), CFSTR("subtitle"), "@", 0);

}

- (AXPhotosGroupAccessibilityElement)initWithAccessibilityContainer:(id)a3 forGroup:(id)a4 inView:(id)a5 withAdditionalScrollViewElements:(id)a6
{
  id v9;
  id v10;
  id v11;
  AXPhotosGroupAccessibilityElement *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)AXPhotosGroupAccessibilityElement;
  v9 = a6;
  v10 = a5;
  v11 = a4;
  v12 = -[AXPhotosGroupAccessibilityElement initWithAccessibilityContainer:](&v15, sel_initWithAccessibilityContainer_, a3);
  -[AXPhotosGroupAccessibilityElement setGroup:](v12, "setGroup:", v11, v15.receiver, v15.super_class);

  -[AXPhotosGroupAccessibilityElement setView:](v12, "setView:", v10);
  -[AXPhotosGroupAccessibilityElement setAdditionalScrollViewElements:](v12, "setAdditionalScrollViewElements:", v9);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addObserver:selector:name:object:", v12, sel__axRefreshGridGroupData_, CFSTR("AXPhotosGridGroupDataChanged"), 0);

  return v12;
}

- (AXPhotosGroupAccessibilityElement)initWithAccessibilityContainer:(id)a3 forGroup:(id)a4 inView:(id)a5
{
  return -[AXPhotosGroupAccessibilityElement initWithAccessibilityContainer:forGroup:inView:withAdditionalScrollViewElements:](self, "initWithAccessibilityContainer:forGroup:inView:withAdditionalScrollViewElements:", a3, a4, a5, 0);
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  uint64_t v4;
  objc_super v6;

  -[AXPhotosGroupAccessibilityElement group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("axRole"));

  if ((unint64_t)(v4 - 3) < 2)
    return 0;
  if (v4 == 1)
  {
    if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView")
      || -[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView")
      || -[AXPhotosGroupAccessibilityElement _axIsStoryColorGradeEditorItem](self, "_axIsStoryColorGradeEditorItem"))
    {
      return 1;
    }
    return -[AXPhotosGroupAccessibilityElement _axIsStoryLayout](self, "_axIsStoryLayout");
  }
  else
  {
    if (!v4)
    {
      if (!-[AXPhotosGroupAccessibilityElement _axIsMemoriesScrubberInStoryViewController](self, "_axIsMemoriesScrubberInStoryViewController"))return -[AXPhotosGroupAccessibilityElement _axIsMemoriesStyleSwitcherInStoryViewController](self, "_axIsMemoriesStyleSwitcherInStoryViewController");
      return 1;
    }
    v6.receiver = self;
    v6.super_class = (Class)AXPhotosGroupAccessibilityElement;
    return -[AXPhotosGroupAccessibilityElement isAccessibilityElement](&v6, sel_isAccessibilityElement);
  }
}

- (id)accessibilityLabel
{
  id v2;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  uint64_t v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  id v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;
  id v32;
  id v33;
  void *v34;
  void *v36;
  const __CFString *v37;
  objc_super v38;
  _QWORD v39[5];
  _QWORD v40[5];
  _QWORD v41[5];
  uint64_t v42;
  id *v43;
  uint64_t v44;
  uint64_t (*v45)(uint64_t, uint64_t);
  void (*v46)(uint64_t);
  id v47;

  v42 = 0;
  v43 = (id *)&v42;
  v44 = 0x3032000000;
  v45 = __Block_byref_object_copy_;
  v46 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v47 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AXPhotosGroupAccessibilityElement _axIsStoryColorGradeEditorItem](self, "_axIsStoryColorGradeEditorItem"))
  {
    -[AXPhotosGroupAccessibilityElement _axStoryColorGradeLeafElement](self, "_axStoryColorGradeLeafElement");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      objc_msgSend(v4, "accessibilityLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_storeStrong(v43 + 5, v6);
    if (v5)

  }
  if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView")
    || -[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "safeValueForKey:", CFSTR("_axInfoSource"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("assetCollection"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v9, "safeIntForKey:", CFSTR("kind")) == 1)
    {
      -[AXPhotosGroupAccessibilityElement _axSectionHeadersInSubgroups](self, "_axSectionHeadersInSubgroups");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = objc_msgSend(v10, "count");
      if (v11)
      {
        objc_msgSend(v10, "firstObject");
        v2 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "accessibilityLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v12 = 0;
      }
      objc_storeStrong(v43 + 5, v12);
      if (v11)
      {

      }
      -[AXPhotosGroupAccessibilityElement _axChapterHeadersInSubgroups](self, "_axChapterHeadersInSubgroups");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "count");
      if (v15)
      {
        objc_msgSend(v13, "firstObject");
        v2 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v2, "accessibilityLabel");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v16 = 0;
      }
      v36 = v16;
      v37 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = v43[5];
      v43[5] = (id)v17;

      if (!v15)
        goto LABEL_23;

    }
    else
    {
      objc_msgSend(v9, "safeStringForKey:", CFSTR("title"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "safeStringForKey:", CFSTR("subtitle"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v13;
      v37 = CFSTR("__AXStringForVariablesSentinel");
      __UIAXStringForVariables();
      v14 = objc_claimAutoreleasedReturnValue();
      v2 = v43[5];
      v43[5] = (id)v14;
    }

LABEL_23:
  }
  if (-[AXPhotosGroupAccessibilityElement _axIsStoryLayout](self, "_axIsStoryLayout", v36, v37))
  {
    -[AXPhotosGroupAccessibilityElement _axStoryFullsizeLayoutInSubgroups](self, "_axStoryFullsizeLayoutInSubgroups");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "count"))
    {
      objc_msgSend(v19, "firstObject");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_axStoryClipLayoutInSubgroups");
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      MEMORY[0x2348C1744](v21);
      v22 = objc_claimAutoreleasedReturnValue();
      v23 = v43[5];
      v43[5] = (id)v22;

    }
  }
  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesScrubberInStoryViewController](self, "_axIsMemoriesScrubberInStoryViewController"))
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("memories.scrubber"));
    v24 = objc_claimAutoreleasedReturnValue();
    v25 = v43[5];
    v43[5] = (id)v24;

  }
  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesStyleSwitcherInStoryViewController](self, "_axIsMemoriesStyleSwitcherInStoryViewController"))
  {
    v26 = v43[5];
    v43[5] = 0;

  }
  v27 = v43[5];
  if (v27 && !objc_msgSend(v27, "length"))
  {
    -[AXPhotosGroupAccessibilityElement _axFilterLeafsByContentKind:](self, "_axFilterLeafsByContentKind:", 2);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x24BDAC760];
    v41[0] = MEMORY[0x24BDAC760];
    v41[1] = 3221225472;
    v41[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke;
    v41[3] = &unk_24FF06568;
    v41[4] = &v42;
    objc_msgSend(v28, "enumerateObjectsUsingBlock:", v41);
    -[AXPhotosGroupAccessibilityElement _axFilterLeafsByContentKind:](self, "_axFilterLeafsByContentKind:", 1);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v40[0] = v29;
    v40[1] = 3221225472;
    v40[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_2;
    v40[3] = &unk_24FF06568;
    v40[4] = &v42;
    objc_msgSend(v30, "enumerateObjectsUsingBlock:", v40);
    -[AXPhotosGroupAccessibilityElement _axFilterLeafsByContentKind:](self, "_axFilterLeafsByContentKind:", 6);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v39[0] = v29;
    v39[1] = 3221225472;
    v39[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_3;
    v39[3] = &unk_24FF06568;
    v39[4] = &v42;
    objc_msgSend(v31, "enumerateObjectsUsingBlock:", v39);

  }
  v32 = v43[5];
  if (v32 && objc_msgSend(v32, "length"))
  {
    v33 = v43[5];
  }
  else
  {
    v38.receiver = self;
    v38.super_class = (Class)AXPhotosGroupAccessibilityElement;
    -[AXPhotosGroupAccessibilityElement accessibilityLabel](&v38, sel_accessibilityLabel);
    v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  v34 = v33;
  _Block_object_dispose(&v42, 8);

  return v34;
}

void __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void __55__AXPhotosGroupAccessibilityElement_accessibilityLabel__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "accessibilityLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)accessibilityValue
{
  void *v2;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  id v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  id v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  id v32;
  void *v33;
  id v34;
  id v35;
  void *v36;
  void *v38;
  void *v39;
  const __CFString *v40;
  const __CFString *v41;
  objc_super v42;
  _QWORD v43[5];
  uint64_t v44;
  id *v45;
  uint64_t v46;
  uint64_t (*v47)(uint64_t, uint64_t);
  void (*v48)(uint64_t);
  id v49;

  v44 = 0;
  v45 = (id *)&v44;
  v46 = 0x3032000000;
  v47 = __Block_byref_object_copy_;
  v48 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView")
    || -[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    if (-[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
      -[AXPhotosGroupAccessibilityElement _axShouldShowAlternateUI:](self, "_axShouldShowAlternateUI:", 1);
    -[AXPhotosGroupAccessibilityElement _axSectionHeadersInSubgroups](self, "_axSectionHeadersInSubgroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");
    if (v5)
    {
      objc_msgSend(v4, "firstObject");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "accessibilityValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = 0;
    }
    objc_storeStrong(v45 + 5, v6);
    if (v5)
    {

    }
    -[AXPhotosGroupAccessibilityElement _axChapterHeadersInSubgroups](self, "_axChapterHeadersInSubgroups");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "count");
    if (v8)
    {
      objc_msgSend(v7, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "accessibilityValue");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v9 = 0;
    }
    __UIAXStringForVariables();
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = v45[5];
    v45[5] = (id)v10;

    if (v8)
    {

    }
    if (-[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView", v9, CFSTR("__AXStringForVariablesSentinel")))
    {
      -[AXPhotosGroupAccessibilityElement _axShouldShowAlternateUI:](self, "_axShouldShowAlternateUI:", 0);
    }

  }
  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesScrubberInStoryViewController](self, "_axIsMemoriesScrubberInStoryViewController"))
  {
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "safeValueForKey:", CFSTR("_axInfoSource"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v14 = objc_msgSend(v13, "safeUnsignedIntegerForKey:", CFSTR("_axScrubberFractionNumerator"));
    v15 = objc_msgSend(v13, "safeUnsignedIntegerForKey:", CFSTR("_axScrubberFractionDenominator"));
    -[AXPhotosGroupAccessibilityElement _axCurrentLeafInStory](self, "_axCurrentLeafInStory");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "safeValueForKey:", CFSTR("_content"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPhotosUICoreLocalizedString(CFSTR("memories.scrubber.choice"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "localizedStringWithFormat:", v19, v14, v15);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "accessibilityLabel");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = v45[5];
    v45[5] = (id)v21;

  }
  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesStyleSwitcherInStoryViewController](self, "_axIsMemoriesStyleSwitcherInStoryViewController", v38, v40))
  {
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "safeValueForKey:", CFSTR("_axInfoSource"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    v25 = objc_msgSend(v24, "safeUnsignedIntegerForKey:", CFSTR("_axSwitcherFractionNumerator"));
    v26 = objc_msgSend(v24, "safeUnsignedIntegerForKey:", CFSTR("_axSwitcherFractionDenominator"));
    objc_msgSend(v24, "safeStringForKey:", CFSTR("_axStyleTitle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = (void *)MEMORY[0x24BDD17C8];
    accessibilityPhotosUICoreLocalizedString(CFSTR("memories.style.choice"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "localizedStringWithFormat:", v29, v25, v26);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v39 = v27;
    v41 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v45[5];
    v45[5] = (id)v31;

  }
  if (!objc_msgSend(v45[5], "length", v39, v41))
  {
    -[AXPhotosGroupAccessibilityElement _axFilterLeafsByContentKind:](self, "_axFilterLeafsByContentKind:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v43[0] = MEMORY[0x24BDAC760];
    v43[1] = 3221225472;
    v43[2] = __55__AXPhotosGroupAccessibilityElement_accessibilityValue__block_invoke;
    v43[3] = &unk_24FF06568;
    v43[4] = &v44;
    objc_msgSend(v33, "enumerateObjectsUsingBlock:", v43);

  }
  v34 = v45[5];
  if (v34 && objc_msgSend(v34, "length"))
  {
    v35 = v45[5];
  }
  else
  {
    v42.receiver = self;
    v42.super_class = (Class)AXPhotosGroupAccessibilityElement;
    -[AXPhotosGroupAccessibilityElement accessibilityValue](&v42, sel_accessibilityValue);
    v35 = (id)objc_claimAutoreleasedReturnValue();
  }
  v36 = v35;
  _Block_object_dispose(&v44, 8);

  return v36;
}

void __55__AXPhotosGroupAccessibilityElement_accessibilityValue__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;

  objc_msgSend(a2, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_accessibilityScrollStatus
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v11;
  objc_super v12;

  objc_msgSend(MEMORY[0x24BDD17C8], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView")
    || -[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    -[AXPhotosGroupAccessibilityElement _axCardSectionBodyInSubgroups](self, "_axCardSectionBodyInSubgroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_axFilterLeafsByContentKind:", 6);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "accessibilityLabel");
        v8 = objc_claimAutoreleasedReturnValue();

        v3 = v7;
      }
      else
      {
        v8 = 0;
      }

      v3 = (void *)v8;
    }

  }
  v12.receiver = self;
  v12.super_class = (Class)AXPhotosGroupAccessibilityElement;
  -[AXPhotosGroupAccessibilityElement _accessibilityScrollStatus](&v12, sel__accessibilityScrollStatus);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (CGRect)accessibilityFrame
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
  CGRect result;

  -[AXPhotosGroupAccessibilityElement group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessibilityFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  if (-[AXPhotosGroupAccessibilityElement _axIsStoryLayout](self, "_axIsStoryLayout")
    && -[AXPhotosGroupAccessibilityElement _accessibilityInStoryViewController](self, "_accessibilityInStoryViewController"))
  {
    v5 = v5 + 0.0;
    v7 = v7 + 100.0;
    v11 = v11 + -280.0;
  }
  v12 = v5;
  v13 = v7;
  v14 = v9;
  v15 = v11;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (BOOL)_accessibilityHasVisibleFrame
{
  void *v3;
  objc_super v5;

  -[AXPhotosGroupAccessibilityElement _accessibilityFeedViewController](self, "_accessibilityFeedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[AXPhotosGroupAccessibilityElement _axIsStoryTransitionLayout](self, "_axIsStoryTransitionLayout")
     || -[AXPhotosGroupAccessibilityElement _axIsFeedContentLayout](self, "_axIsFeedContentLayout")))
  {
    return 1;
  }
  v5.receiver = self;
  v5.super_class = (Class)AXPhotosGroupAccessibilityElement;
  return -[AXPhotosGroupAccessibilityElement _accessibilityHasVisibleFrame](&v5, sel__accessibilityHasVisibleFrame);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  _QWORD *v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)AXPhotosGroupAccessibilityElement;
  v3 = -[AXPhotosGroupAccessibilityElement accessibilityTraits](&v13, sel_accessibilityTraits);
  if (-[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    v3 |= *MEMORY[0x24BDF73C8] | *MEMORY[0x24BDF73B0] | *MEMORY[0x24BDF73A0];
    return v3;
  }
  if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView"))
  {
    -[AXPhotosGroupAccessibilityElement _axChapterHeadersInSubgroups](self, "_axChapterHeadersInSubgroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "count");

    if (v5)
    {
      v6 = (_QWORD *)MEMORY[0x24BDF73C0];
LABEL_14:
      v3 |= *v6;
      goto LABEL_15;
    }
    -[AXPhotosGroupAccessibilityElement _axSectionHeadersInSubgroups](self, "_axSectionHeadersInSubgroups");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "count");

    if (v11)
    {
      v6 = (_QWORD *)MEMORY[0x24BDF73C8];
      goto LABEL_14;
    }
LABEL_15:
    v9 = (_QWORD *)MEMORY[0x24BDF73B0];
    goto LABEL_16;
  }
  if (-[AXPhotosGroupAccessibilityElement _axIsStoryColorGradeEditorItem](self, "_axIsStoryColorGradeEditorItem"))
  {
    -[AXPhotosGroupAccessibilityElement _axStoryColorGradeLeafElement](self, "_axStoryColorGradeLeafElement");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v7)
      v3 |= objc_msgSend(v7, "accessibilityTraits");

  }
  else
  {
    if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesScrubberInStoryViewController](self, "_axIsMemoriesScrubberInStoryViewController"))
    {
      v9 = (_QWORD *)MEMORY[0x24BDF73A0];
LABEL_16:
      v3 |= *v9;
      return v3;
    }
    if (-[AXPhotosGroupAccessibilityElement _axIsStoryLayout](self, "_axIsStoryLayout"))
    {
      v3 |= *MEMORY[0x24BDF73C8];
      if (-[AXPhotosGroupAccessibilityElement _axIsFeedContentLayout](self, "_axIsFeedContentLayout"))
        goto LABEL_15;
    }
  }
  return v3;
}

- (BOOL)_accessibilityHitTestShouldFallbackToNearestChild
{
  return 1;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPhotosGroupAccessibilityElement _axMoreButtonInMonthsView](self, "_axMoreButtonInMonthsView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5 && objc_msgSend(v5, "length"))
      objc_msgSend(v3, "axSafelyAddObject:", v4);

  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)AXPhotosGroupAccessibilityElement;
    -[AXPhotosGroupAccessibilityElement automationElements](&v8, sel_automationElements);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id *v25;
  void *v26;
  void *v27;
  void *v29;
  id v30;
  objc_super v31;
  _QWORD v32[4];
  id v33;
  _QWORD v34[4];
  _QWORD v35[2];
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _QWORD v40[4];
  id v41;
  id v42;
  _BYTE v43[128];
  uint64_t v44;

  v44 = *MEMORY[0x24BDAC8D0];
  if (!-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView"))
  {
    if (!-[AXPhotosGroupAccessibilityElement _axIsStoryLayout](self, "_axIsStoryLayout"))
    {
      v31.receiver = self;
      v31.super_class = (Class)AXPhotosGroupAccessibilityElement;
      -[AXPhotosGroupAccessibilityElement accessibilityCustomActions](&v31, sel_accessibilityCustomActions);
      v30 = (id)objc_claimAutoreleasedReturnValue();
      return v30;
    }
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    -[AXPhotosGroupAccessibilityElement _axStoryThumbnailChromeLayoutInSubgroups](self, "_axStoryThumbnailChromeLayoutInSubgroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v4, "count"))
      goto LABEL_29;
    v29 = v4;
    objc_msgSend(v4, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "_axLeafAccessibilityElements");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v13 = v12;
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
    if (!v14)
      goto LABEL_28;
    v15 = v14;
    v16 = *(_QWORD *)v37;
LABEL_14:
    v17 = 0;
    while (1)
    {
      if (*(_QWORD *)v37 != v16)
        objc_enumerationMutation(v13);
      v18 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * v17);
      objc_msgSend(v18, "leaf");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "safeValueForKey:", CFSTR("axView"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();

      if (-[AXPhotosGroupAccessibilityElement _axStoryChromeButtonClass](self, "_axStoryChromeButtonClass"))
      {
        if (v20)
          goto LABEL_21;
      }
      else
      {
        -[AXPhotosGroupAccessibilityElement _setAxStoryChromeButtonClass:](self, "_setAxStoryChromeButtonClass:", MEMORY[0x2348C1678](CFSTR("PXStoryChromeButton")));
        if (v20)
        {
LABEL_21:
          -[AXPhotosGroupAccessibilityElement _axStoryChromeButtonClass](self, "_axStoryChromeButtonClass");
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            objc_msgSend(v20, "safeValueForKeyPath:", CFSTR("userData.menu"));
            v21 = (void *)objc_claimAutoreleasedReturnValue();

            v22 = objc_alloc(MEMORY[0x24BDF6788]);
            if (v21)
            {
              objc_msgSend(v20, "accessibilityLabel");
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              v34[0] = MEMORY[0x24BDAC760];
              v34[1] = 3221225472;
              v34[2] = __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_2;
              v34[3] = &unk_24FF06590;
              v35[0] = v20;
              v35[1] = v18;
              v24 = (void *)objc_msgSend(v22, "initWithName:actionHandler:", v23, v34);

              objc_msgSend(v30, "addObject:", v24);
              v25 = (id *)v35;
            }
            else
            {
              objc_msgSend(v18, "accessibilityLabel");
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v32[0] = MEMORY[0x24BDAC760];
              v32[1] = 3221225472;
              v32[2] = __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_3;
              v32[3] = &unk_24FF065B8;
              v33 = v20;
              v27 = (void *)objc_msgSend(v22, "initWithName:actionHandler:", v26, v32);

              objc_msgSend(v30, "addObject:", v27);
              v25 = &v33;
            }

          }
        }
      }

      if (v15 == ++v17)
      {
        v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v36, v43, 16);
        if (!v15)
        {
LABEL_28:

          v4 = v29;
          goto LABEL_29;
        }
        goto LABEL_14;
      }
    }
  }
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v30 = (id)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axMoreButtonInMonthsView](self, "_axMoreButtonInMonthsView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "leaf");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeUIViewForKey:", CFSTR("axView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v6, "_accessibilityViewIsVisible"))
    {
      if (!-[AXPhotosGroupAccessibilityElement _axCuratedLibraryOverlayButtonClass](self, "_axCuratedLibraryOverlayButtonClass"))-[AXPhotosGroupAccessibilityElement _setAxCuratedLibraryOverlayButtonClass:](self, "_setAxCuratedLibraryOverlayButtonClass:", MEMORY[0x2348C1678](CFSTR("PXCuratedLibraryOverlayButton")));
      -[AXPhotosGroupAccessibilityElement _axCuratedLibraryOverlayButtonClass](self, "_axCuratedLibraryOverlayButtonClass");
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "safeValueForKey:", CFSTR("menu"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
        {
          v8 = objc_alloc(MEMORY[0x24BDF6788]);
          objc_msgSend(v6, "accessibilityLabel");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v40[0] = MEMORY[0x24BDAC760];
          v40[1] = 3221225472;
          v40[2] = __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke;
          v40[3] = &unk_24FF06590;
          v41 = v6;
          v42 = v4;
          v10 = (void *)objc_msgSend(v8, "initWithName:actionHandler:", v9, v40);

          objc_msgSend(v30, "addObject:", v10);
        }
      }
    }

  }
LABEL_29:

  return v30;
}

uint64_t __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityShowContextMenuForElement:targetPointValue:", *(_QWORD *)(a1 + 40), 0);
  return 1;
}

uint64_t __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityShowContextMenuForElement:targetPointValue:", *(_QWORD *)(a1 + 40), 0);
  return 1;
}

uint64_t __63__AXPhotosGroupAccessibilityElement_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "sendActionsForControlEvents:", 0x2000);
  return 1;
}

- (id)accessibilityElements
{
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  void *v12;
  _QWORD v14[5];
  _QWORD v15[4];
  id v16;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axUnsortedGroupsAccessibilityElements](self, "_axUnsortedGroupsAccessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = MEMORY[0x24BDAC760];
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke;
  v15[3] = &unk_24FF065E0;
  v6 = v3;
  v16 = v6;
  objc_msgSend(v4, "enumerateObjectsUsingBlock:", v15);
  -[AXPhotosGroupAccessibilityElement _axUnsortedLeafAccessibilityElements](self, "_axUnsortedLeafAccessibilityElements");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "count"))
    objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v7);
  -[AXPhotosGroupAccessibilityElement additionalScrollViewElements](self, "additionalScrollViewElements");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[AXPhotosGroupAccessibilityElement additionalScrollViewElements](self, "additionalScrollViewElements");
    v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v9[2]();
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "array");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }

  objc_msgSend(v6, "axSafelyAddObjectsFromArray:", v10);
  v14[0] = v5;
  v14[1] = 3221225472;
  v14[2] = __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke_2;
  v14[3] = &unk_24FF06608;
  v14[4] = self;
  objc_msgSend(v6, "sortedArrayUsingComparator:", v14);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");

  return v12;
}

void __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  int v4;
  id v5;

  v5 = a2;
  objc_msgSend(v5, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeBoolForKey:", CFSTR("axIsVisible"));

  if (v4)
    objc_msgSend(*(id *)(a1 + 32), "axSafelyAddObject:", v5);

}

uint64_t __58__AXPhotosGroupAccessibilityElement_accessibilityElements__block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axCompareAXPhotoElement:toElement:", a2, a3);
}

- (CGRect)accessibilityFrameForScrolling
{
  double v3;
  CGFloat x;
  double v5;
  CGFloat y;
  double v7;
  double width;
  double v9;
  double height;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect result;

  -[AXPhotosGroupAccessibilityElement accessibilityFrame](self, "accessibilityFrame");
  x = v3;
  y = v5;
  width = v7;
  height = v9;
  -[AXPhotosGroupAccessibilityElement _accessibilityCuratedLibraryUIViewController](self, "_accessibilityCuratedLibraryUIViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
  {
    v22.origin.x = x;
    v22.origin.y = y;
    v22.size.width = width;
    v22.size.height = height;
    v23 = CGRectInset(v22, 0.0, (height + width) * -0.5);
    x = v23.origin.x;
    y = v23.origin.y;
    width = v23.size.width;
    height = v23.size.height;
  }
  else
  {
    -[AXPhotosGroupAccessibilityElement _accessibilityFeedViewController](self, "_accessibilityFeedViewController");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
    {
      objc_msgSend(v12, "safeValueForKeyPath:", CFSTR("configuration.gadgetSpec"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "safeCGFloatForKey:", CFSTR("interItemSpacing"));
      if (v14)
      {
        v16 = v15 * -4.0;
        v17 = 0.0;
      }
      else
      {
        v17 = height / -3.0;
        v16 = 0.0;
      }
      v24.origin.x = x;
      v24.origin.y = y;
      v24.size.width = width;
      v24.size.height = height;
      v25 = CGRectInset(v24, v16, v17);
      x = v25.origin.x;
      y = v25.origin.y;
      width = v25.size.width;
      height = v25.size.height;

    }
  }

  v18 = x;
  v19 = y;
  v20 = width;
  v21 = height;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (id)_accessibilityParentForFindingScrollParent
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[AXPhotosGroupAccessibilityElement _axIsStoryLayout](self, "_axIsStoryLayout")
    && (-[AXPhotosGroupAccessibilityElement _accessibilityFeedViewController](self, "_accessibilityFeedViewController"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        v3,
        v3))
  {
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("axScrollParent"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safeValueForKey:", CFSTR("axNextResponder"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "axContainingScrollViewForAXGroup:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[AXPhotosGroupAccessibilityElement accessibilityContainer](self, "accessibilityContainer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v8;
}

- (void)accessibilityIncrement
{
  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesScrubberInStoryViewController](self, "_axIsMemoriesScrubberInStoryViewController"))
  {
    -[AXPhotosGroupAccessibilityElement _axMoveStoryForInfoSource:inDirection:](self, "_axMoveStoryForInfoSource:inDirection:", CFSTR("PXStoryScrubberContentLayout"), 5);
  }
  else
  {
    -[AXPhotosGroupAccessibilityElement _axMoveToNextInfoInDirection:](self, "_axMoveToNextInfoInDirection:", 5);
  }
}

- (void)accessibilityDecrement
{
  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesScrubberInStoryViewController](self, "_axIsMemoriesScrubberInStoryViewController"))
  {
    -[AXPhotosGroupAccessibilityElement _axMoveStoryForInfoSource:inDirection:](self, "_axMoveStoryForInfoSource:inDirection:", CFSTR("PXStoryScrubberContentLayout"), 6);
  }
  else
  {
    -[AXPhotosGroupAccessibilityElement _axMoveToNextInfoInDirection:](self, "_axMoveToNextInfoInDirection:", 6);
  }
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  uint64_t v5;
  objc_super v7;

  if (!-[AXPhotosGroupAccessibilityElement _axIsMemoriesStyleSwitcherInStoryViewController](self, "_axIsMemoriesStyleSwitcherInStoryViewController"))goto LABEL_5;
  if (a3 == 2)
  {
    v5 = 5;
    goto LABEL_7;
  }
  if (a3 != 1)
  {
LABEL_5:
    v7.receiver = self;
    v7.super_class = (Class)AXPhotosGroupAccessibilityElement;
    return -[AXPhotosGroupAccessibilityElement accessibilityScroll:](&v7, sel_accessibilityScroll_, a3);
  }
  v5 = 6;
LABEL_7:
  -[AXPhotosGroupAccessibilityElement _axMoveStoryForInfoSource:inDirection:](self, "_axMoveStoryForInfoSource:inDirection:", CFSTR("PXStoryStyleSwitchingFullsizeLayout"), v5);
  return 1;
}

- (id)accessibilityHint
{
  void *v3;
  objc_super v5;

  if (-[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    accessibilityPhotosUICoreLocalizedString(CFSTR("years.adjustment.instructions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5.receiver = self;
    v5.super_class = (Class)AXPhotosGroupAccessibilityElement;
    -[AXPhotosGroupAccessibilityElement accessibilityHint](&v5, sel_accessibilityHint);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_accessibilitySupplementaryFooterViews
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[AXPhotosGroupAccessibilityElement _axIsMemoriesStyleSwitcherInStoryViewController](self, "_axIsMemoriesStyleSwitcherInStoryViewController"))
  {
    -[AXPhotosGroupAccessibilityElement _axLeafAccessibilityElements](self, "_axLeafAccessibilityElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v3, "mutableCopy");

    objc_msgSend(v4, "sortUsingSelector:", sel_accessibilityCompareGeometry_);
    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)AXPhotosGroupAccessibilityElement;
    -[AXPhotosGroupAccessibilityElement _accessibilitySupplementaryFooterViews](&v6, sel__accessibilitySupplementaryFooterViews);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (void)_updateGroupAccessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  AXPhotosGroupAccessibilityElement *v9;

  -[AXPhotosGroupAccessibilityElement _axCachedSubgroupElements](self, "_axCachedSubgroupElements");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement group](self, "group");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeArrayForKey:", CFSTR("axSubgroups"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count"))
  {
    v5 = v6;
    if (!v6)
    {
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __70__AXPhotosGroupAccessibilityElement__updateGroupAccessibilityElements__block_invoke;
    v7[3] = &unk_24FF06630;
    v6 = v5;
    v8 = v6;
    v9 = self;
    objc_msgSend(v4, "enumerateObjectsUsingBlock:", v7);
    -[AXPhotosGroupAccessibilityElement _setAxCachedSubgroupElements:](self, "_setAxCachedSubgroupElements:", v6);

  }
  else
  {
    -[AXPhotosGroupAccessibilityElement _setAxCachedSubgroupElements:](self, "_setAxCachedSubgroupElements:", 0);
  }
  -[AXPhotosGroupAccessibilityElement _cleanupStaleGroupAccessibilityElements](self, "_cleanupStaleGroupAccessibilityElements");

}

void __70__AXPhotosGroupAccessibilityElement__updateGroupAccessibilityElements__block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  AXPhotosGroupAccessibilityElement *v4;
  AXPhotosGroupAccessibilityElement *v5;
  AXPhotosGroupAccessibilityElement *v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a2;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", objc_msgSend(v9, "safeIntegerForKey:", CFSTR("subgroupIndex")));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "objectForKey:", v3);
  v4 = (AXPhotosGroupAccessibilityElement *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = v4;
    -[AXPhotosGroupAccessibilityElement setGroup:](v4, "setGroup:", v9);
  }
  else
  {
    v6 = [AXPhotosGroupAccessibilityElement alloc];
    v7 = *(void **)(a1 + 40);
    objc_msgSend(v7, "view");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[AXPhotosGroupAccessibilityElement initWithAccessibilityContainer:forGroup:inView:](v6, "initWithAccessibilityContainer:forGroup:inView:", v7, v9, v8);

    objc_msgSend(*(id *)(a1 + 32), "setObject:forKey:", v5, v3);
  }

}

- (void)_cleanupStaleGroupAccessibilityElements
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  char v11;

  -[AXPhotosGroupAccessibilityElement _axCachedSubgroupElements](self, "_axCachedSubgroupElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v11 = 0;
    objc_opt_class();
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("loadedSubgroupIndexes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "allKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXPhotosGroupAccessibilityElement _axFilterStaleKeys:usingIndexSet:](self, "_axFilterStaleKeys:usingIndexSet:", v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __76__AXPhotosGroupAccessibilityElement__cleanupStaleGroupAccessibilityElements__block_invoke;
    v9[3] = &unk_24FF06658;
    v10 = v3;
    objc_msgSend(v8, "enumerateIndexesUsingBlock:", v9);

  }
}

void __76__AXPhotosGroupAccessibilityElement__cleanupStaleGroupAccessibilityElements__block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  id v3;

  v2 = *(void **)(a1 + 32);
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a2);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", v3);

}

- (id)_axUnsortedGroupsAccessibilityElements
{
  void *v3;
  void *v4;

  -[AXPhotosGroupAccessibilityElement _axCachedSubgroupElements](self, "_axCachedSubgroupElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AXPhotosGroupAccessibilityElement _updateGroupAccessibilityElements](self, "_updateGroupAccessibilityElements");
    -[AXPhotosGroupAccessibilityElement _axCachedSubgroupElements](self, "_axCachedSubgroupElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axGroupsAccessibilityElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[AXPhotosGroupAccessibilityElement _axUnsortedGroupsAccessibilityElements](self, "_axUnsortedGroupsAccessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("group.subgroupIndex"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axFilterSubgroupsByInfoSourceType:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[AXPhotosGroupAccessibilityElement _axGroupsAccessibilityElements](self, "_axGroupsAccessibilityElements");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __72__AXPhotosGroupAccessibilityElement__axFilterSubgroupsByInfoSourceType___block_invoke;
  v9[3] = &unk_24FF06680;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "axFilterObjectsUsingBlock:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __72__AXPhotosGroupAccessibilityElement__axFilterSubgroupsByInfoSourceType___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  uint64_t v5;

  v3 = a2;
  if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosGridSectionHeader")))
  {
    v4 = objc_msgSend(v3, "_axIsSectionHeader");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosGridChapterHeader")))
  {
    v4 = objc_msgSend(v3, "_axIsChapterHeader");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosGridDecorating")))
  {
    v4 = objc_msgSend(v3, "_axIsDecorating");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosGridCardSectionBody")))
  {
    v4 = objc_msgSend(v3, "_axIsCardSectionBody");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosStoryFullsizeLayoutKey")))
  {
    v4 = objc_msgSend(v3, "_axIsStoryFullsizeLayout");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosStoryClipLayoutKey")))
  {
    v4 = objc_msgSend(v3, "_axIsStoryClipLayout");
  }
  else if (objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosStoryThumbnailChromeLayoutKey")))
  {
    v4 = objc_msgSend(v3, "_axIsStoryThumbnailChromeLayout");
  }
  else
  {
    if (!objc_msgSend(*(id *)(a1 + 32), "isEqualToString:", CFSTR("AXPhotosStoryScrubberContentLayoutKey")))
    {
      v5 = 0;
      goto LABEL_18;
    }
    v4 = objc_msgSend(v3, "_axIsStoryScrubberContentLayout");
  }
  v5 = v4;
LABEL_18:

  return v5;
}

- (id)_axSectionHeadersInSubgroups
{
  return -[AXPhotosGroupAccessibilityElement _axFilterSubgroupsByInfoSourceType:](self, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosGridSectionHeader"));
}

- (id)_axChapterHeadersInSubgroups
{
  return -[AXPhotosGroupAccessibilityElement _axFilterSubgroupsByInfoSourceType:](self, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosGridChapterHeader"));
}

- (id)_axDecoratingInSubgroups
{
  return -[AXPhotosGroupAccessibilityElement _axFilterSubgroupsByInfoSourceType:](self, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosGridDecorating"));
}

- (id)_axCardSectionBodyInSubgroups
{
  void *v2;
  void *v3;
  void *v4;

  -[AXPhotosGroupAccessibilityElement _axDecoratingInSubgroups](self, "_axDecoratingInSubgroups");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "count"))
  {
    objc_msgSend(v2, "firstObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosGridCardSectionBody"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (id)_axStoryClipLayoutInSubgroups
{
  return -[AXPhotosGroupAccessibilityElement _axFilterSubgroupsByInfoSourceType:](self, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosStoryClipLayoutKey"));
}

- (id)_axStoryFullsizeLayoutInSubgroups
{
  return -[AXPhotosGroupAccessibilityElement _axFilterSubgroupsByInfoSourceType:](self, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosStoryFullsizeLayoutKey"));
}

- (id)_axStoryThumbnailChromeLayoutInSubgroups
{
  return -[AXPhotosGroupAccessibilityElement _axFilterSubgroupsByInfoSourceType:](self, "_axFilterSubgroupsByInfoSourceType:", CFSTR("AXPhotosStoryThumbnailChromeLayoutKey"));
}

- (id)_axUniqueIdentifierForLeaf:(id)a3
{
  id v3;
  const __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;

  v3 = a3;
  switch(objc_msgSend(v3, "safeIntegerForKey:", CFSTR("axContentKind")))
  {
    case 1:
      objc_msgSend(v3, "safeValueForKey:", CFSTR("axTitle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "safeValueForKey:", CFSTR("axSubtitle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_9;
    case 2:
    case 3:
      v4 = CFSTR("axText");
      goto LABEL_6;
    case 4:
      v4 = CFSTR("axImageName");
LABEL_6:
      objc_msgSend(v3, "safeValueForKey:", v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v8 = objc_claimAutoreleasedReturnValue();
      goto LABEL_7;
    case 5:
      v9 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "safeValueForKey:", CFSTR("axView"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "stringWithFormat:", CFSTR("%p"), v6);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:
      __UIAXStringForVariables();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_10;
    case 6:
      objc_msgSend(v3, "safeValueForKey:", CFSTR("axAsset"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "safeValueForKey:", CFSTR("localIdentifier"));
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8)
        goto LABEL_7;
      MEMORY[0x2348C1678](CFSTR("CKMediaObjectBackedAsset"));
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        objc_msgSend(v6, "safeValueForKey:", CFSTR("uuid"));
        v8 = objc_claimAutoreleasedReturnValue();
LABEL_7:
        v5 = (void *)v8;
      }
      else
      {
        v5 = 0;
      }
LABEL_10:

LABEL_11:
      return v5;
    default:
      v5 = 0;
      goto LABEL_11;
  }
}

- (void)_updateLeafAccessibilityElementsIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[4];
  id v17;
  AXPhotosGroupAccessibilityElement *v18;
  id v19;
  id v20;
  id location;

  -[AXPhotosGroupAccessibilityElement _axCachedLeafElements](self, "_axCachedLeafElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axCachedLeafSpriteIndexes](self, "_axCachedLeafSpriteIndexes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement group](self, "group");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safeArrayForKey:", CFSTR("axLeafs"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v6, "count"))
  {
    -[AXPhotosGroupAccessibilityElement _setAxCachedLeafElements:](self, "_setAxCachedLeafElements:", 0);
    goto LABEL_11;
  }
  if (v3)
  {
    if (v4)
      goto LABEL_4;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_4:
  -[AXPhotosGroupAccessibilityElement _accessibilityCuratedLibraryUIViewController](self, "_accessibilityCuratedLibraryUIViewController");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("viewProvider"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "safeValueForKey:", CFSTR("viewModel"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("zoomablePhotosViewModel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "safeBoolForKey:", CFSTR("isDisplayingIndividualItems"));

  if (!v7 || v11)
  {
    objc_initWeak(&location, self);
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __77__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElementsIfNeeded__block_invoke;
    v16[3] = &unk_24FF066A8;
    v17 = v4;
    objc_copyWeak(&v20, &location);
    v18 = self;
    v12 = v3;
    v19 = v12;
    objc_msgSend(v6, "enumerateObjectsUsingBlock:", v16);
    objc_opt_class();
    -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeValueForKey:", CFSTR("axVisibleSpriteIndexes"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v15, "count"))
      -[AXPhotosGroupAccessibilityElement _updateLeafAccessibilityElements:forVisibleSpriteIndexes:](self, "_updateLeafAccessibilityElements:forVisibleSpriteIndexes:", v12, v15);

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

LABEL_11:
}

void __77__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElementsIfNeeded__block_invoke(uint64_t a1, void *a2)
{
  id WeakRetained;
  void *v4;
  AXPhotosLeafAccessibilityElement *v5;
  id v6;

  v6 = a2;
  objc_msgSend(*(id *)(a1 + 32), "addIndex:", objc_msgSend(v6, "safeUnsignedIntForKey:", CFSTR("spriteIndex")));
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  objc_msgSend(WeakRetained, "_axUniqueIdentifierForLeaf:", v6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = -[AXPhotosLeafAccessibilityElement initWithAccessibilityContainer:forLeaf:]([AXPhotosLeafAccessibilityElement alloc], "initWithAccessibilityContainer:forLeaf:", *(_QWORD *)(a1 + 40), v6);
    objc_msgSend(*(id *)(a1 + 48), "setObject:forKey:", v5, v4);

  }
}

- (void)_updateLeafAccessibilityElements:(id)a3 forVisibleSpriteIndexes:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  _QWORD v12[5];
  id v13;
  id v14;

  v6 = a3;
  v7 = (void *)MEMORY[0x24BDBCEF0];
  v8 = a4;
  objc_msgSend(v7, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke;
  v12[3] = &unk_24FF066F8;
  v12[4] = self;
  v13 = v6;
  v14 = v9;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "enumerateIndexesUsingBlock:", v12);

  -[AXPhotosGroupAccessibilityElement _axUnloadStaleLeafObjects](self, "_axUnloadStaleLeafObjects");
  -[AXPhotosGroupAccessibilityElement _axCleanupAccessibilityElements:withUpdatedKeys:](self, "_axCleanupAccessibilityElements:withUpdatedKeys:", v11, v10);

}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke(id *a1)
{
  id v2;
  id v3;
  void *v4;
  AXPhotosLeafAccessibilityElement *v5;
  AXPhotosLeafAccessibilityElement *v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy_;
  v11 = __Block_byref_object_dispose_;
  v12 = 0;
  AXPerformSafeBlock();
  v2 = (id)v8[5];
  _Block_object_dispose(&v7, 8);

  if (!v2)
  {
    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    v12 = 0;
    AXPerformSafeBlock();
    v3 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

    v7 = 0;
    v8 = &v7;
    v9 = 0x3032000000;
    v10 = __Block_byref_object_copy_;
    v11 = __Block_byref_object_dispose_;
    v12 = 0;
    AXPerformSafeBlock();
    v2 = (id)v8[5];
    _Block_object_dispose(&v7, 8);

  }
  objc_msgSend(a1[4], "_axUniqueIdentifierForLeaf:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    objc_msgSend(a1[5], "objectForKey:", v4);
    v5 = (AXPhotosLeafAccessibilityElement *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[AXPhotosLeafAccessibilityElement setLeaf:](v5, "setLeaf:", v2);
    }
    else
    {
      v6 = -[AXPhotosLeafAccessibilityElement initWithAccessibilityContainer:forLeaf:]([AXPhotosLeafAccessibilityElement alloc], "initWithAccessibilityContainer:forLeaf:", a1[4], v2);
      objc_msgSend(a1[5], "setObject:forKey:", v6, v4);
    }

  }
  objc_msgSend(a1[6], "axSafelyAddObject:", v4);

}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedLeafAtSpriteIndex:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadLeafAtSpriteIndexIfNeeded:usingOptions:", *(unsigned int *)(a1 + 48), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __94__AXPhotosGroupAccessibilityElement__updateLeafAccessibilityElements_forVisibleSpriteIndexes___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedLeafAtSpriteIndex:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (void)_axUnloadStaleLeafObjects
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  AXPhotosGroupAccessibilityElement *v11;
  char v12;

  -[AXPhotosGroupAccessibilityElement _axCachedLeafSpriteIndexes](self, "_axCachedLeafSpriteIndexes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_opt_class();
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeValueForKey:", CFSTR("axVisibleSpriteIndexes"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __62__AXPhotosGroupAccessibilityElement__axUnloadStaleLeafObjects__block_invoke;
  v9[3] = &unk_24FF06748;
  v10 = v6;
  v11 = self;
  v7 = v6;
  objc_msgSend(v3, "enumerateIndexesUsingBlock:", v9);
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  -[AXPhotosGroupAccessibilityElement _setAxCachedLeafSpriteIndexes:](self, "_setAxCachedLeafSpriteIndexes:", v8);

}

uint64_t __62__AXPhotosGroupAccessibilityElement__axUnloadStaleLeafObjects__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "containsIndex:", a2);
  if ((result & 1) == 0)
    return AXPerformSafeBlock();
  return result;
}

void __62__AXPhotosGroupAccessibilityElement__axUnloadStaleLeafObjects__block_invoke_2(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "unloadLeafAtSpriteIndex:usingOptions:", *(unsigned int *)(a1 + 40), 3);

}

- (void)_axCleanupAccessibilityElements:(id)a3 withUpdatedKeys:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void *v15;
  id v16;

  v10 = a3;
  v6 = a4;
  if (objc_msgSend(v10, "count"))
  {
    v7 = (void *)MEMORY[0x24BDBCEF0];
    objc_msgSend(v10, "allKeys");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "minusSet:", v6);
    v12 = MEMORY[0x24BDAC760];
    v13 = 3221225472;
    v14 = __85__AXPhotosGroupAccessibilityElement__axCleanupAccessibilityElements_withUpdatedKeys___block_invoke;
    v15 = &unk_24FF06770;
    v16 = v10;
    objc_msgSend(v9, "enumerateObjectsUsingBlock:", &v12);

  }
  -[AXPhotosGroupAccessibilityElement _setAxCachedLeafElements:](self, "_setAxCachedLeafElements:", v10, v10, v12, v13, v14, v15);

}

uint64_t __85__AXPhotosGroupAccessibilityElement__axCleanupAccessibilityElements_withUpdatedKeys___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", a2);
}

- (id)_axUnsortedLeafAccessibilityElements
{
  void *v3;
  void *v4;

  -[AXPhotosGroupAccessibilityElement _axCachedLeafElements](self, "_axCachedLeafElements");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[AXPhotosGroupAccessibilityElement _updateLeafAccessibilityElementsIfNeeded](self, "_updateLeafAccessibilityElementsIfNeeded");
    -[AXPhotosGroupAccessibilityElement _axCachedLeafElements](self, "_axCachedLeafElements");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)_axLeafAccessibilityElements
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x24BDAC8D0];
  -[AXPhotosGroupAccessibilityElement _axUnsortedLeafAccessibilityElements](self, "_axUnsortedLeafAccessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD17C0], "sortDescriptorWithKey:ascending:", CFSTR("leaf.spriteIndex"), 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "sortedArrayUsingDescriptors:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_axFilterLeafsByContentKind:(int64_t)a3
{
  void *v4;
  void *v5;
  _QWORD v7[5];

  -[AXPhotosGroupAccessibilityElement _axLeafAccessibilityElements](self, "_axLeafAccessibilityElements");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __65__AXPhotosGroupAccessibilityElement__axFilterLeafsByContentKind___block_invoke;
  v7[3] = &__block_descriptor_40_e45_B24__0__AXPhotosLeafAccessibilityElement_8Q16l;
  v7[4] = a3;
  objc_msgSend(v4, "axFilterObjectsUsingBlock:", v7);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

BOOL __65__AXPhotosGroupAccessibilityElement__axFilterLeafsByContentKind___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "leaf");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "safeIntegerForKey:", CFSTR("axContentKind"));

  return v4 == *(_QWORD *)(a1 + 32);
}

- (void)_axContainingGroup:(id)a3 performedAction:(int64_t)a4 withUserInfo:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  _QWORD v15[3];
  char v16;

  v7 = a3;
  v8 = a5;
  v15[0] = 0;
  v15[1] = v15;
  v15[2] = 0x2020000000;
  v16 = 0;
  v12 = MEMORY[0x24BDAC760];
  v13 = v7;
  v14 = v8;
  AXPerformSafeBlock();

  _Block_object_dispose(v15, 8);
  -[AXPhotosGroupAccessibilityElement view](self, "view", v12, 3221225472, __85__AXPhotosGroupAccessibilityElement__axContainingGroup_performedAction_withUserInfo___block_invoke, &unk_24FF067B8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "safeValueForKey:", CFSTR("engine"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (id)objc_msgSend(v10, "safeValueForKey:", CFSTR("ensureUpdatedLayout"));
}

void __85__AXPhotosGroupAccessibilityElement__axContainingGroup_performedAction_withUserInfo___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "safeValueForKey:", CFSTR("axNextResponder"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v2, "axGroup:didRequestToPerformAction:userInfo:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 40));

}

- (void)_axShouldShowAlternateUI:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;

  v3 = a3;
  if (-[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    -[AXPhotosGroupAccessibilityElement _axCardSectionBodyInSubgroups](self, "_axCardSectionBodyInSubgroups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "count"))
    {
      objc_msgSend(v5, "firstObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "group");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "safeArrayForKey:", CFSTR("axLeafs"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v8, "count"))
      {
        objc_msgSend(v8, "firstObject");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (v9)
        {
          v10 = v9;
          objc_msgSend(v9, "safeValueForKey:", CFSTR("axContainingGroup"));
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          if (v11)
          {
            v16 = 0;
            v17 = &v16;
            v18 = 0x3032000000;
            v19 = __Block_byref_object_copy_;
            v20 = __Block_byref_object_dispose_;
            v21 = 0;
            v14 = MEMORY[0x24BDAC760];
            v15 = v10;
            AXPerformSafeBlock();
            v12 = (id)v17[5];

            _Block_object_dispose(&v16, 8);
            if (v3)
              v13 = 2;
            else
              v13 = 3;
            -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](self, "_axContainingGroup:performedAction:withUserInfo:", v11, v13, v12, v14, 3221225472, __62__AXPhotosGroupAccessibilityElement__axShouldShowAlternateUI___block_invoke, &unk_24FF067E0);

          }
        }
      }

    }
  }
}

void __62__AXPhotosGroupAccessibilityElement__axShouldShowAlternateUI___block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __UIAccessibilityCastAsProtocol();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXGAXCreateActionUserInfo();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_axMoreButtonInMonthsView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (-[AXPhotosGroupAccessibilityElement _axIsMonthsView](self, "_axIsMonthsView"))
  {
    -[AXPhotosGroupAccessibilityElement _axSectionHeadersInSubgroups](self, "_axSectionHeadersInSubgroups");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "count"))
    {
      objc_msgSend(v3, "firstObject");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axLeafAccessibilityElements");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v5, "axFilterObjectsUsingBlock:", &__block_literal_global);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v7 = 0;
      }

    }
    else
    {
      v7 = 0;
    }

  }
  else
  {
    v7 = 0;
  }
  return v7;
}

BOOL __62__AXPhotosGroupAccessibilityElement__axMoreButtonInMonthsView__block_invoke(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "leaf");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntegerForKey:", CFSTR("axContentKind")) == 5;

  return v3;
}

- (void)_axMoveToNextInfoInDirection:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  AXPhotosGroupAccessibilityElement *v20;
  void *v21;
  id v22;
  id v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;

  if (-[AXPhotosGroupAccessibilityElement _axIsYearsView](self, "_axIsYearsView"))
  {
    -[AXPhotosGroupAccessibilityElement _axCardSectionBodyInSubgroups](self, "_axCardSectionBodyInSubgroups");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "count"))
    {
      objc_msgSend(v4, "firstObject");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_axLeafAccessibilityElements");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "count"))
      {
        objc_msgSend(v6, "firstObject");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (v7)
        {
          v8 = v7;
          objc_msgSend(v7, "leaf");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "safeValueForKey:", CFSTR("axContainingGroup"));
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          if (v10)
          {
            objc_msgSend(v10, "safeValueForKey:", CFSTR("axInfoSource"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v8, "leaf");
            v11 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v11, "safeUnsignedIntForKey:", CFSTR("spriteIndex"));

            v29 = 0;
            v30 = &v29;
            v31 = 0x3032000000;
            v32 = __Block_byref_object_copy_;
            v33 = __Block_byref_object_dispose_;
            v34 = 0;
            v28 = v8;
            AXPerformSafeBlock();
            v12 = (id)v30[5];

            _Block_object_dispose(&v29, 8);
            v23 = v12;
            -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](self, "_axContainingGroup:performedAction:withUserInfo:", v10, 2, v12);
            v29 = 0;
            v30 = &v29;
            v31 = 0x2020000000;
            LODWORD(v32) = 0;
            v25 = v24;
            AXPerformSafeBlock();
            LODWORD(v12) = *((_DWORD *)v30 + 6);

            _Block_object_dispose(&v29, 8);
            if ((_DWORD)v12 == -1)
            {
              UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDC0]);
              v20 = self;
              v19 = v23;
              -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](v20, "_axContainingGroup:performedAction:withUserInfo:", v10, 3, v23);
            }
            else
            {
              v29 = 0;
              v30 = &v29;
              v31 = 0x3032000000;
              v32 = __Block_byref_object_copy_;
              v33 = __Block_byref_object_dispose_;
              v34 = 0;
              v27 = v10;
              AXPerformSafeBlock();
              v13 = (id)v30[5];

              _Block_object_dispose(&v29, 8);
              v29 = 0;
              v30 = &v29;
              v31 = 0x3032000000;
              v32 = __Block_byref_object_copy_;
              v33 = __Block_byref_object_dispose_;
              v34 = 0;
              v14 = v27;
              AXPerformSafeBlock();
              v15 = (id)v30[5];

              _Block_object_dispose(&v29, 8);
              if (v15)
              {
                v29 = 0;
                v30 = &v29;
                v31 = 0x3032000000;
                v32 = __Block_byref_object_copy_;
                v33 = __Block_byref_object_dispose_;
                v34 = 0;
                v26 = v15;
                AXPerformSafeBlock();
                v22 = (id)v30[5];

                _Block_object_dispose(&v29, 8);
                -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](self, "_axContainingGroup:performedAction:withUserInfo:", v14, 4, v22);
                -[AXPhotosGroupAccessibilityElement accessibilityValue](self, "accessibilityValue");
                v16 = (void *)objc_claimAutoreleasedReturnValue();
                -[AXPhotosGroupAccessibilityElement accessibilityLabel](self, "accessibilityLabel");
                v21 = (void *)objc_claimAutoreleasedReturnValue();
                __UIAXStringForVariables();
                v17 = v14;
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v18);
                -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](self, "_axContainingGroup:performedAction:withUserInfo:", v17, 3, v22, v21, CFSTR("__AXStringForVariablesSentinel"));

              }
              v19 = v23;
            }

          }
        }
      }

    }
  }
}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "leaf");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  PXGAXCreateActionUserInfo();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_2(uint64_t a1)
{
  void *v2;

  __UIAccessibilityCastAsProtocol();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "axSpriteIndexClosestToSpriteIndex:inDirection:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "loadLeafAtSpriteIndexIfNeeded:usingOptions:", *(unsigned int *)(a1 + 48), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_4(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "loadedLeafAtSpriteIndex:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __66__AXPhotosGroupAccessibilityElement__axMoveToNextInfoInDirection___block_invoke_5(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __UIAccessibilityCastAsProtocol();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXGAXCreateActionUserInfo();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)_axCurrentLeafInStory
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  -[AXPhotosGroupAccessibilityElement group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("axLeafs"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "axFilterObjectsUsingBlock:", &__block_literal_global_649);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

BOOL __58__AXPhotosGroupAccessibilityElement__axCurrentLeafInStory__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "safeUnsignedIntForKey:", CFSTR("spriteIndex")) == 1001;
}

- (void)_axMoveStoryForInfoSource:(id)a3 inDirection:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  id v11;
  int v12;
  id v13;
  id v14;
  id v15;
  void *v16;
  id v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  uint64_t (*v21)(uint64_t, uint64_t);
  void (*v22)(uint64_t);
  id v23;
  uint64_t v24;
  uint64_t v25;
  void (*v26)(uint64_t);
  void *v27;
  id v28;
  uint64_t *v29;
  unint64_t v30;
  int v31;

  v6 = a3;
  -[AXPhotosGroupAccessibilityElement _axCurrentLeafInStory](self, "_axCurrentLeafInStory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "safeValueForKey:", CFSTR("axInfoSource"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    MEMORY[0x2348C1678](v6);
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = objc_msgSend(v7, "safeUnsignedIntForKey:", CFSTR("spriteIndex"));
      v18 = 0;
      v19 = &v18;
      v20 = 0x2020000000;
      LODWORD(v21) = 0;
      v24 = MEMORY[0x24BDAC760];
      v25 = 3221225472;
      v26 = __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke;
      v27 = &unk_24FF06828;
      v29 = &v18;
      v11 = v9;
      v31 = v10;
      v28 = v11;
      v30 = a4;
      AXPerformSafeBlock();
      v12 = *((_DWORD *)v19 + 6);

      _Block_object_dispose(&v18, 8);
      if (v12 == -1)
      {
        UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], (id)*MEMORY[0x24BDFEDC0]);
      }
      else
      {
        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy_;
        v22 = __Block_byref_object_dispose_;
        v23 = 0;
        AXPerformSafeBlock();
        v13 = (id)v19[5];
        _Block_object_dispose(&v18, 8);

        v18 = 0;
        v19 = &v18;
        v20 = 0x3032000000;
        v21 = __Block_byref_object_copy_;
        v22 = __Block_byref_object_dispose_;
        v23 = 0;
        AXPerformSafeBlock();
        v14 = (id)v19[5];
        _Block_object_dispose(&v18, 8);

        if (v14)
        {
          v18 = 0;
          v19 = &v18;
          v20 = 0x3032000000;
          v21 = __Block_byref_object_copy_;
          v22 = __Block_byref_object_dispose_;
          v23 = 0;
          v17 = v14;
          AXPerformSafeBlock();
          v15 = (id)v19[5];

          _Block_object_dispose(&v18, 8);
          -[AXPhotosGroupAccessibilityElement group](self, "group");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[AXPhotosGroupAccessibilityElement _axContainingGroup:performedAction:withUserInfo:](self, "_axContainingGroup:performedAction:withUserInfo:", v16, 4, v15);

        }
      }
    }

  }
}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke(uint64_t a1)
{
  void *v2;

  __UIAccessibilityCastAsProtocol();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v2, "axSpriteIndexClosestToSpriteIndex:inDirection:", *(unsigned int *)(a1 + 56), *(_QWORD *)(a1 + 48));

}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadLeafAtSpriteIndexIfNeeded:usingOptions:", *(unsigned int *)(a1 + 48), 1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke_3(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "group");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "loadedLeafAtSpriteIndex:", *(unsigned int *)(a1 + 48));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __75__AXPhotosGroupAccessibilityElement__axMoveStoryForInfoSource_inDirection___block_invoke_4(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  __UIAccessibilityCastAsProtocol();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  PXGAXCreateActionUserInfo();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (void)_axRefreshGridGroupData:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;

  v4 = a3;
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "valueForKey:", CFSTR("AXPhotosGridUpdateKey"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "integerValue");

  objc_msgSend(v4, "userInfo");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "valueForKey:", CFSTR("AXPhotosGridGroupKey"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7 == 8)
  {
    -[AXPhotosGroupAccessibilityElement group](self, "group");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9 == v10)
    {
      -[AXPhotosGroupAccessibilityElement _updateGroupAccessibilityElements](self, "_updateGroupAccessibilityElements");
      objc_opt_class();
      -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "safeValueForKey:", CFSTR("axVisibleSpriteIndexes"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilityCastAsClass();
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v13, "count"))
      {
        -[AXPhotosGroupAccessibilityElement _axCachedLeafElements](self, "_axCachedLeafElements");
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = (void *)objc_msgSend(v14, "mutableCopy");

        -[AXPhotosGroupAccessibilityElement _updateLeafAccessibilityElements:forVisibleSpriteIndexes:](self, "_updateLeafAccessibilityElements:forVisibleSpriteIndexes:", v15, v13);
      }
      UIAccessibilityPostNotification(*MEMORY[0x24BDF72C8], 0);

    }
  }

}

- (id)_accessibilityInfoSource
{
  void *v2;
  void *v3;

  -[AXPhotosGroupAccessibilityElement group](self, "group");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeValueForKey:", CFSTR("_axInfoSource"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_axIsAssetSection
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axAssetsSectionLayoutClass](self, "_axAssetsSectionLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxAssetsSectionLayoutClass:](self, "_setAxAssetsSectionLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXAssetsSectionLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axAssetsSectionLayoutClass](self, "_axAssetsSectionLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsChapterHeader
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axCuratedLibraryChapterHeaderLayoutClass](self, "_axCuratedLibraryChapterHeaderLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxCuratedLibraryChapterHeaderLayoutClass:](self, "_setAxCuratedLibraryChapterHeaderLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXCuratedLibraryChapterHeaderLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axCuratedLibraryChapterHeaderLayoutClass](self, "_axCuratedLibraryChapterHeaderLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsSectionHeader
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axCuratedLibrarySectionHeaderLayoutClass](self, "_axCuratedLibrarySectionHeaderLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxCuratedLibrarySectionHeaderLayoutClass:](self, "_setAxCuratedLibrarySectionHeaderLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXCuratedLibrarySectionHeaderLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axCuratedLibrarySectionHeaderLayoutClass](self, "_axCuratedLibrarySectionHeaderLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsDecorating
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axDecoratingLayoutClass](self, "_axDecoratingLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxDecoratingLayoutClass:](self, "_setAxDecoratingLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXGDecoratingLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axDecoratingLayoutClass](self, "_axDecoratingLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsCardSectionBody
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axCuratedLibraryCardSectionBodyLayoutClass](self, "_axCuratedLibraryCardSectionBodyLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxCuratedLibraryCardSectionBodyLayoutClass:](self, "_setAxCuratedLibraryCardSectionBodyLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXCuratedLibraryCardSectionBodyLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axCuratedLibraryCardSectionBodyLayoutClass](self, "_axCuratedLibraryCardSectionBodyLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsInlineHeader
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axInlineHeadersSpriteLayoutClass](self, "_axInlineHeadersSpriteLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxInlineHeadersSpriteLayoutClass:](self, "_setAxInlineHeadersSpriteLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXInlineHeadersSpriteLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axInlineHeadersSpriteLayoutClass](self, "_axInlineHeadersSpriteLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsGrid
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axGridLayoutClass](self, "_axGridLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxGridLayoutClass:](self, "_setAxGridLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXGGridLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axGridLayoutClass](self, "_axGridLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryColorGradeEditorItem
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryColorGradeEditorItemLayoutClass](self, "_axStoryColorGradeEditorItemLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxStoryColorGradeEditorItemLayoutClass:](self, "_setAxStoryColorGradeEditorItemLayoutClass:", MEMORY[0x2348C1678](CFSTR("PhotosUIApps.PUStoryColorGradeEditorItemLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryColorGradeEditorItemLayoutClass](self, "_axStoryColorGradeEditorItemLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryColorGradeEditorItemOverlay
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryColorGradeEditorItemOverlayLayoutClass](self, "_axStoryColorGradeEditorItemOverlayLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxStoryColorGradeEditorItemOverlayLayoutClass:](self, "_setAxStoryColorGradeEditorItemOverlayLayoutClass:", MEMORY[0x2348C1678](CFSTR("PUStoryColorGradeEditorItemOverlayLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryColorGradeEditorItemOverlayLayoutClass](self, "_axStoryColorGradeEditorItemOverlayLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryLayoutClass](self, "_axStoryLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxStoryLayoutClass:](self, "_setAxStoryLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryLayoutClass](self, "_axStoryLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryThumbnailChromeLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryThumbnailChromeLayoutClass](self, "_axStoryThumbnailChromeLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxStoryThumbnailChromeLayoutClass:](self, "_setAxStoryThumbnailChromeLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryThumbnailChromeLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryThumbnailChromeLayoutClass](self, "_axStoryThumbnailChromeLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryFullsizeLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryFullsizeLayoutClass](self, "_axStoryFullsizeLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxStoryFullsizeLayoutClass:](self, "_setAxStoryFullsizeLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryFullsizeLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryFullsizeLayoutClass](self, "_axStoryFullsizeLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryClipLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryClipLayoutClass](self, "_axStoryClipLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxStoryClipLayoutClass:](self, "_setAxStoryClipLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryClipLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryClipLayoutClass](self, "_axStoryClipLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryTransitionLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryTransitionLayoutClass](self, "_axStoryTransitionLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxStoryTransitionLayoutClass:](self, "_setAxStoryTransitionLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryTransitionLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryTransitionLayoutClass](self, "_axStoryTransitionLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsFeedContentLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axFeedContentLayoutClass](self, "_axFeedContentLayoutClass"))
    -[AXPhotosGroupAccessibilityElement _setAxFeedContentLayoutClass:](self, "_setAxFeedContentLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXFeedContentLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axFeedContentLayoutClass](self, "_axFeedContentLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryScrubberContentLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryScrubberContentLayoutClass](self, "_axStoryScrubberContentLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxStoryScrubberContentLayoutClass:](self, "_setAxStoryScrubberContentLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryScrubberContentLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryScrubberContentLayoutClass](self, "_axStoryScrubberContentLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsStoryStyleSwitchingFullsizeLayout
{
  void *v3;
  char isKindOfClass;

  if (!-[AXPhotosGroupAccessibilityElement _axStoryStyleSwitchingFullsizeLayoutClass](self, "_axStoryStyleSwitchingFullsizeLayoutClass"))-[AXPhotosGroupAccessibilityElement _setAxStoryStyleSwitchingFullsizeLayoutClass:](self, "_setAxStoryStyleSwitchingFullsizeLayoutClass:", MEMORY[0x2348C1678](CFSTR("PXStoryStyleSwitchingFullsizeLayout")));
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXPhotosGroupAccessibilityElement _axStoryStyleSwitchingFullsizeLayoutClass](self, "_axStoryStyleSwitchingFullsizeLayoutClass");
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axInZoomLevel:(int64_t)a3
{
  void *v5;
  BOOL v6;

  if (!-[AXPhotosGroupAccessibilityElement _axIsAssetSection](self, "_axIsAssetSection"))
    return 0;
  -[AXPhotosGroupAccessibilityElement _accessibilityInfoSource](self, "_accessibilityInfoSource");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeIntegerForKey:", CFSTR("zoomLevel")) == a3;

  return v6;
}

- (BOOL)_axIsMonthsView
{
  return -[AXPhotosGroupAccessibilityElement _axInZoomLevel:](self, "_axInZoomLevel:", 2);
}

- (BOOL)_axIsYearsView
{
  return -[AXPhotosGroupAccessibilityElement _axInZoomLevel:](self, "_axInZoomLevel:", 1);
}

- (BOOL)_axIsDaysView
{
  return -[AXPhotosGroupAccessibilityElement _axInZoomLevel:](self, "_axInZoomLevel:", 3);
}

- (BOOL)_axInAllPhotosView
{
  return -[AXPhotosGroupAccessibilityElement _axInZoomLevel:](self, "_axInZoomLevel:", 4);
}

- (id)_axStoryColorGradeLeafElement
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[AXPhotosGroupAccessibilityElement _axGroupsAccessibilityElements](self, "_axGroupsAccessibilityElements");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "axFilterObjectsUsingBlock:", &__block_literal_global_657);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "count"))
  {
    v5 = 0;
    goto LABEL_6;
  }
  objc_msgSend(v3, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (!v4)
  {
LABEL_6:
    v7 = 0;
    goto LABEL_9;
  }
  objc_msgSend(v4, "_axLeafAccessibilityElements");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "count"))
  {
    objc_msgSend(v6, "firstObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }

LABEL_9:
  return v7;
}

uint64_t __66__AXPhotosGroupAccessibilityElement__axStoryColorGradeLeafElement__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_axIsStoryColorGradeEditorItemOverlay");
}

- (id)_accessibilityCuratedLibraryUIViewController
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!-[AXPhotosGroupAccessibilityElement _axCuratedLibraryUIViewControllerClass](self, "_axCuratedLibraryUIViewControllerClass"))-[AXPhotosGroupAccessibilityElement _setAxCuratedLibraryUIViewControllerClass:](self, "_setAxCuratedLibraryUIViewControllerClass:", MEMORY[0x2348C1678](CFSTR("PXCuratedLibraryUIViewController")));
  if (!-[AXPhotosGroupAccessibilityElement _axCuratedLibraryUIViewControllerClass](self, "_axCuratedLibraryUIViewControllerClass"))return 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __81__AXPhotosGroupAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke;
  v6[3] = &unk_24FF068F8;
  v6[4] = self;
  -[AXPhotosGroupAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __81__AXPhotosGroupAccessibilityElement__accessibilityCuratedLibraryUIViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axCuratedLibraryUIViewControllerClass");
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (id)_accessibilityFeedViewController
{
  void *v3;
  void *v4;
  _QWORD v6[5];

  if (!-[AXPhotosGroupAccessibilityElement _axFeedViewControllerClass](self, "_axFeedViewControllerClass"))
    -[AXPhotosGroupAccessibilityElement _setAxFeedViewControllerClass:](self, "_setAxFeedViewControllerClass:", MEMORY[0x2348C1678](CFSTR("PXFeedViewController")));
  if (!-[AXPhotosGroupAccessibilityElement _axFeedViewControllerClass](self, "_axFeedViewControllerClass"))
    return 0;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __69__AXPhotosGroupAccessibilityElement__accessibilityFeedViewController__block_invoke;
  v6[3] = &unk_24FF068F8;
  v6[4] = self;
  -[AXPhotosGroupAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v6, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

uint64_t __69__AXPhotosGroupAccessibilityElement__accessibilityFeedViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axFeedViewControllerClass");
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (BOOL)_accessibilityInStoryViewController
{
  void *v3;
  void *v4;
  BOOL v5;
  _QWORD v7[5];

  if (!-[AXPhotosGroupAccessibilityElement _axStoryViewControllerClass](self, "_axStoryViewControllerClass"))
    -[AXPhotosGroupAccessibilityElement _setAxStoryViewControllerClass:](self, "_setAxStoryViewControllerClass:", MEMORY[0x2348C1678](CFSTR("PUXStoryViewController")));
  if (!-[AXPhotosGroupAccessibilityElement _axStoryViewControllerClass](self, "_axStoryViewControllerClass"))
    return 0;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __72__AXPhotosGroupAccessibilityElement__accessibilityInStoryViewController__block_invoke;
  v7[3] = &unk_24FF068F8;
  v7[4] = self;
  -[AXPhotosGroupAccessibilityElement _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", v7, 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4 != 0;

  return v5;
}

uint64_t __72__AXPhotosGroupAccessibilityElement__accessibilityInStoryViewController__block_invoke(uint64_t a1, void *a2)
{
  void *v3;

  objc_msgSend(a2, "_accessibilityViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "_axStoryViewControllerClass");
  LOBYTE(a1) = objc_opt_isKindOfClass();

  return a1 & 1;
}

- (BOOL)_axIsMemoriesScrubberInStoryViewController
{
  _BOOL4 v3;

  v3 = -[AXPhotosGroupAccessibilityElement _accessibilityInStoryViewController](self, "_accessibilityInStoryViewController");
  if (v3)
    LOBYTE(v3) = -[AXPhotosGroupAccessibilityElement _axIsStoryScrubberContentLayout](self, "_axIsStoryScrubberContentLayout");
  return v3;
}

- (BOOL)_axIsMemoriesStyleSwitcherInStoryViewController
{
  _BOOL4 v3;

  v3 = -[AXPhotosGroupAccessibilityElement _accessibilityInStoryViewController](self, "_accessibilityInStoryViewController");
  if (v3)
    LOBYTE(v3) = -[AXPhotosGroupAccessibilityElement _axIsStoryStyleSwitchingFullsizeLayout](self, "_axIsStoryStyleSwitchingFullsizeLayout");
  return v3;
}

- (id)_axFilterStaleKeys:(id)a3 usingIndexSet:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDD1698], "indexSet");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v15;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(v7, "addIndex:", objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12++), "integerValue", (_QWORD)v14));
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v10);
  }

  objc_msgSend(v7, "removeIndexes:", v6);
  return v7;
}

- (int64_t)_axCompareAXPhotoElement:(id)a3 toElement:(id)a4
{
  id v5;
  id v6;
  void *v7;
  unsigned int v8;
  void *v9;
  unsigned int v10;
  int64_t v11;
  void *v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  CGFloat v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double MinY;
  double v31;
  double v33;
  double MinX;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  objc_opt_class();
  if (((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0)
    && ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_isKindOfClass() & 1) != 0))
  {
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_28;
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_26;
    if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "leaf");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v7, "safeUnsignedIntForKey:", CFSTR("spriteIndex"));

      objc_msgSend(v6, "leaf");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "safeUnsignedIntForKey:", CFSTR("spriteIndex"));

      if (v8 == v10)
      {
LABEL_17:
        _AXAssert();
        v10 = v8;
      }
    }
    else
    {
      if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_opt_isKindOfClass() & 1) == 0)
      {
LABEL_22:
        objc_msgSend(v5, "accessibilityFrame");
        v15 = v14;
        v17 = v16;
        v19 = v18;
        v21 = v20;
        objc_msgSend(v6, "accessibilityFrame");
        v23 = v22;
        v25 = v24;
        v27 = v26;
        v29 = v28;
        v35.origin.x = v15;
        v35.origin.y = v17;
        v35.size.width = v19;
        v35.size.height = v21;
        MinX = CGRectGetMinX(v35);
        v36.origin.x = v23;
        v36.origin.y = v25;
        v36.size.width = v27;
        v36.size.height = v29;
        v33 = CGRectGetMinX(v36);
        v37.origin.x = v15;
        v37.origin.y = v17;
        v37.size.width = v19;
        v37.size.height = v21;
        MinY = CGRectGetMinY(v37);
        v38.origin.x = v23;
        v38.origin.y = v25;
        v38.size.width = v27;
        v38.size.height = v29;
        v31 = CGRectGetMinY(v38);
        if (MinX >= v33)
          v11 = MinX > v33;
        else
          v11 = -1;
        if (MinY < v31)
          goto LABEL_26;
        if (MinY <= v31)
          goto LABEL_29;
LABEL_28:
        v11 = 1;
        goto LABEL_29;
      }
      objc_msgSend(v5, "group");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = objc_msgSend(v12, "safeUnsignedIntForKey:", CFSTR("subgroupIndex"));

      objc_msgSend(v6, "group");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v13, "safeUnsignedIntForKey:", CFSTR("subgroupIndex"));

      if (v8 == v10)
        goto LABEL_17;
    }
    if (v8 != -1 && v10 != -1)
    {
      if (v8 >= v10)
      {
        v11 = v8 > v10;
        goto LABEL_29;
      }
LABEL_26:
      v11 = -1;
      goto LABEL_29;
    }
    goto LABEL_22;
  }
  v11 = objc_msgSend(v5, "accessibilityCompareGeometry:", v6);
LABEL_29:

  return v11;
}

- (BOOL)canBecomeFocused
{
  return 0;
}

- (id)_accessibilityDefaultFocusGroupIdentifier
{
  return 0;
}

- (id)group
{
  return objc_loadWeakRetained(&self->_group);
}

- (void)setGroup:(id)a3
{
  objc_storeWeak(&self->_group, a3);
}

- (id)view
{
  return objc_loadWeakRetained(&self->_view);
}

- (void)setView:(id)a3
{
  objc_storeWeak(&self->_view, a3);
}

- (id)additionalScrollViewElements
{
  return self->_additionalScrollViewElements;
}

- (void)setAdditionalScrollViewElements:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_additionalScrollViewElements, 0);
  objc_destroyWeak(&self->_view);
  objc_destroyWeak(&self->_group);
}

@end

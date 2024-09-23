@implementation UIKitWebAccessibilityObjectWrapper

+ (id)safeCategoryTargetClassName
{
  return CFSTR("WebAccessibilityObjectWrapper");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axWebAreaURL
{
  JUMPOUT(0x2348C40E8);
}

- (void)_axSetWebAreaURL:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("UIPeripheralHost"), CFSTR("isOnScreen"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapperBase"), CFSTR("ariaLandmarkRoleDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathPostscripts"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("WebAccessibilityObjectWrapperBase"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityTextMarker"), CFSTR("initWithData:accessibilityObject:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("handleNotificationRelayToChrome:notificationData:"), "v", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityColorStringValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityScrollVisibleRect"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityScrollPosition"), "{CGPoint=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityScrollSize"), "{CGSize=dd}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityParentForSubview:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axAdjustableTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axButtonTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axHasTextCursorTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axHeaderTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axImageTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axLinkTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axMenuItemTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axNotEnabledTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axPopupButtonTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axSecureTextFieldTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axSearchFieldTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axTextAreaTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axSelectedTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axStaticTextTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axTabBarTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axTextOperationsAvailableTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axToggleTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axVisitedTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_axWebContentTrait"), "Q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsMathTopObject"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathBaseObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathDenominatorObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathFencedCloseString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathFencedOpenString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathNumeratorObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsComboBox"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathLineThickness"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathOverObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathRadicand"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapperBase"), CFSTR("accessibilityMathPostscriptPairs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapperBase"), CFSTR("accessibilityMathPrescriptPairs"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathRootIndexObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathSubscriptObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathSuperscriptObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathType"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMathUnderObject"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityMoveSelectionToMarker:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("arrayOfTextForTextMarkers: attributed:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilitySupportsARIAExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsExpanded"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilitySupportsARIAPressed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsPressed"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityModifySelection: increase:"), "v", "C", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsAttachmentElement"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityFindMatchingObjects:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityActivate"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityRoleDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityLandmarkAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityArticleAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityListAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityTableAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityFieldsetAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityFrameAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityTreeAncestor"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityARIAIsBusy"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityARIALiveRegionIsAtomic"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityARIALiveRegionStatus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityARIARelevantStatus"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityCanFuzzyHitTest"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityDecreaseSelection:"), "v", "C", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityElementRect"), "{CGRect={CGPoint=dd}{CGSize=dd}}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIncreaseSelection:"), "v", "C", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityPlaceholderValue"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityHasPopup"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("elementTextRange"), "{_NSRange=QQ}", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("frameForTextMarkers:"), "{CGRect={CGPoint=dd}{CGSize=dd}}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("lineEndMarkerForMarker:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("lineStartMarkerForMarker:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("positionForTextMarker:"), "q", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("selectedTextMarker"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("stringForTextMarkers:"), "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("textMarkerForPosition:"), "@", "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("textMarkerRangeForSelection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapperBase"), CFSTR("_prepareAccessibilityCall"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityReplaceRange:withText:"), "B", "{_NSRange=QQ}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityResolvedEditingStyles"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityCanSetValue"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("NSObject"), CFSTR("_accessibilityPageTextMarkerRange"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityCurrentState"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilitySortDirection"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityRequired"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsDialog"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("textRectsFromMarkers:withText:"), "@", "@", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsShowingValidationMessage"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsWebInteractiveVideo"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityToggleMuteForMedia"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityVideoEnterFullscreen"), "v", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsMediaPlaying"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsMediaMuted"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityIsStrongPasswordField"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("attributedStringForElement"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilitySetFocus:"), "v", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("misspellingTextMarkerRange:forward:"), "@", "@", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityInsertText:"), "B", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityReplaceRange:withText:"), "B", "{_NSRange=QQ}", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityIsIndeterminate"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("_accessibilityWebRoleAsString"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityBrailleLabel"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("accessibilityBrailleRoleDescription"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("WebAccessibilityObjectWrapper"), CFSTR("lineMarkersForMarker:"), "@", "@", 0);

}

+ (BOOL)_isSerializableAccessibilityElement
{
  return 1;
}

- (BOOL)_prepareAccessibilityCall
{
  UIKitWebAccessibilityObjectWrapper *v2;
  void *v3;
  objc_super v5;

  v2 = self;
  v3 = (void *)MEMORY[0x2348C4190](self, a2);
  v5.receiver = v2;
  v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  LOBYTE(v2) = -[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](&v5, sel__prepareAccessibilityCall);
  objc_autoreleasePoolPop(v3);
  return (char)v2;
}

- (id)_accessibilityParentView
{
  void *v3;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
  {
    v3 = 0;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (BOOL)_axIsWebKit2
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("IsWebKit2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIApplication")), "safeValueForKey:", CFSTR("sharedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", v5 == 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("IsWebKit2"));
  }
  v6 = objc_msgSend(v3, "BOOLValue");

  return v6;
}

- (id)_accessibilityWebPageParent
{
  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageObject](self, "_accessibilityWebPageObject");
  else
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_accessibilityRequiresContextIdConversion
{
  return 1;
}

- (unsigned)_accessibilityContextId
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  unsigned int v7;
  objc_super v9;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("contextId"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "unsignedIntValue");

    if (!v4)
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", objc_opt_class());
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v5, "contextId"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("contextId"));

      v7 = objc_msgSend(v5, "contextId");
      return v7;
    }
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return -[UIKitWebAccessibilityObjectWrapper _accessibilityContextId](&v9, sel__accessibilityContextId);
  }
  return v4;
}

- (BOOL)_axWebKitSupportsARIAExpanded
{
  unint64_t v4;
  void *v5;
  char v6;

  if ((-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilitySupportsARIAExpanded")) & 1) != 0)return 1;
  v4 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v4) != 0)
    return 0;
  -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("accessibilitySupportsARIAExpanded"));

  return v6;
}

- (id)_accessibilityResolvedEditingStyles
{
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  const __CFString *v10;
  _QWORD *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  objc_super v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v18.receiver = self;
  v18.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityResolvedEditingStyles](&v18, sel__accessibilityResolvedEditingStyles);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_opt_new();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = v2;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        if ((objc_msgSend(v9, "isEqualToString:", CFSTR("bold"), (_QWORD)v14) & 1) != 0)
        {
          v10 = CFSTR("bold");
          v11 = (_QWORD *)MEMORY[0x24BDFEAE8];
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("italic")) & 1) != 0)
        {
          v10 = CFSTR("italic");
          v11 = (_QWORD *)MEMORY[0x24BDFEB90];
        }
        else if ((objc_msgSend(v9, "isEqualToString:", CFSTR("underline")) & 1) != 0)
        {
          v10 = CFSTR("underline");
          v11 = (_QWORD *)MEMORY[0x24BDFECD8];
        }
        else
        {
          if (!objc_msgSend(v9, "isEqualToString:", CFSTR("fontsize")))
            continue;
          v10 = CFSTR("fontsize");
          v11 = (_QWORD *)MEMORY[0x24BDFEB50];
        }
        objc_msgSend(v4, "objectForKeyedSubscript:", v10);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKeyedSubscript:", v12, *v11);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v19, 16);
    }
    while (v6);
  }

  return v3;
}

- (unint64_t)_accessibilityAutomationType
{
  unint64_t v3;
  void *v5;
  uint64_t v6;
  objc_super v7;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & v3) != 0)
    return 42;
  if ((*MEMORY[0x24BDF73C8] & v3) != 0)
    return 43;
  if ((*MEMORY[0x24BDF7410] & v3) != 0)
    return 48;
  if ((*MEMORY[0x24BDF73B0] & v3) != 0)
    return 9;
  -[UIKitWebAccessibilityObjectWrapper safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityColorStringValue"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "length");

  if (v6)
    return 67;
  v7.receiver = self;
  v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityAutomationType](&v7, sel__accessibilityAutomationType);
}

- (BOOL)_axWebKitIsAriaExpanded
{
  unint64_t v3;
  void *v4;
  char v5;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v3) != 0)
    return -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsExpanded"));
  -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsExpanded"));

  return v5;
}

- (id)_accessibilityCurrentStatus
{
  unint64_t v3;
  UIKitWebAccessibilityObjectWrapper *v4;
  UIKitWebAccessibilityObjectWrapper *v5;
  id v6;
  UIKitWebAccessibilityObjectWrapper *v8;
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  id v14;

  v9 = 0;
  v10 = &v9;
  v11 = 0x3032000000;
  v12 = __Block_byref_object_copy_;
  v13 = __Block_byref_object_dispose_;
  v14 = 0;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v3) != 0)
  {
    v4 = self;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
    v4 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v8 = v5;
    AXPerformSafeBlock();

  }
  v6 = (id)v10[5];

  _Block_object_dispose(&v9, 8);
  return v6;
}

void __65__UIKitWebAccessibilityObjectWrapper__accessibilityCurrentStatus__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityCurrentState");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (id)accessibilitySortDirection
{
  id v3;
  void *v4;
  id v5;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  objc_super v10;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t);
  void *v14;
  UIKitWebAccessibilityObjectWrapper *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;

  v17 = 0;
  v18 = &v17;
  v19 = 0x3032000000;
  v20 = __Block_byref_object_copy_;
  v21 = __Block_byref_object_dispose_;
  v22 = 0;
  v11 = MEMORY[0x24BDAC760];
  v12 = 3221225472;
  v13 = __64__UIKitWebAccessibilityObjectWrapper_accessibilitySortDirection__block_invoke;
  v14 = &unk_24FF867B0;
  v15 = self;
  v16 = &v17;
  AXPerformSafeBlock();
  v3 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  if (v3)
  {
    v10.receiver = self;
    v10.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilitySortDirection](&v10, sel_accessibilitySortDirection);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[UIKitWebAccessibilityObjectWrapper _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IgnoreTreeForSortDirection"))|| v4|| (-[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer"), (v7 = objc_claimAutoreleasedReturnValue()) == 0))
    {
LABEL_4:
      v5 = v4;
    }
    else
    {
      v8 = (void *)v7;
      while (1)
      {
        objc_msgSend(v8, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IgnoreTreeForRequired"));
        objc_msgSend(v8, "accessibilitySortDirection");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "length"))
          break;
        objc_msgSend(v8, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("IgnoreTreeForRequired"));
        objc_msgSend(v8, "accessibilityContainer");
        v9 = objc_claimAutoreleasedReturnValue();

        v8 = (void *)v9;
        if (!v9)
          goto LABEL_4;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

void __64__UIKitWebAccessibilityObjectWrapper_accessibilitySortDirection__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityTableAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)accessibilityRequired
{
  unsigned __int8 v3;
  char v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityRequired](&v9, sel_accessibilityRequired);
  v4 = -[UIKitWebAccessibilityObjectWrapper _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("IgnoreTreeForRequired"));
  LOBYTE(v5) = v4 ^ 1 | v3;
  if ((v4 & 1) == 0 && (v3 & 1) == 0)
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      while (1)
      {
        objc_msgSend(v6, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("IgnoreTreeForRequired"));
        if ((objc_msgSend(v6, "accessibilityRequired") & 1) != 0)
          break;
        objc_msgSend(v6, "_accessibilitySetBoolValue:forKey:", 0, CFSTR("IgnoreTreeForRequired"));
        objc_msgSend(v6, "accessibilityContainer");
        v7 = objc_claimAutoreleasedReturnValue();

        v6 = (void *)v7;
        if (!v7)
        {
          LOBYTE(v5) = 0;
          return v5;
        }
      }

      LOBYTE(v5) = 1;
    }
  }
  return v5;
}

- (BOOL)_axWebKitSupportsARIAPressed
{
  unint64_t v4;
  void *v5;
  char v6;

  if ((-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilitySupportsARIAPressed")) & 1) != 0)return 1;
  v4 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v4) != 0)
    return 0;
  -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("accessibilitySupportsARIAPressed"));

  return v6;
}

- (id)accessibilityLinkRelationshipType
{
  unint64_t v3;
  UIKitWebAccessibilityObjectWrapper *v4;
  UIKitWebAccessibilityObjectWrapper *v5;
  void *v6;
  objc_super v8;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v3) == 0)
  {
    -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
    v4 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();
    if (v4 != self)
    {
      v5 = v4;
      -[UIKitWebAccessibilityObjectWrapper accessibilityLinkRelationshipType](v4, "accessibilityLinkRelationshipType");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      return v6;
    }

  }
  v8.receiver = self;
  v8.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityLinkRelationshipType](&v8, sel_accessibilityLinkRelationshipType);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)_axWebKitIsAriaPressed
{
  unint64_t v3;
  void *v4;
  char v5;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v3) != 0)
    return -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsPressed"));
  -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "safeBoolForKey:", CFSTR("accessibilityIsPressed"));

  return v5;
}

- (int64_t)_accessibilityExpandedStatus
{
  objc_super v4;

  if (-[UIKitWebAccessibilityObjectWrapper _axWebKitSupportsARIAExpanded](self, "_axWebKitSupportsARIAExpanded"))
  {
    if (-[UIKitWebAccessibilityObjectWrapper _axWebKitIsAriaExpanded](self, "_axWebKitIsAriaExpanded"))
      return 1;
    else
      return 2;
  }
  else
  {
    v4.receiver = self;
    v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return -[UIKitWebAccessibilityObjectWrapper _accessibilityExpandedStatus](&v4, sel__accessibilityExpandedStatus);
  }
}

- (id)_accessibilityRoleDescription
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t);
  void *v12;
  UIKitWebAccessibilityObjectWrapper *v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;

  if (!-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x3032000000;
  v18 = __Block_byref_object_copy_;
  v19 = __Block_byref_object_dispose_;
  v20 = 0;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v9 = MEMORY[0x24BDAC760];
    v10 = 3221225472;
    v11 = __67__UIKitWebAccessibilityObjectWrapper__accessibilityRoleDescription__block_invoke;
    v12 = &unk_24FF867B0;
    v13 = self;
    v14 = &v15;
    AXPerformSafeBlock();
  }
  -[UIKitWebAccessibilityObjectWrapper safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityBrailleRoleDescription"), v9, v10, v11, v12, v13, v14);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v16[5];
    if (!v4)
    {
      v16[5] = (uint64_t)CFSTR(" ");

      v4 = v16[5];
    }
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setAttribute:forKey:", v3, *MEMORY[0x24BDFEAF8]);
    v6 = (void *)v16[5];
    v16[5] = (uint64_t)v5;

  }
  v7 = (id)v16[5];

  _Block_object_dispose(&v15, 8);
  return v7;
}

void __67__UIKitWebAccessibilityObjectWrapper__accessibilityRoleDescription__block_invoke(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_opt_class();
  objc_msgSend(*(id *)(a1 + 32), "accessibilityRoleDescription");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v3 = objc_claimAutoreleasedReturnValue();

  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

- (_NSRange)_accessibilitySelectedTextRange
{
  id v2;
  NSUInteger v3;
  objc_super v4;
  _NSRange result;

  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  v2 = -[UIKitWebAccessibilityObjectWrapper _accessibilitySelectedTextRange](&v4, sel__accessibilitySelectedTextRange);
  if (v2 == (id)0x7FFFFFFFFFFFFFFFLL)
    v2 = 0;
  result.length = v3;
  result.location = (NSUInteger)v2;
  return result;
}

- (id)_accessibilityWebPageObject
{
  return (id)-[UIKitWebAccessibilityObjectWrapper _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_520, 0);
}

uint64_t __65__UIKitWebAccessibilityObjectWrapper__accessibilityWebPageObject__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("WKAccessibilityWebPageObject"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_accessibilityWebDocumentView
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  void *v12;
  void *v13;
  uint64_t v14;
  objc_super v15;
  char v16;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    return 0;
  v16 = 0;
  objc_opt_class();
  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXWebDocumentViewKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAccessibilityCastAsClass();
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    v6 = v5;
    goto LABEL_22;
  }
  NSClassFromString(CFSTR("UIWebDocumentView"));
  NSClassFromString(CFSTR("WebView"));
  v15.receiver = self;
  v15.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](&v15, sel__accessibilityWebDocumentView);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_20;
  v9 = v7;
  while (1)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v10 = v9;

      v8 = v10;
    }
    if ((objc_opt_isKindOfClass() & 1) == 0)
      break;
    objc_msgSend(v9, "accessibilityContainer");
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_13:
    v12 = (void *)v11;

    v9 = v12;
    if (!v12)
    {
      if (!v8)
        goto LABEL_20;
      goto LABEL_17;
    }
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v9, "safeValueForKey:", CFSTR("superview"));
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_13;
  }

  if (!v8)
    goto LABEL_20;
LABEL_17:
  objc_msgSend(v8, "_accessibilityValueForKey:", CFSTR("AXDocumentSeenChildren"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_accessibilitySetRetainedValue:forKey:", v13, CFSTR("AXDocumentSeenChildren"));
  }
  objc_msgSend(v13, "addObject:", self);
  -[UIKitWebAccessibilityObjectWrapper _accessibilitySetAssignedValue:forKey:](self, "_accessibilitySetAssignedValue:forKey:", v8, CFSTR("AXWebDocumentViewKey"));

LABEL_20:
  v16 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v14 = objc_claimAutoreleasedReturnValue();
  if (v16)
    abort();
  v6 = (id)v14;

LABEL_22:
  return v6;
}

- (BOOL)_accessibilityIsFrameOutOfBounds
{
  return 0;
}

- (id)_accessibilityColorDescription
{
  void *v2;
  void *v3;
  void *v4;
  int v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  -[UIKitWebAccessibilityObjectWrapper safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityColorStringValue"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "componentsSeparatedByString:", CFSTR(" "));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 5)
  {
    objc_msgSend(v3, "objectAtIndexedSubscript:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", CFSTR("rgb"));

    v6 = 0;
    if (v5)
    {
      v7 = (void *)MEMORY[0x24BDF6950];
      objc_msgSend(v3, "objectAtIndexedSubscript:", 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "doubleValue");
      v10 = v9;
      objc_msgSend(v3, "objectAtIndexedSubscript:", 2);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "doubleValue");
      v13 = v12;
      objc_msgSend(v3, "objectAtIndexedSubscript:", 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "doubleValue");
      v16 = v15;
      objc_msgSend(v3, "objectAtIndexedSubscript:", 4);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "doubleValue");
      objc_msgSend(v7, "colorWithRed:green:blue:alpha:", v10, v13, v16, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityContainer
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  objc_super v8;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityContainer"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityUserDefinedContainer](self, "accessibilityUserDefinedContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
    {
      v8.receiver = self;
      v8.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](&v8, sel_accessibilityContainer);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    objc_msgSend(*v4, "setObject:forKeyedSubscript:", v6, v3);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityDataDetectorScheme:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;

  y = a3.y;
  x = a3.x;
  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageObject](self, "_accessibilityWebPageObject");
  else
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityDataDetectorScheme:", x, y);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (BOOL)_axIsWK2DataDetectorLink
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  if (!-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    return 0;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & ~v3) != 0)
    return 0;
  -[UIKitWebAccessibilityObjectWrapper accessibilityURL](self, "accessibilityURL");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "absoluteString");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hasPrefix:", CFSTR("x-apple-data-detectors:"));

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (BOOL)isAccessibilityElement
{
  void *v3;
  int PossiblyNilObjectForKey;
  id v5;
  void *v6;
  uint64_t v7;
  int v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  UIKitWebAccessibilityObjectWrapper *v14;
  UIKitWebAccessibilityObjectWrapper *v15;
  UIKitWebAccessibilityObjectWrapper *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  uint64_t v24;
  double v25;
  double v26;
  void *v27;
  void *v28;
  objc_super v30;
  uint64_t v31;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_axObjWrapperIsElement"), self);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v31 = 0;
    PossiblyNilObjectForKey = _AXServerCacheGetPossiblyNilObjectForKey();
    v5 = 0;
    v6 = v5;
    if (PossiblyNilObjectForKey)
    {
      LOBYTE(v7) = objc_msgSend(v5, "BOOLValue");
LABEL_29:

      return v7;
    }
    v30.receiver = self;
    v30.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    v8 = -[UIKitWebAccessibilityObjectWrapper isAccessibilityElement](&v30, sel_isAccessibilityElement);
    v9 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    if ((v8 & 1) != 0)
    {
LABEL_6:
      LODWORD(v10) = 1;
      goto LABEL_23;
    }
    v11 = *MEMORY[0x24BDF73D8];
    if ((*MEMORY[0x24BDF73D8] & v9) != 0)
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "accessibilityTraits") & v11;

      if (!v13)
      {
        v14 = self;
        v15 = v14;
        while (v15
             && -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](v15, "accessibilityElementCount") == 1)
        {
          -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](v15, "accessibilityElementAtIndex:", 0);
          v16 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();

          v15 = v16;
          if (-[UIKitWebAccessibilityObjectWrapper _accessibilityIsFrameOutOfBounds](v16, "_accessibilityIsFrameOutOfBounds"))
          {
            LODWORD(v10) = 1;
            -[UIKitWebAccessibilityObjectWrapper setIsAccessibilityElement:](v14, "setIsAccessibilityElement:", 1);

            goto LABEL_23;
          }
        }

      }
      -[UIKitWebAccessibilityObjectWrapper accessibilityLabel](self, "accessibilityLabel");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v17, "length");

      if (!v10)
        goto LABEL_23;
      v18 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount");
      if (v18 < 1)
        goto LABEL_6;
      v19 = v18;
      v20 = 0;
      while (1)
      {
        -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        if (v21)
        {
          v22 = v21;
          objc_msgSend(v21, "accessibilityLabel");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = objc_msgSend(v23, "length");

          if (v24)
            break;
        }
        if (v19 == ++v20)
          goto LABEL_6;
      }
    }
    LODWORD(v10) = 0;
LABEL_23:
    -[UIKitWebAccessibilityObjectWrapper accessibilityElementRect](self, "accessibilityElementRect");
    v7 = 0;
    if (v26 != 0.0 && v25 != 0.0)
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityMathEquationRootObject](self, "_accessibilityMathEquationRootObject");
      v27 = (void *)objc_claimAutoreleasedReturnValue();

      if (v27)
        v7 = 0;
      else
        v7 = v10;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v7);
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    _AXServerCacheInsertPossiblyNilObjectForKey();

    goto LABEL_29;
  }
  LOBYTE(v7) = 0;
  return v7;
}

- (id)_axAncestorTypes
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  UIKitWebAccessibilityObjectWrapper *v13;
  uint64_t v14;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  uint64_t (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  id v21;
  uint64_t v22;
  uint64_t v23;
  void (*v24)(uint64_t);
  void *v25;
  UIKitWebAccessibilityObjectWrapper *v26;
  uint64_t *v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t);
  void *v37;
  UIKitWebAccessibilityObjectWrapper *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  uint64_t (*v43)(uint64_t, uint64_t);
  void (*v44)(uint64_t);
  id v45;
  uint64_t v46;
  uint64_t v47;
  void (*v48)(uint64_t);
  void *v49;
  UIKitWebAccessibilityObjectWrapper *v50;
  uint64_t *v51;
  uint64_t v52;
  uint64_t *v53;
  uint64_t v54;
  uint64_t (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  id v57;
  uint64_t v58;
  uint64_t v59;
  void (*v60)(uint64_t);
  void *v61;
  UIKitWebAccessibilityObjectWrapper *v62;
  uint64_t *v63;
  uint64_t v64;
  uint64_t *v65;
  uint64_t v66;
  uint64_t (*v67)(uint64_t, uint64_t);
  void (*v68)(uint64_t);
  id v69;
  uint64_t v70;
  uint64_t v71;
  void (*v72)(uint64_t);
  void *v73;
  UIKitWebAccessibilityObjectWrapper *v74;
  uint64_t *v75;
  uint64_t v76;
  uint64_t *v77;
  uint64_t v78;
  uint64_t (*v79)(uint64_t, uint64_t);
  void (*v80)(uint64_t);
  id v81;
  uint64_t v82;
  uint64_t v83;
  void (*v84)(uint64_t);
  void *v85;
  UIKitWebAccessibilityObjectWrapper *v86;
  uint64_t *v87;
  uint64_t v88;
  uint64_t *v89;
  uint64_t v90;
  uint64_t (*v91)(uint64_t, uint64_t);
  void (*v92)(uint64_t);
  id v93;
  uint64_t v94;
  uint64_t v95;
  void (*v96)(uint64_t);
  void *v97;
  UIKitWebAccessibilityObjectWrapper *v98;
  uint64_t *v99;
  uint64_t v100;
  uint64_t *v101;
  uint64_t v102;
  uint64_t (*v103)(uint64_t, uint64_t);
  void (*v104)(uint64_t);
  id v105;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXContainerTypes"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("AXContainerTypes"));
    v100 = 0;
    v101 = &v100;
    v102 = 0x3032000000;
    v103 = __Block_byref_object_copy_;
    v104 = __Block_byref_object_dispose_;
    v105 = 0;
    v4 = MEMORY[0x24BDAC760];
    v94 = MEMORY[0x24BDAC760];
    v95 = 3221225472;
    v96 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke;
    v97 = &unk_24FF867B0;
    v98 = self;
    v99 = &v100;
    AXPerformSafeBlock();
    v5 = v101[5];
    if (v5)
      objc_msgSend(v3, "setObject:forKey:", v5, &unk_24FF8C2D0);
    v88 = 0;
    v89 = &v88;
    v90 = 0x3032000000;
    v91 = __Block_byref_object_copy_;
    v92 = __Block_byref_object_dispose_;
    v93 = 0;
    v82 = v4;
    v83 = 3221225472;
    v84 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_552;
    v85 = &unk_24FF867B0;
    v87 = &v88;
    v86 = self;
    AXPerformSafeBlock();
    v6 = v89[5];
    if (v6)
      objc_msgSend(v3, "setObject:forKey:", v6, &unk_24FF8C2E8);
    v76 = 0;
    v77 = &v76;
    v78 = 0x3032000000;
    v79 = __Block_byref_object_copy_;
    v80 = __Block_byref_object_dispose_;
    v81 = 0;
    v70 = v4;
    v71 = 3221225472;
    v72 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_554;
    v73 = &unk_24FF867B0;
    v75 = &v76;
    v74 = self;
    AXPerformSafeBlock();
    v7 = v77[5];
    if (v7)
      objc_msgSend(v3, "setObject:forKey:", v7, &unk_24FF8C300);
    v64 = 0;
    v65 = &v64;
    v66 = 0x3032000000;
    v67 = __Block_byref_object_copy_;
    v68 = __Block_byref_object_dispose_;
    v69 = 0;
    v58 = v4;
    v59 = 3221225472;
    v60 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_556;
    v61 = &unk_24FF867B0;
    v62 = self;
    v63 = &v64;
    AXPerformSafeBlock();
    v8 = v65[5];
    if (v8)
      objc_msgSend(v3, "setObject:forKey:", v8, &unk_24FF8C318);
    v52 = 0;
    v53 = &v52;
    v54 = 0x3032000000;
    v55 = __Block_byref_object_copy_;
    v56 = __Block_byref_object_dispose_;
    v57 = 0;
    v46 = v4;
    v47 = 3221225472;
    v48 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_558;
    v49 = &unk_24FF867B0;
    v50 = self;
    v51 = &v52;
    AXPerformSafeBlock();
    v9 = v53[5];
    if (v9)
      objc_msgSend(v3, "setObject:forKey:", v9, &unk_24FF8C330);
    v40 = 0;
    v41 = &v40;
    v42 = 0x3032000000;
    v43 = __Block_byref_object_copy_;
    v44 = __Block_byref_object_dispose_;
    v45 = 0;
    v34 = v4;
    v35 = 3221225472;
    v36 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_560;
    v37 = &unk_24FF867B0;
    v38 = self;
    v39 = &v40;
    AXPerformSafeBlock();
    v10 = v41[5];
    if (v10)
      objc_msgSend(v3, "setObject:forKey:", v10, &unk_24FF8C348);
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy_;
    v32 = __Block_byref_object_dispose_;
    v33 = 0;
    v22 = v4;
    v23 = 3221225472;
    v24 = __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_562;
    v25 = &unk_24FF867B0;
    v26 = self;
    v27 = &v28;
    AXPerformSafeBlock();
    v11 = v29[5];
    if (v11)
      objc_msgSend(v3, "setObject:forKey:", v11, &unk_24FF8C360);
    v16 = 0;
    v17 = &v16;
    v18 = 0x3032000000;
    v19 = __Block_byref_object_copy_;
    v20 = __Block_byref_object_dispose_;
    v21 = 0;
    AXPerformSafeBlock();
    v12 = v17[5];
    if (v12)
      objc_msgSend(v3, "setObject:forKey:", v12, &unk_24FF8C378, v4, 3221225472, __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_564, &unk_24FF867B0, self, &v16);
    v13 = self;
    if (v13)
    {
      do
      {
        NSClassFromString(CFSTR("WebAccessibilityObjectWrapper"));
        if ((objc_opt_isKindOfClass() & 1) == 0)
          break;
        if (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](v13, "safeBoolForKey:", CFSTR("accessibilityIsDialog")))
        {
          objc_msgSend(v3, "setObject:forKey:", v13, &unk_24FF8C390);
          break;
        }
        -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](v13, "accessibilityContainer");
        v14 = objc_claimAutoreleasedReturnValue();

        v13 = (UIKitWebAccessibilityObjectWrapper *)v14;
      }
      while (v14);
    }

    _Block_object_dispose(&v16, 8);
    _Block_object_dispose(&v28, 8);

    _Block_object_dispose(&v40, 8);
    _Block_object_dispose(&v52, 8);

    _Block_object_dispose(&v64, 8);
    _Block_object_dispose(&v76, 8);

    _Block_object_dispose(&v88, 8);
    _Block_object_dispose(&v100, 8);

  }
  return v3;
}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityListAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_552(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityDescriptionListAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_554(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityTableAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_556(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityLandmarkAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_558(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityArticleAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_560(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFieldsetAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_562(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityFrameAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __54__UIKitWebAccessibilityObjectWrapper__axAncestorTypes__block_invoke_564(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityTreeAncestor");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityContainerTypes
{
  void *v3;
  void *v4;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _axAncestorTypes](self, "_axAncestorTypes");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "allKeys");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (BOOL)_accessibilityIsGroupedParent
{
  objc_super v4;

  if (_accessibilityIsGroupedParent_onceToken != -1)
    dispatch_once(&_accessibilityIsGroupedParent_onceToken, &__block_literal_global_567);
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityIsGroupedParent](&v4, sel__accessibilityIsGroupedParent);
}

void __67__UIKitWebAccessibilityObjectWrapper__accessibilityIsGroupedParent__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", &unk_24FF8CA40);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_accessibilityIsGroupedParent_predicateSet;
  _accessibilityIsGroupedParent_predicateSet = v0;

}

- (BOOL)_accessibilityIsDataEmpty:(id)a3
{
  id v3;
  _BYTE *v4;
  unint64_t v5;
  BOOL v6;
  uint64_t v7;
  unint64_t v8;

  v3 = objc_retainAutorelease(a3);
  v4 = (_BYTE *)objc_msgSend(v3, "bytes");
  v5 = objc_msgSend(v3, "length");
  if (v5)
  {
    if (*v4)
    {
      v6 = 0;
    }
    else
    {
      v7 = 1;
      do
      {
        v8 = v7;
        if (v5 == v7)
          break;
        ++v7;
      }
      while (!v4[v8]);
      v6 = v8 >= v5;
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

- (id)_accessibilityConvertDataArrayToTextMarkerArray:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  uint64_t v9;
  id v10;
  id v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  id v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v19 = 0u;
    v20 = 0u;
    v5 = v4;
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    if (v6)
    {
      v7 = *(_QWORD *)v20;
      do
      {
        for (i = 0; i != v6; ++i)
        {
          if (*(_QWORD *)v20 != v7)
            objc_enumerationMutation(v5);
          v9 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * i);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0
            && !-[UIKitWebAccessibilityObjectWrapper _accessibilityIsDataEmpty:](self, "_accessibilityIsDataEmpty:", v9))
          {
            v13 = 0;
            v14 = &v13;
            v15 = 0x3032000000;
            v16 = __Block_byref_object_copy_;
            v17 = __Block_byref_object_dispose_;
            v18 = 0;
            AXPerformSafeBlock();
            v10 = (id)v14[5];
            _Block_object_dispose(&v13, 8);

            if (v10)
              objc_msgSend(v12, "addObject:", v10);

          }
        }
        v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
      }
      while (v6);
    }

  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __86__UIKitWebAccessibilityObjectWrapper__accessibilityConvertDataArrayToTextMarkerArray___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_allocWithZone(NSClassFromString(CFSTR("WebAccessibilityTextMarker"))), "initWithData:accessibilityObject:", a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityConvertTextMarkersToDataArray:(id)a3
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v13;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v13 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * v9), "safeValueForKey:", CFSTR("dataRepresentation"), (_QWORD)v12);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
          objc_msgSend(v4, "addObject:", v10);

        ++v9;
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v7);
  }

  return v4;
}

- (id)_accessibilityObjectForTextMarker:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v4 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v4, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "lastObject");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper accessibilityObjectForTextMarker:](self, "accessibilityObjectForTextMarker:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_accessibilityTextRectsForSpeakThisStringRange:(_NSRange)a3 string:(id)a4 wantsSentences:(BOOL)a5
{
  NSUInteger length;
  NSUInteger location;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  NSObject *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  uint64_t v29;
  id v30;
  NSObject *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  void *v40;
  uint64_t v42;
  uint64_t v43;
  void (*v44)(uint64_t);
  void *v45;
  UIKitWebAccessibilityObjectWrapper *v46;
  id v47;
  uint64_t v48;
  uint64_t *v49;
  uint64_t v50;
  uint64_t (*v51)(uint64_t, uint64_t);
  void (*v52)(uint64_t);
  id v53;
  objc_super v54;
  void *v55;
  void *v56;
  _QWORD v57[3];

  length = a3.length;
  location = a3.location;
  v57[2] = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  if ((objc_opt_respondsToSelector() & 1) != 0 && objc_msgSend(v8, "length"))
  {
    v48 = 0;
    v49 = &v48;
    v50 = 0x3032000000;
    v51 = __Block_byref_object_copy_;
    v52 = __Block_byref_object_dispose_;
    v53 = 0;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:", location);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:", location + length);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v9 && v10)
    {
      AXLogSpeakScreen();
      v12 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:].cold.3();

      objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "stringByTrimmingCharactersInSet:", v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "stringByTrimmingCharactersInSet:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v16, "hasSuffix:", CFSTR(","))
        && (unint64_t)objc_msgSend(v16, "length") >= 2)
      {
        objc_msgSend(v16, "substringToIndex:", objc_msgSend(v16, "length") - 1);
        v17 = objc_claimAutoreleasedReturnValue();

        v16 = (void *)v17;
      }
      v57[0] = v9;
      v57[1] = v11;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v57, 2);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v18);
      v19 = (void *)objc_claimAutoreleasedReturnValue();

      v42 = MEMORY[0x24BDAC760];
      v43 = 3221225472;
      v44 = __107__UIKitWebAccessibilityObjectWrapper__accessibilityTextRectsForSpeakThisStringRange_string_wantsSentences___block_invoke;
      v45 = &unk_24FF86860;
      v46 = self;
      v47 = v19;
      v8 = v16;
      AXPerformSafeBlock();

    }
    if (!objc_msgSend((id)v49[5], "count", v42, v43, v44, v45, v46))
    {
      if (-[UIKitWebAccessibilityObjectWrapper _isIBooks](self, "_isIBooks"))
      {
        AXLogSpeakScreen();
        v20 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:].cold.1(v20, v21, v22, v23, v24, v25, v26, v27);

        objc_msgSend(MEMORY[0x24BDD1968], "valueWithCGRect:", *MEMORY[0x24BDBF090], *(double *)(MEMORY[0x24BDBF090] + 8), *(double *)(MEMORY[0x24BDBF090] + 16), *(double *)(MEMORY[0x24BDBF090] + 24));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v56 = v28;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v56, 1);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      else
      {
        AXLogSpeakScreen();
        v31 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:].cold.2(v31, v32, v33, v34, v35, v36, v37, v38);

        v39 = (void *)MEMORY[0x24BDD1968];
        -[UIKitWebAccessibilityObjectWrapper accessibilityFrame](self, "accessibilityFrame");
        objc_msgSend(v39, "valueWithCGRect:");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v55 = v28;
        objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v55, 1);
        v29 = objc_claimAutoreleasedReturnValue();
      }
      v40 = (void *)v49[5];
      v49[5] = v29;

    }
    v30 = (id)v49[5];

    _Block_object_dispose(&v48, 8);
  }
  else
  {
    v54.receiver = self;
    v54.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityTextRectsForSpeakThisStringRange:string:](&v54, sel__accessibilityTextRectsForSpeakThisStringRange_string_, location, length, v8);
    v30 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v30;
}

void __107__UIKitWebAccessibilityObjectWrapper__accessibilityTextRectsForSpeakThisStringRange_string_wantsSentences___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x24BDAC8D0];
  if (*(_BYTE *)(a1 + 64))
  {
    objc_msgSend(*(id *)(a1 + 32), "textRectsFromMarkers:withText:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48));
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = v2;

  }
  else
  {
    v5 = (void *)MEMORY[0x24BDD1968];
    objc_msgSend(*(id *)(a1 + 32), "frameForTextMarkers:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v5, "valueWithRect:");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v10, 1);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
    v9 = *(void **)(v8 + 40);
    *(_QWORD *)(v8 + 40) = v7;

  }
}

- (CGRect)accessibilityBoundsForTextMarkers:(id)a3
{
  id v4;
  void *v5;
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
  CGRect result;

  v4 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper frameForTextMarkers:](self, "frameForTextMarkers:", v5);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;

  }
  else
  {
    v7 = *MEMORY[0x24BDBF090];
    v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v11 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v13 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }

  v14 = v7;
  v15 = v9;
  v16 = v11;
  v17 = v13;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (id)accessibilityStringForTextMarkers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper stringForTextMarkers:](self, "stringForTextMarkers:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)accessibilityArrayOfTextForTextMarkers:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper arrayOfTextForTextMarkers:attributed:](self, "arrayOfTextForTextMarkers:attributed:", v5, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (id)_accessibilityTextMarkerRangeForSelection
{
  void *v3;
  void *v4;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("textMarkerRangeForSelection"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertTextMarkersToDataArray:](self, "_accessibilityConvertTextMarkersToDataArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_accessibilityTextMarkerRange
{
  void *v3;
  void *v4;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("textMarkerRange"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertTextMarkersToDataArray:](self, "_accessibilityConvertTextMarkersToDataArray:", v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (id)_accessibilityMarkerPosition:(BOOL)a3 withMarker:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      -[UIKitWebAccessibilityObjectWrapper nextMarkerForMarker:](self, "nextMarkerForMarker:", v9);
    else
      -[UIKitWebAccessibilityObjectWrapper previousMarkerForMarker:](self, "previousMarkerForMarker:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("dataRepresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    v9 = v6;
  }

  return v10;
}

- (id)_accessibilityPreviousMarker:(id)a3
{
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityMarkerPosition:withMarker:](self, "_accessibilityMarkerPosition:withMarker:", 0, a3);
}

- (id)_accessibilityNextMarker:(id)a3
{
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityMarkerPosition:withMarker:](self, "_accessibilityMarkerPosition:withMarker:", 1, a3);
}

- (int64_t)_accessibilityLineEndPosition
{
  uint64_t v2;
  uint64_t v3;

  v2 = -[UIKitWebAccessibilityObjectWrapper _accessibilityLineRangeForPosition:](self, "_accessibilityLineRangeForPosition:", -[UIKitWebAccessibilityObjectWrapper _accessibilitySelectedTextRange](self, "_accessibilitySelectedTextRange"));
  return v2 + v3;
}

- (int64_t)_accessibilityLineStartPosition
{
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityLineRangeForPosition:](self, "_accessibilityLineRangeForPosition:", -[UIKitWebAccessibilityObjectWrapper _accessibilitySelectedTextRange](self, "_accessibilitySelectedTextRange"));
}

- (id)_accessibilityLinePosition:(BOOL)a3 withMarker:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "lastObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (a3)
      -[UIKitWebAccessibilityObjectWrapper lineStartMarkerForMarker:](self, "lineStartMarkerForMarker:", v9);
    else
      -[UIKitWebAccessibilityObjectWrapper lineEndMarkerForMarker:](self, "lineEndMarkerForMarker:", v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "safeValueForKey:", CFSTR("dataRepresentation"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
    v9 = v6;
  }

  return v10;
}

- (id)_accessibilityLineEndMarker:(id)a3
{
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityLinePosition:withMarker:](self, "_accessibilityLinePosition:withMarker:", 0, a3);
}

- (id)_accessibilityLineStartMarker:(id)a3
{
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityLinePosition:withMarker:](self, "_accessibilityLinePosition:withMarker:", 1, a3);
}

- (_NSRange)_accessibilityCharacterRangeForPosition:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  _NSRange result;

  -[UIKitWebAccessibilityObjectWrapper textMarkerForPosition:](self, "textMarkerForPosition:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[UIKitWebAccessibilityObjectWrapper nextMarkerForMarker:](self, "nextMarkerForMarker:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "axSafelyAddObject:", v4);
      objc_msgSend(v6, "axSafelyAddObject:", v5);
      v7 = -[UIKitWebAccessibilityObjectWrapper _rangeForWebTextMarkers:](self, "_rangeForWebTextMarkers:", v6);
      v9 = v8;

    }
    else
    {
      v9 = 0;
      v7 = 0x7FFFFFFFLL;
    }

  }
  else
  {
    v9 = 0;
    v7 = 0x7FFFFFFFLL;
  }

  v10 = v7;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (_NSRange)_accessibilityLineRangeForPosition:(unint64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  id v13;
  id v14;
  NSUInteger v15;
  NSUInteger v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  BOOL v22;
  id v23;
  uint64_t v24;
  id v25;
  id v26;
  void *v27;
  NSUInteger v28;
  NSUInteger v29;
  NSUInteger v30;
  id v31;
  id v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  uint64_t (*v36)(uint64_t, uint64_t);
  void (*v37)(uint64_t);
  id v38;
  objc_super v39;
  _QWORD v40[2];
  _QWORD v41[4];
  _NSRange result;

  v41[2] = *MEMORY[0x24BDAC8D0];
  -[UIKitWebAccessibilityObjectWrapper _accessibilityTextMarkerForPosition:](self, "_accessibilityTextMarkerForPosition:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (!v5)
  {
    v39.receiver = self;
    v39.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    v14 = -[UIKitWebAccessibilityObjectWrapper _accessibilityLineRangeForPosition:](&v39, sel__accessibilityLineRangeForPosition_, a3);
    v16 = v15;
    goto LABEL_22;
  }
  if (a3)
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityPreviousMarker:](self, "_accessibilityPreviousMarker:", v5);
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    if (!v7)
      goto LABEL_5;
    v41[0] = v7;
    v41[1] = v6;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v41, 2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper accessibilityStringForTextMarkers:](self, "accessibilityStringForTextMarkers:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v10, "rangeOfCharacterFromSet:", v11) == 0x7FFFFFFFFFFFFFFFLL;

    if (!v12)
      v13 = v6;
    else
LABEL_5:
      v13 = 0;

  }
  else
  {
    v13 = v5;
  }
  -[UIKitWebAccessibilityObjectWrapper _accessibilityNextMarker:](self, "_accessibilityNextMarker:", v6);
  v17 = objc_claimAutoreleasedReturnValue();
  v18 = (void *)v17;
  if (!v17)
    goto LABEL_12;
  v40[0] = v6;
  v40[1] = v17;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v40, 2);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper accessibilityStringForTextMarkers:](self, "accessibilityStringForTextMarkers:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD14A8], "newlineCharacterSet");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v20, "rangeOfCharacterFromSet:", v21) == 0x7FFFFFFFFFFFFFFFLL;

  if (v22)
  {
LABEL_12:
    v23 = 0;
    if (v13)
      goto LABEL_13;
LABEL_16:
    -[UIKitWebAccessibilityObjectWrapper _accessibilityLineStartMarker:](self, "_accessibilityLineStartMarker:", v6);
    v13 = (id)objc_claimAutoreleasedReturnValue();
    if (v23)
      goto LABEL_18;
    goto LABEL_17;
  }
  v23 = v6;
  if (!v13)
    goto LABEL_16;
LABEL_13:
  if (v23)
    goto LABEL_18;
LABEL_17:
  -[UIKitWebAccessibilityObjectWrapper _accessibilityLineEndMarker:](self, "_accessibilityLineEndMarker:", v6);
  v23 = (id)objc_claimAutoreleasedReturnValue();
LABEL_18:
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v24 = MEMORY[0x24BDAC760];
  v38 = 0;
  v32 = v6;
  AXPerformSafeBlock();
  v25 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  if (!v25)
    goto LABEL_20;
  v33 = 0;
  v34 = &v33;
  v35 = 0x3032000000;
  v36 = __Block_byref_object_copy_;
  v37 = __Block_byref_object_dispose_;
  v38 = 0;
  v31 = v25;
  AXPerformSafeBlock();
  v26 = (id)v34[5];

  _Block_object_dispose(&v33, 8);
  -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertTextMarkersToDataArray:](self, "_accessibilityConvertTextMarkersToDataArray:", v26, v24, 3221225472, __73__UIKitWebAccessibilityObjectWrapper__accessibilityLineRangeForPosition___block_invoke_2, &unk_24FF86838, self);
  v27 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v27)
  {
LABEL_20:
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "axSafelyAddObject:", v13);
    objc_msgSend(v27, "axSafelyAddObject:", v23);
  }
  v14 = (id)-[UIKitWebAccessibilityObjectWrapper _accessibilityRangeForTextMarkers:](self, "_accessibilityRangeForTextMarkers:", v27);
  v16 = v28;

LABEL_22:
  v29 = (NSUInteger)v14;
  v30 = v16;
  result.length = v30;
  result.location = v29;
  return result;
}

void __73__UIKitWebAccessibilityObjectWrapper__accessibilityLineRangeForPosition___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(objc_allocWithZone(NSClassFromString(CFSTR("WebAccessibilityTextMarker"))), "initWithData:accessibilityObject:", a1[4], a1[5]);
  v3 = *(_QWORD *)(a1[6] + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void __73__UIKitWebAccessibilityObjectWrapper__accessibilityLineRangeForPosition___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "lineMarkersForMarker:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityMarkerForPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;

  y = a3.y;
  x = a3.x;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "safeValueForKey:", CFSTR("_accessibilityDocumentView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "window");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "convertPoint:toView:", v6, x, y);
    v10 = v9;
    v12 = v11;

    objc_msgSend(v7, "convertPoint:fromView:", 0, v10, v12);
    -[UIKitWebAccessibilityObjectWrapper textMarkerForPoint:](self, "textMarkerForPoint:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "safeValueForKey:", CFSTR("dataRepresentation"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (BOOL)_isCheckBox
{
  void *v3;
  unint64_t v4;
  char v5;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXCheckBoxValue"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    -[UIKitWebAccessibilityObjectWrapper _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", (*MEMORY[0x24BDF7428] & ~v4) == 0, CFSTR("AXCheckBoxValue"));
  }
  v5 = objc_msgSend(v3, "BOOLValue");

  return v5;
}

- (float)_accessibilityActivationDelay
{
  float result;
  objc_super v4;

  if ((-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsAttachmentElement")) & 1) != 0)return 0.2;
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityActivationDelay](&v4, sel__accessibilityActivationDelay);
  return result;
}

- (void)accessibilityElementDidBecomeFocused
{
  unint64_t v3;
  void *v4;
  int v5;
  objc_super v6;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if (((*MEMORY[0x24BEBB198] | *MEMORY[0x24BEBB150]) & v3) == 0
    && (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsComboBox")) & 1) == 0
    && (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsShowingValidationMessage")) & 1) == 0)
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityAssistiveTechnologyFocusedIdentifiers](self, "accessibilityAssistiveTechnologyFocusedIdentifiers");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "containsObject:", *MEMORY[0x24BDF72D8]);

    if (v5)
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetNativeFocus](self, "_accessibilitySetNativeFocus");
      v6.receiver = self;
      v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      -[UIKitWebAccessibilityObjectWrapper accessibilityElementDidBecomeFocused](&v6, sel_accessibilityElementDidBecomeFocused);
    }
  }
}

- (BOOL)_accessibilitySupportsActivateAction
{
  unint64_t v3;
  void *v4;
  unint64_t v5;
  unint64_t v7;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73D8] & v3) != 0)
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityActivationPoint](self, "accessibilityActivationPoint");
    UIAccessibilitySceneReferencePointForScreenPoint();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityDataDetectorScheme:](self, "_accessibilityDataDetectorScheme:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
    {

      return 0;
    }
    if (-[UIKitWebAccessibilityObjectWrapper _axIsWK2DataDetectorLink](self, "_axIsWK2DataDetectorLink"))
      return 0;
  }
  v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB198] & ~v5) == 0)
    return 0;
  v7 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  return (*MEMORY[0x24BEBB150] & ~v7) != 0;
}

- (id)accessibilityPath
{
  void *v3;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (objc_opt_respondsToSelector() & 1) != 0)
  {
    v3 = (void *)-[UIKitWebAccessibilityObjectWrapper _accessibilityPath](self, "_accessibilityPath");
    if (v3)
    {
      objc_msgSend(MEMORY[0x24BDF6870], "bezierPathWithCGPath:", v3);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)accessibilityActivate
{
  int v3;
  unint64_t v4;
  void *v5;
  char v6;
  __CFString *v7;
  void *v8;
  objc_super v10;

  v3 = -[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    if (-[UIKitWebAccessibilityObjectWrapper _accessibilitySupportsActivateAction](self, "_accessibilitySupportsActivateAction"))
    {
      v4 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
      if ((*MEMORY[0x24BDF73D8] & ~v4) != 0)
      {
        if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo"))
        {
          if (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsMediaPlaying")))v7 = CFSTR("pause.video");
          else
            v7 = CFSTR("play.video");
          accessibilityLocalizedString(v7);
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          UIAccessibilitySpeakAndDoNotBeInterrupted();

        }
        LOBYTE(v3) = -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityActivate"));
      }
      else
      {
        -[UIKitWebAccessibilityObjectWrapper _axWebKitTrueLinkParent](self, "_axWebKitTrueLinkParent");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("_accessibilityActivate"));

        LOBYTE(v3) = v6;
      }
    }
    else
    {
      v10.receiver = self;
      v10.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      LOBYTE(v3) = -[UIKitWebAccessibilityObjectWrapper accessibilityActivate](&v10, sel_accessibilityActivate);
    }
  }
  return v3;
}

- (BOOL)accessibilityZoomInAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v5, x, y);
  v8 = v7;
  v10 = v9;

  LOBYTE(v6) = objc_msgSend(v5, "accessibilityZoomInAtPoint:", v8, v10);
  return (char)v6;
}

- (BOOL)accessibilityZoomOutAtPoint:(CGPoint)a3
{
  double y;
  double x;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  y = a3.y;
  x = a3.x;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "window");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "convertPoint:toView:", v5, x, y);
  v8 = v7;
  v10 = v9;

  LOBYTE(v6) = objc_msgSend(v5, "accessibilityZoomOutAtPoint:", v8, v10);
  return (char)v6;
}

- (id)accessibilityLanguage
{
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v8;
  __CFString *v9;
  __CFString *v10;
  objc_super v11;

  if ((-[UIKitWebAccessibilityObjectWrapper _accessibilityBoolValueForKey:](self, "_accessibilityBoolValueForKey:", CFSTR("InSUWebView")) & 1) != 0|| !-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    goto LABEL_10;
  }
  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("InSUWebView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("SUWebView")));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      goto LABEL_5;
    -[UIKitWebAccessibilityObjectWrapper _accessibilitySetBoolValue:forKey:](self, "_accessibilitySetBoolValue:forKey:", 1, CFSTR("InSUWebView"));
LABEL_10:
    v5 = 0;
    return v5;
  }

LABEL_5:
  v11.receiver = self;
  v11.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityLanguage](&v11, sel_accessibilityLanguage);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "length"))
  {
    if ((objc_msgSend(v4, "isEqualToString:", CFSTR(" ")) & 1) != 0)
      v5 = 0;
    else
      v5 = v4;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "accessibilityLanguage");
    v9 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    if (v9)
      v10 = v9;
    else
      v10 = CFSTR(" ");
    -[UIKitWebAccessibilityObjectWrapper setAccessibilityLanguage:](self, "setAccessibilityLanguage:", v10);

  }
  return v5;
}

- (BOOL)_isIBooks
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityIsInBookContent"));
  else
    return 0;
}

- (id)_accessibilityTextMarkerForPosition:(int64_t)a3
{
  uint64_t v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, uint64_t);
  void (*v21)(uint64_t);
  id v22;
  char v23;

  v5 = -[UIKitWebAccessibilityObjectWrapper elementTextRange](self, "elementTextRange");
  if (-[UIKitWebAccessibilityObjectWrapper _isIBooks](self, "_isIBooks"))
  {
    -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("_axStartRangeOfCurrentPage"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      v23 = 0;
      objc_opt_class();
      v17 = 0;
      v18 = &v17;
      v19 = 0x3032000000;
      v20 = __Block_byref_object_copy_;
      v21 = __Block_byref_object_dispose_;
      v22 = 0;
      v16 = v6;
      AXPerformSafeBlock();
      v7 = (id)v18[5];

      _Block_object_dispose(&v17, 8);
      __UIAccessibilityCastAsClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      if (v23)
        abort();
      -[UIKitWebAccessibilityObjectWrapper _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIWebDocumentView")));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "beginningOfDocument");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "start");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v9, "offsetFromPosition:toPosition:", v10, v11);

    }
    else
    {
      v12 = 0;
    }

  }
  else if (v5 == 0x7FFFFFFFFFFFFFFFLL)
  {
    v12 = 0;
  }
  else
  {
    v12 = v5;
  }
  -[UIKitWebAccessibilityObjectWrapper textMarkerForPosition:](self, "textMarkerForPosition:", v12 + a3);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "safeValueForKey:", CFSTR("dataRepresentation"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

void __74__UIKitWebAccessibilityObjectWrapper__accessibilityTextMarkerForPosition___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  -[objc_class wrapDOMRange:](NSClassFromString(CFSTR("UITextRangeImpl")), "wrapDOMRange:", *(_QWORD *)(a1 + 32));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (CGRect)_accessibilityBoundsForRange:(_NSRange)a3
{
  NSUInteger length;
  NSUInteger location;
  NSUInteger v6;
  void *v7;
  void *v8;
  void *v9;
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
  double v20;
  double v21;
  CGRect result;

  length = a3.length;
  location = a3.location;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = -[UIKitWebAccessibilityObjectWrapper elementTextRange](self, "elementTextRange") + location;
    -[UIKitWebAccessibilityObjectWrapper textMarkerForPosition:](self, "textMarkerForPosition:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper textMarkerForPosition:](self, "textMarkerForPosition:", v6 + length);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", v7, v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper frameForTextMarkers:](self, "frameForTextMarkers:", v9);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;

  }
  else
  {
    v11 = *MEMORY[0x24BDBF090];
    v13 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v15 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v17 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v18 = v11;
  v19 = v13;
  v20 = v15;
  v21 = v17;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (BOOL)_accessibilityIsSpeakThisElement
{
  void *v3;
  double v4;
  double v5;
  void *v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  objc_super v16;
  CGRect v17;

  if (-[UIKitWebAccessibilityObjectWrapper _isIBooks](self, "_isIBooks"))
    return 1;
  -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityScrollPosition"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pointValue");
  v5 = v4;

  if (v5 < 5.0)
    return 1;
  -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityElementRect"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "rectValue");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  v17.origin.x = v9;
  v17.origin.y = v11;
  v17.size.width = v13;
  v17.size.height = v15;
  if (CGRectGetMaxY(v17) < v5)
    return 0;
  v16.receiver = self;
  v16.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityIsSpeakThisElement](&v16, sel__accessibilityIsSpeakThisElement);
}

- (id)_accessibilitySpeakThisString
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;
  char v8;

  if (-[UIKitWebAccessibilityObjectWrapper _isIBooks](self, "_isIBooks"))
  {
    v8 = 0;
    -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("_axStartRangeOfCurrentPage"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "text");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper _accessibilitySpeakThisString](&v7, sel__accessibilitySpeakThisString);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v5;
}

- (BOOL)_accessibilitySpeakThisCanBeHighlighted
{
  return 1;
}

- (CGRect)_accessibilityConvertSystemBoundedScreenRectToContextSpace:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  objc_super v16;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  if (!-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
  {
    v16.receiver = self;
    v16.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertSystemBoundedScreenRectToContextSpace:](&v16, sel__accessibilityConvertSystemBoundedScreenRectToContextSpace_, x, y, width, height);
    x = v8;
    y = v9;
    width = v10;
    height = v11;
  }
  v12 = x;
  v13 = y;
  v14 = width;
  v15 = height;
  result.size.height = v15;
  result.size.width = v14;
  result.origin.y = v13;
  result.origin.x = v12;
  return result;
}

- (id)automationElements
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  unint64_t v8;
  unint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  UIKitWebAccessibilityObjectWrapper *v13;
  UIKitWebAccessibilityObjectWrapper *v14;
  BOOL v15;
  void *v17;
  objc_super v18;
  unint64_t v19;
  uint64_t v20;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB198] & ~v3) != 0)
  {
    v18.receiver = self;
    v18.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper automationElements](&v18, sel_automationElements);
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _axBuildAXTreeFromElement:outArray:](self, "_axBuildAXTreeFromElement:outArray:", self, v4);
    if (!objc_msgSend(v4, "count"))
    {
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper accessibilityAttributedValue](self, "accessibilityAttributedValue");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = 0;
      v20 = 0;
      v7 = objc_msgSend(v6, "length");
      if (v7)
      {
        v8 = v7;
        v9 = 0;
        v10 = (_QWORD *)MEMORY[0x24BDFEAE0];
        while (1)
        {
          objc_msgSend(v6, "attributesAtIndex:effectiveRange:", v9, &v19);
          v11 = (void *)objc_claimAutoreleasedReturnValue();
          v12 = v11;
          if (v19 == 0x7FFFFFFFFFFFFFFFLL)
            break;
          objc_msgSend(v11, "objectForKey:", *v10);
          v13 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();
          v14 = v13;
          if (v13)
            v15 = v13 == self;
          else
            v15 = 1;
          if (!v15)
            objc_msgSend(v5, "addObject:", v13);
          v19 += v20;

          v9 = v19;
          if (v19 >= v8)
            goto LABEL_15;
        }

      }
LABEL_15:
      objc_msgSend(v5, "allObjects");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObjectsFromArray:", v17);

    }
    return v4;
  }
}

- (void)_axBuildAXTreeFromElement:(id)a3 outArray:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  UIKitWebAccessibilityObjectWrapper *v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  BOOL v13;
  UIKitWebAccessibilityObjectWrapper *v14;

  v14 = (UIKitWebAccessibilityObjectWrapper *)a3;
  v6 = a4;
  v7 = v6;
  if (v14 && v6)
  {
    v8 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](v14, "accessibilityElementCount");
    v9 = v14;
    if (v8 <= 0)
    {
      v13 = -[UIKitWebAccessibilityObjectWrapper isAccessibilityElement](v14, "isAccessibilityElement");
      if (v14 != self && v13)
        objc_msgSend(v7, "addObject:", v14);
    }
    else
    {
      v10 = v8;
      if (v14 != self)
      {
        objc_msgSend(v7, "addObject:", v14);
        v9 = v14;
      }
      for (i = 0; i != v10; ++i)
      {
        -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](v9, "accessibilityElementAtIndex:", i);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKitWebAccessibilityObjectWrapper _axBuildAXTreeFromElement:outArray:](self, "_axBuildAXTreeFromElement:outArray:", v12, v7);

        v9 = v14;
      }
    }
  }

}

- (id)_accessibilityUserTestingElementBaseType
{
  unint64_t v3;
  objc_super v5;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73A0] & v3) != 0)
    return CFSTR("UISlider");
  v5.receiver = self;
  v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityUserTestingElementBaseType](&v5, sel__accessibilityUserTestingElementBaseType);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)_accessibilityDOMAttributes
{
  void *v3;
  void *v4;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6.receiver = self;
  v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityIdentifier](&v6, sel_accessibilityIdentifier);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("id"));

  return v3;
}

- (id)_accessibilityScrollAncestor
{
  void *v3;
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  double v17;
  double v18;
  void *v19;
  void *v21;
  UIKitWebAccessibilityObjectWrapper *v22;
  id obj;
  objc_super v24;
  objc_super v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t);
  void *v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  double *v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  _BYTE v44[128];
  uint64_t v45;

  v45 = *MEMORY[0x24BDAC8D0];
  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageObject](self, "_accessibilityWebPageObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityContainer");
    v4 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v22 = self;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    NSClassFromString(CFSTR("UIWebBrowserView"));
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v5, "safeValueForKey:", CFSTR("_overflowScrollViews"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v21, "count"))
      {
        -[UIKitWebAccessibilityObjectWrapper accessibilityActivationPoint](v22, "accessibilityActivationPoint");
        v7 = v6;
        v9 = v8;
        v40 = 0u;
        v41 = 0u;
        v42 = 0u;
        v43 = 0u;
        obj = v21;
        v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
        if (v10)
        {
          v11 = *(_QWORD *)v41;
LABEL_7:
          v12 = 0;
          while (1)
          {
            if (*(_QWORD *)v41 != v11)
              objc_enumerationMutation(obj);
            v13 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * v12);
            objc_msgSend(v13, "safeValueForKey:", CFSTR("_overflowContentView"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v5, "window");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v34 = 0;
            v35 = (double *)&v34;
            v36 = 0x3010000000;
            v37 = &unk_230E353F7;
            v38 = 0;
            v39 = 0;
            v26 = MEMORY[0x24BDAC760];
            v27 = 3221225472;
            v28 = __66__UIKitWebAccessibilityObjectWrapper__accessibilityScrollAncestor__block_invoke;
            v29 = &unk_24FF86888;
            v31 = &v34;
            v16 = v15;
            v30 = v16;
            v32 = v7;
            v33 = v9;
            AXPerformSafeBlock();
            v17 = v35[4];
            v18 = v35[5];

            _Block_object_dispose(&v34, 8);
            objc_msgSend(v16, "convertPoint:toView:", v14, v17, v18);
            objc_msgSend(v14, "hitTest:withEvent:", 0);
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            if (v19)
              break;

            if (v10 == ++v12)
            {
              v10 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v40, v44, 16);
              if (v10)
                goto LABEL_7;
              goto LABEL_13;
            }
          }
          v4 = v13;

          if (v4)
            goto LABEL_17;
        }
        else
        {
LABEL_13:

        }
      }
      v25.receiver = v22;
      v25.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollAncestor](&v25, sel__accessibilityScrollAncestor);
      v4 = (id)objc_claimAutoreleasedReturnValue();
LABEL_17:

    }
    else
    {

      v24.receiver = v22;
      v24.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollAncestor](&v24, sel__accessibilityScrollAncestor);
      v4 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  return v4;
}

uint64_t __66__UIKitWebAccessibilityObjectWrapper__accessibilityScrollAncestor__block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "convertDeviceToWindow:", *(double *)(a1 + 48), *(double *)(a1 + 56));
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

- (BOOL)_accessibilityAlwaysSpeakTableHeaders
{
  void *v2;
  char v3;

  -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilitySpeakTableHeaders"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEqualToString:", CFSTR("always"));

  return v3;
}

- (BOOL)_accessibilityScrollToVisible
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
  NSObject *v12;
  NSObject *v13;
  unsigned __int8 v14;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  double v31;
  CGFloat v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat v38;
  objc_super v39;
  objc_super v40;
  char v41;
  objc_super v42;
  CGRect v43;
  CGRect v44;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollAncestor](self, "_accessibilityScrollAncestor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("UIWebOverflowScrollView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityFrameForScrolling](self, "accessibilityFrameForScrolling");
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;
    AXLogScrollToVisible();
    v12 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollToVisible].cold.2(v3, self, v12);

    objc_msgSend(v3, "_accessibilityScrollToFrame:forView:", 0, v5, v7, v9, v11);
    AXLogScrollToVisible();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollToVisible].cold.1(v3, v13);

    v14 = 1;
LABEL_7:
    AXPerformBlockOnMainThreadAfterDelay();
    goto LABEL_8;
  }
  -[UIKitWebAccessibilityObjectWrapper accessibilityElementRect](self, "accessibilityElementRect");
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;
  if (-[UIKitWebAccessibilityObjectWrapper _accessibilityIsScrollDivDescendent](self, "_accessibilityIsScrollDivDescendent")|| (v14 = 1, v17 >= 0.0) && v19 >= 0.0)
  {
    v14 = 1;
    if (v21 != 0.0 && v23 != 0.0)
    {
      if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
      {
        v42.receiver = self;
        v42.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollToVisible](&v42, sel__accessibilityScrollToVisible);
      }
      else
      {
        -[UIKitWebAccessibilityObjectWrapper _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_765, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          v41 = 0;
          objc_opt_class();
          objc_msgSend(v24, "safeValueForKey:", CFSTR("_scroller"));
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          __UIAccessibilityCastAsClass();
          v26 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v26, "contentOffset");
          v28 = v27;
          v30 = v29;
          objc_msgSend(v26, "contentSize");
          v32 = v31;
          v34 = v33;
          objc_msgSend(v26, "frame");
          v44.origin.x = v35;
          v44.origin.y = v36;
          v44.size.width = v37;
          v44.size.height = v38;
          v43.origin.x = v28;
          v43.origin.y = v30;
          v43.size.width = v32;
          v43.size.height = v34;
          LODWORD(v25) = CGRectEqualToRect(v43, v44);

          if ((_DWORD)v25)
          {
            v40.receiver = self;
            v40.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
            -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollToVisible](&v40, sel__accessibilityScrollToVisible);
          }
        }
        v39.receiver = self;
        v39.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        v14 = -[UIKitWebAccessibilityObjectWrapper _accessibilityBaseScrollToVisible](&v39, sel__accessibilityBaseScrollToVisible);

      }
      goto LABEL_7;
    }
  }
LABEL_8:

  return v14;
}

uint64_t __67__UIKitWebAccessibilityObjectWrapper__accessibilityScrollToVisible__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_accessibilityIsWebDocumentView");
}

void __67__UIKitWebAccessibilityObjectWrapper__accessibilityScrollToVisible__block_invoke_2(uint64_t a1)
{
  void *v1;

  objc_msgSend(*(id *)(a1 + 32), "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIFieldEditor")));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v1)
    _UIAXDismissKeyboardIfNecessary();
}

- (CGPoint)_accessibilityScrollRectToVisible:(CGRect)a3
{
  double v3;
  double v4;
  CGPoint result;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityScrollToVisible](self, "_accessibilityScrollToVisible", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v3 = *MEMORY[0x24BDBEFB0];
  v4 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  result.y = v4;
  result.x = v3;
  return result;
}

- (BOOL)_accessibilityIsScrollDivDescendent
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  uint64_t v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  uint64_t v19;
  BOOL v20;

  if (!-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    return 0;
  -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityScrollSize"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGSizeValue");
  v5 = v4;
  v7 = v6;

  -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
  v8 = objc_claimAutoreleasedReturnValue();
  if (!v8)
    return 0;
  v9 = (void *)v8;
  v10 = *MEMORY[0x24BDBF148];
  v11 = *(double *)(MEMORY[0x24BDBF148] + 8);
  do
  {
    objc_msgSend(v9, "safeValueForKey:", CFSTR("_accessibilityScrollSize"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "CGSizeValue");
    v14 = v13;
    v16 = v15;

    if (v14 == v10 && v16 == v11)
      break;
    if (v14 != v5 || v16 != v7)
    {
      v20 = 1;
      goto LABEL_16;
    }
    objc_msgSend(v9, "accessibilityContainer");
    v19 = objc_claimAutoreleasedReturnValue();

    v9 = (void *)v19;
    v7 = v16;
    v5 = v14;
  }
  while (v19);
  v20 = 0;
LABEL_16:

  return v20;
}

- (_NSRange)_accessibilityCheckRowRangeForTrait:(unint64_t)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  UIKitWebAccessibilityObjectWrapper *v11;
  uint64_t v12;
  NSUInteger v13;
  NSUInteger v14;
  NSUInteger v15;
  _NSRange result;

  if ((a3 & ~-[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits")) != 0)
  {
    v13 = 0;
    v10 = 0x7FFFFFFFLL;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "accessibilityElementCount");
    if (v6 < 1)
    {
      v13 = 0;
      v10 = 0x7FFFFFFFLL;
    }
    else
    {
      v7 = v6;
      v8 = 0;
      v9 = 0;
      v10 = 0x7FFFFFFFLL;
      do
      {
        objc_msgSend(v5, "accessibilityElementAtIndex:", v8);
        v11 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();
        v12 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](v11, "accessibilityTraits");
        if ((v12 & a3) != 0)
          v13 = v9 + 1;
        else
          v13 = v9;
        if (v11 == self && (v12 & a3) != 0)
          v10 = v9;

        ++v8;
        v9 = v13;
      }
      while (v7 != v8);
    }

  }
  v14 = v10;
  v15 = v13;
  result.length = v15;
  result.location = v14;
  return result;
}

- (_NSRange)accessibilityRowRange
{
  id v3;
  NSUInteger v4;
  objc_super v5;
  _NSRange result;

  v3 = (id)-[UIKitWebAccessibilityObjectWrapper _accessibilityCheckRowRangeForTrait:](self, "_accessibilityCheckRowRangeForTrait:", *MEMORY[0x24BEBB188]);
  if (v3 == (id)0x7FFFFFFF)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityRowRange](&v5, sel_accessibilityRowRange);
  }
  result.length = v4;
  result.location = (NSUInteger)v3;
  return result;
}

- (BOOL)accessibilityCanFuzzyHitTest
{
  BOOL v3;
  unint64_t v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityCanFuzzyHitTest](&v6, sel_accessibilityCanFuzzyHitTest);
  if (!v3)
  {
    v4 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    if ((*MEMORY[0x24BEBB198] & v4) != 0)
      return 1;
  }
  return v3;
}

- (id)accessibilityHitTest:(CGPoint)a3
{
  double y;
  double x;
  void *v6;
  id v7;
  objc_super v9;

  y = a3.y;
  x = a3.x;
  v9.receiver = self;
  v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityHitTest:](&v9, sel_accessibilityHitTest_);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "isAccessibilityElement") & 1) != 0)
    goto LABEL_4;
  -[UIKitWebAccessibilityObjectWrapper accessibilityPostProcessHitTest:](self, "accessibilityPostProcessHitTest:", x, y);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v7, "isAccessibilityElement") & 1) == 0)
  {

LABEL_4:
    v7 = v6;
  }

  return v7;
}

- (id)_accessibilityMathEquationRootObject
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  void *v8;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("MathTopObject"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDBCEF8], "null");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3 == v4)
      v5 = 0;
    else
      v5 = v3;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      while (!objc_msgSend(v6, "safeBoolForKey:", CFSTR("accessibilityIsMathTopObject")))
      {
        objc_msgSend(v6, "accessibilityContainer");
        v7 = (id)objc_claimAutoreleasedReturnValue();

        objc_opt_class();
        v6 = v7;
        if ((objc_opt_isKindOfClass() & 1) == 0)
          goto LABEL_10;
      }
      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v6, CFSTR("MathTopObject"));
      v7 = v6;
      v5 = v7;
    }
    else
    {
      v7 = v6;
LABEL_10:
      objc_msgSend(MEMORY[0x24BDBCEF8], "null");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v8, CFSTR("MathTopObject"));

      v5 = 0;
    }

  }
  return v5;
}

- (id)accessibilityPostProcessHitTest:(CGPoint)a3
{
  CGFloat y;
  CGFloat x;
  void *v6;
  int v7;
  UIKitWebAccessibilityObjectWrapper *v8;
  void *v9;
  void *v10;
  float v11;
  float v12;
  UIKitWebAccessibilityObjectWrapper *v13;
  id v14;
  void *v15;
  Class v16;
  uint64_t v17;
  void *v18;
  id v19;
  UIKitWebAccessibilityObjectWrapper *v20;
  UIKitWebAccessibilityObjectWrapper *v21;
  _QWORD v23[4];
  id v24;
  _QWORD *v25;
  uint64_t *v26;
  Class v27;
  CGFloat v28;
  CGFloat v29;
  float v30;
  uint64_t v31;
  uint64_t *v32;
  uint64_t v33;
  uint64_t (*v34)(uint64_t, uint64_t);
  void (*v35)(uint64_t);
  id v36;
  _QWORD v37[3];
  float v38;

  y = a3.y;
  x = a3.x;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "_accessibilityBoolValueForKey:", CFSTR("AXIgnoreFuzzyHitTesting"));

  if (v7)
  {
    v8 = self;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityMathEquationRootObject](self, "_accessibilityMathEquationRootObject");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = v9;
    if (v9)
    {
      v8 = v9;
    }
    else
    {
      GSMainScreenScaleFactor();
      v12 = v11 * 100.0;
      v13 = self;
      if (fuzzyAccessibilityHitTest_hitQueue)
      {
        objc_msgSend((id)fuzzyAccessibilityHitTest_hitQueue, "removeAllObjects");
      }
      else
      {
        v14 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v15 = (void *)fuzzyAccessibilityHitTest_hitQueue;
        fuzzyAccessibilityHitTest_hitQueue = (uint64_t)v14;

      }
      v37[0] = 0;
      v37[1] = v37;
      v37[2] = 0x2020000000;
      v38 = v12;
      v31 = 0;
      v32 = &v31;
      v33 = 0x3032000000;
      v34 = __Block_byref_object_copy_;
      v35 = __Block_byref_object_dispose_;
      v36 = 0;
      objc_msgSend((id)fuzzyAccessibilityHitTest_hitQueue, "addObject:", v13);
      v16 = NSClassFromString(CFSTR("WebAccessibilityObjectWrapper"));
      v17 = MEMORY[0x24BDAC760];
      while (objc_msgSend((id)fuzzyAccessibilityHitTest_hitQueue, "count"))
      {
        objc_msgSend((id)fuzzyAccessibilityHitTest_hitQueue, "objectAtIndex:", 0);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend((id)fuzzyAccessibilityHitTest_hitQueue, "removeObjectAtIndex:", 0);
        v23[0] = v17;
        v23[1] = 3221225472;
        v23[2] = __fuzzyAccessibilityHitTest_block_invoke;
        v23[3] = &unk_24FF86B78;
        v19 = v18;
        v28 = x;
        v29 = y;
        v24 = v19;
        v25 = v37;
        v26 = &v31;
        v27 = v16;
        v30 = v12;
        objc_msgSend(v19, "accessibilityEnumerateContainerElementsUsingBlock:", v23);

      }
      v20 = (UIKitWebAccessibilityObjectWrapper *)(id)v32[5];
      _Block_object_dispose(&v31, 8);

      _Block_object_dispose(v37, 8);
      if (v20)
        v21 = v20;
      else
        v21 = v13;
      v8 = v21;

    }
  }
  return v8;
}

- (id)_accessibilityParentForSubview:(id)a3
{
  id v4;
  void *v5;
  objc_super v7;

  v4 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v7.receiver = self;
    v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper _accessibilityParentForSubview:](&v7, sel__accessibilityParentForSubview_, v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityPlaceholderValue
{
  void *v3;
  void *v4;
  objc_super v6;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityPlaceholderValue](&v6, sel_accessibilityPlaceholderValue);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "length"))
    {
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v3);
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v4, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDFEC10]);
      return v4;
    }
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_accessibilityOverridesPotentiallyAttributedAPISelector:(SEL)a3
{
  unint64_t v5;
  objc_super v6;

  if (sel_accessibilityAttributedValue == a3)
  {
    if (AXDoesRequestingClientDeserveAutomation())
    {
      return 1;
    }
    else
    {
      v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
      return (*MEMORY[0x24BEBB198] & ~v5) == 0;
    }
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return -[UIKitWebAccessibilityObjectWrapper _accessibilityOverridesPotentiallyAttributedAPISelector:](&v6, sel__accessibilityOverridesPotentiallyAttributedAPISelector_);
  }
}

- (id)accessibilityAttributedValue
{
  unint64_t v3;
  uint64_t v5;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  objc_super v11;
  _QWORD v12[2];

  if (!-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BEBB198] & ~v3) == 0 || (*MEMORY[0x24BDF7410] & v3) == *MEMORY[0x24BDF7410])
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityAttributedValueForElement](self, "_accessibilityAttributedValueForElement");
      v5 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKitWebAccessibilityObjectWrapper elementTextRange](self, "elementTextRange");
      v12[0] = 0;
      v12[1] = v8;
      -[UIKitWebAccessibilityObjectWrapper _accessibilityAttributedValueForRange:](self, "_accessibilityAttributedValueForRange:", v12);
      v5 = objc_claimAutoreleasedReturnValue();
    }
    v7 = (void *)v5;
  }
  else
  {
    v7 = 0;
  }
  if (!objc_msgSend(v7, "length"))
  {
    v11.receiver = self;
    v11.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityValue](&v11, sel_accessibilityValue);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9)
    {
      v10 = objc_msgSend(objc_alloc(MEMORY[0x24BDD1458]), "initWithString:", v9);

      v7 = (void *)v10;
    }

  }
  return v7;
}

- (id)_accessibilityAttributedValueForElement
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  UIKitWebAccessibilityObjectWrapper *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_5;
  v3 = objc_alloc(MEMORY[0x24BDD1688]);
  -[UIKitWebAccessibilityObjectWrapper attributedStringForElement](self, "attributedStringForElement");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v3, "initWithAttributedString:", v4);

  if (objc_msgSend(v5, "length") == 1)
  {
    objc_msgSend(v5, "attributesAtIndex:effectiveRange:", 0, 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "objectForKey:", *MEMORY[0x24BDFEAE0]);
    v7 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
    {

LABEL_5:
      v5 = 0;
    }
  }
  if (!objc_msgSend(v5, "length"))
  {
    v8 = objc_alloc(MEMORY[0x24BDD1688]);
    -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v8, "initWithString:", v9);

    v5 = (void *)v10;
  }
  -[UIKitWebAccessibilityObjectWrapper _accessibilityAttributedValue:](self, "_accessibilityAttributedValue:", v5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

- (id)_accessibilityAttributedValueForRange:(_NSRange *)a3
{
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  NSRange v11;
  id v12;
  void *v13;
  uint64_t v14;
  NSRange v16;

  if (a3)
  {
    v5 = -[UIKitWebAccessibilityObjectWrapper elementTextRange](self, "elementTextRange");
    if (v5 != 0x7FFFFFFFFFFFFFFFLL)
      a3->location += v5;
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      v6 = objc_alloc(MEMORY[0x24BDD1688]);
      -[UIKitWebAccessibilityObjectWrapper attributedStringForRange:](self, "attributedStringForRange:", a3->location, a3->length);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = (void *)objc_msgSend(v6, "initWithAttributedString:", v7);

    }
    else
    {
      v8 = 0;
    }
    if (!objc_msgSend(v8, "length"))
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v16.length = objc_msgSend(v10, "length");
      v16.location = 0;
      v11 = NSIntersectionRange(*a3, v16);
      if (v11.length)
      {
        v12 = objc_alloc(MEMORY[0x24BDD1688]);
        objc_msgSend(v10, "substringWithRange:", v11.location, v11.length);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = objc_msgSend(v12, "initWithString:", v13);

        v8 = (void *)v14;
      }

    }
    -[UIKitWebAccessibilityObjectWrapper _accessibilityAttributedValue:](self, "_accessibilityAttributedValue:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v9 = 0;
  }
  return v9;
}

- (id)_accessibilityAttributedValue:(id)a3
{
  id v4;

  v4 = a3;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertStyleAttributesToAccessibility:](self, "_accessibilityConvertStyleAttributesToAccessibility:", v4);
  if (!AXDoesRequestingClientDeserveAutomation())
    -[UIKitWebAccessibilityObjectWrapper _accessibilityAddMispellingsToAttributedString:](self, "_accessibilityAddMispellingsToAttributedString:", v4);
  return v4;
}

- (id)accessibilityURL
{
  unint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v9;
  objc_super v10;

  if (!-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  v4 = *MEMORY[0x24BDF73D8];
  if (((*MEMORY[0x24BDF73D8] | *MEMORY[0x24BDF73C8]) & v3) != 0
    && (-[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer"),
        (v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    v6 = (void *)v5;
    while ((objc_msgSend(v6, "accessibilityTraits") & v4) == 0)
    {
      objc_msgSend(v6, "accessibilityContainer");
      v7 = objc_claimAutoreleasedReturnValue();

      v6 = (void *)v7;
      if (!v7)
        goto LABEL_7;
    }
    objc_msgSend(v6, "accessibilityURL");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    return v9;
  }
  else
  {
LABEL_7:
    v10.receiver = self;
    v10.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityURL](&v10, sel_accessibilityURL);
    return (id)objc_claimAutoreleasedReturnValue();
  }
}

- (id)accessibilityMathRootIndexObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathRootIndexObject](&v5, sel_accessibilityMathRootIndexObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathRadicand
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathRadicand](&v5, sel_accessibilityMathRadicand);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathNumeratorObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathNumeratorObject](&v5, sel_accessibilityMathNumeratorObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathDenominatorObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathDenominatorObject](&v5, sel_accessibilityMathDenominatorObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathBaseObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathBaseObject](&v5, sel_accessibilityMathBaseObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathSubscriptObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathSubscriptObject](&v5, sel_accessibilityMathSubscriptObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathSuperscriptObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathSuperscriptObject](&v5, sel_accessibilityMathSuperscriptObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathUnderObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathUnderObject](&v5, sel_accessibilityMathUnderObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathOverObject
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathOverObject](&v5, sel_accessibilityMathOverObject);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathFencedOpenString
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathFencedOpenString](&v5, sel_accessibilityMathFencedOpenString);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathFencedCloseString
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathFencedCloseString](&v5, sel_accessibilityMathFencedCloseString);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathPostscripts
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathPostscripts](&v5, sel_accessibilityMathPostscripts);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilityMathPrescripts
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathPrescripts](&v5, sel_accessibilityMathPrescripts);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)accessibilityIsMathTopObject
{
  _BOOL4 v3;
  objc_super v5;

  v3 = -[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall");
  if (v3)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    LOBYTE(v3) = -[UIKitWebAccessibilityObjectWrapper accessibilityIsMathTopObject](&v5, sel_accessibilityIsMathTopObject);
  }
  return v3;
}

- (id)accessibilityMathType
{
  void *v3;
  objc_super v5;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityMathType](&v5, sel_accessibilityMathType);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)accessibilitySpeechHint
{
  void *v3;
  id v4;
  objc_super v6;

  if (!-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  v6.receiver = self;
  v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilitySpeechHint](&v6, sel_accessibilitySpeechHint);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;

  return v4;
}

- (id)_axWebKitTrueLinkParent
{
  UIKitWebAccessibilityObjectWrapper *v2;
  UIKitWebAccessibilityObjectWrapper *v3;
  uint64_t v4;
  UIKitWebAccessibilityObjectWrapper *v5;

  v2 = self;
  if (v2)
  {
    v3 = 0;
    v4 = *MEMORY[0x24BDF73D8];
    while ((v4 & ~-[UIKitWebAccessibilityObjectWrapper accessibilityTraits](v2, "accessibilityTraits")) == 0)
    {
      v5 = v2;

      -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](v5, "accessibilityContainer");
      v2 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();

      v3 = v5;
      if (!v2)
        goto LABEL_8;
    }
    v5 = v3;
  }
  else
  {
    v5 = 0;
  }
LABEL_8:

  return v5;
}

- (id)_accessibilityHeaderElementsForColumn:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[UIKitWebAccessibilityObjectWrapper accessibilityElementForRow:andColumn:](self, "accessibilityElementForRow:andColumn:", 0, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v25 = 0;
    objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityHeaderElements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "accessibilityColumnRange", (_QWORD)v21);
          if (a3 >= v15 && a3 - v15 < v16)
          {
            objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_accessibilityLeafDescendantsWithOptions:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v19);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_accessibilityHeaderElementsForRow:(unint64_t)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  unint64_t v15;
  unint64_t v16;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  char v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  -[UIKitWebAccessibilityObjectWrapper accessibilityElementForRow:andColumn:](self, "accessibilityElementForRow:andColumn:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    v25 = 0;
    objc_msgSend(v4, "safeValueForKey:", CFSTR("accessibilityHeaderElements"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilitySafeClass();
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v9 = v7;
    v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
    if (v10)
    {
      v11 = v10;
      v12 = *(_QWORD *)v22;
      do
      {
        for (i = 0; i != v11; ++i)
        {
          if (*(_QWORD *)v22 != v12)
            objc_enumerationMutation(v9);
          v14 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
          v15 = objc_msgSend(v14, "accessibilityRowRange", (_QWORD)v21);
          if (a3 >= v15 && a3 - v15 < v16)
          {
            objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v14, "_accessibilityLeafDescendantsWithOptions:", v18);
            v19 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v8, "axSafelyAddObjectsFromArray:", v19);
          }
        }
        v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v26, 16);
      }
      while (v11);
    }

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)accessibilityHint
{
  void *v3;
  unint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityHint](&v11, sel_accessibilityHint);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
    return v3;
  v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  v6 = *MEMORY[0x24BDF73C0] | *MEMORY[0x24BDF73D8];
  if ((v6 & v5) == 0)
    return v3;
  -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
    return v3;
  v8 = (void *)v7;
  while ((objc_msgSend(v8, "accessibilityTraits") & v6) != 0)
  {
    objc_msgSend(v8, "accessibilityHint");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v9, "length"))
    {
      objc_msgSend(v8, "accessibilityContainer");
      v10 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v10;
      v3 = v9;
      if (v10)
        continue;
    }
    goto LABEL_11;
  }
  v9 = v3;
LABEL_11:

  return v9;
}

- (id)accessibilityVisibleText
{
  unint64_t v3;
  void *v4;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDFF008] & ~v3) != 0)
  {
    v4 = 0;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (id)accessibilityValue
{
  id v3;
  unint64_t v4;
  unint64_t v5;
  int v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  unint64_t v12;
  void *v13;
  int v14;
  float v15;
  float v16;
  float v17;
  float v18;
  void *v19;
  float v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  void *v28;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityValue](&v29, sel_accessibilityValue);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v4 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  v5 = v4;
  if (v3 && (*MEMORY[0x24BEBB168] & ~v4) == 0)
  {
    v6 = -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("_accessibilityIsStrongPasswordField"));
    objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = (_QWORD *)MEMORY[0x24BDFEC58];
    if (v6)
      v9 = (_QWORD *)MEMORY[0x24BDFEBB8];
    objc_msgSend(v7, "setAttribute:forKey:", *MEMORY[0x24BDBD270], *v9);

    v3 = v8;
  }
  if ((*MEMORY[0x24BDF7428] & ~v5) == 0
    && ((objc_msgSend(v3, "isEqualToString:", CFSTR("1")) & 1) != 0
     || (objc_msgSend(v3, "isEqualToString:", CFSTR("0")) & 1) != 0
     || objc_msgSend(v3, "isEqualToString:", CFSTR("2"))))
  {
    v10 = v3;
    v3 = v10;
LABEL_17:
    v11 = v10;
    goto LABEL_34;
  }
  if ((objc_opt_respondsToSelector() & 1) != 0
    && -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsIndeterminate")))
  {
    accessibilityLocalizedString(CFSTR("indeterminate.status"));
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  if (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsAttachmentElement"))&& objc_msgSend(v3, "length"))
  {
    objc_msgSend(v3, "floatValue");
    AXFormatFloatWithPercentage();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_17;
  }
  v12 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDF73A0] & v12) != 0 && objc_msgSend(v3, "length"))
  {
    objc_msgSend(MEMORY[0x24BDD17A8], "scannerWithString:", v3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v13, "scanFloat:", 0))
    {
      v14 = objc_msgSend(v13, "isAtEnd");

      if (!v14)
        goto LABEL_26;
      objc_msgSend(v3, "floatValue");
      if (v15 == 0.0)
        goto LABEL_26;
      objc_msgSend(v3, "floatValue");
      v17 = roundf(v16);
      objc_msgSend(v3, "floatValue");
      if (v17 != v18)
        goto LABEL_26;
      v19 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v3, "floatValue");
      objc_msgSend(v19, "stringWithFormat:", CFSTR("%.0f"), v20);
      v13 = v3;
      v3 = (id)objc_claimAutoreleasedReturnValue();
    }

  }
LABEL_26:
  if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo")
    && objc_msgSend(v3, "length"))
  {
    v21 = (void *)MEMORY[0x24BDD17C8];
    accessibilityLocalizedString(CFSTR("video.current.time"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "stringWithFormat:", v22, v3);
    v23 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v23;
  }
  if (!objc_msgSend(v3, "length"))
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityPlaceholderValue](self, "accessibilityPlaceholderValue");
    v24 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v24;
  }
  -[UIKitWebAccessibilityObjectWrapper _accessibilityColorDescription](self, "_accessibilityColorDescription");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  if (v25)
  {
    AXColorStringForColor();
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v26 = objc_claimAutoreleasedReturnValue();

    v3 = (id)v26;
  }
  v3 = v3;

  v11 = v3;
LABEL_34:

  return v11;
}

- (NSString)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CGRect v10;

  v3 = (void *)MEMORY[0x24BDD17C8];
  v4 = objc_opt_class();
  -[UIKitWebAccessibilityObjectWrapper accessibilityLabel](self, "accessibilityLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper accessibilityFrame](self, "accessibilityFrame");
  NSStringFromCGRect(v10);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%p] L:[%@] V:[%@] F:[%@]"), v4, self, v5, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)ariaLandmarkRoleDescription
{
  unint64_t v3;
  void *v4;
  uint64_t v5;
  void *v6;
  objc_super v8;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDFEF00] & v3) != 0
    || (-[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityRoleDescription")), v4 = (void *)objc_claimAutoreleasedReturnValue(), v5 = objc_msgSend(v4, "length"), v4, v5))
  {
    v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper ariaLandmarkRoleDescription](&v8, sel_ariaLandmarkRoleDescription);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v6;
}

- (id)_accessibilityParentLinkContainer
{
  void *v3;
  UIKitWebAccessibilityObjectWrapper *v4;
  void *v5;
  UIKitWebAccessibilityObjectWrapper *v6;
  UIKitWebAccessibilityObjectWrapper *v7;
  uint64_t v8;
  UIKitWebAccessibilityObjectWrapper *v9;
  UIKitWebAccessibilityObjectWrapper *v10;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXParentContainerLink"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = self;
    v7 = v6;
    if (v5)
    {
      v8 = *MEMORY[0x24BDF73D8];
      v9 = v6;
      while (1)
      {
        if ((v8 & objc_msgSend(v5, "accessibilityTraits")) == 0)
        {
          v10 = v9;
LABEL_10:
          if (v10 == v7)
            goto LABEL_14;
          if (v10)
            -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](v7, "_accessibilitySetRetainedValue:forKey:", v10, CFSTR("AXParentContainerLink"));
          goto LABEL_16;
        }
        if ((objc_msgSend(v5, "_accessibilityHasOtherAccessibleChildElements:", v9) & 1) != 0)
          break;
        v10 = v5;

        -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](v10, "accessibilityContainer");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        v9 = v10;
        if (!v5)
          goto LABEL_10;
      }

      if (v7)
        goto LABEL_15;
    }
LABEL_14:

LABEL_15:
    v10 = 0;
LABEL_16:
    v4 = v10;

  }
  return v4;
}

- (BOOL)_accessibilityHasOtherAccessibleChildElements:(id)a3
{
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;

  v4 = a3;
  v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount");
  if (v5 < 1)
  {
    v8 = 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    v8 = 1;
    while (1)
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v4, "isEqual:", v9) & 1) == 0)
      {
        if ((objc_msgSend(v9, "isAccessibilityElement") & 1) != 0)
          break;
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          if (objc_msgSend(v9, "_accessibilityHasOtherAccessibleChildElements:", 0))
            break;
        }
      }

      v8 = ++v7 < v6;
      if (v6 == v7)
        goto LABEL_11;
    }

  }
LABEL_11:

  return v8;
}

- (id)accessibilityLabel
{
  void *v3;
  int PossiblyNilObjectForKey;
  id v5;
  void *v6;
  __CFString *v7;
  __CFString *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  __CFString *v22;
  void *v24;
  const __CFString *v25;
  objc_super v26;
  uint64_t v27;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_axObjWrapperLabel"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0;
  PossiblyNilObjectForKey = _AXServerCacheGetPossiblyNilObjectForKey();
  v5 = 0;
  v6 = v5;
  if (PossiblyNilObjectForKey)
  {
    v7 = (__CFString *)v5;
  }
  else
  {
    v26.receiver = self;
    v26.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityLabel](&v26, sel_accessibilityLabel);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();

    v9 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    if ((*MEMORY[0x24BDF73D8] & v9) != 0 && (*MEMORY[0x24BDFEF00] & v9) == 0 && (processingLabelLogic & 1) == 0)
    {
      processingLabelLogic = 1;
      -[UIKitWebAccessibilityObjectWrapper _accessibilityParentLinkContainer](self, "_accessibilityParentLinkContainer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v10)
      {
        objc_msgSend(v10, "accessibilityLabel");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v12, "length"))
        {
          v13 = v12;

          v8 = v13;
        }

      }
      if (-[__CFString length](v8, "length")
        || (v15 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount"),
            v15 < 1))
      {
        v14 = (uint64_t)v8;
      }
      else
      {
        v16 = v15;
        for (i = 0; i != v16; ++i)
        {
          -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", i, v24, v25);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v18, "accessibilityLabel");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          v25 = CFSTR("__AXStringForVariablesSentinel");
          __UIAXStringForVariables();
          v14 = objc_claimAutoreleasedReturnValue();

          v8 = (__CFString *)v14;
        }
      }
      processingLabelLogic = 0;

      v8 = (__CFString *)v14;
    }
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet", v24, v25);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[__CFString stringByTrimmingCharactersInSet:](v8, "stringByTrimmingCharactersInSet:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v20, "length") == 1 && (objc_msgSend(v20, "characterAtIndex:", 0) & 0xFFFE) == 0x200E)
    {

      v8 = 0;
    }
    -[UIKitWebAccessibilityObjectWrapper safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityBrailleLabel"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      if (v8)
        v22 = v8;
      else
        v22 = CFSTR(" ");
      objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v22);
      v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
      -[__CFString setAttribute:forKey:](v8, "setAttribute:forKey:", v21, *MEMORY[0x24BDFEAF8]);

    }
    _AXServerCacheInsertPossiblyNilObjectForKey();
    v7 = v8;

  }
  return v7;
}

- (id)_accessibilityProcessRootEquation
{
  uint64_t v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  void *v10;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount");
  if (v3 == 1)
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    _processEquationChild(v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v3 < 2)
    {
      v5 = 0;
      return v5;
    }
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setObject:forKey:", CFSTR("Row"), CFSTR("AXMType"));
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount");
    if (v6 >= 1)
    {
      v7 = v6;
      for (i = 0; i != v7; ++i)
      {
        -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", i);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        _processEquationChild(v9);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v10);

      }
    }
    objc_msgSend(v5, "setObject:forKey:", v4, CFSTR("AXMChildren"));
  }

  return v5;
}

- (id)accessibilityMathEquation
{
  void *v3;

  if (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsMathTopObject")))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityProcessRootEquation](self, "_accessibilityProcessRootEquation");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (BOOL)_axIsInteractiveVideo
{
  return -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsWebInteractiveVideo"));
}

- (void)_axVideoEnterFullscreen
{
  if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo"))
  {
    UIAccessibilitySpeakAndDoNotBeInterrupted();
    AXPerformSafeBlock();
  }
}

uint64_t __61__UIKitWebAccessibilityObjectWrapper__axVideoEnterFullscreen__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityVideoEnterFullscreen");
}

- (void)_axVideoToggleMute
{
  __CFString *v3;
  void *v4;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo"))
  {
    if (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsMediaMuted")))v3 = CFSTR("unmute.video");
    else
      v3 = CFSTR("mute.video");
    accessibilityLocalizedString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

    AXPerformSafeBlock();
  }
}

uint64_t __56__UIKitWebAccessibilityObjectWrapper__axVideoToggleMute__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityToggleMuteForMedia");
}

- (void)accessibilityIncrement
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityIncrement](&v4, sel_accessibilityIncrement);
  if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo"))
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (void)accessibilityDecrement
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityDecrement](&v4, sel_accessibilityDecrement);
  if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo"))
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilitySpeakAndDoNotBeInterrupted();

  }
}

- (int)_accessibilityHostPid
{
  void *v3;
  int v4;
  objc_super v6;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageObject](self, "_accessibilityWebPageObject");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "_accessibilityHostPid");

    return v4;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    return -[UIKitWebAccessibilityObjectWrapper _accessibilityHostPid](&v6, sel__accessibilityHostPid);
  }
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  objc_super v18;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXWebVideoActions"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v3)
    {
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXWebVideoActions"));
      v5 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("video.action.fast.forward"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v5, "initWithName:target:selector:", v6, self, sel_accessibilityIncrement);

      objc_msgSend(v4, "addObject:", v7);
      v8 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("video.action.rewind"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)objc_msgSend(v8, "initWithName:target:selector:", v9, self, sel_accessibilityDecrement);

      objc_msgSend(v4, "addObject:", v10);
      v11 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("video.action.toggle.mute"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (void *)objc_msgSend(v11, "initWithName:target:selector:", v12, self, sel__axVideoToggleMute);

      objc_msgSend(v4, "addObject:", v13);
      v14 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("video.action.enter.fullscreen"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = (void *)objc_msgSend(v14, "initWithName:target:selector:", v15, self, sel__axVideoEnterFullscreen);

      objc_msgSend(v4, "addObject:", v16);
      return v4;
    }
  }
  else
  {
    v18.receiver = self;
    v18.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityCustomActions](&v18, sel_accessibilityCustomActions);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_axWebKitSearchKeyForCustomRotorType:(int64_t)a3
{
  void *v4;
  void *v5;
  void *v6;

  if (_axWebKitSearchKeyForCustomRotorType__onceToken != -1)
    dispatch_once(&_axWebKitSearchKeyForCustomRotorType__onceToken, &__block_literal_global_903);
  v4 = (void *)_axWebKitSearchKeyForCustomRotorType__ConvertType;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void __75__UIKitWebAccessibilityObjectWrapper__axWebKitSearchKeyForCustomRotorType___block_invoke()
{
  _QWORD *v0;
  void *v1;
  void *v2;
  void *v3;
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
  void *v14;
  void *v15;
  _QWORD v16[28];
  _QWORD v17[30];

  v17[28] = *MEMORY[0x24BDAC8D0];
  v16[0] = &unk_24FF8C3A8;
  v16[1] = &unk_24FF8C3C0;
  v17[0] = CFSTR("AXBoldFontSearchKey");
  v17[1] = CFSTR("AXItalicFontSearchKey");
  v16[2] = &unk_24FF8C3D8;
  v17[2] = CFSTR("AXUnderlineSearchKey");
  v0 = (_QWORD *)MEMORY[0x24BEBAF60];
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF60]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16[3] = v15;
  v17[3] = CFSTR("AXPlainTextSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF38]);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v16[4] = v14;
  v17[4] = CFSTR("AXFontColorChangeSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF48]);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v16[5] = v13;
  v17[5] = CFSTR("AXFontChangeSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF78]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v16[6] = v1;
  v17[6] = CFSTR("AXStyleChangeSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF68]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v16[7] = v2;
  v17[7] = CFSTR("AXBlockquoteSameLevelSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF28]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v16[8] = v3;
  v17[8] = CFSTR("AXBlockquoteSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF30]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v16[9] = v4;
  v17[9] = CFSTR("AXButtonSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF40]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[10] = v5;
  v17[10] = CFSTR("AXControlSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF50]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v16[11] = v6;
  v16[12] = &unk_24FF8C3F0;
  v17[11] = CFSTR("AXFrameSearchKey");
  v17[12] = CFSTR("AXGraphicSearchKey");
  v16[13] = &unk_24FF8C408;
  v16[14] = &unk_24FF8C420;
  v17[13] = CFSTR("AXHeadingLevel1SearchKey");
  v17[14] = CFSTR("AXHeadingLevel2SearchKey");
  v16[15] = &unk_24FF8C438;
  v16[16] = &unk_24FF8C450;
  v17[15] = CFSTR("AXHeadingLevel3SearchKey");
  v17[16] = CFSTR("AXHeadingLevel4SearchKey");
  v16[17] = &unk_24FF8C468;
  v16[18] = &unk_24FF8C480;
  v17[17] = CFSTR("AXHeadingLevel5SearchKey");
  v17[18] = CFSTR("AXHeadingLevel6SearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF70]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v16[19] = v7;
  v16[20] = &unk_24FF8C498;
  v17[19] = CFSTR("AXHeadingSameLevelSearchKey");
  v17[20] = CFSTR("AXHeadingSearchKey");
  v16[21] = &unk_24FF8C4B0;
  v16[22] = &unk_24FF8C4C8;
  v17[21] = CFSTR("AXLinkSearchKey");
  v17[22] = CFSTR("AXListSearchKey");
  v16[23] = &unk_24FF8C4E0;
  v17[23] = CFSTR("AXMisspelledWordSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *v0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v16[24] = v8;
  v17[24] = CFSTR("AXStaticTextSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF58]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v16[25] = v9;
  v16[26] = &unk_24FF8C4F8;
  v17[25] = CFSTR("AXUnvisitedLinkSearchKey");
  v17[26] = CFSTR("AXVisitedLinkSearchKey");
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF20]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[27] = v10;
  v17[27] = CFSTR("AXArticleSearchKey");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 28);
  v11 = objc_claimAutoreleasedReturnValue();
  v12 = (void *)_axWebKitSearchKeyForCustomRotorType__ConvertType;
  _axWebKitSearchKeyForCustomRotorType__ConvertType = v11;

}

- (id)_misspelledWordRotor
{
  id v3;
  void *v4;
  _QWORD v6[5];

  v3 = objc_alloc(MEMORY[0x24BDF6790]);
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke;
  v6[3] = &unk_24FF86940;
  v6[4] = self;
  v4 = (void *)objc_msgSend(v3, "initWithSystemType:itemSearchBlock:", 13, v6);
  objc_msgSend(v4, "setVisibleInTouchRotor:", 1);
  return v4;
}

id __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  BOOL v19;
  NSObject *v20;
  NSObject *v21;
  void *v22;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  uint64_t (*v27)(uint64_t, uint64_t);
  void (*v28)(uint64_t);
  id v29;
  _QWORD v30[2];
  _QWORD v31[3];

  v31[2] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(v3, "currentItem");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "targetElement");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v3, "currentItem");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "targetTextMarkerRange");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_accessibilityConvertDataArrayToTextMarkerArray:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  _AXPrintMarkerRangeInfo(v9, v5);
  v10 = objc_msgSend(v3, "searchDirection");
  objc_msgSend(MEMORY[0x24BDBCE30], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v9, "count"))
  {
    if (v10 == 1)
    {
      objc_msgSend(v9, "lastObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v31[0] = v12;
      objc_msgSend(v9, "lastObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v31[1] = v13;
      v14 = v31;
    }
    else
    {
      objc_msgSend(v9, "firstObject");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v30[0] = v12;
      objc_msgSend(v9, "firstObject");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v30[1] = v13;
      v14 = v30;
    }
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v14, 2);
    v15 = objc_claimAutoreleasedReturnValue();

    v11 = (void *)v15;
  }
  _AXPrintMarkerRangeInfo(v11, v5);
  v24 = 0;
  v25 = &v24;
  v26 = 0x3032000000;
  v27 = __Block_byref_object_copy_;
  v28 = __Block_byref_object_dispose_;
  v29 = 0;
  v16 = v5;
  v17 = v11;
  AXPerformSafeBlock();
  v18 = (id)v25[5];

  _Block_object_dispose(&v24, 8);
  v19 = objc_msgSend(v18, "count") == 2;
  VOTLogRotor();
  v20 = objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v19)
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_1(v18, v16);

    objc_msgSend(*(id *)(a1 + 32), "_accessibilityConvertTextMarkersToDataArray:", v18);
    v21 = objc_claimAutoreleasedReturnValue();
    v22 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6798]), "initWithTargetElement:targetRange:targetTextMarkerRange:", v16, 0, v21);
  }
  else
  {
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_2(v18, v21);
    v22 = 0;
  }

  return v22;
}

void __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "misspellingTextMarkerRange:forward:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 56));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityReplaceTextInRange:(_NSRange)a3 withString:(id)a4
{
  char v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  char v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2020000000;
  v10 = 0;
  v6 = a4;
  AXPerformSafeBlock();
  v4 = *((_BYTE *)v8 + 24);

  _Block_object_dispose(&v7, 8);
  return v4;
}

uint64_t __82__UIKitWebAccessibilityObjectWrapper__accessibilityReplaceTextInRange_withString___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "accessibilityReplaceRange:withText:", *(_QWORD *)(a1 + 56), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 40));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = result;
  return result;
}

- (id)_accessibilityElementsForSearchParameter:(id)a3
{
  id v3;
  id v5;
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  uint64_t (*v9)(uint64_t, uint64_t);
  void (*v10)(uint64_t);
  id v11;

  v6 = 0;
  v7 = &v6;
  v8 = 0x3032000000;
  v9 = __Block_byref_object_copy_;
  v10 = __Block_byref_object_dispose_;
  v11 = 0;
  v5 = a3;
  AXPerformSafeBlock();
  v3 = (id)v7[5];

  _Block_object_dispose(&v6, 8);
  return v3;
}

void __79__UIKitWebAccessibilityObjectWrapper__accessibilityElementsForSearchParameter___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityFindMatchingObjects:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (id)_accessibilityCustomRotor:(int64_t)a3
{
  id v6;
  void *v7;
  _QWORD v8[6];

  if (a3 == 13)
  {
    -[UIKitWebAccessibilityObjectWrapper _misspelledWordRotor](self, "_misspelledWordRotor");
    return (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = objc_alloc(MEMORY[0x24BDF6790]);
    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke;
    v8[3] = &unk_24FF86990;
    v8[4] = self;
    v8[5] = a3;
    v7 = (void *)objc_msgSend(v6, "initWithSystemType:itemSearchBlock:", a3, v8);
    objc_msgSend(v7, "setVisibleInTouchRotor:", 0);
    return v7;
  }
}

id __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  void *i;
  void *v18;
  id v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  uint64_t v26;
  void (*v27)(uint64_t);
  void *v28;
  uint64_t v29;
  id v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t *v33;
  uint64_t v34;
  uint64_t (*v35)(uint64_t, uint64_t);
  void (*v36)(uint64_t);
  id v37;
  _BYTE v38[128];
  _QWORD v39[6];
  _QWORD v40[7];

  v40[6] = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_axWebKitSearchKeyForCustomRotorType:", *(_QWORD *)(a1 + 40));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v39[0] = CFSTR("AXDirection");
    v5 = objc_msgSend(v3, "searchDirection");
    v6 = CFSTR("AXDirectionPrevious");
    v7 = MEMORY[0x24BDBD1C0];
    if (v5 == 1)
      v6 = CFSTR("AXDirectionNext");
    v40[0] = v6;
    v40[1] = MEMORY[0x24BDBD1C0];
    v39[1] = CFSTR("AXImmediateDescendantsOnly");
    v39[2] = CFSTR("AXResultsLimit");
    v40[2] = &unk_24FF8C510;
    v39[3] = CFSTR("AXStartElement");
    objc_msgSend(v3, "currentItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "targetElement");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v40[3] = v9;
    v39[4] = CFSTR("AXVisibleOnly");
    v39[5] = CFSTR("AXSearchKey");
    v40[4] = v7;
    v40[5] = v4;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v40, v39, 6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v32 = 0;
    v33 = &v32;
    v34 = 0x3032000000;
    v35 = __Block_byref_object_copy_;
    v36 = __Block_byref_object_dispose_;
    v37 = 0;
    v25 = MEMORY[0x24BDAC760];
    v26 = 3221225472;
    v27 = __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke_1000;
    v28 = &unk_24FF86838;
    v11 = *(_QWORD *)(a1 + 32);
    v31 = &v32;
    v29 = v11;
    v12 = v10;
    v30 = v12;
    AXPerformSafeBlock();
    v13 = (id)v33[5];

    _Block_object_dispose(&v32, 8);
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v14 = v13;
    v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v38, 16);
    if (v15)
    {
      v16 = *(_QWORD *)v22;
      while (2)
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(_QWORD *)v22 != v16)
            objc_enumerationMutation(v14);
          v18 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
          if ((objc_msgSend(v18, "isAccessibilityElement") & 1) != 0)
          {
            v19 = v18;

            if (!v19)
            {
              v15 = 0;
              goto LABEL_21;
            }
            goto LABEL_19;
          }
          if (objc_msgSend(v4, "isEqualToString:", CFSTR("AXArticleSearchKey")))
          {
            objc_msgSend(v18, "_accessibilityUnignoredDescendant");
            v19 = (id)objc_claimAutoreleasedReturnValue();
            if (v19)
            {

LABEL_19:
              v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6798]), "initWithTargetElement:targetRange:", v19, 0);
              goto LABEL_20;
            }
          }
        }
        v15 = (void *)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v21, v38, 16);
        if (v15)
          continue;
        break;
      }
    }
    v19 = v14;
LABEL_20:

LABEL_21:
  }
  else
  {
    _AXAssert();
    v15 = 0;
  }

  return v15;
}

void __64__UIKitWebAccessibilityObjectWrapper__accessibilityCustomRotor___block_invoke_1000(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityFindMatchingObjects:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityIsTopMostWebElement
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("_accessibilityIsTopMostWebElement"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v3)
  {
    v4 = (void *)MEMORY[0x24BDD16E0];
    -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "numberWithInt:", v5 == v6);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v3, CFSTR("_accessibilityIsTopMostWebElement"));
  }
  v7 = objc_msgSend(v3, "BOOLValue");

  return v7;
}

- (id)accessibilityCustomRotors
{
  void *v3;
  id v4;
  unint64_t v6;
  void *v7;
  void *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  objc_super v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  void *v36;
  _BYTE v37[128];
  _QWORD v38[29];

  v38[27] = *MEMORY[0x24BDAC8D0];
  if (!-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
    return 0;
  if (-[UIKitWebAccessibilityObjectWrapper _accessibilityIsTopMostWebElement](self, "_accessibilityIsTopMostWebElement"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXRotors"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
    }
    else
    {
      v38[0] = &unk_24FF8C3A8;
      v38[1] = &unk_24FF8C3C0;
      v38[2] = &unk_24FF8C3D8;
      v9 = (_QWORD *)MEMORY[0x24BEBAF60];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF60]);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v38[3] = v30;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF38]);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      v38[4] = v29;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF48]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      v38[5] = v28;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF78]);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      v38[6] = v27;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF68]);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v38[7] = v26;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF28]);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v38[8] = v10;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF30]);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v38[9] = v11;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF40]);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v38[10] = v12;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF50]);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v38[11] = v13;
      v38[12] = &unk_24FF8C3F0;
      v38[13] = &unk_24FF8C408;
      v38[14] = &unk_24FF8C420;
      v38[15] = &unk_24FF8C438;
      v38[16] = &unk_24FF8C450;
      v38[17] = &unk_24FF8C468;
      v38[18] = &unk_24FF8C480;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF70]);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v38[19] = v14;
      v38[20] = &unk_24FF8C498;
      v38[21] = &unk_24FF8C4B0;
      v38[22] = &unk_24FF8C4C8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v38[23] = v15;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF58]);
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v38[24] = v16;
      v38[25] = &unk_24FF8C4F8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BEBAF20]);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v38[26] = v17;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v38, 27);
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v32 = 0u;
      v33 = 0u;
      v34 = 0u;
      v35 = 0u;
      v20 = v18;
      v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
      if (v21)
      {
        v22 = v21;
        v23 = *(_QWORD *)v33;
        do
        {
          v24 = 0;
          do
          {
            if (*(_QWORD *)v33 != v23)
              objc_enumerationMutation(v20);
            -[UIKitWebAccessibilityObjectWrapper _accessibilityCustomRotor:](self, "_accessibilityCustomRotor:", objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v24), "integerValue"));
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "axSafelyAddObject:", v25);

            ++v24;
          }
          while (v22 != v24);
          v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
        }
        while (v22);
      }

      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](self, "_accessibilitySetRetainedValue:forKey:", v19, CFSTR("AXRotors"));
      v4 = v19;

    }
    return v4;
  }
  else
  {
    v6 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    if ((*MEMORY[0x24BEBB198] & ~v6) != 0 || (*MEMORY[0x24BEBB128] & ~v6) != 0)
    {
      v31.receiver = self;
      v31.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      -[UIKitWebAccessibilityObjectWrapper accessibilityCustomRotors](&v31, sel_accessibilityCustomRotors);
      return (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityCustomRotor:](self, "_accessibilityCustomRotor:", 13);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = v7;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", &v36, 1);
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      return v8;
    }
  }
}

- (BOOL)_accessibilityShouldSpeakMathEquationTrait
{
  int v3;
  void *v4;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    {
      LOBYTE(v3) = 1;
    }
    else
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityAncestorIsKindOf:](self, "_accessibilityAncestorIsKindOf:", NSClassFromString(CFSTR("UIWebView")));
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v4, "_accessibilityIsMathTouchExplorationView") ^ 1;

    }
  }
  else
  {
    LOBYTE(v3) = 0;
  }
  return v3;
}

- (unint64_t)accessibilityTraits
{
  void *v3;
  unint64_t v4;

  v3 = (void *)MEMORY[0x2348C4190](self, a2);
  v4 = -[UIKitWebAccessibilityObjectWrapper _accessibilityTraitsHelper](self, "_accessibilityTraitsHelper");
  objc_autoreleasePoolPop(v3);
  return v4;
}

- (unint64_t)_accessibilityTraitsHelper
{
  uint64_t v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  uint64_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](&v13, sel_accessibilityTraits);
  if (!-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
  {
    -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIPeripheralHost")), "safeValueForKey:", CFSTR("sharedInstance"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if ((*MEMORY[0x24BDFEED8] & v3) != 0 && objc_msgSend(v4, "safeBoolForKey:", CFSTR("isOffScreen")))
      v3 = _AXTraitsRemoveTrait();

  }
  v6 = -[UIKitWebAccessibilityObjectWrapper _axIsInteractiveVideo](self, "_axIsInteractiveVideo");
  v7 = *MEMORY[0x24BDFF130];
  if (!v6)
    v7 = 0;
  v8 = v7 | v3;
  v9 = -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsMathTopObject"));
  v10 = *MEMORY[0x24BDFEF00];
  if (!v9)
    v10 = 0;
  v11 = v8 | v10;
  if ((*MEMORY[0x24BDFF008] & ~v11) == 0
    && (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityCanSetValue")) & 1) == 0)
  {
    v11 |= *MEMORY[0x24BDFEF40];
  }
  if ((*MEMORY[0x24BDFEF28] & v11) != 0
    && -[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilitySupportsARIAExpanded")))
  {
    return *MEMORY[0x24BDFEE60] | _AXTraitsRemoveTrait();
  }
  return v11;
}

- (void)_accessibilityModifySelection:(id)a3 increase:(BOOL)a4
{
  id v5;

  v5 = a3;
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    if ((objc_msgSend(v5, "isEqualToString:", CFSTR("word")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("line")) & 1) == 0
      && (objc_msgSend(v5, "isEqualToString:", CFSTR("page")) & 1) == 0)
    {
      objc_msgSend(v5, "isEqualToString:", CFSTR("all"));
    }
    AXPerformSafeBlock();
  }

}

uint64_t __77__UIKitWebAccessibilityObjectWrapper__accessibilityModifySelection_increase___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityModifySelection:increase:", *(unsigned __int8 *)(a1 + 40), *(unsigned __int8 *)(a1 + 41));
}

- (void)_accessibilityDecreaseSelection:(id)a3
{
  -[UIKitWebAccessibilityObjectWrapper _accessibilityModifySelection:increase:](self, "_accessibilityModifySelection:increase:", a3, 0);
}

- (void)_accessibilityIncreaseSelection:(id)a3
{
  -[UIKitWebAccessibilityObjectWrapper _accessibilityModifySelection:increase:](self, "_accessibilityModifySelection:increase:", a3, 1);
}

- (void)_accessibilityMoveSelectionToMarker:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    -[UIKitWebAccessibilityObjectWrapper accessibilityMoveSelectionToMarker:](self, "accessibilityMoveSelectionToMarker:", v6);

}

- (id)_accessibilityWebAreaURL
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;

  -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3 = *MEMORY[0x24BDF73D8];
    while (1)
    {
      if ((v3 & ~objc_msgSend(v2, "accessibilityTraits")) != 0)
      {
        objc_msgSend(v2, "accessibilityURL");
        v4 = objc_claimAutoreleasedReturnValue();
        if (v4)
          break;
      }
      objc_msgSend(v2, "accessibilityContainer");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v5;
      if (!v5)
        goto LABEL_9;
    }
    v5 = (void *)v4;
  }
  else
  {
    v5 = 0;
  }
LABEL_9:

  return v5;
}

- (void)_performLiveRegionUpdate
{
  UIKitWebAccessibilityObjectWrapper *v2;
  void *v3;
  char v4;
  void *v5;
  unsigned int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  int v13;
  int v14;
  int v15;
  void *v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  id v23;
  uint64_t v24;
  uint64_t v25;
  char v26;
  uint64_t v27;
  uint64_t i;
  uint64_t v29;
  id v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t j;
  uint64_t v35;
  void *v36;
  uint64_t v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t k;
  uint64_t v44;
  __CFString *v45;
  id v46;
  uint64_t v47;
  uint64_t v48;
  id v49;
  uint64_t v50;
  uint64_t v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  const __CFString *v57;
  unsigned int v58;
  unsigned int v59;
  int v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int v65;
  void *v66;
  UIKitWebAccessibilityObjectWrapper *v67;
  void *v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  _QWORD v73[4];
  id v74;
  id v75;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  _QWORD v89[4];
  id v90;
  _BYTE v91[128];
  _BYTE v92[128];
  _BYTE v93[128];
  _BYTE v94[128];
  uint64_t v95;

  v2 = self;
  v95 = *MEMORY[0x24BDAC8D0];
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](v2, "safeValueForKey:", CFSTR("accessibilityARIAIsBusy"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "BOOLValue");

    if ((v4 & 1) == 0)
    {
      -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](v2, "safeValueForKey:", CFSTR("accessibilityARIALiveRegionStatus"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("polite"));
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("off")))
      {
        _UIAccessibilityFocusedElementForAssistiveTech();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = objc_msgSend(v7, "_accessibilityIsDescendantOfElement:", v2);

        if (!v8)
        {
LABEL_75:

          return;
        }
        v59 = 1;
      }
      else
      {
        v59 = v6;
      }
      -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](v2, "safeValueForKey:", CFSTR("accessibilityARIALiveRegionIsAtomic"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "BOOLValue");

      -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](v2, "safeValueForKey:", CFSTR("accessibilityARIARelevantStatus"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "componentsSeparatedByString:", CFSTR(" "));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      v63 = v12;
      v64 = v5;
      if (objc_msgSend(v12, "count"))
      {
        v13 = objc_msgSend(v12, "containsObject:", CFSTR("additions"));
        v14 = objc_msgSend(v12, "containsObject:", CFSTR("text"));
        v15 = objc_msgSend(v12, "containsObject:", CFSTR("removals"));
        if (!objc_msgSend(v12, "containsObject:", CFSTR("all")))
        {
          v65 = v13;
          v60 = v14;
          goto LABEL_13;
        }
        v60 = 1;
        v15 = 1;
      }
      else
      {
        v15 = 0;
        v60 = 1;
      }
      v65 = 1;
LABEL_13:
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v2);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      while (objc_msgSend(v17, "count"))
      {
        objc_msgSend(v17, "lastObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "removeLastObject");
        if (objc_msgSend(v18, "isAccessibilityElement"))
        {
          v19 = +[AXLiveRegionNode createNodeFromObject:](AXLiveRegionNode, "createNodeFromObject:", v18);
          if (objc_msgSend(v16, "count"))
            objc_msgSend(v16, "insertObject:atIndex:", v19, 0);
          else
            objc_msgSend(v16, "addObject:", v19);
        }
        else
        {
          v89[0] = MEMORY[0x24BDAC760];
          v89[1] = 3221225472;
          v89[2] = __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke;
          v89[3] = &unk_24FF869E0;
          v90 = v17;
          objc_msgSend(v18, "accessibilityEnumerateContainerElementsUsingBlock:", v89);
          v19 = v90;
        }

      }
      objc_msgSend(MEMORY[0x24BDBCEB8], "array");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper _accessibilityValueForKey:](v2, "_accessibilityValueForKey:", CFSTR("LiveRegionTree"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v21, "objectForKey:", CFSTR("Nodes"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v61 = v21;
      objc_msgSend(v21, "objectForKey:", CFSTR("Text"));
      v67 = v2;
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v62 = v17;
      if (v15)
      {
        v87 = 0u;
        v88 = 0u;
        v85 = 0u;
        v86 = 0u;
        v23 = v22;
        v24 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
        if (v24)
        {
          v25 = v24;
          v26 = 0;
          v27 = *(_QWORD *)v86;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v86 != v27)
                objc_enumerationMutation(v23);
              v29 = *(_QWORD *)(*((_QWORD *)&v85 + 1) + 8 * i);
              if ((objc_msgSend(v16, "containsObject:", v29) ^ 1 | v10) == 1)
              {
                objc_msgSend(v20, "addObject:", v29);
                v26 = 1;
              }
            }
            v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v85, v94, 16);
          }
          while (v25);
        }
        else
        {
          v26 = 0;
        }

        v58 = v26 & 1;
        v2 = v67;
      }
      else
      {
        v58 = 0;
      }
      if (v65)
      {
        v83 = 0u;
        v84 = 0u;
        v81 = 0u;
        v82 = 0u;
        v30 = v16;
        v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
        if (v31)
        {
          v32 = v31;
          v33 = *(_QWORD *)v82;
          do
          {
            for (j = 0; j != v32; ++j)
            {
              if (*(_QWORD *)v82 != v33)
                objc_enumerationMutation(v30);
              v35 = *(_QWORD *)(*((_QWORD *)&v81 + 1) + 8 * j);
              if ((objc_msgSend(v20, "containsObject:", v35) & 1) == 0
                && (objc_msgSend(v22, "containsObject:", v35) ^ 1 | v10) == 1)
              {
                objc_msgSend(v20, "addObject:", v35);
              }
            }
            v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v81, v93, 16);
          }
          while (v32);
        }

      }
      objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 2);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "setObject:forKey:", v16, CFSTR("Nodes"));
      v66 = v36;
      if (v60)
      {
        v37 = objc_msgSend(v16, "count");
        if (v37 == objc_msgSend(v22, "count") || !v22)
        {
          objc_msgSend(MEMORY[0x24BDBCEB8], "array");
          v38 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v36, "setObject:forKey:", v38, CFSTR("Text"));
          if (v68)
          {
            v73[0] = MEMORY[0x24BDAC760];
            v73[1] = 3221225472;
            v73[2] = __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke_2;
            v73[3] = &unk_24FF86A08;
            v74 = v16;
            v75 = v20;
            v76 = v38;
            objc_msgSend(v68, "enumerateObjectsUsingBlock:", v73);

            v39 = v74;
          }
          else
          {
            v79 = 0u;
            v80 = 0u;
            v77 = 0u;
            v78 = 0u;
            v39 = v16;
            v40 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
            if (v40)
            {
              v41 = v40;
              v42 = *(_QWORD *)v78;
              do
              {
                for (k = 0; k != v41; ++k)
                {
                  if (*(_QWORD *)v78 != v42)
                    objc_enumerationMutation(v39);
                  objc_msgSend(*(id *)(*((_QWORD *)&v77 + 1) + 8 * k), "label");
                  v44 = objc_claimAutoreleasedReturnValue();
                  if (v44)
                    v45 = (__CFString *)v44;
                  else
                    v45 = &stru_24FF86C78;
                  objc_msgSend(v38, "addObject:", v45);

                }
                v41 = objc_msgSend(v39, "countByEnumeratingWithState:objects:count:", &v77, v92, 16);
              }
              while (v41);
              v36 = v66;
              v2 = v67;
            }
          }

        }
      }
      -[UIKitWebAccessibilityObjectWrapper _accessibilitySetRetainedValue:forKey:](v2, "_accessibilitySetRetainedValue:forKey:", v36, CFSTR("LiveRegionTree"));
      v71 = 0u;
      v72 = 0u;
      v69 = 0u;
      v70 = 0u;
      v46 = v20;
      v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v91, 16);
      if (v47)
      {
        v48 = v47;
        v49 = 0;
        v50 = *(_QWORD *)v70;
        do
        {
          v51 = 0;
          v52 = v49;
          do
          {
            if (*(_QWORD *)v70 != v50)
              objc_enumerationMutation(v46);
            objc_msgSend(*(id *)(*((_QWORD *)&v69 + 1) + 8 * v51), "label", v56, v57);
            v56 = (void *)objc_claimAutoreleasedReturnValue();
            v57 = CFSTR("__AXStringForVariablesSentinel");
            __UIAXStringForVariables();
            v49 = (id)objc_claimAutoreleasedReturnValue();

            ++v51;
            v52 = v49;
          }
          while (v48 != v51);
          v48 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v69, v91, 16, v56, CFSTR("__AXStringForVariablesSentinel"));
        }
        while (v48);
      }
      else
      {
        v49 = 0;
      }

      if (objc_msgSend(v49, "length"))
      {
        objc_msgSend(MEMORY[0x24BDFEA60], "axAttributedStringWithString:", v49);
        v53 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v59);
        v54 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setAttribute:forKey:", v54, *MEMORY[0x24BDFECE0]);

        objc_msgSend(v53, "setAttribute:forKey:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BDFEBC0]);
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v58);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v53, "setAttribute:forKey:", v55, *MEMORY[0x24BDFEBC8]);

        v49 = v53;
        AXPerformBlockOnMainThreadAfterDelay();

      }
      v5 = v64;
      goto LABEL_75;
    }
  }
}

uint64_t __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "addObject:", a2);
}

void __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  void *v5;
  id v6;
  __CFString *v7;
  id v8;

  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v5, "objectAtIndex:", a3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "label");
  v7 = (__CFString *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v5) = -[__CFString isEqualToString:](v7, "isEqualToString:", v6);

  if ((v5 & 1) == 0 && (objc_msgSend(*(id *)(a1 + 40), "containsObject:", v8) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v8);
  if (!v7)
    v7 = &stru_24FF86C78;
  objc_msgSend(*(id *)(a1 + 48), "addObject:", v7);

}

uint64_t __62__UIKitWebAccessibilityObjectWrapper__performLiveRegionUpdate__block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleNotificationPosting:data:", *MEMORY[0x24BDF71E8], *(_QWORD *)(a1 + 40));
}

- (void)_axHandleNotificationPosting:(unsigned int)a3 data:(id)a4
{
  uint64_t v4;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  int v10;
  const __CFString *v11;
  const __CFString *v12;
  id argument;

  v4 = *(_QWORD *)&a3;
  argument = a4;
  if ((int)v4 <= 3031)
  {
    if ((_DWORD)v4 != 1026)
    {
      if ((_DWORD)v4 != 1046)
        goto LABEL_37;
      if (-[UIKitWebAccessibilityObjectWrapper _accessibilityExpandedStatus](self, "_accessibilityExpandedStatus") == 1)
        v6 = CFSTR("expanded");
      else
        v6 = CFSTR("collapsed");
      accessibilityLocalizedString(v6);
      v7 = objc_claimAutoreleasedReturnValue();
      v8 = argument;
      goto LABEL_36;
    }
    -[UIKitWebAccessibilityObjectWrapper safeStringForKey:](self, "safeStringForKey:", CFSTR("accessibilityInvalidStatus"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") && (objc_msgSend(v8, "isEqualToString:", CFSTR("false")) & 1) == 0)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("grammar")) & 1) != 0)
      {
        v9 = CFSTR("invalidStatusGrammar");
        goto LABEL_34;
      }
      v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("spelling"));
      v11 = CFSTR("invalidStatusGeneral");
      v12 = CFSTR("invalidStatusSpelling");
LABEL_25:
      if (v10)
        v9 = (__CFString *)v12;
      else
        v9 = (__CFString *)v11;
      goto LABEL_34;
    }
    goto LABEL_18;
  }
  if ((_DWORD)v4 == 3032)
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityCurrentStatus](self, "_accessibilityCurrentStatus");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length") && (objc_msgSend(v8, "isEqualToString:", CFSTR("false")) & 1) == 0)
    {
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("page")) & 1) != 0)
      {
        v9 = CFSTR("currentStatusPage");
        goto LABEL_34;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("step")) & 1) != 0)
      {
        v9 = CFSTR("currentStatusStep");
        goto LABEL_34;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("location")) & 1) != 0)
      {
        v9 = CFSTR("currentStatusLocation");
        goto LABEL_34;
      }
      if ((objc_msgSend(v8, "isEqualToString:", CFSTR("date")) & 1) != 0)
      {
        v9 = CFSTR("currentStatusDate");
        goto LABEL_34;
      }
      v10 = objc_msgSend(v8, "isEqualToString:", CFSTR("time"));
      v11 = CFSTR("currentStatusGeneral");
      v12 = CFSTR("currentStatusTime");
      goto LABEL_25;
    }
LABEL_18:

    goto LABEL_40;
  }
  if ((_DWORD)v4 != 3033)
    goto LABEL_37;
  -[UIKitWebAccessibilityObjectWrapper accessibilitySortDirection](self, "accessibilitySortDirection");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("AXAscendingSortDirection")) & 1) != 0)
  {
    v9 = CFSTR("sortUp");
LABEL_34:
    accessibilityLocalizedString(v9);
    v7 = objc_claimAutoreleasedReturnValue();
    goto LABEL_35;
  }
  if (objc_msgSend(v8, "isEqualToString:", CFSTR("AXDescendingSortDirection")))
  {
    v9 = CFSTR("sortDown");
    goto LABEL_34;
  }
  v7 = 0;
LABEL_35:

LABEL_36:
  v4 = 1008;
  argument = (id)v7;
LABEL_37:
  if (-[UIKitWebAccessibilityObjectWrapper _axSupportsWebKitNotificationRelay](self, "_axSupportsWebKitNotificationRelay"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityRelayToChrome:object:](self, "_accessibilityRelayToChrome:object:", v4, argument);
  }
  else
  {
    UIAccessibilityPostNotification(v4, argument);
  }
LABEL_40:

}

- (BOOL)_axSupportsWebKitNotificationRelay
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __72__UIKitWebAccessibilityObjectWrapper__axSupportsWebKitNotificationRelay__block_invoke;
  block[3] = &unk_24FF868D0;
  block[4] = self;
  if (_axSupportsWebKitNotificationRelay_onceToken != -1)
    dispatch_once(&_axSupportsWebKitNotificationRelay_onceToken, block);
  return _axSupportsWebKitNotificationRelay_Supports;
}

uint64_t __72__UIKitWebAccessibilityObjectWrapper__axSupportsWebKitNotificationRelay__block_invoke()
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  _axSupportsWebKitNotificationRelay_Supports = result & 1;
  return result;
}

- (id)_axDataConvertForNotification:(id)a3
{
  id v4;
  id v5;
  void *Data;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t j;
  void *v20;
  const void *v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "attributedString");
    v5 = (id)objc_claimAutoreleasedReturnValue();
LABEL_6:
    Data = v5;
    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    v5 = v4;
    goto LABEL_6;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    Data = (void *)objc_msgSend(v4, "mutableCopy");
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v8 = v4;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v27;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v27 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
          objc_msgSend(v8, "objectForKey:", v13);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          -[UIKitWebAccessibilityObjectWrapper _axDataConvertForNotification:](self, "_axDataConvertForNotification:", v14);
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(Data, "setObject:forKeyedSubscript:", v15, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v26, v31, 16);
      }
      while (v10);
    }
LABEL_25:

    goto LABEL_7;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    Data = (void *)objc_msgSend(v4, "mutableCopy");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v8 = v4;
    v16 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v23;
      do
      {
        for (j = 0; j != v17; ++j)
        {
          if (*(_QWORD *)v23 != v18)
            objc_enumerationMutation(v8);
          -[UIKitWebAccessibilityObjectWrapper _axDataConvertForNotification:](self, "_axDataConvertForNotification:", *(_QWORD *)(*((_QWORD *)&v22 + 1) + 8 * j), (_QWORD)v22);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(Data, "setObject:atIndexedSubscript:", v20, 0);

        }
        v17 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v30, 16);
      }
      while (v17);
    }
    goto LABEL_25;
  }
  if (v4)
  {
    v21 = (const void *)_AXCreateAXUIElementWithElement();
    Data = (void *)_AXUIElementCreateData();
    if (v21)
      CFRelease(v21);
  }
  else
  {
    Data = 0;
  }
LABEL_7:

  return Data;
}

- (void)_accessibilityRelayToChrome:(unsigned int)a3 object:(id)a4
{
  uint64_t v4;
  void *v6;
  void *v7;
  id v8;
  NSObject *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(_QWORD *)&a3;
  -[UIKitWebAccessibilityObjectWrapper _axDataConvertForNotification:](self, "_axDataConvertForNotification:", a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(MEMORY[0x24BDD1618], "archivedDataWithRootObject:requiringSecureCoding:error:", v6, 1, &v12);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v12;
  if (v8)
  {
    AXLogCommon();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      -[UIKitWebAccessibilityObjectWrapper _accessibilityRelayToChrome:object:].cold.1();

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  AXWebNotificationName(v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper handleNotificationRelayToChrome:notificationData:](self, "handleNotificationRelayToChrome:notificationData:", v11, v7);

}

- (id)_accessibilityValueForHandwriting
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper accessibilityValue](&v3, sel_accessibilityValue);
  return (id)objc_claimAutoreleasedReturnValue();
}

- (_NSRange)_accessibilitySelectedTextRangeForHandwritingWithValue:(id)a3
{
  id v4;
  unint64_t v5;
  id v6;
  NSUInteger v7;
  uint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  NSUInteger v11;
  objc_super v12;
  _NSRange result;

  v4 = a3;
  v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if ((*MEMORY[0x24BDFEF80] & ~v5) != 0)
  {
    v6 = (id)-[UIKitWebAccessibilityObjectWrapper _accessibilitySelectedTextRange](self, "_accessibilitySelectedTextRange");
  }
  else
  {
    v12.receiver = self;
    v12.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    v6 = -[UIKitWebAccessibilityObjectWrapper _accessibilitySelectedTextRange](&v12, sel__accessibilitySelectedTextRange);
  }
  v8 = (uint64_t)v6;
  v9 = v7;
  if (v6 == (id)0x7FFFFFFFFFFFFFFFLL)
  {
    v8 = objc_msgSend(v4, "length");
    v9 = 0;
  }

  v10 = v8;
  v11 = v9;
  result.length = v11;
  result.location = v10;
  return result;
}

- (void)_accessibilityInsertText:(id)a3
{
  id v3;
  void *v4;
  id v5;

  v3 = a3;
  v4 = v3;
  if (v3)
  {
    v5 = v3;
    AXPerformSafeBlock();

  }
}

uint64_t __63__UIKitWebAccessibilityObjectWrapper__accessibilityInsertText___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "accessibilityInsertText:", *(_QWORD *)(a1 + 40));
}

- (void)_accessibilityReplaceCharactersAtCursor:(unint64_t)a3 withString:(id)a4
{
  __CFString *v4;
  __CFString *v5;
  __CFString *v6;
  __CFString *v7;

  v4 = (__CFString *)a4;
  v5 = &stru_24FF86C78;
  if (v4)
    v5 = v4;
  v7 = v5;
  v6 = v5;
  AXPerformSafeBlock();

}

void __89__UIKitWebAccessibilityObjectWrapper__accessibilityReplaceCharactersAtCursor_withString___block_invoke(uint64_t a1)
{
  unint64_t v2;
  unint64_t v3;
  unint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  id v10;

  v2 = objc_msgSend(*(id *)(a1 + 32), "_accessibilitySelectedTextRange");
  v4 = v3;
  v5 = objc_msgSend(*(id *)(a1 + 32), "accessibilityTraits");
  v6 = *MEMORY[0x24BEBB168];
  v7 = *MEMORY[0x24BEBB168] & v5;
  if (v7 == *MEMORY[0x24BEBB168])
  {
    objc_msgSend(*(id *)(a1 + 32), "accessibilityValue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v2 = objc_msgSend(v8, "length");

    v4 = 0;
  }
  if (!v4)
  {
    if (v2 >= *(_QWORD *)(a1 + 48))
      v4 = *(_QWORD *)(a1 + 48);
    else
      v4 = v2;
    v2 -= v4;
  }
  objc_msgSend(*(id *)(a1 + 32), "accessibilityReplaceRange:withText:", v2, v4, *(_QWORD *)(a1 + 40));
  if (v7 == v6)
  {
    v9 = *(void **)(a1 + 32);
    objc_msgSend(v9, "accessibilityValue");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "_accessibilitySetSelectedTextRange:", objc_msgSend(v10, "length"), 0);

  }
}

- (id)_accessibilityTextViewTextOperationResponder
{
  void *v2;
  void *v3;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityTextViewTextOperationResponder");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)_accessibilityHasTextOperations
{
  objc_super v4;

  if (-[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2"))
    return 1;
  v4.receiver = self;
  v4.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return -[UIKitWebAccessibilityObjectWrapper _accessibilityHasTextOperations](&v4, sel__accessibilityHasTextOperations);
}

- (BOOL)_accessibilitySupportsTextInsertionAndDeletion
{
  unint64_t v3;
  BOOL v4;
  void *v5;
  UIKitWebAccessibilityObjectWrapper *v6;

  v3 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
  if (((*MEMORY[0x24BDFEE60] | *MEMORY[0x24BDFEEF0]) & v3) != 0)
    return 0;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "_accessibilityResponderElement");
  v6 = (UIKitWebAccessibilityObjectWrapper *)objc_claimAutoreleasedReturnValue();
  v4 = v6 == self;

  return v4;
}

- (id)accessibilityIdentifier
{
  void *v3;
  objc_super v5;
  _QWORD block[4];
  __CFString *v7;

  if (!_AXSAutomationEnabled())
    return 0;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __61__UIKitWebAccessibilityObjectWrapper_accessibilityIdentifier__block_invoke;
  block[3] = &unk_24FF868D0;
  v7 = CFSTR("AXEnableWebKitDOMIdentifier");
  if (accessibilityIdentifier_onceToken != -1)
    dispatch_once(&accessibilityIdentifier_onceToken, block);
  if (accessibilityIdentifier_UsesDOMAsIdentifier)
  {
    v5.receiver = self;
    v5.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    -[UIKitWebAccessibilityObjectWrapper accessibilityIdentifier](&v5, sel_accessibilityIdentifier);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

uint64_t __61__UIKitWebAccessibilityObjectWrapper_accessibilityIdentifier__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFPreferencesGetAppBooleanValue(*(CFStringRef *)(a1 + 32), (CFStringRef)*MEMORY[0x24BED26B8], 0);
  accessibilityIdentifier_UsesDOMAsIdentifier = (_DWORD)result != 0;
  return result;
}

- (void)_performPostScrollStatus:(id)a3
{
  -[UIKitWebAccessibilityObjectWrapper _axHandleNotificationPosting:data:](self, "_axHandleNotificationPosting:data:", *MEMORY[0x24BDF72E0], a3);
}

- (BOOL)accessibilityScroll:(int64_t)a3
{
  _BOOL4 v5;
  objc_super v7;

  v5 = -[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2");
  if (v5)
  {
    LastScrollDirection = a3;
    v7.receiver = self;
    v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
    LOBYTE(v5) = -[UIKitWebAccessibilityObjectWrapper accessibilityScroll:](&v7, sel_accessibilityScroll_, a3);
  }
  return v5;
}

- (id)_accessibilityScrollStatus
{
  void *v3;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityMakeScrollStatus](self, "_accessibilityMakeScrollStatus");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }
  return v3;
}

- (id)_accessibilityMakeScrollStatus
{
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  CGRect v24;
  CGRect v25;

  -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityScrollVisibleRect"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "CGRectValue");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("_accessibilityScrollSize"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "CGSizeValue");
  v14 = v13;
  v16 = v15;

  if ((unint64_t)LastScrollDirection > 4 || ((1 << LastScrollDirection) & 0x19) == 0)
  {
    if ((unint64_t)(LastScrollDirection - 1) <= 1 && v14 > v9)
    {
      v25.origin.x = v5;
      v25.origin.y = v7;
      v25.size.width = v9;
      v25.size.height = v11;
      CGRectGetMidX(v25);
    }
  }
  else if (v16 > v11)
  {
    v24.origin.x = v5;
    v24.origin.y = v7;
    v24.size.width = v9;
    v24.size.height = v11;
    CGRectGetMidY(v24);
  }
  v18 = (void *)MEMORY[0x24BDD17C8];
  UIKitAccessibilityLocalizedString();
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  AXFormatInteger();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "stringWithFormat:", v19, v20, v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  return v22;
}

- (void)_repostWebNotification:(id)a3
{
  -[UIKitWebAccessibilityObjectWrapper _axHandleNotificationPosting:data:](self, "_axHandleNotificationPosting:data:", objc_msgSend(a3, "unsignedIntValue"), 0);
}

- (void)_enqueReorderingNotification:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  UIKitWebAccessibilityObjectWrapper *v12;
  void *v13;
  UIKitWebAccessibilityObjectWrapper *v14;
  UIKitWebAccessibilityObjectWrapper *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  _QWORD v19[5];

  v4 = a3;
  if (!TextEditingReorderQueue)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v5 = objc_claimAutoreleasedReturnValue();
    v6 = (void *)TextEditingReorderQueue;
    TextEditingReorderQueue = v5;

    v7 = objc_alloc(MEMORY[0x24BDFE490]);
    v8 = objc_msgSend(v7, "initWithTargetSerialQueue:", MEMORY[0x24BDAC9B8]);
    v9 = (void *)TextEditingReorderTimer;
    TextEditingReorderTimer = v8;

  }
  objc_msgSend(v4, "objectForKey:", CFSTR("notification"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "unsignedIntValue");

  if (v11 == 1017)
  {
    v12 = self;
    if (v12)
    {
      v13 = v12;
      v14 = v12;
      do
      {
        if (objc_msgSend(v13, "isAccessibilityElement"))
        {
          v15 = v13;

          v14 = v15;
        }
        objc_msgSend(v13, "accessibilityContainer");
        v16 = objc_claimAutoreleasedReturnValue();

        v13 = (void *)v16;
      }
      while (v16);
    }
    else
    {
      v14 = 0;
    }
    v17 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](v14, "accessibilityTraits");
    if ((*MEMORY[0x24BDFEED8] & v17) != 0)
      v18 = &unk_24FF8CA58;
    else
      v18 = &unk_24FF8CA80;
    objc_msgSend((id)TextEditingReorderQueue, "addObject:", v18);

  }
  else
  {
    objc_msgSend((id)TextEditingReorderQueue, "addObject:", v4);
  }
  objc_msgSend((id)TextEditingReorderTimer, "cancel");
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __67__UIKitWebAccessibilityObjectWrapper__enqueReorderingNotification___block_invoke;
  v19[3] = &unk_24FF868D0;
  v19[4] = self;
  objc_msgSend((id)TextEditingReorderTimer, "afterDelay:processBlock:", v19, 0.05);

}

void __67__UIKitWebAccessibilityObjectWrapper__enqueReorderingNotification___block_invoke(uint64_t a1)
{
  void *v1;
  unint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id obj;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x24BDAC8D0];
  if (objc_msgSend(*(id *)(a1 + 32), "_prepareAccessibilityCall"))
  {
    v1 = (void *)objc_opt_new();
    if (objc_msgSend((id)TextEditingReorderQueue, "count"))
    {
      v2 = 0;
      do
      {
        objc_msgSend((id)TextEditingReorderQueue, "objectAtIndexedSubscript:", v2);
        v3 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "objectForKey:", CFSTR("notification"));
        v4 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend((id)TextEditingReorderQueue, "objectAtIndexedSubscript:", v2);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v1, "setObject:forKeyedSubscript:", v5, v4);

        ++v2;
      }
      while (v2 < objc_msgSend((id)TextEditingReorderQueue, "count"));
    }
    v6 = (void *)TextEditingReorderQueue;
    v19 = v1;
    objc_msgSend(v1, "allValues");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setArray:", v7);

    objc_msgSend((id)TextEditingReorderQueue, "sortUsingComparator:", &__block_literal_global_1114);
    v24 = 0u;
    v25 = 0u;
    v22 = 0u;
    v23 = 0u;
    obj = (id)TextEditingReorderQueue;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v23 != v10)
            objc_enumerationMutation(obj);
          v12 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
          objc_msgSend(v12, "objectForKey:", CFSTR("notification"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v13, "unsignedIntValue");

          objc_msgSend(v12, "objectForKey:", CFSTR("info"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKey:", CFSTR("associatedElement"));
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          if (v16)
            _UIAccessibilitySetAssociatedElementContextForNextNotification();
          v17 = *(void **)(a1 + 32);
          if (objc_msgSend(v17, "_axSupportsWebKitNotificationRelay"))
            v18 = v12;
          else
            v18 = v15;
          objc_msgSend(v17, "_axHandleNotificationPosting:data:", v14, v18);

        }
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v9);
    }

    objc_msgSend((id)TextEditingReorderQueue, "removeAllObjects");
  }
}

uint64_t __67__UIKitWebAccessibilityObjectWrapper__enqueReorderingNotification___block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  int v6;
  void *v7;
  int v8;

  v4 = a3;
  objc_msgSend(a2, "objectForKey:", CFSTR("notification"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntValue");

  objc_msgSend(v4, "objectForKey:", CFSTR("notification"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "unsignedIntValue");
  if (v6 == 1005)
    return -1;
  if (v6 == 1017 || v6 == 1022 || v8 == 1005)
    return 1;
  if (v8 == 1017 || v8 == 1022)
    return -1;
  return 0;
}

- (void)postScreenChangeNotification
{
  id v3;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", *MEMORY[0x24BDF7328]);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__repostWebNotification_, v3, 0);

}

- (BOOL)_accessibilityVisiblePointHonorsScreenBounds
{
  return 1;
}

- (CGRect)accessibilityFrameForScrolling
{
  void *v3;
  id *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  _BOOL4 v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  unint64_t v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  objc_super v49;
  CGRect result;

  objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%p-_accessibilityFrameForScrolling"), self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id *)MEMORY[0x24BEBAD70];
  objc_msgSend((id)*MEMORY[0x24BEBAD70], "objectForKeyedSubscript:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(*v4, "objectForKeyedSubscript:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "CGRectValue");
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v14 = v13;
LABEL_21:

    goto LABEL_22;
  }
  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    if ((didInitIAdCheck & 1) == 0)
    {
      -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIApplication")), "safeValueForKey:", CFSTR("sharedApplication"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      NSClassFromString(CFSTR("AdSheetApplication"));
      isIADs = objc_opt_isKindOfClass() & 1;

      didInitIAdCheck = 1;
    }
    v16 = -[UIKitWebAccessibilityObjectWrapper _axIsWebKit2](self, "_axIsWebKit2");
    if (v16)
    {
      v6 = 0;
    }
    else
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityWebDocumentView](self, "_accessibilityWebDocumentView");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
    }
    if (isIADs)
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityElementRect](self, "accessibilityElementRect");
LABEL_12:
      UIAccessibilityFrameForBounds();
      v8 = v17;
      v10 = v18;
      v12 = v19;
      v14 = v20;
      v21 = (void *)MEMORY[0x24BDD1968];
LABEL_20:
      objc_msgSend(v21, "valueWithCGRect:");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*v4, "setObject:forKeyedSubscript:", v36, v3);

      goto LABEL_21;
    }
    v22 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
    if ((*MEMORY[0x24BDF73D8] & v22) != 0
      && -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount") == 1)
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", 0);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "accessibilityFrame");
      v8 = v24;
      v10 = v25;
      v12 = v26;
      v14 = v27;

    }
    else
    {
      v49.receiver = self;
      v49.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
      -[UIKitWebAccessibilityObjectWrapper accessibilityFrame](&v49, sel_accessibilityFrame);
      v8 = v28;
      v10 = v29;
      v12 = v30;
      v14 = v31;
      if (!v16)
      {
        objc_msgSend(v6, "window");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "convertRect:fromView:", v41, v8, v10, v12, v14);
        v43 = v42;
        v45 = v44;

        v46 = -0.0;
        if (v43 < 0.0)
          v46 = v43;
        v47 = v45 + v46;
        if (v43 < 0.0)
          v43 = 0.0;
        objc_msgSend(v6, "bounds");
        if (v43 > v48 - v47)
          objc_msgSend(v6, "bounds");
        goto LABEL_12;
      }
      if (CGRectIsEmpty(*(CGRect *)&v28))
      {
        -[UIKitWebAccessibilityObjectWrapper accessibilityElementRect](self, "accessibilityElementRect");
        v8 = v32;
        v10 = v33;
        v12 = v34;
        v14 = v35;
      }
    }
    v21 = (void *)MEMORY[0x24BDD1968];
    goto LABEL_20;
  }
  v8 = *MEMORY[0x24BDBF090];
  v10 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v12 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v14 = *(double *)(MEMORY[0x24BDBF090] + 24);
LABEL_22:

  v37 = v8;
  v38 = v10;
  v39 = v12;
  v40 = v14;
  result.size.height = v40;
  result.size.width = v39;
  result.origin.y = v38;
  result.origin.x = v37;
  return result;
}

- (CGRect)accessibilityFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[UIKitWebAccessibilityObjectWrapper accessibilityFrameForScrolling](self, "accessibilityFrameForScrolling");
  if (v2 < 0.0)
    v2 = 0.0;
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGRect)_axGetClippingFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  __UIAccessibilityGetAssociatedCGRect();
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)_setAXClippingFrame:(CGRect)a3
{
  __UIAccessibilitySetAssociatedCGRect();
}

- (CGRect)_accessibilityClippingFrame
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
  NSObject *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  CGRect v25;
  CGRect v26;
  CGRect result;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper _axGetClippingFrame](self, "_axGetClippingFrame");
    if (CGRectIsEmpty(v25))
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = *MEMORY[0x24BDBF090];
      v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
      v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
      v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v3, "_accessibilityClippingFrame");
        v9 = v8;
        v11 = v10;
        v13 = v12;
        v15 = v14;
      }
      else
      {
        v11 = v5;
        v13 = v6;
        v15 = v7;
        v9 = v4;
        if (v3)
        {
          AXLogCommon();
          v16 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
            -[UIKitWebAccessibilityObjectWrapper _accessibilityClippingFrame].cold.1();

          v11 = v5;
          v13 = v6;
          v15 = v7;
          v9 = v4;
        }
      }
      v26.origin.x = v9;
      v26.origin.y = v11;
      v26.size.width = v13;
      v26.size.height = v15;
      if (CGRectIsEmpty(v26))
      {

        goto LABEL_14;
      }
      -[UIKitWebAccessibilityObjectWrapper _setAXClippingFrame:](self, "_setAXClippingFrame:", v9, v11, v13, v15);

    }
    -[UIKitWebAccessibilityObjectWrapper _axGetClippingFrame](self, "_axGetClippingFrame");
    v4 = v17;
    v5 = v18;
    v6 = v19;
    v7 = v20;
    goto LABEL_14;
  }
  v4 = *MEMORY[0x24BDBF090];
  v5 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v6 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v7 = *(double *)(MEMORY[0x24BDBF090] + 24);
LABEL_14:
  v21 = v4;
  v22 = v5;
  v23 = v6;
  v24 = v7;
  result.size.height = v24;
  result.size.width = v23;
  result.origin.y = v22;
  result.origin.x = v21;
  return result;
}

- (CGRect)_accessibilityVisibleFrame
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  void *v11;
  char isKindOfClass;
  CGFloat v13;
  double v14;
  CGFloat v15;
  CGFloat v16;
  CGFloat v17;
  CGFloat v18;
  double v19;
  double v20;
  double v21;
  double v22;
  CGRect v23;
  CGRect result;
  CGRect v25;

  -[UIKitWebAccessibilityObjectWrapper accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  NSClassFromString(CFSTR("WKAccessibilityWebPageObject"));
  -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](self, "accessibilityContainer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v13 = *MEMORY[0x24BDBEFB0];
    v14 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityClippingFrame](self, "_accessibilityClippingFrame");
    v25.origin.x = v15;
    v25.origin.y = v16;
    v25.size.width = v17;
    v25.size.height = v18;
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    *(CGRect *)&v13 = CGRectIntersection(v23, v25);
    v8 = v19;
    v10 = v20;
  }
  v21 = v8;
  v22 = v10;
  result.size.height = v22;
  result.size.width = v21;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)_accessibilityApplication
{
  void *v2;
  void *v3;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_accessibilityApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (_NSRange)_accessibilityRangeForTextMarker:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastObject");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v6);

  v8 = v7;
  v9 = 0;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)_accessibilityRangeForTextMarkers:(id)a3
{
  void *v4;
  uint64_t v5;
  NSUInteger v6;
  NSUInteger v7;
  NSUInteger v8;
  NSUInteger v9;
  _NSRange result;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "count") == 2)
  {
    v5 = -[UIKitWebAccessibilityObjectWrapper _rangeForWebTextMarkers:](self, "_rangeForWebTextMarkers:", v4);
    v7 = v6;
  }
  else
  {
    v7 = 0;
    v5 = 0x7FFFFFFFLL;
  }

  v8 = v5;
  v9 = v7;
  result.length = v9;
  result.location = v8;
  return result;
}

- (_NSRange)_rangeForWebTextMarkers:(id)a3
{
  id v4;
  void *v5;
  unint64_t v6;
  void *v7;
  unint64_t v8;
  NSUInteger v9;
  NSUInteger v10;
  _NSRange result;

  v4 = a3;
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v5);

  objc_msgSend(v4, "lastObject");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v7);
  if (v8 >= v6)
    v9 = v8 - v6;
  else
    v9 = 0;
  if (v8 >= v6)
    v10 = v6;
  else
    v10 = 0x7FFFFFFFLL;
  result.length = v9;
  result.location = v10;
  return result;
}

- (_NSRange)_accessibilitySelectedNSRangeForObject
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  NSUInteger length;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSUInteger v15;
  NSUInteger v16;
  void *v17;
  NSUInteger v18;
  void *v19;
  uint64_t v20;
  void *v21;
  NSUInteger v22;
  void *v23;
  uint64_t v24;
  NSRange v25;
  NSRange v26;
  _NSRange result;
  NSRange v28;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityTextMarkerRangeForSelection](self, "_accessibilityTextMarkerRangeForSelection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v4, "count") == 2)
  {
    objc_msgSend(v4, "objectAtIndex:", 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectAtIndex:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

    if ((v7 & 1) == 0)
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityTextMarkerRange](self, "_accessibilityTextMarkerRange");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIKitWebAccessibilityObjectWrapper _accessibilityConvertDataArrayToTextMarkerArray:](self, "_accessibilityConvertDataArrayToTextMarkerArray:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (objc_msgSend(v11, "count") == 2
        && (objc_msgSend(v11, "objectAtIndex:", 0),
            v12 = (void *)objc_claimAutoreleasedReturnValue(),
            objc_msgSend(v11, "objectAtIndex:", 1),
            v13 = (void *)objc_claimAutoreleasedReturnValue(),
            v14 = objc_msgSend(v12, "isEqual:", v13),
            v13,
            v12,
            (v14 & 1) == 0))
      {
        objc_msgSend(v4, "objectAtIndex:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v17);

        objc_msgSend(v4, "objectAtIndex:", 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v19);

        objc_msgSend(v11, "objectAtIndex:", 0);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v21);

        objc_msgSend(v11, "objectAtIndex:", 1);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = -[UIKitWebAccessibilityObjectWrapper positionForTextMarker:](self, "positionForTextMarker:", v23);

        v26.length = v20 - v18;
        v28.length = v24 - v22;
        v26.location = v18;
        v28.location = v22;
        v25 = NSIntersectionRange(v26, v28);
        length = v25.length;
        if (v25.length)
        {
          v9 = v25.location - v22;
          goto LABEL_8;
        }
      }
      else
      {
        length = 0;
      }
      v9 = 0x7FFFFFFFLL;
LABEL_8:

      goto LABEL_9;
    }
  }
  length = 0;
  v9 = 0x7FFFFFFFLL;
LABEL_9:

  v15 = v9;
  v16 = length;
  result.length = v16;
  result.location = v15;
  return result;
}

- (CGPoint)accessibilityActivationPoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGFloat v9;
  CGFloat v10;
  double MidX;
  double MidY;
  unint64_t v13;
  double v14;
  unint64_t v15;
  void *v16;
  uint64_t v17;
  double v18;
  objc_super v19;
  CGPoint result;
  CGRect v21;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper accessibilityFrame](self, "accessibilityFrame");
    v7 = v3;
    v8 = v4;
    v9 = v5;
    v10 = v6;
    if (!isIADs)
    {
      v13 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
      if ((*MEMORY[0x24BEBB158] & v13) != 0)
      {
        AX_CGRectGetCenter();
      }
      else
      {
        v15 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits");
        if ((*MEMORY[0x24BEBB198] & ~v15) == 0)
        {
          -[UIKitWebAccessibilityObjectWrapper accessibilityValue](self, "accessibilityValue");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          v17 = objc_msgSend(v16, "length");

          if (v17)
          {
            MidX = v7 + 5.0;
            MidY = v8 + 5.0;
            goto LABEL_12;
          }
        }
        v19.receiver = self;
        v19.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
        -[UIKitWebAccessibilityObjectWrapper accessibilityActivationPoint](&v19, sel_accessibilityActivationPoint);
      }
      MidX = v14;
      goto LABEL_12;
    }
    MidX = CGRectGetMidX(*(CGRect *)&v3);
    v21.origin.x = v7;
    v21.origin.y = v8;
    v21.size.width = v9;
    v21.size.height = v10;
    MidY = CGRectGetMidY(v21);
  }
  else
  {
    MidX = *MEMORY[0x24BDBEFB0];
    MidY = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  }
LABEL_12:
  v18 = MidX;
  result.y = MidY;
  result.x = v18;
  return result;
}

- (BOOL)_accessibilityIsScrollable
{
  return 1;
}

- (BOOL)_axHasMultipleAccessibleChildren:(int64_t *)a3
{
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  BOOL v8;
  void *v9;
  int64_t v10;

  v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount");
  if (v5 < 1)
  {
    return 0;
  }
  else
  {
    v6 = v5;
    v7 = 0;
    v8 = 1;
    do
    {
      -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v7);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v9, "isAccessibilityElement"))
      {
        v10 = *a3 + 1;
        *a3 = v10;
      }
      else
      {
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "_axHasMultipleAccessibleChildren:", a3);
        v10 = *a3;
      }

      if (v10 >= 2)
        break;
      v8 = ++v7 < v6;
    }
    while (v6 != v7);
  }
  return v8;
}

- (id)_accessibilityUnignoredVisibleDescendant
{
  return (id)-[UIKitWebAccessibilityObjectWrapper _accessibilityFindDescendant:](self, "_accessibilityFindDescendant:", &__block_literal_global_1133);
}

BOOL __78__UIKitWebAccessibilityObjectWrapper__accessibilityUnignoredVisibleDescendant__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  double v3;
  double v4;
  _BOOL8 v5;

  v2 = a2;
  if (objc_msgSend(v2, "isAccessibilityElement"))
  {
    objc_msgSend(v2, "_accessibilityVisibleFrame");
    v5 = v4 > 0.0 && v3 > 0.0;
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)accessibilityPreviousTextNavigationElement
{
  return -[UIKitWebAccessibilityObjectWrapper accessibilityTextNavigationElementInDirection:](self, "accessibilityTextNavigationElementInDirection:", 2);
}

- (id)accessibilityTextNavigationElementInDirection:(int64_t)a3
{
  unint64_t v5;
  void *v6;
  void *v7;
  void *v8;

  if (-[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall")
    && (v5 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits"),
        (*MEMORY[0x24BEBB198] & v5) == 0))
  {
    objc_msgSend(MEMORY[0x24BEBADC8], "defaultVoiceOverOptions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setDirection:", a3);
    -[UIKitWebAccessibilityObjectWrapper _accessibilityElementsInDirectionWithCount:options:](self, "_accessibilityElementsInDirectionWithCount:options:", 1, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)accessibilityNextTextNavigationElement
{
  return -[UIKitWebAccessibilityObjectWrapper accessibilityTextNavigationElementInDirection:](self, "accessibilityTextNavigationElementInDirection:", 1);
}

- (void)_repostFocusChangeNotification
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  unint64_t v11;
  id v12;
  unsigned int *v13;
  uint64_t v14;

  -[objc_class safeValueForKey:](NSClassFromString(CFSTR("UIPeripheralHost")), "safeValueForKey:", CFSTR("sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "safeBoolForKey:", CFSTR("isOnScreen")) & 1) == 0
    && -[UIKitWebAccessibilityObjectWrapper _prepareAccessibilityCall](self, "_prepareAccessibilityCall"))
  {
    -[UIKitWebAccessibilityObjectWrapper safeValueForKey:](self, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = 0;
    objc_msgSend(v4, "_accessibilityUnignoredDescendant");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_opt_respondsToSelector() & 1) != 0
      && objc_msgSend(v4, "_axHasMultipleAccessibleChildren:", &v14)
      && (-[UIKitWebAccessibilityObjectWrapper safeBoolForKey:](self, "safeBoolForKey:", CFSTR("accessibilityIsDialog")) & 1) == 0
      && (v14 > 4 || !v5))
    {
      v10 = v4;
    }
    else
    {
      v6 = v4;
      if (v4 != v5)
      {
        objc_msgSend(v4, "_accessibilityUnignoredVisibleDescendant");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        if (v7)
        {
          v9 = v7;

          v5 = v9;
        }

        v6 = v5;
      }
      v10 = v6;

      if ((objc_msgSend(v10, "accessibilityElementIsFocused") & 1) == 0)
      {
        if (objc_msgSend(v10, "safeBoolForKey:", CFSTR("accessibilityIsShowingValidationMessage"))
          && (v11 = -[UIKitWebAccessibilityObjectWrapper accessibilityTraits](self, "accessibilityTraits"),
              ((*MEMORY[0x24BEBB198] | *MEMORY[0x24BEBB128]) & v11) != 0))
        {
          v12 = 0;
          v13 = (unsigned int *)MEMORY[0x24BDF7328];
        }
        else
        {
          v13 = (unsigned int *)MEMORY[0x24BEBB030];
          v12 = v10;
        }
        -[UIKitWebAccessibilityObjectWrapper _axHandleNotificationPosting:data:](self, "_axHandleNotificationPosting:data:", *v13, v12);
      }
      v5 = v10;
    }

  }
}

- (void)accessibilityOverrideProcessNotification:(id)a3
{
  -[UIKitWebAccessibilityObjectWrapper accessibilityOverrideProcessNotification:notificationData:](self, "accessibilityOverrideProcessNotification:notificationData:", a3, 0);
}

- (void)accessibilityOverrideProcessNotification:(id)a3 notificationData:(id)a4
{
  id v6;
  void *v7;
  int v8;
  char *v9;
  UIKitWebAccessibilityObjectWrapper *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  _QWORD v16[2];
  _QWORD v17[3];

  v17[2] = *MEMORY[0x24BDAC8D0];
  v6 = a4;
  AXWebNotificationWithName(a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "unsignedIntValue");
  if (v8 > 1025)
  {
    if (v8 <= 3031)
    {
      if (v8 != 1026)
      {
        if (v8 != 1046)
          goto LABEL_28;
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1046);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        -[UIKitWebAccessibilityObjectWrapper performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__repostWebNotification_, v13, 0);
LABEL_26:

        goto LABEL_28;
      }
    }
    else if (v8 != 3032 && v8 != 3033)
    {
      if (v8 != 3034)
        goto LABEL_28;
      v9 = sel__performLiveRegionUpdate;
      v10 = self;
      v11 = 0;
      goto LABEL_22;
    }
    AXPerformBlockOnMainThread();
    goto LABEL_28;
  }
  if (v8 > 1008)
  {
    if (v8 == 1009)
    {
      -[UIKitWebAccessibilityObjectWrapper _accessibilityMakeScrollStatus](self, "_accessibilityMakeScrollStatus");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      LastScrollDirection = 0;
      -[UIKitWebAccessibilityObjectWrapper performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__performPostScrollStatus_, v14, 0);

      goto LABEL_28;
    }
    if (v8 != 1017)
    {
      if (v8 == 1020)
        AXPerformBlockOnMainThreadAfterDelay();
      goto LABEL_28;
    }
    v9 = sel__enqueReorderingNotification_;
    v11 = &unk_24FF8CAA8;
    v10 = self;
LABEL_22:
    -[UIKitWebAccessibilityObjectWrapper performSelectorOnMainThread:withObject:waitUntilDone:](v10, "performSelectorOnMainThread:withObject:waitUntilDone:", v9, v11, 0);
    goto LABEL_28;
  }
  if (v8 == 1005)
  {
    v16[0] = CFSTR("notification");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", *MEMORY[0x24BEBB1D0]);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v16[1] = CFSTR("associatedElement");
    v17[0] = v13;
    v17[1] = self;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v17, v16, 2);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIKitWebAccessibilityObjectWrapper performSelectorOnMainThread:withObject:waitUntilDone:](self, "performSelectorOnMainThread:withObject:waitUntilDone:", sel__enqueReorderingNotification_, v15, 0);

    goto LABEL_26;
  }
  if (v8 == 1008)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17C8]), "initWithData:encoding:", v6, 4);
    if (objc_msgSend(v12, "length"))
      UIAccessibilityPostNotification(*MEMORY[0x24BDF71E8], v12);

  }
LABEL_28:

}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_repostFocusChangeNotification");
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleNotificationPosting:data:", 1026, *(_QWORD *)(a1 + 32));
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleNotificationPosting:data:", 3032, *(_QWORD *)(a1 + 32));
}

uint64_t __96__UIKitWebAccessibilityObjectWrapper_accessibilityOverrideProcessNotification_notificationData___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_axHandleNotificationPosting:data:", 3033, *(_QWORD *)(a1 + 32));
}

- (CGRect)bounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (unint64_t)_axLinkTrait
{
  return *MEMORY[0x24BDF73D8];
}

- (unint64_t)_axVisitedTrait
{
  return *MEMORY[0x24BEBB1B0];
}

- (unint64_t)_axHeaderTrait
{
  return *MEMORY[0x24BDF73C0];
}

- (unint64_t)_axWebContentTrait
{
  return *MEMORY[0x24BEBB1B8];
}

- (unint64_t)_axSecureTextFieldTrait
{
  return *MEMORY[0x24BEBB168];
}

- (unint64_t)_axTextEntryTrait
{
  return *MEMORY[0x24BEBB198];
}

- (unint64_t)_axHasTextCursorTrait
{
  return *MEMORY[0x24BEBB128];
}

- (unint64_t)_axTextOperationsAvailableTrait
{
  return *MEMORY[0x24BEBB1A0];
}

- (unint64_t)_axImageTrait
{
  return *MEMORY[0x24BDF73C8];
}

- (unint64_t)_axTabBarTrait
{
  return *MEMORY[0x24BDF7420];
}

- (unint64_t)_axButtonTrait
{
  return *MEMORY[0x24BDF73B0];
}

- (unint64_t)_axToggleTrait
{
  return *MEMORY[0x24BDF7428];
}

- (unint64_t)_axPopupButtonTrait
{
  return *MEMORY[0x24BEBB150];
}

- (unint64_t)_axStaticTextTrait
{
  return *MEMORY[0x24BDF7410];
}

- (unint64_t)_axAdjustableTrait
{
  return *MEMORY[0x24BDF73A0];
}

- (unint64_t)_axMenuItemTrait
{
  return *MEMORY[0x24BEBB140];
}

- (unint64_t)_axSelectedTrait
{
  return *MEMORY[0x24BDF7400];
}

- (unint64_t)_axNotEnabledTrait
{
  return *MEMORY[0x24BDF73E8];
}

- (unint64_t)_axRadioButtonTrait
{
  return *MEMORY[0x24BEBB158];
}

- (unint64_t)_axSearchFieldTrait
{
  return *MEMORY[0x24BDF73F8];
}

- (unint64_t)_axTextAreaTrait
{
  return *MEMORY[0x24BDFF000];
}

- (unint64_t)_axUpdatesFrequentlyTrait
{
  return *MEMORY[0x24BDF7430];
}

- (BOOL)_accessibilityMoveFocusWithHeading:(unint64_t)a3 toElementMatchingQuery:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];
  id v13;
  uint64_t *v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;

  v6 = a4;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](self, "_accessibilityWebPageParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIKitWebAccessibilityObjectWrapper _accessibilityNextElementsWithHeading:queryString:startingFrom:](self, "_accessibilityNextElementsWithHeading:queryString:startingFrom:", a3, v6, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v18 = 0;
  v12[0] = MEMORY[0x24BDAC760];
  v12[1] = 3221225472;
  v12[2] = __96__UIKitWebAccessibilityObjectWrapper__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke;
  v12[3] = &unk_24FF86AE0;
  v12[4] = self;
  v14 = &v15;
  v10 = v8;
  v13 = v10;
  objc_msgSend(v9, "enumerateObjectsUsingBlock:", v12);
  LOBYTE(v7) = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return (char)v7;
}

void __96__UIKitWebAccessibilityObjectWrapper__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke(uint64_t a1, void *a2, uint64_t a3, _BYTE *a4)
{
  id v6;
  void *v7;
  void *v8;

  v6 = a2;
  AXPerformSafeBlock();
  objc_msgSend(*(id *)(a1 + 32), "_accessibilityWebPageParent");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v8, "isEqual:", *(_QWORD *)(a1 + 40)) ^ 1;
    *a4 = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  }

}

uint64_t __96__UIKitWebAccessibilityObjectWrapper__accessibilityMoveFocusWithHeading_toElementMatchingQuery___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetFocus:", 1);
}

- (id)_accessibilityNextElementsWithHeading:(unint64_t)a3 queryString:(id)a4 startingFrom:(id)a5
{
  __int16 v6;
  id v7;
  id v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id v12;
  id v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  id v20;
  _QWORD v21[5];
  _QWORD v22[6];

  v6 = a3;
  v22[5] = *MEMORY[0x24BDAC8D0];
  v7 = a4;
  v8 = a5;
  if ((v6 & 0x330) != 0)
  {
    v9 = CFSTR("AXDirectionNext");
    if ((v6 & 0x110) == 0)
      v9 = CFSTR("AXDirectionPrevious");
    v21[0] = CFSTR("AXDirection");
    v21[1] = CFSTR("AXImmediateDescendantsOnly");
    v22[0] = v9;
    v22[1] = MEMORY[0x24BDBD1C0];
    v21[2] = CFSTR("AXResultsLimit");
    v21[3] = CFSTR("AXVisibleOnly");
    v22[2] = &unk_24FF8C558;
    v22[3] = MEMORY[0x24BDBD1C0];
    v21[4] = CFSTR("AXSearchKey");
    v22[4] = CFSTR("AXKeyboardFocusableSearchKey");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v22, v21, 5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    if ((v6 & 0x30) != 0 && v8)
      objc_msgSend(v11, "setObject:forKey:", v8, CFSTR("AXStartElement"));
    if (v7)
      objc_msgSend(v11, "setObject:forKey:", v7, CFSTR("AXSearchText"));
    v15 = 0;
    v16 = &v15;
    v17 = 0x3032000000;
    v18 = __Block_byref_object_copy_;
    v19 = __Block_byref_object_dispose_;
    v20 = 0;
    v14 = v11;
    AXPerformSafeBlock();
    v12 = (id)v16[5];

    _Block_object_dispose(&v15, 8);
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

void __101__UIKitWebAccessibilityObjectWrapper__accessibilityNextElementsWithHeading_queryString_startingFrom___block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "accessibilityFindMatchingObjects:", *(_QWORD *)(a1 + 40));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

- (BOOL)_accessibilityHasNativeFocus
{
  UIKitWebAccessibilityObjectWrapper *v2;
  void *v3;
  void *v4;
  char v5;
  void *v6;
  uint64_t v7;

  v2 = self;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](v2, "_accessibilityWebPageParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    do
    {
      v5 = objc_msgSend(v4, "isEqual:", v2);
      if ((v5 & 1) != 0)
        break;
      -[UIKitWebAccessibilityObjectWrapper accessibilityContainer](v2, "accessibilityContainer");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v7 = objc_claimAutoreleasedReturnValue();

      v2 = (UIKitWebAccessibilityObjectWrapper *)v7;
    }
    while (v7);

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)_accessibilitySetNativeFocus
{
  UIKitWebAccessibilityObjectWrapper *v2;
  void *v3;
  void *v4;
  void *v5;
  char v6;
  id v7;
  uint64_t v8;
  BOOL v9;
  void *v10;
  void *v11;
  void *v12;

  v2 = self;
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](v2, "_accessibilityWebPageParent");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    v5 = v2;
    while (1)
    {
      v6 = objc_msgSend(v4, "_accessibilityIsDescendantOfElement:", v5);
      if ((v6 & 1) != 0)
      {
        v7 = v5;
        v12 = v4;
        goto LABEL_12;
      }
      v7 = v5;
      AXPerformSafeBlock();
      v8 = AXRequestingClient();
      v9 = v8 == 10;
      if (v8 != 10)
        break;
      -[UIKitWebAccessibilityObjectWrapper _accessibilityWebPageParent](v2, "_accessibilityWebPageParent");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "safeValueForKey:", CFSTR("accessibilityFocusedUIElement"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if ((objc_msgSend(v12, "isEqual:", v7) & 1) != 0)
        goto LABEL_11;
      objc_msgSend(v7, "accessibilityContainer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      v4 = v12;
      if (!v5)
      {
        v7 = 0;
        goto LABEL_12;
      }
    }
    v12 = v4;
LABEL_11:

    v6 = v9;
LABEL_12:

    v4 = v12;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

uint64_t __66__UIKitWebAccessibilityObjectWrapper__accessibilitySetNativeFocus__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_accessibilitySetFocus:", 1);
}

- (BOOL)_accessibilityHandlesArrowKeys
{
  return 1;
}

- (BOOL)_axAreChildrenFocused
{
  return __UIAccessibilityGetAssociatedBool();
}

- (void)_axSetAreChildrenFocused:(BOOL)a3
{
  __UIAccessibilitySetAssociatedBool();
}

- (NSArray)preferredFocusEnvironments
{
  return (NSArray *)MEMORY[0x24BDBD1A8];
}

- (UIFocusEnvironment)parentFocusEnvironment
{
  return (UIFocusEnvironment *)-[UIKitWebAccessibilityObjectWrapper _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_1365, 0);
}

uint64_t __80__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__parentFocusEnvironment__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "conformsToProtocol:", &unk_255EAB0F0);
}

- (NSString)focusGroupIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  -[UIKitWebAccessibilityObjectWrapper focusGroupIdentifier](&v9, sel_focusGroupIdentifier);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3
    || (-[UIKitWebAccessibilityObjectWrapper _accessibilityParentView](self, "_accessibilityParentView"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v4, "safeValueForKey:", CFSTR("_containingScrollView")),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        v5,
        v4,
        v5))
  {
    v6 = v3;
  }
  else
  {
    -[UIKitWebAccessibilityObjectWrapper _accessibilityDefaultFocusGroupIdentifier](self, "_accessibilityDefaultFocusGroupIdentifier");
    v6 = (id)objc_claimAutoreleasedReturnValue();
  }
  v7 = v6;

  return (NSString *)v7;
}

- (void)setNeedsFocusUpdate
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "requestFocusUpdateToEnvironment:", self);
  -[UIKitWebAccessibilityObjectWrapper _updateFocusLayerFrame](self, "_updateFocusLayerFrame");

}

- (void)updateFocusIfNeeded
{
  id v3;

  objc_msgSend(MEMORY[0x24BDF6A68], "focusSystemForEnvironment:", self);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "updateFocusIfNeeded");
  -[UIKitWebAccessibilityObjectWrapper _updateFocusLayerFrame](self, "_updateFocusLayerFrame");

}

- (BOOL)shouldUpdateFocusInContext:(id)a3
{
  return 1;
}

- (void)didUpdateFocusInContext:(id)a3 withAnimationCoordinator:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;
  UIKitWebAccessibilityObjectWrapper *v10;

  v6 = a3;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __107__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke;
  v8[3] = &unk_24FF86A30;
  v9 = v6;
  v10 = self;
  v7 = v6;
  objc_msgSend(a4, "addCoordinatedAnimations:completion:", v8, 0);

}

uint64_t __107__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__didUpdateFocusInContext_withAnimationCoordinator___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  int v5;

  objc_msgSend(*(id *)(a1 + 32), "nextFocusedItem");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2 == *(void **)(a1 + 40))
  {
    objc_msgSend(v2, "_accessibilityParentView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "_accessibilityIsFKARunningForFocusItem");

    if (v5)
      return objc_msgSend(MEMORY[0x24BDF6A60], "moveRingToFocusItem:", *(_QWORD *)(a1 + 40));
  }
  else
  {

  }
  return objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", *(_QWORD *)(a1 + 40));
}

- (void)_destroyFocusLayer
{
  objc_msgSend(MEMORY[0x24BDF6A60], "removeRingFromFocusItem:", self);
}

- (void)_updateFocusLayerFrame
{
  objc_msgSend(MEMORY[0x24BDF6A60], "updateRingForFocusItem:", self);
}

- (BOOL)canBecomeFocused
{
  int v3;

  v3 = -[UIKitWebAccessibilityObjectWrapper isAccessibilityElement](self, "isAccessibilityElement");
  if (v3)
    LOBYTE(v3) = -[UIKitWebAccessibilityObjectWrapper accessibilityRespondsToUserInteraction](self, "accessibilityRespondsToUserInteraction");
  return v3;
}

- (id)_preferredFocusRegionCoordinateSpace
{
  void *v2;
  void *v3;
  void *v4;

  -[UIKitWebAccessibilityObjectWrapper _accessibilityParentView](self, "_accessibilityParentView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_screen");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "coordinateSpace");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)focusItemsInRect:(CGRect)a3
{
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;
  id v10;
  _QWORD v12[5];

  -[UIKitWebAccessibilityObjectWrapper accessibilityElements](self, "accessibilityElements", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = __75__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__focusItemsInRect___block_invoke;
    v12[3] = &unk_24FF86B50;
    v12[4] = self;
    objc_msgSend(MEMORY[0x24BDD1758], "predicateWithBlock:", v12);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "filteredArrayUsingPredicate:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else if (-[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v6 = 0;
  }
  else
  {
    v6 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCEB8]), "initWithCapacity:", -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount"));
    if (-[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount"))
    {
      v7 = 0;
      do
      {
        -[UIKitWebAccessibilityObjectWrapper accessibilityElementAtIndex:](self, "accessibilityElementAtIndex:", v7);
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_255EAB440))
        {
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) == 0
            || -[UIKitWebAccessibilityObjectWrapper _accessibilityFKAShouldIncludeViewsAsElements](self, "_accessibilityFKAShouldIncludeViewsAsElements"))
          {
            objc_msgSend(v6, "axSafelyAddObject:", v8);
          }
        }

        ++v7;
      }
      while (v7 < -[UIKitWebAccessibilityObjectWrapper accessibilityElementCount](self, "accessibilityElementCount"));
    }
  }
  if (v6)
    v9 = v6;
  else
    v9 = (void *)MEMORY[0x24BDBD1A8];
  v10 = v9;

  return v10;
}

uint64_t __75__UIKitWebAccessibilityObjectWrapper_UIFocusConformance__focusItemsInRect___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;

  v3 = a2;
  if (objc_msgSend(v3, "conformsToProtocol:", &unk_255EAB440))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v4 = objc_msgSend(*(id *)(a1 + 32), "_accessibilityFKAShouldIncludeViewsAsElements");
    else
      v4 = 1;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (BOOL)_prefersFocusContainment
{
  if (-[UIKitWebAccessibilityObjectWrapper conformsToProtocol:](self, "conformsToProtocol:", &unk_255EB0A98)
    || (-[UIKitWebAccessibilityObjectWrapper _accessibilityIsTouchContainer](self, "_accessibilityIsTouchContainer") & 1) != 0)
  {
    return 1;
  }
  else
  {
    return -[UIKitWebAccessibilityObjectWrapper shouldGroupAccessibilityChildren](self, "shouldGroupAccessibilityChildren");
  }
}

- (BOOL)conformsToProtocol:(id)a3
{
  objc_super v7;

  if (&unk_255EAB440 == a3 || &unk_255EAB0F0 == a3 || &unk_255EAB5A0 == a3 || &unk_255EABA90 == a3)
    return 1;
  v7.receiver = self;
  v7.super_class = (Class)UIKitWebAccessibilityObjectWrapper;
  return -[UIKitWebAccessibilityObjectWrapper conformsToProtocol:](&v7, sel_conformsToProtocol_);
}

- (CGRect)frame
{
  double v3;
  double v4;
  double v5;
  double v6;
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
  double v20;
  double v21;
  CGRect result;

  -[UIKitWebAccessibilityObjectWrapper accessibilityFrame](self, "accessibilityFrame");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[UIKitWebAccessibilityObjectWrapper coordinateSpace](self, "coordinateSpace");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIKitWebAccessibilityObjectWrapper _accessibilityWindow](self, "_accessibilityWindow");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "coordinateSpace");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v13)
  {
    objc_msgSend(v13, "convertRect:fromCoordinateSpace:", 0, v4, v6, v8, v10);
    objc_msgSend(v11, "convertRect:fromCoordinateSpace:", v13);
    v4 = v14;
    v6 = v15;
    v8 = v16;
    v10 = v17;
  }

  v18 = v4;
  v19 = v6;
  v20 = v8;
  v21 = v10;
  result.size.height = v21;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:(uint64_t)a3 string:(uint64_t)a4 wantsSentences:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_230E20000, a1, a3, "Could not find rects, we are probably on a different page of the book, so returning CGRectZero", a5, a6, a7, a8, 0);
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:(uint64_t)a3 string:(uint64_t)a4 wantsSentences:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_4(&dword_230E20000, a1, a3, "Could not find rects, using entire frame", a5, a6, a7, a8, 0);
}

- (void)_accessibilityTextRectsForSpeakThisStringRange:string:wantsSentences:.cold.3()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_6();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_230E20000, v1, OS_LOG_TYPE_DEBUG, "Found text markers %{public}@ and %{public}@", v2, 0x16u);
  OUTLINED_FUNCTION_1();
}

- (void)_accessibilityScrollToVisible
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  __int16 v13;
  void *v14;
  __int16 v15;
  void *v16;
  __int16 v17;
  void *v18;
  __int16 v19;
  void *v20;
  uint64_t v21;
  CGPoint v22;
  CGSize v23;
  CGRect v24;
  CGRect v25;
  UIEdgeInsets v26;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_accessibilityContentOffset");
  NSStringFromCGPoint(v22);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "accessibilityFrameForScrolling");
  NSStringFromCGRect(v24);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "bounds");
  NSStringFromCGRect(v25);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentSize");
  NSStringFromCGSize(v23);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "contentInset");
  NSStringFromUIEdgeInsets(v26);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = 138544386;
  v12 = v6;
  v13 = 2114;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  v17 = 2114;
  v18 = v9;
  v19 = 2114;
  v20 = v10;
  _os_log_debug_impl(&dword_230E20000, a3, OS_LOG_TYPE_DEBUG, "This is a web overflow scroll view.  Starting with content offset %{public}@, trying to scroll to %{public}@.  Bounds were %{public}@, content size %{public}@, content inset %{public}@.", (uint8_t *)&v11, 0x34u);

}

void __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_1(void *a1, void *a2)
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  objc_msgSend(a1, "firstObject");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "positionForTextMarker:", v4);
  objc_msgSend(a1, "lastObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a2, "positionForTextMarker:", v5);
  objc_msgSend(a2, "stringForTextMarkers:", a1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_2(&dword_230E20000, v7, v8, "textMarkerRange.start = %d, textMarkerRange.end = %d, textMarkerRange.string = %{public}@", v9, v10, v11, v12, 2u);

  OUTLINED_FUNCTION_0();
}

void __58__UIKitWebAccessibilityObjectWrapper__misspelledWordRotor__block_invoke_cold_2(void *a1, NSObject *a2)
{
  _DWORD v3[2];
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v3[0] = 67109120;
  v3[1] = objc_msgSend(a1, "count");
  _os_log_error_impl(&dword_230E20000, a2, OS_LOG_TYPE_ERROR, "textMarkerRange.count = %d, should've been 2, returning nil.", (uint8_t *)v3, 8u);
  OUTLINED_FUNCTION_1();
}

- (void)_accessibilityRelayToChrome:object:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_230E20000, v0, v1, "Could not encode data: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_accessibilityClippingFrame
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_6();
  OUTLINED_FUNCTION_5(&dword_230E20000, v0, v1, "Could not find clipping frame from container: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

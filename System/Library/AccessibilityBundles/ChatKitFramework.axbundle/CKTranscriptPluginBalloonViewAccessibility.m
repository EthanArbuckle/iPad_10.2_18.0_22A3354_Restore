@implementation CKTranscriptPluginBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKTranscriptPluginBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptPluginBalloonView"), CFSTR("CKBalloonView"));
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKTranscriptPluginBalloonView"), CFSTR("UIView"));
  objc_msgSend(v3, "validateClass:", CFSTR("LPCollaborationFooterView"));
  if (NSClassFromString(CFSTR("RichLinkPluginDataSource")))
    objc_msgSend(v3, "validateClass:", CFSTR("RichLinkPluginDataSource"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("IMTranscriptPluginChatItem"), CFSTR("dataSource"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptPluginBalloonView"), CFSTR("pluginView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkMetadata"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkMetadata"), CFSTR("associatedApplication"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPAssociatedApplicationMetadata"), CFSTR("bundleIdentifier"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPAssociatedApplicationMetadata"), CFSTR("caption"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPAssociatedApplicationMetadata"), CFSTR("clipAction"), "q", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkView"), CFSTR("_captionTapRecognized:"), "v", "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("LPLinkView"), CFSTR("_mediaTapRecognized:"), "v", "@", 0);

}

- (BOOL)isAccessibilityElement
{
  void *v3;
  void *v4;
  void *v5;
  BOOL v6;
  char isKindOfClass;
  _BOOL4 v8;

  -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_700);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (NSClassFromString(CFSTR("RichLinkView")) && (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "_accessibilityFindSubviewDescendantsPassingTest:", &__block_literal_global_703);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5 == 0;

    goto LABEL_16;
  }
  if (!NSClassFromString(CFSTR("MSMessageExtensionBalloonLiveView")))
  {
    if (!NSClassFromString(CFSTR("MSMessageExtensionBalloonView")))
      goto LABEL_11;
    isKindOfClass = 0;
LABEL_9:
    if ((objc_opt_isKindOfClass() & 1) != 0)
      goto LABEL_13;
    goto LABEL_10;
  }
  isKindOfClass = objc_opt_isKindOfClass();
  if (NSClassFromString(CFSTR("MSMessageExtensionBalloonView")))
    goto LABEL_9;
LABEL_10:
  if ((isKindOfClass & 1) == 0)
  {
LABEL_11:
    if (v4)
    {
      v6 = 0;
      goto LABEL_16;
    }
LABEL_15:
    v6 = 1;
    goto LABEL_16;
  }
LABEL_13:
  v8 = -[CKTranscriptPluginBalloonViewAccessibility _axIsAttachedPlugin](self, "_axIsAttachedPlugin");
  v6 = 0;
  if (v8 && !v4)
    goto LABEL_15;
LABEL_16:

  return v6;
}

uint64_t __68__CKTranscriptPluginBalloonViewAccessibility_isAccessibilityElement__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  unsigned __int8 isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("LPCollaborationFooterView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return (v2 != 0) & isKindOfClass;
}

uint64_t __68__CKTranscriptPluginBalloonViewAccessibility_isAccessibilityElement__block_invoke_2(uint64_t a1, void *a2)
{
  id v2;
  unsigned __int8 isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("LPCaptionBarButtonView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return (v2 != 0) & isKindOfClass;
}

- (id)accessibilityValue
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  -[CKTranscriptPluginBalloonViewAccessibility accessibilityValue](&v8, sel_accessibilityValue);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL")
    || -[CKTranscriptPluginBalloonViewAccessibility _axIsAttachedPlugin](self, "_axIsAttachedPlugin"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "accessibilityValue");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAXStringForVariables();
    v5 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v5;
  }
  return v3;
}

- (id)accessibilityLabel
{
  __CFString *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  Class v12;
  Class v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v27;

  if (!-[CKTranscriptPluginBalloonViewAccessibility _axIsAttachedPlugin](self, "_axIsAttachedPlugin"))
  {
    if (-[CKTranscriptPluginBalloonViewAccessibility _axIsHandwriting](self, "_axIsHandwriting"))
    {
      -[CKTranscriptPluginBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAccessibilitySafeClass();
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "safeValueForKeyPath:", CFSTR("IMChatItem.dataSource"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptPluginBalloonViewAccessibility _axHandwritingDescriptionForDataSource:](self, "_axHandwritingDescriptionForDataSource:", v9);
      v10 = objc_claimAutoreleasedReturnValue();
LABEL_9:
      v6 = (void *)v10;

LABEL_21:
LABEL_22:
      objc_opt_class();
      __UIAccessibilityCastAsSafeCategory();
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axMessageSender");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axHighlightedDescription");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axReplyDescription");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axStickerDescription");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axAcknowledgmentDescription");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "_axMessageTime");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      goto LABEL_30;
    }
    if (-[CKTranscriptPluginBalloonViewAccessibility _axIsAppClip](self, "_axIsAppClip"))
    {
      -[CKTranscriptPluginBalloonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("pluginView._metadata"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[CKTranscriptPluginBalloonViewAccessibility _axAppClipDescriptionForMetadata:](self, "_axAppClipDescriptionForMetadata:", v8);
      v18 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (!-[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL"))
      {
        if (!-[CKTranscriptPluginBalloonViewAccessibility _axIsDigitalTouch](self, "_axIsDigitalTouch"))
        {
          v6 = 0;
          goto LABEL_22;
        }
        accessibilityLocalizedString(CFSTR("digital.touch.label"));
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        -[CKTranscriptPluginBalloonViewAccessibility _axDigitalTouchDescription](self, "_axDigitalTouchDescription");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        __UIAXStringForVariables();
        v10 = objc_claimAutoreleasedReturnValue();
        goto LABEL_9;
      }
      -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "accessibilityLabel");
      v18 = objc_claimAutoreleasedReturnValue();
    }
    v6 = (void *)v18;
    goto LABEL_21;
  }
  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsAttachedRichLinkPlugin](self, "_axIsAttachedRichLinkPlugin"))
    v3 = CFSTR("attached.plugin.rich.link.label");
  else
    v3 = CFSTR("attached.plugin.label");
  accessibilityLocalizedString(v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsAttachedHandwritingPlugin](self, "_axIsAttachedHandwritingPlugin"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("dataSource"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPluginBalloonViewAccessibility _axHandwritingDescriptionForDataSource:](self, "_axHandwritingDescriptionForDataSource:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "accessibilityLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = NSClassFromString(CFSTR("MSMessageExtensionBalloonLiveView"));
    if (!objc_msgSend(v6, "length"))
    {
      if (v12)
      {
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          v13 = NSClassFromString(CFSTR("MSMessageExtensionDataSource"));
          if ((objc_opt_respondsToSelector() & 1) != 0)
          {
            objc_opt_class();
            objc_msgSend(v11, "safeValueForKey:", CFSTR("payload"));
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            -[objc_class messagePayloadFromPluginPayload:](v13, "messagePayloadFromPluginPayload:", v14);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            __UIAccessibilityCastAsClass();
            v16 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(v16, "accessibilityLabel");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            if (v17)
              objc_msgSend(v16, "accessibilityLabel");
            else
              objc_msgSend(v16, "summaryText");
            v25 = objc_claimAutoreleasedReturnValue();

            v6 = (void *)v25;
          }
        }
      }
    }

  }
  __AXStringForVariables();
  v24 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_30:

  return v24;
}

- (id)accessibilityHint
{
  void *v3;
  void *v4;

  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "accessibilityHint");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (int64_t)accessibilityContainerType
{
  objc_super v4;

  if (!-[CKTranscriptPluginBalloonViewAccessibility isAccessibilityElement](self, "isAccessibilityElement"))
    return 4;
  v4.receiver = self;
  v4.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  return -[CKTranscriptPluginBalloonViewAccessibility accessibilityContainerType](&v4, sel_accessibilityContainerType);
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  v3 = -[CKTranscriptPluginBalloonViewAccessibility accessibilityTraits](&v6, sel_accessibilityTraits);
  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v3 |= objc_msgSend(v4, "accessibilityTraits");

  }
  return v3;
}

- (id)_axBalloonViewCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  objc_super v11;

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v11.receiver = self;
  v11.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  -[CKTranscriptPluginBalloonViewAccessibility _axBalloonViewCustomActions](&v11, sel__axBalloonViewCustomActions);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v4);

  -[CKTranscriptPluginBalloonViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPluginClearActionProvider"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    accessibilityLocalizedString(CFSTR("plugin.clear.action.title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v6, self, sel__axClear);
    objc_msgSend(v3, "addObject:", v7);
LABEL_7:

    goto LABEL_8;
  }
  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsAppClip](self, "_axIsAppClip"))
  {
    accessibilityLocalizedString(CFSTR("plugin.appClip.OpenInSafari.title"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "accessibilityCustomActions");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v8);

    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6788]), "initWithName:target:selector:", v6, self, sel__axAppClipOpenInSafari);
    objc_msgSend(v3, "addObject:", v9);

    goto LABEL_7;
  }
  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessibilityCustomActions");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v7);
    goto LABEL_7;
  }
LABEL_8:

  return v3;
}

- (BOOL)accessibilityActivate
{
  void *v3;
  void *v4;
  void *v6;
  char v7;
  objc_super v8;

  if (-[CKTranscriptPluginBalloonViewAccessibility _axIsAppClip](self, "_axIsAppClip"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (v3)
    {
      v4 = v3;
      objc_msgSend(v3, "_captionTapRecognized:", 0);

      return 1;
    }
  }
  else if (-[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL"))
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "accessibilityActivate");

    return v7;
  }
  v8.receiver = self;
  v8.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
  return -[CKTranscriptPluginBalloonViewAccessibility accessibilityActivate](&v8, sel_accessibilityActivate);
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  unsigned int result;
  objc_super v4;

  result = -[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL");
  if (result)
  {
    v4.receiver = self;
    v4.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
    return -[CKTranscriptPluginBalloonViewAccessibility _accessibilityMediaAnalysisOptions](&v4, sel__accessibilityMediaAnalysisOptions) | 0x10000;
  }
  return result;
}

- (CGRect)_accessibilityMediaAnalysisFrame
{
  void *v2;
  void *v3;
  void *v4;
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
  double v20;
  CGRect result;

  -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "safeArrayForKey:", CFSTR("_axMediaViews"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "count") == 1)
  {
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_accessibilityVisibleFrame");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;

  }
  else
  {
    objc_msgSend(v2, "_accessibilityVisibleFrame");
    v6 = v13;
    v8 = v14;
    v10 = v15;
    v12 = v16;
  }

  v17 = v6;
  v18 = v8;
  v19 = v10;
  v20 = v12;
  result.size.height = v20;
  result.size.width = v19;
  result.origin.y = v18;
  result.origin.x = v17;
  return result;
}

- (id)automationElements
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  objc_super v8;
  char v9;

  v9 = 0;
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = v4;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)CKTranscriptPluginBalloonViewAccessibility;
    -[CKTranscriptPluginBalloonViewAccessibility automationElements](&v8, sel_automationElements);
    v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  v6 = v5;

  return v6;
}

- (BOOL)_axIsAttachedPlugin
{
  void *v3;
  BOOL v4;
  void *v5;

  -[CKTranscriptPluginBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 0;
  }
  else
  {
    -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (BOOL)_axIsHandwriting
{
  return -[CKTranscriptPluginBalloonViewAccessibility _axIsBalloonOfType:](self, "_axIsBalloonOfType:", CFSTR("com.apple.Handwriting.HandwritingProvider"));
}

- (BOOL)_axIsURL
{
  return -[CKTranscriptPluginBalloonViewAccessibility _axIsBalloonOfType:](self, "_axIsBalloonOfType:", CFSTR("com.apple.messages.URLBalloonProvider"));
}

- (BOOL)_axIsAppClip
{
  void *v3;
  char v4;
  void *v5;
  void *v6;
  _BOOL4 v7;
  BOOL v8;
  BOOL v9;

  -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("LPLinkView"));
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v4 = -[objc_class safeBoolForKey:](NSClassFromString(CFSTR("CPSClipURL")), "safeBoolForKey:", CFSTR("isSupported"));
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("_metadata.associatedApplication"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "safeValueForKey:", CFSTR("bundleIdentifier"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = -[CKTranscriptPluginBalloonViewAccessibility _axIsURL](self, "_axIsURL");
    if (v6)
      v8 = v4;
    else
      v8 = 0;
    v9 = v7 && v8;
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)_axAppClipDescriptionForMetadata:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  unint64_t v7;
  void *v8;
  void *v9;

  v3 = a3;
  objc_msgSend(v3, "safeValueForKey:", CFSTR("associatedApplication"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "safeStringForKey:", CFSTR("title"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "safeStringForKey:", CFSTR("_caption"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v4, "safeIntegerForKey:", CFSTR("clipAction"));
  if (v7 > 2)
  {
    v8 = 0;
  }
  else
  {
    accessibilityLocalizedString(off_2501B2078[v7]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  __UIAXStringForVariables();
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (BOOL)_axIsAttachedHandwritingPlugin
{
  void *v2;
  char isKindOfClass;

  -[CKTranscriptPluginBalloonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("pluginView.dataSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("HWBalloonDataSource"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsAttachedRichLinkPlugin
{
  void *v2;
  char isKindOfClass;

  -[CKTranscriptPluginBalloonViewAccessibility safeValueForKeyPath:](self, "safeValueForKeyPath:", CFSTR("pluginView.dataSource"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("RichLinkPluginDataSource"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)_axHandwritingDescriptionForDataSource:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v3, "safeValueForKeyPath:", CFSTR("handwritingFromPayload.drawing"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("strokes"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      v7 = (void *)MEMORY[0x24BDD17C8];
      accessibilityLocalizedString(CFSTR("handwriting.stroke.description"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "localizedStringWithFormat:", v8, objc_msgSend(v6, "count"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();

      accessibilityLocalizedString(CFSTR("handwriting.label"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      __UIAXStringForVariables();
      v11 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)_axAppClipOpenInSafari
{
  id v2;

  -[CKTranscriptPluginBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("pluginView"));
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_mediaTapRecognized:", 0);

}

- (void)_axClear
{
  id v2;
  id v3;

  -[CKTranscriptPluginBalloonViewAccessibility _accessibilityValueForKey:](self, "_accessibilityValueForKey:", CFSTR("AXPluginClearActionProvider"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v2 = (id)objc_msgSend(v3, "safeValueForKey:", CFSTR("_accessibilityClearPlugin"));

}

@end

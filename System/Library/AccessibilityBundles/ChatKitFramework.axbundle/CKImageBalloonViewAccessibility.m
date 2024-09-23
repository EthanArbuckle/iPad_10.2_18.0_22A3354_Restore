@implementation CKImageBalloonViewAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("CKImageBalloonView");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

- (id)_axLocationPlacemark
{
  JUMPOUT(0x23490A888);
}

- (void)_axSetLocationPlacemark:(id)a3
{
  __UIAccessibilitySetAssociatedObject();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:", CFSTR("CKLocationMediaObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKContactMediaObject"), CFSTR("title"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKLocationMediaObject"), CFSTR("CKContactMediaObject"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKImageBalloonView"), CFSTR("configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:"), "v", "@", "d", "c", "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatItem"), CFSTR("isCommSafetySensitive"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKBalloonView"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKTranscriptCollectionViewController"), CFSTR("delegate"), "@", 0);
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("CKImageBalloonView"), CFSTR("CKObscurableBalloonView"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKObscurableBalloonView"), CFSTR("isObscured"), "B", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKObscurableBalloonView"), CFSTR("warningButton"), "@", 0);
  objc_msgSend(v3, "validateProtocol:hasRequiredInstanceMethod:", CFSTR("CKBalloonViewDelegate"), CFSTR("balloonViewTapped:withModifierFlags:selectedText:"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("CKChatController"), CFSTR("actionMoreIsTappedForChatItem:"), "v", "@", 0);

}

- (id)_axMediaObject
{
  void *v2;
  void *v3;

  -[CKImageBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axChatItemForBalloon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "safeValueForKey:", CFSTR("mediaObject"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v3 = 0;
  }

  return v3;
}

- (BOOL)_axIsVideo
{
  void *v2;
  BOOL v3;

  -[CKImageBalloonViewAccessibility _axMediaObject](self, "_axMediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntForKey:", CFSTR("mediaType")) == 2;

  return v3;
}

- (BOOL)_axIsPhoto
{
  void *v2;
  BOOL v3;

  -[CKImageBalloonViewAccessibility _axMediaObject](self, "_axMediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntForKey:", CFSTR("mediaType")) == 3;

  return v3;
}

- (BOOL)_axIsLocation
{
  void *v2;
  BOOL v3;

  -[CKImageBalloonViewAccessibility _axMediaObject](self, "_axMediaObject");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeIntForKey:", CFSTR("mediaType")) == 5;

  return v3;
}

- (BOOL)_axIsLocating
{
  void *v2;
  char isKindOfClass;

  -[CKImageBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("_axChatItemForBalloon"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKLocatingChatItem"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (BOOL)_axIsJellyfishVideo
{
  void *v3;
  char isKindOfClass;
  void *v5;
  char v6;

  -[CKImageBalloonViewAccessibility _axMediaObject](self, "_axMediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  NSClassFromString(CFSTR("CKMovieMediaObject"));
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) == 0)
    return 0;
  -[CKImageBalloonViewAccessibility _axMediaObject](self, "_axMediaObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safeBoolForKey:", CFSTR("isJellyfishVideo"));

  return v6;
}

- (BOOL)_axIsObscured
{
  return -[CKImageBalloonViewAccessibility safeBoolForKey:](self, "safeBoolForKey:", CFSTR("isObscured"));
}

- (BOOL)_axIsSensitive
{
  void *v2;
  char v3;

  -[CKImageBalloonViewAccessibility _axChatItemForBalloon](self, "_axChatItemForBalloon");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "safeBoolForKey:", CFSTR("isCommSafetySensitive"));

  return v3;
}

- (BOOL)_accessibilitySupportsActivateAction
{
  return 1;
}

- (BOOL)accessibilityActivate
{
  void *v2;
  id v3;
  id v4;
  void *v6;
  void *v7;

  -[CKImageBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v6 = v2;
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v7;
  v4 = v2;
  AXPerformSafeBlock();

  return 1;
}

uint64_t __56__CKImageBalloonViewAccessibility_accessibilityActivate__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "balloonViewTapped:withModifierFlags:selectedText:", *(_QWORD *)(a1 + 40), 0, 0);
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _BOOL4 v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v21;
  void *v22;
  const __CFString *v23;
  void *v24;
  void *v25;

  -[CKImageBalloonViewAccessibility _axMediaObject](self, "_axMediaObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKImageBalloonViewAccessibility _axIsPhoto](self, "_axIsPhoto"))
  {
    objc_msgSend(v3, "_accessibilityValueForKey:", CFSTR("AXCachedPhotoDescription"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (v4)
      goto LABEL_24;
    accessibilityLocalizedString(CFSTR("includes.picture"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "safeValueForKey:", CFSTR("fileURL"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityMetadataDescriptionForImage();
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityEmojiDescription();
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "length"))
    {
      accessibilityUIKitLocalizedString();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v24 = v8;
      v22 = v9;
    }
    else
    {
      if (UIAccessibilityIsImageScreenshot())
      {
        accessibilityUIKitLocalizedString();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v9 = 0;
      }
      v24 = v7;
      v22 = v9;
    }
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_accessibilitySetRetainedValue:forKey:", v4, CFSTR("AXCachedPhotoDescription"), v22, v24, CFSTR("__AXStringForVariablesSentinel"));

    goto LABEL_22;
  }
  if (-[CKImageBalloonViewAccessibility _axIsVideo](self, "_axIsVideo"))
  {
    objc_msgSend(v3, "safeValueForKey:", CFSTR("fileURL"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    UIAccessibilityMetadataDescriptionForVideo();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (-[CKImageBalloonViewAccessibility _axIsJellyfishVideo](self, "_axIsJellyfishVideo"))
    {
      v10 = v6;
LABEL_18:
      v4 = v10;
LABEL_23:

      goto LABEL_24;
    }
    accessibilityLocalizedString(CFSTR("includes.video"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v7;
    v23 = CFSTR("__AXStringForVariablesSentinel");
LABEL_11:
    __UIAXStringForVariables();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_22:

    goto LABEL_23;
  }
  if (-[CKImageBalloonViewAccessibility _axIsLocation](self, "_axIsLocation"))
  {
    -[CKImageBalloonViewAccessibility _axLocationPlacemark](self, "_axLocationPlacemark");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "formattedAddressLines");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "componentsJoinedByString:", CFSTR(" "));
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "safeStringForKey:", CFSTR("title"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v6;
    v23 = CFSTR("__AXStringForVariablesSentinel");
    goto LABEL_11;
  }
  if (-[CKImageBalloonViewAccessibility _axIsLocating](self, "_axIsLocating"))
  {
    accessibilityLocalizedString(CFSTR("locating.label"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (-[CKImageBalloonViewAccessibility _axIsDigitalTouch](self, "_axIsDigitalTouch"))
  {
    accessibilityLocalizedString(CFSTR("digital.touch.label"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonViewAccessibility _axDigitalTouchDescription](self, "_axDigitalTouchDescription");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = v6;
    v23 = CFSTR("__AXStringForVariablesSentinel");
    __UIAXStringForVariables();
    v10 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_18;
  }
  v4 = 0;
LABEL_24:
  objc_opt_class();
  __UIAccessibilityCastAsSafeCategory();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_axMessageSender");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[CKImageBalloonViewAccessibility _axIsObscured](self, "_axIsObscured");
  v15 = 0;
  if (v14)
  {
    accessibilityLocalizedString(CFSTR("media.may.be.sensitive"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v12, "_axReplyDescription", v21, v23);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_axStickerDescription");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_axAcknowledgmentDescription");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "_axMessageTime");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  __UIAXStringForVariables();
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  return v19;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  _BOOL4 v4;
  uint64_t v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CKImageBalloonViewAccessibility;
  v3 = -[CKImageBalloonViewAccessibility accessibilityTraits](&v7, sel_accessibilityTraits);
  v4 = -[CKImageBalloonViewAccessibility _axIsPhoto](self, "_axIsPhoto");
  v5 = *MEMORY[0x24BDF73C8];
  if (!v4)
    v5 = 0;
  return v5 | v3 | *MEMORY[0x24BDF73B0];
}

- (unsigned)_accessibilityMediaAnalysisOptions
{
  objc_super v4;

  if (-[CKImageBalloonViewAccessibility _axIsSensitive](self, "_axIsSensitive"))
    return 0;
  v4.receiver = self;
  v4.super_class = (Class)CKImageBalloonViewAccessibility;
  return -[CKImageBalloonViewAccessibility _accessibilityMediaAnalysisOptions](&v4, sel__accessibilityMediaAnalysisOptions);
}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  uint64_t v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v20[5];
  id v21;
  _QWORD v22[4];
  id v23;
  CKImageBalloonViewAccessibility *v24;
  objc_super v25;

  if (-[CKImageBalloonViewAccessibility _axIsSensitive](self, "_axIsSensitive"))
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKImageBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("delegate"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "safeValueForKey:", CFSTR("delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_alloc(MEMORY[0x24BDF6788]);
    accessibilityLocalizedString(CFSTR("delete.button.label"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = MEMORY[0x24BDAC760];
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __61__CKImageBalloonViewAccessibility_accessibilityCustomActions__block_invoke;
    v22[3] = &unk_2501B1DD0;
    v9 = v5;
    v23 = v9;
    v24 = self;
    v10 = (void *)objc_msgSend(v6, "initWithName:actionHandler:", v7, v22);

    objc_msgSend(v3, "axSafelyAddObject:", v10);
    if (-[CKImageBalloonViewAccessibility _axIsObscured](self, "_axIsObscured"))
    {
      v11 = objc_alloc(MEMORY[0x24BDF6788]);
      accessibilityLocalizedString(CFSTR("sensitive.media.show.button"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v20[0] = v8;
      v20[1] = 3221225472;
      v20[2] = __61__CKImageBalloonViewAccessibility_accessibilityCustomActions__block_invoke_3;
      v20[3] = &unk_2501B1DD0;
      v20[4] = self;
      v21 = v4;
      v13 = (void *)objc_msgSend(v11, "initWithName:actionHandler:", v12, v20);

      objc_msgSend(v3, "axSafelyAddObject:", v13);
    }
    objc_opt_class();
    -[CKImageBalloonViewAccessibility safeValueForKey:](self, "safeValueForKey:", CFSTR("warningButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    __UIAccessibilityCastAsClass();
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "menu");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "children");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    _AXCustomActionsForActions(v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "axSafelyAddObjectsFromArray:", v18);
  }
  else
  {
    v25.receiver = self;
    v25.super_class = (Class)CKImageBalloonViewAccessibility;
    -[CKImageBalloonViewAccessibility accessibilityCustomActions](&v25, sel_accessibilityCustomActions);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

uint64_t __61__CKImageBalloonViewAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 32);
  AXPerformSafeBlock();

  return 1;
}

void __61__CKImageBalloonViewAccessibility_accessibilityCustomActions__block_invoke_2(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "_axChatItemForBalloon");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "actionMoreIsTappedForChatItem:", v2);

}

uint64_t __61__CKImageBalloonViewAccessibility_accessibilityCustomActions__block_invoke_3(uint64_t a1)
{
  id v2;

  v2 = *(id *)(a1 + 40);
  AXPerformSafeBlock();

  return 1;
}

void __61__CKImageBalloonViewAccessibility_accessibilityCustomActions__block_invoke_4(uint64_t a1)
{
  id v2;

  objc_opt_class();
  __UIAccessibilityCastAsClass();
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "balloonViewTapped:withModifierFlags:selectedText:", v2, 0, 0);

}

- (void)configureForMediaObject:(id)a3 previewWidth:(double)a4 orientation:(char)a5 hasInvisibleInkEffect:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v10;
  objc_super v11;

  v6 = a6;
  v7 = a5;
  v11.receiver = self;
  v11.super_class = (Class)CKImageBalloonViewAccessibility;
  v10 = a3;
  -[CKImageBalloonViewAccessibility configureForMediaObject:previewWidth:orientation:hasInvisibleInkEffect:](&v11, sel_configureForMediaObject_previewWidth_orientation_hasInvisibleInkEffect_, v10, v7, v6, a4);
  -[CKImageBalloonViewAccessibility _axWarmLocationCoordinatePlacemarkIfNeededForMediaObject:](self, "_axWarmLocationCoordinatePlacemarkIfNeededForMediaObject:", v10, v11.receiver, v11.super_class);

}

- (void)_axWarmLocationCoordinatePlacemarkIfNeededForMediaObject:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  _QWORD v16[9];
  id v17;
  uint64_t *v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  const char *v22;
  uint64_t v23;
  uint64_t v24;

  v4 = a3;
  if (objc_msgSend(v4, "safeIntForKey:", CFSTR("mediaType")) == 5)
  {
    v19 = 0;
    v20 = (double *)&v19;
    v21 = 0x3010000000;
    v24 = 0;
    v5 = MEMORY[0x24BDAC760];
    v22 = "";
    v23 = 0;
    v16[5] = MEMORY[0x24BDAC760];
    v16[6] = 3221225472;
    v16[7] = __92__CKImageBalloonViewAccessibility__axWarmLocationCoordinatePlacemarkIfNeededForMediaObject___block_invoke;
    v16[8] = &unk_2501B1B28;
    v18 = &v19;
    v17 = v4;
    AXPerformSafeBlock();
    v6 = v20[4];
    v7 = v20[5];

    _Block_object_dispose(&v19, 8);
    -[CKImageBalloonViewAccessibility _axLocationPlacemark](self, "_axLocationPlacemark");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "location");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "coordinate");
    if (v10 == v6)
    {
      objc_msgSend(v8, "location");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "coordinate");
      v13 = v12;

      if (v13 == v7)
        goto LABEL_7;
    }
    else
    {

    }
    -[CKImageBalloonViewAccessibility _axSetLocationPlacemark:](self, "_axSetLocationPlacemark:", 0);
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBFA80]), "initWithLatitude:longitude:", v6, v7);
    v15 = (void *)objc_opt_new();
    v16[0] = v5;
    v16[1] = 3221225472;
    v16[2] = __92__CKImageBalloonViewAccessibility__axWarmLocationCoordinatePlacemarkIfNeededForMediaObject___block_invoke_2;
    v16[3] = &unk_2501B1FB8;
    v16[4] = self;
    objc_msgSend(v15, "reverseGeocodeLocation:completionHandler:", v14, v16);

LABEL_7:
  }

}

uint64_t __92__CKImageBalloonViewAccessibility__axWarmLocationCoordinatePlacemarkIfNeededForMediaObject___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  result = objc_msgSend(*(id *)(a1 + 32), "coordinate");
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  *(_QWORD *)(v3 + 32) = v4;
  *(_QWORD *)(v3 + 40) = v5;
  return result;
}

void __92__CKImageBalloonViewAccessibility__axWarmLocationCoordinatePlacemarkIfNeededForMediaObject___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  id v4;
  void *v5;
  id v6;

  v4 = a2;
  v5 = v4;
  if (!a3 && objc_msgSend(v4, "count"))
  {
    v6 = v5;
    AXPerformBlockOnMainThread();

  }
}

void __92__CKImageBalloonViewAccessibility__axWarmLocationCoordinatePlacemarkIfNeededForMediaObject___block_invoke_3(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "firstObject");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "_axSetLocationPlacemark:", v2);

}

@end

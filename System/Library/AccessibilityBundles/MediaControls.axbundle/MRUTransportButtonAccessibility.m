@implementation MRUTransportButtonAccessibility

+ (id)safeCategoryTargetClassName
{
  return CFSTR("MRUTransportButton");
}

+ (Class)safeCategoryBaseClass
{
  return (Class)objc_opt_class();
}

+ (void)_accessibilityPerformValidations:(id)a3
{
  id v3;

  v3 = a3;
  objc_msgSend(v3, "validateClass:isKindOfClass:", CFSTR("MRUTransportButton"), CFSTR("UIButton"));
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUTransportButton"), CFSTR("packageView"), "@", 0);
  objc_msgSend(v3, "validateClass:hasInstanceMethod:withFullSignature:", CFSTR("MRUCAPackageView"), CFSTR("glyphState"), "@", 0);

}

- (id)accessibilityCustomActions
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  -[MRUTransportButtonAccessibility _accessibilityFindAncestor:startWithSelf:](self, "_accessibilityFindAncestor:startWithSelf:", &__block_literal_global_2, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v7.receiver = self;
    v7.super_class = (Class)MRUTransportButtonAccessibility;
    -[MRUTransportButtonAccessibility accessibilityCustomActions](&v7, sel_accessibilityCustomActions);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    AXGuaranteedMutableArray();
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    UIAccessibilityControlCenterAttachOpenCloseCustomActionsIfNeeded();
  }
  else
  {
    v5 = (void *)MEMORY[0x24BDBD1A8];
  }

  return v5;
}

uint64_t __61__MRUTransportButtonAccessibility_accessibilityCustomActions__block_invoke(uint64_t a1, void *a2)
{
  id v2;
  char isKindOfClass;

  v2 = a2;
  NSClassFromString(CFSTR("MRUControlCenterView"));
  isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)accessibilityLabel
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;
  void *v9;
  void *v11;
  __CFString *v12;
  void *v13;
  NSObject *v14;
  objc_super v15;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_11;
  -[MRUTransportButtonAccessibility imageForState:](self, "imageForState:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "imageAsset");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("assetName"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[MRUTransportButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("packageView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessibilityIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("airplayaudio")))
  {
    v8 = CFSTR("airplay.audio.label");
LABEL_9:
    accessibilityLocalizedString(v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_10;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("airplayvideo")))
  {
    v8 = CFSTR("airplay.video.label");
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("play.fill")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("play")))
  {
    v8 = CFSTR("play.button.label");
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("pause.fill")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("pause")))
  {
    v8 = CFSTR("pause.button.label");
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("stop.fill")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("stop")))
  {
    v8 = CFSTR("stop.button.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("appletvremote"))
    || objc_msgSend(v5, "isEqualToString:", CFSTR("appletvremote-b519")))
  {
    v8 = CFSTR("tv.remote.button.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("captions.bubble")))
  {
    v8 = CFSTR("language.options.button.label");
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("backward.fill")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("backward")))
  {
    v8 = CFSTR("previous.track.button.label");
    goto LABEL_9;
  }
  if ((objc_msgSend(v5, "isEqualToString:", CFSTR("forward.fill")) & 1) != 0
    || objc_msgSend(v7, "isEqualToString:", CFSTR("forward")))
  {
    v8 = CFSTR("next.track.button.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("line.horizontal.3")))
  {
    v8 = CFSTR("menu.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("hand.thumbsup")))
  {
    v8 = CFSTR("like.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("hand.thumbsdown")))
  {
    v8 = CFSTR("dislike.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("plus")))
  {
    v8 = CFSTR("wishlist.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("speaker.wave.2.fill")))
  {
    v8 = CFSTR("playback.destination.button.label");
    goto LABEL_9;
  }
  if (objc_msgSend(v5, "isEqualToString:", CFSTR("goforward.5")))
  {
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("fast.forward.button.label.with.seconds");
  }
  else
  {
    if (!objc_msgSend(v5, "isEqualToString:", CFSTR("gobackward.5")))
    {
      if (objc_msgSend(v5, "isEqualToString:", CFSTR("gobackward.minus")))
      {
        v8 = CFSTR("gobackward.minus.label");
      }
      else if (objc_msgSend(v5, "isEqualToString:", CFSTR("goforward.plus")))
      {
        v8 = CFSTR("goforward.plus.label");
      }
      else
      {
        if (!objc_msgSend(v7, "isEqualToString:", CFSTR("favorite")))
        {
          if (v5)
          {
            AXLogAppAccessibility();
            v14 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              -[MRUControlCenterRouteButtonAccessibility accessibilityLabel].cold.1((uint64_t)v5, v14);

          }
          goto LABEL_11;
        }
        v8 = CFSTR("favorite.button.label");
      }
      goto LABEL_9;
    }
    v11 = (void *)MEMORY[0x24BDD17C8];
    v12 = CFSTR("rewind.button.label.with.seconds");
  }
  accessibilityLocalizedString(v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringWithFormat:", v13, 5);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_10:
  if (!v9)
  {
LABEL_11:
    v15.receiver = self;
    v15.super_class = (Class)MRUTransportButtonAccessibility;
    -[MRUTransportButtonAccessibility accessibilityLabel](&v15, sel_accessibilityLabel);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v9;
}

- (unint64_t)accessibilityTraits
{
  unint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  uint64_t v8;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)MRUTransportButtonAccessibility;
  v3 = -[MRUTransportButtonAccessibility accessibilityTraits](&v10, sel_accessibilityTraits);
  -[MRUTransportButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("packageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "safeStringForKey:", CFSTR("glyphState"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", CFSTR("On"));
    v8 = *MEMORY[0x24BDF7400];
    if (!v7)
      v8 = 0;
    v3 |= v8;

  }
  return v3;
}

- (BOOL)isAccessibilityElement
{
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  BOOL v7;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    return 1;
  -[MRUTransportButtonAccessibility imageForState:](self, "imageForState:", 0);
  v3 = objc_claimAutoreleasedReturnValue();
  -[MRUTransportButtonAccessibility safeUIViewForKey:](self, "safeUIViewForKey:", CFSTR("packageView"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "safeStringForKey:", CFSTR("packageName"));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = v3 | v5;

  v7 = v6 != 0;
  return v7;
}

@end

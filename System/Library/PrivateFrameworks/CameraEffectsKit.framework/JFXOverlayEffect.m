@implementation JFXOverlayEffect

- (JFXOverlayEffect)initWithEffectID:(id)a3
{
  JFXOverlayEffect *v3;
  JFXOverlayEffect *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  JFXTrackedEffectProperties *trackingProps;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)JFXOverlayEffect;
  v3 = -[JFXEffect initWithEffectID:](&v16, sel_initWithEffectID_, a3);
  v4 = v3;
  if (v3)
  {
    v5 = -[JFXOverlayEffect JFX_posterFrameIsCachable](v3, "JFX_posterFrameIsCachable");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect setParameter:forKey:](v4, "setParameter:forKey:", v6, *MEMORY[0x24BE795D0]);

    if (-[JFXOverlayEffect JFX_shouldEnableDynamicLineSpacingForDiacritics](v4, "JFX_shouldEnableDynamicLineSpacingForDiacritics"))
    {
      -[JFXTextEffect enableDynamicLineSpacingForDiacritics:](v4, "enableDynamicLineSpacingForDiacritics:", 1);
    }
    -[JFXTextEffect setupLocalizedText](v4, "setupLocalizedText");
    objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("Overlay Text Single Line Scale Threshold"), &stru_24EE5C428, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "doubleValue");
    -[JFXOverlayEffect setSingleLineScaleThreshold:](v4, "setSingleLineScaleThreshold:");
    v9 = objc_opt_new();
    trackingProps = v4->_trackingProps;
    v4->_trackingProps = (JFXTrackedEffectProperties *)v9;

    -[JFXOverlayEffect JFX_setupTrackingProps](v4, "JFX_setupTrackingProps");
    -[JFXOverlayEffect customPickerRotation](v4, "customPickerRotation");
    if (v11 != 0.0)
    {
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffect setParameter:forKey:](v4, "setParameter:forKey:", v12, CFSTR("PickerRotation"));

    }
    -[JFXOverlayEffect customPrimaryFillColor](v4, "customPrimaryFillColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
      -[JFXEffect setParameter:forKey:](v4, "setParameter:forKey:", v13, CFSTR("PrimaryFillColor"));
    -[JFXOverlayEffect osfaToneMappingOption](v4, "osfaToneMappingOption");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
      -[JFXEffect setParameter:forKey:](v4, "setParameter:forKey:", v14, *MEMORY[0x24BE795B0]);
    atomic_store(0, (unsigned int *)&v4->_isInteractiveEditingCount);
    atomic_store(0, (unsigned int *)&v4->_isEditingFaceTrackingTransformsCount);

  }
  return v4;
}

- (int)type
{
  return 2;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)JFXOverlayEffect;
  v4 = -[JFXTextEffect copyWithZone:](&v12, sel_copyWithZone_, a3);
  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "copy");
  objc_msgSend(v4, "setTrackingProps:", v6);

  -[JFXOverlayEffect faceTrackingTransform](self, "faceTrackingTransform");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "copy");
  objc_msgSend(v4, "setFaceTrackingTransform:", v8);

  -[JFXOverlayEffect accessibilityOverlayEffectLabel](self, "accessibilityOverlayEffectLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "copy");
  objc_msgSend(v4, "setAccessibilityOverlayEffectLabel:", v10);

  objc_msgSend(v4, "setPrefersTrackingNotActivateAutomatically:", -[JFXOverlayEffect prefersTrackingNotActivateAutomatically](self, "prefersTrackingNotActivateAutomatically"));
  return v4;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (JFXOverlayEffect)initWithCoder:(id)a3
{
  id v4;
  JFXOverlayEffect *v5;
  uint64_t v6;
  NSString *accessibilityOverlayEffectLabel;
  uint64_t v8;
  JFXTrackedEffectProperties *trackingProps;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)JFXOverlayEffect;
  v5 = -[JFXEffect initWithCoder:](&v11, sel_initWithCoder_, v4);
  if (v5)
  {
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("kJTAccessibilityOverlayEffectLabelKey"));
    v6 = objc_claimAutoreleasedReturnValue();
    accessibilityOverlayEffectLabel = v5->_accessibilityOverlayEffectLabel;
    v5->_accessibilityOverlayEffectLabel = (NSString *)v6;

    v5->_prefersTrackingNotActivateAutomatically = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("OverlayPrefersTrackingNotActivateAutomaticallyKey"));
    objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("JTOverlayEffectTrackingPropsKey"));
    v8 = objc_claimAutoreleasedReturnValue();
    trackingProps = v5->_trackingProps;
    v5->_trackingProps = (JFXTrackedEffectProperties *)v8;

    -[JFXOverlayEffect JFX_setupTrackingProps](v5, "JFX_setupTrackingProps");
  }

  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXOverlayEffect;
  v4 = a3;
  -[JFXEffect encodeWithCoder:](&v7, sel_encodeWithCoder_, v4);
  -[JFXOverlayEffect trackingProps](self, "trackingProps", v7.receiver, v7.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v5, CFSTR("JTOverlayEffectTrackingPropsKey"));

  -[JFXOverlayEffect accessibilityOverlayEffectLabel](self, "accessibilityOverlayEffectLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "encodeObject:forKey:", v6, CFSTR("kJTAccessibilityOverlayEffectLabelKey"));

  objc_msgSend(v4, "encodeBool:forKey:", -[JFXOverlayEffect prefersTrackingNotActivateAutomatically](self, "prefersTrackingNotActivateAutomatically"), CFSTR("OverlayPrefersTrackingNotActivateAutomaticallyKey"));
}

- (id)serializableEffectParameters
{
  void *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXOverlayEffect;
  -[JFXEffect serializableEffectParameters](&v5, sel_serializableEffectParameters);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(v2, "mutableCopy");

  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE796E8]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE796D8]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE795A0]);
  objc_msgSend(v3, "removeObjectForKey:", *MEMORY[0x24BE795A8]);
  return v3;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  BOOL v8;
  objc_super v10;

  v4 = a3;
  v10.receiver = self;
  v10.super_class = (Class)JFXOverlayEffect;
  if (-[JFXEffect isEqual:](&v10, sel_isEqual_, v4))
  {
    objc_msgSend(v4, "trackingProps");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "currentTrackingType");
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v6 == objc_msgSend(v7, "currentTrackingType");

  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (unint64_t)hash
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXOverlayEffect;
  return -[JFXEffect hash](&v3, sel_hash);
}

- (BOOL)isAppearanceEqual:(id)a3 forPurpose:(unint64_t)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  int v22;
  BOOL v23;
  objc_super v25;

  v6 = a3;
  v25.receiver = self;
  v25.super_class = (Class)JFXOverlayEffect;
  if (-[JFXTextEffect isAppearanceEqual:forPurpose:](&v25, sel_isAppearanceEqual_forPurpose_, v6, a4))
  {
    v7 = v6;
    objc_msgSend(v7, "trackingProps");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "currentTrackingType");
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v10, "currentTrackingType");

    if (v9 != v11)
      goto LABEL_10;
    v12 = (void *)MEMORY[0x24BE790A8];
    -[JFXEffect topLevelTransformObject](self, "topLevelTransformObject");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "topLevelTransformObject");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v12) = objc_msgSend(v12, "isMatrix:equivalentTo:", v13, v14);

    if (!(_DWORD)v12)
      goto LABEL_10;
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "currentTrackingType");
    objc_msgSend(v7, "trackingProps");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "currentTrackingType");

    if (v16 != v18)
      goto LABEL_10;
    if (a4 == 1)
      goto LABEL_8;
    if (!-[JFXOverlayEffect isCurrentlyTracking](self, "isCurrentlyTracking"))
      goto LABEL_8;
    -[JFXOverlayEffect faceTrackingTransform](self, "faceTrackingTransform");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "faceTrackingTransform");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = objc_msgSend(v19, "isEqual:forTrackingType:", v20, objc_msgSend(v21, "currentTrackingType"));

    if (v22)
LABEL_8:
      v23 = 1;
    else
LABEL_10:
      v23 = 0;

  }
  else
  {
    v23 = 0;
  }

  return v23;
}

- (BOOL)isEmoji
{
  void *v3;
  void *v4;
  char v5;
  BOOL v6;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEmoji");
  }
  else
  {
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79350]);
  }
  v6 = v5;

  return v6;
}

- (BOOL)hasBackground
{
  uint64_t v3;
  __int128 v5;
  __int128 v6;
  uint64_t v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  v10 = 0u;
  v11 = 0u;
  v8 = *MEMORY[0x24BDC0D88];
  v5 = v8;
  *(_QWORD *)&v9 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
  v3 = v9;
  -[JFXOverlayEffect objectBounds:time:forcePosterFrame:includeDropShadow:includeMasks:](self, "objectBounds:time:forcePosterFrame:includeDropShadow:includeMasks:", &v10, &v8, 1, 1, 1);
  v8 = 0u;
  v9 = 0u;
  v6 = v5;
  v7 = v3;
  -[JFXTextEffect textBounds:atIndex:time:forcePosterFrame:includeDropShadow:includeMasks:](self, "textBounds:atIndex:time:forcePosterFrame:includeDropShadow:includeMasks:", &v8, 0, &v6, 1, 1, 1);
  return *((double *)&v11 + 1) > *((double *)&v9 + 1);
}

- (void)renderEffectWillLoad
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)JFXOverlayEffect;
  -[JFXEffect renderEffectWillLoad](&v3, sel_renderEffectWillLoad);
  -[JFXOverlayEffect setImageSequencePathToBundledAssets](self, "setImageSequencePathToBundledAssets");
}

- (id)overlayContentDataSource
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3
    && (-[JFXEffect contentDataSource](self, "contentDataSource"),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "conformsToProtocol:", &unk_2559142A8),
        v4,
        v5))
  {
    -[JFXEffect contentDataSource](self, "contentDataSource");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  return v6;
}

- (id)contentProperties
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
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
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  objc_super v31;
  objc_super v32;

  -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v31.receiver = self;
    v31.super_class = (Class)JFXOverlayEffect;
    -[JFXTextEffect contentProperties](&v31, sel_contentProperties);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)objc_msgSend(v4, "mutableCopy");

    objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 15);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isLabel"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, CFSTR("isLabel"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "loopRenderRangeIsCachable"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, CFSTR("loopRenderRangeIsCachable"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "doesNotHavePosterFrame"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, CFSTR("doesNotHavePosterFrame"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "posterFrameIsNotCachable"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v10, CFSTR("posterFrameIsNotCachable"));

    objc_msgSend(v3, "initialRotation");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      objc_msgSend(v3, "initialRotation");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v12, CFSTR("initialRotation"));

    }
    objc_msgSend(v3, "primaryFillColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      objc_msgSend(v3, "primaryFillColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v14, CFSTR("primaryFillColor"));

    }
    objc_msgSend(v3, "hitAreaScale");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      objc_msgSend(v3, "hitAreaScale");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v16, CFSTR("hitAreaScale"));

    }
    objc_msgSend(v3, "pickerScale");
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    if (v17)
    {
      objc_msgSend(v3, "pickerScale");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v18, CFSTR("pickerScale"));

    }
    objc_msgSend(v3, "fontSize");
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v3, "fontSize");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v20, CFSTR("fontSize"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v3, "dynamicTextType"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v21, CFSTR("dynamicTextType"));

    objc_msgSend(v3, "dynamicTextPlaceholder");
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    if (v22)
    {
      objc_msgSend(v3, "dynamicTextPlaceholder");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v23, CFSTR("dynamicTextPlaceholder"));

    }
    objc_msgSend(v3, "shouldDisableDynamicLineSpacingForDiatrics");
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if (v24)
    {
      objc_msgSend(v3, "shouldDisableDynamicLineSpacingForDiatrics");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v25, CFSTR("shouldDisableDynamicLineSpacingForDiatrics"));

    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isEmoji"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v26, CFSTR("isEmoji"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "isTextBakedIn"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v27, CFSTR("isTextBakedIn"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v3, "requireEmojiRenderingWorkaround"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v28, CFSTR("requireEmojiRenderingWorkaround"));

    if (v5)
    {
      objc_msgSend(v5, "addEntriesFromDictionary:", v6);
      v29 = v5;

      v6 = v29;
    }

  }
  else
  {
    v32.receiver = self;
    v32.super_class = (Class)JFXOverlayEffect;
    -[JFXTextEffect contentProperties](&v32, sel_contentProperties);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v6;
}

- (void)setSingleLineScaleThreshold:(double)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE79660]);

}

- (void)setFlipText:(BOOL)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v4, *MEMORY[0x24BE795E8]);

}

- (BOOL)isTextFlipped
{
  void *v3;
  void *v4;
  char v5;
  void *v6;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE795E8]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "BOOLValue");
  }
  else
  {
    -[JFXEffect renderEffect](self, "renderEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "isTextFlipped");

  }
  return v5;
}

- (BOOL)supportsFlippingText
{
  void *v2;
  char v3;

  -[JFXEffect renderEffect](self, "renderEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsFlippingText");

  return v3;
}

- (void)setFlipTail:(BOOL)a3
{
  uint64_t v4;
  id v5;

  if (a3)
    v4 = 2;
  else
    v4 = 0;
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", v4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v5, *MEMORY[0x24BE79608]);

}

- (BOOL)isTailFlipped
{
  void *v3;
  void *v4;
  int v5;
  void *v6;

  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79608]);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = objc_msgSend(v3, "intValue");
  }
  else
  {
    -[JFXEffect renderEffect](self, "renderEffect");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "orientation");

  }
  return v5 == 2;
}

- (BOOL)supportsFlippingTail
{
  void *v2;
  char v3;

  -[JFXEffect renderEffect](self, "renderEffect");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "supportsOrientation");

  return v3;
}

- (BOOL)isHidden
{
  float v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)JFXOverlayEffect;
  if (-[JFXEffect isHidden](&v5, sel_isHidden)
    || -[JFXOverlayEffect isCurrentlyTracking](self, "isCurrentlyTracking") && !self->_internalFaceTrackingTransform)
  {
    return 1;
  }
  -[JFXEffect opacity](self, "opacity");
  return v4 < 0.00001 && v4 > -0.00001;
}

- (double)customPickerRotation
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialRotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      v7 = v6;
    }
    else
    {
      v7 = 0.0;
    }
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PickerRotation"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v7 = v11 * 3.14159265 / 180.0;

    }
    else
    {
      v7 = 0.0;
    }

  }
  return v7;
}

- (id)customPrimaryFillColor
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  void *v17;
  double v18;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "primaryFillColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKeyedSubscript:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
    {
      objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("PrimaryFillColor"));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (v8)
      {
        v10 = (void *)MEMORY[0x24BDF6950];
        objc_msgSend(v8, "objectAtIndexedSubscript:", 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v13 = v12;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 1);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "doubleValue");
        v16 = v15;
        objc_msgSend(v9, "objectAtIndexedSubscript:", 2);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        objc_msgSend(v10, "colorWithRed:green:blue:alpha:", v13, v16, v18, 1.0);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
      else
      {
        v5 = 0;
      }

    }
    else
    {
      v5 = 0;
    }

  }
  return v5;
}

- (id)osfaToneMappingOption
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[JFXTextEffect editUIProperties](self, "editUIProperties");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffect effectID](self, "effectID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x24BE795B0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)setTrackingProps:(id)a3
{
  objc_storeStrong((id *)&self->_trackingProps, a3);
  -[JFXOverlayEffect JFX_setupTrackingProps](self, "JFX_setupTrackingProps");
}

- (void)JFX_setupTrackingProps
{
  -[JFXTrackedEffectProperties setDelegate:](self->_trackingProps, "setDelegate:", self);
  -[JFXOverlayEffect JFX_updateInteractiveMode](self, "JFX_updateInteractiveMode");
}

- (BOOL)isTracked
{
  void *v2;
  BOOL v3;

  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "trackingType") != 0;

  return v3;
}

- (BOOL)isCurrentlyTracking
{
  void *v2;
  BOOL v3;

  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentTrackingType") != 0;

  return v3;
}

- (void)suspendTracking
{
  id v2;

  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableTrackingState:", 0);

}

- (void)resumeTracking
{
  id v2;

  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "enableTrackingState:", 1);

}

- (void)setFaceTrackingTransform:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v6 = a3;
  -[JFXOverlayEffect internalFaceTrackingTransform](self, "internalFaceTrackingTransform");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  v5 = v6;
  if (v4 != v6)
  {
    -[JFXOverlayEffect JFX_applyEffectParametersForFaceTrackingTransform:](self, "JFX_applyEffectParametersForFaceTrackingTransform:", v6);
    v5 = v6;
  }

}

- (void)JFX_applyEffectParametersForFaceTrackingTransform:(id)a3
{
  id v4;
  _BOOL4 v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[JFXOverlayEffect setInternalFaceTrackingTransform:](self, "setInternalFaceTrackingTransform:", v4);
  v5 = -[JFXOverlayEffect isCurrentlyTracking](self, "isCurrentlyTracking");
  if (v4 && v5)
  {
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "effectParametersForTrackingType:", objc_msgSend(v6, "currentTrackingType"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    -[JFXEffect addEffectParameters:](self, "addEffectParameters:", v7);
  }
  else
  {
    v8 = *MEMORY[0x24BE79590];
    v11[0] = *MEMORY[0x24BE79588];
    v11[1] = v8;
    v9 = *MEMORY[0x24BE79578];
    v11[2] = *MEMORY[0x24BE796F0];
    v11[3] = v9;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v11, 4);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect removeEffectParameters:](self, "removeEffectParameters:", v10);

  }
}

- (CGRect)imageFrameAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  double v7;
  double v8;
  double v9;
  double v10;
  PVCGPointQuad v11[2];
  CGRect result;

  memset(&v11[1], 0, sizeof(PVCGPointQuad));
  v11[0].a = *(CGPoint *)&a3->var0;
  *(_QWORD *)&v11[0].b.x = a3->var3;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", v11, a4, a5, *(_QWORD *)&a7, 1.0, 1.0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
  v11[0] = v11[1];
  pv_bounding_CGRect(v11);
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (CGRect)hitAreaBoundingFrameAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeDropShadow:(BOOL)a5 adjustForMinimumSize:(BOOL)a6 normalizedMinimumSize:(id)a7 relativeTo:(CGRect)a8 basisOrigin:(int)a9
{
  CGPath *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  double v15;
  double v16;
  double v17;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v18;
  CGPathRef path;
  CGRect PathBoundingBox;
  CGRect result;

  v18 = *a3;
  path = 0;
  v9 = -[JFXOverlayEffect newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:](self, "newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:", &v18, a4, *(_QWORD *)&a9, a6, &path, a8.origin.x, a8.origin.y, a8.size.width, a8.size.height, a7.var0, a7.var1);
  PathBoundingBox = CGPathGetPathBoundingBox(path);
  x = PathBoundingBox.origin.x;
  y = PathBoundingBox.origin.y;
  width = PathBoundingBox.size.width;
  height = PathBoundingBox.size.height;
  CGPathRelease(v9);
  CGPathRelease(path);
  v14 = x;
  v15 = y;
  v16 = width;
  v17 = height;
  result.size.height = v17;
  result.size.width = v16;
  result.origin.y = v15;
  result.origin.x = v14;
  return result;
}

- (PVCGPointQuad)cornersAtTime:(SEL)a3 forcePosterFrame:(id *)a4 includeDropShadow:(BOOL)a5 scale:(BOOL)a6 relativeTo:(CGPoint)a7 basisOrigin:(CGRect)a8
{
  uint64_t v9;
  _BOOL8 v10;
  _BOOL8 v11;
  double height;
  double width;
  double y;
  double x;
  void *v18;
  void *v19;
  PVCGPointQuad *result;
  __int128 v21;
  int64_t var3;

  v9 = *(_QWORD *)&a9;
  v10 = a6;
  v11 = a5;
  height = a8.size.height;
  width = a8.size.width;
  y = a7.y;
  x = a7.x;
  retstr->c = 0u;
  retstr->d = 0u;
  retstr->a = 0u;
  retstr->b = 0u;
  -[JFXEffect renderEffect](self, "renderEffect");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = v18;
  if (v18)
  {
    v21 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    objc_msgSend(v18, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v21, v11, v10, v9, x, y, width, height);
  }
  else
  {
    retstr->c = 0u;
    retstr->d = 0u;
    retstr->a = 0u;
    retstr->b = 0u;
  }

  return result;
}

- (BOOL)objectBounds:(CGRect *)a3 time:(id *)a4 forcePosterFrame:(BOOL)a5 includeDropShadow:(BOOL)a6 includeMasks:(BOOL)a7
{
  _BOOL8 v7;
  _BOOL8 v8;
  _BOOL8 v9;
  void *v12;
  int v13;
  CGSize v14;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v16;
  CGPoint v17;
  CGSize v18;

  v7 = a7;
  v8 = a6;
  v9 = a5;
  v17 = (CGPoint)0;
  v18 = (CGSize)0;
  -[JFXEffect renderEffect](self, "renderEffect");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = *a4;
  v13 = objc_msgSend(v12, "bounds:atTime:forcePosterFrame:includeDropShadow:includeMasks:", &v17, &v16, v9, v8, v7);

  if (v13)
  {
    v14 = v18;
    a3->origin = v17;
    a3->size = v14;
  }
  return v13;
}

- (uint64_t)transformAtTime:(__int128 *)a3 forcePosterFrame:(uint64_t)a4 relativeTo:(uint64_t)a5 basisOrigin:
{
  __int128 v6;
  uint64_t v7;

  v6 = *a3;
  v7 = *((_QWORD *)a3 + 2);
  return objc_msgSend(a1, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v6, a4, 1, 1, a5);
}

- (double)transformAtTime:(uint64_t)a3@<X3> forcePosterFrame:(uint64_t)a4@<X4> includeTransformAnimation:(char)a5@<W5> includePlayableAspectScale:(uint64_t)a6@<X6> relativeTo:(__int128 *)a7@<X8> basisOrigin:(float64_t)a8@<D2>
{
  void *v32;
  void *v33;
  void *v34;
  double result;
  uint64_t v36;
  float64x2_t v37;
  float64x2_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  float64x2_t v48;
  float64x2_t v49;
  float64x2_t *v50;
  __int128 v51;
  __int128 v52;
  double v53;
  double v54;
  uint64_t v55;
  float64x2_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  float64x2_t v61;
  float64x2_t v62;
  float64x2_t *v63;
  __int128 v64;
  __int128 v65;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 vars0;

  a7[6] = 0u;
  a7[7] = 0u;
  a7[4] = 0u;
  a7[5] = 0u;
  a7[2] = 0u;
  a7[3] = 0u;
  *a7 = 0u;
  a7[1] = 0u;
  objc_msgSend(a1, "renderEffect");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  a18 = *a2;
  *(_QWORD *)&a19 = *((_QWORD *)a2 + 2);
  objc_msgSend(v32, "transformAtTime:forcePosterFrame:includeTransformAnimation:viewSize:viewOrigin:", &a18, a3, a4, a6, a8, a9);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v34 = v33;
  if (v33)
  {
    objc_msgSend(v33, "SIMDDouble4x4");
  }
  else
  {
    a7[6] = 0u;
    a7[7] = 0u;
    a7[4] = 0u;
    a7[5] = 0u;
    a7[2] = 0u;
    a7[3] = 0u;
    *a7 = 0u;
    a7[1] = 0u;
  }

  if ((_DWORD)a6 == 1)
  {
    v36 = 0;
    v37.f64[0] = a8;
    v37.f64[1] = a9;
    __asm { FMOV            V2.2D, #0.5 }
    v43 = vmulq_f64(v37, _Q2);
    v44 = a7[5];
    a22 = a7[4];
    a23 = v44;
    v45 = a7[7];
    a24 = a7[6];
    a25 = v45;
    v46 = a7[1];
    a18 = *a7;
    a19 = v46;
    v47 = a7[3];
    a20 = a7[2];
    a21 = v47;
    v68 = 0u;
    v69 = 0u;
    v70 = 0u;
    vars0 = 0u;
    do
    {
      v49 = *(float64x2_t *)((char *)&a18 + v36);
      v48 = *(float64x2_t *)((char *)&a18 + v36 + 16);
      v50 = (float64x2_t *)((char *)&v68 + v36);
      *v50 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)xmmword_226AB71E0, v49.f64[0]), (float64x2_t)xmmword_226AB71D0, v49, 1), (float64x2_t)0, v48.f64[0]), v43, v48, 1);
      v50[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v49.f64[0]), (float64x2_t)0, v49, 1), (float64x2_t)xmmword_226AB71E0, v48.f64[0]), (float64x2_t)xmmword_226AB71D0, v48, 1);
      v36 += 32;
    }
    while (v36 != 128);
    a7[4] = 0u;
    a7[5] = 0u;
    a7[6] = 0u;
    a7[7] = 0u;
    v51 = v69;
    *a7 = v68;
    a7[1] = v51;
    result = *(double *)&v70;
    v52 = vars0;
    a7[2] = v70;
    a7[3] = v52;
  }
  if ((a5 & 1) == 0)
  {
    objc_msgSend(a1, "playableScaleInOutputSize:", a8, a9);
    v54 = 1.0 / v53;
    result = fabs(1.0 / v53 + -1.0);
    if (result >= 0.0001)
    {
      v55 = 0;
      v56.f64[0] = 0.0;
      v56.f64[1] = v54;
      v57 = a7[5];
      a22 = a7[4];
      a23 = v57;
      v58 = a7[7];
      a24 = a7[6];
      a25 = v58;
      v59 = a7[1];
      a18 = *a7;
      a19 = v59;
      v60 = a7[3];
      a20 = a7[2];
      a21 = v60;
      v68 = 0u;
      v69 = 0u;
      v70 = 0u;
      vars0 = 0u;
      do
      {
        v62 = *(float64x2_t *)((char *)&a18 + v55);
        v61 = *(float64x2_t *)((char *)&a18 + v55 + 16);
        v63 = (float64x2_t *)((char *)&v68 + v55);
        *v63 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)*(unint64_t *)&v54, v62.f64[0]), v56, v62, 1), (float64x2_t)0, v61.f64[0]), (float64x2_t)0, v61, 1);
        v63[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v62.f64[0]), (float64x2_t)0, v62, 1), (float64x2_t)xmmword_226AB71E0, v61.f64[0]), (float64x2_t)xmmword_226AB71D0, v61, 1);
        v55 += 32;
      }
      while (v55 != 128);
      a7[4] = 0u;
      a7[5] = 0u;
      a7[6] = 0u;
      a7[7] = 0u;
      v64 = v69;
      *a7 = v68;
      a7[1] = v64;
      result = *(double *)&v70;
      v65 = vars0;
      a7[2] = v70;
      a7[3] = v65;
    }
  }
  return result;
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6
{
  __int128 v7;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v9;
  _OWORD v10[3];

  v7 = *(_OWORD *)&a4->c;
  v10[0] = *(_OWORD *)&a4->a;
  v10[1] = v7;
  v10[2] = *(_OWORD *)&a4->tx;
  v9 = *a5;
  return -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", v10, &v9, *(_QWORD *)&a7, 0, a6.origin.x, a6.origin.y, a6.size.width, a6.size.height);
}

- (CGAffineTransform)addTransform:(SEL)a3 withComponentTime:(CGAffineTransform *)a4 relativeTo:(id *)a5 basisOrigin:(CGRect)a6 restrictToBounds:(int)a7
{
  _BOOL8 v8;
  uint64_t v9;
  double height;
  double width;
  double y;
  double x;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGPoint v26;
  double v27;
  double v28;
  double v29;
  double v30;
  CGAffineTransform *result;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  PVCGPointQuad v35;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v36;
  objc_super v37;
  PVCGPointQuad v38;
  PVCGPointQuad v39;

  v8 = a8;
  v9 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v39.a = *(CGPoint *)&a5->var0;
  *(_QWORD *)&v39.b.x = a5->var3;
  -[JFXOverlayEffect effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:](self, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v39, 1, 1, 1, *(_QWORD *)&a7, a6.origin.x);
  v19 = v18;
  v21 = v20;
  memset(&v39, 0, sizeof(v39));
  v38.a = *(CGPoint *)&a5->var0;
  *(_QWORD *)&v38.b.x = a5->var3;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v38, 1, 1, v9, 1.0, 1.0, x, y, width, height);
  v38 = v39;
  pv_CGPoint_get_quad_center(&v38);
  v23 = v22;
  v25 = v24;
  v37.receiver = self;
  v37.super_class = (Class)JFXOverlayEffect;
  v26 = *(CGPoint *)&a4->c;
  v35.a = *(CGPoint *)&a4->a;
  v35.b = v26;
  v35.c = *(CGPoint *)&a4->tx;
  v36 = *a5;
  -[CGAffineTransform addTransform:withComponentTime:relativeTo:basisOrigin:ignoreTranslation:](&v37, sel_addTransform_withComponentTime_relativeTo_basisOrigin_ignoreTranslation_, &v35, &v36, v9, 1, x, y, width, height);
  memset(&v38, 0, sizeof(v38));
  v35.a = *(CGPoint *)&a5->var0;
  *(_QWORD *)&v35.b.x = a5->var3;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v35, 1, 1, v9, 1.0, 1.0, x, y, width, height);
  v35 = v38;
  pv_CGPoint_get_quad_center(&v35);
  v28 = a4->tx + v23 - v27;
  v30 = v25 - v29 + a4->ty;
  if (*MEMORY[0x24BDBF148] != v28 || *(double *)(MEMORY[0x24BDBF148] + 8) != v30 || v8)
  {
    v35.a = *(CGPoint *)&a5->var0;
    *(_QWORD *)&v35.b.x = a5->var3;
    -[JFXOverlayEffect setPosition:withComponentTime:relativeTo:basisOrigin:restrictToBounds:](self, "setPosition:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", &v35, v9, v8, v19 + v28, v21 + v30, x, y, width, height);
  }
  result = (CGAffineTransform *)-[JFXEffect topLevelTransform](self, "topLevelTransform");
  *(_OWORD *)&retstr->a = v32;
  *(_OWORD *)&retstr->c = v33;
  *(_OWORD *)&retstr->tx = v34;
  return result;
}

- (int64_t)rotatedAspectRatio
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "userInterfaceIdiom"))
  {

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "orientation") - 3;

    if (v5 <= 1)
      return complementaryAspectRatio(-[JFXEffect playableAspectRatio](self, "playableAspectRatio"));
  }
  return -[JFXEffect playableAspectRatio](self, "playableAspectRatio");
}

- (void)updateRenderSizeMaintainingAppearance:(CGSize)a3 withComponentTime:(id *)a4
{
  double height;
  double width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  void *v15;
  uint64_t v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  double v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  unint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  BOOL v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  uint64_t v56;
  float64x2_t v57;
  float64x2_t v58;
  float64x2_t *v59;
  float64x2_t v60;
  float64x2_t v61;
  _OWORD v62[16];
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  int64_t var3;

  height = a3.height;
  width = a3.width;
  -[JFXEffect renderSize](self, "renderSize");
  v9 = v8;
  v11 = v10;
  v12 = aspectRatioMultiplierForSize(v8, v10);
  v13 = aspectRatioMultiplierForSize(width, height);
  if (vabdd_f64(v12, v13) >= 0.0001)
  {
    v14 = fmin(v9, v11);
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "trackingType");

    if ((unint64_t)(v16 - 1) >= 2)
    {
      if (!v16)
      {
        v19 = 1.0;
        if (v12 * v14 >= v14)
          v20 = 1.0;
        else
          v20 = v12;
        v21 = v14 / v20;
        v22 = v12 * (v14 / v20);
        if (v13 * v14 < v14)
          v19 = v13;
        v23 = v14 / v19;
        v24 = v13 * (v14 / v19);
        v25 = CGRectMakeWithSize();
        v71 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v71, 1, 1, 1, v25);
        v27 = v26;
        v29 = v28;
        v32 = CGRectGetCenterPoint(v30, v31, v26, v28) / v22;
        if (v22 > v21)
          v32 = v22 / v21 * v32 + (v22 / v21 + -1.0) * -0.5;
        if (v24 > v23)
          v32 = ((v24 / v23 + -1.0) * 0.5 + v32) / (v24 / v23);
        v45 = CGRectMakeWithSizeAndCenterPoint(v27, v29, v24 * v32);
        v47 = v46;
        v49 = v48;
        v51 = v50;
        -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
        -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(width, height));
        v52 = CGRectMakeWithSize();
        v71 = *(_OWORD *)&a4->var0;
        var3 = a4->var3;
        -[JFXOverlayEffect applyScaleToFitFrame:withComponentTime:relativeRect:](self, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v71, v45, v47, v49, v51, v52, v53, v54, v55);
      }
    }
    else
    {
      if (fabs(v12 + -1.0 / v13) >= 0.0001)
      {
        +[JFXMediaSettings frameSize](JFXMediaSettings, "frameSize");
        v35 = v34;
        if (fabs(v13 + -1.0) < 0.0001)
        {
          v36 = v33;
          objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
          v37 = (void *)objc_claimAutoreleasedReturnValue();
          v38 = objc_msgSend(v37, "orientation") - 3;

          v33 = v36;
          if (v38 <= 1)
          {
            v33 = CGSizeRotate90(v36, v35);
            v35 = v39;
          }
        }
        v40 = v14 * (v9 / v11);
        v41 = width / height * v14;
        if (v40 <= v14)
        {
          v43 = v33 * (v14 / v35) < v40;
          v42 = v40 / v33;
          if (!v43)
            v42 = v14 / v35;
        }
        else
        {
          v42 = v40 / v33;
          if (v35 * v42 < v14)
            v42 = v14 / v35;
        }
        v18 = v35 * v42;
        if (v41 <= v14)
        {
          v44 = v14 / v35;
          if (v33 * (v14 / v35) < v41)
            v44 = v41 / v33;
        }
        else
        {
          v44 = v41 / v33;
          if (v35 * (v41 / v33) < v14)
            v44 = v14 / v35;
        }
        v17 = v35 * v44;
      }
      else
      {
        v17 = v14 / v12;
        if (v14 / v12 > v14)
          v17 = v14;
        v18 = v14 / v13;
        if (v14 / v13 > v14)
          v18 = v14;
      }
      -[JFXEffect topLevelTransform](self, "topLevelTransform", 0, v17 / v18, v17 / v18, 0);
      v56 = 0;
      v69 = 0u;
      v70 = 0u;
      v67 = 0u;
      v68 = 0u;
      v65 = 0u;
      v66 = 0u;
      v63 = 0u;
      v64 = 0u;
      do
      {
        v58 = (float64x2_t)v62[v56 + 8];
        v57 = (float64x2_t)v62[v56 + 9];
        v59 = (float64x2_t *)((char *)&v63 + v56 * 16);
        *v59 = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64(v61, v58.f64[0]), v60, v58, 1), (float64x2_t)0, v57.f64[0]), (float64x2_t)0, v57, 1);
        v59[1] = vmlaq_laneq_f64(vmlaq_n_f64(vmlaq_laneq_f64(vmulq_n_f64((float64x2_t)0, v58.f64[0]), (float64x2_t)0, v58, 1), (float64x2_t)xmmword_226AB71E0, v57.f64[0]), (float64x2_t)xmmword_226AB71D0, v57, 1);
        v56 += 2;
      }
      while (v56 != 8);
      v62[4] = v67;
      v62[5] = v68;
      v62[6] = v69;
      v62[7] = v70;
      v62[0] = v63;
      v62[1] = v64;
      v62[2] = v65;
      v62[3] = v66;
      -[JFXEffect setTopLevelTransform:](self, "setTopLevelTransform:", v62);
      -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
      -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(width, height));
    }
  }
  else
  {
    -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
    -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(width, height));
  }
}

- (void)updateRenderSizeMaintainingRelativeSizeAndPosition:(CGSize)a3 toSize:(CGSize)a4 withComponentTime:(id *)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v11;
  void *v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MidY;
  double v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double MidX;
  double v33;
  double v34;
  double v35;
  __int128 v36;
  uint64_t v37;
  CGAffineTransform v38;
  CGAffineTransform v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  v11 = aspectRatioMultiplierForSize(a3.width, a3.height);
  if (vabdd_f64(v11, aspectRatioMultiplierForSize(width, height)) >= 0.0001)
  {
    -[JFXOverlayEffect trackingProps](self, "trackingProps");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "trackingType");

    if ((unint64_t)(v13 - 1) >= 2)
    {
      if (!v13)
      {
        v35 = CGRectMakeWithSize();
        v15 = v14;
        *(_OWORD *)&v39.a = *(_OWORD *)&a5->var0;
        *(_QWORD *)&v39.c = a5->var3;
        v17 = v16;
        v33 = v18;
        v34 = v16;
        v19 = v18;
        -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v39, 1, 1, 1, v35);
        v30 = v21;
        v31 = v20;
        v28 = v23;
        v29 = v22;
        v40.origin.x = v35;
        v40.origin.y = v15;
        v40.size.width = v17;
        v40.size.height = v19;
        MidX = CGRectGetMidX(v40);
        v41.origin.x = v35;
        v41.origin.y = v15;
        v41.size.width = v17;
        v41.size.height = v19;
        MidY = CGRectGetMidY(v41);
        v27 = height / v8;
        v42.origin.x = v31;
        v42.origin.y = v30;
        v42.size.width = v29;
        v42.size.height = v28;
        v25 = CGRectGetMidX(v42);
        v43.origin.x = v31;
        v43.origin.y = v30;
        v43.size.width = v29;
        v43.size.height = v28;
        v26 = CGRectGetMidY(v43);
        memset(&v39, 0, sizeof(v39));
        CGAffineTransformMakeTranslation(&v39, MidX + (v25 - MidX) * (width / v9) - v25, MidY + (v26 - MidY) * v27 - v26);
        v38 = v39;
        v36 = *MEMORY[0x24BDC0D88];
        v37 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
        -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v38, &v36, 1, v35, v15, v34, v33);
        -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
        -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(width, height));
      }
    }
    else
    {
      *(_OWORD *)&v39.a = *(_OWORD *)&a5->var0;
      *(_QWORD *)&v39.c = a5->var3;
      -[JFXOverlayEffect updateRenderSizeMaintainingAppearance:withComponentTime:](self, "updateRenderSizeMaintainingAppearance:withComponentTime:", &v39, width, height);
    }
  }
  else
  {
    -[JFXEffect setRenderSize:](self, "setRenderSize:", width, height);
    -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(width, height));
  }
}

- (void)updateRenderSizeMaintainingSizeAndPositionRelativeToMedia:(CGSize)a3 mediaSize:(CGSize)a4 mediaContentMode:(int)a5
{
  double height;
  double width;
  double v8;
  double v9;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  void *v26;
  uint64_t v27;
  double v28;
  uint64_t v29;
  uint64_t v30;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double x;
  double y;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  __int128 v50;
  double v51;
  _OWORD var50[6];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;

  height = a4.height;
  width = a4.width;
  v8 = a3.height;
  v9 = a3.width;
  -[JFXEffect renderSize](self, "renderSize");
  v12 = v11;
  v14 = v13;
  v15 = aspectRatioMultiplierForSize(v11, v13);
  v16 = aspectRatioMultiplierForSize(v9, v8);
  if (vabdd_f64(v15, v16) < 0.0001)
  {
    -[JFXEffect setRenderSize:](self, "setRenderSize:", v9, v8);
    -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(v9, v8));
    return;
  }
  v17 = width / height;
  -[JFXEffect transformAnimation](self, "transformAnimation");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setTransformAnimation:](self, "setTransformAnimation:", 0);
  v19 = fmin(v12, v14);
  v20 = 1.0;
  if (v15 * v19 >= v19)
    v21 = 1.0;
  else
    v21 = v15;
  v22 = v19 / v21;
  v23 = v15 * (v19 / v21);
  if (v16 * v19 < v19)
    v20 = v16;
  v24 = v19 / v20;
  v25 = v16 * (v19 / v20);
  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = objc_msgSend(v26, "currentTrackingType");

  if ((unint64_t)(v27 - 1) >= 2)
  {
    if (v27)
      goto LABEL_59;
    v51 = v17;
    v28 = CGRectMakeWithSize();
    v50 = *MEMORY[0x24BDC0D88];
    v61 = *MEMORY[0x24BDC0D88];
    v29 = *(_QWORD *)(MEMORY[0x24BDC0D88] + 16);
    *(_QWORD *)&v62 = v29;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v61, 1, 1, 1, v28);
    v34 = v23;
    v35 = v22;
    if (a5)
    {
      if (a5 <= 2)
      {
        if (a5 == 1)
        {
          v36 = v51;
          if (v23 <= v22)
          {
            v35 = v22;
            if (v51 * v22 < v23)
              v35 = v23 / v51;
          }
          else
          {
            v35 = v23 / v51;
            if (v23 / v51 < v22)
              v35 = v22;
          }
        }
        else
        {
          v34 = v51;
          v35 = 1.0;
          if (a5 != 2)
            goto LABEL_33;
          v36 = v51;
          if (v23 / v51 <= v22)
            v35 = v23 / v51;
          else
            v35 = v22;
        }
        v34 = v36 * v35;
      }
      else
      {
        v34 = v23;
        v35 = v22;
        if (a5 != 3)
        {
          if (a5 == 13)
          {
            v34 = v23;
            v35 = v23 / v51;
          }
          else
          {
            if (a5 == 14)
              v34 = v51 * v22;
            else
              v34 = v51;
            if (a5 == 14)
              v35 = v22;
            else
              v35 = 1.0;
          }
        }
      }
    }
LABEL_33:
    v69 = CGRectOffset(*(CGRect *)&v30, -((v23 - v34) * 0.5 + 0.0), -((v22 - v35) * 0.5 + 0.0));
    v37 = v25;
    v38 = v24;
    if (a5)
    {
      v38 = 1.0;
      if (a5 > 2)
      {
        v39 = v25 / v51;
        v40 = v51 * v24;
        if (a5 == 14)
          v38 = v24;
        else
          v40 = v51;
        if (a5 == 13)
          v40 = v25;
        else
          v39 = v38;
        if (a5 == 3)
          v37 = v25;
        else
          v37 = v40;
        if (a5 == 3)
          v38 = v24;
        else
          v38 = v39;
        goto LABEL_58;
      }
      if (a5 == 1)
      {
        if (v25 <= v24)
        {
          v41 = v51;
          v38 = v24;
          if (v51 * v24 < v25)
            v38 = v25 / v51;
        }
        else
        {
          v41 = v51;
          v38 = v25 / v51;
          if (v25 / v51 < v24)
            v38 = v24;
        }
      }
      else
      {
        if (a5 != 2)
        {
          v37 = v51;
          goto LABEL_58;
        }
        v41 = v51;
        if (v25 / v51 <= v24)
          v38 = v25 / v51;
        else
          v38 = v24;
      }
      v37 = v41 * v38;
    }
LABEL_58:
    v70.origin.x = v69.origin.x / v34 * v37;
    v70.origin.y = v69.origin.y / v35 * v38;
    v70.size.width = v69.size.width / v34 * v37;
    v70.size.height = v69.size.height / v35 * v38;
    v71 = CGRectOffset(v70, (v25 - v37) * 0.5 + 0.0, (v24 - v38) * 0.5 + 0.0);
    x = v71.origin.x;
    y = v71.origin.y;
    v44 = v71.size.width;
    v45 = v71.size.height;
    -[JFXEffect setRenderSize:](self, "setRenderSize:", v9, v8);
    -[JFXEffect setPlayableAspectRatio:](self, "setPlayableAspectRatio:", aspectRatioForSize(v9, v8));
    v46 = CGRectMakeWithSize();
    v61 = v50;
    *(_QWORD *)&v62 = v29;
    -[JFXOverlayEffect applyScaleToFitFrame:withComponentTime:relativeRect:](self, "applyScaleToFitFrame:withComponentTime:relativeRect:", &v61, x, y, v44, v45, v46, v47, v48, v49);
    goto LABEL_59;
  }
  v67 = 0u;
  v68 = 0u;
  v65 = 0u;
  v66 = 0u;
  v63 = 0u;
  v64 = 0u;
  v61 = 0u;
  v62 = 0u;
  -[JFXEffect topLevelTransform](self, "topLevelTransform");
  pv_simd_matrix_scale();
  v65 = v57;
  v66 = v58;
  v67 = v59;
  v68 = v60;
  v61 = v53;
  v62 = v54;
  v63 = v55;
  v64 = v56;
  var50[4] = v57;
  var50[5] = v58;
  var50[2] = v55;
  var50[3] = v56;
  var50[0] = v53;
  var50[1] = v54;
  -[JFXEffect setTopLevelTransform:](self, "setTopLevelTransform:", var50);
LABEL_59:
  -[JFXEffect setTransformAnimation:](self, "setTransformAnimation:", v18);

}

- (void)rotate:(double)a3 aroundPoint:(CGPoint)a4 withComponentTime:(id *)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  void *v17;
  uint64_t v18;
  CGFloat v19;
  CGFloat v20;
  CGFloat v21;
  CGFloat v22;
  double CenterPoint;
  double v24;
  double v25;
  double v26;
  CGAffineTransform v27;
  CGAffineTransform v28;
  CGAffineTransform v29;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v32;

  v7 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v13 = a4.y;
  v14 = a4.x;
  -[JFXOverlayEffect trackingProps](self, "trackingProps");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "trackingType");

  if (!v18)
  {
    *(_OWORD *)&v32.a = *(_OWORD *)&a5->var0;
    *(_QWORD *)&v32.c = a5->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v32, 1, 1, v7, x, y, width, height);
    CenterPoint = CGRectGetCenterPoint(v19, v20, v21, v22);
    v26 = height;
    v25 = v24;
    CGAffineTransformMakeRotation(&v28, a3);
    memset(&v29, 0, sizeof(v29));
    CGAffineTransformMakeTranslation(&t1, -v14, -v13);
    t2 = v28;
    CGAffineTransformConcat(&v32, &t1, &t2);
    CGAffineTransformMakeTranslation(&t2, v14, v13);
    CGAffineTransformConcat(&v29, &v32, &t2);
    CGAffineTransformMakeTranslation(&v27, v29.tx + v25 * v29.c + v29.a * CenterPoint - CenterPoint, v29.ty + v25 * v29.d + v29.b * CenterPoint - v25);
    *(_OWORD *)&t1.a = *(_OWORD *)&a5->var0;
    *(_QWORD *)&t1.c = a5->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v27, &t1, v7, x, y, width, v26);
  }
}

- (void)applyScaleToFitFrame:(CGRect)a3 withComponentTime:(id *)a4 relativeRect:(CGRect)a5
{
  $3CC8671D27C23BF42ADDB32F2B5E48AE v5;

  v5 = *a4;
  -[JFXOverlayEffect applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:](self, "applyScaleToFitFrame:withComponentTime:relativeRect:restrictToBounds:", &v5, 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
}

- (void)applyScaleToFitFrame:(CGRect)a3 withComponentTime:(id *)a4 relativeRect:(CGRect)a5 restrictToBounds:(BOOL)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  CGFloat v12;
  CGFloat v13;
  CGFloat v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  CGFloat v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double MidY;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  double v46;
  CGFloat v47;
  double v48;
  double MidX;
  CGAffineTransform v50;
  PVCGPointQuad v51;
  CGAffineTransform v52;
  CGPoint v53;
  __int128 v54;
  int64_t var3;
  CGAffineTransform v56;
  CGAffineTransform v57;
  CGAffineTransform v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;

  v6 = a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v12 = a3.size.height;
  v47 = a3.origin.x;
  v48 = a3.size.width;
  v13 = a3.origin.y;
  *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
  *(_QWORD *)&v52.c = a4->var3;
  -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 1, 1, a5.origin.x, a5.origin.y, a5.size.width, a5.size.height);
  v15 = v59.size.width;
  v16 = v59.size.height;
  if (!CGRectIsEmpty(v59))
  {
    v44 = v13;
    v45 = v12;
    *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v52.c = a4->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 0, 1, x, y, width, height);
    v17 = v15;
    v19 = v18;
    v46 = v16;
    v21 = v20;
    memset(&v58, 0, sizeof(v58));
    CGAffineTransformMakeScale(&v58, 2.0, 2.0);
    v51.a = *(CGPoint *)&v58.a;
    v51.b = *(CGPoint *)&v58.c;
    v51.c = *(CGPoint *)&v58.tx;
    *(_OWORD *)&v56.a = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v56.c = a4->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v51, &v56, 1, x, y, width, height);
    *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v52.c = a4->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 1, 1, x, y, width, height);
    v23 = v22;
    v40 = v24;
    *(_OWORD *)&v52.a = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v52.c = a4->var3;
    -[JFXOverlayEffect imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:](self, "imageFrameAtTime:forcePosterFrame:includeDropShadow:relativeTo:basisOrigin:", &v52, 1, 0, 1, x, y, width, height);
    v42 = v21;
    v43 = v19;
    v26 = vabdd_f64(v46, v21);
    v41 = vabdd_f64(v17, v19);
    if (vabdd_f64(vabdd_f64(v23, v27) * 0.5, v41) <= 1.0)
    {
      v28 = v17;
      v29 = vabdd_f64(vabdd_f64(v40, v25) * 0.5, v26);
      v52 = v58;
      CGAffineTransformInvert(&v57, &v52);
      v51.a = *(CGPoint *)&a4->var0;
      *(_QWORD *)&v51.b.x = a4->var3;
      -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v57, &v51, 1, x, y, width, height);
      if (v29 <= 1.0)
      {
        v32 = v48;
        v33 = v45;
        v31 = v46;
        v34 = v45;
        v35 = v28;
        v30 = v48;
        goto LABEL_7;
      }
    }
    else
    {
      v52 = v58;
      CGAffineTransformInvert(&v57, &v52);
      v51.a = *(CGPoint *)&a4->var0;
      *(_QWORD *)&v51.b.x = a4->var3;
      -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v57, &v51, 1, x, y, width, height);
    }
    v30 = v48;
    v31 = v42;
    v32 = v48 - v41;
    v33 = v45;
    v34 = v45 - v26;
    v35 = v43;
LABEL_7:
    v36 = CGSizeFitToAspectInSize(v32, v34, v35, v31);
    memset(&v56, 0, sizeof(v56));
    CGAffineTransformMakeScale(&v56, v36 / v35, v36 / v35);
    v51.a = *(CGPoint *)&v56.a;
    v51.b = *(CGPoint *)&v56.c;
    v51.c = *(CGPoint *)&v56.tx;
    v54 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:", &v51, &v54, 1, x, y, width, height);
    v60.origin.x = v47;
    v60.origin.y = v44;
    v60.size.width = v30;
    v60.size.height = v33;
    MidX = CGRectGetMidX(v60);
    v61.origin.x = v47;
    v61.origin.y = v44;
    v61.size.width = v30;
    v61.size.height = v33;
    MidY = CGRectGetMidY(v61);
    v53 = (CGPoint)0;
    memset(&v52, 0, sizeof(v52));
    v51.a = *(CGPoint *)&a4->var0;
    *(_QWORD *)&v51.b.x = a4->var3;
    -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v51, 1, 1, 1, 1.0, 1.0, x, y, width, height);
    v51.a = *(CGPoint *)&v52.a;
    v51.b = *(CGPoint *)&v52.c;
    v51.c = *(CGPoint *)&v52.tx;
    v51.d = v53;
    pv_CGPoint_get_quad_center(&v51);
    CGAffineTransformMakeTranslation(&v50, MidX - v38, MidY - v39);
    v54 = *(_OWORD *)&a4->var0;
    var3 = a4->var3;
    -[JFXOverlayEffect addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:](self, "addTransform:withComponentTime:relativeTo:basisOrigin:restrictToBounds:", &v50, &v54, 1, v6, x, y, width, height);
  }
}

- (void)setPosition:(CGPoint)a3 withComponentTime:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6 restrictToBounds:(BOOL)a7
{
  uint64_t v7;
  double height;
  double width;
  double y;
  double x;
  double v13;
  float64x2_t v14;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  float64_t v26;
  float64x2_t v27;
  float64x2_t v28;
  float64x2_t v29;
  CGFloat v30;
  CGFloat MinY;
  float64x2_t v32;
  CGFloat v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat MaxY;
  float64x2_t v37;
  uint64_t v38;
  uint64_t v39;
  __int128 v40;
  CGFloat MaxX;
  float64_t v42;
  float64_t v43;
  float64x2_t v44;
  float64_t v45;
  float64x2_t v46;
  uint64_t v47;
  CGFloat v48;
  CGFloat MinX;
  float64x2_t v50;
  uint64_t v51;
  _OWORD var20[3];
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  CGRect v65;
  CGRect v66;

  v7 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v13 = a3.y;
  v14.f64[0] = a3.x;
  if (a7)
  {
    v45 = v13;
    v48 = a3.x;
    -[JFXEffect playableRectInOutputSize:](self, "playableRectInOutputSize:", a5.size.width, a5.size.height);
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v53 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v54 = a4->var3;
    -[JFXOverlayEffect effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:](self, "effectCenterAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v53, 1, 1, 1, v7, x, y, width, height);
    v42 = v25;
    v43 = v24;
    v55 = 0u;
    v56 = 0u;
    v53 = 0u;
    v54 = 0u;
    v61 = *(_OWORD *)&a4->var0;
    *(_QWORD *)&v62 = a4->var3;
    -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v61, 1, 1, v7, 1.0, 1.0, x, y, width, height);
    v61 = v53;
    v62 = v54;
    v63 = v55;
    v64 = v56;
    pv_CGPoint_get_quad_center((PVCGPointQuad *)&v61);
    v27.f64[1] = v26;
    v28.f64[0] = v43;
    v28.f64[1] = v42;
    v29 = vsubq_f64(v27, v28);
    v27.f64[0] = v48;
    v27.f64[1] = v45;
    v44 = v29;
    v46 = vaddq_f64(v27, v29);
    v27.f64[0] = v17;
    v28.f64[0] = v19;
    v29.f64[0] = v21;
    v30 = v23;
    MinX = CGRectGetMinX(*(CGRect *)v27.f64);
    v65.origin.x = v17;
    v65.origin.y = v19;
    v65.size.width = v21;
    v65.size.height = v23;
    MinY = CGRectGetMinY(v65);
    v32.f64[0] = MinX;
    v32.f64[1] = MinY;
    v50 = v32;
    v33 = v17;
    v32.f64[0] = v19;
    v34 = v21;
    v35 = v23;
    MaxX = CGRectGetMaxX(*(CGRect *)((char *)&v32 - 8));
    v66.origin.x = v17;
    v66.origin.y = v19;
    v66.size.width = v21;
    v66.size.height = v23;
    MaxY = CGRectGetMaxY(v66);
    v37.f64[0] = MaxX;
    v37.f64[1] = MaxY;
    v14 = vsubq_f64(vminnmq_f64(vmaxnmq_f64(v46, v50), v37), v44);
    v13 = v14.f64[1];
  }
  v53 = *(_OWORD *)&a4->var0;
  *(_QWORD *)&v54 = a4->var3;
  -[JFXOverlayEffect screenPointToEffectPoint:withComponentTime:relativeTo:basisOrigin:](self, "screenPointToEffectPoint:withComponentTime:relativeTo:basisOrigin:", &v53, v7, v14.f64[0], v13, x, y, width, height, *(_QWORD *)&MaxX);
  v47 = v39;
  v51 = v38;
  v59 = 0u;
  v60 = 0u;
  v57 = 0u;
  v58 = 0u;
  v55 = 0u;
  v56 = 0u;
  v53 = 0u;
  v54 = 0u;
  -[JFXEffect topLevelTransform](self, "topLevelTransform");
  *(_QWORD *)&v40 = v51;
  *((_QWORD *)&v40 + 1) = v47;
  v59 = v40;
  var20[0] = v53;
  var20[1] = v54;
  var20[2] = v55;
  -[JFXEffect setTopLevelTransform:](self, "setTopLevelTransform:", var20);
}

- (double)effectPointToScreenPoint:effectToScreenTransform:viewSize:
{
  double v1;

  pv_simd_matrix_transform_vector();
  return v1;
}

- (CGPoint)screenPointToEffectPoint:(CGPoint)a3 withComponentTime:(id *)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6
{
  double height;
  double width;
  double y;
  double x;
  double v13;
  double v14;
  void *v15;
  void *v16;
  int v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  int v25;
  double v26;
  double v27;
  double v28;
  _BOOL4 v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double v33;
  BOOL v34;
  _BOOL4 v35;
  double v36;
  double v37;
  double v38;
  double v39;
  void *v40;
  void *v41;
  int v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  int v50;
  double v51;
  int v52;
  int64_t value;
  double v54;
  double v55;
  double v56;
  double v57;
  double tx;
  double v59;
  double v60;
  float64x2_t v61;
  CGAffineTransform v62;
  PVTransformAnimationInfo t1;
  CGAffineTransform v64;
  double v65;
  CGAffineTransform v66;
  CGAffineTransform v67;
  CGAffineTransform t2;
  CGPoint v69;
  CGPoint result;

  height = a5.size.height;
  width = a5.size.width;
  y = a3.y;
  x = a3.x;
  -[JFXEffect playableScaleInOutputSize:](self, "playableScaleInOutputSize:", a5.size.width, a5.size.height, a5.origin.x, a5.origin.y);
  if (fabs(v13 + -1.0) >= 0.0001)
  {
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeScale(&v67, 1.0 / v13, 1.0 / v13);
    memset(&v66, 0, sizeof(v66));
    CGAffineTransformMakeTranslation((CGAffineTransform *)&t1, -(width * 0.5), -(height * 0.5));
    t2 = v67;
    CGAffineTransformConcat(&v64, (CGAffineTransform *)&t1, &t2);
    CGAffineTransformMakeTranslation(&t2, width * 0.5, height * 0.5);
    CGAffineTransformConcat(&v66, &v64, &t2);
    v67 = v66;
    v14 = y * v66.d + v66.b * x;
    x = v66.tx + y * v66.c + v66.a * x;
    y = v66.ty + v14;
  }
  v65 = 0.0;
  memset(&v64, 0, sizeof(v64));
  v15 = (void *)MEMORY[0x24BE790C8];
  -[JFXEffect transformAnimation](self, "transformAnimation");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  *(_OWORD *)&t1.time.value = *(_OWORD *)&a4->var0;
  t1.time.epoch = a4->var3;
  v17 = objc_msgSend(v15, "getTransformInfoFromAnimation:atTime:renderSize:contentMode:invertY:outInfo:", v16, &t1, 14, 0, &v64, width, height);

  if (v17)
  {
    memset(&t2, 0, sizeof(t2));
    v69.x = width * 0.5;
    v69.y = height * 0.5;
    *(_OWORD *)&t1.time.value = *(_OWORD *)&v64.a;
    *(_OWORD *)&t1.time.epoch = *(_OWORD *)&v64.c;
    *(_OWORD *)&t1.translation.y = *(_OWORD *)&v64.tx;
    t1.rotation = v65;
    CGAffineTransformFromPointWithPVAnimInfo(&t1, v69);
    *(_OWORD *)&t1.time.value = *(_OWORD *)&t2.a;
    *(_OWORD *)&t1.time.epoch = *(_OWORD *)&t2.c;
    *(_OWORD *)&t1.translation.y = *(_OWORD *)&t2.tx;
    CGAffineTransformInvert(&v62, (CGAffineTransform *)&t1);
    v18 = y * v62.d + v62.b * x;
    x = v62.tx + y * v62.c + v62.a * x;
    y = v62.ty + v18;
  }
  -[JFXEffect renderEffect](self, "renderEffect");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "outputSize");
  v21 = v20;
  v23 = v22;

  -[JFXEffect renderEffect](self, "renderEffect");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = objc_msgSend(v24, "origin");

  v57 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  tx = *MEMORY[0x24BDBEFB0];
  if (a6 == 2)
  {
    if (v25)
      v38 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    else
      v38 = height * 0.5;
    if (v25)
      v39 = *MEMORY[0x24BDBEFB0];
    else
      v39 = width * 0.5;
    v35 = v25 == 1;
    if (v25 == 1)
      v36 = height * 0.5;
    else
      v36 = v38;
    if (v25 == 1)
      v37 = width * 0.5;
    else
      v37 = v39;
  }
  else
  {
    v26 = width * -0.5;
    v27 = height * 0.5;
    if (v25)
      v28 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    else
      v28 = height;
    v29 = v25 == 2 || v25 == 0;
    if (v25 == 2)
    {
      v30 = width * -0.5;
    }
    else
    {
      v27 = v28;
      v30 = *MEMORY[0x24BDBEFB0];
    }
    v31 = height * -0.5;
    v32 = v25 == 1;
    if (v25 == 1)
      v33 = height;
    else
      v33 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
    if (v25 == 2)
    {
      v32 = 0;
    }
    else
    {
      v31 = v33;
      v26 = *MEMORY[0x24BDBEFB0];
    }
    if (a6)
    {
      v32 = 0;
      v31 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
      v26 = *MEMORY[0x24BDBEFB0];
    }
    v34 = a6 == 1;
    if (a6 == 1)
      v35 = v29;
    else
      v35 = v32;
    if (v34)
      v36 = v27;
    else
      v36 = v31;
    if (v34)
      v37 = v30;
    else
      v37 = v26;
  }
  memset(&v67, 0, sizeof(v67));
  CGAffineTransformMakeScale(&v67, v21 / width, v23 / height);
  t2 = v67;
  CGAffineTransformTranslate((CGAffineTransform *)&t1, &t2, v37, v36);
  *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
  *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
  *(_OWORD *)&v67.tx = *(_OWORD *)&t1.translation.y;
  if (v35)
  {
    t2 = v67;
    CGAffineTransformScale((CGAffineTransform *)&t1, &t2, 1.0, -1.0);
    *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
    *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
    *(_OWORD *)&v67.tx = *(_OWORD *)&t1.translation.y;
  }
  v60 = v67.tx + y * v67.c + v67.a * x;
  v59 = v67.ty + y * v67.d + v67.b * x;
  -[JFXEffect effectParameters](self, "effectParameters");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "objectForKeyedSubscript:", *MEMORY[0x24BE79578]);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = objc_msgSend(v41, "BOOLValue");

  -[JFXEffect effectParameters](self, "effectParameters");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v43, "objectForKeyedSubscript:", *MEMORY[0x24BE796F0]);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXEffect effectParameters](self, "effectParameters");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "objectForKeyedSubscript:", *MEMORY[0x24BE79590]);
  v46 = (void *)objc_claimAutoreleasedReturnValue();

  -[JFXEffect effectParameters](self, "effectParameters");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "objectForKeyedSubscript:", *MEMORY[0x24BE79588]);
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  if (v42 && v44 && v46 && v48)
  {
    -[JFXEffect renderEffect](self, "renderEffect");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "outputROI");

    if (v25 == 2)
    {
      tx = v21 * 0.5;
      v51 = v23 * 0.5;
      v50 = 1;
    }
    else if (v25)
    {
      v50 = 0;
      v51 = v57;
    }
    else
    {
      v50 = 1;
      v51 = v23;
    }
    memset(&v67, 0, sizeof(v67));
    CGAffineTransformMakeScale(&v67, v21 / v21, v23 / v23);
    t2 = v67;
    CGAffineTransformTranslate((CGAffineTransform *)&t1, &t2, tx, v51);
    *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
    *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
    *(_OWORD *)&v67.tx = *(_OWORD *)&t1.translation.y;
    if (v50)
    {
      t2 = v67;
      CGAffineTransformScale((CGAffineTransform *)&t1, &t2, 1.0, -1.0);
      *(_OWORD *)&v67.a = *(_OWORD *)&t1.time.value;
      *(_OWORD *)&v67.c = *(_OWORD *)&t1.time.epoch;
      *(_OWORD *)&v67.tx = *(_OWORD *)&t1.translation.y;
    }
    v61 = vaddq_f64(*(float64x2_t *)&v67.tx, vmlaq_n_f64(vmulq_n_f64(*(float64x2_t *)&v67.c, v59), *(float64x2_t *)&v67.a, v60));
    memset(&t1, 0, 24);
    objc_msgSend(v44, "SIMDDouble4x4");
    objc_msgSend(v46, "SIMDDouble4x4");
    objc_msgSend(v48, "SIMDDouble4x4");
    v52 = pv_simd_matrix_unproject_to_plane();
    value = t1.time.value;
    v54 = *(double *)&t1.time.timescale;
    if (!v52)
    {
      v54 = v61.f64[1];
      value = *(int64_t *)&v61.f64[0];
    }
    v59 = v54;
    v60 = *(double *)&value;
  }

  v56 = v59;
  v55 = v60;
  result.y = v56;
  result.x = v55;
  return result;
}

- (CGPoint)effectCenterAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 includeTransformAnimation:(BOOL)a5 includePlayableAspectScale:(BOOL)a6 relativeTo:(CGRect)a7 basisOrigin:(int)a8
{
  double height;
  double width;
  double v11;
  double v12;
  double v13;
  double v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  CGPoint result;

  height = a7.size.height;
  width = a7.size.width;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v15 = *(_OWORD *)&a3->var0;
  *(_QWORD *)&v16 = a3->var3;
  -[JFXOverlayEffect transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:](self, "transformAtTime:forcePosterFrame:includeTransformAnimation:includePlayableAspectScale:relativeTo:basisOrigin:", &v15, a4, a5, a6, *(_QWORD *)&a8, a7.origin.x, a7.origin.y, a7.size.width);
  v11 = *MEMORY[0x24BDBEFB0];
  v12 = *(double *)(MEMORY[0x24BDBEFB0] + 8);
  v19 = v27;
  v20 = v28;
  v21 = v29;
  v22 = v30;
  v15 = v23;
  v16 = v24;
  v17 = v25;
  v18 = v26;
  -[JFXOverlayEffect effectPointToScreenPoint:effectToScreenTransform:viewSize:](self, "effectPointToScreenPoint:effectToScreenTransform:viewSize:", &v15, v11, v12, width, height);
  result.y = v14;
  result.x = v13;
  return result;
}

- (CGPath)newPathsForHitTestingAtTime:(id *)a3 forcePosterFrame:(BOOL)a4 relativeTo:(CGRect)a5 basisOrigin:(int)a6 adjustForMinimumSize:(BOOL)a7 normalizedMinimumSize:(id)a8 outExpandedPath:(const CGPath *)a9
{
  double var1;
  double var0;
  _BOOL4 v12;
  uint64_t v13;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v18;
  void *v21;
  void *v22;
  CGPath *ClosedCGPathWithPoints;
  double v24;
  const CGPath *ExpandedClosedCGPathWithCGPath;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v27;

  var1 = a8.var1;
  var0 = a8.var0;
  v12 = a7;
  v13 = *(_QWORD *)&a6;
  height = a5.size.height;
  width = a5.size.width;
  y = a5.origin.y;
  x = a5.origin.x;
  v18 = a4;
  -[JFXEffect renderEffect](self, "renderEffect");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffect hitAreaScale](self, "hitAreaScale");
  v27 = *a3;
  objc_msgSend(v21, "hitAreaPointsAtTime:forcePosterFrame:includeDropShadow:scale:viewSize:viewOrigin:", &v27, v18, 0, v13);
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  ClosedCGPathWithPoints = createClosedCGPathWithPoints(v22);
  if (!v12
    || (v27 = *a3,
        -[JFXOverlayEffect JFX_adjustedMinimumSizeFromNormalizedMinimumSize:atTime:forcePosterFrame:relativeTo:basisOrigin:](self, "JFX_adjustedMinimumSizeFromNormalizedMinimumSize:atTime:forcePosterFrame:relativeTo:basisOrigin:", &v27, v18, v13, var0, var1, x, y, width, height), v24 <= 0.0)|| (ExpandedClosedCGPathWithCGPath = createExpandedClosedCGPathWithCGPath(ClosedCGPathWithPoints, v24)) == 0)
  {
    ExpandedClosedCGPathWithCGPath = CGPathRetain(ClosedCGPathWithPoints);
  }
  *a9 = ExpandedClosedCGPathWithCGPath;

  return ClosedCGPathWithPoints;
}

- (BOOL)hitTestPoint:(CGPoint)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7 adjustForMinimumSize:(BOOL)a8 normalizedMinimumSize:(id)a9
{
  double var1;
  double var0;
  _BOOL8 v11;
  uint64_t v12;
  double height;
  double width;
  double y;
  double x;
  _BOOL8 v17;
  CGFloat v19;
  CGFloat v20;
  BOOL v22;
  CGPath *v23;
  __int128 v25;
  int64_t var3;
  CGPathRef path;
  CGPoint v28;
  CGPoint v29;

  var1 = a9.var1;
  var0 = a9.var0;
  v11 = a8;
  v12 = *(_QWORD *)&a7;
  height = a6.size.height;
  width = a6.size.width;
  y = a6.origin.y;
  x = a6.origin.x;
  v17 = a5;
  v19 = a3.y;
  v20 = a3.x;
  if (-[JFXOverlayEffect isHidden](self, "isHidden"))
    return 0;
  v25 = *(_OWORD *)&a4->var0;
  var3 = a4->var3;
  path = 0;
  v23 = -[JFXOverlayEffect newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:](self, "newPathsForHitTestingAtTime:forcePosterFrame:relativeTo:basisOrigin:adjustForMinimumSize:normalizedMinimumSize:outExpandedPath:", &v25, v17, v12, v11, &path, x, y, width, height, var0, var1);
  v28.x = v20;
  v28.y = v19;
  v22 = CGPathContainsPoint(v23, 0, v28, 0);
  if (!v22 && v11)
  {
    v29.x = v20;
    v29.y = v19;
    v22 = CGPathContainsPoint(path, 0, v29, 0);
  }
  CGPathRelease(v23);
  CGPathRelease(path);
  return v22;
}

- (double)JFX_adjustedMinimumSizeFromNormalizedMinimumSize:(id)a3 atTime:(id *)a4 forcePosterFrame:(BOOL)a5 relativeTo:(CGRect)a6 basisOrigin:(int)a7
{
  double var0;
  float64x2_t v8;
  float64x2_t v9;
  int64x2_t v10;
  float64x2_t v11;
  int64x2_t v12;
  float64x2_t v13;
  double width;
  CGFloat height;
  $3CC8671D27C23BF42ADDB32F2B5E48AE v17;
  float64x2_t v18;
  __int128 v19;
  float64x2_t v20;
  __int128 v21;

  width = a6.size.width;
  height = a6.size.height;
  var0 = a3.var0;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v17 = *a4;
  -[JFXOverlayEffect cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:](self, "cornersAtTime:forcePosterFrame:includeDropShadow:scale:relativeTo:basisOrigin:", &v17, a5, 0, *(_QWORD *)&a7, 1.0, 1.0, a6.origin.x, a6.origin.y);
  v8 = vabdq_f64(v20, v18);
  v9.f64[0] = width;
  v9.f64[1] = height;
  v10 = (int64x2_t)vmulq_f64(v8, v8);
  v11 = vmulq_n_f64(v9, 0.2);
  v12 = (int64x2_t)vmulq_f64(v11, v11);
  v13 = vaddq_f64((float64x2_t)vzip1q_s64(v12, v10), (float64x2_t)vzip2q_s64(v12, v10));
  return var0 * width * fmin(fmax(vdivq_f64(v13, (float64x2_t)vdupq_laneq_s64((int64x2_t)v13, 1)).f64[0], 0.0), 1.0);
}

- (CGPoint)closeButtonInset
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  char v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  double v15;
  double v16;
  CGPoint result;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = *MEMORY[0x24BDBEFB0];
    v5 = *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8);
  }
  else
  {
    -[JFXEffect effectID](self, "effectID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x24BE79468]);

    if ((v7 & 1) != 0)
    {
      v5 = 0x3F92F1A9FBE76C8BLL;
      v4 = 0x3F92F1A9FBE76C8BLL;
    }
    else
    {
      -[JFXTextEffect editUIProperties](self, "editUIProperties");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[JFXEffect effectID](self, "effectID");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("X"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v4 = v12;

        objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("Y"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "doubleValue");
        v5 = v14;

      }
      else
      {
        v4 = *MEMORY[0x24BDBEFB0];
        v5 = *(_QWORD *)(MEMORY[0x24BDBEFB0] + 8);
      }

    }
  }
  v15 = *(double *)&v4;
  v16 = *(double *)&v5;
  result.y = v16;
  result.x = v15;
  return result;
}

- (CGPoint)hitAreaScale
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  CGPoint result;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "initialRotation");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "CGPointValue");
      v7 = v6;
      v9 = v8;
    }
    else
    {
      v9 = 1.0;
      v7 = 1.0;
    }
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v9 = 1.0;
    if (v11
      && (objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HitAreaScaleX")),
          (v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      v13 = (void *)v12;
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HitAreaScaleY"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = 1.0;
      if (v14)
      {
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HitAreaScaleX"));
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "doubleValue");
        v7 = v16 / 100.0;

        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("HitAreaScaleY"));
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "doubleValue");
        v9 = v18 / 100.0;

      }
    }
    else
    {
      v7 = 1.0;
    }

  }
  v19 = v7;
  v20 = v9;
  result.y = v20;
  result.x = v19;
  return result;
}

- (double)pickerScale
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "pickerScale");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "doubleValue");
      v7 = v6;
    }
    else
    {
      v7 = 1.0;
    }
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    v7 = 1.0;
    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PickerScale"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("PickerScale"));
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "doubleValue");
        v7 = v12;

      }
    }

  }
  return v7;
}

- (BOOL)includeDropShadowWhenPositioningCloseButton
{
  void *v3;
  void *v4;
  BOOL v5;

  -[JFXEffect effectID](self, "effectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == (void *)*MEMORY[0x24BE79490])
  {
    v5 = 0;
  }
  else
  {
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4 != (void *)*MEMORY[0x24BE794E8];

  }
  return v5;
}

- (unint64_t)maxCharacters
{
  unint64_t v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)JFXOverlayEffect;
  v3 = -[JFXTextEffect maxCharacters](&v7, sel_maxCharacters);
  if (v3 == -1)
  {
    if (maxCharacters_onceToken != -1)
      dispatch_once(&maxCharacters_onceToken, &__block_literal_global_11);
    objc_msgSend((id)maxCharacters_sMaxCharsMap, "objectForKeyedSubscript:", self->super.super._effectID);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
      v3 = objc_msgSend(v4, "unsignedIntegerValue");
    else
      v3 = 80;

  }
  return v3;
}

void __33__JFXOverlayEffect_maxCharacters__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[4];
  _QWORD v5[5];

  v5[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE794E0];
  v4[0] = *MEMORY[0x24BE79308];
  v4[1] = v0;
  v5[0] = &unk_24EE9BA80;
  v5[1] = &unk_24EE9BA98;
  v1 = *MEMORY[0x24BE794E8];
  v4[2] = *MEMORY[0x24BE794B0];
  v4[3] = v1;
  v5[2] = &unk_24EE9BA98;
  v5[3] = &unk_24EE9BA80;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v5, v4, 4);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)maxCharacters_sMaxCharsMap;
  maxCharacters_sMaxCharsMap = v2;

}

+ (id)effectIDToImageSequenceIDMap
{
  if (effectIDToImageSequenceIDMap_onceToken != -1)
    dispatch_once(&effectIDToImageSequenceIDMap_onceToken, &__block_literal_global_198);
  return (id)effectIDToImageSequenceIDMap_sEffectToURLMap;
}

void __48__JFXOverlayEffect_effectIDToImageSequenceIDMap__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];
  _QWORD v9[7];

  v9[6] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE793F0];
  v1 = *MEMORY[0x24BE79400];
  v8[0] = *MEMORY[0x24BE793F8];
  v8[1] = v1;
  v9[0] = v0;
  v9[1] = v0;
  v2 = *MEMORY[0x24BE79408];
  v3 = *MEMORY[0x24BE79418];
  v8[2] = *MEMORY[0x24BE79410];
  v8[3] = v3;
  v9[2] = v2;
  v9[3] = v2;
  v4 = *MEMORY[0x24BE79428];
  v5 = *MEMORY[0x24BE79438];
  v8[4] = *MEMORY[0x24BE79430];
  v8[5] = v5;
  v9[4] = v4;
  v9[5] = v4;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v9, v8, 6);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)effectIDToImageSequenceIDMap_sEffectToURLMap;
  effectIDToImageSequenceIDMap_sEffectToURLMap = v6;

}

- (void)setImageSequencePath:(id)a3
{
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", a3, *MEMORY[0x24BE795F8]);
}

- (void)setImageSequencePathToBundledAssets
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  BOOL v9;
  id v10;

  +[JFXOverlayEffect effectIDToImageSequenceIDMap](JFXOverlayEffect, "effectIDToImageSequenceIDMap");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[JFXEffect effectID](self, "effectID");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKeyedSubscript:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathForResource:ofType:", v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD1580], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
    v9 = v6 == 0;
  else
    v9 = 1;
  if (!v9)
    -[JFXOverlayEffect setImageSequencePath:](self, "setImageSequencePath:", v6);

}

- (BOOL)enablePresentationState:(BOOL)a3
{
  _BOOL8 v3;
  unsigned int v5;
  void *v6;
  void *v7;
  int v8;
  int v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  BOOL v14;
  objc_super v16;

  v3 = a3;
  v16.receiver = self;
  v16.super_class = (Class)JFXOverlayEffect;
  v5 = -[JFXEffect enablePresentationState:](&v16, sel_enablePresentationState_);
  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE795A0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
    v8 = objc_msgSend(v6, "BOOLValue") ^ 1;
  else
    v8 = 1;
  if (v8 == v3)
    v9 = 1;
  else
    v9 = v5;
  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE795F8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {

    goto LABEL_10;
  }
  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79650]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
LABEL_10:
    -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE795A8]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v12;
    if (v12)
      LODWORD(v12) = objc_msgSend(v12, "BOOLValue");
    if ((_DWORD)v12 == v3)
      LOBYTE(v9) = 1;

    if ((v9 & 1) != 0)
      goto LABEL_15;
LABEL_17:
    v14 = 0;
    goto LABEL_18;
  }
  if (!v9)
    goto LABEL_17;
LABEL_15:
  -[JFXOverlayEffect setForceRenderAtPosterFrame:](self, "setForceRenderAtPosterFrame:", v3);
  v14 = 1;
LABEL_18:

  return v14;
}

- (void)setForceRenderAtPosterFrame:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v3 = a3;
  v9.receiver = self;
  v9.super_class = (Class)JFXOverlayEffect;
  -[JFXEffect setForceRenderAtPosterFrame:](&v9, sel_setForceRenderAtPosterFrame_);
  if (-[JFXOverlayEffect JFX_hasPosterFrame](self, "JFX_hasPosterFrame"))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v5, *MEMORY[0x24BE795A0]);

  }
  -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE795F8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {

  }
  else
  {
    -[JFXEffect parameterForKey:](self, "parameterForKey:", *MEMORY[0x24BE79650]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
      return;
  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", v3 ^ 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXEffect setParameter:forKey:](self, "setParameter:forKey:", v8, *MEMORY[0x24BE795A8]);

}

- (BOOL)loopedRangeRenderIsCacheable
{
  void *v3;
  void *v4;
  char v5;
  void *v6;
  BOOL v7;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "loopRenderRangeIsCachable");
  }
  else
  {
    if (loopedRangeRenderIsCacheable_onceToken != -1)
      dispatch_once(&loopedRangeRenderIsCacheable_onceToken, &__block_literal_global_206);
    v6 = (void *)loopedRangeRenderIsCacheable_cacheableEffectIDs;
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v6, "containsObject:", v4);
  }
  v7 = v5;

  return v7;
}

void __48__JFXOverlayEffect_loopedRangeRenderIsCacheable__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  _QWORD v23[2];
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;

  v60 = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BE792D8];
  v23[0] = *MEMORY[0x24BE79350];
  v23[1] = v0;
  v1 = *MEMORY[0x24BE79308];
  v24 = *MEMORY[0x24BE792E0];
  v25 = v1;
  v2 = *MEMORY[0x24BE794E8];
  v26 = *MEMORY[0x24BE792D0];
  v27 = v2;
  v3 = *MEMORY[0x24BE79300];
  v28 = *MEMORY[0x24BE79488];
  v29 = v3;
  v4 = *MEMORY[0x24BE79508];
  v30 = *MEMORY[0x24BE794D8];
  v31 = v4;
  v5 = *MEMORY[0x24BE794C8];
  v32 = *MEMORY[0x24BE792E8];
  v33 = v5;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v7 = *MEMORY[0x24BE794D0];
  v34 = v24;
  v35 = v7;
  v8 = *MEMORY[0x24BE79470];
  v36 = *MEMORY[0x24BE79500];
  v37 = v8;
  v9 = *MEMORY[0x24BE794E0];
  v38 = *MEMORY[0x24BE79490];
  v39 = v9;
  v10 = *MEMORY[0x24BE792B8];
  v40 = *MEMORY[0x24BE792B0];
  v41 = v10;
  v11 = *MEMORY[0x24BE79450];
  v42 = *MEMORY[0x24BE792C0];
  v43 = v11;
  v12 = *MEMORY[0x24BE79460];
  v44 = *MEMORY[0x24BE79458];
  v45 = v12;
  v13 = *MEMORY[0x24BE794A0];
  v46 = *MEMORY[0x24BE79498];
  v47 = v13;
  v14 = *MEMORY[0x24BE794B8];
  v48 = *MEMORY[0x24BE794A8];
  v49 = v14;
  v15 = *MEMORY[0x24BE79478];
  v50 = *MEMORY[0x24BE792C8];
  v51 = v15;
  v16 = *MEMORY[0x24BE79510];
  v52 = *MEMORY[0x24BE794C0];
  v53 = v16;
  v17 = *MEMORY[0x24BE794F8];
  v54 = *MEMORY[0x24BE794F0];
  v55 = v17;
  v18 = *MEMORY[0x24BE792F0];
  v56 = *MEMORY[0x24BE792A8];
  v57 = v18;
  v19 = *MEMORY[0x24BE79480];
  v58 = *MEMORY[0x24BE79310];
  v59 = v19;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v23, 38);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v20);
  v21 = objc_claimAutoreleasedReturnValue();
  v22 = (void *)loopedRangeRenderIsCacheable_cacheableEffectIDs;
  loopedRangeRenderIsCacheable_cacheableEffectIDs = v21;

}

- (BOOL)JFX_hasPosterFrame
{
  void *v3;
  void *v4;
  char v5;
  char v6;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "doesNotHavePosterFrame");
  }
  else
  {
    -[JFXEffect effectID](self, "effectID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "isEqualToString:", *MEMORY[0x24BE79468]);
  }
  v6 = v5;

  return v6 ^ 1;
}

- (BOOL)JFX_posterFrameIsCachable
{
  void *v3;
  void *v4;
  int v5;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "posterFrameIsNotCachable") ^ 1;

  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (BOOL)JFX_shouldEnableDynamicLineSpacingForDiacritics
{
  void *v3;
  void *v4;
  void *v5;
  char v6;
  void *v7;
  char v8;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "shouldDisableDynamicLineSpacingForDiatrics");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = objc_msgSend(v5, "BOOLValue");
LABEL_8:
      v8 = v6 ^ 1;
      goto LABEL_9;
    }
    v8 = 1;
  }
  else
  {
    v7 = (void *)*MEMORY[0x24BE794B0];
    -[JFXEffect effectID](self, "effectID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "isEqualToString:", v5) & 1) == 0)
    {
      v6 = -[JFXOverlayEffect isEmoji](self, "isEmoji");
      goto LABEL_8;
    }
    v8 = 0;
  }
LABEL_9:

  return v8;
}

- (void)trackedEffectProperties:(id)a3 didChangeTrackingType:(BOOL)a4 didChangeEnabled:(BOOL)a5
{
  void *v6;
  void *v7;

  if (a4)
  {
    +[JFXAnalyticsManager sharedInstance](JFXAnalyticsManager, "sharedInstance", a3, a4, a5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "trackEventWithName:", CFSTR("facetrackedoverlaychangedplanes"));

  }
  -[JFXOverlayEffect faceTrackingTransform](self, "faceTrackingTransform", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[JFXOverlayEffect JFX_applyEffectParametersForFaceTrackingTransform:](self, "JFX_applyEffectParametersForFaceTrackingTransform:", v7);

  -[JFXOverlayEffect JFX_updateInteractiveMode](self, "JFX_updateInteractiveMode");
}

- (void)JFX_updateInteractiveMode
{
  _BOOL8 v3;
  id v4;

  v3 = -[JFXOverlayEffect isInteractiveEditing](self, "isInteractiveEditing")
    || -[JFXOverlayEffect isCurrentlyTracking](self, "isCurrentlyTracking");
  -[JFXEffect renderEffect](self, "renderEffect");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIsInInteractiveMode:", v3);

}

- (void)beginInteractiveEditing
{
  int *p_isInteractiveEditingCount;
  unsigned int v3;

  p_isInteractiveEditingCount = &self->_isInteractiveEditingCount;
  do
    v3 = __ldaxr((unsigned int *)p_isInteractiveEditingCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_isInteractiveEditingCount));
  -[JFXOverlayEffect JFX_updateInteractiveMode](self, "JFX_updateInteractiveMode");
}

- (BOOL)isInteractiveEditing
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_isInteractiveEditingCount);
  return v2 > 0;
}

- (void)endInteractiveEditing
{
  int *p_isInteractiveEditingCount;
  unsigned int v3;

  p_isInteractiveEditingCount = &self->_isInteractiveEditingCount;
  do
    v3 = __ldaxr((unsigned int *)p_isInteractiveEditingCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_isInteractiveEditingCount));
  -[JFXOverlayEffect JFX_updateInteractiveMode](self, "JFX_updateInteractiveMode");
}

- (void)beginEditingFaceTrackingTransforms
{
  int *p_isEditingFaceTrackingTransformsCount;
  unsigned int v3;

  p_isEditingFaceTrackingTransformsCount = &self->_isEditingFaceTrackingTransformsCount;
  do
    v3 = __ldaxr((unsigned int *)p_isEditingFaceTrackingTransformsCount);
  while (__stlxr(v3 + 1, (unsigned int *)p_isEditingFaceTrackingTransformsCount));
}

- (void)endEditingFaceTrackingTransforms
{
  int *p_isEditingFaceTrackingTransformsCount;
  unsigned int v3;

  p_isEditingFaceTrackingTransformsCount = &self->_isEditingFaceTrackingTransformsCount;
  do
    v3 = __ldaxr((unsigned int *)p_isEditingFaceTrackingTransformsCount);
  while (__stlxr(v3 - 1, (unsigned int *)p_isEditingFaceTrackingTransformsCount));
}

- (BOOL)isEditingFaceTrackingTransforms
{
  signed int v2;

  v2 = atomic_load((unsigned int *)&self->_isEditingFaceTrackingTransformsCount);
  return v2 > 0;
}

- (id)accessibilityName
{
  void *v3;
  void *v4;
  objc_super v6;

  -[JFXOverlayEffect accessibilityOverlayEffectLabel](self, "accessibilityOverlayEffectLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect accessibilityOverlayEffectLabel](self, "accessibilityOverlayEffectLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)JFXOverlayEffect;
    -[JFXEffect accessibilityName](&v6, sel_accessibilityName);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (BOOL)hasDynamicText
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "dynamicTextType");

    LOBYTE(v6) = v5 != 0;
  }
  else
  {
    -[JFXTextEffect editUIProperties](self, "editUIProperties");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[JFXEffect effectID](self, "effectID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v9)
    {
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("hasDynamicText"));
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      if (v6)
      {
        objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("hasDynamicText"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        LOBYTE(v6) = objc_msgSend(v10, "BOOLValue");

      }
    }
    else
    {
      LOBYTE(v6) = 0;
    }

  }
  return (char)v6;
}

+ (id)dynamicTextPlaceholderMap
{
  if (dynamicTextPlaceholderMap_onceToken != -1)
    dispatch_once(&dynamicTextPlaceholderMap_onceToken, &__block_literal_global_213);
  return (id)dynamicTextPlaceholderMap_sDynamicTextMap;
}

void __45__JFXOverlayEffect_dynamicTextPlaceholderMap__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];
  _QWORD v3[7];

  v3[6] = *MEMORY[0x24BDAC8D0];
  v2[0] = &unk_24EE9BAB0;
  v2[1] = &unk_24EE9BAC8;
  v3[0] = CFSTR("<#DATE>");
  v3[1] = CFSTR("<#location>");
  v2[2] = &unk_24EE9BAE0;
  v2[3] = &unk_24EE9BAF8;
  v3[2] = CFSTR("<#ABBREVLONGDATE>");
  v3[3] = CFSTR("<#temp>");
  v2[4] = &unk_24EE9BB10;
  v2[5] = &unk_24EE9BB28;
  v3[4] = CFSTR("<#time>");
  v3[5] = CFSTR("<#dayofweek>");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v3, v2, 6);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)dynamicTextPlaceholderMap_sDynamicTextMap;
  dynamicTextPlaceholderMap_sDynamicTextMap = v0;

}

- (id)JFX_dynamicTextPlaceHolderText
{
  void *v3;
  void *v4;
  void *v5;
  unint64_t v6;
  void *v7;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "dynamicTextPlaceholder");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = -[JFXOverlayEffect dynamicTextType](self, "dynamicTextType");
    objc_msgSend((id)objc_opt_class(), "dynamicTextPlaceholderMap");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "objectForKey:", v7);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (unint64_t)dynamicTextType
{
  void *v3;
  void *v4;
  unint64_t v5;
  void *v6;
  void *v7;
  _QWORD v9[4];
  id v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  -[JFXEffect contentDataSource](self, "contentDataSource");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[JFXOverlayEffect overlayContentDataSource](self, "overlayContentDataSource");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "dynamicTextType");

  }
  else
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2020000000;
    v15 = 0;
    -[JFXTextEffect defaultAttributedString:](self, "defaultAttributedString:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (v6)
    {
      objc_msgSend((id)objc_opt_class(), "dynamicTextPlaceholderMap");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __35__JFXOverlayEffect_dynamicTextType__block_invoke;
      v9[3] = &unk_24EE58948;
      v10 = v6;
      v11 = &v12;
      objc_msgSend(v7, "enumerateKeysAndObjectsUsingBlock:", v9);

    }
    v5 = v13[3];

    _Block_object_dispose(&v12, 8);
  }
  return v5;
}

void __35__JFXOverlayEffect_dynamicTextType__block_invoke(uint64_t a1, void *a2, void *a3, _BYTE *a4)
{
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  id v11;

  v11 = a2;
  v7 = *(void **)(a1 + 32);
  v8 = a3;
  objc_msgSend(v7, "string");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "rangeOfString:options:", v8, 1);

  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(v11, "unsignedIntegerValue");
    *a4 = 1;
  }

}

- (void)setDynamicTextString:(id)a3
{
  id v4;

  v4 = a3;
  if (-[JFXOverlayEffect hasDynamicText](self, "hasDynamicText"))
  {
    if (v4)
      -[JFXTextEffect setString:atIndex:](self, "setString:atIndex:", v4, 0);
    else
      -[JFXOverlayEffect resetDynamicTextString](self, "resetDynamicTextString");
  }

}

- (void)resetDynamicTextString
{
  id v3;

  if (-[JFXOverlayEffect hasDynamicText](self, "hasDynamicText"))
  {
    -[JFXOverlayEffect JFX_dynamicTextPlaceHolderText](self, "JFX_dynamicTextPlaceHolderText");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[JFXTextEffect setString:atIndex:](self, "setString:atIndex:", v3, 0);

  }
}

- (NSString)dynamicTextString
{
  void *v2;
  id v3;

  -[JFXOverlayEffect JFX_stringAtIndex:](self, "JFX_stringAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = 0;
  if ((objc_msgSend(v2, "hasPrefix:", CFSTR("<#")) & 1) == 0)
    v3 = v2;

  return (NSString *)v3;
}

- (void)updateDynamicTextWithCompletionBlock:(id)a3
{
  id v4;
  id v5;
  void (**v6)(_QWORD, _QWORD);
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, void *);
  void *v16;
  JFXOverlayEffect *v17;
  id v18;

  v4 = a3;
  v13 = MEMORY[0x24BDAC760];
  v14 = 3221225472;
  v15 = __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke;
  v16 = &unk_24EE58970;
  v17 = self;
  v5 = v4;
  v18 = v5;
  v6 = (void (**)(_QWORD, _QWORD))MEMORY[0x2276A1F6C](&v13);
  switch(-[JFXOverlayEffect dynamicTextType](self, "dynamicTextType", v13, v14, v15, v16, v17))
  {
    case 1uLL:
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (updateDynamicTextWithCompletionBlock__onceToken != -1)
        dispatch_once(&updateDynamicTextWithCompletionBlock__onceToken, &__block_literal_global_236);
      v8 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
      goto LABEL_12;
    case 4uLL:
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[JTFormatters dateFormatterMonthDay](JTFormatters, "dateFormatterMonthDay");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_8;
    case 5uLL:
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      +[JTFormatters dateFormatterDayOfWeekMonthDayYear](JTFormatters, "dateFormatterDayOfWeekMonthDayYear");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:
      v10 = v9;
      objc_msgSend(v9, "stringFromDate:", v7);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      ((void (**)(_QWORD, void *))v6)[2](v6, v11);
      goto LABEL_13;
    case 6uLL:
      objc_msgSend(MEMORY[0x24BDBCE60], "date");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (updateDynamicTextWithCompletionBlock__onceToken_239 != -1)
        dispatch_once(&updateDynamicTextWithCompletionBlock__onceToken_239, &__block_literal_global_240);
      v8 = (void *)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter;
LABEL_12:
      objc_msgSend(v8, "stringFromDate:", v7);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      ((void (**)(_QWORD, void *))v6)[2](v6, v12);

LABEL_13:
      break;
    default:
      (*((void (**)(id, _QWORD))v5 + 2))(v5, 0);
      break;
  }

}

void __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  const __CFString *v3;
  void *v4;
  __CFString *v5;

  v3 = a2;
  if (!v3)
    v3 = &stru_24EE5C428;
  v5 = (__CFString *)v3;
  objc_msgSend(*(id *)(a1 + 32), "JFX_stringAtIndex:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((-[__CFString isEqualToString:](v5, "isEqualToString:", v4) & 1) == 0)
    objc_msgSend(*(id *)(a1 + 32), "setString:atIndex:", v5, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

void __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke_2()
{
  uint64_t v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v0 = objc_opt_new();
  v1 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
  updateDynamicTextWithCompletionBlock__s_shortTimeFormatter = v0;

  objc_msgSend((id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter, "setDateStyle:", 0);
  objc_msgSend((id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter, "setTimeStyle:", 1);
  v2 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
  objc_msgSend((id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter, "AMSymbol");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedLowercaseString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAMSymbol:", v4);

  v5 = (void *)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter;
  objc_msgSend((id)updateDynamicTextWithCompletionBlock__s_shortTimeFormatter, "PMSymbol");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "localizedLowercaseString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setPMSymbol:", v6);

}

uint64_t __57__JFXOverlayEffect_updateDynamicTextWithCompletionBlock___block_invoke_3()
{
  uint64_t v0;
  void *v1;
  void *v2;

  v0 = objc_opt_new();
  v1 = (void *)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter;
  updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter = v0;

  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter, "setLocale:", v2);

  return objc_msgSend((id)updateDynamicTextWithCompletionBlock__s_DayOfWeekFormatter, "setLocalizedDateFormatFromTemplate:", CFSTR("cccc"));
}

- (BOOL)wasDynamicTextSet
{
  void *v2;
  void *v3;
  int v4;

  -[JFXOverlayEffect JFX_stringAtIndex:](self, "JFX_stringAtIndex:", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
    v4 = objc_msgSend(v2, "hasPrefix:", CFSTR("<#")) ^ 1;
  else
    LOBYTE(v4) = 0;

  return v4;
}

- (id)JFX_stringAtIndex:(unint64_t)a3
{
  id *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = (id *)MEMORY[0x24BE796A8];
  if (a3)
    v4 = (id *)MEMORY[0x24BE796C8];
  v5 = *v4;
  -[JFXEffect renderEffect](self, "renderEffect");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "effectParameters");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(v8, "string");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (NSString)accessibilityOverlayEffectLabel
{
  return self->_accessibilityOverlayEffectLabel;
}

- (void)setAccessibilityOverlayEffectLabel:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 112);
}

- (JFXTrackedEffectProperties)trackingProps
{
  return self->_trackingProps;
}

- (BOOL)prefersTrackingNotActivateAutomatically
{
  return self->_prefersTrackingNotActivateAutomatically;
}

- (void)setPrefersTrackingNotActivateAutomatically:(BOOL)a3
{
  self->_prefersTrackingNotActivateAutomatically = a3;
}

- (JFXFaceTrackedEffectTransform)internalFaceTrackingTransform
{
  return (JFXFaceTrackedEffectTransform *)objc_getProperty(self, a2, 128, 1);
}

- (void)setInternalFaceTrackingTransform:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 128);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_internalFaceTrackingTransform, 0);
  objc_storeStrong((id *)&self->_trackingProps, 0);
  objc_storeStrong((id *)&self->_accessibilityOverlayEffectLabel, 0);
}

@end

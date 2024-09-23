@implementation PHAssetCreationAdjustmentBakeInOptions

- (PHAssetCreationAdjustmentBakeInOptions)init
{
  PHAssetCreationAdjustmentBakeInOptions *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHAssetCreationAdjustmentBakeInOptions;
  result = -[PHAssetCreationAdjustmentBakeInOptions init](&v3, sel_init);
  if (result)
  {
    result->_shouldBakeInIfTimelineTrimmed = 1;
    *(_DWORD *)&result->_shouldBakeInIfLivePhotoPlaybackDisabled = 16843009;
    *(_WORD *)&result->_shouldBakeInIfPortraitDepthEffectEnabled = 256;
    result->_flattenLivePhotoToStillIfNeeded = 0;
  }
  return result;
}

- (PHAssetCreationAdjustmentBakeInOptions)initWithXPCDict:(id)a3
{
  id v4;
  PHAssetCreationAdjustmentBakeInOptions *v5;
  void *v6;
  void *v7;

  v4 = a3;
  v5 = -[PHAssetCreationAdjustmentBakeInOptions init](self, "init");
  if (v5)
  {
    xpc_dictionary_get_value(v4, "adjustmentBakeInOptions");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v6)
    {
      v5->_shouldBakeInIfLivePhotoPlaybackDisabled = xpc_dictionary_get_BOOL(v6, "livePhotoDisabled");
      v5->_shouldBakeInIfLivePhotoMuted = xpc_dictionary_get_BOOL(v7, "livePhotoMuted");
      v5->_shouldBakeInIfAdjustedByThirdParty = xpc_dictionary_get_BOOL(v7, "thirdPartyAdjustments");
      v5->_shouldBakeInIfCropped = xpc_dictionary_get_BOOL(v7, "cropped");
      v5->_shouldBakeInIfTimelineTrimmed = xpc_dictionary_get_BOOL(v7, "timelineTrimmed");
      v5->_shouldBakeInIfPortraitDepthEffectEnabled = xpc_dictionary_get_BOOL(v7, "portraitDepthEffect");
      v5->_shouldBakeInIfContainsPenultimateResources = xpc_dictionary_get_BOOL(v7, "containsPenultimateResources");
      v5->_flattenLivePhotoToStillIfNeeded = xpc_dictionary_get_BOOL(v7, "flattenLivePhotoToStillIfNeeded");
    }

  }
  return v5;
}

- (id)copyWithZone:(_NSZone *)a3
{
  PHAssetCreationAdjustmentBakeInOptions *v4;

  v4 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfLivePhotoPlaybackDisabled:](v4, "setShouldBakeInIfLivePhotoPlaybackDisabled:", self->_shouldBakeInIfLivePhotoPlaybackDisabled);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfLivePhotoMuted:](v4, "setShouldBakeInIfLivePhotoMuted:", self->_shouldBakeInIfLivePhotoMuted);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfAdjustedByThirdParty:](v4, "setShouldBakeInIfAdjustedByThirdParty:", self->_shouldBakeInIfAdjustedByThirdParty);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfCropped:](v4, "setShouldBakeInIfCropped:", self->_shouldBakeInIfCropped);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfTimelineTrimmed:](v4, "setShouldBakeInIfTimelineTrimmed:", self->_shouldBakeInIfTimelineTrimmed);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfPortraitDepthEffectEnabled:](v4, "setShouldBakeInIfPortraitDepthEffectEnabled:", self->_shouldBakeInIfPortraitDepthEffectEnabled);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfContainsPenultimateResources:](v4, "setShouldBakeInIfContainsPenultimateResources:", self->_shouldBakeInIfContainsPenultimateResources);
  -[PHAssetCreationAdjustmentBakeInOptions setFlattenLivePhotoToStillIfNeeded:](v4, "setFlattenLivePhotoToStillIfNeeded:", self->_flattenLivePhotoToStillIfNeeded);
  return v4;
}

- (void)encodeToXPCDict:(id)a3
{
  id v4;
  xpc_object_t xdict;

  v4 = a3;
  xdict = xpc_dictionary_create(0, 0, 0);
  xpc_dictionary_set_value(v4, "adjustmentBakeInOptions", xdict);

  xpc_dictionary_set_BOOL(xdict, "livePhotoDisabled", self->_shouldBakeInIfLivePhotoPlaybackDisabled);
  xpc_dictionary_set_BOOL(xdict, "livePhotoMuted", self->_shouldBakeInIfLivePhotoMuted);
  xpc_dictionary_set_BOOL(xdict, "thirdPartyAdjustments", self->_shouldBakeInIfAdjustedByThirdParty);
  xpc_dictionary_set_BOOL(xdict, "cropped", self->_shouldBakeInIfCropped);
  xpc_dictionary_set_BOOL(xdict, "timelineTrimmed", self->_shouldBakeInIfTimelineTrimmed);
  xpc_dictionary_set_BOOL(xdict, "portraitDepthEffect", self->_shouldBakeInIfPortraitDepthEffectEnabled);
  xpc_dictionary_set_BOOL(xdict, "containsPenultimateResources", self->_shouldBakeInIfContainsPenultimateResources);
  xpc_dictionary_set_BOOL(xdict, "flattenLivePhotoToStillIfNeeded", self->_flattenLivePhotoToStillIfNeeded);

}

- (id)description
{
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAssetCreationAdjustmentBakeInOptions;
  -[PHAssetCreationAdjustmentBakeInOptions description](&v6, sel_description);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingFormat:", CFSTR(" shouldBakeInIfLivePhotoPlaybackDisabled=%d, shouldBakeInIfLivePhotoMuted=%d, shouldBakeInIfAdjustedByThirdParty=%d, shouldBakeInIfCropped=%d, shouldBakeInIfTimelineTrimmed=%d, shouldBakeInIfPortraitDepthEffectEnabled=%d, shouldBakeInIfContainsPenultimateResources=%d, flattenLivePhotoToStillIfNeeded=%d"), self->_shouldBakeInIfLivePhotoPlaybackDisabled, self->_shouldBakeInIfLivePhotoMuted, self->_shouldBakeInIfAdjustedByThirdParty, self->_shouldBakeInIfCropped, self->_shouldBakeInIfTimelineTrimmed, self->_shouldBakeInIfPortraitDepthEffectEnabled, self->_shouldBakeInIfContainsPenultimateResources, self->_flattenLivePhotoToStillIfNeeded);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)plRepresentation
{
  id v3;

  v3 = objc_alloc_init(MEMORY[0x1E0D71888]);
  copyPropertiesFromObjectAToObjectB(self, v3);
  return v3;
}

- (void)encodeWithCoder:(id)a3
{
  _BOOL8 shouldBakeInIfLivePhotoPlaybackDisabled;
  void *v5;
  id v6;
  void *v7;
  _BOOL8 shouldBakeInIfLivePhotoMuted;
  void *v9;
  _BOOL8 shouldBakeInIfAdjustedByThirdParty;
  void *v11;
  _BOOL8 shouldBakeInIfCropped;
  void *v13;
  _BOOL8 shouldBakeInIfTimelineTrimmed;
  void *v15;
  _BOOL8 shouldBakeInIfPortraitDepthEffectEnabled;
  void *v17;
  _BOOL8 shouldBakeInIfContainsPenultimateResources;
  void *v19;
  _BOOL8 flattenLivePhotoToStillIfNeeded;
  id v21;

  shouldBakeInIfLivePhotoPlaybackDisabled = self->_shouldBakeInIfLivePhotoPlaybackDisabled;
  v5 = (void *)MEMORY[0x1E0CB3940];
  v6 = a3;
  objc_msgSend(v5, "stringWithUTF8String:", "livePhotoDisabled");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfLivePhotoPlaybackDisabled, v7);

  shouldBakeInIfLivePhotoMuted = self->_shouldBakeInIfLivePhotoMuted;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "livePhotoMuted");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfLivePhotoMuted, v9);

  shouldBakeInIfAdjustedByThirdParty = self->_shouldBakeInIfAdjustedByThirdParty;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "thirdPartyAdjustments");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfAdjustedByThirdParty, v11);

  shouldBakeInIfCropped = self->_shouldBakeInIfCropped;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cropped");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfCropped, v13);

  shouldBakeInIfTimelineTrimmed = self->_shouldBakeInIfTimelineTrimmed;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timelineTrimmed");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfTimelineTrimmed, v15);

  shouldBakeInIfPortraitDepthEffectEnabled = self->_shouldBakeInIfPortraitDepthEffectEnabled;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "portraitDepthEffect");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfPortraitDepthEffectEnabled, v17);

  shouldBakeInIfContainsPenultimateResources = self->_shouldBakeInIfContainsPenultimateResources;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "containsPenultimateResources");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", shouldBakeInIfContainsPenultimateResources, v19);

  flattenLivePhotoToStillIfNeeded = self->_flattenLivePhotoToStillIfNeeded;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "flattenLivePhotoToStillIfNeeded");
  v21 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "encodeBool:forKey:", flattenLivePhotoToStillIfNeeded, v21);

}

- (PHAssetCreationAdjustmentBakeInOptions)initWithCoder:(id)a3
{
  id v4;
  PHAssetCreationAdjustmentBakeInOptions *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v4 = a3;
  v15.receiver = self;
  v15.super_class = (Class)PHAssetCreationAdjustmentBakeInOptions;
  v5 = -[PHAssetCreationAdjustmentBakeInOptions init](&v15, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "livePhotoDisabled");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfLivePhotoPlaybackDisabled = objc_msgSend(v4, "decodeBoolForKey:", v6);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "livePhotoMuted");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfLivePhotoMuted = objc_msgSend(v4, "decodeBoolForKey:", v7);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "thirdPartyAdjustments");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfAdjustedByThirdParty = objc_msgSend(v4, "decodeBoolForKey:", v8);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "cropped");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfCropped = objc_msgSend(v4, "decodeBoolForKey:", v9);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "timelineTrimmed");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfTimelineTrimmed = objc_msgSend(v4, "decodeBoolForKey:", v10);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "portraitDepthEffect");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfPortraitDepthEffectEnabled = objc_msgSend(v4, "decodeBoolForKey:", v11);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "containsPenultimateResources");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_shouldBakeInIfContainsPenultimateResources = objc_msgSend(v4, "decodeBoolForKey:", v12);

    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "flattenLivePhotoToStillIfNeeded");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v5->_flattenLivePhotoToStillIfNeeded = objc_msgSend(v4, "decodeBoolForKey:", v13);

  }
  return v5;
}

- (BOOL)shouldBakeInIfLivePhotoPlaybackDisabled
{
  return self->_shouldBakeInIfLivePhotoPlaybackDisabled;
}

- (void)setShouldBakeInIfLivePhotoPlaybackDisabled:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoPlaybackDisabled = a3;
}

- (BOOL)shouldBakeInIfLivePhotoMuted
{
  return self->_shouldBakeInIfLivePhotoMuted;
}

- (void)setShouldBakeInIfLivePhotoMuted:(BOOL)a3
{
  self->_shouldBakeInIfLivePhotoMuted = a3;
}

- (BOOL)shouldBakeInIfAdjustedByThirdParty
{
  return self->_shouldBakeInIfAdjustedByThirdParty;
}

- (void)setShouldBakeInIfAdjustedByThirdParty:(BOOL)a3
{
  self->_shouldBakeInIfAdjustedByThirdParty = a3;
}

- (BOOL)shouldBakeInIfCropped
{
  return self->_shouldBakeInIfCropped;
}

- (void)setShouldBakeInIfCropped:(BOOL)a3
{
  self->_shouldBakeInIfCropped = a3;
}

- (BOOL)shouldBakeInIfTimelineTrimmed
{
  return self->_shouldBakeInIfTimelineTrimmed;
}

- (void)setShouldBakeInIfTimelineTrimmed:(BOOL)a3
{
  self->_shouldBakeInIfTimelineTrimmed = a3;
}

- (BOOL)shouldBakeInIfPortraitDepthEffectEnabled
{
  return self->_shouldBakeInIfPortraitDepthEffectEnabled;
}

- (void)setShouldBakeInIfPortraitDepthEffectEnabled:(BOOL)a3
{
  self->_shouldBakeInIfPortraitDepthEffectEnabled = a3;
}

- (BOOL)shouldBakeInIfContainsPenultimateResources
{
  return self->_shouldBakeInIfContainsPenultimateResources;
}

- (void)setShouldBakeInIfContainsPenultimateResources:(BOOL)a3
{
  self->_shouldBakeInIfContainsPenultimateResources = a3;
}

- (BOOL)flattenLivePhotoToStillIfNeeded
{
  return self->_flattenLivePhotoToStillIfNeeded;
}

- (void)setFlattenLivePhotoToStillIfNeeded:(BOOL)a3
{
  self->_flattenLivePhotoToStillIfNeeded = a3;
}

+ (id)adjustmentBakeInOptionsForPublishingOriginals
{
  PHAssetCreationAdjustmentBakeInOptions *v2;

  v2 = objc_alloc_init(PHAssetCreationAdjustmentBakeInOptions);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfLivePhotoPlaybackDisabled:](v2, "setShouldBakeInIfLivePhotoPlaybackDisabled:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfLivePhotoMuted:](v2, "setShouldBakeInIfLivePhotoMuted:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfAdjustedByThirdParty:](v2, "setShouldBakeInIfAdjustedByThirdParty:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfCropped:](v2, "setShouldBakeInIfCropped:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfTimelineTrimmed:](v2, "setShouldBakeInIfTimelineTrimmed:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfPortraitDepthEffectEnabled:](v2, "setShouldBakeInIfPortraitDepthEffectEnabled:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setShouldBakeInIfContainsPenultimateResources:](v2, "setShouldBakeInIfContainsPenultimateResources:", 0);
  -[PHAssetCreationAdjustmentBakeInOptions setFlattenLivePhotoToStillIfNeeded:](v2, "setFlattenLivePhotoToStillIfNeeded:", 0);
  return v2;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

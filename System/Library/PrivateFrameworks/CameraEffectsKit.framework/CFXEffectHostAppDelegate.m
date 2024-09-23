@implementation CFXEffectHostAppDelegate

+ (id)sharedInstance
{
  if (sharedInstance_onceToken_5 != -1)
    dispatch_once(&sharedInstance_onceToken_5, &__block_literal_global_33);
  return (id)sharedInstance_s_instance;
}

void __42__CFXEffectHostAppDelegate_sharedInstance__block_invoke()
{
  CFXEffectHostAppDelegate *v0;
  void *v1;

  v0 = objc_alloc_init(CFXEffectHostAppDelegate);
  v1 = (void *)sharedInstance_s_instance;
  sharedInstance_s_instance = (uint64_t)v0;

}

- (id)effectTemplatesDirectoryName
{
  return CFSTR("iOSTemplates.localized");
}

- (id)effectTemplatesBundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "jfxBundle");
}

- (BOOL)wantsExtraLineSpacingForDiacritics
{
  return 0;
}

- (BOOL)wantsDynamicLineSpacingForDiacritics
{
  return 0;
}

- (BOOL)wantsToScaleEmojiToCapHeight
{
  return 0;
}

- (BOOL)wantsToSkipSuggestedLineBreaksInParagraphLayout
{
  return 0;
}

- (BOOL)wantsToUseBinarySearchForScalingToBothMargins
{
  return 1;
}

- (BOOL)wantsToLimitLinesOfText
{
  return 0;
}

- (unsigned)getNumberOfLinesToLimitTextTo
{
  return 0;
}

- (BOOL)wantsToImproveQualityOfDraftQualityText
{
  return 1;
}

- (BOOL)wantsToDownscaleGlyphsToOutputSize
{
  return 0;
}

- (BOOL)wantsToSetTranscriptionsUsingArray
{
  return 1;
}

- (BOOL)wantsToIgnoreTextBoundsOfTransparentObjects
{
  return 1;
}

- (BOOL)wantsToIgnoreTextBoundsOfNewlinesOfTranscriptions
{
  return 1;
}

- (BOOL)wantsToUseCachedTextureForText
{
  return 1;
}

- (BOOL)wantsToIncludeSubstituteFontNameInAttributedString
{
  return 1;
}

- (BOOL)wantsToIncludeTrackingValueInAttributedString
{
  return 1;
}

- (BOOL)wantsToComputeTypographicHeightWithoutLastLineLeading
{
  return 1;
}

- (BOOL)wantsToAdjustTextBoundsHeightUsingCapHeight
{
  return 1;
}

- (BOOL)wantsToCacheTopLevelGroupRender
{
  return 1;
}

- (BOOL)wantsToAssertThatLoadedSceneHasAnimateFlagDisabled
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_EnableAssertionThatLoadedSceneHasAnimateFlagDisabled"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (BOOL)wantsToAssertThatTopLevelGroupSpansEntireScene
{
  void *v2;
  void *v3;
  char v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", CFSTR("JFX_EnableAssertionThatTopLevelGroupSpansEntireScene"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    v4 = objc_msgSend(v3, "BOOLValue");
  else
    v4 = 0;

  return v4;
}

- (unsigned)getMaxGlyphResolution
{
  return 512;
}

- (id)preferredDisplayColorSpace
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  -[CFXEffectHostAppDelegate colorSpaceDelegate](self, "colorSpaceDelegate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v2, "preferredDisplayColorSpace");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = (void *)MEMORY[0x24BE78FF8];
    +[JFXVideoCameraController sharedInstance](JFXVideoCameraController, "sharedInstance");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "jfx_getColorSpaceFromCaptureColorSpace:", objc_msgSend(v5, "cameraColorSpace"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "jfx_recommendedDisplayColorSpaceForColorSpace:", v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)preferredExportColorSpace
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BE78FF8], "rec709GammaColorSpace");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CFXEffectHostAppDelegate colorSpaceDelegate](self, "colorSpaceDelegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "preferredExportColorSpace");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "jfx_recommendedDisplayColorSpaceForColorSpace:", v5);
    v7 = objc_claimAutoreleasedReturnValue();

    v3 = (void *)v7;
  }

  return v3;
}

- (PVHostApplicationDelegate)colorSpaceDelegate
{
  return (PVHostApplicationDelegate *)objc_loadWeakRetained((id *)&self->_colorSpaceDelegate);
}

- (void)setColorSpaceDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_colorSpaceDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_colorSpaceDelegate);
}

@end

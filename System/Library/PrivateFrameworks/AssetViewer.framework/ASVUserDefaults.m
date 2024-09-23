@implementation ASVUserDefaults

+ (int64_t)artificialLoadingDelay
{
  uint64_t v2;
  void *v3;
  int64_t v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ArtificialLoadingDelay"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_1E9F29EF0;
  v4 = objc_msgSend(v3, "longValue");

  return v4;
}

+ (BOOL)wantsAnimationDisabled
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("DisableAnimation"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsStatusBarHidden
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("HideStatusBar"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wants2DOverlayControlsHidden
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("Hide2DOverlayControls"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsObjectPlacedWithoutPlane
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("PlaceObjectWithoutPlane"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)defaultPlanePosition
{
  __CFString *v2;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("DefaultPlanePosition"), CFSTR("com.apple.AssetViewer"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = &stru_1E9F16B58;
  return v2;
}

+ (BOOL)wantsOpenInObjectMode
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("OpenInObjectMode"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsParentToCameraInARAndEnableProbes
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ParentToCameraInARAndEnableProbes"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)checkoutFragment
{
  __CFString *v2;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("CheckoutFragment"), CFSTR("com.apple.AssetViewer"));
  v2 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (!v2)
    v2 = &stru_1E9F16B58;
  return v2;
}

+ (BOOL)allowCheckoutNonSecureHTML
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("CheckoutAllowNonSecureHTML"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsPeopleOcclusionDisabled
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("DisablePeopleOcclusion"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsTrackedRaycastStatus
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ShowTrackedRaycastStatus"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsShowLastPlacementResultTypeStatus
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ShowLastPlacementResultTypeStatus"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsObjectFitToScreen
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("FitObjectToScreen"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (float)objectFitToScreenPercentage
{
  uint64_t v2;
  void *v3;
  float v4;
  float v5;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ObjectFitToScreenPercentage"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_1E9F29F50;
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

+ (BOOL)wantsRayTracedAmbientOcclusionEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableRayTracedAmbientOcclusion"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsDebugActionsButton
{
  void *v2;
  char v3;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableDebugActionsButton"), CFSTR("com.apple.AssetViewer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "BOOLValue");

  return v3;
}

+ (BOOL)wantsTTRButton
{
  void *v2;
  void *v3;
  id v4;
  void *v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableTTRButton"), CFSTR("com.apple.AssetViewer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", IsAppleInternalBuild());
    v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (BOOL)forceDisableRayTracedAmbientOcclusion
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceDisableRayTracedAmbientOcclusion"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsDebugVisualizationEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableDebugVisualization"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsDebugPhysicsEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableDebugPhysics"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsStatisticsShown
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ShowStatistics"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)wantsStatusPillHidden
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("WantsStatusPillHidden"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (double)triggerAffordanceShowDuration
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  double v6;
  double v7;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("TriggerAffordanceShowDuration"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E9F29F08;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  objc_msgSend(v5, "doubleValue");
  v7 = v6;

  return v7;
}

+ (BOOL)triggerAffordanceShouldReshowAfterArReset
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("TriggerAffordanceShouldReshowAfterArReset"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAB0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (BOOL)forceShowAnimationScrubber
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceShowAnimationScrubber"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (id)overrideCameraStateSerializedString
{
  return (id)objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("OverrideCameraState"), CFSTR("com.apple.AssetViewer"));
}

+ (BOOL)forceUseLegacySceneImportPipeline
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceUseLegacySceneImportPipeline"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (BOOL)enableVariantsFeature
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("enableVariantsFeature"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAB0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (BOOL)useEntityLoadFor3DLoading
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("useEntityLoadFor3DLoading"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (BOOL)forceUseOldProcessLoadedEntities
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceUseOldProcessLoadedEntities"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (int)overrideMaxTextureSize
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  int v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ASVOverrideMaxTextureSize"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E9F29EF0;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

+ (BOOL)wantsMeshMemoryEstimateEnabled
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableMeshMemoryEstimate"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (BOOL)wantsDebugSceneUnderstandingEnabled
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("EnableDebugSceneUnderstanding"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceDisableRealWorldOcclusion
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceDisableRealWorldOcclusion"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceDisableRealWorldPhysics
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceDisableRealWorldPhysics"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceUseLegacyHitTestAPI
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceLegacyHitTestAPI"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceUseSceneReconstructionMeshForOrientation
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceUseSceneReconstructionMeshForOrientation"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceDisableShadowMaps
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceDisableShadowMaps"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceDisableArKitVerticalRejection
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceDisableArKitVerticalRejection"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)shouldRevertToOldHapticsBehavior
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  char v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("RevertToOldHapticsBehavior"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = (void *)MEMORY[0x1E0C9AAA0];
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "BOOLValue");
  return v6;
}

+ (float)sceneIBLARIntensity
{
  uint64_t v2;
  void *v3;
  float v4;
  float v5;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("SceneIBLARIntensity"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_1E9F29EF0;
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

+ (int64_t)overridePreferredIblVersionKey
{
  uint64_t v2;
  void *v3;
  int64_t v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("OverridePreferredIblVersionKey"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = &unk_1E9F29EF0;
  v4 = objc_msgSend(v3, "integerValue");

  return v4;
}

+ (BOOL)debugSaveThumbnailImageToDisk
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("DebugSaveThumbnailImageToDisk"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)debug3DPreserveWorldTransform
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("debugPreserveWorldTransform"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAB0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (BOOL)forceDisableExtendedDynamicRangeOutput
{
  uint64_t v2;
  void *v3;
  char v4;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ForceDisableExtendedDynamicRangeOutput"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  if (v2)
    v3 = (void *)v2;
  else
    v3 = (void *)MEMORY[0x1E0C9AAA0];
  v4 = objc_msgSend(v3, "BOOLValue");

  return v4;
}

+ (id)overrideURLForSafariInline
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  id v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("SafariInlinePreviewURL"), CFSTR("com.apple.AssetViewer"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2
    && (objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v2, "stringByTrimmingCharactersInSet:", v3),
        v4 = (void *)objc_claimAutoreleasedReturnValue(),
        v5 = objc_msgSend(v4, "length"),
        v4,
        v3,
        v5))
  {
    v6 = v2;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)inlineFramePreferenceString
{
  return (id)objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("InlineFramePreference"), CFSTR("com.apple.AssetViewer"));
}

+ (int)maxInlinePreviewCount
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  int v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ASVInlineMaxCount"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E9F29F20;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

+ (int)inlinePreviewMemoryReserve
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;
  int v6;

  objc_msgSend(a1, "preferencesValueforKey:domain:", CFSTR("ASVinlinePreviewMemoryReserve"), CFSTR("com.apple.AssetViewer"));
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  v4 = &unk_1E9F29F38;
  if (v2)
    v4 = (void *)v2;
  v5 = v4;

  v6 = objc_msgSend(v5, "intValue");
  return v6;
}

+ (id)preferencesValueforKey:(__CFString *)a3 domain:(__CFString *)a4
{
  CFPreferencesAppSynchronize(a4);
  return (id)(id)CFPreferencesCopyAppValue(a3, a4);
}

+ (void)setPreferencesValueForKey:(__CFString *)a3 value:(__CFString *)a4
{
  CFPreferencesSetAppValue(a3, a4, CFSTR("com.apple.AssetViewer"));
  CFPreferencesAppSynchronize(CFSTR("com.apple.AssetViewer"));
}

+ (void)setPreferencesValue:(id)a3 forKey:(__CFString *)a4
{
  const __CFString *v4;
  const __CFString *v5;

  v4 = (const __CFString *)*MEMORY[0x1E0C9B260];
  v5 = (const __CFString *)*MEMORY[0x1E0C9B230];
  CFPreferencesSetValue(a4, a3, CFSTR("com.apple.AssetViewer"), (CFStringRef)*MEMORY[0x1E0C9B260], (CFStringRef)*MEMORY[0x1E0C9B230]);
  CFPreferencesSynchronize(CFSTR("com.apple.AssetViewer"), v4, v5);
}

+ (id)preferencesValueforKey:(__CFString *)a3
{
  return +[ASVUserDefaults preferencesValueforKey:domain:](ASVUserDefaults, "preferencesValueforKey:domain:", a3, CFSTR("com.apple.AssetViewer"));
}

@end

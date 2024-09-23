@implementation CAMSmartStyleSettingsRenderUtilities

+ (id)compositionForStyle:(id)a3 compositionController:(id)a4 originalAsset:(id)a5 aspectRatio:(double)a6
{
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  _QWORD v22[4];
  id v23;
  double v24;
  uint64_t v25;
  _QWORD v26[4];
  id v27;
  id v28;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (v11)
  {
    v13 = MEMORY[0x1E0C809B0];
    v14 = *MEMORY[0x1E0D71420];
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke;
    v26[3] = &unk_1EA32DDB0;
    v28 = a1;
    v27 = v10;
    objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v14, v26);
    objc_msgSend(v11, "orientationAdjustmentControllerCreatingIfNecessary:", 0);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend(v15, "orientation");
    if (v12 && a6 != 0.0)
    {
      v17 = v16;
      v18 = *MEMORY[0x1E0D71328];
      v22[0] = v13;
      v22[1] = 3221225472;
      v22[2] = __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke_2;
      v22[3] = &unk_1EA32DDD8;
      v24 = a6;
      v23 = v12;
      v25 = v17;
      objc_msgSend(v11, "modifyAdjustmentWithKey:modificationBlock:", v18, v22);

    }
    objc_msgSend(v11, "composition");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = (void *)objc_msgSend(v19, "copy");

    objc_msgSend(v20, "setMediaType:", 1);
  }
  else
  {
    v20 = 0;
  }

  return v20;
}

void __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  id v4;

  v4 = a2;
  objc_msgSend(v4, "setEnabled:", 1);
  objc_msgSend(*(id *)(a1 + 40), "_styleCastForSmartStyle:", objc_msgSend(*(id *)(a1 + 32), "castType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCast:", v3);

  objc_msgSend(*(id *)(a1 + 32), "colorBias");
  objc_msgSend(v4, "setColor:");
  objc_msgSend(*(id *)(a1 + 32), "toneBias");
  objc_msgSend(v4, "setTone:");
  objc_msgSend(*(id *)(a1 + 32), "castIntensity");
  objc_msgSend(v4, "setIntensity:");

}

void __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  uint64_t *v4;
  id v5;
  NSObject *v6;
  double v7;

  v3 = a2;
  v4 = (uint64_t *)(a1 + 40);
  if (*(double *)(a1 + 40) == 1.0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = *(id *)(a1 + 32);
    else
      v5 = 0;
    v7 = fmin((double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelWidth"), (double)(unint64_t)objc_msgSend(*(id *)(a1 + 32), "pixelHeight"));
    if (v5)
      objc_msgSend(v5, "suggestedCropForTargetSize:", v7, v7);
    else
      UIRectCenteredIntegralRect();
    NUOrientationTransformRect();
    objc_msgSend(v3, "setCropRect:");
    objc_msgSend(v3, "setEnabled:", 1);

  }
  else
  {
    v6 = os_log_create("com.apple.camera", "SmartStyleSettings");
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke_2_cold_1(v4, v6);

  }
}

+ (id)_styleCastForSmartStyle:(int64_t)a3
{
  if ((unint64_t)a3 > 5)
    return &stru_1EA3325A0;
  else
    return **((id **)&unk_1EA32DDF8 + a3);
}

void __108__CAMSmartStyleSettingsRenderUtilities_compositionForStyle_compositionController_originalAsset_aspectRatio___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 134217984;
  v4 = v2;
  _os_log_error_impl(&dword_1DB760000, a2, OS_LOG_TYPE_ERROR, "Need to handle aspect ratio %.3f", (uint8_t *)&v3, 0xCu);
}

@end

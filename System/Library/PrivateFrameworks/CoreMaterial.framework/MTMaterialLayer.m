@implementation MTMaterialLayer

- (void)willChangeValueForKey:(id)a3
{
  void *v4;
  void *v5;
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  if ((objc_msgSend(v8, "isEqualToString:", CFSTR("recipeSettings")) & 1) != 0
    || (objc_msgSend(v8, "isEqualToString:", CFSTR("configuration")) & 1) != 0
    || objc_msgSend(v8, "isEqualToString:", CFSTR("weighting")))
  {
    -[MTMaterialLayer valueForKey:](self, "valueForKey:", v8);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    if (v4)
    {
      v6 = v4;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0C99E38], "null");
      v6 = (id)objc_claimAutoreleasedReturnValue();
    }
    v7 = v6;

    -[NSMutableDictionary setObject:forKey:](self->_pendingChange, "setObject:forKey:", v7, v8);
  }

}

- (void)didChangeValueForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v4 = a3;
  if (objc_msgSend(v4, "isEqualToString:", CFSTR("recipe")))
  {
    if (-[MTMaterialLayer _didValueChangeForKey:withPendingChange:](self, "_didValueChangeForKey:withPendingChange:", v4, self->_pendingChange))
    {
      -[MTMaterialLayer recipe](self, "recipe");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      MTMaterialSettingsForRecipeFromBundle(v5, 0);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MTMaterialLayer _setRecipeSettings:](self, "_setRecipeSettings:", v6);

    }
  }
  else if ((objc_msgSend(v4, "isEqualToString:", CFSTR("recipeSettings")) & 1) != 0
         || objc_msgSend(v4, "isEqualToString:", CFSTR("configuration")))
  {
    if (-[MTMaterialLayer _didValueChangeForKey:withPendingChange:](self, "_didValueChangeForKey:withPendingChange:", v4, self->_pendingChange))
    {
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer didChangeValueForKey:].cold.1();
      -[MTMaterialLayer _updateForChangeInRecipeAndConfiguration](self, "_updateForChangeInRecipeAndConfiguration");
      if (!-[MTMaterialLayer _delegateManagesWeighting](self, "_delegateManagesWeighting"))
      {
        -[MTMaterialLayer _recipeSettings](self, "_recipeSettings");
        v7 = (void *)objc_claimAutoreleasedReturnValue();

        if (v7)
          -[MTMaterialLayer setWeighting:](self, "setWeighting:", 1.0);
      }
      if (-[MTMaterialLayer _needsPruning](self, "_needsPruning"))
        -[MTMaterialLayer _pruneAtCompletionOfCurrentTransaction](self, "_pruneAtCompletionOfCurrentTransaction");
    }
  }
  else if (objc_msgSend(v4, "isEqualToString:", CFSTR("weighting"))
         && -[MTMaterialLayer _didValueChangeForKey:withPendingChange:](self, "_didValueChangeForKey:withPendingChange:", v4, self->_pendingChange))
  {
    -[MTMaterialLayer _updateForChangeInWeighting](self, "_updateForChangeInWeighting");
  }
  v8.receiver = self;
  v8.super_class = (Class)MTMaterialLayer;
  -[MTMaterialLayer didChangeValueForKey:](&v8, sel_didChangeValueForKey_, v4);

}

- (BOOL)_didValueChangeForKey:(id)a3 withPendingChange:(id)a4
{
  id v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v6 = a3;
  LOBYTE(v7) = 0;
  if (v6 && a4)
  {
    objc_msgSend(a4, "objectForKey:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E38], "null");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8 == v9)
    {

      v8 = 0;
    }
    -[MTMaterialLayer valueForKey:](self, "valueForKey:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if ((v8 == 0) == (v10 != 0))
      LOBYTE(v7) = 1;
    else
      v7 = objc_msgSend(v8, "isEqual:", v10) ^ 1;

  }
  return v7;
}

- (BOOL)_delegateManagesWeighting
{
  return *(_BYTE *)&self->_materialLayerDelegateFlags & 1;
}

- (BOOL)_needsPruning
{
  void *v2;
  BOOL v3;

  -[MTMaterialSettingsInterpolator initialSettings](self->_settingsInterpolator, "initialSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2 != 0;

  return v3;
}

id __96__MTMaterialLayer__configureBackdropLayer_withSettingsInterpolator_preservingFiltersIfIdentity___block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  const __CFString *v4;
  _QWORD v5[2];

  v5[1] = *MEMORY[0x1E0C80C00];
  v4 = CFSTR("inputQuality");
  objc_msgSend(*(id *)(a1 + 32), "blurInputQuality");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = v1;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v5, &v4, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

+ (NSSet)mt_implicitlyAnimatableKeys
{
  if (mt_implicitlyAnimatableKeys_onceToken != -1)
    dispatch_once(&mt_implicitlyAnimatableKeys_onceToken, &__block_literal_global_149);
  return (NSSet *)(id)mt_implicitlyAnimatableKeys___animatableKeyPaths;
}

- (BOOL)isZoomEnabled
{
  return self->_zoomEnabled;
}

- (BOOL)isBlurEnabled
{
  return self->_blurEnabled;
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (self->_blurEnabled != a3)
  {
    self->_blurEnabled = a3;
    -[MTMaterialLayer _setNeedsConfiguring](self, "_setNeedsConfiguring");
  }
}

- (void)_adjustScaleOfBackdropLayer:(id)a3 ifNecessaryWithSettingsInterpolator:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  double v10;
  double v11;
  id backdropScaleAdjustment;
  id v13;
  uint64_t *v14;
  void *v15;
  float v16;
  float v17;
  double (**defaultBackdropScaleAdjustment)(id);
  void *v19;
  NSObject *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  double (*v26)();
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  double (*v31)(uint64_t);
  void *v32;
  double v33;
  uint8_t buf[4];
  MTMaterialLayer *v35;
  __int16 v36;
  uint64_t v37;
  __int16 v38;
  uint64_t v39;
  uint64_t v40;

  v40 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = MTDynamicBlurRadiusGraphicsQuality();
  if (!self->_blurEnabled)
    goto LABEL_21;
  v9 = v8;
  if (!objc_msgSend(v7, "isBlurEnabled") || self->_reduceTransparencyEnabled)
    goto LABEL_21;
  objc_msgSend(v7, "backdropScale");
  v11 = v10;
  backdropScaleAdjustment = self->_backdropScaleAdjustment;
  if (backdropScaleAdjustment || v9 != 100)
  {
    if (backdropScaleAdjustment)
      goto LABEL_16;
    goto LABEL_10;
  }
  if (v10 > 0.0 && v10 < 1.0)
  {
LABEL_10:
    if (v10 > 0.0 && v10 < 1.0)
    {
      v29 = MEMORY[0x1E0C809B0];
      v30 = 3221225472;
      v31 = __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke;
      v32 = &__block_descriptor_40_e8_d16__0d8l;
      v33 = v10;
      v14 = &v29;
LABEL_15:
      -[MTMaterialLayer setDefaultBackdropScaleAdjustment:](self, "setDefaultBackdropScaleAdjustment:", v14, v24, v25, v26, v27, v28, v29, v30, v31, v32, *(_QWORD *)&v33);
      goto LABEL_16;
    }
    if (v9 != 100)
    {
      v24 = MEMORY[0x1E0C809B0];
      v25 = 3221225472;
      v26 = __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke_2;
      v27 = &__block_descriptor_40_e8_d16__0d8l;
      v28 = v9;
      v14 = &v24;
      goto LABEL_15;
    }
LABEL_16:
    objc_msgSend(MEMORY[0x1E0CB37E8], "mt_identityValueForMaterialSettingsProperty:", CFSTR("backdropScale"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "floatValue");
    v17 = v16;

    defaultBackdropScaleAdjustment = (double (**)(id))self->_backdropScaleAdjustment;
    if (defaultBackdropScaleAdjustment
      || (defaultBackdropScaleAdjustment = (double (**)(id))self->_defaultBackdropScaleAdjustment) != 0)
    {
      objc_msgSend(v7, "weighting");
      v11 = defaultBackdropScaleAdjustment[2](defaultBackdropScaleAdjustment);
    }
    else
    {
      v11 = v17;
    }
    goto LABEL_19;
  }
  v13 = self->_defaultBackdropScaleAdjustment;
  self->_defaultBackdropScaleAdjustment = 0;

LABEL_19:
  -[MTMaterialLayer setScale:](self, "setScale:", v11);
  v19 = (void *)MTLogMaterials;
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
  {
    v20 = v19;
    objc_msgSend(v7, "weighting");
    v22 = v21;
    objc_msgSend(v6, "scale");
    *(_DWORD *)buf = 138543874;
    v35 = self;
    v36 = 2050;
    v37 = v22;
    v38 = 2050;
    v39 = v23;
    _os_log_debug_impl(&dword_1AAB41000, v20, OS_LOG_TYPE_DEBUG, "%{public}@: weighting: %{public}f; backdrop scale: %{public}f",
      buf,
      0x20u);

  }
LABEL_21:

}

- (void)_configureBackdropLayer:(id)a3 withSettingsInterpolator:(id)a4 preservingFiltersIfIdentity:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  MTMaterialSettingsInterpolator *v9;
  MTMaterialSettingsInterpolator *v10;
  double v11;
  double v12;
  void *v13;
  MTMaterialSettingsInterpolator *v14;
  void *v15;
  MTMaterialSettingsInterpolator *v16;
  id v17;
  NSObject *v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  BOOL v26;
  double v27;
  double v28;
  void *v29;
  _BOOL8 v30;
  int v31;
  double v32;
  double v33;
  double v34;
  MTMaterialSettingsInterpolator *v35;
  uint64_t v36;
  NSObject *v37;
  double v38;
  void *v39;
  char v40;
  _QWORD v41[4];
  MTMaterialSettingsInterpolator *v42;
  uint8_t buf[32];
  __int128 v44;
  __int128 v45;
  __int128 v46;
  uint64_t v47;

  v5 = a5;
  v47 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = (MTMaterialSettingsInterpolator *)a4;
  v10 = v9;
  if (v8)
  {
    -[MTMaterialSettingsInterpolator weighting](v9, "weighting");
    v12 = v11;
    if (self->_reduceMotionEnabled
      && (-[MTMaterialSettingsInterpolator initialSettings](v10, "initialSettings"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v13,
          !v13))
    {
      v14 = [MTMaterialSettingsInterpolator alloc];
      -[MTMaterialSettingsInterpolator finalSettings](v10, "finalSettings");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = -[MTMaterialSettingsInterpolator initWithSettings:](v14, "initWithSettings:", v15);

      -[MTMaterialSettingsInterpolator setWeighting:](v16, "setWeighting:", 1.0);
      v40 = 1;
      v10 = v16;
    }
    else
    {
      v40 = 0;
    }
    v17 = objc_alloc_init(MEMORY[0x1E0C99E08]);
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
      -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.9();
    if (self->_blurEnabled && -[MTMaterialSettingsInterpolator isBlurEnabled](v10, "isBlurEnabled"))
    {
      -[MTMaterialLayer _adjustScaleOfBackdropLayer:ifNecessaryWithSettingsInterpolator:](self, "_adjustScaleOfBackdropLayer:ifNecessaryWithSettingsInterpolator:", v8, v10);
      if (self->_reduceTransparencyEnabled)
      {
        objc_msgSend(v17, "setAverageColorEnabled:includingOptimizations:withAdditionalInfoPromise:", 1, 1, 0);
        v18 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
          -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.8((uint64_t)self, v18);
      }
      else
      {
        -[MTMaterialSettingsInterpolator blurRadius](v10, "blurRadius");
        v34 = v33;
        v35 = objc_retainAutorelease(v10);
        v36 = -[MTMaterialSettingsInterpolator variableBlurInputMask](v35, "variableBlurInputMask");
        v41[0] = MEMORY[0x1E0C809B0];
        v41[1] = 3221225472;
        v41[2] = __96__MTMaterialLayer__configureBackdropLayer_withSettingsInterpolator_preservingFiltersIfIdentity___block_invoke;
        v41[3] = &unk_1E5878F30;
        v42 = v35;
        objc_msgSend(v17, "setBlurRadius:inputMaskImage:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v36, 0, 1, v41, v34);
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
          -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.7();

      }
    }
    else
    {
      objc_msgSend(v8, "setScale:", 1.0);
    }
    if (-[MTMaterialSettingsInterpolator isLuminanceEnabled](v10, "isLuminanceEnabled"))
    {
      -[MTMaterialSettingsInterpolator luminanceAmount](v10, "luminanceAmount");
      v20 = v19;
      -[MTMaterialSettingsInterpolator luminanceValues](v10, "luminanceValues");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      if (v21)
        v22 = 0;
      else
        v22 = &__block_literal_global;
      objc_msgSend(v17, "setLuminanceAmount:values:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v21, 0, 1, v22, v20);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.6();

    }
    if (-[MTMaterialSettingsInterpolator isCurvesEnabled](v10, "isCurvesEnabled"))
    {
      -[MTMaterialSettingsInterpolator curvesValues](v10, "curvesValues");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setCurvesInputValues:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", v23, 0, 1, 0);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.5();

    }
    if (-[MTMaterialSettingsInterpolator isSaturationEnabled](v10, "isSaturationEnabled"))
    {
      -[MTMaterialSettingsInterpolator saturation](v10, "saturation");
      objc_msgSend(v17, "setSaturation:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 0, 1, 0);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.4();
    }
    if (-[MTMaterialSettingsInterpolator isBrightnessEnabled](v10, "isBrightnessEnabled"))
    {
      -[MTMaterialSettingsInterpolator brightness](v10, "brightness");
      objc_msgSend(v17, "setBrightness:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 0, 1, 0);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.3();
    }
    if (-[MTMaterialSettingsInterpolator isColorMatrixEnabled](v10, "isColorMatrixEnabled"))
    {
      if (v10)
        -[MTMaterialSettingsInterpolator colorMatrix](v10, "colorMatrix");
      v44 = 0u;
      v45 = 0u;
      v46 = 0u;
      memset(buf, 0, sizeof(buf));
      objc_msgSend(v17, "setColorMatrix:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", buf, 0, 1, 0);
      v24 = (void *)MTLogMaterials;
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
      {
        v44 = 0u;
        v45 = 0u;
        v46 = 0u;
        memset(buf, 0, sizeof(buf));
        v37 = v24;
        MTCAColorMatrixCreateDictionaryRepresentation(buf, v38);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138543618;
        *(_QWORD *)&buf[4] = self;
        *(_WORD *)&buf[12] = 2114;
        *(_QWORD *)&buf[14] = v39;
        _os_log_debug_impl(&dword_1AAB41000, v37, OS_LOG_TYPE_DEBUG, "%{public}@: Updated brightness: %{public}@", buf, 0x16u);

      }
    }
    if (-[MTMaterialSettingsInterpolator isTintEnabled](v10, "isTintEnabled"))
    {
      -[MTMaterialSettingsInterpolator tintColor](v10, "tintColor");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v17, "setTintColor:includingOptimizations:withAdditionalInfoPromise:", v25, 1, 0);
      if (v25 && os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.2();

    }
    v26 = self->_reduceTransparencyEnabled || self->_reduceMotionEnabled;
    if (self->_zoomEnabled && -[MTMaterialSettingsInterpolator isZoomEnabled](v10, "isZoomEnabled"))
    {
      v27 = 0.0;
      if (!v26)
      {
        -[MTMaterialSettingsInterpolator zoom](v10, "zoom");
        v27 = v28;
      }
      objc_msgSend(v17, "setZoom:ignoringIdentity:includingOptimizations:withAdditionalInfoPromise:", 0, 1, 0, v27);
      if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:].cold.1();
    }
    if (-[MTMaterialSettingsInterpolator isBlurAtEnd](v10, "isBlurAtEnd"))
      objc_msgSend(MEMORY[0x1E0CD2708], "mt_orderedFilterTypesBlurAtEnd");
    else
      objc_msgSend(MEMORY[0x1E0CD2708], "mt_orderedFilterTypes");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "sortFiltersWithOrder:", v29);
    v30 = !v5;
    objc_msgSend(v8, "mt_applyMaterialDescription:removingIfIdentity:", v17, v30);
    if ((v40 & 1) != 0
      || (v32 = 1.0, self->_blurEnabled)
      && -[MTMaterialSettingsInterpolator isBlurEnabled](v10, "isBlurEnabled")
      && self->_reduceTransparencyEnabled)
    {
      v31 = 0;
      v32 = v12;
    }
    else
    {
      v31 = 1;
    }
    -[MTMaterialLayer _setPrivateOpacity:removingIfIdentity:](self, "_setPrivateOpacity:removingIfIdentity:", v31 | v30, v32);

  }
}

- (void)layoutSublayers
{
  void *v3;
  uint64_t v4;
  __int128 v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  double v10;
  NSObject *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  objc_super v17;
  uint8_t buf[4];
  MTMaterialLayer *v19;
  __int16 v20;
  void *v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v17.receiver = self;
  v17.super_class = (Class)MTMaterialLayer;
  -[MTMaterialLayer layoutSublayers](&v17, sel_layoutSublayers);
  if (self->_needsConfiguring)
    -[MTMaterialLayer _configureIfNecessaryWithSettingsInterpolator:](self, "_configureIfNecessaryWithSettingsInterpolator:", self->_settingsInterpolator);
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v3 = (void *)-[NSHashTable copy](self->_prunePromises, "copy");
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
  if (v4)
  {
    v6 = v4;
    v7 = *(_QWORD *)v14;
    *(_QWORD *)&v5 = 138543618;
    v12 = v5;
    do
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v3);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(v9, "timeIntervalSincePromise", v12);
        if (v10 < -5.0)
        {
          v11 = MTLogMaterials;
          if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v12;
            v19 = self;
            v20 = 2114;
            v21 = v9;
            _os_log_error_impl(&dword_1AAB41000, v11, OS_LOG_TYPE_ERROR, "%{public}@: Found expired prune promise: %{public}@", buf, 0x16u);
          }
          objc_msgSend(v9, "fulfillPromise");
          -[NSHashTable removeObject:](self->_prunePromises, "removeObject:", v9);
        }
      }
      v6 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v22, 16);
    }
    while (v6);
  }

}

double __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

- (void)setDefaultBackdropScaleAdjustment:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)visualStylingProviderForCategory:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  MTCoreMaterialVisualStylingProvider *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *visualStyleCategoriesToProviders;

  v4 = (__CFString *)a3;
  v5 = v4;
  v6 = 0;
  if (v4)
  {
    if (CFSTR("none") != v4)
    {
      -[NSMutableDictionary objectForKey:](self->_visualStyleCategoriesToProviders, "objectForKey:", v4);
      v6 = (MTCoreMaterialVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        if (!self->_visualStyleCategoriesToProviders)
        {
          v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
          visualStyleCategoriesToProviders = self->_visualStyleCategoriesToProviders;
          self->_visualStyleCategoriesToProviders = v7;

        }
        v6 = objc_alloc_init(MTCoreMaterialVisualStylingProvider);
        -[NSMutableDictionary setObject:forKey:](self->_visualStyleCategoriesToProviders, "setObject:forKey:", v6, v5);
        -[MTMaterialLayer _updateVisualStylingProviders](self, "_updateVisualStylingProviders");
      }
    }
  }

  return v6;
}

- (MTMaterialLayer)init
{
  MTMaterialLayer *v2;
  NSMutableDictionary *v3;
  NSMutableDictionary *pendingChange;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTMaterialLayer;
  v2 = -[MTMaterialLayer init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    pendingChange = v2->_pendingChange;
    v2->_pendingChange = v3;

    -[MTMaterialLayer _reevaluateDefaultShouldCrossfade](v2, "_reevaluateDefaultShouldCrossfade");
    v2->_blurEnabled = 1;
    v2->_zoomEnabled = 1;
    v2->_allowsInPlaceFiltering = 0x7FFFFFFFFFFFFFFFLL;
    -[MTMaterialLayer setAllowsGroupBlending:](v2, "setAllowsGroupBlending:", 0);
    -[MTMaterialLayer _setNeedsConfiguring](v2, "_setNeedsConfiguring");
  }
  return v2;
}

- (void)_setNeedsConfiguring
{
  self->_needsConfiguring = 1;
  -[MTMaterialLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)_reevaluateDefaultShouldCrossfade
{
  self->_shouldCrossfade = MTDynamicBlurRadiusGraphicsQuality() != 100;
}

- (void)_updateForChangeInRecipeAndConfiguration
{
  MTMaterialSettingsInterpolator *v3;
  void *v4;
  MTMaterialSettingsInterpolator *v5;
  MTMaterialSettingsInterpolator *settingsInterpolator;
  MTMaterialSettingsInterpolator *v7;
  void *v8;

  -[NSMutableDictionary removeAllObjects](self->_pendingChange, "removeAllObjects");
  objc_storeStrong((id *)&self->_previousSettingsInterpolator, self->_settingsInterpolator);
  v3 = [MTMaterialSettingsInterpolator alloc];
  -[MTMaterialLayer _recipeSettings](self, "_recipeSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[MTMaterialSettingsInterpolator initWithSettings:](v3, "initWithSettings:", v4);
  settingsInterpolator = self->_settingsInterpolator;
  self->_settingsInterpolator = v5;

  v7 = self->_settingsInterpolator;
  -[MTMaterialSettingsInterpolator finalSettings](self->_previousSettingsInterpolator, "finalSettings");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[MTMaterialSettingsInterpolator setInitialSettings:](v7, "setInitialSettings:", v8);

  if (self->_previousSettingsInterpolator)
    -[MTMaterialLayer setWeighting:](self, "setWeighting:", 0.0);
  else
    -[MTMaterialLayer _configureIfNecessaryWithSettingsInterpolator:](self, "_configureIfNecessaryWithSettingsInterpolator:", self->_settingsInterpolator);
  -[MTMaterialLayer _updateVisualStylingProviders](self, "_updateVisualStylingProviders");
}

- (void)_updateForChangeInWeighting
{
  double v3;
  double v4;
  double v5;
  MTMaterialSettingsInterpolator *settingsInterpolator;
  MTMaterialSettingsInterpolator *v7;
  void *v8;
  MTMaterialSettingsInterpolator *v9;
  MTMaterialSettingsInterpolator *v10;
  double v11;
  double v12;
  NSObject *v13;
  const char *v14;
  double v15;
  double v16;
  double v17;
  _BYTE v18[24];
  double v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  -[NSMutableDictionary removeAllObjects](self->_pendingChange, "removeAllObjects");
  -[MTMaterialLayer weighting](self, "weighting");
  v4 = fmin(v3, 1.0);
  v5 = fmax(v4, 0.0);
  settingsInterpolator = self->_settingsInterpolator;
  if (!settingsInterpolator)
  {
    v7 = [MTMaterialSettingsInterpolator alloc];
    -[MTMaterialLayer _recipeSettings](self, "_recipeSettings");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = -[MTMaterialSettingsInterpolator initWithSettings:](v7, "initWithSettings:", v8);
    v10 = self->_settingsInterpolator;
    self->_settingsInterpolator = v9;

    settingsInterpolator = self->_settingsInterpolator;
  }
  -[MTMaterialSettingsInterpolator setWeighting:](settingsInterpolator, "setWeighting:", v5);
  -[MTMaterialLayer _configureIfNecessaryWithSettingsInterpolator:](self, "_configureIfNecessaryWithSettingsInterpolator:", self->_settingsInterpolator);
  if (!self->_reduceMotionEnabled)
  {
    if (!-[MTMaterialLayer _isDelegateManagingOpacity](self, "_isDelegateManagingOpacity"))
    {
      LODWORD(v11) = 1.0;
      -[MTMaterialLayer setOpacity:](self, "setOpacity:", v11);
    }
    if (self->_shouldCrossfade)
    {
      if (-[MTMaterialLayer _isDelegateManagingInterpolation](self, "_isDelegateManagingInterpolation"))
      {
        if (!-[MTMaterialLayer _isDelegateManagingOpacity](self, "_isDelegateManagingOpacity"))
        {
          HIDWORD(v12) = 1068079513;
          *(float *)&v12 = v5 / 0.05;
          -[MTMaterialLayer setOpacity:](self, "setOpacity:", v12);
          v13 = MTLogMaterials;
          if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v18 = 138543874;
            *(_QWORD *)&v18[4] = self;
            *(_WORD *)&v18[12] = 2050;
            *(double *)&v18[14] = v5;
            *(_WORD *)&v18[22] = 2050;
            v19 = v5 / 0.05;
            v14 = "%{public}@: Performing crossfade with weighting: %{public}f; alpha: %{public}f";
LABEL_20:
            _os_log_debug_impl(&dword_1AAB41000, v13, OS_LOG_TYPE_DEBUG, v14, v18, 0x20u);
          }
        }
      }
      else
      {
        if (v4 <= 0.0)
          v15 = 20.0;
        else
          v15 = 0.0;
        *(float *)&v15 = v15;
        if (v4 <= 0.0)
          v16 = 0.0;
        else
          v16 = 20.0;
        -[MTMaterialLayer setOpacity:](self, "setOpacity:", v15);
        *(float *)&v17 = v16;
        -[MTMaterialLayer setOpacity:](self, "setOpacity:", v17);
        v13 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v18 = 138543874;
          *(_QWORD *)&v18[4] = self;
          *(_WORD *)&v18[12] = 2050;
          *(double *)&v18[14] = v5;
          *(_WORD *)&v18[22] = 2050;
          v19 = v16;
          v14 = "%{public}@: Performing necessary crossfade with weighting: %{public}f; alpha: %{public}f";
          goto LABEL_20;
        }
      }
    }
  }
  -[MTMaterialLayer _updateVisualStylingProviders](self, "_updateVisualStylingProviders", *(_OWORD *)v18, *(_QWORD *)&v18[16], *(_QWORD *)&v19);
}

- (void)_updateVisualStylingProviders
{
  void *v2;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  NSMutableDictionary *obj;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  obj = self->_visualStyleCategoriesToProviders;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v18 != v6)
          objc_enumerationMutation(obj);
        v8 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        -[NSMutableDictionary objectForKey:](self->_visualStyleCategoriesToProviders, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        -[MTMaterialSettingsInterpolator weighting](self->_settingsInterpolator, "weighting");
        v11 = v10;
        if (v10 < 0.5
          && (-[MTMaterialSettingsInterpolator initialSettings](self->_settingsInterpolator, "initialSettings"),
              (v2 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
        {
          -[MTMaterialSettingsInterpolator initialSettings](self->_settingsInterpolator, "initialSettings");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "recipeName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          -[MTMaterialSettingsInterpolator finalSettings](self->_settingsInterpolator, "finalSettings");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "recipeName");
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v11 >= 0.5)
            goto LABEL_11;
        }

LABEL_11:
        MTSharedVisualStyleSetForRecipeAndCategory(v13, v8);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "_setVisualStyleSet:", v15);

      }
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v5);
  }

}

- (void)_configureIfNecessaryWithSettingsInterpolator:(id)a3
{
  void *v4;
  id v5;

  self->_needsConfiguring = 0;
  -[MTMaterialLayer setBackgroundColor:](self, "setBackgroundColor:", 0);
  -[MTMaterialSettingsInterpolator finalSettings](self->_settingsInterpolator, "finalSettings");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[MTMaterialLayer _configureBackdropLayerIfNecessaryWithSettingsInterpolator:](self, "_configureBackdropLayerIfNecessaryWithSettingsInterpolator:", self->_settingsInterpolator);
  }
  else if (!-[MTMaterialLayer _delegateManagesWeighting](self, "_delegateManagesWeighting"))
  {
    +[MTColor pinkColor](MTColor, "pinkColor");
    v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[MTMaterialLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v5, "CGColor"));

  }
  -[MTMaterialLayer setNeedsLayout](self, "setNeedsLayout");
}

- (void)_configureBackdropLayerIfNecessaryWithSettingsInterpolator:(id)a3
{
  id v4;
  _BOOL8 v5;
  id v6;
  double v7;
  uint64_t v8;
  objc_super v9;

  v4 = a3;
  if ((objc_msgSend(v4, "isBackdropRequiredEver") & 1) != 0)
  {
    -[MTMaterialLayer setEnabled:](self, "setEnabled:", !self->_contentReplacedWithSnapshot);
    if ((objc_msgSend(v4, "isWeightingChanging") & 1) != 0)
    {
      v5 = 1;
    }
    else
    {
      objc_msgSend(v4, "weighting");
      v5 = v7 == 0.0;
    }
    -[MTMaterialLayer _configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:](self, "_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:", self, v4, v5);
    if (self->_allowsInPlaceFiltering == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (self->_blurEnabled)
        v8 = objc_msgSend(v4, "isBlurEnabled") ^ 1;
      else
        v8 = 1;
      v9.receiver = self;
      v9.super_class = (Class)MTMaterialLayer;
      -[MTMaterialLayer setAllowsInPlaceFiltering:](&v9, sel_setAllowsInPlaceFiltering_, v8);
    }
  }
  else if ((-[MTMaterialLayer captureOnly](self, "captureOnly") & 1) == 0)
  {
    -[MTMaterialLayer setFilters:](self, "setFilters:", 0);
    -[MTMaterialLayer setEnabled:](self, "setEnabled:", 0);
    objc_msgSend(v4, "tintColor");
    v6 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[MTMaterialLayer setBackgroundColor:](self, "setBackgroundColor:", objc_msgSend(v6, "CGColor"));

  }
}

- (NSString)recipeName
{
  void *v2;
  void *v3;

  -[MTMaterialLayer _recipeSettings](self, "_recipeSettings");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (BOOL)_isDelegateManagingOpacity
{
  MTMaterialLayer *v3;
  void *v4;

  if ((*(_BYTE *)&self->_materialLayerDelegateFlags & 2) == 0)
    return 0;
  v3 = self;
  -[MTMaterialLayer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isManagingOpacityForMaterialLayer:", v3);

  return (char)v3;
}

- (void)setZoomEnabled:(BOOL)a3
{
  self->_zoomEnabled = a3;
  if (a3)
    -[MTMaterialLayer _setNeedsConfiguring](self, "_setNeedsConfiguring");
  else
    -[MTMaterialLayer setZoom:](self, "setZoom:", 0.0);
}

- (void)setReduceTransparencyEnabled:(BOOL)a3
{
  if (self->_reduceTransparencyEnabled != a3)
  {
    self->_reduceTransparencyEnabled = a3;
    -[MTMaterialLayer _setNeedsConfiguring](self, "_setNeedsConfiguring");
  }
}

- (void)setReduceMotionEnabled:(BOOL)a3
{
  if (self->_reduceMotionEnabled != a3)
  {
    self->_reduceMotionEnabled = a3;
    -[MTMaterialLayer _setNeedsConfiguring](self, "_setNeedsConfiguring");
  }
}

- (void)setRecipeName:(id)a3 fromBundle:(id)a4
{
  id v5;

  MTMaterialSettingsForRecipeFromBundle(a3, a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[MTMaterialLayer _setRecipeSettings:](self, "_setRecipeSettings:", v5);

}

- (BOOL)allowsInPlaceFiltering
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTMaterialLayer;
  return -[MTMaterialLayer allowsInPlaceFiltering](&v3, sel_allowsInPlaceFiltering);
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  void *v4;
  id backdropScaleAdjustment;

  if (self->_backdropScaleAdjustment != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    backdropScaleAdjustment = self->_backdropScaleAdjustment;
    self->_backdropScaleAdjustment = v4;

    -[MTMaterialLayer _setNeedsConfiguring](self, "_setNeedsConfiguring");
  }
}

- (void)setUnsafeUnretainedDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMaterialLayer;
  v4 = a3;
  -[MTMaterialLayer setUnsafeUnretainedDelegate:](&v5, sel_setUnsafeUnretainedDelegate_, v4);
  -[MTMaterialLayer _configureDelegateFlagsForDelegate:](self, "_configureDelegateFlagsForDelegate:", v4, v5.receiver, v5.super_class);

}

- (void)_configureDelegateFlagsForDelegate:(id)a3
{
  char v4;
  char v5;
  char v6;
  id v7;

  v7 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v4 = objc_msgSend(v7, "managesWeightingForMaterialLayer:", self);
  else
    v4 = 0;
  *(_BYTE *)&self->_materialLayerDelegateFlags = *(_BYTE *)&self->_materialLayerDelegateFlags & 0xFE | v4;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v5 = 2;
  else
    v5 = 0;
  *(_BYTE *)&self->_materialLayerDelegateFlags = *(_BYTE *)&self->_materialLayerDelegateFlags & 0xFD | v5;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    v6 = 4;
  else
    v6 = 0;
  *(_BYTE *)&self->_materialLayerDelegateFlags = *(_BYTE *)&self->_materialLayerDelegateFlags & 0xFB | v6;

}

- (void)setShouldCrossfade:(BOOL)a3
{
  self->_shouldCrossfade = a3;
}

- (void)setBlurRadiusTransformer:(id)a3
{
  -[MTMaterialSettingsInterpolator setBlurRadiusTransformer:](self->_settingsInterpolator, "setBlurRadiusTransformer:", a3);
}

- (double)_backdropScale
{
  double result;

  -[MTMaterialSettingsInterpolator backdropScale](self->_settingsInterpolator, "backdropScale");
  return result;
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  CGFloat Height;
  IOSurfaceRef v15;
  IOSurfaceRef v16;
  CGFloat v17;
  CGFloat MinY;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  NSObject *v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  CATransform3D v48;
  CATransform3D b;
  CATransform3D a;
  CATransform3D v51;
  _QWORD v52[9];
  _QWORD v53[11];
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;

  v53[9] = *MEMORY[0x1E0C80C00];
  if (self->_contentReplacedWithSnapshot != a3)
  {
    if (a3)
    {
      -[MTMaterialLayer bounds](self, "bounds");
      v5 = v4;
      v7 = v6;
      v9 = v8;
      v11 = v10;
      v12 = MTBuiltInScreenScale();
      v54.origin.x = v5;
      v54.origin.y = v7;
      v54.size.width = v9;
      v54.size.height = v11;
      v13 = v12 * CGRectGetWidth(v54);
      v55.origin.x = v5;
      v55.origin.y = v7;
      v55.size.width = v9;
      v55.size.height = v11;
      Height = CGRectGetHeight(v55);
      v15 = MTIOSurfaceCreate(0, v13, v12 * Height);
      if (v15)
      {
        v16 = v15;
        memset(&v51, 0, sizeof(v51));
        v56.origin.x = v5;
        v56.origin.y = v7;
        v56.size.width = v9;
        v56.size.height = v11;
        v17 = -CGRectGetMinX(v56);
        v57.origin.x = v5;
        v57.origin.y = v7;
        v57.size.width = v9;
        v57.size.height = v11;
        MinY = CGRectGetMinY(v57);
        CATransform3DMakeTranslation(&a, v17, -MinY, 0.0);
        CATransform3DMakeScale(&b, v12, v12, 1.0);
        CATransform3DConcat(&v51, &a, &b);
        v19 = *MEMORY[0x1E0CD30F0];
        v53[0] = *MEMORY[0x1E0CD3110];
        v20 = *MEMORY[0x1E0CD30B0];
        v52[0] = v19;
        v52[1] = v20;
        objc_msgSend(MEMORY[0x1E0CD2728], "mainDisplay");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "name");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = *MEMORY[0x1E0CD30A8];
        v53[1] = v22;
        v53[2] = v16;
        v24 = *MEMORY[0x1E0CD3140];
        v52[2] = v23;
        v52[3] = v24;
        v48 = v51;
        objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCATransform3D:", &v48);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        v26 = *MEMORY[0x1E0CD3130];
        v53[3] = v25;
        v53[4] = MEMORY[0x1E0C9AAB0];
        v27 = *MEMORY[0x1E0CD3138];
        v52[4] = v26;
        v52[5] = v27;
        v53[5] = MEMORY[0x1E0C9AAB0];
        v53[6] = MEMORY[0x1E0C9AAB0];
        v28 = *MEMORY[0x1E0CD3098];
        v52[6] = *MEMORY[0x1E0CD30E0];
        v52[7] = v28;
        v29 = (void *)MEMORY[0x1E0CB37E8];
        -[MTMaterialLayer context](self, "context");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "numberWithUnsignedInt:", objc_msgSend(v30, "contextId"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v53[7] = v31;
        v52[8] = *MEMORY[0x1E0CD30E8];
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", self);
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v53[8] = v32;
        objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 9);
        v33 = (void *)objc_claimAutoreleasedReturnValue();

        if (CARenderServerSnapshot())
        {
          self->_contentReplacedWithSnapshot = 1;
          -[MTMaterialLayer setEnabled:](self, "setEnabled:", 0);
          -[MTMaterialLayer setFilters:](self, "setFilters:", 0);
          -[MTMaterialLayer setContents:](self, "setContents:", v16);
          -[MTMaterialLayer setMasksToBounds:](self, "setMasksToBounds:", 1);
        }
        else
        {
          v41 = MTLogMaterials;
          if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
            -[MTMaterialLayer(Private) setContentReplacedWithSnapshot:].cold.2((uint64_t)self, v41, v42, v43, v44, v45, v46, v47);
        }
        CFRelease(v16);

      }
      else
      {
        v34 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
          -[MTMaterialLayer(Private) setContentReplacedWithSnapshot:].cold.1((uint64_t)self, v34, v35, v36, v37, v38, v39, v40);
      }
    }
    else
    {
      self->_contentReplacedWithSnapshot = 0;
      -[MTMaterialLayer setContents:](self, "setContents:", 0);
      -[MTMaterialLayer setEnabled:](self, "setEnabled:", 1);
      -[MTMaterialLayer setMasksToBounds:](self, "setMasksToBounds:", 0);
      -[MTMaterialLayer _setNeedsConfiguring](self, "_setNeedsConfiguring");
    }
  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_debugIdentifier, 0);
  objc_storeStrong((id *)&self->_prunePromises, 0);
  objc_storeStrong((id *)&self->_visualStyleCategoriesToProviders, 0);
  objc_storeStrong((id *)&self->_pendingChange, 0);
  objc_storeStrong(&self->_defaultBackdropScaleAdjustment, 0);
  objc_storeStrong(&self->_backdropScaleAdjustment, 0);
  objc_storeStrong((id *)&self->_previousSettingsInterpolator, 0);
  objc_storeStrong((id *)&self->_settingsInterpolator, 0);
}

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    MTRegisterCoreMaterialLogging();
}

- (void)addAnimation:(id)a3 forKey:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  void *v19;
  char isKindOfClass;
  id v21;
  void *v22;
  void *v23;
  objc_super v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v6;
  if (!-[MTMaterialLayer _delegateManagesWeighting](self, "_delegateManagesWeighting")
    && objc_msgSend(v7, "isEqualToString:", CFSTR("filters")))
  {

    goto LABEL_25;
  }
  v9 = v8;
  if (-[MTMaterialLayer _delegateManagesWeighting](self, "_delegateManagesWeighting"))
    goto LABEL_23;
  objc_msgSend((id)objc_opt_class(), "mt_implicitlyAnimatableKeys");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "containsObject:", v7);

  v9 = v8;
  if (!v11)
    goto LABEL_23;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  objc_msgSend((id)objc_opt_class(), "mt_animatableKeys");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
  if (!v13)
  {
LABEL_17:
    v19 = v12;
    goto LABEL_21;
  }
  v14 = v13;
  v15 = *(_QWORD *)v26;
LABEL_8:
  v16 = 0;
  while (1)
  {
    if (*(_QWORD *)v26 != v15)
      objc_enumerationMutation(v12);
    v17 = *(_QWORD *)(*((_QWORD *)&v25 + 1) + 8 * v16);
    -[MTMaterialLayer animationForKey:](self, "animationForKey:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
    {

      goto LABEL_15;
    }
    -[MTMaterialLayer animationForKey:](self, "animationForKey:", v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
      break;
LABEL_15:
    if (v14 == ++v16)
    {
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v25, v29, 16);
      if (v14)
        goto LABEL_8;
      goto LABEL_17;
    }
  }

  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();
  if (v8 && (isKindOfClass & 1) != 0)
  {
    v21 = v8;
    v9 = (void *)objc_msgSend(v19, "copy");
    objc_msgSend(v9, "setToValue:", 0);
    objc_msgSend(v9, "setByValue:", 0);
    objc_msgSend(v21, "keyPath");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setKeyPath:", v22);

    objc_msgSend(v21, "fromValue");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setFromValue:", v23);

    goto LABEL_22;
  }
LABEL_21:
  v9 = v8;
LABEL_22:

LABEL_23:
  if (v9)
  {
    v24.receiver = self;
    v24.super_class = (Class)MTMaterialLayer;
    -[MTMaterialLayer addAnimation:forKey:](&v24, sel_addAnimation_forKey_, v9, v7);

  }
LABEL_25:

}

- (void)_pruneAtCompletionOfCurrentTransaction
{
  MTPrunePromise *v3;
  NSHashTable *prunePromises;
  NSHashTable *v5;
  NSHashTable *v6;
  void *v7;
  MTPrunePromise *v8;
  int v9;
  MTPrunePromise *v10;
  NSObject *v11;
  _BOOL4 v12;
  NSObject *v13;
  void *v14;
  _QWORD v15[4];
  MTPrunePromise *v16;
  id v17;
  _QWORD v18[4];
  MTPrunePromise *v19;
  uint8_t buf[4];
  MTMaterialLayer *v21;
  __int16 v22;
  MTPrunePromise *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  v3 = -[MTPrunePromise initWithMaterialLayer:]([MTPrunePromise alloc], "initWithMaterialLayer:", self);
  prunePromises = self->_prunePromises;
  if (!prunePromises)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
    v6 = self->_prunePromises;
    self->_prunePromises = v5;

    prunePromises = self->_prunePromises;
  }
  -[NSHashTable addObject:](prunePromises, "addObject:", v3);
  -[MTMaterialLayer delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke;
    v18[3] = &unk_1E5878F08;
    v8 = v3;
    v19 = v8;
    v17 = 0;
    v9 = objc_msgSend(v7, "addCompletionForCurrentAnimation:forMaterialLayer:reason:", v18, self, &v17);
    v10 = (MTPrunePromise *)v17;
    v11 = MTLogMaterials;
    v12 = os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT);
    if (v9)
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543362;
        v21 = self;
        _os_log_impl(&dword_1AAB41000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate successfully added completion", buf, 0xCu);
      }
    }
    else
    {
      if (v12)
      {
        *(_DWORD *)buf = 138543618;
        v21 = self;
        v22 = 2114;
        v23 = v10;
        _os_log_impl(&dword_1AAB41000, v11, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate didn't add completion (%{public}@) – pruning immediately", buf, 0x16u);
      }
      -[MTPrunePromise fulfillPromise](v8, "fulfillPromise");
    }

  }
  else
  {
    v13 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138543362;
      v21 = self;
      _os_log_impl(&dword_1AAB41000, v13, OS_LOG_TYPE_DEFAULT, "%{public}@: Delegate doesn't handle completions – adding to current transaction", buf, 0xCu);
    }
    v14 = (void *)MEMORY[0x1E0CD28B0];
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke_4;
    v15[3] = &unk_1E5878F08;
    v16 = v3;
    objc_msgSend(v14, "mt_addCompletionBlock:", v15);
    v10 = v16;
  }

}

uint64_t __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fulfillPromise");
}

uint64_t __57__MTMaterialLayer__pruneAtCompletionOfCurrentTransaction__block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fulfillPromise");
}

- (void)prune
{
  NSObject *v3;
  MTMaterialSettingsInterpolator *previousSettingsInterpolator;
  int v5;
  MTMaterialLayer *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  if (-[MTMaterialLayer _needsPruning](self, "_needsPruning"))
  {
    v3 = MTLogMaterials;
    if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 138543362;
      v6 = self;
      _os_log_impl(&dword_1AAB41000, v3, OS_LOG_TYPE_DEFAULT, "%{public}@: Pruning", (uint8_t *)&v5, 0xCu);
    }
    previousSettingsInterpolator = self->_previousSettingsInterpolator;
    self->_previousSettingsInterpolator = 0;

    -[MTMaterialSettingsInterpolator setInitialSettings:](self->_settingsInterpolator, "setInitialSettings:", 0);
    -[MTMaterialSettingsInterpolator finalizeWeighting](self->_settingsInterpolator, "finalizeWeighting");
    -[MTMaterialLayer _configureIfNecessaryWithSettingsInterpolator:](self, "_configureIfNecessaryWithSettingsInterpolator:", self->_settingsInterpolator);
  }
}

- (void)setDelegate:(id)a3
{
  id v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMaterialLayer;
  v4 = a3;
  -[MTMaterialLayer setDelegate:](&v5, sel_setDelegate_, v4);
  -[MTMaterialLayer _configureDelegateFlagsForDelegate:](self, "_configureDelegateFlagsForDelegate:", v4, v5.receiver, v5.super_class);

}

- (BOOL)shouldArchiveValueForKey:(id)a3
{
  id v4;
  void *v5;
  BOOL v6;
  void *v7;
  objc_super v9;

  v4 = a3;
  objc_msgSend((id)objc_opt_class(), "_unserializedAttributeKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v5, "containsObject:", v4) & 1) != 0)
  {
    v6 = 0;
  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "_attributeKeys");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v7, "containsObject:", v4) & 1) != 0)
    {
      v6 = 1;
    }
    else
    {
      v9.receiver = self;
      v9.super_class = (Class)MTMaterialLayer;
      v6 = -[MTMaterialLayer shouldArchiveValueForKey:](&v9, sel_shouldArchiveValueForKey_, v4);
    }

  }
  return v6;
}

- (void)setAllowsInPlaceFiltering:(BOOL)a3
{
  objc_super v3;

  if (self->_allowsInPlaceFiltering != a3)
  {
    self->_allowsInPlaceFiltering = a3;
    v3.receiver = self;
    v3.super_class = (Class)MTMaterialLayer;
    -[MTMaterialLayer setAllowsInPlaceFiltering:](&v3, sel_setAllowsInPlaceFiltering_);
  }
}

id __96__MTMaterialLayer__configureBackdropLayer_withSettingsInterpolator_preservingFiltersIfIdentity___block_invoke_40()
{
  void *v0;
  const __CFString *v2;
  _QWORD v3[2];

  v3[1] = *MEMORY[0x1E0C80C00];
  v0 = (void *)MTDefaultLuminanceColorMap();
  if (v0)
  {
    v2 = CFSTR("inputColorMap");
    v3[0] = v0;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v3, &v2, 1);
    v0 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v0;
}

double __83__MTMaterialLayer__adjustScaleOfBackdropLayer_ifNecessaryWithSettingsInterpolator___block_invoke_2()
{
  return _MTDefaultBackdropScaleAdjustmentForWeighting();
}

+ (id)_attributeKeys
{
  if (_attributeKeys_onceToken != -1)
    dispatch_once(&_attributeKeys_onceToken, &__block_literal_global_46);
  return (id)_attributeKeys___attributeKeys;
}

void __33__MTMaterialLayer__attributeKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("recipe"), CFSTR("configuration"), 0);
  v1 = (void *)_attributeKeys___attributeKeys;
  _attributeKeys___attributeKeys = v0;

}

+ (id)_unserializedAttributeKeys
{
  if (_unserializedAttributeKeys_onceToken != -1)
    dispatch_once(&_unserializedAttributeKeys_onceToken, &__block_literal_global_48);
  return (id)_unserializedAttributeKeys___attributeKeys;
}

void __45__MTMaterialLayer__unserializedAttributeKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("sublayers"), 0);
  v1 = (void *)_unserializedAttributeKeys___attributeKeys;
  _unserializedAttributeKeys___attributeKeys = v0;

}

- (BOOL)_isDelegateManagingInterpolation
{
  MTMaterialLayer *v3;
  void *v4;

  if ((*(_BYTE *)&self->_materialLayerDelegateFlags & 4) == 0)
    return 0;
  v3 = self;
  -[MTMaterialLayer delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = objc_msgSend(v4, "isManagingInterpolationForMaterialLayer:", v3);

  return (char)v3;
}

- (id)_effectiveDebugIdentifier
{
  NSString *debugIdentifier;

  debugIdentifier = self->_debugIdentifier;
  if (debugIdentifier)
    return debugIdentifier;
  -[MTMaterialLayer groupName](self, "groupName");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (id)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[MTMaterialLayer _effectiveDebugIdentifier](self, "_effectiveDebugIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = objc_opt_class();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR(" (%@)"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@%@: %p>"), v6, v7, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@%@: %p>"), v5, &stru_1E5879838, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (BOOL)isReduceTransparencyEnabled
{
  return self->_reduceTransparencyEnabled;
}

- (BOOL)isReduceMotionEnabled
{
  return self->_reduceMotionEnabled;
}

- (NSString)debugIdentifier
{
  return self->_debugIdentifier;
}

- (void)setDebugIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 128);
}

- (id)defaultBackdropScaleAdjustment
{
  return self->_defaultBackdropScaleAdjustment;
}

+ (NSSet)mt_animatableKeys
{
  if (mt_animatableKeys_onceToken != -1)
    dispatch_once(&mt_animatableKeys_onceToken, &__block_literal_global_146);
  return (NSSet *)(id)mt_animatableKeys___animatableKeyPaths;
}

void __45__MTMaterialLayer_Private__mt_animatableKeys__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E60]), "initWithObjects:", CFSTR("recipe"), CFSTR("recipeName"), CFSTR("configuration"), CFSTR("weighting"), 0);
  v1 = (void *)mt_animatableKeys___animatableKeyPaths;
  mt_animatableKeys___animatableKeyPaths = v0;

}

void __55__MTMaterialLayer_Private__mt_implicitlyAnimatableKeys__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  void *v21;

  v18 = objc_alloc(MEMORY[0x1E0C99E60]);
  MTFilterKeyPathForFilter((void *)*MEMORY[0x1E0CD2BF0]);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputColorMatrix"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter(CFSTR("opacityColorMatrix"));
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputColorMatrix"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter(CFSTR("inoperativeColorMatrix"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputColorMatrix"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter((void *)*MEMORY[0x1E0CD2E20]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputAmount"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v0 = (void *)*MEMORY[0x1E0CD2E18];
  MTFilterKeyPathForFilter((void *)*MEMORY[0x1E0CD2E18]);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputAmount"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter(v0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputValues"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter((void *)*MEMORY[0x1E0CD2C88]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputRadius"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter((void *)*MEMORY[0x1E0CD2C00]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputAmount"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  MTFilterKeyPathForFilter((void *)*MEMORY[0x1E0CD2BB8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), CFSTR("inputAmount"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v18, "initWithObjects:", v16, v14, v10, v12, v1, v2, v3, v5, v7, CFSTR("zoom"), 0);
  v9 = (void *)mt_implicitlyAnimatableKeys___animatableKeyPaths;
  mt_implicitlyAnimatableKeys___animatableKeyPaths = v8;

}

- (void)setRecipeName:(id)a3
{
  -[MTMaterialLayer setRecipeName:fromBundle:](self, "setRecipeName:fromBundle:", a3, 0);
}

- (id)backdropScaleAdjustment
{
  return (id)MEMORY[0x1AF42541C](self->_backdropScaleAdjustment, a2);
}

- (id)blurRadiusTransformer
{
  return -[MTMaterialSettingsInterpolator blurRadiusTransformer](self->_settingsInterpolator, "blurRadiusTransformer");
}

- (BOOL)shouldCrossfade
{
  return self->_shouldCrossfade;
}

- (BOOL)isContentReplacedWithSnapshot
{
  return self->_contentReplacedWithSnapshot;
}

- (BOOL)_hasInoperativeAppearance
{
  double v2;

  -[CABackdropLayer mt_colorMatrixDrivenInoperativeOpacity](self, "mt_colorMatrixDrivenInoperativeOpacity");
  return v2 < 1.0;
}

- (void)_setHasInoperativeAppearance:(BOOL)a3 removingIfIdentity:(BOOL)a4
{
  double v4;

  v4 = 0.6;
  if (!a3)
    v4 = 1.0;
  -[CABackdropLayer mt_setColorMatrixDrivenInoperativeOpacity:removingIfIdentity:](self, "mt_setColorMatrixDrivenInoperativeOpacity:removingIfIdentity:", a4, v4);
}

- (void)didChangeValueForKey:.cold.1()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, (uint64_t)v0, "%{public}@: Did change value for key '%{public}@'", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, v1, "%{public}@: Updated zoom: %{public}f", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.2()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, (uint64_t)v0, "%{public}@: Updated color matrix color: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.3()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, v1, "%{public}@: Updated brightness: %{public}f", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.4()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, v1, "%{public}@: Updated saturation: %{public}f", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.5()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, (uint64_t)v0, "%{public}@: Updated curves values: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.6()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, v1, "%{public}@: Updated luminance alpha: %{public}f", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.7()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, v1, "%{public}@: Updated blur radius: %{public}f", v2);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:(uint64_t)a1 withSettingsInterpolator:(NSObject *)a2 preservingFiltersIfIdentity:.cold.8(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138543362;
  v3 = a1;
  _os_log_debug_impl(&dword_1AAB41000, a2, OS_LOG_TYPE_DEBUG, "%{public}@: Reduced transparency enabled, so replacing blur with average color", (uint8_t *)&v2, 0xCu);
  OUTLINED_FUNCTION_3();
}

- (void)_configureBackdropLayer:withSettingsInterpolator:preservingFiltersIfIdentity:.cold.9()
{
  NSObject *v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0(&dword_1AAB41000, v0, (uint64_t)v0, "%{public}@: Updating with settings interpolator: %{public}@", v1);
  OUTLINED_FUNCTION_3();
}

@end

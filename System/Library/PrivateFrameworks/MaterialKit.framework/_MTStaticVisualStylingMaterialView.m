@implementation _MTStaticVisualStylingMaterialView

- (void)setRecipe:(int64_t)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)_MTStaticVisualStylingMaterialView;
  -[MTMaterialView setRecipe:](&v4, sel_setRecipe_, a3);
  -[_MTStaticVisualStylingMaterialView _invalidateContentVisualStyling](self, "_invalidateContentVisualStyling");
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTStaticVisualStylingMaterialView;
  -[MTMaterialView layoutSubviews](&v3, sel_layoutSubviews);
  if (!self->_contentVisualStylingProvider)
    -[_MTStaticVisualStylingMaterialView _updateContentVisualStylingIfNecessary](self, "_updateContentVisualStylingIfNecessary");
}

- (void)didMoveToSuperview
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTStaticVisualStylingMaterialView;
  -[_MTStaticVisualStylingMaterialView didMoveToSuperview](&v3, sel_didMoveToSuperview);
  -[_MTStaticVisualStylingMaterialView _updateContentVisualStylingWithProvider:](self, "_updateContentVisualStylingWithProvider:", self->_contentVisualStylingProvider);
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_MTStaticVisualStylingMaterialView;
  -[_MTStaticVisualStylingMaterialView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[_MTStaticVisualStylingMaterialView _updateContentVisualStylingIfNecessary](self, "_updateContentVisualStylingIfNecessary");
}

- (id)recipeName
{
  return self->_recipeName;
}

- (void)setRecipeName:(id)a3
{
  NSString *v5;
  NSString *recipeName;
  BOOL v7;
  NSString *v8;

  v5 = (NSString *)a3;
  recipeName = self->_recipeName;
  if (recipeName != v5)
  {
    v8 = v5;
    v7 = -[NSString isEqualToString:](recipeName, "isEqualToString:", v5);
    v5 = v8;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_recipeName, a3);
      -[_MTStaticVisualStylingMaterialView _invalidateContentVisualStyling](self, "_invalidateContentVisualStyling");
      v5 = v8;
    }
  }

}

- (BOOL)isBlurEnabled
{
  return 0;
}

- (void)setBlurEnabled:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setBlurEnabled:].cold.1();
}

- (BOOL)isZoomEnabled
{
  return 0;
}

- (void)setZoomEnabled:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setZoomEnabled:].cold.1();
}

- (BOOL)isCaptureOnly
{
  return 0;
}

- (void)setCaptureOnly:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setCaptureOnly:].cold.1();
}

- (id)backdropScaleAdjustment
{
  return 0;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setBackdropScaleAdjustment:].cold.1();
}

- (BOOL)shouldCrossfade
{
  return 0;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setShouldCrossfade:].cold.1();
}

- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustment
{
  return 0;
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:].cold.1();
}

- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary
{
  return 0;
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:].cold.1();
}

- (BOOL)ignoresScreenClip
{
  return 0;
}

- (void)setIgnoresScreenClip:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setIgnoresScreenClip:].cold.1();
}

- (BOOL)isContentReplacedWithSnapshot
{
  return 0;
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_ERROR))
    -[_MTStaticVisualStylingMaterialView setContentReplacedWithSnapshot:].cold.1();
}

- (id)_initWithCoreMaterialRecipe:(id)a3 fromBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12;
  id v13;
  void *v14;
  objc_super v16;

  v12 = a3;
  v16.receiver = self;
  v16.super_class = (Class)_MTStaticVisualStylingMaterialView;
  v13 = -[MTMaterialView _initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:](&v16, sel__initWithCoreMaterialRecipe_fromBundle_options_initialWeighting_scaleAdjustment_, v12, a4, a5, a7, a6);
  v14 = v13;
  if (v13)
    objc_msgSend(v13, "setRecipeName:", v12);

  return v14;
}

- (id)_materialLayer
{
  return 0;
}

- (void)_setCoreMaterialVisualStylingProvider:(id)a3 ForCategory:(id)a4
{
  id v6;
  NSMutableDictionary *visualStyleCategoriesToCoreMaterialProviders;
  NSMutableDictionary *v8;
  NSMutableDictionary *v9;
  id v10;

  v10 = a3;
  v6 = a4;
  if (v10 && v6 && (id)*MEMORY[0x24BE1E3F0] != v6)
  {
    visualStyleCategoriesToCoreMaterialProviders = self->_visualStyleCategoriesToCoreMaterialProviders;
    if (!visualStyleCategoriesToCoreMaterialProviders)
    {
      v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
      v9 = self->_visualStyleCategoriesToCoreMaterialProviders;
      self->_visualStyleCategoriesToCoreMaterialProviders = v8;

      visualStyleCategoriesToCoreMaterialProviders = self->_visualStyleCategoriesToCoreMaterialProviders;
    }
    -[NSMutableDictionary setObject:forKey:](visualStyleCategoriesToCoreMaterialProviders, "setObject:forKey:", v10, v6);
  }

}

- (id)_coreMaterialVisualStylingProviderForCategory:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = v4;
  v6 = 0;
  if (v4)
  {
    if ((id)*MEMORY[0x24BE1E3F0] != v4)
    {
      -[NSMutableDictionary objectForKey:](self->_visualStyleCategoriesToCoreMaterialProviders, "objectForKey:", v4);
      v6 = (id)objc_claimAutoreleasedReturnValue();
      if (!v6)
      {
        v6 = objc_alloc_init(MEMORY[0x24BE1E460]);
        -[_MTStaticVisualStylingMaterialView _setCoreMaterialVisualStylingProvider:ForCategory:](self, "_setCoreMaterialVisualStylingProvider:ForCategory:", v6, v5);
        -[_MTStaticVisualStylingMaterialView _updateCoreMaterialVisualStylingProviders](self, "_updateCoreMaterialVisualStylingProviders");
      }
    }
  }

  return v6;
}

- (NSArray)requiredVisualStyleCategories
{
  return (NSArray *)&unk_24C3E1428;
}

- (void)setVisualStylingProvider:(id)a3 forCategory:(int64_t)a4
{
  void *v6;
  id v7;

  objc_msgSend(a3, "_coreMaterialVisualStylingProvider");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[_MTStaticVisualStylingMaterialView _setCoreMaterialVisualStylingProvider:ForCategory:](self, "_setCoreMaterialVisualStylingProvider:ForCategory:", v7, v6);

}

- (void)_updateCoreMaterialVisualStylingProviders
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSMutableDictionary *obj;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v3 = 528;
  obj = self->_visualStyleCategoriesToCoreMaterialProviders;
  v4 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v20;
    do
    {
      v7 = 0;
      v17 = v5;
      do
      {
        if (*(_QWORD *)v20 != v6)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v19 + 1) + 8 * v7);
        objc_msgSend(*(id *)((char *)&self->super.super.super.super.isa + v3), "objectForKey:", v8, v17);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = -[MTMaterialView recipe](self, "recipe");
        -[_MTStaticVisualStylingMaterialView recipeName](self, "recipeName");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        if (v10)
        {
          if (-[MTMaterialView isRecipeDynamic](self, "isRecipeDynamic"))
          {
            -[_MTStaticVisualStylingMaterialView traitCollection](self, "traitCollection");
            v12 = v6;
            v13 = v3;
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            v15 = objc_msgSend(v14, "userInterfaceStyle");

            v3 = v13;
            v6 = v12;
            v5 = v17;
          }
          else
          {
            v15 = 0;
          }
          MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(v10, v15);
          v16 = objc_claimAutoreleasedReturnValue();

          v11 = (void *)v16;
        }
        if (v11)
          objc_msgSend(v9, "updateVisualStyleSetFromRecipe:andCategory:", v11, v8);

        ++v7;
      }
      while (v5 != v7);
      v5 = -[NSMutableDictionary countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v5);
  }

}

- (void)_invalidateContentVisualStyling
{
  MTCoreMaterialVisualStylingProvider *contentVisualStylingProvider;

  contentVisualStylingProvider = self->_contentVisualStylingProvider;
  self->_contentVisualStylingProvider = 0;

  -[_MTStaticVisualStylingMaterialView setNeedsLayout](self, "setNeedsLayout");
}

- (void)_updateContentVisualStylingIfNecessary
{
  MTCoreMaterialVisualStylingProvider *v3;
  MTCoreMaterialVisualStylingProvider *contentVisualStylingProvider;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  id v13;
  id v14;

  if (!self->_contentVisualStylingProvider)
  {
    v3 = (MTCoreMaterialVisualStylingProvider *)objc_alloc_init(MEMORY[0x24BE1E460]);
    contentVisualStylingProvider = self->_contentVisualStylingProvider;
    self->_contentVisualStylingProvider = v3;

    -[MTCoreMaterialVisualStylingProvider addObserver:](self->_contentVisualStylingProvider, "addObserver:", self);
    objc_msgSend(MEMORY[0x24BDF6950], "whiteColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[_MTStaticVisualStylingMaterialView setBackgroundColor:](self, "setBackgroundColor:", v5);

  }
  v6 = -[MTMaterialView recipe](self, "recipe");
  -[_MTStaticVisualStylingMaterialView recipeName](self, "recipeName");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6)
  {
    v13 = (id)v7;
    if (-[MTMaterialView isRecipeDynamic](self, "isRecipeDynamic"))
    {
      -[_MTStaticVisualStylingMaterialView traitCollection](self, "traitCollection");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "userInterfaceStyle");

    }
    else
    {
      v10 = 0;
    }
    MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(v6, v10);
    v11 = objc_claimAutoreleasedReturnValue();

    v8 = (void *)v11;
  }
  if (v8)
  {
    v14 = v8;
    v12 = -[MTCoreMaterialVisualStylingProvider updateVisualStyleSetGeneratedFromRecipe:](self->_contentVisualStylingProvider, "updateVisualStyleSetGeneratedFromRecipe:", v8);
    v8 = v14;
    if (v12)
    {
      -[_MTStaticVisualStylingMaterialView _updateContentVisualStylingWithProvider:](self, "_updateContentVisualStylingWithProvider:", self->_contentVisualStylingProvider);
      v8 = v14;
    }
  }

}

- (void)_updateContentVisualStylingWithProvider:(id)a3
{
  double v4;
  double v5;
  void *v6;
  id v7;

  objc_msgSend(a3, "visualStylingForStyle:", *MEMORY[0x24BE1E410]);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[_MTStaticVisualStylingMaterialView alpha](self, "alpha");
  v5 = v4;
  -[_MTStaticVisualStylingMaterialView layer](self, "layer");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "mt_replaceAllVisualStylingWithStyling:", v7);

  -[_MTStaticVisualStylingMaterialView setAlpha:](self, "setAlpha:", v5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_contentVisualStylingProvider, 0);
  objc_storeStrong((id *)&self->_visualStyleCategoriesToCoreMaterialProviders, 0);
  objc_storeStrong((id *)&self->_recipeName, 0);
}

- (void)setBlurEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Blur is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setZoomEnabled:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Zoom is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setCaptureOnly:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Capture only is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setBackdropScaleAdjustment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Backdrop scale adjustment is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setShouldCrossfade:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Crossfade is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Alpha/scale transformer is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setIgnoresScreenClip:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Ignores screen clip is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setContentReplacedWithSnapshot:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_0_0(&dword_20AE59000, v0, v1, "%{public}@: Replacing content with snapshot is not supported", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

@end

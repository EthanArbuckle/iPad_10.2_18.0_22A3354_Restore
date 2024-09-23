@implementation MTMaterialView

- (void)_setCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  -[MTMaterialView _setCornerRadius:](&v5, sel__setCornerRadius_);
  -[UIView _setCornerRadius:](self->_highlightView, "_setCornerRadius:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backdropFloatAnimatableProperty, 0);
  objc_storeStrong((id *)&self->_groupNameBase, 0);
  objc_storeStrong((id *)&self->_highlightView, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_recipeBundle, 0);
  objc_storeStrong((id *)&self->_recipeNamesByTraitCollection, 0);
  objc_storeStrong((id *)&self->_cmVisualStyleCategoriesToProviders, 0);
}

- (void)setHighlighted:(BOOL)a3
{
  UIView *highlightView;
  id v5;
  UIView *v6;
  UIView *v7;
  double v8;
  _QWORD v9[5];

  if (self->_highlighted != a3)
  {
    self->_highlighted = a3;
    highlightView = self->_highlightView;
    if (!highlightView)
    {
      v5 = objc_alloc(MEMORY[0x24BDF6F90]);
      -[MTMaterialView bounds](self, "bounds");
      v6 = (UIView *)objc_msgSend(v5, "initWithFrame:");
      v7 = self->_highlightView;
      self->_highlightView = v6;

      -[UIView setUserInteractionEnabled:](self->_highlightView, "setUserInteractionEnabled:", 0);
      -[UIView setAutoresizingMask:](self->_highlightView, "setAutoresizingMask:", 18);
      v9[0] = MEMORY[0x24BDAC760];
      v9[1] = 3221225472;
      v9[2] = __33__MTMaterialView_setHighlighted___block_invoke;
      v9[3] = &unk_24C3DB8E0;
      v9[4] = self;
      objc_msgSend(MEMORY[0x24BDF6F90], "performWithoutAnimation:", v9);
      highlightView = self->_highlightView;
      *(_DWORD *)&a3 = self->_highlighted;
    }
    v8 = 1.0;
    if (!a3)
      v8 = 0.0;
    -[UIView setAlpha:](highlightView, "setAlpha:", v8);
  }
}

- (void)setContentReplacedWithSnapshot:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setContentReplacedWithSnapshot:", v3);

}

double __40__MTMaterialView__setupAlphaTransformer__block_invoke_3(double a1)
{
  double result;

  result = 1.0;
  if (a1 < 0.05)
    return fmin(fmax(a1 / 0.05 + 0.0, 0.0), 1.0);
  return result;
}

- (void)_setContinuousCornerRadius:(double)a3
{
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  -[MTMaterialView _setContinuousCornerRadius:](&v5, sel__setContinuousCornerRadius_);
  -[UIView _setContinuousCornerRadius:](self->_highlightView, "_setContinuousCornerRadius:", a3);
}

- (void)didMoveToWindow
{
  void *v3;
  _BOOL4 needsLayoutOnMoveToWindow;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  -[MTMaterialView didMoveToWindow](&v5, sel_didMoveToWindow);
  -[MTMaterialView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    needsLayoutOnMoveToWindow = self->_needsLayoutOnMoveToWindow;

    if (needsLayoutOnMoveToWindow)
    {
      -[MTMaterialView setNeedsLayout](self, "setNeedsLayout");
      self->_needsLayoutOnMoveToWindow = 0;
    }
  }
}

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  if (self->_reduceTransparencyObserverToken)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "_removeObserver:", self->_reduceTransparencyObserverToken);

    self->_reduceTransparencyObserverToken = 0;
  }
  if (self->_reduceMotionObserverToken)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_removeObserver:", self->_reduceMotionObserverToken);

    self->_reduceMotionObserverToken = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)MTMaterialView;
  -[MTMaterialView dealloc](&v5, sel_dealloc);
}

- (id)_initWithCoreMaterialRecipe:(id)a3 fromBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v13;
  id v14;
  id v15;
  MTMaterialView *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v24;

  v13 = a3;
  v14 = a4;
  v15 = a7;
  v16 = -[MTMaterialView init](self, "init");
  if (v16)
  {
    if (!v13)
    {
      objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "handleFailureInMethod:object:file:lineNumber:description:", a2, v16, CFSTR("MTMaterialView.m"), 763, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cmRecipe"));

    }
    objc_storeStrong((id *)&v16->_recipeBundle, a4);
    -[MTMaterialView setUserInteractionEnabled:](v16, "setUserInteractionEnabled:", 0);
    -[MTMaterialView setBackdropScaleAdjustment:](v16, "setBackdropScaleAdjustment:", v15);
    -[MTMaterialView _materialLayer](v16, "_materialLayer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setReduceTransparencyEnabled:", UIAccessibilityIsReduceTransparencyEnabled());

    -[MTMaterialView _materialLayer](v16, "_materialLayer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setReduceMotionEnabled:", UIAccessibilityIsReduceMotionEnabled());

    -[MTMaterialView _materialLayer](v16, "_materialLayer");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setRecipeName:fromBundle:", v13, v14);

    -[MTMaterialView setBlurEnabled:](v16, "setBlurEnabled:", (a5 & 1) == 0);
    -[MTMaterialView setZoomEnabled:](v16, "setZoomEnabled:", (a5 & 2) == 0);
    -[MTMaterialView setCaptureOnly:](v16, "setCaptureOnly:", (a5 >> 2) & 1);
    -[MTMaterialView setShadowed:](v16, "setShadowed:", (a5 >> 3) & 1);
    -[MTMaterialView setWeighting:](v16, "setWeighting:", a6);
    if (fabs(a6) < 2.22044605e-16)
    {
      -[MTMaterialView _materialLayer](v16, "_materialLayer");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "_setNeedsConfiguring");

      -[MTMaterialView setNeedsLayout](v16, "setNeedsLayout");
      -[MTMaterialView layoutIfNeeded](v16, "layoutIfNeeded");
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_reduceTransparencyObserverToken = objc_msgSend(v21, "_addObserver:selector:name:object:options:", v16, sel__reduceTransparencyStatusDidChange, *MEMORY[0x24BDF7318], 0, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    v16->_reduceMotionObserverToken = objc_msgSend(v22, "_addObserver:selector:name:object:options:", v16, sel__reduceMotionStatusDidChange, *MEMORY[0x24BDF7310], 0, 0);

  }
  return v16;
}

- (void)_updateGroupNameIfNecessary
{
  id v3;

  if (self->_groupNameBase)
  {
    -[MTMaterialView _groupNameWithBase:](self, "_groupNameWithBase:");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setGroupName:](self, "setGroupName:", v3);

  }
}

- (void)setBlurEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBlurEnabled:", v3);

  -[MTMaterialView _updateGroupNameIfNecessary](self, "_updateGroupNameIfNecessary");
}

- (void)setGroupName:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setGroupName:", v4);

  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __31__MTMaterialView_setGroupName___block_invoke;
  v6[3] = &unk_24C3DB908;
  v6[4] = self;
  -[MTMaterialView _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v6);
}

- (id)_groupNameWithBase:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;

  v4 = (objc_class *)MEMORY[0x24BDD16A8];
  v5 = a3;
  v6 = [v4 alloc];
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v6, "initWithFormat:", CFSTR("%@.%@"), v5, v8);

  if (!-[MTMaterialView isBlurEnabled](self, "isBlurEnabled"))
    objc_msgSend(v9, "appendString:", CFSTR(".noBlur"));
  if (!-[MTMaterialView isZoomEnabled](self, "isZoomEnabled"))
    objc_msgSend(v9, "appendString:", CFSTR(".noZoom"));
  if (-[MTMaterialView isShadowed](self, "isShadowed"))
    objc_msgSend(v9, "appendString:", CFSTR(".shadowed"));
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "reducesCaptureBitDepth");

  if (v11)
    objc_msgSend(v9, "appendString:", CFSTR(".reducesCaptureBitDepth"));
  return v9;
}

- (BOOL)isZoomEnabled
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isZoomEnabled");

  return v3;
}

- (BOOL)isShadowed
{
  return self->_shadowed;
}

- (BOOL)isBlurEnabled
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isBlurEnabled");

  return v3;
}

- (void)setBackdropScaleAdjustment:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setBackdropScaleAdjustment:", v4);

}

- (void)setZoomEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setZoomEnabled:", v3);

  -[MTMaterialView _updateGroupNameIfNecessary](self, "_updateGroupNameIfNecessary");
}

- (void)setShadowed:(BOOL)a3
{
  int64_t recipe;
  void *v5;
  uint64_t v6;
  id v7;

  if (self->_shadowed != a3)
  {
    self->_shadowed = a3;
    recipe = self->_recipe;
    if (recipe)
    {
      if (self->_recipeDynamic)
      {
        -[MTMaterialView traitCollection](self, "traitCollection");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        v6 = objc_msgSend(v5, "userInterfaceStyle");

        recipe = self->_recipe;
        *(_DWORD *)&a3 = self->_shadowed;
      }
      else
      {
        v6 = 0;
      }
      MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(recipe, v6, a3);
      v7 = (id)objc_claimAutoreleasedReturnValue();
      -[MTMaterialView setRecipeName:](self, "setRecipeName:", v7);

    }
  }
}

- (void)setCaptureOnly:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCaptureOnly:", v3);

}

- (MTMaterialView)init
{
  MTMaterialView *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)MTMaterialView;
  result = -[MTMaterialView init](&v3, sel_init);
  if (result)
    result->_recipeDynamic = 1;
  return result;
}

- (id)_initWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6 compatibleWithTraitCollection:(id)a7
{
  id v12;
  id v13;
  void *v14;
  _QWORD *v15;

  v12 = a6;
  v13 = a7;
  if (!v13)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(a3, objc_msgSend(v13, "userInterfaceStyle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = -[MTMaterialView _initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:](self, "_initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:", v14, 0, a4, v12, a5);

  if (v15)
    v15[63] = a3;

  return v15;
}

- (id)visualStylingProviderForCategory:(int64_t)a3
{
  void *v4;
  MTVisualStylingProvider *v5;
  NSMutableDictionary *v6;
  NSMutableDictionary *cmVisualStyleCategoriesToProviders;
  void *v8;
  void *v9;
  uint64_t v10;

  MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[NSMutableDictionary objectForKey:](self->_cmVisualStyleCategoriesToProviders, "objectForKey:", v4);
    v5 = (MTVisualStylingProvider *)objc_claimAutoreleasedReturnValue();
    if (!v5)
    {
      if (!self->_cmVisualStyleCategoriesToProviders)
      {
        v6 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
        cmVisualStyleCategoriesToProviders = self->_cmVisualStyleCategoriesToProviders;
        self->_cmVisualStyleCategoriesToProviders = v6;

      }
      -[MTMaterialView _updateRecipeNameIfNeeded](self, "_updateRecipeNameIfNeeded");
      -[MTMaterialView _coreMaterialVisualStylingProviderForCategory:](self, "_coreMaterialVisualStylingProviderForCategory:", v4);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "visualStyleSetName");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "length");

      if (v10)
      {
        v5 = -[MTVisualStylingProvider initWithCoreMaterialVisualStylingProvider:]([MTVisualStylingProvider alloc], "initWithCoreMaterialVisualStylingProvider:", v8);
        -[NSMutableDictionary setObject:forKey:](self->_cmVisualStyleCategoriesToProviders, "setObject:forKey:", v5, v4);
      }
      else
      {
        v5 = 0;
      }

    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)MTMaterialView;
  -[MTMaterialView layoutSubviews](&v4, sel_layoutSubviews);
  -[MTMaterialView _updateRecipeNameIfNeeded](self, "_updateRecipeNameIfNeeded");
  -[MTMaterialView window](self, "window");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v3)
    self->_needsLayoutOnMoveToWindow = 1;
}

- (void)_updateRecipeNameIfNeeded
{
  int64_t recipe;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;

  recipe = self->_recipe;
  if (recipe)
  {
    if (self->_recipeDynamic)
    {
      -[MTMaterialView traitCollection](self, "traitCollection");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      v5 = objc_msgSend(v4, "userInterfaceStyle");

      recipe = self->_recipe;
    }
    else
    {
      v5 = 0;
    }
    MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(recipe, v5, self->_shadowed);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_13;
  }
  else
  {
    if (!self->_recipeNamesByTraitCollection)
    {
      v6 = 0;
      goto LABEL_13;
    }
    -[MTMaterialView _recipeNameForCurrentTraitCollection](self, "_recipeNameForCurrentTraitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v6)
      goto LABEL_13;
  }
  v10 = v6;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "recipeName");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "isEqualToString:", v10);

  if ((v9 & 1) == 0)
    -[MTMaterialView setRecipeName:](self, "setRecipeName:", v10);
  v6 = v10;
LABEL_13:

}

+ (id)_recipeNameForTraitCollection:(id)a3 withRecipeNamesByTraitCollection:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;

  v5 = a4;
  v6 = v5;
  v7 = 0;
  if (a3 && v5)
  {
    v8 = a3;
    objc_msgSend(v6, "allKeys");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (void *)MEMORY[0x24BDF6F30];
    v11 = objc_msgSend(v8, "userInterfaceStyle");

    objc_msgSend(v10, "traitCollectionWithUserInterfaceStyle:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "arrayByAddingObject:", v12);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithTraitsFromCollections:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14)
    {
      objc_msgSend(v6, "objectForKey:", v14);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v7 = 0;
    }

  }
  return v7;
}

- (id)_recipeNameForCurrentTraitCollection
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)objc_opt_class();
  -[MTMaterialView traitCollection](self, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_recipeNameForTraitCollection:withRecipeNamesByTraitCollection:", v4, self->_recipeNamesByTraitCollection);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_coreMaterialVisualStylingProviderForCategory:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualStylingProviderForCategory:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

uint64_t __33__MTMaterialView_setHighlighted___block_invoke_3(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "setAlpha:", *(double *)(a1 + 32));
}

id __33__MTMaterialView_setHighlighted___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v3;
  _QWORD v5[5];

  objc_msgSend(a3, "alpha");
  v5[0] = MEMORY[0x24BDAC760];
  v5[1] = 3221225472;
  v5[2] = __33__MTMaterialView_setHighlighted___block_invoke_3;
  v5[3] = &__block_descriptor_40_e36_v24__0__MTVisualStylingProvider_8_16l;
  v5[4] = v3;
  return (id)MEMORY[0x20BD33610](v5);
}

- (BOOL)_shouldAnimatePropertyWithKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  BOOL v7;
  objc_super v9;

  v4 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "mt_implicitlyAnimatableKeys");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v6, "containsObject:", v4) & 1) != 0)
  {
    v7 = 1;
  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)MTMaterialView;
    v7 = -[MTMaterialView _shouldAnimatePropertyWithKey:](&v9, sel__shouldAnimatePropertyWithKey_, v4);
  }

  return v7;
}

- (void)setWeighting:(double)a3
{
  double v4;
  double v5;
  void *v6;
  void *v7;
  _QWORD v8[5];

  v4 = fmax(fmin(a3, 1.0), 0.0);
  -[MTMaterialView weighting](self, "weighting");
  if (v4 != v5)
  {
    -[MTMaterialView _materialLayer](self, "_materialLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWeighting:", v4);

    -[MTMaterialView _backdropFloatAnimatableProperty](self, "_backdropFloatAnimatableProperty");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setValue:", v4);

    v8[0] = MEMORY[0x24BDAC760];
    v8[1] = 3221225472;
    v8[2] = __31__MTMaterialView_setWeighting___block_invoke;
    v8[3] = &unk_24C3DB908;
    v8[4] = self;
    -[MTMaterialView _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v8);
  }
}

- (double)weighting
{
  void *v2;
  double v3;
  double v4;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "weighting");
  v4 = v3;

  return v4;
}

- (UIViewFloatAnimatableProperty)_backdropFloatAnimatableProperty
{
  return self->_backdropFloatAnimatableProperty;
}

- (void)_notifyObserversWithBlock:(id)a3
{
  void (**v4)(id, _QWORD);
  NSHashTable *observers;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v4 = (void (**)(id, _QWORD))a3;
  if (v4)
  {
    observers = self->_observers;
    if (observers)
    {
      v13 = 0u;
      v14 = 0u;
      v11 = 0u;
      v12 = 0u;
      v6 = observers;
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      if (v7)
      {
        v8 = v7;
        v9 = *(_QWORD *)v12;
        do
        {
          v10 = 0;
          do
          {
            if (*(_QWORD *)v12 != v9)
              objc_enumerationMutation(v6);
            v4[2](v4, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
          }
          while (v8 != v10);
          v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
        }
        while (v8);
      }

    }
  }

}

- (BOOL)isManagingOpacityForMaterialLayer:(id)a3
{
  return self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
}

- (BOOL)managesWeightingForMaterialLayer:(id)a3
{
  return 1;
}

+ (Class)layerClass
{
  return (Class)objc_opt_class();
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:", a3, a4, 1.0);
}

+ (id)materialViewWithRecipe:(int64_t)a3
{
  return (id)objc_msgSend(a1, "materialViewWithRecipe:options:", a3, 0);
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

void __33__MTMaterialView_setHighlighted___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;

  objc_msgSend(*(id *)(a1 + 32), "layer");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "cornerRadius");
  if (v2 > 0.0)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "layer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "cornerRadius");
    objc_msgSend(v3, "setCornerRadius:");
    objc_msgSend(v6, "cornerCurve");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setCornerCurve:", v4);

  }
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456));
  objc_msgSend(*(id *)(a1 + 32), "visualStylingProviderForCategory:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "automaticallyUpdateView:withStyle:andObserverBlock:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 456), 4, &__block_literal_global_4);

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", 0.0);
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5
{
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:compatibleWithTraitCollection:", a3, a4, v9, a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 compatibleWithTraitCollection:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  v11 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRecipe:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", a3, a4, 0, v10, a5);

  return v11;
}

- (void)setGroupNameBase:(id)a3
{
  NSString *v4;
  NSString *groupNameBase;
  id v6;

  v6 = a3;
  if ((objc_msgSend(v6, "isEqualToString:", self->_groupNameBase) & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    groupNameBase = self->_groupNameBase;
    self->_groupNameBase = v4;

    if (self->_groupNameBase)
      -[MTMaterialView _updateGroupNameIfNecessary](self, "_updateGroupNameIfNecessary");
    else
      -[MTMaterialView setGroupName:](self, "setGroupName:", 0);
  }

}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:(BOOL)a3
{
  void *v4;
  id v5;

  if (self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment != a3)
  {
    self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment = a3;
    if (a3)
    {
      -[MTMaterialView _materialLayer](self, "_materialLayer");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "setShouldCrossfade:", 0);

      -[MTMaterialView _setupOrInvalidateAlphaTransformer](self, "_setupOrInvalidateAlphaTransformer");
    }
    else
    {
      -[MTMaterialView _invalidateAlphaTransformer](self, "_invalidateAlphaTransformer");
      -[MTMaterialView _materialLayer](self, "_materialLayer");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "_reevaluateDefaultShouldCrossfade");

    }
  }
}

+ (id)materialViewWithRecipeNamed:(id)a3 inBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  id v12;
  id v13;
  id v14;
  void *v15;

  v12 = a7;
  v13 = a4;
  v14 = a3;
  v15 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:", v14, v13, a5, v12, a6);

  return v15;
}

- (void)_setupOrInvalidateAlphaTransformer
{
  if (self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment)
  {
    if (UIAccessibilityIsReduceMotionEnabled() || UIAccessibilityIsReduceTransparencyEnabled())
      -[MTMaterialView _invalidateAlphaTransformer](self, "_invalidateAlphaTransformer");
    else
      -[MTMaterialView _setupAlphaTransformer](self, "_setupAlphaTransformer");
  }
}

+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7 compatibleWithTraitCollection:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  void *v18;

  v14 = a8;
  v15 = a7;
  v16 = a4;
  v17 = a3;
  v18 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRecipeNamesByTraitCollection:bundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v17, v16, a5, v15, v14, a6);

  return v18;
}

- (id)_initWithRecipeNamesByTraitCollection:(id)a3 bundle:(id)a4 options:(unint64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7 compatibleWithTraitCollection:(id)a8
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  id *v22;
  id *v23;
  void *v25;

  v16 = a3;
  v17 = a4;
  v18 = a7;
  v19 = a8;
  v20 = v19;
  if (v16)
  {
    if (v19)
      goto LABEL_4;
    goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("MTMaterialView.m"), 85, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("recipeNamesByTraitCollection"));

  if (!v20)
  {
LABEL_3:
    objc_msgSend(MEMORY[0x24BDF6F30], "currentTraitCollection");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
LABEL_4:
  objc_msgSend((id)objc_opt_class(), "_recipeNameForTraitCollection:withRecipeNamesByTraitCollection:", v20, v16);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = -[MTMaterialView _initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:](self, "_initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:", v21, v17, a5, v18, a6);
  v23 = v22;
  if (v22)
    objc_storeStrong(v22 + 54, a3);

  return v23;
}

- (void)_setupAlphaTransformer
{
  OUTLINED_FUNCTION_0(&dword_20AE59000, a2, a3, "%{public}@: Instantiating backdrop float animatable property", a5, a6, a7, a8, 2u);
}

+ (void)initialize
{
  id v3;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
    MTRegisterMaterialKitLogging();
}

+ (id)materialViewWithRecipe:(int64_t)a3 compatibleWithTraitCollection:(id)a4
{
  return (id)objc_msgSend(a1, "materialViewWithRecipe:options:compatibleWithTraitCollection:", a3, 0, a4);
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 compatibleWithTraitCollection:(id)a5
{
  return (id)objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:compatibleWithTraitCollection:", a3, a4, a5, 1.0);
}

+ (id)newDefaultHighlightAnimator
{
  id v2;
  id v3;
  void *v4;

  v2 = objc_alloc(MEMORY[0x24BDF6FA8]);
  v3 = objc_alloc_init(MEMORY[0x24BDF69A0]);
  v4 = (void *)objc_msgSend(v2, "initWithDuration:timingParameters:", v3, 0.2);

  return v4;
}

- (NSString)groupName
{
  void *v2;
  void *v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "groupName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

void __31__MTMaterialView_setGroupName___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "groupNameDidChangeForMaterialView:", *(_QWORD *)(a1 + 32));

}

void __31__MTMaterialView_setWeighting___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "weightingDidChangeForMaterialView:", *(_QWORD *)(a1 + 32));

}

- (void)setRecipe:(int64_t)a3
{
  void *v5;
  uint64_t v6;
  id v7;

  if (self->_recipe != a3)
  {
    self->_recipe = a3;
    if (self->_recipeDynamic)
    {
      -[MTMaterialView traitCollection](self, "traitCollection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "userInterfaceStyle");

    }
    else
    {
      v6 = 0;
    }
    MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyleInShadow(a3, v6, self->_shadowed);
    v7 = (id)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView setRecipeName:](self, "setRecipeName:", v7);

  }
}

- (BOOL)isCaptureOnly
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "captureOnly");

  return v3;
}

- (BOOL)hasInoperativeAppearance
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "_hasInoperativeAppearance");

  return v3;
}

- (void)setHasInoperativeAppearance:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "_setHasInoperativeAppearance:removingIfIdentity:", v3, 0);

}

- (NSString)debugIdentifier
{
  void *v2;
  void *v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "debugIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setDebugIdentifier:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDebugIdentifier:", v4);

}

- (void)prune
{
  id v2;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "prune");

}

- (BOOL)isManagingInterpolationForMaterialLayer:(id)a3
{
  int v3;

  v3 = objc_msgSend(MEMORY[0x24BDF6F90], "_isInRetargetableAnimationBlock", a3);
  if (v3)
    LOBYTE(v3) = objc_msgSend(MEMORY[0x24BDF6F90], "areAnimationsEnabled");
  return v3;
}

- (BOOL)addCompletionForCurrentAnimation:(id)a3 forMaterialLayer:(id)a4 reason:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  char v10;
  BOOL v11;
  __CFString *v12;
  _QWORD v14[4];
  id v15;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    if (a5)
    {
      v12 = CFSTR("no argument block");
LABEL_13:
      v11 = 0;
      *a5 = objc_retainAutorelease(v12);
      goto LABEL_15;
    }
LABEL_14:
    v11 = 0;
    goto LABEL_15;
  }
  if (!objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlockWithAnimationsEnabled"))
  {
    if (a5)
    {
      if (objc_msgSend(MEMORY[0x24BDF6F90], "_isInAnimationBlock"))
        v12 = CFSTR("animations disabled");
      else
        v12 = CFSTR("no animation");
      goto LABEL_13;
    }
    goto LABEL_14;
  }
  v9 = (void *)MEMORY[0x24BDF6F90];
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __75__MTMaterialView_addCompletionForCurrentAnimation_forMaterialLayer_reason___block_invoke;
  v14[3] = &unk_24C3DB930;
  v15 = v7;
  v10 = objc_msgSend(v9, "_addCompletion:", v14);
  v11 = v10;
  if (a5 && (v10 & 1) == 0)
    *a5 = CFSTR("failed to add completion");

LABEL_15:
  return v11;
}

uint64_t __75__MTMaterialView_addCompletionForCurrentAnimation_forMaterialLayer_reason___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

double __40__MTMaterialView__setupAlphaTransformer__block_invoke(uint64_t a1)
{
  return *(double *)(a1 + 32);
}

uint64_t __40__MTMaterialView__setupAlphaTransformer__block_invoke_2()
{
  return _MTDefaultBackdropScaleAdjustmentForWeighting();
}

void __40__MTMaterialView__setupAlphaTransformer__block_invoke_48(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v9 = WeakRetained;
    objc_msgSend(WeakRetained, "_backdropFloatAnimatableProperty");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    WeakRetained = v9;
    if (v3)
    {
      objc_msgSend(v9, "_backdropFloatAnimatableProperty");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "value");
      v6 = v5;

      v7 = (*(double (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v6);
      objc_msgSend(v9, "_materialLayer");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "_setPrivateOpacity:removingIfIdentity:", 0, v7);

      WeakRetained = v9;
    }
  }

}

void __40__MTMaterialView__setupAlphaTransformer__block_invoke_2_49(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  NSObject *v12;
  _OWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t buf[4];
  void *v20;
  __int16 v21;
  double v22;
  __int16 v23;
  double v24;
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "_backdropFloatAnimatableProperty");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      objc_msgSend(v3, "_backdropFloatAnimatableProperty");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "presentationValue");
      v7 = v6;

      objc_msgSend(v3, "_backdropFloatAnimatableProperty");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDE5640], "mt_keyPathForColorMatrixDrivenOpacity");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8 && (objc_msgSend(v8, "value"), BSFloatEqualToFloat()))
      {
        objc_msgSend(v3, "stopSettingPresentationValueForKey:", v9);
      }
      else
      {
        v10 = (*(double (**)(double))(*(_QWORD *)(a1 + 32) + 16))(v7);
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v14 = 0u;
        objc_msgSend(MEMORY[0x24BDE5640], "mt_colorMatrixForOpacity:", v10);
        v13[2] = v16;
        v13[3] = v17;
        v13[4] = v18;
        v13[0] = v14;
        v13[1] = v15;
        objc_msgSend(MEMORY[0x24BDD1968], "valueWithBytes:objCType:", v13, "{CAColorMatrix=ffffffffffffffffffff}");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "_setPresentationValue:forKey:", v11, v9);

        v12 = MTLogMaterials;
        if (os_log_type_enabled((os_log_t)MTLogMaterials, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138543874;
          v20 = v3;
          v21 = 2050;
          v22 = v7;
          v23 = 2050;
          v24 = v10;
          _os_log_debug_impl(&dword_20AE59000, v12, OS_LOG_TYPE_DEBUG, "%{public}@: Updating presentation value for progress: %{public}f; alpha: %{public}f",
            buf,
            0x20u);
        }
      }

    }
  }

}

double __40__MTMaterialView__setupAlphaTransformer__block_invoke_53(double a1, double a2, double a3)
{
  if (a3 < 15.0 && a2 == 0.0)
    a2 = a3 / 10.0;
  return a1 * a3 + (1.0 - a1) * a2;
}

- (void)_invalidateAlphaTransformer
{
  OUTLINED_FUNCTION_0(&dword_20AE59000, a2, a3, "%{public}@: Tearing down backdrop float animatable property", a5, a6, a7, a8, 2u);
}

- (void)_setRecipeName:(id)a3 withWeighting:(double)a4
{
  id v6;
  void *v7;
  void *v8;
  _QWORD v9[5];

  v6 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setRecipeName:fromBundle:", v6, self->_recipeBundle);

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setWeighting:", a4);

  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __47__MTMaterialView__setRecipeName_withWeighting___block_invoke;
  v9[3] = &unk_24C3DB908;
  v9[4] = self;
  -[MTMaterialView _notifyObserversWithBlock:](self, "_notifyObserversWithBlock:", v9);
  -[MTMaterialView _updateGroupNameIfNecessary](self, "_updateGroupNameIfNecessary");
}

void __47__MTMaterialView__setRecipeName_withWeighting___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(v3, "recipeNameDidChangeForMaterialView:", *(_QWORD *)(a1 + 32));

}

- (void)_reduceMotionStatusDidChange
{
  _BOOL8 IsReduceMotionEnabled;
  void *v4;
  int v5;
  void *v6;

  IsReduceMotionEnabled = UIAccessibilityIsReduceMotionEnabled();
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReduceMotionEnabled");

  if (IsReduceMotionEnabled != v5)
  {
    -[MTMaterialView _materialLayer](self, "_materialLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReduceMotionEnabled:", IsReduceMotionEnabled);

    -[MTMaterialView _setupOrInvalidateAlphaTransformer](self, "_setupOrInvalidateAlphaTransformer");
  }
}

- (void)_reduceTransparencyStatusDidChange
{
  _BOOL8 IsReduceTransparencyEnabled;
  void *v4;
  int v5;
  void *v6;

  IsReduceTransparencyEnabled = UIAccessibilityIsReduceTransparencyEnabled();
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "isReduceTransparencyEnabled");

  if (IsReduceTransparencyEnabled != v5)
  {
    -[MTMaterialView _materialLayer](self, "_materialLayer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setReduceTransparencyEnabled:", IsReduceTransparencyEnabled);

    -[MTMaterialView _setupOrInvalidateAlphaTransformer](self, "_setupOrInvalidateAlphaTransformer");
  }
}

- (NSString)description
{
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;

  -[MTMaterialView debugIdentifier](self, "debugIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (void *)MEMORY[0x24BDD17C8];
  v5 = objc_opt_class();
  v6 = v5;
  if (v3)
  {
    objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR(" (%@)"), v3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@%@: %p>"), v6, v7, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v4, "stringWithFormat:", CFSTR("<%@%@: %p>"), v5, &stru_24C3DC860, self);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return (NSString *)v8;
}

- (NSString)groupNameBase
{
  return self->_groupNameBase;
}

- (int64_t)recipe
{
  return self->_recipe;
}

- (void)setBackdropFloatAnimatableProperty:(id)a3
{
  objc_storeStrong((id *)&self->_backdropFloatAnimatableProperty, a3);
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  void *v10;
  id v11;
  void *v12;
  void *v13;

  v10 = (void *)MEMORY[0x24BDF6F30];
  v11 = a6;
  objc_msgSend(v10, "currentTraitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", a3, a4, v11, v12, a5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

+ (id)materialViewWithRecipe:(int64_t)a3 options:(unint64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6 compatibleWithTraitCollection:(id)a7
{
  id v12;
  id v13;
  void *v14;

  v12 = a7;
  v13 = a6;
  v14 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRecipe:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", a3, a4, v13, v12, a5);

  return v14;
}

+ (id)materialViewWithRecipeNamed:(id)a3
{
  return (id)objc_msgSend(a1, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", a3, 0, 0, 0, 1.0);
}

+ (id)materialViewWithVisualStyleFromRecipe:(int64_t)a3 category:(int64_t)a4 style:(int64_t)a5 options:(unint64_t)a6 initialWeighting:(double)a7 compatibleWithTraitCollection:(id)a8
{
  id v14;
  void *v15;
  void *v16;
  id v17;
  id v18;
  void (**v19)(_QWORD, _QWORD);
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v28[4];
  id v29;
  id v30;
  int64_t v31;

  v14 = a8;
  MTCoreMaterialVisualStyleCategoryForVisualStyleCategory(a4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  MTCoreMaterialVisualStyleForVisualStyle(a5);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = __135__MTMaterialView_Private__materialViewWithVisualStyleFromRecipe_category_style_options_initialWeighting_compatibleWithTraitCollection___block_invoke;
  v28[3] = &unk_24C3DBA20;
  v31 = a3;
  v17 = v15;
  v29 = v17;
  v18 = v16;
  v30 = v18;
  v19 = (void (**)(_QWORD, _QWORD))MEMORY[0x20BD33610](v28);
  v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithCapacity:", 3);
  v19[2](v19, 1);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  if (v21)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, v22);

    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v21, v23);

  }
  v19[2](v19, 2);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  if (v24)
  {
    objc_msgSend(MEMORY[0x24BDF6F30], "traitCollectionWithUserInterfaceStyle:", 2);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setObject:forKey:", v24, v25);

  }
  v26 = (void *)objc_msgSend(objc_alloc((Class)a1), "_initWithRecipeNamesByTraitCollection:bundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v20, 0, a6, 0, v14, a7);

  return v26;
}

id __135__MTMaterialView_Private__materialViewWithVisualStyleFromRecipe_category_style_options_initialWeighting_compatibleWithTraitCollection___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v2;
  void *v3;

  MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(*(_QWORD *)(a1 + 48), a2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  MTCoreMaterialRecipeForVisualStyleFromRecipeFromBundle();
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (NSString)recipeName
{
  void *v2;
  void *v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "recipeName");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setRecipeName:(id)a3
{
  -[MTMaterialView _setRecipeName:withWeighting:](self, "_setRecipeName:withWeighting:", a3, 1.0);
}

- (void)setRecipeName:(id)a3 fromBundle:(id)a4
{
  NSBundle *v6;
  NSBundle *recipeBundle;
  id v8;

  v6 = (NSBundle *)a4;
  if (a3 && v6)
    self->_recipe = 0;
  recipeBundle = self->_recipeBundle;
  self->_recipeBundle = v6;
  v8 = a3;

  -[MTMaterialView _setRecipeName:withWeighting:](self, "_setRecipeName:withWeighting:", v8, 1.0);
}

- (BOOL)isInPlaceFilteringEnabled
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "allowsInPlaceFiltering");

  return v3;
}

- (void)setInPlaceFilteringEnabled:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setAllowsInPlaceFiltering:", v3);

}

- (id)backdropScaleAdjustment
{
  void *v2;
  void *v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "backdropScaleAdjustment");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)shouldCrossfade
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "shouldCrossfade");

  return v3;
}

- (void)setShouldCrossfade:(BOOL)a3
{
  _BOOL8 v3;
  id v5;

  v3 = a3;
  if (-[MTMaterialView shouldCrossfade](self, "shouldCrossfade") != a3)
  {
    if (v3)
      -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](self, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", 0);
    -[MTMaterialView _materialLayer](self, "_materialLayer");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setShouldCrossfade:", v3);

  }
}

- (BOOL)useBuiltInAlphaTransformerAndBackdropScaleAdjustment
{
  return self->_useBuiltInAlphaTransformerAndBackdropScaleAdjustment;
}

- (void)setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if (!a3 || MTDynamicBlurRadiusGraphicsQuality() != 100)
    -[MTMaterialView setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:](self, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", v3);
}

- (BOOL)isRecipeDynamic
{
  return self->_recipeDynamic;
}

- (void)setRecipeDynamic:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_recipeDynamic != a3)
  {
    self->_recipeDynamic = a3;
    -[MTMaterialView setNeedsLayout](self, "setNeedsLayout");
    v4[0] = MEMORY[0x24BDAC760];
    v4[1] = 3221225472;
    v4[2] = __44__MTMaterialView_Private__setRecipeDynamic___block_invoke;
    v4[3] = &unk_24C3DB8E0;
    v4[4] = self;
    objc_msgSend(MEMORY[0x24BDF6F90], "animateWithDuration:animations:", v4, 1.0);
  }
}

uint64_t __44__MTMaterialView_Private__setRecipeDynamic___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (BOOL)ignoresScreenClip
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "ignoresScreenClip");

  return v3;
}

- (void)setIgnoresScreenClip:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setIgnoresScreenClip:", v3);

}

- (unint64_t)_options
{
  unint64_t v3;

  v3 = -[MTMaterialView isBlurEnabled](self, "isBlurEnabled") ^ 1;
  if (!-[MTMaterialView isZoomEnabled](self, "isZoomEnabled"))
    v3 |= 2uLL;
  if (-[MTMaterialView isCaptureOnly](self, "isCaptureOnly"))
    v3 |= 4uLL;
  if (-[MTMaterialView isShadowed](self, "isShadowed"))
    return v3 | 8;
  else
    return v3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  void *v3;
  id v5;
  NSDictionary *recipeNamesByTraitCollection;
  NSBundle *recipeBundle;
  unint64_t v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  uint64_t v13;
  int64_t recipe;
  id v15;
  int64_t v16;
  unint64_t v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v23;
  NSBundle *v24;
  unint64_t v25;
  double v26;
  double v27;
  void *v28;

  if (self->_recipeNamesByTraitCollection)
  {
    v5 = objc_alloc((Class)objc_opt_class());
    recipeNamesByTraitCollection = self->_recipeNamesByTraitCollection;
    recipeBundle = self->_recipeBundle;
    v8 = -[MTMaterialView _options](self, "_options");
    -[MTMaterialView weighting](self, "weighting");
    v10 = v9;
    -[MTMaterialView backdropScaleAdjustment](self, "backdropScaleAdjustment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v5, "_initWithRecipeNamesByTraitCollection:bundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", recipeNamesByTraitCollection, recipeBundle, v8, v11, v12, v10);
LABEL_5:
    v20 = (void *)v13;
    goto LABEL_6;
  }
  recipe = self->_recipe;
  v15 = objc_alloc((Class)objc_opt_class());
  if (recipe)
  {
    v16 = self->_recipe;
    v17 = -[MTMaterialView _options](self, "_options");
    -[MTMaterialView weighting](self, "weighting");
    v19 = v18;
    -[MTMaterialView backdropScaleAdjustment](self, "backdropScaleAdjustment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTMaterialView traitCollection](self, "traitCollection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v15, "_initWithRecipe:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v16, v17, v11, v12, v19);
    goto LABEL_5;
  }
  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "recipe");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = v12;
  if (!v12)
  {
    -[MTMaterialView _materialLayer](self, "_materialLayer");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "recipeName");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v24 = self->_recipeBundle;
  v25 = -[MTMaterialView _options](self, "_options");
  -[MTMaterialView weighting](self, "weighting");
  v27 = v26;
  -[MTMaterialView backdropScaleAdjustment](self, "backdropScaleAdjustment");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = (void *)objc_msgSend(v15, "_initWithCoreMaterialRecipe:fromBundle:options:initialWeighting:scaleAdjustment:", v23, v24, v25, v28, v27);

  if (!v12)
  {

  }
LABEL_6:

  -[MTMaterialView groupNameBase](self, "groupNameBase");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setGroupNameBase:", v21);

  objc_msgSend(v20, "setShouldCrossfade:", -[MTMaterialView shouldCrossfade](self, "shouldCrossfade"));
  objc_msgSend(v20, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustment:", -[MTMaterialView useBuiltInAlphaTransformerAndBackdropScaleAdjustment](self, "useBuiltInAlphaTransformerAndBackdropScaleAdjustment"));
  objc_msgSend(v20, "setUseBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary:", -[MTMaterialView useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary](self, "useBuiltInAlphaTransformerAndBackdropScaleAdjustmentIfNecessary"));
  objc_msgSend(v20, "setRecipeDynamic:", -[MTMaterialView isRecipeDynamic](self, "isRecipeDynamic"));
  objc_msgSend(v20, "setIgnoresScreenClip:", -[MTMaterialView ignoresScreenClip](self, "ignoresScreenClip"));
  return v20;
}

- (id)newShadowView
{
  return -[MTMaterialView newShadowViewWithCaptureOnlyMaterialView:](self, "newShadowViewWithCaptureOnlyMaterialView:", 1);
}

- (id)newShadowViewWithCaptureOnlyMaterialView:(BOOL)a3
{
  _BOOL4 v3;
  MTMaterialShadowView *v4;

  v3 = a3;
  v4 = -[MTMaterialShadowView initWithMaterialView:]([MTMaterialShadowView alloc], "initWithMaterialView:", self);
  -[MTMaterialShadowView setCaptureOnlyMaterialViewSuppliedByClient:](v4, "setCaptureOnlyMaterialViewSuppliedByClient:", !v3);
  return v4;
}

- (BOOL)isContentReplacedWithSnapshot
{
  void *v2;
  char v3;

  -[MTMaterialView _materialLayer](self, "_materialLayer");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isContentReplacedWithSnapshot");

  return v3;
}

- (void)_addObserver:(id)a3
{
  id v4;
  NSHashTable *observers;
  NSHashTable *v6;
  NSHashTable *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    observers = self->_observers;
    v8 = v4;
    if (!observers)
    {
      objc_msgSend(MEMORY[0x24BDD15C0], "weakObjectsHashTable");
      v6 = (NSHashTable *)objc_claimAutoreleasedReturnValue();
      v7 = self->_observers;
      self->_observers = v6;

      observers = self->_observers;
    }
    -[NSHashTable addObject:](observers, "addObject:", v8);
    v4 = v8;
  }

}

- (void)_removeObserver:(id)a3
{
  NSHashTable *observers;

  if (a3)
  {
    observers = self->_observers;
    if (observers)
      -[NSHashTable removeObject:](observers, "removeObject:");
  }
}

+ (id)staticMaterialViewWithRecipe:(int64_t)a3
{
  void *v4;
  void *v5;

  MTCoreMaterialRecipeForMaterialRecipeAndUserInterfaceStyle(a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && objc_msgSend(MEMORY[0x24BE1E460], "canGenerateVisualStyleSetFromRecipe:", v4))
  {
    +[MTMaterialView materialViewWithRecipe:](_MTStaticVisualStylingMaterialView, "materialViewWithRecipe:", a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

+ (BOOL)_isWorkaroundRequiredForRecipe:(int64_t)a3
{
  return a3 == 4 || a3 == 8;
}

+ (id)_deprecatedControlCenterMaterialWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void (*v16)(void);
  void *v18;
  _QWORD v19[5];

  v11 = a6;
  if ((objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:", a3) & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("MTMaterialView.m"), 832, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("[self _isWorkaroundRequiredForRecipe:recipe]"));

  }
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __120__MTMaterialView_DEPRECATED___deprecatedControlCenterMaterialWithRecipe_configuration_initialWeighting_scaleAdjustment___block_invoke;
  v19[3] = &__block_descriptor_40_e44____MTStaticVisualStylingMaterialView_16__0q8l;
  v19[4] = a3;
  v12 = MEMORY[0x20BD33610](v19);
  v13 = (void *)v12;
  switch(a4)
  {
    case 0:
    case 2:
      goto LABEL_7;
    case 1:
      if (a3 == 4)
        a3 = 20;
      else
        a3 = 21;
LABEL_7:
      objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:scaleAdjustment:", a3, 0, v11, a5);
      v14 = objc_claimAutoreleasedReturnValue();
      goto LABEL_12;
    case 3:
      v16 = *(void (**)(void))(v12 + 16);
      goto LABEL_11;
    case 4:
      v16 = *(void (**)(void))(v12 + 16);
LABEL_11:
      v16();
      v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
      v15 = (void *)v14;
      break;
    default:
      v15 = 0;
      break;
  }

  return v15;
}

id __120__MTMaterialView_DEPRECATED___deprecatedControlCenterMaterialWithRecipe_configuration_initialWeighting_scaleAdjustment___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  +[MTVisualStylingProvider _visualStylingProviderForRecipe:andCategory:](MTVisualStylingProvider, "_visualStylingProviderForRecipe:andCategory:", *(_QWORD *)(a1 + 32), 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MTCoreMaterialVisualStyleForVisualStyle(a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_coreMaterialVisualStylingProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "visualStyleSetName");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  MTCoreMaterialRecipeForVisualStyleFromStyleWithName();
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  +[MTMaterialView materialViewWithRecipeNamed:](_MTStaticVisualStylingMaterialView, "materialViewWithRecipeNamed:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[MTVisualStylingProvider _visualStylingProviderForRecipe:andCategory:](MTVisualStylingProvider, "_visualStylingProviderForRecipe:andCategory:", 4, 1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVisualStylingProvider:forCategory:", v9, 1);

  +[MTVisualStylingProvider _visualStylingProviderForRecipe:andCategory:](MTVisualStylingProvider, "_visualStylingProviderForRecipe:andCategory:", 4, 2);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setVisualStylingProvider:forCategory:", v10, 2);

  return v8;
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4
{
  if ((objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:") & 1) != 0)
    objc_msgSend(a1, "_deprecatedControlCenterMaterialWithRecipe:configuration:initialWeighting:scaleAdjustment:", a3, a4, 0, 1.0);
  else
    objc_msgSend(a1, "materialViewWithRecipe:", a3);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5
{
  if ((objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:") & 1) != 0)
    objc_msgSend(a1, "_deprecatedControlCenterMaterialWithRecipe:configuration:initialWeighting:scaleAdjustment:", a3, a4, 0, a5);
  else
    objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:", a3, 0, a5);
  return (id)objc_claimAutoreleasedReturnValue();
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 compatibleWithTraitCollection:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  if ((objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:", a3) & 1) != 0)
    objc_msgSend(a1, "_deprecatedControlCenterMaterialWithRecipe:configuration:initialWeighting:scaleAdjustment:", a3, a4, 0, a5);
  else
    objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:compatibleWithTraitCollection:", a3, 0, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)materialViewWithRecipe:(int64_t)a3 configuration:(int64_t)a4 initialWeighting:(double)a5 scaleAdjustment:(id)a6
{
  id v10;
  void *v11;

  v10 = a6;
  if ((objc_msgSend(a1, "_isWorkaroundRequiredForRecipe:", a3) & 1) != 0)
    objc_msgSend(a1, "_deprecatedControlCenterMaterialWithRecipe:configuration:initialWeighting:scaleAdjustment:", a3, a4, v10, a5);
  else
    objc_msgSend(a1, "materialViewWithRecipe:options:initialWeighting:scaleAdjustment:", a3, 0, v10, a5);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)materialViewWithRecipeNamed:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  return (id)objc_msgSend(a1, "materialViewWithRecipeNamed:inBundle:options:initialWeighting:scaleAdjustment:", a3, a4, 0, a7, a6);
}

+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 compatibleWithTraitCollection:(id)a4 bundle:(id)a5 configuration:(int64_t)a6 initialWeighting:(double)a7 scaleAdjustment:(id)a8
{
  return (id)objc_msgSend(a1, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", a3, a5, 0, a8, a4, a7);
}

+ (id)materialViewWithRecipeNamesByTraitCollection:(id)a3 inBundle:(id)a4 configuration:(int64_t)a5 initialWeighting:(double)a6 scaleAdjustment:(id)a7
{
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  void *v16;

  v11 = (void *)MEMORY[0x24BDF6F30];
  v12 = a7;
  v13 = a4;
  v14 = a3;
  objc_msgSend(v11, "currentTraitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "materialViewWithRecipeNamesByTraitCollection:inBundle:options:initialWeighting:scaleAdjustment:compatibleWithTraitCollection:", v14, v13, 0, v12, v15, a6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  return v16;
}

@end

@implementation MRUSlider

- (MRUSlider)initWithStyle:(unint64_t)a3
{
  MRUSlider *v4;
  uint64_t v5;
  NSHashTable *observers;
  double v7;
  double v8;
  _BOOL4 v9;
  uint64_t v10;
  uint64_t v11;
  _UISliderFluidConfiguration *v12;
  _UISliderFluidConfiguration *configuration;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)MRUSlider;
  v4 = -[MRUSlider init](&v15, sel_init);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v4->_observers;
    v4->_observers = (NSHashTable *)v5;

    LODWORD(v7) = 0;
    -[MRUSlider setMinimumValue:](v4, "setMinimumValue:", v7);
    LODWORD(v8) = 1.0;
    -[MRUSlider setMaximumValue:](v4, "setMaximumValue:", v8);
    v4->_minimumTrackVisible = 1;
    v9 = +[MRUFeatureFlagProvider isNewVolumeControlsMediaControlsEnabled](MRUFeatureFlagProvider, "isNewVolumeControlsMediaControlsEnabled");
    if (a3)
      v10 = 111;
    else
      v10 = 110;
    if (v9)
      v11 = v10;
    else
      v11 = 110;
    -[MRUSlider _setSliderStyle:](v4, "_setSliderStyle:", v11);
    v12 = (_UISliderFluidConfiguration *)objc_alloc_init(MEMORY[0x1E0DC4348]);
    configuration = v4->_configuration;
    v4->_configuration = v12;

    -[_UISliderFluidConfiguration setDelegate:](v4->_configuration, "setDelegate:", v4);
    -[MRUSlider _setSliderConfiguration:](v4, "_setSliderConfiguration:", v4->_configuration);
  }
  return v4;
}

- (MRUSlider)init
{
  return -[MRUSlider initWithStyle:](self, "initWithStyle:", 0);
}

- (CGRect)trackRectForBounds:(CGRect)a3
{
  CGFloat height;
  double v4;
  double v5;
  double v6;
  double v7;
  objc_super v8;
  CGRect result;

  height = a3.size.height;
  v8.receiver = self;
  v8.super_class = (Class)MRUSlider;
  -[MRUSlider trackRectForBounds:](&v8, sel_trackRectForBounds_, a3.origin.x, a3.origin.y, a3.size.width);
  v6 = 0.0;
  v7 = height;
  result.size.height = v7;
  result.size.width = v5;
  result.origin.y = v6;
  result.origin.x = v4;
  return result;
}

- (void)setStylingProvider:(id)a3
{
  MRUVisualStylingProvider *v5;
  MRUVisualStylingProvider *stylingProvider;
  MRUVisualStylingProvider *v7;

  v5 = (MRUVisualStylingProvider *)a3;
  stylingProvider = self->_stylingProvider;
  if (stylingProvider != v5)
  {
    v7 = v5;
    -[MRUVisualStylingProvider removeObserver:](stylingProvider, "removeObserver:", self);
    objc_storeStrong((id *)&self->_stylingProvider, a3);
    -[MRUVisualStylingProvider addObserver:](self->_stylingProvider, "addObserver:", self);
    -[MRUSlider updateVisualStyling](self, "updateVisualStyling");
    v5 = v7;
  }

}

- (double)expansionFactor
{
  void *v2;
  double v3;
  double v4;

  -[MRUSlider configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "expansionFactor");
  v4 = v3;

  return v4;
}

- (void)setExpansionFactor:(double)a3
{
  id v5;

  -[MRUSlider configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setExpansionFactor:", a3);
  -[MRUSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", v5);

}

- (double)stretchLimit
{
  void *v2;
  double v3;
  double v4;

  -[MRUSlider configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stretchLimit");
  v4 = v3;

  return v4;
}

- (void)setStretchLimit:(double)a3
{
  id v5;

  -[MRUSlider configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setStretchLimit:", a3);
  -[MRUSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", v5);

}

- (void)setDimmed:(BOOL)a3
{
  if (self->_dimmed != a3)
  {
    self->_dimmed = a3;
    -[MRUSlider updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)setMinimumTrackVisible:(BOOL)a3
{
  if (self->_minimumTrackVisible != a3)
  {
    self->_minimumTrackVisible = a3;
    -[MRUSlider _setMinimumTrackVisible:withDuration:](self, "_setMinimumTrackVisible:withDuration:", 0.0);
  }
}

- (void)setEqualizing:(BOOL)a3
{
  _QWORD v3[5];

  if (self->_equalizing != a3)
  {
    self->_equalizing = a3;
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = __27__MRUSlider_setEqualizing___block_invoke;
    v3[3] = &unk_1E5818C88;
    v3[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0, v3, 0, 0.25, 0.0);
  }
}

uint64_t __27__MRUSlider_setEqualizing___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "updateVisualStyling");
}

- (UIView)minimumValueView
{
  void *v2;
  void *v3;

  -[MRUSlider configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "minimumValueView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setMinimumValueView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRUSlider configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMinimumValueView:", v4);

  -[MRUSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", v5);
  -[MRUSlider updateVisualStyling](self, "updateVisualStyling");

}

- (UIView)maximumValueView
{
  void *v2;
  void *v3;

  -[MRUSlider configuration](self, "configuration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "maximumValueView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIView *)v3;
}

- (void)setMaximumValueView:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[MRUSlider configuration](self, "configuration");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setMaximumValueView:", v4);

  -[MRUSlider _setSliderConfiguration:](self, "_setSliderConfiguration:", v5);
  -[MRUSlider updateVisualStyling](self, "updateVisualStyling");

}

- (BOOL)fluidTrackHidden
{
  if ((objc_opt_respondsToSelector() & 1) != 0)
    return -[MRUSlider _fluidTrackHidden](self, "_fluidTrackHidden");
  else
    return 0;
}

- (void)setFluidTrackHidden:(BOOL)a3
{
  _BOOL8 v3;

  v3 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[MRUSlider _setFluidTrackHidden:](self, "_setFluidTrackHidden:", v3);
    -[MRUSlider updateVisualStyling](self, "updateVisualStyling");
  }
}

- (void)addObserver:(id)a3
{
  -[NSHashTable addObject:](self->_observers, "addObject:", a3);
}

- (void)removeObserver:(id)a3
{
  -[NSHashTable removeObject:](self->_observers, "removeObject:", a3);
}

- (void)_sliderFluidInteractionWillBegin:(id)a3 withLocation:(CGPoint)a4
{
  double y;
  double x;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _QWORD v13[5];
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  y = a4.y;
  x = a4.x;
  v19 = *MEMORY[0x1E0C80C00];
  -[MRUSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 1);
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v15;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v15 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "sliderInteractionWillBegin:withLocation:", self, x, y);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v9);
  }

  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __59__MRUSlider__sliderFluidInteractionWillBegin_withLocation___block_invoke;
  v13[3] = &unk_1E5818C88;
  v13[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v13, 0, 1.0, 0.0, 1.0, 288.0, 26.5, 0.0);
}

uint64_t __59__MRUSlider__sliderFluidInteractionWillBegin_withLocation___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "animations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "animations");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 1);

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateVisualStyling");
}

- (void)_sliderFluidInteractionWillContinue:(id)a3 withLocation:(CGPoint)a4
{
  double y;
  double x;
  NSHashTable *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  y = a4.y;
  x = a4.x;
  v18 = *MEMORY[0x1E0C80C00];
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = self->_observers;
  v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v14;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v11);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v12, "sliderInteractionWillContinue:withLocation:", self, x, y, (_QWORD)v13);
        ++v11;
      }
      while (v9 != v11);
      v9 = -[NSHashTable countByEnumeratingWithState:objects:count:](v7, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v9);
  }

}

- (void)_sliderFluidInteractionWillExtend:(id)a3 insets:(UIEdgeInsets)a4
{
  double right;
  double bottom;
  double left;
  double top;
  NSHashTable *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  right = a4.right;
  bottom = a4.bottom;
  left = a4.left;
  top = a4.top;
  v20 = *MEMORY[0x1E0C80C00];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v9 = self->_observers;
  v10 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v16;
    do
    {
      v13 = 0;
      do
      {
        if (*(_QWORD *)v16 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * v13);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v14, "sliderInteractionWillExtend:insets:", self, top, left, bottom, right, (_QWORD)v15);
        ++v13;
      }
      while (v11 != v13);
      v11 = -[NSHashTable countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    }
    while (v11);
  }

}

- (void)_sliderFluidInteractionWillEnd:(id)a3
{
  NSHashTable *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD v10[5];
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[MRUSlider sendActionsForControlEvents:](self, "sendActionsForControlEvents:", 64);
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v4 = self->_observers;
  v5 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v12;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * v8);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          objc_msgSend(v9, "sliderInteractionWillEnd:", self);
        ++v8;
      }
      while (v6 != v8);
      v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v4, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v6);
  }

  v10[0] = MEMORY[0x1E0C809B0];
  v10[1] = 3221225472;
  v10[2] = __44__MRUSlider__sliderFluidInteractionWillEnd___block_invoke;
  v10[3] = &unk_1E5818C88;
  v10[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 2, v10, 0, 1.0, 0.0, 2.0, 500.0, 40.0, 0.0);
}

uint64_t __44__MRUSlider__sliderFluidInteractionWillEnd___block_invoke(uint64_t a1)
{
  void *v2;
  void (**v3)(_QWORD, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "animations");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "animations");
    v3 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, 0);

  }
  return objc_msgSend(*(id *)(a1 + 32), "updateVisualStyling");
}

- (CGRect)hitRect
{
  double top;
  double left;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  objc_super v13;
  CGRect result;

  v13.receiver = self;
  v13.super_class = (Class)MRUSlider;
  -[MRUSlider hitRect](&v13, sel_hitRect);
  top = self->_hitRectInset.top;
  left = self->_hitRectInset.left;
  v6 = v5 + left;
  v8 = v7 + top;
  v10 = v9 - (left + self->_hitRectInset.right);
  v12 = v11 - (top + self->_hitRectInset.bottom);
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v8;
  result.origin.x = v6;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[MRUSlider hitRect](self, "hitRect", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (BOOL)acuis_wantsPriorityOverTargetOfGestureRecognizer:(id)a3
{
  return 1;
}

- (void)updateVisualStyling
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  MRUVisualStylingProvider *stylingProvider;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  MRUVisualStylingProvider *v12;
  void *v13;
  void *v14;
  id v15;

  -[MRUVisualStylingProvider applyBlendModeToView:](self->_stylingProvider, "applyBlendModeToView:", self);
  if ((-[MRUSlider isTracking](self, "isTracking") & 1) != 0 || -[MRUSlider isEqualizing](self, "isEqualizing"))
  {
    v3 = 0;
  }
  else if (self->_dimmed)
  {
    v3 = 2;
  }
  else
  {
    v3 = 1;
  }
  -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSlider setMinimumTrackTintColor:](self, "setMinimumTrackTintColor:", v4);

  -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MRUSlider setMaximumTrackTintColor:](self, "setMaximumTrackTintColor:", v5);

  -[MRUSlider minimumValueView](self, "minimumValueView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    stylingProvider = self->_stylingProvider;
    -[MRUSlider minimumValueView](self, "minimumValueView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVisualStylingProvider applyBlendModeToView:](stylingProvider, "applyBlendModeToView:", v8);

    -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUSlider minimumValueView](self, "minimumValueView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setTintColor:", v9);

  }
  -[MRUSlider maximumValueView](self, "maximumValueView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
  {
    v12 = self->_stylingProvider;
    -[MRUSlider maximumValueView](self, "maximumValueView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[MRUVisualStylingProvider applyBlendModeToView:](v12, "applyBlendModeToView:", v13);

    -[MRUVisualStylingProvider blendColorForStyle:](self->_stylingProvider, "blendColorForStyle:", v3);
    v15 = (id)objc_claimAutoreleasedReturnValue();
    -[MRUSlider maximumValueView](self, "maximumValueView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setTintColor:", v15);

  }
}

- (MRUVisualStylingProvider)stylingProvider
{
  return self->_stylingProvider;
}

- (UIEdgeInsets)hitRectInset
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_hitRectInset.top;
  left = self->_hitRectInset.left;
  bottom = self->_hitRectInset.bottom;
  right = self->_hitRectInset.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)setHitRectInset:(UIEdgeInsets)a3
{
  self->_hitRectInset = a3;
}

- (BOOL)minimumTrackVisible
{
  return self->_minimumTrackVisible;
}

- (BOOL)isDimmed
{
  return self->_dimmed;
}

- (BOOL)isEqualizing
{
  return self->_equalizing;
}

- (id)animations
{
  return self->_animations;
}

- (void)setAnimations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 536);
}

- (_UISliderFluidConfiguration)configuration
{
  return self->_configuration;
}

- (void)setConfiguration:(id)a3
{
  objc_storeStrong((id *)&self->_configuration, a3);
}

- (NSHashTable)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
  objc_storeStrong((id *)&self->_observers, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong(&self->_animations, 0);
  objc_storeStrong((id *)&self->_stylingProvider, 0);
}

@end

@implementation CSHomeAffordanceView

- (CSHomeAffordanceView)initWithCoverSheetContext:(id)a3
{
  id v5;
  CSHomeAffordanceView *v6;
  CSHomeAffordanceView *v7;
  uint64_t v8;
  SBFHomeGrabberSettings *settings;
  id v10;
  id v11;
  id v12;
  id v13;
  void *v14;
  double v15;
  void *v16;
  objc_super v18;

  v5 = a3;
  v18.receiver = self;
  v18.super_class = (Class)CSHomeAffordanceView;
  v6 = -[CSHomeAffordanceView initWithFrame:](&v18, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_coverSheetContext, a3);
    objc_msgSend(MEMORY[0x1E0DA9E28], "rootSettings");
    v8 = objc_claimAutoreleasedReturnValue();
    settings = v7->_settings;
    v7->_settings = (SBFHomeGrabberSettings *)v8;

    v10 = -[CSHomeAffordanceView _newStaticColorPillView](v7, "_newStaticColorPillView");
    v11 = -[CSHomeAffordanceView _newLumaDodgePillView](v7, "_newLumaDodgePillView");
    v12 = -[CSHomeAffordanceView _newAlwaysOnHomeAffordancePillView](v7, "_newAlwaysOnHomeAffordancePillView");
    v13 = -[CSHomeAffordanceView _newHomeAffordanceView](v7, "_newHomeAffordanceView");
    objc_msgSend(v13, "addContentView:", v12);
    objc_msgSend(v13, "addContentView:", v11);
    objc_msgSend(v13, "addContentView:", v10);
    -[CSHomeAffordanceView addSubview:](v7, "addSubview:", v13);
    objc_storeWeak((id *)&v7->_staticColorPillView, v10);
    objc_storeWeak((id *)&v7->_lumaDodgePillView, v11);
    objc_storeWeak((id *)&v7->_alwaysOnHomeAffordancePillView, v12);
    objc_storeWeak((id *)&v7->_homeAffordanceView, v13);
    v7->_style = 0;
    objc_msgSend(MEMORY[0x1E0CEA950], "mainScreen");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "bounds");
    -[CSHomeAffordanceView suggestedSizeForContentWidth:](v7, "suggestedSizeForContentWidth:", v15);

    BSRectWithSize();
    -[CSHomeAffordanceView setFrame:](v7, "setFrame:");
    -[CSCoverSheetContextProviding assistantController](v7->_coverSheetContext, "assistantController");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addAssistantControllerObserver:", v7);

  }
  return v7;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  -[CSCoverSheetContextProviding assistantController](self->_coverSheetContext, "assistantController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeAssistantControllerObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)CSHomeAffordanceView;
  -[CSHomeAffordanceView dealloc](&v4, sel_dealloc);
}

- (id)_newHomeAffordanceView
{
  id v3;
  void *v4;

  v3 = objc_alloc(MEMORY[0x1E0DA9E20]);
  v4 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  objc_msgSend(v4, "setHintStyle:", -[CSHomeAffordanceView _effectiveHomeAffordanceViewHintStyle](self, "_effectiveHomeAffordanceViewHintStyle"));
  return v4;
}

- (id)_newStaticColorPillView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D474A8]);
  objc_msgSend(v2, "setAlpha:", 0.0);
  objc_msgSend(v2, "setHidden:", 1);
  return v2;
}

- (id)_newLumaDodgePillView
{
  id v2;

  v2 = objc_alloc_init(MEMORY[0x1E0D47490]);
  objc_msgSend(v2, "setAlpha:", 0.0);
  objc_msgSend(v2, "setHidden:", 1);
  return v2;
}

- (id)_newAlwaysOnHomeAffordancePillView
{
  CSAlwaysOnHomeAffordancePillView *v2;

  v2 = objc_alloc_init(CSAlwaysOnHomeAffordancePillView);
  -[CSAlwaysOnHomeAffordancePillView setAlpha:](v2, "setAlpha:", 0.0);
  -[CSAlwaysOnHomeAffordancePillView setHidden:](v2, "setHidden:", 1);
  return v2;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[CSHomeAffordanceView bounds](self, "bounds", a4);
  UIRectGetCenter();
  UIRectCenteredAboutPoint();
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGSize)suggestedSizeForContentWidth:(double)a3
{
  id WeakRetained;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGSize result;

  WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
  objc_msgSend(WeakRetained, "suggestedSizeForContentWidth:", a3);
  v6 = v5;
  v8 = v7;

  v9 = v6;
  v10 = v8;
  result.height = v10;
  result.width = v9;
  return result;
}

- (double)suggestedEdgeSpacing
{
  id WeakRetained;
  double v3;
  double v4;

  WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
  objc_msgSend(WeakRetained, "suggestedEdgeSpacing");
  v4 = v3;

  return v4;
}

- (CGRect)extendedFrameForPointerAnimationSuppression
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGRect result;

  -[SBFHomeGrabberSettings coverSheetSuppressAnimationForPointerInsets](self->_settings, "coverSheetSuppressAnimationForPointerInsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSHomeAffordanceView frame](self, "frame");
  v12 = v6 + v11;
  v14 = v4 + v13;
  v16 = v15 - (v6 + v10);
  v18 = v17 - (v4 + v8);
  result.size.height = v18;
  result.size.width = v16;
  result.origin.y = v14;
  result.origin.x = v12;
  return result;
}

- (void)performHintAnimationWithCompletionHandler:(id)a3
{
  SBFHomeAffordanceView **p_homeAffordanceView;
  id v4;
  id WeakRetained;

  p_homeAffordanceView = &self->_homeAffordanceView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_homeAffordanceView);
  objc_msgSend(WeakRetained, "performHintAnimationWithCompletionHandler:", v4);

}

- (void)setSystemPointerInteractionEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  if (self->_systemPointerInteractionEnabled != a3)
  {
    v3 = a3;
    self->_systemPointerInteractionEnabled = a3;
    -[CSCoverSheetContextProviding systemPointerInteractionManager](self->_coverSheetContext, "systemPointerInteractionManager");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v3)
      objc_msgSend(v5, "registerView:delegate:", self, self);
    else
      objc_msgSend(v5, "unregisterView:", self);

  }
}

- (void)setStyle:(unint64_t)a3
{
  if (self->_style != a3)
    -[CSHomeAffordanceView _transitionToStyle:animated:](self, "_transitionToStyle:animated:");
}

- (void)setOverrideColor:(id)a3
{
  UIColor *v5;
  UIColor **p_overrideColor;
  void *v7;
  UIColor *v8;

  v5 = (UIColor *)a3;
  p_overrideColor = &self->_overrideColor;
  if (self->_overrideColor != v5)
  {
    v8 = v5;
    objc_storeStrong((id *)&self->_overrideColor, a3);
    -[CSHomeAffordanceView staticColorPillView](self, "staticColorPillView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setPillColor:", *p_overrideColor);

    v5 = v8;
  }

}

- (void)setLegibilitySettings:(id)a3
{
  id v5;

  v5 = a3;
  if ((-[_UILegibilitySettings sb_isEqualToLegibilitySettings:](self->_legibilitySettings, "sb_isEqualToLegibilitySettings:") & 1) == 0)
  {
    objc_storeStrong((id *)&self->_legibilitySettings, a3);
    -[CSHomeAffordanceView _updateForLegibility](self, "_updateForLegibility");
  }

}

- (void)_updateForLegibility
{
  void *v3;
  uint64_t v4;
  id WeakRetained;

  -[_UILegibilitySettings primaryColor](self->_legibilitySettings, "primaryColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSHomeAffordanceView setOverrideColor:](self, "setOverrideColor:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
  if (-[_UILegibilitySettings style](self->_legibilitySettings, "style") == 2)
    v4 = 3;
  else
    v4 = 4;
  objc_msgSend(WeakRetained, "setStyle:", v4);

}

- (void)layoutSubviews
{
  id WeakRetained;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CSHomeAffordanceView;
  -[CSHomeAffordanceView layoutSubviews](&v4, sel_layoutSubviews);
  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceView);
  -[CSHomeAffordanceView bounds](self, "bounds");
  objc_msgSend(WeakRetained, "setFrame:");

}

- (void)assistantDidChangeSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnablement:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_homeAffordanceView);
  objc_msgSend(WeakRetained, "setHintStyle:", -[CSHomeAffordanceView _effectiveHomeAffordanceViewHintStyle](self, "_effectiveHomeAffordanceViewHintStyle"));

}

- (UIEdgeInsets)pointerInteractionHitTestInsetsForView:(id)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  UIEdgeInsets result;

  -[SBFHomeGrabberSettings hitTestOutsetSides](self->_settings, "hitTestOutsetSides", a3);
  v5 = v4;
  -[SBFHomeGrabberSettings hitTestOutsetTop](self->_settings, "hitTestOutsetTop");
  v7 = -v6;
  v8 = -v5;
  v9 = v7;
  v10 = -v5;
  result.right = v10;
  result.bottom = v9;
  result.left = v8;
  result.top = v7;
  return result;
}

- (BOOL)shouldBeginPointerInteractionRequest:(id)a3 atLocation:(CGPoint)a4 forView:(id)a5
{
  return (objc_msgSend(a3, "_isPencilInitiated", a4.x, a4.y) & 1) == 0
      && (-[CSHomeAffordanceView isHiddenOrHasHiddenAncestor](self, "isHiddenOrHasHiddenAncestor") & 1) == 0
      && -[CSHomeAffordanceView _isInAWindow](self, "_isInAWindow")
      && -[CSHomeAffordanceView isSystemPointerInteractionEnabled](self, "isSystemPointerInteractionEnabled");
}

- (id)styleForRegion:(id)a3 forView:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  void *v20;

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEAA98]), "initWithView:", self);
  objc_msgSend(MEMORY[0x1E0CEA850], "effectWithPreview:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SBFHomeGrabberSettings coverSheetHomeAffordanceCursorEdgeInsets](self->_settings, "coverSheetHomeAffordanceCursorEdgeInsets");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;
  -[CSHomeAffordanceView frame](self, "frame");
  objc_msgSend(MEMORY[0x1E0CEA878], "shapeWithRoundedRect:cornerRadius:", v10 + v15, v8 + v16, v17 - (v10 + v14), v18 - (v8 + v12), (v17 - (v10 + v14)) * 0.5);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CEA880], "styleWithEffect:shape:", v6, v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

- (void)_transitionToStyle:(unint64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  unint64_t style;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  void *v12;
  uint64_t v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  _QWORD v18[4];
  id v19;
  id v20;
  id v21;
  unint64_t v22;

  v4 = a4;
  style = self->_style;
  self->_style = a3;
  -[CSHomeAffordanceView _viewForStyle:](self, "_viewForStyle:", style);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[CSHomeAffordanceView _viewForStyle:](self, "_viewForStyle:", self->_style);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9 != v8)
  {
    -[CSHomeAffordanceView homeAffordanceView](self, "homeAffordanceView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setHidden:", 0);
    if (v4)
      v11 = 0.6;
    else
      v11 = 0.0;
    v12 = (void *)MEMORY[0x1E0CEABB0];
    v13 = MEMORY[0x1E0C809B0];
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke;
    v18[3] = &unk_1E8E2DA80;
    v22 = a3;
    v19 = v10;
    v20 = v8;
    v21 = v9;
    v15[0] = v13;
    v15[1] = 3221225472;
    v15[2] = __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke_2;
    v15[3] = &unk_1E8E2DAA8;
    v15[4] = self;
    v16 = v21;
    v17 = v20;
    v14 = v10;
    objc_msgSend(v12, "animateWithDuration:animations:completion:", v18, v15, v11);

  }
  -[CSHomeAffordanceView _updateForLegibility](self, "_updateForLegibility");

}

uint64_t __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke(uint64_t a1)
{
  if (*(_QWORD *)(a1 + 56) == 3)
    objc_msgSend(*(id *)(a1 + 32), "cancelHintAnimation");
  objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 48), "setAlpha:", 1.0);
}

void __52__CSHomeAffordanceView__transitionToStyle_animated___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;

  objc_msgSend(*(id *)(a1 + 32), "_viewForStyle:", *(_QWORD *)(*(_QWORD *)(a1 + 32) + 440));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);

  if (v2 == v3)
    objc_msgSend(*(id *)(a1 + 48), "setHidden:", 1);
}

- (id)_viewForStyle:(unint64_t)a3
{
  if (a3 - 1 > 2)
    return 0;
  else
    return objc_autoreleaseReturnValue(objc_loadWeakRetained((id *)((char *)&self->super.super.super.isa
                                                                  + *off_1E8E2DAC8[a3 - 1])));
}

- (unint64_t)_effectiveHomeAffordanceViewHintStyle
{
  void *v2;
  int v3;

  -[CSCoverSheetContextProviding assistantController](self->_coverSheetContext, "assistantController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSystemAssistantExperienceHomeAffordanceDoubleTapGestureEnabled");

  if (v3)
    return *MEMORY[0x1E0DAA0C8];
  else
    return 0;
}

- (_UILegibilitySettings)legibilitySettings
{
  return self->_legibilitySettings;
}

- (unint64_t)style
{
  return self->_style;
}

- (UIColor)overrideColor
{
  return self->_overrideColor;
}

- (CSCoverSheetContextProviding)coverSheetContext
{
  return self->_coverSheetContext;
}

- (BOOL)isSystemPointerInteractionEnabled
{
  return self->_systemPointerInteractionEnabled;
}

- (SBFHomeAffordanceView)homeAffordanceView
{
  return (SBFHomeAffordanceView *)objc_loadWeakRetained((id *)&self->_homeAffordanceView);
}

- (void)setHomeAffordanceView:(id)a3
{
  objc_storeWeak((id *)&self->_homeAffordanceView, a3);
}

- (MTStaticColorPillView)staticColorPillView
{
  return (MTStaticColorPillView *)objc_loadWeakRetained((id *)&self->_staticColorPillView);
}

- (void)setStaticColorPillView:(id)a3
{
  objc_storeWeak((id *)&self->_staticColorPillView, a3);
}

- (MTLumaDodgePillView)lumaDodgePillView
{
  return (MTLumaDodgePillView *)objc_loadWeakRetained((id *)&self->_lumaDodgePillView);
}

- (void)setLumaDodgePillView:(id)a3
{
  objc_storeWeak((id *)&self->_lumaDodgePillView, a3);
}

- (CSAlwaysOnHomeAffordancePillView)alwaysOnHomeAffordancePillView
{
  return (CSAlwaysOnHomeAffordancePillView *)objc_loadWeakRetained((id *)&self->_alwaysOnHomeAffordancePillView);
}

- (void)setAlwaysOnHomeAffordancePillView:(id)a3
{
  objc_storeWeak((id *)&self->_alwaysOnHomeAffordancePillView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_alwaysOnHomeAffordancePillView);
  objc_destroyWeak((id *)&self->_lumaDodgePillView);
  objc_destroyWeak((id *)&self->_staticColorPillView);
  objc_destroyWeak((id *)&self->_homeAffordanceView);
  objc_storeStrong((id *)&self->_coverSheetContext, 0);
  objc_storeStrong((id *)&self->_overrideColor, 0);
  objc_storeStrong((id *)&self->_legibilitySettings, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

@end

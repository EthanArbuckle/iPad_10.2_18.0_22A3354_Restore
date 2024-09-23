@implementation FCUIFocusEnablementIndicatorSystemApertureElement

- (FCUIFocusEnablementIndicatorSystemApertureElement)initWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  id v6;
  FCUIFocusEnablementIndicatorSystemApertureElement *v7;
  uint64_t v8;
  FCActivityDescribing *activityDescription;
  uint64_t v10;
  FCActivityManager *activityManager;
  void *v12;
  double v13;
  double v14;
  objc_super v16;

  v6 = a3;
  v16.receiver = self;
  v16.super_class = (Class)FCUIFocusEnablementIndicatorSystemApertureElement;
  v7 = -[FCUIFocusEnablementIndicatorSystemApertureElement init](&v16, sel_init);
  if (v7)
  {
    v8 = objc_msgSend(v6, "copyWithZone:", 0);
    activityDescription = v7->_activityDescription;
    v7->_activityDescription = (FCActivityDescribing *)v8;

    v7->_activityEnabled = a4;
    v7->_preferredLayoutMode = 2;
    objc_msgSend(MEMORY[0x24BE37EB8], "sharedActivityManager");
    v10 = objc_claimAutoreleasedReturnValue();
    activityManager = v7->_activityManager;
    v7->_activityManager = (FCActivityManager *)v10;

    objc_msgSend(MEMORY[0x24BEB0FA0], "sharedInstanceForEmbeddedDisplay");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "sensorRegionSize");
    v7->_sensorObstructionHeight = v13;
    objc_msgSend(v12, "minimumExpandedSize");
    v7->_expandedHeight = v14;
    v7->_isForPickerPresentation = 0;

  }
  return v7;
}

- (id)initForPickerWithActivityDescription:(id)a3 enabled:(BOOL)a4
{
  id result;

  result = -[FCUIFocusEnablementIndicatorSystemApertureElement initWithActivityDescription:enabled:](self, "initWithActivityDescription:enabled:", a3, a4);
  if (result)
    *((_BYTE *)result + 80) = 1;
  return result;
}

- (void)setActivityEnabled:(BOOL)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  if (self->_activityEnabled != a3)
  {
    self->_activityEnabled = a3;
    -[FCUIFocusEnablementIndicatorSystemApertureElement _updateOnOffTrailingLabelAnimated:](self, "_updateOnOffTrailingLabelAnimated:", 1);
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

    -[FCUIFocusEnablementIndicatorSystemApertureElement _updateVisualStylingAnimated:](self, "_updateVisualStylingAnimated:", 1);
    -[UILabel superview](self->_activityTitleLabel, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = v5;
      -[FCUIFocusEnablementIndicatorSystemApertureElement _layoutCustomTextViewsInContainerView:](self, "_layoutCustomTextViewsInContainerView:", v5);
      v5 = v6;
    }

  }
}

- (NSString)elementIdentifier
{
  return (NSString *)(id)*MEMORY[0x24BEB1008];
}

- (NSString)clientIdentifier
{
  return (NSString *)CFSTR("com.apple.SpringBoard.FocusUI");
}

- (BOOL)hasAlertBehavior
{
  return 1;
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (UIView)leadingView
{
  UIView *leadingView;
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
  UIView *v15;
  UIView *v16;

  leadingView = self->_leadingView;
  if (!leadingView)
  {
    if (self->_activityEnabled)
      -[FCUIFocusEnablementIndicatorSystemApertureElement _primaryColor](self, "_primaryColor");
    else
      objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = (void *)MEMORY[0x24BEBD660];
    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB608]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "configurationWithFont:scale:", v6, 2);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v8 = (void *)MEMORY[0x24BEBD660];
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v4, 0);
    objc_msgSend(v8, "configurationWithPaletteColors:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "configurationByApplyingConfiguration:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BEBD640];
    -[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "_systemImageNamed:withConfiguration:", v13, v11);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (UIView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v14);
    v16 = self->_leadingView;
    self->_leadingView = v15;

    leadingView = self->_leadingView;
  }
  return leadingView;
}

- (UIView)trailingView
{
  UIImageView *pickerTrailingView;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  UIImageView *v13;
  UIImageView *v14;
  SBUISystemApertureTextContentProvider *onOffTrailingTextProvider;
  void *v17;
  SBUISystemApertureTextContentProvider *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x24BDAC8D0];
  if (self->_isForPickerPresentation)
  {
    pickerTrailingView = self->_pickerTrailingView;
    if (!pickerTrailingView)
    {
      v4 = (void *)MEMORY[0x24BEBD660];
      objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB608]);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "configurationWithFont:scale:", v5, 2);
      v6 = (void *)objc_claimAutoreleasedReturnValue();

      v7 = (void *)MEMORY[0x24BEBD660];
      objc_msgSend(MEMORY[0x24BEBD4B8], "systemWhiteColor");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v19[0] = v8;
      objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v19, 1);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "configurationWithPaletteColors:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "configurationByApplyingConfiguration:", v10);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BEBD640], "_systemImageNamed:withConfiguration:", CFSTR("list.bullet"), v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = (UIImageView *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v12);
      v14 = self->_pickerTrailingView;
      self->_pickerTrailingView = v13;

      pickerTrailingView = self->_pickerTrailingView;
    }
    return (UIView *)pickerTrailingView;
  }
  else
  {
    onOffTrailingTextProvider = self->_onOffTrailingTextProvider;
    if (!onOffTrailingTextProvider)
    {
      v17 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEB0FA8]), "initWithText:style:", &stru_24D20B520, 4);
      objc_msgSend(v17, "setTextAlignment:", 4);
      objc_msgSend(v17, "setContentContainer:", self);
      v18 = self->_onOffTrailingTextProvider;
      self->_onOffTrailingTextProvider = (SBUISystemApertureTextContentProvider *)v17;

      -[FCUIFocusEnablementIndicatorSystemApertureElement _updateOnOffTrailingLabelAnimated:](self, "_updateOnOffTrailingLabelAnimated:", 0);
      onOffTrailingTextProvider = self->_onOffTrailingTextProvider;
    }
    -[SBUISystemApertureTextContentProvider providedView](onOffTrailingTextProvider, "providedView");
    return (UIView *)(id)objc_claimAutoreleasedReturnValue();
  }
}

- (UIView)minimalView
{
  if (self->_isForPickerPresentation)
    -[FCUIFocusEnablementIndicatorSystemApertureElement trailingView](self, "trailingView");
  else
    -[FCUIFocusEnablementIndicatorSystemApertureElement leadingView](self, "leadingView");
  return (UIView *)(id)objc_claimAutoreleasedReturnValue();
}

- (void)setLayoutMode:(int64_t)a3 reason:(int64_t)a4
{
  self->_layoutMode = a3;
}

- (int64_t)minimumSupportedLayoutMode
{
  return 1;
}

- (int64_t)maximumSupportedLayoutMode
{
  return 3;
}

- (NSDirectionalEdgeInsets)preferredEdgeOutsetsForLayoutMode:(int64_t)a3 suggestedOutsets:(NSDirectionalEdgeInsets)result maximumOutsets:(NSDirectionalEdgeInsets)a5
{
  CGFloat top;
  CGFloat trailing;
  CGFloat leading;
  id WeakRetained;
  double v10;
  CGFloat bottom;
  double v12;
  double v13;

  top = result.top;
  if (a3 == 3)
  {
    trailing = a5.trailing;
    leading = a5.leading;
    WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
    objc_msgSend(WeakRetained, "edgeOutsetsForSize:", 1.79769313e308, self->_expandedHeight);
    bottom = v10;

    result.leading = leading;
    result.trailing = trailing;
  }
  else
  {
    bottom = result.bottom;
  }
  v12 = top;
  v13 = bottom;
  result.bottom = v13;
  result.top = v12;
  return result;
}

- (void)layoutHostContainerViewDidLayoutSubviews:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  id v12;

  v12 = a3;
  if (self->_layoutMode == 3)
  {
    -[UILabel superview](self->_activityTitleLabel, "superview");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (v4)
    {
      -[FCUIFocusEnablementIndicatorSystemApertureElement _layoutCustomActivityButtonInContainerView:](self, "_layoutCustomActivityButtonInContainerView:", v12);
      -[FCUIFocusEnablementIndicatorSystemApertureElement _layoutCustomTextViewsInContainerView:](self, "_layoutCustomTextViewsInContainerView:", v12);
    }
  }
  -[FCUIFocusEnablementIndicatorSystemApertureElement leadingView](self, "leadingView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_layoutMode == 3)
    v7 = 0.0;
  else
    v7 = 1.0;
  objc_msgSend(v5, "setAlpha:", v7);

  -[FCUIFocusEnablementIndicatorSystemApertureElement trailingView](self, "trailingView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (self->_layoutMode == 3)
    v10 = 0.0;
  else
    v10 = 1.0;
  objc_msgSend(v8, "setAlpha:", v10);

  +[FCUIFocusEnablementIndicatorBannerPresentable accessibilityIdentifierForActivityDescription:](FCUIFocusEnablementIndicatorBannerPresentable, "accessibilityIdentifierForActivityDescription:", self->_activityDescription);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setAccessibilityIdentifier:", v11);

}

- (id)keyColor
{
  if (self->_activityEnabled)
    -[FCUIFocusEnablementIndicatorSystemApertureElement _primaryColor](self, "_primaryColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
  return (id)objc_claimAutoreleasedReturnValue();
}

- (BOOL)shouldSuppressElementWhileOnCoversheet
{
  return 0;
}

- (void)preferredContentSizeDidInvalidateForContentViewProvider:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_layoutHost);
  objc_msgSend(WeakRetained, "preferredEdgeOutsetsDidInvalidateForLayoutSpecifier:", self);

}

- (void)contentProviderWillTransitionToSize:(CGSize)a3 inContainerView:(id)a4 transitionCoordinator:(id)a5
{
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;
  _QWORD v14[4];
  id v15;
  id v16;
  id location;
  _QWORD v18[4];
  id v19;
  FCUIFocusEnablementIndicatorSystemApertureElement *v20;

  v7 = a4;
  v8 = a5;
  v9 = MEMORY[0x24BDAC760];
  if (self->_layoutMode == 3)
  {
    -[FCUIFocusEnablementIndicatorSystemApertureElement _configureCustomViewsIfNecessary](self, "_configureCustomViewsIfNecessary");
    -[FCUIFocusEnablementIndicatorSystemApertureElement _updateVisualStylingAnimated:](self, "_updateVisualStylingAnimated:", 0);
    v10 = (void *)MEMORY[0x24BEBDB00];
    v18[0] = v9;
    v18[1] = 3221225472;
    v18[2] = __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke;
    v18[3] = &unk_24D20A8D0;
    v19 = v7;
    v20 = self;
    objc_msgSend(v10, "performWithoutAnimation:", v18);

  }
  objc_initWeak(&location, self);
  v14[0] = v9;
  v14[1] = 3221225472;
  v14[2] = __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2;
  v14[3] = &unk_24D20B030;
  objc_copyWeak(&v16, &location);
  v11 = v7;
  v15 = v11;
  v12[0] = v9;
  v12[1] = 3221225472;
  v12[2] = __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_3;
  v12[3] = &unk_24D20B058;
  objc_copyWeak(&v13, &location);
  objc_msgSend(v8, "animateAlongsideTransition:completion:", v14, v12);
  objc_destroyWeak(&v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);

}

uint64_t __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke(uint64_t a1)
{
  uint64_t result;
  uint64_t v3;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 48));
  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 56));
  result = objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(*(_QWORD *)(a1 + 40) + 40));
  v3 = *(_QWORD *)(a1 + 40);
  if (*(_QWORD *)(v3 + 24))
  {
    result = objc_msgSend(*(id *)(a1 + 32), "addSubview:");
    v3 = *(_QWORD *)(a1 + 40);
  }
  if (*(_QWORD *)(v3 + 32))
    return objc_msgSend(*(id *)(a1 + 32), "addSubview:");
  return result;
}

void __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  objc_msgSend(WeakRetained, "layoutHostContainerViewDidLayoutSubviews:", *(_QWORD *)(a1 + 32));

}

void __127__FCUIFocusEnablementIndicatorSystemApertureElement_contentProviderWillTransitionToSize_inContainerView_transitionCoordinator___block_invoke_3(uint64_t a1)
{
  _QWORD *WeakRetained;
  _QWORD *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  _QWORD *v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  v2 = WeakRetained;
  if (WeakRetained)
  {
    v6 = WeakRetained;
    v3 = objc_msgSend(WeakRetained, "layoutMode");
    v2 = v6;
    if (v3 <= 2)
    {
      objc_msgSend((id)v6[6], "removeFromSuperview");
      objc_msgSend((id)v6[7], "removeFromSuperview");
      objc_msgSend((id)v6[5], "removeFromSuperview");
      v2 = v6;
      v4 = (void *)v6[3];
      if (v4)
      {
        objc_msgSend(v4, "removeFromSuperview");
        v2 = v6;
      }
      v5 = (void *)v2[4];
      if (v5)
      {
        objc_msgSend(v5, "removeFromSuperview");
        v2 = v6;
      }
    }
  }

}

- (void)_layoutCustomActivityButtonInContainerView:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(v4, "bounds");
  v7 = v6;

  if (v5 == 1)
    v8 = v7 + -56.0 + -14.0;
  else
    v8 = 14.0;
  -[FCUICAPackageView setFrame:](self->_activityIconPackageView, "setFrame:", v8);
  -[UIImageView setFrame:](self->_activityIconImageView, "setFrame:", v8, 14.0, 56.0, 56.0);
  -[UIButton setFrame:](self->_activityIconButton, "setFrame:", v8, 14.0, 56.0, 56.0);
  -[UIButton _setCornerRadius:](self->_activityIconButton, "_setCornerRadius:", 28.0);
}

- (void)_layoutCustomTextViewsInContainerView:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  v5 = objc_msgSend(v4, "effectiveUserInterfaceLayoutDirection");
  objc_msgSend(v4, "bounds");
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "displayScale");
  -[UILabel font](self->_activityOnOffLabel, "font");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "lineHeight");
  UIFloorToScale();
  v13 = v12;

  v14 = v9 - self->_sensorObstructionHeight + -12.0;
  -[UILabel sizeThatFits:](self->_activityOnOffLabel, "sizeThatFits:", v7 + -12.0 - v13 + -84.0, v14);
  BSSizeCeilForScale();
  v16 = v7 + -12.0 - v13 + -84.0 - v15;
  if (v16 <= 0.0)
    v17 = v7 + -12.0 - v13 + -84.0;
  else
    v17 = v15;
  if (v16 <= 0.0)
    v18 = 0.0;
  else
    v18 = v7 + -12.0 - v13 + -84.0 - v15;
  if (v5 == 1)
    v19 = v17 + v13 + 12.0;
  else
    v19 = 84.0;
  -[FCUIFocusEnablementIndicatorSystemApertureElement _layoutHuggingObstructionForLabel:x:width:maxLabelHeight:](self, "_layoutHuggingObstructionForLabel:x:width:maxLabelHeight:", self->_activityOnOffLabel);
  -[FCUIFocusEnablementIndicatorSystemApertureElement _layoutHuggingObstructionForLabel:x:width:maxLabelHeight:](self, "_layoutHuggingObstructionForLabel:x:width:maxLabelHeight:", self->_activityTitleLabel, v19, v18, v14);
}

- (void)_layoutHuggingObstructionForLabel:(id)a3 x:(double)a4 width:(double)a5 maxLabelHeight:(double)a6
{
  double v9;
  void *v10;
  id v11;

  v9 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v11 = a3;
  objc_msgSend(v11, "setFrame:", a4, v9, a5, a6);
  objc_msgSend(v11, "traitCollection");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "displayScale");

  objc_msgSend(v11, "_tightBoundingRectOfFirstLine");
  UICeilToScale();
  BSRectRoundForScale();
  objc_msgSend(v11, "setFrame:");

}

- (void)_updateVisualStylingAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _BOOL4 activityEnabled;
  uint64_t v6;
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
  __CFString **v17;
  _BOOL8 v18;
  void *v19;
  void *v20;
  void *v21;
  id v22;

  v3 = a3;
  activityEnabled = self->_activityEnabled;
  if (self->_activityEnabled)
  {
    -[FCUIFocusEnablementIndicatorSystemApertureElement _primaryColor](self, "_primaryColor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 1;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
    v22 = (id)objc_claimAutoreleasedReturnValue();
    v6 = 2;
  }
  v7 = (void *)MEMORY[0x24BEBD660];
  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 17.0, *MEMORY[0x24BEBB608]);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "configurationWithFont:scale:", v8, 2);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = (void *)MEMORY[0x24BEBD660];
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE30]), "initWithObjects:", v22, 0);
  objc_msgSend(v10, "configurationWithPaletteColors:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationByApplyingConfiguration:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)MEMORY[0x24BEBD640];
  -[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "_systemImageNamed:withConfiguration:", v15, v13);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  -[UIView setImage:](self->_leadingView, "setImage:", v16);
  v17 = kFCUIPackageViewStateOn;
  if (activityEnabled)
  {
    v18 = v3;
  }
  else
  {
    v17 = &kFCUIPackageViewStateOff;
    v18 = 0;
  }
  -[FCUICAPackageView setState:animated:](self->_activityIconPackageView, "setState:animated:", *v17, v18);
  -[FCUICAPackageView superview](self->_activityIconPackageView, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setOverrideUserInterfaceStyle:", v6);

  -[UIImageView setTintColor:](self->_activityIconImageView, "setTintColor:", v22);
  if (activityEnabled)
  {
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[FCUIFocusEnablementIndicatorSystemApertureElement _primaryColor](self, "_primaryColor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "colorWithAlphaComponent:", 0.25);
    v20 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[UIButton setBackgroundColor:](self->_activityIconButton, "setBackgroundColor:", v20);
  -[FCUIFocusEnablementIndicatorSystemApertureElement _updateTrailingLabel](self, "_updateTrailingLabel");

}

- (void)_updateTrailingLabel
{
  UILabel *activityOnOffLabel;
  void *v4;
  UILabel *v5;
  void *v6;
  id v7;

  if (self->_activityEnabled)
    -[FCUIFocusEnablementIndicatorSystemApertureElement _primaryColor](self, "_primaryColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  activityOnOffLabel = self->_activityOnOffLabel;
  -[FCUIFocusEnablementIndicatorSystemApertureElement _enablementText](self, "_enablementText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setText:](activityOnOffLabel, "setText:", v4);

  v5 = self->_activityOnOffLabel;
  -[FCUIFocusEnablementIndicatorSystemApertureElement _customLayoutFont](self, "_customLayoutFont");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](v5, "setFont:", v6);

  -[UILabel setTextColor:](self->_activityOnOffLabel, "setTextColor:", v7);
}

- (void)_updateOnOffTrailingLabelAnimated:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  const __CFString *v11;
  void *v12;
  SBUISystemApertureTextContentProvider *onOffTrailingTextProvider;
  id v14;

  v3 = a3;
  -[SBUISystemApertureTextContentProvider providedView](self->_onOffTrailingTextProvider, "providedView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "_shouldReverseLayoutDirection");

  if (self->_activityEnabled)
    -[FCUIFocusEnablementIndicatorSystemApertureElement _primaryColor](self, "_primaryColor");
  else
    objc_msgSend(MEMORY[0x24BEBD4B8], "sbui_inactiveColor");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  v7 = (void *)MEMORY[0x24BDD17C8];
  -[FCUIFocusEnablementIndicatorSystemApertureElement _enablementText](self, "_enablementText");
  v8 = objc_claimAutoreleasedReturnValue();
  v9 = (void *)v8;
  v10 = &stru_24D20B520;
  if (v6)
    v11 = CFSTR(" ");
  else
    v11 = &stru_24D20B520;
  if (!v6)
    v10 = CFSTR(" ");
  objc_msgSend(v7, "stringWithFormat:", CFSTR("%@%@%@"), v8, v11, v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  onOffTrailingTextProvider = self->_onOffTrailingTextProvider;
  if (v3)
  {
    -[SBUISystemApertureTextContentProvider swapInText:textColor:](onOffTrailingTextProvider, "swapInText:textColor:", v12, v14);
  }
  else
  {
    -[SBUISystemApertureTextContentProvider setText:](onOffTrailingTextProvider, "setText:", v12);
    -[SBUISystemApertureTextContentProvider setContentColor:](self->_onOffTrailingTextProvider, "setContentColor:", v14);
  }

}

- (void)_configureCustomViewsIfNecessary
{
  FCActivityDescribing *v3;
  UILabel *v4;
  UILabel *activityTitleLabel;
  UILabel *v6;
  void *v7;
  UILabel *v8;
  void *v9;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  UILabel *activityOnOffLabel;
  FCUICAPackageView *v14;
  FCUICAPackageView *activityIconPackageView;
  UIImageView *v16;
  UIImageView *activityIconImageView;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UIButton *v24;
  UIButton *activityIconButton;
  _QWORD v26[4];
  FCActivityDescribing *v27;
  id v28;
  id location;

  v3 = self->_activityDescription;
  if (!self->_activityTitleLabel)
  {
    v4 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    activityTitleLabel = self->_activityTitleLabel;
    self->_activityTitleLabel = v4;

    v6 = self->_activityTitleLabel;
    objc_msgSend(MEMORY[0x24BEBD4B8], "whiteColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6, "setTextColor:", v7);

    v8 = self->_activityTitleLabel;
    -[FCActivityDescribing activityDisplayName](v3, "activityDisplayName");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v8, "setText:", v9);

    v10 = self->_activityTitleLabel;
    -[FCUIFocusEnablementIndicatorSystemApertureElement _customLayoutFont](self, "_customLayoutFont");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v10, "setFont:", v11);

  }
  if (!self->_activityOnOffLabel)
  {
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    activityOnOffLabel = self->_activityOnOffLabel;
    self->_activityOnOffLabel = v12;

    -[UILabel setTextAlignment:](self->_activityOnOffLabel, "setTextAlignment:", 2);
    -[FCUIFocusEnablementIndicatorSystemApertureElement _updateTrailingLabel](self, "_updateTrailingLabel");
  }
  if (!self->_activityIconPackageView)
  {
    +[FCUICAPackageView packageViewForActivity:](FCUICAPackageView, "packageViewForActivity:", v3);
    v14 = (FCUICAPackageView *)objc_claimAutoreleasedReturnValue();
    activityIconPackageView = self->_activityIconPackageView;
    self->_activityIconPackageView = v14;

    -[FCUICAPackageView setUserInteractionEnabled:](self->_activityIconPackageView, "setUserInteractionEnabled:", 0);
    if (!self->_activityIconPackageView && !self->_activityIconImageView)
    {
      v16 = (UIImageView *)objc_alloc_init(MEMORY[0x24BEBD668]);
      activityIconImageView = self->_activityIconImageView;
      self->_activityIconImageView = v16;

      -[UIImageView setContentMode:](self->_activityIconImageView, "setContentMode:", 4);
      -[UIImageView setUserInteractionEnabled:](self->_activityIconImageView, "setUserInteractionEnabled:", 0);
      objc_msgSend(MEMORY[0x24BEBD660], "configurationWithPointSize:", 24.0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v19 = (void *)MEMORY[0x24BEBD640];
      -[FCActivityDescribing activitySymbolImageName](self->_activityDescription, "activitySymbolImageName");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v19, "_systemImageNamed:withConfiguration:", v20, v18);
      v21 = (void *)objc_claimAutoreleasedReturnValue();

      -[UIImageView setImage:](self->_activityIconImageView, "setImage:", v21);
    }
  }
  if (!self->_activityIconButton)
  {
    objc_initWeak(&location, self);
    v22 = (void *)MEMORY[0x24BEBD388];
    v26[0] = MEMORY[0x24BDAC760];
    v26[1] = 3221225472;
    v26[2] = __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke;
    v26[3] = &unk_24D20B080;
    objc_copyWeak(&v28, &location);
    v27 = v3;
    objc_msgSend(v22, "actionWithHandler:", v26);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (UIButton *)objc_alloc_init(MEMORY[0x24BEB0F88]);
    activityIconButton = self->_activityIconButton;
    self->_activityIconButton = v24;

    -[UIButton addAction:forControlEvents:](self->_activityIconButton, "addAction:forControlEvents:", v23, 64);
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);
  }

}

void __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  _BYTE *WeakRetained;
  id v6;
  _BOOL8 v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v3 = a2;
  v4 = (void *)FCUILogSelection;
  if (os_log_type_enabled((os_log_t)FCUILogSelection, OS_LOG_TYPE_DEBUG))
    __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke_cold_1(v4, v3);
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v6 = WeakRetained;
  if (WeakRetained)
  {
    v7 = WeakRetained[96] == 0;
    v8 = (void *)*((_QWORD *)WeakRetained + 2);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(v3, "sender");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "stringWithFormat:", CFSTR("System aperture activity control tapped: %@"), v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setActivity:active:reason:", v9, v7, v12);

    *((_QWORD *)v6 + 16) = 2;
    v13 = objc_loadWeakRetained((id *)v6 + 17);
    objc_msgSend(v13, "preferredLayoutModeDidInvalidateForLayoutSpecifier:", v6);

  }
}

- (id)_enablementText
{
  _BOOL4 activityEnabled;
  void *v3;
  void *v4;
  const __CFString *v5;
  void *v6;

  activityEnabled = self->_activityEnabled;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (activityEnabled)
    v5 = CFSTR("FLANKING_BANNER_ON");
  else
    v5 = CFSTR("FLANKING_BANNER_OFF");
  objc_msgSend(v3, "localizedStringForKey:value:table:", v5, &stru_24D20B520, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_customLayoutFont
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BEBDAB0];
  SBUISystemApertureDefaultContentSizeCategory();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollectionWithPreferredContentSizeCategory:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BEBB520], "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_primaryColor
{
  return (id)objc_msgSend(MEMORY[0x24BEBD4B8], "fcui_colorForActivity:", self->_activityDescription);
}

- (SAAlertHosting)alertHost
{
  return (SAAlertHosting *)objc_loadWeakRetained((id *)&self->_alertHost);
}

- (void)setAlertHost:(id)a3
{
  objc_storeWeak((id *)&self->_alertHost, a3);
}

- (int64_t)layoutMode
{
  return self->_layoutMode;
}

- (int64_t)preferredLayoutMode
{
  return self->_preferredLayoutMode;
}

- (SAUILayoutHosting)layoutHost
{
  return (SAUILayoutHosting *)objc_loadWeakRetained((id *)&self->_layoutHost);
}

- (void)setLayoutHost:(id)a3
{
  objc_storeWeak((id *)&self->_layoutHost, a3);
}

- (FCActivityDescribing)activityDescription
{
  return self->_activityDescription;
}

- (BOOL)isActivityEnabled
{
  return self->_activityEnabled;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activityDescription, 0);
  objc_destroyWeak((id *)&self->_layoutHost);
  objc_storeStrong((id *)&self->_leadingView, 0);
  objc_destroyWeak((id *)&self->_alertHost);
  objc_storeStrong((id *)&self->_pickerTrailingView, 0);
  objc_storeStrong((id *)&self->_activityOnOffLabel, 0);
  objc_storeStrong((id *)&self->_activityTitleLabel, 0);
  objc_storeStrong((id *)&self->_activityIconButton, 0);
  objc_storeStrong((id *)&self->_activityIconPackageView, 0);
  objc_storeStrong((id *)&self->_activityIconImageView, 0);
  objc_storeStrong((id *)&self->_activityManager, 0);
  objc_storeStrong((id *)&self->_onOffTrailingTextProvider, 0);
}

void __85__FCUIFocusEnablementIndicatorSystemApertureElement__configureCustomViewsIfNecessary__block_invoke_cold_1(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  int v5;
  void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v3 = a1;
  objc_msgSend(a2, "sender");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = 138543362;
  v6 = v4;
  _os_log_debug_impl(&dword_214772000, v3, OS_LOG_TYPE_DEBUG, "System aperture activity control tapped: %{public}@", (uint8_t *)&v5, 0xCu);

}

@end

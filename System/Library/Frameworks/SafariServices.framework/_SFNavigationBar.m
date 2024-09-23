@implementation _SFNavigationBar

+ (void)initialize
{
  if ((id)objc_opt_class() == a1 && initializeConstants_once != -1)
    dispatch_once(&initializeConstants_once, &__block_literal_global_9);
}

- (void)setItem:(id)a3
{
  SFNavigationBarItem *v5;
  SFNavigationBarItem **p_item;
  SFNavigationBarItem *item;
  void *v8;
  SFNavigationBarItem *v9;
  void *v10;
  void *v11;
  SFNavigationBarItem *v12;
  SFNavigationBarItem *v13;
  _QWORD v14[5];
  SFNavigationBarItem *v15;
  SFNavigationBarItem *v16;

  v5 = (SFNavigationBarItem *)a3;
  p_item = &self->_item;
  item = self->_item;
  v13 = v5;
  if (item != v5)
  {
    -[SFNavigationBarItem removeObserver:](item, "removeObserver:", self);
    -[SFNavigationBarItem fluidProgressController](*p_item, "fluidProgressController");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unregisterObserver:", self->_progressView);

    v9 = *p_item;
    objc_storeStrong((id *)&self->_item, a3);
    -[SFNavigationBarItem addObserver:](*p_item, "addObserver:", self);
    -[SFNavigationBarItem fluidProgressController](*p_item, "fluidProgressController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "registerObserver:", self->_progressView);

    v11 = (void *)MEMORY[0x1E0DC3F10];
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __28___SFNavigationBar_setItem___block_invoke;
    v14[3] = &unk_1E4ABFC38;
    v14[4] = self;
    v15 = v9;
    v16 = v13;
    v12 = v9;
    objc_msgSend(v11, "performWithoutAnimation:", v14);

  }
}

- (void)_updatePlaceholderText
{
  void *v1;
  id v2;

  if (a1)
  {
    v1 = (void *)a1[114];
    objc_msgSend(a1, "_placeholderText");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "setPlaceholder:", v2);

  }
}

- (void)_updateShowsSearchIndicator
{
  int v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;

  if (a1)
  {
    v2 = objc_msgSend(*(id *)(a1 + 888), "showsSearchIndicator");
    v3 = *(void **)(a1 + 448);
    if (v2)
    {
      objc_msgSend(v3, "setFadeOutEdge:", 1);
      v4 = *(void **)(a1 + 648);
      if (!v4)
      {
        v5 = objc_alloc_init(MEMORY[0x1E0DC3890]);
        v6 = *(void **)(a1 + 648);
        *(_QWORD *)(a1 + 648) = v5;

        objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(*(id *)(a1 + 648), "setImage:", v7);
        objc_msgSend(*(id *)(a1 + 648), "setTintAdjustmentMode:", 1);
        v8 = objc_alloc_init(MEMORY[0x1E0DC3890]);
        v9 = *(void **)(a1 + 656);
        *(_QWORD *)(a1 + 656) = v8;

        objc_msgSend(*(id *)(a1 + 656), "setImage:", v7);
        objc_msgSend(*(id *)(a1 + 656), "setTintAdjustmentMode:", 1);

        v4 = *(void **)(a1 + 648);
      }
      objc_msgSend(v4, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v10)
      {
        objc_msgSend(*(id *)(a1 + 432), "addSubview:", *(_QWORD *)(a1 + 648));
        objc_msgSend(*(id *)(a1 + 664), "addSubview:", *(_QWORD *)(a1 + 656));
        -[_SFNavigationBar _updateSearchIndicator](a1);
      }
    }
    else
    {
      objc_msgSend(v3, "setFadeOutEdge:", 0);
      objc_msgSend(*(id *)(a1 + 648), "removeFromSuperview");
      objc_msgSend(*(id *)(a1 + 656), "removeFromSuperview");
    }
    -[_SFNavigationBar _updateActiveURLLabelAccessory](a1);
    objc_msgSend((id)a1, "setNeedsLayout");
    -[_SFNavigationBar _updateAccessoryButtonsVisibility](a1);
  }
}

- (void)_updateAccessoryButtonsVisibility
{
  _BOOL8 v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  id WeakRetained;
  int v8;
  char v9;
  void *v10;

  if (a1)
  {
    -[_SFNavigationBar _updateAccessoryButtonsArrangement](a1);
    v2 = !objc_msgSend(*(id *)(a1 + 888), "showsStopReloadButtons")
      || *(_BYTE *)(a1 + 883)
      || *(_BYTE *)(a1 + 640) != 0;
    objc_msgSend(*(id *)(a1 + 744), "setHidden:", v2);
    objc_msgSend(*(id *)(a1 + 736), "setHidden:", v2);
    if (*(_BYTE *)(a1 + 883)
      || !-[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(_QWORD *)(a1 + 720), 2)
      || *(_BYTE *)(a1 + 640))
    {
      v3 = 1;
    }
    else
    {
      if (!*(_QWORD *)(a1 + 728))
        -[_SFNavigationBar _setUpFormatToggleButtonIfNeeded](a1);
      v3 = 0;
    }
    v4 = *(void **)(a1 + 728);
    if (v4)
    {
      v5 = objc_msgSend(v4, "isHidden") ^ 1;
      v4 = *(void **)(a1 + 728);
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v4, "setHidden:", v3);
    if (*(_BYTE *)(a1 + 883))
      v6 = 1;
    else
      v6 = -[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(_QWORD *)(a1 + 720), 3) ^ 1;
    objc_msgSend(*(id *)(a1 + 760), "setHidden:", v6);
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 928));
    if (v5)
    {
      v10 = WeakRetained;
      v8 = objc_msgSend(*(id *)(a1 + 728), "isHidden");
      WeakRetained = v10;
      if (v8)
      {
        v9 = objc_opt_respondsToSelector();
        WeakRetained = v10;
        if ((v9 & 1) != 0)
        {
          objc_msgSend(v10, "navigationBarFormatMenuButtonBecameUnavailable:", a1);
          WeakRetained = v10;
        }
      }
    }

  }
}

- (void)_updateMediaStateMuteButton
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char v7;
  id v8;

  if (a1)
  {
    objc_msgSend(a1[111], "mediaStateIcon");
    _SFImageForMediaStateIcon();
    v8 = (id)objc_claimAutoreleasedReturnValue();
    -[_SFNavigationBar _mediaStateMuteButtonColor](a1);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flattenedImageWithColor:", v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "colorWithAlphaComponent:", 0.2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "flattenedImageWithColor:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1[95], "imageForState:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (v3 == 0) ^ (v6 != 0);

    -[_SFNavigationBar _updateAccessoryButtonsVisibility]((uint64_t)a1);
    -[_SFNavigationBar _updateAccessoryButtonsAlpha](a1);
    objc_msgSend(a1[95], "setImage:forState:", v3, 0);
    objc_msgSend(a1[95], "setImage:forState:", v5, 1);
    if ((v7 & 1) == 0)
      -[_SFNavigationBar _adjustLabelRectForLeadingButtonWithDelay:]((uint64_t)a1, 0.0);

  }
}

- (void)_updateNavigationBarTrailingButtonType
{
  uint64_t v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  id v8;

  if (a1)
  {
    -[_SFNavigationBar _updateAccessoryButtonsArrangement](a1);
    v2 = *(_QWORD *)(a1 + 720);
    if (v2)
      v3 = *(void **)(v2 + 16);
    else
      v3 = 0;
    objc_msgSend(v3, "firstObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "integerValue");

    v6 = *(_QWORD *)(a1 + 768);
    if (v6 != v5)
    {
      -[_SFNavigationBar _navigationBarTrailingButtonWithType:]((char *)a1, v6);
      v8 = (id)objc_claimAutoreleasedReturnValue();
      -[_SFNavigationBar _navigationBarTrailingButtonWithType:]((char *)a1, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      *(_QWORD *)(a1 + 768) = v5;
      -[_SFNavigationBar _transitionFromView:toView:animated:]((void *)a1, v8, v7, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"));

    }
  }
}

- (void)_updateTextColor
{
  void *v2;
  uint64_t v3;
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 888), "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    objc_msgSend(*(id *)(a1 + 904), "platterPlaceholderTextColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setTextFieldPlaceHolderColor:", v4);
    objc_msgSend((id)a1, "minimumHeight");
    objc_msgSend((id)a1, "bounds");
    v5 = 0.0;
    if (*(_QWORD *)(a1 + 824) != 1)
      SFBarBackgroundAlphaForSquishTransformFactor();
    objc_msgSend(*(id *)(a1 + 904), "platterTextColorForPlatterAlpha:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)v6;
    if (v3)
      v8 = (void *)v6;
    else
      v8 = v4;
    v12 = v8;
    objc_msgSend(*(id *)(a1 + 448), "setTextColor:", v12);
    objc_msgSend(*(id *)(a1 + 456), "setTextColor:", v12);
    objc_msgSend(*(id *)(a1 + 472), "setTextColor:", v12);
    objc_msgSend(*(id *)(a1 + 912), "setTextColor:", v7);
    if (objc_msgSend(*(id *)(a1 + 904), "tintStyle") == 4)
      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "sf_safariAccentColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 912), "setTintColor:", v9);

    objc_msgSend(*(id *)(a1 + 912), "setOverrideUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 904), "platterTextFieldOverrideUserInterfaceStyle"));
    objc_msgSend(*(id *)(a1 + 912), "setKeyboardAppearance:", objc_msgSend(*(id *)(a1 + 904), "platterKeyboardOverrideAppearance"));
    -[_SFNavigationBar _attributedStringSecurityAnnotation]((id *)a1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 480), "setAttributedText:", v10);

    objc_msgSend(*(id *)(a1 + 904), "annotationTextColor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 464), "setTextColor:", v11);

    objc_msgSend(*(id *)(a1 + 448), "setEffect:", 0);
    objc_msgSend(*(id *)(a1 + 848), "setEffect:", 0);
    objc_msgSend(*(id *)(a1 + 856), "setEffect:", 0);

  }
}

- (void)_updateFormatButtonSelected
{
  uint64_t v2;
  void *v3;

  if (a1)
  {
    if ((objc_msgSend(a1[111], "readerButtonSelected") & 1) != 0
      || (objc_msgSend(a1[111], "showsTranslationIcon") & 1) != 0)
    {
      v2 = 1;
    }
    else
    {
      v2 = objc_msgSend(a1[111], "showsSiriReaderPlayingIcon");
    }
    objc_msgSend(a1[91], "setSelected:", v2);
    -[_SFNavigationBar _formatToggleButtonImage](a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1[91], "setImage:", v3);

    -[_SFNavigationBar _updateNavigationBarTrailingButtonType]((uint64_t)a1);
  }
}

- (void)_updateProgressView
{
  void *v2;
  void *v3;
  void *v4;

  if (a1)
  {
    v2 = *(void **)(a1 + 688);
    objc_msgSend(*(id *)(a1 + 888), "fluidProgressStateSource");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "progressState");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setProgressToCurrentPositionForState:", v4);

    -[_SFNavigationBar _updateProgressViewCornerRadius](a1);
    -[_SFNavigationBar _updateProgressViewFillColor](a1);
  }
}

- (void)_updateFormatButtonAccessories
{
  void *v2;
  id v3;

  if (a1)
  {
    if (objc_msgSend(*(id *)(a1 + 888), "hasHiddenElements"))
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("eye.slash"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 728), "setSecondaryImage:", v2);

      objc_msgSend(MEMORY[0x1E0DC3658], "safari_scribbleThemeColor");
      v3 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 728), "setSecondaryImageColor:", v3);

    }
    else
    {
      objc_msgSend(*(id *)(a1 + 728), "setSecondaryImage:", 0);
    }
  }
}

- (uint64_t)_shouldUpdateBackdropStyleForTransitionFromItem:(void *)a3 toItem:
{
  id v5;
  id v6;
  int v7;

  v5 = a2;
  v6 = a3;
  if (a1)
  {
    if (*(_BYTE *)(a1 + 883))
    {
      a1 = 0;
    }
    else
    {
      v7 = objc_msgSend(v5, "overrideBarStyleForSecurityWarning");
      a1 = v7 ^ objc_msgSend(v6, "overrideBarStyleForSecurityWarning");
    }
  }

  return a1;
}

- (void)_updateEffectiveTheme
{
  uint64_t v2;
  void *v3;
  void *v4;
  char v5;
  id obj;
  id obja;

  if (a1)
  {
    +[_SFBarTheme themeWithTheme:](_SFNavigationBarTheme, "themeWithTheme:", *(_QWORD *)(a1 + 896));
    obj = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 888), "overrideBarStyleForSecurityWarning"))
    {
      objc_msgSend(obj, "fallbackTheme");
      v2 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v2;
    }
    else
    {
      v3 = obj;
    }
    v4 = *(void **)(a1 + 904);
    if (v4 != v3)
    {
      obja = v3;
      v5 = objc_msgSend(v4, "isEqual:", v3);
      v3 = obja;
      if ((v5 & 1) == 0)
      {
        objc_storeStrong((id *)(a1 + 904), obja);
        -[_SFNavigationBar _didUpdateEffectiveTheme](a1);
        v3 = obja;
      }
    }

  }
}

- (void)setUsesNarrowLayout:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  double v6;
  UILabel *expandedURLLabel;
  CGAffineTransform v8;

  if (self->_usesNarrowLayout != a3)
  {
    v3 = a3;
    self->_usesNarrowLayout = a3;
    -[_SFNavigationBar _updateToolbarAndCancelButtonAlpha]((id *)&self->super.super.super.isa);
    -[_SFNavigationBar _editingLabelFont]((uint64_t)self);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = 1.0;
    if (self->_usesNarrowLayout)
      v6 = -[SFNavigationBarMetrics narrowEditingScaleFactor]((uint64_t)self->_barMetrics);
    -[UITextField setFont:](self->_textField, "setFont:", v5);
    -[UILabel setFont:](self->_expandedURLLabel, "setFont:", v5);
    expandedURLLabel = self->_expandedURLLabel;
    CGAffineTransformMakeScale(&v8, 1.0 / v6, 1.0 / v6);
    -[UILabel setTransform:](expandedURLLabel, "setTransform:", &v8);
    if (v3)
      -[UIView addSubview:](self->_controlsContainer, "addSubview:", self->_cancelButton);
    else
      -[UIButton removeFromSuperview](self->_cancelButton, "removeFromSuperview");
    -[_SFNavigationBar _updateText](self, "_updateText");
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");

  }
}

- (id)_updateToolbarAndCancelButtonAlpha
{
  id *v1;
  double v2;
  double v3;
  double v4;

  if (result)
  {
    v1 = result;
    if (!*((_BYTE *)result + 880) || (v2 = 0.0, !*((_BYTE *)result + 883)))
    {
      objc_msgSend(result, "_controlsAlpha");
      v2 = v3;
    }
    objc_msgSend(v1[71], "setAlpha:", v2);
    objc_msgSend(v1[72], "setAlpha:", v2);
    if (*((_BYTE *)v1 + 880))
    {
      v4 = 1.0 - v2;
      if (!*((_BYTE *)v1 + 883))
        v4 = 0.0;
    }
    else
    {
      v4 = 0.0;
    }
    return (id *)objc_msgSend(v1[98], "setAlpha:", v4);
  }
  return result;
}

- (id)_editingLabelFont
{
  int v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = *(unsigned __int8 *)(a1 + 880);
    v2 = *(_QWORD **)(a1 + 632);
    if (v1)
      -[SFNavigationBarMetrics narrowEditingLabelFont](v2);
    else
      -[SFNavigationBarMetrics defaultLabelFont](v2);
    a1 = objc_claimAutoreleasedReturnValue();
  }
  return (id)a1;
}

- (void)setUnifiedFieldShowsProgressView:(BOOL)a3
{
  void *v4;

  if (((!self->_unifiedFieldShowsProgressView ^ a3) & 1) == 0)
  {
    self->_unifiedFieldShowsProgressView = a3;
    -[_SFNavigationBar _updateProgressViewCornerRadius]((uint64_t)self);
    -[_SFNavigationBar _updateProgressViewFillColor]((uint64_t)self);
    if (-[_SFFluidProgressView isShowingProgress](self->_progressView, "isShowingProgress"))
    {
      -[_SFNavigationBar _viewToInsertProgressBarIn](self);
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addSubview:", self->_progressView);

    }
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (uint64_t)_updateProgressViewCornerRadius
{
  uint64_t v1;
  double v2;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 881))
      v2 = -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(result + 632));
    else
      v2 = 0.0;
    return objc_msgSend(*(id *)(v1 + 688), "setCornerRadius:", v2);
  }
  return result;
}

- (void)_updateProgressViewFillColor
{
  int v2;
  void *v3;
  id v4;

  if (a1)
  {
    v2 = *(unsigned __int8 *)(a1 + 881);
    v3 = *(void **)(a1 + 904);
    if (v2)
      objc_msgSend(v3, "platterProgressBarTintColor");
    else
      objc_msgSend(v3, "progressBarTintColor");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 688), "setProgressBarFillColor:", v4);

  }
}

- (_QWORD)_viewToInsertProgressBarIn
{
  if (a1)
  {
    if (*((_BYTE *)a1 + 881))
      a1 = (_QWORD *)a1[85];
    a1 = a1;
  }
  return a1;
}

- (void)setDismissButtonStyle:(int64_t)a3 animated:(BOOL)a4
{
  _BOOL4 v4;
  void *v7;
  _QWORD v8[6];

  v4 = a4;
  if (-[SFDismissButton style]((uint64_t)self->_dismissButton) != a3)
  {
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __51___SFNavigationBar_setDismissButtonStyle_animated___block_invoke;
    v8[3] = &unk_1E4ABFBC0;
    v8[4] = self;
    v8[5] = a3;
    v7 = (void *)MEMORY[0x1A8598C40](v8);
    if (v4)
    {
      -[_SFNavigationBar layoutIfNeeded](self, "layoutIfNeeded");
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, 0);
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v7);
    }

  }
}

- (void)setDismissButtonHidden:(BOOL)a3
{
  -[SFDismissButton setHidden:](self->_dismissButton, "setHidden:", a3);
}

- (CGSize)dismissButtonSize
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGSize result;

  -[SFDismissButton bounds](self->_dismissButton, "bounds");
  v3 = v2;
  v5 = v4;
  result.height = v5;
  result.width = v3;
  return result;
}

- (void)_customButtonHorizontalPadding
{
  void *v2;

  if (a1 && a1[103] == 1)
  {
    if (objc_msgSend(a1, "hasToolbar"))
    {
      objc_msgSend(a1, "traitCollection");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v2, "horizontalSizeClass");
      objc_msgSend(a1, "safeAreaInsets");

    }
  }
}

- (void)setTheme:(id)a3
{
  _SFBarTheme *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  _SFBarTheme *theme;
  BOOL v9;
  _SFBarTheme *obj;

  v4 = (_SFBarTheme *)a3;
  if (!v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v6, "userInterfaceStyle") == 2)
      v7 = 2;
    else
      v7 = 1;

    objc_msgSend(MEMORY[0x1E0D4EF20], "themeWithBarTintStyle:", v7);
    v4 = (_SFBarTheme *)objc_claimAutoreleasedReturnValue();
  }
  theme = self->_theme;
  if (theme != v4)
  {
    obj = v4;
    v9 = -[_SFBarTheme isEqual:](theme, "isEqual:", v4);
    v4 = obj;
    if (!v9)
    {
      objc_storeStrong((id *)&self->_theme, obj);
      -[_SFNavigationBar _updateEffectiveTheme]((uint64_t)self);
      v4 = obj;
    }
  }

}

- (void)_didUpdateEffectiveTheme
{
  void *v2;
  int v3;
  uint64_t v4;
  id v5;

  if (a1 && *(_QWORD *)(a1 + 680))
  {
    objc_msgSend(*(id *)(a1 + 904), "controlsTintColor");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend((id)a1, "setTintColor:", v2);

    v3 = objc_msgSend(*(id *)(a1 + 904), "backdropIsDark");
    if (v3)
      v4 = 2;
    else
      v4 = 1;
    objc_msgSend((id)a1, "_accessibilitySetInterfaceStyleIntent:", v4);
    objc_msgSend(*(id *)(a1 + 904), "URLAccessoryButtonTintColorForInputMode:", *(_QWORD *)(a1 + 824));
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 728), "setGlyphTintColor:", v5);
    objc_msgSend(*(id *)(a1 + 728), "setUsesInsetFromBackground:", v3 ^ objc_msgSend(*(id *)(a1 + 904), "platterBackdropIsDark"));
    -[_SFNavigationBarURLButton setTheme:](*(_QWORD *)(a1 + 680), *(void **)(a1 + 904));
    objc_msgSend(*(id *)(a1 + 736), "setTintColor:", v5);
    objc_msgSend(*(id *)(a1 + 744), "setTintColor:", v5);
    -[_SFNavigationBar _updateSeparatorAlpha](a1);
    -[_SFNavigationBar _updateTextColor](a1);
    objc_msgSend((id)a1, "_setOverrideUserInterfaceStyle:", objc_msgSend(*(id *)(a1 + 904), "overrideUserInterfaceStyle"));
    objc_msgSend(*(id *)(a1 + 904), "tintStyle");
    objc_msgSend(*(id *)(a1 + 464), "setHidden:", _SFIsPrivateTintStyle() ^ 1);
    objc_msgSend(*(id *)(a1 + 904), "applyBackdropEffectsToView:", *(_QWORD *)(a1 + 696));
    objc_msgSend(*(id *)(a1 + 568), "setTheme:", *(_QWORD *)(a1 + 904));
    objc_msgSend(*(id *)(a1 + 576), "setTheme:", *(_QWORD *)(a1 + 904));

  }
}

- (uint64_t)_updateSeparatorAlpha
{
  uint64_t v1;
  double v2;
  int v3;

  if (result)
  {
    v1 = result;
    v2 = 0.0;
    if (!*(_BYTE *)(result + 882))
    {
      v3 = objc_msgSend(*(id *)(result + 904), "backdropIsDark", 0.0);
      v2 = 1.0;
      if (v3)
      {
        LOBYTE(v2) = *(_BYTE *)(v1 + 886);
        v2 = (double)*(unint64_t *)&v2;
      }
    }
    return objc_msgSend(*(id *)(v1 + 704), "setAlpha:", v2);
  }
  return result;
}

+ (int64_t)_metricsCategory
{
  return 0;
}

+ (double)estimatedDefaultHeightForStatusBarHeight:(double)a3
{
  void *v5;
  double v6;

  estimatedBarMetrics();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarMetrics updateForStatusBarHeight:]((uint64_t)v5, a3);
  v6 = -[SFNavigationBarMetrics barHeightWithBarMetricsCategory:]((uint64_t)v5, objc_msgSend(a1, "_metricsCategory"));

  return v6;
}

+ (double)estimatedMinimumHeightForStatusBarHeight:(double)a3
{
  void *v4;
  double v5;

  estimatedBarMetrics();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarMetrics updateForStatusBarHeight:]((uint64_t)v4, a3);
  v5 = -[SFNavigationBarMetrics minimumBarHeight]((uint64_t)v4);

  return v5;
}

- (double)_defaultHeightExcludingAuxiliaryBar
{
  uint64_t v1;
  uint64_t v2;

  if (!a1)
    return 0.0;
  v1 = *(_QWORD *)(a1 + 632);
  v2 = objc_msgSend((id)objc_opt_class(), "_metricsCategory");
  return -[SFNavigationBarMetrics barHeightWithBarMetricsCategory:](v1, v2);
}

- (double)defaultHeight
{
  double v3;
  double v4;
  double v5;

  v3 = -[_SFNavigationBar _defaultHeightExcludingAuxiliaryBar]((uint64_t)self);
  if (self)
  {
    -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
    if (v4 != 0.0)
    {
      -[SFNavigationBarMetrics urlOutlineHeight]((uint64_t)self->_barMetrics);
      -[_SFNavigationBar _urlOutlineOriginY]((uint64_t)self);
      -[SFLockdownStatusBar titleCapHeightInsetFromTop](self->_lockdownStatusBar, "titleCapHeightInsetFromTop");
      -[SFLockdownStatusBar titleBaselineInsetFromBottom](self->_lockdownStatusBar, "titleBaselineInsetFromBottom");
      -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom]((uint64_t)self->_barMetrics);
      _SFRoundFloatToPixels();
      return v3 + v5;
    }
  }
  return v3;
}

- (double)_urlOutlineOriginY
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;

  if (!a1)
    return 0.0;
  v2 = -[_SFNavigationBar _layoutBounds](a1);
  v4 = v3;
  objc_msgSend((id)a1, "bounds", v2);
  v6 = v5;
  objc_msgSend(*(id *)(a1 + 448), "urlSize");
  _SFRoundFloatToPixels();
  v8 = fmax(v6, v4) + v7 + -[SFNavigationBarMetrics urlLabelVerticalOffset](*(_QWORD *)(a1 + 632));
  return v8 - -[SFNavigationBarMetrics urlContainerTop](*(_QWORD *)(a1 + 632));
}

- (double)minimumHeight
{
  double v3;
  double v4;
  double result;

  v3 = -[SFNavigationBarMetrics minimumBarHeight]((uint64_t)self->_barMetrics);
  -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
  if (v4 == 0.0)
    return v3;
  -[_SFNavigationBar _auxiliaryBarSquishedVerticalOffsetForSquishTransform:]((uint64_t)self);
  -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
  -[SFLockdownStatusBar preferredSize](self->_lockdownStatusBar, "preferredSize");
  -[SFLockdownStatusBar titleBaselineInsetFromBottom](self->_lockdownStatusBar, "titleBaselineInsetFromBottom");
  -[SFLockdownStatusBar titleBaselineInsetFromBottom](self->_lockdownStatusBar, "titleBaselineInsetFromBottom");
  -[_SFNavigationBar defaultHeight](self, "defaultHeight");
  _SFRoundFloatToPixels();
  return result;
}

- (double)_auxiliaryBarSquishedVerticalOffsetForSquishTransform:(uint64_t)a1
{
  uint64_t v2;
  uint64_t v3;
  double result;

  if (!a1)
    return 0.0;
  -[SFNavigationBarMetrics urlOutlineHeight](*(_QWORD *)(a1 + 632));
  -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom](*(_QWORD *)(a1 + 632));
  v2 = *(_QWORD *)(a1 + 632);
  v3 = objc_msgSend((id)objc_opt_class(), "_metricsCategory");
  -[SFNavigationBarMetrics squishHeightQuantizationOffsetWithBarMetricsCategory:](v2, v3);
  objc_msgSend(*(id *)(a1 + 976), "titleCapHeightInsetFromTop");
  objc_msgSend(*(id *)(a1 + 976), "titleCapHeightInsetFromTop");
  _SFRoundFloatToPixels();
  return result;
}

- (double)visualHeight
{
  double v2;

  -[_SFNavigationBar bounds](self, "bounds");
  return fmax(v2, 0.0);
}

- (id)_dimmingButtonWithAction:(uint64_t *)val
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id location;

  if (val)
  {
    objc_initWeak(&location, val);
    -[SFNavigationBarMetrics urlOutlineHeight](val[79]);
    _SFRoundRectToPixels();
    v8 = v4;
    v9 = v5;
    v10 = v6;
    v11 = v7;
    if (val[103] == 1)
    {
      objc_msgSend(MEMORY[0x1E0D4EF48], "buttonWithType:", 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "setFrame:", v8, v9, v10, v11);
    }
    else
    {
      v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EF48]), "initWithFrame:", v4, v5, v6, v7);
    }
    objc_msgSend(v12, "setNormalImageAlpha:", 1.0);
    objc_msgSend(v12, "setHighlightedImageAlpha:", 0.2);
    objc_msgSend(v12, "setHighlightAnimationDuration:", 0.5);
    objc_msgSend(v12, "setAdjustsImageWhenHighlighted:", 0);
    objc_msgSend(v12, "setAdjustsImageWhenDisabled:", 0);
    objc_msgSend(v12, "setExclusiveTouch:", 1);
    objc_msgSend(v12, "addTarget:action:forControlEvents:", val, a2, 64);
    v14[0] = MEMORY[0x1E0C809B0];
    v14[1] = 3221225472;
    v14[2] = __45___SFNavigationBar__dimmingButtonWithAction___block_invoke;
    v14[3] = &unk_1E4AC14C8;
    objc_copyWeak(&v15, &location);
    objc_msgSend(v12, "setPointerStyleProvider:", v14);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
  else
  {
    v12 = 0;
  }
  return v12;
}

- (void)setHasToolbar:(BOOL)a3
{
  _BOOL4 v3;
  _SFToolbar *v5;
  _SFToolbar *leadingToolbar;
  SFToolbarContainer *v7;
  SFToolbarContainer *leadingToolbarContainer;
  _SFToolbar *v9;
  _SFToolbar *trailingToolbar;
  SFToolbarContainer *v11;
  SFToolbarContainer *trailingToolbarContainer;
  void *WeakRetained;
  _SFToolbar *v14;
  SFToolbarContainer *v15;
  _SFToolbar *v16;

  v3 = a3;
  if (-[_SFNavigationBar hasToolbar](self, "hasToolbar") != a3)
  {
    if (v3)
    {
      v5 = -[_SFToolbar initWithPlacement:]([_SFToolbar alloc], "initWithPlacement:", 0);
      leadingToolbar = self->_leadingToolbar;
      self->_leadingToolbar = v5;

      -[_SFToolbar setSuperviewOwningLayout:](self->_leadingToolbar, "setSuperviewOwningLayout:", self);
      -[_SFToolbar setTheme:](self->_leadingToolbar, "setTheme:", self->_effectiveTheme);
      v7 = (SFToolbarContainer *)-[SFToolbarContainer initWithToolbar:]([SFToolbarContainer alloc], self->_leadingToolbar);
      leadingToolbarContainer = self->_leadingToolbarContainer;
      self->_leadingToolbarContainer = v7;

      -[SFToolbarContainer setMinimumWidth:]((uint64_t)self->_leadingToolbarContainer, 9.5);
      -[SFToolbarContainer _setTouchInsets:](self->_leadingToolbarContainer, "_setTouchInsets:", -20.0, 0.0, -20.0, 0.0);
      -[UIView addSubview:](self->_controlsContainer, "addSubview:", self->_leadingToolbarContainer);
      v9 = -[_SFToolbar initWithPlacement:]([_SFToolbar alloc], "initWithPlacement:", 0);
      trailingToolbar = self->_trailingToolbar;
      self->_trailingToolbar = v9;

      -[_SFToolbar setSuperviewOwningLayout:](self->_trailingToolbar, "setSuperviewOwningLayout:", self);
      -[_SFToolbar setTheme:](self->_trailingToolbar, "setTheme:", self->_effectiveTheme);
      v11 = (SFToolbarContainer *)-[SFToolbarContainer initWithToolbar:]([SFToolbarContainer alloc], self->_trailingToolbar);
      trailingToolbarContainer = self->_trailingToolbarContainer;
      self->_trailingToolbarContainer = v11;

      -[SFToolbarContainer setMinimumWidth:]((uint64_t)self->_trailingToolbarContainer, 9.5);
      -[SFToolbarContainer _setTouchInsets:](self->_trailingToolbarContainer, "_setTouchInsets:", -20.0, 0.0, -20.0, 0.0);
      -[UIView addSubview:](self->_controlsContainer, "addSubview:", self->_trailingToolbarContainer);
      WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
      if ((objc_opt_respondsToSelector() & 1) != 0)
        objc_msgSend(WeakRetained, "navigationBar:didCreateLeadingToolbar:trailingToolbar:", self, self->_leadingToolbar, self->_trailingToolbar);
    }
    else
    {
      -[_SFToolbar removeFromSuperview](self->_leadingToolbar, "removeFromSuperview");
      v14 = self->_leadingToolbar;
      self->_leadingToolbar = 0;

      -[SFToolbarContainer removeFromSuperview](self->_leadingToolbarContainer, "removeFromSuperview");
      v15 = self->_leadingToolbarContainer;
      self->_leadingToolbarContainer = 0;

      -[_SFToolbar removeFromSuperview](self->_trailingToolbar, "removeFromSuperview");
      v16 = self->_trailingToolbar;
      self->_trailingToolbar = 0;

      -[SFToolbarContainer removeFromSuperview](self->_trailingToolbarContainer, "removeFromSuperview");
      WeakRetained = self->_trailingToolbarContainer;
      self->_trailingToolbarContainer = 0;
    }

    if (self->_inputMode == 1)
      -[_SFNavigationBar _updateAccessoryButtonsArrangement]((uint64_t)self);
  }
}

- (void)_updateAccessoryButtonsArrangement
{
  id WeakRetained;
  char v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD *v7;
  void *v8;
  id v9;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 888), "showsPageFormatButton"))
    {
      WeakRetained = objc_loadWeakRetained((id *)(a1 + 928));
      v3 = objc_opt_respondsToSelector();

      if ((v3 & 1) != 0)
        objc_msgSend(v9, "addObject:", &unk_1E4B258D0);
    }
    if (objc_msgSend(*(id *)(a1 + 888), "mediaStateIcon"))
      objc_msgSend(v9, "addObject:", &unk_1E4B258E8);
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", 2);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(*(id *)(a1 + 888), "stopReloadButtonShowsStop"))
      v5 = &unk_1E4B25900;
    else
      v5 = &unk_1E4B25918;
    objc_msgSend(v4, "addObject:", v5);
    if (*(_QWORD *)(a1 + 824) == 1 && (objc_msgSend((id)a1, "hasToolbar") & 1) == 0)
    {
      if (objc_msgSend(v9, "count"))
      {
        objc_msgSend(v9, "lastObject");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v6);

        objc_msgSend(v9, "removeLastObject");
      }
    }
    v7 = -[SFNavigationBarAccessoryButtonArrangement initWithLeadingButtonTypes:trailingButtonTypes:]([SFNavigationBarAccessoryButtonArrangement alloc], v9, v4);
    v8 = *(void **)(a1 + 720);
    *(_QWORD *)(a1 + 720) = v7;

  }
}

- (BOOL)hasToolbar
{
  return self->_leadingToolbar != 0;
}

- (void)_updateFonts
{
  void *v2;
  void *v3;
  id v4;

  if (a1)
  {
    -[_SFNavigationBar _editingLabelFont](a1);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarMetrics defaultLabelFont](*(_QWORD **)(a1 + 632));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    -[_SFNavigationBar _URLLabelFont]((_QWORD *)a1);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 912), "setFont:", v4);
    objc_msgSend(*(id *)(a1 + 456), "setFont:", v4);
    objc_msgSend(*(id *)(a1 + 448), "setFont:", v3);
    objc_msgSend(*(id *)(a1 + 464), "setFont:", v3);
    objc_msgSend(*(id *)(a1 + 464), "sizeToFit");
    objc_msgSend(*(id *)(a1 + 472), "setFont:", v2);
    objc_msgSend(*(id *)(a1 + 480), "setFont:", v2);
    -[_SFNavigationBar _updateTextMetrics](a1);
    objc_msgSend(*(id *)(a1 + 472), "sizeToFit");

  }
}

- (_QWORD)_URLLabelFont
{
  uint64_t v1;
  _QWORD *v2;

  if (a1)
  {
    v1 = a1[103];
    v2 = (_QWORD *)a1[79];
    if (v1 == 1)
      -[SFNavigationBarMetrics defaultBoldFont](v2);
    else
      -[SFNavigationBarMetrics defaultLabelFont](v2);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (uint64_t)_updateTextMetrics
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 456), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v3 = v2;
    *(_QWORD *)(v1 + 488) = v4;
    result = _SFEqualWithEpsilon();
    if ((result & 1) == 0)
      *(_QWORD *)(v1 + 496) = v3;
  }
  return result;
}

- (uint64_t)_updateButtonMetrics
{
  uint64_t v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  uint64_t v16;

  if (result)
  {
    v1 = result;
    v2 = *(void **)(result + 744);
    -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(_QWORD **)(result + 632));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setPreferredSymbolConfiguration:forImageInState:", v3, 0);

    v4 = *(void **)(v1 + 736);
    -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(_QWORD **)(v1 + 632));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setPreferredSymbolConfiguration:forImageInState:", v5, 0);

    -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(_QWORD **)(v1 + 632));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 728), "setPreferredSymbolConfiguration:", v6);

    -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*(_QWORD *)(v1 + 632));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFDismissButton setPreferredTraitCollection:](*(id **)(v1 + 816), v7);

    v8 = (void *)MEMORY[0x1E0DC37E8];
    objc_msgSend(MEMORY[0x1E0DC37F8], "defaultMetrics");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC37E8], "labelFontSize");
    v11 = v10;
    -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*(_QWORD *)(v1 + 632));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "scaledValueForValue:compatibleWithTraitCollection:", v12, v11);
    objc_msgSend(v8, "systemFontOfSize:", round(v13));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v1 + 784), "titleLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setFont:", v14);

    result = objc_msgSend(*(id *)(v1 + 784), "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    *(_QWORD *)(v1 + 792) = v16;
  }
  return result;
}

- (uint64_t)_updateURLOutlineCornerRadius
{
  uint64_t v1;
  double v2;
  uint64_t v3;

  if (result)
  {
    v1 = result;
    v2 = -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(result + 632));
    v3 = *(_QWORD *)(v1 + 680);
    if (v3)
    {
      if (*(double *)(v3 + 840) != v2)
      {
        *(double *)(v3 + 840) = v2;
        objc_msgSend(*(id *)(v3 + 776), "_setContinuousCornerRadius:");
      }
    }
    objc_msgSend(*(id *)(v1 + 680), "_setContinuousCornerRadius:", -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(v1 + 632)));
    return -[_SFNavigationBar _updateProgressViewCornerRadius](v1);
  }
  return result;
}

- (void)_barMetricTraitsDidChange
{
  id v3;

  -[_SFNavigationBar traitCollection](self, "traitCollection");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  if (-[SFNavigationBarMetrics updateForTraitCollection:]((uint64_t)self->_barMetrics, v3))
    -[_SFNavigationBar _barMetricsDidChange]((uint64_t)self);

}

- (void)_barMetricsDidChange
{
  id WeakRetained;
  id v3;

  if (a1)
  {
    *(_OWORD *)(a1 + 600) = *MEMORY[0x1E0C9D820];
    -[_SFNavigationBar _updateURLOutlineCornerRadius](a1);
    -[_SFNavigationBar _updateFonts](a1);
    objc_msgSend((id)a1, "_updateText");
    -[_SFNavigationBar _updateActiveURLLabelAccessory](a1);
    -[_SFNavigationBar _updateControlTints](a1);
    -[_SFNavigationBar _updateButtonMetrics](a1);
    objc_msgSend(*(id *)(a1 + 728), "setResizableBackgroundCornerRadius:", -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(a1 + 632)));
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 928));
    *(_BYTE *)(a1 + 887) = 1;
    v3 = WeakRetained;
    if ((objc_opt_respondsToSelector() & 1) != 0)
      objc_msgSend(v3, "navigationBarMetricsDidChange:", a1);
    *(_BYTE *)(a1 + 887) = 0;

  }
}

- (void)_updateActiveURLLabelAccessory
{
  _SFURLLabelAccessoryItem *v2;
  _SFURLLabelAccessoryItem *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  _SFURLLabelAccessoryItem *v13;
  uint64_t v14;
  void *v15;
  _SFURLLabelAccessoryItem *v16;
  _SFURLLabelAccessoryItem *v17;
  _SFURLLabelAccessoryItem *v18;
  _QWORD v19[3];

  v19[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v2 = objc_alloc_init(_SFURLLabelAccessoryItem);
    -[_SFURLLabelAccessoryItem setView:](v2, "setView:", *(_QWORD *)(a1 + 648));
    -[_SFURLLabelAccessoryItem setSpacing:](v2, "setSpacing:", 4.0);
    -[_SFURLLabelAccessoryItem setSquishedView:](v2, "setSquishedView:", *(_QWORD *)(a1 + 656));
    v3 = objc_alloc_init(_SFURLLabelAccessoryItem);
    -[_SFURLLabelAccessoryItem setView:](v3, "setView:", *(_QWORD *)(a1 + 872));
    -[_SFURLLabelAccessoryItem setSquishedView:](v3, "setSquishedView:", *(_QWORD *)(a1 + 864));
    -[_SFURLLabelAccessoryItem setEffectView:](v3, "setEffectView:", *(_QWORD *)(a1 + 848));
    -[_SFURLLabelAccessoryItem setSquishedEffectView:](v3, "setSquishedEffectView:", *(_QWORD *)(a1 + 856));
    -[_SFURLLabelAccessoryItem setSpacing:](v3, "setSpacing:", 4.0);
    if (objc_msgSend(*(id *)(a1 + 888), "showsLockIcon")
      && objc_msgSend(*(id *)(a1 + 888), "showsSearchIndicator"))
    {
      v19[0] = v2;
      v19[1] = v3;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 2);
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(void **)(a1 + 672);
      *(_QWORD *)(a1 + 672) = v4;

      objc_msgSend(*(id *)(a1 + 872), "setHidden:", 0);
      v6 = *(void **)(a1 + 648);
      v7 = 0;
    }
    else
    {
      if (objc_msgSend(*(id *)(a1 + 888), "showsLockIcon"))
      {
        v18 = v3;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v18, 1);
        v8 = objc_claimAutoreleasedReturnValue();
        v9 = *(void **)(a1 + 672);
        *(_QWORD *)(a1 + 672) = v8;

        objc_msgSend(*(id *)(a1 + 872), "setHidden:", 0);
        v10 = 648;
      }
      else
      {
        if (!objc_msgSend(*(id *)(a1 + 888), "showsSearchIndicator"))
        {
          v13 = objc_alloc_init(_SFURLLabelAccessoryItem);
          -[_SFURLLabelAccessoryItem setView:](v13, "setView:", 0);
          -[_SFURLLabelAccessoryItem setSpacing:](v13, "setSpacing:", 0.0);
          v16 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v16, 1);
          v14 = objc_claimAutoreleasedReturnValue();
          v15 = *(void **)(a1 + 672);
          *(_QWORD *)(a1 + 672) = v14;

          objc_msgSend(*(id *)(a1 + 648), "setHidden:", 1);
          objc_msgSend(*(id *)(a1 + 872), "setHidden:", 1);

          goto LABEL_11;
        }
        v17 = v2;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v17, 1);
        v11 = objc_claimAutoreleasedReturnValue();
        v12 = *(void **)(a1 + 672);
        *(_QWORD *)(a1 + 672) = v11;

        objc_msgSend(*(id *)(a1 + 648), "setHidden:", 0);
        v10 = 872;
      }
      v6 = *(void **)(a1 + v10);
      v7 = 1;
    }
    objc_msgSend(v6, "setHidden:", v7);
LABEL_11:

  }
}

- (uint64_t)_updateControlTints
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    -[_SFNavigationBar _updateTextColor](result);
    -[_SFNavigationBar _updateSearchIndicator](v1);
    result = objc_msgSend(*(id *)(v1 + 888), "showsLockIcon");
    if ((_DWORD)result)
    {
      *(_BYTE *)(v1 + 841) = 1;
      return -[_SFNavigationBar _updateLockViewIfNeeded](v1);
    }
  }
  return result;
}

- (_SFNavigationBar)initWithFrame:(CGRect)a3 inputMode:(unint64_t)a4
{
  _SFNavigationBar *v5;
  uint64_t v6;
  SFNavigationBarMetrics *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  void *v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  void *v26;
  _SFNavigationBarLabelsContainer *v27;
  void *v28;
  _SFNavigationBarURLButton *v29;
  void *v30;
  double v31;
  uint64_t v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  void *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  id v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  uint64_t v70;
  void *v71;
  double v72;
  double v73;
  double v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  double v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  SFDismissButton *v87;
  void *v88;
  uint64_t v89;
  void *v90;
  id v91;
  id v92;
  void *v94;
  objc_super v95;

  v95.receiver = self;
  v95.super_class = (Class)_SFNavigationBar;
  v5 = -[_SFNavigationBar initWithFrame:](&v95, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = (uint64_t)v5;
  if (v5)
  {
    v5->_inputMode = a4;
    v7 = objc_alloc_init(SFNavigationBarMetrics);
    v8 = *(void **)(v6 + 632);
    *(_QWORD *)(v6 + 632) = v7;

    objc_msgSend((id)v6, "setTheme:", 0);
    objc_msgSend((id)v6, "layer");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAllowsGroupOpacity:", 0);
    objc_msgSend(v9, "setAllowsGroupBlending:", 0);
    objc_msgSend((id)v6, "setAutoresizingMask:", 2);
    v10 = objc_alloc_init(MEMORY[0x1E0DC3F58]);
    v11 = *(void **)(v6 + 696);
    *(_QWORD *)(v6 + 696) = v10;

    v12 = 0;
    if (!*(_BYTE *)(v6 + 884))
      v12 = *(_QWORD *)(v6 + 920);
    objc_msgSend(*(id *)(v6 + 696), "_setGroupName:", v12);
    objc_msgSend(*(id *)(v6 + 696), "setAutoresizingMask:", 0);
    objc_msgSend((id)v6, "addSubview:", *(_QWORD *)(v6 + 696));
    v13 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v14 = *(void **)(v6 + 704);
    *(_QWORD *)(v6 + 704) = v13;

    objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 704), "setBackgroundColor:", v15);

    objc_msgSend((id)v6, "addSubview:", *(_QWORD *)(v6 + 704));
    v16 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v17 = *(void **)(v6 + 424);
    *(_QWORD *)(v6 + 424) = v16;

    objc_msgSend((id)v6, "addSubview:", *(_QWORD *)(v6 + 424));
    objc_msgSend(*(id *)(v6 + 424), "layer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setAllowsGroupOpacity:", 0);

    v19 = objc_alloc(MEMORY[0x1E0DC3F10]);
    v20 = objc_msgSend(v19, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    v21 = *(void **)(v6 + 512);
    *(_QWORD *)(v6 + 512) = v20;

    v22 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v23 = *(void **)(v6 + 520);
    *(_QWORD *)(v6 + 520) = v22;

    objc_msgSend(*(id *)(v6 + 520), "setClipsToBounds:", 1);
    objc_msgSend(*(id *)(v6 + 520), "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setAllowsGroupBlending:", 0);

    objc_msgSend(*(id *)(v6 + 520), "addSubview:", *(_QWORD *)(v6 + 512));
    v25 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v26 = *(void **)(v6 + 440);
    *(_QWORD *)(v6 + 440) = v25;

    objc_msgSend(*(id *)(v6 + 512), "addSubview:", *(_QWORD *)(v6 + 440));
    v27 = objc_alloc_init(_SFNavigationBarLabelsContainer);
    v28 = *(void **)(v6 + 432);
    *(_QWORD *)(v6 + 432) = v27;

    objc_msgSend(*(id *)(v6 + 440), "addSubview:", *(_QWORD *)(v6 + 432));
    v29 = objc_alloc_init(_SFNavigationBarURLButton);
    v30 = *(void **)(v6 + 680);
    *(_QWORD *)(v6 + 680) = v29;

    v31 = -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(v6 + 632));
    v32 = *(_QWORD *)(v6 + 680);
    if (v32
      && (*(double *)(v32 + 840) == v31
       || (*(double *)(v32 + 840) = v31,
           objc_msgSend(*(id *)(v32 + 776), "_setContinuousCornerRadius:"),
           (v32 = *(_QWORD *)(v6 + 680)) != 0)))
    {
      objc_storeWeak((id *)(v32 + 832), (id)v6);
      v33 = *(void **)(v6 + 680);
    }
    else
    {
      v33 = 0;
    }
    objc_msgSend(v33, "layer");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setAnchorPoint:", 0.5, 0.0);

    objc_msgSend(*(id *)(v6 + 680), "addTarget:action:forControlEvents:", v6, sel__URLTapped_, 64);
    objc_msgSend(*(id *)(v6 + 680), "setAdjustsImageWhenHighlighted:", a4 == 0);
    objc_msgSend(*(id *)(v6 + 680), "_setContinuousCornerRadius:", -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(v6 + 632)));
    objc_msgSend(*(id *)(v6 + 424), "addSubview:", *(_QWORD *)(v6 + 680));
    v35 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(*(id *)(v6 + 424), "bounds");
    v36 = objc_msgSend(v35, "initWithFrame:");
    v37 = *(void **)(v6 + 664);
    *(_QWORD *)(v6 + 664) = v36;

    objc_msgSend(*(id *)(v6 + 664), "setAutoresizingMask:", 18);
    objc_msgSend(*(id *)(v6 + 424), "addSubview:", *(_QWORD *)(v6 + 664));
    v38 = objc_msgSend((id)v6, "newTextField");
    v39 = *(void **)(v6 + 912);
    *(_QWORD *)(v6 + 912) = v38;

    objc_msgSend(*(id *)(v6 + 912), "setSmartDashesType:", 1);
    objc_msgSend(*(id *)(v6 + 912), "setSmartQuotesType:", 1);
    objc_msgSend(*(id *)(v6 + 912), "setAutocapitalizationType:", 0);
    objc_msgSend(*(id *)(v6 + 912), "setAutocorrectionType:", 1);
    objc_msgSend(*(id *)(v6 + 912), "setKeyboardType:", 10);
    objc_msgSend(*(id *)(v6 + 912), "setClearButtonMode:", 3);
    objc_msgSend(*(id *)(v6 + 912), "setTintAdjustmentMode:", 1);
    objc_msgSend(*(id *)(v6 + 912), "setSemanticContentAttribute:", 3);
    objc_msgSend((id)v6, "_placeholderText");
    v40 = objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 912), "setPlaceholder:", v40);
    v41 = objc_alloc_init(MEMORY[0x1E0D4EE98]);
    v42 = *(void **)(v6 + 448);
    *(_QWORD *)(v6 + 448) = v41;

    v94 = (void *)v40;
    objc_msgSend(*(id *)(v6 + 448), "setText:", v40);
    _SFBackdropGroupNameForOwner();
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 448), "_setGroupName:", v43);

    objc_msgSend(*(id *)(v6 + 432), "addSubview:", *(_QWORD *)(v6 + 448));
    v44 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v45 = *(void **)(v6 + 480);
    *(_QWORD *)(v6 + 480) = v44;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 480), "setBackgroundColor:", v46);

    objc_msgSend(*(id *)(v6 + 480), "setTextAlignment:", 0);
    -[_SFNavigationBar _attributedStringSecurityAnnotation]((id *)v6);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 480), "setAttributedText:", v47);

    objc_msgSend(*(id *)(v6 + 480), "setContentMode:", 9);
    objc_msgSend(*(id *)(v6 + 480), "setAlpha:", 0.0);
    v48 = objc_alloc_init(MEMORY[0x1E0DC3F10]);
    v49 = *(void **)(v6 + 616);
    *(_QWORD *)(v6 + 616) = v48;

    objc_msgSend(*(id *)(v6 + 616), "setClipsToBounds:", 1);
    objc_msgSend(*(id *)(v6 + 432), "addSubview:", *(_QWORD *)(v6 + 616));
    objc_msgSend(*(id *)(v6 + 616), "addSubview:", *(_QWORD *)(v6 + 480));
    v50 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v51 = *(void **)(v6 + 464);
    *(_QWORD *)(v6 + 464) = v50;

    _WBSLocalizedString();
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 464), "setText:", v52);

    objc_msgSend(*(id *)(v6 + 464), "setHidden:", 1);
    objc_msgSend(*(id *)(v6 + 432), "addSubview:", *(_QWORD *)(v6 + 464));
    v53 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v54 = *(void **)(v6 + 456);
    *(_QWORD *)(v6 + 456) = v53;

    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 456), "setBackgroundColor:", v55);

    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 456), "setTextColor:", v56);

    objc_msgSend(*(id *)(v6 + 456), "setTextAlignment:", 0);
    objc_msgSend(*(id *)(v6 + 456), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(v6 + 456), "layer");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "setAnchorPoint:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));

    objc_msgSend(*(id *)(v6 + 432), "addSubview:", *(_QWORD *)(v6 + 456));
    objc_msgSend(*(id *)(v6 + 680), "addSubview:", *(_QWORD *)(v6 + 520));
    v58 = objc_alloc_init(MEMORY[0x1E0DC3990]);
    v59 = *(void **)(v6 + 472);
    *(_QWORD *)(v6 + 472) = v58;

    objc_msgSend(*(id *)(v6 + 472), "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 472), "setBackgroundColor:", v60);

    objc_msgSend(*(id *)(v6 + 472), "setTextAlignment:", 1);
    objc_msgSend(*(id *)(v6 + 472), "setAlpha:", 0.0);
    objc_msgSend(*(id *)(v6 + 472), "setContentMode:", 9);
    objc_msgSend(*(id *)(v6 + 432), "addSubview:", *(_QWORD *)(v6 + 472));
    v61 = objc_alloc_init(MEMORY[0x1E0D4EF60]);
    v62 = *(void **)(v6 + 688);
    *(_QWORD *)(v6 + 688) = v61;

    objc_msgSend(*(id *)(v6 + 688), "setDelegate:", v6);
    -[_SFNavigationBar _updateFonts](v6);
    -[_SFNavigationBar _updateTextColor](v6);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
    v63 = objc_claimAutoreleasedReturnValue();
    v64 = *(void **)(v6 + 784);
    *(_QWORD *)(v6 + 784) = v63;

    v65 = *(void **)(v6 + 784);
    _WBSLocalizedString();
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "setTitle:forState:", v66, 0);

    objc_msgSend(*(id *)(v6 + 784), "addTarget:action:forControlEvents:", v6, sel__cancelButtonTapped_, 64);
    _SFAccessibilityIdentifierForBarItem();
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(v6 + 784), "setAccessibilityIdentifier:", v67);

    objc_msgSend(*(id *)(v6 + 784), "setPointerInteractionEnabled:", 1);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 0);
    v68 = objc_claimAutoreleasedReturnValue();
    v69 = *(void **)(v6 + 760);
    *(_QWORD *)(v6 + 760) = v68;

    objc_msgSend(*(id *)(v6 + 760), "addTarget:action:forControlEvents:", v6, sel__mediaStateMuteButtonTapped_, 0x2000);
    objc_msgSend(*(id *)(v6 + 680), "addSubview:", *(_QWORD *)(v6 + 760));
    *(_QWORD *)(v6 + 768) = 0;
    -[_SFNavigationBar _dimmingButtonWithAction:]((uint64_t *)v6, (uint64_t)sel__reloadButtonPressed);
    v70 = objc_claimAutoreleasedReturnValue();
    v71 = *(void **)(v6 + 744);
    *(_QWORD *)(v6 + 744) = v70;

    _SFOnePixel();
    v73 = v72;
    _SFOnePixel();
    objc_msgSend(*(id *)(v6 + 744), "setImageEdgeInsets:", v73, 0.0, 0.0, v74 + -3.0);
    objc_msgSend(*(id *)(v6 + 680), "addSubview:", *(_QWORD *)(v6 + 744));
    -[_SFNavigationBar _dimmingButtonWithAction:]((uint64_t *)v6, (uint64_t)sel__stopButtonPressed);
    v75 = objc_claimAutoreleasedReturnValue();
    v76 = *(void **)(v6 + 736);
    *(_QWORD *)(v6 + 736) = v75;

    v77 = *(void **)(v6 + 736);
    _SFRoundEdgeInsetsToPixels();
    objc_msgSend(v77, "setImageEdgeInsets:");
    objc_msgSend(*(id *)(v6 + 736), "layer");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v79) = 0;
    objc_msgSend(v78, "setOpacity:", v79);

    objc_msgSend(*(id *)(v6 + 680), "addSubview:", *(_QWORD *)(v6 + 736));
    -[_SFNavigationBar _configureNavigationBarTrailingButtonTintedImages](v6);
    v80 = objc_alloc_init(MEMORY[0x1E0D4EF40]);
    v81 = *(void **)(v6 + 416);
    *(_QWORD *)(v6 + 416) = v80;

    objc_msgSend(*(id *)(v6 + 416), "addTarget:action:forControlEvents:", v6, sel__compressedBarTapped, 64);
    objc_msgSend((id)v6, "addSubview:", *(_QWORD *)(v6 + 416));
    v82 = *(void **)(v6 + 680);
    v83 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3750]), "initWithDelegate:", v6);
    objc_msgSend(v82, "addInteraction:", v83);

    v84 = *(_QWORD *)(v6 + 824);
    if (v84 == 1)
    {
      v87 = objc_alloc_init(SFDismissButton);
      v88 = *(void **)(v6 + 816);
      *(_QWORD *)(v6 + 816) = v87;

      objc_msgSend(*(id *)(v6 + 816), "addTarget:action:forControlEvents:", v6, sel__dismissButtonTapped_, 64);
      objc_msgSend(*(id *)(v6 + 816), "setPointerInteractionEnabled:", 1);
      objc_msgSend(*(id *)(v6 + 424), "insertSubview:belowSubview:", *(_QWORD *)(v6 + 816), *(_QWORD *)(v6 + 680));
      v85 = v9;
    }
    else
    {
      v85 = v9;
      if (!v84)
      {
        objc_msgSend(*(id *)(v6 + 416), "setSpringLoaded:", 1);
        v86 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3780]), "initWithDelegate:", v6);
        objc_msgSend((id)v6, "addInteraction:", v86);

      }
    }
    objc_msgSend((id)v6, "defaultHeight");
    *(_QWORD *)(v6 + 944) = v89;
    objc_msgSend((id)v6, "setAccessibilityIdentifier:", CFSTR("TopBrowserBar"));
    -[_SFNavigationBar _updateButtonMetrics](v6);
    -[_SFNavigationBar _didUpdateEffectiveTheme](v6);
    +[SFNavigationBarMetrics traitsAffectingBarMetrics]();
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = (id)objc_msgSend((id)v6, "registerForTraitChanges:withTarget:action:", v90, v6, sel__barMetricTraitsDidChange);

    v92 = (id)v6;
  }

  return (_SFNavigationBar *)v6;
}

- (id)_attributedStringSecurityAnnotation
{
  void *v2;
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  _QWORD v16[2];

  v16[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  _WBSLocalizedString();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_alloc(MEMORY[0x1E0CB3778]);
  v15 = *MEMORY[0x1E0DC32A8];
  v4 = v15;
  -[_SFNavigationBar _notSecureAnnotationColor](a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, &v15, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithString:attributes:", v2, v6);

  v8 = objc_alloc(MEMORY[0x1E0CB3498]);
  v13 = v4;
  -[_SFNavigationBar _notSecureGrayColor](a1);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = (void *)objc_msgSend(v8, "initWithString:attributes:", CFSTR(" —"), v10);

  objc_msgSend(v7, "appendAttributedString:", v11);
  return v7;
}

- (void)_configureNavigationBarTrailingButtonTintedImages
{
  void *v2;
  id v3;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("arrow.clockwise"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("xmark"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 744), "setImage:forState:", v3, 0);
    objc_msgSend(*(id *)(a1 + 736), "setImage:forState:", v2, 0);

  }
}

- (_SFNavigationBar)initWithFrame:(CGRect)a3
{
  return -[_SFNavigationBar initWithFrame:inputMode:](self, "initWithFrame:inputMode:", 0, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
}

- (void)dealloc
{
  void *v3;
  _SFNavigationBarURLButton *URLOutline;
  objc_super v5;

  objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  -[SFNavigationBarItem removeObserver:](self->_item, "removeObserver:", self);
  -[UIButton removeTarget:action:forControlEvents:](self->_compressedBarButton, "removeTarget:action:forControlEvents:", self, sel__compressedBarTapped, 64);
  URLOutline = self->_URLOutline;
  if (URLOutline)
    objc_storeWeak((id *)&URLOutline->_delegate, 0);
  v5.receiver = self;
  v5.super_class = (Class)_SFNavigationBar;
  -[_SFNavigationBar dealloc](&v5, sel_dealloc);
}

- (void)_reloadButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarReloadButtonWasTapped:", self);

}

- (BOOL)clickInteractionShouldBegin:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarFormatMenuButtonStartedInteraction:", self);

  return 1;
}

- (void)clickInteractionDidClickDown:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarReaderButtonWasTapped:", self);

}

- (void)_stopButtonPressed
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarStopLoadingButtonWasTapped:", self);

}

- (void)_compressedBarTapped
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "compressedNavigationBarWasTapped:", self);

}

- (void)_URLTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarURLWasTapped:completionHandler:", self, 0);

}

- (void)_formatToggleButtonTapped:(id)a3
{
  id WeakRetained;
  void *v5;
  int64_t formatButtonTapAction;
  char v7;
  char v8;
  void *v9;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v5 = WeakRetained;
  formatButtonTapAction = self->_formatButtonTapAction;
  if (formatButtonTapAction)
  {
    if (formatButtonTapAction == 2)
    {
      v9 = WeakRetained;
      v7 = objc_opt_respondsToSelector();
      v5 = v9;
      if ((v7 & 1) != 0)
      {
        objc_msgSend(v9, "navigationBarTranslateButtonWasTapped:", self);
        goto LABEL_9;
      }
    }
    else if (formatButtonTapAction == 1)
    {
      v9 = WeakRetained;
      objc_msgSend(WeakRetained, "navigationBarReaderButtonWasTapped:", self);
LABEL_9:
      v5 = v9;
    }
  }
  else
  {
    v9 = WeakRetained;
    v8 = objc_opt_respondsToSelector();
    v5 = v9;
    if ((v8 & 1) != 0)
    {
      objc_msgSend(v9, "navigationBarFormatMenuButtonWasTapped:", self);
      goto LABEL_9;
    }
  }

}

- (void)_mediaStateMuteButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarMediaStateMuteButtonWasTapped:", self);

}

- (void)_cancelButtonTapped:(id)a3
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarCancelButtonWasTapped:", self);

}

- (void)_dismissButtonTapped:(id)a3
{
  NSObject *v4;
  id WeakRetained;
  NSObject *v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = WBS_LOG_CHANNEL_PREFIXUserInterface();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v8 = 0;
    _os_log_impl(&dword_1A3B2D000, v4, OS_LOG_TYPE_DEFAULT, "Dismiss button tapped", v8, 2u);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if (WeakRetained)
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(WeakRetained, "navigationBarDoneButtonWasTapped:", self);
    }
    else
    {
      v7 = WBS_LOG_CHANNEL_PREFIXUserInterface();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
        -[_SFNavigationBar _dismissButtonTapped:].cold.2();
    }
  }
  else
  {
    v6 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      -[_SFNavigationBar _dismissButtonTapped:].cold.1();
  }

}

- (double)_controlsAlpha
{
  void *v3;
  double result;

  -[SFNavigationBarItem overlayConfiguration](self->_item, "overlayConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
    return 0.0;
  -[_SFNavigationBar minimumHeight](self, "minimumHeight");
  -[_SFNavigationBar bounds](self, "bounds");
  SFBarContentAlphaForSquishTransformFactor();
  return result;
}

- (uint64_t)_showsPrivateAnnotation
{
  uint64_t v1;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 904), "tintStyle");
    result = _SFIsPrivateTintStyle();
    if ((_DWORD)result)
      return objc_msgSend(*(id *)(v1 + 888), "showsSecurityAnnotation") ^ 1;
  }
  return result;
}

- (double)_privateBrowsingLabelRevealPercent
{
  double v1;
  double v3;
  double v4;
  double v5;

  v1 = 0.0;
  if (a1 && -[_SFNavigationBar _showsPrivateAnnotation]((uint64_t)a1))
  {
    objc_msgSend(a1, "minimumHeight");
    v4 = v3;
    objc_msgSend(a1, "bounds");
    return 1.0 - fmin(fmax((v5 - v4) / (a1[118] - v4), 0.0), 1.0);
  }
  return v1;
}

- (void)_transitionFromView:(void *)a3 toView:(int)a4 animated:
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  BOOL v14;
  int v15;
  uint64_t *v16;
  uint64_t *v17;
  uint64_t *v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  BOOL v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _OWORD v45[8];
  CATransform3D v46;
  _QWORD v47[2];
  _QWORD v48[4];

  v48[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    v7 = a3;
    objc_msgSend(a2, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "animationForKey:", CFSTR("show"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeAnimationForKey:", CFSTR("show"));
    objc_msgSend(v7, "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v10, "animationForKey:", CFSTR("hide"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "removeAnimationForKey:", CFSTR("hide"));
    objc_msgSend(a1, "_controlsAlpha");
    v13 = v12;
    if (a4)
    {
      if (v10)
        v14 = v11 == 0;
      else
        v14 = 0;
      v15 = !v14;
      v16 = (uint64_t *)MEMORY[0x1E0CD2950];
      v17 = (uint64_t *)MEMORY[0x1E0CD2B58];
      if (v9 && v15)
      {
        v18 = (uint64_t *)MEMORY[0x1E0CD2950];
        reverseAnimation(v9);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setStiffness:", 300.0);
        objc_msgSend(v22, "setDamping:", 400.0);
        v18 = v16;
        v23 = *v16;
        objc_msgSend(v22, "setBeginTimeMode:", *v16);
        v24 = *v17;
        objc_msgSend(v22, "setFillMode:", *v17);
        objc_msgSend(v22, "setDuration:", 0.37);
        objc_msgSend(v22, "setBeginTime:", 0.005);
        objc_msgSend(v22, "setFromValue:", &unk_1E4B258A0);
        objc_msgSend(v22, "setToValue:", &unk_1E4B258B8);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setAdditive:", 1);
        objc_msgSend(v25, "setBeginTimeMode:", v23);
        objc_msgSend(v25, "setBeginTime:", 0.0);
        objc_msgSend(v25, "setFillMode:", v24);
        objc_msgSend(v25, "setDuration:", 0.375);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setTimingFunction:", v26);

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", v13);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v25, "setFromValue:", v27);

        objc_msgSend(v25, "setToValue:", &unk_1E4B258B8);
        objc_msgSend(MEMORY[0x1E0CD2700], "animation");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v48[0] = v22;
        v48[1] = v25;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v48, 2);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAnimations:", v28);

        objc_msgSend(v19, "setDuration:", 0.375);
        objc_msgSend(v19, "setRemovedOnCompletion:", 1);
        objc_msgSend(v19, "setFrameInterval:", 0.0166666667);

      }
      objc_msgSend(v8, "addAnimation:forKey:", v19, CFSTR("hide"));

      CATransform3DMakeScale(&v46, 0.0, 0.0, 0.0);
      objc_msgSend(v8, "setTransform:", &v46);
      LODWORD(v29) = 0;
      objc_msgSend(v8, "setOpacity:", v29);
      if (v9)
        v30 = 1;
      else
        v30 = v8 == 0;
      if (v30 && v11)
      {
        reverseAnimation(v11);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0CD2848], "animationWithKeyPath:", CFSTR("transform.scale.xy"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setStiffness:", 300.0);
        objc_msgSend(v32, "setDamping:", 400.0);
        v33 = *v18;
        objc_msgSend(v32, "setBeginTimeMode:", *v18);
        v34 = *MEMORY[0x1E0CD2B58];
        objc_msgSend(v32, "setFillMode:", *MEMORY[0x1E0CD2B58]);
        objc_msgSend(v32, "setDuration:", 0.91);
        v35 = *MEMORY[0x1E0CD3038];
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", *MEMORY[0x1E0CD3038]);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v32, "setTimingFunction:", v36);

        objc_msgSend(v32, "setBeginTime:", 0.04);
        objc_msgSend(v32, "setFromValue:", &unk_1E4B258B8);
        objc_msgSend(v32, "setToValue:", &unk_1E4B258A0);
        objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", CFSTR("opacity"));
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setAdditive:", 1);
        objc_msgSend(v37, "setBeginTimeMode:", v33);
        objc_msgSend(v37, "setFillMode:", v34);
        objc_msgSend(v37, "setDuration:", 0.25);
        objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithName:", v35);
        v38 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setTimingFunction:", v38);

        objc_msgSend(v37, "setBeginTime:", -0.12);
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", -v13);
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v37, "setFromValue:", v39);

        objc_msgSend(v37, "setToValue:", &unk_1E4B258B8);
        objc_msgSend(MEMORY[0x1E0CD2700], "animation");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        v47[0] = v32;
        v47[1] = v37;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v47, 2);
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v31, "setAnimations:", v40);

        objc_msgSend(v31, "setDuration:", 0.95);
        objc_msgSend(v31, "setRemovedOnCompletion:", 1);
        objc_msgSend(v31, "setFrameInterval:", 0.0166666667);

      }
      objc_msgSend(v10, "addAnimation:forKey:", v31, CFSTR("show"));

    }
    else
    {
      CATransform3DMakeScale(&v46, 0.0, 0.0, 0.0);
      objc_msgSend(v8, "setTransform:", &v46);
      LODWORD(v20) = 0;
      objc_msgSend(v8, "setOpacity:", v20);
    }
    *(float *)&v21 = v13;
    objc_msgSend(v10, "setOpacity:", v21);
    v41 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 80);
    v45[4] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 64);
    v45[5] = v41;
    v42 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 112);
    v45[6] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 96);
    v45[7] = v42;
    v43 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 16);
    v45[0] = *MEMORY[0x1E0CD2610];
    v45[1] = v43;
    v44 = *(_OWORD *)(MEMORY[0x1E0CD2610] + 48);
    v45[2] = *(_OWORD *)(MEMORY[0x1E0CD2610] + 32);
    v45[3] = v44;
    objc_msgSend(v10, "setTransform:", v45);

  }
}

- (void)_setUpFormatToggleButtonIfNeeded
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;

  if (a1)
  {
    if (!*(_QWORD *)(a1 + 728))
    {
      v2 = objc_alloc(MEMORY[0x1E0D4ECE0]);
      -[_SFNavigationBar _formatToggleButtonImage]((id *)a1);
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v2, "initWithImage:forInputMode:", v3, *(_QWORD *)(a1 + 824));
      v5 = *(void **)(a1 + 728);
      *(_QWORD *)(a1 + 728) = v4;

      objc_msgSend(*(id *)(a1 + 728), "setMinimumSideMargin:", 6.0);
      objc_msgSend(*(id *)(a1 + 728), "setResizableBackgroundCornerRadius:", -[SFNavigationBarMetrics urlOutlineCornerRadius](*(_QWORD *)(a1 + 632)));
      objc_msgSend(*(id *)(a1 + 728), "addTarget:action:forControlEvents:", a1, sel__formatToggleButtonTapped_, 64);
      v6 = objc_alloc_init(MEMORY[0x1E0DC4078]);
      v7 = *(void **)(a1 + 752);
      *(_QWORD *)(a1 + 752) = v6;

      objc_msgSend(*(id *)(a1 + 752), "setDelegate:", a1);
      objc_msgSend(*(id *)(a1 + 728), "addInteraction:", *(_QWORD *)(a1 + 752));
      objc_msgSend(*(id *)(a1 + 728), "setAccessibilityIdentifier:", CFSTR("PageFormatMenuButton"));
      objc_msgSend(*(id *)(a1 + 680), "addSubview:", *(_QWORD *)(a1 + 728));
      objc_msgSend(*(id *)(a1 + 728), "setHidden:", 1);
      objc_msgSend(*(id *)(a1 + 904), "URLAccessoryButtonTintColorForInputMode:", *(_QWORD *)(a1 + 824));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 728), "setGlyphTintColor:", v8);

      -[SFNavigationBarMetrics mediumButtonImageSymbolConfiguration](*(_QWORD **)(a1 + 632));
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 728), "setPreferredSymbolConfiguration:", v9);

    }
  }
}

- (id)_formatToggleButtonImage
{
  id *v1;
  void *v2;
  uint64_t v3;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1[111], "showsSiriReaderPlayingIcon"))
    {
      objc_msgSend(MEMORY[0x1E0D4ECE0], "siriReaderPlayingImage");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (objc_msgSend(v1[111], "showsTranslationIcon")
           && (objc_msgSend(v1[111], "readerButtonSelected") & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:", CFSTR("translate"));
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v2 = (void *)MEMORY[0x1E0D4ECE0];
      if (objc_msgSend(v1[111], "browsingAssistantDetectionResult"))
        v3 = objc_msgSend(v1[111], "readerButtonSelected") ^ 1;
      else
        v3 = 0;
      objc_msgSend(v2, "pageMenuImageWithIntelligence:", v3);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)_updateAccessoryButtonsAlpha
{
  uint64_t v2;
  void (**v3)(_QWORD, _QWORD);
  _QWORD v4[6];

  if (a1)
  {
    objc_msgSend(a1, "_controlsAlpha");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __48___SFNavigationBar__updateAccessoryButtonsAlpha__block_invoke;
    v4[3] = &unk_1E4AC14F0;
    v4[4] = a1;
    v4[5] = v2;
    v3 = (void (**)(_QWORD, _QWORD))MEMORY[0x1A8598C40](v4);
    v3[2](v3, 1);
    objc_msgSend(a1[92], "setAlpha:");
    v3[2](v3, 0);
    objc_msgSend(a1[93], "setAlpha:");
    v3[2](v3, 3);
    objc_msgSend(a1[95], "setAlpha:");
    v3[2](v3, 2);
    objc_msgSend(a1[91], "setAlpha:");

  }
}

- (char)_navigationBarTrailingButtonWithType:(char *)a1
{
  int *v2;

  if (a1)
  {
    if (a2)
    {
      if (a2 != 1)
        return (char *)0;
      v2 = &OBJC_IVAR____SFNavigationBar__stopButton;
    }
    else
    {
      v2 = &OBJC_IVAR____SFNavigationBar__reloadButton;
    }
    a1 = (char *)*(id *)&a1[*v2];
  }
  return a1;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)_SFNavigationBar;
  -[_SFNavigationBar tintColorDidChange](&v3, sel_tintColorDidChange);
  -[_SFNavigationBar _updateProgressViewFillColor]((uint64_t)self);
}

- (void)fluidProgressViewWillShowProgress:(id)a3
{
  id v4;

  -[_SFNavigationBar _viewToInsertProgressBarIn](self);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addSubview:", self->_progressView);

}

- (void)fluidProgressViewDidShowProgress:(id)a3
{
  -[_SFFluidProgressView removeFromSuperview](self->_progressView, "removeFromSuperview", a3);
}

+ (double)separatorHeight
{
  return *(double *)&kSeparatorHeight;
}

- (void)_updateBackdropFrame
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  CGFloat v10;
  CGFloat v11;
  CGRect v12;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 696), "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2 == (void *)a1)
    {
      objc_msgSend((id)a1, "bounds");
      v4 = v3;
      v6 = v5;
      v8 = fmax(*(double *)(a1 + 936), *(double *)(a1 + 952) - v7);
      v10 = v9 - v8;
      v11 = v7 + v8;
      objc_msgSend(*(id *)(a1 + 696), "setFrame:", v4, v9 - v8, v5, v7 + v8);
      v12.origin.x = v4;
      v12.origin.y = v10;
      v12.size.width = v6;
      v12.size.height = v11;
      objc_msgSend(*(id *)(a1 + 704), "setFrame:", 0.0, CGRectGetMaxY(v12), v6, *(double *)&kSeparatorHeight);
    }
  }
}

- (uint64_t)_updateTextFieldFrame
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;

  if (result)
  {
    v1 = result;
    objc_msgSend(*(id *)(result + 680), "bounds");
    v3 = v2;
    v5 = v4;
    objc_msgSend(*(id *)(v1 + 680), "center");
    v7 = v6;
    v9 = v8;
    objc_msgSend(*(id *)(v1 + 680), "layer");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "anchorPoint");
    v12 = v11;
    v14 = v13;

    return objc_msgSend(*(id *)(v1 + 912), "setFrame:", v7 + 7.0 - v3 * v12, v9 - v5 * v14, v3 + -14.0, v5);
  }
  return result;
}

- (double)_textFieldTopMargin
{
  void *v2;
  double result;

  if (!a1)
    return 0.0;
  objc_msgSend(*(id *)(a1 + 912), "font");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "lineHeight");

  objc_msgSend(*(id *)(a1 + 912), "textRectForBounds:", 0.0, 0.0, 100.0, 100.0);
  objc_msgSend(*(id *)(a1 + 912), "bounds");
  objc_msgSend(*(id *)(a1 + 912), "paddingBottom");
  _SFRoundFloatToPixels();
  return result;
}

- (void)layoutSubviews
{
  uint64_t *p_barMetrics;
  double v4;
  int v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  double contentUnderStatusBarHeight;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  const char *v21;
  double v22;
  double v23;
  BOOL *p_usesNarrowLayout;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  const char *v31;
  SFToolbarContainer *leadingToolbarContainer;
  _BOOL4 v33;
  void *v34;
  double v35;
  SFToolbarContainer *trailingToolbarContainer;
  _BOOL4 v37;
  void *v38;
  double v39;
  _SFNavigationBar *v40;
  int v41;
  _BOOL4 v42;
  SFDismissButton *dismissButton;
  double v44;
  void *v45;
  uint64_t v46;
  void *v47;
  uint64_t v48;
  double v49;
  double v50;
  double v51;
  char v52;
  double v53;
  SFDismissButton *v54;
  double *v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  NSArray *v70;
  uint64_t v71;
  uint64_t v72;
  double v73;
  double v74;
  uint64_t i;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  _SFNavigationBar *v80;
  double v81;
  double v82;
  double v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  _SFNavigationBar *v89;
  double MaxX;
  double MinX;
  double v92;
  double v93;
  double v94;
  NSArray *v95;
  uint64_t v96;
  uint64_t v97;
  uint64_t j;
  void *v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  double v105;
  double v106;
  uint64_t v107;
  double *p_width;
  BOOL v109;
  uint64_t v110;
  CGFloat v111;
  double v112;
  CGSize *p_cachedSecurityAnnotationLabelFittingSize;
  double v114;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  _SFNavigationBar *v126;
  double v127;
  id *p_trailingToolbar;
  void *v129;
  double cancelButtonIntrinsicWidth;
  double v131;
  double v132;
  double v133;
  uint64_t barMetrics;
  uint64_t v135;
  double v136;
  _SFNavigationBar *v137;
  double v138;
  double v139;
  double v140;
  double v141;
  void *v142;
  id *v143;
  id v144;
  double v145;
  double v146;
  double v147;
  double v148;
  void *v149;
  id *v150;
  id v151;
  double v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  double v157;
  double *URLOutline;
  BOOL *p_expanded;
  double v160;
  double v161;
  double v162;
  double v163;
  uint64_t v164;
  double v165;
  uint64_t accessoryButtonArrangement;
  uint64_t v167;
  double v168;
  unint64_t inputMode;
  double v170;
  double v171;
  uint64_t v172;
  uint64_t v173;
  double v174;
  double v175;
  double v176;
  double v177;
  double v178;
  double v179;
  double v180;
  double v181;
  double v182;
  double v183;
  double v184;
  void *v185;
  void *v186;
  double v187;
  double v188;
  double v189;
  double MaxY;
  double v191;
  double v192;
  id v193;
  void *v194;
  double v195;
  double v196;
  double v197;
  double v198;
  CGFloat v199;
  uint64_t v200;
  char v201;
  double v202;
  double v203;
  double v204;
  double v205;
  double v206;
  double v207;
  CGFloat v208;
  double v209;
  double v210;
  double v211;
  double v212;
  double v213;
  UIView *URLContainer;
  double v215;
  double v216;
  double v217;
  void *v218;
  void *v219;
  void *v220;
  void *v221;
  _SFNavigationBar *v222;
  int v223;
  uint64_t v224;
  double v225;
  double v226;
  double v227;
  double v228;
  double v229;
  double v230;
  double v231;
  double v232;
  double v233;
  double v234;
  double v235;
  double v236;
  double v237;
  double v238;
  double v239;
  uint64_t v240;
  double v244;
  void *v245;
  double v246;
  double v247;
  int v248;
  double v249;
  double v250;
  double v251;
  double v252;
  double v253;
  double v254;
  double v255;
  double v256;
  double v257;
  double v258;
  BOOL v259;
  double v260;
  double v261;
  double v262;
  double v263;
  _BOOL4 expanded;
  void *v265;
  void *v266;
  double v267;
  double v268;
  double v269;
  _BOOL4 v270;
  void *v271;
  void *v272;
  double v273;
  double v274;
  double v275;
  double v276;
  double v277;
  double v278;
  char v279;
  double v280;
  double v281;
  double v282;
  double v283;
  double v284;
  double v285;
  double v286;
  double v287;
  CGFloat v288;
  _SFNavigationBarLabelsContainer *labelsContainer;
  CGFloat v290;
  CGFloat v291;
  CGFloat v292;
  CGFloat v293;
  double MidX;
  CGFloat v295;
  double v296;
  double v297;
  double v298;
  double v299;
  double v300;
  double v301;
  double v302;
  _BOOL4 v303;
  double v304;
  double v305;
  double v306;
  double v307;
  double v308;
  double v309;
  double v310;
  double v311;
  SFLockdownStatusBar *lockdownStatusBar;
  uint64_t v313;
  uint64_t v314;
  double v315;
  uint64_t k;
  void *v317;
  void *v318;
  uint64_t v319;
  void *v320;
  void *v321;
  id v322;
  void *v323;
  void *v324;
  void *v325;
  double v326;
  double v327;
  double v328;
  double v329;
  void *v330;
  void *v331;
  double v332;
  double v333;
  double v334;
  double v335;
  void *v336;
  id WeakRetained;
  id *v338;
  double v339;
  double v340;
  SFToolbarContainer **p_leadingToolbarContainer;
  double height;
  double v343;
  double v344;
  double v345;
  int v346;
  double v347;
  SFToolbarContainer **p_trailingToolbarContainer;
  double v349;
  double v350;
  double v351;
  double v352;
  double sx;
  double width;
  double v355;
  double v356;
  double v357;
  double v358;
  double v359;
  int v360;
  double v361;
  double v362;
  char v363;
  double v364;
  double v365;
  double v366;
  double v367;
  double v368;
  double v369;
  double v370;
  double v371;
  double v372;
  void (**v373)(void);
  double v374;
  CGFloat v375;
  _BOOL4 v376;
  CGFloat v377;
  CGFloat v378;
  CGFloat x;
  double rect;
  int v381;
  CGFloat v382;
  double v383;
  double v384;
  double v385;
  double y;
  double v387;
  _SFNavigationBar *v388;
  double obj;
  NSArray *obja;
  __int128 v391;
  __int128 v392;
  __int128 v393;
  __int128 v394;
  CGAffineTransform v395;
  CGAffineTransform v396;
  _QWORD v397[17];
  CGAffineTransform v398;
  char v399;
  CGAffineTransform v400;
  CGAffineTransform v401;
  _QWORD v402[5];
  _QWORD v403[12];
  uint64_t v404;
  double *v405;
  uint64_t v406;
  uint64_t v407;
  _QWORD v408[8];
  CGAffineTransform v409;
  CGAffineTransform v410;
  CGAffineTransform v411;
  CGAffineTransform v412;
  CGAffineTransform v413;
  CGAffineTransform v414;
  CGAffineTransform v415;
  CGAffineTransform v416;
  __int128 v417;
  __int128 v418;
  __int128 v419;
  __int128 v420;
  __int128 v421;
  __int128 v422;
  __int128 v423;
  __int128 v424;
  _BYTE v425[128];
  _BYTE v426[128];
  _BYTE v427[128];
  uint64_t v428;
  CGRect v429;
  CGRect v430;
  CGRect v431;
  CGRect v432;
  CGRect v433;
  CGRect v434;
  CGRect v435;
  CGRect v436;
  CGRect v437;
  CGRect v438;
  CGRect v439;
  CGRect v440;
  CGRect v441;
  CGRect v442;
  CGRect v443;
  CGRect v444;
  CGRect v445;
  CGRect v446;
  CGRect v447;
  CGRect v448;
  CGRect v449;
  CGRect v450;
  CGRect v451;
  CGRect v452;
  CGRect v453;
  CGRect v454;
  CGRect v455;
  CGRect v456;
  CGRect v457;
  CGRect v458;
  CGRect v459;
  CGRect v460;
  CGRect v461;
  CGRect v462;
  CGRect v463;
  CGRect v464;
  CGRect v465;
  CGRect v466;
  CGRect v467;
  CGRect v468;
  CGRect v469;
  CGRect v470;
  CGRect v471;
  CGRect v472;
  CGRect v473;
  CGRect v474;
  CGRect v475;
  CGRect v476;
  CGRect v477;
  CGRect v478;
  CGRect v479;
  CGRect v480;

  v428 = *MEMORY[0x1E0C80C00];
  -[_SFNavigationBar _updateBackdropFrame]((uint64_t)self);
  p_barMetrics = (uint64_t *)&self->_barMetrics;
  v367 = -[SFNavigationBarMetrics urlOutlineHeight]((uint64_t)self->_barMetrics);
  v355 = -[SFNavigationBarMetrics urlContainerTop]((uint64_t)self->_barMetrics);
  -[_SFNavigationBar _customButtonHorizontalPadding](self);
  v366 = v4;
  v5 = -[_SFNavigationBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  v376 = -[_SFNavigationBar hasToolbar](self, "hasToolbar");
  -[_SFNavigationBar bounds](self, "bounds");
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_SFNavigationBar _layoutBounds]((uint64_t)self);
  v339 = v14;
  contentUnderStatusBarHeight = self->_contentUnderStatusBarHeight;
  v16 = *(double *)&kSeparatorHeight;
  v385 = -[_SFNavigationBar _urlOutlineOriginY]((uint64_t)self);
  -[_SFNavigationBar safeAreaInsets](self, "safeAreaInsets");
  v18 = v17;
  v20 = v19;
  v374 = v7;
  v375 = v9;
  v429.origin.x = v7;
  v429.origin.y = v9;
  v387 = v11;
  v429.size.width = v11;
  rect = v13;
  v429.size.height = v13;
  CGRectGetWidth(v429);
  _SFRoundFloatToPixels();
  v23 = fmax(v18, 20.0);
  p_usesNarrowLayout = &self->_usesNarrowLayout;
  v25 = fmax(v20, 20.0);
  if (self->_usesNarrowLayout)
    v26 = v22;
  else
    v26 = v25;
  v381 = v5;
  if (v5)
    v27 = v23;
  else
    v27 = v22;
  if (v5)
    v28 = v22;
  else
    v28 = v26;
  if (v5)
    v29 = v22;
  else
    v29 = v23;
  if (v5)
    v30 = v26;
  else
    v30 = v22;
  -[SFToolbarContainer setToolbarInsets:](self->_leadingToolbarContainer, v21, 0.0, v27, 0.0, v28);
  v388 = self;
  p_trailingToolbarContainer = &self->_trailingToolbarContainer;
  -[SFToolbarContainer setToolbarInsets:](self->_trailingToolbarContainer, v31, 0.0, v29, 0.0, v30);
  p_leadingToolbarContainer = &self->_leadingToolbarContainer;
  leadingToolbarContainer = self->_leadingToolbarContainer;
  v33 = *p_usesNarrowLayout;
  -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*p_barMetrics);
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  v35 = -[SFToolbarContainer widthRangeUsingNarrowMetrics:compatibleWithTraitCollection:]((uint64_t)leadingToolbarContainer, v33, v34);

  trailingToolbarContainer = self->_trailingToolbarContainer;
  v37 = *p_usesNarrowLayout;
  -[SFNavigationBarMetrics traitCollectionForButtonMetrics](*p_barMetrics);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = -[SFToolbarContainer widthRangeUsingNarrowMetrics:compatibleWithTraitCollection:]((uint64_t)trailingToolbarContainer, v37, v38);

  if (v376)
  {
    v40 = self;
    v41 = v381;
    v42 = self->_expanded && self->_usesNarrowLayout;
  }
  else
  {
    v42 = 0;
    v40 = v388;
    v41 = v381;
  }
  dismissButton = v40->_dismissButton;
  if (dismissButton)
  {
    -[SFDismissButton frame](dismissButton, "frame");
    v44 = v366 + CGRectGetWidth(v430);
  }
  else
  {
    v44 = 0.0;
  }
  if (v40->_inputMode == 1)
    goto LABEL_26;
  -[_SFToolbar items](v40->_leadingToolbar, "items");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v46 = objc_msgSend(v45, "count");
  -[_SFToolbar items](v388->_trailingToolbar, "items");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "count");

  v40 = v388;
  v41 = v381;
  if (v46 == v48)
  {
LABEL_26:
    v49 = contentUnderStatusBarHeight;
    v50 = fmax(v35 + v44, v39);
    v51 = v50 + v50;
  }
  else
  {
    v49 = contentUnderStatusBarHeight;
    v51 = v39 + v35 + v44;
  }
  v431.origin.x = v374;
  v431.origin.y = v9;
  v431.size.width = v11;
  v431.size.height = rect;
  v52 = CGRectGetWidth(v431) - v51 + -664.0 >= 0.0 || v42;
  if ((v52 & 1) == 0)
  {
    v432.origin.x = v374;
    v432.origin.y = v9;
    v432.size.width = v11;
    v432.size.height = rect;
    CGRectGetWidth(v432);
  }
  v53 = v49;
  _SFRoundFloatToPixels();
  _SFClamp();
  _SFRoundFloatToPixels();
  _SFClamp();
  _SFRoundFloatToPixels();
  v54 = v40->_dismissButton;
  v55 = (double *)MEMORY[0x1E0C9D820];
  if (v54)
  {
    -[SFDismissButton sizeThatFits:](v54, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    v364 = v56;
    v370 = v57;
    v372 = v366;
    if ((v41 & 1) == 0)
    {
      v433.origin.x = v374;
      v433.origin.y = v9;
      v433.size.width = v11;
      v433.size.height = rect;
      v372 = CGRectGetWidth(v433) - v364 - v366;
    }
    v368 = v367 * 0.5 + v385 - v370 * 0.5;
  }
  else
  {
    v368 = *(double *)(MEMORY[0x1E0C9D628] + 8);
    v364 = *(double *)(MEMORY[0x1E0C9D628] + 16);
    v370 = *(double *)(MEMORY[0x1E0C9D628] + 24);
    v372 = *MEMORY[0x1E0C9D628];
  }
  v58 = rect + v49;
  -[_SFToolbar baselineOffsetAdjustment](v40->_leadingToolbar, "baselineOffsetAdjustment", &v40->_leadingToolbar);
  if ((v41 & 1) != 0 || !v40->_dismissButton)
  {
    v435.origin.x = v374;
    v435.origin.y = v9;
    v435.size.width = v11;
    v435.size.height = rect;
    CGRectGetMaxX(v435);
  }
  else
  {
    v434.size.height = v370;
    v434.origin.x = v372;
    v434.origin.y = v368;
    v434.size.width = v364;
    CGRectGetMinX(v434);
  }
  v59 = v9 - v53;
  _SFRoundRectToPixels();
  v356 = v61;
  v357 = v60;
  v349 = v63;
  v350 = v62;
  if (v41 && v40->_dismissButton)
  {
    v436.size.height = v370;
    v436.origin.x = v372;
    v436.origin.y = v368;
    v436.size.width = v364;
    CGRectGetMaxX(v436);
  }
  _SFRoundRectToPixels();
  v358 = v65;
  v359 = v64;
  v351 = v67;
  v352 = v66;
  -[SFDismissButton setFrame:](v40->_dismissButton, "setFrame:", v372, v368, v364, v370);
  v68 = 1.0;
  if (v40->_controlsHidden)
    v68 = 0.0;
  -[UIView setAlpha:](v40->_controlsContainer, "setAlpha:", v68);
  -[UIView setFrame:](v40->_controlsContainer, "setFrame:", v374, v9, v11, rect);
  -[UIButton setFrame:](v40->_compressedBarButton, "setFrame:", v374, v59, v11, v58 + v16);
  v437.origin.x = v374;
  v437.origin.y = v9;
  v437.size.width = v11;
  v437.size.height = rect;
  CGRectGetHeight(v437);
  -[_SFNavigationBar minimumHeight](v40, "minimumHeight");
  -[UIButton setUserInteractionEnabled:](v40->_compressedBarButton, "setUserInteractionEnabled:", _SFEqualWithEpsilon());
  -[UIImageView superview](v40->_lockView, "superview");
  v69 = (void *)objc_claimAutoreleasedReturnValue();

  if (v69)
    -[_SFNavigationBar _updateLockViewIfNeeded]((uint64_t)v388);
  v424 = 0u;
  v423 = 0u;
  v422 = 0u;
  v421 = 0u;
  v70 = v388->_URLAccessoryItems;
  v71 = -[NSArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v421, v427, 16);
  if (v71)
  {
    v72 = *(_QWORD *)v422;
    v73 = *v55;
    v74 = v55[1];
    do
    {
      for (i = 0; i != v71; ++i)
      {
        if (*(_QWORD *)v422 != v72)
          objc_enumerationMutation(v70);
        v76 = *(void **)(*((_QWORD *)&v421 + 1) + 8 * i);
        objc_msgSend(v76, "view");
        v77 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v77, "superview");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        if (v78)
        {
          objc_msgSend(v76, "view");
          v79 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v79, "sizeThatFits:", v73, v74);
          objc_msgSend(v76, "setSize:");

        }
        else
        {
          objc_msgSend(v76, "setSize:", v73, v74);
        }

      }
      v71 = -[NSArray countByEnumeratingWithState:objects:count:](v70, "countByEnumeratingWithState:objects:count:", &v421, v427, 16);
    }
    while (v71);

    v80 = v388;
    if (!v388)
    {
      obj = 0.0;
      v363 = 1;
      goto LABEL_63;
    }
  }
  else
  {

    v80 = v388;
  }
  -[_SFNavigationBar minimumHeight](v80, "minimumHeight");
  v82 = v81;
  -[_SFNavigationBar bounds](v388, "bounds");
  v363 = 0;
  obj = fmin(fmax((v83 - v82) / (v388->_maximumHeight - v82), 0.0), 1.0);
LABEL_63:
  if (!v42 && v376)
  {
    v438.origin.x = v374;
    v438.origin.y = v9;
    v438.size.width = v387;
    v438.size.height = rect;
    CGRectGetWidth(v438);
  }
  _SFRoundFloatToPixels();
  v85 = v84;
  v86 = v387 - v84;
  v87 = 0.0;
  v383 = v86;
  if (v42)
  {
    v88 = 0.0;
    v361 = v86;
    v362 = v85;
  }
  else
  {
    v89 = v388;
    v88 = 0.0;
    v361 = v86;
    v362 = v85;
    if (v388->_inputMode == 1)
      goto LABEL_74;
    v439.origin.y = v358;
    v439.origin.x = v359;
    v439.size.height = v351;
    v439.size.width = v352;
    MaxX = CGRectGetMaxX(v439);
    v440.origin.y = v356;
    v440.origin.x = v357;
    v440.size.height = v349;
    v440.size.width = v350;
    MinX = CGRectGetMinX(v440);
    if (MaxX - v85 <= 0.0)
    {
      if (v383 - MinX > 0.0)
      {
        _SFInterpolate();
        v88 = v93;
      }
    }
    else
    {
      _SFInterpolate();
      v88 = -v92;
    }
    v361 = v383 - v88;
    v362 = v85 - v88;
  }
  v89 = v388;
LABEL_74:
  v94 = 0.0;
  if (!v89->_expanded)
  {
    v420 = 0u;
    v419 = 0u;
    v418 = 0u;
    v417 = 0u;
    v95 = v89->_URLAccessoryItems;
    v96 = -[NSArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v417, v426, 16);
    if (v96)
    {
      v97 = *(_QWORD *)v418;
      do
      {
        for (j = 0; j != v96; ++j)
        {
          if (*(_QWORD *)v418 != v97)
            objc_enumerationMutation(v95);
          v99 = *(void **)(*((_QWORD *)&v417 + 1) + 8 * j);
          objc_msgSend(v99, "size");
          v101 = v100;
          objc_msgSend(v99, "spacing");
          v103 = v102;
          objc_msgSend(v99, "size");
          v105 = v104;
          objc_msgSend(v99, "spacing");
          v94 = v94 + (v101 + v103) / 0.7;
          v87 = v87 + v105 + v106;
        }
        v96 = -[NSArray countByEnumeratingWithState:objects:count:](v95, "countByEnumeratingWithState:objects:count:", &v417, v426, 16);
      }
      while (v96);
    }

    v89 = v388;
  }
  v360 = -[SFNavigationBarItem showsSecurityAnnotation](v89->_item, "showsSecurityAnnotation");
  v107 = (uint64_t)v388;
  p_width = &v388->_cachedSecurityAnnotationLabelFittingSize.width;
  v109 = v388->_cachedSecurityAnnotationLabelFittingSize.width == *v55
      && v388->_cachedSecurityAnnotationLabelFittingSize.height == v55[1];
  if (v109)
  {
    -[UILabel sizeThatFits:](v388->_securityAnnotationLabel, "sizeThatFits:");
    *(_QWORD *)p_width = v110;
    v388->_cachedSecurityAnnotationLabelFittingSize.height = v111;
    v107 = (uint64_t)v388;
  }
  v112 = 0.0;
  if (v360)
    v112 = 4.0;
  v347 = v112;
  if (v360)
    p_cachedSecurityAnnotationLabelFittingSize = &v388->_cachedSecurityAnnotationLabelFittingSize;
  else
    p_cachedSecurityAnnotationLabelFittingSize = (CGSize *)v55;
  width = p_cachedSecurityAnnotationLabelFittingSize->width;
  height = p_cachedSecurityAnnotationLabelFittingSize->height;
  v346 = -[_SFNavigationBar _showsPrivateAnnotation](v107);
  v345 = -[_SFNavigationBar _privateBrowsingLabelRevealPercent]((double *)v388);
  v114 = 0.0;
  v115 = 0.0;
  if (v346)
  {
    -[UILabel bounds](v388->_privateBrowsingLabel, "bounds", 0.0);
    v115 = CGRectGetWidth(v441) + 4.0;
  }
  v344 = v115;
  sx = obj * 0.3 + 0.7;
  v343 = v347 + width;
  if (obj < 1.0)
  {
    -[SFURLLabel urlSize](v388->_URLLabel, "urlSize", obj);
    v116 = v387 * 0.5;
    v117 = v387 * 0.5 - v85;
    v119 = fmin(v85 + (v117 + 1.0) / 0.7, (v94 + v343 + v344 + v118) * 0.5 + 7.0);
    if (v119 > v117)
    {
      v120 = (1.0 - sx) * 0.7;
      v121 = v117 + v120 * (v119 - v117) / (sx * 0.3);
      v122 = fmax(v88, 0.0);
      v123 = v122 + v120 * (fmin(v88, 0.0) - v122) / (sx * 0.3);
      v361 = v116 + v121 - v123;
      v362 = v116 - v121 - v123;
    }
    v124 = v116 + (v119 + -7.0 - v94) * -0.7;
    _SFRoundFloatToPixels();
    v114 = v125 - v124;
  }
  _SFRoundRectToPixels();
  v378 = v442.size.width;
  x = v442.origin.x;
  v384 = v442.size.height;
  y = v442.origin.y;
  v340 = CGRectGetWidth(v442);
  if (v388->_usesNarrowLayout)
  {
    v126 = v388;
    if (v388->_expanded)
    {
      v127 = v366 + v388->_cancelButtonIntrinsicWidth;
    }
    else
    {
      if (!v376)
      {
        v127 = v85 - v366;
        if (v381)
        {
LABEL_113:
          v131 = v339 - v127;
          cancelButtonIntrinsicWidth = v126->_cancelButtonIntrinsicWidth;
          goto LABEL_114;
        }
LABEL_109:
        cancelButtonIntrinsicWidth = v126->_cancelButtonIntrinsicWidth;
        v131 = v127 - cancelButtonIntrinsicWidth;
LABEL_114:
        -[UIButton setFrame:](v126->_cancelButton, "setFrame:", v131, y, cancelButtonIntrinsicWidth, v384);
        goto LABEL_115;
      }
      p_trailingToolbar = v338;
      if (v381)
        p_trailingToolbar = (id *)&v388->_trailingToolbar;
      objc_msgSend(*p_trailingToolbar, "items");
      v129 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v129, "count"))
        v127 = v366 + v388->_cancelButtonIntrinsicWidth;
      else
        v127 = v85 - v366;

      v126 = v388;
    }
    if (v381)
      goto LABEL_113;
    goto LABEL_109;
  }
LABEL_115:
  _SFRoundFloatToPixels();
  v133 = v132;
  memset(&v415, 0, sizeof(v415));
  barMetrics = (uint64_t)v388->_barMetrics;
  v135 = objc_msgSend((id)objc_opt_class(), "_metricsCategory");
  -[SFNavigationBarMetrics squishHeightQuantizationOffsetWithBarMetricsCategory:](barMetrics, v135);
  _SFRoundFloatToPixels();
  CGAffineTransformMakeTranslation(&v415, (1.0 - obj) * v114, (1.0 - obj) * (v133 + v355 * -0.7 - v136));
  v413 = v415;
  CGAffineTransformScale(&v414, &v413, sx, sx);
  v415 = v414;
  v416 = v414;
  v412 = v414;
  -[_SFNavigationBarURLButton setTransform:](v388->_URLOutline, "setTransform:", &v412);
  _SFRoundRectToPixels();
  -[_SFNavigationBarURLButton ss_setUntransformedFrame:](v388->_URLOutline, "ss_setUntransformedFrame:");
  v137 = v388;
  if (v388->_dismissButton)
  {
    -[_SFNavigationBar _controlsAlpha](v388, "_controlsAlpha");
    -[SFDismissButton setAlpha:](v388->_dismissButton, "setAlpha:");
    v443.size.height = v370;
    v443.origin.x = v372;
    v443.origin.y = v368;
    v443.size.width = v364;
    v138 = v372;
    v139 = v368;
    if (CGRectGetWidth(v443) != 0.0)
    {
      v444.origin.x = v374;
      v444.origin.y = v375;
      v444.size.width = v387;
      v444.size.height = rect;
      v140 = CGRectGetWidth(v444);
      v445.size.height = v370;
      v445.origin.x = v372;
      v445.origin.y = v368;
      v445.size.width = v364;
      v141 = CGRectGetMinX(v445);
      v446.size.height = v370;
      v446.origin.x = v372;
      v446.origin.y = v368;
      v446.size.width = v364;
      v138 = (v140 * 0.5 - v141) / CGRectGetWidth(v446);
      v139 = 0.0;
    }
    -[SFDismissButton layer](v388->_dismissButton, "layer");
    v142 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v142, "setAnchorPoint:", v138, v139);

    v411 = v416;
    -[SFDismissButton setTransform:](v388->_dismissButton, "setTransform:", &v411);
    -[SFDismissButton ss_setUntransformedFrame:](v388->_dismissButton, "ss_setUntransformedFrame:", v372, v368, v364, v370);
    v137 = v388;
  }
  if (v376)
  {
    v143 = (id *)p_leadingToolbarContainer;
    if (!v381)
      v143 = (id *)p_trailingToolbarContainer;
    v144 = *v143;
    v447.origin.y = v358;
    v447.origin.x = v359;
    v447.size.height = v351;
    v447.size.width = v352;
    v146 = v358;
    v145 = v359;
    if (CGRectGetWidth(v447) != 0.0)
    {
      v448.origin.x = v374;
      v448.origin.y = v375;
      v448.size.width = v387;
      v448.size.height = rect;
      v147 = CGRectGetWidth(v448);
      v449.origin.y = v358;
      v449.origin.x = v359;
      v449.size.height = v351;
      v449.size.width = v352;
      v148 = CGRectGetMinX(v449);
      v450.origin.y = v358;
      v450.origin.x = v359;
      v450.size.height = v351;
      v450.size.width = v352;
      v145 = (v147 * 0.5 - v148) / CGRectGetWidth(v450);
      v146 = 0.0;
    }
    objc_msgSend(v144, "layer");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setAnchorPoint:", v145, v146);

    v410 = v416;
    objc_msgSend(v144, "setTransform:", &v410);
    objc_msgSend(v144, "ss_setUntransformedFrame:", v359, v358, v352, v351);
    v150 = (id *)p_leadingToolbarContainer;
    if (v381)
      v150 = (id *)p_trailingToolbarContainer;
    v151 = *v150;
    v451.origin.y = v356;
    v451.origin.x = v357;
    v451.size.height = v349;
    v451.size.width = v350;
    v153 = v356;
    v152 = v357;
    if (CGRectGetWidth(v451) != 0.0)
    {
      v452.origin.x = v374;
      v452.origin.y = v375;
      v452.size.width = v387;
      v452.size.height = rect;
      v154 = CGRectGetWidth(v452);
      v453.origin.y = v356;
      v453.origin.x = v357;
      v453.size.height = v349;
      v453.size.width = v350;
      v155 = CGRectGetMinX(v453);
      v454.origin.y = v356;
      v454.origin.x = v357;
      v454.size.height = v349;
      v454.size.width = v350;
      v152 = (v154 * 0.5 - v155) / CGRectGetWidth(v454);
      v153 = 0.0;
    }
    objc_msgSend(v151, "layer");
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "setAnchorPoint:", v152, v153);

    v409 = v416;
    objc_msgSend(v151, "setTransform:", &v409);
    objc_msgSend(v151, "ss_setUntransformedFrame:", v357, v356, v350, v349);

    v137 = v388;
  }
  v157 = 0.0;
  if ((v363 & 1) == 0 && v137->_inputMode != 1)
  {
    SFBarBackgroundAlphaForSquishTransformFactor();
    v137 = v388;
  }
  URLOutline = (double *)v137->_URLOutline;
  if (URLOutline && URLOutline[102] != v157)
  {
    URLOutline[102] = v157;
    -[_SFNavigationBarURLButton _updateBackgroundImageAnimated:](URLOutline, 0);
    v137 = v388;
  }
  p_expanded = &v137->_expanded;
  v160 = 0.0;
  if (v137->_expanded)
    v161 = 0.0;
  else
    v161 = 1.0;
  scaleView(v137->_reloadButton, v161);
  if (*p_expanded)
    v162 = 0.0;
  else
    v162 = 1.0;
  scaleView(v388->_stopButton, v162);
  v163 = 0.0;
  if (!*p_expanded)
    v163 = 1.0;
  scaleView(v388->_mediaStateMuteButton, v163);
  v164 = -[_SFNavigationBar effectiveUserInterfaceLayoutDirection](v388, "effectiveUserInterfaceLayoutDirection");
  if (v388->_inputMode == 1)
  {
    if (v376)
    {
      v455.origin.y = v358;
      v455.origin.x = v359;
      v455.size.height = v351;
      v455.size.width = v352;
      v165 = CGRectGetMaxX(v455);
      v456.size.width = v378;
      v456.origin.x = x;
      v456.size.height = v384;
      v456.origin.y = y;
      v160 = v165 - CGRectGetMinX(v456);
    }
    else if (v381)
    {
      v457.size.height = v370;
      v457.origin.x = v372;
      v457.origin.y = v368;
      v457.size.width = v364;
      v160 = v366 + CGRectGetWidth(v457);
    }
  }
  v413.a = 0.0;
  *(_QWORD *)&v413.b = &v413;
  *(_QWORD *)&v413.c = 0x2020000000;
  v413.d = 0.0;
  accessoryButtonArrangement = (uint64_t)v388->_accessoryButtonArrangement;
  v167 = MEMORY[0x1E0C809B0];
  v408[0] = MEMORY[0x1E0C809B0];
  v408[1] = 3221225472;
  v408[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_2;
  v408[3] = &unk_1E4AC1518;
  v408[4] = v388;
  v408[5] = &v413;
  *(double *)&v408[6] = v160;
  *(double *)&v408[7] = v367;
  -[SFNavigationBarAccessoryButtonArrangement enumerateButtonTypesFromEdge:withLayoutDirection:usingBlock:](accessoryButtonArrangement, 2, v164, v408);
  v168 = *(double *)(*(_QWORD *)&v413.b + 24);
  if (v168 != 0.0)
  {
    inputMode = v388->_inputMode;
    if (inputMode)
      goto LABEL_152;
    *(double *)(*(_QWORD *)&v413.b + 24) = fmax(v160 + v168, 0.0);
  }
  inputMode = v388->_inputMode;
LABEL_152:
  v170 = 0.0;
  if (inputMode == 1)
  {
    if (v376)
    {
      v458.origin.y = v356;
      v458.origin.x = v357;
      v458.size.height = v349;
      v458.size.width = v350;
      v171 = CGRectGetMinX(v458);
      v459.size.width = v378;
      v459.origin.x = x;
      v459.size.height = v384;
      v459.origin.y = y;
      v170 = v171 - CGRectGetMaxX(v459);
    }
    else if ((v381 & 1) == 0)
    {
      v460.size.height = v370;
      v460.origin.x = v372;
      v460.origin.y = v368;
      v460.size.width = v364;
      v170 = v366 + CGRectGetWidth(v460);
    }
  }
  v404 = 0;
  v405 = (double *)&v404;
  v406 = 0x2020000000;
  v407 = 0;
  v172 = (uint64_t)v388->_accessoryButtonArrangement;
  v173 = (uint64_t)v388;
  v403[0] = v167;
  v403[1] = 3221225472;
  v403[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_3;
  v403[3] = &unk_1E4AC1540;
  *(CGFloat *)&v403[6] = x;
  *(double *)&v403[7] = y;
  *(CGFloat *)&v403[8] = v378;
  *(double *)&v403[9] = v384;
  v403[4] = v388;
  v403[5] = &v404;
  *(double *)&v403[10] = v170;
  *(double *)&v403[11] = v367;
  -[SFNavigationBarAccessoryButtonArrangement enumerateButtonTypesFromEdge:withLayoutDirection:usingBlock:](v172, 8, v164, v403);
  v174 = v405[3];
  if (v174 != 0.0)
    v405[3] = fmax(v174 - v170, 0.0);
  -[_SFDimmingButton ss_untransformedFrame](v388->_reloadButton, "ss_untransformedFrame");
  -[_SFDimmingButton ss_setUntransformedFrame:](v388->_stopButton, "ss_setUntransformedFrame:");
  -[_SFNavigationBar _updateToolbarAndCancelButtonAlpha]((id *)&v388->super.super.super.isa);
  -[_SFNavigationBar _controlsAlpha](v388, "_controlsAlpha");
  v176 = v175;
  v402[0] = v167;
  v402[1] = 3221225472;
  v402[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_4;
  v402[3] = &unk_1E4ABFE00;
  v402[4] = v388;
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v402);
  if (v388->_unifiedFieldShowsProgressView)
  {
    -[_SFNavigationBarURLButton bounds](v388->_URLOutline, "bounds");
    v178 = v177;
    v180 = v179;
    v182 = v181;
    v184 = v183;
    -[_SFFluidProgressView setAlpha:](v388->_progressView, "setAlpha:", v176);
  }
  else
  {
    -[_SFFluidProgressView progressBarFillColor](v388->_progressView, "progressBarFillColor");
    v185 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v186 = (void *)objc_claimAutoreleasedReturnValue();
    v187 = 0.0;
    if (objc_msgSend(v185, "isEqual:", v186))
    {
      _SFOnePixel();
      v187 = v188;
    }

    objc_msgSend(MEMORY[0x1E0D4EF60], "defaultHeight");
    v173 = (uint64_t)v388;
    v184 = v189;
    v461.origin.x = v374;
    v461.origin.y = v375;
    v461.size.width = v387;
    v461.size.height = rect;
    MaxY = CGRectGetMaxY(v461);
    -[_SFFluidProgressView setAlpha:](v388->_progressView, "setAlpha:", 1.0);
    v180 = MaxY - v184 - v187;
    v178 = 0.0;
    v182 = v387;
  }
  objc_msgSend(*(id *)(v173 + 688), "setFrame:", v178, v180, v182, v184);
  v191 = *(double *)(*(_QWORD *)&v413.b + 24);
  v192 = v405[3];
  -[_SFNavigationBar _updateTextFieldFrame](v173);
  v369 = obj * v191;
  v371 = obj * v192;
  if (*(_BYTE *)(v173 + 883))
  {
    v193 = (id)objc_msgSend(*(id *)(v173 + 912), "_clearButton");
    objc_msgSend(*(id *)(v173 + 888), "textWhenExpanded");
    v194 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v194, "length"))
    {
      objc_msgSend(*(id *)(v173 + 912), "clearButtonRect");
      v196 = v195 + 8.0;
    }
    else
    {
      v196 = 0.0;
    }

    v173 = (uint64_t)v388;
    v200 = -[UITextField effectiveUserInterfaceLayoutDirection](v388->_textField, "effectiveUserInterfaceLayoutDirection");
    v199 = x;
    if (v200)
      v198 = 0.0;
    else
      v198 = v196 + 7.0;
    if (v200)
      v197 = v196 + 7.0;
    else
      v197 = 0.0;
  }
  else
  {
    v197 = obj * v191 + 0.0;
    v198 = obj * v192 + 0.0;
    v199 = x;
  }
  v201 = v376;
  if (*(_QWORD *)(v173 + 824) != 1)
    v201 = 1;
  if ((v201 & 1) == 0)
  {
    objc_msgSend(*(id *)(v173 + 816), "bounds");
    v202 = v366 + CGRectGetWidth(v462);
    v203 = v197 + v202 * obj;
    v204 = v198 + v202 * obj;
    if (v381)
      v197 = v203;
    else
      v198 = v204;
  }
  v463.origin.x = v199;
  v463.origin.y = y;
  v463.size.width = v378;
  v463.size.height = v384;
  v205 = CGRectGetWidth(v463);
  v464.origin.x = v199;
  v464.origin.y = y;
  v464.size.width = v378;
  v464.size.height = v384;
  v206 = CGRectGetHeight(v464);
  v207 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v208 = v205 - v197 - v198;
  objc_msgSend(*(id *)(v173 + 520), "setFrame:", v197, v207, v208, v206);
  v465.size.width = v378;
  v465.origin.x = x;
  v465.size.height = v384;
  v465.origin.y = y;
  CGRectGetHeight(v465);
  -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom](*(_QWORD *)(v173 + 632));
  objc_msgSend(*(id *)(v173 + 448), "baselineOffsetFromBottom");
  objc_msgSend(*(id *)(v173 + 448), "urlSize");
  _SFRoundFloatToPixels();
  v210 = v209;
  v466.origin.x = v197;
  v466.origin.y = v207;
  v466.size.width = v208;
  v466.size.height = v206;
  v211 = CGRectGetWidth(v466);
  -[SFURLLabel urlSize](v388->_URLLabel, "urlSize");
  -[UIView ss_setUntransformedFrame:](v388->_URLContainer, "ss_setUntransformedFrame:", 0.0, v210, v211, v212);
  v213 = 0.91;
  if (!v388->_controlsHidden)
    v213 = 1.0;
  CGAffineTransformMakeScale(&v401, v213, v213);
  URLContainer = v388->_URLContainer;
  v400 = v401;
  -[UIView setTransform:](URLContainer, "setTransform:", &v400);
  v215 = rect;
  if ((v363 & 1) != 0)
  {
    v217 = 0.0;
  }
  else if (v388->_usesNarrowLayout)
  {
    v216 = -[SFNavigationBarMetrics narrowEditingScaleFactor]((uint64_t)v388->_barMetrics);
    v215 = rect;
    v217 = v216;
  }
  else
  {
    v217 = 1.0;
  }
  v397[0] = v167;
  v397[1] = 3221225472;
  v397[2] = __34___SFNavigationBar_layoutSubviews__block_invoke_5;
  v397[3] = &unk_1E4AC1590;
  v399 = v381;
  *(double *)&v397[5] = width;
  *(double *)&v397[6] = height;
  *(double *)&v397[7] = v347;
  *(double *)&v397[8] = v345 * v344;
  v397[4] = v388;
  *(double *)&v397[9] = v374;
  *(CGFloat *)&v397[10] = v375;
  *(double *)&v397[11] = v387;
  *(double *)&v397[12] = v215;
  *(double *)&v397[13] = v343 + v345 * v344;
  *(double *)&v397[14] = v87;
  v365 = v217;
  *(double *)&v397[15] = v217;
  *(double *)&v397[16] = obj;
  v398 = v416;
  v373 = (void (**)(void))MEMORY[0x1A8598C40](v397);
  -[UIImageView superview](v388->_lockView, "superview");
  v218 = (void *)objc_claimAutoreleasedReturnValue();

  if (v218)
  {
    -[_SFNavigationBar _lockImageTintColorForSquishTransformFactor:](v388);
    v219 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v388->_lockView, "setTintColor:", v219);
    -[UIImageView setTintColor:](v388->_squishedLockView, "setTintColor:", v219);

  }
  -[UIImageView superview](v388->_searchIndicator, "superview");
  v220 = (void *)objc_claimAutoreleasedReturnValue();

  if (v220)
  {
    -[_SFNavigationBar _searchIndicatorColorForSquishTransformFactor:]((id *)&v388->super.super.super.isa);
    v221 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](v388->_searchIndicator, "setTintColor:", v221);
    -[UIImageView setTintColor:](v388->_squishedSearchIndicator, "setTintColor:", v221);

  }
  v222 = v388;
  v223 = v381;
  v224 = objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled");
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v388->_shouldAnimateURLMovement);
  v373[2]();
  objc_msgSend(MEMORY[0x1E0DC3F10], "setAnimationsEnabled:", v224);
  -[UILabel setHidden:](v388->_securityAnnotationLabel, "setHidden:", v360 ^ 1u);
  if (v360)
  {
    if (v381)
    {
      v225 = *MEMORY[0x1E0C9D538];
      v226 = *(double *)(MEMORY[0x1E0C9D538] + 8);
      v227 = width;
      v228 = height;
    }
    else
    {
      -[SFURLLabel frame](v388->_URLLabel, "frame");
      v227 = width;
      v228 = height;
      v225 = CGRectGetWidth(v468) + 4.0;
      v226 = 0.0;
    }
    v234 = (v367 - v228) * 0.5;
    -[UIView setFrame:](v388->_securityAnnotationContainer, "setFrame:", v225, v226 - v234, v227, v228 + v367 - v228);
    -[UILabel setFrame:](v388->_securityAnnotationLabel, "setFrame:", 0.0, v234, v227, v228);
  }
  else
  {
    v229 = *p_width;
    v230 = v388->_cachedSecurityAnnotationLabelFittingSize.height;
    -[SFURLLabel frame](v388->_URLLabel, "frame");
    v231 = CGRectGetWidth(v467);
    v232 = -v229;
    if (!v381)
      v232 = v229 + v231;
    -[UIView setFrame:](v388->_securityAnnotationContainer, "setFrame:", v232, 0.0, v229, v230);
    v233 = -v231 - v229;
    if (v381)
      v233 = v229 + v231;
    -[UILabel setFrame:](v388->_securityAnnotationLabel, "setFrame:", v233, 0.0, v229, v230);
  }
  -[UILabel alpha](v388->_availabilityLabel, "alpha");
  v109 = v235 == 0.0;
  v236 = 0.0;
  if (v109)
    v236 = v345;
  -[UILabel setAlpha:](v388->_privateBrowsingLabel, "setAlpha:", v236);
  if (v346)
  {
    -[SFURLLabel urlSize](v388->_URLLabel, "urlSize");
    v238 = v237;
    -[UILabel bounds](v388->_privateBrowsingLabel, "bounds");
    v239 = CGRectGetWidth(v469) * 0.5 + 4.0;
    -[SFURLLabel frame](v388->_URLLabel, "frame");
    if (v381)
      v244 = v239 + CGRectGetMaxX(*(CGRect *)&v240);
    else
      v244 = CGRectGetMinX(*(CGRect *)&v240) - v239 - v87;
    -[UILabel setPosition:](v388->_privateBrowsingLabel, "setPosition:", v244, v238 * 0.5);
  }
  if (v388->_expanded)
  {
    -[UILabel setAlpha:](v388->_availabilityLabel, "setAlpha:", 0.0);
    -[UILabel removeFromSuperview](v388->_availabilityLabel, "removeFromSuperview");
    -[_SFNavigationBar _formatToggleButtonImage]((id *)&v388->super.super.super.isa);
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFNavigationBarToggleButton setImage:](v388->_formatToggleButton, "setImage:", v245);

    v222 = v388;
    -[SFNavigationBarToggleButton setHighlightsBackground:](v388->_formatToggleButton, "setHighlightsBackground:", 0);
    v223 = v381;
    v388->_formatButtonTapAction = 0;
    -[SFNavigationBarToggleButton setAccessibilityIdentifier:](v388->_formatToggleButton, "setAccessibilityIdentifier:", CFSTR("PageFormatMenuButton"));
  }
  -[SFDismissButton frame](v222->_dismissButton, "frame");
  v246 = CGRectGetWidth(v470);
  v247 = v246;
  v248 = v222->_inputMode != 1 || v376;
  v249 = obj * (v366 + v246);
  if (v248)
    v249 = 0.0;
  if (v223)
    v250 = v249;
  else
    v250 = 0.0;
  if (v223)
    v251 = 0.0;
  else
    v251 = v249;
  -[SFURLLabel frame](v222->_URLLabel, "frame");
  v252 = CGRectGetWidth(v471);
  if ((v363 & 1) != 0)
  {
    v263 = 0.0;
  }
  else
  {
    v253 = v369 + 7.0 + v250;
    v254 = v361 - v362 - (v371 + 7.0 + v251);
    v255 = v343 + v345 * v344 + v87 + v252;
    v256 = (v361 - v362 - v255) * 0.5;
    v257 = v255 + v256;
    v258 = v257 - v254;
    v259 = v257 <= v254;
    v260 = 0.0;
    if (!v259)
      v260 = v258;
    v261 = v256 - v260;
    v262 = v253 - v261;
    if (v261 >= v253)
      v262 = -0.0;
    v263 = v261 + v262;
  }
  expanded = v388->_expanded;
  -[_SFNavigationBarLabelsContainer layer](v388->_labelsContainer, "layer");
  v265 = (void *)objc_claimAutoreleasedReturnValue();
  v266 = v265;
  v267 = 0.0;
  if (!expanded)
    v267 = 1.0;
  objc_msgSend(v265, "setAnchorPoint:", v267, 0.0);

  v472.size.width = v378;
  v472.origin.x = x;
  v472.size.height = v384;
  v472.origin.y = y;
  v268 = CGRectGetWidth(v472);
  -[UIView frame](v388->_URLContainerClipView, "frame");
  v269 = CGRectGetMinX(v473);
  v270 = v388->_expanded;
  -[_SFNavigationBarLabelsContainer layer](v388->_labelsContainer, "layer");
  v271 = (void *)objc_claimAutoreleasedReturnValue();
  v272 = v271;
  v273 = v268 * 0.5 - v269 + -7.0;
  if (v270)
    v273 = 0.0;
  objc_msgSend(v271, "setPosition:", v273);

  v474.size.width = v378;
  v474.origin.x = x;
  v474.size.height = v384;
  v474.origin.y = y;
  v274 = CGRectGetWidth(v474);
  -[SFURLLabel urlSize](v388->_URLLabel, "urlSize");
  v276 = v275;
  v277 = fmax(v274 * 0.5 - (v87 + v263), 0.0);
  if (obj >= 1.0)
  {
    _SFRoundFloatToPixels();
    v277 = v278;
  }
  -[_SFNavigationBarLabelsContainer setBounds:](v388->_labelsContainer, "setBounds:", 0.0, 0.0, v277, v276);
  v279 = v376;
  if (v388->_inputMode != 1)
    v279 = 1;
  v280 = *(double *)(*(_QWORD *)&v413.b + 24);
  if ((v279 & 1) != 0)
  {
    v281 = v405[3];
  }
  else
  {
    v282 = 0.0;
    if (v381)
      v283 = v247;
    else
      v283 = 0.0;
    v280 = v283 + v280;
    if (!v381)
      v282 = v247;
    v281 = v282 + v405[3];
  }
  v284 = fmax(v280, v281);
  -[UILabel sizeToFit](v388->_availabilityLabel, "sizeToFit");
  -[UILabel frame](v388->_availabilityLabel, "frame");
  v377 = v285;
  v382 = v286;
  v288 = v287;
  labelsContainer = v388->_labelsContainer;
  -[_SFNavigationBarURLButton bounds](v388->_URLOutline, "bounds");
  -[_SFNavigationBarLabelsContainer convertRect:fromView:](labelsContainer, "convertRect:fromView:", v388->_URLOutline);
  v290 = v475.origin.x;
  v291 = v475.origin.y;
  v292 = v475.size.width;
  v293 = v475.size.height;
  MidX = CGRectGetMidX(v475);
  v295 = v340 + v284 * -2.0 * obj;
  v476.origin.x = v288;
  v476.origin.y = v377;
  v476.size.width = v295;
  v476.size.height = v382;
  v296 = CGRectGetWidth(v476);
  v477.origin.x = v290;
  v477.origin.y = v291;
  v477.size.width = v292;
  v477.size.height = v293;
  CGRectGetMidY(v477);
  v478.origin.x = MidX + v296 * -0.5;
  v478.origin.y = v377;
  v478.size.width = v295;
  v478.size.height = v382;
  CGRectGetHeight(v478);
  _SFRoundRectToPixels();
  -[UILabel setFrame:](v388->_availabilityLabel, "setFrame:");
  if (v388->_expanded)
  {
    v297 = -[_SFNavigationBar _textFieldTopMargin]((uint64_t)v388);
    -[UIView convertPoint:toView:](v388->_labelScalingContainer, "convertPoint:toView:", v388->_textField, *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
    v299 = v298;
    -[UIView center](v388->_labelScalingContainer, "center");
    v301 = v297 - v299 + v300;
  }
  else
  {
    v301 = 0.0;
  }
  -[UIView setPosition:](v388->_labelScalingContainer, "setPosition:", 7.0, v301);
  v302 = 1.0;
  if (v388->_expanded)
    v302 = v365;
  scaleView(v388->_labelScalingContainer, v302);
  if (v388->_fakeTextFieldSelectionView || v388->_fakeClearButton)
    -[_SFNavigationBar _updateFakeViews]((uint64_t)v388);
  v303 = -[_SFBarTheme backdropIsDark](v388->_effectiveTheme, "backdropIsDark");
  if (v303 != -[_SFNavigationBarTheme platterBackdropIsDark](v388->_effectiveTheme, "platterBackdropIsDark"))
    -[_SFNavigationBar _updateTextColor]((uint64_t)v388);
  -[SFLockdownStatusBar titleCapHeightInsetFromTop](v388->_lockdownStatusBar, "titleCapHeightInsetFromTop");
  _SFRoundFloatToPixels();
  v305 = v304;
  v479.size.width = v378;
  v479.origin.x = x;
  v479.size.height = v384;
  v479.origin.y = y;
  v306 = CGRectGetMaxY(v479);
  v307 = -[SFNavigationBarMetrics distanceFromLabelBaselineToURLOutlineBottom]((uint64_t)v388->_barMetrics);
  v480.origin.x = v374;
  v480.origin.y = v375;
  v480.size.width = v387;
  v480.size.height = rect;
  v308 = CGRectGetWidth(v480);
  if ((v363 & 1) != 0)
  {
    v310 = 0.0;
  }
  else
  {
    -[SFLockdownStatusBar preferredSize](v388->_lockdownStatusBar, "preferredSize");
    v310 = v309;
  }
  -[SFLockdownStatusBar ss_setUntransformedFrame:](v388->_lockdownStatusBar, "ss_setUntransformedFrame:", 0.0, v305 + v306 - v307, v308, v310);
  memset(&v415, 0, sizeof(v415));
  v311 = -[_SFNavigationBar _auxiliaryBarSquishedVerticalOffsetForSquishTransform:]((uint64_t)v388);
  CGAffineTransformMakeTranslation(&v415, 0.0, -v311);
  v414 = v415;
  CGAffineTransformScale(&v396, &v414, sx, sx);
  lockdownStatusBar = v388->_lockdownStatusBar;
  v395 = v396;
  -[SFLockdownStatusBar setTransform:](lockdownStatusBar, "setTransform:", &v395);
  v393 = 0u;
  v394 = 0u;
  v391 = 0u;
  v392 = 0u;
  obja = v388->_URLAccessoryItems;
  v313 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v391, v425, 16);
  if (v313)
  {
    v314 = *(_QWORD *)v392;
    v315 = *MEMORY[0x1E0C9D648];
    do
    {
      for (k = 0; k != v313; ++k)
      {
        if (*(_QWORD *)v392 != v314)
          objc_enumerationMutation(obja);
        v317 = *(void **)(*((_QWORD *)&v391 + 1) + 8 * k);
        objc_msgSend(v317, "squishedView");
        v318 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v317, "squishedEffectView");
        v319 = objc_claimAutoreleasedReturnValue();
        v320 = (void *)v319;
        if (v319)
          v321 = (void *)v319;
        else
          v321 = v318;
        v322 = v321;
        objc_msgSend(v318, "image");
        v323 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v318, "preferredSymbolConfiguration");
        v324 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v323, "imageWithSymbolConfiguration:", v324);
        v325 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v325, "size");
        v327 = v326;
        v329 = v328;

        objc_msgSend(v322, "setBounds:", v315, v207, v327, v329);
        objc_msgSend(v317, "view");
        v330 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v322, "superview");
        v331 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v330, "center");
        v333 = v332;
        v335 = v334;
        objc_msgSend(v330, "superview");
        v336 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v331, "convertPoint:fromView:", v336, v333, v335);
        objc_msgSend(v322, "setCenter:");

        objc_msgSend(v322, "frame");
        _SFRoundRectToPixels();
        objc_msgSend(v322, "setFrame:");
        if (v320)
        {
          objc_msgSend(v320, "bounds");
          objc_msgSend(v318, "setFrame:");
        }

      }
      v313 = -[NSArray countByEnumeratingWithState:objects:count:](obja, "countByEnumeratingWithState:objects:count:", &v391, v425, 16);
    }
    while (v313);
  }

  WeakRetained = objc_loadWeakRetained((id *)&v388->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(WeakRetained, "navigationBarDidLayoutSubviews:", v388);

  _Block_object_dispose(&v404, 8);
  _Block_object_dispose(&v413, 8);
}

- (double)_layoutBounds
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;

  if (a1)
  {
    objc_msgSend((id)a1, "bounds");
    objc_msgSend((id)a1, "window");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "windowScene");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "statusBarManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v4, "isStatusBarHidden") & 1) == 0 && *(double *)(a1 + 936) != 0.0)
      _SFDeviceStatusBarHasNonTransparentBackground();

    v5 = *(_QWORD *)(a1 + 632);
    v6 = objc_msgSend((id)objc_opt_class(), "_metricsCategory");
    -[SFNavigationBarMetrics barHeightWithBarMetricsCategory:](v5, v6);
  }
  return 0.0;
}

- (uint64_t)_updateLockViewIfNeeded
{
  uint64_t v1;
  double v2;
  double v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  double v8;
  double v9;

  if (result)
  {
    v1 = result;
    if (*(_BYTE *)(result + 841))
    {
      *(_BYTE *)(result + 841) = 0;
      objc_msgSend(*(id *)(result + 872), "intrinsicContentSize");
      v3 = v2;
      v5 = v4;
      -[SFNavigationBarMetrics accessoryImageSymbolConfiguration](*(_QWORD **)(v1 + 632));
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 872), "setPreferredSymbolConfiguration:", v6);

      -[SFNavigationBarMetrics squishedAccessoryImageSymbolConfiguration](*(_QWORD **)(v1 + 632));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(v1 + 864), "setPreferredSymbolConfiguration:", v7);

      result = objc_msgSend(*(id *)(v1 + 872), "intrinsicContentSize");
      if (v3 != v9 || v5 != v8)
        return objc_msgSend((id)v1, "setNeedsLayout");
    }
  }
  return result;
}

- (id)_viewForAccessoryButtonType:(uint64_t)a1
{
  id v3;

  v3 = 0;
  if (a1 && a2 <= 3)
    v3 = *(id *)(a1 + *off_1E4AC17B0[a2]);
  return v3;
}

- (void)_widthForAccessoryButtonType:(uint64_t)a1
{
  if (a1)
  {
    if (a2 < 2)
    {
      fmin(-[SFNavigationBarMetrics urlOutlineHeight](*(_QWORD *)(a1 + 632)), 44.0);
    }
    else if (a2 == 2)
    {
      if (objc_msgSend(*(id *)(a1 + 888), "hasHiddenElements", 0.0))
        objc_msgSend(*(id *)(a1 + 728), "intrinsicContentSize");
      else
        objc_msgSend(MEMORY[0x1E0D4ECE0], "glyphSize");
    }
    else if (a2 == 3)
    {
      -[SFNavigationBarMetrics urlOutlineHeight](*(_QWORD *)(a1 + 632));
    }
  }
}

- (_QWORD)_lockImageTintColorForSquishTransformFactor:(_QWORD *)a1
{
  void *v1;
  double v2;
  double v3;

  if (a1)
  {
    v1 = (void *)a1[113];
    v2 = 0.0;
    if (a1[103] != 1)
    {
      SFBarBackgroundAlphaForSquishTransformFactor();
      v2 = v3;
    }
    objc_msgSend(v1, "platterTextColorForPlatterAlpha:", v2);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_searchIndicatorColorForSquishTransformFactor:(id *)a1
{
  id *v1;
  void *v2;
  uint64_t v3;
  id v4;
  double v5;

  if (a1)
  {
    v1 = a1;
    objc_msgSend(a1[111], "text");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v2, "length");

    v4 = v1[113];
    if (v3)
    {
      v5 = 0.0;
      if (v1[103] != (id)1)
        SFBarBackgroundAlphaForSquishTransformFactor();
      objc_msgSend(v4, "platterTextColorForPlatterAlpha:", v5);
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(v1[113], "platterPlaceholderTextColor");
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (void)_updateFakeViews
{
  double v2;
  double v3;
  double v4;
  CGFloat v5;
  void *v6;
  double MaxX;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  CGFloat v25;
  CGFloat v26;
  CGFloat v27;
  CGFloat v28;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  double v39;
  double v40;
  id v41;
  void *v42;
  id v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;
  CGRect v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;

  if (a1)
  {
    v2 = *(double *)(a1 + 536);
    v3 = *(double *)(a1 + 544) - v2;
    objc_msgSend(*(id *)(a1 + 456), "bounds");
    v5 = v4;
    v6 = *(void **)(a1 + 512);
    objc_msgSend(v6, "bounds");
    objc_msgSend(v6, "convertRect:toView:", *(_QWORD *)(a1 + 456));
    MaxX = CGRectGetMaxX(v44);
    v45.origin.y = 0.0;
    v45.origin.x = v2;
    v45.size.width = v3;
    v45.size.height = v5;
    v8 = CGRectGetMaxX(v45);
    v9 = fmax(MaxX - v2, 0.0);
    if (v8 > MaxX)
      v3 = v9;
    objc_msgSend(*(id *)(a1 + 456), "font");
    v43 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "ascender");
    v11 = v10;
    objc_msgSend(*(id *)(a1 + 456), "_firstLineBaselineFrameOriginY");
    v13 = v12 - v11 + -1.0;
    objc_msgSend(v43, "descender");
    v15 = v11 - v14 + 1.0;
    UIRoundToViewScale();
    objc_msgSend(*(id *)(a1 + 456), "convertRect:toView:", *(_QWORD *)(a1 + 680), v2, v13, v3, v16 + v15);
    v18 = v17;
    v20 = v19;
    v22 = v21;
    v24 = v23;
    objc_msgSend(*(id *)(a1 + 680), "bounds");
    v54.origin.x = v25;
    v54.origin.y = v26;
    v54.size.width = v27;
    v54.size.height = v28;
    v46.origin.x = v18;
    v46.origin.y = v20;
    v46.size.width = v22;
    v46.size.height = v24;
    v47 = CGRectIntersection(v46, v54);
    x = v47.origin.x;
    y = v47.origin.y;
    width = v47.size.width;
    height = v47.size.height;
    if (CGRectIsNull(v47))
    {
      x = *MEMORY[0x1E0C9D648];
      y = *(double *)(MEMORY[0x1E0C9D648] + 8);
      width = *(double *)(MEMORY[0x1E0C9D648] + 16);
      height = *(double *)(MEMORY[0x1E0C9D648] + 24);
    }
    v48.origin.x = x;
    v48.origin.y = y;
    v48.size.width = width;
    v48.size.height = height;
    CGRectGetMinX(v48);
    _SFFloorFloatToPixels();
    v33 = v49.origin.x;
    v49.origin.y = y;
    v49.size.width = width;
    v49.size.height = height;
    CGRectGetMinY(v49);
    _SFFloorFloatToPixels();
    v35 = v34;
    v50.origin.x = v33;
    v50.origin.y = v35;
    v50.size.width = width;
    v50.size.height = height;
    CGRectGetMaxX(v50);
    _SFFloorFloatToPixels();
    v37 = v36;
    v51.origin.x = v33;
    v51.origin.y = v35;
    v51.size.width = width;
    v51.size.height = height;
    v38 = v37 - CGRectGetMinX(v51);
    v52.origin.x = v33;
    v52.origin.y = v35;
    v52.size.width = v38;
    v52.size.height = height;
    CGRectGetMaxY(v52);
    _SFFloorFloatToPixels();
    v40 = v39;
    v53.origin.x = v33;
    v53.origin.y = v35;
    v53.size.width = v38;
    v53.size.height = height;
    objc_msgSend(*(id *)(a1 + 528), "setFrame:", v33, v35, v38, v40 - CGRectGetMinY(v53));
    v41 = (id)objc_msgSend(*(id *)(a1 + 912), "_clearButton");
    v42 = *(void **)(a1 + 912);
    objc_msgSend(v42, "clearButtonRect");
    objc_msgSend(v42, "convertRect:toView:", *(_QWORD *)(a1 + 680));
    _SFRoundRectToPixels();
    objc_msgSend(*(id *)(a1 + 552), "ss_setUntransformedFrame:");

  }
}

- (void)clearEphemeralUI
{
  -[_SFNavigationBar _hideAvailabilityLabelAnimated:]((uint64_t)self, 0);
}

- (void)_hideAvailabilityLabelAnimated:(uint64_t)a1
{
  void *v4;
  double v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[5];

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 800), "invalidate");
    v4 = *(void **)(a1 + 800);
    *(_QWORD *)(a1 + 800) = 0;

    objc_msgSend(*(id *)(a1 + 472), "alpha");
    if (v5 != 0.0)
    {
      v8[0] = MEMORY[0x1E0C809B0];
      v8[1] = 3221225472;
      v8[2] = __51___SFNavigationBar__hideAvailabilityLabelAnimated___block_invoke;
      v8[3] = &unk_1E4ABFE00;
      v8[4] = a1;
      v6 = MEMORY[0x1A8598C40](v8);
      v7 = (void *)v6;
      if (a2)
        (*(void (**)(uint64_t))(v6 + 16))(v6);
      else
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v6);

    }
  }
}

- (id)_hitTestCandidateViews
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  uint64_t *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  if (!a1)
    return 0;
  -[_SFNavigationBar _setUpFormatToggleButtonIfNeeded](a1);
  v2 = *(_QWORD *)(a1 + 760);
  if (*(_BYTE *)(a1 + 880))
  {
    v15 = *(_QWORD *)(a1 + 728);
    v16 = v2;
    v3 = *(_QWORD *)(a1 + 744);
    v17 = *(_QWORD *)(a1 + 736);
    v18 = v3;
    v19 = *(_QWORD *)(a1 + 784);
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v15;
    v6 = 5;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 728);
    v12 = v2;
    v7 = *(_QWORD *)(a1 + 744);
    v13 = *(_QWORD *)(a1 + 736);
    v14 = v7;
    v4 = (void *)MEMORY[0x1E0C99D20];
    v5 = &v11;
    v6 = 4;
  }
  objc_msgSend(v4, "arrayWithObjects:count:", v5, v6, v11, v12, v13, v14, v15, v16, v17, v18, v19, v20);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  if (*(_QWORD *)(a1 + 816))
    objc_msgSend(v9, "addObject:");
  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  double v13;
  double v14;
  _SFNavigationBarURLButton *v15;
  UIButton *compressedBarButton;
  UIButton *v17;
  _SFNavigationBarURLButton *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  void *v24;
  int v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  _SFNavigationBarURLButton *v29;
  uint64_t v30;
  double v31;
  uint64_t i;
  void *v33;
  double v34;
  void *v35;
  CGFloat v36;
  CGFloat v37;
  CGFloat width;
  CGFloat height;
  double v40;
  double v41;
  _SFNavigationBarURLButton *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  void *v51;
  double v52;
  CGFloat v53;
  double v54;
  CGFloat v55;
  double v56;
  CGFloat v57;
  double v58;
  CGFloat v59;
  _SFNavigationBarURLButton *URLOutline;
  CGFloat v62;
  double v63;
  double v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  CGFloat v68;
  CGFloat v69;
  double v70;
  _SFNavigationBarURLButton *v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  objc_super v76;
  _BYTE v77[128];
  uint64_t v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;

  y = a3.y;
  x = a3.x;
  v78 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[_SFNavigationBar layer](self, "layer");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationBar layer](self, "layer");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "presentationLayer");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "convertPoint:toLayer:", v10, x, y);
  v12 = v11;
  v14 = v13;

  v76.receiver = self;
  v76.super_class = (Class)_SFNavigationBar;
  -[_SFNavigationBar hitTest:withEvent:](&v76, sel_hitTest_withEvent_, v7, v12, v14);
  v15 = (_SFNavigationBarURLButton *)objc_claimAutoreleasedReturnValue();
  if (v15)
  {
    if (-[UIButton isUserInteractionEnabled](self->_compressedBarButton, "isUserInteractionEnabled"))
    {
      compressedBarButton = self->_compressedBarButton;
LABEL_4:
      v17 = compressedBarButton;
LABEL_30:
      v18 = (_SFNavigationBarURLButton *)v17;
      goto LABEL_31;
    }
    if (self->_expanded)
    {
      -[UITextField convertPoint:fromView:](self->_textField, "convertPoint:fromView:", self, v12, v14);
      v20 = v19;
      v22 = v21;
      if (-[UITextField pointInside:withEvent:](self->_textField, "pointInside:withEvent:", v7))
      {
        -[UITextField hitTest:withEvent:](self->_textField, "hitTest:withEvent:", v7, v20, v22);
        v17 = (UIButton *)objc_claimAutoreleasedReturnValue();
        goto LABEL_30;
      }
      if (self->_usesNarrowLayout)
      {
        -[UIButton frame](self->_cancelButton, "frame");
        v44 = v43;
        v46 = v45;
        v48 = v47;
        v50 = v49;
        -[UIButton superview](self->_cancelButton, "superview");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        -[_SFNavigationBar convertRect:fromView:](self, "convertRect:fromView:", v51, v44, v46, v48, v50);
        v53 = v52;
        v55 = v54;
        v57 = v56;
        v59 = v58;

        if (-[_SFNavigationBar _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout"))
        {
          v81.origin.x = v53;
          v81.origin.y = v55;
          v81.size.width = v57;
          v81.size.height = v59;
          if (v12 >= CGRectGetMinX(v81))
            goto LABEL_32;
        }
        v82.origin.x = v53;
        v82.origin.y = v55;
        v82.size.width = v57;
        v82.size.height = v59;
        if (v12 <= CGRectGetMaxX(v82))
        {
LABEL_32:
          compressedBarButton = self->_cancelButton;
          goto LABEL_4;
        }
      }
LABEL_29:
      v17 = v15;
      goto LABEL_30;
    }
    -[SFNavigationBarItem overlayConfiguration](self->_item, "overlayConfiguration");
    v23 = objc_claimAutoreleasedReturnValue();
    if (v23)
    {
      v24 = (void *)v23;
      v25 = -[_SFNavigationBarURLButton isDescendantOfView:](v15, "isDescendantOfView:", self->_URLOutline);

      if (v25)
        goto LABEL_29;
    }
    -[_SFNavigationBar _hitTestCandidateViews]((uint64_t)self);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v72 = 0u;
    v73 = 0u;
    v74 = 0u;
    v75 = 0u;
    v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
    if (v27)
    {
      v28 = v27;
      v29 = 0;
      v30 = *(_QWORD *)v73;
      v31 = 10.0;
      do
      {
        for (i = 0; i != v28; ++i)
        {
          if (*(_QWORD *)v73 != v30)
            objc_enumerationMutation(v26);
          v33 = *(void **)(*((_QWORD *)&v72 + 1) + 8 * i);
          if (v33)
          {
            objc_msgSend(*(id *)(*((_QWORD *)&v72 + 1) + 8 * i), "alpha");
            if (v34 >= 0.01 && (objc_msgSend(v33, "isHidden") & 1) == 0)
            {
              objc_msgSend(v33, "superview");
              v35 = (void *)objc_claimAutoreleasedReturnValue();

              if (v35)
              {
                objc_msgSend(v33, "bounds");
                objc_msgSend(v33, "convertRect:toView:", self);
                v36 = v79.origin.x;
                v37 = v79.origin.y;
                width = v79.size.width;
                height = v79.size.height;
                v40 = CGRectGetMinX(v79) - v12;
                v80.origin.x = v36;
                v80.origin.y = v37;
                v80.size.width = width;
                v80.size.height = height;
                v41 = fmax(v40, v12 - CGRectGetMaxX(v80));
                if (v41 < v31)
                {
                  v42 = v33;

                  v29 = v42;
                  v31 = v41;
                }
              }
            }
          }
        }
        v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v72, v77, 16);
      }
      while (v28);
    }
    else
    {
      v29 = 0;
      v31 = 10.0;
    }
    URLOutline = self->_URLOutline;
    -[_SFNavigationBarURLButton bounds](URLOutline, "bounds");
    -[_SFNavigationBarURLButton convertRect:toView:](URLOutline, "convertRect:toView:", self);
    if (!v29)
    {
      v66 = v62;
      v67 = v63;
      v68 = v64;
      v69 = v65;
      v70 = CGRectGetMinX(*(CGRect *)&v62) - v12;
      v83.origin.x = v66;
      v83.origin.y = v67;
      v83.size.width = v68;
      v83.size.height = v69;
      if (fmax(v70, v12 - CGRectGetMaxX(v83)) >= v31)
        v29 = 0;
      else
        v29 = self->_URLOutline;
    }
    if (v29)
      v71 = v29;
    else
      v71 = v15;
    v18 = v71;

  }
  else
  {
    v18 = 0;
  }
LABEL_31:

  return v18;
}

- (id)_expandedURLLabelParagraphStyle
{
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;

  if (a1)
  {
    v1 = (void *)_expandedURLLabelParagraphStyle_paragraphStyle;
    if (!_expandedURLLabelParagraphStyle_paragraphStyle)
    {
      objc_msgSend(MEMORY[0x1E0DC33B8], "defaultParagraphStyle");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      v3 = objc_msgSend(v2, "mutableCopy");
      v4 = (void *)_expandedURLLabelParagraphStyle_paragraphStyle;
      _expandedURLLabelParagraphStyle_paragraphStyle = v3;

      objc_msgSend((id)_expandedURLLabelParagraphStyle_paragraphStyle, "setBaseWritingDirection:", 0);
      objc_msgSend((id)_expandedURLLabelParagraphStyle_paragraphStyle, "setLineBreakMode:", 2);
      v1 = (void *)_expandedURLLabelParagraphStyle_paragraphStyle;
    }
    a1 = v1;
  }
  return a1;
}

- (void)_updateText
{
  void *v3;
  void *v4;
  double v5;
  UILabel *v6;
  UILabel *securityAnnotationLabel;
  double v8;
  void *v9;
  __CFString *v10;
  id v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  NSAttributedString *v16;
  NSAttributedString *attributedTextWhenExpanded;
  const __CTLine *v18;
  CFIndex v19;
  double OffsetForStringIndex;
  double v21;
  double v22;
  UIView *fakeTextFieldSelectionView;
  UIButton *fakeClearButton;
  uint64_t v25;
  _QWORD v26[5];
  _QWORD v27[2];
  _QWORD v28[3];

  v28[2] = *MEMORY[0x1E0C80C00];
  -[SFNavigationBarItem text](self->_item, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFNavigationBarItem textWhenExpanded](self->_item, "textWhenExpanded");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = -[SFNavigationBarItem startIndexOfTextInExpandedText](self->_item, "startIndexOfTextInExpandedText");
  if (!objc_msgSend(v3, "length"))
  {
    v9 = v4;
    -[UITextField placeholder](self->_textField, "placeholder");
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue();
    -[SFURLLabel setText:](self->_URLLabel, "setText:", v10);
    goto LABEL_9;
  }
  -[SFURLLabel setText:](self->_URLLabel, "setText:", v3);
  if (!-[SFNavigationBarItem showsSecurityAnnotation](self->_item, "showsSecurityAnnotation"))
  {
    securityAnnotationLabel = self->_securityAnnotationLabel;
    v8 = 0.0;
    goto LABEL_7;
  }
  -[UILabel alpha](self->_availabilityLabel, "alpha");
  if (v5 == 0.0)
  {
    v6 = self->_securityAnnotationLabel;
    v26[0] = MEMORY[0x1E0C809B0];
    v26[1] = 3221225472;
    v26[2] = __31___SFNavigationBar__updateText__block_invoke;
    v26[3] = &unk_1E4ABFE00;
    v26[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "transitionWithView:duration:options:animations:completion:", v6, 5242880, v26, 0, 0.1);
    securityAnnotationLabel = self->_securityAnnotationLabel;
    v8 = 1.0;
LABEL_7:
    -[UILabel setAlpha:](securityAnnotationLabel, "setAlpha:", v8);
  }
  v9 = v4;
  v10 = v4;
LABEL_9:
  -[_SFNavigationBar _cancelDelayedReaderAvailabilityAnimation]((uint64_t)self);
  v11 = objc_alloc(MEMORY[0x1E0CB3498]);
  if (v10)
    v12 = v10;
  else
    v12 = &stru_1E4AC8470;
  v27[0] = *MEMORY[0x1E0DC32C0];
  -[_SFNavigationBar _expandedURLLabelParagraphStyle](self);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v28[0] = v13;
  v27[1] = *MEMORY[0x1E0DC32A0];
  -[UILabel font](self->_expandedURLLabel, "font");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v28[1] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, v27, 2);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = (NSAttributedString *)objc_msgSend(v11, "initWithString:attributes:", v12, v15);
  attributedTextWhenExpanded = self->_attributedTextWhenExpanded;
  self->_attributedTextWhenExpanded = v16;

  -[UILabel setAttributedText:](self->_expandedURLLabel, "setAttributedText:", self->_attributedTextWhenExpanded);
  if (objc_msgSend(v3, "length"))
  {
    if (v25 && v25 != 0x7FFFFFFFFFFFFFFFLL && objc_msgSend(v9, "length"))
    {
      v18 = CTLineCreateWithAttributedString((CFAttributedStringRef)self->_attributedTextWhenExpanded);
      if (objc_msgSend(v3, "characterAtIndex:", 0) == 8206)
        v19 = v25 + 1;
      else
        v19 = v25;
      OffsetForStringIndex = CTLineGetOffsetForStringIndex(v18, v19, 0);
      if (self->_usesNarrowLayout)
        v21 = -[SFNavigationBarMetrics narrowEditingScaleFactor]((uint64_t)self->_barMetrics);
      else
        v21 = 1.0;
      self->_offsetOfURLInExpandedURL = OffsetForStringIndex / v21;
      CFRelease(v18);
    }
    else
    {
      self->_offsetOfURLInExpandedURL = 0.0;
    }
  }
  else
  {
    -[_SFNavigationBar placeholderHorizontalInset](self, "placeholderHorizontalInset");
    self->_offsetOfURLInExpandedURL = v22;
  }
  -[UIView removeFromSuperview](self->_fakeTextFieldSelectionView, "removeFromSuperview");
  fakeTextFieldSelectionView = self->_fakeTextFieldSelectionView;
  self->_fakeTextFieldSelectionView = 0;

  -[UIButton removeFromSuperview](self->_fakeClearButton, "removeFromSuperview");
  fakeClearButton = self->_fakeClearButton;
  self->_fakeClearButton = 0;

  -[_SFNavigationBar _updateSearchIndicator]((uint64_t)self);
  -[_SFNavigationBar _updateTextColor]((uint64_t)self);
  -[_SFNavigationBar _updateTextMetrics]((uint64_t)self);
  -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");

}

- (void)_cancelDelayedReaderAvailabilityAnimation
{
  void *v2;
  void *v3;

  if (a1)
  {
    v2 = *(void **)(a1 + 808);
    if (v2)
    {
      dispatch_block_cancel(v2);
      v3 = *(void **)(a1 + 808);
      *(_QWORD *)(a1 + 808) = 0;

    }
  }
}

- (void)_updateSearchIndicator
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  double v9;
  double v10;

  if (a1)
  {
    objc_msgSend(*(id *)(a1 + 648), "superview");
    v2 = (void *)objc_claimAutoreleasedReturnValue();

    if (v2)
    {
      objc_msgSend(*(id *)(a1 + 648), "intrinsicContentSize");
      v4 = v3;
      v6 = v5;
      -[SFNavigationBarMetrics accessoryImageSymbolConfiguration](*(_QWORD **)(a1 + 632));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 648), "setPreferredSymbolConfiguration:", v7);

      -[SFNavigationBarMetrics squishedAccessoryImageSymbolConfiguration](*(_QWORD **)(a1 + 632));
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 656), "setPreferredSymbolConfiguration:", v8);

      objc_msgSend(*(id *)(a1 + 648), "intrinsicContentSize");
      if (v4 != v10 || v6 != v9)
        objc_msgSend((id)a1, "setNeedsLayout");
    }
  }
}

- (id)_notSecureAnnotationColor
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1[111], "hasFocusedSensitiveFieldOnCurrentPage"))
      -[_SFNavigationBar _notSecureWarningColor](v1);
    else
      -[_SFNavigationBar _notSecureGrayColor](v1);
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (_QWORD)_notSecureGrayColor
{
  _QWORD *v1;
  void *v2;
  double v3;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[113];
    objc_msgSend(a1, "minimumHeight");
    objc_msgSend(v1, "bounds");
    v3 = 0.0;
    if (v1[103] != 1)
      SFBarBackgroundAlphaForSquishTransformFactor();
    objc_msgSend(v2, "annotationTextColorForPlatterAlpha:", v3);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)setExpanded:(BOOL)a3
{
  -[_SFNavigationBar setExpanded:completionHandler:](self, "setExpanded:completionHandler:", a3, 0);
}

- (void)setExpanded:(BOOL)a3 completionHandler:(id)a4
{
  _BOOL8 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  v4 = a3;
  v9 = a4;
  if (v4)
  {
    -[SFNavigationBarItem textWhenExpanded](self->_item, "textWhenExpanded");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "length");

    v8 = 0;
  }
  else
  {
    v7 = 0;
    v8 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[_SFNavigationBar setExpanded:textFieldSelectionRange:completionHandler:](self, "setExpanded:textFieldSelectionRange:completionHandler:", v4, v8, v7, v9);

}

- (void)setLockdownStatusBar:(id)a3
{
  SFLockdownStatusBar *v5;
  SFLockdownStatusBar **p_lockdownStatusBar;
  SFLockdownStatusBar *lockdownStatusBar;
  void *v8;
  double v9;
  SFLockdownStatusBar *v10;

  v5 = (SFLockdownStatusBar *)a3;
  p_lockdownStatusBar = &self->_lockdownStatusBar;
  lockdownStatusBar = self->_lockdownStatusBar;
  if (lockdownStatusBar != v5)
  {
    v10 = v5;
    if (lockdownStatusBar)
      -[SFLockdownStatusBar removeFromSuperview](lockdownStatusBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_lockdownStatusBar, a3);
    -[SFLockdownStatusBar layer](*p_lockdownStatusBar, "layer");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setAnchorPoint:", 0.5, 0.0);

    -[_SFNavigationBar addSubview:](self, "addSubview:", *p_lockdownStatusBar);
    -[_SFNavigationBar defaultHeight](self, "defaultHeight");
    self->_maximumHeight = v9;
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
    v5 = v10;
  }

}

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4
{
  -[_SFNavigationBar setExpanded:textFieldSelectionRange:completionHandler:](self, "setExpanded:textFieldSelectionRange:completionHandler:", a3, a4.location, a4.length, 0);
}

- (void)setExpanded:(BOOL)a3 textFieldSelectionRange:(_NSRange)a4 completionHandler:(id)a5
{
  NSUInteger length;
  NSUInteger location;
  _BOOL4 v7;
  id v9;
  uint64_t v10;
  id v11;
  uint64_t v12;
  void *v13;
  NSObject *v14;
  void *v15;
  double v16;
  NSObject *v17;
  void *v18;
  NSObject *v19;
  void *v20;
  uint64_t v21;
  void *v22;
  NSObject *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  NSObject *v28;
  _BOOL4 shouldHidePlaceholderURLItemsForPencilInput;
  _QWORD v30[5];
  NSObject *v31;
  BOOL v32;
  _QWORD v33[5];
  _QWORD v34[5];
  NSObject *v35;
  _QWORD v36[4];
  NSObject *v37;
  _QWORD v38[5];
  _QWORD v39[5];
  NSObject *v40;
  NSUInteger v41;
  NSUInteger v42;
  _QWORD v43[4];
  NSObject *v44;
  _QWORD v45[5];
  _QWORD v46[5];
  NSObject *v47;
  _QWORD v48[5];
  _QWORD v49[5];
  _QWORD v50[4];
  id v51;

  length = a4.length;
  location = a4.location;
  v7 = a3;
  v9 = a5;
  v10 = MEMORY[0x1E0C809B0];
  v50[0] = MEMORY[0x1E0C809B0];
  v50[1] = 3221225472;
  v50[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke;
  v50[3] = &unk_1E4AC0230;
  v11 = v9;
  v51 = v11;
  v12 = MEMORY[0x1A8598C40](v50);
  v13 = (void *)v12;
  if (self->_expanded == v7)
  {
    (*(void (**)(uint64_t))(v12 + 16))(v12);
  }
  else
  {
    self->_expanded = v7;
    shouldHidePlaceholderURLItemsForPencilInput = self->_shouldHidePlaceholderURLItemsForPencilInput;
    v14 = dispatch_group_create();
    v49[0] = v10;
    v49[1] = 3221225472;
    v49[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_2;
    v49[3] = &unk_1E4ABFE00;
    v49[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v49);
    dispatch_group_enter(v14);
    v15 = (void *)MEMORY[0x1E0DC3F10];
    if (self->_expanded)
      v16 = 0.0;
    else
      v16 = 0.1;
    v48[0] = v10;
    v48[1] = 3221225472;
    v48[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_3;
    v48[3] = &unk_1E4ABFE00;
    v48[4] = self;
    v46[0] = v10;
    v46[1] = 3221225472;
    v46[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_4;
    v46[3] = &unk_1E4AC15B8;
    v46[4] = self;
    v17 = v14;
    v47 = v17;
    objc_msgSend(v15, "animateWithDuration:delay:options:animations:completion:", 50659328, v48, v46, 0.2, v16);
    dispatch_group_enter(v17);
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v45[0] = v10;
    v45[1] = 3221225472;
    v45[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_5;
    v45[3] = &unk_1E4ABFE00;
    v45[4] = self;
    v43[0] = v10;
    v43[1] = 3221225472;
    v43[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_6;
    v43[3] = &unk_1E4AC05E0;
    v19 = v17;
    v44 = v19;
    objc_msgSend(v18, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v45, v43);
    if (location != 0x7FFFFFFFFFFFFFFFLL)
    {
      -[SFNavigationBarItem textWhenExpanded](self->_item, "textWhenExpanded");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = objc_msgSend(v20, "length");

      if (!shouldHidePlaceholderURLItemsForPencilInput)
      {
        if (v21)
        {
          dispatch_group_enter(v19);
          v22 = (void *)MEMORY[0x1E0DC3F10];
          v39[0] = v10;
          v39[1] = 3221225472;
          v39[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_7;
          v39[3] = &unk_1E4AC15E0;
          v39[4] = self;
          v41 = location;
          v42 = length;
          v23 = v19;
          v40 = v23;
          objc_msgSend(v22, "performWithoutAnimation:", v39);
          dispatch_group_enter(v23);
          v24 = (void *)MEMORY[0x1E0DC3F10];
          v38[0] = v10;
          v38[1] = 3221225472;
          v38[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_8;
          v38[3] = &unk_1E4ABFE00;
          v38[4] = self;
          v36[0] = v10;
          v36[1] = 3221225472;
          v36[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_9;
          v36[3] = &unk_1E4AC05E0;
          v25 = v23;
          v37 = v25;
          objc_msgSend(v24, "_animateWithDuration:delay:options:factory:animations:completion:", 50724864, self, v38, v36, 0.2, 0.0);
          dispatch_group_enter(v25);
          v26 = (void *)MEMORY[0x1E0DC3F10];
          v34[0] = v10;
          v34[1] = 3221225472;
          v34[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_10;
          v34[3] = &unk_1E4ABFB20;
          v34[4] = self;
          v35 = v25;
          objc_msgSend(v26, "performWithoutAnimation:", v34);

        }
      }
    }
    dispatch_group_enter(v19);
    v27 = (void *)MEMORY[0x1E0DC3F10];
    v33[0] = v10;
    v33[1] = 3221225472;
    v33[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_11;
    v33[3] = &unk_1E4ABFE00;
    v33[4] = self;
    v30[0] = v10;
    v30[1] = 3221225472;
    v30[2] = __74___SFNavigationBar_setExpanded_textFieldSelectionRange_completionHandler___block_invoke_12;
    v30[3] = &unk_1E4AC1608;
    v32 = shouldHidePlaceholderURLItemsForPencilInput;
    v30[4] = self;
    v31 = v19;
    v28 = v19;
    objc_msgSend(v27, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v33, v30);
    dispatch_group_notify(v28, MEMORY[0x1E0C80D38], v13);

  }
}

- (void)_setHidePlaceholderURLItemsForPencilInput:(uint64_t)a1
{
  if (a1)
  {
    if (*(unsigned __int8 *)(a1 + 640) != (_DWORD)a2)
    {
      *(_BYTE *)(a1 + 640) = a2;
      objc_msgSend(*(id *)(a1 + 432), "setHidden:", a2);
      objc_msgSend(*(id *)(a1 + 912), "setClearsPlaceholderOnBeginEditing:", a2);
      objc_msgSend(*(id *)(a1 + 888), "setTemporarilySuppressText:", a2);
      objc_msgSend((id)a1, "_updateText");
      -[_SFNavigationBar _updateFakeViews](a1);
      -[_SFNavigationBar _updateAccessoryButtonsVisibility](a1);
    }
  }
}

- (void)setControlsHidden:(BOOL)a3
{
  if (self->_controlsHidden != a3)
  {
    self->_controlsHidden = a3;
    -[_SFNavigationBar _updateSeparatorAlpha]((uint64_t)self);
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setMinimumBackdropHeight:(double)a3
{
  if (self->_minimumBackdropHeight != a3)
  {
    self->_minimumBackdropHeight = a3;
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGRect)URLOutlineFrameInNavigationBarSpace
{
  double v3;
  double v4;
  double v5;
  double v6;
  CGRect result;

  -[_SFNavigationBarURLButton bounds](self->_URLOutline, "bounds");
  -[_SFNavigationBar convertRect:fromView:](self, "convertRect:fromView:", self->_URLOutline);
  result.size.height = v6;
  result.size.width = v5;
  result.origin.y = v4;
  result.origin.x = v3;
  return result;
}

- (CGRect)urlOutlineFrameRelativeToView:(id)a3
{
  id v4;
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
  CGRect result;

  v4 = a3;
  -[_SFNavigationBar URLOutlineFrameInNavigationBarSpace](self, "URLOutlineFrameInNavigationBarSpace");
  -[_SFNavigationBar convertRect:toView:](self, "convertRect:toView:", v4);
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;

  v13 = v6;
  v14 = v8;
  v15 = v10;
  v16 = v12;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (void)_updateShowsLockIcon
{
  int v3;
  UIImageView *lockView;
  UIImageView *v5;
  UIImageView *v6;
  void *v7;
  UIImageView *v8;
  UIImageView *squishedLockView;
  UIVisualEffectView *v10;
  UIVisualEffectView *lockEffectView;
  void *v12;
  UIVisualEffectView *v13;
  UIVisualEffectView *squishedLockEffectView;
  void *v15;
  void *v16;
  void *v17;

  v3 = -[SFNavigationBarItem showsLockIcon](self->_item, "showsLockIcon");
  lockView = self->_lockView;
  if (v3)
  {
    if (!lockView)
    {
      v5 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      v6 = self->_lockView;
      self->_lockView = v5;

      objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.fill"));
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIImageView setImage:](self->_lockView, "setImage:", v7);
      -[UIImageView setTintAdjustmentMode:](self->_lockView, "setTintAdjustmentMode:", 1);
      v8 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
      squishedLockView = self->_squishedLockView;
      self->_squishedLockView = v8;

      -[UIImageView setImage:](self->_squishedLockView, "setImage:", v7);
      -[UIImageView setTintAdjustmentMode:](self->_squishedLockView, "setTintAdjustmentMode:", 1);
      v10 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
      lockEffectView = self->_lockEffectView;
      self->_lockEffectView = v10;

      _SFBackdropGroupNameForOwner();
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setGroupName:](self->_lockEffectView, "_setGroupName:", v12);

      v13 = (UIVisualEffectView *)objc_alloc_init(MEMORY[0x1E0DC3F58]);
      squishedLockEffectView = self->_squishedLockEffectView;
      self->_squishedLockEffectView = v13;

      _SFBackdropGroupNameForOwner();
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIVisualEffectView _setGroupName:](self->_squishedLockEffectView, "_setGroupName:", v15);

    }
    -[_SFNavigationBarLabelsContainer addSubview:](self->_labelsContainer, "addSubview:", self->_lockEffectView);
    -[UIVisualEffectView contentView](self->_lockEffectView, "contentView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "addSubview:", self->_lockView);

    -[UIView addSubview:](self->_squishedURLAccessoryItemsContainer, "addSubview:", self->_squishedLockEffectView);
    -[UIVisualEffectView contentView](self->_squishedLockEffectView, "contentView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", self->_squishedLockView);

    self->_lockViewNeedsUpdate = 1;
  }
  else if (lockView)
  {
    -[UIImageView removeFromSuperview](lockView, "removeFromSuperview");
    -[UIImageView removeFromSuperview](self->_squishedLockView, "removeFromSuperview");
  }
  -[_SFNavigationBar _updateActiveURLLabelAccessory]((uint64_t)self);
  -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)_hideAvailabilityLabelSoon
{
  uint64_t v2;
  void *v3;
  id v4;

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0C99E88], "timerWithTimeInterval:target:selector:userInfo:repeats:", a1, sel__hideAvailabilityLabelNow, 0, 0, 1.9);
    v2 = objc_claimAutoreleasedReturnValue();
    v3 = *(void **)(a1 + 800);
    *(_QWORD *)(a1 + 800) = v2;

    objc_msgSend(MEMORY[0x1E0C99E58], "mainRunLoop");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addTimer:forMode:", *(_QWORD *)(a1 + 800), *MEMORY[0x1E0C99860]);

  }
}

- (void)_hideAvailabilityLabelNow
{
  -[_SFNavigationBar _hideAvailabilityLabelAnimated:]((uint64_t)self, 1);
}

- (void)_updateAvailabilityButtonVisibilityForType:(int64_t)a3 animated:(BOOL)a4 showAvailabilityText:(BOOL)a5 adjustURLLabels:(BOOL)a6
{
  _BOOL4 v8;
  int v11;
  uint64_t v13;
  void *v14;
  id *v15;
  void *v16;
  id availabilityButtonDeferredAction;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  _SFNavigationBar *v22;
  id v23[2];
  char v24;
  BOOL v25;
  BOOL v26;
  _QWORD v27[4];
  id v28[2];
  BOOL v29;
  BOOL v30;
  BOOL v31;
  id location;

  v8 = a4;
  objc_initWeak(&location, self);
  v11 = -[SFNavigationBarAccessoryButtonArrangement containsButtonType:]((uint64_t)self->_accessoryButtonArrangement, 2);
  if (v11)
    v11 = !self->_expanded;
  if (a3)
  {
    if (a3 == 1)
    {
      if (!v11)
        goto LABEL_18;
      v11 = -[SFNavigationBarItem showsTranslationButton](self->_item, "showsTranslationButton");
    }
    else if (a3 == 2)
    {
      if (!v11)
        goto LABEL_18;
      v11 = -[SFNavigationBarItem showsBrowsingAssistantAvailabilityText](self->_item, "showsBrowsingAssistantAvailabilityText");
    }
  }
  else
  {
    if (!v11)
      goto LABEL_18;
    v11 = -[SFNavigationBarItem showsReaderButton](self->_item, "showsReaderButton");
  }
  if (self->_showingButtonWithAvailabilityLabel && v11 != 0)
  {
    if (!self->_availabilityButtonDeferredAction)
    {
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke;
      v27[3] = &unk_1E4AC1630;
      objc_copyWeak(v28, &location);
      v28[1] = (id)a3;
      v29 = v8;
      v30 = a5;
      v31 = a6;
      v16 = (void *)MEMORY[0x1A8598C40](v27);
      availabilityButtonDeferredAction = self->_availabilityButtonDeferredAction;
      self->_availabilityButtonDeferredAction = v16;

      v15 = v28;
      goto LABEL_22;
    }
    LOBYTE(v11) = 1;
  }
LABEL_18:
  v18 = MEMORY[0x1E0C809B0];
  v19 = 3221225472;
  v20 = __109___SFNavigationBar__updateAvailabilityButtonVisibilityForType_animated_showAvailabilityText_adjustURLLabels___block_invoke_2;
  v21 = &unk_1E4AC1680;
  v24 = v11;
  v25 = a5;
  v22 = self;
  v23[1] = (id)a3;
  objc_copyWeak(v23, &location);
  v26 = a6;
  v13 = MEMORY[0x1A8598C40](&v18);
  v14 = (void *)v13;
  if (v8)
    (*(void (**)(uint64_t))(v13 + 16))(v13);
  else
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v13, v18, v19, v20, v21, v22);

  v15 = v23;
LABEL_22:
  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
}

- (id)_availabilityLabelTextForType:(id *)a1
{
  if (a1)
  {
    if (a2 == 2)
    {
      objc_msgSend(a1[111], "browsingAssistantDetectionResult");
      WBSBrowsingAssistantContentTypeAvailabilityLabel();
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
    else if (a2 <= 1)
    {
      _WBSLocalizedString();
      a1 = (id *)objc_claimAutoreleasedReturnValue();
    }
  }
  return a1;
}

- (id)_availabilityButtonImageForType:(void *)a1
{
  if (a1)
  {
    switch(a2)
    {
      case 2:
        objc_msgSend(MEMORY[0x1E0D4ECE0], "pageMenuImageWithIntelligence:", 1);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 1:
        objc_msgSend(MEMORY[0x1E0D4ECE0], "translationImage");
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        break;
      case 0:
        objc_msgSend(MEMORY[0x1E0D4ECE0], "readerImageWithSummary:", 0);
        a1 = (void *)objc_claimAutoreleasedReturnValue();
        break;
    }
  }
  return a1;
}

- (uint64_t)_adjustLabelRectForLeadingButtonWithDelay:(uint64_t)result
{
  _QWORD v2[5];

  if (result)
  {
    v2[0] = MEMORY[0x1E0C809B0];
    v2[1] = 3221225472;
    v2[2] = __62___SFNavigationBar__adjustLabelRectForLeadingButtonWithDelay___block_invoke;
    v2[3] = &unk_1E4ABFE00;
    v2[4] = result;
    return objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultDampedSpringWithDelay:initialSpringVelocity:options:animations:completion:", 50331652, v2, 0, a2, 0.0);
  }
  return result;
}

- (uint64_t)_updateAvailabilityButtonAndTextVisibilityForType:(uint64_t)result
{
  id *v3;

  if (result)
  {
    v3 = (id *)result;
    if (-[SFNavigationBarAccessoryButtonArrangement containsButtonType:](*(_QWORD *)(result + 720), 2))
    {
      -[_SFNavigationBar _updateAccessoryButtonsAlpha](v3);
      -[_SFNavigationBar _updateAccessoryButtonsVisibility]((uint64_t)v3);
    }
    return objc_msgSend(v3, "_updateAvailabilityButtonVisibilityForType:animated:showAvailabilityText:adjustURLLabels:", a2, objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled"), objc_msgSend(v3[111], "_showsAvailabilityTextForType:style:", a2, 0), 1);
  }
  return result;
}

- (id)_mediaStateMuteButtonColor
{
  id *v1;

  if (a1)
  {
    v1 = a1;
    if (objc_msgSend(a1[113], "backdropIsRed"))
      objc_msgSend(v1[113], "URLAccessoryButtonTintColorForInputMode:", v1[103]);
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
    a1 = (id *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (void)_updateSecurityWarningsVisibility
{
  _SFNavigationBarLabelsContainer *labelsContainer;
  _SFNavigationBarLabelsContainer *v4;
  _QWORD v5[5];

  if (-[SFNavigationBarItem showsSecurityAnnotation](self->_item, "showsSecurityAnnotation")
    && (-[SFNavigationBarItem hasFocusedSensitiveFieldOnCurrentPage](self->_item, "hasFocusedSensitiveFieldOnCurrentPage") & 1) == 0)
  {
    -[_SFNavigationBar layoutIfNeeded](self, "layoutIfNeeded");
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
    -[_SFNavigationBar _updateText](self, "_updateText");
    self->_shouldAnimateURLMovement = 1;
    labelsContainer = self->_labelsContainer;
    if (labelsContainer)
      labelsContainer->_shouldAnimateBoundsChanges = 1;
    v5[0] = MEMORY[0x1E0C809B0];
    v5[1] = 3221225472;
    v5[2] = __53___SFNavigationBar__updateSecurityWarningsVisibility__block_invoke;
    v5[3] = &unk_1E4ABFE00;
    v5[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:usingSpringWithDamping:initialSpringVelocity:options:animations:completion:", 0, v5, 0, 0.35, 0.0, 2.5, 0.0);
    self->_shouldAnimateURLMovement = 0;
    v4 = self->_labelsContainer;
    if (v4)
      v4->_shouldAnimateBoundsChanges = 0;
  }
  else if (-[SFNavigationBarItem showsSecurityAnnotation](self->_item, "showsSecurityAnnotation"))
  {
    -[_SFNavigationBar _updateText](self, "_updateText");
  }
  else
  {
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentUnderStatusBarHeight:(double)a3
{
  if (self->_contentUnderStatusBarHeight != a3)
  {
    self->_contentUnderStatusBarHeight = a3;
    -[SFNavigationBarMetrics updateForStatusBarHeight:]((uint64_t)self->_barMetrics, a3);
    -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSuppressesBlur:(BOOL)a3
{
  NSObject *v4;
  uint64_t v5;

  if (self->_suppressesBlur != a3)
  {
    self->_suppressesBlur = a3;
    -[UIVisualEffectView setAllowsBlurring:](self->_backdrop, "setAllowsBlurring:", !a3);
    v4 = WBS_LOG_CHANNEL_PREFIXUserInterface();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      -[_SFNavigationBar setSuppressesBlur:].cold.1(a3, v4, v5);
  }
}

- (void)setUsesFaintSeparator:(BOOL)a3
{
  void *v4;

  if (self->_usesFaintSeparator != a3)
  {
    self->_usesFaintSeparator = a3;
    if (a3)
      objc_msgSend(MEMORY[0x1E0DC3658], "sf_secondaryBarHairlineOutlineColor");
    else
      objc_msgSend(MEMORY[0x1E0DC3658], "sf_barHairlineShadowColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView setBackgroundColor:](self->_separator, "setBackgroundColor:", v4);

    -[_SFNavigationBar _updateSeparatorAlpha]((uint64_t)self);
  }
}

- (void)setBackdropGroupDisabled:(BOOL)a3
{
  NSString *backdropGroupName;

  if (((!self->_backdropGroupDisabled ^ a3) & 1) == 0)
  {
    self->_backdropGroupDisabled = a3;
    if (a3)
      backdropGroupName = 0;
    else
      backdropGroupName = self->_backdropGroupName;
    -[UIVisualEffectView _setGroupName:](self->_backdrop, "_setGroupName:", backdropGroupName);
  }
}

- (void)setBackdropGroupName:(id)a3
{
  NSString *v4;
  NSString *backdropGroupName;
  BOOL v6;
  NSString *v7;
  NSString *v8;
  NSString *v9;
  NSString *v10;

  v4 = (NSString *)a3;
  backdropGroupName = self->_backdropGroupName;
  if (backdropGroupName != v4)
  {
    v10 = v4;
    v6 = -[NSString isEqualToString:](backdropGroupName, "isEqualToString:", v4);
    v4 = v10;
    if (!v6)
    {
      v7 = (NSString *)-[NSString copy](v10, "copy");
      v8 = self->_backdropGroupName;
      self->_backdropGroupName = v7;

      if (self->_backdropGroupDisabled)
        v9 = 0;
      else
        v9 = self->_backdropGroupName;
      -[UIVisualEffectView _setGroupName:](self->_backdrop, "_setGroupName:", v9);
      v4 = v10;
    }
  }

}

- (_QWORD)_notSecureWarningColor
{
  _QWORD *v1;
  void *v2;
  double v3;

  if (a1)
  {
    v1 = a1;
    v2 = (void *)a1[113];
    objc_msgSend(a1, "minimumHeight");
    objc_msgSend(v1, "bounds");
    v3 = 0.0;
    if (v1[103] != 1)
      SFBarBackgroundAlphaForSquishTransformFactor();
    objc_msgSend(v2, "platterWarningTextColorForPlatterAlpha:", v3);
    a1 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  }
  return a1;
}

- (id)_placeholderText
{
  void *v2;
  id v3;
  void *v4;

  -[SFNavigationBarItem customPlaceholderText](self->_item, "customPlaceholderText");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "length"))
  {
    v3 = v2;
  }
  else
  {
    _WBSLocalizedString();
    v3 = (id)objc_claimAutoreleasedReturnValue();
  }
  v4 = v3;

  return v4;
}

- (id)textForNavigationBarURLButton:(id)a3
{
  id WeakRetained;
  void *v5;
  void *v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLForSharing:", self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "safari_userVisibleString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (BOOL)navigationBarURLButton:(id)a3 shouldShowMenuForGestureWithRecognizer:(id)a4
{
  id v5;
  UIButton *mediaStateMuteButton;
  int v7;

  v5 = a4;
  if (-[SFNavigationBarAccessoryButtonArrangement containsButtonType:]((uint64_t)self->_accessoryButtonArrangement, 3))
  {
    mediaStateMuteButton = self->_mediaStateMuteButton;
    objc_msgSend(v5, "locationInView:", mediaStateMuteButton);
    v7 = -[UIButton pointInside:withEvent:](mediaStateMuteButton, "pointInside:withEvent:", 0) ^ 1;
  }
  else
  {
    LOBYTE(v7) = 1;
  }

  return v7;
}

- (void)_copyNavigationBarURLToPasteboard
{
  id WeakRetained;
  void *v3;
  void *v4;
  id v5;

  if (a1)
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 928));
    objc_msgSend(WeakRetained, "navigationBarURLForSharing:", a1);
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "safari_userVisibleString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setString:", v3);

  }
}

- (void)navigationBarURLButtonDidReceivePasteCommand:(id)a3
{
  id v4;
  id WeakRetained;
  void *v6;
  _QWORD v7[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_initWeak(&location, self);
    objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __65___SFNavigationBar_navigationBarURLButtonDidReceivePasteCommand___block_invoke;
    v7[3] = &unk_1E4AC16A8;
    objc_copyWeak(&v9, &location);
    v8 = WeakRetained;
    objc_msgSend(v6, "safari_bestStringForPastingIntoURLFieldCompletionHandler:", v7);

    objc_destroyWeak(&v9);
    objc_destroyWeak(&location);
  }

}

- (BOOL)navigationBarURLButtonShouldCopy:(id)a3
{
  _SFNavigationBar *v3;
  id WeakRetained;
  void *v5;

  v3 = self;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "navigationBarURLForSharing:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v3) = v5 != 0;

  return (char)v3;
}

- (BOOL)navigationBarURLButtonShouldPaste:(id)a3
{
  id WeakRetained;
  char v4;
  void *v5;
  char v6;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  v4 = objc_opt_respondsToSelector();

  if ((v4 & 1) == 0)
    return 0;
  objc_msgSend(MEMORY[0x1E0DC3AC0], "generalPasteboard");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "safari_canPasteAndNavigate");

  return v6;
}

- (BOOL)navigationBarURLButton:(id)a3 shouldAllowLongPressAtPoint:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  _BOOL4 v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  CGFloat v18;
  CGFloat v19;
  CGPoint v21;
  CGRect v22;

  y = a4.y;
  x = a4.x;
  v7 = a3;
  v8 = v7;
  if (v7 && *((_QWORD *)v7 + 106))
  {
    LOBYTE(v9) = 0;
  }
  else if ((-[SFNavigationBarToggleButton isHidden](self->_formatToggleButton, "isHidden") & 1) != 0)
  {
    LOBYTE(v9) = 1;
  }
  else
  {
    -[SFNavigationBarToggleButton bounds](self->_formatToggleButton, "bounds");
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    -[SFNavigationBarToggleButton convertPoint:fromView:](self->_formatToggleButton, "convertPoint:fromView:", v8, x, y);
    v21.x = v18;
    v21.y = v19;
    v22.origin.x = v11;
    v22.origin.y = v13;
    v22.size.width = v15;
    v22.size.height = v17;
    v9 = !CGRectContainsPoint(v22, v21);
  }

  return v9;
}

- (void)navigationBarURLButtonDidRequestFocusForPencilInput:(id)a3 completionHandler:(id)a4
{
  void (**v5)(_QWORD);
  id WeakRetained;
  void *v7;
  int v8;
  NSObject *v9;
  NSObject *v10;

  v5 = (void (**)(_QWORD))a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    -[_SFNavigationBar textField](self, "textField");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isFirstResponder");
    v9 = WBS_LOG_CHANNEL_PREFIXPencilInput();
    v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        -[_SFNavigationBar navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:].cold.1();
      v5[2](v5);
    }
    else
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[_SFNavigationBar navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:].cold.2(v10, v7);
      objc_msgSend(v7, "setText:", &stru_1E4AC8470);
      -[_SFNavigationBar _updateTemporarySuppressionOfItemText:]((id *)&self->super.super.super.isa, 1);
      objc_msgSend(WeakRetained, "navigationBarURLWasTapped:completionHandler:", self, v5);
    }

  }
  else
  {
    v5[2](v5);
  }

}

- (void)_updateTemporarySuppressionOfItemText:(id *)a1
{
  if (a1)
  {
    objc_msgSend(a1[111], "setTemporarilySuppressText:", a2);
    objc_msgSend(a1, "_updateText");
    -[_SFNavigationBar _updateFakeViews]((uint64_t)a1);
  }
}

- (void)navigationBarURLButtonBeginSuppressingPlaceholder:(id)a3
{
  -[_SFNavigationBar _setHidePlaceholderURLItemsForPencilInput:]((uint64_t)self, 1);
}

- (void)navigationBarURLButtonEndSuppressingPlaceholder:(id)a3
{
  -[_SFNavigationBar _setHidePlaceholderURLItemsForPencilInput:]((uint64_t)self, 0);
}

- (BOOL)textFieldIsEditableForNavigationBarURLButton:(id)a3
{
  return self->_inputMode == 0;
}

- (BOOL)navigationBarURLButton:(id)a3 canWriteAtLocation:(CGPoint)a4
{
  double y;
  double x;
  id v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  void *v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  y = a4.y;
  x = a4.x;
  v22 = *MEMORY[0x1E0C80C00];
  v7 = a3;
  -[_SFNavigationBar _hitTestCandidateViews]((uint64_t)self);
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = (id)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    while (2)
    {
      for (i = 0; i != v10; ++i)
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v13, "convertPoint:fromView:", v7, x, y, (_QWORD)v17);
        objc_msgSend(v13, "hitTest:withEvent:", 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        if (v14)
        {
          v15 = 0;
          goto LABEL_11;
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      if (v10)
        continue;
      break;
    }
  }
  v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)navigationBarURLButtonIsUsingNarrowLayout:(id)a3
{
  return self->_usesNarrowLayout;
}

- (id)_basicAnimationForView:(id)a3 withKeyPath:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E0CD2710], "animationWithKeyPath:", a4);
}

- (id)_timingFunctionForAnimation
{
  double v2;
  double v3;
  double v4;
  double v5;

  LODWORD(v3) = 1036831949;
  LODWORD(v4) = 1044395118;
  LODWORD(v2) = 0.25;
  LODWORD(v5) = 1.0;
  return (id)objc_msgSend(MEMORY[0x1E0CD27D0], "functionWithControlPoints::::", v2, v3, v4, v5);
}

- (BOOL)canBecomeFirstResponder
{
  void *v3;
  BOOL v4;
  objc_super v6;

  -[_SFNavigationBar inputAccessoryView](self, "inputAccessoryView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    v6.receiver = self;
    v6.super_class = (Class)_SFNavigationBar;
    v4 = -[_SFNavigationBar canBecomeFirstResponder](&v6, sel_canBecomeFirstResponder);
  }

  return v4;
}

- (id)newTextField
{
  return 0;
}

- (double)placeholderHorizontalInset
{
  return 0.0;
}

- (id)dragInteraction:(id)a3 itemsForBeginningSession:(id)a4
{
  id v5;
  UIButton *mediaStateMuteButton;
  _SFDimmingButton *stopButton;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t i;
  void *v16;
  void *v17;
  id WeakRetained;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  void *v27;
  _BYTE v28[128];
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v5 = a4;
  mediaStateMuteButton = self->_mediaStateMuteButton;
  v29[0] = self->_formatToggleButton;
  v29[1] = mediaStateMuteButton;
  stopButton = self->_stopButton;
  v29[2] = self->_reloadButton;
  v29[3] = stopButton;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "mutableCopy");

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v9;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v24;
    v14 = (void *)MEMORY[0x1E0C9AA60];
    while (2)
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(_QWORD *)v24 != v13)
          objc_enumerationMutation(v10);
        v16 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend(v5, "locationInView:", v16, (_QWORD)v23);
        objc_msgSend(v16, "hitTest:withEvent:", 0);
        v17 = (void *)objc_claimAutoreleasedReturnValue();

        if (v17)
        {
          WeakRetained = v10;
          goto LABEL_19;
        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v23, v28, 16);
      if (v12)
        continue;
      break;
    }
  }

  if ((-[UITextField isFirstResponder](self->_textField, "isFirstResponder") & 1) != 0)
  {
    v14 = (void *)MEMORY[0x1E0C9AA60];
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend(WeakRetained, "navigationBarURLForSharing:", self);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      if ((objc_opt_respondsToSelector() & 1) == 0
        || (objc_msgSend(WeakRetained, "itemProviderForNavigationBar:", self),
            (v20 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        v20 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB36C8]), "initWithObject:", v19);
      }
      v21 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3758]), "initWithItemProvider:", v20);
      objc_msgSend(v21, "setLocalObject:", v19);
      v27 = v21;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v27, 1);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v14 = (void *)MEMORY[0x1E0C9AA60];
    }

LABEL_19:
  }

  return v14;
}

- (id)dragInteraction:(id)a3 previewForLiftingItem:(id)a4 session:(id)a5
{
  id v6;
  void *v7;
  void *v8;

  v6 = objc_alloc_init(MEMORY[0x1E0DC3768]);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setBackgroundColor:", v7);

  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D88]), "initWithView:parameters:", self->_URLOutline, v6);
  objc_msgSend(v8, "set_springboardParameters:", &unk_1E4B27600);

  return v8;
}

- (void)dragInteraction:(id)a3 willAnimateLiftWithAnimator:(id)a4 session:(id)a5
{
  uint64_t v5;
  id v6;
  id v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;
  _QWORD v13[5];

  v5 = MEMORY[0x1E0C809B0];
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke;
  v13[3] = &unk_1E4AC05E0;
  v13[4] = self;
  v6 = a4;
  v11[0] = v5;
  v11[1] = 3221225472;
  v11[2] = __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_2;
  v11[3] = &unk_1E4AC0230;
  v7 = (id)MEMORY[0x1A8598C40](v13);
  v12 = v7;
  objc_msgSend(v6, "addAnimations:", v11);
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __72___SFNavigationBar_dragInteraction_willAnimateLiftWithAnimator_session___block_invoke_3;
  v9[3] = &unk_1E4AC16D0;
  v10 = v7;
  v8 = v7;
  objc_msgSend(v6, "addCompletion:", v9);

}

- (void)dragInteraction:(id)a3 sessionWillBegin:(id)a4
{
  id v5;
  id WeakRetained;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  _QWORD v12[4];
  id v13;

  v5 = a4;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(WeakRetained, "currentContentUUIDForNavigationBar:", self);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setLocalContext:", v7);

  }
  objc_msgSend(v5, "items");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "firstObject");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "localObject");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __53___SFNavigationBar_dragInteraction_sessionWillBegin___block_invoke;
  v12[3] = &unk_1E4AC16F8;
  v13 = v10;
  v11 = v10;
  objc_msgSend(v9, "setPreviewProvider:", v12);

}

- (int64_t)_dragInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  id WeakRetained;
  uint64_t v6;
  int64_t v7;

  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    v6 = objc_msgSend(WeakRetained, "dataOwnerForNavigationBar:", self);
    if ((unint64_t)(v6 - 1) >= 3)
      v7 = 0;
    else
      v7 = v6;
  }
  else
  {
    v7 = 3;
  }

  return v7;
}

- (int64_t)_dropInteraction:(id)a3 dataOwnerForSession:(id)a4
{
  return 3;
}

- (BOOL)dropInteraction:(id)a3 canHandleSession:(id)a4
{
  return objc_msgSend(MEMORY[0x1E0D4EF70], "canCreateNavigationIntentForDropSession:", a4);
}

- (id)dropInteraction:(id)a3 sessionDidUpdate:(id)a4
{
  _SFNavigationBarDelegate **p_delegate;
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  p_delegate = &self->_delegate;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)p_delegate);
  objc_msgSend(v6, "localDragSession");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "localContext");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v9 || (objc_opt_respondsToSelector() & 1) == 0)
    goto LABEL_6;
  objc_msgSend(WeakRetained, "currentContentUUIDForNavigationBar:", self);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v10, "isEqual:", v9))
  {

LABEL_6:
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 2);
    goto LABEL_7;
  }
  v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3788]), "initWithDropOperation:", 0);

LABEL_7:
  return v11;
}

- (void)dropInteraction:(id)a3 performDrop:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  _QWORD v8[5];

  v5 = (void *)MEMORY[0x1E0D4EF70];
  v6 = a4;
  objc_msgSend(v5, "builder");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __48___SFNavigationBar_dropInteraction_performDrop___block_invoke;
  v8[3] = &unk_1E4AC1720;
  v8[4] = self;
  objc_msgSend(v7, "buildNavigationIntentForDropSession:completionHandler:", v6, v8);

}

- (_SFPopoverSourceInfo)formatMenuButtonPopoverSourceInfo
{
  void *v2;

  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", self->_formatToggleButton);
  objc_msgSend(v2, "setProvenance:", 5);
  return (_SFPopoverSourceInfo *)v2;
}

- (_SFPopoverSourceInfo)reloadButtonPopoverSourceInfo
{
  return (_SFPopoverSourceInfo *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", self->_reloadButton);
}

- (_SFPopoverSourceInfo)URLOutlinePopoverSourceInfo
{
  return (_SFPopoverSourceInfo *)(id)objc_msgSend(objc_alloc(MEMORY[0x1E0D4EFA0]), "initWithView:", self->_URLOutline);
}

- (NSArray)popoverPassthroughViews
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", self->_textField);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_leadingToolbar);
  objc_msgSend(v3, "safari_addObjectUnlessNil:", self->_trailingToolbar);
  v4 = (void *)objc_msgSend(v3, "copy");

  return (NSArray *)v4;
}

- (void)animateSafariIconLinkFromPoint:(CGPoint)a3 inView:(id)a4
{
  double y;
  double x;
  id v7;
  id v8;

  y = a3.y;
  x = a3.x;
  v7 = a4;
  -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, 3);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "animateSafariIconLinkFromPoint:inView:", v7, x, y);

}

- (id)_toolbarForBarItem:(id *)a1
{
  id *v3;
  int *v4;
  void *v5;
  char v6;
  void *v7;
  int v8;

  if (a1)
  {
    v3 = a1;
    v4 = &OBJC_IVAR____SFNavigationBar__leadingToolbar;
    objc_msgSend(a1[71], "barRegistration");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "containsBarItem:", a2);

    if ((v6 & 1) != 0)
      return (id *)*(id *)((char *)v3 + *v4);
    v4 = &OBJC_IVAR____SFNavigationBar__trailingToolbar;
    objc_msgSend(v3[72], "barRegistration");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsBarItem:", a2);

    if (v8)
      return (id *)*(id *)((char *)v3 + *v4);
    a1 = 0;
  }
  return a1;
}

- (void)animateLinkImage:(CGImage *)a3 fromRect:(CGRect)a4 inView:(id)a5 toBarItem:(int64_t)a6 afterImageDisappearsBlock:(id)a7 afterDestinationLayerBouncesBlock:(id)a8
{
  double height;
  double width;
  double y;
  double x;
  id v17;
  id v18;
  id v19;
  void *v20;
  void *v21;
  _QWORD v22[4];
  id v23;
  id v24;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v17 = a5;
  v18 = a7;
  v19 = a8;
  -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, a6);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = v20;
  if (v20)
  {
    objc_msgSend(v20, "animateLinkImage:fromRect:inView:toBarItem:afterImageDisappearsBlock:afterDestinationLayerBouncesBlock:", a3, v17, a6, v18, v19, x, y, width, height);
  }
  else
  {
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __123___SFNavigationBar_animateLinkImage_fromRect_inView_toBarItem_afterImageDisappearsBlock_afterDestinationLayerBouncesBlock___block_invoke;
    v22[3] = &unk_1E4AC1748;
    v23 = v18;
    v24 = v19;
    dispatch_async(MEMORY[0x1E0C80D38], v22);

  }
}

- (id)popoverSourceInfoForBarItem:(int64_t)a3
{
  void *v4;
  void *v5;

  -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "popoverSourceInfoForBarItem:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (BOOL)containsBarItem:(int64_t)a3
{
  void *v3;
  BOOL v4;

  -[_SFNavigationBar _toolbarForBarItem:]((id *)&self->super.super.super.isa, a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (void)navigationBarItemDidUpdateShowsReaderButton:(id)a3
{
  -[_SFNavigationBar _updateAvailabilityButtonAndTextVisibilityForType:]((uint64_t)self, 0);
}

- (void)navigationBarItemDidUpdateSecurityAnnotation:(id)a3
{
  self->_cachedSecurityAnnotationLabelFittingSize = (CGSize)*MEMORY[0x1E0C9D820];
  -[_SFNavigationBar _updateSecurityWarningsVisibility](self, "_updateSecurityWarningsVisibility", a3);
}

- (void)navigationBarItemDidUpdateCustomPlaceholderText:(id)a3
{
  -[_SFNavigationBar _updatePlaceholderText](self);
  -[_SFNavigationBar _updateText](self, "_updateText");
}

- (void)navigationBarItemDidUpdateShowsTranslationButton:(id)a3
{
  -[_SFNavigationBar _updateAvailabilityButtonAndTextVisibilityForType:]((uint64_t)self, 1);
}

- (void)navigationBarItemDidUpdateBrowsingAssistantDetectionResult:(id)a3
{
  -[_SFNavigationBar _updateFormatButtonSelected]((id *)&self->super.super.super.isa);
  -[_SFNavigationBar _updateAvailabilityButtonAndTextVisibilityForType:]((uint64_t)self, 2);
}

- (void)navigationBarItemDidUpdateHasHiddenElements:(id)a3
{
  -[_SFNavigationBar _updateFormatButtonAccessories]((uint64_t)self);
  -[_SFNavigationBar setNeedsLayout](self, "setNeedsLayout");
}

- (void)navigationBarItemDidUpdateOverlayConfiguration:(id)a3
{
  void *v4;
  _QWORD v5[5];

  objc_msgSend(a3, "overlayConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[_SFNavigationBarURLButton setOverlayConfiguration:]((uint64_t)self->_URLOutline, v4);

  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67___SFNavigationBar_navigationBarItemDidUpdateOverlayConfiguration___block_invoke;
  v5[3] = &unk_1E4ABFE00;
  v5[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v5, 0);
}

- (SFNavigationBarItem)item
{
  return self->_item;
}

- (BOOL)usesNarrowLayout
{
  return self->_usesNarrowLayout;
}

- (BOOL)unifiedFieldShowsProgressView
{
  return self->_unifiedFieldShowsProgressView;
}

- (_SFBarTheme)theme
{
  return self->_theme;
}

- (_SFNavigationBarTheme)effectiveTheme
{
  return self->_effectiveTheme;
}

- (BOOL)areControlsHidden
{
  return self->_controlsHidden;
}

- (BOOL)isExpanded
{
  return self->_expanded;
}

- (UITextField)textField
{
  return self->_textField;
}

- (BOOL)isBackdropGroupDisabled
{
  return self->_backdropGroupDisabled;
}

- (NSString)backdropGroupName
{
  return self->_backdropGroupName;
}

- (_SFNavigationBarDelegate)delegate
{
  return (_SFNavigationBarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (double)contentUnderStatusBarHeight
{
  return self->_contentUnderStatusBarHeight;
}

- (BOOL)suppressesBlur
{
  return self->_suppressesBlur;
}

- (BOOL)usesFaintSeparator
{
  return self->_usesFaintSeparator;
}

- (double)maximumHeight
{
  return self->_maximumHeight;
}

- (void)setMaximumHeight:(double)a3
{
  self->_maximumHeight = a3;
}

- (double)minimumBackdropHeight
{
  return self->_minimumBackdropHeight;
}

- (UIView)inputAccessoryView
{
  return self->_inputAccessoryView;
}

- (void)setInputAccessoryView:(id)a3
{
  objc_storeStrong((id *)&self->_inputAccessoryView, a3);
}

- (BOOL)isSendingBarMetricsChangeNotification
{
  return self->_sendingBarMetricsChangeNotification;
}

- (UIBlurEffect)backdropEffect
{
  return self->_backdropEffect;
}

- (SFLockdownStatusBar)lockdownStatusBar
{
  return self->_lockdownStatusBar;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lockdownStatusBar, 0);
  objc_storeStrong((id *)&self->_backdropEffect, 0);
  objc_storeStrong((id *)&self->_inputAccessoryView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_backdropGroupName, 0);
  objc_storeStrong((id *)&self->_textField, 0);
  objc_storeStrong((id *)&self->_effectiveTheme, 0);
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_item, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_squishedLockView, 0);
  objc_storeStrong((id *)&self->_squishedLockEffectView, 0);
  objc_storeStrong((id *)&self->_lockEffectView, 0);
  objc_storeStrong(&self->_availabilityButtonDeferredAction, 0);
  objc_storeStrong((id *)&self->_dismissButton, 0);
  objc_storeStrong(&self->_readerAvailabilityAnimationBlock, 0);
  objc_storeStrong((id *)&self->_availabilityLabelHideTimer, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_mediaStateMuteButton, 0);
  objc_storeStrong((id *)&self->_formatClickInteraction, 0);
  objc_storeStrong((id *)&self->_reloadButton, 0);
  objc_storeStrong((id *)&self->_stopButton, 0);
  objc_storeStrong((id *)&self->_formatToggleButton, 0);
  objc_storeStrong((id *)&self->_accessoryButtonArrangement, 0);
  objc_storeStrong((id *)&self->_attributedTextWhenExpanded, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_backdrop, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_URLOutline, 0);
  objc_storeStrong((id *)&self->_URLAccessoryItems, 0);
  objc_storeStrong((id *)&self->_squishedURLAccessoryItemsContainer, 0);
  objc_storeStrong((id *)&self->_squishedSearchIndicator, 0);
  objc_storeStrong((id *)&self->_searchIndicator, 0);
  objc_storeStrong((id *)&self->_barMetrics, 0);
  objc_storeStrong((id *)&self->_securityAnnotationContainer, 0);
  objc_storeStrong((id *)&self->_trailingToolbarContainer, 0);
  objc_storeStrong((id *)&self->_leadingToolbarContainer, 0);
  objc_storeStrong((id *)&self->_trailingToolbar, 0);
  objc_storeStrong((id *)&self->_leadingToolbar, 0);
  objc_storeStrong((id *)&self->_fakeClearButton, 0);
  objc_storeStrong((id *)&self->_fakeTextFieldSelectionView, 0);
  objc_storeStrong((id *)&self->_URLContainerClipView, 0);
  objc_storeStrong((id *)&self->_URLContainer, 0);
  objc_storeStrong((id *)&self->_securityAnnotationLabel, 0);
  objc_storeStrong((id *)&self->_availabilityLabel, 0);
  objc_storeStrong((id *)&self->_privateBrowsingLabel, 0);
  objc_storeStrong((id *)&self->_expandedURLLabel, 0);
  objc_storeStrong((id *)&self->_URLLabel, 0);
  objc_storeStrong((id *)&self->_labelScalingContainer, 0);
  objc_storeStrong((id *)&self->_labelsContainer, 0);
  objc_storeStrong((id *)&self->_controlsContainer, 0);
  objc_storeStrong((id *)&self->_compressedBarButton, 0);
}

- (void)_dismissButtonTapped:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "_SFNavigationBarDelegate is nil", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)_dismissButtonTapped:.cold.2()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "_SFNavigationBarDelegate didn't implement navigationBarDoneButtonWasTapped", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)setSuppressesBlur:(uint64_t)a3 .cold.1(char a1, NSObject *a2, uint64_t a3)
{
  const __CFString *v3;
  int v4;
  const __CFString *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = CFSTR("Disabled");
  if ((a1 & 1) != 0)
    v3 = CFSTR("Enabled");
  v4 = 138543362;
  v5 = v3;
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, a2, a3, "%{public}@ navigation bar blur suppression", (uint8_t *)&v4);
}

- (void)navigationBarURLButtonDidRequestFocusForPencilInput:completionHandler:.cold.1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3();
  OUTLINED_FUNCTION_0(&dword_1A3B2D000, v0, v1, "Text field is already first responder, so early returning", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

- (void)navigationBarURLButtonDidRequestFocusForPencilInput:(void *)a1 completionHandler:(void *)a2 .cold.2(void *a1, void *a2)
{
  NSObject *v3;
  void *v4;
  uint64_t v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  objc_msgSend(a2, "text");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 138739971;
  v7 = v4;
  OUTLINED_FUNCTION_3_1(&dword_1A3B2D000, v3, v5, "Clearing text field in order to allow pencil input to have clean slate. Current value of field: '%{sensitive}@'", (uint8_t *)&v6);

  OUTLINED_FUNCTION_6();
}

@end

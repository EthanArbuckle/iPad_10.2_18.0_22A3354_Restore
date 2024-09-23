@implementation CAMBottomBar

- (CAMBottomBar)initWithLayoutStyle:(int64_t)a3
{
  CAMBottomBar *v4;
  CAMBottomBar *v5;
  CAMBottomBar *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CAMBottomBar;
  v4 = -[CAMBottomBar initWithFrame:](&v8, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    -[CAMBottomBar _commonCAMBottomBarInitializationInitWithLayoutStyle:](v4, "_commonCAMBottomBarInitializationInitWithLayoutStyle:", a3);
    v6 = v5;
  }

  return v5;
}

- (void)_commonCAMBottomBarInitializationInitWithLayoutStyle:(int64_t)a3
{
  id v4;
  UIView *v5;
  UIView *backgroundView;

  self->_layoutStyle = a3;
  v4 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v5 = (UIView *)objc_msgSend(v4, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  backgroundView = self->_backgroundView;
  self->_backgroundView = v5;

  -[UIView setAutoresizingMask:](self->_backgroundView, "setAutoresizingMask:", 18);
  -[UIView setUserInteractionEnabled:](self->_backgroundView, "setUserInteractionEnabled:", 0);
  -[CAMBottomBar addSubview:](self, "addSubview:", self->_backgroundView);
}

- (void)setShutterButton:(id)a3
{
  CUShutterButton *v5;
  CUShutterButton *shutterButton;
  CUShutterButton *v7;

  v5 = (CUShutterButton *)a3;
  shutterButton = self->_shutterButton;
  if (shutterButton != v5)
  {
    v7 = v5;
    -[CUShutterButton removeFromSuperview](shutterButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_shutterButton, a3);
    -[CAMBottomBar addSubview:](self, "addSubview:", self->_shutterButton);
    v5 = v7;
  }

}

+ (BOOL)wantsVerticalBarForLayoutStyle:(int64_t)a3
{
  return a3 == 1;
}

- (void)setFlipButton:(id)a3
{
  CAMFlipButton *v5;
  CAMFlipButton *flipButton;
  CAMFlipButton *v7;

  v5 = (CAMFlipButton *)a3;
  flipButton = self->_flipButton;
  v7 = v5;
  if (flipButton != v5)
  {
    -[CAMFlipButton removeFromSuperview](flipButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_flipButton, a3);
    -[CAMBottomBar _updateFlipButtonTappableEdgeInsets](self, "_updateFlipButtonTappableEdgeInsets");
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)_updateFlipButtonTappableEdgeInsets
{
  double v3;
  id v4;

  v3 = 5.0;
  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", -[CAMBottomBar layoutStyle](self, "layoutStyle")) & 1) == 0)
  {
    -[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v3 = 11.0;
  }
  -[CAMBottomBar flipButton](self, "flipButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTappableEdgeInsets:", v3, 11.0, v3, 11.0);

}

- (int64_t)layoutStyle
{
  return self->_layoutStyle;
}

- (CAMFlipButton)flipButton
{
  return self->_flipButton;
}

- (void)setModeDial:(id)a3
{
  CAMModeDial *v5;
  CAMModeDial *modeDial;
  CAMModeDial *v7;

  v5 = (CAMModeDial *)a3;
  modeDial = self->_modeDial;
  v7 = v5;
  if (modeDial != v5)
  {
    -[CAMModeDial removeFromSuperview](modeDial, "removeFromSuperview");
    objc_storeStrong((id *)&self->_modeDial, a3);
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
    -[CAMBottomBar _ensureSubviewOrdering](self, "_ensureSubviewOrdering");
  }

}

- (void)_ensureSubviewOrdering
{
  id v3;

  -[CAMBottomBar utilityBar](self, "utilityBar");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CAMBottomBar bringSubviewToFront:](self, "bringSubviewToFront:", v3);

}

- (CAMUtilityBar)utilityBar
{
  return self->_utilityBar;
}

- (void)setImageWell:(id)a3
{
  CAMImageWell *v5;
  CAMImageWell *imageWell;
  CAMImageWell *v7;

  v5 = (CAMImageWell *)a3;
  imageWell = self->_imageWell;
  v7 = v5;
  if (imageWell != v5)
  {
    -[CAMImageWell removeFromSuperview](imageWell, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageWell, a3);
    -[CAMBottomBar _updateImageWellTappableEdgeInsets](self, "_updateImageWellTappableEdgeInsets");
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)_updateImageWellTappableEdgeInsets
{
  double v3;
  double v4;
  double v5;
  double v6;
  int v7;
  id v8;

  v3 = 11.0;
  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", -[CAMBottomBar layoutStyle](self, "layoutStyle")) & 1) != 0)
  {
    v4 = 5.0;
    v5 = 11.0;
    v3 = 5.0;
    v6 = 11.0;
  }
  else
  {
    v7 = -[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v4 = 0.0;
    if (v7)
      v5 = 15.0;
    else
      v5 = 0.0;
    if (v7)
      v6 = 0.0;
    else
      v6 = 15.0;
  }
  -[CAMBottomBar imageWell](self, "imageWell");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setTappableEdgeInsets:", v4, v6, v3, v5);

}

- (CAMImageWell)imageWell
{
  return self->_imageWell;
}

- (void)setFlashButton:(id)a3
{
  CAMFlashButton *v5;
  CAMFlashButton **p_flashButton;
  CAMFlashButton *flashButton;
  CAMFlashButton *v8;

  v5 = (CAMFlashButton *)a3;
  p_flashButton = &self->_flashButton;
  flashButton = self->_flashButton;
  v8 = v5;
  if (flashButton != v5)
  {
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](flashButton, "setExpandableMenuDelegate:", 0);
    -[CAMFlashButton removeFromSuperview](*p_flashButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_flashButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_flashButton, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_flashButton, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    -[CAMBottomBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setTimerButton:(id)a3
{
  CAMTimerButton *v5;
  CAMTimerButton **p_timerButton;
  CAMTimerButton *timerButton;
  CAMTimerButton *v8;

  v5 = (CAMTimerButton *)a3;
  p_timerButton = &self->_timerButton;
  timerButton = self->_timerButton;
  v8 = v5;
  if (timerButton != v5)
  {
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](timerButton, "setExpandableMenuDelegate:", 0);
    -[CAMTimerButton removeFromSuperview](*p_timerButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_timerButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_timerButton, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_timerButton, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    -[CAMBottomBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setHDRButton:(id)a3
{
  CAMHDRButton *v5;
  CAMHDRButton **p_HDRButton;
  CAMHDRButton *HDRButton;
  CAMHDRButton *v8;

  v5 = (CAMHDRButton *)a3;
  p_HDRButton = &self->_HDRButton;
  HDRButton = self->_HDRButton;
  v8 = v5;
  if (HDRButton != v5)
  {
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](HDRButton, "setExpandableMenuDelegate:", 0);
    -[CAMHDRButton removeFromSuperview](*p_HDRButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_HDRButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](*p_HDRButton, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](*p_HDRButton, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    -[CAMBottomBar addSubview:](self, "addSubview:", v8);
  }

}

- (void)setBackgroundStyle:(int64_t)a3 animated:(BOOL)a4
{
  _QWORD v5[5];

  if (self->_backgroundStyle != a3)
  {
    self->_backgroundStyle = a3;
    if (a4)
    {
      -[CAMBottomBar layoutIfNeeded](self, "layoutIfNeeded");
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __44__CAMBottomBar_setBackgroundStyle_animated___block_invoke;
      v5[3] = &unk_1EA328868;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 6, v5, 0, 0.3, 0.0);
    }
    else
    {
      -[CAMBottomBar setNeedsLayout](self, "setNeedsLayout");
    }
  }
}

- (int64_t)backgroundStyle
{
  return self->_backgroundStyle;
}

- (CUShutterButton)shutterButton
{
  return self->_shutterButton;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  void *v13;
  int64_t v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  double MaxY;
  void *v26;
  double v27;
  void *v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t i;
  void *v33;
  uint64_t v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  uint64_t v46;
  CGRect v47;
  CGRect v48;

  v46 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)CAMBottomBar;
  -[CAMBottomBar layoutSubviews](&v44, sel_layoutSubviews);
  -[CAMBottomBar bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CAMBottomBar backgroundView](self, "backgroundView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);
  -[CAMBottomBar _opacityForBackgroundStyle:](self, "_opacityForBackgroundStyle:", -[CAMBottomBar backgroundStyle](self, "backgroundStyle"));
  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setBackgroundColor:", v13);

  v14 = -[CAMBottomBar layoutStyle](self, "layoutStyle");
  -[CAMBottomBar _layoutShutterButtonForLayoutStyle:](self, "_layoutShutterButtonForLayoutStyle:", v14);
  -[CAMBottomBar _layoutStillDuringVideoButtonForLayoutStyle:](self, "_layoutStillDuringVideoButtonForLayoutStyle:", v14);
  -[CAMBottomBar _layoutImageWellForLayoutStyle:](self, "_layoutImageWellForLayoutStyle:", v14);
  -[CAMBottomBar _layoutReviewButtonForLayoutStyle:](self, "_layoutReviewButtonForLayoutStyle:", v14);
  -[CAMBottomBar _layoutCreativeCameraButtonForLayoutStyle:](self, "_layoutCreativeCameraButtonForLayoutStyle:", v14);
  -[CAMBottomBar _layoutModeDialForLayoutStyle:](self, "_layoutModeDialForLayoutStyle:", v14);
  -[CAMBottomBar _layoutFlipButtonForLayoutStyle:](self, "_layoutFlipButtonForLayoutStyle:", v14);
  -[CAMBottomBar _layoutUtilityBarForLayoutStyle:](self, "_layoutUtilityBarForLayoutStyle:", v14);
  -[CAMBottomBar _layoutDoneButtonForLayoutStyle:](self, "_layoutDoneButtonForLayoutStyle:", v14);
  -[CAMBottomBar _currentMenuButtons](self, "_currentMenuButtons");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBottomBar _expandedMenuButton](self, "_expandedMenuButton");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBottomBar _layoutMenuButtons:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:](self, "_layoutMenuButtons:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:", v15, 1, v16, 0, 0);

  +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v16) = objc_msgSend(v17, "isFrontCameraOnRightEdge");

  v18 = objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", v14);
  -[CAMBottomBar superview](self, "superview");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "bounds");
  v21 = v20;
  v23 = v22;

  if ((_DWORD)v16)
  {
    if (v18)
    {
      if (v23 > v21)
      {
        -[CAMBottomBar modeDial](self, "modeDial");
        v24 = (void *)objc_claimAutoreleasedReturnValue();

        if (v24)
        {
          v47.origin.x = v4;
          v47.origin.y = v6;
          v47.size.width = v8;
          v47.size.height = v10;
          MaxY = CGRectGetMaxY(v47);
          -[CAMBottomBar modeDial](self, "modeDial");
          v26 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v26, "frame");
          v27 = MaxY - CGRectGetMaxY(v48);

          if (v27 >= 84.0)
          {
            v39 = v11;
            v42 = 0u;
            v43 = 0u;
            v40 = 0u;
            v41 = 0u;
            -[CAMBottomBar subviews](self, "subviews");
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
            if (v29)
            {
              v30 = v29;
              v31 = *(_QWORD *)v41;
              do
              {
                for (i = 0; i != v30; ++i)
                {
                  if (*(_QWORD *)v41 != v31)
                    objc_enumerationMutation(v28);
                  v33 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
                  -[CAMBottomBar backgroundView](self, "backgroundView");
                  v34 = objc_claimAutoreleasedReturnValue();
                  if (v33 == (void *)v34)
                  {

                  }
                  else
                  {
                    v35 = (void *)v34;
                    -[CAMBottomBar reviewButton](self, "reviewButton");
                    v36 = objc_claimAutoreleasedReturnValue();
                    if (v33 == (void *)v36)
                    {

                    }
                    else
                    {
                      v37 = (void *)v36;
                      -[CAMBottomBar doneButton](self, "doneButton");
                      v38 = (void *)objc_claimAutoreleasedReturnValue();

                      if (v33 != v38)
                      {
                        objc_msgSend(v33, "center");
                        objc_msgSend(v33, "setCenter:");
                      }
                    }
                  }
                }
                v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v40, v45, 16);
              }
              while (v30);
            }

            v11 = v39;
          }
        }
      }
    }
  }

}

- (UIView)backgroundView
{
  return self->_backgroundView;
}

- (double)_opacityForBackgroundStyle:(int64_t)a3
{
  double result;

  result = 0.0;
  if (a3 == 2)
    result = 1.0;
  if (!a3)
    return 0.3;
  return result;
}

- (void)_layoutShutterButtonForLayoutStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  CGFloat v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  double v28;
  CGFloat v29;
  double v30;
  double v31;
  CGFloat v32;
  double v33;
  double Width;
  double v35;
  double v36;
  double v37;
  double v38;
  double Height;
  double v40;
  id v41;
  CGRect v42;
  CGRect v43;
  CGRect v44;
  CGRect v45;
  CGRect v46;

  -[CAMBottomBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMBottomBar shutterButton](self, "shutterButton");
  v41 = (id)objc_claimAutoreleasedReturnValue();
  v13 = (void *)objc_opt_class();
  -[CAMBottomBar traitCollection](self, "traitCollection");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBottomBar safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v13, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", a3, v14, v6, v8, v10, v12, v15, v16, v17, v18);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;

  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3))
  {
    v42.origin.x = v20;
    v42.origin.y = v22;
    v42.size.width = v24;
    v42.size.height = v26;
    MinX = CGRectGetMinX(v42);
    if (MinX < 0.0)
      MinX = 0.0;
    v43.size.height = v12;
    v28 = 25.0;
    v43.size.width = v10;
    v29 = v26;
    v30 = v24;
    v31 = v22;
    v32 = v20;
    v33 = fmin(MinX, 25.0);
    v43.origin.x = v6;
    v43.origin.y = v8;
    Width = CGRectGetWidth(v43);
    v35 = v32;
    v44.origin.x = v32;
    v22 = v31;
    v24 = v30;
    v26 = v29;
    v44.origin.y = v22;
    v44.size.width = v24;
    v44.size.height = v29;
    v36 = Width - CGRectGetMaxX(v44) + -10.0;
    if (v36 < 0.0)
      v36 = 0.0;
    v37 = fmin(v36, 25.0);
    v38 = 25.0;
  }
  else
  {
    v45.origin.x = v6;
    v45.origin.y = v8;
    v45.size.width = v10;
    v45.size.height = v12;
    Height = CGRectGetHeight(v45);
    v35 = v20;
    v46.origin.x = v20;
    v46.origin.y = v22;
    v46.size.width = v24;
    v46.size.height = v26;
    v40 = Height - CGRectGetMaxY(v46) + -5.0;
    v28 = 0.0;
    if (v40 < 0.0)
      v40 = 0.0;
    v33 = 24.0;
    v38 = fmin(v40, 24.0);
    v37 = 24.0;
  }
  objc_msgSend(v41, "setTappableEdgeInsets:", v28, v33, v38, v37);
  objc_msgSend(v41, "frameForAlignmentRect:", v35, v22, v24, v26);
  objc_msgSend(v41, "setFrame:");

}

- (void)_layoutStillDuringVideoButtonForLayoutStyle:(int64_t)a3
{
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  double v20;
  double v21;
  int v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  double MinX;
  double v28;
  double v29;
  id v30;
  CGRect v31;

  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3) & 1) == 0)
  {
    -[CAMBottomBar stillDuringVideoButton](self, "stillDuringVideoButton");
    v30 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "intrinsicContentSize");
    v5 = v4;
    -[CAMBottomBar traitCollection](self, "traitCollection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "displayScale");
    UIRectIntegralWithScale();
    v8 = v7;
    v10 = v9;

    -[CAMBottomBar bounds](self, "bounds");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v17;
    -[CAMBottomBar shutterButton](self, "shutterButton");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "frame");
    objc_msgSend(v19, "alignmentRectForFrame:");
    CGRectGetMidY(v31);
    UIRoundToViewScale();
    v21 = v20;
    v22 = -[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v23 = v12;
    v24 = v14;
    v25 = v16;
    v26 = v18;
    if (v22)
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v23) - v5;
      v28 = -15.0;
    }
    else
    {
      MinX = CGRectGetMinX(*(CGRect *)&v23);
      v28 = 15.0;
    }
    v29 = MinX + v28;
    objc_msgSend(v30, "setTappableEdgeInsets:", 20.0, 20.0, 20.0, 20.0);
    objc_msgSend(v30, "frameForAlignmentRect:", v29, v21, v8, v10);
    objc_msgSend(v30, "setFrame:");

  }
}

- (CUShutterButton)stillDuringVideoButton
{
  return self->_stillDuringVideoButton;
}

- (void)_layoutImageWellForLayoutStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double MinX;
  double v28;
  CGFloat rect;
  CGFloat v30;
  CGFloat v31;
  id v32;
  CGRect v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;

  -[CAMBottomBar bounds](self, "bounds");
  v30 = v5;
  v31 = v6;
  v8 = v7;
  v10 = v9;
  -[CAMBottomBar shutterButton](self, "shutterButton");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  objc_msgSend(v32, "alignmentRectForFrame:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CAMBottomBar imageWell](self, "imageWell");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(a3) = objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3);
  objc_msgSend(v19, "intrinsicContentSize");
  v21 = v20;
  v23 = v22;
  if ((_DWORD)a3)
  {
    v33.origin.x = v12;
    v33.origin.y = v14;
    v33.size.width = v16;
    v33.size.height = v18;
    v24 = CGRectGetMaxY(v33) + 30.0;
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    CGRectGetMidX(v34);
    UIRoundToViewScale();
  }
  else
  {
    rect = v10;
    v35.origin.x = v12;
    v35.origin.y = v14;
    v35.size.width = v16;
    v35.size.height = v18;
    CGRectGetMidY(v35);
    UIRoundToViewScale();
    v24 = v26;
    if (-[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v36.origin.x = v30;
      v36.origin.y = v31;
      v36.size.width = v8;
      v36.size.height = rect;
      MinX = CGRectGetMaxX(v36) - v21;
      v28 = -15.0;
    }
    else
    {
      v37.origin.x = v30;
      v37.origin.y = v31;
      v37.size.width = v8;
      v37.size.height = rect;
      MinX = CGRectGetMinX(v37);
      v28 = 15.0;
    }
    v25 = MinX + v28;
  }
  objc_msgSend(v19, "frameForAlignmentRect:", v25, v24, v21, v23, *(_QWORD *)&rect);
  objc_msgSend(v19, "setFrame:");

}

- (void)_layoutReviewButtonForLayoutStyle:(int64_t)a3
{
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  double v14;
  double v15;
  CGFloat v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double MaxY;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  int v30;
  double v31;
  double v32;
  void *v33;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double MidY;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat v48;
  id v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;

  -[CAMBottomBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  -[CAMBottomBar reviewButton](self, "reviewButton");
  v49 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3))
  {
    objc_msgSend(v49, "intrinsicContentSize");
    UIRectCenteredIntegralRectScale();
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    v50.origin.x = v6;
    v50.origin.y = v8;
    v50.size.width = v10;
    v50.size.height = v12;
    MaxY = CGRectGetMaxY(v50);
    v51.origin.x = v14;
    v51.origin.y = v16;
    v51.size.width = v18;
    v51.size.height = v20;
    objc_msgSend(v49, "frameForAlignmentRect:", v14, MaxY - CGRectGetHeight(v51) + -31.0, v18, v20, 0);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
  }
  else
  {
    v30 = -[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    objc_msgSend(v49, "intrinsicContentSize");
    v48 = v12;
    v32 = v31;
    -[CAMBottomBar shutterButton](self, "shutterButton");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "frame");
    objc_msgSend(v33, "alignmentRectForFrame:");
    x = v52.origin.x;
    y = v52.origin.y;
    width = v52.size.width;
    height = v52.size.height;
    CGRectGetMidX(v52);
    v53.origin.x = x;
    v53.origin.y = y;
    v53.size.width = width;
    v53.size.height = height;
    MidY = CGRectGetMidY(v53);
    UIRectCenteredIntegralRectScale();
    v39 = v54.size.width;
    v40 = v54.size.height;
    CGRectGetHeight(v54);
    UIRoundToViewScale();
    v42 = MidY - v41;
    v43 = 15.0;
    if (v30)
    {
      v55.origin.x = v6;
      v55.origin.y = v8;
      v55.size.width = v10;
      v55.size.height = v48;
      v43 = CGRectGetMaxX(v55) - v32 + -15.0;
    }
    objc_msgSend(v49, "frameForAlignmentRect:", v43, v42, v39, v40, 0);
    v23 = v44;
    v25 = v45;
    v27 = v46;
    v29 = v47;

  }
  objc_msgSend(v49, "setFrame:", v23, v25, v27, v29);

}

- (UIButton)reviewButton
{
  return self->_reviewButton;
}

- (void)_layoutCreativeCameraButtonForLayoutStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  uint64_t v19;
  void *v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MinX;
  double v29;
  CGFloat rect;
  CGFloat v31;
  CGFloat v32;
  id v33;
  CGRect v34;
  CGRect v35;
  CGRect v36;
  CGRect v37;
  CGRect v38;

  -[CAMBottomBar bounds](self, "bounds");
  v31 = v5;
  v32 = v6;
  v8 = v7;
  v10 = v9;
  -[CAMBottomBar shutterButton](self, "shutterButton");
  v33 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "frame");
  objc_msgSend(v33, "alignmentRectForFrame:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v19 = CAMIsSmallPhone();
  -[CAMBottomBar creativeCameraButton](self, "creativeCameraButton");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "useCompactLayout:", v19);
  LODWORD(a3) = objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3);
  objc_msgSend(v20, "intrinsicContentSize");
  v22 = v21;
  v24 = v23;
  if ((_DWORD)a3)
  {
    v34.origin.x = v12;
    v34.origin.y = v14;
    v34.size.width = v16;
    v34.size.height = v18;
    v25 = CGRectGetMaxY(v34) + 30.0;
    v35.origin.x = v12;
    v35.origin.y = v14;
    v35.size.width = v16;
    v35.size.height = v18;
    CGRectGetMidX(v35);
    UIRoundToViewScale();
  }
  else
  {
    rect = v10;
    v36.origin.x = v12;
    v36.origin.y = v14;
    v36.size.width = v16;
    v36.size.height = v18;
    CGRectGetMidY(v36);
    UIRoundToViewScale();
    v25 = v27;
    if (-[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      v37.origin.x = v31;
      v37.origin.y = v32;
      v37.size.width = v8;
      v37.size.height = rect;
      MinX = CGRectGetMaxX(v37) - v22;
      v29 = -20.0;
    }
    else
    {
      v38.origin.x = v31;
      v38.origin.y = v32;
      v38.size.width = v8;
      v38.size.height = rect;
      MinX = CGRectGetMinX(v38);
      v29 = 20.0;
    }
    v26 = MinX + v29;
  }
  objc_msgSend(v20, "frameForAlignmentRect:", v26, v25, v22, v24, *(_QWORD *)&rect);
  objc_msgSend(v20, "setFrame:");

}

- (CAMCreativeCameraButton)creativeCameraButton
{
  return self->_creativeCameraButton;
}

- (void)_layoutModeDialForLayoutStyle:(int64_t)a3
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  double v21;
  CGFloat v22;
  double v23;
  CGFloat v24;
  double v25;
  double v26;
  CGFloat v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double MinY;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat rect;
  CGFloat recta;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  id v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  -[CAMBottomBar bounds](self, "bounds");
  x = v51.origin.x;
  y = v51.origin.y;
  width = v51.size.width;
  height = v51.size.height;
  v48 = CGRectGetWidth(v51);
  -[CAMBottomBar shutterButton](self, "shutterButton");
  v50 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "frame");
  objc_msgSend(v50, "alignmentRectForFrame:");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;
  -[CAMBottomBar modeDial](self, "modeDial");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3))
  {
    -[CAMBottomBar creativeCameraButton](self, "creativeCameraButton");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v47 = width;
    v45 = x;
    v46 = y;
    v44 = v14;
    if (v18
      || (-[CAMBottomBar imageWell](self, "imageWell"), (v18 = (void *)objc_claimAutoreleasedReturnValue()) != 0))
    {
      v19 = v18;
      v20 = v19;
    }
    else
    {
      -[CAMBottomBar shutterButton](self, "shutterButton");
      v19 = (id)objc_claimAutoreleasedReturnValue();
      v20 = 0;
    }
    objc_msgSend(v19, "frame");
    objc_msgSend(v19, "alignmentRectForFrame:");
    v22 = v21;
    v24 = v23;
    v49 = v25;
    rect = v26;
    v52.origin.x = v10;
    v52.origin.y = v12;
    v52.size.width = v14;
    v52.size.height = v16;
    v27 = v12;
    v28 = CGRectGetWidth(v52);
    objc_msgSend(v17, "sizeThatFits:", v28, 190.0);
    if (v28 < v29)
      v28 = v29;
    v53.origin.x = v22;
    v53.origin.y = v24;
    v53.size.width = v49;
    v53.size.height = rect;
    v30 = CGRectGetMaxY(v53) + 30.0;
    v54.origin.x = v10;
    v54.origin.y = v27;
    v54.size.width = v44;
    v54.size.height = v16;
    CGRectGetMidX(v54);
    UIRoundToViewScale();
    v32 = v31;
    v55.origin.x = v45;
    v55.origin.y = v46;
    v55.size.width = v47;
    v55.size.height = height;
    v33 = CGRectGetMaxX(v55) + -10.0;
    v56.origin.x = v32;
    v56.origin.y = v30;
    v56.size.width = v28;
    v56.size.height = 190.0;
    if (v33 - CGRectGetMaxX(v56) < 0.0)
    {
      v57.origin.x = v10;
      v57.size.height = v16;
      v57.origin.y = v27;
      v57.size.width = v44;
      v32 = CGRectGetMaxX(v57) - v28;
    }
    objc_msgSend(v17, "frameForAlignmentRect:", v32, v30, v28, 190.0, *(_QWORD *)&rect);
    v35 = v34;
    MinY = v36;
    v39 = v38;
    v41 = v40;

  }
  else
  {
    v58.origin.x = x;
    v58.origin.y = y;
    v58.size.width = width;
    v58.size.height = height;
    recta = CGRectGetMinX(v58);
    v59.origin.x = x;
    v59.origin.y = y;
    v59.size.width = width;
    v59.size.height = height;
    MinY = CGRectGetMinY(v59);
    v60.origin.x = v10;
    v60.origin.y = v12;
    v60.size.width = v14;
    v35 = recta;
    v60.size.height = v16;
    v41 = CGRectGetMinY(v60);
    v39 = v48;
  }
  objc_msgSend(v17, "setFrame:", v35, MinY, v39, v41, *(_QWORD *)&recta);

}

- (CAMModeDial)modeDial
{
  return self->_modeDial;
}

- (void)_layoutFlipButtonForLayoutStyle:(int64_t)a3
{
  int v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  double v17;
  CGFloat v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  int v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double MinX;
  double v34;
  uint64_t v35;
  uint64_t v36;
  id v37;
  CGRect v38;
  CGRect v39;
  CGRect v40;

  v4 = objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3);
  -[CAMBottomBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v35 = v9;
  v36 = v10;
  -[CAMBottomBar shutterButton](self, "shutterButton");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frame");
  objc_msgSend(v37, "alignmentRectForFrame:");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CAMBottomBar flipButton](self, "flipButton");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "intrinsicContentSize");
  v21 = v20;
  v23 = v22;
  if (v4)
  {
    v38.origin.x = v12;
    v38.origin.y = v14;
    v38.size.width = v16;
    v38.size.height = v18;
    CGRectGetMidX(v38);
    UIRoundToViewScale();
    v25 = v24;
    v39.origin.x = v12;
    v39.origin.y = v14;
    v39.size.width = v16;
    v39.size.height = v18;
    v26 = CGRectGetMinY(v39) + -29.0 - v23;
  }
  else
  {
    v40.origin.x = v12;
    v40.origin.y = v14;
    v40.size.width = v16;
    v40.size.height = v18;
    CGRectGetMidY(v40);
    UIRoundToViewScale();
    v26 = v27;
    v28 = -[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v29 = v6;
    v30 = v8;
    v31 = v35;
    v32 = v36;
    if (v28)
    {
      MinX = CGRectGetMinX(*(CGRect *)&v29);
      v34 = 20.0;
    }
    else
    {
      MinX = CGRectGetMaxX(*(CGRect *)&v29) - v21;
      v34 = -20.0;
    }
    v25 = MinX + v34;
  }
  objc_msgSend(v19, "frameForAlignmentRect:", v25, v26, v21, v23);
  objc_msgSend(v19, "setFrame:");

}

- (void)_layoutUtilityBarForLayoutStyle:(int64_t)a3
{
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  int64_t v14;
  void *v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  double v28;
  double v29;
  int v30;
  double v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  double v36;
  id v37;

  -[CAMBottomBar bounds](self, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v13 = (void *)objc_opt_class();
  v14 = -[CAMBottomBar layoutStyle](self, "layoutStyle");
  -[CAMBottomBar traitCollection](self, "traitCollection");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBottomBar safeAreaInsets](self, "safeAreaInsets");
  objc_msgSend(v13, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", v14, v15, v6, v8, v10, v12, v16, v17, v18, v19);
  v21 = v20;
  v23 = v22;
  v25 = v24;
  v27 = v26;

  -[CAMBottomBar utilityBarExtensionDistance](self, "utilityBarExtensionDistance");
  v29 = v28;
  v30 = objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3);
  v31 = -v29;
  v32 = v21;
  v33 = v23;
  v34 = v25;
  v35 = v27;
  if (v30)
  {
    v10 = v29 + CGRectGetMinX(*(CGRect *)&v32);
    v36 = -v29;
    v31 = 0.0;
  }
  else
  {
    v12 = v29 + CGRectGetMinY(*(CGRect *)&v32);
    v36 = 0.0;
  }
  -[CAMBottomBar utilityBar](self, "utilityBar");
  v37 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "frameForAlignmentRect:", v36, v31, v10, v12);
  objc_msgSend(v37, "setFrame:");

}

- (void)_layoutDoneButtonForLayoutStyle:(int64_t)a3
{
  id v5;

  -[CAMBottomBar bounds](self, "bounds");
  -[CAMBottomBar doneButton](self, "doneButton");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a3))
  {
    CAMPixelWidthForView(self);
    objc_msgSend(v5, "intrinsicContentSize");
    UIRectCenteredIntegralRectScale();
    objc_msgSend(v5, "frameForAlignmentRect:", 0);
    objc_msgSend(v5, "setFrame:");
  }

}

- (PUReviewScreenDoneButton)doneButton
{
  return self->_doneButton;
}

- (id)_currentMenuButtons
{
  id v3;
  void *v4;

  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v4 = v3;
  if (self->_imageAnalysisButton)
    objc_msgSend(v3, "addObject:");
  if (self->_livePhotoButton)
    objc_msgSend(v4, "addObject:");
  if (self->_HDRButton)
    objc_msgSend(v4, "addObject:");
  if (self->_timerButton)
    objc_msgSend(v4, "addObject:");
  if (self->_flashButton)
    objc_msgSend(v4, "addObject:");
  if (self->_sharedLibraryButton)
    objc_msgSend(v4, "addObject:");
  return v4;
}

- (CAMExpandableMenuButton)_expandedMenuButton
{
  return self->__expandedMenuButton;
}

- (void)_layoutMenuButtons:(id)a3 apply:(BOOL)a4 withExpandedMenuButton:(id)a5 collapsingMenuButton:(id)a6 collapsingFrame:(CGRect *)a7
{
  _BOOL4 v10;
  id v12;
  id v13;
  id v14;
  int64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  void *v34;
  int v35;
  double MinY;
  double v37;
  double v38;
  void *v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  CGFloat v54;
  double v55;
  CGFloat v56;
  double v57;
  CGFloat v58;
  double v59;
  CGFloat v60;
  void *v61;
  void *v62;
  double v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  double MaxY;
  double v71;
  void *v72;
  void *v73;
  uint64_t v74;
  uint64_t v75;
  void (*v76)(uint64_t, void *);
  void *v77;
  id v78;
  id v79;
  CAMBottomBar *v80;
  uint64_t *v81;
  uint64_t v82;
  uint64_t v83;
  uint64_t v84;
  uint64_t v85;
  CGRect *v86;
  BOOL v87;
  uint64_t v88;
  double *v89;
  uint64_t v90;
  uint64_t v91;
  CGRect v92;
  CGRect v93;
  CGRect v94;

  v10 = a4;
  v12 = a3;
  v13 = a5;
  v14 = a6;
  v15 = -[CAMBottomBar layoutStyle](self, "layoutStyle");
  if (objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", v15))
  {
    -[CAMBottomBar bounds](self, "bounds");
    -[CAMBottomBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
    v17 = v16;
    v19 = v18;
    v21 = v20;
    v23 = v22;
    v88 = 0;
    v89 = (double *)&v88;
    v90 = 0x2020000000;
    v91 = 0;
    -[CAMBottomBar flipButton](self, "flipButton");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = v24;
    if (v24)
    {
      objc_msgSend(v24, "frame");
      objc_msgSend(v25, "alignmentRectForFrame:");
      v27 = v26;
      v29 = v28;
      v31 = v30;
      v33 = v32;
      +[CAMCaptureCapabilities capabilities](CAMCaptureCapabilities, "capabilities");
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = objc_msgSend(v34, "overContentFlipButtonSupported");

      v92.origin.x = v27;
      v92.origin.y = v29;
      v92.size.width = v31;
      v92.size.height = v33;
      MinY = CGRectGetMinY(v92);
      v37 = 29.0;
      if (v35)
        v37 = 10.0;
      v38 = MinY - v37;
    }
    else
    {
      v39 = (void *)objc_opt_class();
      -[CAMBottomBar bounds](self, "bounds");
      v41 = v40;
      v43 = v42;
      v45 = v44;
      v47 = v46;
      -[CAMBottomBar traitCollection](self, "traitCollection");
      v48 = (void *)objc_claimAutoreleasedReturnValue();
      -[CAMBottomBar safeAreaInsets](self, "safeAreaInsets");
      objc_msgSend(v39, "shutterButtonAlignmentRectInBounds:forLayoutStyle:traitCollection:safeAreaInsets:", v15, v48, v41, v43, v45, v47, v49, v50, v51, v52);
      v54 = v53;
      v56 = v55;
      v58 = v57;
      v60 = v59;

      v93.origin.x = v54;
      v93.origin.y = v56;
      v93.size.width = v58;
      v93.size.height = v60;
      v38 = CGRectGetMinY(v93) + -30.0;
    }
    v89[3] = v38;
    v74 = MEMORY[0x1E0C809B0];
    v75 = 3221225472;
    v76 = __101__CAMBottomBar__layoutMenuButtons_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke;
    v77 = &unk_1EA328D68;
    v82 = v17;
    v83 = v19;
    v84 = v21;
    v85 = v23;
    v78 = v14;
    v81 = &v88;
    v79 = v13;
    v80 = self;
    v86 = a7;
    v87 = v10;
    objc_msgSend(v12, "enumerateObjectsWithOptions:usingBlock:", 2, &v74);
    -[CAMBottomBar apertureButton](self, "apertureButton");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    v62 = v61;
    if (v61)
    {
      objc_msgSend(v61, "intrinsicContentSize");
      UIRectCenteredIntegralRectScale();
      v64 = v63;
      v66 = v65;
      v68 = v67;
      objc_msgSend(v12, "lastObject", 0, v74, v75, v76, v77, v78);
      v69 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v69, "frame");
      objc_msgSend(v69, "alignmentRectForFrame:");
      MaxY = CGRectGetMaxY(v94);
      if (v10)
      {
        v71 = MaxY;
        objc_msgSend(v62, "setExpansionDirection:", 2);
        objc_msgSend(v62, "frameForAlignmentRect:", v64, v71 + 10.0, v66, v68);
        objc_msgSend(v62, "setFrame:");
      }

    }
    -[CAMBottomBar imageAnalysisButton](self, "imageAnalysisButton");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v72 && v10)
    {
      objc_msgSend(v72, "frame");
      UIRectInset();
      objc_msgSend(v73, "setFrame:");
    }

    _Block_object_dispose(&v88, 8);
  }

}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  void *v9;
  CAMBottomBar *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id v17;
  double v18;
  CGFloat v19;
  double v20;
  CGFloat v21;
  double v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  objc_super v28;
  _BYTE v29[128];
  uint64_t v30;
  CGPoint v31;
  CGPoint v32;
  CGRect v33;
  CGRect v34;

  y = a3.y;
  x = a3.x;
  v30 = *MEMORY[0x1E0C80C00];
  v7 = a4;
  -[CAMBottomBar _expandedMenuButton](self, "_expandedMenuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8 && (objc_msgSend(v8, "frame"), v31.x = x, v31.y = y, CGRectContainsPoint(v33, v31)))
  {
    v10 = v9;
  }
  else
  {
    v28.receiver = self;
    v28.super_class = (Class)CAMBottomBar;
    -[CAMBottomBar hitTest:withEvent:](&v28, sel_hitTest_withEvent_, v7, x, y);
    v10 = (CAMBottomBar *)objc_claimAutoreleasedReturnValue();
    if (-[CAMBottomBar backgroundStyle](self, "backgroundStyle") == 1 && v10 == self)
    {
      -[CAMBottomBar subviews](self, "subviews");
      v24 = 0u;
      v25 = 0u;
      v26 = 0u;
      v27 = 0u;
      v11 = (id)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
      if (v12)
      {
        v13 = v12;
        v14 = *(_QWORD *)v25;
LABEL_8:
        v15 = 0;
        while (1)
        {
          if (*(_QWORD *)v25 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v15);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v17 = v16;
            if ((objc_msgSend(v17, "isEnabled", (_QWORD)v24) & 1) == 0)
            {
              -[CAMBottomBar convertPoint:toView:](self, "convertPoint:toView:", v17, x, y);
              v19 = v18;
              v21 = v20;
              objc_msgSend(v17, "alpha");
              if (v22 > 0.0)
              {
                objc_msgSend(v17, "bounds");
                v32.x = v19;
                v32.y = v21;
                if (CGRectContainsPoint(v34, v32))
                {

                  if (v17)
                    goto LABEL_21;
                  goto LABEL_20;
                }
              }
            }

          }
          if (v13 == ++v15)
          {
            v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v24, v29, 16);
            if (v13)
              goto LABEL_8;
            break;
          }
        }
      }

LABEL_20:
      v17 = 0;
      self = 0;
LABEL_21:

      v10 = self;
    }
  }

  return v10;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  unsigned __int8 v7;
  void *v8;
  void *v9;
  BOOL v10;
  void *v11;
  void *v12;
  double v13;
  BOOL v14;
  uint64_t v15;
  void *v16;
  double v17;
  char v18;
  objc_super v20;
  CGPoint v21;
  CGPoint v22;
  CGPoint v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;

  y = a3.y;
  x = a3.x;
  v20.receiver = self;
  v20.super_class = (Class)CAMBottomBar;
  v7 = -[CAMBottomBar pointInside:withEvent:](&v20, sel_pointInside_withEvent_, a4);
  -[CAMBottomBar _expandedMenuButton](self, "_expandedMenuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "frame");
    v21.x = x;
    v21.y = y;
    v10 = CGRectContainsPoint(v24, v21);
  }
  else
  {
    v10 = 0;
  }
  -[CAMBottomBar utilityBar](self, "utilityBar");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = v11;
  if (!v11 || (objc_msgSend(v11, "isHidden") & 1) != 0 || (objc_msgSend(v12, "alpha"), v13 <= 0.0))
  {
    v14 = 0;
  }
  else
  {
    objc_msgSend(v12, "frame");
    v22.x = x;
    v22.y = y;
    v14 = CGRectContainsPoint(v25, v22);
  }
  -[CAMBottomBar imageAnalysisButtonBackgroundOverlay](self, "imageAnalysisButtonBackgroundOverlay");
  v15 = objc_claimAutoreleasedReturnValue();
  v16 = (void *)v15;
  if (v15)
  {
    if ((objc_msgSend((id)v15, "isHidden") & 1) != 0 || (objc_msgSend(v16, "alpha"), v17 <= 0.0))
    {
      LOBYTE(v15) = 0;
    }
    else
    {
      objc_msgSend(v16, "frame");
      v23.x = x;
      v23.y = y;
      LOBYTE(v15) = CGRectContainsPoint(v26, v23);
    }
  }
  if (((v7 | v10) & 1) != 0)
    v18 = 1;
  else
    v18 = v14 | v15;

  return v18;
}

- (CAMBottomBar)initWithFrame:(CGRect)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMBottomBar initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (CAMBottomBar)initWithCoder:(id)a3
{
  void *v4;
  uint64_t v5;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "cam_initialLayoutStyle");

  return -[CAMBottomBar initWithLayoutStyle:](self, "initWithLayoutStyle:", v5);
}

- (void)setLayoutStyle:(int64_t)a3
{
  if (self->_layoutStyle != a3)
  {
    self->_layoutStyle = a3;
    -[CAMBottomBar _updateImageWellTappableEdgeInsets](self, "_updateImageWellTappableEdgeInsets");
    -[CAMBottomBar _updateFlipButtonTappableEdgeInsets](self, "_updateFlipButtonTappableEdgeInsets");
    -[CAMBottomBar _updateCreativeCameraButtonTappableEdgeInsets](self, "_updateCreativeCameraButtonTappableEdgeInsets");
    -[CAMBottomBar setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setStillDuringVideoButton:(id)a3
{
  CUShutterButton *v5;
  CUShutterButton *stillDuringVideoButton;
  CUShutterButton *v7;

  v5 = (CUShutterButton *)a3;
  stillDuringVideoButton = self->_stillDuringVideoButton;
  if (stillDuringVideoButton != v5)
  {
    v7 = v5;
    -[CUShutterButton removeFromSuperview](stillDuringVideoButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_stillDuringVideoButton, a3);
    -[CAMBottomBar addSubview:](self, "addSubview:", self->_stillDuringVideoButton);
    v5 = v7;
  }

}

- (void)setReviewButton:(id)a3
{
  UIButton *v5;
  UIButton *reviewButton;
  UIButton *v7;

  v5 = (UIButton *)a3;
  reviewButton = self->_reviewButton;
  v7 = v5;
  if (reviewButton != v5)
  {
    -[UIButton removeFromSuperview](reviewButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_reviewButton, a3);
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)setCreativeCameraButton:(id)a3
{
  CAMCreativeCameraButton *v5;
  CAMCreativeCameraButton *creativeCameraButton;
  CAMCreativeCameraButton *v7;

  v5 = (CAMCreativeCameraButton *)a3;
  creativeCameraButton = self->_creativeCameraButton;
  v7 = v5;
  if (creativeCameraButton != v5)
  {
    -[CAMCreativeCameraButton removeFromSuperview](creativeCameraButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_creativeCameraButton, a3);
    -[CAMBottomBar _updateCreativeCameraButtonTappableEdgeInsets](self, "_updateCreativeCameraButtonTappableEdgeInsets");
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)setDoneButton:(id)a3
{
  PUReviewScreenDoneButton *v5;
  PUReviewScreenDoneButton *doneButton;
  PUReviewScreenDoneButton *v7;

  v5 = (PUReviewScreenDoneButton *)a3;
  doneButton = self->_doneButton;
  v7 = v5;
  if (doneButton != v5)
  {
    -[PUReviewScreenDoneButton removeFromSuperview](doneButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_doneButton, a3);
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)_updateCreativeCameraButtonTappableEdgeInsets
{
  double v3;
  id v4;

  v3 = 5.0;
  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", -[CAMBottomBar layoutStyle](self, "layoutStyle")) & 1) == 0)
  {
    -[CAMBottomBar _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v3 = 11.0;
  }
  -[CAMBottomBar creativeCameraButton](self, "creativeCameraButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTappableEdgeInsets:", v3, 11.0, v3, 11.0);

}

- (void)setLivePhotoButton:(id)a3
{
  CAMLivePhotoButton *v5;
  CAMLivePhotoButton *livePhotoButton;
  CAMLivePhotoButton *v7;

  v5 = (CAMLivePhotoButton *)a3;
  livePhotoButton = self->_livePhotoButton;
  v7 = v5;
  if (livePhotoButton != v5)
  {
    -[CAMLivePhotoButton removeFromSuperview](livePhotoButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](self->_livePhotoButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_livePhotoButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](v7, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v7, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)setSharedLibraryButton:(id)a3
{
  CAMSharedLibraryButton *v5;
  CAMSharedLibraryButton *sharedLibraryButton;
  CAMSharedLibraryButton *v7;

  v5 = (CAMSharedLibraryButton *)a3;
  sharedLibraryButton = self->_sharedLibraryButton;
  v7 = v5;
  if (sharedLibraryButton != v5)
  {
    -[CAMSharedLibraryButton removeFromSuperview](sharedLibraryButton, "removeFromSuperview");
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](self->_sharedLibraryButton, "setExpandableMenuDelegate:", 0);
    objc_storeStrong((id *)&self->_sharedLibraryButton, a3);
    -[CAMExpandableMenuButton setExpandableMenuDelegate:](v7, "setExpandableMenuDelegate:", self);
    -[CAMExpandableMenuButton setTappableEdgeInsets:](v7, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
  }

}

- (void)setApertureButton:(id)a3
{
  CEKApertureButton *v5;
  CEKApertureButton **p_apertureButton;
  CEKApertureButton *apertureButton;
  CAMBottomBar *v8;
  CAMBottomBar *v9;
  CEKApertureButton *v10;

  v5 = (CEKApertureButton *)a3;
  p_apertureButton = &self->_apertureButton;
  apertureButton = self->_apertureButton;
  if (apertureButton != v5)
  {
    v10 = v5;
    -[CEKApertureButton superview](apertureButton, "superview");
    v8 = (CAMBottomBar *)objc_claimAutoreleasedReturnValue();

    if (v8 == self)
      -[CEKApertureButton removeFromSuperview](*p_apertureButton, "removeFromSuperview");
    -[CEKApertureButton delegate](*p_apertureButton, "delegate");
    v9 = (CAMBottomBar *)objc_claimAutoreleasedReturnValue();

    if (v9 == self)
      -[CEKApertureButton setDelegate:](*p_apertureButton, "setDelegate:", 0);
    objc_storeStrong((id *)&self->_apertureButton, a3);
    -[CEKApertureButton setDelegate:](v10, "setDelegate:", self);
    -[CEKApertureButton setTappableEdgeInsets:](v10, "setTappableEdgeInsets:", 5.0, 11.0, 5.0, 11.0);
    -[CAMBottomBar addSubview:](self, "addSubview:", v10);
    v5 = v10;
  }

}

- (void)setImageAnalysisButton:(id)a3
{
  CAMImageAnalysisButton *v5;
  CAMImageAnalysisButton *imageAnalysisButton;
  CAMBottomBar *v7;
  void *v8;
  CAMImageAnalysisButton *v9;

  v5 = (CAMImageAnalysisButton *)a3;
  imageAnalysisButton = self->_imageAnalysisButton;
  if (imageAnalysisButton != v5)
  {
    v9 = v5;
    -[CAMImageAnalysisButton superview](imageAnalysisButton, "superview");
    v7 = (CAMBottomBar *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[CAMImageAnalysisButton removeFromSuperview](self->_imageAnalysisButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageAnalysisButton, a3);
    -[VKImageAnalysisButton setBackgroundDiameter:](v9, "setBackgroundDiameter:", 44.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.0, 0.3);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VKImageAnalysisButton setCameraModeBackgroundColor:](v9, "setCameraModeBackgroundColor:", v8);

    -[CAMBottomBar addSubview:](self, "addSubview:", v9);
    v5 = v9;
  }

}

- (void)setImageAnalysisButtonBackgroundOverlay:(id)a3
{
  UIView *v5;
  UIView *imageAnalysisButtonBackgroundOverlay;
  CAMBottomBar *v7;
  void *v8;
  UIView *v9;

  v5 = (UIView *)a3;
  imageAnalysisButtonBackgroundOverlay = self->_imageAnalysisButtonBackgroundOverlay;
  if (imageAnalysisButtonBackgroundOverlay != v5)
  {
    v9 = v5;
    -[UIView superview](imageAnalysisButtonBackgroundOverlay, "superview");
    v7 = (CAMBottomBar *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UIView removeFromSuperview](self->_imageAnalysisButtonBackgroundOverlay, "removeFromSuperview");
    objc_storeStrong((id *)&self->_imageAnalysisButtonBackgroundOverlay, a3);
    -[CAMBottomBar imageAnalysisButton](self, "imageAnalysisButton");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[CAMBottomBar insertSubview:belowSubview:](self, "insertSubview:belowSubview:", v9, v8);

    v5 = v9;
  }

}

- (void)_updateControlVisibilityAnimated:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[CAMBottomBar visibilityUpdateDelegate](self, "visibilityUpdateDelegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "updateControlVisibilityAnimated:", v3);

}

- (void)setUtilityBar:(id)a3
{
  CAMUtilityBar *v5;
  CAMUtilityBar *utilityBar;
  CAMUtilityBar *v7;

  v5 = (CAMUtilityBar *)a3;
  utilityBar = self->_utilityBar;
  v7 = v5;
  if (utilityBar != v5)
  {
    -[CAMUtilityBar removeFromSuperview](utilityBar, "removeFromSuperview");
    objc_storeStrong((id *)&self->_utilityBar, a3);
    -[CAMBottomBar addSubview:](self, "addSubview:", v7);
    -[CAMBottomBar _ensureSubviewOrdering](self, "_ensureSubviewOrdering");
  }

}

- (void)setUtilityBarExtensionDistance:(double)a3
{
  if (self->_utilityBarExtensionDistance != a3)
  {
    self->_utilityBarExtensionDistance = a3;
    -[CAMBottomBar setNeedsLayout](self, "setNeedsLayout");
  }
}

+ (CGRect)shutterButtonAlignmentRectInBounds:(CGRect)a3 forLayoutStyle:(int64_t)a4 traitCollection:(id)a5 safeAreaInsets:(UIEdgeInsets)a6
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  CGFloat v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double bottom;
  double v34;
  double v35;
  double v36;
  _OWORD v37[2];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect result;

  bottom = a6.bottom;
  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v12 = a5;
  v39.origin.x = x;
  v39.origin.y = y;
  v39.size.width = width;
  v39.size.height = height;
  CGRectGetHeight(v39);
  objc_msgSend(v12, "displayScale");
  v14 = v13;
  v38 = 0;
  memset(v37, 0, sizeof(v37));
  CAMShutterButtonSpecForLayoutStyle(a4, (uint64_t)v37);
  v15 = 0.0;
  UIRectCenteredIntegralRectScale();
  v35 = v17;
  v36 = v16;
  v19 = v18;
  v34 = v20;
  if ((objc_msgSend((id)objc_opt_class(), "wantsVerticalBarForLayoutStyle:", a4, 0) & 1) != 0)
  {
    v22 = v35;
    v21 = v36;
    v23 = v34;
    goto LABEL_17;
  }
  if ((unint64_t)a4 < 4)
  {
    v24 = 1.0 / v14 + 23.0;
    v25 = 4.0;
LABEL_8:
    UIRoundToScale();
    v15 = v26;
    goto LABEL_9;
  }
  if (a4 == 4)
  {
    v25 = 0.0;
    v24 = 1.79769313e308;
    goto LABEL_8;
  }
  v24 = 1.79769313e308;
  v25 = 0.0;
LABEL_9:
  if (v24 >= v15)
    v27 = v15;
  else
    v27 = v24;
  if (v27 >= v25)
    v25 = v27;
  if ((objc_msgSend(a1, "shouldUseSafeAreaInsetForLayoutStyle:traitCollection:", a4, v12) & (v25 < bottom)) != 0)
    v25 = bottom;
  v40.origin.x = x;
  v40.origin.y = y;
  v40.size.width = width;
  v40.size.height = height;
  v28 = CGRectGetMaxY(v40) - v25;
  v23 = v34;
  v22 = v35;
  v19 = v28 - v34;
  v21 = v36;
LABEL_17:

  v29 = v21;
  v30 = v19;
  v31 = v22;
  v32 = v23;
  result.size.height = v32;
  result.size.width = v31;
  result.origin.y = v30;
  result.origin.x = v29;
  return result;
}

+ (BOOL)shouldUseSafeAreaInsetForLayoutStyle:(int64_t)a3 traitCollection:(id)a4
{
  id v6;
  char v7;
  uint64_t v8;

  v6 = a4;
  v7 = objc_msgSend(a1, "wantsVerticalBarForLayoutStyle:", a3);
  v8 = objc_msgSend(v6, "verticalSizeClass");

  if (v8 == 2)
    return v7 ^ 1;
  else
    return 0;
}

- (void)setBackgroundStyle:(int64_t)a3
{
  -[CAMBottomBar setBackgroundStyle:animated:](self, "setBackgroundStyle:animated:", a3, 0);
}

uint64_t __44__CAMBottomBar_setBackgroundStyle_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

void __101__CAMBottomBar__layoutMenuButtons_apply_withExpandedMenuButton_collapsingMenuButton_collapsingFrame___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  _QWORD *v16;
  id v17;
  CGRect v18;

  v3 = a2;
  v17 = v3;
  if (*(id *)(a1 + 32) == v3)
    objc_msgSend(v3, "intrinsicContentSizeForExpansion:", 0);
  else
    objc_msgSend(v3, "intrinsicContentSize");
  UIRectCenteredIntegralRectScale();
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v10 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) - v8;
  if (*(id *)(a1 + 32) == v17)
    objc_msgSend(v17, "frameForAlignmentRect:expanded:", 0, 0);
  else
    objc_msgSend(v17, "frameForAlignmentRect:", 0);
  v15 = v17;
  if (*(id *)(a1 + 40) == v17)
  {
    objc_msgSend(*(id *)(a1 + 48), "expandedFrameForMenuButton:", v17);
    v15 = v17;
  }
  if (*(id *)(a1 + 32) == v15)
  {
    v16 = *(_QWORD **)(a1 + 96);
    if (v16)
    {
      *v16 = v11;
      v16[1] = v12;
      v16[2] = v13;
      v16[3] = v14;
    }
  }
  if (*(_BYTE *)(a1 + 104))
    objc_msgSend(v17, "setFrame:");
  v18.origin.x = v5;
  v18.origin.y = v10;
  v18.size.width = v7;
  v18.size.height = v9;
  *(CGFloat *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = CGRectGetMinY(v18) + -10.0;

}

- (CGRect)collapsedFrameForMenuButton:(id)a3
{
  __int128 v4;
  id v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  __int128 v11;
  __int128 v12;
  CGRect result;

  v4 = *(_OWORD *)(MEMORY[0x1E0C9D648] + 16);
  v11 = *MEMORY[0x1E0C9D648];
  v12 = v4;
  v5 = a3;
  -[CAMBottomBar _currentMenuButtons](self, "_currentMenuButtons");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CAMBottomBar _layoutMenuButtons:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:](self, "_layoutMenuButtons:apply:withExpandedMenuButton:collapsingMenuButton:collapsingFrame:", v6, 0, 0, v5, &v11);

  v8 = *((double *)&v11 + 1);
  v7 = *(double *)&v11;
  v10 = *((double *)&v12 + 1);
  v9 = *(double *)&v12;
  result.size.height = v10;
  result.size.width = v9;
  result.origin.y = v8;
  result.origin.x = v7;
  return result;
}

- (void)collapseMenuButton:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;

  v4 = a4;
  v16 = a3;
  if (objc_msgSend(v16, "isExpanded"))
  {
    -[CAMBottomBar collapsedFrameForMenuButton:](self, "collapsedFrameForMenuButton:", v16);
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    -[CAMBottomBar _setExpandedMenuButton:](self, "_setExpandedMenuButton:", 0);
    v14 = (void *)MEMORY[0x1E0DC3F10];
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __44__CAMBottomBar_collapseMenuButton_animated___block_invoke;
    v17[3] = &unk_1EA328D90;
    v15 = v16;
    v18 = v15;
    v19 = v7;
    v20 = v9;
    v21 = v11;
    v22 = v13;
    objc_msgSend(v14, "performWithoutAnimation:", v17);
    objc_msgSend(v15, "finishCollapsingAnimated:", v4);
    -[CAMBottomBar _updateControlVisibilityAnimated:](self, "_updateControlVisibilityAnimated:", v4);

  }
}

uint64_t __44__CAMBottomBar_collapseMenuButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startCollapsingWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (CGRect)expandedFrameForMenuButton:(id)a3
{
  id v4;
  unint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double MinY;
  double v20;
  CGFloat v21;
  double v22;
  CGFloat v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double MaxX;
  double v29;
  double v30;
  double v31;
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  CGFloat rect;
  CGFloat v43;
  CGFloat v44;
  CGFloat v45;
  CGFloat v46;
  CGFloat v47;
  CGRect v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  v4 = a3;
  v5 = objc_msgSend(v4, "orientation") - 3;
  -[CAMBottomBar bounds](self, "bounds");
  -[CAMBottomBar alignmentRectForFrame:](self, "alignmentRectForFrame:");
  v43 = v7;
  v44 = v6;
  v45 = v8;
  rect = v9;
  -[CAMBottomBar collapsedFrameForMenuButton:](self, "collapsedFrameForMenuButton:", v4);
  v11 = v10;
  v13 = v12;
  v46 = v15;
  v47 = v14;
  objc_msgSend(v4, "alignmentRectForFrame:expanded:", 0);
  v17 = v16;
  MinY = v18;
  v21 = v20;
  v23 = v22;
  objc_msgSend(v4, "intrinsicContentSizeForExpansion:", 1);
  v25 = v24;
  v27 = v26;
  v48.origin.x = v17;
  v48.origin.y = MinY;
  v48.size.width = v21;
  v48.size.height = v23;
  MaxX = CGRectGetMaxX(v48);
  if (v5 > 1)
  {
    v30 = MaxX - v25;
  }
  else
  {
    objc_msgSend(v4, "frame", MaxX);
    v30 = v29;
    v25 = v31;
    v49.origin.y = v43;
    v49.origin.x = v44;
    v27 = v45;
    v49.size.width = v45;
    v49.size.height = rect;
    MinY = CGRectGetMinY(v49);
  }
  objc_msgSend(v4, "frameForAlignmentRect:expanded:", 0, v30, MinY, v25, v27);
  x = v50.origin.x;
  y = v50.origin.y;
  width = v50.size.width;
  height = v50.size.height;
  CGRectGetHeight(v50);
  v51.origin.y = v46;
  v51.origin.x = v47;
  v51.size.width = v11;
  v51.size.height = v13;
  CGRectGetHeight(v51);
  UIRoundToViewScale();
  v37 = y - v36;

  v38 = x;
  v39 = v37;
  v40 = width;
  v41 = height;
  result.size.height = v41;
  result.size.width = v40;
  result.origin.y = v39;
  result.origin.x = v38;
  return result;
}

- (void)expandMenuButton:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  uint64_t v26;
  _QWORD v27[5];
  id v28;

  v4 = a4;
  v20 = a3;
  if ((objc_msgSend(v20, "isExpanded") & 1) == 0)
  {
    -[CAMBottomBar _expandedMenuButton](self, "_expandedMenuButton");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    v8 = MEMORY[0x1E0C809B0];
    if (v6)
    {
      v9 = (void *)MEMORY[0x1E0DC3F10];
      v27[0] = MEMORY[0x1E0C809B0];
      v27[1] = 3221225472;
      v27[2] = __42__CAMBottomBar_expandMenuButton_animated___block_invoke;
      v27[3] = &unk_1EA328A40;
      v27[4] = self;
      v28 = v6;
      objc_msgSend(v9, "performWithoutAnimation:", v27);

    }
    -[CAMBottomBar _setExpandedMenuButton:](self, "_setExpandedMenuButton:", v20);
    -[CAMBottomBar expandedFrameForMenuButton:](self, "expandedFrameForMenuButton:", v20);
    v11 = v10;
    v13 = v12;
    v15 = v14;
    v17 = v16;
    v18 = (void *)MEMORY[0x1E0DC3F10];
    v21[0] = v8;
    v21[1] = 3221225472;
    v21[2] = __42__CAMBottomBar_expandMenuButton_animated___block_invoke_2;
    v21[3] = &unk_1EA328D90;
    v19 = v20;
    v22 = v19;
    v23 = v11;
    v24 = v13;
    v25 = v15;
    v26 = v17;
    objc_msgSend(v18, "performWithoutAnimation:", v21);
    objc_msgSend(v19, "finishExpansionAnimated:", v4);
    -[CAMBottomBar _updateControlVisibilityAnimated:](self, "_updateControlVisibilityAnimated:", v4);

  }
}

uint64_t __42__CAMBottomBar_expandMenuButton_animated___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "collapsedFrameForMenuButton:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 40), "startCollapsingWithProposedFrame:");
  return objc_msgSend(*(id *)(a1 + 40), "finishCollapsingAnimated:", 0);
}

uint64_t __42__CAMBottomBar_expandMenuButton_animated___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "startExpansionWithProposedFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
  return objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)touchingRecognizersToCancel
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  -[CAMBottomBar _currentMenuButtons](self, "_currentMenuButtons", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v8);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          objc_msgSend(v9, "touchingGestureRecognizer");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v10);

        }
        ++v8;
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v6);
  }

  return v3;
}

- (void)_iterateViewsInHUDManager:(id)a3 forHUDItem:(id)a4
{
  id v6;
  void (**v7)(id, id, _BYTE *);
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
  CGFloat v18;
  double v19;
  CGFloat v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  void *v25;
  double v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  char v31;
  _BYTE v32[128];
  uint64_t v33;
  CGPoint v34;
  CGRect v35;

  v33 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, id, _BYTE *))a4;
  v31 = 0;
  -[CAMBottomBar _expandedMenuButton](self, "_expandedMenuButton");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    -[CAMBottomBar _expandedMenuButton](self, "_expandedMenuButton");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    v7[2](v7, v9, &v31);
  }
  else
  {
    -[CAMBottomBar _currentMenuButtons](self, "_currentMenuButtons");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v10, "mutableCopy");

    -[CAMBottomBar modeDial](self, "modeDial");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObject:", v12);

    -[CAMBottomBar apertureButton](self, "apertureButton");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (v13)
    {
      -[CAMBottomBar apertureButton](self, "apertureButton");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v14);

    }
    -[CAMBottomBar flipButton](self, "flipButton");
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    if (v15)
    {
      -[CAMBottomBar flipButton](self, "flipButton");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v16);

    }
    objc_msgSend(v6, "locationOfAccessibilityGestureInView:", self);
    v18 = v17;
    v20 = v19;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v30 = 0u;
    v9 = v11;
    v21 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v28;
LABEL_9:
      v24 = 0;
      while (1)
      {
        if (*(_QWORD *)v28 != v23)
          objc_enumerationMutation(v9);
        v25 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * v24);
        objc_msgSend(v25, "frame", (_QWORD)v27);
        v34.x = v18;
        v34.y = v20;
        if (CGRectContainsPoint(v35, v34))
        {
          if (objc_msgSend(v25, "conformsToProtocol:", &unk_1F03116F0))
          {
            if ((objc_msgSend(v25, "isHidden") & 1) == 0)
            {
              objc_msgSend(v25, "alpha");
              if (v26 != 0.0)
              {
                v7[2](v7, v25, &v31);
                if (v31)
                  break;
              }
            }
          }
        }
        if (v22 == ++v24)
        {
          v22 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
          if (v22)
            goto LABEL_9;
          break;
        }
      }
    }

  }
}

- (id)hudItemForAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v4 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy__1;
  v15 = __Block_byref_object_dispose__1;
  v16 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __50__CAMBottomBar_hudItemForAccessibilityHUDManager___block_invoke;
  v8[3] = &unk_1EA328DB8;
  v10 = &v11;
  v5 = v4;
  v9 = v5;
  -[CAMBottomBar _iterateViewsInHUDManager:forHUDItem:](self, "_iterateViewsInHUDManager:forHUDItem:", v5, v8);
  v6 = (id)v12[5];

  _Block_object_dispose(&v11, 8);
  return v6;
}

void __50__CAMBottomBar_hudItemForAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t v5;
  uint64_t v6;
  void *v7;

  objc_msgSend(a2, "hudItemForAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v7 = *(void **)(v6 + 40);
  *(_QWORD *)(v6 + 40) = v5;

  *a3 = 1;
}

- (void)selectedByAccessibilityHUDManager:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[4];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __50__CAMBottomBar_selectedByAccessibilityHUDManager___block_invoke;
  v6[3] = &unk_1EA328DE0;
  v7 = v4;
  v5 = v4;
  -[CAMBottomBar _iterateViewsInHUDManager:forHUDItem:](self, "_iterateViewsInHUDManager:forHUDItem:", v5, v6);

}

uint64_t __50__CAMBottomBar_selectedByAccessibilityHUDManager___block_invoke(uint64_t a1, void *a2, _BYTE *a3)
{
  uint64_t result;

  result = objc_msgSend(a2, "selectedByAccessibilityHUDManager:", *(_QWORD *)(a1 + 32));
  *a3 = 1;
  return result;
}

- (CAMControlVisibilityUpdateDelegate)visibilityUpdateDelegate
{
  return (CAMControlVisibilityUpdateDelegate *)objc_loadWeakRetained((id *)&self->_visibilityUpdateDelegate);
}

- (void)setVisibilityUpdateDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_visibilityUpdateDelegate, a3);
}

- (CAMFlashButton)flashButton
{
  return self->_flashButton;
}

- (CAMHDRButton)HDRButton
{
  return self->_HDRButton;
}

- (CAMTimerButton)timerButton
{
  return self->_timerButton;
}

- (CAMLivePhotoButton)livePhotoButton
{
  return self->_livePhotoButton;
}

- (CAMSharedLibraryButton)sharedLibraryButton
{
  return self->_sharedLibraryButton;
}

- (CEKApertureButton)apertureButton
{
  return self->_apertureButton;
}

- (CAMImageAnalysisButton)imageAnalysisButton
{
  return self->_imageAnalysisButton;
}

- (UIView)imageAnalysisButtonBackgroundOverlay
{
  return self->_imageAnalysisButtonBackgroundOverlay;
}

- (double)utilityBarExtensionDistance
{
  return self->_utilityBarExtensionDistance;
}

- (void)_setExpandedMenuButton:(id)a3
{
  objc_storeStrong((id *)&self->__expandedMenuButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__expandedMenuButton, 0);
  objc_storeStrong((id *)&self->_utilityBar, 0);
  objc_storeStrong((id *)&self->_imageAnalysisButtonBackgroundOverlay, 0);
  objc_storeStrong((id *)&self->_imageAnalysisButton, 0);
  objc_storeStrong((id *)&self->_apertureButton, 0);
  objc_storeStrong((id *)&self->_sharedLibraryButton, 0);
  objc_storeStrong((id *)&self->_livePhotoButton, 0);
  objc_storeStrong((id *)&self->_timerButton, 0);
  objc_storeStrong((id *)&self->_HDRButton, 0);
  objc_storeStrong((id *)&self->_flashButton, 0);
  objc_storeStrong((id *)&self->_flipButton, 0);
  objc_storeStrong((id *)&self->_doneButton, 0);
  objc_storeStrong((id *)&self->_creativeCameraButton, 0);
  objc_storeStrong((id *)&self->_reviewButton, 0);
  objc_storeStrong((id *)&self->_imageWell, 0);
  objc_storeStrong((id *)&self->_modeDial, 0);
  objc_storeStrong((id *)&self->_stillDuringVideoButton, 0);
  objc_storeStrong((id *)&self->_shutterButton, 0);
  objc_destroyWeak((id *)&self->_visibilityUpdateDelegate);
  objc_storeStrong((id *)&self->_backgroundView, 0);
}

@end

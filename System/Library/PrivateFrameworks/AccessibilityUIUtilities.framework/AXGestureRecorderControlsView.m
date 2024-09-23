@implementation AXGestureRecorderControlsView

+ (double)defaultHeight
{
  return 90.0;
}

- (AXGestureRecorderControlsView)initWithFrame:(CGRect)a3
{
  double width;
  AXGestureRecorderControlsView *v4;
  void *v5;
  id v6;
  void *v7;
  double v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  ASTBiggerProgressView *v16;
  ASTBiggerProgressView *progressView;
  void *v18;
  double v19;
  objc_super v21;

  width = a3.size.width;
  v21.receiver = self;
  v21.super_class = (Class)AXGestureRecorderControlsView;
  v4 = -[AXGestureRecorderControlsView initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "secondarySystemGroupedBackgroundColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderControlsView setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "scale");
    v9 = (void *)objc_msgSend(v6, "initWithFrame:", 0.0, 0.0, width, 1.0 / v8);

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setBackgroundColor:", v10);

    objc_msgSend(v9, "setAutoresizingMask:", 2);
    -[AXGestureRecorderControlsView addSubview:](v4, "addSubview:", v9);
    v11 = objc_alloc(MEMORY[0x1E0DC3F10]);
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scale");
    v14 = (void *)objc_msgSend(v11, "initWithFrame:", 0.0, 45.0, width, 1.0 / v13);

    objc_msgSend(MEMORY[0x1E0DC3658], "separatorColor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setBackgroundColor:", v15);

    objc_msgSend(v14, "setAutoresizingMask:", 2);
    -[AXGestureRecorderControlsView addSubview:](v4, "addSubview:", v14);
    v16 = -[ASTBiggerProgressView initWithProgressViewStyle:]([ASTBiggerProgressView alloc], "initWithProgressViewStyle:", 0);
    progressView = v4->_progressView;
    v4->_progressView = v16;

    -[ASTBiggerProgressView setAutoresizingMask:](v4->_progressView, "setAutoresizingMask:", 2);
    objc_msgSend(MEMORY[0x1E0DC3658], "quaternaryLabelColor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASTBiggerProgressView setTrackTintColor:](v4->_progressView, "setTrackTintColor:", v18);

    LODWORD(v19) = 0;
    -[ASTBiggerProgressView setProgress:](v4->_progressView, "setProgress:", v19);
    -[AXGestureRecorderControlsView addSubview:](v4, "addSubview:", v4->_progressView);

  }
  return v4;
}

- (float)progress
{
  float result;

  -[ASTBiggerProgressView progress](self->_progressView, "progress");
  return result;
}

- (void)setProgress:(float)a3
{
  ASTBiggerProgressView *progressView;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  float v12;
  double v13;
  id v14;

  progressView = self->_progressView;
  if (fabsf(a3) >= 2.2204e-16)
  {
    -[ASTBiggerProgressView safeValueForKeyPath:](progressView, "safeValueForKeyPath:", CFSTR("_progressView.image"));
    v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "capInsets");
    v8 = v7;
    objc_msgSend(v14, "capInsets");
    v10 = v9;
    -[ASTBiggerProgressView bounds](self->_progressView, "bounds");
    v12 = v11;
    LODWORD(v13) = 0;
    if (v12 > 0.0)
    {
      v13 = v8 + v10;
      *(float *)&v13 = v8 + v10;
      *(float *)&v13 = *(float *)&v13 / v12;
    }
    *(float *)&v13 = *(float *)&v13 + (float)((float)(1.0 - *(float *)&v13) * a3);
    -[ASTBiggerProgressView setProgress:animated:](self->_progressView, "setProgress:animated:", 1, v13);

  }
  else
  {
    LODWORD(v6) = 0;
    -[ASTBiggerProgressView setProgress:](progressView, "setProgress:", v6);
  }
}

- (void)layoutSubviews
{
  uint64_t v3;
  int *v4;
  void *v5;
  int *v6;
  id v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  CGFloat v19;
  double v20;
  double v21;
  double v22;
  CGFloat v23;
  double Width;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double MaxX;
  double MinX;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat rect;
  CGFloat v40;
  CGFloat v41;
  double v42;
  CGFloat v43;
  id v44;
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
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;

  v3 = -[AXGestureRecorderControlsView effectiveUserInterfaceLayoutDirection](self, "effectiveUserInterfaceLayoutDirection");
  if (v3 == 1)
    v4 = &OBJC_IVAR___AXGestureRecorderControlsView__rightButton;
  else
    v4 = &OBJC_IVAR___AXGestureRecorderControlsView__leftButton;
  v5 = *(Class *)((char *)&self->super.super.super.isa + *v4);
  if (v3 == 1)
    v6 = &OBJC_IVAR___AXGestureRecorderControlsView__leftButton;
  else
    v6 = &OBJC_IVAR___AXGestureRecorderControlsView__rightButton;
  v44 = v5;
  v7 = *(id *)((char *)&self->super.super.super.isa + *v6);
  objc_msgSend(v44, "setFrame:", 30.0, 45.0, 125.0, 45.0);
  objc_msgSend(v44, "sizeToFit");
  -[UIButton frame](self->_leftButton, "frame");
  v40 = v8;
  v41 = v9;
  v11 = v10;
  objc_msgSend(v44, "setFrame:");
  objc_msgSend(v7, "setFrame:", 0.0, 45.0, 125.0, 45.0);
  objc_msgSend(v7, "sizeToFit");
  objc_msgSend(v7, "frame");
  v13 = v12;
  v43 = v14;
  v16 = v15;
  -[AXGestureRecorderControlsView frame](self, "frame");
  v42 = v13 + v17 - (v16 + 30.0);
  objc_msgSend(v7, "setFrame:");
  -[UIButton sizeToFit](self->_middleButton, "sizeToFit");
  -[UIButton frame](self->_middleButton, "frame");
  -[UIButton setFrame:](self->_middleButton, "setFrame:", 0.0, 45.0);
  -[UIButton frame](self->_middleButton, "frame");
  v19 = v18;
  v21 = v20;
  v23 = v22;
  -[AXGestureRecorderControlsView bounds](self, "bounds");
  Width = CGRectGetWidth(v45);
  v46.origin.x = v19;
  v46.origin.y = v21;
  v46.size.width = v23;
  v46.size.height = 45.0;
  v25 = (Width - CGRectGetWidth(v46)) * 0.5;
  -[AXGestureRecorderControlsView bounds](self, "bounds");
  v26 = CGRectGetWidth(v47);
  v48.origin.x = v40;
  v48.origin.y = v41;
  v38 = v11;
  v48.size.width = v11;
  v48.size.height = 45.0;
  v27 = CGRectGetWidth(v48);
  v49.origin.x = v42;
  v49.origin.y = v43;
  rect = v16;
  v49.size.width = v16;
  v28 = v23;
  v49.size.height = 45.0;
  v29 = v27 + CGRectGetWidth(v49);
  v50.origin.x = v25;
  v50.origin.y = v21;
  v50.size.width = v23;
  v50.size.height = 45.0;
  if (v26 >= v29 + CGRectGetWidth(v50))
  {
    v54.origin.x = v25;
    v54.origin.y = v21;
    v54.size.width = v23;
    v54.size.height = 45.0;
    MaxX = CGRectGetMaxX(v54);
    v55.origin.x = v42;
    v55.origin.y = v43;
    v55.size.width = rect;
    v55.size.height = 45.0;
    if (MaxX <= CGRectGetMinX(v55))
    {
      v58.origin.x = v40;
      v58.origin.y = v41;
      v58.size.width = v38;
      v58.size.height = 45.0;
      v34 = CGRectGetMaxX(v58);
      v30 = v25;
      v59.origin.x = v25;
      v59.origin.y = v21;
      v59.size.width = v28;
      v59.size.height = 45.0;
      if (v34 > CGRectGetMinX(v59))
      {
        v60.origin.x = v40;
        v60.origin.y = v41;
        v60.size.width = v38;
        v60.size.height = 45.0;
        v30 = CGRectGetMaxX(v60);
      }
    }
    else
    {
      v56.origin.x = v42;
      v56.origin.y = v43;
      v56.size.width = rect;
      v56.size.height = 45.0;
      MinX = CGRectGetMinX(v56);
      v57.origin.x = v25;
      v57.origin.y = v21;
      v57.size.width = v28;
      v57.size.height = 45.0;
      v30 = MinX - CGRectGetWidth(v57);
    }
  }
  else
  {
    v51.origin.x = v40;
    v51.origin.y = v41;
    v51.size.width = v38;
    v51.size.height = 45.0;
    v30 = CGRectGetMaxX(v51);
    v52.origin.x = v42;
    v52.origin.y = v43;
    v52.size.width = rect;
    v52.size.height = 45.0;
    v31 = CGRectGetMinX(v52);
    v53.origin.x = v40;
    v53.origin.y = v41;
    v53.size.width = v38;
    v53.size.height = 45.0;
    v28 = v31 - CGRectGetMaxX(v53);
  }
  -[UIButton setFrame:](self->_middleButton, "setFrame:", v30, v21, v28, 45.0, *(_QWORD *)&v38);
  -[ASTBiggerProgressView frame](self->_progressView, "frame");
  v36 = v35;
  -[AXGestureRecorderControlsView frame](self, "frame");
  -[ASTBiggerProgressView setFrame:](self->_progressView, "setFrame:", 22.0, v36, v37 + -44.0, 14.0);
  -[ASTBiggerProgressView frame](self->_progressView, "frame");
  -[ASTBiggerProgressView setFrame:](self->_progressView, "setFrame:");

}

- (id)makeButton
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(MEMORY[0x1E0DC37E8], "fontWithName:size:", CFSTR("HelveticaNeue Thin"), 18.0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (_AXSEnhanceTextLegibilityEnabled())
  {
    objc_msgSend(MEMORY[0x1E0DC37E8], "systemFontOfSize:", 18.0);
    v3 = objc_claimAutoreleasedReturnValue();

    v2 = (void *)v3;
  }
  objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithType:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "titleLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setFont:", v2);

  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBackgroundColor:", v6);

  objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v7, 2);

  objc_msgSend(MEMORY[0x1E0DC3658], "systemBlueColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTitleColor:forState:", v8, 0);

  return v4;
}

- (void)setLeftButtonColor:(int)a3 title:(id)a4 enabled:(BOOL)a5 rightButtonColor:(int)a6 title:(id)a7 enabled:(BOOL)a8 animationDuration:(double)a9 completion:(id)a10
{
  uint64_t v10;
  uint64_t v12;
  id v14;
  id v15;
  void (**v16)(id, uint64_t);
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  unsigned int v26;
  unsigned int v27;
  id v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _QWORD v33[2];
  _BYTE v34[128];
  uint64_t v35;

  v10 = a8;
  v12 = a5;
  v35 = *MEMORY[0x1E0C80C00];
  v14 = a4;
  v15 = a7;
  v16 = (void (**)(id, uint64_t))a10;
  -[AXGestureRecorderControlsView leftButton](self, "leftButton");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[AXGestureRecorderControlsView rightButton](self, "rightButton");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v17)
  {
    v26 = v12;
    v27 = v10;
    v28 = v15;
    -[AXGestureRecorderControlsView makeButton](self, "makeButton");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[AXGestureRecorderControlsView makeButton](self, "makeButton");
    v19 = objc_claimAutoreleasedReturnValue();

    -[AXGestureRecorderControlsView setRightButton:](self, "setRightButton:", v19);
    -[AXGestureRecorderControlsView setLeftButton:](self, "setLeftButton:", v17);
    v31 = 0u;
    v32 = 0u;
    v29 = 0u;
    v30 = 0u;
    v33[0] = v17;
    v33[1] = v19;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v33, 2);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
    if (v21)
    {
      v22 = v21;
      v23 = *(_QWORD *)v30;
      do
      {
        for (i = 0; i != v22; ++i)
        {
          if (*(_QWORD *)v30 != v23)
            objc_enumerationMutation(v20);
          v25 = *(void **)(*((_QWORD *)&v29 + 1) + 8 * i);
          objc_msgSend(v25, "addTarget:action:forControlEvents:", self, sel__buttonTapped_, 64);
          -[AXGestureRecorderControlsView addSubview:](self, "addSubview:", v25);
        }
        v22 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v29, v34, 16);
      }
      while (v22);
    }

    v18 = (void *)v19;
    v15 = v28;
    v12 = v26;
    v10 = v27;
  }
  objc_msgSend(v17, "setTitle:forState:", v14, 0);
  objc_msgSend(v18, "setTitle:forState:", v15, 0);
  objc_msgSend(v17, "setEnabled:", v12);
  objc_msgSend(v18, "setEnabled:", v10);
  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
  if (v16)
    v16[2](v16, 1);
  -[AXGestureRecorderControlsView layoutSubviews](self, "layoutSubviews");

}

- (BOOL)isLeftButtonEnabled
{
  void *v2;
  char v3;

  -[AXGestureRecorderControlsView leftButton](self, "leftButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setLeftButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  -[AXGestureRecorderControlsView leftButton](self, "leftButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (BOOL)isRightButtonEnabled
{
  void *v2;
  char v3;

  -[AXGestureRecorderControlsView rightButton](self, "rightButton");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isEnabled");

  return v3;
}

- (void)setRightButtonEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v4;

  v3 = a3;
  -[AXGestureRecorderControlsView rightButton](self, "rightButton");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setEnabled:", v3);

  UIAccessibilityPostNotification(*MEMORY[0x1E0DC4578], 0);
}

- (void)setMiddleButton:(id)a3
{
  UIButton *v5;
  UIButton *middleButton;
  UIButton *v7;

  v5 = (UIButton *)a3;
  middleButton = self->_middleButton;
  if (middleButton != v5)
  {
    v7 = v5;
    -[UIButton removeFromSuperview](middleButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_middleButton, a3);
    v5 = v7;
    if (v7)
    {
      -[AXGestureRecorderControlsView addSubview:](self, "addSubview:", v7);
      v5 = v7;
    }
  }

}

- (void)_buttonTapped:(id)a3
{
  id v4;
  id v5;
  uint64_t v6;
  void *v7;
  id v8;

  v8 = a3;
  -[AXGestureRecorderControlsView leftButton](self, "leftButton");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v8)
  {
    v6 = 0;
  }
  else
  {
    -[AXGestureRecorderControlsView rightButton](self, "rightButton");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    if (v5 == v8)
      v6 = 1;
    else
      v6 = 0x7FFFFFFFFFFFFFFFLL;
  }
  -[AXGestureRecorderControlsView delegate](self, "delegate");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "gestureRecorderControlsView:buttonTappedAtIndex:", self, v6);

}

- (AXGestureRecorderControlsViewDelegate)delegate
{
  return (AXGestureRecorderControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftButton, a3);
}

- (UIButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (UIButton)middleButton
{
  return self->_middleButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_middleButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end

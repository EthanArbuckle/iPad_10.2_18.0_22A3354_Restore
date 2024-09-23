@implementation SUUIOnboardingFooterView

- (void)hideLeftButtonWithAnimation:(int64_t)a3
{
  -[SUUIOnboardingFooterView _hideButton:withAnimation:](self, "_hideButton:withAnimation:", self->_leftButton, a3);
}

- (void)hideRightButtonWithAnimation:(int64_t)a3
{
  -[SUUIOnboardingFooterView _hideButton:withAnimation:](self, "_hideButton:withAnimation:", self->_rightButton, a3);
}

- (UIButton)leftButton
{
  UIButton *leftButton;
  UIButton *v4;
  UIButton *v5;

  leftButton = self->_leftButton;
  if (!leftButton)
  {
    v4 = -[SUUIOnboardingFooterView _newButton](self, "_newButton");
    v5 = self->_leftButton;
    self->_leftButton = v4;

    -[SUUIOnboardingFooterView addSubview:](self, "addSubview:", self->_leftButton);
    leftButton = self->_leftButton;
  }
  return leftButton;
}

- (UIButton)rightButton
{
  UIButton *rightButton;
  UIButton *v4;
  UIButton *v5;

  rightButton = self->_rightButton;
  if (!rightButton)
  {
    v4 = -[SUUIOnboardingFooterView _newButton](self, "_newButton");
    v5 = self->_rightButton;
    self->_rightButton = v4;

    -[SUUIOnboardingFooterView addSubview:](self, "addSubview:", self->_rightButton);
    rightButton = self->_rightButton;
  }
  return rightButton;
}

- (void)setProgressView:(id)a3
{
  SUUIOnboardingProgressView *v5;
  SUUIOnboardingProgressView *progressView;
  SUUIOnboardingProgressView *v7;

  v5 = (SUUIOnboardingProgressView *)a3;
  progressView = self->_progressView;
  if (progressView != v5)
  {
    v7 = v5;
    -[SUUIOnboardingProgressView removeFromSuperview](progressView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_progressView, a3);
    if (self->_progressView)
      -[SUUIOnboardingFooterView addSubview:](self, "addSubview:");
    -[SUUIOnboardingFooterView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)showLeftButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[SUUIOnboardingFooterView leftButton](self, "leftButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIOnboardingFooterView _showButton:withTitle:animation:](self, "_showButton:withTitle:animation:", v7, v6, a4);

}

- (void)showRightButtonWithTitle:(id)a3 animation:(int64_t)a4
{
  id v6;
  id v7;

  v6 = a3;
  -[SUUIOnboardingFooterView rightButton](self, "rightButton");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  -[SUUIOnboardingFooterView _showButton:withTitle:animation:](self, "_showButton:withTitle:animation:", v7, v6, a4);

}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  SUUIOnboardingProgressView *progressView;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double MaxX;
  double v15;
  UIButton *leftButton;
  double v17;
  float v18;
  double v19;
  float v20;
  UIButton *rightButton;
  double v22;
  float v23;
  double v24;
  float v25;
  CGRect v26;

  -[SUUIOnboardingFooterView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  progressView = self->_progressView;
  if (progressView)
  {
    -[SUUIOnboardingProgressView frame](progressView, "frame");
    -[SUUIOnboardingProgressView sizeThatFits:](self->_progressView, "sizeThatFits:", *(double *)(MEMORY[0x24BDBF028] + 16), *(double *)(MEMORY[0x24BDBF028] + 24));
    v9 = v8;
    v11 = v10;
    *(float *)&v8 = (v4 - v8) * 0.5;
    v12 = floorf(*(float *)&v8);
    *(float *)&v8 = (v6 - v10) * 0.5;
    v13 = floorf(*(float *)&v8);
    -[SUUIOnboardingProgressView setFrame:](self->_progressView, "setFrame:", v12, v13, v9, v10);
    v26.origin.x = v12;
    v26.origin.y = v13;
    v26.size.width = v9;
    v26.size.height = v11;
    MaxX = CGRectGetMaxX(v26);
    v15 = v4 - MaxX;
  }
  else
  {
    v12 = v3 * 0.5;
    MaxX = v3 * 0.5;
    v15 = v3 * 0.5;
  }
  leftButton = self->_leftButton;
  if (leftButton && (-[UIButton isHidden](leftButton, "isHidden") & 1) == 0)
  {
    -[UIButton frame](self->_leftButton, "frame");
    v18 = (v12 - v17) * 0.5;
    v20 = (v6 - v19) * 0.5;
    -[UIButton setFrame:](self->_leftButton, "setFrame:", floorf(v18), floorf(v20));
  }
  rightButton = self->_rightButton;
  if (rightButton)
  {
    if ((-[UIButton isHidden](rightButton, "isHidden") & 1) == 0)
    {
      -[UIButton frame](self->_rightButton, "frame");
      v23 = MaxX + (v15 - v22) * 0.5;
      v25 = (v6 - v24) * 0.5;
      -[UIButton setFrame:](self->_rightButton, "setFrame:", floorf(v23), floorf(v25));
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v4;
  double v5;
  SUUIOnboardingProgressView *v6;
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t i;
  double v13;
  double v14;
  UIButton *v15;
  UIButton *v16;
  SUUIOnboardingProgressView *v17;
  uint64_t v18;
  CGSize result;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = *MEMORY[0x24BDBF148];
  v5 = *(double *)(MEMORY[0x24BDBF148] + 8);
  v15 = self->_leftButton;
  v16 = self->_rightButton;
  v6 = self->_progressView;
  v7 = 0;
  v17 = v6;
  v8 = *(double *)(MEMORY[0x24BDBF028] + 16);
  v9 = *(double *)(MEMORY[0x24BDBF028] + 24);
  do
  {
    -[UIButton sizeThatFits:](*(UIButton **)((char *)&v15 + v7), "sizeThatFits:", v8, v9, v15, v16, v17, v18);
    if (v5 < v11)
      v5 = v11;
    v4 = v4 + v10;
    v7 += 8;
  }
  while (v7 != 24);
  for (i = 16; i != -8; i -= 8)

  v13 = v4;
  v14 = v5;
  result.height = v14;
  result.width = v13;
  return result;
}

- (void)_hideButton:(id)a3 withAnimation:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];
  id v15;
  _QWORD v16[4];
  id v17;
  _QWORD v18[4];
  id v19;

  v6 = a3;
  v7 = v6;
  if (v6 && (objc_msgSend(v6, "isHidden") & 1) == 0)
  {
    v8 = (void *)MEMORY[0x24BEBDB00];
    v9 = MEMORY[0x24BDAC760];
    v18[0] = MEMORY[0x24BDAC760];
    v18[1] = 3221225472;
    v18[2] = __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke;
    v18[3] = &unk_2511F47C0;
    v10 = v7;
    v19 = v10;
    objc_msgSend(v8, "_performWithoutAnimation:", v18);
    if (a4 == 2)
    {
      v13 = (void *)MEMORY[0x24BEBDB00];
      v14[0] = v9;
      v14[1] = 3221225472;
      v14[2] = __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3;
      v14[3] = &unk_2511F46D0;
      v14[4] = self;
      v15 = v10;
      objc_msgSend(v13, "animateWithDuration:animations:", v14, 0.5);
      v12 = v15;
    }
    else
    {
      if (a4 == 1)
      {
        objc_msgSend(v10, "setHidden:", 1);
        goto LABEL_10;
      }
      if (a4)
      {
LABEL_10:

        goto LABEL_11;
      }
      v11 = (void *)MEMORY[0x24BEBDB00];
      v16[0] = v9;
      v16[1] = 3221225472;
      v16[2] = __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2;
      v16[3] = &unk_2511F47C0;
      v17 = v10;
      objc_msgSend(v11, "animateWithDuration:animations:", v16, 0.25);
      v12 = v17;
    }

    goto LABEL_10;
  }
LABEL_11:

}

uint64_t __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke(uint64_t a1)
{
  double v2;
  double v3;

  objc_msgSend(*(id *)(a1 + 32), "alpha");
  v3 = v2;
  objc_msgSend(*(id *)(a1 + 32), "setHighlighted:", 0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v3);
}

uint64_t __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __54__SUUIOnboardingFooterView__hideButton_withAnimation___block_invoke_3(uint64_t a1)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  void *v12;

  if (*(_QWORD *)(*(_QWORD *)(a1 + 32) + 424))
  {
    objc_msgSend(*(id *)(a1 + 40), "frame");
    v3 = v2;
    v5 = v4;
    v7 = v6;
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 424), "frame");
    v12 = *(void **)(a1 + 40);
    if (v12 == *(void **)(*(_QWORD *)(a1 + 32) + 416))
    {
      v8 = CGRectGetMaxX(*(CGRect *)&v8) - v5;
      v12 = *(void **)(a1 + 40);
    }
    objc_msgSend(v12, "setFrame:", v8, v3, v5, v7);
  }
  return objc_msgSend(*(id *)(a1 + 40), "setAlpha:", 0.0);
}

- (id)_newButton
{
  void *v2;

  objc_msgSend(MEMORY[0x24BEBD430], "buttonWithType:", 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setHidden:", 1);
  return v2;
}

- (void)_showButton:(id)a3 withTitle:(id)a4 animation:(int64_t)a5
{
  UIButton *v8;
  id v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v21;
  float v22;
  double v23;
  void *v24;
  UIButton *v25;
  void *v26;
  _QWORD v27[4];
  UIButton *v28;
  SUUIOnboardingFooterView *v29;
  _QWORD v30[4];
  UIButton *v31;

  v8 = (UIButton *)a3;
  v9 = a4;
  -[UIButton setEnabled:](v8, "setEnabled:", 1);
  -[UIButton setTitle:forState:](v8, "setTitle:forState:", v9, 0);

  -[UIButton sizeToFit](v8, "sizeToFit");
  if ((-[UIButton isHidden](v8, "isHidden") & 1) == 0)
  {
    -[UIButton alpha](v8, "alpha");
    if (v10 > 0.00000011920929)
      goto LABEL_13;
  }
  -[UIButton setHidden:](v8, "setHidden:", 0);
  switch(a5)
  {
    case 0:
      goto LABEL_10;
    case 1:
      -[UIButton setAlpha:](v8, "setAlpha:", 1.0);
LABEL_13:
      -[SUUIOnboardingFooterView setNeedsLayout](self, "setNeedsLayout");
      break;
    case 2:
      if (self->_progressView)
      {
        -[SUUIOnboardingFooterView bounds](self, "bounds");
        v12 = v11;
        -[UIButton frame](v8, "frame");
        v14 = v13;
        v16 = v15;
        -[SUUIOnboardingProgressView frame](self->_progressView, "frame");
        v21 = v17;
        if (self->_leftButton == v8)
          v21 = CGRectGetMaxX(*(CGRect *)&v17) - v14;
        v22 = (v12 - v16) * 0.5;
        v23 = floorf(v22);
        -[UIButton setAlpha:](v8, "setAlpha:", 0.0);
        -[UIButton setFrame:](v8, "setFrame:", v21, v23, v14, v16);
        -[SUUIOnboardingFooterView sendSubviewToBack:](self, "sendSubviewToBack:", v8);
        v24 = (void *)MEMORY[0x24BEBDB00];
        v27[0] = MEMORY[0x24BDAC760];
        v27[1] = 3221225472;
        v27[2] = __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2;
        v27[3] = &unk_2511F46D0;
        v28 = v8;
        v29 = self;
        objc_msgSend(v24, "animateWithDuration:animations:", v27, 0.5);
        v25 = v28;
        goto LABEL_11;
      }
LABEL_10:
      -[UIButton setAlpha:](v8, "setAlpha:", 0.0);
      -[SUUIOnboardingFooterView layoutSubviews](self, "layoutSubviews");
      v26 = (void *)MEMORY[0x24BEBDB00];
      v30[0] = MEMORY[0x24BDAC760];
      v30[1] = 3221225472;
      v30[2] = __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke;
      v30[3] = &unk_2511F47C0;
      v31 = v8;
      objc_msgSend(v26, "animateWithDuration:animations:", v30, 0.25);
      v25 = v31;
LABEL_11:

      break;
  }

}

uint64_t __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
}

uint64_t __60__SUUIOnboardingFooterView__showButton_withTitle_animation___block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 1.0);
  return objc_msgSend(*(id *)(a1 + 40), "layoutSubviews");
}

- (SUUIOnboardingProgressView)progressView
{
  return self->_progressView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_progressView, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
}

@end

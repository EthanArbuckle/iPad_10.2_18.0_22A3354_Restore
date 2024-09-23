@implementation CSProminentButtonsView

- (CSProminentButtonsView)initWithLeadingButton:(id)a3 trailingButton:(id)a4
{
  id v6;
  id v7;
  CSProminentButtonsView *v8;
  CSProminentButtonsView *v9;
  objc_super v11;

  v6 = a3;
  v7 = a4;
  v11.receiver = self;
  v11.super_class = (Class)CSProminentButtonsView;
  v8 = -[CSProminentButtonsView init](&v11, sel_init);
  v9 = v8;
  if (v8)
  {
    -[CSProminentButtonsView setLeadingButton:](v8, "setLeadingButton:", v6);
    -[CSProminentButtonsView setTrailingButton:](v9, "setTrailingButton:", v7);
  }

  return v9;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CSProminentButtonsView *v5;
  CSProminentButtonsView *v6;
  CSProminentButtonsView *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)CSProminentButtonsView;
  -[CSProminentButtonsView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (CSProminentButtonsView *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 == self)
    v7 = 0;
  else
    v7 = v5;

  return v7;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CSProminentButtonsView;
  -[CSProminentButtonsView layoutSubviews](&v3, sel_layoutSubviews);
  -[CSProminentButtonsView _layoutButtons](self, "_layoutButtons");
}

- (void)setLeadingButton:(id)a3
{
  CSProminentButtonControl *v5;
  CSProminentButtonControl *leadingButton;
  CSProminentButtonControl *v7;

  v5 = (CSProminentButtonControl *)a3;
  leadingButton = self->_leadingButton;
  v7 = v5;
  if (leadingButton != v5)
  {
    -[CSProminentButtonControl removeFromSuperview](leadingButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leadingButton, a3);
    if (self->_leadingButton)
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
  }

}

- (void)setTrailingButton:(id)a3
{
  CSProminentButtonControl *v5;
  CSProminentButtonControl *trailingButton;
  CSProminentButtonControl *v7;

  v5 = (CSProminentButtonControl *)a3;
  trailingButton = self->_trailingButton;
  v7 = v5;
  if (trailingButton != v5)
  {
    -[CSProminentButtonControl removeFromSuperview](trailingButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingButton, a3);
    if (self->_trailingButton)
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
  }

}

- (void)setLeadingReticle:(id)a3
{
  CSProminentButtonReticlePresenter *v5;

  v5 = (CSProminentButtonReticlePresenter *)a3;
  if (self->_trailingReticle != v5)
  {
    -[CSProminentButtonReticlePresenter removeFromSuperview](self->_leadingReticle, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leadingReticle, a3);
    if (self->_leadingReticle)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      -[CSProminentButtonsView sendSubviewToBack:](self, "sendSubviewToBack:", self->_leadingReticle);
      -[CSProminentButtonsView setNeedsLayout](self, "setNeedsLayout");
      -[CSProminentButtonsView _addContraintsForRemoveButtonsIfNecessary](self, "_addContraintsForRemoveButtonsIfNecessary");
    }
  }

}

- (void)setTrailingReticle:(id)a3
{
  CSProminentButtonReticlePresenter *v5;
  CSProminentButtonReticlePresenter **p_trailingReticle;
  CSProminentButtonReticlePresenter *trailingReticle;
  CSProminentButtonReticlePresenter *v8;

  v5 = (CSProminentButtonReticlePresenter *)a3;
  p_trailingReticle = &self->_trailingReticle;
  trailingReticle = self->_trailingReticle;
  v8 = v5;
  if (trailingReticle != v5)
  {
    -[CSProminentButtonReticlePresenter removeFromSuperview](trailingReticle, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingReticle, a3);
    if (*p_trailingReticle)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      -[CSProminentButtonsView sendSubviewToBack:](self, "sendSubviewToBack:", *p_trailingReticle);
      -[CSProminentButtonsView setNeedsLayout](self, "setNeedsLayout");
      -[CSProminentButtonsView _addContraintsForRemoveButtonsIfNecessary](self, "_addContraintsForRemoveButtonsIfNecessary");
    }
  }

}

- (void)setLeadingRemoveButton:(id)a3
{
  UIButton *v5;
  UIButton **p_leadingRemoveButton;
  UIButton *leadingRemoveButton;
  UIButton *v8;

  v5 = (UIButton *)a3;
  p_leadingRemoveButton = &self->_leadingRemoveButton;
  leadingRemoveButton = self->_leadingRemoveButton;
  v8 = v5;
  if (leadingRemoveButton != v5)
  {
    -[UIButton removeFromSuperview](leadingRemoveButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_leadingRemoveButton, a3);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](*p_leadingRemoveButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_leadingRemoveButton)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      -[CSProminentButtonsView _addContraintsForRemoveButtonsIfNecessary](self, "_addContraintsForRemoveButtonsIfNecessary");
    }
  }

}

- (void)setTrailingRemoveButton:(id)a3
{
  UIButton *v5;
  UIButton **p_trailingRemoveButton;
  UIButton *trailingRemoveButton;
  UIButton *v8;

  v5 = (UIButton *)a3;
  p_trailingRemoveButton = &self->_trailingRemoveButton;
  trailingRemoveButton = self->_trailingRemoveButton;
  v8 = v5;
  if (trailingRemoveButton != v5)
  {
    -[UIButton removeFromSuperview](trailingRemoveButton, "removeFromSuperview");
    objc_storeStrong((id *)&self->_trailingRemoveButton, a3);
    -[UIButton setTranslatesAutoresizingMaskIntoConstraints:](*p_trailingRemoveButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    if (*p_trailingRemoveButton)
    {
      -[CSProminentButtonsView addSubview:](self, "addSubview:");
      -[CSProminentButtonsView _addContraintsForRemoveButtonsIfNecessary](self, "_addContraintsForRemoveButtonsIfNecessary");
    }
  }

}

- (void)_layoutButtons
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
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CSProminentButtonControl *leadingButton;
  id *v28;
  uint64_t v29;
  double v30;
  double v31;
  double v32;
  double v33;
  CSProminentButtonControl *trailingButton;
  uint64_t v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  CGFloat v41;
  CSProminentButtonReticlePresenter *leadingReticle;
  uint64_t v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CSProminentButtonReticlePresenter *trailingReticle;
  uint64_t v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGRect v55;
  CGRect v56;

  objc_msgSend((id)objc_opt_class(), "_buttonOutsets");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CSProminentButtonControl setEdgeInsets:](self->_leadingButton, "setEdgeInsets:");
  -[CSProminentButtonControl setEdgeInsets:](self->_trailingButton, "setEdgeInsets:", v4, v6, v8, v10);
  -[CSProminentButtonsView _leadingFrameWithOutsets:](self, "_leadingFrameWithOutsets:", 1);
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  -[CSProminentButtonsView _trailingFrameWithOutsets:](self, "_trailingFrameWithOutsets:", 1);
  v20 = v19;
  v22 = v21;
  v24 = v23;
  v26 = v25;
  leadingButton = self->_leadingButton;
  v28 = (id *)MEMORY[0x1E0DC4730];
  v29 = objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection");
  if (v29 == 1)
    v30 = v26;
  else
    v30 = v18;
  if (v29 == 1)
    v31 = v24;
  else
    v31 = v16;
  if (v29 == 1)
    v32 = v22;
  else
    v32 = v14;
  if (v29 == 1)
    v33 = v20;
  else
    v33 = v12;
  -[CSProminentButtonControl setFrame:](leadingButton, "setFrame:", v33, v32, v31, v30);
  trailingButton = self->_trailingButton;
  v35 = objc_msgSend(*v28, "userInterfaceLayoutDirection");
  if (v35 == 1)
    v36 = v18;
  else
    v36 = v26;
  if (v35 == 1)
    v37 = v16;
  else
    v37 = v24;
  if (v35 == 1)
    v38 = v14;
  else
    v38 = v22;
  v54 = v12;
  if (v35 == 1)
    v39 = v12;
  else
    v39 = v20;
  -[CSProminentButtonControl setFrame:](trailingButton, "setFrame:", v39, v38, v37, v36);
  objc_msgSend((id)objc_opt_class(), "_reticleOutset");
  v41 = v40;
  leadingReticle = self->_leadingReticle;
  if (leadingReticle)
  {
    v43 = objc_msgSend(*v28, "userInterfaceLayoutDirection");
    if (v43 == 1)
      v44 = v26;
    else
      v44 = v18;
    if (v43 == 1)
      v45 = v24;
    else
      v45 = v16;
    if (v43 == 1)
      v46 = v22;
    else
      v46 = v14;
    v47 = v54;
    if (v43 == 1)
      v47 = v20;
    v55 = CGRectInset(*(CGRect *)(&v44 - 3), v41, v41);
    -[CSProminentButtonReticlePresenter setFrame:](leadingReticle, "setFrame:", v55.origin.x, v55.origin.y, v55.size.width, v55.size.height);
  }
  trailingReticle = self->_trailingReticle;
  if (trailingReticle)
  {
    v49 = objc_msgSend(*v28, "userInterfaceLayoutDirection");
    if (v49 == 1)
      v50 = v18;
    else
      v50 = v26;
    if (v49 == 1)
      v51 = v16;
    else
      v51 = v24;
    if (v49 == 1)
      v52 = v14;
    else
      v52 = v22;
    v53 = v54;
    if (v49 != 1)
      v53 = v20;
    v56 = CGRectInset(*(CGRect *)(&v50 - 3), v41, v41);
    -[CSProminentButtonReticlePresenter setFrame:](trailingReticle, "setFrame:", v56.origin.x, v56.origin.y, v56.size.width, v56.size.height);
  }
}

- (CGRect)_leadingFrameWithOutsets:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect result;

  v3 = a3;
  v5 = 0.0;
  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "_leadingOutset");
    v5 = v6;
  }
  objc_msgSend((id)objc_opt_class(), "_buttonInsetX");
  -[CSProminentButtonsView _frameWithMinX:outset:](self, "_frameWithMinX:outset:", v3, v7 - v5);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (CGRect)_trailingFrameWithOutsets:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  double v6;
  double Width;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect v15;
  CGRect result;

  v3 = a3;
  v5 = 0.0;
  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "_leadingOutset");
    v5 = v6;
  }
  -[CSProminentButtonsView bounds](self, "bounds");
  Width = CGRectGetWidth(v15);
  objc_msgSend((id)objc_opt_class(), "_buttonInsetX");
  v9 = Width - v8;
  objc_msgSend((id)objc_opt_class(), "_buttonDiameter");
  -[CSProminentButtonsView _frameWithMinX:outset:](self, "_frameWithMinX:outset:", v3, v9 - (v5 + v10));
  result.size.height = v14;
  result.size.width = v13;
  result.origin.y = v12;
  result.origin.x = v11;
  return result;
}

- (CGRect)_frameWithMinX:(double)a3 outset:(BOOL)a4
{
  _BOOL8 v4;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  CGRect result;

  v4 = a4;
  -[CSProminentButtonsView _buttonMinYWithOutset:](self, "_buttonMinYWithOutset:");
  v8 = v7;
  -[CSProminentButtonsView _buttonSizeWithOutsets:](self, "_buttonSizeWithOutsets:", v4);
  v10 = v9;
  v12 = v11;
  v13 = a3;
  v14 = v8;
  result.size.height = v12;
  result.size.width = v10;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (double)_buttonMinYWithOutset:(BOOL)a3
{
  double v4;
  double v5;
  double Height;
  double v7;
  double v8;
  double v9;
  CGRect v11;

  v4 = 0.0;
  if (a3)
  {
    objc_msgSend((id)objc_opt_class(), "_buttonOutsets");
    v4 = v5;
  }
  -[CSProminentButtonsView bounds](self, "bounds");
  Height = CGRectGetHeight(v11);
  objc_msgSend((id)objc_opt_class(), "_buttonInsetY");
  v8 = Height - v7;
  objc_msgSend((id)objc_opt_class(), "_buttonDiameter");
  return v8 - (v4 + v9);
}

- (CGSize)_buttonSizeWithOutsets:(BOOL)a3
{
  _BOOL4 v3;
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
  CGSize result;

  v3 = a3;
  objc_msgSend((id)objc_opt_class(), "_buttonDiameter");
  v5 = v4;
  objc_msgSend((id)objc_opt_class(), "_buttonOutsets");
  v10 = v8 + v9;
  if (!v3)
    v10 = 0.0;
  v11 = v5 + v10;
  v12 = v6 + v7;
  if (!v3)
    v12 = 0.0;
  v13 = v5 + v12;
  v14 = v11;
  result.height = v13;
  result.width = v14;
  return result;
}

- (void)_addContraintsForRemoveButtonsIfNecessary
{
  if (self->_leadingRemoveButton && self->_leadingReticle)
    -[CSProminentButtonsView _setConstraintsForRemoveButton:withReticle:](self, "_setConstraintsForRemoveButton:withReticle:");
  if (self->_trailingRemoveButton)
  {
    if (self->_trailingReticle)
      -[CSProminentButtonsView _setConstraintsForRemoveButton:withReticle:](self, "_setConstraintsForRemoveButton:withReticle:");
  }
}

- (void)_setConstraintsForRemoveButton:(id)a3 withReticle:(id)a4
{
  void *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  v5 = (void *)MEMORY[0x1E0CB3718];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "topAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, -3.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v15[0] = v10;
  objc_msgSend(v7, "leadingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "leadingAnchor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "constraintEqualToAnchor:constant:", v12, -3.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v15[1] = v13;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v15, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "activateConstraints:", v14);

}

+ (UIEdgeInsets)_buttonOutsets
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 18.0;
  v3 = 18.0;
  v4 = 18.0;
  v5 = 18.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

+ (double)_buttonDiameter
{
  unint64_t v2;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  if (v2 - 6 > 0x17)
    return 50.0;
  else
    return dbl_1A9D46918[v2 - 6];
}

+ (double)_buttonInsetX
{
  unint64_t v2;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  if (v2 > 0x1D)
    return 46.0;
  else
    return dbl_1A9D469D8[v2];
}

+ (double)_buttonInsetY
{
  unint64_t v2;

  v2 = +[CSDeviceDetermination effectiveCategory](CSDeviceDetermination, "effectiveCategory");
  if (v2 > 0x1D)
    return 50.0;
  else
    return dbl_1A9D46AC8[v2];
}

+ (double)_leadingOutset
{
  double v2;
  double v3;
  double v4;
  double v5;

  objc_msgSend((id)objc_opt_class(), "_buttonOutsets");
  v3 = v2;
  v5 = v4;
  if (objc_msgSend((id)*MEMORY[0x1E0DC4730], "userInterfaceLayoutDirection") == 1)
    return v5;
  else
    return v3;
}

+ (double)_reticleOutset
{
  return 12.0;
}

- (CSProminentButtonControl)leadingButton
{
  return self->_leadingButton;
}

- (CSProminentButtonControl)trailingButton
{
  return self->_trailingButton;
}

- (CSProminentButtonReticlePresenter)leadingReticle
{
  return self->_leadingReticle;
}

- (CSProminentButtonReticlePresenter)trailingReticle
{
  return self->_trailingReticle;
}

- (UIButton)leadingRemoveButton
{
  return self->_leadingRemoveButton;
}

- (UIButton)trailingRemoveButton
{
  return self->_trailingRemoveButton;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_trailingRemoveButton, 0);
  objc_storeStrong((id *)&self->_leadingRemoveButton, 0);
  objc_storeStrong((id *)&self->_trailingReticle, 0);
  objc_storeStrong((id *)&self->_leadingReticle, 0);
  objc_storeStrong((id *)&self->_trailingButton, 0);
  objc_storeStrong((id *)&self->_leadingButton, 0);
}

@end

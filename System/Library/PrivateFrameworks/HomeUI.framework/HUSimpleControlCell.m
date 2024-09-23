@implementation HUSimpleControlCell

- (id)allControlViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUSimpleControlCell controlView](self, "controlView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setControlView:(id)a3
{
  HUControlView *v5;
  HUControlView **p_controlView;
  HUControlView *controlView;
  void *v8;
  HUControlView *v9;

  v5 = (HUControlView *)a3;
  p_controlView = &self->_controlView;
  controlView = self->_controlView;
  if (controlView != v5)
  {
    v9 = v5;
    -[HUControlView removeFromSuperview](controlView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_controlView, a3);
    -[HUControlView setTranslatesAutoresizingMaskIntoConstraints:](*p_controlView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUSimpleControlCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_controlView);

    -[HUSimpleControlCell _updateSliderConstraints](self, "_updateSliderConstraints");
    v5 = v9;
  }

}

- (void)_updateSliderConstraints
{
  void *v3;
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
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;

  -[HUSimpleControlCell controlViewConstraints](self, "controlViewConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E0CB3718];
    -[HUSimpleControlCell controlViewConstraints](self, "controlViewConstraints");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "deactivateConstraints:", v5);

  }
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  -[HUSimpleControlCell controlView](self, "controlView");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    -[HUSimpleControlCell contentView](self, "contentView");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "layoutMarginsGuide");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HUSimpleControlCell controlView](self, "controlView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "widthAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "widthAnchor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v12);

    -[HUSimpleControlCell controlView](self, "controlView");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "leftAnchor");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "leftAnchor");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "constraintEqualToAnchor:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v16);

    -[HUSimpleControlCell controlView](self, "controlView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "topAnchor");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "topAnchor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "constraintEqualToAnchor:", v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v20);

    -[HUSimpleControlCell controlView](self, "controlView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "heightAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "heightAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "constraintEqualToAnchor:", v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "addObject:", v24);

  }
  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v25);
  -[HUSimpleControlCell setControlViewConstraints:](self, "setControlViewConstraints:", v25);

}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUSimpleControlCell setControlView:](self, "setControlView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUSimpleControlCell;
  -[HUSimpleControlCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (HUControlView)controlView
{
  return self->_controlView;
}

- (NSArray)controlViewConstraints
{
  return self->_controlViewConstraints;
}

- (void)setControlViewConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlViewConstraints, 0);
  objc_storeStrong((id *)&self->_controlView, 0);
}

@end

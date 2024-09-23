@implementation HUSliderControlCell

- (id)allControlViews
{
  void *v2;
  void *v3;
  void *v4;

  v2 = (void *)MEMORY[0x1E0C99E60];
  -[HUSliderControlCell sliderView](self, "sliderView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "na_setWithSafeObject:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setSliderView:(id)a3
{
  HUSimpleSliderControlView *v5;
  HUSimpleSliderControlView **p_sliderView;
  HUSimpleSliderControlView *sliderView;
  void *v8;
  HUSimpleSliderControlView *v9;

  v5 = (HUSimpleSliderControlView *)a3;
  p_sliderView = &self->_sliderView;
  sliderView = self->_sliderView;
  if (sliderView != v5)
  {
    v9 = v5;
    -[HUSimpleSliderControlView removeFromSuperview](sliderView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_sliderView, a3);
    -[HUSimpleSliderControlView setTranslatesAutoresizingMaskIntoConstraints:](*p_sliderView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[HUSliderControlCell contentView](self, "contentView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "addSubview:", *p_sliderView);

    -[HUSliderControlCell _updateSliderConstraints](self, "_updateSliderConstraints");
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  _QWORD v29[5];

  v29[4] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3718];
  -[HUSliderControlCell sliderConstraints](self, "sliderConstraints");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "deactivateConstraints:", v4);

  -[HUSliderControlCell setSliderConstraints:](self, "setSliderConstraints:", 0);
  -[HUSliderControlCell sliderView](self, "sliderView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
  {
    -[HUSliderControlCell sliderView](self, "sliderView");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "topAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderControlCell contentView](self, "contentView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "topAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, 7.0);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v29[0] = v24;
    -[HUSliderControlCell sliderView](self, "sliderView");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "bottomAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderControlCell contentView](self, "contentView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "bottomAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "constraintEqualToAnchor:constant:", v20, -7.0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v29[1] = v19;
    -[HUSliderControlCell sliderView](self, "sliderView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "leadingAnchor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderControlCell contentView](self, "contentView");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "leadingAnchor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "constraintEqualToAnchor:constant:", v7, 10.0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29[2] = v8;
    -[HUSliderControlCell sliderView](self, "sliderView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "trailingAnchor");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderControlCell contentView](self, "contentView");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "trailingAnchor");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12, -10.0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v29[3] = v13;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v29, 4);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUSliderControlCell setSliderConstraints:](self, "setSliderConstraints:", v14);

    v15 = (void *)MEMORY[0x1E0CB3718];
    -[HUSliderControlCell sliderConstraints](self, "sliderConstraints");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "activateConstraints:", v16);

  }
}

- (void)prepareForReuse
{
  objc_super v3;

  -[HUSliderControlCell setSliderView:](self, "setSliderView:", 0);
  v3.receiver = self;
  v3.super_class = (Class)HUSliderControlCell;
  -[HUSliderControlCell prepareForReuse](&v3, sel_prepareForReuse);
}

- (HUSimpleSliderControlView)sliderView
{
  return self->_sliderView;
}

- (NSArray)sliderConstraints
{
  return self->_sliderConstraints;
}

- (void)setSliderConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 1048);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sliderConstraints, 0);
  objc_storeStrong((id *)&self->_sliderView, 0);
}

@end

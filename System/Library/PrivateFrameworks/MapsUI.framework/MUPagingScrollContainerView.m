@implementation MUPagingScrollContainerView

- (MUPagingScrollContainerView)initWithHorizontalScrollView:(id)a3
{
  id v5;
  MUPagingScrollContainerView *v6;
  MUPagingScrollContainerView *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MUPagingScrollContainerView;
  v6 = -[MUPagingScrollContainerView initWithFrame:](&v9, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_containedScrollView, a3);
    -[MUPagingScrollContainerView setCornerStyle:](v7, "setCornerStyle:", 1);
    -[MUPagingScrollContainerView _setupSubviews](v7, "_setupSubviews");
    -[MUPagingScrollContainerView _setupConstraints](v7, "_setupConstraints");
  }

  return v7;
}

- (void)_setupSubviews
{
  id v3;
  UIView *v4;
  UIView *containedView;
  MUPagingScrollControlsView *v6;
  MUPagingScrollControlsView *controlsView;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = (UIView *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  containedView = self->_containedView;
  self->_containedView = v4;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_containedView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView setClipsToBounds:](self->_containedView, "setClipsToBounds:", 1);
  -[UIView _mapsui_setCardCorner](self->_containedView, "_mapsui_setCardCorner");
  -[MUPagingScrollContainerView addSubview:](self, "addSubview:", self->_containedView);
  -[MUScrollViewProtocol setTranslatesAutoresizingMaskIntoConstraints:](self->_containedScrollView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[UIView addSubview:](self->_containedView, "addSubview:", self->_containedScrollView);
  v6 = -[MUPagingScrollControlsView initWithHorizontalScrollView:]([MUPagingScrollControlsView alloc], "initWithHorizontalScrollView:", self->_containedScrollView);
  controlsView = self->_controlsView;
  self->_controlsView = v6;

  -[MUPagingScrollControlsView setTranslatesAutoresizingMaskIntoConstraints:](self->_controlsView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MUPagingScrollContainerView addSubview:](self, "addSubview:", self->_controlsView);
  -[MUPagingScrollContainerView sendSubviewToBack:](self, "sendSubviewToBack:", self->_controlsView);
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  MUPagingScrollControlsView *v8;
  uint64_t v9;
  MUPagingScrollControlsView *controlsView;
  MUPagingScrollControlsView *v11;
  objc_super v13;

  y = a3.y;
  x = a3.x;
  v13.receiver = self;
  v13.super_class = (Class)MUPagingScrollContainerView;
  v7 = a4;
  -[MUPagingScrollContainerView hitTest:withEvent:](&v13, sel_hitTest_withEvent_, v7, x, y);
  v8 = (MUPagingScrollControlsView *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v7, "type", v13.receiver, v13.super_class);

  controlsView = v8;
  if (v9 == 11)
    controlsView = self->_controlsView;
  v11 = controlsView;

  return v11;
}

- (void)_setupConstraints
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
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  id v48;
  _QWORD v49[16];

  v49[14] = *MEMORY[0x1E0C80C00];
  v48 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[MUScrollViewProtocol leadingAnchor](self->_containedScrollView, "leadingAnchor");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_containedView, "leadingAnchor");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "constraintEqualToAnchor:", v46);
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  v49[0] = v45;
  -[MUScrollViewProtocol trailingAnchor](self->_containedScrollView, "trailingAnchor");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containedView, "trailingAnchor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "constraintEqualToAnchor:", v43);
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v49[1] = v42;
  -[MUScrollViewProtocol topAnchor](self->_containedScrollView, "topAnchor");
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containedView, "topAnchor");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v41, "constraintEqualToAnchor:", v40);
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  v49[2] = v39;
  -[MUScrollViewProtocol bottomAnchor](self->_containedScrollView, "bottomAnchor");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_containedView, "bottomAnchor");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "constraintEqualToAnchor:", v37);
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  v49[3] = v36;
  -[UIView topAnchor](self->_containedView, "topAnchor");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollContainerView topAnchor](self, "topAnchor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "constraintEqualToAnchor:", v34);
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  v49[4] = v33;
  -[UIView bottomAnchor](self->_containedView, "bottomAnchor");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollContainerView bottomAnchor](self, "bottomAnchor");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "constraintEqualToAnchor:", v31);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v49[5] = v30;
  -[UIView leadingAnchor](self->_containedView, "leadingAnchor");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollContainerView leadingAnchor](self, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "constraintEqualToAnchor:constant:", v28, 16.0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v49[6] = v27;
  -[UIView trailingAnchor](self->_containedView, "trailingAnchor");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollContainerView trailingAnchor](self, "trailingAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "constraintEqualToAnchor:constant:", v25, -16.0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v49[7] = v24;
  -[MUPagingScrollControlsView topAnchor](self->_controlsView, "topAnchor");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView topAnchor](self->_containedView, "topAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "constraintEqualToAnchor:", v22);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v49[8] = v21;
  -[MUPagingScrollControlsView bottomAnchor](self->_controlsView, "bottomAnchor");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bottomAnchor](self->_containedView, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "constraintEqualToAnchor:", v19);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v49[9] = v18;
  -[MUPagingScrollControlsView leadingAnchor](self->_controlsView, "leadingAnchor");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView leadingAnchor](self->_containedView, "leadingAnchor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "constraintEqualToAnchor:constant:", v16, -16.0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v49[10] = v15;
  -[MUPagingScrollControlsView leadingAnchor](self->_controlsView, "leadingAnchor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollContainerView leadingAnchor](self, "leadingAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "constraintGreaterThanOrEqualToAnchor:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v49[11] = v5;
  -[MUPagingScrollControlsView trailingAnchor](self->_controlsView, "trailingAnchor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView trailingAnchor](self->_containedView, "trailingAnchor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, 16.0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v49[12] = v8;
  -[MUPagingScrollControlsView trailingAnchor](self->_controlsView, "trailingAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[MUPagingScrollContainerView trailingAnchor](self, "trailingAnchor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "constraintLessThanOrEqualToAnchor:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v49[13] = v11;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v49, 14);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v48, "addObjectsFromArray:", v12);

  v13 = (void *)MEMORY[0x1E0CB3718];
  v14 = (void *)objc_msgSend(v48, "copy");
  objc_msgSend(v13, "activateConstraints:", v14);

}

- (void)setCornerStyle:(int64_t)a3
{
  if (self->_cornerStyle != a3)
  {
    self->_cornerStyle = a3;
    -[MUPagingScrollContainerView _updateCorner](self, "_updateCorner");
  }
}

- (void)_updateCorner
{
  int64_t cornerStyle;

  cornerStyle = self->_cornerStyle;
  if (cornerStyle == 1)
  {
    -[UIView _mapsui_setCardCorner](self->_containedView, "_mapsui_setCardCorner");
  }
  else if (!cornerStyle)
  {
    -[UIView _setContinuousCornerRadius:](self->_containedView, "_setContinuousCornerRadius:", 0.0);
  }
}

- (void)setAutomaticallyFlipsForRTL:(BOOL)a3
{
  -[MUPagingScrollControlsView setAutomaticallyFlipsForRTL:](self->_controlsView, "setAutomaticallyFlipsForRTL:", a3);
}

- (BOOL)automaticallyFlipsForRTL
{
  return -[MUPagingScrollControlsView automaticallyFlipsForRTL](self->_controlsView, "automaticallyFlipsForRTL");
}

- (int64_t)cornerStyle
{
  return self->_cornerStyle;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controlsView, 0);
  objc_storeStrong((id *)&self->_containedScrollView, 0);
  objc_storeStrong((id *)&self->_containedView, 0);
}

@end

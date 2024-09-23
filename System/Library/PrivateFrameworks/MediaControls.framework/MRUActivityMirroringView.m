@implementation MRUActivityMirroringView

- (MRUActivityMirroringView)initWithFrame:(CGRect)a3
{
  MRUActivityMirroringView *v3;
  CCUICAPackageView *v4;
  CCUICAPackageView *packageView;
  void *v6;
  MRUActivityAccessoryView *v7;
  MRUActivityAccessoryView *leadingView;
  UIImageView *v9;
  UIImageView *deviceImageView;
  MRUActivityAccessoryView *v11;
  MRUActivityAccessoryView *trailingView;
  UILabel *v13;
  UILabel *headerLabel;
  void *v15;
  void *v16;
  BSUIEmojiLabelView *v17;
  BSUIEmojiLabelView *deviceNameView;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  UIButton *button;
  UIButton *v24;
  void *v25;
  void *v26;
  objc_super v28;

  v28.receiver = self;
  v28.super_class = (Class)MRUActivityMirroringView;
  v3 = -[MRUActivityMirroringView initWithFrame:](&v28, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = (CCUICAPackageView *)objc_alloc_init(MEMORY[0x1E0D14770]);
    packageView = v3->_packageView;
    v3->_packageView = v4;

    -[CCUICAPackageView setUserInteractionEnabled:](v3->_packageView, "setUserInteractionEnabled:", 0);
    +[MRUAssetsProvider packageDescriptionWithName:](MRUAssetsProvider, "packageDescriptionWithName:", CFSTR("MirroringLeading"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUICAPackageView setPackageDescription:](v3->_packageView, "setPackageDescription:", v6);

    v7 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v3->_packageView, 23.0, 22.0);
    leadingView = v3->_leadingView;
    v3->_leadingView = v7;

    -[MRUActivityMirroringView addSubview:](v3, "addSubview:", v3->_leadingView);
    v9 = (UIImageView *)objc_alloc_init(MEMORY[0x1E0DC3890]);
    deviceImageView = v3->_deviceImageView;
    v3->_deviceImageView = v9;

    -[UIImageView setContentMode:](v3->_deviceImageView, "setContentMode:", 1);
    v11 = -[MRUActivityAccessoryView initWithContentView:size:]([MRUActivityAccessoryView alloc], "initWithContentView:size:", v3->_deviceImageView, 23.0, 22.0);
    trailingView = v3->_trailingView;
    v3->_trailingView = v11;

    -[MRUActivityMirroringView addSubview:](v3, "addSubview:", v3->_trailingView);
    v13 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    headerLabel = v3->_headerLabel;
    v3->_headerLabel = v13;

    +[MRUStringsProvider screenMirroring](MRUStringsProvider, "screenMirroring");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v3->_headerLabel, "setText:", v15);

    -[UILabel setNumberOfLines:](v3->_headerLabel, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "labelColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_headerLabel, "setTextColor:", v16);

    -[MRUActivityMirroringView addSubview:](v3, "addSubview:", v3->_headerLabel);
    v17 = (BSUIEmojiLabelView *)objc_alloc_init(MEMORY[0x1E0D01920]);
    deviceNameView = v3->_deviceNameView;
    v3->_deviceNameView = v17;

    -[BSUIEmojiLabelView setNumberOfLines:](v3->_deviceNameView, "setNumberOfLines:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[BSUIEmojiLabelView setTextColor:](v3->_deviceNameView, "setTextColor:", v19);

    -[MRUActivityMirroringView addSubview:](v3, "addSubview:", v3->_deviceNameView);
    objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.22745098, 0.509803922, 0.968627451, 1.0);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0DC3520], "sbui_systemApertureTextButtonConfiguration");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setBaseForegroundColor:", v20);
    objc_msgSend(v21, "setBaseBackgroundColor:", v20);
    objc_msgSend(MEMORY[0x1E0DC3518], "buttonWithConfiguration:primaryAction:", v21, 0);
    v22 = objc_claimAutoreleasedReturnValue();
    button = v3->_button;
    v3->_button = (UIButton *)v22;

    v24 = v3->_button;
    +[MRUStringsProvider stopMirroring](MRUStringsProvider, "stopMirroring");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIButton setTitle:forState:](v24, "setTitle:forState:", v25, 0);

    -[MRUActivityMirroringView addSubview:](v3, "addSubview:", v3->_button);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "addObserver:selector:name:object:", v3, sel_updateContentSizeCategory, *MEMORY[0x1E0DC48E8], 0);

    -[MRUActivityMirroringView updateContentSizeCategory](v3, "updateContentSizeCategory");
    -[MRUActivityMirroringView updatePackageScale](v3, "updatePackageScale");
    -[MRUActivityMirroringView updateDeviceSymbolConfiguration](v3, "updateDeviceSymbolConfiguration");
    -[MRUActivityMirroringView updateVisibilty](v3, "updateVisibilty");

  }
  return v3;
}

- (void)layoutSubviews
{
  uint64_t v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  CGFloat v9;
  double v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  double v16;
  double v17;
  double MinX;
  CGFloat v19;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v24;
  void *v25;
  double v26;
  CGFloat v27;
  double v28;
  CGFloat v29;
  double v30;
  CGFloat v31;
  double v32;
  CGFloat v33;
  double v34;
  double v35;
  double v36;
  double v37;
  CGFloat v38;
  CGFloat v39;
  CGFloat v40;
  CGFloat v41;
  double v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  double v49;
  CGFloat v50;
  double v51;
  double v52;
  double v53;
  double v54;
  CGFloat v55;
  CGFloat MinY;
  CGFloat v57;
  objc_super v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;

  v58.receiver = self;
  v58.super_class = (Class)MRUActivityMirroringView;
  -[MRUActivityMirroringView layoutSubviews](&v58, sel_layoutSubviews);
  -[MRUActivityMirroringView updatePackageScale](self, "updatePackageScale");
  -[MRUActivityMirroringView updateDeviceSymbolConfiguration](self, "updateDeviceSymbolConfiguration");
  -[MRUActivityMirroringView updateVisibilty](self, "updateVisibilty");
  v3 = -[MRUActivityMirroringView SBUISA_layoutMode](self, "SBUISA_layoutMode");
  -[MRUActivityMirroringView bounds](self, "bounds");
  v8 = v4;
  v9 = v5;
  v10 = v6;
  v11 = v7;
  if (v3 == 4)
  {
    v12 = v4 + 20.0;
    v13 = v5 + 29.0;
    v14 = v6 - (20.0 + 20.0);
    v15 = v7 - (29.0 + 17.0);
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v14, v15);
    v17 = v16;
    v59.origin.x = v12;
    v59.origin.y = v13;
    v59.size.width = v14;
    v59.size.height = v15;
    MinX = CGRectGetMinX(v59);
    v60.origin.x = v12;
    v60.origin.y = v13;
    v60.size.width = v14;
    v60.size.height = v15;
    v19 = CGRectGetMaxY(v60) - v17;
    v61.origin.x = v12;
    v61.origin.y = v13;
    v61.size.width = v14;
    v61.size.height = v15;
    -[UIButton setFrame:](self->_button, "setFrame:", MinX, v19, CGRectGetWidth(v61), v17);
    UIRectInset();
    x = v62.origin.x;
    y = v62.origin.y;
    width = v62.size.width;
    height = v62.size.height;
    v57 = CGRectGetMinX(v62);
    v63.origin.x = x;
    v63.origin.y = y;
    v63.size.width = width;
    v63.size.height = height;
    MinY = CGRectGetMinY(v63);
    -[MRUActivityMirroringView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_leadingView, "setFrame:");
    v64.origin.x = x;
    v64.origin.y = y;
    v64.size.width = width;
    v64.size.height = height;
    v55 = CGRectGetMaxX(v64) - 40.0;
    v65.origin.x = x;
    v65.origin.y = y;
    v65.size.width = width;
    v65.size.height = height;
    v24 = CGRectGetMinY(v65);
    -[MRUActivityMirroringView bounds](self, "bounds");
    MPRectByApplyingUserInterfaceLayoutDirectionInRect();
    -[MRUActivityAccessoryView setFrame:](self->_trailingView, "setFrame:");
    -[UILabel mr_tightBoundingRectOfFirstLine](self->_headerLabel, "mr_tightBoundingRectOfFirstLine");
    CGRectGetMinY(v66);
    -[MRUActivityMirroringView SBUISA_systemApertureObstructedAreaLayoutGuide](self, "SBUISA_systemApertureObstructedAreaLayoutGuide");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "layoutFrame");
    CGRectGetHeight(v67);

    v68.origin.x = v55;
    v68.size.height = 40.0;
    v68.origin.y = v24;
    v68.size.width = 40.0;
    CGRectGetWidth(v68);
    v69.origin.y = MinY;
    v69.origin.x = v57;
    v69.size.height = 38.0;
    v69.size.width = 50.0;
    CGRectGetWidth(v69);
    UIRectInset();
    v27 = v26;
    v29 = v28;
    v31 = v30;
    v33 = v32;
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v30, v32);
    v35 = v34;
    v70.origin.x = v27;
    v70.origin.y = v29;
    v70.size.width = v31;
    v70.size.height = v33;
    v36 = CGRectGetMinX(v70);
    v71.origin.x = v27;
    v71.origin.y = v29;
    v71.size.width = v31;
    v71.size.height = v33;
    v37 = CGRectGetMinY(v71);
    v38 = v27;
    v39 = v29;
    v40 = v31;
    v41 = v33;
  }
  else
  {
    -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", v6, v7);
    v72.origin.x = v8;
    v72.origin.y = v9;
    v72.size.width = v10;
    v72.size.height = v11;
    CGRectGetWidth(v72);
    UIRectCenteredRect();
    -[UIButton setFrame:](self->_button, "setFrame:");
    -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", v10, v11);
    v35 = v42;
    v73.origin.x = v8;
    v73.origin.y = v9;
    v73.size.width = v10;
    v73.size.height = v11;
    v36 = CGRectGetMinX(v73);
    v74.origin.x = v8;
    v74.origin.y = v9;
    v74.size.width = v10;
    v74.size.height = v11;
    v37 = CGRectGetMinY(v74);
    v38 = v8;
    v39 = v9;
    v40 = v10;
    v41 = v11;
  }
  -[UILabel setFrame:](self->_headerLabel, "setFrame:", v36, v37, CGRectGetWidth(*(CGRect *)&v38), v35);
  UIRectInset();
  v44 = v43;
  v46 = v45;
  v48 = v47;
  v50 = v49;
  -[BSUIEmojiLabelView sizeThatFits:](self->_deviceNameView, "sizeThatFits:", v47, v49);
  v52 = v51;
  v75.origin.x = v44;
  v75.origin.y = v46;
  v75.size.width = v48;
  v75.size.height = v50;
  v53 = CGRectGetMinX(v75);
  v76.origin.x = v44;
  v76.origin.y = v46;
  v76.size.width = v48;
  v76.size.height = v50;
  v54 = CGRectGetMinY(v76);
  v77.origin.x = v44;
  v77.origin.y = v46;
  v77.size.width = v48;
  v77.size.height = v50;
  -[BSUIEmojiLabelView setFrame:](self->_deviceNameView, "setFrame:", v53, v54, CGRectGetWidth(v77), v52);
}

- (void)setDeviceName:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_deviceName, a3);
  v5 = a3;
  -[BSUIEmojiLabelView setText:](self->_deviceNameView, "setText:", v5);

  -[MRUActivityMirroringView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setDeviceImage:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_deviceImage, a3);
  v5 = a3;
  -[UIImageView setImage:](self->_deviceImageView, "setImage:", v5);

  -[MRUActivityMirroringView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setState:(id)a3
{
  id v5;

  objc_storeStrong((id *)&self->_state, a3);
  v5 = a3;
  -[CCUICAPackageView setStateName:](self->_packageView, "setStateName:", v5);

}

- (double)preferredHeightForBottomSafeArea
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGRect v10;

  -[UILabel mr_tightBoundingRectOfFirstLine](self->_headerLabel, "mr_tightBoundingRectOfFirstLine");
  v3 = 17.0 + 14.0 - CGRectGetMinY(v10);
  -[UILabel sizeThatFits:](self->_headerLabel, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v5 = v3 + v4;
  -[BSUIEmojiLabelView sizeThatFits:](self->_deviceNameView, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  v7 = v5 + v6;
  -[UIButton sizeThatFits:](self->_button, "sizeThatFits:", 1.79769313e308, 1.79769313e308);
  return v7 + v8;
}

- (void)updateContentSizeCategory
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)MEMORY[0x1E0DC1350];
  -[UILabel traitCollection](self->_headerLabel, "traitCollection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 0, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_headerLabel, "setFont:", v5);

  v6 = (void *)MEMORY[0x1E0DC1350];
  -[BSUIEmojiLabelView traitCollection](self->_deviceNameView, "traitCollection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sbui_systemAperturePreferredFontForTextStyle:compatibleWithTraitCollection:", 4, v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[BSUIEmojiLabelView setFont:](self->_deviceNameView, "setFont:", v7);

}

- (void)updateVisibilty
{
  UIButton **p_button;
  UIButton *button;
  UILabel **p_headerLabel;
  UILabel *headerLabel;
  id *p_deviceNameView;
  id v8;
  double v9;
  UIButton *v10;
  UILabel *v11;
  id v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  CGAffineTransform v16;
  CGAffineTransform v17;
  CGAffineTransform v18;
  CGAffineTransform v19;
  CGAffineTransform v20;
  CGAffineTransform v21;
  _OWORD v22[3];
  _OWORD v23[3];
  _OWORD v24[2];
  __int128 v25;

  if (-[MRUActivityMirroringView SBUISA_layoutMode](self, "SBUISA_layoutMode") == 4)
  {
    p_button = &self->_button;
    button = self->_button;
    v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v24[0] = *MEMORY[0x1E0C9BAA8];
    v14 = v24[0];
    v24[1] = v15;
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v13 = v25;
    -[UIButton setTransform:](button, "setTransform:", v24);
    p_headerLabel = &self->_headerLabel;
    headerLabel = self->_headerLabel;
    v23[0] = v14;
    v23[1] = v15;
    v23[2] = v13;
    -[UILabel setTransform:](headerLabel, "setTransform:", v23);
    p_deviceNameView = (id *)&self->_deviceNameView;
    v8 = *p_deviceNameView;
    v22[0] = v14;
    v22[1] = v15;
    v22[2] = v13;
    objc_msgSend(v8, "setTransform:", v22);
    v9 = 1.0;
  }
  else
  {
    CGAffineTransformMakeScale(&v21, 0.5, 0.5);
    p_button = &self->_button;
    v10 = self->_button;
    v20 = v21;
    -[UIButton setTransform:](v10, "setTransform:", &v20);
    CGAffineTransformMakeScale(&v19, 0.5, 0.5);
    p_headerLabel = &self->_headerLabel;
    v11 = self->_headerLabel;
    v18 = v19;
    -[UILabel setTransform:](v11, "setTransform:", &v18);
    CGAffineTransformMakeScale(&v17, 0.5, 0.5);
    p_deviceNameView = (id *)&self->_deviceNameView;
    v12 = *p_deviceNameView;
    v16 = v17;
    objc_msgSend(v12, "setTransform:", &v16);
    v9 = 0.0;
  }
  -[UIButton setAlpha:](*p_button, "setAlpha:", v9);
  -[UILabel setAlpha:](*p_headerLabel, "setAlpha:", v9);
  objc_msgSend(*p_deviceNameView, "setAlpha:", v9);
}

- (void)updatePackageScale
{
  uint64_t v3;
  double v4;

  v3 = -[MRUActivityMirroringView SBUISA_layoutMode](self, "SBUISA_layoutMode");
  v4 = 1.66666667;
  if (v3 != 4)
    v4 = 1.0;
  -[CCUICAPackageView setScale:](self->_packageView, "setScale:", v4);
}

- (void)updateDeviceSymbolConfiguration
{
  double v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  if (-[MRUActivityMirroringView SBUISA_layoutMode](self, "SBUISA_layoutMode") == 4)
  {
    v3 = 34.0;
    v4 = 4;
  }
  else
  {
    v3 = 15.0;
    v4 = 5;
  }
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", v4, 2, v3);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x1E0DC3888];
  objc_msgSend(MEMORY[0x1E0DC3658], "systemGray2Color");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "configurationWithHierarchicalColor:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "configurationByApplyingConfiguration:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setSymbolConfiguration:](self->_deviceImageView, "setSymbolConfiguration:", v8);

}

- (MRUActivityAccessoryView)leadingView
{
  return self->_leadingView;
}

- (MRUActivityAccessoryView)trailingView
{
  return self->_trailingView;
}

- (UIButton)button
{
  return self->_button;
}

- (UIImage)deviceImage
{
  return self->_deviceImage;
}

- (NSString)deviceName
{
  return self->_deviceName;
}

- (NSString)state
{
  return self->_state;
}

- (UILabel)headerLabel
{
  return self->_headerLabel;
}

- (void)setHeaderLabel:(id)a3
{
  objc_storeStrong((id *)&self->_headerLabel, a3);
}

- (BSUIEmojiLabelView)deviceNameView
{
  return self->_deviceNameView;
}

- (void)setDeviceNameView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceNameView, a3);
}

- (CCUICAPackageView)packageView
{
  return self->_packageView;
}

- (void)setPackageView:(id)a3
{
  objc_storeStrong((id *)&self->_packageView, a3);
}

- (UIImageView)deviceImageView
{
  return self->_deviceImageView;
}

- (void)setDeviceImageView:(id)a3
{
  objc_storeStrong((id *)&self->_deviceImageView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceImageView, 0);
  objc_storeStrong((id *)&self->_packageView, 0);
  objc_storeStrong((id *)&self->_deviceNameView, 0);
  objc_storeStrong((id *)&self->_headerLabel, 0);
  objc_storeStrong((id *)&self->_state, 0);
  objc_storeStrong((id *)&self->_deviceName, 0);
  objc_storeStrong((id *)&self->_deviceImage, 0);
  objc_storeStrong((id *)&self->_button, 0);
  objc_storeStrong((id *)&self->_trailingView, 0);
  objc_storeStrong((id *)&self->_leadingView, 0);
}

@end

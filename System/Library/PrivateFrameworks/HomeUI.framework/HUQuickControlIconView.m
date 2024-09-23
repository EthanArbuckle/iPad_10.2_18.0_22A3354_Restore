@implementation HUQuickControlIconView

+ (BOOL)requiresConstraintBasedLayout
{
  return 1;
}

- (HUQuickControlIconView)initWithProfile:(id)a3
{
  id v5;
  HUQuickControlIconView *v6;
  HUQuickControlIconView *v7;
  HUIconView *v8;
  HUIconView *iconView;
  UILabel *v10;
  UILabel *statusLabel;
  UILabel *v12;
  UILabel *supplementaryLabel;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)HUQuickControlIconView;
  v6 = -[HUQuickControlIconView init](&v15, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_profile, a3);
    v7->_reachabilityState = 0;
    v8 = (HUIconView *)objc_alloc_init(MEMORY[0x1E0D33720]);
    iconView = v7->_iconView;
    v7->_iconView = v8;

    -[HUIconView setUserInteractionEnabled:](v7->_iconView, "setUserInteractionEnabled:", 0);
    -[HUIconView setContentMode:](v7->_iconView, "setContentMode:", 2);
    -[HUIconView setIconSize:](v7->_iconView, "setIconSize:", 4);
    -[HUQuickControlIconView addSubview:](v7, "addSubview:", v7->_iconView);
    v10 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    statusLabel = v7->_statusLabel;
    v7->_statusLabel = v10;

    -[UILabel setNumberOfLines:](v7->_statusLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v7->_statusLabel, "setTextAlignment:", 1);
    -[HUQuickControlIconView addSubview:](v7, "addSubview:", v7->_statusLabel);
    v12 = (UILabel *)objc_alloc_init(MEMORY[0x1E0CEA700]);
    supplementaryLabel = v7->_supplementaryLabel;
    v7->_supplementaryLabel = v12;

    -[UILabel setNumberOfLines:](v7->_supplementaryLabel, "setNumberOfLines:", 0);
    -[UILabel setTextAlignment:](v7->_supplementaryLabel, "setTextAlignment:", 1);
    -[HUQuickControlIconView addSubview:](v7, "addSubview:", v7->_supplementaryLabel);
  }

  return v7;
}

- (void)setProfile:(id)a3
{
  objc_storeStrong((id *)&self->_profile, a3);
  -[HUQuickControlIconView _updateUI](self, "_updateUI");
}

- (id)intrinsicSizeDescriptorForControlSize:(unint64_t)a3
{
  double v4;
  void *v5;
  void *v6;

  -[HUQuickControlIconView _iconAndLabelsHeight](self, "_iconAndLabelsHeight");
  HUQuickControlIconViewMetricsForControlSize(a3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sizeDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void)setValue:(id)a3
{
  objc_storeStrong(&self->_viewValue, a3);
  -[HUQuickControlIconView _updateUI](self, "_updateUI");
}

- (CGSize)intrinsicContentSize
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  -[HUQuickControlIconView _iconAndLabelsHeight](self, "_iconAndLabelsHeight");
  v4 = v3;
  -[HUQuickControlIconView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  HUQuickControlIconViewMetricsForControlSize(objc_msgSend(v5, "controlSize"), v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeDescriptor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicSize");
  v9 = v8;
  v11 = v10;

  v12 = v9;
  v13 = v11;
  result.height = v13;
  result.width = v12;
  return result;
}

- (void)setReachabilityState:(unint64_t)a3
{
  self->_reachabilityState = a3;
  -[HUQuickControlIconView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:");
}

- (void)_updateUIForReachabilityState:(unint64_t)a3
{
  if (a3 <= 2)
    -[HUQuickControlIconView setAlpha:](self, "setAlpha:", dbl_1B94422F8[a3]);
}

- (BOOL)isUserInteractionActive
{
  return 0;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HUQuickControlIconView;
  -[HUQuickControlIconView layoutSubviews](&v3, sel_layoutSubviews);
  -[HUQuickControlIconView _updateLayout](self, "_updateLayout");
  -[HUQuickControlIconView _updateUIForReachabilityState:](self, "_updateUIForReachabilityState:", -[HUQuickControlIconView reachabilityState](self, "reachabilityState"));
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  char isKindOfClass;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  __CFString *v21;
  __CFString *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  __CFString *v40;
  __CFString *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  __CFString *v51;
  _QWORD v52[4];
  _QWORD v53[4];
  _QWORD v54[4];
  _QWORD v55[6];

  v55[4] = *MEMORY[0x1E0C80C00];
  -[HUQuickControlIconView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "iconDescriptor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlIconView profile](self, "profile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "iconDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v8 = objc_alloc(MEMORY[0x1E0D318D0]);
    -[HUQuickControlIconView profile](self, "profile");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "statusString");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithFormattedTemperature:heatingCoolingMode:targetHeatingCoolingMode:", v10, 0, 0);

    v4 = (void *)v11;
  }
  -[HUQuickControlIconView iconView](self, "iconView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v4;
  objc_msgSend(v12, "updateWithIconDescriptor:displayStyle:animated:", v4, 1, 1);

  objc_msgSend(MEMORY[0x1E0CEA5F0], "preferredFontDescriptorWithTextStyle:addingSymbolicTraits:options:", *MEMORY[0x1E0CEB558], 2, 0);
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = (void *)objc_opt_new();
  objc_msgSend(v14, "setAlignment:", 1);
  LODWORD(v15) = 1.0;
  objc_msgSend(v14, "setHyphenationFactor:", v15);
  objc_msgSend(v14, "setLineBreakMode:", 0);
  objc_msgSend(MEMORY[0x1E0C99DC8], "preferredLanguages");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "firstObject");
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  -[HUQuickControlIconView profile](self, "profile");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "statusString");
  v19 = objc_claimAutoreleasedReturnValue();
  v20 = (void *)v19;
  v21 = &stru_1E6F60E80;
  if (v19)
    v21 = (__CFString *)v19;
  v22 = v21;

  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = v22;
  objc_msgSend(v23, "setText:", v22);

  -[HUQuickControlIconView profile](self, "profile");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "statusTextColor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = v25;
  if (v25)
  {
    v27 = v25;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "labelColor");
    v27 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v27;
  v49 = v27;

  v29 = *MEMORY[0x1E0CEA0A0];
  v55[0] = v28;
  v30 = *MEMORY[0x1E0CEA098];
  v54[0] = v29;
  v54[1] = v30;
  v31 = (void *)v13;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v13, 0.0);
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = *MEMORY[0x1E0CEA0D0];
  v55[1] = v32;
  v55[2] = v14;
  v34 = *MEMORY[0x1E0CA8590];
  v54[2] = v33;
  v54[3] = v34;
  v55[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v55, v54, 4);
  v47 = v14;
  v48 = (void *)objc_claimAutoreleasedReturnValue();

  v35 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v51, v48);
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v36 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setAttributedText:", v35);

  -[HUQuickControlIconView profile](self, "profile");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "supplementaryString");
  v38 = objc_claimAutoreleasedReturnValue();
  v39 = (void *)v38;
  v40 = &stru_1E6F60E80;
  if (v38)
    v40 = (__CFString *)v38;
  v41 = v40;

  v52[0] = v29;
  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  v53[0] = v42;
  v52[1] = v30;
  objc_msgSend(MEMORY[0x1E0CEA5E8], "fontWithDescriptor:size:", v31, 0.0);
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  v53[1] = v43;
  v53[2] = v47;
  v52[2] = v33;
  v52[3] = v34;
  v53[3] = v17;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v53, v52, 4);
  v44 = (void *)objc_claimAutoreleasedReturnValue();

  v45 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v41, v44);
  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v46, "setAttributedText:", v45);

  -[HUQuickControlIconView _updateLayout](self, "_updateLayout");
}

- (double)_iconAndLabelsHeight
{
  double v3;

  -[HUQuickControlIconView _updateLabelSizes](self, "_updateLabelSizes");
  -[HUQuickControlIconView _getLabelsContainingRect](self, "_getLabelsContainingRect");
  return v3 + 76.0;
}

- (void)_updateLayout
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;

  -[HUQuickControlIconView _iconAndLabelsHeight](self, "_iconAndLabelsHeight");
  v4 = v3;
  -[HUQuickControlIconView frame](self, "frame");
  v6 = v5 * 0.5 + -35.0;
  -[HUQuickControlIconView frame](self, "frame");
  v8 = v7 * 0.5 - v4 * 0.5;
  -[HUQuickControlIconView iconView](self, "iconView");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setFrame:", v6, v8, 70.0, 70.0);

  -[HUQuickControlIconView _updateLabelFramesOrigins](self, "_updateLabelFramesOrigins");
}

- (void)_updateLabelSizes
{
  void *v3;
  uint64_t v4;
  double v5;
  double v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  double v18;
  double v19;
  void *v20;
  double v21;
  double v22;
  void *v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  id v35;

  -[HUQuickControlIconView profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "controlSize");
  v5 = 120.0;
  if (v4 == 1)
    v5 = 280.0;
  if (v4)
    v6 = v5;
  else
    v6 = 330.0;

  -[HUQuickControlIconView frame](self, "frame");
  if (v7 <= 0.0)
  {
    -[HUQuickControlIconView iconView](self, "iconView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "frame");
    v11 = v10 * 1.5;

    if (v11 >= v6)
      v6 = v11;
  }
  else
  {
    -[HUQuickControlIconView frame](self, "frame");
    if (v8 < v6)
      v6 = v8;
  }
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "sizeThatFits:", v6, 1.79769313e308);
  v14 = v13;
  v16 = v15;

  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "frame");
  v19 = v18;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "frame");
  v22 = v21;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setFrame:", v19, v22, v14, v16);

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "sizeThatFits:", v6, 1.79769313e308);
  v26 = v25;
  v28 = v27;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v35 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v30 = v29;
  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v34, "setFrame:", v30, v33, v26, v28);

}

- (CGRect)_getLabelsContainingRect
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  void *v24;
  double v25;
  double v26;
  double v27;
  double v28;
  void *v29;
  double v30;
  double v31;
  void *v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  double v37;
  void *v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  CGRect result;

  -[HUQuickControlIconView _updateLabelSizes](self, "_updateLabelSizes");
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "frame");
  v5 = v4;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v8 = v7;

  if (v5 >= v8)
    v5 = v8;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "frame");
  v11 = v10;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "frame");
  v14 = v13;

  if (v11 >= v14)
    v11 = v14;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "frame");
  v17 = v16;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "frame");
  v20 = v17 + v19;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "frame");
  v23 = v22;
  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "frame");
  v26 = v23 + v25;

  if (v20 >= v26)
    v27 = v20;
  else
    v27 = v26;
  v28 = v27 - v5;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v29, "frame");
  v31 = v30;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "frame");
  v34 = v31 + v33;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "frame");
  v37 = v36;
  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "frame");
  v40 = v37 + v39;

  if (v34 >= v40)
    v41 = v34;
  else
    v41 = v40;
  v42 = v41 - v11;
  v43 = v5;
  v44 = v11;
  v45 = v28;
  result.size.height = v42;
  result.size.width = v45;
  result.origin.y = v44;
  result.origin.x = v43;
  return result;
}

- (void)_updateLabelFramesOrigins
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  double v20;
  double v21;
  void *v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  double v30;
  void *v31;
  double v32;
  double v33;
  double v34;
  double v35;
  id v36;

  -[HUQuickControlIconView frame](self, "frame");
  v4 = v3 * 0.5;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "frame");
  v7 = v4 - v6 * 0.5;

  -[HUQuickControlIconView iconView](self, "iconView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "frame");
  v10 = v9;
  -[HUQuickControlIconView iconView](self, "iconView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "frame");
  v13 = v10 + v12 + 6.0;

  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");
  v16 = v15;
  v18 = v17;

  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setFrame:", v7, v13, v16, v18);

  -[HUQuickControlIconView frame](self, "frame");
  v21 = v20 * 0.5;
  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "frame");
  v24 = v21 - v23 * 0.5;

  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "frame");
  v27 = v26;
  -[HUQuickControlIconView statusLabel](self, "statusLabel");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "frame");
  v30 = v27 + v29;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "frame");
  v33 = v32;
  v35 = v34;

  -[HUQuickControlIconView supplementaryLabel](self, "supplementaryLabel");
  v36 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v36, "setFrame:", v24, v30, v33, v35);

}

- (HUQuickControlIconViewProfile)profile
{
  return self->_profile;
}

- (HUQuickControlViewInteractionDelegate)interactionDelegate
{
  return (HUQuickControlViewInteractionDelegate *)objc_loadWeakRetained((id *)&self->_interactionDelegate);
}

- (void)setInteractionDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_interactionDelegate, a3);
}

- (unint64_t)reachabilityState
{
  return self->_reachabilityState;
}

- (HUIconView)iconView
{
  return self->_iconView;
}

- (void)setIconView:(id)a3
{
  objc_storeStrong((id *)&self->_iconView, a3);
}

- (UILabel)statusLabel
{
  return self->_statusLabel;
}

- (void)setStatusLabel:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabel, a3);
}

- (UILabel)supplementaryLabel
{
  return self->_supplementaryLabel;
}

- (void)setSupplementaryLabel:(id)a3
{
  objc_storeStrong((id *)&self->_supplementaryLabel, a3);
}

- (id)viewValue
{
  return self->_viewValue;
}

- (void)setViewValue:(id)a3
{
  objc_storeStrong(&self->_viewValue, a3);
}

- (void)setUserInteractionActive:(BOOL)a3
{
  self->_userInteractionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_viewValue, 0);
  objc_storeStrong((id *)&self->_supplementaryLabel, 0);
  objc_storeStrong((id *)&self->_statusLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
  objc_destroyWeak((id *)&self->_interactionDelegate);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end

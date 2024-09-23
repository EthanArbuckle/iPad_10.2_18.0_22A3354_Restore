@implementation NTKCFaceDetailSectionHeaderView

+ (id)reuseIdentifier
{
  objc_class *v2;

  v2 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v2);
}

+ (double)headerHeight
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;

  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = (void *)*MEMORY[0x1E0DC48D0];
  if (UIContentSizeCategoryCompareToCategory((UIContentSizeCategory)v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending)
  {
    v6 = v5;

    v4 = v6;
  }
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    objc_msgSend(MEMORY[0x1E0DC39A8], "sidebarHeaderConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F18]), "initWithTraitCollection:", v7);
    v10 = (id)objc_msgSend(v8, "updatedConfigurationForState:", v9);
    objc_msgSend(v8, "textProperties");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "font");
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "_scaledValueForValue:", 6.0);
    v14 = v13;
    objc_msgSend(v12, "lineHeight");
    UICeilToScale();
    v16 = v14 + v15;

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_scaledValueForValue:", 32.0);
    v16 = v17;
  }

  return v16;
}

- (NTKCFaceDetailSectionHeaderView)init
{
  void *v3;
  NTKCFaceDetailSectionHeaderView *v4;

  objc_msgSend((id)objc_opt_class(), "reuseIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[NTKCFaceDetailSectionHeaderView initWithReuseIdentifier:](self, "initWithReuseIdentifier:", v3);

  return v4;
}

- (NTKCFaceDetailSectionHeaderView)initWithReuseIdentifier:(id)a3
{
  NTKCFaceDetailSectionHeaderView *v3;
  uint64_t v4;
  void *configuration;
  id v6;
  void *v7;
  uint64_t v8;
  UILabel *detailLabel;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  NTKCSeparatorView *separator;
  void *v15;
  objc_super v17;

  v17.receiver = self;
  v17.super_class = (Class)NTKCFaceDetailSectionHeaderView;
  v3 = -[NTKCFaceDetailSectionHeaderView initWithReuseIdentifier:](&v17, sel_initWithReuseIdentifier_, a3);
  if (v3)
  {
    if ((_os_feature_enabled_impl() & 1) != 0)
    {
      objc_msgSend(MEMORY[0x1E0DC39A8], "sidebarHeaderConfiguration");
      v4 = objc_claimAutoreleasedReturnValue();
      configuration = v3->_configuration;
      v3->_configuration = (UIListContentConfiguration *)v4;
    }
    else
    {
      v6 = objc_alloc(MEMORY[0x1E0DC3F58]);
      objc_msgSend(MEMORY[0x1E0DC3510], "effectWithStyle:", 10);
      configuration = (void *)objc_claimAutoreleasedReturnValue();
      v7 = (void *)objc_msgSend(v6, "initWithEffect:", configuration);
      -[NTKCFaceDetailSectionHeaderView setBackgroundView:](v3, "setBackgroundView:", v7);

    }
    v8 = objc_opt_new();
    detailLabel = v3->_detailLabel;
    v3->_detailLabel = (UILabel *)v8;

    BPSDetailTextColor();
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v3->_detailLabel, "setTextColor:", v10);

    if (CLKLayoutIsRTL())
      v11 = 0;
    else
      v11 = 2;
    -[UILabel setTextAlignment:](v3->_detailLabel, "setTextAlignment:", v11);
    -[NTKCFaceDetailSectionHeaderView contentView](v3, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addSubview:", v3->_detailLabel);

    v13 = objc_opt_new();
    separator = v3->_separator;
    v3->_separator = (NTKCSeparatorView *)v13;

    -[NTKCFaceDetailSectionHeaderView addSubview:](v3, "addSubview:", v3->_separator);
    objc_msgSend(MEMORY[0x1E0CB37D0], "defaultCenter");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "addObserver:selector:name:object:", v3, sel__fontSizeDidChange, *MEMORY[0x1E0DC48E8], 0);

    -[NTKCFaceDetailSectionHeaderView _fontSizeDidChange](v3, "_fontSizeDidChange");
  }
  return v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[NTKCFaceDetailSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)subtitle
{
  return -[UILabel text](self->_detailLabel, "text");
}

- (void)setSubtitle:(id)a3
{
  -[UILabel setText:](self->_detailLabel, "setText:", a3);
  -[UILabel sizeToFit](self->_detailLabel, "sizeToFit");
  -[NTKCFaceDetailSectionHeaderView setNeedsLayout](self, "setNeedsLayout");
}

- (NSString)groupName
{
  void *v3;
  void *v4;

  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = 0;
  }
  else
  {
    -[NTKCFaceDetailSectionHeaderView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_groupName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return (NSString *)v3;
}

- (void)setGroupName:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[NTKCFaceDetailSectionHeaderView backgroundView](self, "backgroundView");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_setGroupName:", v5);

  }
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGFloat v7;
  double v8;
  CGFloat v9;
  double v10;
  double v11;
  int IsRTL;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double Width;
  CGFloat v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  void *v28;
  double v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  CGFloat v34;
  double MinY;
  void *v36;
  double v37;
  double v38;
  double v39;
  double v40;
  void *v41;
  double v42;
  double v43;
  double v44;
  CGFloat v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  CGFloat v51;
  double v52;
  CGFloat v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double Height;
  CGFloat rect;
  CGFloat v61;
  CGFloat v62;
  double v63;
  CGFloat v64;
  double v65;
  CGFloat v66;
  CGFloat v67;
  double v68;
  objc_super v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;

  v69.receiver = self;
  v69.super_class = (Class)NTKCFaceDetailSectionHeaderView;
  -[NTKCFaceDetailSectionHeaderView layoutSubviews](&v69, sel_layoutSubviews);
  -[NTKCFaceDetailSectionHeaderView _updateConfig](self, "_updateConfig");
  -[NTKCFaceDetailSectionHeaderView contentView](self, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  v66 = v4;
  v67 = v5;
  v7 = v6;
  v9 = v8;

  v10 = NTKCScreenEdgeMargin();
  v11 = v10;
  IsRTL = CLKLayoutIsRTL();
  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  v65 = v10;
  if (IsRTL)
  {
    v70.origin.x = v66;
    v70.origin.y = v67;
    v70.size.width = v7;
    v70.size.height = v9;
    Width = CGRectGetWidth(v70);
    v71.origin.x = v15;
    v71.origin.y = v17;
    v71.size.width = v19;
    v71.size.height = v21;
    v11 = Width - CGRectGetWidth(v71) - v10;
  }
  v64 = v9;
  v23 = v7;
  v24 = 6.0;
  if ((_os_feature_enabled_impl() & 1) == 0)
  {
    -[UILabel font](self->_detailLabel, "font");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "_scaledValueForValue:", 22.0);
    v27 = v26;

    -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "_lastLineBaseline");
    v24 = v27 - v29;

  }
  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setFrame:", v11, v24, v19, v21);

  -[UILabel frame](self->_detailLabel, "frame");
  v61 = v32;
  v62 = v31;
  v63 = v33;
  v68 = v10;
  rect = v21;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v72.origin.x = v11;
    v72.origin.y = v24;
    v72.size.width = v19;
    v72.size.height = v21;
    v34 = v11;
    MinY = CGRectGetMinY(v72);
    -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "_firstLineBaseline");
    v38 = MinY + v37;
    -[UILabel _lastLineBaseline](self->_detailLabel, "_lastLineBaseline");
    v40 = v38 - v39;

  }
  else
  {
    -[UILabel font](self->_detailLabel, "font");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v41, "_scaledValueForValue:", 22.0);
    v34 = v11;
    v43 = v42;

    -[UILabel _lastLineBaseline](self->_detailLabel, "_lastLineBaseline");
    v40 = v43 - v44;
  }
  v73.origin.y = v67;
  v73.origin.x = v66;
  v73.size.width = v23;
  v73.size.height = v64;
  v45 = CGRectGetWidth(v73) + v10 * -2.0;
  v74.origin.x = v34;
  v74.origin.y = v24;
  v74.size.width = v19;
  v74.size.height = rect;
  v46 = v45 - CGRectGetWidth(v74) + -16.0;
  v47 = v61;
  v75.origin.x = v62;
  v75.origin.y = v40;
  v75.size.width = v61;
  v75.size.height = v63;
  v48 = CGRectGetWidth(v75);
  v49 = 0.0;
  if (v46 >= 0.0)
    v49 = v46;
  if (v48 > v46)
    v47 = v49;
  v50 = v65;
  if ((IsRTL & 1) == 0)
  {
    v76.origin.x = v66;
    v76.origin.y = v67;
    v76.size.width = v23;
    v76.size.height = v64;
    v51 = CGRectGetWidth(v76) - v68;
    v77.origin.x = v62;
    v77.origin.y = v40;
    v77.size.width = v47;
    v77.size.height = v63;
    v50 = v51 - CGRectGetWidth(v77);
  }
  -[UILabel setFrame:](self->_detailLabel, "setFrame:", v50, v40, v47, v63);
  -[NTKCSeparatorView frame](self->_separator, "frame");
  v53 = v52;
  v55 = v54;
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v56 = 0.0;
    if (IsRTL)
      v57 = 0.0;
    else
      v57 = v68;
    -[NTKCFaceDetailSectionHeaderView bounds](self, "bounds");
    v58 = CGRectGetWidth(v78) - v68;
  }
  else
  {
    -[NTKCFaceDetailSectionHeaderView bounds](self, "bounds");
    v58 = CGRectGetWidth(v79);
    -[NTKCFaceDetailSectionHeaderView bounds](self, "bounds");
    Height = CGRectGetHeight(v80);
    v57 = 0.0;
    v81.origin.x = 0.0;
    v81.origin.y = v53;
    v81.size.width = v58;
    v81.size.height = v55;
    v56 = Height - CGRectGetHeight(v81);
  }
  -[NTKCSeparatorView setFrame:](self->_separator, "setFrame:", v57, v56, v58, v55);
}

- (void)_updateConfig
{
  void *v3;
  UIListContentConfiguration *v4;
  UIListContentConfiguration *configuration;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  -[NTKCFaceDetailSectionHeaderView _traitCollectionAdjustedIfNeeded](self, "_traitCollectionAdjustedIfNeeded");
  v13 = (id)objc_claimAutoreleasedReturnValue();
  if ((_os_feature_enabled_impl() & 1) != 0)
  {
    v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F18]), "initWithTraitCollection:", v13);
    -[UIListContentConfiguration updatedConfigurationForState:](self->_configuration, "updatedConfigurationForState:", v3);
    v4 = (UIListContentConfiguration *)objc_claimAutoreleasedReturnValue();
    configuration = self->_configuration;
    self->_configuration = v4;

    -[UIListContentConfiguration textProperties](self->_configuration, "textProperties");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "font");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setFont:", v7);

  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4AD0], v13);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setFont:", v3);
  }

  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  BPSTextColor();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[NTKCFaceDetailSectionHeaderView textLabel](self, "textLabel");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setTextColor:", v10);

  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", *MEMORY[0x1E0DC4A88], v13);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setFont:](self->_detailLabel, "setFont:", v12);
  -[UILabel sizeToFit](self->_detailLabel, "sizeToFit");

}

- (id)_traitCollectionAdjustedIfNeeded
{
  void *v3;
  NSString *v4;
  uint64_t v5;
  void *v6;

  -[NTKCFaceDetailSectionHeaderView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "preferredContentSizeCategory");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();

  v5 = *MEMORY[0x1E0DC48D0];
  if (UIContentSizeCategoryCompareToCategory(v4, (UIContentSizeCategory)*MEMORY[0x1E0DC48D0]) == NSOrderedDescending)
    objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", v5);
  else
    -[NTKCFaceDetailSectionHeaderView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_separator, 0);
  objc_storeStrong((id *)&self->_detailLabel, 0);
}

@end

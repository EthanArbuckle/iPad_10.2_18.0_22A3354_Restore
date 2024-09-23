@implementation DOCLargeTagView

- (DOCLargeTagView)initWithFrame:(CGRect)a3
{
  DOCLargeTagView *v3;
  void *v4;
  DOCTagDotView *v5;
  DOCTagDotView *tagDotView;
  DOCTagCheckmarkView *v7;
  DOCTagCheckmarkView *checkmarkView;
  UILabel *v9;
  UILabel *tagNameLabel;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  objc_super v74;
  _QWORD v75[11];

  v75[9] = *MEMORY[0x24BDAC8D0];
  v74.receiver = self;
  v74.super_class = (Class)DOCLargeTagView;
  v3 = -[DOCLargeTagView initWithFrame:](&v74, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "cellCornerRadius");
    -[DOCLargeTagView _setContinuousCornerRadius:](v3, "_setContinuousCornerRadius:");

    -[DOCLargeTagView updateBackground](v3, "updateBackground");
    v5 = -[DOCTagDotView initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:]([DOCTagDotView alloc], "initWithDefaultTagDimension:adjustsSizeForContentSizeCategory:", 1, DOCDefaultTagDimension());
    tagDotView = v3->_tagDotView;
    v3->_tagDotView = v5;

    v7 = objc_alloc_init(DOCTagCheckmarkView);
    checkmarkView = v3->_checkmarkView;
    v3->_checkmarkView = v7;

    -[DOCTagCheckmarkView setTranslatesAutoresizingMaskIntoConstraints:](v3->_checkmarkView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[DOCTagCheckmarkView setHidden:](v3->_checkmarkView, "setHidden:", 1);
    v9 = (UILabel *)objc_alloc_init(MEMORY[0x24BEBD708]);
    tagNameLabel = v3->_tagNameLabel;
    v3->_tagNameLabel = v9;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v3->_tagNameLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v11 = (void *)MEMORY[0x24BEBB520];
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "titleTextStyle");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView traitCollection](v3, "traitCollection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "preferredFontForTextStyle:compatibleWithTraitCollection:", v13, v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v3->_tagNameLabel, "setFont:", v15);

    -[UILabel setAdjustsFontForContentSizeCategory:](v3->_tagNameLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[DOCLargeTagView tagDotView](v3, "tagDotView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView addSubview:](v3, "addSubview:", v16);

    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView addSubview:](v3, "addSubview:", v17);

    -[DOCLargeTagView checkmarkView](v3, "checkmarkView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView addSubview:](v3, "addSubview:", v18);

    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "cellInteriorLayoutMargins");
    -[DOCLargeTagView setDirectionalLayoutMargins:](v3, "setDirectionalLayoutMargins:");

    v55 = (void *)MEMORY[0x24BDD1628];
    -[DOCLargeTagView leadingAnchor](v3, "leadingAnchor");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagDotView](v3, "tagDotView");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v73, "leadingAnchor");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "spacing_leadingEdgeToDot");
    objc_msgSend(v72, "constraintEqualToAnchor:constant:", v70, -v20);
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    v75[0] = v69;
    -[DOCLargeTagView tagDotView](v3, "tagDotView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "trailingAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v67, "leadingAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v65, "spacing_dotToTitle");
    objc_msgSend(v66, "constraintEqualToAnchor:constant:", v64, -v21);
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    v75[1] = v63;
    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v62, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView checkmarkView](v3, "checkmarkView");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v61, "leadingAnchor");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "spacing_titleToCheckmark");
    objc_msgSend(v60, "constraintLessThanOrEqualToAnchor:constant:", v58, -v22);
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    v75[2] = v57;
    -[DOCLargeTagView checkmarkView](v3, "checkmarkView");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "trailingAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView trailingAnchor](v3, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "spacing_trailingEdgeToCheckmark");
    objc_msgSend(v54, "constraintEqualToAnchor:constant:", v52, -v23);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v75[3] = v51;
    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "firstBaselineAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "topAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v47, 0.979591837);
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    v75[4] = v46;
    -[DOCLargeTagView layoutMarginsGuide](v3, "layoutMarginsGuide");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v45, "bottomAnchor");
    v43 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "lastBaselineAnchor");
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v43, "constraintEqualToSystemSpacingBelowAnchor:multiplier:", v42, 1.12);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v75[5] = v41;
    -[DOCLargeTagView tagDotView](v3, "tagDotView");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v40, "centerYAnchor");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "centerYAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v38, "constraintEqualToAnchor:", v37);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v75[6] = v36;
    -[DOCLargeTagView checkmarkView](v3, "checkmarkView");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "centerYAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagNameLabel](v3, "tagNameLabel");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v75[7] = v26;
    -[DOCLargeTagView checkmarkView](v3, "checkmarkView");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "heightAnchor");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagDotView](v3, "tagDotView");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "heightAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "constraintLessThanOrEqualToAnchor:multiplier:", v30, 1.25);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v75[8] = v31;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v75, 9);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "activateConstraints:", v32);

  }
  return v3;
}

- (void)setTagValue:(id)a3
{
  DOCTag *v5;
  id *p_tagValue;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  DOCTag *v13;

  v5 = (DOCTag *)a3;
  p_tagValue = (id *)&self->_tagValue;
  if (self->_tagValue != v5)
  {
    v13 = v5;
    objc_storeStrong((id *)&self->_tagValue, a3);
    v7 = *p_tagValue;
    -[DOCLargeTagView tagDotView](self, "tagDotView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setItemTag:", v7);

    v9 = *p_tagValue;
    -[DOCLargeTagView checkmarkView](self, "checkmarkView");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setItemTag:", v9);

    objc_msgSend(*p_tagValue, "displayName");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagNameLabel](self, "tagNameLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setText:", v11);

    -[DOCLargeTagView updateBackground](self, "updateBackground");
    v5 = v13;
  }

}

- (void)setSelectionType:(int64_t)a3
{
  if (self->_selectionType != a3)
  {
    self->_selectionType = a3;
    -[DOCLargeTagView updateBackground](self, "updateBackground");
  }
}

- (void)updateBackground
{
  -[DOCLargeTagView _updateBackgroundColor](self, "_updateBackgroundColor");
  -[DOCLargeTagView _updateSelectionIndications](self, "_updateSelectionIndications");
}

- (void)_updateBackgroundColor
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = -[DOCLargeTagView selectionType](self, "selectionType");
  if (v3 == 2)
  {
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagValue](self, "tagValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    v6 = v4;
    v7 = 0;
LABEL_6:
    objc_msgSend(v5, "backgroundColorForTag:selected:", v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView setBackgroundColor:](self, "setBackgroundColor:", v8);

    return;
  }
  if (v3 != 1)
  {
    if (v3)
      return;
    +[DOCTagAppearance pickerList](DOCTagAppearance, "pickerList");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    -[DOCLargeTagView tagValue](self, "tagValue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v9;
    v6 = v4;
    v7 = 1;
    goto LABEL_6;
  }
  -[DOCLargeTagView setBackgroundColor:](self, "setBackgroundColor:", 0);
}

- (void)_updateSelectionIndications
{
  _BOOL8 v3;
  void *v4;
  void *v5;
  int64_t v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  id v11;
  id v12;

  v3 = -[DOCLargeTagView selectionType](self, "selectionType") == 2;
  -[DOCLargeTagView checkmarkView](self, "checkmarkView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", v3);

  +[DOCTagAppearance renderingAppearance](DOCTagAppearance, "renderingAppearance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v4) = objc_msgSend(v5, "outlineTagsToIndicateMixedState");

  v6 = -[DOCLargeTagView selectionType](self, "selectionType");
  if ((_DWORD)v4)
  {
    -[DOCLargeTagView tagDotView](self, "tagDotView");
    v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRenderedTagVariant:", v6 == 1);

  }
  else
  {
    -[DOCLargeTagView layer](self, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v7;
    if (v6 == 1)
    {
      objc_msgSend(v7, "setBorderWidth:", 2.0);

      -[DOCLargeTagView tagValue](self, "tagValue");
      v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "tagBackgroundColor");
      v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
      v9 = objc_msgSend(v8, "CGColor");
      -[DOCLargeTagView layer](self, "layer");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setBorderColor:", v9);

    }
    else
    {
      objc_msgSend(v7, "setBorderWidth:", 0.0);
    }

  }
}

- (void)layoutSubviews
{
  objc_super v3;

  -[DOCLargeTagView updateBackground](self, "updateBackground");
  v3.receiver = self;
  v3.super_class = (Class)DOCLargeTagView;
  -[DOCLargeTagView layoutSubviews](&v3, sel_layoutSubviews);
}

- (DOCTag)tagValue
{
  return self->_tagValue;
}

- (int64_t)selectionType
{
  return self->_selectionType;
}

- (DOCTagDotView)tagDotView
{
  return self->_tagDotView;
}

- (UILabel)tagNameLabel
{
  return self->_tagNameLabel;
}

- (DOCTagCheckmarkView)checkmarkView
{
  return self->_checkmarkView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_checkmarkView, 0);
  objc_storeStrong((id *)&self->_tagNameLabel, 0);
  objc_storeStrong((id *)&self->_tagDotView, 0);
  objc_storeStrong((id *)&self->_tagValue, 0);
}

@end

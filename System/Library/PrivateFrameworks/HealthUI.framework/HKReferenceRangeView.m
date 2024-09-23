@implementation HKReferenceRangeView

- (HKReferenceRangeView)initWithFrame:(CGRect)a3 configuration:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v10;
  HKReferenceRangeView *v11;
  HKReferenceRangeView *v12;
  NSString *multiValueSeparator;
  objc_super v15;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v10 = a4;
  v15.receiver = self;
  v15.super_class = (Class)HKReferenceRangeView;
  v11 = -[HKReferenceRangeView initWithFrame:](&v15, sel_initWithFrame_, x, y, width, height);
  v12 = v11;
  if (v11)
  {
    objc_storeStrong((id *)&v11->_configuration, a4);
    -[HKReferenceRangeView _setupSubviews](v12, "_setupSubviews");
    multiValueSeparator = v12->_multiValueSeparator;
    v12->_multiValueSeparator = (NSString *)CFSTR(" ");

  }
  return v12;
}

- (CGSize)intrinsicContentSize
{
  _BOOL4 v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  v3 = -[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange");
  v4 = 160.0;
  if (!v3)
    v4 = 1.79769313e308;
  -[HKReferenceRangeView sizeThatFits:](self, "sizeThatFits:", v4);
  result.height = v6;
  result.width = v5;
  return result;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double intrinsicHeight;
  uint64_t v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  void *v16;
  uint64_t v17;
  double v18;
  double v19;
  double v20;
  CGSize result;

  height = a3.height;
  width = a3.width;
  if (-[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange"))
  {
    intrinsicHeight = self->_intrinsicHeight;
    if (intrinsicHeight == 0.0)
    {
      -[HKReferenceRangeView layoutIfNeeded](self, "layoutIfNeeded");
      intrinsicHeight = self->_intrinsicHeight;
    }
    *(double *)&v7 = 160.0;
  }
  else
  {
    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "attributedText");
    v9 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v9, "boundingRectWithSize:options:context:", 1, 0, width, height);
    v11 = v10;
    -[HKReferenceRangeView valueLabelFont](self, "valueLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "lineHeight");
    v14 = v13 * 1.25;

    if (v14 < v11)
    {
      -[HKReferenceRangeView _generateMultilineAttributedValueStringForOriginalString:](self, "_generateMultilineAttributedValueStringForOriginalString:", v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "setAttributedText:", v15);

      objc_msgSend(v15, "boundingRectWithSize:options:context:", 1, 0, width, height);
      v9 = v15;
    }
    UICeilToViewScale();
    v7 = v17;
    UICeilToViewScale();
    intrinsicHeight = v18;

  }
  v19 = *(double *)&v7;
  v20 = intrinsicHeight;
  result.height = v20;
  result.width = v19;
  return result;
}

- (UIFont)dynamicTypeAnchorFont
{
  void *v3;
  UIFont *v4;
  UIFont *dynamicTypeAnchorFont;

  if (!self->_dynamicTypeAnchorFont)
  {
    -[HKReferenceRangeViewConfiguration dynamicTypeAnchorFont](self->_configuration, "dynamicTypeAnchorFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[HKReferenceRangeViewConfiguration dynamicTypeAnchorFont](self->_configuration, "dynamicTypeAnchorFont");
    else
      objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A88], 0);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    dynamicTypeAnchorFont = self->_dynamicTypeAnchorFont;
    self->_dynamicTypeAnchorFont = v4;

  }
  return self->_dynamicTypeAnchorFont;
}

- (id)valueLabelFont
{
  uint64_t v3;
  void *v4;
  _BOOL4 v5;
  UIFont *v6;
  uint64_t v7;
  void *v8;
  BOOL v9;
  UIFont *valueFont;

  if (!self->_valueFont)
  {
    -[HKReferenceRangeViewConfiguration currentValueValueFontWithRange](self->_configuration, "currentValueValueFontWithRange");
    v3 = objc_claimAutoreleasedReturnValue();
    if (v3
      && (v4 = (void *)v3,
          v5 = -[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange"),
          v4,
          v5))
    {
      -[HKReferenceRangeViewConfiguration currentValueValueFontWithRange](self->_configuration, "currentValueValueFontWithRange");
      v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      -[HKReferenceRangeViewConfiguration currentValueValueFontWithoutRange](self->_configuration, "currentValueValueFontWithoutRange");
      v7 = objc_claimAutoreleasedReturnValue();
      if (v7
        && (v8 = (void *)v7,
            v9 = -[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange"),
            v8,
            !v9))
      {
        -[HKReferenceRangeViewConfiguration currentValueValueFontWithoutRange](self->_configuration, "currentValueValueFontWithoutRange");
        v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        objc_msgSend(MEMORY[0x1E0DC1350], "hk_chrValueCellPrimaryFont");
        v6 = (UIFont *)objc_claimAutoreleasedReturnValue();
      }
    }
    valueFont = self->_valueFont;
    self->_valueFont = v6;

  }
  return self->_valueFont;
}

- (id)unitLabelFont
{
  void *v3;
  UIFont *v4;
  UIFont *unitFont;

  if (!self->_unitFont)
  {
    -[HKReferenceRangeViewConfiguration currentValueUnitFont](self->_configuration, "currentValueUnitFont");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    if (v3)
      -[HKReferenceRangeViewConfiguration currentValueUnitFont](self->_configuration, "currentValueUnitFont");
    else
      objc_msgSend(MEMORY[0x1E0DC1350], "_preferredFontForTextStyle:variant:", *MEMORY[0x1E0DC4B10], 1280);
    v4 = (UIFont *)objc_claimAutoreleasedReturnValue();
    unitFont = self->_unitFont;
    self->_unitFont = v4;

  }
  return self->_unitFont;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double MaxY;
  void *v6;
  double v7;
  double v8;
  objc_super v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  v9.receiver = self;
  v9.super_class = (Class)HKReferenceRangeView;
  -[HKReferenceRangeView layoutSubviews](&v9, sel_layoutSubviews);
  if (-[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange"))
  {
    -[HKReferenceRangeView _layoutFullReferenceRange](self, "_layoutFullReferenceRange");
    if (-[HKReferenceRangeViewConfiguration hideReferenceRangeValues](self->_configuration, "hideReferenceRangeValues"))
    {
      -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "frame");
      self->_intrinsicHeight = CGRectGetMaxY(v10);

    }
    else
    {
      -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "frame");
      MaxY = CGRectGetMaxY(v11);

      -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "frame");
      v7 = CGRectGetMaxY(v12);

      if (MaxY >= v7)
        v8 = MaxY;
      else
        v8 = v7;
      self->_intrinsicHeight = v8;
    }
  }
  else
  {
    -[HKReferenceRangeView _layoutCurrentValueOnly](self, "_layoutCurrentValueOnly");
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKReferenceRangeView;
  v4 = a3;
  -[HKReferenceRangeView traitCollectionDidChange:](&v8, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v8.receiver, v8.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKReferenceRangeView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5 != v7)
    -[HKReferenceRangeView _applyNormalizedValuesToView](self, "_applyNormalizedValuesToView");
}

- (void)_dynamicUserInterfaceTraitDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)HKReferenceRangeView;
  -[HKReferenceRangeView _dynamicUserInterfaceTraitDidChange](&v3, sel__dynamicUserInterfaceTraitDidChange);
  -[HKReferenceRangeView _updateContainerBorderColors](self, "_updateContainerBorderColors");
  -[HKReferenceRangeView _applyNormalizedValuesToView](self, "_applyNormalizedValuesToView");
}

- (void)_layoutFullReferenceRange
{
  _BOOL4 v3;
  double v4;
  double v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  _BOOL4 showOutOfRangeIndicator;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  uint64_t v38;
  void *v39;
  BOOL v40;
  UIView *referenceRangeContainerView;
  UIView *v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  void *v68;
  double MaxY;
  void *v70;
  double v71;
  double v72;
  double v73;
  double v74;
  double v75;
  double v76;
  double v77;
  double v78;
  double v79;
  double v80;
  void *v81;
  void *v82;
  void *v83;
  double v84;
  double v85;
  double v86;
  double v87;
  double v88;
  void *v89;
  double v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  double v98;
  double v99;
  void *v100;
  void *v101;
  void *v102;
  double v103;
  CGFloat v104;
  double v105;
  CGFloat v106;
  double v107;
  double v108;
  double v109;
  double v110;
  double v111;
  double v112;
  double v113;
  int64_t valueDirection;
  double v115;
  double v116;
  double v117;
  double v118;
  double v119;
  double v120;
  double v121;
  double v122;
  double v123;
  double v124;
  double v125;
  void *v126;
  double v127;
  double v128;
  CGFloat rect;
  CGFloat v130;
  double v131;
  double v132;
  id v133;
  CGRect v134;
  CGRect v135;
  CGRect v136;
  CGRect v137;
  CGRect v138;
  CGRect v139;
  CGRect v140;
  CGRect v141;

  if (self->_lowValueLabel)
    v3 = self->_highValueLabel != 0;
  else
    v3 = 0;
  -[HKReferenceRangeView bounds](self, "bounds");
  v5 = v4;
  -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "sizeToFit");

  -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "sizeToFit");

  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sizeToFit");

  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "sizeToFit");

  -[HKReferenceRangeViewConfiguration referenceRangeViewBorderColor](self->_configuration, "referenceRangeViewBorderColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  -[HKReferenceRangeView dynamicTypeAnchorFont](self, "dynamicTypeAnchorFont");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeViewConfiguration referenceRangeViewHeight](self->_configuration, "referenceRangeViewHeight");
  objc_msgSend(v11, "_scaledValueForValue:");
  UIRoundToViewScale();

  UIRoundToViewScale();
  v12 = 2.0;
  if (!v10)
    v12 = 1.5;
  v130 = v12;
  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "frame");
  CGRectGetHeight(v134);
  -[HKReferenceRangeViewConfiguration currentValueToReferenceValuePadding](self->_configuration, "currentValueToReferenceValuePadding");

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "frame");

  -[HKReferenceRangeViewConfiguration horizontalPadding](self->_configuration, "horizontalPadding");
  v15 = hk_rectRoundToViewScale(self);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setFrame:", v15, v17, v19, v21);

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "layer");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setCornerRadius:", v21 * 0.5);

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setHidden:", 0);

  showOutOfRangeIndicator = self->_showOutOfRangeIndicator;
  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = v27;
  v128 = v5;
  v131 = v17;
  v132 = v15;
  if (showOutOfRangeIndicator)
  {
    objc_msgSend(v27, "frame");
    v30 = v29;
    v32 = v31;

    if (self->_valueDirection)
      v33 = v15 + v19 + -7.5 - v30;
    else
      v33 = v15 + 7.5;
    -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "setFrame:", v33, v17 + (v21 - v32) * 0.5, v30, v32);

    -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v35, "setHidden:", 0);

    -[HKReferenceRangeView currentValueView](self, "currentValueView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = 1;
  }
  else
  {
    objc_msgSend(v27, "setHidden:", 1);

    -[HKReferenceRangeView currentValueView](self, "currentValueView");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = v36;
    v38 = 0;
  }
  objc_msgSend(v36, "setHidden:", v38);

  -[HKReferenceRangeView referenceRangeView](self, "referenceRangeView");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v39, "frame");

  if (self->_showOutOfRangeIndicator)
  {
    if (self->_valueDirection)
    {
      v40 = 0;
    }
    else
    {
      referenceRangeContainerView = self->_referenceRangeContainerView;
      -[UILabel frame](self->_outOfRangeLabel, "frame");
      -[UIView convertRect:fromView:](referenceRangeContainerView, "convertRect:fromView:", self);
      CGRectGetMaxX(v135);
      v40 = !self->_showOutOfRangeIndicator;
    }
  }
  else
  {
    v40 = 1;
  }
  if (!v40 && self->_valueDirection == 2)
  {
    v42 = self->_referenceRangeContainerView;
    -[UILabel frame](self->_outOfRangeLabel, "frame");
    -[UIView convertRect:fromView:](v42, "convertRect:fromView:", self);
    CGRectGetMinX(v136);
  }
  v43 = hk_rectRoundToViewScale(self);
  v45 = v44;
  v47 = v46;
  v49 = v48;
  -[HKReferenceRangeView referenceRangeView](self, "referenceRangeView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v50, "setFrame:", v43, v45, v47, v49);

  -[HKReferenceRangeView referenceRangeView](self, "referenceRangeView");
  v51 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v51, "layer");
  v52 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v52, "setCornerRadius:", v49 * 0.5);

  v127 = v43;
  v137.origin.x = v43;
  v137.origin.y = v45;
  rect = v47;
  v137.size.width = v47;
  v137.size.height = v49;
  CGRectInset(v137, v130, v130);
  UIRoundToViewScale();
  v53 = hk_rectRoundToViewScale(self);
  v55 = v54;
  v57 = v56;
  v59 = v58;
  -[HKReferenceRangeView currentValueView](self, "currentValueView");
  v60 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "setFrame:", v53, v55, v57, v59);

  -[HKReferenceRangeView currentValueView](self, "currentValueView");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v61, "layer");
  v62 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v62, "setCornerRadius:", v59 * 0.5);

  if (v3)
  {
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v63, "frame");
    v65 = v64;
    v67 = v66;

    -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v68, "frame");
    MaxY = CGRectGetMaxY(v138);
    -[HKReferenceRangeView dynamicTypeAnchorFont](self, "dynamicTypeAnchorFont");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeViewConfiguration referenceValueYOffset](self->_configuration, "referenceValueYOffset");
    objc_msgSend(v70, "_scaledValueForValue:");
    v72 = MaxY + v71;

    -[HKReferenceRangeView _assureLabelFrameWithinBounds:](self, "_assureLabelFrameWithinBounds:", v132 + v43, v72, v65, v67);
    v74 = v73;
    v76 = v75;
    v78 = v77;
    v80 = v79;
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v81 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v81, "setFrame:", v74, v76, v78, v80);

    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v82 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v82, "setHidden:", 0);

    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v83 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v83, "frame");
    v85 = v84;
    v87 = v86;

    v139.origin.x = v43;
    v139.origin.y = v45;
    v139.size.width = rect;
    v139.size.height = v49;
    v88 = v132 + CGRectGetMaxX(v139) - v85;
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v89 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v89, "frame");
    v91 = v90;

    -[HKReferenceRangeView _assureLabelFrameWithinBounds:](self, "_assureLabelFrameWithinBounds:", v88, v91, v85, v87);
    v93 = v92;
    v95 = v94;
    v97 = v96;
    v99 = v98;
    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v100 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v100, "setFrame:", v93, v95, v97, v99);

    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v101 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v101, "setHidden:", 0);

  }
  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel", *(_QWORD *)&v127);
  v102 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v102, "frame");
  v104 = v103;
  v106 = v105;
  v108 = v107;
  v110 = v109;

  v140.origin.x = v104;
  v140.origin.y = v106;
  v140.size.width = v108;
  v140.size.height = v110;
  v111 = v131 - CGRectGetHeight(v140);
  -[HKReferenceRangeViewConfiguration currentValueToReferenceValuePadding](self->_configuration, "currentValueToReferenceValuePadding");
  v113 = v111 - v112;
  valueDirection = self->_valueDirection;
  -[HKReferenceRangeViewConfiguration horizontalPadding](self->_configuration, "horizontalPadding");
  v116 = v115;
  if (valueDirection == 1)
  {
    v141.origin.x = v104;
    v141.origin.y = v113;
    v141.size.width = v108;
    v141.size.height = v110;
    CGRectGetWidth(v141);
    UIRoundToViewScale();
    if (v116 >= v117)
      v117 = v116;
  }
  else
  {
    v117 = v115 + 7.5;
    v108 = v128 + (v116 + 7.5) * -2.0;
  }
  -[HKReferenceRangeView _assureLabelFrameWithinBounds:](self, "_assureLabelFrameWithinBounds:", v117, v113, v108, v110);
  v119 = v118;
  v121 = v120;
  v123 = v122;
  v125 = v124;
  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v126 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v126, "setFrame:", v119, v121, v123, v125);

  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v133 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v133, "setHidden:", 0);

}

- (CGRect)_assureLabelFrameWithinBounds:(CGRect)a3
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGRect v12;
  CGRect v13;
  CGRect v14;
  CGRect result;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  v7 = fmax(a3.origin.x, 0.0);
  -[HKReferenceRangeView bounds](self, "bounds");
  CGRectGetWidth(v12);
  v13.origin.x = v7;
  v13.origin.y = y;
  v13.size.width = width;
  v13.size.height = height;
  CGRectGetWidth(v13);
  -[HKReferenceRangeView bounds](self, "bounds");
  CGRectGetWidth(v14);
  v8 = hk_rectRoundToViewScale(self);
  result.size.height = v11;
  result.size.width = v10;
  result.origin.y = v9;
  result.origin.x = v8;
  return result;
}

- (void)_layoutCurrentValueOnly
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;

  -[HKReferenceRangeView currentValueView](self, "currentValueView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setHidden:", 1);

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setHidden:", 1);

  -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHidden:", 1);

  -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setHidden:", 1);

  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setHidden:", 1);

  -[HKReferenceRangeView bounds](self, "bounds");
  v9 = v8;
  -[HKReferenceRangeView bounds](self, "bounds");
  v11 = v10;
  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setFrame:", 0.0, 0.0, v9, v11);

}

- (void)updateWithData:(id)a3
{
  -[HKReferenceRangeView setData:](self, "setData:", a3);
  -[HKReferenceRangeView setValueFont:](self, "setValueFont:", 0);
  -[HKReferenceRangeView setOverriddenValueFont:](self, "setOverriddenValueFont:", 0);
  -[HKReferenceRangeView _applyNormalizedValuesToView](self, "_applyNormalizedValuesToView");
}

- (BOOL)_hasReferenceRange
{
  void *v3;
  BOOL v4;
  void *v5;

  -[HKReferenceRangeViewData rangeLow](self->_data, "rangeLow");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = 1;
  }
  else
  {
    -[HKReferenceRangeViewData rangeHigh](self->_data, "rangeHigh");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v5 != 0;

  }
  return v4;
}

- (void)setMultiValueSeparator:(id)a3
{
  NSString *v4;
  NSString *multiValueSeparator;

  if (self->_multiValueSeparator != a3)
  {
    v4 = (NSString *)objc_msgSend(a3, "copy");
    multiValueSeparator = self->_multiValueSeparator;
    self->_multiValueSeparator = v4;

    -[HKReferenceRangeView _applyNormalizedValuesToView](self, "_applyNormalizedValuesToView");
  }
}

- (void)_updateContainerBorderColors
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  id v7;

  -[HKReferenceRangeViewConfiguration referenceRangeViewBorderColor](self->_configuration, "referenceRangeViewBorderColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[HKReferenceRangeViewConfiguration referenceRangeViewBorderColor](self->_configuration, "referenceRangeViewBorderColor");
    v7 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    v4 = objc_msgSend(v7, "CGColor");
    -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "layer");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setBorderColor:", v4);

  }
}

- (void)_setupSubviews
{
  id v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  HKReferenceRangeDotView *v18;
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
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  id v54;

  v3 = objc_alloc(MEMORY[0x1E0DC3F10]);
  v4 = *MEMORY[0x1E0C9D648];
  v5 = *(double *)(MEMORY[0x1E0C9D648] + 8);
  v6 = *(double *)(MEMORY[0x1E0C9D648] + 16);
  v7 = *(double *)(MEMORY[0x1E0C9D648] + 24);
  v8 = (void *)objc_msgSend(v3, "initWithFrame:", *MEMORY[0x1E0C9D648], v5, v6, v7);
  -[HKReferenceRangeView setReferenceRangeContainerView:](self, "setReferenceRangeContainerView:", v8);

  -[HKReferenceRangeViewConfiguration referenceRangeViewColor](self->_configuration, "referenceRangeViewColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "setBackgroundColor:", v9);

  -[HKReferenceRangeViewConfiguration referenceRangeViewBorderColor](self->_configuration, "referenceRangeViewBorderColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11)
    v12 = 1.0;
  else
    v12 = 0.0;
  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "layer");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setBorderWidth:", v12);

  -[HKReferenceRangeView _updateContainerBorderColors](self, "_updateContainerBorderColors");
  v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3F10]), "initWithFrame:", v4, v5, v6, v7);
  -[HKReferenceRangeView setReferenceRangeView:](self, "setReferenceRangeView:", v15);

  objc_msgSend(MEMORY[0x1E0DC3658], "opaqueSeparatorColor");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView referenceRangeView](self, "referenceRangeView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setBackgroundColor:", v16);

  v18 = -[HKReferenceRangeDotView initWithFrame:]([HKReferenceRangeDotView alloc], "initWithFrame:", v4, v5, v6, v7);
  -[HKReferenceRangeView setCurrentValueView:](self, "setCurrentValueView:", v18);

  if (!-[HKReferenceRangeViewConfiguration hideReferenceRangeValues](self->_configuration, "hideReferenceRangeValues"))
  {
    v19 = (void *)objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
    -[HKReferenceRangeView setLowValueLabel:](self, "setLowValueLabel:", v19);

    v20 = (void *)MEMORY[0x1E0DC1350];
    -[HKReferenceRangeViewConfiguration referenceRangeTextStyle](self->_configuration, "referenceRangeTextStyle");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "hk_preferredFontForTextStyle:symbolicTraits:", v21, 2);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setFont:", v22);

    -[HKReferenceRangeViewConfiguration referenceValueTextColor](self->_configuration, "referenceValueTextColor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setTextColor:", v24);

    v26 = (void *)objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
    -[HKReferenceRangeView setHighValueLabel:](self, "setHighValueLabel:", v26);

    v27 = (void *)MEMORY[0x1E0DC1350];
    -[HKReferenceRangeViewConfiguration referenceRangeTextStyle](self->_configuration, "referenceRangeTextStyle");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "hk_preferredFontForTextStyle:symbolicTraits:", v28, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "setFont:", v29);

    -[HKReferenceRangeViewConfiguration referenceValueTextColor](self->_configuration, "referenceValueTextColor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setTextColor:", v31);

  }
  v33 = (void *)objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
  -[HKReferenceRangeView setCurrentValueLabel:](self, "setCurrentValueLabel:", v33);

  -[HKReferenceRangeViewConfiguration currentValueTextColor](self->_configuration, "currentValueTextColor");
  v34 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v35, "setTextColor:", v34);

  v36 = (void *)objc_msgSend(objc_alloc(-[HKReferenceRangeViewConfiguration labelClass](self->_configuration, "labelClass")), "initWithFrame:", v4, v5, v6, v7);
  -[HKReferenceRangeView setOutOfRangeLabel:](self, "setOutOfRangeLabel:", v36);

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.HealthUI"));
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("RECORDS_OUT_OF_RANGE"), &stru_1E9C4C428, CFSTR("HealthUI-Localizable"));
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v38, "localizedUppercaseString");
  v39 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v40, "setText:", v39);

  objc_msgSend(MEMORY[0x1E0DC1350], "hk_preferredFontIgnoringAccessibilitySizeForTextStyle:symbolicTraits:", *MEMORY[0x1E0DC4A98], 2);
  v41 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v42 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v42, "setFont:", v41);

  -[HKReferenceRangeView _outOfRangeColor](self, "_outOfRangeColor");
  v43 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v44 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "setTextColor:", v43);

  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v45, "setHidden:", 1);

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView addSubview:](self, "addSubview:", v46);

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView referenceRangeView](self, "referenceRangeView");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v47, "addSubview:", v48);

  -[HKReferenceRangeView referenceRangeContainerView](self, "referenceRangeContainerView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView currentValueView](self, "currentValueView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v49, "addSubview:", v50);

  if (self->_lowValueLabel && self->_highValueLabel)
  {
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView addSubview:](self, "addSubview:", v51);

    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView addSubview:](self, "addSubview:", v52);

  }
  -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
  v53 = (void *)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView addSubview:](self, "addSubview:", v53);

  -[HKReferenceRangeView outOfRangeLabel](self, "outOfRangeLabel");
  v54 = (id)objc_claimAutoreleasedReturnValue();
  -[HKReferenceRangeView addSubview:](self, "addSubview:", v54);

}

- (void)_normalizeValuesIfNeeded
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  void *v10;
  double v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  int64_t valueDirection;
  double v21;
  double v22;
  double v23;

  if (-[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange"))
  {
    -[HKReferenceRangeViewData rangeLow](self->_data, "rangeLow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKReferenceRangeViewData rangeHigh](self->_data, "rangeHigh");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    -[HKReferenceRangeViewData value](self->_data, "value");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "doubleValue");
    v7 = v6;
    v8 = v6;

    v9 = v8;
    if (v3)
    {
      -[HKReferenceRangeViewData rangeLow](self->_data, "rangeLow");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "doubleValue");
      v9 = v11;

    }
    if (v4)
    {
      -[HKReferenceRangeViewData rangeHigh](self->_data, "rangeHigh");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "doubleValue");
      v8 = v13;

    }
    self->_lowValueXPosition = 0.25;
    self->_highValueXPosition = 0.75;
    if (!v3)
    {
      self->_lowValueXPosition = 0.0;
      v14 = vabdd_f64(v8, v7);
      v9 = v14 <= 2.22044605e-16 ? v8 + -1.0 : v8 + v14 * -2.0;
      if (v8 - v7 >= 2.22044605e-16)
      {
        v19 = self->_highValueXPosition * 0.5;
        goto LABEL_31;
      }
    }
    if (!v4)
    {
      self->_highValueXPosition = 1.0;
      v15 = vabdd_f64(v9, v7);
      v8 = v15 <= 2.22044605e-16 ? v9 + 1.0 : v9 + v15 * 2.0;
      if (v7 - v9 >= 2.22044605e-16)
      {
        v19 = self->_lowValueXPosition + (1.0 - self->_lowValueXPosition) * 0.5;
        goto LABEL_31;
      }
    }
    if (v8 >= v7)
      v16 = v8;
    else
      v16 = v7;
    if (v9 >= v7)
      v17 = v7;
    else
      v17 = v9;
    v18 = v8 - v9;
    if (HKUIEqualDoubles(v16 - v17, v18))
    {
      v19 = self->_lowValueXPosition + (v7 - v9) / v18 * 0.5;
LABEL_31:
      self->_currentValueXPosition = v19;
      self->_valueDirection = 1;
      self->_showOutOfRangeIndicator = 0;
      return;
    }
    self->_valueDirection = 2 * (v7 >= v9);
    self->_showOutOfRangeIndicator = 1;
    valueDirection = self->_valueDirection;
    if (valueDirection == 2)
    {
      v22 = 0.5;
      if (v3)
      {
        if (-[HKReferenceRangeViewConfiguration hideReferenceRangeValues](self->_configuration, "hideReferenceRangeValues"))
        {
          self->_lowValueXPosition = 0.0;
        }
        else
        {
          v23 = self->_lowValueXPosition + -0.1;
          self->_lowValueXPosition = 0.1;
          v22 = self->_highValueXPosition - v23;
        }
      }
      self->_highValueXPosition = v22;
      self->_currentValueXPosition = 0.0;
    }
    else if (!valueDirection)
    {
      if (v4)
      {
        if (-[HKReferenceRangeViewConfiguration hideReferenceRangeValues](self->_configuration, "hideReferenceRangeValues"))
        {
          self->_lowValueXPosition = 0.5;
          v21 = 1.0;
        }
        else
        {
          self->_lowValueXPosition = self->_lowValueXPosition + self->_lowValueXPosition + -0.1;
          v21 = 0.9;
        }
        self->_highValueXPosition = v21;
      }
      else
      {
        self->_lowValueXPosition = 0.5;
      }
      self->_currentValueXPosition = 1.0;
    }
  }
}

- (void)_applyNormalizedValuesToView
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int64_t valueDirection;
  void *v9;
  uint64_t v10;
  int64_t v11;
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
  id v23;

  if (-[HKReferenceRangeView _hasReferenceRange](self, "_hasReferenceRange"))
  {
    -[HKReferenceRangeView _normalizeValuesIfNeeded](self, "_normalizeValuesIfNeeded");
    -[HKReferenceRangeViewData rangeLowString](self->_data, "rangeLowString");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView lowValueLabel](self, "lowValueLabel");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setText:", v3);

    -[HKReferenceRangeViewData rangeHighString](self->_data, "rangeHighString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView highValueLabel](self, "highValueLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setText:", v5);

    if (self->_valueDirection == 1)
    {
      -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "setTextAlignment:", 4);
      v23 = 0;
    }
    else
    {
      -[HKReferenceRangeView _outOfRangeColor](self, "_outOfRangeColor");
      v23 = (id)objc_claimAutoreleasedReturnValue();
      valueDirection = self->_valueDirection;
      -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v7 = v9;
      if (valueDirection)
        v10 = 2;
      else
        v10 = 0;
      objc_msgSend(v9, "setTextAlignment:", v10);
    }

    -[HKReferenceRangeViewConfiguration currentValueTextColor](self->_configuration, "currentValueTextColor");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView currentValueView](self, "currentValueView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setDotColor:", v17);

    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setNumberOfLines:", 1);

    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "setLineBreakMode:", 4);

    -[HKReferenceRangeView _generateAttributedValueStringWithOverrideColor:](self, "_generateAttributedValueStringWithOverrideColor:", v23);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setAttributedText:", v21);

    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "sizeToFit");
  }
  else
  {
    if (-[HKReferenceRangeViewData useOutOfRangeValueColor](self->_data, "useOutOfRangeValueColor"))
    {
      -[HKReferenceRangeView _outOfRangeColor](self, "_outOfRangeColor");
      v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v23 = 0;
    }
    v11 = -[HKReferenceRangeViewConfiguration currentValueNumLinesIfNoRange](self->_configuration, "currentValueNumLinesIfNoRange");
    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setNumberOfLines:", v11);

    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setTextAlignment:", 4);

    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setLineBreakMode:", 0);

    -[HKReferenceRangeView _generateAttributedValueStringWithOverrideColor:](self, "_generateAttributedValueStringWithOverrideColor:", v23);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView currentValueLabel](self, "currentValueLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setAttributedText:", v15);

  }
  -[HKReferenceRangeView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[HKReferenceRangeView setNeedsLayout](self, "setNeedsLayout");

}

- (id)_generateAttributedValueStringWithOverrideColor:(id)a3
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;
  _QWORD *v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD *v13;
  void *v14;
  void *v15;
  void *v16;
  unint64_t v17;
  id v18;
  _QWORD *v19;
  void *v20;
  void *v21;
  id v22;
  uint64_t v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v34;
  _QWORD v35[2];
  _QWORD v36[2];
  _QWORD v37[3];
  _QWORD v38[3];
  _QWORD v39[2];
  _QWORD v40[3];

  v40[2] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  -[HKReferenceRangeViewData valueString](self->_data, "valueString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "length");
  v8 = (_QWORD *)MEMORY[0x1E0DC1138];
  v9 = (_QWORD *)MEMORY[0x1E0DC1140];
  if (v7)
  {
    if (v4)
    {
      v10 = v4;
    }
    else
    {
      -[HKReferenceRangeViewConfiguration currentValueTextColor](self->_configuration, "currentValueTextColor");
      v10 = (id)objc_claimAutoreleasedReturnValue();
    }
    v11 = v10;
    v39[0] = *v8;
    -[HKReferenceRangeView valueLabelFont](self, "valueLabelFont");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v39[1] = *v9;
    v40[0] = v12;
    v40[1] = v11;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v40, v39, 2);
    v13 = v9;
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v6, v14);
    objc_msgSend(v5, "addObject:", v15);

    v9 = v13;
  }
  -[HKReferenceRangeViewData unitString](self->_data, "unitString");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v16, "length"))
  {
    v34 = v6;
    if (v4)
    {
      v17 = 0x1E0CB3000;
      v18 = v4;
    }
    else
    {
      v19 = v9;
      -[HKReferenceRangeViewConfiguration currentValueUnitTextColor](self->_configuration, "currentValueUnitTextColor");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v21 = v20;
      if (v20)
      {
        v22 = v20;
      }
      else
      {
        -[HKReferenceRangeViewConfiguration currentValueTextColor](self->_configuration, "currentValueTextColor");
        v22 = (id)objc_claimAutoreleasedReturnValue();
      }
      v18 = v22;
      v17 = 0x1E0CB3000uLL;

      v9 = v19;
    }
    v37[0] = *v8;
    v23 = v37[0];
    -[HKReferenceRangeView unitLabelFont](self, "unitLabelFont");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = *v9;
    v38[0] = v24;
    v38[1] = v18;
    v26 = *MEMORY[0x1E0DC1150];
    v37[1] = v25;
    v37[2] = v26;
    v38[2] = &unk_1E9CED4C8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v38, v37, 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = (void *)objc_msgSend(objc_alloc(*(Class *)(v17 + 1176)), "initWithString:attributes:", CFSTR(" "), v27);
    objc_msgSend(v5, "addObject:", v28);
    v35[0] = v23;
    -[HKReferenceRangeView unitLabelFont](self, "unitLabelFont");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v35[1] = v25;
    v36[0] = v29;
    v36[1] = v18;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, v35, 2);
    v30 = (void *)objc_claimAutoreleasedReturnValue();

    v31 = (void *)objc_msgSend(objc_alloc(*(Class *)(v17 + 1176)), "initWithString:attributes:", v16, v30);
    objc_msgSend(v5, "addObject:", v31);

    v6 = v34;
  }
  if (objc_msgSend(v5, "count"))
  {
    HKUIJoinAttributedStringsForLocale(v5);
    v32 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v32 = 0;
  }

  return v32;
}

- (id)_generateMultilineAttributedValueStringForOriginalString:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = v4;
  if (self->_overriddenValueFont)
  {
    v6 = v4;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeView setOverriddenValueFont:](self, "setOverriddenValueFont:", v7);
    v6 = (id)objc_msgSend(v5, "mutableCopy");
    v10 = *MEMORY[0x1E0DC1138];
    v11[0] = v7;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setAttributes:range:", v8, 0, objc_msgSend(v5, "length"));

  }
  return v6;
}

- (id)_configuredPreferredFontForTextStyle:(id)a3 symbolicTraits:(unsigned int)a4
{
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "fontDescriptor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "fontDescriptorWithSymbolicTraits:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(v5, "pointSize");
  objc_msgSend(v8, "fontWithDescriptor:size:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)_outOfRangeColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
}

- (HKReferenceRangeViewConfiguration)configuration
{
  return self->_configuration;
}

- (NSString)multiValueSeparator
{
  return self->_multiValueSeparator;
}

- (HKReferenceRangeViewData)data
{
  return self->_data;
}

- (void)setData:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 480);
}

- (UIView)referenceRangeView
{
  return self->_referenceRangeView;
}

- (void)setReferenceRangeView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceRangeView, a3);
}

- (UIView)referenceRangeContainerView
{
  return self->_referenceRangeContainerView;
}

- (void)setReferenceRangeContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_referenceRangeContainerView, a3);
}

- (HKReferenceRangeDotView)currentValueView
{
  return self->_currentValueView;
}

- (void)setCurrentValueView:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueView, a3);
}

- (UILabel)lowValueLabel
{
  return self->_lowValueLabel;
}

- (void)setLowValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_lowValueLabel, a3);
}

- (UILabel)highValueLabel
{
  return self->_highValueLabel;
}

- (void)setHighValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_highValueLabel, a3);
}

- (UILabel)currentValueLabel
{
  return self->_currentValueLabel;
}

- (void)setCurrentValueLabel:(id)a3
{
  objc_storeStrong((id *)&self->_currentValueLabel, a3);
}

- (void)setDynamicTypeAnchorFont:(id)a3
{
  objc_storeStrong((id *)&self->_dynamicTypeAnchorFont, a3);
}

- (UIFont)valueFont
{
  return self->_valueFont;
}

- (void)setValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_valueFont, a3);
}

- (UIFont)overriddenValueFont
{
  return self->_overriddenValueFont;
}

- (void)setOverriddenValueFont:(id)a3
{
  objc_storeStrong((id *)&self->_overriddenValueFont, a3);
}

- (UIFont)unitFont
{
  return self->_unitFont;
}

- (void)setUnitFont:(id)a3
{
  objc_storeStrong((id *)&self->_unitFont, a3);
}

- (UILabel)outOfRangeLabel
{
  return self->_outOfRangeLabel;
}

- (void)setOutOfRangeLabel:(id)a3
{
  objc_storeStrong((id *)&self->_outOfRangeLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outOfRangeLabel, 0);
  objc_storeStrong((id *)&self->_unitFont, 0);
  objc_storeStrong((id *)&self->_overriddenValueFont, 0);
  objc_storeStrong((id *)&self->_valueFont, 0);
  objc_storeStrong((id *)&self->_dynamicTypeAnchorFont, 0);
  objc_storeStrong((id *)&self->_currentValueLabel, 0);
  objc_storeStrong((id *)&self->_highValueLabel, 0);
  objc_storeStrong((id *)&self->_lowValueLabel, 0);
  objc_storeStrong((id *)&self->_currentValueView, 0);
  objc_storeStrong((id *)&self->_referenceRangeContainerView, 0);
  objc_storeStrong((id *)&self->_referenceRangeView, 0);
  objc_storeStrong((id *)&self->_data, 0);
  objc_storeStrong((id *)&self->_multiValueSeparator, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

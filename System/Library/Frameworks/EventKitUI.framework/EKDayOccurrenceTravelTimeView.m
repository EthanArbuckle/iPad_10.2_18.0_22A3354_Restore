@implementation EKDayOccurrenceTravelTimeView

+ (void)initialize
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  _QWORD v8[6];

  v8[5] = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_opt_new();
  v3 = (void *)objc_opt_new();
  v4 = (void *)objc_opt_new();
  v5 = (void *)objc_opt_new();
  v8[0] = v4;
  v8[1] = v4;
  v8[2] = v2;
  v8[3] = v3;
  v8[4] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 5);
  v6 = objc_claimAutoreleasedReturnValue();
  v7 = (void *)s_iconCache;
  s_iconCache = v6;

}

- (EKDayOccurrenceTravelTimeView)initWithFrame:(CGRect)a3
{
  EKDayOccurrenceTravelTimeView *v3;
  EKDayOccurrenceTravelTimeView *v4;
  DottedLineView *v5;
  UIView *colorBarView;
  uint64_t v7;
  UIImageView *travelTimeIcon;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UILabel *v16;
  UILabel *travelTimeLabel;
  void *v18;
  double v19;
  UIView *v20;
  UIView *horizontalLineView;
  void *v22;
  void *v23;
  uint64_t v24;
  NSLayoutConstraint *travelTimeLabelToTrailingEdgeConstraint;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  void *v30;
  void *v31;
  double v32;
  double v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
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
  objc_super v71;
  _QWORD v72[15];

  v72[13] = *MEMORY[0x1E0C80C00];
  v71.receiver = self;
  v71.super_class = (Class)EKDayOccurrenceTravelTimeView;
  v3 = -[EKDayOccurrenceTravelTimeView initWithFrame:](&v71, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[EKDayOccurrenceTravelTimeView setOpaque:](v3, "setOpaque:", 0);
    -[EKDayOccurrenceTravelTimeView setUserInteractionEnabled:](v4, "setUserInteractionEnabled:", 0);
    -[EKDayOccurrenceTravelTimeView setContentMode:](v4, "setContentMode:", 3);
    v5 = objc_alloc_init(DottedLineView);
    colorBarView = v4->_colorBarView;
    v4->_colorBarView = &v5->super;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_colorBarView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKDayOccurrenceTravelTimeView addSubview:](v4, "addSubview:", v4->_colorBarView);
    v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3890]), "initWithImage:", 0);
    travelTimeIcon = v4->_travelTimeIcon;
    v4->_travelTimeIcon = (UIImageView *)v7;

    v9 = (void *)MEMORY[0x1E0DC3888];
    -[EKDayOccurrenceTravelTimeView _textFont](v4, "_textFont");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "configurationWithFont:", v10);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](v4->_travelTimeIcon, "setPreferredSymbolConfiguration:", v11);

    -[UIImageView setTranslatesAutoresizingMaskIntoConstraints:](v4->_travelTimeIcon, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v12) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_travelTimeIcon, "setContentCompressionResistancePriority:forAxis:", 0, v12);
    LODWORD(v13) = 1148846080;
    -[UIImageView setContentCompressionResistancePriority:forAxis:](v4->_travelTimeIcon, "setContentCompressionResistancePriority:forAxis:", 1, v13);
    LODWORD(v14) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_travelTimeIcon, "setContentHuggingPriority:forAxis:", 0, v14);
    LODWORD(v15) = 1148846080;
    -[UIImageView setContentHuggingPriority:forAxis:](v4->_travelTimeIcon, "setContentHuggingPriority:forAxis:", 1, v15);
    -[UIImageView setAlpha:](v4->_travelTimeIcon, "setAlpha:", 0.0);
    -[EKDayOccurrenceTravelTimeView addSubview:](v4, "addSubview:", v4->_travelTimeIcon);
    v16 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    travelTimeLabel = v4->_travelTimeLabel;
    v4->_travelTimeLabel = v16;

    -[EKDayOccurrenceTravelTimeView _textFont](v4, "_textFont");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v4->_travelTimeLabel, "setFont:", v18);

    -[UILabel setNumberOfLines:](v4->_travelTimeLabel, "setNumberOfLines:", 0);
    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v4->_travelTimeLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    LODWORD(v19) = 1148846080;
    -[UILabel setContentCompressionResistancePriority:forAxis:](v4->_travelTimeLabel, "setContentCompressionResistancePriority:forAxis:", 1, v19);
    -[UILabel setAlpha:](v4->_travelTimeLabel, "setAlpha:", 0.0);
    -[EKDayOccurrenceTravelTimeView addSubview:](v4, "addSubview:", v4->_travelTimeLabel);
    v20 = (UIView *)objc_alloc_init(MEMORY[0x1E0DC3F10]);
    horizontalLineView = v4->_horizontalLineView;
    v4->_horizontalLineView = v20;

    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v4->_horizontalLineView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[EKDayOccurrenceTravelTimeView addSubview:](v4, "addSubview:", v4->_horizontalLineView);
    -[EKDayOccurrenceTravelTimeView trailingAnchor](v4, "trailingAnchor");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel trailingAnchor](v4->_travelTimeLabel, "trailingAnchor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    objc_msgSend(v22, "constraintEqualToAnchor:constant:", v23);
    v24 = objc_claimAutoreleasedReturnValue();
    travelTimeLabelToTrailingEdgeConstraint = v4->_travelTimeLabelToTrailingEdgeConstraint;
    v4->_travelTimeLabelToTrailingEdgeConstraint = (NSLayoutConstraint *)v24;

    -[EKDayOccurrenceTravelTimeView bottomAnchor](v4, "bottomAnchor");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel bottomAnchor](v4->_travelTimeLabel, "bottomAnchor");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    objc_msgSend(v26, "constraintGreaterThanOrEqualToAnchor:constant:", v27);
    v28 = (void *)objc_claimAutoreleasedReturnValue();

    v57 = v28;
    LODWORD(v29) = 1144750080;
    objc_msgSend(v28, "setPriority:", v29);
    -[UIView bottomAnchor](v4->_colorBarView, "bottomAnchor");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView bottomAnchor](v4, "bottomAnchor");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    objc_msgSend(v30, "constraintEqualToAnchor:constant:", v31, -v32);
    v70 = (void *)objc_claimAutoreleasedReturnValue();

    LODWORD(v33) = 1144750080;
    objc_msgSend(v70, "setPriority:", v33);
    v59 = (void *)MEMORY[0x1E0CB3718];
    v72[0] = v70;
    -[UIView leadingAnchor](v4->_colorBarView, "leadingAnchor");
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView leadingAnchor](v4, "leadingAnchor");
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    objc_msgSend(v69, "constraintEqualToAnchor:constant:", v68);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    v72[1] = v67;
    -[UIView widthAnchor](v4->_colorBarView, "widthAnchor");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
    objc_msgSend(v66, "constraintEqualToConstant:");
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    v72[2] = v65;
    -[UIView topAnchor](v4->_colorBarView, "topAnchor");
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView topAnchor](v4, "topAnchor");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    objc_msgSend(v64, "constraintEqualToAnchor:constant:", v63);
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    v72[3] = v62;
    -[UIImageView leadingAnchor](v4->_travelTimeIcon, "leadingAnchor");
    v61 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView trailingAnchor](v4->_colorBarView, "trailingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
    objc_msgSend(v61, "constraintEqualToAnchor:constant:", v60);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v72[4] = v58;
    -[UIImageView topAnchor](v4->_travelTimeIcon, "topAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIView topAnchor](v4->_colorBarView, "topAnchor");
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "constraintEqualToAnchor:", v55);
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v72[5] = v54;
    -[UILabel leadingAnchor](v4->_travelTimeLabel, "leadingAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView trailingAnchor](v4->_travelTimeIcon, "trailingAnchor");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "constraintEqualToAnchor:constant:", v52, 3.0);
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    v72[6] = v51;
    -[UILabel topAnchor](v4->_travelTimeLabel, "topAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView colorBarView](v4, "colorBarView");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "topAnchor");
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "constraintEqualToAnchor:", v48);
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    v72[7] = v47;
    v72[8] = v28;
    -[UIView leadingAnchor](v4->_horizontalLineView, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView leadingAnchor](v4, "leadingAnchor");
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v46, "constraintEqualToAnchor:", v45);
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    v72[9] = v44;
    -[UIView trailingAnchor](v4->_horizontalLineView, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView trailingAnchor](v4, "trailingAnchor");
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "constraintEqualToAnchor:", v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v72[10] = v36;
    -[UIView heightAnchor](v4->_horizontalLineView, "heightAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    CalRoundToScreenScale(0.5);
    objc_msgSend(v37, "constraintEqualToConstant:");
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v72[11] = v38;
    -[UIView bottomAnchor](v4->_horizontalLineView, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView bottomAnchor](v4, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v72[12] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v72, 13);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v59, "activateConstraints:", v42);

  }
  return v4;
}

- (EKDayOccurrenceTravelTimeView)initWithReusableTravelTimeView:(id)a3
{
  id v4;
  EKDayOccurrenceTravelTimeView *v5;
  void *v6;
  void *v7;

  v4 = a3;
  objc_msgSend(v4, "frame");
  v5 = -[EKDayOccurrenceTravelTimeView initWithFrame:](self, "initWithFrame:");
  if (v5)
  {
    objc_msgSend(v4, "elementColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView setElementColor:](v5, "setElementColor:", v6);

    objc_msgSend(v4, "lineColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKDayOccurrenceTravelTimeView setLineColor:](v5, "setLineColor:", v7);

    -[EKDayOccurrenceTravelTimeView setRoutingMode:](v5, "setRoutingMode:", objc_msgSend(v4, "routingMode"));
  }

  return v5;
}

- (id)_textFont
{
  return (id)objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrenceSecondaryTextFont");
}

- (NSAttributedString)travelTimeString
{
  return -[UILabel attributedText](self->_travelTimeLabel, "attributedText");
}

- (void)setTravelTimeString:(id)a3
{
  -[UILabel setAttributedText:](self->_travelTimeLabel, "setAttributedText:", a3);
}

+ (double)minimumNaturalHeightForPrimaryTextUsingSmallText:(BOOL)a3 sizeClass:(int64_t)a4
{
  void *v4;
  double v5;
  double v6;

  objc_msgSend(MEMORY[0x1E0D0CD98], "defaultOccurrenceSecondaryTextFont", a3, a4);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "lineHeight");
  v6 = v5;

  return v6;
}

- (void)_updateStringsColorsAndConstraintConstants
{
  void *v3;

  -[UIView setBackgroundColor:](self->_horizontalLineView, "setBackgroundColor:", self->_lineColor);
  -[UILabel setTextColor:](self->_travelTimeLabel, "setTextColor:", self->_elementColor);
  -[EKDayOccurrenceTravelTimeView _travelTimeIconForTravelModeWithColor:](self, "_travelTimeIconForTravelModeWithColor:", self->_elementColor);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setImage:](self->_travelTimeIcon, "setImage:", v3);

  -[UIView setBackgroundColor:](self->_colorBarView, "setBackgroundColor:", self->_colorBarColor);
  -[EKDayOccurrenceTravelTimeView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setElementColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_elementColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_elementColor, a3);
    -[EKDayOccurrenceTravelTimeView _updateStringsColorsAndConstraintConstants](self, "_updateStringsColorsAndConstraintConstants");
    v5 = v6;
  }

}

- (void)setColorBarColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_colorBarColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_colorBarColor, a3);
    -[EKDayOccurrenceTravelTimeView _updateStringsColorsAndConstraintConstants](self, "_updateStringsColorsAndConstraintConstants");
    v5 = v6;
  }

}

- (void)setLineColor:(id)a3
{
  UIColor *v5;
  UIColor *v6;

  v5 = (UIColor *)a3;
  if (self->_lineColor != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_lineColor, a3);
    -[EKDayOccurrenceTravelTimeView _updateStringsColorsAndConstraintConstants](self, "_updateStringsColorsAndConstraintConstants");
    v5 = v6;
  }

}

- (void)setRoutingMode:(int64_t)a3
{
  if (self->_routingMode != a3)
  {
    self->_routingMode = a3;
    -[EKDayOccurrenceTravelTimeView _updateStringsColorsAndConstraintConstants](self, "_updateStringsColorsAndConstraintConstants");
  }
}

- (id)_travelTimeIconForTravelModeWithColor:(id)a3
{
  id v4;
  int64_t routingMode;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = a3;
  if (self->_routingMode == -1)
    routingMode = 0;
  else
    routingMode = self->_routingMode;
  objc_msgSend((id)s_iconCache, "objectAtIndexedSubscript:", routingMode);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v8 = 0;
  }
  else
  {
    switch(routingMode)
    {
      case -1:
      case 0:
      case 1:
        CarImage_Occurrences();
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 2:
        WalkmanImage_Occurrences();
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 3:
        TransitImage_Occurrences();
        v9 = objc_claimAutoreleasedReturnValue();
        goto LABEL_12;
      case 4:
        BicycleImage_Occurrences();
        v9 = objc_claimAutoreleasedReturnValue();
LABEL_12:
        v8 = (void *)v9;
        break;
      default:
        v8 = 0;
        break;
    }
    objc_msgSend(v8, "imageWithTintColor:renderingMode:", v4, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      objc_msgSend((id)s_iconCache, "objectAtIndexedSubscript:", routingMode);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setObject:forKey:", v7, v4);

    }
  }

  return v7;
}

- (double)alphaForElements
{
  double Height;
  double v4;
  double v5;
  CGFloat v6;
  BOOL v7;
  double result;
  CGRect v9;
  CGRect v10;
  CGRect v11;

  -[UIImageView frame](self->_travelTimeIcon, "frame");
  Height = CGRectGetHeight(v9);
  -[UILabel frame](self->_travelTimeLabel, "frame");
  v4 = CGRectGetHeight(v10);
  if (Height < v4)
    Height = v4;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  v6 = Height + v5;
  -[EKDayOccurrenceTravelTimeView bounds](self, "bounds");
  v7 = v6 <= CGRectGetHeight(v11);
  result = 1.0;
  if (!v7)
    return 0.0;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double Width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  BOOL v14;
  uint64_t v15;
  uint64_t v16;
  _QWORD v17[6];
  _QWORD v18[6];
  objc_super v19;
  CGRect v20;

  -[UIImageView intrinsicContentSize](self->_travelTimeIcon, "intrinsicContentSize");
  v4 = v3;
  -[EKDayOccurrenceTravelTimeView bounds](self, "bounds");
  Width = CGRectGetWidth(v20);
  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  v7 = v6;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "colorBarThickness");
  v9 = v7 + v8;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  v11 = v4 + v9 + v10 + 3.0;
  objc_msgSend(MEMORY[0x1E0D0CDA0], "occurrencePadding");
  v13 = v12 + v11;
  -[NSLayoutConstraint setActive:](self->_travelTimeLabelToTrailingEdgeConstraint, "setActive:", Width >= v13);
  v19.receiver = self;
  v19.super_class = (Class)EKDayOccurrenceTravelTimeView;
  -[EKDayOccurrenceTravelTimeView layoutSubviews](&v19, sel_layoutSubviews);
  v14 = Width < v13;
  v15 = 0;
  if (!v14)
  {
    -[EKDayOccurrenceTravelTimeView alphaForElements](self, "alphaForElements");
    v15 = v16;
  }
  if (!-[EKDayOccurrenceTravelTimeView animatingAlpha](self, "animatingAlpha"))
  {
    -[EKDayOccurrenceTravelTimeView setAnimatingAlpha:](self, "setAnimatingAlpha:", 1);
    v18[0] = MEMORY[0x1E0C809B0];
    v18[1] = 3221225472;
    v18[2] = __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke;
    v18[3] = &unk_1E6018FC8;
    v18[4] = self;
    v18[5] = v15;
    v17[0] = MEMORY[0x1E0C809B0];
    v17[1] = 3221225472;
    v17[2] = __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke_2;
    v17[3] = &unk_1E6018FF0;
    v17[4] = self;
    v17[5] = v15;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 0x20000, v18, v17, 0.200000003, 0.0);
  }
}

uint64_t __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 456), "setAlpha:", *(double *)(a1 + 40));
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 464), "setAlpha:", *(double *)(a1 + 40));
}

uint64_t __47__EKDayOccurrenceTravelTimeView_layoutSubviews__block_invoke_2(uint64_t a1)
{
  double v2;
  uint64_t result;
  double v4;

  objc_msgSend(*(id *)(a1 + 32), "setAnimatingAlpha:", 0);
  v2 = *(double *)(a1 + 40);
  result = objc_msgSend(*(id *)(a1 + 32), "alphaForElements");
  if (v2 != v4)
    return objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return result;
}

- (UIColor)elementColor
{
  return self->_elementColor;
}

- (UIColor)lineColor
{
  return self->_lineColor;
}

- (UIColor)colorBarColor
{
  return self->_colorBarColor;
}

- (int64_t)routingMode
{
  return self->_routingMode;
}

- (UIImageView)travelTimeIcon
{
  return (UIImageView *)objc_getProperty(self, a2, 456, 1);
}

- (void)setTravelTimeIcon:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 456);
}

- (UILabel)travelTimeLabel
{
  return (UILabel *)objc_getProperty(self, a2, 464, 1);
}

- (void)setTravelTimeLabel:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 464);
}

- (UIView)horizontalLineView
{
  return (UIView *)objc_getProperty(self, a2, 472, 1);
}

- (void)setHorizontalLineView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 472);
}

- (UIView)colorBarView
{
  return (UIView *)objc_getProperty(self, a2, 480, 1);
}

- (void)setColorBarView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 480);
}

- (NSLayoutConstraint)travelTimeLabelToTrailingEdgeConstraint
{
  return (NSLayoutConstraint *)objc_getProperty(self, a2, 488, 1);
}

- (void)setTravelTimeLabelToTrailingEdgeConstraint:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 488);
}

- (BOOL)animatingAlpha
{
  return self->_animatingAlpha;
}

- (void)setAnimatingAlpha:(BOOL)a3
{
  self->_animatingAlpha = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_travelTimeLabelToTrailingEdgeConstraint, 0);
  objc_storeStrong((id *)&self->_colorBarView, 0);
  objc_storeStrong((id *)&self->_horizontalLineView, 0);
  objc_storeStrong((id *)&self->_travelTimeLabel, 0);
  objc_storeStrong((id *)&self->_travelTimeIcon, 0);
  objc_storeStrong((id *)&self->_colorBarColor, 0);
  objc_storeStrong((id *)&self->_lineColor, 0);
  objc_storeStrong((id *)&self->_elementColor, 0);
}

@end

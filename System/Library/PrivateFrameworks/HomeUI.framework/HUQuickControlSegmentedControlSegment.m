@implementation HUQuickControlSegmentedControlSegment

+ (id)selectedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 0.3);
}

+ (id)highlightedColor
{
  return (id)objc_msgSend(MEMORY[0x1E0CEA478], "colorWithWhite:alpha:", 0.5, 0.1);
}

+ (double)borderInset
{
  return 1.0;
}

- (HUQuickControlSegmentedControlSegment)initWithFrame:(CGRect)a3
{
  HUQuickControlSegmentedControlSegment *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  double v15;
  void *v16;
  double v17;
  void *v18;
  double v19;
  objc_super v21;

  v21.receiver = self;
  v21.super_class = (Class)HUQuickControlSegmentedControlSegment;
  v3 = -[HUQuickControlSegmentedControlSegment initWithFrame:](&v21, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_alloc_init(MEMORY[0x1E0CEA700]);
    -[HUQuickControlSegmentedControlSegment setTitleLabel:](v3, "setTitleLabel:", v4);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setTextAlignment:", 1);

    objc_msgSend(MEMORY[0x1E0CEA478], "systemGrayColor");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setTextColor:", v7);

    HUPillButtonTitleFont();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setFont:", v9);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[HUQuickControlSegmentedControlSegment addSubview:](v3, "addSubview:", v11);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v13) = 1148846080;
    objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v13);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v15) = 1148846080;
    objc_msgSend(v14, "setContentHuggingPriority:forAxis:", 1, v15);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v17) = 1148846080;
    objc_msgSend(v16, "setContentCompressionResistancePriority:forAxis:", 0, v17);

    -[HUQuickControlSegmentedControlSegment titleLabel](v3, "titleLabel");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v19) = 1148846080;
    objc_msgSend(v18, "setContentCompressionResistancePriority:forAxis:", 1, v19);

    -[HUQuickControlSegmentedControlSegment _setupConstraints](v3, "_setupConstraints");
  }
  return v3;
}

- (NSString)title
{
  void *v2;
  void *v3;

  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setTitle:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

}

- (void)setHighlighted:(BOOL)a3
{
  self->_highlighted = a3;
  -[HUQuickControlSegmentedControlSegment _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setSelected:(BOOL)a3
{
  self->_selected = a3;
  -[HUQuickControlSegmentedControlSegment _updateBackgroundColor](self, "_updateBackgroundColor");
}

- (void)setRoundedCorners:(unint64_t)a3
{
  unint64_t v4;
  void *v5;

  if (self->_roundedCorners != a3)
  {
    self->_roundedCorners = a3;
    v4 = a3 & 0xF;
    -[HUQuickControlSegmentedControlSegment layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setMaskedCorners:", v4);

    -[HUQuickControlSegmentedControlSegment setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateBackgroundColor
{
  uint64_t v3;
  id v4;

  if (-[HUQuickControlSegmentedControlSegment isSelected](self, "isSelected"))
  {
    objc_msgSend((id)objc_opt_class(), "selectedColor");
    v3 = objc_claimAutoreleasedReturnValue();
LABEL_5:
    v4 = (id)v3;
    -[HUQuickControlSegmentedControlSegment setBackgroundColor:](self, "setBackgroundColor:", v3);

    return;
  }
  if (-[HUQuickControlSegmentedControlSegment isHighlighted](self, "isHighlighted"))
  {
    objc_msgSend((id)objc_opt_class(), "highlightedColor");
    v3 = objc_claimAutoreleasedReturnValue();
    goto LABEL_5;
  }
  -[HUQuickControlSegmentedControlSegment setBackgroundColor:](self, "setBackgroundColor:", 0);
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
  double v10;
  void *v11;
  double v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  double v20;
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
  id v32;

  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v32 = (id)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "centerXAnchor");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment centerXAnchor](self, "centerXAnchor");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "constraintEqualToAnchor:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v6);

  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "firstBaselineAnchor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment topAnchor](self, "topAnchor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "borderInset");
  objc_msgSend(v8, "constraintEqualToAnchor:constant:", v9, 20.0 - v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v12) = 1144750080;
  objc_msgSend(v11, "setPriority:", v12);
  objc_msgSend(v32, "addObject:", v11);
  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "topAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment topAnchor](self, "topAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintGreaterThanOrEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v16);

  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "lastBaselineAnchor");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment bottomAnchor](self, "bottomAnchor");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)objc_opt_class(), "borderInset");
  objc_msgSend(v18, "constraintEqualToAnchor:constant:", v19, -(10.0 - v20));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v21);

  -[HUQuickControlSegmentedControlSegment widthAnchor](self, "widthAnchor");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "widthAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "constraintEqualToAnchor:constant:", v24, 32.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v25);

  -[HUQuickControlSegmentedControlSegment titleLabel](self, "titleLabel");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "centerXAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  -[HUQuickControlSegmentedControlSegment centerXAnchor](self, "centerXAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "constraintEqualToAnchor:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v29);

  -[HUQuickControlSegmentedControlSegment widthAnchor](self, "widthAnchor");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "constraintGreaterThanOrEqualToConstant:", 114.0);
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "addObject:", v31);

  objc_msgSend(MEMORY[0x1E0CB3718], "activateConstraints:", v32);
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HUQuickControlSegmentedControlSegment;
  -[HUQuickControlSegmentedControlSegment layoutSubviews](&v6, sel_layoutSubviews);
  if (-[HUQuickControlSegmentedControlSegment roundedCorners](self, "roundedCorners"))
  {
    -[HUQuickControlSegmentedControlSegment bounds](self, "bounds");
    v4 = v3 * 0.5;
    -[HUQuickControlSegmentedControlSegment layer](self, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setCornerRadius:", v4);

  }
}

- (BOOL)isHighlighted
{
  return self->_highlighted;
}

- (BOOL)isSelected
{
  return self->_selected;
}

- (unint64_t)roundedCorners
{
  return self->_roundedCorners;
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_titleLabel, 0);
}

@end

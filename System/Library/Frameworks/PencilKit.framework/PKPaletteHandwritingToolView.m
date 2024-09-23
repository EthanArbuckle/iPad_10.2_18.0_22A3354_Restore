@implementation PKPaletteHandwritingToolView

- (PKPaletteHandwritingToolView)init
{
  void *v3;
  PKPaletteHandwritingToolView *v4;

  +[PKToolConfiguration defaultConfigurationForToolWithIdentifier:](PKToolConfiguration, "defaultConfigurationForToolWithIdentifier:", CFSTR("com.apple.ink.handwriting"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[PKPaletteHandwritingToolView initWithToolIdentifier:variant:configuration:](self, "initWithToolIdentifier:variant:configuration:", CFSTR("com.apple.ink.handwriting"), 0, v3);

  return v4;
}

- (PKPaletteHandwritingToolView)initWithToolIdentifier:(id)a3 variant:(id)a4 configuration:(id)a5
{
  PKPaletteHandwritingToolView *v5;
  PKPaletteHandwritingToolView *v6;
  NSString *localeIdentifier;
  UILabel *v8;
  UILabel *toolLabel;
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
  uint64_t v22;
  NSLayoutConstraint *toolLabelCenterXConstraint;
  void *v24;
  void *v25;
  uint64_t v26;
  NSLayoutConstraint *toolLabelCenterYConstraint;
  void *v28;
  void *v29;
  objc_super v31;
  _QWORD v32[2];
  uint64_t v33;
  void *v34;
  uint64_t v35;
  _QWORD v36[2];

  v36[1] = *MEMORY[0x1E0C80C00];
  v31.receiver = self;
  v31.super_class = (Class)PKPaletteHandwritingToolView;
  v5 = -[PKPaletteToolView initWithToolIdentifier:variant:configuration:](&v31, sel_initWithToolIdentifier_variant_configuration_, a3, a4, a5);
  v6 = v5;
  if (v5)
  {
    localeIdentifier = v5->_localeIdentifier;
    v5->_localeIdentifier = (NSString *)CFSTR("en");

    v6->_needsUpdateTitleLabel = 1;
    v8 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    toolLabel = v6->_toolLabel;
    v6->_toolLabel = v8;

    objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4A88]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "fontDescriptor");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = *MEMORY[0x1E0DC1458];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *MEMORY[0x1E0DC1448]);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v36[0] = v12;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v36, &v35, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = *MEMORY[0x1E0DC13C0];
    v34 = v13;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v34, &v33, 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "fontDescriptorByAddingAttributes:", v14);
    v15 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v15, "fontDescriptorWithDesign:", *MEMORY[0x1E0DC13A8]);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

    v17 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(v10, "pointSize");
    objc_msgSend(v17, "fontWithDescriptor:size:", v16);
    v18 = (void *)objc_claimAutoreleasedReturnValue();

    -[UILabel setFont:](v6->_toolLabel, "setFont:", v18);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_toolLabel, "setTextColor:", v19);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_toolLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKPaletteHandwritingToolView addSubview:](v6, "addSubview:", v6->_toolLabel);
    -[UILabel centerXAnchor](v6->_toolLabel, "centerXAnchor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHandwritingToolView centerXAnchor](v6, "centerXAnchor");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "constraintEqualToAnchor:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    toolLabelCenterXConstraint = v6->_toolLabelCenterXConstraint;
    v6->_toolLabelCenterXConstraint = (NSLayoutConstraint *)v22;

    -[UILabel centerYAnchor](v6->_toolLabel, "centerYAnchor");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHandwritingToolView centerYAnchor](v6, "centerYAnchor");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "constraintEqualToAnchor:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    toolLabelCenterYConstraint = v6->_toolLabelCenterYConstraint;
    v6->_toolLabelCenterYConstraint = (NSLayoutConstraint *)v26;

    v28 = (void *)MEMORY[0x1E0CB3718];
    v32[0] = v6->_toolLabelCenterXConstraint;
    v32[1] = v6->_toolLabelCenterYConstraint;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v32, 2);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "activateConstraints:", v29);

    -[PKPaletteHandwritingToolView setEdgeLocation:](v6, "setEdgeLocation:", 4);
    -[PKPaletteHandwritingToolView _updateUI](v6, "_updateUI");
  }
  return v6;
}

- (void)_updateUI
{
  void *v3;
  void *v4;
  void *v5;
  _OWORD v6[6];

  -[PKPaletteHandwritingToolView _toolLabelImageViewTransform](self, "_toolLabelImageViewTransform");
  -[PKPaletteHandwritingToolView toolLabel](self, "toolLabel");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = v6[3];
  v6[1] = v6[4];
  v6[2] = v6[5];
  objc_msgSend(v3, "setTransform:", v6);

  if (-[PKPaletteHandwritingToolView needsUpdateTitleLabel](self, "needsUpdateTitleLabel"))
  {
    -[PKPaletteHandwritingToolView _toolLabelText](self, "_toolLabelText");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[PKPaletteHandwritingToolView toolLabel](self, "toolLabel");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setText:", v4);

    -[PKPaletteHandwritingToolView setNeedsUpdateTitleLabel:](self, "setNeedsUpdateTitleLabel:", 0);
  }
}

- (id)_toolLabelText
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHandwritingToolView localeIdentifier](self, "localeIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:localization:", CFSTR("HANDWRITING_TOOL_TEXT_LABEL"), CFSTR("HANDWRITING_TOOL_TEXT_LABEL"), CFSTR("PencilKit"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v5, "isEqualToString:", CFSTR("HANDWRITING_TOOL_TEXT_LABEL")))
  {
    objc_msgSend(v3, "localizedStringForKey:value:table:localization:", CFSTR("HANDWRITING_TOOL_TEXT_LABEL"), CFSTR("HANDWRITING_TOOL_TEXT_LABEL"), CFSTR("PencilKit"), CFSTR("en"));
    v6 = objc_claimAutoreleasedReturnValue();

    v5 = (void *)v6;
  }

  return v5;
}

- (CGAffineTransform)_toolLabelImageViewTransform
{
  uint64_t v5;
  CGFloat v6;
  __int128 v7;
  double v8;
  CGFloat v9;
  __int128 v10;
  CGFloat v11;
  CGAffineTransform *result;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CGAffineTransform v17;
  CGAffineTransform v18;

  v5 = MEMORY[0x1E0C9BAA8];
  v15 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v16 = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->a = *MEMORY[0x1E0C9BAA8];
  *(_OWORD *)&retstr->c = v15;
  v14 = *(_OWORD *)(v5 + 32);
  *(_OWORD *)&retstr->tx = v14;
  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    *(_OWORD *)&v18.a = v16;
    *(_OWORD *)&v18.c = v15;
    *(_OWORD *)&v18.tx = v14;
    v6 = 1.57079633;
LABEL_5:
    CGAffineTransformRotate(retstr, &v18, v6);
    goto LABEL_6;
  }
  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
  {
    v7 = *(_OWORD *)&retstr->c;
    *(_OWORD *)&v18.a = *(_OWORD *)&retstr->a;
    *(_OWORD *)&v18.c = v7;
    *(_OWORD *)&v18.tx = *(_OWORD *)&retstr->tx;
    v6 = -1.57079633;
    goto LABEL_5;
  }
LABEL_6:
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v9 = v8;
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v10 = *(_OWORD *)&retstr->c;
  *(_OWORD *)&v17.a = *(_OWORD *)&retstr->a;
  *(_OWORD *)&v17.c = v10;
  *(_OWORD *)&v17.tx = *(_OWORD *)&retstr->tx;
  result = CGAffineTransformScale(&v18, &v17, v9, v11);
  v13 = *(_OWORD *)&v18.c;
  *(_OWORD *)&retstr->a = *(_OWORD *)&v18.a;
  *(_OWORD *)&retstr->c = v13;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&v18.tx;
  return result;
}

- (void)updateConstraints
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  void *v8;
  objc_super v9;

  -[PKPaletteHandwritingToolView _toolLabelCenterOffset](self, "_toolLabelCenterOffset");
  v4 = v3;
  v6 = v5;
  -[PKPaletteHandwritingToolView toolLabelCenterXConstraint](self, "toolLabelCenterXConstraint");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setConstant:", v4);

  -[PKPaletteHandwritingToolView toolLabelCenterYConstraint](self, "toolLabelCenterYConstraint");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setConstant:", v6);

  v9.receiver = self;
  v9.super_class = (Class)PKPaletteHandwritingToolView;
  -[PKPaletteToolView updateConstraints](&v9, sel_updateConstraints);
}

- (CGPoint)_toolLabelCenterOffset
{
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  double v7;
  double v8;
  id overrideLabelCenterOffsetYHandler;
  BOOL v10;
  __n128 v11;
  double v12;
  double v13;
  double v14;
  double v15;
  CGPoint result;

  -[PKPaletteHandwritingToolView traitCollection](self, "traitCollection");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[PKPaletteHandwritingToolView window](self, "window");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "windowScene");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = PKUseCompactSize(v3, v5);

  if (v6)
  {
    if (-[PKPaletteHandwritingToolView isSelected](self, "isSelected"))
      v7 = 4.0;
    else
      v7 = 14.0;
    v8 = 0.25;
    goto LABEL_22;
  }
  overrideLabelCenterOffsetYHandler = self->__overrideLabelCenterOffsetYHandler;
  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 2)
  {
    v10 = -[PKPaletteHandwritingToolView isSelected](self, "isSelected") == 0;
    v11.n128_u64[0] = -24.0;
    v12 = -4.0;
LABEL_10:
    if (v10)
      v8 = v11.n128_f64[0];
    else
      v8 = v12;
    if (overrideLabelCenterOffsetYHandler)
      v7 = (*((double (**)(__n128))self->__overrideLabelCenterOffsetYHandler + 2))(v11);
    else
      v7 = 0.0;
    goto LABEL_22;
  }
  if (-[PKPaletteToolView edgeLocation](self, "edgeLocation") == 8)
  {
    v10 = -[PKPaletteHandwritingToolView isSelected](self, "isSelected") == 0;
    v11.n128_u64[0] = 24.0;
    v12 = 4.0;
    goto LABEL_10;
  }
  if (overrideLabelCenterOffsetYHandler)
  {
    v7 = (*((double (**)(void))self->__overrideLabelCenterOffsetYHandler + 2))();
  }
  else if (-[PKPaletteHandwritingToolView isSelected](self, "isSelected"))
  {
    v7 = 4.0;
  }
  else
  {
    v7 = 24.0;
  }
  v8 = 0.0;
LABEL_22:
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v14 = v7 * v13;
  v15 = v8 * v13;
  result.y = v14;
  result.x = v15;
  return result;
}

- (void)setScalingFactor:(double)a3
{
  double v5;
  double v6;
  double v7;
  objc_super v8;

  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  v6 = v5;
  v8.receiver = self;
  v8.super_class = (Class)PKPaletteHandwritingToolView;
  -[PKPaletteToolView setScalingFactor:](&v8, sel_setScalingFactor_, a3);
  -[PKPaletteToolView scalingFactor](self, "scalingFactor");
  if (v6 != v7 && vabdd_f64(v6, v7) >= fabs(v7 * 0.000000999999997))
  {
    -[PKPaletteHandwritingToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PKPaletteHandwritingToolView _updateUI](self, "_updateUI");
  }
}

- (void)setEdgeLocation:(unint64_t)a3
{
  unint64_t v5;
  objc_super v6;

  v5 = -[PKPaletteToolView edgeLocation](self, "edgeLocation");
  v6.receiver = self;
  v6.super_class = (Class)PKPaletteHandwritingToolView;
  -[PKPaletteToolView setEdgeLocation:](&v6, sel_setEdgeLocation_, a3);
  if (v5 != -[PKPaletteToolView edgeLocation](self, "edgeLocation"))
  {
    -[PKPaletteHandwritingToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
    -[PKPaletteHandwritingToolView _updateUI](self, "_updateUI");
  }
}

- (void)setLocaleIdentifier:(id)a3
{
  NSString *v4;
  NSString *localeIdentifier;
  id v6;

  v6 = a3;
  if (!-[NSString isEqualToString:](self->_localeIdentifier, "isEqualToString:"))
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    localeIdentifier = self->_localeIdentifier;
    self->_localeIdentifier = v4;

    -[PKPaletteHandwritingToolView setNeedsUpdateTitleLabel:](self, "setNeedsUpdateTitleLabel:", 1);
    -[PKPaletteHandwritingToolView _updateUI](self, "_updateUI");
  }

}

- (void)_setOverrideLabelCenterOffsetYHandler:(id)a3
{
  void *v4;
  id overrideLabelCenterOffsetYHandler;

  if (self->__overrideLabelCenterOffsetYHandler != a3)
  {
    v4 = (void *)objc_msgSend(a3, "copy");
    overrideLabelCenterOffsetYHandler = self->__overrideLabelCenterOffsetYHandler;
    self->__overrideLabelCenterOffsetYHandler = v4;

    -[PKPaletteHandwritingToolView setNeedsUpdateConstraints](self, "setNeedsUpdateConstraints");
  }
}

- (NSString)localeIdentifier
{
  return self->_localeIdentifier;
}

- (UILabel)toolLabel
{
  return self->_toolLabel;
}

- (void)setToolLabel:(id)a3
{
  objc_storeStrong((id *)&self->_toolLabel, a3);
}

- (NSLayoutConstraint)toolLabelCenterXConstraint
{
  return self->_toolLabelCenterXConstraint;
}

- (void)setToolLabelCenterXConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolLabelCenterXConstraint, a3);
}

- (NSLayoutConstraint)toolLabelCenterYConstraint
{
  return self->_toolLabelCenterYConstraint;
}

- (void)setToolLabelCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_toolLabelCenterYConstraint, a3);
}

- (BOOL)needsUpdateTitleLabel
{
  return self->_needsUpdateTitleLabel;
}

- (void)setNeedsUpdateTitleLabel:(BOOL)a3
{
  self->_needsUpdateTitleLabel = a3;
}

- (id)_overrideLabelCenterOffsetYHandler
{
  return self->__overrideLabelCenterOffsetYHandler;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->__overrideLabelCenterOffsetYHandler, 0);
  objc_storeStrong((id *)&self->_toolLabelCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_toolLabelCenterXConstraint, 0);
  objc_storeStrong((id *)&self->_toolLabel, 0);
  objc_storeStrong((id *)&self->_localeIdentifier, 0);
}

@end

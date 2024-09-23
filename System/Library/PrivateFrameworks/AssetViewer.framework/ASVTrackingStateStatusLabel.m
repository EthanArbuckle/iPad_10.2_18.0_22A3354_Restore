@implementation ASVTrackingStateStatusLabel

- (ASVTrackingStateStatusLabel)initWithFrame:(CGRect)a3 controlStyle:(int64_t)a4
{
  ASVTrackingStateStatusLabel *v5;
  ASVTrackingStateStatusLabel *v6;
  ASVBlurredBackgroundView *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  uint64_t v12;
  ASVBlurredBackgroundView *blurredBackgroundView;
  uint64_t v14;
  UILabel *label;
  double v16;
  double v17;
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
  double v31;
  uint64_t v32;
  NSLayoutConstraint *viewWidthConstraint;
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
  objc_super v61;
  _QWORD v62[10];

  v62[8] = *MEMORY[0x1E0C80C00];
  v61.receiver = self;
  v61.super_class = (Class)ASVTrackingStateStatusLabel;
  v5 = -[ASVTrackingStateStatusLabel initWithFrame:](&v61, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v6 = v5;
  if (v5)
  {
    -[ASVTrackingStateStatusLabel setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v7 = [ASVBlurredBackgroundView alloc];
    v8 = *MEMORY[0x1E0C9D648];
    v9 = *(double *)(MEMORY[0x1E0C9D648] + 8);
    v10 = *(double *)(MEMORY[0x1E0C9D648] + 16);
    v11 = *(double *)(MEMORY[0x1E0C9D648] + 24);
    v12 = -[ASVBlurredBackgroundView initWithFrame:backgroundStyle:controlStyle:](v7, "initWithFrame:backgroundStyle:controlStyle:", 0, a4, *MEMORY[0x1E0C9D648], v9, v10, v11);
    blurredBackgroundView = v6->_blurredBackgroundView;
    v6->_blurredBackgroundView = (ASVBlurredBackgroundView *)v12;

    -[ASVBlurredBackgroundView setTranslatesAutoresizingMaskIntoConstraints:](v6->_blurredBackgroundView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[ASVTrackingStateStatusLabel addSubview:](v6, "addSubview:", v6->_blurredBackgroundView);
    v14 = objc_msgSend(objc_alloc(MEMORY[0x1E0DC3990]), "initWithFrame:", v8, v9, v10, v11);
    label = v6->_label;
    v6->_label = (UILabel *)v14;

    -[UILabel setContentMode:](v6->_label, "setContentMode:", 7);
    LODWORD(v16) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_label, "setContentHuggingPriority:forAxis:", 0, v16);
    LODWORD(v17) = 1132134400;
    -[UILabel setContentHuggingPriority:forAxis:](v6->_label, "setContentHuggingPriority:forAxis:", 1, v17);
    -[UILabel setTextAlignment:](v6->_label, "setTextAlignment:", 1);
    -[UILabel setLineBreakMode:](v6->_label, "setLineBreakMode:", 4);
    -[UILabel setNumberOfLines:](v6->_label, "setNumberOfLines:", 1);
    v18 = (void *)MEMORY[0x1E0DC1350];
    objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "fontDescriptor");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "fontDescriptorWithSymbolicTraits:", 2);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "fontWithDescriptor:size:", v21, 0.0);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_label, "setFont:", v22);

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v6->_label, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[UILabel setAdjustsFontForContentSizeCategory:](v6->_label, "setAdjustsFontForContentSizeCategory:", 1);
    -[UILabel setAdjustsFontSizeToFitWidth:](v6->_label, "setAdjustsFontSizeToFitWidth:", 1);
    if (a4 == 2)
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "colorWithRed:green:blue:alpha:", 0.0, 0.0, 0.0, 0.7);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v6->_label, "setBackgroundColor:", v23);

      objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[UILabel setBackgroundColor:](v6->_label, "setBackgroundColor:", v24);

      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    }
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v6->_label, "setTextColor:", v25);

    -[ASVTrackingStateStatusLabel addSubview:](v6, "addSubview:", v6->_label);
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleWithIdentifier:", CFSTR("com.apple.AssetViewer"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("LOW_DETAIL"), &stru_1E9F16B58, 0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel label](v6, "label");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setText:", v27);

    -[ASVTrackingStateStatusLabel widthAnchor](v6, "widthAnchor");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel label](v6, "label");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "intrinsicContentSize");
    objc_msgSend(v29, "constraintEqualToConstant:", v31 + 36.0);
    v32 = objc_claimAutoreleasedReturnValue();
    viewWidthConstraint = v6->_viewWidthConstraint;
    v6->_viewWidthConstraint = (NSLayoutConstraint *)v32;

    -[NSLayoutConstraint setActive:](v6->_viewWidthConstraint, "setActive:", 1);
    v51 = (void *)MEMORY[0x1E0CB3718];
    -[ASVBlurredBackgroundView leadingAnchor](v6->_blurredBackgroundView, "leadingAnchor");
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel leadingAnchor](v6, "leadingAnchor");
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v60, "constraintEqualToAnchor:", v59);
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    v62[0] = v58;
    -[ASVBlurredBackgroundView trailingAnchor](v6->_blurredBackgroundView, "trailingAnchor");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel trailingAnchor](v6, "trailingAnchor");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "constraintEqualToAnchor:", v56);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    v62[1] = v55;
    -[ASVBlurredBackgroundView topAnchor](v6->_blurredBackgroundView, "topAnchor");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel topAnchor](v6, "topAnchor");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "constraintEqualToAnchor:", v53);
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    v62[2] = v52;
    -[ASVBlurredBackgroundView bottomAnchor](v6->_blurredBackgroundView, "bottomAnchor");
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel bottomAnchor](v6, "bottomAnchor");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "constraintEqualToAnchor:", v49);
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v62[3] = v48;
    -[UILabel leadingAnchor](v6->_label, "leadingAnchor");
    v47 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel leadingAnchor](v6, "leadingAnchor");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v47, "constraintEqualToAnchor:", v46);
    v45 = (void *)objc_claimAutoreleasedReturnValue();
    v62[4] = v45;
    -[UILabel trailingAnchor](v6->_label, "trailingAnchor");
    v44 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel trailingAnchor](v6, "trailingAnchor");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "constraintEqualToAnchor:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    v62[5] = v35;
    -[UILabel topAnchor](v6->_label, "topAnchor");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel topAnchor](v6, "topAnchor");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "constraintEqualToAnchor:", v37);
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    v62[6] = v38;
    -[UILabel bottomAnchor](v6->_label, "bottomAnchor");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    -[ASVTrackingStateStatusLabel bottomAnchor](v6, "bottomAnchor");
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "constraintEqualToAnchor:", v40);
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v62[7] = v41;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v62, 8);
    v42 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "activateConstraints:", v42);

    -[ASVTrackingStateStatusLabel _setContinuousCornerRadius:](v6, "_setContinuousCornerRadius:", 15.0);
    -[ASVTrackingStateStatusLabel setClipsToBounds:](v6, "setClipsToBounds:", 1);
  }
  return v6;
}

- (void)setText:(id)a3
{
  id v4;
  void *v5;
  double v6;
  id v7;

  v4 = a3;
  -[ASVTrackingStateStatusLabel label](self, "label");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setText:", v4);

  -[ASVTrackingStateStatusLabel label](self, "label");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "intrinsicContentSize");
  -[NSLayoutConstraint setConstant:](self->_viewWidthConstraint, "setConstant:", v6 + 36.0);

}

- (NSString)text
{
  void *v2;
  void *v3;

  -[ASVTrackingStateStatusLabel label](self, "label");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "text");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setControlStyle:(int64_t)a3
{
  id v4;

  if (self->_controlStyle != a3)
  {
    self->_controlStyle = a3;
    -[ASVTrackingStateStatusLabel blurredBackgroundView](self, "blurredBackgroundView");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setControlStyle:", a3);

  }
}

- (int64_t)controlStyle
{
  return self->_controlStyle;
}

- (UILabel)label
{
  return self->_label;
}

- (void)setLabel:(id)a3
{
  objc_storeStrong((id *)&self->_label, a3);
}

- (ASVBlurredBackgroundView)blurredBackgroundView
{
  return self->_blurredBackgroundView;
}

- (void)setBlurredBackgroundView:(id)a3
{
  objc_storeStrong((id *)&self->_blurredBackgroundView, a3);
}

- (NSLayoutConstraint)viewWidthConstraint
{
  return self->_viewWidthConstraint;
}

- (void)setViewWidthConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_viewWidthConstraint, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_viewWidthConstraint, 0);
  objc_storeStrong((id *)&self->_blurredBackgroundView, 0);
  objc_storeStrong((id *)&self->_label, 0);
}

@end

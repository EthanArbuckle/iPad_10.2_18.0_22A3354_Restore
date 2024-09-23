@implementation SRTapToEditView

- (SRTapToEditView)initWithFrame:(CGRect)a3
{
  SRTapToEditView *v3;
  uint64_t v4;
  SRTapToEditView *v5;
  double v6;
  uint64_t v7;
  void *v8;
  UILabel *v9;
  UILabel *tapToEditLabel;
  UILabel *v11;
  void *v12;
  UILabel *v13;
  void *v14;
  UILabel *v15;
  void *v16;
  uint64_t v17;
  double v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  SiriUIContentButton *circleButton;
  uint64_t v25;
  double v26;
  uint64_t v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  SiriUIContentButton *chevronButton;
  SiriUIContentButton *v36;
  void *v37;
  SiriUIContentButton *v38;
  void *v39;
  objc_super v41;

  v41.receiver = self;
  v41.super_class = (Class)SRTapToEditView;
  v3 = -[SRTapToEditView initWithFrame:](&v41, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    *(_QWORD *)&v6 = objc_opt_class(v3, v4).n128_u64[0];
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v7, v6));
    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tapToEditLabel = v5->_tapToEditLabel;
    v5->_tapToEditLabel = v9;

    v11 = v5->_tapToEditLabel;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceCorrectionPromptFont](UIFont, "siriui_serverUtteranceCorrectionPromptFont"));
    -[UILabel setFont:](v11, "setFont:", v12);

    v13 = v5->_tapToEditLabel;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditColor](UIColor, "siriui_tapToEditColor"));
    -[UILabel setTextColor:](v13, "setTextColor:", v14);

    v15 = v5->_tapToEditLabel;
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "siriUILocalizedStringForKey:table:", CFSTR("TAP_TO_EDIT"), 0));
    -[UILabel setText:](v15, "setText:", v16);

    -[UILabel sizeToFit](v5->_tapToEditLabel, "sizeToFit");
    -[SRTapToEditView addSubview:](v5, "addSubview:", v5->_tapToEditLabel);
    *(_QWORD *)&v18 = objc_opt_class(v5, v17).n128_u64[0];
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v19, v18));
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("Circle"), v20));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "imageWithRenderingMode:", 2));

    v23 = objc_claimAutoreleasedReturnValue(+[SiriUIContentButton buttonWithImageTemplate:style:](SiriUIContentButton, "buttonWithImageTemplate:style:", v22, 0));
    circleButton = v5->_circleButton;
    v5->_circleButton = (SiriUIContentButton *)v23;

    -[SiriUIContentButton setUserInteractionEnabled:](v5->_circleButton, "setUserInteractionEnabled:", 0);
    -[SiriUIContentButton setAlpha:](v5->_circleButton, "setAlpha:", 0.12);
    -[SiriUIContentButton sizeToFit](v5->_circleButton, "sizeToFit");
    -[SRTapToEditView addSubview:](v5, "addSubview:", v5->_circleButton);
    *(_QWORD *)&v26 = objc_opt_class(v5, v25).n128_u64[0];
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v27, v26));
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:inBundle:](UIImage, "imageNamed:inBundle:", CFSTR("Chevron"), v28));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "imageWithRenderingMode:", 2));

    if (SiriLanguageIsRTL(v31, v32))
    {
      v33 = objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "imageWithHorizontallyFlippedOrientation"));

      v30 = (void *)v33;
    }
    v34 = objc_claimAutoreleasedReturnValue(+[SiriUIContentButton buttonWithImageTemplate:style:](SiriUIContentButton, "buttonWithImageTemplate:style:", v30, 0));
    chevronButton = v5->_chevronButton;
    v5->_chevronButton = (SiriUIContentButton *)v34;

    -[SiriUIContentButton setUserInteractionEnabled:](v5->_chevronButton, "setUserInteractionEnabled:", 0);
    v36 = v5->_chevronButton;
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditColor](UIColor, "siriui_tapToEditColor"));
    -[SiriUIContentButton setDefaultColorForTemplate:](v36, "setDefaultColorForTemplate:", v37);

    v38 = v5->_chevronButton;
    v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditMaskingColor](UIColor, "siriui_tapToEditMaskingColor"));
    -[SiriUIContentButton setHighlightColorForTemplate:](v38, "setHighlightColorForTemplate:", v39);

    -[SiriUIContentButton sizeToFit](v5->_chevronButton, "sizeToFit");
    -[SRTapToEditView addSubview:](v5, "addSubview:", v5->_chevronButton);
    -[SiriUIContentButton siriui_setBlendEffectEnabled:](v5->_chevronButton, "siriui_setBlendEffectEnabled:", 1);
    -[UILabel siriui_setBlendEffectEnabled:](v5->_tapToEditLabel, "siriui_setBlendEffectEnabled:", 1);

  }
  return v5;
}

- (void)touchesBegan:(id)a3 withEvent:(id)a4
{
  -[SRTapToEditView _setHighlighted:](self, "_setHighlighted:", 1, a4);
}

- (void)touchesEnded:(id)a3 withEvent:(id)a4
{
  -[SRTapToEditView _setHighlighted:](self, "_setHighlighted:", 0, a4);
}

- (void)touchesCancelled:(id)a3 withEvent:(id)a4
{
  -[SRTapToEditView _setHighlighted:](self, "_setHighlighted:", 0, a4);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double height;
  double width;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGSize result;

  height = a3.height;
  width = a3.width;
  -[UILabel sizeThatFits:](self->_tapToEditLabel, "sizeThatFits:");
  v7 = v6;
  v9 = v8 + 10.0;
  -[SiriUIContentButton sizeThatFits:](self->_circleButton, "sizeThatFits:", width, height);
  v12 = v9 + v11;
  if (v7 >= v10)
    v10 = v7;
  result.height = v10;
  result.width = v12;
  return result;
}

- (void)layoutSubviews
{
  SiriUIContentButton *circleButton;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  UILabel *tapToEditLabel;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  void *v18;
  double v19;
  double v20;
  uint64_t v21;
  uint64_t v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  double v29;
  double v30;
  double v31;
  objc_super v32;
  CGRect v33;
  CGRect v34;

  v32.receiver = self;
  v32.super_class = (Class)SRTapToEditView;
  -[SRTapToEditView layoutSubviews](&v32, "layoutSubviews");
  circleButton = self->_circleButton;
  -[SRTapToEditView bounds](self, "bounds");
  -[SiriUIContentButton sizeThatFits:](circleButton, "sizeThatFits:", v4, v5);
  v7 = v6;
  v9 = v8;
  tapToEditLabel = self->_tapToEditLabel;
  -[SRTapToEditView bounds](self, "bounds");
  -[UILabel sizeThatFits:](tapToEditLabel, "sizeThatFits:", v11, v12);
  v14 = v13;
  v16 = v15;
  v17 = v9 - v15;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v18, "scale");
  v20 = v19;

  v23 = v17 * -0.5;
  v24 = floor(v17 * -0.5);
  if (v20 < 2.0)
    v23 = v24;
  v25 = 0.0;
  v26 = v17 * 0.5;
  v27 = floor(v17 * 0.5);
  if (v20 < 2.0)
    v26 = v27;
  v28 = v17 <= 0.0;
  if (v17 > 0.0)
    v29 = v26;
  else
    v29 = 0.0;
  if (v28)
    v30 = v23;
  else
    v30 = 0.0;
  if (SiriLanguageIsRTL(v21, v22))
  {
    v31 = 0.0;
    v33.origin.x = 0.0;
    v33.origin.y = v30;
    v33.size.width = v7;
    v33.size.height = v9;
    v25 = CGRectGetWidth(v33) + 10.0;
  }
  else
  {
    v34.origin.x = 0.0;
    v34.origin.y = v29;
    v34.size.width = v14;
    v34.size.height = v16;
    v31 = CGRectGetWidth(v34) + 10.0;
  }
  -[UILabel setFrame:](self->_tapToEditLabel, "setFrame:", v25, v29, v14, v16);
  -[SiriUIContentButton setFrame:](self->_circleButton, "setFrame:", v31, v30, v7, v9);
  -[SiriUIContentButton setFrame:](self->_chevronButton, "setFrame:", v31, v30, v7, v9);
}

- (double)firstLineBaselineOffsetFromTop
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;

  -[SRTapToEditView _circleToLabelHeightDifference](self, "_circleToLabelHeightDifference");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tapToEditLabel, "font"));
  objc_msgSend(v5, "ascender");
  v7 = v6;

  v8 = v4 * 0.5;
  if (v4 <= 0.0)
    v8 = -0.0;
  return v8 + v7;
}

- (double)baselineOffsetFromBottom
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double result;

  -[SRTapToEditView _circleToLabelHeightDifference](self, "_circleToLabelHeightDifference");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_tapToEditLabel, "font"));
  objc_msgSend(v5, "descender");
  v7 = v6;
  v8 = -v6;

  result = v4 * 0.5 - v7;
  if (v4 <= 0.0)
    return v8;
  return result;
}

- (void)_setHighlighted:(BOOL)a3
{
  _BOOL8 v3;
  UILabel *tapToEditLabel;
  uint64_t v6;
  void *v7;

  v3 = a3;
  tapToEditLabel = self->_tapToEditLabel;
  if (a3)
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditMaskingColor](UIColor, "siriui_tapToEditMaskingColor"));
  else
    v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_tapToEditColor](UIColor, "siriui_tapToEditColor"));
  v7 = (void *)v6;
  -[UILabel setTextColor:](tapToEditLabel, "setTextColor:", v6);

  -[SiriUIContentButton setHighlighted:](self->_circleButton, "setHighlighted:", v3);
  -[SiriUIContentButton setHighlighted:](self->_chevronButton, "setHighlighted:", v3);
}

- (double)_circleToLabelHeightDifference
{
  SiriUIContentButton *circleButton;
  double v4;
  double v5;
  double v6;
  double v7;
  UILabel *tapToEditLabel;
  double v9;
  double v10;
  double v11;

  circleButton = self->_circleButton;
  -[SRTapToEditView bounds](self, "bounds");
  -[SiriUIContentButton sizeThatFits:](circleButton, "sizeThatFits:", v4, v5);
  v7 = v6;
  tapToEditLabel = self->_tapToEditLabel;
  -[SRTapToEditView bounds](self, "bounds");
  -[UILabel sizeThatFits:](tapToEditLabel, "sizeThatFits:", v9, v10);
  return v7 - v11;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_chevronButton, 0);
  objc_storeStrong((id *)&self->_circleButton, 0);
  objc_storeStrong((id *)&self->_tapToEditLabel, 0);
}

@end

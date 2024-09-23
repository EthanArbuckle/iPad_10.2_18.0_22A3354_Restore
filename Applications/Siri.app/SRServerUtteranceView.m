@implementation SRServerUtteranceView

- (SRServerUtteranceView)initWithFrame:(CGRect)a3
{
  SRServerUtteranceView *v3;
  uint64_t v4;
  SiriSharedUIContentLabel *label;
  SiriSharedUIContentLabel *v6;
  void *v7;
  SiriSharedUIContentLabel *v8;
  void *v9;
  id v10;
  SiriSharedUIContentLabel *v11;
  double v12;
  CGFloat v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)SRServerUtteranceView;
  v3 = -[SRServerUtteranceView initWithFrame:](&v15, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](SiriSharedUIContentLabel, "label"));
    label = v3->_label;
    v3->_label = (SiriSharedUIContentLabel *)v4;

    v6 = v3->_label;
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](UIColor, "siriui_lightTextColor"));
    -[SiriSharedUIContentLabel setTextColor:](v6, "setTextColor:", v7);

    v8 = v3->_label;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceFont](UIFont, "siriui_serverUtteranceFont"));
    -[SiriSharedUIContentLabel setFont:](v8, "setFont:", v9);

    v10 = -[SiriSharedUIContentLabel setNumberOfLines:](v3->_label, "setNumberOfLines:", 0);
    v11 = v3->_label;
    v12 = SiriUITextHyphenationFactor(v10);
    *(float *)&v12 = v12;
    -[SiriSharedUIContentLabel _setHyphenationFactor:](v11, "_setHyphenationFactor:", v12);
    -[SRServerUtteranceView addSubview:](v3, "addSubview:", v3->_label);
    -[SRServerUtteranceView setChevronHidden:](v3, "setChevronHidden:", 1);
    v13 = SiriUIDefaultEdgePadding;
    v3->_edgeInsets.top = 0.0;
    v3->_edgeInsets.leading = v13;
    v3->_edgeInsets.bottom = 0.0;
    v3->_edgeInsets.trailing = v13;
  }
  return v3;
}

- (void)setChevronHidden:(BOOL)a3
{
  if (!a3)
    self->_chevronHasBeenShown = 1;
  -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)chevronHasBeenShown
{
  return self->_chevronHasBeenShown;
}

+ (double)insertionAnimatedZPosition
{
  return -100.0;
}

- (double)firstLineBaselineOffsetFromTop
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIContentLabel font](self->_label, "font"));
  objc_msgSend(v2, "ascender");
  v4 = v3;

  return v4;
}

- (double)baselineOffsetFromBottom
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[SiriSharedUIContentLabel font](self->_label, "font"));
  objc_msgSend(v2, "descender");
  v4 = -v3;

  return v4;
}

- (void)setText:(id)a3
{
  const __CFString *v4;
  const __CFString *v5;
  __CFString *v6;

  v4 = (const __CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = &stru_100125588;
  v6 = (__CFString *)v5;
  -[SiriSharedUIContentLabel setText:](self->_label, "setText:");
  -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setAttributedText:(id)a3
{
  if (a3)
  {
    -[SiriSharedUIContentLabel setAttributedText:](self->_label, "setAttributedText:");
    -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
  }
  else
  {
    -[SRServerUtteranceView setText:](self, "setText:");
  }
}

- (void)setFont:(id)a3
{
  -[SiriSharedUIContentLabel setFont:](self->_label, "setFont:", a3);
}

- (UIFont)font
{
  return (UIFont *)-[SiriSharedUIContentLabel font](self->_label, "font");
}

- (BOOL)isBlendEffectEnabled
{
  return self->_blendEffectEnabled;
}

- (void)setBlendEffectEnabled:(BOOL)a3
{
  _BOOL8 v3;
  SiriSharedUIContentLabel *label;
  uint64_t v6;
  void *v7;

  if (self->_blendEffectEnabled != a3)
  {
    v3 = a3;
    self->_blendEffectEnabled = a3;
    label = self->_label;
    if (a3)
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_blendEffectColor](UIColor, "siriui_blendEffectColor"));
    else
      v6 = objc_claimAutoreleasedReturnValue(+[UIColor siriui_lightTextColor](UIColor, "siriui_lightTextColor"));
    v7 = (void *)v6;
    -[SiriSharedUIContentLabel setTextColor:](label, "setTextColor:", v6);

    -[SiriSharedUIContentLabel siriui_setBlendEffectEnabled:](self->_label, "siriui_setBlendEffectEnabled:", v3);
    -[SRServerUtteranceView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  CGSize result;

  width = a3.width;
  -[SiriSharedUIContentLabel sizeThatFits:](self->_label, "sizeThatFits:", SiriUIUtteranceWidthForAvailableWidthAndInsets(self, a3.width, self->_edgeInsets.top, self->_edgeInsets.leading, self->_edgeInsets.bottom, self->_edgeInsets.trailing), 1.79769313e308);
  v5 = width;
  result.height = v4;
  result.width = v5;
  return result;
}

- (void)layoutSubviews
{
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double v7;
  uint64_t v8;
  double v9;
  uint64_t v10;
  uint64_t v11;
  double leading;
  uint64_t v13;
  double v14;
  objc_super v15;
  CGRect v16;
  CGRect v17;

  -[SRServerUtteranceView recursive_setSemanticContentAttribute:](self, "recursive_setSemanticContentAttribute:", SiriLanguageSemanticContentAttribute(self, a2));
  v15.receiver = self;
  v15.super_class = (Class)SRServerUtteranceView;
  -[SRServerUtteranceView layoutSubviews](&v15, "layoutSubviews");
  -[SRServerUtteranceView bounds](self, "bounds");
  x = v16.origin.x;
  y = v16.origin.y;
  width = v16.size.width;
  height = v16.size.height;
  v7 = CGRectGetWidth(v16);
  v9 = SiriUIUtteranceWidthForAvailableWidthAndInsets(v8, v7, self->_edgeInsets.top, self->_edgeInsets.leading, self->_edgeInsets.bottom, self->_edgeInsets.trailing);
  if (SiriLanguageIsRTL(v10, v11))
  {
    v17.origin.x = x;
    v17.origin.y = y;
    v17.size.width = width;
    v17.size.height = height;
    leading = CGRectGetWidth(v17) - v9 - self->_edgeInsets.leading;
    v13 = 2;
  }
  else
  {
    v13 = 0;
    leading = self->_edgeInsets.leading;
  }
  -[SiriSharedUIContentLabel setTextAlignment:](self->_label, "setTextAlignment:", v13);
  -[SiriSharedUIContentLabel sizeThatFits:](self->_label, "sizeThatFits:", v9, 1.79769313e308);
  -[SiriSharedUIContentLabel setFrame:](self->_label, "setFrame:", leading, y, v9, v14);
}

- (double)_scaledSiriCorrectionViewLeading
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont siriui_serverUtteranceCorrectionPromptFont](UIFont, "siriui_serverUtteranceCorrectionPromptFont"));
  objc_msgSend(v2, "_scaledValueForValue:", 28.0);
  v4 = v3;

  return v4;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

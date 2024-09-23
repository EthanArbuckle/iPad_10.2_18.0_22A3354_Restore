@implementation SRSpeechAlternativeLabelCellView

- (SRSpeechAlternativeLabelCellView)initWithTitle:(id)a3 font:(id)a4
{
  id v6;
  id v7;
  SRSpeechAlternativeLabelCellView *v8;
  UILabel *v9;
  UILabel *label;
  UILabel *v11;
  void *v12;
  objc_super v14;

  v6 = a3;
  v7 = a4;
  v14.receiver = self;
  v14.super_class = (Class)SRSpeechAlternativeLabelCellView;
  v8 = -[SRSpeechAlternativeLabelCellView init](&v14, "init");
  if (v8)
  {
    v9 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    label = v8->_label;
    v8->_label = v9;

    -[UILabel setFont:](v8->_label, "setFont:", v7);
    v11 = v8->_label;
    v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 1.0));
    -[UILabel setTextColor:](v11, "setTextColor:", v12);

    -[UILabel setText:](v8->_label, "setText:", v6);
    -[UILabel sizeToFit](v8->_label, "sizeToFit");
    -[SRSpeechAlternativeLabelCellView addSubview:](v8, "addSubview:", v8->_label);
  }

  return v8;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  width = a3.width;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font", a3.width, a3.height));
  objc_msgSend(v4, "_scaledValueForValue:", 66.0);
  v6 = v5;

  v7 = width;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (void)layoutSubviews
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  id v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  uint64_t v20;
  CGFloat v21;
  double v22;
  void *v23;
  double v24;
  double v25;
  void *v26;
  double v27;
  double v28;
  CGRect v29;
  CGRect v30;

  -[SRSpeechAlternativeLabelCellView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UILabel frame](self->_label, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (SiriLanguageIsRTL(v11, v20))
  {
    v29.origin.x = v4;
    v29.origin.y = v6;
    v29.size.width = v8;
    v29.size.height = v10;
    v21 = CGRectGetWidth(v29) - SiriUIPlatterStyle[34];
    v30.origin.x = v13;
    v30.origin.y = v15;
    v30.size.width = v17;
    v30.size.height = v19;
    v22 = v21 - CGRectGetWidth(v30);
  }
  else
  {
    v22 = SiriUIPlatterStyle[32];
  }
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  objc_msgSend(v23, "_scaledValueForValue:", 42.0);
  v25 = v24;
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self->_label, "font"));
  objc_msgSend(v26, "ascender");
  v28 = v25 - v27;

  -[UILabel setFrame:](self->_label, "setFrame:", v22, v28, v17, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_label, 0);
}

@end

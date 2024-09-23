@implementation SRSpeechAlternativeTapToEditCellView

- (SRSpeechAlternativeTapToEditCellView)init
{
  SRSpeechAlternativeTapToEditCellView *v2;
  uint64_t v3;
  SRSpeechAlternativeTapToEditCellView *v4;
  double v5;
  uint64_t v6;
  void *v7;
  UILabel *v8;
  UILabel *tapToEditLabel;
  UILabel *v10;
  void *v11;
  UILabel *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  id v16;
  uint64_t v17;
  void *v18;
  id v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)SRSpeechAlternativeTapToEditCellView;
  v2 = -[SRSpeechAlternativeTapToEditCellView init](&v22, "init");
  v4 = v2;
  if (v2)
  {
    *(_QWORD *)&v5 = objc_opt_class(v2, v3).n128_u64[0];
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleForClass:](NSBundle, "bundleForClass:", v6, v5));
    v8 = (UILabel *)objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
    tapToEditLabel = v4->_tapToEditLabel;
    v4->_tapToEditLabel = v8;

    v10 = v4->_tapToEditLabel;
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleCaption2));
    -[UILabel setFont:](v10, "setFont:", v11);

    v12 = v4->_tapToEditLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.6));
    -[UILabel setTextColor:](v12, "setTextColor:", v13);

    v14 = v4->_tapToEditLabel;
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "siriUILocalizedStringForKey:table:", CFSTR("TAP_TO_EDIT"), 0));
    v16 = objc_alloc((Class)NSLocale);
    v17 = AFUIGetLanguageCode();
    v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
    v19 = objc_msgSend(v16, "initWithLocaleIdentifier:", v18);
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "uppercaseStringWithLocale:", v19));
    -[UILabel setText:](v14, "setText:", v20);

    -[UILabel setHidden:](v4->_tapToEditLabel, "setHidden:", 0);
    -[UILabel sizeToFit](v4->_tapToEditLabel, "sizeToFit");
    -[SRSpeechAlternativeTapToEditCellView addSubview:](v4, "addSubview:", v4->_tapToEditLabel);

  }
  return v4;
}

- (void)setTextHidden:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];
  _QWORD v6[5];
  _QWORD v7[5];

  v3 = a3;
  if (-[UILabel isHidden](self->_tapToEditLabel, "isHidden") != a3)
  {
    if (v3)
    {
      v7[0] = _NSConcreteStackBlock;
      v7[1] = 3221225472;
      v7[2] = sub_1000619C0;
      v7[3] = &unk_1001225C0;
      v7[4] = self;
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_1000619D8;
      v6[3] = &unk_100123C00;
      v6[4] = self;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, v6, 0.5);
    }
    else
    {
      -[UILabel setHidden:](self->_tapToEditLabel, "setHidden:", 0);
      v5[0] = _NSConcreteStackBlock;
      v5[1] = 3221225472;
      v5[2] = sub_1000619F0;
      v5[3] = &unk_1001225C0;
      v5[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v5, 0.5);
    }
  }
}

- (CGSize)sizeThatFits:(CGSize)result
{
  double v3;

  v3 = SiriUIPlatterStyle[26];
  result.height = v3;
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
  CGRect v23;
  CGRect v24;
  CGRect v25;

  -[SRSpeechAlternativeTapToEditCellView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v11 = -[UILabel frame](self->_tapToEditLabel, "frame");
  v13 = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  if (SiriLanguageIsRTL(v11, v20))
  {
    v23.origin.x = v4;
    v23.origin.y = v6;
    v23.size.width = v8;
    v23.size.height = v10;
    v21 = CGRectGetWidth(v23) - SiriUIPlatterStyle[34];
    v24.origin.x = v13;
    v24.origin.y = v15;
    v24.size.width = v17;
    v24.size.height = v19;
    v22 = v21 - CGRectGetWidth(v24);
  }
  else
  {
    v22 = SiriUIPlatterStyle[32];
  }
  -[UILabel bounds](self->_tapToEditLabel, "bounds");
  -[UILabel setFrame:](self->_tapToEditLabel, "setFrame:", v22, SiriUIPlatterStyle[21] - CGRectGetHeight(v25), v17, v19);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_tapToEditLabel, 0);
}

@end

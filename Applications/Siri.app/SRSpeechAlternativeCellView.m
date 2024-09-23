@implementation SRSpeechAlternativeCellView

- (SRSpeechAlternativeCellView)initWithTitle:(id)a3
{
  id v5;
  SRSpeechAlternativeCellView *v6;
  SRSpeechAlternativeCellView *v7;
  UIView *v8;
  UIView *containerView;
  uint64_t v10;
  UILabel *displayTextLabel;
  UILabel *v12;
  void *v13;
  objc_super v15;

  v5 = a3;
  v15.receiver = self;
  v15.super_class = (Class)SRSpeechAlternativeCellView;
  v6 = -[SRSpeechAlternativeCellView init](&v15, "init");
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_titleString, a3);
    v8 = (UIView *)objc_alloc_init((Class)UIView);
    containerView = v7->_containerView;
    v7->_containerView = v8;

    -[SRSpeechAlternativeCellView addSubview:](v7, "addSubview:", v7->_containerView);
    -[UIView setTranslatesAutoresizingMaskIntoConstraints:](v7->_containerView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v10 = objc_claimAutoreleasedReturnValue(+[SiriSharedUIContentLabel label](SiriSharedUIContentLabel, "label"));
    displayTextLabel = v7->_displayTextLabel;
    v7->_displayTextLabel = (UILabel *)v10;

    -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](v7->_displayTextLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    v12 = v7->_displayTextLabel;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleTitle3));
    -[UILabel setFont:](v12, "setFont:", v13);

    -[UILabel setAttributedText:](v7->_displayTextLabel, "setAttributedText:", v5);
    -[UILabel setNumberOfLines:](v7->_displayTextLabel, "setNumberOfLines:", 0);
    -[UIView addSubview:](v7->_containerView, "addSubview:", v7->_displayTextLabel);
    -[SRSpeechAlternativeCellView setNeedsUpdateConstraints](v7, "setNeedsUpdateConstraints");
  }

  return v7;
}

- (UIEdgeInsets)edgeInsets
{
  int IsRTL;
  double v3;
  double v4;
  double v5;
  double v6;
  UIEdgeInsets result;

  IsRTL = SiriLanguageIsRTL(self, a2);
  v4 = SiriUIPlatterStyle[24];
  v3 = SiriUIPlatterStyle[25];
  v5 = SiriUIPlatterStyle[22];
  if (IsRTL)
    v6 = SiriUIPlatterStyle[23];
  else
    v6 = SiriUIPlatterStyle[25];
  if (!IsRTL)
    v3 = SiriUIPlatterStyle[23];
  result.right = v6;
  result.bottom = v4;
  result.left = v3;
  result.top = v5;
  return result;
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  CGPoint v7;
  CGRect v8;

  y = a3.y;
  x = a3.x;
  -[SRSpeechAlternativeCellView bounds](self, "bounds", a4);
  v7.x = x;
  v7.y = y;
  return CGRectContainsPoint(v8, v7);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat width;
  double v4;
  double v5;
  double v6;
  double v7;
  CGSize result;

  width = a3.width;
  -[UILabel sizeThatFits:](self->_displayTextLabel, "sizeThatFits:", a3.width - (SiriUIPlatterStyle[23] + SiriUIPlatterStyle[25]), 1.79769313e308);
  v5 = v4 + SiriUIPlatterStyle[22] + SiriUIPlatterStyle[24];
  v6 = SiriUIPlatterStyle[26];
  if (v5 >= v6)
    v6 = v5;
  v7 = width;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)updateConstraints
{
  NSDictionary *v3;
  void *v4;
  void *v5;
  NSDictionary *v6;
  void *v7;
  void *v8;
  UILabel *displayTextLabel;
  UIView *containerView;
  NSDictionary *v11;
  void *v12;
  void *v13;
  UILabel *v14;
  void *v15;
  objc_super v16;

  v16.receiver = self;
  v16.super_class = (Class)SRSpeechAlternativeCellView;
  -[SRSpeechAlternativeCellView updateConstraints](&v16, "updateConstraints");
  if (!self->_hasSetUpConstraints)
  {
    v3 = _NSDictionaryOfVariableBindings(CFSTR("_containerView"), self->_containerView, 0);
    v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_containerView]|"), 0, 0, v4));
    -[SRSpeechAlternativeCellView addConstraints:](self, "addConstraints:", v5);

    v6 = _NSDictionaryOfVariableBindings(CFSTR("_containerView"), self->_containerView, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_containerView]|"), 0, 0, v7));
    -[SRSpeechAlternativeCellView addConstraints:](self, "addConstraints:", v8);

    displayTextLabel = self->_displayTextLabel;
    if (displayTextLabel)
    {
      containerView = self->_containerView;
      v11 = _NSDictionaryOfVariableBindings(CFSTR("_displayTextLabel"), displayTextLabel, 0);
      v12 = (void *)objc_claimAutoreleasedReturnValue(v11);
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("H:|[_displayTextLabel]|"), 0, 0, v12));
      -[UIView addConstraints:](containerView, "addConstraints:", v13);

      v14 = self->_displayTextLabel;
      if (v14)
      {
        v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v14, 10, 0, self->_containerView, 10, 1.0, 0.0));
        -[SRSpeechAlternativeCellView addConstraint:](self, "addConstraint:", v15);

      }
    }
    self->_hasSetUpConstraints = 1;
  }
}

- (NSString)responseText
{
  return self->_responseText;
}

- (void)setResponseText:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_responseText, 0);
  objc_storeStrong((id *)&self->_titleString, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
  objc_storeStrong((id *)&self->_displayTextLabel, 0);
}

@end

@implementation CNComposeHeaderLabelView

- (void)_updateTextColor
{
  id v3;

  objc_msgSend(MEMORY[0x1E0CEA478], "secondaryLabelColor");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[CNComposeHeaderLabelView setTextColor:](self, "setTextColor:", v3);

}

- (CNComposeHeaderLabelView)initWithFrame:(CGRect)a3
{
  CNComposeHeaderLabelView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CNComposeHeaderLabelView;
  v3 = -[CNComposeHeaderLabelView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[CNComposeHeaderView defaultFont](CNComposeHeaderView, "defaultFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[CNComposeHeaderLabelView setFont:](v3, "setFont:", v4);

    -[CNComposeHeaderLabelView _updateTextColor](v3, "_updateTextColor");
  }
  return v3;
}

- (CGPoint)baselinePoint
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  CGPoint result;

  -[CNComposeHeaderLabelView frame](self, "frame");
  v4 = v3;
  -[CNComposeHeaderLabelView _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
  v6 = round(v4 - v5);
  v7 = 0.0;
  result.y = v6;
  result.x = v7;
  return result;
}

- (void)tintColorDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CNComposeHeaderLabelView;
  -[CNComposeHeaderLabelView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[CNComposeHeaderLabelView _updateTextColor](self, "_updateTextColor");
}

@end

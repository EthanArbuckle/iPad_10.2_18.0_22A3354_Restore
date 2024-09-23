@implementation MFHeaderLabelView

+ (id)_defaultColor
{
  return (id)objc_msgSend(MEMORY[0x1E0DC3658], "systemGrayColor");
}

- (void)_updateTextColor
{
  void *v3;
  id v4;

  +[MFHeaderLabelView _defaultColor](MFHeaderLabelView, "_defaultColor");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[MFHeaderLabelView _accessibilityHigherContrastTintColorForColor:](self, "_accessibilityHigherContrastTintColorForColor:");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MFHeaderLabelView setTextColor:](self, "setTextColor:", v3);

}

- (MFHeaderLabelView)initWithFrame:(CGRect)a3
{
  MFHeaderLabelView *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MFHeaderLabelView;
  v3 = -[MFHeaderLabelView initWithFrame:](&v6, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    +[MFComposeHeaderView defaultFont](MFComposeHeaderView, "defaultFont");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[MFHeaderLabelView setFont:](v3, "setFont:", v4);

    -[MFHeaderLabelView _updateTextColor](v3, "_updateTextColor");
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

  -[MFHeaderLabelView frame](self, "frame");
  v4 = v3;
  -[MFHeaderLabelView _baselineOffsetFromBottom](self, "_baselineOffsetFromBottom");
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
  v3.super_class = (Class)MFHeaderLabelView;
  -[MFHeaderLabelView tintColorDidChange](&v3, sel_tintColorDidChange);
  -[MFHeaderLabelView _updateTextColor](self, "_updateTextColor");
}

@end

@implementation SFPrivacyReportMeterBar

- (SFPrivacyReportMeterBar)initWithFrame:(CGRect)a3
{
  SFPrivacyReportMeterBar *v3;
  SFPrivacyReportMeterBar *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  SFPrivacyReportMeterBar *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)SFPrivacyReportMeterBar;
  v3 = -[SFPrivacyReportMeterBar initWithFrame:](&v13, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[SFPrivacyReportMeterBar tintColor](v3, "tintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportMeterBar setBackgroundColor:](v4, "setBackgroundColor:", v5);

    v6 = *MEMORY[0x1E0CD2A60];
    -[SFPrivacyReportMeterBar layer](v4, "layer");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setCornerCurve:", v6);

    -[SFPrivacyReportMeterBar widthAnchor](v4, "widthAnchor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFPrivacyReportMeterBar heightAnchor](v4, "heightAnchor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "constraintGreaterThanOrEqualToAnchor:", v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setActive:", 1);

    v11 = v4;
  }

  return v4;
}

- (void)tintColorDidChange
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)SFPrivacyReportMeterBar;
  -[SFPrivacyReportMeterBar tintColorDidChange](&v4, sel_tintColorDidChange);
  -[SFPrivacyReportMeterBar tintColor](self, "tintColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFPrivacyReportMeterBar setBackgroundColor:](self, "setBackgroundColor:", v3);

}

- (void)layoutSubviews
{
  CGFloat v3;
  void *v4;
  objc_super v5;
  CGRect v6;

  v5.receiver = self;
  v5.super_class = (Class)SFPrivacyReportMeterBar;
  -[SFPrivacyReportMeterBar layoutSubviews](&v5, sel_layoutSubviews);
  -[SFPrivacyReportMeterBar bounds](self, "bounds");
  v3 = CGRectGetHeight(v6) * 0.5;
  -[SFPrivacyReportMeterBar layer](self, "layer");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setCornerRadius:", v3);

}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  v2 = *MEMORY[0x1E0DC55F0];
  v3 = 5.0;
  result.height = v3;
  result.width = v2;
  return result;
}

@end

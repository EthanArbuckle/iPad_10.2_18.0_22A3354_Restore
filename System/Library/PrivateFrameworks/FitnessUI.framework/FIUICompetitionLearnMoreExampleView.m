@implementation FIUICompetitionLearnMoreExampleView

- (FIUICompetitionLearnMoreExampleView)init
{
  double v2;
  double v3;
  double v4;
  double v5;
  FIUICompetitionLearnMoreExampleView *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  UIImageView *moveRingView;
  uint64_t v12;
  UIImageView *exerciseRingView;
  uint64_t v14;
  UIImageView *standRingView;
  uint64_t v16;
  UILabel *movePercentLabel;
  uint64_t v18;
  UILabel *exercisePercentLabel;
  uint64_t v20;
  UILabel *standPercentLabel;
  uint64_t v22;
  UIView *separatorView;
  void *v24;
  uint64_t v25;
  UILabel *totalPointsLabel;
  void *v27;
  objc_super v29;

  v29.receiver = self;
  v29.super_class = (Class)FIUICompetitionLearnMoreExampleView;
  v2 = *MEMORY[0x24BDBF090];
  v3 = *(double *)(MEMORY[0x24BDBF090] + 8);
  v4 = *(double *)(MEMORY[0x24BDBF090] + 16);
  v5 = *(double *)(MEMORY[0x24BDBF090] + 24);
  v6 = -[FIUICompetitionLearnMoreExampleView initWithFrame:](&v29, sel_initWithFrame_, *MEMORY[0x24BDBF090], v3, v4, v5);
  if (v6)
  {
    objc_msgSend(MEMORY[0x24BE01CA8], "energyColors");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE01CA8], "briskColors");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE01CA8], "sedentaryColors");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[FIUICompetitionLearnMoreExampleView _ringViewOfType:withMetricColors:percentage:](v6, "_ringViewOfType:withMetricColors:percentage:", 2, v7, 1.25);
    v10 = objc_claimAutoreleasedReturnValue();
    moveRingView = v6->_moveRingView;
    v6->_moveRingView = (UIImageView *)v10;

    -[FIUICompetitionLearnMoreExampleView _ringViewOfType:withMetricColors:percentage:](v6, "_ringViewOfType:withMetricColors:percentage:", 1, v8, 0.5);
    v12 = objc_claimAutoreleasedReturnValue();
    exerciseRingView = v6->_exerciseRingView;
    v6->_exerciseRingView = (UIImageView *)v12;

    -[FIUICompetitionLearnMoreExampleView _ringViewOfType:withMetricColors:percentage:](v6, "_ringViewOfType:withMetricColors:percentage:", 0, v9, 0.25);
    v14 = objc_claimAutoreleasedReturnValue();
    standRingView = v6->_standRingView;
    v6->_standRingView = (UIImageView *)v14;

    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_moveRingView);
    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_exerciseRingView);
    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_standRingView);
    -[FIUICompetitionLearnMoreExampleView _ringPercentageLabelForPercentage:withMetricColors:](v6, "_ringPercentageLabelForPercentage:withMetricColors:", v7, 1.25);
    v16 = objc_claimAutoreleasedReturnValue();
    movePercentLabel = v6->_movePercentLabel;
    v6->_movePercentLabel = (UILabel *)v16;

    -[FIUICompetitionLearnMoreExampleView _ringPercentageLabelForPercentage:withMetricColors:](v6, "_ringPercentageLabelForPercentage:withMetricColors:", v8, 0.5);
    v18 = objc_claimAutoreleasedReturnValue();
    exercisePercentLabel = v6->_exercisePercentLabel;
    v6->_exercisePercentLabel = (UILabel *)v18;

    -[FIUICompetitionLearnMoreExampleView _ringPercentageLabelForPercentage:withMetricColors:](v6, "_ringPercentageLabelForPercentage:withMetricColors:", v9, 0.25);
    v20 = objc_claimAutoreleasedReturnValue();
    standPercentLabel = v6->_standPercentLabel;
    v6->_standPercentLabel = (UILabel *)v20;

    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_movePercentLabel);
    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_exercisePercentLabel);
    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_standPercentLabel);
    v22 = objc_msgSend(objc_alloc(MEMORY[0x24BEBDB00]), "initWithFrame:", v2, v3, v4, v5);
    separatorView = v6->_separatorView;
    v6->_separatorView = (UIView *)v22;

    -[UIView layer](v6->_separatorView, "layer");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setCornerRadius:", 0.5);

    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_separatorView);
    v25 = objc_opt_new();
    totalPointsLabel = v6->_totalPointsLabel;
    v6->_totalPointsLabel = (UILabel *)v25;

    objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:", 16.0);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setFont:](v6->_totalPointsLabel, "setFont:", v27);

    -[UILabel setTextAlignment:](v6->_totalPointsLabel, "setTextAlignment:", 1);
    -[FIUICompetitionLearnMoreExampleView addSubview:](v6, "addSubview:", v6->_totalPointsLabel);

  }
  return v6;
}

- (id)_ringViewOfType:(int64_t)a3 withMetricColors:(id)a4 percentage:(double)a5
{
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;

  v7 = (void *)MEMORY[0x24BE01CD8];
  v8 = a4;
  objc_msgSend(v7, "ringsViewConfiguredForOneRingOnWatchOfType:withIcon:", a3, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)MEMORY[0x24BE01CD0];
  objc_msgSend(v8, "gradientDarkColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "gradientLightColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "renderSingleRingUsingRingsView:forPercentage:withDiameter:thickness:topColor:bottomColor:", v9, v11, v12, a5, 49.0, 7.0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BEBD668]), "initWithImage:", v13);
  return v14;
}

- (id)_ringPercentageLabelForPercentage:(double)a3 withMetricColors:(id)a4
{
  objc_class *v5;
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v5 = (objc_class *)MEMORY[0x24BDD16F0];
  v6 = a4;
  v7 = objc_alloc_init(v5);
  objc_msgSend(v7, "setNumberStyle:", 3);
  v8 = (void *)objc_opt_new();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringFromNumber:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setText:", v10);

  objc_msgSend(MEMORY[0x24BEBB520], "systemFontOfSize:weight:", 11.0, *MEMORY[0x24BEBB600]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFont:", v11);

  objc_msgSend(v6, "gradientDarkColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "setTextColor:", v12);
  objc_msgSend(v8, "setTextAlignment:", 1);

  return v8;
}

- (void)layoutSubviews
{
  double v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)FIUICompetitionLearnMoreExampleView;
  -[FIUICompetitionLearnMoreExampleView layoutSubviews](&v4, sel_layoutSubviews);
  -[FIUICompetitionLearnMoreExampleView bounds](self, "bounds");
  -[FIUICompetitionLearnMoreExampleView layoutForWidth:](self, "layoutForWidth:", v3);
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGSize result;
  CGRect v9;

  -[FIUICompetitionLearnMoreExampleView layoutForWidth:](self, "layoutForWidth:", a3.width, a3.height);
  -[UIImageView frame](self->_standRingView, "frame");
  v4 = CGRectGetMaxX(v9) + 1.0;
  -[UILabel _lastLineBaselineFrameOriginY](self->_totalPointsLabel, "_lastLineBaselineFrameOriginY");
  v6 = v5 + 16.5;
  v7 = v4;
  result.height = v6;
  result.width = v7;
  return result;
}

- (void)layoutForWidth:(double)a3
{
  NSNumber *previousLayoutWidth;
  float v6;
  NSNumber *v7;
  NSNumber *v8;
  CGRect v9;
  CGRect v10;
  CGRect v11;
  CGRect v12;

  previousLayoutWidth = self->_previousLayoutWidth;
  if (!previousLayoutWidth
    || (-[NSNumber floatValue](previousLayoutWidth, "floatValue"), vabdd_f64(v6, a3) >= 0.00000011920929))
  {
    -[UIImageView setFrame:](self->_moveRingView, "setFrame:", 1.0, 20.0, 49.0, 49.0);
    -[UIImageView frame](self->_moveRingView, "frame");
    -[UILabel setFrame:](self->_movePercentLabel, "setFrame:");
    -[UIImageView frame](self->_moveRingView, "frame");
    -[UIImageView setFrame:](self->_exerciseRingView, "setFrame:", CGRectGetMaxX(v9) + 3.5, 20.0, 49.0, 49.0);
    -[UIImageView frame](self->_exerciseRingView, "frame");
    -[UILabel setFrame:](self->_exercisePercentLabel, "setFrame:");
    -[UIImageView frame](self->_exerciseRingView, "frame");
    -[UIImageView setFrame:](self->_standRingView, "setFrame:", CGRectGetMaxX(v10) + 3.5, 20.0, 49.0, 49.0);
    -[UIImageView frame](self->_standRingView, "frame");
    -[UILabel setFrame:](self->_standPercentLabel, "setFrame:");
    -[UIImageView frame](self->_standRingView, "frame");
    -[UIView setFrame:](self->_separatorView, "setFrame:", (a3 + -154.0) * 0.5, CGRectGetMaxY(v11) + 8.0, 154.0, 1.5);
    -[UILabel sizeToFit](self->_totalPointsLabel, "sizeToFit");
    -[UILabel bounds](self->_totalPointsLabel, "bounds");
    -[UILabel setFrame:](self->_totalPointsLabel, "setFrame:", 0.0, 0.0, a3);
    -[UIView frame](self->_separatorView, "frame");
    -[UILabel _setLastLineBaselineFrameOriginY:](self->_totalPointsLabel, "_setLastLineBaselineFrameOriginY:", CGRectGetMaxY(v12) + 17.0);
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", a3);
    v7 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    v8 = self->_previousLayoutWidth;
    self->_previousLayoutWidth = v7;

  }
}

- (void)setSeparatorViewColor:(id)a3
{
  -[UIView setBackgroundColor:](self->_separatorView, "setBackgroundColor:", a3);
}

- (void)setTotalPointsLabelText:(id)a3
{
  -[UILabel setText:](self->_totalPointsLabel, "setText:", a3);
  -[FIUICompetitionLearnMoreExampleView setNeedsLayout](self, "setNeedsLayout");
}

- (void)setTotalPointsLabelColor:(id)a3
{
  -[UILabel setTextColor:](self->_totalPointsLabel, "setTextColor:", a3);
}

- (UIColor)separatorViewColor
{
  return self->_separatorViewColor;
}

- (UIColor)totalPointsLabelColor
{
  return self->_totalPointsLabelColor;
}

- (NSString)totalPointsLabelText
{
  return self->_totalPointsLabelText;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_totalPointsLabelText, 0);
  objc_storeStrong((id *)&self->_totalPointsLabelColor, 0);
  objc_storeStrong((id *)&self->_separatorViewColor, 0);
  objc_storeStrong((id *)&self->_previousLayoutWidth, 0);
  objc_storeStrong((id *)&self->_totalPointsLabel, 0);
  objc_storeStrong((id *)&self->_separatorView, 0);
  objc_storeStrong((id *)&self->_standPercentLabel, 0);
  objc_storeStrong((id *)&self->_exercisePercentLabel, 0);
  objc_storeStrong((id *)&self->_movePercentLabel, 0);
  objc_storeStrong((id *)&self->_standRingView, 0);
  objc_storeStrong((id *)&self->_exerciseRingView, 0);
  objc_storeStrong((id *)&self->_moveRingView, 0);
}

@end

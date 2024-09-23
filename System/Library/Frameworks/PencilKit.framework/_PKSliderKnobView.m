@implementation _PKSliderKnobView

- (_PKSliderKnobView)initWithFrame:(CGRect)a3
{
  _PKSliderKnobView *v3;
  id v4;
  void *v5;
  uint64_t v6;
  UIImageView *knobImageView;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)_PKSliderKnobView;
  v3 = -[_PKSliderKnobView initWithFrame:](&v9, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = objc_alloc(MEMORY[0x1E0DC3890]);
  objc_msgSend(MEMORY[0x1E0DC3870], "kitImageNamed:", CFSTR("UISliderKnob"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "initWithImage:", v5);
  knobImageView = v3->_knobImageView;
  v3->_knobImageView = (UIImageView *)v6;

  -[_PKSliderKnobView addSubview:](v3, "addSubview:", v3->_knobImageView);
  -[_PKSliderKnobView setExclusiveTouch:](v3, "setExclusiveTouch:", 1);
  return v3;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  double v3;
  double v4;
  CGSize result;

  v3 = 28.0;
  v4 = 28.0;
  result.height = v4;
  result.width = v3;
  return result;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)_PKSliderKnobView;
  -[_PKSliderKnobView layoutSubviews](&v15, sel_layoutSubviews);
  -[_PKSliderKnobView knobImageView](self, "knobImageView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "image");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "size");

  -[_PKSliderKnobView bounds](self, "bounds");
  UIRectGetCenter();
  objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scale");
  UIRectCenteredAboutPointScale();
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v13 = v12;
  -[_PKSliderKnobView knobImageView](self, "knobImageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setFrame:", v7, v9, v11, v13);

}

- (UIImageView)knobImageView
{
  return self->_knobImageView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobImageView, 0);
}

@end

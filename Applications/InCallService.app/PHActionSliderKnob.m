@implementation PHActionSliderKnob

- (PHActionSliderKnob)initWithFrame:(CGRect)a3
{
  PHActionSliderKnob *v3;
  uint64_t v4;
  UIColor *knobColor;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)PHActionSliderKnob;
  v3 = -[PHActionSliderKnob initWithFrame:](&v7, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    knobColor = v3->_knobColor;
    v3->_knobColor = (UIColor *)v4;

  }
  return v3;
}

- (BOOL)isOpaque
{
  return 0;
}

- (void)drawRect:(CGRect)a3
{
  double height;
  CGContext *CurrentContext;
  void *v6;
  void *v7;
  id v8;
  CGRect v9;

  height = a3.size.height;
  CurrentContext = UIGraphicsGetCurrentContext();
  UIGraphicsPushContext(CurrentContext);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSliderKnob knobColor](self, "knobColor"));
  v8 = v6;
  if (v6)
    CGContextSetFillColorWithColor(CurrentContext, (CGColorRef)objc_msgSend(objc_retainAutorelease(v6), "CGColor"));
  else
    CGContextSetRGBFillColor(CurrentContext, 1.0, 1.0, 1.0, 1.0);
  -[PHActionSliderKnob bounds](self, "bounds");
  CGContextFillRect(CurrentContext, v9);
  UIGraphicsPopContext();
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSliderKnob layer](self, "layer"));
  objc_msgSend(v7, "setCornerRadius:", height * 0.5);

}

- (UIColor)knobColor
{
  return self->_knobColor;
}

- (void)setKnobColor:(id)a3
{
  objc_storeStrong((id *)&self->_knobColor, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_knobColor, 0);
}

@end

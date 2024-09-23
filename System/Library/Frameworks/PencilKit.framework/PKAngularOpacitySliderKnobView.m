@implementation PKAngularOpacitySliderKnobView

- (PKAngularOpacitySliderKnobView)initWithFrame:(CGRect)a3
{
  PKAngularOpacitySliderKnobView *v3;
  PKAngularOpacitySliderKnobView *v4;
  void *v5;
  uint64_t v6;
  CALayer *backgroundCircleLayer;
  id v8;
  id v9;
  double v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PKAngularOpacitySliderKnobView;
  v3 = -[PKAngularOpacitySliderKnobView initWithFrame:](&v12, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PKAngularOpacitySliderKnobView layer](v3, "layer");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CD2840], "layer");
    v6 = objc_claimAutoreleasedReturnValue();
    backgroundCircleLayer = v4->_backgroundCircleLayer;
    v4->_backgroundCircleLayer = (CALayer *)v6;

    objc_msgSend(v5, "addSublayer:", v4->_backgroundCircleLayer);
    -[CALayer setBorderWidth:](v4->_backgroundCircleLayer, "setBorderWidth:", 4.0);
    objc_msgSend(MEMORY[0x1E0DC3658], "whiteColor");
    v8 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    -[CALayer setBorderColor:](v4->_backgroundCircleLayer, "setBorderColor:", objc_msgSend(v8, "CGColor"));

    -[CALayer setCornerCurve:](v4->_backgroundCircleLayer, "setCornerCurve:", *MEMORY[0x1E0CD2A68]);
    objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v5, "setShadowColor:", objc_msgSend(v9, "CGColor"));

    objc_msgSend(v5, "setShadowOffset:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
    objc_msgSend(v5, "setShadowRadius:", 1.0);
    LODWORD(v10) = 1036831949;
    objc_msgSend(v5, "setShadowOpacity:", v10);

  }
  return v4;
}

- (void)setFrame:(CGRect)a3
{
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  CGFloat v13;
  double v14;
  const CGPath *v15;
  const CGPath *CopyByStrokingPath;
  void *v17;
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)PKAngularOpacitySliderKnobView;
  -[PKAngularOpacitySliderKnobView setFrame:](&v18, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[PKAngularOpacitySliderKnobView bounds](self, "bounds");
  v8 = v7;
  v9 = v4;
  v10 = v5;
  v11 = v6;
  if (v5 >= v6)
    v12 = v6;
  else
    v12 = v5;
  v13 = v12 * 0.5;
  v14 = v8;
  v15 = CGPathCreateWithRoundedRect(*(CGRect *)(&v4 - 1), v13, v13, 0);
  CopyByStrokingPath = CGPathCreateCopyByStrokingPath(v15, 0, 4.0, kCGLineCapRound, kCGLineJoinRound, 0.0);
  CGPathRelease(v15);
  -[PKAngularOpacitySliderKnobView layer](self, "layer");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setShadowPath:", CopyByStrokingPath);

  CGPathRelease(CopyByStrokingPath);
  -[CALayer setFrame:](self->_backgroundCircleLayer, "setFrame:", v8, v9, v10, v11);
  -[CALayer setCornerRadius:](self->_backgroundCircleLayer, "setCornerRadius:", v13);
}

- (CALayer)backgroundCircleLayer
{
  return self->_backgroundCircleLayer;
}

- (void)setBackgroundCircleLayer:(id)a3
{
  objc_storeStrong((id *)&self->_backgroundCircleLayer, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_backgroundCircleLayer, 0);
}

@end

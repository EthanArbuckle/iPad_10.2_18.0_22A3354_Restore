@implementation HKReferenceRangeDotView

- (HKReferenceRangeDotView)initWithFrame:(CGRect)a3
{
  HKReferenceRangeDotView *v3;
  void *v4;
  _HKReferenceRangeDotViewDot *v5;
  _HKReferenceRangeDotViewDot *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)HKReferenceRangeDotView;
  v3 = -[HKReferenceRangeDotView initWithFrame:](&v8, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[HKReferenceRangeDotView setBackgroundColor:](v3, "setBackgroundColor:", v4);

    -[HKReferenceRangeDotView setClipsToBounds:](v3, "setClipsToBounds:", 0);
    v5 = [_HKReferenceRangeDotViewDot alloc];
    -[HKReferenceRangeDotView desiredDotViewFrame](v3, "desiredDotViewFrame");
    v6 = -[_HKReferenceRangeDotViewDot initWithFrame:](v5, "initWithFrame:");
    -[HKReferenceRangeDotView addSubview:](v3, "addSubview:", v6);
    objc_storeWeak((id *)&v3->_dotView, v6);

  }
  return v3;
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
  id WeakRetained;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)HKReferenceRangeDotView;
  -[HKReferenceRangeDotView setFrame:](&v13, sel_setFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  -[HKReferenceRangeDotView desiredDotViewFrame](self, "desiredDotViewFrame");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  WeakRetained = objc_loadWeakRetained((id *)&self->_dotView);
  objc_msgSend(WeakRetained, "setFrame:", v5, v7, v9, v11);

}

- (CGRect)desiredDotViewFrame
{
  CGRect v2;

  -[HKReferenceRangeDotView bounds](self, "bounds");
  return CGRectInset(v2, -1.0, -1.0);
}

- (UIColor)dotColor
{
  id WeakRetained;
  void *v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_dotView);
  objc_msgSend(WeakRetained, "dotColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (UIColor *)v3;
}

- (void)setDotColor:(id)a3
{
  _HKReferenceRangeDotViewDot **p_dotView;
  id v4;
  id WeakRetained;

  p_dotView = &self->_dotView;
  v4 = a3;
  WeakRetained = objc_loadWeakRetained((id *)p_dotView);
  objc_msgSend(WeakRetained, "setDotColor:", v4);

}

- (_HKReferenceRangeDotViewDot)dotView
{
  return (_HKReferenceRangeDotViewDot *)objc_loadWeakRetained((id *)&self->_dotView);
}

- (void)setDotView:(id)a3
{
  objc_storeWeak((id *)&self->_dotView, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_dotView);
}

@end

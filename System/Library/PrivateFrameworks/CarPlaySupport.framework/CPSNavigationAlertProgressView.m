@implementation CPSNavigationAlertProgressView

- (CPSNavigationAlertProgressView)initWithFrame:(CGRect)a3
{
  double v3;
  CPSNavigationAlertProgressView *v5;
  id v6;
  double v7;
  id v8;
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  CPSNavigationAlertProgressView *v13;
  objc_super v14;
  SEL v15;
  CPSNavigationAlertProgressView *v16;
  CGRect v17;

  v17 = a3;
  v15 = a2;
  v16 = 0;
  v14.receiver = self;
  v14.super_class = (Class)CPSNavigationAlertProgressView;
  v13 = -[CPSNavigationAlertProgressView initWithFrame:](&v14, sel_initWithFrame_, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v16 = v13;
  objc_storeStrong((id *)&v16, v13);
  if (v13)
  {
    v6 = (id)objc_msgSend(MEMORY[0x24BDF6950], "clearColor");
    -[CPSNavigationAlertProgressView setBackgroundColor:](v16, "setBackgroundColor:");

    -[CPSNavigationAlertProgressView intrinsicContentSize](v16, "intrinsicContentSize");
    v7 = v3 / 2.0;
    v8 = (id)-[CPSNavigationAlertProgressView layer](v16, "layer");
    objc_msgSend(v8, "setCornerRadius:", v7);

    v9 = (id)-[CPSNavigationAlertProgressView layer](v16, "layer");
    objc_msgSend(v9, "setMaskedCorners:", 15);

    v10 = *MEMORY[0x24BDE58E8];
    v11 = (id)-[CPSNavigationAlertProgressView layer](v16, "layer");
    objc_msgSend(v11, "setCornerCurve:", v10);

    v12 = (id)-[CPSNavigationAlertProgressView layer](v16, "layer");
    objc_msgSend(v12, "setMasksToBounds:", 1);

  }
  v5 = v16;
  objc_storeStrong((id *)&v16, 0);
  return v5;
}

- (CGSize)intrinsicContentSize
{
  double v2;
  double v3;
  CGSize result;

  CGSizeMake_11();
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)duration
{
  return self->_duration;
}

- (void)setDuration:(double)a3
{
  self->_duration = a3;
}

- (UIView)progressView
{
  return self->_progressView;
}

- (void)setProgressView:(id)a3
{
  objc_storeStrong((id *)&self->_progressView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_progressView, 0);
}

@end

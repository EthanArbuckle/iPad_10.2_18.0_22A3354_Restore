@implementation WFPassthroughDimmingView

- (WFPassthroughDimmingView)initWithFrame:(CGRect)a3
{
  WFPassthroughDimmingView *v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  double v8;
  double height;
  void *v10;
  void *v11;
  WFPassthroughDimmingView *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)WFPassthroughDimmingView;
  v3 = -[WFPassthroughDimmingView initWithFrame:](&v14, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  if (v3)
  {
    v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor")));
    v5 = objc_msgSend(v4, "CGColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](v3, "layer"));
    objc_msgSend(v6, "setShadowColor:", v5);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](v3, "layer"));
    LODWORD(v8) = 1051931443;
    objc_msgSend(v7, "setShadowOpacity:", v8);

    height = CGSizeZero.height;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](v3, "layer"));
    objc_msgSend(v10, "setShadowOffset:", CGSizeZero.width, height);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](v3, "layer"));
    objc_msgSend(v11, "setShadowRadius:", 0.0);

    v12 = v3;
  }

  return v3;
}

- (void)layoutSubviews
{
  id v3;
  void *v4;
  id v5;

  -[WFPassthroughDimmingView bounds](self, "bounds");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:")));
  v3 = objc_msgSend(v5, "CGPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[WFPassthroughDimmingView layer](self, "layer"));
  objc_msgSend(v4, "setShadowPath:", v3);

}

- (void)setCaptureTouches:(BOOL)a3
{
  id v4;

  self->_captureTouches = a3;
  if (a3)
  {
    v4 = (id)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.0, 0.01));
    -[WFPassthroughDimmingView setBackgroundColor:](self, "setBackgroundColor:", v4);

  }
  else
  {
    -[WFPassthroughDimmingView setBackgroundColor:](self, "setBackgroundColor:", 0);
  }
}

- (BOOL)captureTouches
{
  return self->_captureTouches;
}

@end

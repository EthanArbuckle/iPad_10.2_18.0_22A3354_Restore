@implementation _SSSShadowViewInnerViewWithShadow

- (_SSSShadowViewInnerViewWithShadow)initWithFrame:(CGRect)a3
{
  _SSSShadowViewInnerViewWithShadow *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)_SSSShadowViewInnerViewWithShadow;
  v3 = -[_SSSShadowViewInnerViewWithShadow initWithFrame:](&v11, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSShadowViewInnerViewWithShadow layer](v3, "layer"));
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[SSSShadowView shadowColor](SSSShadowView, "shadowColor")));
  objc_msgSend(v4, "setShadowColor:", objc_msgSend(v5, "CGColor"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSShadowViewInnerViewWithShadow layer](v3, "layer"));
  +[SSSShadowView shadowRadius](SSSShadowView, "shadowRadius");
  objc_msgSend(v6, "setShadowRadius:");

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSShadowViewInnerViewWithShadow layer](v3, "layer"));
  +[SSSShadowView shadowOffset](SSSShadowView, "shadowOffset");
  objc_msgSend(v7, "setShadowOffset:");

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSShadowViewInnerViewWithShadow layer](v3, "layer"));
  +[SSSShadowView shadowOpacity](SSSShadowView, "shadowOpacity");
  *(float *)&v9 = v9;
  objc_msgSend(v8, "setShadowOpacity:", v9);

  return v3;
}

- (void)setShadowPath:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;

  v4 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[_SSSShadowViewInnerViewWithShadow layer](self, "layer"));
  v5 = objc_retainAutorelease(v4);
  v6 = objc_msgSend(v5, "CGPath");

  objc_msgSend(v7, "setShadowPath:", v6);
}

- (UIBezierPath)shadowPath
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[_SSSShadowViewInnerViewWithShadow layer](self, "layer"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithCGPath:](UIBezierPath, "bezierPathWithCGPath:", objc_msgSend(v2, "shadowPath")));

  return (UIBezierPath *)v3;
}

@end

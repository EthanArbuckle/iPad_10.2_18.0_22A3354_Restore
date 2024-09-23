@implementation UIView

- (UIColor)borderColor
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  v3 = objc_msgSend(v2, "borderColor");

  return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v3);
}

- (void)setBorderColor:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v5, "setBorderColor:", v4);

}

- (double)borderWidth
{
  id AssociatedObject;
  void *v3;
  float v4;
  double v5;

  AssociatedObject = objc_getAssociatedObject(self, "borderWidth");
  v3 = (void *)objc_claimAutoreleasedReturnValue(AssociatedObject);
  objc_msgSend(v3, "floatValue");
  v5 = v4;

  return v5;
}

- (void)setBorderWidth:(double)a3
{
  void *v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  objc_setAssociatedObject(self, "borderWidth", v5, (void *)1);

  v9 = (id)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v9, "scale");
  v7 = a3 / v6;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v8, "setBorderWidth:", v7);

}

- (UIColor)shadowUIColor
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  v3 = objc_msgSend(v2, "shadowColor");

  return +[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v3);
}

- (void)setShadowUIColor:(id)a3
{
  id v4;
  id v5;

  v4 = objc_msgSend(objc_retainAutorelease(a3), "CGColor");
  v5 = (id)objc_claimAutoreleasedReturnValue(-[UIView layer](self, "layer"));
  objc_msgSend(v5, "setShadowColor:", v4);

}

@end

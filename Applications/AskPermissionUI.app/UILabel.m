@implementation UILabel

- (double)heightForWidth:(double)a3
{
  void *v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  NSAttributedStringKey v11;
  void *v12;

  v11 = NSFontAttributeName;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel font](self, "font"));
  v12 = v5;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v12, &v11, 1));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[UILabel text](self, "text"));
  objc_msgSend(v7, "boundingRectWithSize:options:attributes:context:", 3, v6, 0, a3, 1.79769313e308);
  v9 = v8;

  return v9;
}

@end

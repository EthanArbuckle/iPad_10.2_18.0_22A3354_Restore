@implementation TVLatencyColorimeterTrainingView

- (id)makeCAPackage
{
  NSBundle *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, a2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "URLForResource:withExtension:", CFSTR("TVLatencyColorimeter"), CFSTR("ca")));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[CAPackage packageWithContentsOfURL:type:options:error:](CAPackage, "packageWithContentsOfURL:type:options:error:", v4, kCAPackageTypeCAMLBundle, 0, 0));

  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)TVLatencyColorimeterTrainingView;
  -[TVLatencyColorimeterTrainingView layoutSubviews](&v13, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterTrainingView superview](self, "superview"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[TVLatencyColorimeterTrainingView layer](self, "layer"));
  objc_msgSend(v12, "setFrame:", v5, v7, v9, v11);

}

@end

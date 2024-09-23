@implementation ControlCenterTrainingView

- (id)makeCAPackage
{
  UIUserInterfaceLayoutDirection v3;
  __CFString *v4;
  __CFString *v5;
  void *v6;
  unint64_t v7;
  const char *v8;
  void *v9;
  void *v10;
  unint64_t v11;
  uint64_t v12;
  uint64_t v13;
  NSBundle *v14;
  void *v15;
  void *v16;
  void *v17;

  v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[ControlCenterTrainingView semanticContentAttribute](self, "semanticContentAttribute"));
  v4 = &stru_10017E3D8;
  if (v3 == UIUserInterfaceLayoutDirectionRightToLeft)
    v4 = CFSTR("-RTL");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v7 = (unint64_t)objc_msgSend(v6, "userInterfaceIdiom");

  if ((v7 & 0xFFFFFFFFFFFFFFFBLL) == 1)
    v8 = "ipad";
  else
    v8 = "iphone";
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("ControlCenter-PressToExpand%@~%s"), v5, v8));

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v11 = (unint64_t)objc_msgSend(v10, "userInterfaceIdiom");

  if ((v11 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v13 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@-D73"), v9));

    v9 = (void *)v13;
  }
  v14 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self, v12));
  v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URLForResource:withExtension:", v9, CFSTR("ca")));
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CAPackage packageWithContentsOfURL:type:options:error:](CAPackage, "packageWithContentsOfURL:type:options:error:", v16, kCAPackageTypeCAMLBundle, 0, 0));

  return v17;
}

- (float)duration
{
  return 8.0;
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  unint64_t v3;
  double v4;
  double v5;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  v4 = dbl_100135690[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v5 = dbl_1001356A0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  result.height = v5;
  result.width = v4;
  return result;
}

@end

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
  NSBundle *v10;
  void *v11;
  void *v12;
  void *v13;

  v3 = +[UIView userInterfaceLayoutDirectionForSemanticContentAttribute:](UIView, "userInterfaceLayoutDirectionForSemanticContentAttribute:", -[ControlCenterTrainingView semanticContentAttribute](self, "semanticContentAttribute"));
  v4 = &stru_1000AA1E0;
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

  v10 = +[NSBundle bundleForClass:](NSBundle, "bundleForClass:", objc_opt_class(self));
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "URLForResource:withExtension:", v9, CFSTR("ca")));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CAPackage packageWithContentsOfURL:type:options:error:](CAPackage, "packageWithContentsOfURL:type:options:error:", v12, kCAPackageTypeCAMLBundle, 0, 0));

  return v13;
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

  v4 = dbl_1000876E0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  v5 = dbl_1000876F0[(v3 & 0xFFFFFFFFFFFFFFFBLL) == 1];
  result.height = v5;
  result.width = v4;
  return result;
}

@end

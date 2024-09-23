@implementation LUIPrivacyStyle

+ (id)sharedStyle
{
  if (qword_100088E58 != -1)
    dispatch_once(&qword_100088E58, &stru_100069C80);
  return (id)qword_100088E50;
}

- (id)privacyViewTextFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0);
}

- (id)privacyViewTextColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[LUIStyle sharedStyle](LUIStyle, "sharedStyle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secondaryColor"));

  return v3;
}

- (double)privacyViewBaselineToBottomPadding
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyStyle privacyViewTextFont](self, "privacyViewTextFont"));
  objc_msgSend(v2, "descender");
  v4 = v3 + 13.0;

  return v4;
}

- (id)managedDevicesTextFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 18.0);
}

- (id)managedDevicesTextColor
{
  return +[UIColor labelColor](UIColor, "labelColor");
}

- (id)managedDevicesTitleFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 48.0, UIFontWeightThin);
}

- (UIEdgeInsets)managedDevicesEdgeInsets
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyStyle managedDevicesTitleFont](self, "managedDevicesTitleFont"));
  objc_msgSend(v2, "ascender");
  v4 = 86.0 - v3;

  v5 = 92.0;
  v6 = v4;
  v7 = 92.0;
  v8 = 92.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (double)managedDevicesTitleToTextPadding
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyStyle managedDevicesTextFont](self, "managedDevicesTextFont"));
  objc_msgSend(v3, "ascender");
  v5 = 54.0 - v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIPrivacyStyle managedDevicesTitleFont](self, "managedDevicesTitleFont"));
  objc_msgSend(v6, "descender");
  v8 = v5 + v7;

  return v8;
}

@end

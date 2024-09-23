@implementation LUIStyle

+ (id)sharedStyle
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F89C;
  block[3] = &unk_100069D80;
  block[4] = a1;
  if (qword_100088EA0 != -1)
    dispatch_once(&qword_100088EA0, block);
  return (id)qword_100088E98;
}

+ (id)sharedStyleForLoggedInState
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10002F93C;
  block[3] = &unk_100069D80;
  block[4] = a1;
  if (qword_100088EB0 != -1)
    dispatch_once(&qword_100088EB0, block);
  return (id)qword_100088EA8;
}

+ (BOOL)isDeviceXL
{
  if (qword_100088EC0 != -1)
    dispatch_once(&qword_100088EC0, &stru_100069DA0);
  return byte_100088EB8;
}

- (LUIStyle)initWithWallpaperVariant:(int64_t)a3
{
  LUIStyle *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)LUIStyle;
  result = -[LUIStyle init](&v5, "init");
  if (result)
    result->_wallpaperVariant = a3;
  return result;
}

- (id)wallpaperLegibilitySettings
{
  void *v3;
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle legibilityObserver](self, "legibilityObserver"));
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = (id)objc_claimAutoreleasedReturnValue(+[LUILegibilityObserver sharedInstance](LUILegibilityObserver, "sharedInstance"));
  v6 = v5;

  if ((id)-[LUIStyle wallpaperVariant](self, "wallpaperVariant") == (id)1)
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "homeScreenWallpaperLegibilitySettings"));
  else
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "lockScreenWallpaperLegibilitySettings"));
  v8 = v7;
  if (v7)
    v9 = v7;
  else
    v9 = (id)objc_claimAutoreleasedReturnValue(-[LUIStyle _defaultWallpaperLegibilitySettings](self, "_defaultWallpaperLegibilitySettings"));
  v10 = v9;

  return v10;
}

- (id)_defaultWallpaperLegibilitySettings
{
  if (qword_100088ED0 != -1)
    dispatch_once(&qword_100088ED0, &stru_100069DC0);
  return (id)qword_100088EC8;
}

- (double)landscapeOffset
{
  return 129.0;
}

- (int64_t)statusBarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle wallpaperLegibilitySettings](self, "wallpaperLegibilitySettings"));
  v3 = objc_msgSend(v2, "style");

  return v3 == (id)1;
}

- (int64_t)avatarStyle
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle wallpaperLegibilitySettings](self, "wallpaperLegibilitySettings"));
  v3 = objc_msgSend(v2, "style");

  if (v3 == (id)2)
    return 2;
  else
    return 3;
}

- (id)monogramGroupImageColor
{
  id v3;
  void *v4;
  id v5;
  id v6;
  double v7;
  double v8;
  id v9;

  v3 = objc_msgSend(objc_alloc((Class)UIColor), "initWithWhite:alpha:", 0.0, 0.300000012);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle wallpaperLegibilitySettings](self, "wallpaperLegibilitySettings"));
  v5 = objc_msgSend(v4, "style");

  if (v5 == (id)2)
  {
    v6 = objc_alloc((Class)UIColor);
    v8 = 0.0;
    v7 = 0.300000012;
    goto LABEL_5;
  }
  if (v5 == (id)1)
  {
    v6 = objc_alloc((Class)UIColor);
    v7 = 0.649999976;
    v8 = 1.0;
LABEL_5:
    v9 = objc_msgSend(v6, "initWithWhite:alpha:", v8, v7);

    v3 = v9;
  }
  return v3;
}

- (int64_t)activityIndicatorViewStyle
{
  void *v2;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle wallpaperLegibilitySettings](self, "wallpaperLegibilitySettings"));
  objc_msgSend(v2, "style");

  return 100;
}

- (id)overallTextColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle wallpaperLegibilitySettings](self, "wallpaperLegibilitySettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "primaryColor"));

  return v3;
}

- (id)secondaryColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle wallpaperLegibilitySettings](self, "wallpaperLegibilitySettings"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "secondaryColor"));

  return v3;
}

- (id)chevronColor
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle overallTextColor](self, "overallTextColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "colorWithAlphaComponent:", 0.25));

  return v3;
}

- (id)headerTitleFont
{
  -[LUIStyle _headerFontSize](self, "_headerFontSize");
  return +[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:");
}

- (id)headerSubTitleFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0);
}

- (id)footerTitleFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 10.0);
}

- (double)footerTitleLeading
{
  return 13.0;
}

- (id)hintFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0);
}

- (id)buttonTitleFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 12.0);
}

- (double)baselineInsetForHeaderTitle
{
  unsigned int v2;
  double result;

  v2 = +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  result = 156.0;
  if (v2)
    return 200.0;
  return result;
}

- (double)baselineHintInsetForPasscodeStyle:(int)a3
{
  unsigned int v4;
  double result;
  double v6;

  v4 = +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  result = 200.0;
  if (v4)
    result = 308.0;
  v6 = 600.0;
  if (v4)
    v6 = 716.0;
  if (a3 >= 3)
    return v6;
  return result;
}

- (double)sideInsetForHintLabel
{
  unsigned int v2;
  double result;

  v2 = +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  result = 60.0;
  if (v2)
    return 100.0;
  return result;
}

- (double)baselineToBottomInsetForFooterButton
{
  void *v3;
  double v4;
  double v5;

  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle footerTitleFont](self, "footerTitleFont"));
  objc_msgSend(v3, "ascender");
  v5 = 48.0 - v4;

  return v5;
}

- (UIEdgeInsets)edgeInsetsForHeader
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  UIEdgeInsets result;

  -[LUIStyle baselineInsetForHeaderTitle](self, "baselineInsetForHeaderTitle");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle headerTitleFont](self, "headerTitleFont"));
  objc_msgSend(v5, "ascender");
  v7 = v4 - v6;

  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle headerTitleFont](self, "headerTitleFont"));
  objc_msgSend(v8, "descender");
  v10 = v9 + 56.0;

  v11 = 16.0;
  v12 = 16.0;
  v13 = v7;
  v14 = v10;
  result.right = v12;
  result.bottom = v14;
  result.left = v11;
  result.top = v13;
  return result;
}

- (UIEdgeInsets)tableViewSeperatorInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 15.0;
  v4 = 0.0;
  v5 = 15.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)tableViewContentInset
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 15.0;
  v4 = 0.0;
  v5 = 0.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (UIEdgeInsets)edgeInsetsForFooterButton
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  UIEdgeInsets result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle buttonTitleFont](self, "buttonTitleFont"));
  objc_msgSend(v2, "descender");
  v4 = v3 + 32.0;

  v5 = 68.0;
  v6 = 0.0;
  v7 = v4;
  v8 = 68.0;
  result.right = v8;
  result.bottom = v7;
  result.left = v5;
  result.top = v6;
  return result;
}

- (id)footerButtonTitleFont
{
  return +[UIFont _thinSystemFontOfSize:](UIFont, "_thinSystemFontOfSize:", 17.0);
}

- (double)footerButtonWidth
{
  return 115.0;
}

- (double)_headerFontSize
{
  return 48.0;
}

- (double)headerTitleMinimumScaleFactor
{
  double v2;

  -[LUIStyle _headerFontSize](self, "_headerFontSize");
  return 30.0 / v2;
}

- (UIEdgeInsets)edgeInsetsForFooter
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  v2 = 0.0;
  v3 = 16.0;
  v4 = 0.0;
  v5 = 16.0;
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (double)baselineInsetForFooterButton
{
  void *v3;
  double v4;
  double v5;

  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle footerButtonFont](self, "footerButtonFont"));
  objc_msgSend(v3, "ascender");
  v5 = 36.0 - v4;

  return v5;
}

- (double)baselineInsetForSpinner
{
  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  return 56.0;
}

- (double)bottomInset
{
  unsigned int v2;
  double result;

  v2 = +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  result = 104.0;
  if (v2)
    return 128.0;
  return result;
}

- (id)tableCellFont
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 17.0, UIFontWeightMedium);
}

- (id)footerButtonFont
{
  return +[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0);
}

- (double)singleLineCellHeightForTable:(id)a3
{
  return 60.0;
}

- (double)titleToSubTitleSpacing
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle headerTitleFont](self, "headerTitleFont"));
  objc_msgSend(v3, "descender");
  v5 = v4 + 48.0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle headerSubTitleFont](self, "headerSubTitleFont"));
  objc_msgSend(v6, "ascender");
  v8 = v5 - v7;

  return v8;
}

- (double)nonTableHorizontalMargin
{
  unsigned int v2;
  double result;

  v2 = +[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL");
  result = 115.0;
  if (v2)
    return 244.0;
  return result;
}

- (UIEdgeInsets)edgeInsetsForTable:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  UIEdgeInsets result;

  v4 = a3;
  -[LUIStyle nonTableHorizontalMargin](self, "nonTableHorizontalMargin");
  v6 = v5;
  objc_msgSend(v4, "contentInset");
  v8 = v7;
  objc_msgSend(v4, "contentInset");
  v10 = v9;

  -[LUIStyle bottomInset](self, "bottomInset");
  v12 = v11;
  v13 = v8;
  v14 = v6 - v10;
  v15 = v6;
  result.right = v15;
  result.bottom = v12;
  result.left = v14;
  result.top = v13;
  return result;
}

- (double)fixedWidthForClassTable
{
  double v2;
  double v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;

  -[LUIStyle nonTableHorizontalMargin](self, "nonTableHorizontalMargin");
  v3 = v2;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v4, "bounds");
  v6 = v5;
  v8 = v7;

  if (v6 >= v8)
    v9 = v8;
  else
    v9 = v6;
  return v9 + v3 * -2.0;
}

- (id)backgroundColor
{
  return +[UIColor clearColor](UIColor, "clearColor");
}

- (unint64_t)numberOfRecentUsersToShow
{
  if (+[LUIStyle isDeviceXL](LUIStyle, "isDeviceXL"))
    return 12;
  else
    return 8;
}

- (id)tableViewSeperatorColor
{
  return +[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 0.878431373, 0.6);
}

- (void)applyThemeToLabel:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle overallTextColor](self, "overallTextColor"));
  objc_msgSend(v4, "setTextColor:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v6);

}

- (void)applyThemeToTextView:(id)a3
{
  id v4;
  void *v5;
  id v6;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v4, "setBackgroundColor:", v5);

  v6 = (id)objc_claimAutoreleasedReturnValue(-[LUIStyle overallTextColor](self, "overallTextColor"));
  objc_msgSend(v4, "setTextColor:", v6);

}

- (void)applyThemeToAllTableViews
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;

  v10 = objc_opt_class(UITableViewHeaderFooterView);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v10, 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UILabel appearanceWhenContainedInInstancesOfClasses:](UILabel, "appearanceWhenContainedInInstancesOfClasses:", v3));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle overallTextColor](self, "overallTextColor"));
  objc_msgSend(v4, "setTextColor:", v5);

  v9 = objc_opt_class(UITableViewHeaderFooterView);
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v9, 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[UILabel appearanceWhenContainedInInstancesOfClasses:](UILabel, "appearanceWhenContainedInInstancesOfClasses:", v6));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v7, "setBackgroundColor:", v8);

}

- (void)applyThemeToTitleLabel:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;

  v10 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle overallTextColor](self, "overallTextColor"));
  objc_msgSend(v10, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v10, "setBackgroundColor:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle headerTitleFont](self, "headerTitleFont"));
  objc_msgSend(v10, "setFont:", v6);

  objc_msgSend(v10, "setTextAlignment:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "text"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "componentsSeparatedByString:", CFSTR(" ")));
  v9 = objc_msgSend(v8, "count");

  if (v9 == (id)1)
  {
    objc_msgSend(v10, "setNumberOfLines:", 1);
    objc_msgSend(v10, "setAdjustsFontSizeToFitWidth:", 1);
  }

}

- (void)applyThemeToTableCell:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  double v7;
  id v8;

  v4 = a3;
  v8 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "textLabel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[LUIStyle tableCellFont](self, "tableCellFont"));
  objc_msgSend(v8, "setFont:", v5);

  objc_msgSend(v8, "setAdjustsFontSizeToFitWidth:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "font"));
  objc_msgSend(v6, "pointSize");
  objc_msgSend(v8, "setMinimumScaleFactor:", 12.0 / v7);

  objc_msgSend(v4, "setAccessoryType:", 1);
}

- (void)applyThemeToSectionHeaderLabel:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.145098039, 0.145098039, 0.145098039, 1.0));
  objc_msgSend(v3, "setTextColor:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 14.0));
  objc_msgSend(v3, "setFont:", v5);

  objc_msgSend(v3, "setTextAlignment:", 4);
  v6 = (id)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v3, "setBackgroundColor:", v6);

}

- (int64_t)wallpaperVariant
{
  return self->_wallpaperVariant;
}

- (void)setWallpaperVariant:(int64_t)a3
{
  self->_wallpaperVariant = a3;
}

- (LUILegibilityObserver)legibilityObserver
{
  return (LUILegibilityObserver *)objc_getProperty(self, a2, 16, 1);
}

- (void)setLegibilityObserver:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_legibilityObserver, 0);
}

@end

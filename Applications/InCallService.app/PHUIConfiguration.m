@implementation PHUIConfiguration

+ (double)yOffsetMultiplierForParticipantsView
{
  if (qword_1002DC590 != -1)
    dispatch_once(&qword_1002DC590, &stru_100284928);
  return *(double *)&qword_1002D4F20;
}

+ (unint64_t)yTopMarginSpacingForMultiParticipantsView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000093AC;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC5A0 != -1)
    dispatch_once(&qword_1002DC5A0, block);
  return qword_1002DC598;
}

+ (int64_t)yOffsetLayoutAttributeForParticipantsView
{
  if (qword_1002DC5B0 != -1)
    dispatch_once(&qword_1002DC5B0, &stru_100284968);
  if (byte_1002DC5A8)
    return 4;
  else
    return 3;
}

+ (double)intrinsicWidthForParticipantsView
{
  if (qword_1002DC5C0 != -1)
    dispatch_once(&qword_1002DC5C0, &stru_100284988);
  return *(double *)&qword_1002DC5B8;
}

+ (unint64_t)inCallParticipantsSpacing
{
  if (qword_1002DC5D0 != -1)
    dispatch_once(&qword_1002DC5D0, &stru_1002849A8);
  if (byte_1002DC5C8)
    return 2;
  else
    return 1;
}

+ (id)singleCallParticipantLabelFontForCallDisplayStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  switch(a3)
  {
    case 0:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelBannerMaximumFont](PHUIConfiguration, "singleCallParticipantLabelBannerMaximumFont", v3, v4));
      break;
    case 1:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelMiniWindowFont](PHUIConfiguration, "singleCallParticipantLabelMiniWindowFont", v3, v4));
      break;
    case 2:
    case 4:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelFullscreenFont](PHUIConfiguration, "singleCallParticipantLabelFullscreenFont", v3, v4));
      break;
    case 3:
      a1 = (id)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelAmbientFont](PHUIConfiguration, "singleCallParticipantLabelAmbientFont", v3, v4));
      break;
    default:
      return a1;
  }
  return a1;
}

+ (id)singleCallParticipantLabelFullscreenFont
{
  void *v2;
  unsigned int v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v3 = objc_msgSend(v2, "isHeroImageEnabled");

  if (v3)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredBoldFontForTextStyle:](UIFont, "phPreferredBoldFontForTextStyle:", UIFontTextStyleLargeTitle));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", UIFontTextStyleLargeTitle));
  return v4;
}

+ (id)singleCallParticipantLabelAmbientFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:addingSymbolicTraits:", UIFontTextStyleLargeTitle, 2));
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v2, 85.0));

  return v3;
}

+ (id)singleCallParticipantLabelBannerFontForText:(id)a3 availableWidth:(double)a4
{
  id v5;
  void *v6;
  id v7;
  BOOL v8;
  void *v9;
  void *v10;
  double v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  id v21;
  NSAttributedStringKey v23;
  void *v24;

  v5 = a3;
  v6 = v5;
  if (!v5 || ((v7 = objc_msgSend(v5, "length"), a4 != 0.0) ? (v8 = v7 == 0) : (v8 = 1), v8))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelBannerMaximumFont](PHUIConfiguration, "singleCallParticipantLabelBannerMaximumFont"));
  }
  else
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelBannerMaximumFont](PHUIConfiguration, "singleCallParticipantLabelBannerMaximumFont"));
    objc_msgSend(v10, "pointSize");
    v12 = v11;

    v13 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelBannerMinimumFont](PHUIConfiguration, "singleCallParticipantLabelBannerMinimumFont"));
    objc_msgSend(v13, "pointSize");
    v15 = v14;

    v16 = 0;
    if (v12 <= v15)
    {
LABEL_11:
      v21 = (id)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelBannerMinimumFont](PHUIConfiguration, "singleCallParticipantLabelBannerMinimumFont"));
    }
    else
    {
      while (1)
      {
        v17 = v16;
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallParticipantLabelFontForBannerWithPointSize:](PHUIConfiguration, "singleCallParticipantLabelFontForBannerWithPointSize:", v12));

        v23 = NSFontAttributeName;
        v24 = v16;
        v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v24, &v23, 1));
        objc_msgSend(v6, "sizeWithAttributes:", v18);
        v20 = v19;

        if (v20 <= a4)
          break;
        v12 = v12 + -0.5;
        if (v12 <= v15)
          goto LABEL_11;
      }
      v21 = v16;
      v16 = v21;
    }
    v9 = v21;

  }
  return v9;
}

+ (id)singleCallParticipantLabelMiniWindowFont
{
  return +[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", UIFontTextStyleTitle2);
}

+ (id)singleCallParticipantLabelBannerMaximumFont
{
  void *v2;
  void *v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:", UIFontTextStyleTitle2));
  objc_msgSend(v2, "pointSize");
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:"));

  return v3;
}

+ (id)singleCallParticipantLabelBannerMinimumFont
{
  return +[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", UIFontTextStyleHeadline);
}

+ (id)singleCallParticipantLabelFontForBannerWithPointSize:(double)a3
{
  return +[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", a3, UIFontWeightSemibold);
}

+ (id)statusLabelFontColorForCallDisplayStyle:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((unint64_t)a3 <= 4)
    a1 = (id)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor", v3, v4));
  return a1;
}

+ (id)multipleCallParticipantLabelFont
{
  if (qword_1002DC5E0 != -1)
    dispatch_once(&qword_1002DC5E0, &stru_1002849C8);
  return (id)qword_1002DC5D8;
}

+ (id)multipleCallParticipantLabelFontMiniWindow
{
  if (qword_1002DC5F0 != -1)
    dispatch_once(&qword_1002DC5F0, &stru_1002849E8);
  return (id)qword_1002DC5E8;
}

+ (id)singleCallSmallerStatusLabelFont
{
  if (qword_1002DC600 != -1)
    dispatch_once(&qword_1002DC600, &stru_100284A08);
  return (id)qword_1002DC5F8;
}

+ (id)singleCallSmallStatusLabelFont
{
  if (qword_1002DC610 != -1)
    dispatch_once(&qword_1002DC610, &stru_100284A28);
  return (id)qword_1002DC608;
}

+ (id)singleCallLargeStatusLabelFont
{
  if (qword_1002DC620 != -1)
    dispatch_once(&qword_1002DC620, &stru_100284A48);
  return (id)qword_1002DC618;
}

+ (id)singleCallStatusLabelFontForCallDisplayStyle:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  const UIFontTextStyle *v6;
  void *v7;

  switch(a3)
  {
    case 0:
      v6 = &UIFontTextStyleSubheadline;
      goto LABEL_5;
    case 1:
      v6 = &UIFontTextStyleBody;
LABEL_5:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont phPreferredFontForTextStyle:](UIFont, "phPreferredFontForTextStyle:", *v6));
      return v3;
    case 2:
    case 4:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:", UIFontTextStyleTitle2));
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
      objc_msgSend(v5, "isButtonLayoutEnabled");

      objc_msgSend(v4, "pointSize");
      goto LABEL_7;
    case 3:
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor phPreferredFontDescriptorForTextStyle:](UIFontDescriptor, "phPreferredFontDescriptorForTextStyle:", UIFontTextStyleTitle2));
      objc_msgSend(v4, "pointSize");
LABEL_7:
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont monospacedDigitSystemFontOfSize:weight:](UIFont, "monospacedDigitSystemFontOfSize:weight:"));
      v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "withCaseSensitiveAttribute"));

      break;
    default:
      return v3;
  }
  return v3;
}

+ (id)singleCallStatusLabelFont
{
  if (qword_1002DC630 != -1)
    dispatch_once(&qword_1002DC630, &stru_100284A68);
  return (id)qword_1002DC628;
}

+ (id)singleCallFontWithSize:(unint64_t)a3
{
  void *v3;

  switch(a3)
  {
    case 0uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallSmallerStatusLabelFont](PHUIConfiguration, "singleCallSmallerStatusLabelFont"));
      break;
    case 1uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallSmallStatusLabelFont](PHUIConfiguration, "singleCallSmallStatusLabelFont"));
      break;
    case 3uLL:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallLargeStatusLabelFont](PHUIConfiguration, "singleCallLargeStatusLabelFont"));
      break;
    default:
      v3 = (void *)objc_claimAutoreleasedReturnValue(+[PHUIConfiguration singleCallStatusLabelFont](PHUIConfiguration, "singleCallStatusLabelFont"));
      break;
  }
  return v3;
}

+ (id)multipleCallStatusLabelFont
{
  if (qword_1002DC640 != -1)
    dispatch_once(&qword_1002DC640, &stru_100284A88);
  return (id)qword_1002DC638;
}

+ (id)multipleCallStatusLabelFontMiniWindow
{
  if (qword_1002DC650 != -1)
    dispatch_once(&qword_1002DC650, &stru_100284AA8);
  return (id)qword_1002DC648;
}

+ (BOOL)participantsViewShouldCompressLabels
{
  return +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize") == 0;
}

+ (BOOL)usesMiddleCenteringView
{
  if (qword_1002DC660 != -1)
    dispatch_once(&qword_1002DC660, &stru_100284AC8);
  return byte_1002DC658;
}

+ (unint64_t)screenSize
{
  if (qword_1002DC778 != -1)
    dispatch_once(&qword_1002DC778, &stru_1002856B8);
  return qword_1002DC770;
}

+ (unint64_t)inCallControlAlignment
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000445EC;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC780 != -1)
    dispatch_once(&qword_1002DC780, block);
  return qword_1002D5838;
}

+ (unint64_t)inCallControlSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000446A0;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC790 != -1)
    dispatch_once(&qword_1002DC790, block);
  return qword_1002DC788;
}

+ (unint64_t)inCallBottomBarSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044750;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7A0 != -1)
    dispatch_once(&qword_1002DC7A0, block);
  return qword_1002DC798;
}

+ (unint64_t)inCallBottomBarLowerOffset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044800;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7B0 != -1)
    dispatch_once(&qword_1002DC7B0, block);
  return qword_1002DC7A8;
}

+ (unint64_t)inCallBottomBarMaxTitleSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000448C0;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7C0 != -1)
    dispatch_once(&qword_1002DC7C0, block);
  if (byte_1002DC7B8)
    return 1;
  else
    return 2;
}

+ (unint64_t)inCallControlSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004495C;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7C8 != -1)
    dispatch_once(&qword_1002DC7C8, block);
  return qword_1002D5840;
}

+ (unint64_t)inCallSlideToAnswerSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044A1C;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7D8 != -1)
    dispatch_once(&qword_1002DC7D8, block);
  if (byte_1002DC7D0)
    return 3;
  else
    return 2;
}

+ (unint64_t)inCallBottomBarAssetSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044AD0;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7E8 != -1)
    dispatch_once(&qword_1002DC7E8, block);
  if (byte_1002DC7E0)
    return 3;
  else
    return 2;
}

+ (double)ambientInCallControlSize
{
  unint64_t v2;
  double result;
  unint64_t v4;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize") - 10;
  if (v2 < 6)
    return dbl_10023F800[v2];
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6)
    return 104.0;
  v4 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
  result = 90.0;
  if (v4 == 3)
    return 104.0;
  return result;
}

+ (unint64_t)ambientVerticalSizeClass
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v6;
  else
    v7 = v4;
  return (int)v7 > 375;
}

+ (unint64_t)ambientHorizontalSizeClass
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v2, "bounds");
  v4 = v3;
  v6 = v5;

  if (v4 >= v6)
    v7 = v4;
  else
    v7 = v6;
  return (int)v7 > 667;
}

+ (double)ambientVerticalPadding
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 37.0;
  if (v2 == 1)
    return 44.0;
  return result;
}

+ (double)ambientHorizontalPadding
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientHorizontalSizeClass](PHUIConfiguration, "ambientHorizontalSizeClass");
  result = 40.0;
  if (v2 == 1)
    return 6.0;
  return result;
}

+ (double)ambientInCallControlSpacing
{
  return 24.0;
}

+ (double)ambientAudioRoutesInset
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 16.0;
  if (v2 == 1)
    return 26.0;
  return result;
}

+ (double)ambientAudioRoutesButtonSize
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 40.0;
  if (v2 == 1)
    return 54.0;
  return result;
}

+ (double)ambientAudioRoutesSymbolInset
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration ambientVerticalSizeClass](PHUIConfiguration, "ambientVerticalSizeClass");
  result = 6.0;
  if (v2 == 1)
    return 3.0;
  return result;
}

+ (unint64_t)handsetDialerSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044D9C;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC7F8 != -1)
    dispatch_once(&qword_1002DC7F8, block);
  return qword_1002DC7F0;
}

+ (unint64_t)handsetDialerSize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044E4C;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC800 != -1)
    dispatch_once(&qword_1002DC800, block);
  return qword_1002D5848;
}

+ (double)yOffsetForDialerLCDView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100044F00;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC810 != -1)
    dispatch_once(&qword_1002DC810, block);
  return *(double *)&qword_1002DC808;
}

+ (double)yOffsetForDialerLCDViewForDxDevices
{
  unint64_t v2;
  double result;

  v2 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize");
  result = 0.0;
  if (v2 - 10 <= 5)
    return dbl_10023F960[v2 - 10];
  return result;
}

+ (double)yOffsetForParticipantsView
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045014;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC820 != -1)
    dispatch_once(&qword_1002DC820, block);
  return *(double *)&qword_1002DC818;
}

+ (double)yParticipantsViewAdjustmentForKeypad
{
  if (qword_1002DC830 != -1)
    dispatch_once(&qword_1002DC830, &stru_1002856D8);
  return *(double *)&qword_1002DC828;
}

+ (BOOL)canAutoRotateInCallUIForFaceTime
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

+ (BOOL)canAutoRotateInCallUIForFaceTimeAudio
{
  void *v2;
  BOOL v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom") == (id)1;

  return v3;
}

+ (BOOL)canRotateInCallUIOverlayForFaceTime
{
  return 0;
}

+ (unint64_t)contentViewSizeForFaceTime
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000451C4;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC840 != -1)
    dispatch_once(&qword_1002DC840, block);
  return qword_1002DC838;
}

+ (double)pipWidth
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10004526C;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC848 != -1)
    dispatch_once(&qword_1002DC848, block);
  return *(double *)&qword_1002D5850;
}

+ (double)pipWallInset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045320;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC850 != -1)
    dispatch_once(&qword_1002DC850, block);
  return *(double *)&qword_1002D5858;
}

+ (double)pipPartialHomeOffset
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000453D0;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC860 != -1)
    dispatch_once(&qword_1002DC860, block);
  return *(double *)&qword_1002DC858;
}

+ (double)pipRadius
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045478;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC870 != -1)
    dispatch_once(&qword_1002DC870, block);
  return *(double *)&qword_1002DC868;
}

+ (unint64_t)pipStatusBarPadding
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045520;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC878 != -1)
    dispatch_once(&qword_1002DC878, block);
  return (unint64_t)*(double *)&qword_1002D5860;
}

+ (BOOL)shouldUseFullScreenPeoplePicker
{
  unint64_t v2;

  v2 = (unint64_t)objc_msgSend(a1, "screenSize");
  return (v2 > 8) | (0x73u >> v2) & 1;
}

+ (unint64_t)inCallFaceTimeOverlayUISize
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045608;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC888 != -1)
    dispatch_once(&qword_1002DC888, block);
  if (byte_1002DC880)
    return 3;
  else
    return 2;
}

+ (unint64_t)tableViewCellVerticalSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1000456BC;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC898 != -1)
    dispatch_once(&qword_1002DC898, block);
  if (byte_1002DC890)
    return 2;
  else
    return 1;
}

+ (unint64_t)voicemailLayoutSpacing
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045764;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC8A8 != -1)
    dispatch_once(&qword_1002DC8A8, block);
  if (byte_1002DC8A0)
    return 3;
  else
    return 2;
}

+ (BOOL)preferShorterStrings
{
  _QWORD block[5];

  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100045800;
  block[3] = &unk_100284948;
  block[4] = a1;
  if (qword_1002DC8B8 != -1)
    dispatch_once(&qword_1002DC8B8, block);
  return byte_1002DC8B0;
}

+ (BOOL)shouldUseExplicitLayoutDimensions
{
  return (char *)+[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize") - 10 < (char *)6;
}

+ (BOOL)shouldUseSOSTightSpacing
{
  if (qword_1002DC8C8 != -1)
    dispatch_once(&qword_1002DC8C8, &stru_1002856F8);
  return byte_1002DC8C0;
}

+ (double)inComingCallSupplementalButtonAndMainButtonSpacingRatio
{
  return dbl_10023F5D0[objc_msgSend(a1, "screenSize") == (id)1];
}

+ (double)inComingCallAndInCallControlsBottomPaddingRatio
{
  return dbl_10023F5E0[objc_msgSend(a1, "screenSize") == (id)1];
}

+ (double)inCallControlButtonVerticalSpacingRatio
{
  return dbl_10023F5F0[objc_msgSend(a1, "screenSize") == (id)1];
}

+ (double)distanceBetweenEndButtonAndKeyPadLastRow
{
  uint64_t v3;
  double result;

  if (objc_msgSend(a1, "screenSize") == (id)1)
    return 0.02998;
  objc_msgSend((id)objc_opt_class(a1, v3), "inCallControlButtonVerticalSpacingRatio");
  return result;
}

+ (double)inCallControlButtonSizeRatio
{
  return 0.1976;
}

+ (double)dialerLCDFontSize
{
  if (qword_1002DCAE0 != -1)
    dispatch_once(&qword_1002DCAE0, &stru_100286CF8);
  return *(double *)&qword_1002DCAD8;
}

+ (double)dialerLCDLabelFontSize
{
  if (qword_1002DCAF0 != -1)
    dispatch_once(&qword_1002DCAF0, &stru_100286D18);
  return *(double *)&qword_1002DCAE8;
}

+ (double)yOffsetForSmartDialerLCDView
{
  id v2;
  unsigned int v3;
  double result;
  uint64_t v5;

  v2 = objc_alloc_init((Class)TUFeatureFlags);
  v3 = objc_msgSend(v2, "smartDialerEnabled");

  result = 0.0;
  if (v3)
  {
    v5 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize", 0.0);
    result = -25.0;
    if (v5 > 8)
    {
      if (v5 != 9 && v5 != 13)
        return 43.0;
    }
    else
    {
      if (v5)
      {
        if (v5 == 1)
          return result;
        return 43.0;
      }
      return 5.0;
    }
  }
  return result;
}

+ (BOOL)requiresSmallScreenConfig
{
  id v2;
  BOOL v3;

  v2 = objc_alloc_init((Class)TUFeatureFlags);
  if (objc_msgSend(v2, "smartDialerEnabled"))
    v3 = +[PHUIConfiguration handsetDialerSpacing](PHUIConfiguration, "handsetDialerSpacing") == 0;
  else
    v3 = 0;

  return v3;
}

@end

@implementation PHBottomBarButtonConfiguration

+ (double)defaultHeight
{
  void *v2;
  id v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  float v10;
  double result;
  unint64_t v12;
  unint64_t v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = objc_msgSend(v2, "userInterfaceIdiom");

  if (!_os_feature_enabled_impl("ConversationKit", "CallUI_ButtonLayout") || v3 == (id)1)
  {
    v12 = +[PHUIConfiguration screenSize](PHUIConfiguration, "screenSize") - 10;
    if (v12 >= 6)
    {
      if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6)
      {
        return 82.0;
      }
      else
      {
        v13 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
        result = 72.0;
        if (v13 == 3)
          return 82.0;
      }
    }
    else
    {
      return dbl_10023F3E8[v12];
    }
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;

    if (v6 >= v8)
      v9 = v8;
    else
      v9 = v6;
    v10 = v9 * 0.1976;
    return roundf(v10);
  }
  return result;
}

+ (double)defaultWidth
{
  double result;

  objc_msgSend((id)objc_opt_class(a1, a2), "defaultHeight");
  return result;
}

+ (double)smallHeight
{
  return dbl_10023F380[(id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)5];
}

+ (double)smallWidth
{
  double result;

  objc_msgSend((id)objc_opt_class(a1, a2), "smallHeight");
  return result;
}

+ (UIColor)systemTintColor
{
  return +[UIColor systemGreenColor](UIColor, "systemGreenColor");
}

+ (UIColor)voipTintColor
{
  return +[UIColor colorWithRed:green:blue:alpha:](UIColor, "colorWithRed:green:blue:alpha:", 0.203921569, 0.470588235, 0.964705882, 1.0);
}

+ (id)imageColorForState:(unint64_t)a3
{
  void *v3;

  if (a3 == 4)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  }
  else if (a3)
  {
    v3 = 0;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  }
  return v3;
}

+ (id)imageForAction:(int64_t)a3 callState:(int64_t)a4
{
  void *v4;
  const __CFString *v5;
  void *v6;
  void *v7;

  if (a3 == 14 && a4 == 1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v5 = CFSTR("end_call_voip");
  }
  else
  {
    if (a3 == 21)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance", 21, a4));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "routeController"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "audioRouteGlyph"));

      goto LABEL_9;
    }
    if (a3 != 20)
    {
      v6 = 0;
      return v6;
    }
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor", 20, a4));
    v5 = CFSTR("icon-mute-small");
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", v5, v4));
LABEL_9:

  return v6;
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 sizeCategory:(int64_t)a6 captureView:(id)a7
{
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  id v16;
  int v17;
  int v18;
  uint64_t v19;
  double v20;
  double v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  PHBottomBarButtonConfiguration *v26;
  void *v27;
  uint64_t v28;
  id v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  __CFString *v37;
  uint64_t v38;
  void *v39;
  uint64_t v40;
  void *v41;
  void *v42;
  uint64_t v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  uint64_t v57;
  id v58;
  void *v59;
  uint64_t v60;
  id v61;
  void *v62;
  uint64_t v63;
  id v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  const UIFontTextStyle *v75;
  UIFontTextStyle v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  uint64_t v95;
  void *v96;
  id v97;
  uint64_t v98;
  unint64_t v99;
  __CFString *v100;
  id v101;
  void *v102;
  unint64_t v103;
  __CFString *v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  PHBottomBarButtonConfiguration *v108;
  id *p_isa;
  void *v110;
  int64_t v112;
  int64_t v113;
  void *v114;
  id obj;
  objc_super v116;
  _QWORD v117[2];
  _QWORD v118[2];
  _QWORD v119[2];

  obj = a7;
  v13 = objc_msgSend((id)objc_opt_class(self, v12), "imageColorForState:", 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v16 = objc_msgSend(v15, "userInterfaceIdiom");

  v17 = _os_feature_enabled_impl("ConversationKit", "CallUI_ButtonLayout");
  if (v16 == (id)1)
    v18 = 0;
  else
    v18 = v17;
  +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
  v21 = v20;
  switch(a3)
  {
    case 1:
      v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_10028DC20, CFSTR("BottomBar")));

      v113 = a6;
      v114 = v14;
      v112 = a5;
      if (a5 == 1)
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 9, a6));
        v29 = objc_msgSend((id)objc_opt_class(self, v28), "voipTintColor");
        v30 = objc_claimAutoreleasedReturnValue(v29);
        goto LABEL_86;
      }
      if (a6 != 1 && ((v18 ^ 1) & 1) == 0 && v21 != a4)
      {
        v34 = objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 1, UIFontTextStyleTitle1, 2, 1));
        goto LABEL_13;
      }
      v32 = 1;
      goto LABEL_12;
    case 2:
      v112 = a5;
      v114 = v14;
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_10028DC20, CFSTR("BottomBar")));

      v32 = 29;
      goto LABEL_11;
    case 3:
      v112 = a5;
      v114 = v14;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_10028DC20, CFSTR("BottomBar")));

      v32 = 5;
LABEL_11:
      v113 = a6;
LABEL_12:
      v34 = objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", v32, a6));
LABEL_13:
      v24 = (void *)v34;
      v36 = objc_msgSend((id)objc_opt_class(self, v35), "systemTintColor");
      v30 = objc_claimAutoreleasedReturnValue(v36);
      goto LABEL_86;
    case 4:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      switch(a5)
      {
        case 1:
          v37 = CFSTR("end_voip_accept_voip");
          break;
        case 2:
          v103 = +[PHUIConfiguration inCallBottomBarAssetSize](PHUIConfiguration, "inCallBottomBarAssetSize");
          v104 = CFSTR("end_accept");
          if (v103 == 3)
            v104 = CFSTR("end_accept_large");
          v37 = v104;
          break;
        case 3:
          v37 = CFSTR("end_accept_voip");
          break;
        case 4:
          v37 = CFSTR("end_voip_accept");
          break;
        default:
          v37 = 0;
          break;
      }
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v106 = v105;
      v107 = CFSTR("END_+_ACCEPT");
      goto LABEL_102;
    case 5:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      if ((unint64_t)(a5 - 1) > 3)
        v38 = 0;
      else
        v38 = (uint64_t)*(&off_1002852A0 + a5 - 1);
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("ENDHOLD_+_ACCEPT"), &stru_10028DC20, CFSTR("BottomBar")));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v38));
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      goto LABEL_86;
    case 6:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      switch(a5)
      {
        case 1:
        case 3:
          v37 = CFSTR("hold_accept_voip");
          break;
        case 2:
        case 4:
          v99 = +[PHUIConfiguration inCallBottomBarAssetSize](PHUIConfiguration, "inCallBottomBarAssetSize");
          v100 = CFSTR("hold_accept");
          if (v99 == 3)
            v100 = CFSTR("hold_accept_large");
          v37 = v100;
          break;
        default:
          v37 = 0;
          break;
      }
      v105 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v106 = v105;
      v107 = CFSTR("HOLD_+_ACCEPT");
LABEL_102:
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "localizedStringForKey:value:table:", v107, &stru_10028DC20, CFSTR("BottomBar")));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", v37));
      v56 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      goto LABEL_103;
    case 7:
      v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("DECLINE"), &stru_10028DC20, CFSTR("BottomBar")));

      v113 = a6;
      v114 = v14;
      v112 = a5;
      if ((a5 & 0xFFFFFFFFFFFFFFFDLL) == 1)
      {
        v40 = 10;
      }
      else
      {
        if (a6 != 1 && ((v18 ^ 1) & 1) == 0 && v21 != a4)
        {
          v95 = objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 2, UIFontTextStyleTitle1, 2, 1));
          goto LABEL_85;
        }
        v40 = 2;
      }
LABEL_84:
      v95 = objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", v40, a6));
LABEL_85:
      v24 = (void *)v95;
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      goto LABEL_86;
    case 8:
      v112 = a5;
      v114 = v14;
      v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("DECLINE"), &stru_10028DC20, CFSTR("BottomBar")));

      v40 = 8;
      v113 = a6;
      goto LABEL_84;
    case 9:
      v112 = a5;
      v114 = v14;
      v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("SEND_MESSAGE"), &stru_10028DC20, CFSTR("BottomBar")));

      v43 = 13;
      goto LABEL_57;
    case 10:
      v112 = a5;
      v114 = v14;
      v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "localizedStringForKey:value:table:", CFSTR("SCREENING_BLOCK"), &stru_10028DC20, CFSTR("BottomBar")));

      v113 = a6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 14, a6));
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor systemGray3Color](UIColor, "systemGray3Color"));
      goto LABEL_86;
    case 11:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v45 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v119[0] = v45;
      v46 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v119[1] = v46;
      v47 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v119, 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:paletteColors:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:paletteColors:isStaticSize:", 13, UIFontTextStyleTitle2, 1, v47, 1));

      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("SEND_MESSAGE"), &stru_10028DC20, CFSTR("BottomBar")));

      goto LABEL_45;
    case 12:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("CALL_BACK_LATER"), &stru_10028DC20, CFSTR("BottomBar")));

      v50 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v117[0] = v50;
      v51 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v117[1] = v51;
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v117, 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:paletteColors:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:paletteColors:isStaticSize:", 38, UIFontTextStyleTitle2, 1, v52, 1));

      goto LABEL_45;
    case 13:
    case 15:
    case 16:
    case 22:
    case 29:
    case 30:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v23 = 0;
      v24 = 0;
      v25 = 0;
      v26 = 0;
      goto LABEL_114;
    case 14:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      if (a5 == 1)
      {
        v53 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", CFSTR("end_call_voip"), v53));

      }
      else
      {
        v96 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
        v97 = objc_msgSend(v96, "userInterfaceIdiom");

        if (!_os_feature_enabled_impl("ConversationKit", "CallUI_ButtonLayout") || v97 == (id)1)
          v98 = objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 2, a6));
        else
          v98 = objc_claimAutoreleasedReturnValue(+[UIImage tpHierarchicalImageForSymbolType:pointSize:](UIImage, "tpHierarchicalImageForSymbolType:pointSize:", 2, 32.0));
        v24 = (void *)v98;
      }
      v82 = objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      goto LABEL_90;
    case 17:
      v112 = a5;
      v114 = v14;
      v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "localizedStringForKey:value:table:", CFSTR("CALL_BACK"), &stru_10028DC20, CFSTR("BottomBar")));

      v113 = a6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 1, a6));
      goto LABEL_48;
    case 18:
      v112 = a5;
      v113 = a6;
      v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10028DC20, CFSTR("BottomBar")));

      v114 = v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", CFSTR("cancel"), v14));
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v56 = objc_claimAutoreleasedReturnValue(-[__CFString colorWithAlphaComponent:](v37, "colorWithAlphaComponent:", 0.400000006));
LABEL_103:
      v22 = (void *)v56;
      goto LABEL_104;
    case 19:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v57 = objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", CFSTR("in-call-camera-flip"), v14));
      goto LABEL_53;
    case 20:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      v58 = objc_msgSend((id)objc_opt_class(self, v19), "imageForAction:callState:", 20, a5);
      v59 = (void *)objc_claimAutoreleasedReturnValue(v58);
      v61 = objc_msgSend((id)objc_opt_class(self, v60), "imageColorForState:", 0);
      v62 = (void *)objc_claimAutoreleasedReturnValue(v61);
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_flatImageWithColor:", v62));

      v64 = objc_msgSend((id)objc_opt_class(self, v63), "imageColorForState:", 4);
      v65 = (void *)objc_claimAutoreleasedReturnValue(v64);
      v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "_flatImageWithColor:", v65));

      v66 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "colorWithAlphaComponent:", 0.400000006));

      v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "colorWithAlphaComponent:", 0.699999988));

      v69 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v70 = 0;
      v71 = 0;
      goto LABEL_92;
    case 21:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      if (!a6)
      {
        v101 = objc_msgSend((id)objc_opt_class(self, v19), "imageForAction:callState:", 21, a5);
        v86 = (void *)objc_claimAutoreleasedReturnValue(v101);
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "_flatImageWithColor:", v14));
        v102 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "colorWithAlphaComponent:", 0.400000006));

LABEL_54:
LABEL_91:
        v70 = 0;
        v68 = 0;
        v69 = 0;
        v71 = 0;
        v23 = 0;
        goto LABEL_92;
      }
      if (a6 != 1)
      {
LABEL_36:
        v22 = 0;
LABEL_51:
        v70 = 0;
        v68 = 0;
        v69 = 0;
        v71 = 0;
        v23 = 0;
        v24 = 0;
LABEL_92:
        v25 = 0;
        goto LABEL_108;
      }
      v72 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "localizedStringForKey:value:table:", CFSTR("AUDIO"), &stru_10028DC20, CFSTR("BottomBar")));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 11, 1));
LABEL_38:
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
LABEL_86:
      v22 = (void *)v30;
LABEL_105:
      v70 = 0;
LABEL_106:
      v68 = 0;
      v69 = 0;
      v71 = 0;
LABEL_107:
      v23 = 0;
LABEL_108:
      v116.receiver = self;
      v116.super_class = (Class)PHBottomBarButtonConfiguration;
      v108 = -[PHBottomBarButtonConfiguration init](&v116, "init");
      p_isa = (id *)&v108->super.isa;
      if (v108)
      {
        v108->_diameter = a4;
        v108->_action = a3;
        v108->_callState = v112;
        if (v113 == 1)
          v110 = 0;
        else
          v110 = v25;
        objc_storeStrong((id *)&v108->_title, v110);
        objc_storeStrong(p_isa + 7, v24);
        objc_storeStrong(p_isa + 8, v23);
        objc_storeStrong(p_isa + 9, v22);
        objc_storeStrong(p_isa + 10, v70);
        objc_storeStrong(p_isa + 11, v68);
        objc_storeStrong(p_isa + 12, v69);
        objc_storeStrong(p_isa + 13, v25);
        objc_storeStrong(p_isa + 14, v71);
        objc_storeWeak(p_isa + 5, obj);
      }
      self = p_isa;

      v26 = self;
      v14 = v114;
LABEL_114:

      return v26;
    case 23:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v73 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "localizedStringForKey:value:table:", CFSTR("SEND_TO_VOICEMAL"), &stru_10028DC20, CFSTR("BottomBar")));

      v74 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", CFSTR("send_to_voicemail"), v74));

      goto LABEL_38;
    case 24:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v75 = &UIFontTextStyleTitle1;
      if (v20 != a4)
        v75 = &UIFontTextStyleTitle2;
      v76 = *v75;
      if (v20 == a4)
        v77 = 2;
      else
        v77 = 1;
      v78 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v118[0] = v78;
      v79 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v118[1] = v79;
      v80 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v118, 2));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:paletteColors:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:paletteColors:isStaticSize:", 30, v76, v77, v80, 1));

      v81 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "localizedStringForKey:value:table:", CFSTR("SEND_TO_CALL_SCREENING"), &stru_10028DC20, CFSTR("BottomBar")));

LABEL_45:
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
      v70 = 0;
      goto LABEL_59;
    case 25:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 1, a6));
      v82 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
LABEL_90:
      v22 = (void *)v82;
      goto LABEL_91;
    case 26:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v83 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("LEAVE_A_MESSAGE"), &stru_10028DC20, CFSTR("BottomBar")));

      v84 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", CFSTR("leave-a-message"), v84));

LABEL_48:
      v30 = objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
      goto LABEL_86;
    case 27:
      v112 = a5;
      v114 = v14;
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("SEND_MESSAGE"), &stru_10028DC20, CFSTR("BottomBar")));

      v113 = a6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 13, a6));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 11));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      goto LABEL_106;
    case 28:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      goto LABEL_51;
    case 31:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v57 = objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("in-call-button-effects")));
LABEL_53:
      v24 = (void *)v57;
      v86 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "colorWithAlphaComponent:", 0.400000006));
      goto LABEL_54;
    case 32:
      v112 = a5;
      v114 = v14;
      v87 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("BLOCK_CALLER"), &stru_10028DC20, CFSTR("BottomBar")));

      v43 = 14;
      goto LABEL_57;
    case 33:
      v112 = a5;
      v114 = v14;
      v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "localizedStringForKey:value:table:", CFSTR("CREATE_CONTACT"), &stru_10028DC20, CFSTR("BottomBar")));

      v43 = 84;
LABEL_57:
      v113 = a6;
      v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", v43, a6));
      v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 11));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
      goto LABEL_59;
    case 34:
      v112 = a5;
      v114 = v14;
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("Close"), &stru_10028DC20, CFSTR("BottomBar")));

      v113 = a6;
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 8, a6));
      v91 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlackColor](UIColor, "systemBlackColor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "tpFlattenedWithColor:", v91));

      v70 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 11));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[UIColorEffect inCallControls](UIColorEffect, "inCallControls"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemWhiteColor](UIColor, "systemWhiteColor"));
LABEL_59:
      v68 = 0;
      v69 = 0;
      goto LABEL_107;
    case 35:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_TEXT_BUTTON_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));

      v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("text_sos_icon")));
      v22 = 0;
      goto LABEL_105;
    case 36:
      v113 = a6;
      v114 = v14;
      v112 = a5;
      if (a5 == 1)
      {
        v93 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarImageWithName:color:](PHBottomBarButtonConfiguration, "bottomBarImageWithName:color:", CFSTR("end_call_voip"), v93));

      }
      else
      {
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration bottomBarGlyphWithSymbolType:sizeCategory:](PHBottomBarButtonConfiguration, "bottomBarGlyphWithSymbolType:sizeCategory:", 2, a6));
      }
      v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      v37 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v37, "localizedStringForKey:value:table:", CFSTR("ALERT_ACTION_END_BUTTON_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
LABEL_104:

      goto LABEL_105;
    default:
      v112 = a5;
      v113 = a6;
      v114 = v14;
      goto LABEL_36;
  }
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 sizeCategory:(int64_t)a6
{
  return -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:sizeCategory:captureView:](self, "initWithAction:diameter:callState:sizeCategory:captureView:", a3, a5, a6, 0, a4);
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5 captureView:(id)a6
{
  return -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:sizeCategory:captureView:](self, "initWithAction:diameter:callState:sizeCategory:captureView:", a3, a5, 0, a6, a4);
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3 diameter:(double)a4 callState:(int64_t)a5
{
  return -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:sizeCategory:](self, "initWithAction:diameter:callState:sizeCategory:", a3, a5, 0, a4);
}

- (PHBottomBarButtonConfiguration)initWithAction:(int64_t)a3
{
  objc_msgSend((id)objc_opt_class(self, a2), "defaultWidth");
  return -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](self, "initWithAction:diameter:callState:", a3, 2);
}

+ (id)bottomBarGlyphWithSymbolType:(int64_t)a3 sizeCategory:(int64_t)a4
{
  void *v7;
  void *v8;

  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a1, "textStyleForSizeCategory:", a4));
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:symbolWeight:](UIImage, "tpImageForSymbolType:textStyle:scale:symbolWeight:", a3, v7, objc_msgSend(a1, "symbolScaleForSymbolType:sizeCategory:", a3, a4), objc_msgSend(a1, "weightForSymbolType:", a3)));

  return v8;
}

+ (int64_t)weightForSymbolType:(int64_t)a3
{
  if ((unint64_t)(a3 - 8) >= 3)
    return 0;
  else
    return 7;
}

+ (id)textStyleForSizeCategory:(int64_t)a3
{
  id *v3;

  if (a3 == 1)
  {
    v3 = (id *)&UIFontTextStyleBody;
    goto LABEL_5;
  }
  if (!a3)
  {
    v3 = (id *)&UIFontTextStyleLargeTitle;
LABEL_5:
    a1 = *v3;
  }
  return a1;
}

+ (int64_t)symbolScaleForSymbolType:(int64_t)a3 sizeCategory:(int64_t)a4
{
  if (a4 != 1 || (unint64_t)a3 > 0x23)
    return -1;
  if (((1 << a3) & 0x800000920) != 0)
    return 2;
  if (((1 << a3) & 6) != 0)
    return 3;
  else
    return -1;
}

+ (id)bottomBarImageWithName:(id)a3 color:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", a3));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "tpFlattenedWithColor:", v5));

  return v7;
}

- (int64_t)action
{
  return self->_action;
}

- (int64_t)callState
{
  return self->_callState;
}

- (double)diameter
{
  return self->_diameter;
}

- (int64_t)sizeCategory
{
  return self->_sizeCategory;
}

- (_UIVisualEffectBackdropView)captureView
{
  return (_UIVisualEffectBackdropView *)objc_loadWeakRetained((id *)&self->_captureView);
}

- (NSString)title
{
  return self->_title;
}

- (UIImage)icon
{
  return self->_icon;
}

- (UIImage)selectedIcon
{
  return self->_selectedIcon;
}

- (UIColor)backgroundColor
{
  return self->_backgroundColor;
}

- (UIVisualEffect)backgroundMaterial
{
  return self->_backgroundMaterial;
}

- (UIColor)highlightedColor
{
  return self->_highlightedColor;
}

- (UIColor)selectedColor
{
  return self->_selectedColor;
}

- (NSString)accessibilityIdentifier
{
  return self->_accessibilityIdentifier;
}

- (UIColorEffect)colorEffect
{
  return self->_colorEffect;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_colorEffect, 0);
  objc_storeStrong((id *)&self->_accessibilityIdentifier, 0);
  objc_storeStrong((id *)&self->_selectedColor, 0);
  objc_storeStrong((id *)&self->_highlightedColor, 0);
  objc_storeStrong((id *)&self->_backgroundMaterial, 0);
  objc_storeStrong((id *)&self->_backgroundColor, 0);
  objc_storeStrong((id *)&self->_selectedIcon, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_destroyWeak((id *)&self->_captureView);
}

@end

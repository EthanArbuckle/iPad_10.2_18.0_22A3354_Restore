@implementation PHBannerButtonsView

- (PHBannerButtonsView)initWithState:(unint64_t)a3
{
  PHBannerButtonsView *v4;
  PHBannerButtonsView *v5;
  void *v6;
  void *v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)PHBannerButtonsView;
  v4 = -[PHBannerButtonsView init](&v9, "init");
  v5 = v4;
  if (v4)
  {
    v4->_state = a3;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "routeController"));
    objc_msgSend(v7, "addDelegate:", v5);

    -[PHBannerButtonsView updateLayoutForState:](v5, "updateLayoutForState:", v5->_state);
  }
  return v5;
}

- (void)layoutSubviews
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  void *v13;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)PHBannerButtonsView;
  -[PHBannerButtonsView layoutSubviews](&v14, "layoutSubviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
    objc_msgSend(v4, "bounds");
    v6 = v5;
    v8 = v7;
    v10 = v9;
    v12 = v11;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
    objc_msgSend(v13, "setFrame:", v6, v8, v10, v12);

  }
}

- (void)setState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  int v7;
  unint64_t v8;
  __int16 v9;
  unint64_t v10;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = 134218240;
    v8 = a3;
    v9 = 2048;
    v10 = -[PHBannerButtonsView state](self, "state");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Banner button state updated to %ld (existing state is %ld)", (uint8_t *)&v7, 0x16u);
  }

  if (self->_state != a3)
  {
    self->_state = a3;
    -[PHBannerButtonsView updateLayoutForState:](self, "updateLayoutForState:", a3);
  }
}

- (void)setAudioRouteButtonSelected:(BOOL)a3
{
  _BOOL8 v3;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  unsigned int v10;
  void *v11;
  _DWORD v12[2];
  __int16 v13;
  unsigned int v14;

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
    v12[0] = 67109376;
    v12[1] = v3;
    v13 = 1024;
    v14 = objc_msgSend(v7, "isSelected");
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Left button selected state updated to %d (existing state is %d)", (uint8_t *)v12, 0xEu);

  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  if (objc_msgSend(v8, "action") == (id)21)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
    v10 = objc_msgSend(v9, "isSelected");

    if (v10 != v3)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
      objc_msgSend(v11, "setSelected:", v3);

      -[PHBannerButtonsView updateAudioRouteButtonBackgroundColor](self, "updateAudioRouteButtonBackgroundColor");
      -[PHBannerButtonsView updateAudioRouteButtonImageColor](self, "updateAudioRouteButtonImageColor");
    }
  }
  else
  {

  }
}

- (void)updateLayoutForState:(unint64_t)a3
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  switch(a3)
  {
    case 2uLL:
      -[PHBannerButtonsView setBannerButtonsForIncomingVideoCallIfNecessary](self, "setBannerButtonsForIncomingVideoCallIfNecessary");
      break;
    case 1uLL:
      -[PHBannerButtonsView setBannerButtonsForIncomingAudioCallIfNecessary](self, "setBannerButtonsForIncomingAudioCallIfNecessary");
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v6 = objc_msgSend(v5, "bottomBarCallState");

      if (v6 == (id)2)
        -[PHBannerButtonsView transitionFromIncomingCallToOngoingCallState](self, "transitionFromIncomingCallToOngoingCallState");
      break;
    case 0uLL:
      -[PHBannerButtonsView setBannerButtonsForIncomingAudioCallIfNecessary](self, "setBannerButtonsForIncomingAudioCallIfNecessary");
      break;
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "superview"));

  if (!v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
    -[PHBannerButtonsView addSubview:](self, "addSubview:", v9);

  }
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "superview"));

  if (!v11)
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
    -[PHBannerButtonsView addSubview:](self, "addSubview:", v12);

  }
  -[PHBannerButtonsView updateConstraintsForState:](self, "updateConstraintsForState:", a3);
}

- (void)setBannerButtonsForIncomingAudioCallIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonWithActionType:](self, "buttonWithActionType:", 7));
    -[PHBannerButtonsView setLeftButton:](self, "setLeftButton:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));

  if (!v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "frontmostCall"));

    if ((objc_msgSend(v9, "isRTT") & 1) != 0)
    {
      v7 = 2;
    }
    else if (objc_msgSend(v9, "isTTY"))
    {
      v7 = 2;
    }
    else
    {
      v7 = 1;
    }
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonWithActionType:](self, "buttonWithActionType:", v7));
    -[PHBannerButtonsView setRightButton:](self, "setRightButton:", v8);

  }
}

- (void)setBannerButtonsForIncomingVideoCallIfNecessary
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));

  if (!v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonWithActionType:](self, "buttonWithActionType:", 8));
    -[PHBannerButtonsView setLeftButton:](self, "setLeftButton:", v4);

  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));

  if (!v5)
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonWithActionType:](self, "buttonWithActionType:", 3));
    -[PHBannerButtonsView setRightButton:](self, "setRightButton:", v6);

  }
}

- (void)updateConstraintsForState:(unint64_t)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  _QWORD v37[7];

  v4 = objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));

    if (v6)
    {
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
      v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leadingAnchor](self, "leadingAnchor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v35, "constraintEqualToAnchor:", v34));
      v37[0] = v33;
      v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "trailingAnchor"));
      -[PHBannerButtonsView directionalLayoutMargins](self, "directionalLayoutMargins");
      v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:constant:", v29, v7 + v7));
      v37[1] = v28;
      v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "trailingAnchor"));
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView trailingAnchor](self, "trailingAnchor"));
      v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:", v25));
      v37[2] = v24;
      v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "centerYAnchor"));
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
      v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "centerYAnchor"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v20));
      v37[3] = v19;
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView topAnchor](self, "topAnchor"));
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "topAnchor"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v8));
      v37[4] = v9;
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView bottomAnchor](self, "bottomAnchor"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "bottomAnchor"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:", v12));
      v37[5] = v13;
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView widthAnchor](self, "widthAnchor"));
      -[PHBannerButtonsView intrinsicWidth](self, "intrinsicWidth");
      v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToConstant:"));
      v37[6] = v15;
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v37, 7));
      -[PHBannerButtonsView addConstraints:](self, "addConstraints:", v16);

    }
  }
}

- (double)intrinsicWidth
{
  double v2;

  -[PHBannerButtonsView directionalLayoutMargins](self, "directionalLayoutMargins");
  return v2 * 2.0 + 80.0;
}

- (void)transitionFromIncomingCallToOngoingCallState
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Transitioning the banner buttons from an incoming call to ongoing", v5, 2u);
  }

  -[PHBannerButtonsView transitionLeftButtonFromIncomingToOngoingCallState](self, "transitionLeftButtonFromIncomingToOngoingCallState");
  -[PHBannerButtonsView transitionRightButtonFromIncomingToOngoingCallState](self, "transitionRightButtonFromIncomingToOngoingCallState");
}

- (void)transitionRightButtonFromIncomingToOngoingCallState
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  CATransform3D v31;
  CATransform3D v32;

  v3 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
  v4 = objc_msgSend(v3, "CGColor");

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonConfigurationWithActionType:](self, "buttonConfigurationWithActionType:", 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "icon"));
  objc_msgSend(v6, "setImage:forState:", v7, 0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageView"));
  objc_msgSend(v9, "setClipsToBounds:", 0);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "imageView"));
  objc_msgSend(v11, "setContentMode:", 4);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "layer"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarAnimations rollAnimation](PHBottomBarAnimations, "rollAnimation"));
  objc_msgSend(v14, "addAnimation:forKey:", v15, CFSTR("mainRightButtonAnimation"));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "roundView"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "layer"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "backgroundColor")));
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarAnimations backgroundColorAnimationFromColor:toColor:](PHBottomBarAnimations, "backgroundColorAnimationFromColor:toColor:", objc_msgSend(v20, "CGColor"), v4));
  objc_msgSend(v18, "addAnimation:forKey:", v21, CFSTR("buttonColorAnimation"));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  objc_msgSend(v22, "setAction:", 14);

  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v4));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  objc_msgSend(v24, "setBackgroundColor:", v23);

  CATransform3DMakeRotation(&v32, 2.35619449, 0.0, 0.0, 1.0);
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "imageView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
  v31 = v32;
  objc_msgSend(v27, "setTransform:", &v31);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView rightButton](self, "rightButton"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("DECLINE"), &stru_10028DC20, CFSTR("BottomBar")));
  objc_msgSend(v28, "setAccessibilityIdentifier:", v30);

}

- (void)transitionLeftButtonFromIncomingToOngoingCallState
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  double v34;
  double v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint8_t v47[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageView"));
  objc_msgSend(v4, "setClipsToBounds:", 0);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "imageView"));
  objc_msgSend(v6, "setContentMode:", 4);

  v7 = sub_1000C5588();
  v8 = objc_claimAutoreleasedReturnValue(v7);
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v47 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Updating the left banner button to handle audio routes", v47, 2u);
  }

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  objc_msgSend(v9, "setAction:", 21);

  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  objc_msgSend(v11, "setBackgroundColor:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("AUDIO"), &stru_10028DC20, CFSTR("BottomBar")));
  objc_msgSend(v12, "setAccessibilityIdentifier:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "routeController"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "pickedRoute"));

  if ((objc_msgSend(v17, "isAuxiliary") & 1) != 0)
    v18 = 1;
  else
    v18 = (uint64_t)objc_msgSend(v17, "isSpeaker");
  -[PHBannerButtonsView setAudioRouteButtonSelected:](self, "setAudioRouteButtonSelected:", v18);
  -[PHBannerButtonsView updateAudioRouteButtonImage](self, "updateAudioRouteButtonImage");
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIBlurEffect effectWithStyle:](UIBlurEffect, "effectWithStyle:", 8));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIVibrancyEffect effectForBlurEffect:style:](UIVibrancyEffect, "effectForBlurEffect:style:", v19, 6));
  v21 = objc_msgSend(objc_alloc((Class)UIVisualEffectView), "initWithEffect:", v20);
  -[PHBannerButtonsView setAudioRouteVibrancyView:](self, "setAudioRouteVibrancyView:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  objc_msgSend(v22, "bounds");
  v24 = v23;
  v26 = v25;
  v28 = v27;
  v30 = v29;
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
  objc_msgSend(v31, "setFrame:", v24, v26, v28, v30);

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "layer"));
  objc_msgSend(v33, "cornerRadius");
  v35 = v34;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "layer"));
  objc_msgSend(v37, "setCornerRadius:", v35);

  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
  objc_msgSend(v38, "setClipsToBounds:", 1);

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
  objc_msgSend(v39, "setUserInteractionEnabled:", 0);

  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "contentView"));
  objc_msgSend(v42, "setBackgroundColor:", v40);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteVibrancyView](self, "audioRouteVibrancyView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "imageView"));
  objc_msgSend(v43, "insertSubview:belowSubview:", v44, v46);

}

- (void)updateAudioRouteButtonBackgroundColor
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;

  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  if (objc_msgSend(v6, "isSelected"))
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  v4 = (void *)v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  objc_msgSend(v5, "setBackgroundColor:", v4);

}

- (void)updateAudioRouteButtonImageColor
{
  void *v3;
  void *v4;
  id v5;

  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteButtonImageColor](self, "audioRouteButtonImageColor"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageView"));
  objc_msgSend(v4, "setTintColor:", v5);

}

- (id)audioRouteButtonImageColor
{
  void *v2;
  uint64_t v3;
  void *v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
  if ((objc_msgSend(v2, "isSelected") & 1) != 0)
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  else
    v3 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v4 = (void *)v3;

  return v4;
}

- (void)updateAudioRouteButtonImage
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  NSObject *v18;
  void *v19;
  id v20;
  NSObject *v21;
  int v22;
  id v23;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonConfigurationWithActionType:](self, "buttonConfigurationWithActionType:", 21));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "icon"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "routeController"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "pickedRoute"));
  v8 = objc_msgSend(v7, "isAuxiliary");

  if (v8)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "routeController"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "pickedRoute"));
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView audioRouteButtonImageColor](self, "audioRouteButtonImageColor"));
    v13 = objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "audioRouteGlyphForRoutePickerWithColor:", v12));
    v14 = (void *)v13;
    if (v13)
      v15 = (void *)v13;
    else
      v15 = v4;
    v16 = v15;

    v17 = sub_1000C5588();
    v18 = objc_claimAutoreleasedReturnValue(v17);
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting audio route button image to %@", (uint8_t *)&v22, 0xCu);
    }

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
    objc_msgSend(v19, "setImage:forState:", v16, 0);

  }
  else
  {
    v20 = sub_1000C5588();
    v21 = objc_claimAutoreleasedReturnValue(v20);
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      v22 = 138412290;
      v23 = v4;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Setting audio route button image to %@", (uint8_t *)&v22, 0xCu);
    }

    v16 = (id)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton"));
    objc_msgSend(v16, "setImage:forState:", v4, 0);
  }

}

- (id)buttonWithActionType:(int64_t)a3
{
  void *v4;
  PHBottomBarButton *v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView buttonConfigurationWithActionType:](self, "buttonConfigurationWithActionType:", a3));
  v5 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v4);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHBottomBarButton addTarget:action:forControlEvents:](v5, "addTarget:action:forControlEvents:", self, "buttonPressed:", 64);

  return v5;
}

- (id)buttonConfigurationWithActionType:(int64_t)a3
{
  void *v4;
  id v5;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = objc_msgSend(v4, "bottomBarCallState");

  return -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:sizeCategory:]([PHBottomBarButtonConfiguration alloc], "initWithAction:diameter:callState:sizeCategory:", a3, v5, 1, 40.0);
}

- (void)buttonPressed:(id)a3
{
  id v4;
  id v5;
  id v6;

  v4 = a3;
  v6 = (id)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "action");

  objc_msgSend(v6, "bannerButtonsView:didPerformActionType:", self, v5);
}

- (void)routesChangedForRouteController:(id)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint8_t v12[16];

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBannerButtonsView leftButton](self, "leftButton", a3));
  v5 = objc_msgSend(v4, "action");

  if (v5 == (id)21)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Audio routes changed, updating audio route banner button", v12, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "routeController"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "pickedRoute"));

    if ((objc_msgSend(v10, "isAuxiliary") & 1) != 0)
      v11 = 1;
    else
      v11 = (uint64_t)objc_msgSend(v10, "isSpeaker");
    -[PHBannerButtonsView setAudioRouteButtonSelected:](self, "setAudioRouteButtonSelected:", v11);
    -[PHBannerButtonsView updateAudioRouteButtonImage](self, "updateAudioRouteButtonImage");

  }
}

- (PHBannerButtonsViewDelegate)delegate
{
  return (PHBannerButtonsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (unint64_t)state
{
  return self->_state;
}

- (PHBottomBarButton)leftButton
{
  return self->_leftButton;
}

- (void)setLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_leftButton, a3);
}

- (PHBottomBarButton)rightButton
{
  return self->_rightButton;
}

- (void)setRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_rightButton, a3);
}

- (UIVisualEffectView)audioRouteVibrancyView
{
  return self->_audioRouteVibrancyView;
}

- (void)setAudioRouteVibrancyView:(id)a3
{
  objc_storeStrong((id *)&self->_audioRouteVibrancyView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_audioRouteVibrancyView, 0);
  objc_storeStrong((id *)&self->_rightButton, 0);
  objc_storeStrong((id *)&self->_leftButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

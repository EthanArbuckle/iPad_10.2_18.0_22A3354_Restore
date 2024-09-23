@implementation PHBottomBar

+ (double)defaultSideMarginForSingleButton
{
  return 16.0;
}

+ (double)defaultSideMarginForDoubleButton
{
  double v2;

  v2 = 228.0;
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") != (id)6
    && (id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") != (id)3)
  {
    if (sub_1000EA838())
      return 25.0;
    else
      return 31.0;
  }
  return v2;
}

+ (double)defaultInterButtonSpacing
{
  unint64_t v2;
  double result;
  unint64_t v4;

  v2 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
  result = 30.0;
  if (v2 != 6)
  {
    v4 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
    result = 24.0;
    if (v4 == 3)
      return 30.0;
  }
  return result;
}

+ (double)defaultWidth
{
  double result;
  unint64_t v3;

  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6)
    return 414.0;
  v3 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
  result = 320.0;
  if (v3 == 3)
    return 414.0;
  return result;
}

+ (double)ambientWidth
{
  double v2;
  double v3;
  double v4;

  +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
  v3 = v2;
  +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
  return v4 + v4 + v3 * 3.0;
}

+ (double)defaultBottomMargin
{
  return 61.0;
}

+ (double)defaultBottomSupplementalButtonSpacing
{
  double v2;

  v2 = 4.5;
  if (+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing")
    && !sub_1000EA838())
  {
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)4)
      return 28.0;
    else
      return 14.0;
  }
  return v2;
}

+ (double)defaultYOffsetForBottomButtons
{
  void *v2;
  unint64_t v3;
  double result;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
  v3 = (unint64_t)objc_msgSend(v2, "userInterfaceIdiom");

  result = 0.0;
  if ((v3 & 0xFFFFFFFFFFFFFFFBLL) != 1)
  {
    v5 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 0.0);
    result = 40.0;
    if (!v5)
      return 30.0;
  }
  return result;
}

- (PHBottomBar)initWithFrame:(CGRect)a3
{
  PHBottomBar *v3;
  PHBottomBar *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSMutableArray *pendingStateBlocks;
  uint64_t v11;
  TUCallCenter *callCenter;
  id v13;
  void *v14;
  id v15;
  double v16;
  double v17;
  double v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  objc_super v26;

  v26.receiver = self;
  v26.super_class = (Class)PHBottomBar;
  v3 = -[PHBottomBar initWithFrame:](&v26, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
  {
    -[PHBottomBar setDeclineAndMessageIsAvailable:](v3, "setDeclineAndMessageIsAvailable:", 1);
    -[PHBottomBar setDeclineAndRemindIsAvailable:](v4, "setDeclineAndRemindIsAvailable:", 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHBottomBar setBackgroundColor:](v4, "setBackgroundColor:", v5);

    -[PHBottomBar setOpaque:](v4, "setOpaque:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar layer](v4, "layer"));
    objc_msgSend(v6, "setHitTestsAsOpaque:", 1);

    +[PHBottomBar defaultBottomMargin](PHBottomBar, "defaultBottomMargin");
    -[PHBottomBar setBottomMargin:](v4, "setBottomMargin:");
    +[PHBottomBar defaultYOffsetForBottomButtons](PHBottomBar, "defaultYOffsetForBottomButtons");
    -[PHBottomBar setYOffsetForLoweredButtons:](v4, "setYOffsetForLoweredButtons:");
    v4->_blursBackground = 1;
    v4->_currentState = -1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar layer](v4, "layer"));
    objc_msgSend(v7, "setAllowsGroupOpacity:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar layer](v4, "layer"));
    objc_msgSend(v8, "setAllowsGroupBlending:", 0);

    v9 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    pendingStateBlocks = v4->_pendingStateBlocks;
    v4->_pendingStateBlocks = (NSMutableArray *)v9;

    v11 = objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    callCenter = v4->_callCenter;
    v4->_callCenter = (TUCallCenter *)v11;

    v13 = objc_alloc_init((Class)UINotificationFeedbackGenerator);
    -[PHBottomBar setAlertFeedbackGenerator:](v4, "setAlertFeedbackGenerator:", v13);

    if (-[PHBottomBar callScreeningAvailable](v4, "callScreeningAvailable")
      || -[PHBottomBar shouldUseLayoutAsCallScreening](v4, "shouldUseLayoutAsCallScreening"))
    {
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](v4, "captureView"));

      if (!v14)
      {
        v15 = objc_alloc((Class)_UIVisualEffectBackdropView);
        -[PHBottomBar intrinsicContentSize](v4, "intrinsicContentSize");
        v17 = v16;
        -[PHBottomBar intrinsicContentSize](v4, "intrinsicContentSize");
        v19 = objc_msgSend(v15, "initWithFrame:", 0.0, 0.0, v17, v18);
        -[PHBottomBar setCaptureView:](v4, "setCaptureView:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](v4, "captureView"));
        objc_msgSend(v20, "setAutoresizingMask:", 18);

        v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](v4, "captureView"));
        -[PHBottomBar insertSubview:atIndex:](v4, "insertSubview:atIndex:", v21, 0);

        v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](v4, "captureView"));
        objc_msgSend(v22, "setRenderMode:", 1);

        v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](v4, "captureView"));
        v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "captureGroup"));
        objc_msgSend(v24, "setGroupName:", CFSTR("PHBottomBarButtonCaptureGroup"));

      }
    }
  }
  return v4;
}

- (PHBottomBar)initWithCallDisplayStyleManager:(id)a3
{
  id v5;
  PHBottomBar *v6;
  PHBottomBar *v7;

  v5 = a3;
  v6 = -[PHBottomBar initWithFrame:](self, "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_callDisplayStyleManager, a3);

  return v7;
}

- (void)dealloc
{
  objc_super v3;

  -[PHSlidingButton setDelegate:](self->_slidingButton, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHBottomBar;
  -[PHBottomBar dealloc](&v3, "dealloc");
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  id v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  float v18;
  double v19;
  double v20;
  double v21;
  unsigned int v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  _QWORD block[5];
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v4 = objc_msgSend(v3, "callDisplayStyle");

  if (v4 == (id)3)
  {
    +[PHBottomBar ambientWidth](PHBottomBar, "ambientWidth");
    v6 = v5;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v7, "callDisplayStyle") == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v17 = v8;

  }
  else if (-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening")
         || -[PHBottomBar callScreeningAvailable](self, "callScreeningAvailable"))
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v9, "bounds");
    v6 = v10;
    v12 = v11;

    if (v6 >= v12)
      v13 = v6;
    else
      v13 = v12;
    if (v6 >= v12)
      v6 = v12;
    +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio](PHUIConfiguration, "inComingCallSupplementalButtonAndMainButtonSpacingRatio");
    v15 = v14 * v13;
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v16, "callDisplayStyle") == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");

    v18 = v6 * 0.1976;
    v19 = roundf(v18);
    +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio](PHUIConfiguration, "inComingCallAndInCallControlsBottomPaddingRatio");
    v21 = v13 * v20;
    v22 = +[PHInCallUIUtilities isSpringBoardPasscodeLocked](PHInCallUIUtilities, "isSpringBoardPasscodeLocked");
    v23 = v19 + 12.0;
    v24 = v15 + -6.0;
    v25 = v21 + -6.0;
    if (!v22)
    {
      v24 = v15;
      v23 = v19;
      v25 = v21;
    }
    v17 = v25 + v23 + v24 + 44.0;
  }
  else
  {
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1000EAFDC;
    block[3] = &unk_100284898;
    block[4] = self;
    if (qword_1002DCC60 != -1)
      dispatch_once(&qword_1002DCC60, block);
    v6 = *(double *)&qword_1002DCC50;
    v17 = *(double *)&qword_1002DCC58;
  }
  v26 = v6;
  v27 = v17;
  result.height = v27;
  result.width = v26;
  return result;
}

- (BOOL)callScreeningAvailable
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  _BOOL4 v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  void *v11;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
  if (objc_msgSend(v4, "isFaceTimeProvider"))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v6 = (unint64_t)objc_msgSend(v5, "currentCallCount") < 2;

  }
  else
  {
    v6 = 1;
  }

  if (TUCallScreeningEnabledM3(0))
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIDevice currentDevice](UIDevice, "currentDevice"));
    if (objc_msgSend(v7, "userInterfaceIdiom"))
    {
      LOBYTE(v8) = 0;
    }
    else
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "delegate"));
      if (objc_msgSend(v10, "isAnsweringMachineAvailable")
        && objc_msgSend(v3, "isEligibleForManualScreening"))
      {
        v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "provider"));
        v8 = objc_msgSend(v11, "isSystemProvider") & v6;

      }
      else
      {
        LOBYTE(v8) = 0;
      }

    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (BOOL)shouldUseLayoutAsCallScreening
{
  void *v2;
  unsigned __int8 v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  v3 = objc_msgSend(v2, "isButtonLayoutEnabled");

  return v3;
}

- (CGSize)effectiveSize
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  unsigned int v9;
  void *v10;
  id v11;
  double v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  void *v19;
  float v20;
  double v21;
  double v22;
  double v23;
  double v24;
  unint64_t v25;
  double v26;
  unint64_t v27;
  double v28;
  void *v29;
  float v30;
  double v31;
  double v32;
  double v33;
  CGSize result;

  -[PHBottomBar intrinsicContentSize](self, "intrinsicContentSize");
  v4 = v3;
  v6 = v5;
  if (*(_OWORD *)&self->_supplementalTopLeftButton == 0)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v8 = objc_msgSend(v7, "callDisplayStyle");

    if (v8 != (id)3)
    {
      if (self->_sideButtonLeft || self->_sideButtonRight)
      {
        v9 = -[PHBottomBar usesLowerButtons](self, "usesLowerButtons");
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
        v11 = objc_msgSend(v10, "callDisplayStyle");
        if (v9)
        {
          if (v11 == (id)3)
            +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
          else
            +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
          v14 = v12;
          v15 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
          v16 = 30.0;
          if (v15 != 6)
          {
            v17 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
            v16 = 24.0;
            if (v17 == 3)
              v16 = 30.0;
          }
          v18 = v14 + v16;
          *(float *)&v18 = v18;
          v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
          objc_msgSend(v19, "floatValue");
          v21 = v20;
          -[PHBottomBar yOffsetForLoweredButtons](self, "yOffsetForLoweredButtons");
          v23 = v22 + v21;

        }
        else
        {
          if (v11 == (id)3)
            +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
          else
            +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
          v24 = v13;
          v25 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
          v26 = 30.0;
          if (v25 != 6)
          {
            v27 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
            v26 = 24.0;
            if (v27 == 3)
              v26 = 30.0;
          }
          v28 = v24 + v26;
          *(float *)&v28 = v28;
          v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v28));
          objc_msgSend(v29, "floatValue");
          v23 = v30;

        }
      }
      else
      {
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
        if (objc_msgSend(v10, "callDisplayStyle") == (id)3)
          +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
        else
          +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
        v23 = v31;
      }
      v6 = v6 - v23;

    }
  }
  v32 = v4;
  v33 = v6;
  result.height = v33;
  result.width = v32;
  return result;
}

- (double)sideMarginForFaceTimeButtons
{
  if (qword_1002DCC70 != -1)
    dispatch_once(&qword_1002DCC70, &stru_100287C50);
  return *(double *)&qword_1002DCC68;
}

- (double)sideMarginForFaceTimeInCallButtons
{
  if (qword_1002DCC80 != -1)
    dispatch_once(&qword_1002DCC80, &stru_100287C70);
  return *(double *)&qword_1002DCC78;
}

- (double)sideMarginForDoubleButton
{
  void *v3;
  unsigned int v4;
  void *v5;
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

  if (-[PHBottomBar callScreeningAvailable](self, "callScreeningAvailable")
    || (v3 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance")),
        v4 = objc_msgSend(v3, "isButtonLayoutEnabled"),
        v3,
        v4))
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v5, "bounds");
    v7 = v6;
    v9 = v8;

    if (v7 >= v9)
      v10 = v9;
    else
      v10 = v7;
    v11 = 0.102;
  }
  else
  {
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6)
      v12 = 228.0;
    else
      v12 = dbl_1002401A0[(id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)3];
    -[PHBottomBar bounds](self, "bounds");
    v14 = v13 - v12;
    +[PHBottomBarButtonConfiguration defaultWidth](PHBottomBarButtonConfiguration, "defaultWidth");
    v10 = v14 - v15;
    v11 = 0.5;
  }
  return v10 * v11;
}

- (double)heightOfCallScreeningButtonPlusButtonSpacing
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v5 = v4;
  v7 = v6;

  if (v5 < v7)
    v5 = v7;
  if ((id)-[PHBottomBar currentState](self, "currentState") == (id)4
    || (id)-[PHBottomBar currentState](self, "currentState") == (id)5)
  {
    +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio](PHUIConfiguration, "inComingCallSupplementalButtonAndMainButtonSpacingRatio");
    return v5 * v8 + 44.0 + -6.0;
  }
  else
  {
    +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio](PHUIConfiguration, "inComingCallSupplementalButtonAndMainButtonSpacingRatio");
    return v5 * v10 + 44.0;
  }
}

- (UIView)topLayoutGuide
{
  UIView *v3;
  UIView *topLayoutGuide;

  if (!self->_topLayoutGuide)
  {
    v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10.0, 1.0);
    topLayoutGuide = self->_topLayoutGuide;
    self->_topLayoutGuide = v3;

    -[PHBottomBar addSubview:](self, "addSubview:", self->_topLayoutGuide);
    -[UIView setHidden:](self->_topLayoutGuide, "setHidden:", 1);
  }
  -[PHBottomBar updateTopLayoutGuide](self, "updateTopLayoutGuide");
  return self->_topLayoutGuide;
}

- (UIView)mainButtonLayoutGuide
{
  UIView *v3;
  UIView *mainButtonLayoutGuide;

  if (!self->_mainButtonLayoutGuide)
  {
    v3 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, 10.0, 1.0);
    mainButtonLayoutGuide = self->_mainButtonLayoutGuide;
    self->_mainButtonLayoutGuide = v3;

    -[PHBottomBar addSubview:](self, "addSubview:", self->_mainButtonLayoutGuide);
    -[UIView setHidden:](self->_mainButtonLayoutGuide, "setHidden:", 1);
  }
  -[PHBottomBar updateMainButtonLayoutGuide](self, "updateMainButtonLayoutGuide");
  return self->_mainButtonLayoutGuide;
}

- (void)updateTopLayoutGuide
{
  double v3;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  double v9;
  id v10;
  uint64_t v11;
  double v12;
  void *i;
  UIView *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  id v26;
  NSObject *v27;
  uint8_t v28[16];
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  _BYTE v33[128];

  -[PHBottomBar bounds](self, "bounds");
  v4 = v3;
  -[PHBottomBar bounds](self, "bounds");
  v29 = 0u;
  v30 = 0u;
  v6 = v5 * 0.5;
  v31 = 0u;
  v32 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar subviews](self, "subviews"));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16);
  if (v8)
  {
    v10 = v8;
    v11 = *(_QWORD *)v30;
    v12 = v6;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v30 != v11)
          objc_enumerationMutation(v7);
        v14 = *(UIView **)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i);
        if (v14 != self->_topLayoutGuide)
        {
          objc_msgSend(*(id *)(*((_QWORD *)&v29 + 1) + 8 * (_QWORD)i), "frame");
          if (v15 < v4)
          {
            -[UIView frame](v14, "frame");
            v4 = v16;
          }
          -[UIView frame](v14, "frame");
          if (v17 < v12)
          {
            -[UIView frame](v14, "frame");
            v12 = v18;
          }
          -[UIView frame](v14, "frame");
          v20 = v19;
          -[UIView frame](v14, "frame");
          v9 = v20 + v21;
          if (v20 + v21 > v6)
          {
            -[UIView frame](v14, "frame", v9);
            v23 = v22;
            -[UIView frame](v14, "frame");
            v6 = v23 + v24;
          }
        }
      }
      v10 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v29, v33, 16, v9);
    }
    while (v10);
  }
  else
  {
    v12 = v6;
  }

  -[UIView frame](self->_topLayoutGuide, "frame");
  if (v4 != v25)
  {
    if (v4 < 0.0)
    {
      v26 = sub_1000C5588();
      v27 = objc_claimAutoreleasedReturnValue(v26);
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v28 = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "PHBottomBar subview was outside of PHBottomBar bounds. Setting topLayoutGuide to 0", v28, 2u);
      }

      v4 = 0.0;
    }
    -[UIView setFrame:](self->_topLayoutGuide, "setFrame:", v12, v4, v6, 1.0);
  }
}

- (void)updateMainButtonLayoutGuide
{
  double v3;
  double v4;
  double v5;
  uint64_t v6;
  UIButton *mainLeftButton;
  double v8;
  double v9;
  double v10;
  UIButton *v11;
  void *mainRightButton;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  id v19;
  NSObject *v20;
  id v21;
  NSObject *v22;
  uint8_t v23[16];
  uint8_t buf[16];

  -[PHBottomBar bounds](self, "bounds");
  v4 = v3;
  -[PHBottomBar bounds](self, "bounds");
  v6 = 120;
  mainLeftButton = self->_mainLeftButton;
  if (!mainLeftButton)
  {
    v6 = 128;
    mainRightButton = self->_mainRightButton;
    if (!mainRightButton)
    {
      v6 = 168;
      mainRightButton = self->_slidingButton;
      if (!mainRightButton)
      {
        v10 = v5;
        v16 = 10.0;
        goto LABEL_9;
      }
    }
    objc_msgSend(mainRightButton, "frame");
    v4 = v13;
    objc_msgSend(*(id *)((char *)&self->super.super.super.isa + v6), "frame");
    v10 = v14;
    goto LABEL_7;
  }
  -[UIButton frame](mainLeftButton, "frame");
  v4 = v8;
  -[UIButton frame](self->_mainLeftButton, "frame");
  v10 = v9;
  v11 = self->_mainRightButton;
  if (!v11)
LABEL_7:
    v11 = *(UIButton **)((char *)&self->super.super.super.isa + v6);
  -[UIButton frame](v11, "frame");
  v16 = v4 + v15;
LABEL_9:
  -[UIView frame](self->_mainButtonLayoutGuide, "frame");
  if (v4 != v17 || (-[UIView frame](self->_mainButtonLayoutGuide, "frame"), v10 != v18))
  {
    if (v4 < 0.0)
    {
      v19 = sub_1000C5588();
      v20 = objc_claimAutoreleasedReturnValue(v19);
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "PHBottomBar subview was outside of PHBottomBar bounds. Setting mainButtonLayoutGuide x value to 0", buf, 2u);
      }

      v4 = 0.0;
    }
    if (v10 < 0.0)
    {
      v21 = sub_1000C5588();
      v22 = objc_claimAutoreleasedReturnValue(v21);
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v23 = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "PHBottomBar subview was outside of PHBottomBar bounds. Setting mainButtonLayoutGuide y value to 0", v23, 2u);
      }

      v10 = 0.0;
    }
    -[UIView setFrame:](self->_mainButtonLayoutGuide, "setFrame:", v4, v10, v16, 1.0);
  }
}

- (BOOL)pointInside:(CGPoint)a3 withEvent:(id)a4
{
  double y;
  double x;
  id v7;
  void *v8;
  id v9;
  id v10;
  int v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];

  y = a3.y;
  x = a3.x;
  v7 = a4;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar subviews](self, "subviews", 0));
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v9)
  {
    v10 = v9;
    v11 = 0;
    v12 = *(_QWORD *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(_QWORD *)v17 != v12)
          objc_enumerationMutation(v8);
        v14 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * (_QWORD)i);
        if ((objc_msgSend(v14, "isHidden") & 1) == 0
          && objc_msgSend(v14, "isUserInteractionEnabled"))
        {
          -[PHBottomBar convertPoint:toView:](self, "convertPoint:toView:", v14, x, y);
          v11 |= objc_msgSend(v14, "pointInside:withEvent:", v7);
        }
      }
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v10);
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11 & 1;
}

- (void)setAction:(int64_t)a3 selected:(BOOL)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a4;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", a3));
  objc_msgSend(v5, "setSelected:", v4);

}

- (void)setAction:(int64_t)a3 enabled:(BOOL)a4
{
  _BOOL8 v4;
  void *v6;
  id v7;

  v4 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:"));
  v7 = v6;
  if (a3 == 30)
  {
    objc_msgSend(v6, "setShowDisabled:", v4 ^ 1);
    v6 = v7;
  }
  objc_msgSend(v6, "setEnabled:", v4);

}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  void *v10;
  objc_super v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v3 = a3;
  if (-[PHBottomBar isUserInteractionEnabled](self, "isUserInteractionEnabled") != a3)
  {
    v14 = 0u;
    v15 = 0u;
    v12 = 0u;
    v13 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));

    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v10), "setEnabled:", v3);
          v10 = (char *)v10 + 1;
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
  v11.receiver = self;
  v11.super_class = (Class)PHBottomBar;
  -[PHBottomBar setUserInteractionEnabled:](&v11, "setUserInteractionEnabled:", v3);
}

- (void)setDeclineAndMessageIsAvailable:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "frontmostAudioOrVideoCall"));

  if (v3)
    v6 = objc_msgSend(v11, "isBranded") ^ 1;
  else
    v6 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 11));
  objc_msgSend(v7, "setEnabled:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 9));
  objc_msgSend(v8, "setEnabled:", v6);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 11));
  objc_msgSend(v9, "setHidden:", !v3);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 9));
  objc_msgSend(v10, "setHidden:", !v3);

  self->_declineAndMessageIsAvailable = v3;
}

- (void)setDeclineAndRemindIsAvailable:(BOOL)a3
{
  _BOOL8 v5;
  void *v6;

  v5 = !a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 12));
  objc_msgSend(v6, "setHidden:", v5);

  self->_declineAndRemindIsAvailable = a3;
}

- (void)setCurrentState:(int64_t)a3
{
  -[PHBottomBar setCurrentState:animated:animationCompletionBlock:](self, "setCurrentState:animated:animationCompletionBlock:", a3, 0, 0);
}

- (int64_t)_gestureStateToCompletionState:(int64_t)a3
{
  int64_t v3;

  v3 = 1;
  if (a3 == 4)
    v3 = 2;
  if (a3 == 1)
    return 0;
  else
    return v3;
}

- (void)setCurrentState:(int64_t)a3 animated:(BOOL)a4 animationCompletionBlock:(id)a5
{
  _BOOL4 v5;
  void (**v8)(id, uint64_t);
  id v9;
  NSObject *v10;
  void *v11;
  void ***v12;
  void *v13;
  void *v14;
  unsigned int v15;
  id v16;
  NSObject *v17;
  char v18;
  void *v19;
  void *v20;
  void *v21;
  unsigned int v22;
  unint64_t v23;
  double v24;
  void *v25;
  void *v26;
  void *v27;
  unsigned int v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  uint64_t v35;
  void *v36;
  void *v37;
  _BOOL4 v38;
  void *v39;
  void *v40;
  uint64_t v41;
  void *v42;
  void *v43;
  _BOOL4 v44;
  void *v45;
  unsigned int v46;
  void *v47;
  void *v48;
  void *v49;
  _BOOL4 v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  uint64_t v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  char v78;
  void *v79;
  void (**v80)(void);
  void *v81;
  unsigned __int8 v82;
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
  uint64_t v93;
  uint64_t v94;
  char isKindOfClass;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  uint64_t v102;
  uint64_t v103;
  char v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  uint64_t v115;
  void *v116;
  void *v117;
  unsigned int v118;
  void *v119;
  uint64_t v120;
  void *v121;
  void *v122;
  unsigned int v123;
  void *v124;
  void *v125;
  unsigned int v126;
  void *v127;
  void *v128;
  void *v129;
  BOOL v130;
  void *v131;
  void *v132;
  void *v133;
  uint64_t v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  uint64_t v139;
  void *v140;
  void *v141;
  void *v142;
  uint64_t v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  unsigned int v159;
  void *v160;
  void *v161;
  void *v162;
  unint64_t v163;
  double v164;
  void *v165;
  void *v166;
  void *v167;
  void *v168;
  unint64_t v169;
  double v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  uint64_t v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  BOOL v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  BOOL v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  BOOL v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  unint64_t v201;
  double v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  uint64_t v215;
  void *v216;
  void *v217;
  void *v218;
  void **v219;
  uint64_t v220;
  void (*v221)(uint64_t);
  void *v222;
  void (**v223)(id, uint64_t);
  id v224[2];
  BOOL v225;
  uint8_t buf[4];
  int64_t v227;
  __int16 v228;
  int64_t v229;

  v5 = a4;
  v8 = (void (**)(id, uint64_t))a5;
  if (!-[PHBottomBar animating](self, "animating"))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "frontmostAudioOrVideoCall"));

    v15 = -[PHBottomBar callScreeningAvailable](self, "callScreeningAvailable");
    v16 = sub_1000C5588();
    v17 = objc_claimAutoreleasedReturnValue(v16);
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      v227 = (int64_t)self;
      v228 = 2048;
      v229 = a3;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "BottomBar (%@) set to state: %ld", buf, 0x16u);
    }

    if (-[PHBottomBar currentState](self, "currentState") == a3)
      goto LABEL_83;
    if (v5
      && -[PHBottomBar animateFromState:toState:completion:](self, "animateFromState:toState:completion:", self->_currentState, a3, v8))
    {
      v18 = 1;
      goto LABEL_62;
    }
    -[PHBottomBar removeAllButtons](self, "removeAllButtons");
    if (a3)
    {
      if (a3 == 11)
      {
        v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, 0, 0, 0, 0, 0));
        -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v19);

        v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
        if ((objc_opt_respondsToSelector(v20, "shouldShowHardPauseNumbers") & 1) != 0)
        {
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
          v22 = objc_msgSend(v21, "shouldShowHardPauseNumbers");

          if (!v22)
          {
LABEL_19:
            v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar useRTTButton](self, "useRTTButton"));
            -[PHBottomBar setSupplementalBottomRightButton:](self, "setSupplementalBottomRightButton:", v27);

            v28 = -[PHBottomBar shouldShowUseRTTButton](self, "shouldShowUseRTTButton");
            v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
            objc_msgSend(v29, "setAlpha:", (double)v28);

            goto LABEL_56;
          }
          v23 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
          v24 = 15.0;
          if (!v23)
            v24 = 14.0;
          v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v24));
          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 22, &stru_10028DC20, 0, 0, v20, v25));
          -[PHBottomBar setSupplementalBottomLeftButton:](self, "setSupplementalBottomLeftButton:", v26);

        }
        goto LABEL_19;
      }
      if ((unint64_t)(a3 - 1) <= 2)
      {
        v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 8, 0, 0, 0, 0, 0));
        -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v34);

        if (a3 == 1)
          v35 = 3;
        else
          v35 = 1;
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", v35, 0, 0, 0, 0, 0));
        -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v36);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
        v38 = objc_msgSend(v37, "callDisplayStyle") == (id)3;

        if (v38)
        {
          if (v15)
          {
            v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 24, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v39);

          }
        }
        else if (v15)
        {
          v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
          -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v54);

          v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 24, 0, 0, 0, 0, 0, 44.0));
          -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", v55);

        }
        else
        {
          if (-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
          {
LABEL_147:
            v196 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
            -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v196);

            v197 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 12, 0, 0, 0, 0, 0, 44.0));
          }
          else
          {
LABEL_159:
            v212 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 12, 0, 0, 0, 0, 0));
            -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v212);

            v197 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 9, 0, 0, 0, 0, 0));
          }
          -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", v197);

        }
        goto LABEL_56;
      }
      if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 4)
      {
        switch(a3)
        {
          case 6:
            v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
            v50 = objc_msgSend(v49, "callDisplayStyle") == (id)3;

            if (v50)
            {
              v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 8, 0, 0, 0, 0, 0));
              -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v51);

              v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 3, 0, 0, 0, 0, 0));
              -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v52);

              v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 9, 0, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v53);

            }
            else
            {
              if (-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
              {
                v179 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
                -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v179);

                v180 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 12, 0, 0, 0, 0, 0, 44.0));
              }
              else
              {
                v209 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 12, 0, 0, 0, 0, 0));
                -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v209);

                v180 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 9, 0, 0, 0, 0, 0));
              }
              v210 = (void *)v180;
              -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", v180);

              if (-[PHBottomBar shouldShowActionTypeCameraFlip](self, "shouldShowActionTypeCameraFlip"))
                v211 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", 2));
              else
                v211 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", 3));
              -[PHBottomBar setSlidingButton:](self, "setSlidingButton:", v211);

            }
            break;
          case 7:
            if (-[PHBottomBar shouldShowActionTypeSendToVoicemail](self, "shouldShowActionTypeSendToVoicemail"))
              v115 = 23;
            else
              v115 = 7;
            v116 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", v115, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v116);

            v117 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callCenter](self, "callCenter"));
            v118 = objc_msgSend(v117, "isEndAndAnswerAllowed");

            if (v118)
            {
              v119 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 4, 0, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v119);
            }
            else
            {
              v119 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v181 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v119, "localizedStringForKey:value:table:", CFSTR("END_CURRENT"), &stru_10028DC20, CFSTR("BottomBar")));
              v182 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, v181, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v182);

            }
            v183 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 6, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v183);

            v184 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
            v185 = objc_msgSend(v184, "callDisplayStyle") == (id)3;

            if (!v185)
            {
              if (!-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
                goto LABEL_159;
              goto LABEL_147;
            }
            break;
          case 8:
            if (-[PHBottomBar shouldShowActionTypeSendToVoicemail](self, "shouldShowActionTypeSendToVoicemail"))
              v120 = 23;
            else
              v120 = 7;
            v121 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", v120, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v121);

            v122 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callCenter](self, "callCenter"));
            v123 = objc_msgSend(v122, "isEndAndAnswerAllowed");

            if (v123)
            {
              v124 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 4, 0, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v124);
            }
            else
            {
              v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v186 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v124, "localizedStringForKey:value:table:", CFSTR("END_CURRENT"), &stru_10028DC20, CFSTR("BottomBar")));
              v187 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, v186, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v187);

            }
            v188 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 5, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v188);

            v189 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
            v190 = objc_msgSend(v189, "callDisplayStyle") == (id)3;

            if (!v190)
            {
              if (!-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
                goto LABEL_159;
              goto LABEL_147;
            }
            break;
          case 9:
            v125 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callCenter](self, "callCenter"));
            v126 = objc_msgSend(v125, "isEndAndAnswerAllowed");

            if (v126)
            {
              v127 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 4, 0, 0, 0, 0, 0));
              -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v127);
            }
            else
            {
              v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v191 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v127, "localizedStringForKey:value:table:", CFSTR("END_CURRENT"), &stru_10028DC20, CFSTR("BottomBar")));
              v192 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, v191, 0, 0, 0, 0));
              -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v192);

            }
            v193 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 7, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v193);

            v194 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
            v195 = objc_msgSend(v194, "callDisplayStyle") == (id)3;

            if (!v195)
            {
              if (!-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
                goto LABEL_159;
              goto LABEL_147;
            }
            break;
          case 10:
            v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", 4));
            -[PHBottomBar setSlidingButton:](self, "setSlidingButton:", v128);

            break;
          case 12:
            v135 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", 5));
            -[PHBottomBar setSlidingButton:](self, "setSlidingButton:", v135);

            break;
          case 13:
            v136 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 18, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v136);

            v137 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 17, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v137);

            break;
          case 14:
            v138 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v138);

            if (-[PHBottomBar shouldShowActionTypeAudioRoute](self, "shouldShowActionTypeAudioRoute"))
              v139 = 21;
            else
              v139 = 20;
            +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
            v140 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v139, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v140);

            +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
            v141 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 19, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v141);

            break;
          case 15:
            v142 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v142);

            if (-[PHBottomBar shouldShowActionTypeAudioRoute](self, "shouldShowActionTypeAudioRoute"))
              v143 = 21;
            else
              v143 = 20;
            +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
            v144 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v143, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v144);

            if (-[PHBottomBar shouldShowActionTypePunchOut](self, "shouldShowActionTypePunchOut"))
            {
              v145 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
              v146 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v145, "imageForItemInBar:withActionType:", self, 28));
              v147 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
              v148 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 28, 0, v146, v147, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v148);

            }
            else if (-[PHBottomBar shouldShowActionTypePhotoCapture](self, "shouldShowActionTypePhotoCapture"))
            {
              +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
              v198 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 30, 0, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v198);

            }
            else if (-[PHBottomBar shouldShowActionTypeEffects](self, "shouldShowActionTypeEffects"))
            {
              +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
              v213 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 31, 0, 0, 0, 0, 0));
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v213);

            }
            else
            {
              -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", 0);
            }
            break;
          case 16:
            v149 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", 6));
            -[PHBottomBar setSlidingButton:](self, "setSlidingButton:", v149);

            break;
          case 17:
            v150 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 17, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v150);

            v151 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 18, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v151);

            v152 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 26, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v152);

            break;
          case 18:
            v153 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
            v154 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v153, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10028DC20, CFSTR("BottomBar")));
            v155 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 28.0));
            v156 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
            v157 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 13, v154, 0, 0, v155, v156));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v157);

            break;
          case 19:
            v158 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
            v159 = objc_msgSend(v158, "isDialPadEnabled");

            v160 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, 0, 0, 0, 0, 0));
            if (v159)
            {
              -[PHBottomBar setSupplementalBottomLeftButton:](self, "setSupplementalBottomLeftButton:", v160);

              v161 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v162 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "localizedStringForKey:value:table:", CFSTR("HIDE_KEYPAD"), &stru_10028DC20, CFSTR("BottomBar")));
              v163 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
              v164 = 15.0;
              if (!v163)
                v164 = 14.0;
              v165 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v164));
              v166 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
              v167 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 16, v162, 0, 0, v165, v166));
              -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v167);

            }
            else
            {
              -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v160);

              v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v200 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v199, "localizedStringForKey:value:table:", CFSTR("HIDE"), &stru_10028DC20, CFSTR("BottomBar")));
              v201 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
              v202 = 15.0;
              if (!v201)
                v202 = 14.0;
              v203 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v202));
              v204 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
              v205 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 16, v200, 0, 0, v203, v204));
              -[PHBottomBar setSupplementalBottomRightButton:](self, "setSupplementalBottomRightButton:", v205);

            }
            break;
          case 20:
            v168 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 14, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v168);

            v169 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
            v170 = 15.0;
            if (!v169)
              v170 = 14.0;
            v171 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v170));
            v172 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
            v173 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 22, &stru_10028DC20, 0, 0, v171, v172));
            -[PHBottomBar setSupplementalBottomLeftButton:](self, "setSupplementalBottomLeftButton:", v173);

            break;
          case 21:
            v174 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 25, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v174);

            break;
          case 24:
            v175 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", 0));
            -[PHBottomBar setSlidingButton:](self, "setSlidingButton:", v175);

            break;
          case 26:
            v176 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 32, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v176);

            v177 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 34, 0, 0, 0, 0, 0));
            -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v177);

            v178 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 33, 0, 0, 0, 0, 0));
            -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v178);

            break;
          default:
            if (a3 == 22)
            {
              v206 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 36, 0, 0, 0, 0, 0));
              -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v206);

              v207 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 35, 0, 0, 0, 0, 0));
              -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v207);

              v208 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar alertFeedbackGenerator](self, "alertFeedbackGenerator"));
              objc_msgSend(v208, "notificationOccurred:", 0);

            }
            else if (a3 == 25 || a3 == 23)
            {
              v129 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
              v130 = objc_msgSend(v129, "callDisplayStyle") == (id)3;

              if (!v130)
              {
                v131 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
                v132 = v131;
                if (a3 == 25)
                {
                  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("SCREENING_BLOCK"), &stru_10028DC20, CFSTR("BottomBar")));
                  v134 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 10, v133, 0, 0, 0, 0));
                }
                else
                {
                  v133 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("SCREENING_MESSAGE"), &stru_10028DC20, CFSTR("BottomBar")));
                  v134 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 27, v133, 0, 0, 0, 0));
                }
                v214 = (void *)v134;
                -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v134);

              }
              if (TUCallScreeningRTTEnabled(0))
              {
                if (-[PHBottomBar shouldShowAnswerRTTButton](self, "shouldShowAnswerRTTButton"))
                  v215 = 2;
                else
                  v215 = 1;
              }
              else
              {
                v215 = 1;
              }
              v216 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
              v217 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v216, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_10028DC20, CFSTR("BottomBar")));
              v218 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", v215, v217, 0, 0, 0, 0));
              -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v218);

            }
            break;
        }
        goto LABEL_56;
      }
      if (v15)
      {
        v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
        -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v40);

        v41 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 24, 0, 0, 0, 0, 0, 44.0));
      }
      else if (-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
      {
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
        -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v57);

        v41 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 12, 0, 0, 0, 0, 0, 44.0));
      }
      else
      {
        v109 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 12, 0, 0, 0, 0, 0));
        -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v109);

        v41 = objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 9, 0, 0, 0, 0, 0));
      }
      v110 = (void *)v41;
      -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", v41);

      v111 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeSlidingButtonWithType:](self, "makeSlidingButtonWithType:", a3 == 5));
      -[PHBottomBar setSlidingButton:](self, "setSlidingButton:", v111);

      if (!-[PHBottomBar shouldShowAnswerRTTButton](self, "shouldShowAnswerRTTButton"))
      {
LABEL_56:
        v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v59);

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v60);

        v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v61);

        v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v62);

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](self, "supplementalBottomLeftButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v63);

        v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v64);

        v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](self, "slidingButton"));
        -[PHBottomBar addSubview:](self, "addSubview:", v65);

        v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](self, "sideButtonLeft"));
        -[PHBottomBar addSubview:](self, "addSubview:", v66);

        v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonRight](self, "sideButtonRight"));
        -[PHBottomBar addSubview:](self, "addSubview:", v67);

        if (-[PHBottomBar declineAndMessageIsAvailable](self, "declineAndMessageIsAvailable"))
          v68 = objc_msgSend(v14, "isBranded") ^ 1;
        else
          v68 = 0;
        v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 11));
        objc_msgSend(v69, "setEnabled:", v68);

        v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 9));
        objc_msgSend(v70, "setEnabled:", v68);

        LODWORD(v70) = -[PHBottomBar declineAndMessageIsAvailable](self, "declineAndMessageIsAvailable");
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 11));
        objc_msgSend(v71, "setHidden:", v70 ^ 1);

        LODWORD(v70) = -[PHBottomBar declineAndMessageIsAvailable](self, "declineAndMessageIsAvailable");
        v72 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 9));
        objc_msgSend(v72, "setHidden:", v70 ^ 1);

        LODWORD(v70) = -[PHBottomBar declineAndRemindIsAvailable](self, "declineAndRemindIsAvailable");
        v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", 12));
        objc_msgSend(v73, "setHidden:", v70 ^ 1);

        v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
        if (v74)
        {
          v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
          -[PHBottomBar removeConstraints:](self, "removeConstraints:", v75);

        }
        v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar constraintsForState:](self, "constraintsForState:", a3));
        -[PHBottomBar setButtonLayoutConstraints:](self, "setButtonLayoutConstraints:", v76);

        v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
        -[PHBottomBar addConstraints:](self, "addConstraints:", v77);

        v18 = 0;
LABEL_62:
        self->_currentState = a3;
        -[PHBottomBar setNeedsLayout](self, "setNeedsLayout");
        if (v8)
          v78 = v18;
        else
          v78 = 1;
        if ((v78 & 1) == 0)
          v8[2](v8, 1);
        v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar statusChangedHandler](self, "statusChangedHandler"));

        if (v79)
        {
          v80 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHBottomBar statusChangedHandler](self, "statusChangedHandler"));
          v80[2]();

        }
        if (!v5)
          -[PHBottomBar layoutIfNeeded](self, "layoutIfNeeded");
        v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](self, "captureView"));
        if (!v81)
          goto LABEL_83;
        if (-[PHBottomBar callScreeningAvailable](self, "callScreeningAvailable"))
        {

        }
        else
        {
          v82 = -[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening");

          if ((v82 & 1) == 0)
          {
LABEL_83:

            goto LABEL_84;
          }
        }
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](self, "slidingButton"));

        if (v83)
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](self, "slidingButton"));
          v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v84, "acceptButton"));
          v86 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "trackSolidViewBackDropVisualEffectView"));
          objc_msgSend(v86, "_setGroupName:", CFSTR("PHBottomBarButtonCaptureGroup"));

          v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](self, "captureView"));
          v88 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](self, "slidingButton"));
          v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "acceptButton"));
          v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "trackSolidViewBackDropVisualEffectView"));
          objc_msgSend(v90, "_setCaptureView:", v87);

        }
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));
        if (v91)
        {
          v92 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));
          objc_opt_class(PHBottomBarButton, v93);
          isKindOfClass = objc_opt_isKindOfClass(v92, v94);

          if ((isKindOfClass & 1) != 0)
          {
            v96 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));
            v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "effectView"));
            objc_msgSend(v97, "_setGroupName:", CFSTR("PHBottomBarButtonCaptureGroup"));

            v98 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](self, "captureView"));
            v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "effectView"));
            objc_msgSend(v99, "_setCaptureView:", v98);

          }
        }
        v100 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));
        if (v100)
        {
          v101 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));
          objc_opt_class(PHBottomBarButton, v102);
          v104 = objc_opt_isKindOfClass(v101, v103);

          if ((v104 & 1) != 0)
          {
            v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));
            v106 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "effectView"));
            objc_msgSend(v106, "_setGroupName:", CFSTR("PHBottomBarButtonCaptureGroup"));

            v107 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](self, "captureView"));
            v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v105, "effectView"));
            objc_msgSend(v108, "_setCaptureView:", v107);

          }
        }
        goto LABEL_83;
      }
      v112 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Call Accept RTT")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v112, "imageWithRenderingMode:", 2));

      if (v33)
      {
        v113 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](self, "slidingButton"));
        v114 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v113, "acceptButton"));
        objc_msgSend(v114, "setKnobImage:", v33);

      }
LABEL_55:

      goto LABEL_56;
    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 7, 0, 0, 0, 0, 0));
    -[PHBottomBar setMainLeftButton:](self, "setMainLeftButton:", v30);

    if (-[PHBottomBar shouldShowAnswerRTTButton](self, "shouldShowAnswerRTTButton"))
    {
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Call Accept RTT")));
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "_flatImageWithColor:", v32));

    }
    else
    {
      v33 = 0;
    }
    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 1, 0, v33, 0, 0, 0));
    -[PHBottomBar setMainRightButton:](self, "setMainRightButton:", v42);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v44 = objc_msgSend(v43, "callDisplayStyle") == (id)3;

    if (v44)
    {
      v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "provider"));
      v46 = objc_msgSend(v45, "isSystemProvider");

      if (!v46)
        goto LABEL_55;
      if (v15)
      {
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 24, 0, 0, 0, 0, 0));
        -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v47);
      }
      else
      {
        if (!-[PHBottomBar shouldShowActionTypeSendToVoicemail](self, "shouldShowActionTypeSendToVoicemail"))
          goto LABEL_55;
        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 23, 0, 0, 0, 0, 0));
        -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v47);
      }
    }
    else if (v15)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
      -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v48);

      v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 24, 0, 0, 0, 0, 0, 44.0));
      -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", v47);
    }
    else
    {
      if (-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
      {
        v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 11, 0, 0, 0, 0, 0, 44.0));
        -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v56);

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 12, 0, 0, 0, 0, 0, 44.0));
      }
      else
      {
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 12, 0, 0, 0, 0, 0));
        -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", v58);

        v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 9, 0, 0, 0, 0, 0));
      }
      -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", v47);
    }

    goto LABEL_55;
  }
  v9 = sub_1000C5588();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v227 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Bottom bar is currently animating, we will pend this bottom bar state change to state %ld until that's over", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar pendingStateBlocks](self, "pendingStateBlocks"));
  v219 = _NSConcreteStackBlock;
  v220 = 3221225472;
  v221 = sub_1000EE5A8;
  v222 = &unk_100287C98;
  objc_copyWeak(v224, (id *)buf);
  v224[1] = (id)a3;
  v225 = v5;
  v223 = v8;
  v12 = objc_retainBlock(&v219);
  objc_msgSend(v11, "addObject:", v12, v219, v220, v221, v222);

  objc_destroyWeak(v224);
  objc_destroyWeak((id *)buf);
LABEL_84:

}

- (id)_supplementalBottomLeftButtonLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](self, "centerXAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](self, "supplementalBottomLeftButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  +[PHInCallNumberPadButton defaultSize](PHInCallNumberPadButton, "defaultSize");
  v8 = v7;
  v9 = sub_1000EA838();
  v10 = 0.0;
  if (v9)
    v10 = 12.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v6, v8 + v10));

  objc_msgSend(v11, "setIdentifier:", CFSTR("supplementalBottomLeftButtonCenterXAnchorLayoutConstraint"));
  objc_msgSend(v3, "addObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](self, "supplementalBottomLeftButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));

  objc_msgSend(v16, "setIdentifier:", CFSTR("supplementalBottomLeftButtonCenterYAnchorLayoutConstraint"));
  objc_msgSend(v3, "addObject:", v16);

  return v3;
}

- (id)_supplementalBottomRightButtonLayoutConstraints
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  _BOOL4 v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](self, "centerXAnchor"));
  +[PHInCallNumberPadButton defaultSize](PHInCallNumberPadButton, "defaultSize");
  v8 = v7;
  v9 = sub_1000EA838();
  v10 = 0.0;
  if (v9)
    v10 = 12.0;
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "constraintEqualToAnchor:constant:", v6, v8 + v10));

  objc_msgSend(v11, "setIdentifier:", CFSTR("supplementalBottomRightButtonCenterXAnchorLayoutConstraint"));
  objc_msgSend(v3, "addObject:", v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "centerYAnchor"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "centerYAnchor"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToAnchor:", v15));

  objc_msgSend(v16, "setIdentifier:", CFSTR("supplementalBottomRightButtonCenterYAnchorLayoutConstraint"));
  objc_msgSend(v3, "addObject:", v16);

  return v3;
}

- (id)constraintsForState:(int64_t)a3
{
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  id v7;
  double v8;
  double v9;
  unint64_t v10;
  double v11;
  double v12;
  float v13;
  double v14;
  double v15;
  double v16;
  uint64_t v17;
  double v18;
  double v19;
  unint64_t v20;
  double v21;
  double v22;
  double v23;
  unint64_t v24;
  void *v25;
  double v26;
  void *v27;
  void *v28;
  void *v29;
  double v30;
  double v31;
  unint64_t v32;
  double v33;
  double v34;
  void *v35;
  double v36;
  unint64_t v37;
  void *v38;
  void *v39;
  double v40;
  void *v41;
  void *v42;
  void *v43;
  PHBottomBar *v44;
  UIButton *supplementalTopLeftButton;
  void *v46;
  uint64_t v47;
  UIButton *v48;
  void *v49;
  uint64_t v50;
  id v51;
  void *v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  void *v59;
  void *v60;
  void *v61;
  id v62;
  void *v63;
  void *v64;
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
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  void *v82;
  double v83;
  double v84;
  void *v85;
  const __CFString *v86;
  const __CFString *v87;
  PHBottomBar *v88;
  void *v89;
  void *v90;
  const __CFString *v91;
  void *v92;
  const __CFString *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  id v98;
  double v99;
  double v100;
  double v101;
  double v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  unint64_t v112;
  double v113;
  unint64_t v114;
  double v115;
  void *v116;
  float v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  void *v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  void *v128;
  uint64_t v129;
  void *v130;
  double v131;
  double v132;
  void *v133;
  uint64_t v134;
  void *v135;
  uint64_t v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  id v147;
  void *v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  double v153;
  double v154;
  double v155;
  void *v156;
  id v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  unsigned int v166;
  void *v167;
  double v168;
  double v169;
  double v170;
  double v171;
  double v172;
  double v173;
  double v174;
  void *v175;
  void *v176;
  void *v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  UIButton *supplementalBottomLeftButton;
  void *v185;
  void *v186;
  double v187;
  void *v188;
  void *v189;
  void *v190;
  double v191;
  double v192;
  _BOOL4 v193;
  double v194;
  double v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  double v214;
  double v215;
  _BOOL4 v216;
  double v217;
  double v218;
  void *v219;
  const __CFString *v220;
  void *v221;
  void *v222;
  void *v223;
  void *v224;
  void *v225;
  unsigned int v226;
  const __CFString *v227;
  const __CFString *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  unsigned int v250;
  void *v251;
  void *v252;
  void *v253;
  void *v254;
  void *v255;
  void *v257;
  unsigned __int8 v258;
  UIButton *v259;
  UIButton *v260;
  UIButton *v261;
  void *v262;
  void *v263;
  PHBottomBar *v264;
  _QWORD v265[2];
  _QWORD v266[2];
  _QWORD v267[2];
  _QWORD v268[13];
  _QWORD v269[13];

  v4 = objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v258 = -[PHBottomBar callScreeningAvailable](self, "callScreeningAvailable");
  v5 = objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels"));
  v268[0] = CFSTR("SideMarginForDoubleButton");
  -[PHBottomBar sideMarginForDoubleButton](self, "sideMarginForDoubleButton");
  v254 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v269[0] = v254;
  v268[1] = CFSTR("SideMarginForFaceTimeButtons");
  -[PHBottomBar sideMarginForFaceTimeButtons](self, "sideMarginForFaceTimeButtons");
  v253 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v269[1] = v253;
  v268[2] = CFSTR("SideMarginForFaceTimeInCallButtons");
  -[PHBottomBar sideMarginForFaceTimeInCallButtons](self, "sideMarginForFaceTimeInCallButtons");
  v252 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v269[2] = v252;
  v268[3] = CFSTR("TopMarginForFaceTimeButtons");
  v6 = -[PHBottomBar usesLowerButtons](self, "usesLowerButtons");
  v251 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v7 = objc_msgSend(v251, "callDisplayStyle");
  v250 = v6;
  if (v6)
  {
    if (v7 == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v9 = v8;
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
      || (v10 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing"),
          v11 = 24.0,
          v10 == 3))
    {
      v11 = 30.0;
    }
    v12 = v9 + v11;
    *(float *)&v12 = v12;
    v249 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v12));
    objc_msgSend(v249, "floatValue");
    v14 = v13;
    -[PHBottomBar yOffsetForLoweredButtons](self, "yOffsetForLoweredButtons");
    v16 = v15 + v14;
    *(float *)&v16 = v16;
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
  }
  else
  {
    if (v7 == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v19 = v18;
    if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
      || (v20 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing"),
          v21 = 24.0,
          v20 == 3))
    {
      v21 = 30.0;
    }
    v22 = v19 + v21;
    *(float *)&v22 = v22;
    v17 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
    v249 = (void *)v17;
  }
  v247 = (void *)v17;
  v269[3] = v17;
  v268[4] = CFSTR("ButtonSpacing");
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
    || (v24 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing"),
        LODWORD(v23) = 24.0,
        v24 == 3))
  {
    LODWORD(v23) = 30.0;
  }
  v248 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
  v269[4] = v248;
  v268[5] = CFSTR("AmbientButtonSpacing");
  +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v269[5] = v25;
  v268[6] = CFSTR("ButtonSliderSpacing");
  v262 = (void *)v4;
  v263 = (void *)v5;
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
    || (id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)3)
  {
    LODWORD(v26) = 25.0;
  }
  else
  {
    LODWORD(v26) = 1102315520;
  }
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v26));
  v269[6] = v27;
  v268[7] = CFSTR("BottomSupplementalButtonSpacing");
  +[PHBottomBar defaultBottomSupplementalButtonSpacing](PHBottomBar, "defaultBottomSupplementalButtonSpacing");
  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v269[7] = v28;
  v269[8] = &off_1002973A8;
  v268[8] = CFSTR("TopSupplementalButtonSpacing");
  v268[9] = CFSTR("HeightOfAButtonPlusButtonSpacing");
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v29, "callDisplayStyle") == (id)3)
    +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
  else
    +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
  v31 = v30;
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
    || (v32 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing"),
        v33 = 24.0,
        v32 == 3))
  {
    v33 = 30.0;
  }
  v34 = v31 + v33;
  *(float *)&v34 = v34;
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
  v269[9] = v35;
  v268[10] = CFSTR("ButtonSpacingCallScreening");
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
    || (v37 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing"),
        LODWORD(v36) = 24.0,
        v37 == 3))
  {
    LODWORD(v36) = 30.0;
  }
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v36));
  v269[10] = v38;
  v268[11] = CFSTR("HeightOfCallScreeningButtonPlusButtonSpacing");
  v264 = self;
  -[PHBottomBar heightOfCallScreeningButtonPlusButtonSpacing](self, "heightOfCallScreeningButtonPlusButtonSpacing");
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v269[11] = v39;
  v268[12] = CFSTR("ButtonSliderSpacingCallScreeningSlider");
  if ((id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)6
    || (id)+[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing") == (id)3)
  {
    LODWORD(v40) = 25.0;
  }
  else
  {
    LODWORD(v40) = 1102315520;
  }
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v40));
  v269[12] = v41;
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v269, v268, 13));

  if (v250)
  v43 = v263;
  v44 = v264;
  supplementalTopLeftButton = v264->_supplementalTopLeftButton;
  v46 = v262;
  if (!supplementalTopLeftButton)
    supplementalTopLeftButton = v264->_supplementalTopRightButton;
  v48 = supplementalTopLeftButton;
  v49 = v42;
  if ((v258 & 1) != 0 || -[PHBottomBar shouldUseLayoutAsCallScreening](v264, "shouldUseLayoutAsCallScreening"))
  {
    objc_opt_class(PHBottomBarButton, v47);
    if ((objc_opt_isKindOfClass(v48, v50) & 1) != 0)
    {
      v51 = objc_msgSend(v42, "mutableCopy");
      v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v52, "bounds");
      v54 = v53;
      v56 = v55;

      if (v54 < v56)
        v54 = v56;
      +[PHUIConfiguration inComingCallSupplementalButtonAndMainButtonSpacingRatio](PHUIConfiguration, "inComingCallSupplementalButtonAndMainButtonSpacingRatio");
      v58 = v57 * v54;
      v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v58));
      objc_msgSend(v51, "setObject:forKeyedSubscript:", v59, CFSTR("ButtonSpacingCallScreening"));

      v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v58 + -6.0));
      objc_msgSend(v51, "setObject:forKeyedSubscript:", v60, CFSTR("ButtonSliderSpacingCallScreeningSlider"));

      v49 = v51;
    }
  }
  switch(a3)
  {
    case 0:
    case 1:
    case 2:
    case 3:
    case 9:
      goto LABEL_47;
    case 4:
    case 5:
      goto LABEL_74;
    case 6:
      v146 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](v264, "callDisplayStyleManager"));
      v147 = objc_msgSend(v146, "callDisplayStyle");

      if (v147 != (id)3)
      {
LABEL_74:
        v148 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](v264, "slidingButton"));
        v149 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v148, 9, 0, v264, 9, 1.0, 0.0));
        objc_msgSend(v262, "addObject:", v149);

        if ((v258 & 1) != 0 || -[PHBottomBar shouldUseLayoutAsCallScreening](v264, "shouldUseLayoutAsCallScreening"))
        {
          v150 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_supplementalTopLeftButton]-(ButtonSliderSpacingCallScreeningSlider)-[_slidingButton]"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v150);

          v151 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_supplementalTopRightButton]-(ButtonSliderSpacingCallScreeningSlider)-[_slidingButton]"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v151);

          v152 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](v264, "slidingButton"));
          objc_msgSend(v152, "knobWidth");
          v154 = v153;

          v155 = (v154 + -44.0) * 0.5 + 6.0;
        }
        else
        {
          v203 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_supplementalTopLeftButton]-(ButtonSliderSpacing)-[_slidingButton]"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v203);

          v204 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|[_supplementalTopRightButton]-(ButtonSliderSpacing)-[_slidingButton]"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v204);

          v155 = 0.0;
        }
        v205 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](v264, "supplementalTopLeftButton"));
        v206 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](v264, "slidingButton"));
        v207 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v205, 5, 0, v206, 5, 1.0, v155));
        objc_msgSend(v262, "addObject:", v207);

        v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](v264, "supplementalTopRightButton"));
        v130 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar slidingButton](v264, "slidingButton"));
        v132 = -v155;
        v131 = 1.0;
        v133 = v128;
        v134 = 6;
        v135 = v130;
        v136 = 6;
        goto LABEL_96;
      }
LABEL_47:
      v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](v264, "callDisplayStyleManager"));
      v62 = objc_msgSend(v61, "callDisplayStyle");

      if (v62 == (id)3)
      {
        v259 = v48;
        v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](v264, "sideButtonLeft"));

        v255 = v49;
        if (v63)
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|[_sideButtonLeft]-(AmbientButtonSpacing)-[_mainLeftButton]-(AmbientButtonSpacing)-[_mainRightButton]|"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v64);

          v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
          v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "centerXAnchor"));
          v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](v264, "centerXAnchor"));
          v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "constraintEqualToAnchor:", v67));
          v266[0] = v68;
          v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](v264, "sideButtonLeft"));
          v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "topAnchor"));
          v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar topAnchor](v264, "topAnchor"));
          v72 = v262;
          v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "constraintEqualToAnchor:", v71));
          v266[1] = v73;
          v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v266, 2));
          objc_msgSend(v262, "addObjectsFromArray:", v74);

          v44 = v264;
        }
        else
        {
          v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(>=0)-[_mainLeftButton]-(AmbientButtonSpacing)-[_mainRightButton]-|"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v65);
          v72 = v262;
        }

        v137 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v44, "mainLeftButton"));
        v138 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v137, "topAnchor"));
        v139 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar topAnchor](v44, "topAnchor"));
        v140 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v138, "constraintEqualToAnchor:", v139));
        v265[0] = v140;
        v141 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v44, "mainRightButton"));
        v142 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v141, "topAnchor"));
        v143 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar topAnchor](v44, "topAnchor"));
        v144 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v142, "constraintEqualToAnchor:", v143));
        v265[1] = v144;
        v145 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v265, 2));
        objc_msgSend(v72, "addObjectsFromArray:", v145);

        v118 = 0;
        v46 = v72;
        v43 = v263;
        v49 = v255;
        v48 = v259;
        goto LABEL_99;
      }
      v85 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(SideMarginForDoubleButton)-[_mainLeftButton]-(>=0)-[_mainRightButton]-(SideMarginForDoubleButton)-|"), 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v85);

      v86 = CFSTR("V:|[_supplementalTopRightButton]-(ButtonSpacingCallScreening)-[_mainRightButton]");
      v87 = CFSTR("V:|[_supplementalTopLeftButton]-(ButtonSpacingCallScreening)-[_mainLeftButton]");
      if ((v258 & 1) != 0)
      {
        v88 = v264;
      }
      else
      {
        v88 = v264;
        if (!-[PHBottomBar shouldUseLayoutAsCallScreening](v264, "shouldUseLayoutAsCallScreening"))
        {
          v87 = CFSTR("V:|[_supplementalTopLeftButton]-(ButtonSpacing)-[_mainLeftButton]");
          v86 = CFSTR("V:|[_supplementalTopRightButton]-(ButtonSpacing)-[_mainRightButton]");
        }
      }
      v123 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v87, 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v123);

      v124 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v86, 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v124);

      v125 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](v88, "supplementalTopLeftButton"));
      v126 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v88, "mainLeftButton"));
      v127 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v125, 9, 0, v126, 9, 1.0, 0.0));
      objc_msgSend(v262, "addObject:", v127);

      v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](v88, "supplementalTopRightButton"));
      v129 = objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v88, "mainRightButton"));
      goto LABEL_70;
    case 11:
    case 18:
    case 21:
      v260 = v48;
      v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
      v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "centerXAnchor"));
      v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](v264, "centerXAnchor"));
      v78 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "constraintEqualToAnchor:", v77));

      objc_msgSend(v78, "setIdentifier:", CFSTR("mainLeftButtonCenterXAnchorLayoutConstraint"));
      objc_msgSend(v262, "addObject:", v78);
      v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
      v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "topAnchor"));
      v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar topAnchor](v264, "topAnchor"));
      v82 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](v264, "callDisplayStyleManager"));
      if (objc_msgSend(v82, "callDisplayStyle") == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v84 = v83;
      v112 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v113 = 30.0;
      if (v112 != 6)
      {
        v114 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v113 = 24.0;
        if (v114 == 3)
          v113 = 30.0;
      }
      v115 = v84 + v113;
      *(float *)&v115 = v115;
      v116 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v115));
      objc_msgSend(v116, "floatValue");
      v118 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToAnchor:constant:", v81, v117));

      objc_msgSend(v118, "setIdentifier:", CFSTR("mainLeftButtonTopAnchorLayoutConstraint"));
      objc_msgSend(v262, "addObject:", v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](v264, "supplementalBottomLeftButton"));

      if (v119)
      {
        v120 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar _supplementalBottomLeftButtonLayoutConstraints](v264, "_supplementalBottomLeftButtonLayoutConstraints"));
        objc_msgSend(v262, "addObjectsFromArray:", v120);

      }
      v121 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](v264, "supplementalBottomRightButton"));

      v48 = v260;
      if (v121)
      {
        v122 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar _supplementalBottomRightButtonLayoutConstraints](v264, "_supplementalBottomRightButtonLayoutConstraints"));
        objc_msgSend(v262, "addObjectsFromArray:", v122);

      }
      goto LABEL_99;
    case 12:
    case 16:
      v89 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("|[_slidingButton]|")));
      v90 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v89, 0, 0, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v90);

      v91 = CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_slidingButton]");
      goto LABEL_93;
    case 13:
    case 22:
      v92 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]"), 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v92);

      v93 = CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainRightButton]");
      goto LABEL_92;
    case 17:
    case 26:
      v94 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_mainLeftButton, 9, 0, v264, 9, 1.0, 0.0));
      objc_msgSend(v262, "addObject:", v94);

      v95 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_sideButtonLeft]-(SideMarginForFaceTimeButtons)-[_mainLeftButton]-(SideMarginForFaceTimeButtons)-[_sideButtonRight]"), 24, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v95);

      v96 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_sideButtonLeft, 7, 0, v264->_sideButtonRight, 7, 1.0, 0.0));
      objc_msgSend(v262, "addObject:", v96);

      v91 = CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]");
      goto LABEL_93;
    case 19:
      v165 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
      v166 = objc_msgSend(v165, "isDialPadEnabled");

      if (v166)
      {
        v167 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
        objc_msgSend(v167, "bounds");
        v169 = v168;
        v171 = v170;

        if (v169 >= v171)
          v172 = v171;
        else
          v172 = v169;
        if (v169 >= v171)
          v171 = v169;
        +[PHUIConfiguration inComingCallAndInCallControlsBottomPaddingRatio](PHUIConfiguration, "inComingCallAndInCallControlsBottomPaddingRatio");
        v174 = v173;
        v175 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_mainRightButton]"), 0, v49, v263));
        objc_msgSend(v262, "addObjectsFromArray:", v175);

        v176 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](v264, "supplementalBottomLeftButton"));
        v177 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v176, 4, 0, v264, 4, 1.0, -(v174 * v171)));
        objc_msgSend(v262, "addObject:", v177);

        v178 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v264, "mainRightButton"));
        v179 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v178, 6, 0, v264, 6, 1.0, v172 * -0.102));
        objc_msgSend(v262, "addObject:", v179);

        v180 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v264, "mainRightButton"));
        v181 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](v264, "supplementalBottomLeftButton"));
        v182 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v180, 10, 0, v181, 10, 1.0, 0.0));
        objc_msgSend(v262, "addObject:", v182);

        v183 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_supplementalBottomLeftButton, 9, 0, v264, 9, 1.0, 0.0));
        objc_msgSend(v262, "addObject:", v183);

        supplementalBottomLeftButton = v264->_supplementalBottomLeftButton;
        v185 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v264, "mainRightButton"));
        v186 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", supplementalBottomLeftButton, 6, -1, v185, 5, 1.0, -8.0));
        objc_msgSend(v262, "addObject:", v186);

        LODWORD(v187) = 1132068864;
        -[UIButton setContentCompressionResistancePriority:forAxis:](v264->_mainRightButton, "setContentCompressionResistancePriority:forAxis:", 0, v187);
        goto LABEL_98;
      }
      v210 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_mainLeftButton]"), 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v210);

      v211 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_mainLeftButton, 9, 0, v264, 9, 1.0, 0.0));
      objc_msgSend(v262, "addObject:", v211);

      v212 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](v264, "supplementalBottomRightButton"));
      v213 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v212, 10, 0, v264->_mainLeftButton, 10, 1.0, 0.0));
      objc_msgSend(v262, "addObject:", v213);

      +[TPNumberPadButton defaultSize](TPNumberPadButton, "defaultSize");
      v215 = v214;
      v216 = sub_1000EA838();
      v217 = 12.0;
      if (!v216)
        v217 = 0.0;
      v218 = v215 + v217;
      v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](v264, "supplementalBottomRightButton"));
      v219 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v128, 9, 0, v264, 9, 1.0, v218));
      objc_msgSend(v262, "addObject:", v219);
      goto LABEL_109;
    case 20:
      v188 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_mainLeftButton]"), 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v188);

      v189 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]-(BottomSupplementalButtonSpacing)-[_supplementalBottomLeftButton]"), 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v189);

      v190 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_mainLeftButton, 9, 0, v264, 9, 1.0, 0.0));
      objc_msgSend(v262, "addObject:", v190);

      +[TPNumberPadButton defaultSize](TPNumberPadButton, "defaultSize");
      v192 = v191;
      v193 = sub_1000EA838();
      v194 = 12.0;
      if (!v193)
        v194 = 0.0;
      v195 = v192 + v194;
      v196 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](v264, "supplementalBottomLeftButton"));
      v197 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v196, 9, 0, v264, 9, 1.0, -v195));
      objc_msgSend(v262, "addObject:", v197);

      v91 = CFSTR("|-[_supplementalBottomLeftButton]");
      goto LABEL_93;
    case 23:
    case 25:
      v97 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](v264, "callDisplayStyleManager"));
      v98 = objc_msgSend(v97, "callDisplayStyle");

      if (v98 == (id)3)
      {
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
        v100 = v99;
        +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
        v102 = v100 + v101;
        v257 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v264, "mainRightButton"));
        v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v257, "topAnchor"));
        v104 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar topAnchor](v264, "topAnchor"));
        v105 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v103, "constraintEqualToAnchor:", v104));
        v267[0] = v105;
        v261 = v48;
        v106 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](v264, "mainRightButton"));
        v107 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v106, "centerXAnchor"));
        v108 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](v264, "centerXAnchor"));
        v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "constraintEqualToAnchor:constant:", v108, v102));
        v267[1] = v109;
        v110 = v49;
        v111 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v267, 2));
        objc_msgSend(v262, "addObjectsFromArray:", v111);

        v49 = v110;
        v46 = v262;

        v48 = v261;
        goto LABEL_98;
      }
      v200 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_mainLeftButton]"), 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v200);

      v93 = CFSTR("V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_mainRightButton]");
LABEL_92:
      v201 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v93, 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v201);

      v91 = CFSTR("|-(SideMarginForDoubleButton)-[_mainLeftButton]-(>=0)-[_mainRightButton]-(SideMarginForDoubleButton)-|");
      goto LABEL_93;
    case 24:
      v198 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("|[_slidingButton]|")));
      v199 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v198, 0, 0, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v199);

      v91 = CFSTR("V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_slidingButton]");
      goto LABEL_93;
    default:
      if ((unint64_t)(a3 - 7) <= 1)
      {
        v156 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](v264, "callDisplayStyleManager"));
        v157 = objc_msgSend(v156, "callDisplayStyle");

        v158 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
        v159 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v158, 9, 0, v264, 9, 1.0, 0.0));
        objc_msgSend(v262, "addObject:", v159);

        if (v157 == (id)3)
        {
          v160 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
          v161 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v160, "topAnchor"));
          v162 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar topAnchor](v264, "topAnchor"));
          v163 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v161, "constraintEqualToAnchor:", v162));
          objc_msgSend(v262, "addObject:", v163);

          v164 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-[_sideButtonLeft]-(>=0)-[_mainLeftButton]-(>=0)-[_sideButtonRight]-|"), 24, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v164);

          v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](v264, "sideButtonLeft"));
          v130 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonRight](v264, "sideButtonRight"));
          v131 = 1.0;
          v132 = 0.0;
          v133 = v128;
          v134 = 7;
          v135 = v130;
          v136 = 7;
        }
        else
        {
          if (-[PHBottomBar shouldUseLayoutAsCallScreening](v264, "shouldUseLayoutAsCallScreening"))
            v220 = CFSTR("V:|-(HeightOfCallScreeningButtonPlusButtonSpacing)-[_mainLeftButton]");
          else
            v220 = CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]");
          v221 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v220, 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v221);

          v222 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_sideButtonLeft]-(SideMarginForFaceTimeButtons)-[_mainLeftButton]-(SideMarginForFaceTimeButtons)-[_sideButtonRight]"), 24, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v222);

          v223 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](v264, "sideButtonLeft"));
          v224 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonRight](v264, "sideButtonRight"));
          v225 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v223, 7, 0, v224, 7, 1.0, 0.0));
          objc_msgSend(v262, "addObject:", v225);

          v226 = -[PHBottomBar shouldUseLayoutAsCallScreening](v264, "shouldUseLayoutAsCallScreening");
          if (v226)
            v227 = CFSTR("V:|[_supplementalTopLeftButton]-(ButtonSpacingCallScreening)-[_mainLeftButton]");
          else
            v227 = CFSTR("V:|[_supplementalTopLeftButton]-(ButtonSpacing)-[_mainLeftButton]");
          if (v226)
            v228 = CFSTR("V:|[_supplementalTopRightButton]-(ButtonSpacingCallScreening)-[_mainLeftButton]");
          else
            v228 = CFSTR("V:|[_supplementalTopRightButton]-(ButtonSpacing)-[_mainLeftButton]");
          v229 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v227, 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v229);

          v230 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v228, 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v230);

          v231 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](v264, "supplementalTopLeftButton"));
          v232 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](v264, "sideButtonLeft"));
          v233 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v231, 9, 0, v232, 9, 1.0, 0.0));
          objc_msgSend(v262, "addObject:", v233);

          v128 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](v264, "supplementalTopRightButton"));
          v129 = objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonRight](v264, "sideButtonRight"));
LABEL_70:
          v130 = (void *)v129;
          v131 = 1.0;
          v132 = 0.0;
          v133 = v128;
          v134 = 9;
          v135 = (void *)v129;
          v136 = 9;
        }
LABEL_96:
        v208 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v133, v134, 0, v135, v136, v131, v132));
        objc_msgSend(v262, "addObject:", v208);

LABEL_97:
        goto LABEL_98;
      }
      switch(a3)
      {
        case 10:
          v234 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_slidingButton]"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v234);

          v128 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("|[_slidingButton]|")));
          v219 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v128, 0, 0, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v219);
LABEL_109:

          goto LABEL_97;
        case 14:
          if (-[PHBottomBar shouldShowActionTypeCameraFlip](v264, "shouldShowActionTypeCameraFlip"))
          {
LABEL_122:
            v235 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_mainLeftButton, 9, 0, v264, 9, 1.0, 0.0));
            objc_msgSend(v262, "addObject:", v235);

            v236 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_sideButtonLeft]-(SideMarginForFaceTimeInCallButtons)-[_mainLeftButton]-(SideMarginForFaceTimeInCallButtons)-[_sideButtonRight]"), 1024, v49, v263));
            objc_msgSend(v262, "addObjectsFromArray:", v236);

            v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v264->_sideButtonLeft, 7, 0, v264->_sideButtonRight, 7, 1.0, 0.0));
            objc_msgSend(v262, "addObject:", v237);
            break;
          }
          v237 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("|-(SideMarginForDoubleButton)-[_mainLeftButton]-(>=0)-[_mainRightButton]-(SideMarginForDoubleButton)-|"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v237);
          break;
        case 15:
          if (-[PHBottomBar shouldShowActionTypePhotoCapture](v264, "shouldShowActionTypePhotoCapture")
            || -[PHBottomBar shouldShowActionTypeEffects](v264, "shouldShowActionTypeEffects"))
          {
            goto LABEL_122;
          }
          v238 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_mainLeftButton]-(SideMarginForFaceTimeInCallButtons)-[_sideButtonRight]"), 0, v49, v263));
          objc_msgSend(v262, "addObjectsFromArray:", v238);

          v239 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
          v240 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v239, "centerXAnchor"));
          v241 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](v264, "centerXAnchor"));
          v242 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v240, "constraintEqualToAnchor:", v241));
          objc_msgSend(v262, "addObject:", v242);

          v237 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonRight](v264, "sideButtonRight"));
          v243 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v237, "centerYAnchor"));
          v244 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](v264, "mainLeftButton"));
          v245 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v244, "centerYAnchor"));
          v246 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v243, "constraintEqualToAnchor:", v245));
          objc_msgSend(v262, "addObject:", v246);

          break;
        default:
          goto LABEL_98;
      }

      v91 = CFSTR("V:|-(TopMarginForFaceTimeButtons)-[_mainLeftButton]");
LABEL_93:
      v202 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", v91, 0, v49, v263));
      objc_msgSend(v262, "addObjectsFromArray:", v202);

LABEL_98:
      v118 = 0;
LABEL_99:

      return v46;
  }
}

- (void)setOrientation:(int64_t)a3
{
  UIButton *mainLeftButton;
  uint64_t v6;
  uint64_t v7;
  UIButton *mainRightButton;
  uint64_t v9;
  uint64_t v10;
  UIButton *sideButtonLeft;
  uint64_t v12;
  uint64_t v13;
  UIButton *sideButtonRight;
  uint64_t v15;

  if (self->_orientation != a3)
  {
    self->_orientation = a3;
    mainLeftButton = self->_mainLeftButton;
    objc_opt_class(PHBottomBarButton, a2);
    if ((objc_opt_isKindOfClass(mainLeftButton, v6) & 1) != 0)
      -[UIButton setOrientation:](self->_mainLeftButton, "setOrientation:", a3);
    mainRightButton = self->_mainRightButton;
    objc_opt_class(PHBottomBarButton, v7);
    if ((objc_opt_isKindOfClass(mainRightButton, v9) & 1) != 0)
      -[UIButton setOrientation:](self->_mainRightButton, "setOrientation:", a3);
    sideButtonLeft = self->_sideButtonLeft;
    objc_opt_class(PHBottomBarButton, v10);
    if ((objc_opt_isKindOfClass(sideButtonLeft, v12) & 1) != 0)
      -[UIButton setOrientation:](self->_sideButtonLeft, "setOrientation:", a3);
    sideButtonRight = self->_sideButtonRight;
    objc_opt_class(PHBottomBarButton, v13);
    if ((objc_opt_isKindOfClass(sideButtonRight, v15) & 1) != 0)
      -[UIButton setOrientation:](self->_sideButtonRight, "setOrientation:", a3);
    -[PHBottomBar setNeedsLayout](self, "setNeedsLayout");
    -[PHBottomBar layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (void)setUsesLowerButtons:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  if (self->_usesLowerButtons != a3)
  {
    self->_usesLowerButtons = a3;
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
      -[PHBottomBar removeConstraints:](self, "removeConstraints:", v5);

    }
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar constraintsForState:](self, "constraintsForState:", -[PHBottomBar currentState](self, "currentState")));
    -[PHBottomBar setButtonLayoutConstraints:](self, "setButtonLayoutConstraints:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
    -[PHBottomBar addConstraints:](self, "addConstraints:", v7);

    -[PHBottomBar setNeedsLayout](self, "setNeedsLayout");
    -[PHBottomBar layoutIfNeeded](self, "layoutIfNeeded");
  }
}

- (BOOL)shouldShowActionTypeCameraFlip
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldShowActionTypeCameraFlip");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldShowActionTypeCameraFlip");

  return v6;
}

- (BOOL)shouldShowActionTypeAudioRoute
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldShowActionTypeAudioRoute");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldShowActionTypeAudioRoute");

  return v6;
}

- (BOOL)shouldShowActionTypeSendToVoicemail
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldShowActionTypeSendToVoicemail");

  if ((v4 & 1) == 0)
    return 1;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldShowActionTypeSendToVoicemail");

  return v6;
}

- (BOOL)shouldShowActionTypePunchOut
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldShowActionTypePunchOut");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldShowActionTypePunchOut");

  return v6;
}

- (BOOL)shouldShowActionTypePhotoCapture
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldShowActionTypePhotoCapture");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldShowActionTypePhotoCapture");

  return v6;
}

- (BOOL)shouldShowActionTypeEffects
{
  void *v3;
  char v4;
  void *v5;
  unsigned __int8 v6;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v4 = objc_opt_respondsToSelector(v3, "shouldShowActionTypeEffects");

  if ((v4 & 1) == 0)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "shouldShowActionTypeEffects");

  return v6;
}

- (BOOL)currentCallIsMuted
{
  void *v2;
  void *v3;
  unsigned __int8 v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callCenter](self, "callCenter"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "audioOrVideoCallWithStatus:", 1));
  v4 = objc_msgSend(v3, "isUplinkMuted");

  return v4;
}

- (int64_t)currentBottomBarCallState
{
  void *v4;
  id v5;

  if (+[PHSOSViewController isCallBufferDismissalAssertionActive](PHSOSViewController, "isCallBufferDismissalAssertionActive"))
  {
    return 2;
  }
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v5 = objc_msgSend(v4, "bottomBarCallStateInBar:", self);

  return (int64_t)v5;
}

- (id)makeButtonWithType:(int64_t)a3 title:(id)a4 image:(id)a5 color:(id)a6 font:(id)a7 fontColor:(id)a8
{
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  void *v20;

  v14 = a8;
  v15 = a7;
  v16 = a6;
  v17 = a5;
  v18 = a4;
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  if (objc_msgSend(v19, "callDisplayStyle") == (id)3)
    +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
  else
    +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", a3, v18, v17, v16, v15, v14));

  return v20;
}

- (id)makeButtonWithType:(int64_t)a3 title:(id)a4 image:(id)a5 color:(id)a6 font:(id)a7 fontColor:(id)a8 diameter:(double)a9
{
  id v16;
  id v17;
  id v18;
  id v19;
  void *v20;
  PHBottomBarButtonConfiguration *v21;
  void *v22;
  void *v23;
  PHBottomBarButtonConfiguration *v24;
  PHBottomBarMuteButton *v25;
  _BOOL4 v26;
  PHBottomBarButton *v27;
  PHBottomBarButton *p_super;
  id v29;
  double v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;

  v16 = a5;
  v17 = a6;
  v18 = a7;
  v19 = a8;
  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar customTitleStringForActionType:givenDefaultTitle:](self, "customTitleStringForActionType:givenDefaultTitle:", a3, a4));
  v21 = [PHBottomBarButtonConfiguration alloc];
  v22 = -[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState");
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar captureView](self, "captureView"));
  v24 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:captureView:](v21, "initWithAction:diameter:callState:captureView:", a3, v22, v23, a9);

  if (a3 == 9 || a3 == 12)
  {
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v26 = objc_msgSend(v22, "callDisplayStyle") != (id)3;
  }
  else
  {
    if (a3 == 20)
    {
      v25 = -[PHBottomBarMuteButton initWithConfiguration:]([PHBottomBarMuteButton alloc], "initWithConfiguration:", v24);
LABEL_19:
      p_super = &v25->super;
      goto LABEL_24;
    }
    v26 = 0;
  }
  if (a3 == 12 || a3 == 9)

  if (v26)
  {
    if (-[PHBottomBar shouldUseLayoutAsCallScreening](self, "shouldUseLayoutAsCallScreening"))
      v27 = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v24);
    else
      v27 = -[PHBottomBarSupplementalButton initWithAction:]([PHBottomBarSupplementalButton alloc], "initWithAction:", a3);
    p_super = v27;
  }
  else
  {
    if (v24)
    {
      p_super = -[PHBottomBarButton initWithConfiguration:]([PHBottomBarButton alloc], "initWithConfiguration:", v24);
      v29 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "buttonLongPressed:");
      objc_msgSend(v29, "setMinimumPressDuration:", 2.5);
      -[PHBottomBarButton intrinsicContentSize](p_super, "intrinsicContentSize");
      objc_msgSend(v29, "setAllowableMovement:", v30 * 0.5);
      -[PHBottomBarButton addGestureRecognizer:](p_super, "addGestureRecognizer:", v29);
    }
    else
    {
      if (a3 == 30)
      {
        v25 = (PHBottomBarMuteButton *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeCaptureButtonWithDiameter:](self, "makeCaptureButtonWithDiameter:", a9));
        goto LABEL_19;
      }
      p_super = (PHBottomBarButton *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 1));
      v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
      -[PHBottomBarButton setBackgroundColor:](p_super, "setBackgroundColor:", v31);

      v29 = (id)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
      -[PHBottomBarButton setTitleColor:forState:](p_super, "setTitleColor:forState:", v29, 2);
    }

  }
  if (a3 == 16)
  {
    v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](p_super, "titleLabel"));
    objc_msgSend(v32, "setNumberOfLines:", 2);

    v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](p_super, "titleLabel"));
    objc_msgSend(v33, "setTextAlignment:", 1);

  }
LABEL_24:
  if (v20)
    -[PHBottomBarButton setTitle:forState:](p_super, "setTitle:forState:", v20, 0);
  if (v18)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButton titleLabel](p_super, "titleLabel"));
    objc_msgSend(v34, "setFont:", v18);

  }
  if (v19)
    -[PHBottomBarButton setTitleColor:forState:](p_super, "setTitleColor:forState:", v19, 0);
  if (v17)
    -[PHBottomBarButton setBackgroundColor:](p_super, "setBackgroundColor:", v17);
  if (v16)
  {
    -[PHBottomBarButton setImage:forState:](p_super, "setImage:forState:", v16, 0);
    -[PHBottomBarButton setAdjustsImageWhenDisabled:](p_super, "setAdjustsImageWhenDisabled:", 0);
    -[PHBottomBarButton setAdjustsImageWhenHighlighted:](p_super, "setAdjustsImageWhenHighlighted:", 0);
  }
  -[PHBottomBarButton setAction:](p_super, "setAction:", a3);
  -[PHBottomBarButton setTranslatesAutoresizingMaskIntoConstraints:](p_super, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHBottomBarButton addTarget:action:forControlEvents:](p_super, "addTarget:action:forControlEvents:", self, "buttonPressed:", 64);

  return p_super;
}

- (id)makeCaptureButtonWithDiameter:(double)a3
{
  void *v4;

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CUShutterButton smallShutterButton](CUShutterButton, "smallShutterButton", a3));
  objc_msgSend(v4, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v4, "addTarget:action:forControlEvents:", self, "buttonPressed:", 64);
  objc_msgSend(v4, "setAction:", 30);
  objc_msgSend(v4, "setShowDisabled:", 1);
  return v4;
}

- (id)makeSlidingButtonWithType:(int)a3
{
  uint64_t v4;
  PHSlidingButton *v5;

  if ((a3 - 1) > 7)
    v4 = 0;
  else
    v4 = dword_100240270[a3 - 1];
  v5 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", *(_QWORD *)&a3, v4, -[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState"));
  -[PHSlidingButton setTranslatesAutoresizingMaskIntoConstraints:](v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHSlidingButton setDelegate:](v5, "setDelegate:", self);
  return v5;
}

- (void)addSubview:(id)a3
{
  id v4;
  PHBottomBar *v5;
  objc_super v6;

  v4 = a3;
  v5 = (PHBottomBar *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "superview"));

  if (v4 && v5 != self)
  {
    v6.receiver = self;
    v6.super_class = (Class)PHBottomBar;
    -[PHBottomBar addSubview:](&v6, "addSubview:", v4);
  }

}

- (void)removeAllButtons
{
  UIButton *supplementalTopLeftButton;
  UIButton *supplementalTopRightButton;
  UIButton *supplementalBottomLeftButton;
  UIButton *supplementalBottomRightButton;
  UIButton *mainLeftButton;
  UIButton *mainRightButton;
  PHSlidingButton *slidingButton;
  UIButton *sideButtonRight;
  UIButton *sideButtonLeft;

  -[UIButton removeFromSuperview](self->_supplementalTopLeftButton, "removeFromSuperview");
  supplementalTopLeftButton = self->_supplementalTopLeftButton;
  self->_supplementalTopLeftButton = 0;

  -[UIButton removeFromSuperview](self->_supplementalTopRightButton, "removeFromSuperview");
  supplementalTopRightButton = self->_supplementalTopRightButton;
  self->_supplementalTopRightButton = 0;

  -[UIButton removeFromSuperview](self->_supplementalBottomLeftButton, "removeFromSuperview");
  supplementalBottomLeftButton = self->_supplementalBottomLeftButton;
  self->_supplementalBottomLeftButton = 0;

  -[UIButton removeFromSuperview](self->_supplementalBottomRightButton, "removeFromSuperview");
  supplementalBottomRightButton = self->_supplementalBottomRightButton;
  self->_supplementalBottomRightButton = 0;

  -[UIButton removeFromSuperview](self->_mainLeftButton, "removeFromSuperview");
  mainLeftButton = self->_mainLeftButton;
  self->_mainLeftButton = 0;

  -[UIButton removeFromSuperview](self->_mainRightButton, "removeFromSuperview");
  mainRightButton = self->_mainRightButton;
  self->_mainRightButton = 0;

  -[PHSlidingButton removeFromSuperview](self->_slidingButton, "removeFromSuperview");
  slidingButton = self->_slidingButton;
  self->_slidingButton = 0;

  -[UIButton removeFromSuperview](self->_sideButtonRight, "removeFromSuperview");
  sideButtonRight = self->_sideButtonRight;
  self->_sideButtonRight = 0;

  -[UIButton removeFromSuperview](self->_sideButtonLeft, "removeFromSuperview");
  sideButtonLeft = self->_sideButtonLeft;
  self->_sideButtonLeft = 0;

}

- (void)setAnimating:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint8_t v19[128];
  uint8_t buf[4];
  id v21;

  if (self->_animating != a3)
  {
    self->_animating = a3;
    if (!a3)
    {
      v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar pendingStateBlocks](self, "pendingStateBlocks"));
      v5 = objc_msgSend(v4, "count");

      if (v5)
      {
        v6 = sub_1000C5588();
        v7 = objc_claimAutoreleasedReturnValue(v6);
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
        {
          v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar pendingStateBlocks](self, "pendingStateBlocks"));
          *(_DWORD *)buf = 134217984;
          v21 = objc_msgSend(v8, "count");
          _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Bottom bar has %ld pending state block(s) waiting for the animation to finish, we'll run those now", buf, 0xCu);

        }
        v17 = 0u;
        v18 = 0u;
        v15 = 0u;
        v16 = 0u;
        v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar pendingStateBlocks](self, "pendingStateBlocks", 0));
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v16;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(_QWORD *)v16 != v12)
                objc_enumerationMutation(v9);
              (*(void (**)(void))(*(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * (_QWORD)i) + 16))();
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
          }
          while (v11);
        }

        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar pendingStateBlocks](self, "pendingStateBlocks"));
        objc_msgSend(v14, "removeAllObjects");

      }
    }
  }
}

- (void)buttonPressed:(id)a3
{
  id v4;
  void *v5;
  char v6;
  void *v7;
  _QWORD v8[4];
  id v9;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v6 = objc_opt_respondsToSelector(v5, "bottomBarActionPerformed:withCompletionState:fromBar:");

  if ((v6 & 1) != 0)
  {
    if (objc_msgSend(v4, "action") == (id)29)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000F1698;
      v8[3] = &unk_100284898;
      v9 = v4;
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v8, 0, 0.25);

    }
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
    objc_msgSend(v7, "bottomBarActionPerformed:withCompletionState:fromBar:", objc_msgSend(v4, "action"), 1, self);

  }
}

- (void)buttonLongPressed:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  id v7;
  void *v8;
  id v9;

  v9 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "bottomBarActionPerformed:withCompletionState:fromBar:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "view"));
    v7 = objc_msgSend(v6, "action");

    if (v7 == (id)14)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
      objc_msgSend(v8, "bottomBarActionPerformed:withCompletionState:fromBar:", 15, 1, self);

    }
  }

}

- (void)willFinishSlideForSlidingButton:(id)a3
{
  void *v4;
  char v5;
  void *v6;
  _QWORD v7[5];

  -[PHBottomBar setAnimating:](self, "setAnimating:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v5 = objc_opt_respondsToSelector(v4, "bottomBarActionPerformed:withCompletionState:fromBar:");

  if ((v5 & 1) != 0)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
    objc_msgSend(v6, "bottomBarActionPerformed:withCompletionState:fromBar:", 1, 1, self);

  }
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_1000F183C;
  v7[3] = &unk_100284898;
  v7[4] = self;
  +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v7, 0, 0.200000003);
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  -[PHBottomBar setAnimating:](self, "setAnimating:", 0);
}

- (void)slidingButton:(id)a3 didSlideToProportion:(double)a4
{
  void *v6;
  char v7;
  double v8;
  id v9;

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate", a3));
  v7 = objc_opt_respondsToSelector(v6, "sliderActionFromBar:slidToProportion:");

  if ((v7 & 1) != 0)
  {
    v9 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
    *(float *)&v8 = a4;
    objc_msgSend(v9, "sliderActionFromBar:slidToProportion:", self, v8);

  }
}

- (id)viewLabels
{
  void *v3;
  void *v4;
  UIButton *mainLeftButton;
  UIButton *mainRightButton;
  UIButton *supplementalTopRightButton;
  UIButton *supplementalTopLeftButton;
  UIButton *supplementalBottomRightButton;
  UIButton *supplementalBottomLeftButton;
  PHSlidingButton *slidingButton;
  UIButton *sideButtonLeft;
  UIButton *sideButtonRight;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
  v4 = v3;
  mainLeftButton = self->_mainLeftButton;
  if (mainLeftButton)
    objc_msgSend(v3, "setValue:forKey:", mainLeftButton, CFSTR("_mainLeftButton"));
  mainRightButton = self->_mainRightButton;
  if (mainRightButton)
    objc_msgSend(v4, "setValue:forKey:", mainRightButton, CFSTR("_mainRightButton"));
  supplementalTopRightButton = self->_supplementalTopRightButton;
  if (supplementalTopRightButton)
    objc_msgSend(v4, "setValue:forKey:", supplementalTopRightButton, CFSTR("_supplementalTopRightButton"));
  supplementalTopLeftButton = self->_supplementalTopLeftButton;
  if (supplementalTopLeftButton)
    objc_msgSend(v4, "setValue:forKey:", supplementalTopLeftButton, CFSTR("_supplementalTopLeftButton"));
  supplementalBottomRightButton = self->_supplementalBottomRightButton;
  if (supplementalBottomRightButton)
    objc_msgSend(v4, "setValue:forKey:", supplementalBottomRightButton, CFSTR("_supplementalBottomRightButton"));
  supplementalBottomLeftButton = self->_supplementalBottomLeftButton;
  if (supplementalBottomLeftButton)
    objc_msgSend(v4, "setValue:forKey:", supplementalBottomLeftButton, CFSTR("_supplementalBottomLeftButton"));
  slidingButton = self->_slidingButton;
  if (slidingButton)
    objc_msgSend(v4, "setValue:forKey:", slidingButton, CFSTR("_slidingButton"));
  sideButtonLeft = self->_sideButtonLeft;
  if (sideButtonLeft)
    objc_msgSend(v4, "setValue:forKey:", sideButtonLeft, CFSTR("_sideButtonLeft"));
  sideButtonRight = self->_sideButtonRight;
  if (sideButtonRight)
    objc_msgSend(v4, "setValue:forKey:", sideButtonRight, CFSTR("_sideButtonRight"));
  return v4;
}

- (CGRect)frameForControlWithActionType:(int64_t)a3
{
  void *v3;
  void *v4;
  double v5;
  CGFloat x;
  double v7;
  CGFloat y;
  double v9;
  CGFloat width;
  double v11;
  CGFloat height;
  double v13;
  double v14;
  double v15;
  double v16;
  CGRect result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:", a3));
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "frame");
    x = v5;
    y = v7;
    width = v9;
    height = v11;
  }
  else
  {
    x = CGRectZero.origin.x;
    y = CGRectZero.origin.y;
    width = CGRectZero.size.width;
    height = CGRectZero.size.height;
  }

  v13 = x;
  v14 = y;
  v15 = width;
  v16 = height;
  result.size.height = v16;
  result.size.width = v15;
  result.origin.y = v14;
  result.origin.x = v13;
  return result;
}

- (id)controlForActionType:(int64_t)a3
{
  void *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  id v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels", 0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "allValues"));

  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v10, "action") == (id)a3)
        {
          v11 = v10;
          goto LABEL_11;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v7)
        continue;
      break;
    }
  }
  v11 = 0;
LABEL_11:

  return v11;
}

- (id)customTitleStringForActionType:(int64_t)a3 givenDefaultTitle:(id)a4
{
  id v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  id v11;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  v8 = objc_opt_respondsToSelector(v7, "customizedTitleForItemInBar:withActionType:");

  if ((v8 & 1) != 0)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "customizedTitleForItemInBar:withActionType:", self, a3));

    if (v10)
    {
      v11 = v10;

      v6 = v11;
    }

  }
  return v6;
}

- (id)updatedImageForActionType:(int64_t)a3 givenDefaultImage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration imageColorForState:](PHBottomBarButtonConfiguration, "imageColorForState:", 0));
    v8 = objc_claimAutoreleasedReturnValue(-[PHBottomBar audioRouteImageWithColor:](self, "audioRouteImageWithColor:", v7));

    v6 = (id)v8;
  }
  return v6;
}

- (id)updatedSelectedImageForActionType:(int64_t)a3 givenDefaultSelectedImage:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;

  v6 = a4;
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration imageColorForState:](PHBottomBarButtonConfiguration, "imageColorForState:", 4));
    v8 = objc_claimAutoreleasedReturnValue(-[PHBottomBar audioRouteImageWithColor:](self, "audioRouteImageWithColor:", v7));

    v6 = (id)v8;
  }
  return v6;
}

- (id)audioRouteImageWithColor:(id)a3
{
  id v4;
  unsigned int v5;
  int64_t v6;
  uint64_t v7;
  void *v8;
  void *v9;

  v4 = a3;
  v5 = -[PHBottomBar shouldShowActionTypeAudioRoute](self, "shouldShowActionTypeAudioRoute");
  v6 = -[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState");
  if (v5)
    v7 = 21;
  else
    v7 = 20;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration imageForAction:callState:](PHBottomBarButtonConfiguration, "imageForAction:callState:", v7, v6));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "_flatImageWithColor:", v4));

  return v9;
}

- (BOOL)updatedSelectedStateForActionType:(int64_t)a3
{
  void *v5;
  unsigned __int8 v6;

  if (a3 == 20)
  {
    if (-[PHBottomBar shouldShowActionTypeAudioRoute](self, "shouldShowActionTypeAudioRoute"))
      return 0;
    else
      return -[PHBottomBar currentCallIsMuted](self, "currentCallIsMuted");
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar controlForActionType:](self, "controlForActionType:"));
    v6 = objc_msgSend(v5, "isSelected");

    return v6;
  }
}

- (int64_t)updatedActionTypeForActionType:(int64_t)a3
{
  uint64_t v3;
  uint64_t v4;

  if ((a3 & 0xFFFFFFFFFFFFFFFELL) == 0x14)
  {
    if (-[PHBottomBar shouldShowActionTypeAudioRoute](self, "shouldShowActionTypeAudioRoute", v3, v4))
      return 21;
    else
      return 20;
  }
  return a3;
}

- (void)refreshCustomizedActionTypeTitles
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
  -[PHBottomBar refreshCustomizedActionTypeTitleForButton:](self, "refreshCustomizedActionTypeTitleForButton:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
  -[PHBottomBar refreshCustomizedActionTypeTitleForButton:](self, "refreshCustomizedActionTypeTitleForButton:", v4);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](self, "sideButtonLeft"));
  -[PHBottomBar refreshCustomizedActionTypeTitleForButton:](self, "refreshCustomizedActionTypeTitleForButton:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonRight](self, "sideButtonRight"));
  -[PHBottomBar refreshCustomizedActionTypeTitleForButton:](self, "refreshCustomizedActionTypeTitleForButton:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](self, "supplementalBottomLeftButton"));
  -[PHBottomBar refreshCustomizedActionTypeTitleForButton:](self, "refreshCustomizedActionTypeTitleForButton:", v7);

  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
  -[PHBottomBar refreshCustomizedActionTypeTitleForButton:](self, "refreshCustomizedActionTypeTitleForButton:", v8);

}

- (void)refreshCustomizedActionTypeTitleForButton:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  if (v11)
  {
    v4 = objc_msgSend(v11, "action");
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "titleForState:", 0));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar customTitleStringForActionType:givenDefaultTitle:](self, "customTitleStringForActionType:givenDefaultTitle:", v4, v5));

    objc_msgSend(v11, "setTitle:forState:", v6, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageForState:", 0));
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar updatedImageForActionType:givenDefaultImage:](self, "updatedImageForActionType:givenDefaultImage:", v4, v7));

    objc_msgSend(v11, "setImage:forState:", v8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "imageForState:", 4));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar updatedSelectedImageForActionType:givenDefaultSelectedImage:](self, "updatedSelectedImageForActionType:givenDefaultSelectedImage:", v4, v9));

    if (v10)
      objc_msgSend(v11, "setImage:forState:", v10, 4);
    objc_msgSend(v11, "setAction:", -[PHBottomBar updatedActionTypeForActionType:](self, "updatedActionTypeForActionType:", objc_msgSend(v11, "action")));
    objc_msgSend(v11, "setSelected:", -[PHBottomBar updatedSelectedStateForActionType:](self, "updatedSelectedStateForActionType:", v4));

  }
}

- (void)refreshEndCallButton
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
  objc_msgSend(v3, "refreshForCallState:", -[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState"));

}

- (UIButton)useRTTButton
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  unint64_t v8;
  double v9;
  void *v10;
  void *v11;
  void *v12;

  v3 = sub_1000F8B14();
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "frontmostCall"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localSenderIdentityUUID"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "rttDisplayName:forSubscriptionContextUUID:", 0, v6));
  v8 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
  v9 = 15.0;
  if (!v8)
    v9 = 14.0;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v9));
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 29, v7, 0, 0, v10, v11));

  return (UIButton *)v12;
}

- (void)refreshUseRTTButton
{
  _QWORD v3[5];

  if ((id)-[PHBottomBar currentState](self, "currentState") == (id)11)
  {
    v3[0] = _NSConcreteStackBlock;
    v3[1] = 3221225472;
    v3[2] = sub_1000F22D8;
    v3[3] = &unk_100284898;
    v3[4] = self;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v3, 0, 0.25);
  }
}

- (BOOL)shouldShowAnswerRTTButton
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "shouldShowAnswerRTT") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
    v5 = objc_msgSend(v4, "shouldShowAnswerRTT");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (BOOL)shouldShowUseRTTButton
{
  void *v3;
  void *v4;
  unsigned __int8 v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v3, "shouldShowUseRTT") & 1) != 0)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar delegate](self, "delegate"));
    v5 = objc_msgSend(v4, "shouldShowUseRTT");

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (void)setPrefersWhiteButtonTextColor:(BOOL)a3
{
  uint64_t v4;
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

  if (a3)
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  else
    v4 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  v14 = (void *)v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));
    objc_msgSend(v6, "setTitleColor:forState:", v14, 0);

  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));
    objc_msgSend(v8, "setTitleColor:forState:", v14, 0);

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));

  if (v9)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
    objc_msgSend(v10, "setTitleColor:forState:", v14, 0);

  }
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));

  v12 = v14;
  if (v11)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    objc_msgSend(v13, "setTitleColor:forState:", v14, 0);

    v12 = v14;
  }

}

- (void)prepareButtonsForAnimationBegin
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "_animationWillBegin") & 1) != 0)
          objc_msgSend(v8, "performSelector:", "_animationWillBegin");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (void)prepareButtonsForAnimationEnd
{
  void *v2;
  void *v3;
  id v4;
  id v5;
  uint64_t v6;
  void *i;
  void *v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels", 0));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "allValues"));

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i);
        if ((objc_opt_respondsToSelector(v8, "_animationDidEnd") & 1) != 0)
          objc_msgSend(v8, "performSelector:", "_animationDidEnd");
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v5);
  }

}

- (BOOL)animateFromState:(int64_t)a3 toState:(int64_t)a4 completion:(id)a5
{
  _QWORD *v8;
  _QWORD *v9;
  void *v10;
  void *v11;
  unint64_t v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  _BOOL4 v18;
  void *v19;
  PHBottomBar *v20;
  uint64_t v21;
  BOOL v22;
  void *v24;
  id v25;
  _QWORD v26[5];
  id v27;

  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_1000F2AA4;
  v26[3] = &unk_100285C30;
  v26[4] = self;
  v27 = a5;
  v8 = objc_retainBlock(v26);
  v9 = objc_retainBlock(v8);
  if (!a3 && a4 == 11)
  {
    -[PHBottomBar animateFromIncomingCallStateToInCallState:withCompletion:](self, "animateFromIncomingCallStateToInCallState:withCompletion:", 11, v9);
LABEL_35:
    v22 = 1;
    goto LABEL_36;
  }
  if (a4 == 19 && (a3 == 20 || a3 == 11))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("HIDE"), &stru_10028DC20, CFSTR("BottomBar")));
    v12 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    v13 = 15.0;
    if (!v12)
      v13 = 14.0;
    v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", v13));
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 16, v11, 0, 0, v14, v15));

    -[PHBottomBar animateInSupplementalBottomRightButton:WithCompletion:](self, "animateInSupplementalBottomRightButton:WithCompletion:", v16, v9);
    goto LABEL_35;
  }
  v18 = a4 == 11 || a4 == 20;
  if (a3 == 19 && v18)
  {
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar useRTTButton](self, "useRTTButton"));
    -[PHBottomBar animateInSupplementalBottomRightButton:WithCompletion:](self, "animateInSupplementalBottomRightButton:WithCompletion:", v19, v9);

    goto LABEL_35;
  }
  if (!a3 && a4 == 15)
  {
    -[PHBottomBar animateFromIncomingCallStateToFaceTimeInCallState:withCompletion:](self, "animateFromIncomingCallStateToFaceTimeInCallState:withCompletion:", 15, v9);
    goto LABEL_35;
  }
  if (a3 == 20 && a4 == 11)
  {
    -[PHBottomBar animateOutSupplementalBottomLeftButtonToState:withCompletion:](self, "animateOutSupplementalBottomLeftButtonToState:withCompletion:", 11, v9);
    goto LABEL_35;
  }
  if (a3 == 21 && a4 == 11)
  {
    -[PHBottomBar animateFromOutgoingStateToInCallStateWithCompletion:](self, "animateFromOutgoingStateToInCallStateWithCompletion:", v9);
    goto LABEL_35;
  }
  if (a3 == 15 && a4 == 17)
  {
    v20 = self;
    v21 = 17;
LABEL_34:
    -[PHBottomBar animateFromOutgoingStateToCallbackAndMessageUIToState:withCompletion:](v20, "animateFromOutgoingStateToCallbackAndMessageUIToState:withCompletion:", v21, v9);
    goto LABEL_35;
  }
  if (a3 == 15 && a4 == 26)
  {
    v20 = self;
    v21 = 26;
    goto LABEL_34;
  }
  if (a3 == 14 && a4 == 15)
  {
    -[PHBottomBar animateFromFaceTimeOutgoingStateToFaceTimeInCallState:withCompletion:](self, "animateFromFaceTimeOutgoingStateToFaceTimeInCallState:withCompletion:", 15, v9);
    goto LABEL_35;
  }
  v22 = 0;
  if (!a3 && a4 == 23)
  {
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v25 = objc_msgSend(v24, "callDisplayStyle");

    if (v25 != (id)3)
    {
      v22 = 0;
      goto LABEL_36;
    }
    -[PHBottomBar ambientAnimateFromIncomingCallStateToCallScreeningStateWithCompletion:](self, "ambientAnimateFromIncomingCallStateToCallScreeningStateWithCompletion:", v9);
    goto LABEL_35;
  }
LABEL_36:

  return v22;
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHBottomBar;
  -[PHBottomBar layoutSubviews](&v3, "layoutSubviews");
  -[PHBottomBar updateTopLayoutGuide](self, "updateTopLayoutGuide");
  -[PHBottomBar updateMainButtonLayoutGuide](self, "updateMainButtonLayoutGuide");
}

- (void)animateFromOutgoingStateToInCallStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void **v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t);
  void *v31;
  id v32;
  _QWORD v33[2];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v6 = objc_msgSend(v5, "callDisplayStyle");

  if (v6 != (id)3)
  {
    -[PHBottomBar prepareButtonsForAnimationBegin](self, "prepareButtonsForAnimationBegin");
    v7 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
    objc_msgSend(v7, "setMass:", 2.0);
    objc_msgSend(v7, "setStiffness:", 300.0);
    objc_msgSend(v7, "setDamping:", 50.0);
    objc_msgSend(v7, "setDuration:", 0.50999999);
    objc_msgSend(v7, "setToValue:", &off_100297428);
    objc_msgSend(v7, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v7, "setRemovedOnCompletion:", 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("backgroundColor")));
    v9 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor")));
    v10 = objc_msgSend(v9, "CGColor");

    v11 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
    v12 = objc_msgSend(v11, "CGColor");

    v33[0] = v10;
    v33[1] = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v33, 2));
    objc_msgSend(v8, "setValues:", v13);

    objc_msgSend(v8, "setKeyTimes:", &off_1002972F0);
    objc_msgSend(v8, "setDuration:", 0.254999995);
    objc_msgSend(v8, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v8, "setRemovedOnCompletion:", 0);
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "imageView"));
    objc_msgSend(v15, "setClipsToBounds:", 0);

    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "imageView"));
    objc_msgSend(v17, "setContentMode:", 4);

    +[CATransaction begin](CATransaction, "begin");
    v28 = _NSConcreteStackBlock;
    v29 = 3221225472;
    v30 = sub_1000F2EC4;
    v31 = &unk_100284E18;
    v32 = v4;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", &v28);
    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton", v28, v29, v30, v31));
    v19 = objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend((id)v19, "layer"));
    objc_msgSend(v20, "addAnimation:forKey:", v7, CFSTR("rollButtonAnimation"));

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
    objc_opt_class(PHBottomBarButton, v22);
    LOBYTE(v19) = objc_opt_isKindOfClass(v21, v23);

    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
    v25 = v24;
    if ((v19 & 1) != 0)
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "roundView"));
      v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "layer"));
      objc_msgSend(v27, "addAnimation:forKey:", v8, CFSTR("buttonColorAnimation"));

    }
    else
    {
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "layer"));
      objc_msgSend(v26, "addAnimation:forKey:", v8, CFSTR("buttonColorAnimation"));
    }

    +[CATransaction commit](CATransaction, "commit");
  }

}

- (void)animateInSupplementalBottomRightButton:(id)a3 WithCompletion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  id v12;
  double v13;
  double v14;
  unint64_t v15;
  double v16;
  unint64_t v17;
  double v18;
  float v19;
  double v20;
  double v21;
  double v22;
  uint64_t v23;
  double v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  double v29;
  unint64_t v30;
  double v31;
  unint64_t v32;
  unint64_t v33;
  double v34;
  unint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  double v40;
  unint64_t v41;
  double v42;
  unint64_t v43;
  double v44;
  void *v45;
  unint64_t v46;
  double v47;
  unint64_t v48;
  void *v49;
  void *v50;
  unint64_t v51;
  double v52;
  unint64_t v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  double v60;
  double v61;
  _BOOL4 v62;
  double v63;
  double v64;
  void *v65;
  void *v66;
  id v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  int v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  _QWORD v82[4];
  id v83;
  id v84;
  _QWORD v85[4];
  id v86;
  PHBottomBar *v87;
  id v88;
  _QWORD v89[13];
  _QWORD v90[13];

  v6 = a3;
  v7 = a4;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v9 = objc_msgSend(v8, "callDisplayStyle");

  if (v9 != (id)3)
  {
    v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
    -[PHBottomBar setSupplementalBottomRightButton:](self, "setSupplementalBottomRightButton:", v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
    objc_msgSend(v10, "setAlpha:", 0.0);

    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
    -[PHBottomBar addSubview:](self, "addSubview:", v11);

    v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels"));
    v89[0] = CFSTR("SideMarginForDoubleButton");
    -[PHBottomBar sideMarginForDoubleButton](self, "sideMarginForDoubleButton");
    v76 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[0] = v76;
    v89[1] = CFSTR("SideMarginForFaceTimeButtons");
    -[PHBottomBar sideMarginForFaceTimeButtons](self, "sideMarginForFaceTimeButtons");
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[1] = v75;
    v89[2] = CFSTR("SideMarginForFaceTimeInCallButtons");
    -[PHBottomBar sideMarginForFaceTimeInCallButtons](self, "sideMarginForFaceTimeInCallButtons");
    v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[2] = v74;
    v89[3] = CFSTR("TopMarginForFaceTimeButtons");
    LODWORD(v11) = -[PHBottomBar usesLowerButtons](self, "usesLowerButtons");
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v12 = objc_msgSend(v73, "callDisplayStyle");
    v72 = (int)v11;
    if ((_DWORD)v11)
    {
      if (v12 == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v14 = v13;
      v15 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v16 = 30.0;
      if (v15 != 6)
      {
        v17 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v16 = 24.0;
        if (v17 == 3)
          v16 = 30.0;
      }
      v18 = v14 + v16;
      *(float *)&v18 = v18;
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v18));
      objc_msgSend(v71, "floatValue");
      v20 = v19;
      -[PHBottomBar yOffsetForLoweredButtons](self, "yOffsetForLoweredButtons");
      v22 = v21 + v20;
      *(float *)&v22 = v22;
      v23 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v22));
    }
    else
    {
      if (v12 == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v25 = v24;
      v26 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v27 = 30.0;
      if (v26 != 6)
      {
        v28 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v27 = 24.0;
        if (v28 == 3)
          v27 = 30.0;
      }
      v29 = v25 + v27;
      *(float *)&v29 = v29;
      v23 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29));
      v71 = (void *)v23;
    }
    v68 = (void *)v23;
    v90[3] = v23;
    v89[4] = CFSTR("ButtonSpacing");
    v30 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v31) = 30.0;
    if (v30 != 6)
    {
      v32 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v31);
      LODWORD(v31) = 24.0;
      if (v32 == 3)
        *(float *)&v31 = 30.0;
    }
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v31));
    v90[4] = v70;
    v89[5] = CFSTR("AmbientButtonSpacing");
    +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
    v69 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[5] = v69;
    v89[6] = CFSTR("ButtonSliderSpacing");
    v33 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v34) = 25.0;
    if (v33 != 6)
    {
      v35 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v34);
      LODWORD(v34) = 1102315520;
      if (v35 == 3)
        *(float *)&v34 = 25.0;
    }
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v34));
    v90[6] = v36;
    v89[7] = CFSTR("BottomSupplementalButtonSpacing");
    +[PHBottomBar defaultBottomSupplementalButtonSpacing](PHBottomBar, "defaultBottomSupplementalButtonSpacing");
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[7] = v37;
    v90[8] = &off_1002973A8;
    v89[8] = CFSTR("TopSupplementalButtonSpacing");
    v89[9] = CFSTR("HeightOfAButtonPlusButtonSpacing");
    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v38, "callDisplayStyle") == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v40 = v39;
    v80 = v7;
    v41 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    v42 = 30.0;
    if (v41 != 6)
    {
      v43 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
      v42 = 24.0;
      if (v43 == 3)
        v42 = 30.0;
    }
    v81 = v6;
    v44 = v40 + v42;
    *(float *)&v44 = v44;
    v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v44));
    v90[9] = v45;
    v89[10] = CFSTR("ButtonSpacingCallScreening");
    v46 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v47) = 30.0;
    if (v46 != 6)
    {
      v48 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v47);
      LODWORD(v47) = 24.0;
      if (v48 == 3)
        *(float *)&v47 = 30.0;
    }
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v47));
    v90[10] = v49;
    v89[11] = CFSTR("HeightOfCallScreeningButtonPlusButtonSpacing");
    -[PHBottomBar heightOfCallScreeningButtonPlusButtonSpacing](self, "heightOfCallScreeningButtonPlusButtonSpacing");
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v90[11] = v50;
    v89[12] = CFSTR("ButtonSliderSpacingCallScreeningSlider");
    v51 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v52) = 25.0;
    if (v51 != 6)
    {
      v53 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v52);
      LODWORD(v52) = 1102315520;
      if (v53 == 3)
        *(float *)&v52 = 25.0;
    }
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v52));
    v90[12] = v54;
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v90, v89, 13));

    if (v72)
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_mainLeftButton]"), 0, v55, v78));
    objc_msgSend(v79, "addObjectsFromArray:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v57, 10, 0, self->_mainLeftButton, 10, 1.0, 0.0));
    objc_msgSend(v79, "addObject:", v58);

    v59 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_mainLeftButton, 9, 0, self, 9, 1.0, 0.0));
    objc_msgSend(v79, "addObject:", v59);

    +[PHInCallNumberPadButton defaultSize](PHInCallNumberPadButton, "defaultSize");
    v61 = v60;
    v62 = sub_1000EA838();
    v63 = 12.0;
    if (!v62)
      v63 = 0.0;
    v64 = v61 + v63;
    v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomRightButton](self, "supplementalBottomRightButton"));
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v65, 9, 0, self, 9, 1.0, v64));
    objc_msgSend(v79, "addObject:", v66);

    -[PHBottomBar addConstraints:](self, "addConstraints:", v79);
    -[PHBottomBar prepareButtonsForAnimationBegin](self, "prepareButtonsForAnimationBegin");
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_1000F36F0;
    v85[3] = &unk_100285360;
    v6 = v81;
    v86 = v81;
    v87 = self;
    v88 = v77;
    v82[0] = _NSConcreteStackBlock;
    v82[1] = 3221225472;
    v82[2] = sub_1000F37B8;
    v82[3] = &unk_100287CC0;
    v7 = v80;
    v83 = v88;
    v84 = v80;
    v67 = v88;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v85, v82, 0.25);

  }
}

- (void)animateOutSupplementalBottomLeftButtonToState:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  unsigned int v9;
  id v10;
  double v11;
  double v12;
  unint64_t v13;
  double v14;
  unint64_t v15;
  double v16;
  float v17;
  double v18;
  double v19;
  double v20;
  uint64_t v21;
  double v22;
  double v23;
  unint64_t v24;
  double v25;
  unint64_t v26;
  double v27;
  unint64_t v28;
  double v29;
  unint64_t v30;
  void *v31;
  unint64_t v32;
  double v33;
  unint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  double v38;
  double v39;
  unint64_t v40;
  double v41;
  unint64_t v42;
  double v43;
  void *v44;
  unint64_t v45;
  double v46;
  unint64_t v47;
  void *v48;
  void *v49;
  unint64_t v50;
  double v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  id v58;
  void *v59;
  void *v60;
  void *v61;
  unsigned int v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  int64_t v68;
  void *v69;
  void *v70;
  void *v71;
  _QWORD v72[5];
  id v73;
  id v74;
  int64_t v75;
  _QWORD v76[4];
  id v77;
  _QWORD v78[13];
  _QWORD v79[13];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v8 = objc_msgSend(v7, "callDisplayStyle");

  if (v8 != (id)3)
  {
    v71 = v6;
    v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalBottomLeftButton](self, "supplementalBottomLeftButton"));
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels"));
    v78[0] = CFSTR("SideMarginForDoubleButton");
    -[PHBottomBar sideMarginForDoubleButton](self, "sideMarginForDoubleButton");
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v79[0] = v66;
    v78[1] = CFSTR("SideMarginForFaceTimeButtons");
    -[PHBottomBar sideMarginForFaceTimeButtons](self, "sideMarginForFaceTimeButtons");
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v79[1] = v65;
    v78[2] = CFSTR("SideMarginForFaceTimeInCallButtons");
    -[PHBottomBar sideMarginForFaceTimeInCallButtons](self, "sideMarginForFaceTimeInCallButtons");
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v79[2] = v64;
    v78[3] = CFSTR("TopMarginForFaceTimeButtons");
    v9 = -[PHBottomBar usesLowerButtons](self, "usesLowerButtons");
    v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v10 = objc_msgSend(v63, "callDisplayStyle");
    v62 = v9;
    if (v9)
    {
      if (v10 == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v12 = v11;
      v13 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v14 = 30.0;
      if (v13 != 6)
      {
        v15 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v14 = 24.0;
        if (v15 == 3)
          v14 = 30.0;
      }
      v16 = v12 + v14;
      *(float *)&v16 = v16;
      v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v16));
      objc_msgSend(v61, "floatValue");
      v18 = v17;
      -[PHBottomBar yOffsetForLoweredButtons](self, "yOffsetForLoweredButtons");
      v20 = v19 + v18;
      *(float *)&v20 = v20;
      v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v20));
    }
    else
    {
      if (v10 == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v23 = v22;
      v24 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v25 = 30.0;
      if (v24 != 6)
      {
        v26 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v25 = 24.0;
        if (v26 == 3)
          v25 = 30.0;
      }
      v27 = v23 + v25;
      *(float *)&v27 = v27;
      v21 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v27));
      v61 = (void *)v21;
    }
    v79[3] = v21;
    v78[4] = CFSTR("ButtonSpacing");
    v28 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v21);
    LODWORD(v29) = 30.0;
    if (v28 != 6)
    {
      v30 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v29);
      LODWORD(v29) = 24.0;
      if (v30 == 3)
        *(float *)&v29 = 30.0;
    }
    v60 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v29));
    v79[4] = v60;
    v78[5] = CFSTR("AmbientButtonSpacing");
    +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
    v31 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v79[5] = v31;
    v78[6] = CFSTR("ButtonSliderSpacing");
    v32 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v33) = 25.0;
    if (v32 != 6)
    {
      v34 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v33);
      LODWORD(v33) = 1102315520;
      if (v34 == 3)
        *(float *)&v33 = 25.0;
    }
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v33));
    v79[6] = v35;
    v78[7] = CFSTR("BottomSupplementalButtonSpacing");
    +[PHBottomBar defaultBottomSupplementalButtonSpacing](PHBottomBar, "defaultBottomSupplementalButtonSpacing");
    v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v79[7] = v36;
    v79[8] = &off_1002973A8;
    v78[8] = CFSTR("TopSupplementalButtonSpacing");
    v78[9] = CFSTR("HeightOfAButtonPlusButtonSpacing");
    v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v37, "callDisplayStyle") == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v39 = v38;
    v40 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    v41 = 30.0;
    if (v40 != 6)
    {
      v42 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
      v41 = 24.0;
      if (v42 == 3)
        v41 = 30.0;
    }
    v68 = a3;
    v43 = v39 + v41;
    *(float *)&v43 = v43;
    v44 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v43));
    v79[9] = v44;
    v78[10] = CFSTR("ButtonSpacingCallScreening");
    v45 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v46) = 30.0;
    if (v45 != 6)
    {
      v47 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v46);
      LODWORD(v46) = 24.0;
      if (v47 == 3)
        *(float *)&v46 = 30.0;
    }
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v46));
    v79[10] = v48;
    v78[11] = CFSTR("HeightOfCallScreeningButtonPlusButtonSpacing");
    -[PHBottomBar heightOfCallScreeningButtonPlusButtonSpacing](self, "heightOfCallScreeningButtonPlusButtonSpacing");
    v49 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v79[11] = v49;
    v78[12] = CFSTR("ButtonSliderSpacingCallScreeningSlider");
    v50 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v51) = 25.0;
    if (v50 != 6)
    {
      v52 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v51);
      LODWORD(v51) = 1102315520;
      if (v52 == 3)
        *(float *)&v51 = 25.0;
    }
    v53 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v51));
    v79[12] = v53;
    v54 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v79, v78, 13));

    if (v62)
    -[PHBottomBar setSupplementalBottomLeftButton:](self, "setSupplementalBottomLeftButton:", 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainLeftButton]"), 0, v54, v69));
    objc_msgSend(v70, "addObjectsFromArray:", v55);

    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("[_mainLeftButton]"), 0, v54, v69));
    objc_msgSend(v70, "addObjectsFromArray:", v56);

    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", self->_mainLeftButton, 9, 0, self, 9, 1.0, 0.0));
    objc_msgSend(v70, "addObject:", v57);

    -[PHBottomBar prepareButtonsForAnimationBegin](self, "prepareButtonsForAnimationBegin");
    v76[0] = _NSConcreteStackBlock;
    v76[1] = 3221225472;
    v76[2] = sub_1000F3F20;
    v76[3] = &unk_100284898;
    v77 = v67;
    v72[0] = _NSConcreteStackBlock;
    v72[1] = 3221225472;
    v72[2] = sub_1000F3F2C;
    v72[3] = &unk_100287CE8;
    v75 = v68;
    v72[4] = self;
    v73 = v77;
    v6 = v71;
    v74 = v71;
    v58 = v77;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v76, v72, 0.25);

  }
}

- (void)ambientAnimateFromIncomingCallStateToCallScreeningStateWithCompletion:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  _QWORD v11[5];
  id v12;
  _QWORD v13[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](self, "sideButtonLeft"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1000F40DC;
  v13[3] = &unk_1002848C0;
  v13[4] = self;
  +[AmbientAnimationCoordinator hide:completion:](_TtC13InCallService27AmbientAnimationCoordinator, "hide:completion:", v5, v13);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_1000F4114;
  v11[3] = &unk_100285C30;
  v11[4] = self;
  v12 = v4;
  v7 = v4;
  +[AmbientAnimationCoordinator hide:completion:](_TtC13InCallService27AmbientAnimationCoordinator, "hide:completion:", v6, v11);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("ACCEPT"), &stru_10028DC20, CFSTR("BottomBar")));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
  objc_msgSend(v10, "setTitle:", v9);

}

- (void)animateFromFaceTimeOutgoingStateToFaceTimeInCallState:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  int64_t v21;
  _QWORD v22[4];
  id v23;
  id v24;

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v8 = objc_msgSend(v7, "callDisplayStyle");

  if (v8 != (id)3)
  {
    if (-[PHBottomBar shouldShowActionTypeEffects](self, "shouldShowActionTypeEffects"))
      v9 = 31;
    else
      v9 = 30;
    +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v9, 0, 0, 0, 0, 0));
    objc_msgSend(v10, "setAlpha:", 0.0);
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar sideButtonLeft](self, "sideButtonLeft"));
    -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v10);
    -[PHBottomBar addSubview:](self, "addSubview:", self->_sideButtonLeft);
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));

    if (v12)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
      -[PHBottomBar removeConstraints:](self, "removeConstraints:", v13);

    }
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar constraintsForState:](self, "constraintsForState:", 15));
    -[PHBottomBar setButtonLayoutConstraints:](self, "setButtonLayoutConstraints:", v14);

    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
    -[PHBottomBar addConstraints:](self, "addConstraints:", v15);

    -[PHBottomBar setNeedsLayout](self, "setNeedsLayout");
    -[PHBottomBar layoutIfNeeded](self, "layoutIfNeeded");
    v22[0] = _NSConcreteStackBlock;
    v22[1] = 3221225472;
    v22[2] = sub_1000F43A0;
    v22[3] = &unk_100285158;
    v23 = v11;
    v24 = v10;
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1000F43D0;
    v18[3] = &unk_100287CE8;
    v21 = a3;
    v18[4] = self;
    v19 = v23;
    v20 = v6;
    v16 = v23;
    v17 = v10;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v22, v18, 0.25);

  }
}

- (void)animateFromOutgoingStateToCallbackAndMessageUIToState:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  id v18;
  id v19;
  int64_t v20;
  _QWORD v21[5];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v8 = objc_msgSend(v7, "callDisplayStyle");

  if (v8 != (id)3)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 17, 0, 0, 0, 0, 0));
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 18, 0, 0, 0, 0, 0));
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:](self, "makeButtonWithType:title:image:color:font:fontColor:", 26, 0, 0, 0, 0, 0));
    objc_msgSend(v9, "setAlpha:", 0.0);
    objc_msgSend(v11, "setAlpha:", 0.0);
    objc_msgSend(v10, "setAlpha:", 0.0);
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_1000F45F4;
    v21[3] = &unk_100284898;
    v21[4] = self;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1000F4600;
    v15[3] = &unk_100287D10;
    v15[4] = self;
    v16 = v10;
    v17 = v11;
    v18 = v9;
    v20 = a3;
    v19 = v6;
    v12 = v9;
    v13 = v11;
    v14 = v10;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v21, v15, 0.25);

  }
}

- (void)animateFromIncomingCallStateToInCallState:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  PHBottomBarButtonConfiguration *v30;
  void *v31;
  double v32;
  PHBottomBarButtonConfiguration *v33;
  void *v34;
  void *v35;
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
  uint64_t v47;
  void *v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  double v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  int64_t v65;
  id v66;
  void *v67;
  id v68;
  _BOOL4 v69;
  void *v70;
  void *v71;
  CATransform3D v72;
  CATransform3D v73;
  _QWORD v74[5];
  id v75;
  id v76;
  id v77;
  int64_t v78;
  _QWORD v79[6];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v8 = objc_msgSend(v7, "callDisplayStyle");

  if (v8 != (id)3)
  {
    v65 = a3;
    v9 = (id)-[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState") == (id)2
      || (id)-[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState") == (id)4;
    -[PHBottomBar prepareButtonsForAnimationBegin](self, "prepareButtonsForAnimationBegin");
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v10, "setFromValue:", &off_1002973D8);
    objc_msgSend(v10, "setToValue:", &off_1002973E8);
    v11 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", CFSTR("easeInEaseOut")));
    objc_msgSend(v10, "setTimingFunction:", v11);

    objc_msgSend(v10, "setDuration:", 0.0399999991);
    v69 = v9;
    if (v9)
    {
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarAnimations rollAnimation](PHBottomBarAnimations, "rollAnimation"));
    }
    else
    {
      v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "imageView"));
      v14 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "image")));
      v15 = objc_msgSend(v14, "CGImage");
      v16 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration imageForAction:callState:](PHBottomBarButtonConfiguration, "imageForAction:callState:", 14, 1)));
      v71 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarAnimations crossFadeAnimationFromImage:toImage:](PHBottomBarAnimations, "crossFadeAnimationFromImage:toImage:", v15, objc_msgSend(v16, "CGImage")));

    }
    v17 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
    v18 = objc_msgSend(v17, "CGColor");

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v20 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "backgroundColor")));
    v68 = v18;
    v70 = (void *)objc_claimAutoreleasedReturnValue(+[PHBottomBarAnimations backgroundColorAnimationFromColor:toColor:](PHBottomBarAnimations, "backgroundColorAnimationFromColor:toColor:", objc_msgSend(v20, "CGColor"), v18));

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    objc_msgSend(v21, "setMass:", 2.0);
    objc_msgSend(v21, "setStiffness:", 300.0);
    objc_msgSend(v21, "setDamping:", 50.0);
    objc_msgSend(v21, "setDuration:", 0.910000026);
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
    objc_msgSend(v23, "position");
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v21, "setFromValue:", v24);

    -[PHBottomBar bounds](self, "bounds");
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v25 * 0.5));
    objc_msgSend(v21, "setToValue:", v26);

    v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopLeftButton](self, "supplementalTopLeftButton"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar supplementalTopRightButton](self, "supplementalTopRightButton"));
    v79[0] = _NSConcreteStackBlock;
    v79[1] = 3221225472;
    v79[2] = sub_1000F50FC;
    v79[3] = &unk_100284898;
    v79[4] = self;
    v74[0] = _NSConcreteStackBlock;
    v74[1] = 3221225472;
    v74[2] = sub_1000F5174;
    v74[3] = &unk_100287D38;
    v74[4] = self;
    v78 = v65;
    v66 = v27;
    v75 = v66;
    v29 = v28;
    v76 = v29;
    v77 = v6;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v79, v74, 0.25, 0.0);
    v30 = [PHBottomBarButtonConfiguration alloc];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v31, "callDisplayStyle") == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize", v66);
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight", v66);
    v33 = -[PHBottomBarButtonConfiguration initWithAction:diameter:callState:](v30, "initWithAction:diameter:callState:", 1, -[PHBottomBar currentBottomBarCallState](self, "currentBottomBarCallState"), v32);

    v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBarButtonConfiguration icon](v33, "icon"));
    objc_msgSend(v34, "setImage:forState:", v35, 0);

    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "imageView"));
    objc_msgSend(v37, "setClipsToBounds:", 0);

    v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "imageView"));
    objc_msgSend(v39, "setContentMode:", 4);

    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "titleLabel"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "layer"));
    objc_msgSend(v42, "addAnimation:forKey:", v10, CFSTR("acceptTitleAnimation"));

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "imageView"));
    v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "layer"));
    objc_msgSend(v45, "addAnimation:forKey:", v71, CFSTR("mainRightButtonAnimation"));

    v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v47 = objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "layer"));
    objc_msgSend((id)v47, "addAnimation:forKey:", v21, CFSTR("buttonSlideAnimation"));

    v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    objc_opt_class(PHBottomBarButton, v49);
    LOBYTE(v47) = objc_opt_isKindOfClass(v48, v50);

    v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v52 = v51;
    if ((v47 & 1) != 0)
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "roundView"));
      v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
      objc_msgSend(v54, "addAnimation:forKey:", v70, CFSTR("buttonColorAnimation"));

    }
    else
    {
      v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "layer"));
      objc_msgSend(v53, "addAnimation:forKey:", v70, CFSTR("buttonColorAnimation"));
    }

    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    objc_msgSend(v55, "setAction:", 14);

    v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "titleLabel"));
    v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "layer"));
    LODWORD(v59) = 0;
    objc_msgSend(v58, "setOpacity:", v59);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v68));
    objc_msgSend(v60, "setBackgroundColor:", v61);

    if (v69)
    {
      CATransform3DMakeRotation(&v73, 2.35619449, 0.0, 0.0, 1.0);
      v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
      v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "imageView"));
      v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "layer"));
      v72 = v73;
      objc_msgSend(v64, "setTransform:", &v72);

    }
  }

}

- (void)animateFromIncomingCallStateToFaceTimeInCallState:(int64_t)a3 withCompletion:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  unsigned int v12;
  id v13;
  double v14;
  double v15;
  unint64_t v16;
  double v17;
  unint64_t v18;
  double v19;
  float v20;
  double v21;
  double v22;
  double v23;
  uint64_t v24;
  double v25;
  double v26;
  unint64_t v27;
  double v28;
  unint64_t v29;
  double v30;
  unint64_t v31;
  double v32;
  unint64_t v33;
  unint64_t v34;
  double v35;
  unint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  double v40;
  double v41;
  unint64_t v42;
  double v43;
  unint64_t v44;
  double v45;
  void *v46;
  unint64_t v47;
  double v48;
  unint64_t v49;
  void *v50;
  void *v51;
  unint64_t v52;
  double v53;
  unint64_t v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  id v67;
  id v68;
  id v69;
  id v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  void *v77;
  void *v78;
  void *v79;
  id v80;
  void *v81;
  void *v82;
  void *v83;
  void *v84;
  id v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  uint64_t v95;
  uint64_t v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  double v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  id v119;
  void *v120;
  void *v121;
  int64_t v122;
  id v123;
  void *v124;
  void *v125;
  void *v126;
  CATransform3D v127;
  CATransform3D v128;
  _QWORD v129[5];
  id v130;
  id v131;
  id v132;
  int64_t v133;
  _QWORD v134[5];
  _QWORD v135[5];
  id v136;
  _QWORD v137[2];
  _QWORD v138[13];
  _QWORD v139[13];

  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
  v8 = objc_msgSend(v7, "callDisplayStyle");

  if (v8 != (id)3)
  {
    v122 = a3;
    if (-[PHBottomBar shouldShowActionTypePhotoCapture](self, "shouldShowActionTypePhotoCapture"))
    {
      +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", 30, 0, 0, 0, 0, 0));
      -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", v9);

    }
    else
    {
      -[PHBottomBar setSideButtonLeft:](self, "setSideButtonLeft:", 0);
    }
    if (-[PHBottomBar shouldShowActionTypeAudioRoute](self, "shouldShowActionTypeAudioRoute"))
      v10 = 21;
    else
      v10 = 20;
    +[PHBottomBarButtonConfiguration smallHeight](PHBottomBarButtonConfiguration, "smallHeight");
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar makeButtonWithType:title:image:color:font:fontColor:diameter:](self, "makeButtonWithType:title:image:color:font:fontColor:diameter:", v10, 0, 0, 0, 0, 0));
    -[PHBottomBar setSideButtonRight:](self, "setSideButtonRight:", v11);

    -[UIButton setAlpha:](self->_sideButtonRight, "setAlpha:", 0.0);
    -[UIButton setAlpha:](self->_sideButtonLeft, "setAlpha:", 0.0);
    -[PHBottomBar addSubview:](self, "addSubview:", self->_sideButtonRight);
    -[PHBottomBar addSubview:](self, "addSubview:", self->_sideButtonLeft);
    v125 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    v124 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar viewLabels](self, "viewLabels"));
    v138[0] = CFSTR("SideMarginForDoubleButton");
    -[PHBottomBar sideMarginForDoubleButton](self, "sideMarginForDoubleButton");
    v120 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v139[0] = v120;
    v138[1] = CFSTR("SideMarginForFaceTimeButtons");
    -[PHBottomBar sideMarginForFaceTimeButtons](self, "sideMarginForFaceTimeButtons");
    v118 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v139[1] = v118;
    v138[2] = CFSTR("SideMarginForFaceTimeInCallButtons");
    -[PHBottomBar sideMarginForFaceTimeInCallButtons](self, "sideMarginForFaceTimeInCallButtons");
    v117 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v139[2] = v117;
    v138[3] = CFSTR("TopMarginForFaceTimeButtons");
    v12 = -[PHBottomBar usesLowerButtons](self, "usesLowerButtons");
    v116 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    v13 = objc_msgSend(v116, "callDisplayStyle");
    if (v12)
    {
      if (v13 == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v15 = v14;
      v16 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v17 = 30.0;
      if (v16 != 6)
      {
        v18 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v17 = 24.0;
        if (v18 == 3)
          v17 = 30.0;
      }
      v19 = v15 + v17;
      *(float *)&v19 = v19;
      v115 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v19));
      objc_msgSend(v115, "floatValue");
      v21 = v20;
      -[PHBottomBar yOffsetForLoweredButtons](self, "yOffsetForLoweredButtons");
      v23 = v22 + v21;
      *(float *)&v23 = v23;
      v24 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v23));
    }
    else
    {
      if (v13 == (id)3)
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
      else
        +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
      v26 = v25;
      v27 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
      v28 = 30.0;
      if (v27 != 6)
      {
        v29 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
        v28 = 24.0;
        if (v29 == 3)
          v28 = 30.0;
      }
      v30 = v26 + v28;
      *(float *)&v30 = v30;
      v24 = objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v30));
      v115 = (void *)v24;
    }
    v112 = (void *)v24;
    v139[3] = v24;
    v138[4] = CFSTR("ButtonSpacing");
    v31 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v32) = 30.0;
    if (v31 != 6)
    {
      v33 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v32);
      LODWORD(v32) = 24.0;
      if (v33 == 3)
        *(float *)&v32 = 30.0;
    }
    v126 = v6;
    v114 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v32));
    v139[4] = v114;
    v138[5] = CFSTR("AmbientButtonSpacing");
    +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
    v113 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v139[5] = v113;
    v138[6] = CFSTR("ButtonSliderSpacing");
    v34 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v35) = 25.0;
    if (v34 != 6)
    {
      v36 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v35);
      LODWORD(v35) = 1102315520;
      if (v36 == 3)
        *(float *)&v35 = 25.0;
    }
    v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v35));
    v139[6] = v37;
    v138[7] = CFSTR("BottomSupplementalButtonSpacing");
    +[PHBottomBar defaultBottomSupplementalButtonSpacing](PHBottomBar, "defaultBottomSupplementalButtonSpacing");
    v38 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v139[7] = v38;
    v139[8] = &off_1002973A8;
    v138[8] = CFSTR("TopSupplementalButtonSpacing");
    v138[9] = CFSTR("HeightOfAButtonPlusButtonSpacing");
    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar callDisplayStyleManager](self, "callDisplayStyleManager"));
    if (objc_msgSend(v39, "callDisplayStyle") == (id)3)
      +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
    else
      +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v41 = v40;
    v42 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    v43 = 30.0;
    if (v42 != 6)
    {
      v44 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", 30.0);
      v43 = 24.0;
      if (v44 == 3)
        v43 = 30.0;
    }
    v45 = v41 + v43;
    *(float *)&v45 = v45;
    v46 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v45));
    v139[9] = v46;
    v138[10] = CFSTR("ButtonSpacingCallScreening");
    v47 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v48) = 30.0;
    if (v47 != 6)
    {
      v49 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v48);
      LODWORD(v48) = 24.0;
      if (v49 == 3)
        *(float *)&v48 = 30.0;
    }
    v50 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v48));
    v139[10] = v50;
    v138[11] = CFSTR("HeightOfCallScreeningButtonPlusButtonSpacing");
    -[PHBottomBar heightOfCallScreeningButtonPlusButtonSpacing](self, "heightOfCallScreeningButtonPlusButtonSpacing");
    v51 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    v139[11] = v51;
    v138[12] = CFSTR("ButtonSliderSpacingCallScreeningSlider");
    v52 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing");
    LODWORD(v53) = 25.0;
    if (v52 != 6)
    {
      v54 = +[PHUIConfiguration inCallBottomBarSpacing](PHUIConfiguration, "inCallBottomBarSpacing", v53);
      LODWORD(v53) = 1102315520;
      if (v54 == 3)
        *(float *)&v53 = 25.0;
    }
    v55 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithFloat:](NSNumber, "numberWithFloat:", v53));
    v139[12] = v55;
    v56 = objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v139, v138, 13));

    if (v12)
    v121 = (void *)v56;
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintsWithVisualFormat:options:metrics:views:](NSLayoutConstraint, "constraintsWithVisualFormat:options:metrics:views:", CFSTR("V:|-(HeightOfAButtonPlusButtonSpacing)-[_mainRightButton]"), 0, v56, v124));
    objc_msgSend(v125, "addObjectsFromArray:", v57);

    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "centerXAnchor"));
    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar centerXAnchor](self, "centerXAnchor"));
    v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "constraintEqualToAnchor:", v60));
    objc_msgSend(v125, "addObject:", v61);

    v62 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar constraintsForState:](self, "constraintsForState:", v122));
    objc_msgSend(v125, "addObjectsFromArray:", v62);

    -[PHBottomBar prepareButtonsForAnimationBegin](self, "prepareButtonsForAnimationBegin");
    v63 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v63, "setFromValue:", &off_1002973D8);
    objc_msgSend(v63, "setToValue:", &off_1002973E8);
    v64 = (void *)objc_claimAutoreleasedReturnValue(+[CAMediaTimingFunction functionWithName:](CAMediaTimingFunction, "functionWithName:", CFSTR("easeInEaseOut")));
    objc_msgSend(v63, "setTimingFunction:", v64);

    objc_msgSend(v63, "setDuration:", 0.0399999991);
    v65 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
    objc_msgSend(v65, "setMass:", 2.0);
    objc_msgSend(v65, "setStiffness:", 300.0);
    objc_msgSend(v65, "setDamping:", 50.0);
    objc_msgSend(v65, "setDuration:", 0.50999999);
    objc_msgSend(v65, "setEndAngle:", 2.35619449);
    objc_msgSend(v65, "setRemovedOnCompletion:", 0);
    v66 = (void *)objc_claimAutoreleasedReturnValue(+[CAKeyframeAnimation animationWithKeyPath:](CAKeyframeAnimation, "animationWithKeyPath:", CFSTR("backgroundColor")));
    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor")));
    v68 = objc_msgSend(v67, "CGColor");

    v69 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
    v70 = objc_msgSend(v69, "CGColor");

    v137[0] = v68;
    v119 = v70;
    v137[1] = v70;
    v71 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v137, 2));
    objc_msgSend(v66, "setValues:", v71);

    objc_msgSend(v66, "setKeyTimes:", &off_100297308);
    objc_msgSend(v66, "setDuration:", 0.254999995);
    objc_msgSend(v66, "setRemovedOnCompletion:", 0);
    v72 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("buttonSlideAnimation")));
    objc_msgSend(v72, "setMass:", 2.0);
    objc_msgSend(v72, "setStiffness:", 300.0);
    objc_msgSend(v72, "setDamping:", 50.0);
    objc_msgSend(v72, "setDuration:", 0.50999999);
    objc_msgSend(v72, "setKeyPath:", CFSTR("position.x"));
    v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "layer"));
    objc_msgSend(v74, "position");
    v75 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
    objc_msgSend(v72, "setFromValue:", v75);

    -[PHBottomBar bounds](self, "bounds");
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v76 * 0.5));
    objc_msgSend(v72, "setToValue:", v77);

    v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainLeftButton](self, "mainLeftButton"));
    v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    objc_msgSend(v78, "setAlpha:", 0.0);
    v135[0] = _NSConcreteStackBlock;
    v135[1] = 3221225472;
    v135[2] = sub_1000F61A0;
    v135[3] = &unk_100285158;
    v135[4] = self;
    v80 = v78;
    v136 = v80;
    v134[0] = _NSConcreteStackBlock;
    v134[1] = 3221225472;
    v134[2] = sub_1000F6200;
    v134[3] = &unk_1002848C0;
    v134[4] = self;
    +[UIView animateWithDuration:delay:options:animations:completion:](UIView, "animateWithDuration:delay:options:animations:completion:", 0x20000, v135, v134, 0.25, 0.0);
    -[PHBottomBar setSupplementalTopLeftButton:](self, "setSupplementalTopLeftButton:", 0);
    -[PHBottomBar setSupplementalTopRightButton:](self, "setSupplementalTopRightButton:", 0);
    v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "imageView"));
    objc_msgSend(v82, "setClipsToBounds:", 0);

    v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v83, "imageView"));
    objc_msgSend(v84, "setContentMode:", 4);

    +[CATransaction begin](CATransaction, "begin");
    v129[0] = _NSConcreteStackBlock;
    v129[1] = 3221225472;
    v129[2] = sub_1000F6254;
    v129[3] = &unk_100287D60;
    v129[4] = self;
    v133 = v122;
    v132 = v126;
    v123 = v79;
    v130 = v123;
    v85 = v80;
    v131 = v85;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v129);
    v86 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v87 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "titleLabel"));
    v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "layer"));
    objc_msgSend(v88, "addAnimation:forKey:", v63, CFSTR("acceptTitleAnimation"));

    v89 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v89, "imageView"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v90, "layer"));
    objc_msgSend(v91, "addAnimation:forKey:", v65, CFSTR("rollButtonAnimation"));

    v92 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v93 = objc_claimAutoreleasedReturnValue(objc_msgSend(v92, "layer"));
    objc_msgSend((id)v93, "addAnimation:forKey:", v72, CFSTR("buttonSlideAnimation"));

    v94 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    objc_opt_class(PHBottomBarButton, v95);
    LOBYTE(v93) = objc_opt_isKindOfClass(v94, v96);

    v97 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v98 = v97;
    if ((v93 & 1) != 0)
    {
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "roundView"));
      v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v99, "layer"));
      objc_msgSend(v100, "addAnimation:forKey:", v66, CFSTR("buttonColorAnimation"));

    }
    else
    {
      v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "layer"));
      objc_msgSend(v99, "addAnimation:forKey:", v66, CFSTR("buttonColorAnimation"));
    }

    +[CATransaction commit](CATransaction, "commit");
    v101 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v101, "titleLabel"));
    v103 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v102, "layer"));
    LODWORD(v104) = 0;
    objc_msgSend(v103, "setOpacity:", v104);

    v105 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v106 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithCGColor:](UIColor, "colorWithCGColor:", v119));
    objc_msgSend(v105, "setBackgroundColor:", v106);

    CATransform3DMakeRotation(&v128, 2.35619449, 0.0, 0.0, 1.0);
    v107 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar mainRightButton](self, "mainRightButton"));
    v108 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v107, "imageView"));
    v109 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v108, "layer"));
    v127 = v128;
    objc_msgSend(v109, "setTransform:", &v127);

    v110 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
    -[PHBottomBar removeConstraints:](self, "removeConstraints:", v110);

    -[PHBottomBar setButtonLayoutConstraints:](self, "setButtonLayoutConstraints:", v125);
    v111 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar buttonLayoutConstraints](self, "buttonLayoutConstraints"));
    -[PHBottomBar addConstraints:](self, "addConstraints:", v111);

    -[PHBottomBar setNeedsLayout](self, "setNeedsLayout");
    -[PHBottomBar layoutIfNeeded](self, "layoutIfNeeded");
    -[PHBottomBar setNeedsDisplay](self, "setNeedsDisplay");
    -[PHBottomBar forceDisplayIfNeeded](self, "forceDisplayIfNeeded");

    v6 = v126;
  }

}

- (void)_startShopDemoMode
{
  uint64_t v3;

  if (qword_1002D6F48 <= 25)
    v3 = qword_1002D6F48 + 1;
  else
    v3 = 0;
  qword_1002D6F48 = v3;
  -[PHBottomBar setCurrentState:](self, "setCurrentState:");
  -[PHBottomBar performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", "_startShopDemoMode", 0, 1.0);
}

- (id)nameForActionType:(int64_t)a3
{
  if ((unint64_t)(a3 - 1) >= 0x24)
    return (id)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Unknown (%ld)"), a3));
  else
    return off_100287DC0[a3 - 1];
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  _BOOL4 v14;

  v12.receiver = self;
  v12.super_class = (Class)PHBottomBar;
  v4 = a3;
  -[PHBottomBar traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_backlightLuminance", v12.receiver, v12.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_backlightLuminance");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHBottomBar traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "_backlightLuminance");

    -[PHBottomBar setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v9 != (id)1);
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v9 != (id)1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting userInteractionEnabled of bottom bar to %d because of back light change", buf, 8u);
    }

  }
}

- (NSArray)buttonsForAmbientTransition
{
  id v3;
  void *v4;
  void *v5;

  v3 = objc_alloc_init((Class)NSMutableArray);
  v4 = v3;
  if (self->_mainLeftButton)
    objc_msgSend(v3, "addObject:");
  if (self->_mainRightButton)
    objc_msgSend(v4, "addObject:");
  if (self->_supplementalTopLeftButton)
    objc_msgSend(v4, "addObject:");
  if (self->_supplementalTopRightButton)
    objc_msgSend(v4, "addObject:");
  if (self->_supplementalBottomLeftButton)
    objc_msgSend(v4, "addObject:");
  if (self->_supplementalBottomRightButton)
    objc_msgSend(v4, "addObject:");
  if (self->_sideButtonLeft)
    objc_msgSend(v4, "addObject:");
  if (self->_sideButtonRight)
    objc_msgSend(v4, "addObject:");
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_cn_flatMap:", &stru_100287DA0));

  return (NSArray *)v5;
}

- (PHBottomBarDelegateProtocol)delegate
{
  return (PHBottomBarDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (BOOL)declineAndRemindIsAvailable
{
  return self->_declineAndRemindIsAvailable;
}

- (BOOL)declineAndMessageIsAvailable
{
  return self->_declineAndMessageIsAvailable;
}

- (BOOL)blursBackground
{
  return self->_blursBackground;
}

- (void)setBlursBackground:(BOOL)a3
{
  self->_blursBackground = a3;
}

- (BOOL)usesLowerButtons
{
  return self->_usesLowerButtons;
}

- (int64_t)currentState
{
  return self->_currentState;
}

- (int64_t)orientation
{
  return self->_orientation;
}

- (double)bottomMargin
{
  return self->_bottomMargin;
}

- (void)setBottomMargin:(double)a3
{
  self->_bottomMargin = a3;
}

- (double)yOffsetForLoweredButtons
{
  return self->_yOffsetForLoweredButtons;
}

- (void)setYOffsetForLoweredButtons:(double)a3
{
  self->_yOffsetForLoweredButtons = a3;
}

- (void)setTopLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_topLayoutGuide, a3);
}

- (void)setMainButtonLayoutGuide:(id)a3
{
  objc_storeStrong((id *)&self->_mainButtonLayoutGuide, a3);
}

- (BOOL)isShowingButtonCountdown
{
  return self->_isShowingButtonCountdown;
}

- (id)statusChangedHandler
{
  return self->_statusChangedHandler;
}

- (void)setStatusChangedHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (NSArray)buttonLayoutConstraints
{
  return (NSArray *)objc_getProperty(self, a2, 88, 1);
}

- (void)setButtonLayoutConstraints:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 88);
}

- (NSArray)horizontalConstraintsForSupplementalButtons
{
  return (NSArray *)objc_getProperty(self, a2, 96, 1);
}

- (void)setHorizontalConstraintsForSupplementalButtons:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 96);
}

- (UIButton)supplementalTopLeftButton
{
  return self->_supplementalTopLeftButton;
}

- (void)setSupplementalTopLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalTopLeftButton, a3);
}

- (UIButton)supplementalTopRightButton
{
  return self->_supplementalTopRightButton;
}

- (void)setSupplementalTopRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalTopRightButton, a3);
}

- (UIButton)mainLeftButton
{
  return self->_mainLeftButton;
}

- (void)setMainLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_mainLeftButton, a3);
}

- (UIButton)mainRightButton
{
  return self->_mainRightButton;
}

- (void)setMainRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_mainRightButton, a3);
}

- (UIButton)sideButtonLeft
{
  return self->_sideButtonLeft;
}

- (void)setSideButtonLeft:(id)a3
{
  objc_storeStrong((id *)&self->_sideButtonLeft, a3);
}

- (UIButton)sideButtonRight
{
  return self->_sideButtonRight;
}

- (void)setSideButtonRight:(id)a3
{
  objc_storeStrong((id *)&self->_sideButtonRight, a3);
}

- (UIButton)supplementalBottomRightButton
{
  return self->_supplementalBottomRightButton;
}

- (void)setSupplementalBottomRightButton:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalBottomRightButton, a3);
}

- (UIButton)supplementalBottomLeftButton
{
  return self->_supplementalBottomLeftButton;
}

- (void)setSupplementalBottomLeftButton:(id)a3
{
  objc_storeStrong((id *)&self->_supplementalBottomLeftButton, a3);
}

- (PHSlidingButton)slidingButton
{
  return self->_slidingButton;
}

- (void)setSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_slidingButton, a3);
}

- (BOOL)animating
{
  return self->_animating;
}

- (NSMutableArray)pendingStateBlocks
{
  return self->_pendingStateBlocks;
}

- (TUCallCenter)callCenter
{
  return self->_callCenter;
}

- (void)setCallCenter:(id)a3
{
  objc_storeStrong((id *)&self->_callCenter, a3);
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
  objc_storeStrong((id *)&self->_captureView, a3);
}

- (UINotificationFeedbackGenerator)alertFeedbackGenerator
{
  return self->_alertFeedbackGenerator;
}

- (void)setAlertFeedbackGenerator:(id)a3
{
  objc_storeStrong((id *)&self->_alertFeedbackGenerator, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_alertFeedbackGenerator, 0);
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_callCenter, 0);
  objc_storeStrong((id *)&self->_pendingStateBlocks, 0);
  objc_storeStrong((id *)&self->_slidingButton, 0);
  objc_storeStrong((id *)&self->_supplementalBottomLeftButton, 0);
  objc_storeStrong((id *)&self->_supplementalBottomRightButton, 0);
  objc_storeStrong((id *)&self->_sideButtonRight, 0);
  objc_storeStrong((id *)&self->_sideButtonLeft, 0);
  objc_storeStrong((id *)&self->_mainRightButton, 0);
  objc_storeStrong((id *)&self->_mainLeftButton, 0);
  objc_storeStrong((id *)&self->_supplementalTopRightButton, 0);
  objc_storeStrong((id *)&self->_supplementalTopLeftButton, 0);
  objc_storeStrong((id *)&self->_horizontalConstraintsForSupplementalButtons, 0);
  objc_storeStrong((id *)&self->_buttonLayoutConstraints, 0);
  objc_storeStrong((id *)&self->_callDisplayStyleManager, 0);
  objc_storeStrong(&self->_statusChangedHandler, 0);
  objc_storeStrong((id *)&self->_mainButtonLayoutGuide, 0);
  objc_storeStrong((id *)&self->_topLayoutGuide, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

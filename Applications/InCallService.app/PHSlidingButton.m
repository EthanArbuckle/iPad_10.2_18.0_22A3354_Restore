@implementation PHSlidingButton

- (PHSlidingButton)initWithSlidingButtonType:(int)a3 appearanceType:(int)a4
{
  return -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:](self, "initWithSlidingButtonType:appearanceType:callState:", *(_QWORD *)&a3, *(_QWORD *)&a4, 2);
}

- (PHSlidingButton)initWithSlidingButtonType:(int)a3 appearanceType:(int)a4 callState:(int64_t)a5
{
  double y;
  double height;
  double width;
  PHSlidingButton *v11;
  PHSlidingButton *v12;
  __CFString *v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  PHActionSlider *v21;
  PHActionSlider *acceptButton;
  PHActionSlider *v23;
  PHActionSlider *v24;
  void *v25;
  uint64_t v26;
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
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  double v41;
  double v42;
  double v43;
  void *v44;
  void *v45;
  double v46;
  unsigned __int8 v47;
  void *v48;
  void *v49;
  const __CFString *v50;
  void *v51;
  UIImageView *v52;
  UIImageView *dialImageView;
  void *v54;
  uint64_t v55;
  UIButton *sideButtonRight;
  UIButton *v57;
  void *v58;
  void *v59;
  objc_super v61;
  uint8_t buf[4];
  int v63;
  __int16 v64;
  int v65;
  __int16 v66;
  int v67;

  v61.receiver = self;
  v61.super_class = (Class)PHSlidingButton;
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = -[PHSlidingButton initWithFrame:](&v61, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v12 = v11;
  if (!v11)
    return v12;
  v11->_type = a3;
  v11->_callState = a5;
  if (a5 == 1)
    v13 = CFSTR("end_call_voip");
  else
    v13 = CFSTR("phone_dial");
  objc_storeStrong((id *)&v11->_endDialImageName, v13);
  if ((a3 - 7) >= 3)
    v14 = (id)+[PHUIConfiguration inCallSlideToAnswerSize](PHUIConfiguration, "inCallSlideToAnswerSize") == (id)3
       || -[PHSlidingButton isButtonLayoutEnabled](v12, "isButtonLayoutEnabled");
  else
    v14 = 0;
  v15 = sub_1000C5588();
  v16 = objc_claimAutoreleasedReturnValue(v15);
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109632;
    v63 = a3;
    v64 = 1024;
    v65 = a4;
    v66 = 1024;
    v67 = v14;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Making slider with type: %d, appearance: %d, large: %d", buf, 0x14u);
  }

  if (a4)
  {
    if (a4 == 1)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blueColor](UIColor, "blueColor"));
      v18 = 1;
      v19 = (void *)objc_claimAutoreleasedReturnValue(+[_UILegibilitySettings sharedInstanceForStyle:](_UILegibilitySettings, "sharedInstanceForStyle:", 1));
      v20 = (void *)objc_claimAutoreleasedReturnValue(+[_UIVibrantSettings vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:](_UIVibrantSettings, "vibrantSettingsWithReferenceColor:referenceContrast:legibilitySettings:", v17, v19, 0.3));

      v21 = -[PHActionSlider initWithFrame:vibrantSettings:large:]([PHActionSlider alloc], "initWithFrame:vibrantSettings:large:", v20, v14, CGRectZero.origin.x, y, width, height);
      acceptButton = v12->_acceptButton;
      v12->_acceptButton = v21;

      if ((a3 - 1) <= 5)
        v18 = qword_10023FB78[a3 - 1];
      -[PHActionSlider setStyle:](v12->_acceptButton, "setStyle:", v18);

    }
  }
  else
  {
    v23 = -[PHActionSlider initWithFrame:vibrantSettings:large:]([PHActionSlider alloc], "initWithFrame:vibrantSettings:large:", 0, v14, CGRectZero.origin.x, y, width, height);
    v24 = v12->_acceptButton;
    v12->_acceptButton = v23;

    -[PHActionSlider setStyle:](v12->_acceptButton, "setStyle:", 3);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor colorWithWhite:alpha:](UIColor, "colorWithWhite:alpha:", 1.0, 0.200000003));
    -[PHActionSlider setBackgroundColor:](v12->_acceptButton, "setBackgroundColor:", v25);

  }
  -[PHActionSlider setDragStyle:](v12->_acceptButton, "setDragStyle:", 1);
  -[PHActionSlider setTextStyle:](v12->_acceptButton, "setTextStyle:", 1);
  if (v12->_callState == 1)
    v26 = objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration voipTintColor](PHBottomBarButtonConfiguration, "voipTintColor"));
  else
    v26 = objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration systemTintColor](PHBottomBarButtonConfiguration, "systemTintColor"));
  v27 = (void *)v26;
  if (v12->_callState == 1)
  {
    v28 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("phone_slide_voip")));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "imageWithRenderingMode:", 2));

  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage tpImageForSymbolType:textStyle:scale:isStaticSize:](UIImage, "tpImageForSymbolType:textStyle:scale:isStaticSize:", 1, UIFontTextStyleLargeTitle, 2, 1));
  }
  if (a3 == 7)
  {
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("sos-slider-button")));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "imageWithRenderingMode:", 2));
    -[PHActionSlider setKnobImage:](v12->_acceptButton, "setKnobImage:", v31);

    v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHActionSlider setTintColor:](v12->_acceptButton, "setTintColor:", v32);

    v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    -[PHActionSlider setKnobColor:](v12->_acceptButton, "setKnobColor:", v33);

    -[PHActionSlider setTextStyle:](v12->_acceptButton, "setTextStyle:", 2);
    -[PHActionSlider setDragStyle:](v12->_acceptButton, "setDragStyle:", 2);
  }
  else
  {
    if (a3 == 9)
    {
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("medicalid-slider-button")));
      v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "imageWithRenderingMode:", 2));
      -[PHActionSlider setKnobImage:](v12->_acceptButton, "setKnobImage:", v38);

      v39 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
      -[PHActionSlider setTintColor:](v12->_acceptButton, "setTintColor:", v39);

      -[PHActionSlider setTextStyle:](v12->_acceptButton, "setTextStyle:", 2);
    }
    else
    {
      if (a3 != 8)
      {
        -[PHActionSlider setKnobImage:](v12->_acceptButton, "setKnobImage:", v29);
        if (v12->_callState != 1)
        {
          -[PHActionSlider knobImageOffset](v12->_acceptButton, "knobImageOffset");
          v42 = v41;
          -[PHActionSlider knobImageOffset](v12->_acceptButton, "knobImageOffset");
          -[PHActionSlider setKnobImageOffset:](v12->_acceptButton, "setKnobImageOffset:", v42, v43 + 2.0);
        }
        -[PHActionSlider setTintColor:](v12->_acceptButton, "setTintColor:", v27);
        goto LABEL_34;
      }
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("powerdown-slider-button")));
      v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "imageWithRenderingMode:", 2));
      -[PHActionSlider setKnobImage:](v12->_acceptButton, "setKnobImage:", v35);

      v36 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
      -[PHActionSlider setTintColor:](v12->_acceptButton, "setTintColor:", v36);

    }
    v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
    -[PHActionSlider setKnobColor:](v12->_acceptButton, "setKnobColor:", v40);

  }
LABEL_34:
  -[PHActionSlider setDelegate:](v12->_acceptButton, "setDelegate:", v12);
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "currentMode"));
  objc_msgSend(v45, "size");
  if (v46 >= 2208.0)
  {
    v47 = -[PHSlidingButton isButtonLayoutEnabled](v12, "isButtonLayoutEnabled");

    if ((v47 & 1) == 0)
    {
      -[PHActionSlider trackSize](v12->_acceptButton, "trackSize");
      -[PHActionSlider setTrackSize:](v12->_acceptButton, "setTrackSize:", 300.0);
    }
  }
  else
  {

  }
  if ((a3 - 5) > 1)
  {
    if (a3 == 7)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v49 = v48;
      v50 = CFSTR("SLIDE_TO_SOS");
    }
    else if (a3 == 9)
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v49 = v48;
      v50 = CFSTR("MEDICAL_ID");
    }
    else
    {
      v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v49 = v48;
      if (a3 == 8)
        v50 = CFSTR("POWER_OFF");
      else
        v50 = CFSTR("SLIDE_TO_ANSWER");
    }
  }
  else
  {
    v48 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v49 = v48;
    v50 = CFSTR("SLIDE_TO_UNLOCK");
  }
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "localizedStringForKey:value:table:", v50, &stru_10028DC20, CFSTR("BottomBar")));

  -[PHActionSlider setTrackText:](v12->_acceptButton, "setTrackText:", v51);
  v52 = (UIImageView *)objc_msgSend(objc_alloc((Class)UIImageView), "initWithImage:", v29);
  dialImageView = v12->_dialImageView;
  v12->_dialImageView = v52;

  v54 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIImageView setTintColor:](v12->_dialImageView, "setTintColor:", v54);

  v55 = objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:](UIButton, "buttonWithType:", 0));
  sideButtonRight = v12->_sideButtonRight;
  v12->_sideButtonRight = (UIButton *)v55;

  v57 = v12->_sideButtonRight;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UIButton setBackgroundColor:](v57, "setBackgroundColor:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](v12->_sideButtonRight, "layer"));
  objc_msgSend(v59, "setCornerRadius:", 33.0);

  -[UIButton setUserInteractionEnabled:](v12->_sideButtonRight, "setUserInteractionEnabled:", 0);
  -[UIImageView setClipsToBounds:](v12->_dialImageView, "setClipsToBounds:", 0);
  -[UIImageView setContentMode:](v12->_dialImageView, "setContentMode:", 4);
  -[PHActionSlider setAlpha:](v12->_acceptButton, "setAlpha:", 1.0);
  -[PHSlidingButton addSubview:](v12, "addSubview:", v12->_acceptButton);

  return v12;
}

- (void)dealloc
{
  objc_super v3;

  objc_storeWeak((id *)&self->_delegate, 0);
  v3.receiver = self;
  v3.super_class = (Class)PHSlidingButton;
  -[PHSlidingButton dealloc](&v3, "dealloc");
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSlidingButton;
  -[PHSlidingButton layoutSubviews](&v3, "layoutSubviews");
  -[PHSlidingButton bounds](self, "bounds");
  -[PHActionSlider setFrame:](self->_acceptButton, "setFrame:");
}

- (void)setUserInteractionEnabled:(BOOL)a3
{
  _BOOL8 v3;
  double v5;
  objc_super v6;

  v3 = a3;
  if (-[PHSlidingButton isUserInteractionEnabled](self, "isUserInteractionEnabled") != a3)
  {
    v5 = 0.0500000007;
    if (v3)
      v5 = 1.0;
    -[PHSlidingButton setAlpha:](self, "setAlpha:", v5);
  }
  v6.receiver = self;
  v6.super_class = (Class)PHSlidingButton;
  -[PHSlidingButton setUserInteractionEnabled:](&v6, "setUserInteractionEnabled:", v3);
}

- (CGSize)intrinsicContentSize
{
  void *v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  CGSize result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton acceptButton](self, "acceptButton"));
  objc_msgSend(v2, "trackSize");
  v4 = v3;
  v6 = v5;

  v7 = v4;
  v8 = v6;
  result.height = v8;
  result.width = v7;
  return result;
}

- (double)knobWidth
{
  void *v2;
  double v3;
  double v4;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton acceptButton](self, "acceptButton"));
  objc_msgSend(v2, "knobWidth");
  v4 = v3;

  return v4;
}

- (BOOL)isButtonLayoutEnabled
{
  void *v2;
  void *v3;
  void *v4;
  unsigned int v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "frontmostAudioOrVideoCall"));

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  if (objc_msgSend(v4, "isButtonLayoutEnabled"))
    v5 = objc_msgSend(v3, "isVideo") ^ 1;
  else
    LOBYTE(v5) = 0;

  return v5;
}

- (void)actionSlider:(id)a3 didUpdateSlideWithValue:(double)a4
{
  uint64_t v6;
  void *v7;
  void *v8;
  char v9;
  id v10;

  v6 = objc_claimAutoreleasedReturnValue(-[PHSlidingButton delegate](self, "delegate", a3));
  if (v6)
  {
    v7 = (void *)v6;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton delegate](self, "delegate"));
    v9 = objc_opt_respondsToSelector(v8, "slidingButton:didSlideToProportion:");

    if ((v9 & 1) != 0)
    {
      v10 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingButton delegate](self, "delegate"));
      objc_msgSend(v10, "slidingButton:didSlideToProportion:", self, a4);

    }
  }
}

- (void)actionSliderDidCompleteSlide:(id)a3
{
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  unsigned int type;
  BOOL v10;
  int v11;
  _BOOL4 v13;
  PHActionSlider *acceptButton;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  PHActionSlider *v24;
  void *v25;
  void *v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;
  id v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  unsigned int v47;
  double v48;
  double v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  double v58;
  double v59;
  double v60;
  void *v61;
  double v62;
  double v63;
  void *v64;
  void *v65;
  id v66;
  id v67;
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
  void *v83;
  _QWORD v84[5];
  _QWORD v85[5];
  _QWORD v86[6];

  v4 = objc_claimAutoreleasedReturnValue(-[PHSlidingButton delegate](self, "delegate", a3));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "willFinishSlideForSlidingButton:");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton delegate](self, "delegate"));
      objc_msgSend(v8, "willFinishSlideForSlidingButton:", self);

    }
  }
  type = self->_type;
  v10 = type > 9;
  v11 = (1 << type) & 0x390;
  if (v10 || v11 == 0)
  {
    v13 = (id)-[PHSlidingButton callState](self, "callState") == (id)2
       || (id)-[PHSlidingButton callState](self, "callState") == (id)4;
    acceptButton = self->_acceptButton;
    -[PHActionSlider knobRect](acceptButton, "knobRect");
    -[PHActionSlider convertRect:toView:](acceptButton, "convertRect:toView:", self);
    -[UIButton setFrame:](self->_sideButtonRight, "setFrame:");
    -[UIButton center](self->_sideButtonRight, "center");
    v16 = v15;
    -[UIButton center](self->_sideButtonRight, "center");
    v18 = v17;
    -[PHActionSlider knobImageOffset](self->_acceptButton, "knobImageOffset");
    -[UIImageView setCenter:](self->_dialImageView, "setCenter:", v16, v18 + v19);
    -[PHSlidingButton insertSubview:above:](self, "insertSubview:above:", self->_dialImageView, self->_sideButtonRight);
    -[PHSlidingButton insertSubview:above:](self, "insertSubview:above:", self->_sideButtonRight, self->_acceptButton);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("opacity")));
    objc_msgSend(v20, "setFromValue:", &off_100297348);
    objc_msgSend(v20, "setToValue:", &off_100297358);
    objc_msgSend(v20, "setDuration:", 0.115000002);
    objc_msgSend(v20, "setFillMode:", kCAFillModeForwards);
    v80 = v20;
    objc_msgSend(v20, "setRemovedOnCompletion:", 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton acceptButton](self, "acceptButton"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "layer"));
    objc_msgSend(v22, "position");
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    v83 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    v24 = self->_acceptButton;
    if (self->_type == 3)
    {
      v25 = v23;
      v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider layer](v24, "layer"));
      objc_msgSend(v26, "position");
      v28 = v27 + -3.0;

      v23 = v25;
    }
    else
    {
      -[PHActionSlider knobRect](v24, "knobRect");
      v30 = v29;
      -[PHActionSlider center](self->_acceptButton, "center");
      v28 = v30 - v31;
    }
    if (-[PHSlidingButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
    {
      objc_msgSend(v23, "doubleValue");
      v28 = v32 - v28;
    }
    objc_msgSend(v83, "setMass:", 2.0);
    objc_msgSend(v83, "setStiffness:", 300.0);
    objc_msgSend(v83, "setDamping:", 50.0);
    v79 = v23;
    objc_msgSend(v83, "setFromValue:", v23);
    v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v28));
    objc_msgSend(v83, "setToValue:", v33);

    objc_msgSend(v83, "setDuration:", 0.50999999);
    objc_msgSend(v83, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v83, "setRemovedOnCompletion:", 0);
    if (v13)
    {
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("transform.rotation.z")));
      objc_msgSend(v34, "setMass:", 2.0);
      objc_msgSend(v34, "setStiffness:", 300.0);
      objc_msgSend(v34, "setDamping:", 50.0);
      objc_msgSend(v34, "setToValue:", &off_100297408);
      objc_msgSend(v34, "setDuration:", 0.50999999);
      objc_msgSend(v34, "setFillMode:", kCAFillModeForwards);
      v81 = v34;
      objc_msgSend(v34, "setRemovedOnCompletion:", 0);
    }
    else
    {
      v35 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("contents")));
      objc_msgSend(v35, "setDuration:", 0.300000012);
      v36 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView image](self->_dialImageView, "image"));
      v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
      v38 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "_flatImageWithColor:", v37)));
      objc_msgSend(v35, "setFromValue:", objc_msgSend(v38, "CGImage"));

      v39 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[PHBottomBarButtonConfiguration imageForAction:callState:](PHBottomBarButtonConfiguration, "imageForAction:callState:", 14, 1)));
      objc_msgSend(v35, "setToValue:", objc_msgSend(v39, "CGImage"));

      objc_msgSend(v35, "setRemovedOnCompletion:", 0);
      v81 = v35;
      objc_msgSend(v35, "setFillMode:", kCAFillModeForwards);
    }
    if (self->_type == 3)
    {
      +[PHBottomBar defaultSideMarginForDoubleButton](PHBottomBar, "defaultSideMarginForDoubleButton");
      v41 = v40;
      +[PHBottomBarButtonConfiguration defaultWidth](PHBottomBarButtonConfiguration, "defaultWidth");
      v43 = v41 + v42 * 0.5;
      -[PHSlidingButton frame](self, "frame");
      v45 = floor(v43 - v44);
    }
    else
    {
      -[PHSlidingButton bounds](self, "bounds");
      v45 = v46 * 0.5;
    }
    v47 = -[PHSlidingButton _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
    v48 = -1.0;
    if (v47)
      v48 = 1.0;
    v49 = v45 + v48;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton sideButtonRight](self, "sideButtonRight"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layer"));
    objc_msgSend(v51, "position");
    v78 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    v82 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    objc_msgSend(v82, "setMass:", 2.0);
    objc_msgSend(v82, "setStiffness:", 300.0);
    objc_msgSend(v82, "setDamping:", 50.0);
    objc_msgSend(v82, "setFromValue:", v78);
    v52 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v49));
    objc_msgSend(v82, "setToValue:", v52);

    objc_msgSend(v82, "setDuration:", 0.50999999);
    objc_msgSend(v82, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v82, "setRemovedOnCompletion:", 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton dialImageView](self, "dialImageView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "layer"));
    objc_msgSend(v54, "position");
    v77 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));

    v55 = (void *)objc_claimAutoreleasedReturnValue(+[CASpringAnimation animationWithKeyPath:](CASpringAnimation, "animationWithKeyPath:", CFSTR("position.x")));
    objc_msgSend(v55, "setMass:", 2.0);
    objc_msgSend(v55, "setStiffness:", 300.0);
    objc_msgSend(v55, "setDamping:", 50.0);
    objc_msgSend(v55, "setFromValue:", v77);
    v56 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v49));
    objc_msgSend(v55, "setToValue:", v56);

    objc_msgSend(v55, "setDuration:", 0.50999999);
    objc_msgSend(v55, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v55, "setRemovedOnCompletion:", 0);
    v57 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("bounds")));
    +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v59 = v58;
    +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSValue valueWithCGRect:](NSValue, "valueWithCGRect:", 0.0, 0.0, v59, v60));
    objc_msgSend(v57, "setToValue:", v61);

    objc_msgSend(v57, "setDuration:", 0.150000006);
    objc_msgSend(v57, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v57, "setRemovedOnCompletion:", 0);
    +[PHBottomBarButtonConfiguration defaultHeight](PHBottomBarButtonConfiguration, "defaultHeight");
    v63 = v62 * 0.5;
    v64 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_sideButtonRight, "layer"));
    objc_msgSend(v64, "setCornerRadius:", v63);

    v65 = (void *)objc_claimAutoreleasedReturnValue(+[CABasicAnimation animationWithKeyPath:](CABasicAnimation, "animationWithKeyPath:", CFSTR("backgroundColor")));
    objc_msgSend(v65, "setDuration:", 0.144999996);
    v66 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor")));
    objc_msgSend(v65, "setFromValue:", objc_msgSend(v66, "CGColor"));

    v67 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor")));
    objc_msgSend(v65, "setToValue:", objc_msgSend(v67, "CGColor"));

    objc_msgSend(v65, "setFillMode:", kCAFillModeForwards);
    objc_msgSend(v65, "setRemovedOnCompletion:", 0);
    v68 = (void *)objc_claimAutoreleasedReturnValue(+[CATransition animation](CATransition, "animation"));
    objc_msgSend(v68, "setType:", kCATransitionFade);
    objc_msgSend(v68, "setDuration:", 0.115000002);
    +[CATransaction begin](CATransaction, "begin");
    v84[0] = _NSConcreteStackBlock;
    v84[1] = 3221225472;
    v84[2] = sub_100066048;
    v84[3] = &unk_100284898;
    v84[4] = self;
    +[CATransaction setCompletionBlock:](CATransaction, "setCompletionBlock:", v84);
    v69 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dialImageView, "layer"));
    objc_msgSend(v69, "addAnimation:forKey:", v68, kCATransition);

    v70 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_sideButtonRight, "layer"));
    objc_msgSend(v70, "addAnimation:forKey:", v65, CFSTR("backgroundColor"));

    v71 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_sideButtonRight, "layer"));
    objc_msgSend(v71, "addAnimation:forKey:", v57, CFSTR("bounds"));

    v72 = (void *)objc_claimAutoreleasedReturnValue(-[UIButton layer](self->_sideButtonRight, "layer"));
    objc_msgSend(v72, "addAnimation:forKey:", v82, CFSTR("position"));

    v73 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dialImageView, "layer"));
    objc_msgSend(v73, "addAnimation:forKey:", v81, CFSTR("transform"));

    v74 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider layer](self->_acceptButton, "layer"));
    objc_msgSend(v74, "addAnimation:forKey:", v80, CFSTR("opacity"));

    v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHActionSlider layer](self->_acceptButton, "layer"));
    objc_msgSend(v75, "addAnimation:forKey:", v83, CFSTR("position"));

    v76 = (void *)objc_claimAutoreleasedReturnValue(-[UIImageView layer](self->_dialImageView, "layer"));
    objc_msgSend(v76, "addAnimation:forKey:", v55, CFSTR("position"));

    +[CATransaction commit](CATransaction, "commit");
  }
  else
  {
    v85[4] = self;
    v86[0] = _NSConcreteStackBlock;
    v86[1] = 3221225472;
    v86[2] = sub_100065FA0;
    v86[3] = &unk_100284898;
    v86[4] = self;
    v85[0] = _NSConcreteStackBlock;
    v85[1] = 3221225472;
    v85[2] = sub_100065FAC;
    v85[3] = &unk_1002848C0;
    +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v86, v85, 0.300000012);
  }
}

- (PHActionSlider)acceptButton
{
  return (PHActionSlider *)objc_getProperty(self, a2, 16, 1);
}

- (void)setAcceptButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 16);
}

- (UIButton)sideButtonRight
{
  return (UIButton *)objc_getProperty(self, a2, 24, 1);
}

- (void)setSideButtonRight:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (int)type
{
  return self->_type;
}

- (void)setType:(int)a3
{
  self->_type = a3;
}

- (PHSlidingButtonDelegateProtocol)delegate
{
  return (PHSlidingButtonDelegateProtocol *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void)setKnobWidth:(double)a3
{
  self->_knobWidth = a3;
}

- (UIImageView)dialImageView
{
  return (UIImageView *)objc_getProperty(self, a2, 48, 1);
}

- (void)setDialImageView:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (int64_t)callState
{
  return self->_callState;
}

- (NSString)endDialImageName
{
  return self->_endDialImageName;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_endDialImageName, 0);
  objc_storeStrong((id *)&self->_dialImageView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_sideButtonRight, 0);
  objc_storeStrong((id *)&self->_acceptButton, 0);
}

@end

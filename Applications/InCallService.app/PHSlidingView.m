@implementation PHSlidingView

- (PHSlidingView)initWithFrame:(CGRect)a3
{
  PHSlidingView *v3;
  PHSlidingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSlidingView;
  v3 = -[PHSlidingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHSlidingView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  OS_dispatch_queue *v3;
  OS_dispatch_queue *avCaptureDispatchQueue;
  AVCaptureDevice *v5;
  AVCaptureDevice *avCaptureDevice;
  NSOperationQueue *v7;
  NSOperationQueue *motionActivityQueue;
  NSMutableArray *v9;
  NSMutableArray *motionActivityList;
  CMMotionActivityManager *v11;
  CMMotionActivityManager *cmMotionActivityManager;
  PHSlidingButton *v13;
  PHSlidingButton *animatedSlidingButton;
  PHSlidingButton *v15;
  PHSlidingButton *medicalIDSlidingButton;
  PHSlidingButton *v17;
  PHSlidingButton *powerOffSlidingButton;
  UILabel *v19;
  UILabel *descriptionLabel;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  double v25;
  id v26;
  void *v27;
  SBUIShapeView *v28;
  SBUIShapeView *darkeningUnderlayView;
  SBUIShapeView *v30;
  void *v31;
  id v32;
  void *v33;
  SBUIShapeView *v34;
  SBUIShapeView *darkeningOverlayView;
  SBUIShapeView *v36;
  void *v37;
  UILabel *v38;
  UILabel *titleLabel;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  id v44;
  double v45;
  double v46;
  UIView *v47;
  UIView *volumeButtonHighlightView;
  void *v49;
  double v50;
  double v51;
  void *v52;
  uint64_t v53;
  uint64_t v54;
  id v55;
  double v56;
  double v57;
  UIView *v58;
  UIView *lockButtonHighlightView;
  void *v60;
  double v61;
  double v62;
  void *v63;
  uint64_t v64;
  uint64_t v65;
  PHSOSAlertController *v66;
  PHSOSAlertController *alertController;
  void *v68;
  double v69;
  id v70;
  uint64_t v71;
  id v72;
  CGRect v73;
  CGRect v74;

  v72 = objc_alloc_init((Class)SPBeaconManager);
  -[PHSlidingView setBeaconManager:](self, "setBeaconManager:");
  -[PHSlidingView _readIODeviceSupportsFindMy](self, "_readIODeviceSupportsFindMy");
  -[PHSlidingView _readShouldPowerDownViewShowFindMyAlert](self, "_readShouldPowerDownViewShowFindMyAlert");
  v3 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.incallservice.slidingView.avCapture", 0);
  avCaptureDispatchQueue = self->_avCaptureDispatchQueue;
  self->_avCaptureDispatchQueue = v3;

  v5 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithMediaType:](AVCaptureDevice, "defaultDeviceWithMediaType:", AVMediaTypeVideo));
  avCaptureDevice = self->_avCaptureDevice;
  self->_avCaptureDevice = v5;

  if (+[SOSUtilities isMountStateTrackingEnabled](SOSUtilities, "isMountStateTrackingEnabled"))
  {
    v7 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    motionActivityQueue = self->_motionActivityQueue;
    self->_motionActivityQueue = v7;

    v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    motionActivityList = self->_motionActivityList;
    self->_motionActivityList = v9;

    v11 = (CMMotionActivityManager *)objc_alloc_init((Class)CMMotionActivityManager);
    cmMotionActivityManager = self->_cmMotionActivityManager;
    self->_cmMotionActivityManager = v11;

  }
  v13 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 7, 0, 2);
  animatedSlidingButton = self->_animatedSlidingButton;
  self->_animatedSlidingButton = v13;

  -[PHSlidingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_animatedSlidingButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHSlidingButton setDelegate:](self->_animatedSlidingButton, "setDelegate:", self);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_animatedSlidingButton);
  v15 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 9, 0, 2);
  medicalIDSlidingButton = self->_medicalIDSlidingButton;
  self->_medicalIDSlidingButton = v15;

  -[PHSlidingButton setTranslatesAutoresizingMaskIntoConstraints:](self->_medicalIDSlidingButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHSlidingButton setDelegate:](self->_medicalIDSlidingButton, "setDelegate:", self);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_medicalIDSlidingButton);
  v17 = (PHSlidingButton *)objc_claimAutoreleasedReturnValue(-[PHSlidingView _createPowerDownSlider](self, "_createPowerDownSlider"));
  powerOffSlidingButton = self->_powerOffSlidingButton;
  self->_powerOffSlidingButton = v17;

  -[PHSlidingView addSubview:](self, "addSubview:", self->_powerOffSlidingButton);
  v19 = (UILabel *)objc_alloc_init((Class)UILabel);
  descriptionLabel = self->_descriptionLabel;
  self->_descriptionLabel = v19;

  -[UILabel setTextAlignment:](self->_descriptionLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_descriptionLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 15.0));
  -[UILabel setFont:](self->_descriptionLabel, "setFont:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_descriptionLabel, "setTextColor:", v22);

  -[UILabel setNumberOfLines:](self->_descriptionLabel, "setNumberOfLines:", 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL"), &stru_10028DC20, CFSTR("InCallService")));
  -[UILabel setText:](self->_descriptionLabel, "setText:", v24);

  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v25 == 0.0)
    -[UILabel setAlpha:](self->_descriptionLabel, "setAlpha:", 0.0);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_descriptionLabel);
  v26 = objc_alloc((Class)SBUIShapeView);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v27, "bounds");
  v28 = (SBUIShapeView *)objc_msgSend(v26, "initWithFrame:");
  darkeningUnderlayView = self->_darkeningUnderlayView;
  self->_darkeningUnderlayView = v28;

  v30 = self->_darkeningUnderlayView;
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[SBUIShapeView setFillColor:](v30, "setFillColor:", v31);

  -[SBUIShapeView setFillRule:](self->_darkeningUnderlayView, "setFillRule:", 1);
  -[SBUIShapeView setAlpha:](self->_darkeningUnderlayView, "setAlpha:", 0.0);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_darkeningUnderlayView);
  v32 = objc_alloc((Class)SBUIShapeView);
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v33, "bounds");
  v34 = (SBUIShapeView *)objc_msgSend(v32, "initWithFrame:");
  darkeningOverlayView = self->_darkeningOverlayView;
  self->_darkeningOverlayView = v34;

  v36 = self->_darkeningOverlayView;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
  -[SBUIShapeView setBackgroundColor:](v36, "setBackgroundColor:", v37);

  -[SBUIShapeView setAlpha:](self->_darkeningOverlayView, "setAlpha:", 0.0);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_darkeningOverlayView);
  v38 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v38;

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v41);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  v42 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "localizedStringForKey:value:table:", CFSTR("SOS_RELEASE_TO_CALL_LABEL"), &stru_10028DC20, CFSTR("InCallService")));
  -[UILabel setText:](self->_titleLabel, "setText:", v43);

  -[UILabel setAlpha:](self->_titleLabel, "setAlpha:", 0.0);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_titleLabel);
  v44 = objc_alloc((Class)UIView);
  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v46 = v45;
  -[PHSlidingView volumeButtonDimension](self, "volumeButtonDimension");
  v47 = (UIView *)objc_msgSend(v44, "initWithFrame:", 0.0, 0.0, v46, CGRectGetHeight(v73));
  volumeButtonHighlightView = self->_volumeButtonHighlightView;
  self->_volumeButtonHighlightView = v47;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_volumeButtonHighlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v49 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIView setBackgroundColor:](self->_volumeButtonHighlightView, "setBackgroundColor:", v49);

  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v51 = v50 * 0.5;
  v52 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_volumeButtonHighlightView, "layer"));
  objc_msgSend(v52, "setCornerRadius:", v51);

  if ((SBSUIHardwareButtonHintViewsSupported(v53, v54) & 1) == 0)
    -[UIView setAlpha:](self->_volumeButtonHighlightView, "setAlpha:", 0.0);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_volumeButtonHighlightView);
  v55 = objc_alloc((Class)UIView);
  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v57 = v56;
  -[PHSlidingView lockButtonDimension](self, "lockButtonDimension");
  v58 = (UIView *)objc_msgSend(v55, "initWithFrame:", 0.0, 0.0, v57, CGRectGetHeight(v74));
  lockButtonHighlightView = self->_lockButtonHighlightView;
  self->_lockButtonHighlightView = v58;

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_lockButtonHighlightView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v60 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  -[UIView setBackgroundColor:](self->_lockButtonHighlightView, "setBackgroundColor:", v60);

  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v62 = v61 * 0.5;
  v63 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_lockButtonHighlightView, "layer"));
  objc_msgSend(v63, "setCornerRadius:", v62);

  if ((SBSUIHardwareButtonHintViewsSupported(v64, v65) & 1) == 0)
    -[UIView setAlpha:](self->_lockButtonHighlightView, "setAlpha:", 0.0);
  -[PHSlidingView addSubview:](self, "addSubview:", self->_lockButtonHighlightView);
  v66 = objc_alloc_init(PHSOSAlertController);
  alertController = self->_alertController;
  self->_alertController = v66;

  v68 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v68, "timeIntervalSince1970");
  self->_sliderViewCreationTime = v69;

  -[PHSlidingView setUpConstraints](self, "setUpConstraints");
  v70 = -[PHSlidingView clearMetricItems](self, "clearMetricItems");
  if (SBSUIHardwareButtonHintViewsSupported(v70, v71))
  {
    -[UIView setHidden:](self->_lockButtonHighlightView, "setHidden:", 1);
    -[UIView setHidden:](self->_volumeButtonHighlightView, "setHidden:", 1);
  }

}

- (void)createHintView
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "currentSOSButtonPressState"));

  if (objc_msgSend(v13, "volumeUpPressed") && !objc_msgSend(v13, "volumeDownPressed"))
  {
    v4 = 3;
  }
  else if ((objc_msgSend(v13, "volumeUpPressed") & 1) != 0
         || (objc_msgSend(v13, "volumeDownPressed") & 1) == 0)
  {
    if (!objc_msgSend(v13, "volumeUpPressed") || !objc_msgSend(v13, "volumeDownPressed"))
      goto LABEL_13;
    v4 = 10;
  }
  else
  {
    v4 = 4;
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHintViewVisibilityControlling](self, "volumeButtonHintViewVisibilityControlling"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHintViewVisibilityControlling](self, "volumeButtonHintViewVisibilityControlling"));
    objc_msgSend(v6, "invalidate");

  }
  v7 = SBSUIRegisterHardwareButtonHintView(self->_volumeButtonHighlightView, v4);
  v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
  -[PHSlidingView setVolumeButtonHintViewVisibilityControlling:](self, "setVolumeButtonHintViewVisibilityControlling:", v8);

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHintViewVisibilityControlling](self, "volumeButtonHintViewVisibilityControlling"));
  objc_msgSend(v9, "setContentVisibility:animationSettings:", 1, 0);

LABEL_13:
  v10 = SBSUIRegisterHardwareButtonHintView(self->_lockButtonHighlightView, 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  -[PHSlidingView setSideButtonHintViewVisibilityControlling:](self, "setSideButtonHintViewVisibilityControlling:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sideButtonHintViewVisibilityControlling](self, "sideButtonHintViewVisibilityControlling"));
  objc_msgSend(v12, "setContentVisibility:animationSettings:", 1, 0);

}

- (void)hideHardwareButtonView
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  if ((SBSUIHardwareButtonHintViewsSupported(self, a2) & 1) != 0)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sideButtonHintViewVisibilityControlling](self, "sideButtonHintViewVisibilityControlling"));
    objc_msgSend(v3, "invalidate");

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHintViewVisibilityControlling](self, "volumeButtonHintViewVisibilityControlling"));
    objc_msgSend(v4, "invalidate");

    -[UIView setHidden:](self->_lockButtonHighlightView, "setHidden:", 1);
    -[UIView setHidden:](self->_volumeButtonHighlightView, "setHidden:", 1);
  }
  else
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightView](self, "volumeButtonHighlightView"));
    objc_msgSend(v5, "setAlpha:", 0.0);

    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView lockButtonHighlightView](self, "lockButtonHighlightView"));
    objc_msgSend(v6, "setAlpha:", 0.0);

  }
}

- (void)showHardwareButtonView
{
  void *v3;
  id v4;

  if ((SBSUIHardwareButtonHintViewsSupported(self, a2) & 1) != 0)
  {
    -[PHSlidingView createHintView](self, "createHintView");
    -[UIView setHidden:](self->_lockButtonHighlightView, "setHidden:", 0);
    -[UIView setHidden:](self->_volumeButtonHighlightView, "setHidden:", 0);
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightView](self, "volumeButtonHighlightView"));
    objc_msgSend(v3, "setAlpha:", 1.0);

    v4 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView lockButtonHighlightView](self, "lockButtonHighlightView"));
    objc_msgSend(v4, "setAlpha:", 1.0);

  }
}

- (void)setSlidingViewState:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  unint64_t slidingViewState;
  double v8;
  _BOOL4 v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;
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
  CGFloat x;
  double y;
  CGFloat width;
  CGFloat height;
  double v32;
  void *v33;
  double v34;
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
  CGFloat v47;
  double v48;
  CGFloat v49;
  CGFloat v50;
  double v51;
  void *v52;
  double v53;
  uint64_t v54;
  void *v55;
  void (**v56)(_QWORD, _QWORD);
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
  BOOL v68;
  void (**v69)(_QWORD, _QWORD);
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
  void *v84;
  double v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  double v92;
  void *v93;
  void **v94;
  uint64_t v95;
  void (*v96)(uint64_t);
  void *v97;
  id v98;
  _QWORD v99[4];
  id v100;
  uint8_t buf[4];
  unint64_t v102;
  CGRect v103;
  CGRect v104;
  CGRect v105;
  CGRect v106;

  if (self->_slidingViewState != a3)
  {
    self->_slidingViewState = a3;
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      slidingViewState = self->_slidingViewState;
      *(_DWORD *)buf = 134217984;
      v102 = slidingViewState;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSlidingView,slidingViewState:%lu", buf, 0xCu);
    }

    switch(a3)
    {
      case 0uLL:
        +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
        v9 = v8 != 0.0;
        v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        v11 = v10;
        if (v9)
        {
          objc_msgSend(v10, "setAlpha:", 1.0);

          v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL"), &stru_10028DC20, CFSTR("InCallService")));
          objc_msgSend(v11, "setText:", v13);

        }
        else
        {
          objc_msgSend(v10, "setAlpha:", 0.0);
        }

        v80 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        objc_msgSend(v80, "setAlpha:", 0.0);

        v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
        objc_msgSend(v81, "setAlpha:", 1.0);

        if (-[PHSlidingView hasTwoMiddleSliders](self, "hasTwoMiddleSliders"))
        {
          v82 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
          objc_msgSend(v82, "setAlpha:", 1.0);

        }
        -[PHSlidingView updateMiddleViewSliderConstraintConstants](self, "updateMiddleViewSliderConstraintConstants");
        v83 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
        objc_msgSend(v83, "setAlpha:", 1.0);

        if (-[PHSlidingView deviceSupportsFindMy](self, "deviceSupportsFindMy"))
        {
          v84 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
          objc_msgSend(v84, "setAlpha:", 1.0);

        }
        goto LABEL_29;
      case 1uLL:
        v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        objc_msgSend(v14, "setAlpha:", 0.0);

        v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        objc_msgSend(v15, "setAlpha:", 0.0);

        v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
        objc_msgSend(v16, "setAlpha:", 1.0);

        +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
        if (v17 != 0.0)
        {
          v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
          objc_msgSend(v18, "setAlpha:", 0.0);

          v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
          objc_msgSend(v19, "setAlpha:", 0.0);

          if (-[PHSlidingView deviceSupportsFindMy](self, "deviceSupportsFindMy"))
          {
            v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
            objc_msgSend(v20, "setAlpha:", 0.0);

          }
          v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
          objc_msgSend(v21, "setAlpha:", 1.0);

          v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("SOS_HOLDING_LABEL"), &stru_10028DC20, CFSTR("InCallService")));
          objc_msgSend(v22, "setText:", v24);

          v25 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
          v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
          objc_msgSend(v26, "setTextColor:", v25);

          v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
          objc_msgSend(v27, "setAlpha:", 0.0);

          -[PHSlidingView showHardwareButtonView](self, "showHardwareButtonView");
          -[PHSlidingView volumeButtonDimension](self, "volumeButtonDimension");
          x = v103.origin.x;
          y = v103.origin.y;
          width = v103.size.width;
          height = v103.size.height;
          v32 = CGRectGetHeight(v103);
          v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightViewCenterYConstraint](self, "volumeButtonHighlightViewCenterYConstraint"));
          objc_msgSend(v33, "setConstant:", y + v32 * 0.5);

          v104.origin.x = x;
          v104.origin.y = y;
          v104.size.width = width;
          v104.size.height = height;
          v34 = CGRectGetHeight(v104);
          v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightViewHeightConstraint](self, "volumeButtonHighlightViewHeightConstraint"));
          objc_msgSend(v35, "setConstant:", v34);

        }
        break;
      case 2uLL:
        -[PHSlidingView setReleaseToCallStartTime:](self, "setReleaseToCallStartTime:", CFAbsoluteTimeGetCurrent());
        v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        objc_msgSend(v36, "setAlpha:", 0.0);

        v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        objc_msgSend(v37, "setAlpha:", 1.0);

        v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "localizedStringForKey:value:table:", CFSTR("SOS_RELEASE_TO_CALL_LABEL"), &stru_10028DC20, CFSTR("InCallService")));
        objc_msgSend(v38, "setText:", v40);

        v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
        v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        objc_msgSend(v42, "setTextColor:", v41);

        v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
        objc_msgSend(v43, "setAlpha:", 0.0);

        v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
        objc_msgSend(v44, "setAlpha:", 0.0);

        v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
        objc_msgSend(v45, "setAlpha:", 0.0);

        if (-[PHSlidingView deviceSupportsFindMy](self, "deviceSupportsFindMy"))
        {
          v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
          objc_msgSend(v46, "setAlpha:", 0.0);

        }
        -[PHSlidingView showHardwareButtonView](self, "showHardwareButtonView");
        -[PHSlidingView volumeButtonDimension](self, "volumeButtonDimension");
        v47 = v105.origin.x;
        v48 = v105.origin.y;
        v49 = v105.size.width;
        v50 = v105.size.height;
        v51 = CGRectGetHeight(v105);
        v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightViewCenterYConstraint](self, "volumeButtonHighlightViewCenterYConstraint"));
        objc_msgSend(v52, "setConstant:", v48 + v51 * 0.5);

        v106.origin.x = v47;
        v106.origin.y = v48;
        v106.size.width = v49;
        v106.size.height = v50;
        v53 = CGRectGetHeight(v106);
        v54 = objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightViewHeightConstraint](self, "volumeButtonHighlightViewHeightConstraint"));
        objc_msgSend((id)v54, "setConstant:", v53);

        v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView shouldMaxVolumeCompletionBlock](self, "shouldMaxVolumeCompletionBlock"));
        LOBYTE(v54) = v55 == 0;

        if ((v54 & 1) == 0)
        {
          v56 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHSlidingView shouldMaxVolumeCompletionBlock](self, "shouldMaxVolumeCompletionBlock"));
          v56[2](v56, 1);

        }
        -[PHSlidingView startVoiceLoopMessagePlaybackWithMessageType:](self, "startVoiceLoopMessagePlaybackWithMessageType:", 102);
        v57 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallVoiceLoopTimer](self, "releaseToCallVoiceLoopTimer"));
        if (v57)
        {

        }
        else
        {
          +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
          if (v85 > 0.0)
          {
            objc_initWeak((id *)buf, self);
            v99[0] = _NSConcreteStackBlock;
            v99[1] = 3221225472;
            v99[2] = sub_100067894;
            v99[3] = &unk_100284DC8;
            objc_copyWeak(&v100, (id *)buf);
            v86 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v99, 3.0));
            -[PHSlidingView setReleaseToCallVoiceLoopTimer:](self, "setReleaseToCallVoiceLoopTimer:", v86);

            v87 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallVoiceLoopTimer](self, "releaseToCallVoiceLoopTimer"));
            v88 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "fireDate"));
            v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "dateByAddingTimeInterval:", 1.0));
            v90 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallVoiceLoopTimer](self, "releaseToCallVoiceLoopTimer"));
            objc_msgSend(v90, "setFireDate:", v89);

            objc_destroyWeak(&v100);
            objc_destroyWeak((id *)buf);
          }
        }
        v91 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallTimer](self, "releaseToCallTimer"));
        if (v91)
        {

        }
        else
        {
          +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
          if (v92 > 0.0)
          {
            objc_initWeak((id *)buf, self);
            v94 = _NSConcreteStackBlock;
            v95 = 3221225472;
            v96 = sub_1000678C8;
            v97 = &unk_100284DC8;
            objc_copyWeak(&v98, (id *)buf);
            v93 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v94, 10.0));
            -[PHSlidingView setReleaseToCallTimer:](self, "setReleaseToCallTimer:", v93, v94, v95, v96, v97);

            objc_destroyWeak(&v98);
            objc_destroyWeak((id *)buf);
          }
        }
        break;
      case 3uLL:
        -[PHSlidingView resetAnimatedSlider](self, "resetAnimatedSlider");
        v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        objc_msgSend(v58, "setAlpha:", 0.0);

        v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        objc_msgSend(v59, "setAlpha:", 1.0);

        v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        v61 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "localizedStringForKey:value:table:", CFSTR("SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL"), &stru_10028DC20, CFSTR("InCallService")));
        objc_msgSend(v60, "setText:", v62);

        v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
        objc_msgSend(v63, "setAlpha:", 1.0);

        if (-[PHSlidingView hasTwoMiddleSliders](self, "hasTwoMiddleSliders"))
        {
          v64 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
          objc_msgSend(v64, "setAlpha:", 1.0);

        }
        -[PHSlidingView updateMiddleViewSliderConstraintConstants](self, "updateMiddleViewSliderConstraintConstants");
        v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
        objc_msgSend(v65, "setAlpha:", 1.0);

        if (-[PHSlidingView deviceSupportsFindMy](self, "deviceSupportsFindMy"))
        {
          v66 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
          objc_msgSend(v66, "setAlpha:", 1.0);

        }
        -[PHSlidingView hideHardwareButtonView](self, "hideHardwareButtonView");
        -[PHSlidingView stopVoiceLoopMessagePlayback](self, "stopVoiceLoopMessagePlayback");
        v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView shouldMaxVolumeCompletionBlock](self, "shouldMaxVolumeCompletionBlock"));
        v68 = v67 == 0;

        if (!v68)
        {
          v69 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHSlidingView shouldMaxVolumeCompletionBlock](self, "shouldMaxVolumeCompletionBlock"));
          v69[2](v69, 0);

        }
        -[PHSlidingView clearReleaseToCallVoiceLoopTimer](self, "clearReleaseToCallVoiceLoopTimer");
        v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallTimer](self, "releaseToCallTimer"));
        objc_msgSend(v70, "invalidate");

        -[PHSlidingView setReleaseToCallTimer:](self, "setReleaseToCallTimer:", 0);
        break;
      case 5uLL:
        -[PHSlidingView resetAnimatedSlider](self, "resetAnimatedSlider");
        v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
        objc_msgSend(v71, "setAlpha:", 0.0);

        v72 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        objc_msgSend(v72, "setAlpha:", 1.0);

        v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
        v74 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "localizedStringForKey:value:table:", CFSTR("SOS_RELEASE_TO_CALL_SUBTITLE_INITIAL"), &stru_10028DC20, CFSTR("InCallService")));
        objc_msgSend(v73, "setText:", v75);

        v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
        objc_msgSend(v76, "setAlpha:", 1.0);

        if (-[PHSlidingView hasTwoMiddleSliders](self, "hasTwoMiddleSliders"))
        {
          v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
          objc_msgSend(v77, "setAlpha:", 1.0);

        }
        -[PHSlidingView updateMiddleViewSliderConstraintConstants](self, "updateMiddleViewSliderConstraintConstants");
        v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
        objc_msgSend(v78, "setAlpha:", 1.0);

        if (-[PHSlidingView deviceSupportsFindMy](self, "deviceSupportsFindMy"))
        {
          v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
          objc_msgSend(v79, "setAlpha:", 1.0);

        }
LABEL_29:
        -[PHSlidingView hideHardwareButtonView](self, "hideHardwareButtonView");
        break;
      default:
        return;
    }
  }
}

- (double)sliderButtonWidth
{
  int v2;
  double result;

  v2 = SBSUIHardwareButtonHintViewsSupported(self, a2);
  result = 25.0;
  if (v2)
    return 5.0;
  return result;
}

- (id)_createPowerDownSlider
{
  PHSlidingButton *v3;
  void *v4;

  v3 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 8, 1, 2);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  -[PHSlidingButton setTintColor:](v3, "setTintColor:", v4);

  -[PHSlidingButton setTranslatesAutoresizingMaskIntoConstraints:](v3, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHSlidingButton setDelegate:](v3, "setDelegate:", self);
  return v3;
}

- (void)createPowerDownConstraints
{
  void *v3;
  void *v4;
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
  id v17;

  v17 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerXAnchor](self, "centerXAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v17, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "topAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:constant:", v10, 52.0));
  objc_msgSend(v17, "addObject:", v11);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
  if (v12)
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView findMyButton](self, "findMyButton"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton bottomAnchor](self->_powerOffSlidingButton, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:constant:", v15, 4.0));
    objc_msgSend(v17, "addObject:", v16);

  }
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v17);

}

- (void)createFindMyUI
{
  uint64_t v3;
  void *v4;
  void *v5;
  id v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
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
  id v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  _QWORD v42[5];

  v3 = objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:weight:](UIImageSymbolConfiguration, "configurationWithPointSize:weight:", 4, 13.0));
  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGrayColor](UIColor, "systemGrayColor"));
  v40 = (void *)v3;
  v41 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage _systemImageNamed:withConfiguration:](UIImage, "_systemImageNamed:withConfiguration:", CFSTR("location.fill.radiowaves.left.and.right"), v3));
  v39 = (void *)objc_claimAutoreleasedReturnValue(+[NSTextAttachment textAttachmentWithImage:](NSTextAttachment, "textAttachmentWithImage:", v41));
  v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v39));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("chevron.right"), v3));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "imageFlippedForRightToLeftLayoutDirection"));

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSTextAttachment textAttachmentWithImage:](NSTextAttachment, "textAttachmentWithImage:", v38));
  v33 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v37));
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("POWER_DOWN_FIND_MY_ACTIVE"), &stru_10028DC20, CFSTR("InCallService")));

  v34 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", v36);
  v6 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:", CFSTR(" "));
  v7 = objc_alloc_init((Class)NSMutableAttributedString);
  objc_msgSend(v7, "appendAttributedString:", v35);
  objc_msgSend(v7, "appendAttributedString:", v6);
  objc_msgSend(v7, "appendAttributedString:", v34);
  objc_msgSend(v7, "appendAttributedString:", v6);
  objc_msgSend(v7, "appendAttributedString:", v33);
  v8 = objc_msgSend(v7, "length");
  v31 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 13.0));
  objc_msgSend(v7, "addAttribute:value:range:", NSFontAttributeName, v31, 0, v8);
  objc_msgSend(v7, "addAttribute:value:range:", NSForegroundColorAttributeName, v32, 0, v8);
  v9 = objc_msgSend(objc_alloc((Class)UIButton), "initWithFrame:", CGRectZero.origin.x, CGRectZero.origin.y, CGRectZero.size.width, CGRectZero.size.height);
  -[PHSlidingView setFindMyButton:](self, "setFindMyButton:", v9);
  objc_msgSend(v9, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  objc_msgSend(v9, "setAlpha:", 0.0);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  objc_msgSend(v9, "setBackgroundColor:", v10);

  objc_msgSend(v9, "setAttributedTitle:forState:", v7, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
  objc_msgSend(v11, "setNumberOfLines:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
  objc_msgSend(v12, "setTextAlignment:", 1);

  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "titleLabel"));
  objc_msgSend(v13, "setLineBreakMode:", 0);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView delegate](self, "delegate"));
  objc_msgSend(v9, "addTarget:action:forControlEvents:", v14, "didTapFindMy", 64);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  -[PHSlidingView insertSubview:above:](self, "insertSubview:above:", v9, v15);

  v16 = objc_alloc_init((Class)NSMutableArray);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerXAnchor](self, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v16, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView leadingAnchor](self, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintGreaterThanOrEqualToAnchor:constant:", v21, 20.0));

  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView trailingAnchor](self, "trailingAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintLessThanOrEqualToAnchor:constant:", v24, 20.0));

  objc_msgSend(v16, "addObject:", v22);
  objc_msgSend(v16, "addObject:", v25);
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingButton bottomAnchor](self->_powerOffSlidingButton, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v27, 4.0));
  objc_msgSend(v16, "addObject:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "heightAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintGreaterThanOrEqualToConstant:", 40.0));
  objc_msgSend(v16, "addObject:", v30);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v16);
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_100068108;
  v42[3] = &unk_100284898;
  v42[4] = self;
  +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v42, 0);

}

- (void)didSuppressFindMy
{
  -[PHSlidingView setUserWantsFindMySuppressed:](self, "setUserWantsFindMySuppressed:", 1);
  -[UIButton setAlpha:](self->_findMyButton, "setAlpha:", 0.0);
}

- (void)didAcknowledgeFindMyInfo
{
  -[PHSlidingView setShouldPowerDownViewShowFindMyAlert:](self, "setShouldPowerDownViewShowFindMyAlert:", 0);
}

- (void)_readIODeviceSupportsFindMy
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView beaconManager](self, "beaconManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100068220;
  v4[3] = &unk_100284F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "isLPEMModeSupported:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)_readShouldPowerDownViewShowFindMyAlert
{
  void *v3;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView beaconManager](self, "beaconManager"));
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_10006839C;
  v4[3] = &unk_100284F60;
  objc_copyWeak(&v5, &location);
  objc_msgSend(v3, "userHasAcknowledgeFindMyWithCompletion:", v4);

  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)layoutSubviews
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)PHSlidingView;
  -[PHSlidingView layoutSubviews](&v3, "layoutSubviews");
  -[PHSlidingView updateMiddleViewSliderConstraintConstants](self, "updateMiddleViewSliderConstraintConstants");
  -[PHSlidingView _updatePowerOffSliderExclusionPath](self, "_updatePowerOffSliderExclusionPath");
}

- (void)setAnimatedSliderCompletion:(id)a3
{
  id v4;
  id animatedSlidingButtonCompletionBlock;

  v4 = objc_retainBlock(a3);
  animatedSlidingButtonCompletionBlock = self->_animatedSlidingButtonCompletionBlock;
  self->_animatedSlidingButtonCompletionBlock = v4;

  -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 0);
  -[PHSlidingView updateMiddleViewSliderConstraintConstants](self, "updateMiddleViewSliderConstraintConstants");
}

- (void)setMedicalIDSlidingButtonCompletionBlock:(id)a3
{
  id v4;
  id medicalIDSlidingButtonCompletionBlock;
  id v6;
  double v7;
  void *v8;

  v4 = objc_retainBlock(a3);
  medicalIDSlidingButtonCompletionBlock = self->_medicalIDSlidingButtonCompletionBlock;
  self->_medicalIDSlidingButtonCompletionBlock = v4;

  v6 = self->_medicalIDSlidingButtonCompletionBlock;
  if (v6)
    v7 = 1.0;
  else
    v7 = 0.0;
  -[PHSlidingView setHasTwoMiddleSliders:](self, "setHasTwoMiddleSliders:", v6 != 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v8, "setAlpha:", v7);

  -[PHSlidingView updateMiddleViewSliderConstraintConstants](self, "updateMiddleViewSliderConstraintConstants");
}

- (void)interactiveStartWithCountdownModel:(id)a3
{
  id v4;
  id v5;
  NSObject *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  id v16;
  NSObject *v17;
  void *v18;
  void **v19;
  uint64_t v20;
  void (*v21)(uint64_t);
  void *v22;
  id v23;
  id v24;
  uint8_t buf[4];
  double v26;

  v4 = a3;
  if (-[PHSlidingView slidingViewState](self, "slidingViewState"))
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      LODWORD(v26) = -[PHSlidingView slidingViewState](self, "slidingViewState");
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSlidingView,ignoring interactive start in state %d", buf, 8u);
    }

    goto LABEL_13;
  }
  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  v8 = v7;
  -[PHSlidingView clearMetricItems](self, "clearMetricItems");
  if (v8 <= 0.0)
  {
LABEL_12:
    -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 1);
    -[PHSlidingView startMotionStateTracking](self, "startMotionStateTracking");
    -[PHSlidingView repeatingUpdateAnimatedSliderForCountdownNumber:forModel:](self, "repeatingUpdateAnimatedSliderForCountdownNumber:forModel:", objc_msgSend(v4, "countdown"), v4);
    goto LABEL_13;
  }
  -[PHSlidingView clearClawHoldInitialTimer](self, "clearClawHoldInitialTimer");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSDate date](NSDate, "date"));
  objc_msgSend(v9, "timeIntervalSince1970");
  v11 = v10;
  -[PHSlidingView sliderViewCreationTime](self, "sliderViewCreationTime");
  v13 = v12;

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView clawHoldInitialTimer](self, "clawHoldInitialTimer"));
  if (v14 || (v15 = v13 - v11 + 1.5, v15 <= 0.0))
  {
    -[PHSlidingView clearMetricItems](self, "clearMetricItems");
    goto LABEL_12;
  }
  v16 = sub_1000C5588();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PHSlidingView,interactiveStartWithCountdownModel,wait for %f seconds before moving to slider progressing state", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v19 = _NSConcreteStackBlock;
  v20 = 3221225472;
  v21 = sub_1000687E8;
  v22 = &unk_1002861D0;
  objc_copyWeak(&v24, (id *)buf);
  v23 = v4;
  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 0, &v19, v15));
  -[PHSlidingView setClawHoldInitialTimer:](self, "setClawHoldInitialTimer:", v18, v19, v20, v21, v22);

  objc_destroyWeak(&v24);
  objc_destroyWeak((id *)buf);
LABEL_13:

}

- (void)interactiveStop:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;
  double Current;
  double v15;
  void *v16;
  void *v17;
  void (**v18)(double);

  v18 = (void (**)(double))a3;
  if (+[SOSUtilities isMountStateTrackingEnabled](SOSUtilities, "isMountStateTrackingEnabled"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView cmMotionActivityManager](self, "cmMotionActivityManager"));

    if (v4)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView cmMotionActivityManager](self, "cmMotionActivityManager"));
      objc_msgSend(v5, "stopPeriodicActivityUpdates");

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList"));
      objc_msgSend(v6, "removeAllObjects");

    }
  }
  if (-[PHSlidingView slidingViewState](self, "slidingViewState"))
  {
    if ((id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "acceptButton"));
      objc_msgSend(v8, "knobPosition");
      v10 = v9;

      -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 0);
      +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
      if (v11 != 0.0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView clawHoldInitialTimer](self, "clawHoldInitialTimer"));
        objc_msgSend(v12, "invalidate");

        -[PHSlidingView setClawHoldInitialTimer:](self, "setClawHoldInitialTimer:", 0);
      }
      -[PHSlidingView invalidateCountdownAndStopSounds](self, "invalidateCountdownAndStopSounds");
      -[PHSlidingView resetAnimatedSlider](self, "resetAnimatedSlider");
      -[PHSlidingView stopFlash](self, "stopFlash");
      v18[2](v10);
    }
    else if ((id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)2)
    {
      -[PHSlidingView releaseToCallStartTime](self, "releaseToCallStartTime");
      if (v13 >= 0.0)
      {
        Current = CFAbsoluteTimeGetCurrent();
        -[PHSlidingView releaseToCallStartTime](self, "releaseToCallStartTime");
        -[PHSlidingView setTimeToReleaseClaw:](self, "setTimeToReleaseClaw:", vcvtpd_s64_f64(vabdd_f64(Current, v15)));
      }
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView clawHoldInitialTimer](self, "clawHoldInitialTimer"));
      objc_msgSend(v16, "invalidate");

      -[PHSlidingView setClawHoldInitialTimer:](self, "setClawHoldInitialTimer:", 0);
      -[PHSlidingView clearReleaseToCallState](self, "clearReleaseToCallState");
      -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 4);
      -[PHSlidingView didFinishSOSSliding:](self, "didFinishSOSSliding:", 4);
    }
    else if ((id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)3
           || (id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)5)
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView clawHoldInitialTimer](self, "clawHoldInitialTimer"));
      objc_msgSend(v17, "invalidate");

      -[PHSlidingView setClawHoldInitialTimer:](self, "setClawHoldInitialTimer:", 0);
      -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 0);
    }
  }
  else
  {
    -[PHSlidingView clearClawHoldInitialTimer](self, "clearClawHoldInitialTimer");
  }

}

- (void)clearClawHoldInitialTimer
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView clawHoldInitialTimer](self, "clawHoldInitialTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating clawHoldInitialTimer", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView clawHoldInitialTimer](self, "clawHoldInitialTimer"));
    objc_msgSend(v7, "invalidate");

    -[PHSlidingView setClawHoldInitialTimer:](self, "setClawHoldInitialTimer:", 0);
  }
}

- (void)startMotionStateTracking
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  id buf[2];

  if (+[SOSUtilities isMountStateTrackingEnabled](SOSUtilities, "isMountStateTrackingEnabled"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView cmMotionActivityManager](self, "cmMotionActivityManager"));

    if (v3)
    {
      v4 = sub_1000C5588();
      v5 = objc_claimAutoreleasedReturnValue(v4);
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSlidingView,CMMotionActivity,about to call startPeriodicActivityUpdatesToQueue", (uint8_t *)buf, 2u);
      }

      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList"));
      objc_msgSend(v6, "removeAllObjects");

      objc_initWeak(buf, self);
      v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView cmMotionActivityManager](self, "cmMotionActivityManager"));
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityQueue](self, "motionActivityQueue"));
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_100068C98;
      v9[3] = &unk_1002861F8;
      objc_copyWeak(&v10, buf);
      objc_msgSend(v7, "startPeriodicActivityUpdatesToQueue:withHandler:", v8, v9);

      objc_destroyWeak(&v10);
      objc_destroyWeak(buf);
    }
  }
}

- (void)invalidateCountdownAndStopSounds
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView interactivelyAnimateSlidingButtonBlock](self, "interactivelyAnimateSlidingButtonBlock"));

  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView interactivelyAnimateSlidingButtonBlock](self, "interactivelyAnimateSlidingButtonBlock"));
    dispatch_block_cancel(v4);

    -[PHSlidingView setInteractivelyAnimateSlidingButtonBlock:](self, "setInteractivelyAnimateSlidingButtonBlock:", 0);
  }
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderTimingBlock](self, "sliderTimingBlock"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderTimingBlock](self, "sliderTimingBlock"));
    dispatch_block_cancel(v6);

    -[PHSlidingView setSliderTimingBlock:](self, "setSliderTimingBlock:", 0);
  }
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderAnimator](self, "sliderAnimator"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderAnimator](self, "sliderAnimator"));
    objc_msgSend(v8, "stopAnimation:", 1);

  }
  v9 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView alertController](self, "alertController"));
  objc_msgSend(v9, "stopAlert");

}

- (void)repeatingUpdateAnimatedSliderForCountdownNumber:(unint64_t)a3 forModel:(id)a4
{
  id v6;
  BOOL v7;
  id v8;
  id v9;
  id v10;
  _QWORD *v11;
  _QWORD *v12;
  _QWORD *v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  id v18;
  dispatch_block_t v19;
  dispatch_time_t v20;
  void *v21;
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;
  _QWORD *v25;
  unint64_t v26;
  _QWORD v27[5];
  id v28;
  BOOL v29;

  v6 = a4;
  v7 = (unint64_t)objc_msgSend(v6, "countdownWithAudio") < a3;
  v8 = objc_msgSend(v6, "countdown");
  v27[0] = _NSConcreteStackBlock;
  v27[1] = 3221225472;
  v27[2] = sub_100069224;
  v27[3] = &unk_100286220;
  v27[4] = self;
  v29 = v7;
  v9 = v6;
  v28 = v9;
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_1000692F0;
  v23[3] = &unk_100286270;
  v23[4] = self;
  v25 = objc_retainBlock(v27);
  v26 = a3;
  v10 = v9;
  v24 = v10;
  v11 = v25;
  v12 = objc_retainBlock(v23);
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_1000693C4;
  v22[3] = &unk_100284898;
  v22[4] = self;
  v13 = objc_retainBlock(v22);
  if ((id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)1)
  {
    objc_msgSend(v10, "countdownTickDuration");
    v15 = 0.200000003;
    if (v8 != (id)a3)
      v15 = 0.0;
    if (a3)
      v16 = v12;
    else
      v16 = v13;
    if (a3)
      v17 = v15 + v14 + -0.25 + -0.280999988;
    else
      v17 = v14;
    v18 = objc_retainBlock(v16);
    v19 = dispatch_block_create((dispatch_block_flags_t)0, v18);
    -[PHSlidingView setSliderTimingBlock:](self, "setSliderTimingBlock:", v19);

    v20 = dispatch_time(0, (uint64_t)(v17 * *(double *)""));
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderTimingBlock](self, "sliderTimingBlock"));
    dispatch_after(v20, (dispatch_queue_t)&_dispatch_main_q, v21);

  }
}

- (void)updateAnimatedSliderForCountdownNumber:(unint64_t)a3 forTotalCount:(unint64_t)a4 afterDelay:(double)a5 completion:(id)a6
{
  id v10;
  id v11;
  dispatch_block_t v12;
  dispatch_time_t v13;
  id v14;
  void *v15;
  _QWORD block[4];
  id v17;
  id v18[3];
  id location;

  v10 = a6;
  objc_initWeak(&location, self);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100069688;
  block[3] = &unk_100286298;
  objc_copyWeak(v18, &location);
  v18[1] = (id)a3;
  v18[2] = (id)a4;
  v11 = v10;
  v17 = v11;
  v12 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[PHSlidingView setInteractivelyAnimateSlidingButtonBlock:](self, "setInteractivelyAnimateSlidingButtonBlock:", v12);

  v13 = dispatch_time(0, (uint64_t)(a5 * *(double *)""));
  v14 = &_dispatch_main_q;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView interactivelyAnimateSlidingButtonBlock](self, "interactivelyAnimateSlidingButtonBlock"));
  dispatch_after(v13, (dispatch_queue_t)&_dispatch_main_q, v15);

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);

}

- (void)updateAnimatedSliderForCountdownNumber:(unint64_t)a3 forTotalCount:(double)a4 completion:(id)a5
{
  id v8;
  _QWORD *v9;
  id v10;
  void *v11;
  void *v12;
  _QWORD v13[7];

  v8 = a5;
  if ((id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)1)
  {
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1000697E4;
    v13[3] = &unk_1002862C0;
    v13[4] = self;
    v13[5] = a3;
    *(double *)&v13[6] = a4;
    v9 = objc_retainBlock(v13);
    v10 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:controlPoint1:controlPoint2:animations:", v9, 0.25, 0.25, 0.1, 0.25, 1.0);
    -[PHSlidingView setSliderAnimator:](self, "setSliderAnimator:", v10);

    if (v8)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderAnimator](self, "sliderAnimator"));
      objc_msgSend(v11, "addCompletion:", v8);

    }
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView sliderAnimator](self, "sliderAnimator"));
    objc_msgSend(v12, "startAnimation");

  }
}

- (void)resetAnimatedSlider
{
  _QWORD *v2;
  id v3;
  _QWORD v4[5];

  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_100069944;
  v4[3] = &unk_100284898;
  v4[4] = self;
  v2 = objc_retainBlock(v4);
  v3 = objc_msgSend(objc_alloc((Class)UIViewPropertyAnimator), "initWithDuration:controlPoint1:controlPoint2:animations:", v2, 0.25, 0.25, 0.1, 0.25, 1.0);
  objc_msgSend(v3, "startAnimation");

}

- (void)setUpConstraints
{
  void *v3;
  void *v4;
  void *v5;
  NSLayoutConstraint *v6;
  NSLayoutConstraint *medicalIDSliderBottomConstraint;
  void *v8;
  void *v9;
  void *v10;
  NSLayoutConstraint *v11;
  NSLayoutConstraint *animatedSliderTopConstraint;
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
  double v35;
  void *v36;
  void *v37;
  void *v38;
  double v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  CGFloat v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  NSLayoutConstraint *v59;
  NSLayoutConstraint *volumeButtonHighlightViewCenterYConstraint;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  id v65;
  NSLayoutConstraint *v66;
  NSLayoutConstraint *volumeButtonHighlightViewHeightConstraint;
  CGFloat v68;
  CGFloat v69;
  CGFloat v70;
  CGFloat v71;
  CGFloat v72;
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
  id v83;
  void *v84;
  NSLayoutConstraint *v85;
  NSLayoutConstraint *v86;
  NSLayoutConstraint *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  _QWORD v103[20];
  CGRect v104;
  CGRect v105;
  CGRect v106;
  CGRect v107;

  -[PHSlidingView createPowerDownConstraints](self, "createPowerDownConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "bottomAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerYAnchor](self, "centerYAnchor"));
  -[PHSlidingView medicalIDSliderBottomConstraintConstant](self, "medicalIDSliderBottomConstraintConstant");
  v6 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:constant:", v5));
  medicalIDSliderBottomConstraint = self->_medicalIDSliderBottomConstraint;
  self->_medicalIDSliderBottomConstraint = v6;

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "topAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerYAnchor](self, "centerYAnchor"));
  -[PHSlidingView animatedSliderTopConstraintConstant](self, "animatedSliderTopConstraintConstant");
  v11 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "constraintEqualToAnchor:constant:", v10));
  animatedSliderTopConstraint = self->_animatedSliderTopConstraint;
  self->_animatedSliderTopConstraint = v11;

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerXAnchor](self, "centerXAnchor"));
  v102 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerXAnchor](self, "centerXAnchor"));
  v101 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "leadingAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView leadingAnchor](self, "leadingAnchor"));
  v100 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v21));

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "trailingAnchor"));
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView trailingAnchor](self, "trailingAnchor"));
  v99 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "constraintEqualToAnchor:", v24));

  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "topAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "bottomAnchor"));
  v98 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "constraintEqualToAnchor:constant:", v28, 15.0));

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView descriptionLabel](self, "descriptionLabel"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerXAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerXAnchor](self, "centerXAnchor"));
  v97 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "leadingAnchor"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView leadingAnchor](self, "leadingAnchor"));
  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v96 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "constraintEqualToAnchor:constant:", v34, v35 * 0.5 + 16.0));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "trailingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView trailingAnchor](self, "trailingAnchor"));
  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v95 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:constant:", v38, -(v39 * 0.5 + 16.0)));

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "centerXAnchor"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView centerXAnchor](self, "centerXAnchor"));
  v94 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "constraintEqualToAnchor:", v42));

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView titleLabel](self, "titleLabel"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "topAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "topAnchor"));
  -[PHSlidingView titleDistanceFromTop](self, "titleDistanceFromTop");
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:constant:", v46));

  -[PHSlidingView volumeButtonDimension](self, "volumeButtonDimension");
  x = v104.origin.x;
  y = v104.origin.y;
  width = v104.size.width;
  height = v104.size.height;
  v52 = v104.origin.y + CGRectGetHeight(v104) * 0.5;
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightView](self, "volumeButtonHighlightView"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView leftAnchor](self, "leftAnchor"));
  v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:", v55));

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightView](self, "volumeButtonHighlightView"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "centerYAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView topAnchor](self, "topAnchor"));
  v59 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToAnchor:constant:", v58, v52));
  volumeButtonHighlightViewCenterYConstraint = self->_volumeButtonHighlightViewCenterYConstraint;
  self->_volumeButtonHighlightViewCenterYConstraint = v59;

  v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightView](self, "volumeButtonHighlightView"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "widthAnchor"));
  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "constraintEqualToConstant:"));

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView volumeButtonHighlightView](self, "volumeButtonHighlightView"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "heightAnchor"));
  v105.origin.x = x;
  v105.origin.y = y;
  v105.size.width = width;
  v105.size.height = height;
  v65 = objc_msgSend(v64, "constraintEqualToConstant:", CGRectGetHeight(v105));
  v66 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue(v65);
  volumeButtonHighlightViewHeightConstraint = self->_volumeButtonHighlightViewHeightConstraint;
  self->_volumeButtonHighlightViewHeightConstraint = v66;

  -[PHSlidingView lockButtonDimension](self, "lockButtonDimension");
  v68 = v106.origin.x;
  v69 = v106.origin.y;
  v70 = v106.size.width;
  v71 = v106.size.height;
  v72 = v106.origin.y + CGRectGetHeight(v106) * 0.5;
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView lockButtonHighlightView](self, "lockButtonHighlightView"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "centerXAnchor"));
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView rightAnchor](self, "rightAnchor"));
  v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "constraintEqualToAnchor:", v75));

  v76 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView lockButtonHighlightView](self, "lockButtonHighlightView"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v76, "centerYAnchor"));
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView topAnchor](self, "topAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToAnchor:constant:", v78, v72));

  v79 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView lockButtonHighlightView](self, "lockButtonHighlightView"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v79, "widthAnchor"));
  -[PHSlidingView sliderButtonWidth](self, "sliderButtonWidth");
  v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v80, "constraintEqualToConstant:"));

  v81 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView lockButtonHighlightView](self, "lockButtonHighlightView"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "heightAnchor"));
  v107.origin.x = v68;
  v107.origin.y = v69;
  v107.size.width = v70;
  v107.size.height = v71;
  v83 = objc_msgSend(v82, "constraintEqualToConstant:", CGRectGetHeight(v107));
  v84 = (void *)objc_claimAutoreleasedReturnValue(v83);

  v85 = self->_animatedSliderTopConstraint;
  v103[0] = self->_medicalIDSliderBottomConstraint;
  v103[1] = v85;
  v103[2] = v102;
  v103[3] = v101;
  v103[4] = v100;
  v103[5] = v99;
  v103[6] = v98;
  v103[7] = v97;
  v103[8] = v94;
  v103[9] = v47;
  v103[10] = v96;
  v103[11] = v95;
  v86 = self->_volumeButtonHighlightViewCenterYConstraint;
  v103[12] = v93;
  v103[13] = v86;
  v87 = self->_volumeButtonHighlightViewHeightConstraint;
  v103[14] = v92;
  v103[15] = v87;
  v103[16] = v91;
  v103[17] = v90;
  v103[18] = v89;
  v103[19] = v84;
  v88 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v103, 20));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v88);

}

- (double)titleDistanceFromTop
{
  double v2;
  void *v3;
  double v4;

  v2 = 27.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "bounds");
    v2 = v4 * 0.0599999987;

  }
  return v2;
}

- (double)distanceBetweenMiddleSliders
{
  if (qword_1002DC8E8 != -1)
    dispatch_once(&qword_1002DC8E8, &stru_1002862E0);
  return *(double *)&qword_1002DC8E0;
}

- (double)medicalIDSliderBottomConstraintConstant
{
  void *v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  objc_msgSend(v3, "frame");
  v5 = v4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  objc_msgSend(v6, "frame");
  v8 = (v5 + v7) * 0.5;
  -[PHSlidingView distanceBetweenMiddleSliders](self, "distanceBetweenMiddleSliders");
  v10 = v8 - v9 * 0.5;

  return v10;
}

- (double)animatedSliderTopConstraintConstant
{
  unsigned int v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  double v13;

  v3 = -[PHSlidingView hasTwoMiddleSliders](self, "hasTwoMiddleSliders");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  objc_msgSend(v4, "frame");
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  objc_msgSend(v7, "frame");
  v9 = (v6 + v8) * 0.5;
  if (v3)
  {
    -[PHSlidingView distanceBetweenMiddleSliders](self, "distanceBetweenMiddleSliders");
    v11 = v10 * 0.5 + v9;
  }
  else
  {
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));
    objc_msgSend(v12, "frame");
    v11 = v9 + v13 * -0.5;

  }
  return v11;
}

- (void)updateMiddleViewSliderConstraintConstants
{
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;
  id v8;

  -[PHSlidingView medicalIDSliderBottomConstraintConstant](self, "medicalIDSliderBottomConstraintConstant");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSliderBottomConstraint](self, "medicalIDSliderBottomConstraint"));
  objc_msgSend(v5, "setConstant:", v4);

  -[PHSlidingView animatedSliderTopConstraintConstant](self, "animatedSliderTopConstraintConstant");
  v7 = v6;
  v8 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSliderTopConstraint](self, "animatedSliderTopConstraint"));
  objc_msgSend(v8, "setConstant:", v7);

}

- (void)didFinishSOSSliding:(unint64_t)a3
{
  void *v5;
  void (**v6)(id, unint64_t);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButtonCompletionBlock](self, "animatedSlidingButtonCompletionBlock"));

  if (v5)
  {
    v6 = (void (**)(id, unint64_t))objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButtonCompletionBlock](self, "animatedSlidingButtonCompletionBlock"));
    v6[2](v6, a3);

  }
}

- (BOOL)isCallDueToMountedState
{
  NSObject *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  uint64_t v9;
  double v10;
  void *i;
  double v12;
  void *v14;
  double v15;
  id v16;
  NSObject *v17;
  double v18;
  id v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  uint8_t buf[4];
  double v25;
  _BYTE v26[128];

  if (!+[SOSUtilities isMountStateTrackingEnabled](SOSUtilities, "isMountStateTrackingEnabled"))goto LABEL_12;
  v3 = objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList"));
  if (!v3)
    return (char)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList"));
  v5 = objc_msgSend(v4, "count");

  if (!v5)
  {
LABEL_12:
    LOBYTE(v3) = 0;
    return (char)v3;
  }
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList", 0));
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v21;
    v10 = 0.0;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i), "mountedProbability");
        v10 = v10 + v12;
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v20, v26, 16);
    }
    while (v8);
  }
  else
  {
    v10 = 0.0;
  }

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList"));
  v15 = v10 / (double)(unint64_t)objc_msgSend(v14, "count");

  v16 = sub_1000C5588();
  v17 = objc_claimAutoreleasedReturnValue(v16);
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "PHSlidingView,averageMountedProbability:%lf", buf, 0xCu);
  }

  -[PHSlidingView setWasMountedProbability:](self, "setWasMountedProbability:", vcvtpd_s64_f64(v15 * 100.0));
  v3 = objc_claimAutoreleasedReturnValue(-[PHSlidingView motionActivityList](self, "motionActivityList"));
  -[PHSlidingView setNumberOfEpochsForMountProbability:](self, "setNumberOfEpochsForMountProbability:", -[NSObject count](v3, "count"));

  -[PHSlidingView setWasMounted:](self, "setWasMounted:", 0);
  +[SOSUtilities mountProbabilityThreshold](SOSUtilities, "mountProbabilityThreshold");
  LOBYTE(v3) = 0;
  if (v15 >= v18)
  {
    v19 = sub_1000C5588();
    v3 = objc_claimAutoreleasedReturnValue(v19);
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHSlidingView,device is in mounted state", buf, 2u);
    }

    LOBYTE(v3) = 1;
    -[PHSlidingView setWasMounted:](self, "setWasMounted:", 1);
  }
  return (char)v3;
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  void *v8;
  void (**v9)(void);
  void *v10;
  void *v11;
  void (**v12)(void);
  _QWORD v13[5];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView animatedSlidingButton](self, "animatedSlidingButton"));

  if (v5 == v4)
  {
    -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 4);
    -[PHSlidingView didFinishSOSSliding:](self, "didFinishSOSSliding:", 1);
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));

    if (v6 == v4)
    {
      v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButtonCompletionBlock](self, "medicalIDSlidingButtonCompletionBlock"));

      if (v11)
      {
        v12 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHSlidingView medicalIDSlidingButtonCompletionBlock](self, "medicalIDSlidingButtonCompletionBlock"));
        v12[2]();

      }
      v13[0] = _NSConcreteStackBlock;
      v13[1] = 3221225472;
      v13[2] = sub_10006A924;
      v13[3] = &unk_100284898;
      v13[4] = self;
      +[UIView animateWithDuration:animations:](UIView, "animateWithDuration:animations:", v13, 0.3);
    }
    else
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));

      if (v7 == v4)
      {
        v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerDownCompletionBlock](self, "powerDownCompletionBlock"));

        if (v8)
        {
          v9 = (void (**)(void))objc_claimAutoreleasedReturnValue(-[PHSlidingView powerDownCompletionBlock](self, "powerDownCompletionBlock"));
          v9[2]();

        }
        v10 = (void *)objc_claimAutoreleasedReturnValue(+[SOSStatusReporter sharedInstance](SOSStatusReporter, "sharedInstance"));
        objc_msgSend(v10, "updateSOSFlowState:", 6);

        -[PHSlidingView _animatePowerDown](self, "_animatePowerDown");
      }
    }
  }

}

- (void)slidingButton:(id)a3 didSlideToProportion:(double)a4
{
  id v6;
  id v7;

  v6 = a3;
  v7 = (id)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));

  if (v7 == v6)
  {
    -[SBUIShapeView setAlpha:](self->_darkeningUnderlayView, "setAlpha:", a4);
    -[SBUIShapeView setAlpha:](self->_darkeningOverlayView, "setAlpha:", a4 * 0.5);
    -[PHSlidingView _updatePowerOffSliderExclusionPath](self, "_updatePowerOffSliderExclusionPath");
  }
}

- (void)_updatePowerOffSliderExclusionPath
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  double v13;
  CGFloat v14;
  double v15;
  CGFloat v16;
  CGFloat MinX;
  CGFloat MinY;
  CGAffineTransform v19;
  CGRect v20;
  CGRect v21;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v3, "bounds");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIBezierPath bezierPathWithRect:](UIBezierPath, "bezierPathWithRect:"));

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "acceptButton"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "knobMaskPath"));

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView powerOffSlidingButton](self, "powerOffSlidingButton"));
  objc_msgSend(v8, "frame");
  v10 = v9;
  v12 = v11;
  v14 = v13;
  v16 = v15;

  v20.origin.x = v10;
  v20.origin.y = v12;
  v20.size.width = v14;
  v20.size.height = v16;
  MinX = CGRectGetMinX(v20);
  v21.origin.x = v10;
  v21.origin.y = v12;
  v21.size.width = v14;
  v21.size.height = v16;
  MinY = CGRectGetMinY(v21);
  CGAffineTransformMakeTranslation(&v19, MinX, MinY);
  objc_msgSend(v7, "applyTransform:", &v19);
  objc_msgSend(v4, "appendBezierPath:", v7);
  -[SBUIShapeView setPath:](self->_darkeningUnderlayView, "setPath:", v4);
  -[SBUIShapeView setPath:](self->_darkeningOverlayView, "setPath:", v4);

}

- (void)_animatePowerDown
{
  PHSlidingButton *v3;
  PHSlidingButton *powerOffSlidingButton;
  void *v5;
  _QWORD v6[5];
  _QWORD v7[5];
  _QWORD v8[5];
  _QWORD v9[5];
  _QWORD v10[5];

  if (-[PHSlidingView deviceSupportsFindMy](self, "deviceSupportsFindMy")
    && -[PHSlidingView shouldPowerDownViewShowFindMyAlert](self, "shouldPowerDownViewShowFindMyAlert"))
  {
    -[PHSlidingButton removeFromSuperview](self->_powerOffSlidingButton, "removeFromSuperview");
    v3 = (PHSlidingButton *)objc_claimAutoreleasedReturnValue(-[PHSlidingView _createPowerDownSlider](self, "_createPowerDownSlider"));
    powerOffSlidingButton = self->_powerOffSlidingButton;
    self->_powerOffSlidingButton = v3;

    -[PHSlidingView addSubview:](self, "addSubview:", self->_powerOffSlidingButton);
    -[PHSlidingView createPowerDownConstraints](self, "createPowerDownConstraints");
    -[PHSlidingView setNeedsLayout](self, "setNeedsLayout");
    v10[0] = _NSConcreteStackBlock;
    v10[1] = 3221225472;
    v10[2] = sub_10006AD08;
    v10[3] = &unk_100284898;
    v10[4] = self;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 4, v10, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView delegate](self, "delegate"));
    v8[4] = self;
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    v9[2] = sub_10006AD50;
    v9[3] = &unk_100284898;
    v9[4] = self;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_10006AF14;
    v8[3] = &unk_100284898;
    objc_msgSend(v5, "showPowerDownFindMyInfoAlertWithProceed:cancelCompletion:", v9, v8);

  }
  else
  {
    v6[4] = self;
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_10006AF6C;
    v7[3] = &unk_100284898;
    v7[4] = self;
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_10006AFB4;
    v6[3] = &unk_1002848C0;
    +[UIView _animateUsingDefaultTimingWithOptions:animations:completion:](UIView, "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v7, v6);
  }
}

- (void)_powerOff
{
  _BOOL8 v3;
  void *v4;
  _QWORD v5[4];
  Block_layout *v6;

  v3 = -[PHSlidingView userWantsFindMySuppressed](self, "userWantsFindMySuppressed");
  if (v3)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView beaconManager](self, "beaconManager"));
    v5[0] = _NSConcreteStackBlock;
    v5[1] = 3221225472;
    v5[2] = sub_10006B104;
    v5[3] = &unk_100284E18;
    v6 = &stru_100286320;
    objc_msgSend(v4, "setSuppressLPEMBeaconing:completion:", 1, v5);

  }
  else
  {
    sub_10006B058((id)v3);
  }
}

- (void)clearReleaseToCallState
{
  -[PHSlidingView clearReleaseToCallTimer](self, "clearReleaseToCallTimer");
  -[PHSlidingView stopVoiceLoopMessagePlayback](self, "stopVoiceLoopMessagePlayback");
  -[PHSlidingView clearReleaseToCallVoiceLoopTimer](self, "clearReleaseToCallVoiceLoopTimer");
  -[PHSlidingView setSlidingViewState:](self, "setSlidingViewState:", 4);
}

- (void)clearReleaseToCallTimer
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallTimer](self, "releaseToCallTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating PHSOSReleaseToCallCountdown timer", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallTimer](self, "releaseToCallTimer"));
    objc_msgSend(v7, "invalidate");

    -[PHSlidingView setReleaseToCallTimer:](self, "setReleaseToCallTimer:", 0);
  }
}

- (void)startVoiceLoopMessagePlaybackWithMessageType:(int64_t)a3
{
  double v5;
  void *v6;
  id v7;
  id v8;
  NSObject *v9;
  NSObject *v10;
  id v11;
  uint8_t v12[16];
  uint8_t buf[16];

  -[PHSlidingView stopVoiceLoopMessagePlayback](self, "stopVoiceLoopMessagePlayback");
  if ((a3 & 0xFFFFFFFFFFFFFFFELL) != 0x66)
  {
    v11 = sub_1000C5588();
    v10 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v12 = 0;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "PHSlidingView,startVoiceLoopMessagePlaybackWithMessageType,unsupported message,ignoring request", v12, 2u);
    }
    goto LABEL_10;
  }
  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v5 != 0.0)
  {
    if (+[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown"))
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView voiceMessageManager](self, "voiceMessageManager"));

      if (!v6)
      {
        v7 = objc_msgSend(objc_alloc((Class)SOSVoiceMessageManager), "initWithMessageType:", a3);
        -[PHSlidingView setVoiceMessageManager:](self, "setVoiceMessageManager:", v7);

        v8 = sub_1000C5588();
        v9 = objc_claimAutoreleasedReturnValue(v8);
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "PHSlidingView,startVoiceLoopMessagePlaybackWithMessageType,starting release to call voice message", buf, 2u);
        }

        v10 = objc_claimAutoreleasedReturnValue(-[PHSlidingView voiceMessageManager](self, "voiceMessageManager"));
        -[NSObject startMessagePlayback](v10, "startMessagePlayback");
LABEL_10:

      }
    }
  }
}

- (void)stopVoiceLoopMessagePlayback
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView voiceMessageManager](self, "voiceMessageManager"));

  if (v3)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSlidingView,stopVoiceLoopMessagePlayback", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView voiceMessageManager](self, "voiceMessageManager"));
    objc_msgSend(v6, "stopMessagePlayback");

    -[PHSlidingView setVoiceMessageManager:](self, "setVoiceMessageManager:", 0);
  }
}

- (void)clearReleaseToCallVoiceLoopTimer
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallVoiceLoopTimer](self, "releaseToCallVoiceLoopTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating PHSOSReleaseToCallVoiceLoop timer", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSlidingView releaseToCallVoiceLoopTimer](self, "releaseToCallVoiceLoopTimer"));
    objc_msgSend(v7, "invalidate");

    -[PHSlidingView setReleaseToCallVoiceLoopTimer:](self, "setReleaseToCallVoiceLoopTimer:", 0);
  }
}

- (void)toggleFlash
{
  double v3;
  NSObject *v4;
  _QWORD block[5];

  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v3 != 0.0 && (id)-[PHSlidingView slidingViewState](self, "slidingViewState") == (id)1)
  {
    if (+[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown"))
    {
      v4 = objc_claimAutoreleasedReturnValue(-[PHSlidingView avCaptureDispatchQueue](self, "avCaptureDispatchQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10006B590;
      block[3] = &unk_100284898;
      block[4] = self;
      dispatch_async(v4, block);

    }
  }
}

- (void)stopFlash
{
  double v3;
  NSObject *v4;
  _QWORD block[5];

  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v3 != 0.0)
  {
    v4 = objc_claimAutoreleasedReturnValue(-[PHSlidingView avCaptureDispatchQueue](self, "avCaptureDispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10006B76C;
    block[3] = &unk_100284898;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (CGRect)lockButtonDimension
{
  id v2;
  NSObject *v3;
  NSString *v4;
  void *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  int v10;
  void *v11;
  CGRect result;

  if (qword_1002DC910 != -1)
    dispatch_once(&qword_1002DC910, &stru_100286340);
  v2 = sub_1000C5588();
  v3 = objc_claimAutoreleasedReturnValue(v2);
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    v4 = NSStringFromCGRect(*(CGRect *)ymmword_1002DC8F0);
    v5 = (void *)objc_claimAutoreleasedReturnValue(v4);
    v10 = 138412290;
    v11 = v5;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "PHSlidingView,lockButtonDimension,lock button frame - %@", (uint8_t *)&v10, 0xCu);

  }
  v7 = *(double *)&ymmword_1002DC8F0[8];
  v6 = *(double *)ymmword_1002DC8F0;
  v8 = *(double *)&ymmword_1002DC8F0[16];
  v9 = *(double *)&ymmword_1002DC8F0[24];
  result.size.height = v9;
  result.size.width = v8;
  result.origin.y = v7;
  result.origin.x = v6;
  return result;
}

- (CGRect)volumeButtonDimension
{
  void *v2;
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  NSObject *v16;
  double *v17;
  NSString *v18;
  void *v19;
  const char *v20;
  CGFloat v21;
  double v22;
  id v23;
  NSObject *v24;
  NSString *v25;
  void *v26;
  double v27;
  id v28;
  NSObject *v29;
  NSString *v30;
  void *v31;
  double v32;
  id v33;
  NSString *v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void **v39;
  uint64_t v40;
  void (*v41)(CGRect *);
  void *v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint8_t buf[4];
  _BYTE v48[10];
  double v49;
  CGRect v50;
  CGRect v51;
  CGRect result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(+[SOSManager sharedInstance](SOSManager, "sharedInstance"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v2, "currentSOSButtonPressState"));

  v4 = sub_1000C5588();
  v5 = objc_claimAutoreleasedReturnValue(v4);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109376;
    *(_DWORD *)v48 = objc_msgSend(v3, "volumeUpPressed");
    *(_WORD *)&v48[4] = 1024;
    *(_DWORD *)&v48[6] = objc_msgSend(v3, "volumeDownPressed");
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHSlidingView,volumeButtonDimension,VolumeUpPressed=%d,VolumeDownPressed=%d", buf, 0xEu);
  }

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
  objc_msgSend(v6, "_referenceBounds");
  v8 = v7;
  v10 = v9;
  v12 = v11;
  v14 = v13;

  v39 = _NSConcreteStackBlock;
  v40 = 3221225472;
  v41 = sub_10006C0BC;
  v42 = &unk_100286380;
  v43 = v8;
  v44 = v10;
  v45 = v12;
  v46 = v14;
  if (qword_1002DC968 != -1)
    dispatch_once(&qword_1002DC968, &v39);
  if (objc_msgSend(v3, "volumeUpPressed", v39, v40, v41, v42, v43, v44, v45, v46)
    && (objc_msgSend(v3, "volumeDownPressed") & 1) == 0)
  {
    v33 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v33);
    v17 = (double *)ymmword_1002DC928;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v34 = NSStringFromCGRect(*(CGRect *)ymmword_1002DC928);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v34);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v48 = v19;
      *(_WORD *)&v48[8] = 2048;
      v49 = *(double *)&ymmword_1002DC928[8] + *(double *)&ymmword_1002DC928[24] * 0.5;
      v20 = "PHSlidingView,volumeButtonDimension,volume UP frame - %@,CenterY - %f";
      goto LABEL_22;
    }
LABEL_23:

    v32 = *v17;
    v21 = v17[1];
    v27 = v17[2];
    v22 = v17[3];
    goto LABEL_24;
  }
  if ((objc_msgSend(v3, "volumeUpPressed") & 1) == 0
    && objc_msgSend(v3, "volumeDownPressed"))
  {
    v15 = sub_1000C5588();
    v16 = objc_claimAutoreleasedReturnValue(v15);
    v17 = (double *)ymmword_1002DC948;
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      v18 = NSStringFromCGRect(*(CGRect *)ymmword_1002DC948);
      v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
      *(_DWORD *)buf = 138412546;
      *(_QWORD *)v48 = v19;
      *(_WORD *)&v48[8] = 2048;
      v49 = *(double *)&ymmword_1002DC948[8] + *(double *)&ymmword_1002DC948[24] * 0.5;
      v20 = "PHSlidingView,volumeButtonDimension,volume DOWN frame - %@,CenterY - %f";
LABEL_22:
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, v20, buf, 0x16u);

      goto LABEL_23;
    }
    goto LABEL_23;
  }
  if (objc_msgSend(v3, "volumeUpPressed") && objc_msgSend(v3, "volumeDownPressed"))
  {
    v21 = *(double *)&ymmword_1002DC928[8];
    v22 = *(double *)&ymmword_1002DC948[8] + *(double *)&ymmword_1002DC948[24] - *(double *)&ymmword_1002DC928[8];
    v23 = sub_1000C5588();
    v24 = objc_claimAutoreleasedReturnValue(v23);
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      v50.origin.x = 0.0;
      v50.size.width = 0.0;
      v50.origin.y = v21;
      v50.size.height = v22;
      v25 = NSStringFromCGRect(v50);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v48 = v26;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "PHSlidingView,volumeButtonDimension,combined volume frame - %@", buf, 0xCu);

    }
    v27 = 0.0;
  }
  else
  {
    v28 = sub_1000C5588();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      v51.origin.x = 0.0;
      v51.origin.y = 0.0;
      v51.size.width = 0.0;
      v51.size.height = 0.0;
      v30 = NSStringFromCGRect(v51);
      v31 = (void *)objc_claimAutoreleasedReturnValue(v30);
      *(_DWORD *)buf = 138412290;
      *(_QWORD *)v48 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "PHSlidingView,volumeButtonDimension,no button pressed frame - %@", buf, 0xCu);

    }
    v22 = 0.0;
    v27 = 0.0;
    v21 = 0.0;
  }
  v32 = 0.0;
LABEL_24:

  v35 = v32;
  v36 = v21;
  v37 = v27;
  v38 = v22;
  result.size.height = v38;
  result.size.width = v37;
  result.origin.y = v36;
  result.origin.x = v35;
  return result;
}

- (void)clearMetricItems
{
  -[PHSlidingView setWasMounted:](self, "setWasMounted:", 0);
  -[PHSlidingView setWasMountedProbability:](self, "setWasMountedProbability:", -1);
  -[PHSlidingView setNumberOfEpochsForMountProbability:](self, "setNumberOfEpochsForMountProbability:", -1);
  -[PHSlidingView setReleaseToCallStartTime:](self, "setReleaseToCallStartTime:", -1.0);
  -[PHSlidingView setTimeToReleaseClaw:](self, "setTimeToReleaseClaw:", -1);
}

- (unint64_t)slidingViewState
{
  return self->_slidingViewState;
}

- (BOOL)wasMounted
{
  return self->_wasMounted;
}

- (void)setWasMounted:(BOOL)a3
{
  self->_wasMounted = a3;
}

- (int64_t)wasMountedProbability
{
  return self->_wasMountedProbability;
}

- (void)setWasMountedProbability:(int64_t)a3
{
  self->_wasMountedProbability = a3;
}

- (int64_t)numberOfEpochsForMountProbability
{
  return self->_numberOfEpochsForMountProbability;
}

- (void)setNumberOfEpochsForMountProbability:(int64_t)a3
{
  self->_numberOfEpochsForMountProbability = a3;
}

- (int64_t)timeToReleaseClaw
{
  return self->_timeToReleaseClaw;
}

- (void)setTimeToReleaseClaw:(int64_t)a3
{
  self->_timeToReleaseClaw = a3;
}

- (PHSlidingViewDelegate)delegate
{
  return (PHSlidingViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (id)animatedSlidingButtonCompletionBlock
{
  return self->_animatedSlidingButtonCompletionBlock;
}

- (void)setAnimatedSlidingButtonCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (id)medicalIDSlidingButtonCompletionBlock
{
  return self->_medicalIDSlidingButtonCompletionBlock;
}

- (id)shouldMaxVolumeCompletionBlock
{
  return self->_shouldMaxVolumeCompletionBlock;
}

- (void)setShouldMaxVolumeCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (id)powerDownCompletionBlock
{
  return self->_powerDownCompletionBlock;
}

- (void)setPowerDownCompletionBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (PHSlidingButton)animatedSlidingButton
{
  return self->_animatedSlidingButton;
}

- (void)setAnimatedSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_animatedSlidingButton, a3);
}

- (PHSlidingButton)medicalIDSlidingButton
{
  return self->_medicalIDSlidingButton;
}

- (void)setMedicalIDSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, a3);
}

- (PHSlidingButton)powerOffSlidingButton
{
  return self->_powerOffSlidingButton;
}

- (void)setPowerOffSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_powerOffSlidingButton, a3);
}

- (UILabel)descriptionLabel
{
  return self->_descriptionLabel;
}

- (void)setDescriptionLabel:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionLabel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UIView)volumeButtonHighlightView
{
  return self->_volumeButtonHighlightView;
}

- (void)setVolumeButtonHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonHighlightView, a3);
}

- (UIView)lockButtonHighlightView
{
  return self->_lockButtonHighlightView;
}

- (void)setLockButtonHighlightView:(id)a3
{
  objc_storeStrong((id *)&self->_lockButtonHighlightView, a3);
}

- (NSLayoutConstraint)volumeButtonHighlightViewCenterYConstraint
{
  return self->_volumeButtonHighlightViewCenterYConstraint;
}

- (void)setVolumeButtonHighlightViewCenterYConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonHighlightViewCenterYConstraint, a3);
}

- (NSLayoutConstraint)volumeButtonHighlightViewHeightConstraint
{
  return self->_volumeButtonHighlightViewHeightConstraint;
}

- (void)setVolumeButtonHighlightViewHeightConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonHighlightViewHeightConstraint, a3);
}

- (NSLayoutConstraint)medicalIDSliderBottomConstraint
{
  return self->_medicalIDSliderBottomConstraint;
}

- (void)setMedicalIDSliderBottomConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDSliderBottomConstraint, a3);
}

- (NSLayoutConstraint)animatedSliderTopConstraint
{
  return self->_animatedSliderTopConstraint;
}

- (void)setAnimatedSliderTopConstraint:(id)a3
{
  objc_storeStrong((id *)&self->_animatedSliderTopConstraint, a3);
}

- (void)setMedicalIDSliderBottomConstraintConstant:(double)a3
{
  self->_medicalIDSliderBottomConstraintConstant = a3;
}

- (void)setAnimatedSliderTopConstraintConstant:(double)a3
{
  self->_animatedSliderTopConstraintConstant = a3;
}

- (BOOL)hasTwoMiddleSliders
{
  return self->_hasTwoMiddleSliders;
}

- (void)setHasTwoMiddleSliders:(BOOL)a3
{
  self->_hasTwoMiddleSliders = a3;
}

- (UIViewPropertyAnimator)sliderAnimator
{
  return self->_sliderAnimator;
}

- (void)setSliderAnimator:(id)a3
{
  objc_storeStrong((id *)&self->_sliderAnimator, a3);
}

- (id)interactivelyAnimateSlidingButtonBlock
{
  return self->_interactivelyAnimateSlidingButtonBlock;
}

- (void)setInteractivelyAnimateSlidingButtonBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 200);
}

- (id)sliderTimingBlock
{
  return self->_sliderTimingBlock;
}

- (void)setSliderTimingBlock:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 208);
}

- (SBUIShapeView)darkeningUnderlayView
{
  return self->_darkeningUnderlayView;
}

- (void)setDarkeningUnderlayView:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningUnderlayView, a3);
}

- (SBUIShapeView)darkeningOverlayView
{
  return self->_darkeningOverlayView;
}

- (void)setDarkeningOverlayView:(id)a3
{
  objc_storeStrong((id *)&self->_darkeningOverlayView, a3);
}

- (UIButton)findMyButton
{
  return self->_findMyButton;
}

- (void)setFindMyButton:(id)a3
{
  objc_storeStrong((id *)&self->_findMyButton, a3);
}

- (BOOL)deviceSupportsFindMy
{
  return self->_deviceSupportsFindMy;
}

- (void)setDeviceSupportsFindMy:(BOOL)a3
{
  self->_deviceSupportsFindMy = a3;
}

- (BOOL)shouldPowerDownViewShowFindMyAlert
{
  return self->_shouldPowerDownViewShowFindMyAlert;
}

- (void)setShouldPowerDownViewShowFindMyAlert:(BOOL)a3
{
  self->_shouldPowerDownViewShowFindMyAlert = a3;
}

- (BOOL)userWantsFindMySuppressed
{
  return self->_userWantsFindMySuppressed;
}

- (void)setUserWantsFindMySuppressed:(BOOL)a3
{
  self->_userWantsFindMySuppressed = a3;
}

- (SPBeaconManager)beaconManager
{
  return self->_beaconManager;
}

- (void)setBeaconManager:(id)a3
{
  objc_storeStrong((id *)&self->_beaconManager, a3);
}

- (NSTimer)releaseToCallTimer
{
  return self->_releaseToCallTimer;
}

- (void)setReleaseToCallTimer:(id)a3
{
  objc_storeStrong((id *)&self->_releaseToCallTimer, a3);
}

- (NSTimer)releaseToCallVoiceLoopTimer
{
  return self->_releaseToCallVoiceLoopTimer;
}

- (void)setReleaseToCallVoiceLoopTimer:(id)a3
{
  objc_storeStrong((id *)&self->_releaseToCallVoiceLoopTimer, a3);
}

- (NSTimer)clawHoldInitialTimer
{
  return self->_clawHoldInitialTimer;
}

- (void)setClawHoldInitialTimer:(id)a3
{
  objc_storeStrong((id *)&self->_clawHoldInitialTimer, a3);
}

- (OS_dispatch_queue)avCaptureDispatchQueue
{
  return self->_avCaptureDispatchQueue;
}

- (SOSVoiceMessageManager)voiceMessageManager
{
  return self->_voiceMessageManager;
}

- (void)setVoiceMessageManager:(id)a3
{
  objc_storeStrong((id *)&self->_voiceMessageManager, a3);
}

- (PHSOSAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (AVCaptureDevice)avCaptureDevice
{
  return self->_avCaptureDevice;
}

- (void)setAvCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_avCaptureDevice, a3);
}

- (NSMutableArray)motionActivityList
{
  return self->_motionActivityList;
}

- (void)setMotionActivityList:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityList, a3);
}

- (NSOperationQueue)motionActivityQueue
{
  return self->_motionActivityQueue;
}

- (void)setMotionActivityQueue:(id)a3
{
  objc_storeStrong((id *)&self->_motionActivityQueue, a3);
}

- (CMMotionActivityManager)cmMotionActivityManager
{
  return self->_cmMotionActivityManager;
}

- (void)setCmMotionActivityManager:(id)a3
{
  objc_storeStrong((id *)&self->_cmMotionActivityManager, a3);
}

- (double)releaseToCallStartTime
{
  return self->_releaseToCallStartTime;
}

- (void)setReleaseToCallStartTime:(double)a3
{
  self->_releaseToCallStartTime = a3;
}

- (double)sliderViewCreationTime
{
  return self->_sliderViewCreationTime;
}

- (void)setSliderViewCreationTime:(double)a3
{
  self->_sliderViewCreationTime = a3;
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)volumeButtonHintViewVisibilityControlling
{
  return self->_volumeButtonHintViewVisibilityControlling;
}

- (void)setVolumeButtonHintViewVisibilityControlling:(id)a3
{
  objc_storeStrong((id *)&self->_volumeButtonHintViewVisibilityControlling, a3);
}

- (SBSHardwareButtonHintViewContentVisibilityControlling)sideButtonHintViewVisibilityControlling
{
  return self->_sideButtonHintViewVisibilityControlling;
}

- (void)setSideButtonHintViewVisibilityControlling:(id)a3
{
  objc_storeStrong((id *)&self->_sideButtonHintViewVisibilityControlling, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sideButtonHintViewVisibilityControlling, 0);
  objc_storeStrong((id *)&self->_volumeButtonHintViewVisibilityControlling, 0);
  objc_storeStrong((id *)&self->_cmMotionActivityManager, 0);
  objc_storeStrong((id *)&self->_motionActivityQueue, 0);
  objc_storeStrong((id *)&self->_motionActivityList, 0);
  objc_storeStrong((id *)&self->_avCaptureDevice, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_voiceMessageManager, 0);
  objc_storeStrong((id *)&self->_avCaptureDispatchQueue, 0);
  objc_storeStrong((id *)&self->_clawHoldInitialTimer, 0);
  objc_storeStrong((id *)&self->_releaseToCallVoiceLoopTimer, 0);
  objc_storeStrong((id *)&self->_releaseToCallTimer, 0);
  objc_storeStrong((id *)&self->_beaconManager, 0);
  objc_storeStrong((id *)&self->_findMyButton, 0);
  objc_storeStrong((id *)&self->_darkeningOverlayView, 0);
  objc_storeStrong((id *)&self->_darkeningUnderlayView, 0);
  objc_storeStrong(&self->_sliderTimingBlock, 0);
  objc_storeStrong(&self->_interactivelyAnimateSlidingButtonBlock, 0);
  objc_storeStrong((id *)&self->_sliderAnimator, 0);
  objc_storeStrong((id *)&self->_animatedSliderTopConstraint, 0);
  objc_storeStrong((id *)&self->_medicalIDSliderBottomConstraint, 0);
  objc_storeStrong((id *)&self->_volumeButtonHighlightViewHeightConstraint, 0);
  objc_storeStrong((id *)&self->_volumeButtonHighlightViewCenterYConstraint, 0);
  objc_storeStrong((id *)&self->_lockButtonHighlightView, 0);
  objc_storeStrong((id *)&self->_volumeButtonHighlightView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_descriptionLabel, 0);
  objc_storeStrong((id *)&self->_powerOffSlidingButton, 0);
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, 0);
  objc_storeStrong((id *)&self->_animatedSlidingButton, 0);
  objc_storeStrong(&self->_powerDownCompletionBlock, 0);
  objc_storeStrong(&self->_shouldMaxVolumeCompletionBlock, 0);
  objc_storeStrong(&self->_medicalIDSlidingButtonCompletionBlock, 0);
  objc_storeStrong(&self->_animatedSlidingButtonCompletionBlock, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

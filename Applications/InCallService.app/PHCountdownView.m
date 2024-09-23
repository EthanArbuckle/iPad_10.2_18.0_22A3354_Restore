@implementation PHCountdownView

- (PHCountdownView)initWithFrame:(CGRect)a3
{
  PHCountdownView *v3;
  PHCountdownView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHCountdownView;
  v3 = -[PHCountdownView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHCountdownView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  UILabel *v3;
  UILabel *titleLabel;
  void *v5;
  void *v6;
  double v7;
  double v8;
  UIView *v9;
  UIView *circleView;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *countdownLabel;
  void *v15;
  id v16;
  void *v17;
  void *v18;
  id v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  UILabel *v24;
  UILabel *subtitleLabel;
  void *v26;
  void *v27;
  PHSlidingButton *v28;
  void *v29;
  void *v30;
  void *v31;
  PHSOSAlertController *v32;
  PHSOSAlertController *alertController;
  OS_dispatch_queue *v34;
  OS_dispatch_queue *avCaptureDispatchQueue;
  AVCaptureDevice *v36;
  AVCaptureDevice *avCaptureDevice;
  UIFontDescriptorTraitKey v38;
  void *v39;

  v3 = (UILabel *)objc_alloc_init((Class)UILabel);
  titleLabel = self->_titleLabel;
  self->_titleLabel = v3;

  -[UILabel setTextAlignment:](self->_titleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_titleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v5);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_titleLabel, "setTextColor:", v6);

  -[UILabel setNumberOfLines:](self->_titleLabel, "setNumberOfLines:", 0);
  -[PHCountdownView addSubview:](self, "addSubview:", self->_titleLabel);
  -[PHCountdownView countdownCircleDiameter](self, "countdownCircleDiameter");
  v8 = v7;
  v9 = (UIView *)objc_msgSend(objc_alloc((Class)UIView), "initWithFrame:", 0.0, 0.0, v8, v8);
  circleView = self->_circleView;
  self->_circleView = v9;

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_circleView, "layer"));
  objc_msgSend(v11, "setCornerRadius:", v8 * 0.5);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  -[UIView setBackgroundColor:](self->_circleView, "setBackgroundColor:", v12);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_circleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHCountdownView addSubview:](self, "addSubview:", self->_circleView);
  v13 = (UILabel *)objc_alloc_init((Class)UILabel);
  countdownLabel = self->_countdownLabel;
  self->_countdownLabel = v13;

  -[UILabel setTextAlignment:](self->_countdownLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_countdownLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_countdownLabel, "setTextColor:", v15);

  v16 = objc_alloc((Class)UIFontDescriptor);
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "fontDescriptorWithDesign:", UIFontDescriptorSystemDesignRounded));

  v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "fontAttributes"));
  v19 = objc_msgSend(v18, "mutableCopy");

  v38 = UIFontWeightTrait;
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", UIFontWeightSemibold));
  v39 = v20;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v39, &v38, 1));
  objc_msgSend(v19, "setObject:forKey:", v21, UIFontDescriptorTraitsAttribute);

  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFontDescriptor fontDescriptorWithFontAttributes:](UIFontDescriptor, "fontDescriptorWithFontAttributes:", v19));
  -[PHCountdownView countdownLabelFontSize](self, "countdownLabelFontSize");
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont fontWithDescriptor:size:](UIFont, "fontWithDescriptor:size:", v22));
  -[UILabel setFont:](self->_countdownLabel, "setFont:", v23);

  -[PHCountdownView addSubview:](self, "addSubview:", self->_countdownLabel);
  v24 = (UILabel *)objc_alloc_init((Class)UILabel);
  subtitleLabel = self->_subtitleLabel;
  self->_subtitleLabel = v24;

  -[UILabel setTextAlignment:](self->_subtitleLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_subtitleLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  -[UILabel setFont:](self->_subtitleLabel, "setFont:", v26);

  v27 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_subtitleLabel, "setTextColor:", v27);

  -[UILabel setNumberOfLines:](self->_subtitleLabel, "setNumberOfLines:", 0);
  -[PHCountdownView addSubview:](self, "addSubview:", self->_subtitleLabel);
  v28 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 7, 0, 2);
  -[PHCountdownView setSosCallSlidingButton:](self, "setSosCallSlidingButton:", v28);

  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v29, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v30, "setDelegate:", self);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));
  -[PHCountdownView addSubview:](self, "addSubview:", v31);

  v32 = objc_alloc_init(PHSOSAlertController);
  alertController = self->_alertController;
  self->_alertController = v32;

  v34 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.incallservice.countdownView.avCapture", 0);
  avCaptureDispatchQueue = self->_avCaptureDispatchQueue;
  self->_avCaptureDispatchQueue = v34;

  v36 = (AVCaptureDevice *)objc_claimAutoreleasedReturnValue(+[AVCaptureDevice defaultDeviceWithMediaType:](AVCaptureDevice, "defaultDeviceWithMediaType:", AVMediaTypeVideo));
  avCaptureDevice = self->_avCaptureDevice;
  self->_avCaptureDevice = v36;

  -[PHCountdownView setUpConstraints](self, "setUpConstraints");
}

- (void)start:(id)a3 showSlider:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  id v8;
  id v9;
  double v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v5 = a4;
  v8 = a5;
  v9 = a3;
  -[PHCountdownView stop](self, "stop");
  -[PHCountdownView setCountdownViewModel:](self, "setCountdownViewModel:", v9);

  v10 = (double)v5;
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v11, "setAlpha:", v10);

  -[PHCountdownView setCompletion:](self, "setCompletion:", v8);
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "titleString"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  objc_msgSend(v14, "setText:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "subtitleString"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v17, "setText:", v16);

  -[PHCountdownView startCountdown](self, "startCountdown");
}

- (void)startCountdown
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  unsigned int v15;
  void *v16;
  void *v17;
  unsigned int v18;
  void *v19;
  _BOOL8 v20;
  void *v21;
  void *v22;
  _BOOL4 v23;
  void *v24;
  double v25;
  double v26;
  void *v27;
  id v28;
  NSObject *v29;
  uint8_t v30[8];
  _QWORD v31[5];
  id v32[2];
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  id v36;
  uint8_t buf[4];
  void *v38;
  __int16 v39;
  unsigned int v40;

  -[PHCountdownView stop](self, "stop");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "countdownString:", objc_msgSend(v4, "countdown")));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownLabel](self, "countdownLabel"));
  objc_msgSend(v6, "setText:", v5);

  v33 = 0;
  v34 = &v33;
  v35 = 0x2020000000;
  v36 = 0;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  v8 = objc_msgSend(v7, "countdown");

  v36 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  v10 = objc_msgSend(v9, "countdownWithAudio");

  v11 = sub_1000C5588();
  v12 = objc_claimAutoreleasedReturnValue(v11);
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
    v15 = objc_msgSend(v14, "playsSound");
    *(_DWORD *)buf = 138412546;
    v38 = v13;
    v39 = 1024;
    v40 = v15;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Countdown with model: %@ shouldPlaySounds: %d", buf, 0x12u);

  }
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  if (objc_msgSend(v16, "playsSound"))
  {

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
    v18 = objc_msgSend(v17, "playsHaptics");

    if (!v18)
      goto LABEL_10;
  }
  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
  if (objc_msgSend(v19, "playsSound"))
    v20 = v34[3] <= (unint64_t)v10;
  else
    v20 = 0;

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView alertController](self, "alertController"));
  objc_msgSend(v21, "playAlertWithAudio:alertTopic:", v20, TLAlertTopicSOSCountdownTick);

LABEL_10:
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownTimer](self, "countdownTimer"));
  v23 = v22 == 0;

  if (v23)
  {
    objc_initWeak((id *)buf, self);
    v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownViewModel](self, "countdownViewModel"));
    objc_msgSend(v24, "countdownTickDuration");
    v26 = v25;
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_10009C410;
    v31[3] = &unk_100286F88;
    objc_copyWeak(v32, (id *)buf);
    v31[4] = &v33;
    v32[1] = v10;
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v31, v26));
    -[PHCountdownView setCountdownTimer:](self, "setCountdownTimer:", v27);

    v28 = sub_1000C5588();
    v29 = objc_claimAutoreleasedReturnValue(v28);
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v30 = 0;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Created countdown timer", v30, 2u);
    }

    objc_destroyWeak(v32);
    objc_destroyWeak((id *)buf);
  }
  _Block_object_dispose(&v33, 8);
}

- (void)pause
{
  id v3;

  -[PHCountdownView setPauseTimer:](self, "setPauseTimer:", 1);
  v3 = (id)objc_claimAutoreleasedReturnValue(-[PHCountdownView alertController](self, "alertController"));
  objc_msgSend(v3, "stopAlert");

}

- (void)resume
{
  -[PHCountdownView setPauseTimer:](self, "setPauseTimer:", 0);
}

- (void)restart
{
  id v3;
  NSObject *v4;
  uint8_t v5[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCountdownView,restarting countdown timer", v5, 2u);
  }

  -[PHCountdownView stop](self, "stop");
  -[PHCountdownView setPauseTimer:](self, "setPauseTimer:", 0);
  -[PHCountdownView startCountdown](self, "startCountdown");
}

- (void)stop
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint8_t v9[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownTimer](self, "countdownTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating PHCountdownView timer", v9, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownTimer](self, "countdownTimer"));
    objc_msgSend(v7, "invalidate");

    -[PHCountdownView setCountdownTimer:](self, "setCountdownTimer:", 0);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView alertController](self, "alertController"));
  objc_msgSend(v8, "stopAlert");

  -[PHCountdownView stopFlash](self, "stopFlash");
}

- (void)setUpConstraints
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
  double v33;
  void *v34;
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
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  double v56;
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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  _QWORD v73[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView leadingAnchor](self, "leadingAnchor"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "trailingAnchor"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView trailingAnchor](self, "trailingAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "constraintEqualToAnchor:", v8));

  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "topAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  -[PHCountdownView titleDistanceFromTop](self, "titleDistanceFromTop");
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "constraintEqualToAnchor:constant:", v12));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "centerXAnchor"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView centerXAnchor](self, "centerXAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "constraintEqualToAnchor:", v15));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "centerXAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v19));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "topAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView titleLabel](self, "titleLabel"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "bottomAnchor"));
  -[PHCountdownView circleDistanceFromTitle](self, "circleDistanceFromTitle");
  v67 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:constant:", v23));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownLabel](self, "countdownLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "centerXAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "centerXAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v27));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView countdownLabel](self, "countdownLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "centerYAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "centerYAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  -[PHCountdownView countdownCircleDiameter](self, "countdownCircleDiameter");
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v32, 7, 0, 0, 0, 1.0, v33));

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  -[PHCountdownView countdownCircleDiameter](self, "countdownCircleDiameter");
  v63 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v34, 8, 0, 0, 0, 1.0, v35));

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView subtitleLabel](self, "subtitleLabel"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "leadingAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView leadingAnchor](self, "leadingAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v38));

  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView subtitleLabel](self, "subtitleLabel"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView trailingAnchor](self, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintEqualToAnchor:", v41));

  v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView subtitleLabel](self, "subtitleLabel"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "topAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView circleView](self, "circleView"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "bottomAnchor"));
  -[PHCountdownView subtitleDistanceFromCircleBottom](self, "subtitleDistanceFromCircleBottom");
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "constraintEqualToAnchor:constant:", v45));

  v46 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView subtitleLabel](self, "subtitleLabel"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "centerXAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView centerXAnchor](self, "centerXAnchor"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v48));

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView centerXAnchor](self, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "bottomAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView bottomAnchor](self, "bottomAnchor"));
  -[PHCountdownView sliderDistanceFromBottom](self, "sliderDistanceFromBottom");
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v55, -v56));

  v73[0] = v72;
  v73[1] = v71;
  v73[2] = v70;
  v73[3] = v69;
  v73[4] = v68;
  v73[5] = v67;
  v73[6] = v66;
  v73[7] = v65;
  v73[8] = v64;
  v73[9] = v63;
  v73[10] = v62;
  v73[11] = v61;
  v73[12] = v60;
  v73[13] = v59;
  v73[14] = v52;
  v73[15] = v57;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v73, 16));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v58);

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

- (double)circleDistanceFromTitle
{
  double v2;
  void *v3;
  double v4;

  v2 = 20.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "bounds");
    v2 = v4 * 0.0599999987;

  }
  return v2;
}

- (double)countdownCircleDiameter
{
  unsigned int v2;
  double result;

  v2 = +[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing");
  result = 122.0;
  if (v2)
    return 90.0;
  return result;
}

- (double)countdownLabelFontSize
{
  unsigned int v2;
  double result;

  v2 = +[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing");
  result = 70.0;
  if (v2)
    return 54.0;
  return result;
}

- (double)subtitleDistanceFromCircleBottom
{
  double v2;
  void *v3;
  double v4;

  v2 = 20.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "bounds");
    v2 = v4 * 0.0599999987;

  }
  return v2;
}

- (double)sliderDistanceFromBottom
{
  double v2;
  void *v3;
  double v4;

  v2 = 30.0;
  if (!+[PHUIConfiguration shouldUseSOSTightSpacing](PHUIConfiguration, "shouldUseSOSTightSpacing"))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v3, "bounds");
    v2 = v4 * 0.0500000007;

  }
  return v2;
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void (**v9)(_QWORD, _QWORD);
  uint8_t v10[16];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCountdownView sosCallSlidingButton](self, "sosCallSlidingButton"));

  if (v5 == v4)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHCountdownView,user slid SOS slider", v10, 2u);
    }

    -[PHCountdownView stop](self, "stop");
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCountdownView completion](self, "completion"));

    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHCountdownView completion](self, "completion"));
      v9[2](v9, 1);

    }
  }
}

- (void)toggleFlash
{
  double v3;
  NSObject *v4;
  _QWORD block[5];

  +[SOSUtilities clawReleaseToCallSupport](SOSUtilities, "clawReleaseToCallSupport");
  if (v3 != 0.0)
  {
    if (+[SOSUtilities shouldPlayAudioDuringCountdown](SOSUtilities, "shouldPlayAudioDuringCountdown"))
    {
      v4 = objc_claimAutoreleasedReturnValue(-[PHCountdownView avCaptureDispatchQueue](self, "avCaptureDispatchQueue"));
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10009D260;
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
    v4 = objc_claimAutoreleasedReturnValue(-[PHCountdownView avCaptureDispatchQueue](self, "avCaptureDispatchQueue"));
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_10009D43C;
    block[3] = &unk_100284898;
    block[4] = self;
    dispatch_async(v4, block);

  }
}

- (PHCountdownViewModel)countdownViewModel
{
  return self->_countdownViewModel;
}

- (void)setCountdownViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_countdownViewModel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)countdownLabel
{
  return self->_countdownLabel;
}

- (void)setCountdownLabel:(id)a3
{
  objc_storeStrong((id *)&self->_countdownLabel, a3);
}

- (UIView)circleView
{
  return self->_circleView;
}

- (void)setCircleView:(id)a3
{
  objc_storeStrong((id *)&self->_circleView, a3);
}

- (UILabel)subtitleLabel
{
  return self->_subtitleLabel;
}

- (void)setSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_subtitleLabel, a3);
}

- (PHSlidingButton)sosCallSlidingButton
{
  return self->_sosCallSlidingButton;
}

- (void)setSosCallSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_sosCallSlidingButton, a3);
}

- (NSTimer)countdownTimer
{
  return self->_countdownTimer;
}

- (void)setCountdownTimer:(id)a3
{
  objc_storeStrong((id *)&self->_countdownTimer, a3);
}

- (BOOL)pauseTimer
{
  return self->_pauseTimer;
}

- (void)setPauseTimer:(BOOL)a3
{
  self->_pauseTimer = a3;
}

- (PHSOSAlertController)alertController
{
  return self->_alertController;
}

- (void)setAlertController:(id)a3
{
  objc_storeStrong((id *)&self->_alertController, a3);
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (AVCaptureDevice)avCaptureDevice
{
  return self->_avCaptureDevice;
}

- (void)setAvCaptureDevice:(id)a3
{
  objc_storeStrong((id *)&self->_avCaptureDevice, a3);
}

- (OS_dispatch_queue)avCaptureDispatchQueue
{
  return self->_avCaptureDispatchQueue;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_avCaptureDispatchQueue, 0);
  objc_storeStrong((id *)&self->_avCaptureDevice, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_alertController, 0);
  objc_storeStrong((id *)&self->_countdownTimer, 0);
  objc_storeStrong((id *)&self->_sosCallSlidingButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_countdownLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_countdownViewModel, 0);
}

@end

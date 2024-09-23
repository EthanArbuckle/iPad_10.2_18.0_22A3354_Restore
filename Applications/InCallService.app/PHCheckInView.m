@implementation PHCheckInView

- (PHCheckInView)initWithFrame:(CGRect)a3
{
  PHCheckInView *v3;
  PHCheckInView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHCheckInView;
  v3 = -[PHCheckInView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHCheckInView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  PHSlidingButton *v21;
  void *v22;
  void *v23;
  void *v24;

  v3 = objc_alloc_init((Class)UILabel);
  -[PHCheckInView setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTextAlignment:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  -[PHCheckInView addSubview:](self, "addSubview:", v11);

  v12 = objc_alloc_init((Class)UILabel);
  -[PHCheckInView setSubtitleLabel:](self, "setSubtitleLabel:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v13, "setTextAlignment:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v16, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v19, "setNumberOfLines:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  -[PHCheckInView addSubview:](self, "addSubview:", v20);

  v21 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 7, 0, 2);
  -[PHCheckInView setSosCallSlidingButton:](self, "setSosCallSlidingButton:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v23, "setDelegate:", self);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView sosCallSlidingButton](self, "sosCallSlidingButton"));
  -[PHCheckInView addSubview:](self, "addSubview:", v24);

  -[PHCheckInView setUpConstraints](self, "setUpConstraints");
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
  void *v33;
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
  double v44;
  void *v45;
  id v46;

  v46 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v46, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v46, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  -[PHCheckInView distanceFromTop](self, "distanceFromTop");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14));
  objc_msgSend(v46, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView centerXAnchor](self, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v46, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  objc_msgSend(v46, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView trailingAnchor](self, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  objc_msgSend(v46, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 22.0));
  objc_msgSend(v46, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView centerXAnchor](self, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  objc_msgSend(v46, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView sosCallSlidingButton](self, "sosCallSlidingButton"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "centerXAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView centerXAnchor](self, "centerXAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  objc_msgSend(v46, "addObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView sosCallSlidingButton](self, "sosCallSlidingButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "bottomAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView bottomAnchor](self, "bottomAnchor"));
  -[PHCheckInView distanceFromBottom](self, "distanceFromBottom");
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v43, -v44));
  objc_msgSend(v46, "addObject:", v45);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v46);
}

- (double)distanceFromTop
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

- (double)distanceFromBottom
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

- (void)start:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v6 = a4;
  v7 = a3;
  -[PHCheckInView setCheckInViewModel:](self, "setCheckInViewModel:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "titleString"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setText:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "subtitleString"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v11, "setText:", v10);

  -[PHCheckInView setCompletion:](self, "setCompletion:", v6);
  -[PHCheckInView startCountdown](self, "startCountdown");
}

- (void)startCountdown
{
  void *v3;
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  void *v10;
  double v11;
  unint64_t v12;
  void *v13;
  double v14;
  double v15;
  void *v16;
  void **v17;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  uint8_t *v21;
  id v22;
  uint8_t buf[8];
  uint8_t *v24;
  uint64_t v25;
  unint64_t v26;
  id location;

  -[PHCheckInView stopCheckInTimer](self, "stopCheckInTimer");
  -[PHCheckInView stopVoiceLoopMessagePlayback](self, "stopVoiceLoopMessagePlayback");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView checkInViewModel](self, "checkInViewModel"));
  v4 = objc_msgSend(v3, "sosVoiceMessageType");

  if (v4
    && (+[SOSUtilities shouldSilenceSOSFlow](SOSUtilities, "shouldSilenceSOSFlow") & 1) == 0)
  {
    v5 = objc_msgSend(objc_alloc((Class)SOSVoiceMessageManager), "initWithMessageType:", v4);
    -[PHCheckInView setVoiceMessageManager:](self, "setVoiceMessageManager:", v5);

    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHCheckInView,starting check-in voice message", buf, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView voiceMessageManager](self, "voiceMessageManager"));
    objc_msgSend(v8, "startMessagePlayback");

  }
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView checkInTimer](self, "checkInTimer"));

  if (!v9)
  {
    objc_initWeak(&location, self);
    *(_QWORD *)buf = 0;
    v24 = buf;
    v25 = 0x2020000000;
    v26 = 0;
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView checkInViewModel](self, "checkInViewModel"));
    objc_msgSend(v10, "timeout");
    v12 = (unint64_t)v11;

    v26 = v12;
    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView checkInViewModel](self, "checkInViewModel"));
    objc_msgSend(v13, "countdownTickDuration");
    v15 = v14;
    v17 = _NSConcreteStackBlock;
    v18 = 3221225472;
    v19 = sub_1000430D4;
    v20 = &unk_100285650;
    objc_copyWeak(&v22, &location);
    v21 = buf;
    v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, &v17, v15));
    -[PHCheckInView setCheckInTimer:](self, "setCheckInTimer:", v16, v17, v18, v19, v20);

    objc_destroyWeak(&v22);
    _Block_object_dispose(buf, 8);
    objc_destroyWeak(&location);
  }
}

- (void)pause
{
  -[PHCheckInView setPauseTimer:](self, "setPauseTimer:", 1);
}

- (void)resume
{
  -[PHCheckInView setPauseTimer:](self, "setPauseTimer:", 0);
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
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHCheckInView,restarting countdown timer", v5, 2u);
  }

  -[PHCheckInView setPauseTimer:](self, "setPauseTimer:", 0);
  -[PHCheckInView startCountdown](self, "startCountdown");
}

- (void)stopCheckInTimer
{
  void *v3;
  unsigned int v4;
  id v5;
  NSObject *v6;
  void *v7;
  uint8_t v8[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView checkInTimer](self, "checkInTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = sub_1000C5588();
    v6 = objc_claimAutoreleasedReturnValue(v5);
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Invalidating PHCheckInView timer", v8, 2u);
    }

    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView checkInTimer](self, "checkInTimer"));
    objc_msgSend(v7, "invalidate");

    -[PHCheckInView setCheckInTimer:](self, "setCheckInTimer:", 0);
  }
}

- (void)stopVoiceLoopMessagePlayback
{
  void *v3;
  id v4;
  NSObject *v5;
  void *v6;
  uint8_t v7[16];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView voiceMessageManager](self, "voiceMessageManager"));

  if (v3)
  {
    v4 = sub_1000C5588();
    v5 = objc_claimAutoreleasedReturnValue(v4);
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PHCheckInView,stopping check-in voice message", v7, 2u);
    }

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView voiceMessageManager](self, "voiceMessageManager"));
    objc_msgSend(v6, "stopMessagePlayback");

    -[PHCheckInView setVoiceMessageManager:](self, "setVoiceMessageManager:", 0);
  }
}

- (void)stop
{
  -[PHCheckInView stopAndNotifyResult:](self, "stopAndNotifyResult:", 2);
}

- (void)stopAndNotifyResult:(unint64_t)a3
{
  void *v5;
  id v6;
  NSObject *v7;
  void (**v8)(_QWORD, _QWORD);
  _DWORD v9[2];

  -[PHCheckInView stopVoiceLoopMessagePlayback](self, "stopVoiceLoopMessagePlayback");
  -[PHCheckInView stopCheckInTimer](self, "stopCheckInTimer");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCheckInView completion](self, "completion"));

  if (v5)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      v9[0] = 67109120;
      v9[1] = a3;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHCheckInView,returning result,%d", (uint8_t *)v9, 8u);
    }

    v8 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHCheckInView completion](self, "completion"));
    v8[2](v8, a3);

    -[PHCheckInView setCompletion:](self, "setCompletion:", 0);
  }
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  NSObject *v7;
  uint8_t v8[16];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCheckInView sosCallSlidingButton](self, "sosCallSlidingButton"));

  if (v5 == v4)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v8 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHCheckInView,user slid SOS slider", v8, 2u);
    }

    -[PHCheckInView stopAndNotifyResult:](self, "stopAndNotifyResult:", 1);
  }
}

- (PHCheckInViewModel)checkInViewModel
{
  return self->_checkInViewModel;
}

- (void)setCheckInViewModel:(id)a3
{
  objc_storeStrong((id *)&self->_checkInViewModel, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
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

- (NSTimer)checkInTimer
{
  return self->_checkInTimer;
}

- (void)setCheckInTimer:(id)a3
{
  objc_storeStrong((id *)&self->_checkInTimer, a3);
}

- (BOOL)pauseTimer
{
  return self->_pauseTimer;
}

- (void)setPauseTimer:(BOOL)a3
{
  self->_pauseTimer = a3;
}

- (id)completion
{
  return self->_completion;
}

- (void)setCompletion:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (SOSVoiceMessageManager)voiceMessageManager
{
  return self->_voiceMessageManager;
}

- (void)setVoiceMessageManager:(id)a3
{
  objc_storeStrong((id *)&self->_voiceMessageManager, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_voiceMessageManager, 0);
  objc_storeStrong(&self->_completion, 0);
  objc_storeStrong((id *)&self->_checkInTimer, 0);
  objc_storeStrong((id *)&self->_sosCallSlidingButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_checkInViewModel, 0);
}

@end

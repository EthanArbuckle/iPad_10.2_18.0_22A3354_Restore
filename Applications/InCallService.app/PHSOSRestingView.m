@implementation PHSOSRestingView

- (PHSOSRestingView)initWithFrame:(CGRect)a3
{
  PHSOSRestingView *v3;
  PHSOSRestingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSOSRestingView;
  v3 = -[PHSOSRestingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHSOSRestingView commonInit](v3, "commonInit");
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
  PHSlidingButton *v25;
  void *v26;
  void *v27;
  void *v28;

  v3 = objc_alloc_init((Class)UILabel);
  -[PHSOSRestingView setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTextAlignment:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  -[PHSOSRestingView addSubview:](self, "addSubview:", v11);

  v12 = objc_alloc_init((Class)UILabel);
  -[PHSOSRestingView setSubtitleLabel:](self, "setSubtitleLabel:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v13, "setTextAlignment:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 22.0));
  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v16, "setFont:", v15);

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v18, "setTextColor:", v17);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  objc_msgSend(v19, "setNumberOfLines:", 0);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  -[PHSOSRestingView addSubview:](self, "addSubview:", v20);

  v21 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 9, 0, 2);
  -[PHSOSRestingView setMedicalIDSlidingButton:](self, "setMedicalIDSlidingButton:", v21);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v22, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v23 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v23, "setDelegate:", self);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  -[PHSOSRestingView addSubview:](self, "addSubview:", v24);

  v25 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 7, 0, 2);
  -[PHSOSRestingView setSosCallSlidingButton:](self, "setSosCallSlidingButton:", v25);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v26, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView sosCallSlidingButton](self, "sosCallSlidingButton"));
  objc_msgSend(v27, "setDelegate:", self);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView sosCallSlidingButton](self, "sosCallSlidingButton"));
  -[PHSOSRestingView addSubview:](self, "addSubview:", v28);

  -[PHSOSRestingView setUpConstraints](self, "setUpConstraints");
  -[PHSOSRestingView setHasMedicalIDSlider:](self, "setHasMedicalIDSlider:", 0);
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
  double v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  double v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  id v56;

  v56 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v56, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v56, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  -[PHSOSRestingView titleDistanceFromTop](self, "titleDistanceFromTop");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14));
  objc_msgSend(v56, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView centerXAnchor](self, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v56, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  objc_msgSend(v56, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView trailingAnchor](self, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  objc_msgSend(v56, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "bottomAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:constant:", v31, 22.0));
  objc_msgSend(v56, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView centerXAnchor](self, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  objc_msgSend(v56, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView sosCallSlidingButton](self, "sosCallSlidingButton"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "bottomAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "topAnchor"));
  -[PHSOSRestingView sosSliderDistanceFromMedicalId](self, "sosSliderDistanceFromMedicalId");
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:constant:", v40, -v41));
  objc_msgSend(v56, "addObject:", v42);

  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView sosCallSlidingButton](self, "sosCallSlidingButton"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "centerXAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView centerXAnchor](self, "centerXAnchor"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "constraintEqualToAnchor:", v45));
  objc_msgSend(v56, "addObject:", v46);

  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView bottomAnchor](self, "bottomAnchor"));
  -[PHSOSRestingView medicalIdSliderDistanceFromBottom](self, "medicalIdSliderDistanceFromBottom");
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "constraintEqualToAnchor:constant:", v49, -v50));
  objc_msgSend(v56, "addObject:", v51);

  v52 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "centerXAnchor"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView centerXAnchor](self, "centerXAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "constraintEqualToAnchor:", v54));
  objc_msgSend(v56, "addObject:", v55);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v56);
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

- (double)sosSliderDistanceFromMedicalId
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

- (double)medicalIdSliderDistanceFromBottom
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

- (void)setdateOfSOSEvent:(id)a3
{
  PHSOSRestingViewModel *viewModel;
  id v6;

  v6 = a3;
  objc_storeStrong((id *)&self->_dateOfSOSEvent, a3);
  viewModel = self->_viewModel;
  if (viewModel)
  {
    -[PHSOSRestingViewModel setDateOfSOSEvent:](viewModel, "setDateOfSOSEvent:", v6);
    -[PHSOSRestingView setTitleAndSubtitle](self, "setTitleAndSubtitle");
  }

}

- (void)setHasMedicalIDSlider:(BOOL)a3
{
  unsigned int v3;
  id v5;
  NSObject *v6;
  void *v7;
  _DWORD v8[2];

  v3 = a3;
  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    v8[0] = 67109120;
    v8[1] = v3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSRestingView,showing medical ID slider,%d", (uint8_t *)v8, 8u);
  }

  self->_hasMedicalIDSlider = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v7, "setAlpha:", (double)v3);

}

- (void)setViewModel:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  if (self->_dateOfSOSEvent)
    -[PHSOSRestingViewModel setDateOfSOSEvent:](self->_viewModel, "setDateOfSOSEvent:");
  -[PHSOSRestingView setTitleAndSubtitle](self, "setTitleAndSubtitle");

}

- (void)setTitleAndSubtitle
{
  PHSOSRestingViewModel *viewModel;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  viewModel = self->_viewModel;
  if (viewModel)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingViewModel titleString](viewModel, "titleString"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView titleLabel](self, "titleLabel"));
    objc_msgSend(v5, "setText:", v4);

    v7 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSRestingViewModel subtitleString](self->_viewModel, "subtitleString"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView subtitleLabel](self, "subtitleLabel"));
    objc_msgSend(v6, "setText:", v7);

  }
}

- (void)didFinishSlideForSlidingButton:(id)a3
{
  id v4;
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  void *v9;
  _QWORD *v10;
  void (*v11)(void);
  id v12;
  NSObject *v13;
  void *v14;
  uint8_t v15[16];
  uint8_t buf[16];

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView sosCallSlidingButton](self, "sosCallSlidingButton"));

  if (v5 == v4)
  {
    v12 = sub_1000C5588();
    v13 = objc_claimAutoreleasedReturnValue(v12);
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "PHSOSRestingView,user slid SOS slider", buf, 2u);
    }

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView completionHandler](self, "completionHandler"));
    if (v14)
    {
      v10 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView completionHandler](self, "completionHandler"));
      v11 = (void (*)(void))v10[2];
      goto LABEL_11;
    }
  }
  else
  {
    v6 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));

    if (v6 == v4)
    {
      v7 = sub_1000C5588();
      v8 = objc_claimAutoreleasedReturnValue(v7);
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "PHSOSRestingView,user slid medical ID slider", v15, 2u);
      }

      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView completionHandler](self, "completionHandler"));
      if (v9)
      {
        v10 = (_QWORD *)objc_claimAutoreleasedReturnValue(-[PHSOSRestingView completionHandler](self, "completionHandler"));
        v11 = (void (*)(void))v10[2];
LABEL_11:
        v11();

      }
    }
  }

}

- (NSDate)dateOfSOSEvent
{
  return self->_dateOfSOSEvent;
}

- (void)setDateOfSOSEvent:(id)a3
{
  objc_storeStrong((id *)&self->_dateOfSOSEvent, a3);
}

- (BOOL)hasMedicalIDSlider
{
  return self->_hasMedicalIDSlider;
}

- (PHSOSRestingViewModel)viewModel
{
  return self->_viewModel;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
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

- (PHSlidingButton)medicalIDSlidingButton
{
  return self->_medicalIDSlidingButton;
}

- (void)setMedicalIDSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, a3);
}

- (PHSlidingButton)sosCallSlidingButton
{
  return self->_sosCallSlidingButton;
}

- (void)setSosCallSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_sosCallSlidingButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_sosCallSlidingButton, 0);
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, 0);
  objc_storeStrong((id *)&self->_subtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
  objc_storeStrong((id *)&self->_dateOfSOSEvent, 0);
}

@end

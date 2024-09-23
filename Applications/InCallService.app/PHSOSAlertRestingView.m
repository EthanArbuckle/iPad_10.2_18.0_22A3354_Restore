@implementation PHSOSAlertRestingView

- (PHSOSAlertRestingView)initWithFrame:(CGRect)a3
{
  PHSOSAlertRestingView *v3;
  PHSOSAlertRestingView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHSOSAlertRestingView;
  v3 = -[PHSOSAlertRestingView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHSOSAlertRestingView commonInit](v3, "commonInit");
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
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  id v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
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
  void *v44;
  void *v45;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  PHSlidingButton *v57;
  void *v58;
  void *v59;
  void *v60;
  id v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  id v66;
  void *v67;
  _QWORD v68[4];
  id v69;
  id location;
  _QWORD v71[2];
  _QWORD v72[2];
  _QWORD v73[2];
  _QWORD v74[2];
  NSAttributedStringKey v75;
  void *v76;

  v3 = objc_alloc_init((Class)UILabel);
  -[PHSOSAlertRestingView setTitleLabel:](self, "setTitleLabel:", v3);

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v4, "setTextAlignment:", 1);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v5, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v7, "setFont:", v6);

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v9, "setTextColor:", v8);

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  objc_msgSend(v10, "setNumberOfLines:", 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  -[PHSOSAlertRestingView addSubview:](self, "addSubview:", v11);

  v12 = objc_alloc_init((Class)UILabel);
  -[PHSOSAlertRestingView setFirstSubtitleLabel:](self, "setFirstSubtitleLabel:", v12);

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  objc_msgSend(v13, "setTextAlignment:", 1);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  objc_msgSend(v15, "setNumberOfLines:", 0);

  v16 = objc_msgSend(objc_alloc((Class)NSMutableAttributedString), "initWithString:", &stru_10028DC20);
  v66 = objc_alloc_init((Class)NSTextAttachment);
  v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
  v67 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithFont:](UIImageSymbolConfiguration, "configurationWithFont:", v17));

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:withConfiguration:](UIImage, "systemImageNamed:withConfiguration:", CFSTR("exclamationmark.circle.fill"), v67));
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageWithTintColor:", v19));
  objc_msgSend(v66, "setImage:", v20);

  v65 = (void *)objc_claimAutoreleasedReturnValue(+[NSAttributedString attributedStringWithAttachment:](NSAttributedString, "attributedStringWithAttachment:", v66));
  objc_msgSend(v16, "appendAttributedString:", v65);
  v75 = NSFontAttributeName;
  v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
  v76 = v21;
  v64 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", &v76, &v75, 1));

  v63 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", CFSTR(" "), v64);
  objc_msgSend(v16, "appendAttributedString:", v63);
  v73[0] = NSFontAttributeName;
  v22 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
  v74[0] = v22;
  v73[1] = NSForegroundColorAttributeName;
  v23 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v74[1] = v23;
  v62 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v74, v73, 2));

  v24 = objc_alloc((Class)NSAttributedString);
  v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("SOS_ALERT_RESTING_VIEW_FIRST_SUBTITLE"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
  v61 = objc_msgSend(v24, "initWithString:attributes:", v26, v62);

  objc_msgSend(v16, "appendAttributedString:", v61);
  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  objc_msgSend(v27, "setAttributedText:", v16);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  -[PHSOSAlertRestingView addSubview:](self, "addSubview:", v28);

  v29 = objc_alloc_init((Class)UILabel);
  -[PHSOSAlertRestingView setSecondSubtitleLabel:](self, "setSecondSubtitleLabel:", v29);

  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  objc_msgSend(v30, "setTextAlignment:", 1);

  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  objc_msgSend(v31, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v32 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:](UIFont, "systemFontOfSize:", 20.0));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  objc_msgSend(v33, "setFont:", v32);

  v34 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  objc_msgSend(v35, "setTextColor:", v34);

  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  objc_msgSend(v36, "setNumberOfLines:", 0);

  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "localizedStringForKey:value:table:", CFSTR("SOS_ALERT_RESTING_VIEW_SECOND_SUBTITLE"), &stru_10028DC20, CFSTR("Localizable-Stewie")));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  objc_msgSend(v39, "setText:", v38);

  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  -[PHSOSAlertRestingView addSubview:](self, "addSubview:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("SOS_ALERT_RESTING_VIEW_BUTTON_LABEL"), &stru_10028DC20, CFSTR("Localizable-Stewie")));

  v71[0] = NSFontAttributeName;
  v43 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
  v71[1] = NSForegroundColorAttributeName;
  v72[0] = v43;
  v44 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v72[1] = v44;
  v45 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v72, v71, 2));

  v46 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v42, v45);
  objc_initWeak(&location, self);
  v68[0] = _NSConcreteStackBlock;
  v68[1] = 3221225472;
  v68[2] = sub_1000C6524;
  v68[3] = &unk_100285590;
  objc_copyWeak(&v69, &location);
  v47 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v42, 0, 0, v68));
  v48 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0, v47));
  -[PHSOSAlertRestingView setShowMessagesButton:](self, "setShowMessagesButton:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  objc_msgSend(v49, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v50 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "layer"));
  objc_msgSend(v51, "setCornerRadius:", 36.0);

  v52 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemGreenColor](UIColor, "systemGreenColor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "colorWithAlphaComponent:", 0.150000006));
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  objc_msgSend(v54, "setBackgroundColor:", v53);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  objc_msgSend(v55, "setAttributedTitle:forState:", v46, 0);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  -[PHSOSAlertRestingView addSubview:](self, "addSubview:", v56);

  v57 = -[PHSlidingButton initWithSlidingButtonType:appearanceType:callState:]([PHSlidingButton alloc], "initWithSlidingButtonType:appearanceType:callState:", 9, 0, 2);
  -[PHSOSAlertRestingView setMedicalIDSlidingButton:](self, "setMedicalIDSlidingButton:", v57);

  v58 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v58, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v59, "setDelegate:", self);

  v60 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  -[PHSOSAlertRestingView addSubview:](self, "addSubview:", v60);

  -[PHSOSAlertRestingView setUpConstraints](self, "setUpConstraints");
  -[PHSOSAlertRestingView setHasMedicalIDSlider:](self, "setHasMedicalIDSlider:", 0);

  objc_destroyWeak(&v69);
  objc_destroyWeak(&location);

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
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  double v74;
  void *v75;
  id v76;

  v76 = objc_alloc_init((Class)NSMutableArray);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "leadingAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView leadingAnchor](self, "leadingAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v5));
  objc_msgSend(v76, "addObject:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  objc_msgSend(v76, "addObject:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "topAnchor"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView safeAreaLayoutGuide](self, "safeAreaLayoutGuide"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "topAnchor"));
  -[PHSOSAlertRestingView titleDistanceFromTop](self, "titleDistanceFromTop");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "constraintEqualToAnchor:constant:", v14));
  objc_msgSend(v76, "addObject:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "centerXAnchor"));
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerXAnchor](self, "centerXAnchor"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToAnchor:", v18));
  objc_msgSend(v76, "addObject:", v19);

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "leadingAnchor"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView leadingAnchor](self, "leadingAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "constraintEqualToAnchor:", v22));
  objc_msgSend(v76, "addObject:", v23);

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "trailingAnchor"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView trailingAnchor](self, "trailingAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "constraintEqualToAnchor:", v26));
  objc_msgSend(v76, "addObject:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "topAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "constraintEqualToAnchor:", v31));
  objc_msgSend(v76, "addObject:", v32);

  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView firstSubtitleLabel](self, "firstSubtitleLabel"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "centerXAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerXAnchor](self, "centerXAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:", v35));
  objc_msgSend(v76, "addObject:", v36);

  v37 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "leadingAnchor"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView leadingAnchor](self, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "constraintEqualToAnchor:", v39));
  objc_msgSend(v76, "addObject:", v40);

  v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView trailingAnchor](self, "trailingAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:", v43));
  objc_msgSend(v76, "addObject:", v44);

  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "bottomAnchor"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerYAnchor](self, "centerYAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v47, -8.0));
  objc_msgSend(v76, "addObject:", v48);

  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView secondSubtitleLabel](self, "secondSubtitleLabel"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerXAnchor"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerXAnchor](self, "centerXAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v51));
  objc_msgSend(v76, "addObject:", v52);

  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "widthAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToConstant:", 300.0));
  objc_msgSend(v76, "addObject:", v55);

  v56 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "heightAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "constraintEqualToConstant:", 72.0));
  objc_msgSend(v76, "addObject:", v58);

  v59 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v59, "centerXAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerXAnchor](self, "centerXAnchor"));
  v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:", v61));
  objc_msgSend(v76, "addObject:", v62);

  v63 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView showMessagesButton](self, "showMessagesButton"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "topAnchor"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerYAnchor](self, "centerYAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v64, "constraintEqualToAnchor:constant:", v65, 8.0));
  objc_msgSend(v76, "addObject:", v66);

  v67 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "centerXAnchor"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView centerXAnchor](self, "centerXAnchor"));
  v70 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v68, "constraintEqualToAnchor:", v69));
  objc_msgSend(v76, "addObject:", v70);

  v71 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v71, "bottomAnchor"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView bottomAnchor](self, "bottomAnchor"));
  -[PHSOSAlertRestingView sliderDistanceFromBottom](self, "sliderDistanceFromBottom");
  v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v72, "constraintEqualToAnchor:constant:", v73, -v74));
  objc_msgSend(v76, "addObject:", v75);

  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v76);
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
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "PHSOSAlertRestingView,showing medical ID slider,%d", (uint8_t *)v8, 8u);
  }

  self->_hasMedicalIDSlider = v3;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));
  objc_msgSend(v7, "setAlpha:", (double)v3);

}

- (void)setViewModel:(id)a3
{
  PHSOSAlertRestingViewModel *viewModel;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_storeStrong((id *)&self->_viewModel, a3);
  viewModel = self->_viewModel;
  if (viewModel)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingViewModel titleString](viewModel, "titleString"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView titleLabel](self, "titleLabel"));
    objc_msgSend(v7, "setText:", v6);

  }
}

- (void)showMessagesButtonPressed
{
  id v3;
  NSObject *v4;
  void *v5;
  void (**v6)(_QWORD, _QWORD);
  uint8_t v7[16];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "PHSOSAlertRestingView,user pressed show messages button", v7, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView completionHandler](self, "completionHandler"));
  if (v5)
  {
    v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView completionHandler](self, "completionHandler"));
    v6[2](v6, 0);

  }
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
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView medicalIDSlidingButton](self, "medicalIDSlidingButton"));

  if (v5 == v4)
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "PHSOSAlertRestingView,user slid medical ID slider", v10, 2u);
    }

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView completionHandler](self, "completionHandler"));
    if (v8)
    {
      v9 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue(-[PHSOSAlertRestingView completionHandler](self, "completionHandler"));
      v9[2](v9, 1);

    }
  }
}

- (BOOL)hasMedicalIDSlider
{
  return self->_hasMedicalIDSlider;
}

- (PHSOSAlertRestingViewModel)viewModel
{
  return self->_viewModel;
}

- (id)completionHandler
{
  return self->_completionHandler;
}

- (void)setCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)firstSubtitleLabel
{
  return self->_firstSubtitleLabel;
}

- (void)setFirstSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_firstSubtitleLabel, a3);
}

- (UILabel)secondSubtitleLabel
{
  return self->_secondSubtitleLabel;
}

- (void)setSecondSubtitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_secondSubtitleLabel, a3);
}

- (UIButton)showMessagesButton
{
  return self->_showMessagesButton;
}

- (void)setShowMessagesButton:(id)a3
{
  objc_storeStrong((id *)&self->_showMessagesButton, a3);
}

- (PHSlidingButton)medicalIDSlidingButton
{
  return self->_medicalIDSlidingButton;
}

- (void)setMedicalIDSlidingButton:(id)a3
{
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_medicalIDSlidingButton, 0);
  objc_storeStrong((id *)&self->_showMessagesButton, 0);
  objc_storeStrong((id *)&self->_secondSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_firstSubtitleLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_viewModel, 0);
}

@end

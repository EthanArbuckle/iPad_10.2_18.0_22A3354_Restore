@implementation MPEmergencyCountdownView

- (MPEmergencyCountdownView)initWithDiameter:(float)a3
{
  MPEmergencyCountdownView *v4;
  MPEmergencyCountdownView *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)MPEmergencyCountdownView;
  v4 = -[MPEmergencyCountdownView initWithFrame:](&v7, "initWithFrame:", 0.0, 0.0, 0.0, 0.0);
  v5 = v4;
  if (v4)
  {
    v4->_circleDiameter = a3;
    -[MPEmergencyCountdownView commonInit](v4, "commonInit");
  }
  return v5;
}

- (MPEmergencyCountdownView)init
{
  -[MPEmergencyCountdownView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (MPEmergencyCountdownView)initWithFrame:(CGRect)a3
{
  -[MPEmergencyCountdownView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2, a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);

  return 0;
}

- (MPEmergencyCountdownView)initWithCoder:(id)a3
{
  -[MPEmergencyCountdownView doesNotRecognizeSelector:](self, "doesNotRecognizeSelector:", a2);

  return 0;
}

- (void)commonInit
{
  id v3;
  float v4;
  double v5;
  float v6;
  UIView *v7;
  UIView *circleView;
  float v9;
  double v10;
  void *v11;
  void *v12;
  UILabel *v13;
  UILabel *countdownLabel;
  void *v15;
  void *v16;

  v3 = objc_alloc((Class)UIView);
  -[MPEmergencyCountdownView circleDiameter](self, "circleDiameter");
  v5 = v4;
  -[MPEmergencyCountdownView circleDiameter](self, "circleDiameter");
  v7 = (UIView *)objc_msgSend(v3, "initWithFrame:", 0.0, 0.0, v5, v6);
  circleView = self->_circleView;
  self->_circleView = v7;

  -[MPEmergencyCountdownView circleDiameter](self, "circleDiameter");
  v10 = (float)(v9 * 0.5);
  v11 = (void *)objc_claimAutoreleasedReturnValue(-[UIView layer](self->_circleView, "layer"));
  objc_msgSend(v11, "setCornerRadius:", v10);

  v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor redColor](UIColor, "redColor"));
  -[UIView setBackgroundColor:](self->_circleView, "setBackgroundColor:", v12);

  -[UIView setTranslatesAutoresizingMaskIntoConstraints:](self->_circleView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[MPEmergencyCountdownView addSubview:](self, "addSubview:", self->_circleView);
  v13 = (UILabel *)objc_alloc_init((Class)UILabel);
  countdownLabel = self->_countdownLabel;
  self->_countdownLabel = v13;

  -[UILabel setTextAlignment:](self->_countdownLabel, "setTextAlignment:", 1);
  -[UILabel setTranslatesAutoresizingMaskIntoConstraints:](self->_countdownLabel, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  -[UILabel setTextColor:](self->_countdownLabel, "setTextColor:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 70.0, UIFontWeightSemibold));
  -[UILabel setFont:](self->_countdownLabel, "setFont:", v16);

  -[MPEmergencyCountdownView addSubview:](self, "addSubview:", self->_countdownLabel);
  -[MPEmergencyCountdownView setupConstraints](self, "setupConstraints");
}

- (void)startCountdownFromNumber:(unint64_t)a3 withTimeInterval:(float)a4 completion:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  _QWORD v15[5];
  id v16;
  __int128 *p_buf;
  unint64_t v18;
  __int128 buf;
  uint64_t v20;
  unint64_t v21;

  v8 = a5;
  v9 = PHDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue(v9);
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    LODWORD(buf) = 134217984;
    *(_QWORD *)((char *)&buf + 4) = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "count down from number: %ld", (uint8_t *)&buf, 0xCu);
  }

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%ld"), a3));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView countdownLabel](self, "countdownLabel"));
  objc_msgSend(v12, "setText:", v11);

  -[MPEmergencyCountdownView cancel](self, "cancel");
  *(_QWORD *)&buf = 0;
  *((_QWORD *)&buf + 1) = &buf;
  v20 = 0x2020000000;
  v21 = a3;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C1F0;
  v15[3] = &unk_10007D6A8;
  p_buf = &buf;
  v18 = a3;
  v15[4] = self;
  v13 = v8;
  v16 = v13;
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSTimer scheduledTimerWithTimeInterval:repeats:block:](NSTimer, "scheduledTimerWithTimeInterval:repeats:block:", 1, v15, a4));
  -[MPEmergencyCountdownView setCountdownTimer:](self, "setCountdownTimer:", v14);

  _Block_object_dispose(&buf, 8);
}

- (void)cancel
{
  void *v3;
  unsigned int v4;
  void *v5;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView countdownTimer](self, "countdownTimer"));
  v4 = objc_msgSend(v3, "isValid");

  if (v4)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView countdownTimer](self, "countdownTimer"));
    objc_msgSend(v5, "invalidate");

    -[MPEmergencyCountdownView setCountdownTimer:](self, "setCountdownTimer:", 0);
  }
}

- (void)setupConstraints
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
  float v14;
  void *v15;
  void *v16;
  void *v17;
  float v18;
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
  _QWORD v38[8];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView countdownLabel](self, "countdownLabel"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "centerXAnchor"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "centerXAnchor"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "constraintEqualToAnchor:", v6));

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView countdownLabel](self, "countdownLabel"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "centerYAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "centerYAnchor"));
  v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v10));

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "widthAnchor"));
  -[MPEmergencyCountdownView circleDiameter](self, "circleDiameter");
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "constraintEqualToConstant:", v14));

  v16 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "heightAnchor"));
  -[MPEmergencyCountdownView circleDiameter](self, "circleDiameter");
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "constraintEqualToConstant:", v18));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView topAnchor](self, "topAnchor"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "topAnchor"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "constraintEqualToAnchor:", v22));

  v24 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView bottomAnchor](self, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "bottomAnchor"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "constraintEqualToAnchor:", v26));

  v28 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView leftAnchor](self, "leftAnchor"));
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "leftAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "constraintEqualToAnchor:", v30));

  v32 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView rightAnchor](self, "rightAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[MPEmergencyCountdownView circleView](self, "circleView"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "rightAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v34));

  v38[0] = v37;
  v38[1] = v11;
  v38[2] = v15;
  v38[3] = v19;
  v38[4] = v23;
  v38[5] = v27;
  v38[6] = v31;
  v38[7] = v35;
  v36 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v38, 8));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v36);

}

- (UILabel)countdownLabel
{
  return self->_countdownLabel;
}

- (UIView)circleView
{
  return self->_circleView;
}

- (NSTimer)countdownTimer
{
  return self->_countdownTimer;
}

- (void)setCountdownTimer:(id)a3
{
  objc_storeStrong((id *)&self->_countdownTimer, a3);
}

- (float)circleDiameter
{
  return self->_circleDiameter;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_countdownTimer, 0);
  objc_storeStrong((id *)&self->_circleView, 0);
  objc_storeStrong((id *)&self->_countdownLabel, 0);
}

@end

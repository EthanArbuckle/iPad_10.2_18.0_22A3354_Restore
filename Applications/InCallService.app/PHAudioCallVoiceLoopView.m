@implementation PHAudioCallVoiceLoopView

- (PHAudioCallVoiceLoopView)initWithFrame:(CGRect)a3
{
  PHAudioCallVoiceLoopView *v3;
  PHAudioCallVoiceLoopView *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)PHAudioCallVoiceLoopView;
  v3 = -[PHAudioCallVoiceLoopView initWithFrame:](&v6, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v4 = v3;
  if (v3)
    -[PHAudioCallVoiceLoopView commonInit](v3, "commonInit");
  return v4;
}

- (void)commonInit
{
  void *v3;
  unsigned int v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
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
  id v56;
  void *v57;
  void *v58;
  void *v59;
  _QWORD v60[4];
  id v61;
  id location;
  _QWORD v63[7];
  _QWORD v64[2];
  _QWORD v65[2];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PHAudioCallVoiceLoopView setBackgroundColor:](self, "setBackgroundColor:", v3);

  v4 = +[SOSUtilities isKappaUnmasked](SOSUtilities, "isKappaUnmasked");
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = v5;
  if (v4)
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_VOICE_LOOP_VIEW_DESCRIPTION"), &stru_10028DC20, CFSTR("Localizable-kappa")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_VOICE_LOOP_VIEW_BUTTON_LABEL"), &stru_10028DC20, CFSTR("Localizable-kappa")));
  }
  else
  {
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_MASKED_VOICE_LOOP_VIEW_DESCRIPTION"), &stru_10028DC20, CFSTR("Localizable-kappa")));

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("SOS_KAPPA_MASKED_VOICE_LOOP_VIEW_BUTTON_LABEL"), &stru_10028DC20, CFSTR("Localizable-kappa")));
  }

  v64[0] = NSFontAttributeName;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont systemFontOfSize:weight:](UIFont, "systemFontOfSize:weight:", 20.0, UIFontWeightSemibold));
  v65[0] = v8;
  v64[1] = NSForegroundColorAttributeName;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
  v65[1] = v9;
  v58 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v65, v64, 2));

  v56 = objc_msgSend(objc_alloc((Class)NSAttributedString), "initWithString:attributes:", v59, v58);
  v10 = objc_alloc_init((Class)UILabel);
  -[PHAudioCallVoiceLoopView setDescriptionText:](self, "setDescriptionText:", v10);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  objc_msgSend(v11, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  objc_msgSend(v12, "setText:", v57);

  v13 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont boldSystemFontOfSize:](UIFont, "boldSystemFontOfSize:", 34.0));
  v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  objc_msgSend(v14, "setFont:", v13);

  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  objc_msgSend(v15, "setTextAlignment:", 1);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  objc_msgSend(v17, "setTextColor:", v16);

  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  objc_msgSend(v18, "setNumberOfLines:", 0);

  v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  -[PHAudioCallVoiceLoopView addSubview:](self, "addSubview:", v19);

  objc_initWeak(&location, self);
  v60[0] = _NSConcreteStackBlock;
  v60[1] = 3221225472;
  v60[2] = sub_1000FDEF0;
  v60[3] = &unk_100285590;
  objc_copyWeak(&v61, &location);
  v38 = (void *)objc_claimAutoreleasedReturnValue(+[UIAction actionWithTitle:image:identifier:handler:](UIAction, "actionWithTitle:image:identifier:handler:", v59, 0, 0, v60));
  v20 = (void *)objc_claimAutoreleasedReturnValue(+[UIButton buttonWithType:primaryAction:](UIButton, "buttonWithType:primaryAction:", 0));
  -[PHAudioCallVoiceLoopView setStopVoiceLoopButton:](self, "setStopVoiceLoopButton:", v20);

  v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  objc_msgSend(v21, "setTranslatesAutoresizingMaskIntoConstraints:", 0);

  v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "layer"));
  objc_msgSend(v23, "setCornerRadius:", 36.0);

  v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  objc_msgSend(v25, "setBackgroundColor:", v24);

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  objc_msgSend(v26, "setAttributedTitle:forState:", v56, 0);

  v27 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  -[PHAudioCallVoiceLoopView addSubview:](self, "addSubview:", v27);

  v55 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "leadingAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView leadingAnchor](self, "leadingAnchor"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "constraintEqualToAnchor:constant:", v53, 30.0));
  v63[0] = v52;
  v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "trailingAnchor"));
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView trailingAnchor](self, "trailingAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:constant:", v49, -30.0));
  v63[1] = v48;
  v47 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView descriptionText](self, "descriptionText"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView centerYAnchor](self, "centerYAnchor"));
  v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "constraintEqualToAnchor:constant:", v45, -11.0));
  v63[2] = v44;
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "widthAnchor"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToConstant:", 300.0));
  v63[3] = v41;
  v40 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "heightAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "constraintEqualToConstant:", 72.0));
  v63[4] = v28;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "centerXAnchor"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView centerXAnchor](self, "centerXAnchor"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintEqualToAnchor:", v31));
  v63[5] = v32;
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView stopVoiceLoopButton](self, "stopVoiceLoopButton"));
  v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView centerYAnchor](self, "centerYAnchor"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "constraintEqualToAnchor:constant:", v35, 11.0));
  v63[6] = v36;
  v37 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v63, 7));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v37);

  objc_destroyWeak(&v61);
  objc_destroyWeak(&location);

}

- (void)stopVoiceLoopButtonPressed
{
  uint64_t v3;
  void *v4;
  void *v5;
  char v6;
  id v7;

  v3 = objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView delegate](self, "delegate"));
  if (v3)
  {
    v4 = (void *)v3;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView delegate](self, "delegate"));
    v6 = objc_opt_respondsToSelector(v5, "stopVoiceLoopButtonPressed");

    if ((v6 & 1) != 0)
    {
      v7 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallVoiceLoopView delegate](self, "delegate"));
      objc_msgSend(v7, "stopVoiceLoopButtonPressed");

    }
  }
}

- (PHAudioCallVoiceLoopViewDelegate)delegate
{
  return (PHAudioCallVoiceLoopViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UILabel)descriptionText
{
  return self->_descriptionText;
}

- (void)setDescriptionText:(id)a3
{
  objc_storeStrong((id *)&self->_descriptionText, a3);
}

- (UIButton)stopVoiceLoopButton
{
  return self->_stopVoiceLoopButton;
}

- (void)setStopVoiceLoopButton:(id)a3
{
  objc_storeStrong((id *)&self->_stopVoiceLoopButton, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stopVoiceLoopButton, 0);
  objc_storeStrong((id *)&self->_descriptionText, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

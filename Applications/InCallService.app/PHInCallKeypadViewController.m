@implementation PHInCallKeypadViewController

- (PHInCallKeypadViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  PHInCallKeypadViewController *v4;
  PHNumberPadKeyCommandHandler *v5;
  PHNumberPadKeyCommandHandler *numberPadKeyCommandHandler;
  TUDTMFSoundPlayer *v7;
  TUDTMFSoundPlayer *soundPlayer;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)PHInCallKeypadViewController;
  v4 = -[PHInCallKeypadViewController initWithNibName:bundle:](&v10, "initWithNibName:bundle:", a3, a4);
  if (v4)
  {
    v5 = -[PHNumberPadKeyCommandHandler initWithViewController:selector:]([PHNumberPadKeyCommandHandler alloc], "initWithViewController:selector:", v4, "handleNumberPadKeyCommand:");
    numberPadKeyCommandHandler = v4->_numberPadKeyCommandHandler;
    v4->_numberPadKeyCommandHandler = v5;

    v7 = (TUDTMFSoundPlayer *)objc_alloc_init((Class)TUDTMFSoundPlayer);
    soundPlayer = v4->_soundPlayer;
    v4->_soundPlayer = v7;

  }
  return v4;
}

- (void)dealloc
{
  objc_super v3;

  -[TPDialerNumberPad setDelegate:](self->_keypad, "setDelegate:", 0);
  v3.receiver = self;
  v3.super_class = (Class)PHInCallKeypadViewController;
  -[PHInCallKeypadViewController dealloc](&v3, "dealloc");
}

- (void)updateKeypadButtonBackgroundMaterial:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  void *v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController keypad](self, "keypad"));

  if (v5)
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController keypad](self, "keypad"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "buttons"));

    v15 = 0u;
    v16 = 0u;
    v13 = 0u;
    v14 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v14;
      do
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v14 != v11)
            objc_enumerationMutation(v8);
          objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)v12), "updateBackgroundMaterial:", v4, (_QWORD)v13);
          v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      }
      while (v10);
    }

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  id v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  PHInCallNumberPadButton *v11;
  uint64_t v12;
  void *v13;
  id v14;
  void *v15;
  void *v16;
  TPDialerNumberPad *keypad;
  TPDialerNumberPad *v18;
  TPDialerNumberPad *v19;
  void *v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  PHTransformableView *v25;
  void *v26;
  void *v27;
  void *v28;
  double v29;
  double v30;
  double v31;
  double v32;
  void *v33;
  void *v34;
  id v35;
  void *v36;
  id v37;
  id v38;
  void *v39;
  TPDialerNumberPad *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  id v45;
  id v46;
  uint64_t v47;
  void *j;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  PHTransformableView *v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  _BYTE v62[128];
  _BYTE v63[128];

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[TPDialerNumberPad dialerNumberPadFullCharacters](TPDialerNumberPad, "dialerNumberPadFullCharacters"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v58 = 0u;
  v59 = 0u;
  v60 = 0u;
  v61 = 0u;
  v5 = v3;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v59;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v59 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * (_QWORD)i);
        v11 = [PHInCallNumberPadButton alloc];
        v12 = (int)objc_msgSend(v10, "intValue");
        v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController traitCollection](self, "traitCollection"));
        v14 = -[PHInCallNumberPadButton initForCharacter:style:](v11, "initForCharacter:style:", v12, objc_msgSend(v13, "userInterfaceStyle"));

        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
        objc_msgSend(v15, "setAllowsGroupBlending:", 0);

        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "layer"));
        objc_msgSend(v16, "setAllowsGroupOpacity:", 0);

        objc_msgSend(v4, "addObject:", v14);
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v58, v63, 16);
    }
    while (v7);
  }

  keypad = self->_keypad;
  if (!keypad)
  {
    v18 = (TPDialerNumberPad *)objc_msgSend(objc_alloc((Class)TPDialerNumberPad), "initWithButtons:", v4);
    v19 = self->_keypad;
    self->_keypad = v18;

    -[TPDialerNumberPad setPlaysSounds:](self->_keypad, "setPlaysSounds:", 1);
    -[TPDialerNumberPad setDelegate:](self->_keypad, "setDelegate:", self);
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[TPDialerNumberPad layer](self->_keypad, "layer"));
    objc_msgSend(v20, "setAllowsGroupBlending:", 0);

    v21 = (void *)objc_claimAutoreleasedReturnValue(-[TPDialerNumberPad layer](self->_keypad, "layer"));
    objc_msgSend(v21, "setAllowsGroupOpacity:", 0);

    keypad = self->_keypad;
  }
  -[TPDialerNumberPad intrinsicContentSize](keypad, "intrinsicContentSize");
  v23 = v22;
  -[TPDialerNumberPad intrinsicContentSize](self->_keypad, "intrinsicContentSize");
  -[TPDialerNumberPad setFrame:](self->_keypad, "setFrame:", 0.0, 0.0, v23, v24);
  v25 = objc_alloc_init(PHTransformableView);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
  -[PHTransformableView setBackgroundColor:](v25, "setBackgroundColor:", v26);

  -[TPDialerNumberPad frame](self->_keypad, "frame");
  -[PHTransformableView setFrame:](v25, "setFrame:");
  -[PHTransformableView setTranslatesAutoresizingMaskIntoConstraints:](v25, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[PHTransformableView addSubview:](v25, "addSubview:", self->_keypad);
  v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 8, 0, self->_keypad, 8, 1.0, 0.0));
  -[PHTransformableView addConstraint:](v25, "addConstraint:", v27);

  v28 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v25, 7, 0, self->_keypad, 7, 1.0, 0.0));
  -[PHTransformableView addConstraint:](v25, "addConstraint:", v28);

  LODWORD(v29) = 1148846080;
  -[PHTransformableView setContentHuggingPriority:forAxis:](v25, "setContentHuggingPriority:forAxis:", 0, v29);
  LODWORD(v30) = 1148846080;
  -[PHTransformableView setContentHuggingPriority:forAxis:](v25, "setContentHuggingPriority:forAxis:", 1, v30);
  LODWORD(v31) = 1148846080;
  -[PHTransformableView setContentCompressionResistancePriority:forAxis:](v25, "setContentCompressionResistancePriority:forAxis:", 0, v31);
  LODWORD(v32) = 1148846080;
  -[PHTransformableView setContentCompressionResistancePriority:forAxis:](v25, "setContentCompressionResistancePriority:forAxis:", 1, v32);
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[PHTransformableView layer](v25, "layer"));
  objc_msgSend(v33, "setAllowsGroupBlending:", 0);

  v34 = (void *)objc_claimAutoreleasedReturnValue(-[PHTransformableView layer](v25, "layer"));
  objc_msgSend(v34, "setAllowsGroupOpacity:", 0);

  -[PHInCallKeypadViewController setView:](self, "setView:", v25);
  v35 = (id)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  if (!objc_msgSend(v35, "isButtonLayoutEnabled"))
    goto LABEL_20;
  v36 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController captureView](self, "captureView"));

  if (!v36)
  {
    v37 = objc_alloc((Class)_UIVisualEffectBackdropView);
    -[TPDialerNumberPad frame](self->_keypad, "frame");
    v38 = objc_msgSend(v37, "initWithFrame:");
    -[PHInCallKeypadViewController setCaptureView:](self, "setCaptureView:", v38);

    v39 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController captureView](self, "captureView"));
    objc_msgSend(v39, "setAutoresizingMask:", 18);

    v40 = self->_keypad;
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController captureView](self, "captureView"));
    -[TPDialerNumberPad insertSubview:atIndex:](v40, "insertSubview:atIndex:", v41, 0);

    v42 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController captureView](self, "captureView"));
    objc_msgSend(v42, "setRenderMode:", 1);

    v43 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController captureView](self, "captureView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "captureGroup"));
    objc_msgSend(v44, "setGroupName:", CFSTR("InCallKeypadButtonsCaptureGroup"));

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v35 = v4;
    v45 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
    if (v45)
    {
      v46 = v45;
      v53 = v25;
      v47 = *(_QWORD *)v55;
      do
      {
        for (j = 0; j != v46; j = (char *)j + 1)
        {
          if (*(_QWORD *)v55 != v47)
            objc_enumerationMutation(v35);
          v49 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * (_QWORD)j);
          v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "backDropVisualEffectView"));
          objc_msgSend(v50, "_setGroupName:", CFSTR("InCallKeypadButtonsCaptureGroup"));

          v51 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController captureView](self, "captureView"));
          v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "backDropVisualEffectView"));
          objc_msgSend(v52, "_setCaptureView:", v51);

        }
        v46 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v54, v62, 16);
      }
      while (v46);
      v25 = v53;
    }
LABEL_20:

  }
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PHInCallKeypadViewController;
  -[PHInCallKeypadViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  -[PHInCallKeypadViewController becomeFirstResponder](self, "becomeFirstResponder");
}

- (void)handleNumberPadKeyCommand:(id)a3
{
  id v4;
  void *v5;
  _QWORD v6[5];

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHInCallKeypadViewController numberPadKeyCommandHandler](self, "numberPadKeyCommandHandler"));
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10009E498;
  v6[3] = &unk_100286FB8;
  v6[4] = self;
  objc_msgSend(v5, "handleKeyCommand:receivedCharacterBlock:receivedSpecialCharacterBlock:", v4, v6, 0);

}

- (void)phonePad:(id)a3 keyDown:(char)a4
{
  -[PHInCallKeypadViewController handleNumberPadCharacter:](self, "handleNumberPadCharacter:", a4);
}

- (void)handleNumberPadCharacter:(char)a3
{
  int v3;
  void *v4;
  void *v5;
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  uint8_t buf[16];

  v3 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "displayedCallFromCalls:", 0));

  if (objc_msgSend(v5, "shouldPlayDTMFTone"))
  {
    v6 = sub_1000C5588();
    v7 = objc_claimAutoreleasedReturnValue(v6);
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Will play DTMF tone due to phonePad keyDown event, and a supporting displayedCall", buf, 2u);
    }

    objc_msgSend(v5, "playDTMFToneForKey:", v3);
  }
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%c"), v3));
  objc_msgSend(v8, "postNotificationName:object:userInfo:", CFSTR("PHInCallKeypadDataSourceChangedNotification"), v9, 0);

}

- (TPDialerNumberPad)keypad
{
  return (TPDialerNumberPad *)objc_getProperty(self, a2, 8, 1);
}

- (void)setKeypad:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 8);
}

- (PHNumberPadKeyCommandHandler)numberPadKeyCommandHandler
{
  return self->_numberPadKeyCommandHandler;
}

- (TUDTMFSoundPlayer)soundPlayer
{
  return self->_soundPlayer;
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
  objc_storeStrong((id *)&self->_captureView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_soundPlayer, 0);
  objc_storeStrong((id *)&self->_numberPadKeyCommandHandler, 0);
  objc_storeStrong((id *)&self->_keypad, 0);
}

@end

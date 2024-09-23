@implementation VMMessageToolbar

- (void)setButtonType:(unint64_t)a3 enabled:(BOOL)a4
{
  _BOOL4 v4;
  void *v5;
  id v6;

  v4 = a4;
  switch(a3)
  {
    case 3uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));
      break;
    case 2uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
      break;
    case 1uLL:
      v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
      break;
    default:
      return;
  }
  v6 = v5;
  objc_msgSend(v5, "setHidden:", !v4);

}

- (void)setRestricted:(BOOL)a3
{
  if (self->_restricted != a3)
  {
    self->_restricted = a3;
    -[VMMessageToolbar updateButtonsState](self, "updateButtonsState");
  }
}

- (void)updateAudioRouteButtonWithTouchUpInsideEnabled:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  id v6;

  v3 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v6 = v5;
  if (v3)
    objc_msgSend(v5, "addTarget:action:forControlEvents:", self, "handleActionForButtonSender:event:", 64);
  else
    objc_msgSend(v5, "removeTarget:forEvents:", self, 64);

}

- (void)updateButtonsState
{
  unsigned int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;

  v3 = -[VMMessageToolbar isRestricted](self, "isRestricted");
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v5 = v4;
  if (v3)
  {
    objc_msgSend(v4, "setEnabled:", 0);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
    v7 = v6;
    v8 = 0;
  }
  else
  {
    objc_msgSend(v4, "setEnabled:", 1);

    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
    v7 = v6;
    v8 = 1;
  }
  objc_msgSend(v6, "setEnabled:", v8);

  -[VMMessageToolbar updateRTTButton](self, "updateRTTButton");
}

- (void)commonInit
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)VMMessageToolbar;
  -[VMMessageToolbar commonInit](&v3, "commonInit");
  -[VMMessageToolbar loadViews](self, "loadViews");
}

- (void)loadViews
{
  VMRoundButton *v3;
  VMRoundButton *audioRouteButton;
  VMRoundButton *v5;
  VMRoundButton *dialRequestButton;
  VMRoundButton *v7;
  VMRoundButton *trashButton;
  VMPlayerControlButton *v9;
  VMPlayerControlButton *playerControlButton;
  uint64_t v11;
  uint64_t v12;
  VMRTTButton *v13;
  VMRTTButton *rttButton;

  v3 = -[VMRoundButton initWithType:]([VMRoundButton alloc], "initWithType:", 1);
  audioRouteButton = self->_audioRouteButton;
  self->_audioRouteButton = v3;

  -[VMRoundButton setTranslatesAutoresizingMaskIntoConstraints:](self->_audioRouteButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMMessageToolbar updateAudioRouteButtonWithTouchUpInsideEnabled:](self, "updateAudioRouteButtonWithTouchUpInsideEnabled:", 1);
  -[VMMessageToolbar addSubview:](self, "addSubview:", self->_audioRouteButton);
  v5 = -[VMRoundButton initWithType:]([VMRoundButton alloc], "initWithType:", 2);
  dialRequestButton = self->_dialRequestButton;
  self->_dialRequestButton = v5;

  -[VMRoundButton setTranslatesAutoresizingMaskIntoConstraints:](self->_dialRequestButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMRoundButton addTarget:action:forControlEvents:](self->_dialRequestButton, "addTarget:action:forControlEvents:", self, "handleActionForButtonSender:event:", 64);
  -[VMMessageToolbar addSubview:](self, "addSubview:", self->_dialRequestButton);
  v7 = -[VMRoundButton initWithType:]([VMRoundButton alloc], "initWithType:", 3);
  trashButton = self->_trashButton;
  self->_trashButton = v7;

  -[VMRoundButton setTranslatesAutoresizingMaskIntoConstraints:](self->_trashButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMRoundButton addTarget:action:forControlEvents:](self->_trashButton, "addTarget:action:forControlEvents:", self, "handleActionForButtonSender:event:", 64);
  -[VMMessageToolbar addSubview:](self, "addSubview:", self->_trashButton);
  v9 = (VMPlayerControlButton *)objc_claimAutoreleasedReturnValue(+[VMPlayerControlButton buttonWithState:](VMPlayerControlButton, "buttonWithState:", 0));
  playerControlButton = self->_playerControlButton;
  self->_playerControlButton = v9;

  -[VMPlayerControlButton setTranslatesAutoresizingMaskIntoConstraints:](self->_playerControlButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[VMPlayerControlButton addTarget:action:forControlEvents:](self->_playerControlButton, "addTarget:action:forControlEvents:", self, "handleActionForPlayerControlButtonSender:event:", 64);
  -[VMMessageToolbar addSubview:](self, "addSubview:", self->_playerControlButton);
  if (TUCallScreeningRTTEnabled(0, v11, v12))
  {
    v13 = objc_alloc_init(VMRTTButton);
    rttButton = self->_rttButton;
    self->_rttButton = v13;

    -[VMRTTButton setTranslatesAutoresizingMaskIntoConstraints:](self->_rttButton, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[VMRTTButton addTarget:action:forControlEvents:](self->_rttButton, "addTarget:action:forControlEvents:", self, "handleActionForRTTButtonSender:event:", 64);
    -[VMMessageToolbar addSubview:](self, "addSubview:", self->_rttButton);
  }
  -[VMMessageToolbar updateButtonsState](self, "updateButtonsState");
}

- (void)loadConstraints
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
  uint64_t v12;
  uint64_t v13;
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
  void *v85;
  void *v86;
  void *v87;
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
  id v98;
  id v99;
  objc_super v100;
  _QWORD v101[3];
  _QWORD v102[17];

  v100.receiver = self;
  v100.super_class = (Class)VMMessageToolbar;
  -[VMMessageToolbar loadConstraints](&v100, "loadConstraints");
  v98 = objc_alloc((Class)NSMutableArray);
  v94 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar leadingAnchor](self, "leadingAnchor"));
  v96 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v92 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v96, "leadingAnchor"));
  v90 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v94, "constraintEqualToAnchor:constant:", v92, 0.0));
  v102[0] = v90;
  v86 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar topAnchor](self, "topAnchor"));
  v88 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v84 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v88, "topAnchor"));
  v83 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v86, "constraintEqualToAnchor:constant:", v84, -18.0));
  v102[1] = v83;
  v81 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar bottomAnchor](self, "bottomAnchor"));
  v82 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v80 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v82, "bottomAnchor"));
  v79 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v81, "constraintEqualToAnchor:constant:", v80, 16.0));
  v102[2] = v79;
  v78 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v77 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v78, "widthAnchor"));
  -[VMMessageToolbar playerControlButtonWidthLayoutConstraintConstant](self, "playerControlButtonWidthLayoutConstraintConstant");
  v76 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v77, "constraintEqualToConstant:"));
  v102[3] = v76;
  v75 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v73 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v75, "centerYAnchor"));
  v74 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v72 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v74, "centerYAnchor"));
  v71 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v73, "constraintEqualToAnchor:", v72));
  v102[4] = v71;
  v70 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v70, "heightAnchor"));
  v68 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v69, "constraintEqualToConstant:", 37.0));
  v102[5] = v68;
  v67 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v65 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v67, "bottomAnchor"));
  v66 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v64 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v66, "bottomAnchor"));
  v63 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v65, "constraintEqualToAnchor:", v64));
  v102[6] = v63;
  v62 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v60 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v62, "trailingAnchor"));
  v61 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
  v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v61, "leadingAnchor"));
  v58 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToAnchor:constant:", v59, -20.0));
  v102[7] = v58;
  v57 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v56 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v57, "widthAnchor"));
  v55 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "constraintEqualToConstant:", 37.0));
  v102[8] = v55;
  v54 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
  v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "topAnchor"));
  v53 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v51 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v53, "topAnchor"));
  v50 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v52, "constraintEqualToAnchor:", v51));
  v102[9] = v50;
  v49 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
  v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "bottomAnchor"));
  v48 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v46 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v48, "bottomAnchor"));
  v45 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v47, "constraintEqualToAnchor:", v46));
  v102[10] = v45;
  v44 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
  v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "trailingAnchor"));
  v43 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));
  v41 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v43, "leadingAnchor"));
  v40 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v42, "constraintEqualToAnchor:constant:", v41, -20.0));
  v102[11] = v40;
  v39 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
  v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "widthAnchor"));
  v38 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));
  v36 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v38, "widthAnchor"));
  v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v37, "constraintEqualToAnchor:", v36));
  v102[12] = v35;
  v34 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));
  v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "topAnchor"));
  v33 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v33, "topAnchor"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "constraintEqualToAnchor:", v31));
  v102[13] = v30;
  v29 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "bottomAnchor"));
  v28 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v28, "bottomAnchor"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "constraintEqualToAnchor:", v26));
  v102[14] = v25;
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));
  v3 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "widthAnchor"));
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "widthAnchor"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "constraintEqualToAnchor:", v5));
  v102[15] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "trailingAnchor"));
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trailingAnchor](self, "trailingAnchor"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "constraintEqualToAnchor:", v9));
  v102[16] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v102, 17));
  v99 = objc_msgSend(v98, "initWithArray:", v11);

  if (TUCallScreeningRTTEnabled(0, v12, v13))
  {
    v97 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    v93 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v97, "topAnchor"));
    v95 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
    v91 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v95, "topAnchor"));
    v89 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v93, "constraintEqualToAnchor:", v91));
    v101[0] = v89;
    v87 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    v85 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v87, "bottomAnchor"));
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "bottomAnchor"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v85, "constraintEqualToAnchor:", v15));
    v101[1] = v16;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "leadingAnchor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "trailingAnchor"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "constraintEqualToAnchor:constant:", v20, 20.0));
    v101[2] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v101, 3));
    objc_msgSend(v99, "addObjectsFromArray:", v22);

  }
  -[VMMessageToolbar setStandardConstraints:](self, "setStandardConstraints:", v99);
  v23 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar standardConstraints](self, "standardConstraints"));
  +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v23);

}

- (void)unloadConstraints
{
  void *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)VMMessageToolbar;
  -[VMMessageToolbar unloadConstraints](&v4, "unloadConstraints");
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar standardConstraints](self, "standardConstraints"));
  +[NSLayoutConstraint deactivateConstraints:](NSLayoutConstraint, "deactivateConstraints:", v3);

}

- (void)setPlayerControlState:(int64_t)a3
{
  void *v3;
  uint64_t v4;
  id v5;

  if (!a3 || a3 == 2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
    v5 = v3;
    v4 = 1;
  }
  else
  {
    if (a3 != 1)
      return;
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
    v5 = v3;
    v4 = 0;
  }
  objc_msgSend(v3, "setPlayerState:enabled:", v4, 1);

}

- (void)updateRTTButton
{
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (-[VMMessageToolbar _shouldShowRTTButton](self, "_shouldShowRTTButton")
    && !-[VMMessageToolbar isRestricted](self, "isRestricted"))
  {
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    objc_msgSend(v6, "setHidden:", 0);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    v7 = v4;
    v5 = 1;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    objc_msgSend(v3, "setHidden:", 1);

    v4 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar rttButton](self, "rttButton"));
    v7 = v4;
    v5 = 0;
  }
  objc_msgSend(v4, "setEnabled:", v5);

}

- (BOOL)_shouldShowRTTButton
{
  void *v3;
  unsigned int v4;
  void *v5;
  unsigned __int8 v6;

  if (!TUCallScreeningRTTEnabled(0, a2))
    return 0;
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "conformsToProtocol:", &OBJC_PROTOCOL___VMMessageToolbarDelegate);

  if (!v4)
    return 0;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar delegate](self, "delegate"));
  if ((objc_opt_respondsToSelector(v5, "messageToolbarShouldShowRTTButton:") & 1) != 0)
    v6 = objc_msgSend(v5, "messageToolbarShouldShowRTTButton:", self);
  else
    v6 = 0;

  return v6;
}

- (void)handleActionForPlayerControlButtonSender:(id)a3 event:(id)a4
{
  id v5;
  void *v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;

  v13 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));

  v6 = v13;
  if (v5 == v13)
  {
    v7 = objc_msgSend(v13, "playerState");
    v8 = v7 == (id)1 ? 2 : v7 == 0;
    objc_msgSend(v13, "setPlayerState:enabled:", v7 != (id)1, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlsView](self, "playerControlsView"));

    v6 = v13;
    if (v9)
    {
      v10 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlsView](self, "playerControlsView"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "delegate"));

      if ((objc_opt_respondsToSelector(v11, "playbackControls:didRequestState:") & 1) != 0)
      {
        v12 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlsView](self, "playerControlsView"));
        objc_msgSend(v11, "playbackControls:didRequestState:", v12, v8);

      }
      v6 = v13;
    }
  }

}

- (void)handleActionForButtonSender:(id)a3 event:(id)a4
{
  void *v5;
  unsigned int v6;
  void *v7;
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;

  v12 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___VMMessageToolbarDelegate);

  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v7, "messageToolbar:handleActionForButtonType:") & 1) != 0)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar audioRouteButton](self, "audioRouteButton"));

      if (v8 == v12)
      {
        v11 = 1;
        goto LABEL_9;
      }
      v9 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar dialRequestButton](self, "dialRequestButton"));

      if (v9 == v12)
      {
        v11 = 2;
        goto LABEL_9;
      }
      v10 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar trashButton](self, "trashButton"));

      if (v10 == v12)
      {
        v11 = 3;
LABEL_9:
        objc_msgSend(v7, "messageToolbar:handleActionForButtonType:", self, v11);
      }
    }

  }
}

- (void)handleActionForRTTButtonSender:(id)a3 event:(id)a4
{
  void *v5;
  unsigned int v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar delegate](self, "delegate", a3, a4));
  v6 = objc_msgSend(v5, "conformsToProtocol:", &OBJC_PROTOCOL___VMMessageToolbarDelegate);

  if (v6)
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar delegate](self, "delegate"));
    if ((objc_opt_respondsToSelector(v7, "messageToolbarDidSelectRTTButton:") & 1) != 0)
      objc_msgSend(v7, "messageToolbarDidSelectRTTButton:", self);

  }
}

- (double)playerControlButtonWidthLayoutConstraintConstant
{
  void *v2;
  id v3;
  void *v4;
  void *v5;
  double v6;
  double v7;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[VMMessageToolbar playerControlButton](self, "playerControlButton"));
  v3 = objc_msgSend(v2, "playerState");

  if (v3 == (id)1)
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage voicemailPlayGlyphImage](UIImage, "voicemailPlayGlyphImage"));
  else
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage voicemailPauseGlyphImage](UIImage, "voicemailPauseGlyphImage"));
  v5 = v4;
  objc_msgSend(v4, "size");
  v7 = v6;

  return v7;
}

- (VMMessageToolbarDelegate)delegate
{
  return (VMMessageToolbarDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (VMRoundButton)audioRouteButton
{
  return self->_audioRouteButton;
}

- (void)setAudioRouteButton:(id)a3
{
  objc_storeStrong((id *)&self->_audioRouteButton, a3);
}

- (VMRoundButton)dialRequestButton
{
  return self->_dialRequestButton;
}

- (void)setDialRequestButton:(id)a3
{
  objc_storeStrong((id *)&self->_dialRequestButton, a3);
}

- (VMRoundButton)trashButton
{
  return self->_trashButton;
}

- (void)setTrashButton:(id)a3
{
  objc_storeStrong((id *)&self->_trashButton, a3);
}

- (VMPlayerControlButton)playerControlButton
{
  return self->_playerControlButton;
}

- (void)setPlayerControlButton:(id)a3
{
  objc_storeStrong((id *)&self->_playerControlButton, a3);
}

- (VMRTTButton)rttButton
{
  return self->_rttButton;
}

- (void)setRttButton:(id)a3
{
  objc_storeStrong((id *)&self->_rttButton, a3);
}

- (VMPlayerControlsView)playerControlsView
{
  return (VMPlayerControlsView *)objc_loadWeakRetained((id *)&self->_playerControlsView);
}

- (void)setPlayerControlsView:(id)a3
{
  objc_storeWeak((id *)&self->_playerControlsView, a3);
}

- (BOOL)isRestricted
{
  return self->_restricted;
}

- (NSArray)standardConstraints
{
  return self->_standardConstraints;
}

- (void)setStandardConstraints:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_standardConstraints, 0);
  objc_destroyWeak((id *)&self->_playerControlsView);
  objc_storeStrong((id *)&self->_rttButton, 0);
  objc_storeStrong((id *)&self->_playerControlButton, 0);
  objc_storeStrong((id *)&self->_trashButton, 0);
  objc_storeStrong((id *)&self->_dialRequestButton, 0);
  objc_storeStrong((id *)&self->_audioRouteButton, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

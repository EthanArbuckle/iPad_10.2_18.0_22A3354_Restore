@implementation PHCarPlayInCallButtonsView

- (PHCarPlayInCallButtonsView)initWithFrame:(CGRect)a3
{
  PHCarPlayInCallButtonsView *v3;
  double v4;
  PHCarPlayInCallButtonsView *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)PHCarPlayInCallButtonsView;
  v3 = -[PHCarPlayInCallButtonsView initWithFrame:](&v12, "initWithFrame:", a3.origin.x, a3.origin.y, a3.size.width, a3.size.height);
  v5 = v3;
  if (v3)
  {
    LODWORD(v4) = 1066779279;
    -[PHCarPlayInCallButtonsView setButtonDistributionScalingFactor:](v3, "setButtonDistributionScalingFactor:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableDictionary dictionary](NSMutableDictionary, "dictionary"));
    -[PHCarPlayInCallButtonsView setButtonsDictionary:](v5, "setButtonsDictionary:", v6);

    v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
    -[PHCarPlayInCallButtonsView setButtonDividerViews:](v5, "setButtonDividerViews:", v7);

    v8 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor tableBackgroundColor](UIColor, "tableBackgroundColor"));
    -[PHCarPlayInCallButtonsView setBackgroundColor:](v5, "setBackgroundColor:", v8);

    -[PHCarPlayInCallButtonsView setOpaque:](v5, "setOpaque:", 0);
    v5->_buttonsMode = -1;
    v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v9, "addObserver:selector:name:object:", v5, "callModelChangedNotification:", TUCallModelChangedNotification, 0);

    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
    objc_msgSend(v10, "addObserver:selector:name:object:", v5, "phoneCallStatusChangedNotification:", TUCallCenterCallStatusChangedNotification, 0);

  }
  return v5;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v3, "removeObserver:", self);

  +[NSObject cancelPreviousPerformRequestsWithTarget:](NSObject, "cancelPreviousPerformRequestsWithTarget:", self);
  self->_delegate = 0;
  v4.receiver = self;
  v4.super_class = (Class)PHCarPlayInCallButtonsView;
  -[PHCarPlayInCallButtonsView dealloc](&v4, "dealloc");
}

- (int64_t)numberOfControls
{
  void *v2;
  id v3;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsArray](self, "buttonsArray"));
  v3 = objc_msgSend(v2, "count");

  return (int64_t)v3;
}

- (BOOL)canBecomeFirstResponder
{
  return 1;
}

- (void)setMuted:(BOOL)a3
{
  double v3;
  _BOOL8 v4;
  id v5;

  v4 = a3;
  LODWORD(v3) = 0;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:](self, "buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:", 1, 0, v3));
  objc_msgSend(v5, "setToggledOn:", v4);

}

- (void)setButtonsMode:(int)a3 animated:(BOOL)a4
{
  id v6;
  NSObject *v7;
  double v8;
  void *v9;
  unsigned int v10;
  _UNKNOWN **v11;
  _UNKNOWN **v12;
  _UNKNOWN **v13;
  void *v14;
  void *v15;
  unsigned int v16;
  double v17;
  void *v18;
  unsigned int v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  _UNKNOWN **v28;
  _QWORD *v29;
  void *v30;
  void *v31;
  void *v32;
  id v33;
  void *v34;
  void *v35;
  id v36;
  id v37;
  uint64_t v38;
  void *i;
  id v40;
  id v41;
  id v42;
  _QWORD *v43;
  id v44;
  id v45;
  void ***v46;
  uint64_t v47;
  double v48;
  void **v49;
  uint64_t v50;
  _DWORD *(*v51)(_DWORD *, int);
  void *v52;
  PHCarPlayInCallButtonsView *v53;
  id v54;
  id v55;
  int v56;
  _QWORD v57[4];
  id v58;
  PHCarPlayInCallButtonsView *v59;
  id v60;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _QWORD v66[5];
  id v67;
  double v68;
  _BYTE v69[128];
  _QWORD v70[3];
  _QWORD v71[3];
  uint8_t buf[4];
  int v73;

  v6 = sub_1000C5588();
  v7 = objc_claimAutoreleasedReturnValue(v6);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 67109120;
    v73 = a3;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "buttonsMode: %d", buf, 8u);
  }

  LODWORD(v8) = 1066779279;
  -[PHCarPlayInCallButtonsView setButtonDistributionScalingFactor:](self, "setButtonDistributionScalingFactor:", v8);
  switch(a3)
  {
    case 0:
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
      v10 = objc_msgSend(v9, "isKeypadAllowed");

      v11 = &off_1002971B8;
      v12 = &off_1002971A0;
      goto LABEL_22;
    case 1:
      v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
      v10 = objc_msgSend(v14, "isKeypadAllowed");

      v11 = &off_1002971E8;
      v12 = &off_1002971D0;
      goto LABEL_22;
    case 2:
      v13 = &off_100297200;
      goto LABEL_25;
    case 3:
      v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
      v16 = objc_msgSend(v15, "canSendMessage");

      if (v16)
      {
        LODWORD(v17) = 1.25;
        -[PHCarPlayInCallButtonsView setButtonDistributionScalingFactor:](self, "setButtonDistributionScalingFactor:", v17);
        v13 = &off_100297230;
      }
      else
      {
        v13 = &off_100297248;
      }
      goto LABEL_25;
    case 4:
      v13 = &off_100297218;
      goto LABEL_25;
    case 5:
      v18 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v19 = objc_msgSend(v18, "isHoldAndAnswerAllowed");

      if (v19)
      {
        v20 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
        v21 = objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "callWithStatus:", 2));
        if (v21)
        {
          v22 = (void *)v21;
          v23 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
          v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "callWithStatus:", 1));

          if (v24)
          {
            v71[0] = &off_100296A60;
            v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
            if (objc_msgSend(v25, "isSendToVoicemailAllowed"))
              v26 = 16;
            else
              v26 = 13;
            v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v26));
            v71[1] = v27;
            v28 = &off_100296A78;
            v29 = v71;
LABEL_40:
            v29[2] = v28;
            v13 = (_UNKNOWN **)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:"));

            LODWORD(v48) = 1.25;
            -[PHCarPlayInCallButtonsView setButtonDistributionScalingFactor:](self, "setButtonDistributionScalingFactor:", v48);
            goto LABEL_25;
          }
        }
        else
        {

        }
        v70[0] = &off_100296A60;
        v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
        if (objc_msgSend(v25, "isSendToVoicemailAllowed"))
          v47 = 16;
        else
          v47 = 13;
        v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithInt:](NSNumber, "numberWithInt:", v47));
        v70[1] = v27;
        v28 = &off_100296A90;
        v29 = v70;
        goto LABEL_40;
      }
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
      v10 = objc_msgSend(v31, "canSendMessage");

      v11 = &off_100297290;
      v12 = &off_100297278;
LABEL_22:
      if (v10)
        v13 = v12;
      else
        v13 = v11;
LABEL_25:
      v32 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_1000BC100;
      v66[3] = &unk_100287498;
      v66[4] = self;
      v68 = (float)(1.0 / (float)((float)(unint64_t)objc_msgSend(v13, "count") + 1.0));
      v33 = v32;
      v67 = v33;
      objc_msgSend(v13, "enumerateObjectsUsingBlock:", v66);
      -[PHCarPlayInCallButtonsView setNeedsLayout](self, "setNeedsLayout");
      -[PHCarPlayInCallButtonsView layoutIfNeeded](self, "layoutIfNeeded");
      -[PHCarPlayInCallButtonsView setButtonsArray:](self, "setButtonsArray:", v33);
      v34 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
      v35 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView existingButtonsNotInArray:](self, "existingButtonsNotInArray:", v33));
      v62 = 0u;
      v63 = 0u;
      v64 = 0u;
      v65 = 0u;
      v36 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
      if (v36)
      {
        v37 = v36;
        v38 = *(_QWORD *)v63;
        do
        {
          for (i = 0; i != v37; i = (char *)i + 1)
          {
            if (*(_QWORD *)v63 != v38)
              objc_enumerationMutation(v35);
            if (objc_msgSend(*(id *)(*((_QWORD *)&v62 + 1) + 8 * (_QWORD)i), "isSelected"))
              -[PHCarPlayInCallButtonsView setNeedsFocusUpdate](self, "setNeedsFocusUpdate");
          }
          v37 = objc_msgSend(v35, "countByEnumeratingWithState:objects:count:", &v62, v69, 16);
        }
        while (v37);
      }
      v57[0] = _NSConcreteStackBlock;
      v57[1] = 3221225472;
      v57[2] = sub_1000BC178;
      v57[3] = &unk_100285310;
      v58 = v33;
      v59 = self;
      v40 = v35;
      v60 = v40;
      v41 = v34;
      v61 = v41;
      v42 = v33;
      v43 = objc_retainBlock(v57);
      v49 = _NSConcreteStackBlock;
      v50 = 3221225472;
      v51 = sub_1000BC494;
      v52 = &unk_1002874C0;
      v56 = a3;
      v53 = self;
      v54 = v40;
      v55 = v41;
      v44 = v41;
      v45 = v40;
      v46 = objc_retainBlock(&v49);
      +[UIView animateWithDuration:animations:completion:](UIView, "animateWithDuration:animations:completion:", v43, v46, 0.349999994, v49, v50, v51, v52, v53);
      -[PHCarPlayInCallButtonsView updateButtonsForCallModelState](self, "updateButtonsForCallModelState");
      self->_buttonsMode = a3;

      return;
    case 6:
      v13 = &off_100297260;
      goto LABEL_25;
    case 7:
      v30 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
      v10 = objc_msgSend(v30, "isKeypadAllowed");

      v11 = &off_1002972C0;
      v12 = &off_1002972A8;
      goto LABEL_22;
    default:
      v13 = 0;
      goto LABEL_25;
  }
}

- (void)removeButtons:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsDictionary](self, "buttonsDictionary"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "keyEnumerator"));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v7 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));
  if (v7)
  {
    v8 = (void *)v7;
    do
    {
      v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsDictionary](self, "buttonsDictionary"));
      v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKey:", v8));

      if (objc_msgSend(v13, "containsObject:", v10))
      {
        objc_msgSend(v10, "removeFromSuperview");
        objc_msgSend(v6, "addObject:", v8);
      }

      v11 = objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "nextObject"));
      v8 = (void *)v11;
    }
    while (v11);
  }
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsDictionary](self, "buttonsDictionary"));
  objc_msgSend(v12, "removeObjectsForKeys:", v6);

}

- (void)applyHorizontalPositioningConstraintWithFraction:(float)a3 forButton:(id)a4
{
  void *v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "horizontalPositioningConstraint"));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "horizontalPositioningConstraint"));
    -[PHCarPlayInCallButtonsView removeConstraint:](self, "removeConstraint:", v8);

  }
  *(float *)&v7 = a3;
  -[PHCarPlayInCallButtonsView distributedFractionForUndistributedFraction:](self, "distributedFractionForUndistributedFraction:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 9, 0, self, 2, v9, 0.0));
  -[PHCarPlayInCallButtonsView addConstraint:](self, "addConstraint:", v10);
  objc_msgSend(v11, "setHorizontalPositioningConstraint:", v10);

}

- (void)applyHorizontalPositioningConstraintWithFraction:(float)a3 forDividerView:(id)a4
{
  void *v6;
  double v7;
  void *v8;
  float v9;
  void *v10;
  id v11;

  v11 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "horizontalPositioningConstraint"));

  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "horizontalPositioningConstraint"));
    -[PHCarPlayInCallButtonsView removeConstraint:](self, "removeConstraint:", v8);

  }
  *(float *)&v7 = a3;
  -[PHCarPlayInCallButtonsView distributedFractionForUndistributedFraction:](self, "distributedFractionForUndistributedFraction:", v7);
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v11, 9, 0, self, 2, v9, 0.0));
  -[PHCarPlayInCallButtonsView addConstraint:](self, "addConstraint:", v10);
  objc_msgSend(v11, "setHorizontalPositioningConstraint:", v10);

}

- (float)distributedFractionForUndistributedFraction:(float)a3
{
  float v3;
  float v4;

  v3 = a3 + -0.5;
  -[PHCarPlayInCallButtonsView buttonDistributionScalingFactor](self, "buttonDistributionScalingFactor");
  return (float)(v3 * v4) + 0.5;
}

- (void)updateButtonsForCallModelState
{
  double v2;
  double v4;
  void *v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  id v17;

  LODWORD(v2) = 0;
  v17 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:](self, "buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:", 3, 0, v2));
  if (v17)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
    objc_msgSend(v17, "setEnabled:", objc_msgSend(v5, "isAddCallAllowed"));

  }
  LODWORD(v4) = 0;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:](self, "buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:", 5, 0, v4));
  if (v6)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
    objc_msgSend(v6, "setEnabled:", objc_msgSend(v8, "isMergeCallsAllowed"));

  }
  LODWORD(v7) = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:](self, "buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:", 6, 0, v7));
  if (v9)
  {
    v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
    objc_msgSend(v9, "setEnabled:", objc_msgSend(v11, "isSwapCallsAllowed"));

  }
  LODWORD(v10) = 0;
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:](self, "buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:", 2, 0, v10));
  if (v12)
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
    objc_msgSend(v12, "setEnabled:", objc_msgSend(v14, "isKeypadEnabled"));

  }
  LODWORD(v13) = 0;
  v15 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:](self, "buttonForButtonType:createIfNecessary:createWithHorizontalPositionFraction:", 17, 0, v13));
  if (v15)
  {
    v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
    objc_msgSend(v15, "setToggledOn:", objc_msgSend(v16, "isHoldEnabled"));

  }
}

- (id)buttonForButtonType:(int)a3 createIfNecessary:(BOOL)a4 createWithHorizontalPositionFraction:(float)a5
{
  _BOOL4 v6;
  uint64_t v7;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  BOOL v15;
  PHCarPlayInCallButton *v16;
  void *v17;
  double v18;
  void *v19;
  double v20;
  void *v21;
  void *v22;

  v6 = a4;
  v7 = *(_QWORD *)&a3;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
  v10 = objc_msgSend(v9, "currentCallState");

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView keyForButtonType:](self, "keyForButtonType:", v7));
  v12 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@%ld"), v11, v10));

  v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsDictionary](self, "buttonsDictionary"));
  v14 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectForKeyedSubscript:", v12));

  if (v14)
    v15 = 1;
  else
    v15 = !v6;
  if (!v15)
  {
    v16 = [PHCarPlayInCallButton alloc];
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
    v14 = -[PHCarPlayInCallButton initForButtonType:callState:](v16, "initForButtonType:callState:", v7, objc_msgSend(v17, "currentCallState"));

    objc_msgSend(v14, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    objc_msgSend(v14, "addTarget:action:forControlEvents:", self, "buttonWasTapped:", 64);
    -[PHCarPlayInCallButtonsView addSubview:](self, "addSubview:", v14);
    LODWORD(v18) = 1148846080;
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSLayoutConstraint constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:](NSLayoutConstraint, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:priority:", v14, 12, 0, self, 3, 1.0, 58.0, v18));
    -[PHCarPlayInCallButtonsView addConstraint:](self, "addConstraint:", v19);
    *(float *)&v20 = a5;
    -[PHCarPlayInCallButtonsView applyHorizontalPositioningConstraintWithFraction:forButton:](self, "applyHorizontalPositioningConstraintWithFraction:forButton:", v14, v20);
    objc_msgSend(v14, "setAlpha:", 0.0);
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsDictionary](self, "buttonsDictionary"));
    objc_msgSend(v21, "setObject:forKeyedSubscript:", v14, v12);

    if ((_DWORD)v7 == 1)
    {
      v22 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
      -[PHCarPlayInCallButtonsView setMuted:](self, "setMuted:", objc_msgSend(v22, "isMuted"));

    }
  }

  return v14;
}

- (id)existingButtonsNotInArray:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsDictionary](self, "buttonsDictionary"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "allValues"));
  v7 = objc_msgSend(v6, "mutableCopy");

  objc_msgSend(v7, "removeObjectsInArray:", v4);
  return v7;
}

- (id)keyForButtonType:(int)a3
{
  if (a3 > 0x12)
    return 0;
  else
    return off_1002874E0[a3];
}

- (void)buttonWasTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView delegate](self, "delegate"));
  objc_msgSend(v5, "inCallButtonWasTapped:", v4);

}

- (id)preferredFocusEnvironments
{
  int buttonsMode;
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v8;

  buttonsMode = self->_buttonsMode;
  if (buttonsMode == 5)
  {
LABEL_4:
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsArray](self, "buttonsArray"));
    v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "objectAtIndex:", 0));
    goto LABEL_6;
  }
  if (buttonsMode != 3)
  {
    if (buttonsMode)
      return &__NSArray0__struct;
    goto LABEL_4;
  }
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHCarPlayInCallButtonsView buttonsArray](self, "buttonsArray"));
  v4 = objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "lastObject"));
LABEL_6:
  v5 = (void *)v4;

  if (v5)
  {
    v8 = v5;
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", &v8, 1));

    return v6;
  }
  return &__NSArray0__struct;
}

- (int)buttonsMode
{
  return self->_buttonsMode;
}

- (void)setButtonsMode:(int)a3
{
  self->_buttonsMode = a3;
}

- (PHCarPlayInCallButtonsViewDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (PHCarPlayInCallButtonsViewDelegate *)a3;
}

- (int64_t)highlightedControlIndex
{
  return self->_highlightedControlIndex;
}

- (void)setHighlightedControlIndex:(int64_t)a3
{
  self->_highlightedControlIndex = a3;
}

- (float)buttonDistributionScalingFactor
{
  return self->_buttonDistributionScalingFactor;
}

- (void)setButtonDistributionScalingFactor:(float)a3
{
  self->_buttonDistributionScalingFactor = a3;
}

- (NSMutableDictionary)buttonsDictionary
{
  return (NSMutableDictionary *)objc_getProperty(self, a2, 32, 1);
}

- (void)setButtonsDictionary:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (NSArray)buttonsArray
{
  return (NSArray *)objc_getProperty(self, a2, 40, 1);
}

- (void)setButtonsArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (NSMutableArray)buttonDividerViews
{
  return (NSMutableArray *)objc_getProperty(self, a2, 48, 1);
}

- (void)setButtonDividerViews:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonDividerViews, 0);
  objc_storeStrong((id *)&self->_buttonsArray, 0);
  objc_storeStrong((id *)&self->_buttonsDictionary, 0);
}

@end

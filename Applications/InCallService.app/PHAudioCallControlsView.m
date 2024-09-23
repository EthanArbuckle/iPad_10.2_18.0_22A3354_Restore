@implementation PHAudioCallControlsView

- (PHAudioCallControlsView)initWithCallDisplayStyleManager:(id)a3
{
  ICSCallDisplayStyleManager *v4;
  PHAudioCallControlsView *v5;
  PHAudioCallControlsView *v6;
  void *v7;
  void *v8;
  void *v9;
  NSMutableDictionary *v10;
  NSMutableDictionary *buttonUpdates;
  objc_super v13;

  v4 = (ICSCallDisplayStyleManager *)a3;
  v13.receiver = self;
  v13.super_class = (Class)PHAudioCallControlsView;
  v5 = -[PHAudioCallControlsView init](&v13, "init");
  v6 = v5;
  if (v5)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView layer](v5, "layer"));
    objc_msgSend(v7, "setAllowsGroupBlending:", 0);

    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView layer](v6, "layer"));
    objc_msgSend(v8, "setAllowsGroupOpacity:", 0);

    v9 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor clearColor](UIColor, "clearColor"));
    -[PHAudioCallControlsView setBackgroundColor:](v6, "setBackgroundColor:", v9);

    v6->_buttonsEnabled = 1;
    v6->_callDisplayStyleManager = v4;
    v10 = objc_opt_new(NSMutableDictionary);
    buttonUpdates = v6->_buttonUpdates;
    v6->_buttonUpdates = v10;

  }
  return v6;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  id v19;
  double v20;
  void *v21;
  double v22;
  double v23;
  double v24;
  void *v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double v32;
  CGSize result;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v4 = objc_msgSend(v3, "numberOfRowsInControlsView:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndexedSubscript:", 0));
  objc_msgSend(v6, "intrinsicContentSize");
  v8 = v7;
  v9 = (double)(unint64_t)v4;
  -[PHAudioCallControlsView _topMargin](self, "_topMargin");
  v11 = v10 + v8 * (double)(unint64_t)v4;
  v12 = (double)((unint64_t)v4 - 1);
  -[PHAudioCallControlsView _verticalSpacing](self, "_verticalSpacing");
  v14 = v11 + v12 * v13;
  -[PHAudioCallControlsView _verticalSpacing](self, "_verticalSpacing");
  v16 = v14 + v15 * 0.5;

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  if (!objc_msgSend(v17, "isButtonLayoutEnabled"))
  {
    v20 = 320.0;
LABEL_8:

    goto LABEL_9;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v19 = objc_msgSend(v18, "callDisplayStyle");

  if (v19 != (id)3)
  {
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v21, "bounds");
    v23 = v22;
    v20 = v24;

    if (v23 < v20)
      v20 = v23;
    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "objectAtIndexedSubscript:", 0));
    objc_msgSend(v25, "intrinsicContentSize");
    v27 = v26;
    -[PHAudioCallControlsView _topMargin](self, "_topMargin");
    v29 = v28 + v27 * v9;
    -[PHAudioCallControlsView _verticalSpacing](self, "_verticalSpacing");
    v16 = v29 + v12 * v30;

    goto LABEL_8;
  }
  v20 = 320.0;
LABEL_9:
  v31 = v20;
  v32 = v16;
  result.height = v32;
  result.width = v31;
  return result;
}

- (void)setDelegate:(id)a3
{
  if (a3)
  {
    objc_storeWeak((id *)&self->_delegate, a3);
    -[PHAudioCallControlsView reloadButtonViews](self, "reloadButtonViews");
  }
}

- (void)reloadButtonViews
{
  id v3;
  NSObject *v4;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  _UNKNOWN **v12;
  void *v13;
  void *v14;
  id v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  uint64_t v21;
  _UNKNOWN **v22;
  char *v23;
  int v24;
  void *v25;
  id v26;
  double v27;
  PHAudioControlsButton *v28;
  PHAudioControlsButton *v29;
  void *v30;
  void *v31;
  id v32;
  void *v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  void *v45;
  double v46;
  PHAudioControlsButton *v47;
  uint64_t v48;
  PHAudioCallControlsView *v49;
  uint64_t v50;
  int v51;
  double v52;
  double v53;
  double v54;
  float v55;
  double v56;
  double v57;
  double v58;
  double v59;
  float v60;
  double v61;
  void *v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  void *v69;
  void *v70;
  id v71;
  id v72;
  id v73;
  _UNKNOWN **v74;
  void *v75;
  unsigned int v76;
  void *v77;
  id v78;
  void *v79;
  char *v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  __int128 v84;
  uint8_t buf[16];
  _BYTE v86[128];

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(UI) Reloading Six-up Audio Controls", buf, 2u);
  }

  v83 = 0u;
  v84 = 0u;
  v81 = 0u;
  v82 = 0u;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v82;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v82 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v81 + 1) + 8 * (_QWORD)i), "removeFromSuperview");
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v81, v86, 16);
    }
    while (v7);
  }

  -[PHAudioCallControlsView setButtonsArray:](self, "setButtonsArray:", 0);
  v79 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v78 = objc_msgSend(v10, "numberOfRowsInControlsView:", self);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v80 = (char *)objc_msgSend(v11, "numberOfColumnsInControlsView:", self);

  v12 = &_sSd5write2toyxz_ts16TextOutputStreamRzlF_ptr;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
  if (objc_msgSend(v13, "isButtonLayoutEnabled"))
  {
    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView captureView](self, "captureView"));

    if (v14)
      goto LABEL_14;
    v15 = objc_alloc((Class)_UIVisualEffectBackdropView);
    -[PHAudioCallControlsView bounds](self, "bounds");
    v16 = objc_msgSend(v15, "initWithFrame:");
    -[PHAudioCallControlsView setCaptureView:](self, "setCaptureView:", v16);

    v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView captureView](self, "captureView"));
    objc_msgSend(v17, "setAutoresizingMask:", 18);

    v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView captureView](self, "captureView"));
    -[PHAudioCallControlsView insertSubview:atIndex:](self, "insertSubview:atIndex:", v18, 0);

    v19 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView captureView](self, "captureView"));
    objc_msgSend(v19, "setRenderMode:", 1);

    v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView captureView](self, "captureView"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "captureGroup"));
    objc_msgSend(v20, "setGroupName:", CFSTR("InCallButtonsCaptureGroup"));

  }
LABEL_14:
  if (v78)
  {
    v21 = 0;
    v22 = CNKTranscriptionViewComposerFactory_ptr;
    while (!v80)
    {
LABEL_41:
      if ((id)++v21 == v78)
        goto LABEL_42;
    }
    v23 = 0;
    v24 = (_DWORD)v80 - 1;
    while (1)
    {
      v25 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v26 = objc_msgSend(v25, "callDisplayStyle");

      if (v26 == (id)3)
      {
        +[PHUIConfiguration ambientInCallControlSize](PHUIConfiguration, "ambientInCallControlSize");
        v28 = -[PHAudioControlsButton initWithSize:]([PHAudioControlsButton alloc], "initWithSize:", v27, v27);
      }
      else
      {
        v28 = (PHAudioControlsButton *)objc_claimAutoreleasedReturnValue(+[PHAudioControlsButton buttonWithType:](PHAudioControlsButton, "buttonWithType:", 0));
      }
      v29 = v28;
      -[PHAudioControlsButton setTranslatesAutoresizingMaskIntoConstraints:](v28, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
      -[PHAudioControlsButton setOpaque:](v29, "setOpaque:", 0);
      -[PHAudioCallControlsView addSubview:](self, "addSubview:", v29);
      v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[506], "sharedInstance"));
      if ((objc_msgSend(v30, "isButtonLayoutEnabled") & 1) == 0)
        break;
      v31 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView callDisplayStyleManager](self, "callDisplayStyleManager"));
      v32 = objc_msgSend(v31, "callDisplayStyle");

      if (v32 == (id)3)
        goto LABEL_28;
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v33, "bounds");
      v35 = v34;
      v37 = v36;

      if (v35 >= v37)
        v38 = v37;
      else
        v38 = v35;
      v39 = v38 * 0.102;
      v40 = v38 + v38 * 0.102 * -2.0;
      -[PHAudioControlsButton intrinsicContentSize](v29, "intrinsicContentSize");
      v42 = (v40 + v41 * -3.0) * 0.5;
      -[PHAudioControlsButton intrinsicContentSize](v29, "intrinsicContentSize");
      v44 = v39 + (double)(int)v23 * v43 + (double)(int)v23 * v42;
      v45 = v22[74];
      v46 = 1.0;
      v47 = v29;
      v48 = 5;
      v49 = self;
      v50 = 5;
LABEL_35:
      v62 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v47, v48, 0, v49, v50, v46, v44));
      -[PHAudioCallControlsView addConstraint:](self, "addConstraint:", v62);

      v63 = v22[74];
      -[PHAudioCallControlsView _topMargin](self, "_topMargin");
      v65 = v64;
      -[PHAudioControlsButton intrinsicContentSize](v29, "intrinsicContentSize");
      v67 = v66;
      -[PHAudioCallControlsView _verticalSpacing](self, "_verticalSpacing");
      v69 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v63, "constraintWithItem:attribute:relatedBy:toItem:attribute:multiplier:constant:", v29, 3, 0, self, 3, 1.0, v65 + (double)(int)v21 * (v67 + v68)));
      -[PHAudioCallControlsView addConstraint:](self, "addConstraint:", v69);

      v70 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
      v71 = objc_msgSend(v70, "controlTypeAtRow:column:", v21, v23);

      -[PHAudioControlsButton setControlType:](v29, "setControlType:", v71);
      if (v71 == (id)3)
        -[PHAudioControlsButton setMenuDataSource:](v29, "setMenuDataSource:", self);
      else
        -[PHAudioControlsButton addTarget:action:forControlEvents:](v29, "addTarget:action:forControlEvents:", self, "buttonTapped:", 64);
      v72 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "buttonShortPressGestureRecognizer:");
      objc_msgSend(v72, "setMinimumPressDuration:", 1.5);
      -[PHAudioControlsButton addGestureRecognizer:](v29, "addGestureRecognizer:", v72);
      v73 = objc_msgSend(objc_alloc((Class)UILongPressGestureRecognizer), "initWithTarget:action:", self, "buttonLongPressGestureRecognizer:");
      objc_msgSend(v73, "setMinimumPressDuration:", 3.0);
      objc_msgSend(v73, "setAllowableMovement:", 1000.0);
      -[PHAudioControlsButton addGestureRecognizer:](v29, "addGestureRecognizer:", v73);
      objc_msgSend(v72, "requireGestureRecognizerToFail:", v73);
      objc_msgSend(v79, "addObject:", v29);
      v74 = v12;
      v75 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12[506], "sharedInstance"));
      v76 = objc_msgSend(v75, "isButtonLayoutEnabled");

      if (v76)
      {
        v77 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView captureView](self, "captureView"));
        -[PHAudioControlsButton setCaptureView:](v29, "setCaptureView:", v77);

      }
      ++v23;
      --v24;
      v12 = v74;
      v22 = CNKTranscriptionViewComposerFactory_ptr;
      if (v80 == v23)
        goto LABEL_41;
    }

LABEL_28:
    if (-[PHAudioCallControlsView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection"))
      v51 = v24;
    else
      v51 = (int)v23;
    -[PHAudioControlsButton intrinsicContentSize](v29, "intrinsicContentSize");
    v53 = v52;
    -[PHAudioCallControlsView _horizontalSpacing](self, "_horizontalSpacing");
    v55 = v54 * (double)(unint64_t)(v80 - 1) + (double)(unint64_t)v80 * v53;
    -[PHAudioControlsButton intrinsicContentSize](v29, "intrinsicContentSize");
    v57 = v56;
    if (v51)
      v58 = 1.0;
    else
      v58 = 0.0;
    -[PHAudioCallControlsView _horizontalSpacing](self, "_horizontalSpacing");
    *(float *)&v59 = (v57 + v58 * v59) * (double)v51;
    v60 = *(float *)&v59 + (float)(v55 * -0.5);
    -[PHAudioControlsButton intrinsicContentSize](v29, "intrinsicContentSize");
    *(float *)&v61 = v61 * 0.5 + v60;
    v45 = v22[74];
    v44 = *(float *)&v61;
    v46 = 1.0;
    v47 = v29;
    v48 = 9;
    v49 = self;
    v50 = 9;
    goto LABEL_35;
  }
LABEL_42:
  -[PHAudioCallControlsView setButtonsArray:](self, "setButtonsArray:", v79);
  -[PHAudioCallControlsView reloadButtonViewStates](self, "reloadButtonViewStates");
  -[PHAudioCallControlsView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");

}

- (void)replaceBlock:(id)a3 currentButton:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  if (v6)
  {
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonUpdates](self, "buttonUpdates"));
    v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKey:", v8));

    if (v9)
      dispatch_block_cancel(v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonUpdates](self, "buttonUpdates"));
    if (v13)
    {
      v11 = objc_retainBlock(v13);
      v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
      objc_msgSend(v10, "setObject:forKey:", v11, v12);

    }
    else
    {
      v11 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "uuid"));
      objc_msgSend(v10, "removeObjectForKey:", v11);
    }

  }
}

- (void)forceUpdateAudioRoutesImageForButton:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  dispatch_block_t v9;
  void *v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15;
  _QWORD *v16;
  _QWORD block[4];
  id v18;
  _QWORD *v19;
  _QWORD v20[5];
  id v21;

  v6 = a3;
  v7 = a4;
  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x3032000000;
  v20[3] = sub_10007FC6C;
  v20[4] = sub_10007FC7C;
  v21 = 0;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10007FC84;
  block[3] = &unk_1002857C8;
  v19 = v20;
  v8 = v6;
  v18 = v8;
  v9 = dispatch_block_create((dispatch_block_flags_t)0, block);
  -[PHAudioCallControlsView replaceBlock:currentButton:](self, "replaceBlock:currentButton:", v9, v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10007FD74;
  v13[3] = &unk_100286810;
  v16 = v20;
  v11 = v9;
  v14 = v11;
  v12 = v7;
  v15 = v12;
  objc_msgSend(v10, "fetchAudioRoutesImageWithCompletion:", v13);

  _Block_object_dispose(v20, 8);
}

- (BOOL)needsReloadButtonViews
{
  void *v3;
  char *v4;
  void *v5;
  id v6;
  uint64_t v7;
  char *v8;
  uint64_t v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  BOOL v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v4 = (char *)objc_msgSend(v3, "numberOfRowsInControlsView:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "numberOfColumnsInControlsView:", self);

  if (!v4)
    return 0;
  v7 = 0;
  v8 = 0;
  while (!v6)
  {
LABEL_11:
    ++v8;
    v7 += (uint64_t)v6;
    if (v8 == v4)
      return 0;
  }
  v9 = 0;
  while (1)
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
    v11 = objc_msgSend(v10, "count");

    if ((unint64_t)v11 <= v7 + v9)
      return 1;
    v12 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
    v13 = objc_msgSend(v12, "controlTypeAtRow:column:", v8, v9);

    v14 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
    v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndex:", v7 + v9));

    if (v13 != objc_msgSend(v15, "controlType"))
    {
      v17 = 1;
      goto LABEL_16;
    }
    if (objc_msgSend((id)objc_opt_class(self, v16), "audioCallControlTypeDependsUponImage:", v13))
      break;
LABEL_10:

    if (v6 == (id)++v9)
      goto LABEL_11;
  }
  if (v13 == (id)3)
  {
    -[PHAudioCallControlsView forceUpdateAudioRoutesImageForButton:completion:](self, "forceUpdateAudioRoutesImageForButton:completion:", v15, 0);
    goto LABEL_10;
  }
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "objectAtIndexedSubscript:", v7 + v9));

  v20 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "imageForControlType:", v13));

  v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "image"));
  v17 = v21 != v22;

LABEL_16:
  return v17;
}

+ (BOOL)audioCallControlTypeDependsUponImage:(unint64_t)a3
{
  return (a3 < 0x11) & (0x12008u >> a3);
}

- (void)dismissAudioRoutesMenu
{
  void *v3;
  id v4;

  v4 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonForControlType:](self, "buttonForControlType:", 3));
  objc_msgSend(v4, "setMenu:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView menuForAudioControlsButton:](self, "menuForAudioControlsButton:", v4));
  objc_msgSend(v4, "setMenu:", v3);

}

- (void)updateControls
{
  id v3;
  NSObject *v4;
  void *v5;
  void *v6;
  void *v7;
  unsigned int v8;
  void *v9;
  void *v10;
  id v11;
  NSObject *v12;
  void *v13;
  void *v14;
  id v15;
  NSObject *v16;
  int v17;
  void *v18;

  v3 = sub_1000C5588();
  v4 = objc_claimAutoreleasedReturnValue(v3);
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    LOWORD(v17) = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "(UI) Asked to update Six-up Audio Controls", (uint8_t *)&v17, 2u);
  }

  v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIApplication sharedApplication](UIApplication, "sharedApplication"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "delegate"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "mostRecentlyDisconnectedAudioCall"));

  if (v7 && objc_msgSend(v7, "isEmergency"))
    v8 = objc_msgSend(v7, "disconnectedReasonRequiresCallBackUI");
  else
    v8 = 0;
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "frontmostCall"));

  if (v10 || v8)
  {
    if (-[PHAudioCallControlsView needsReloadButtonViews](self, "needsReloadButtonViews"))
    {
      -[PHAudioCallControlsView reloadButtonViews](self, "reloadButtonViews");
    }
    else
    {
      v15 = sub_1000C5588();
      v16 = objc_claimAutoreleasedReturnValue(v15);
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v17) = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "(UI) No need to reload Six-up Audio Controls", (uint8_t *)&v17, 2u);
      }

    }
    -[PHAudioCallControlsView reloadButtonViewStates](self, "reloadButtonViewStates");
  }
  else
  {
    v11 = sub_1000C5588();
    v12 = objc_claimAutoreleasedReturnValue(v11);
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TUCallCenter sharedInstance](TUCallCenter, "sharedInstance"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "currentCalls"));
      v17 = 138412290;
      v18 = v14;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "(UI) Ignoring call to update controls since frontmostCall is nil (current calls are %@).", (uint8_t *)&v17, 0xCu);

    }
  }

}

- (void)reloadButtonViewStates
{
  void *v3;
  char *v4;
  void *v5;
  id v6;
  unint64_t v7;
  char *i;
  char *v9;
  unint64_t v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  id v18;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v4 = (char *)objc_msgSend(v3, "numberOfRowsInControlsView:", self);

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  v6 = objc_msgSend(v5, "numberOfColumnsInControlsView:", self);

  if (v4)
  {
    v7 = 0;
    for (i = 0; i != v4; ++i)
    {
      v9 = (char *)v6;
      v10 = v7;
      if (v6)
      {
        do
        {
          v11 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
          v12 = objc_msgSend(v11, "count");

          if ((unint64_t)v12 > v10)
          {
            v13 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray"));
            v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "objectAtIndex:", v10));

            v15 = objc_msgSend(v14, "controlType");
            if (-[PHAudioCallControlsView buttonsEnabled](self, "buttonsEnabled"))
            {
              v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
              objc_msgSend(v14, "setEnabled:", objc_msgSend(v16, "controlTypeIsEnabled:", v15));

            }
            else
            {
              objc_msgSend(v14, "setEnabled:", 0);
            }
            v17 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
            if (objc_msgSend(v17, "controlTypeIsSelected:", v15))
              v18 = objc_msgSend(v14, "isEnabled");
            else
              v18 = 0;
            objc_msgSend(v14, "setSelected:", v18);

            -[PHAudioCallControlsView assignControlType:toButton:](self, "assignControlType:toButton:", v15, v14);
          }
          ++v10;
          --v9;
        }
        while (v9);
      }
      v7 += (unint64_t)v6;
    }
  }
}

- (void)assignControlType:(unint64_t)a3 toButton:(id)a4 completion:(id)a5
{
  id v8;
  void (**v9)(_QWORD);
  void *v10;
  id v11;
  _QWORD *v12;
  void *v13;
  void *v14;
  dispatch_block_t v15;
  void *v16;
  id v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  id v21;
  void (**v22)(_QWORD);
  _QWORD *v23;
  _QWORD block[4];
  _QWORD *v25;
  _QWORD *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  PHAudioCallControlsView *v31;
  unint64_t v32;

  v8 = a4;
  v9 = (void (**)(_QWORD))a5;
  if (v8
    && (v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "imageForState:", 0)), v10,
                                                                                                  !v10))
  {
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_100080704;
    v29[3] = &unk_100286838;
    v11 = v8;
    v30 = v11;
    v31 = self;
    v32 = a3;
    v12 = objc_retainBlock(v29);
    if (a3 == 3)
    {
      v13 = (void *)objc_claimAutoreleasedReturnValue(+[TURoute speakerAudioRouteGlyph](TURoute, "speakerAudioRouteGlyph"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "imageWithRenderingMode:", 2));
      ((void (*)(_QWORD *, void *))v12[2])(v12, v14);

      v27[0] = 0;
      v27[1] = v27;
      v27[2] = 0x3032000000;
      v27[3] = sub_10007FC6C;
      v27[4] = sub_10007FC7C;
      v28 = 0;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_100080810;
      block[3] = &unk_100286860;
      v25 = v12;
      v26 = v27;
      v15 = dispatch_block_create((dispatch_block_flags_t)0, block);
      -[PHAudioCallControlsView replaceBlock:currentButton:](self, "replaceBlock:currentButton:", v15, v11);
      v16 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
      v20[0] = _NSConcreteStackBlock;
      v20[1] = 3221225472;
      v20[2] = sub_100080828;
      v20[3] = &unk_100286810;
      v23 = v27;
      v17 = v15;
      v21 = v17;
      v22 = v9;
      objc_msgSend(v16, "fetchAudioRoutesImageWithCompletion:", v20);

      _Block_object_dispose(v27, 8);
    }
    else
    {
      -[PHAudioCallControlsView replaceBlock:currentButton:](self, "replaceBlock:currentButton:", 0, v11);
      v18 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
      v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "imageForControlType:", a3));
      ((void (*)(_QWORD *, void *))v12[2])(v12, v19);

      if (v9)
        v9[2](v9);
    }

  }
  else if (v9)
  {
    v9[2](v9);
  }

}

- (void)assignControlType:(unint64_t)a3 toButton:(id)a4
{
  -[PHAudioCallControlsView assignControlType:toButton:completion:](self, "assignControlType:toButton:completion:", a3, a4, 0);
}

- (void)buttonTapped:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
  objc_msgSend(v5, "controlTypeTapped:forView:", objc_msgSend(v4, "controlType"), v4);

}

- (void)buttonShortPressGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v4, "controlTypeShortPressed:", objc_msgSend(v5, "controlType"));

  }
}

- (void)buttonLongPressGestureRecognizer:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (objc_msgSend(v6, "state") == (id)1)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "view"));
    objc_msgSend(v4, "controlTypeLongPressed:", objc_msgSend(v5, "controlType"));

  }
}

- (void)setSelectedState:(BOOL)a3 forControlType:(unint64_t)a4
{
  _BOOL8 v4;
  id v5;

  v4 = a3;
  v5 = (id)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonForControlType:](self, "buttonForControlType:", a4));
  objc_msgSend(v5, "setSelected:", v4);

}

- (id)buttonForControlType:(unint64_t)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];

  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "controlType") == (id)a3)
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (void)setButtonsEnabled:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];

  if (self->_buttonsEnabled != a3)
  {
    v3 = a3;
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray", 0));
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        v9 = 0;
        do
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9);
          if (!v3)
            objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * (_QWORD)v9), "setSelected:", 0);
          objc_msgSend(v10, "setEnabled:", v3);
          v9 = (char *)v9 + 1;
        }
        while (v7 != v9);
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

    self->_buttonsEnabled = v3;
  }
}

- (void)setPrefersWhiteButtonTextColor:(BOOL)a3
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (a3)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
          objc_msgSend(v9, "setTitleColor:forState:", v10, 0);

          v11 = objc_claimAutoreleasedReturnValue(+[UIColor whiteColor](UIColor, "whiteColor"));
        }
        else
        {
          v12 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
          objc_msgSend(v9, "setTitleColor:forState:", v12, 0);

          v11 = objc_claimAutoreleasedReturnValue(+[UIColor blackColor](UIColor, "blackColor"));
        }
        v13 = (void *)v11;
        objc_msgSend(v9, "setTitleColor:forState:", v11, 2);

      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v6);
  }

}

- (void)updateBackgroundMaterial:(unint64_t)a3
{
  id v5;
  NSObject *v6;
  void *v7;
  id v8;
  id v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  uint8_t v16[128];
  uint8_t buf[4];
  unint64_t v18;

  v5 = sub_1000C5588();
  v6 = objc_claimAutoreleasedReturnValue(v5);
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v18 = a3;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "SNAP: Setting button background material to type: %lu", buf, 0xCu);
  }

  v14 = 0u;
  v15 = 0u;
  v12 = 0u;
  v13 = 0u;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray", 0));
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v13;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v13 != v10)
          objc_enumerationMutation(v7);
        objc_msgSend(*(id *)(*((_QWORD *)&v12 + 1) + 8 * (_QWORD)v11), "updateBackgroundMaterial:", a3);
        v11 = (char *)v11 + 1;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v9);
  }

}

- (void)changeVideoStreamingButtonTitleWithIsSharing:(BOOL)a3
{
  _BOOL4 v3;
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];

  v3 = a3;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v4 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView buttonsArray](self, "buttonsArray", 0));
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        if (objc_msgSend(v9, "controlType") == (id)17)
        {
          v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
          v11 = v10;
          if (v3)
            v12 = CFSTR("LIVE_VIDEO");
          else
            v12 = CFSTR("RESUME_VIDEO");
          v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_10028DC20, CFSTR("InCallService")));
          objc_msgSend(v9, "setTitle:forState:", v13, 0);

          goto LABEL_14;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_14:

}

- (void)setCenter:(CGPoint)a3
{
  double y;
  double x;
  objc_super v6;
  CGAffineTransform v7;

  y = a3.y;
  x = a3.x;
  -[PHAudioCallControlsView transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v7))
  {
    v6.receiver = self;
    v6.super_class = (Class)PHAudioCallControlsView;
    -[PHAudioCallControlsView setCenter:](&v6, "setCenter:", x, y);
  }
}

- (void)setFrame:(CGRect)a3
{
  double height;
  double width;
  double y;
  double x;
  objc_super v8;
  CGAffineTransform v9;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  -[PHAudioCallControlsView transform](self, "transform");
  if (CGAffineTransformIsIdentity(&v9))
  {
    v8.receiver = self;
    v8.super_class = (Class)PHAudioCallControlsView;
    -[PHAudioCallControlsView setFrame:](&v8, "setFrame:", x, y, width, height);
  }
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  NSObject *v11;
  objc_super v12;
  uint8_t buf[4];
  _BOOL4 v14;

  v12.receiver = self;
  v12.super_class = (Class)PHAudioCallControlsView;
  v4 = a3;
  -[PHAudioCallControlsView traitCollectionDidChange:](&v12, "traitCollectionDidChange:", v4);
  v5 = objc_msgSend(v4, "_backlightLuminance", v12.receiver, v12.super_class);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView traitCollection](self, "traitCollection"));
  v7 = objc_msgSend(v6, "_backlightLuminance");

  if (v5 != v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView traitCollection](self, "traitCollection"));
    v9 = objc_msgSend(v8, "_backlightLuminance");

    -[PHAudioCallControlsView setUserInteractionEnabled:](self, "setUserInteractionEnabled:", v9 != (id)1);
    v10 = sub_1000C5588();
    v11 = objc_claimAutoreleasedReturnValue(v10);
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109120;
      v14 = v9 != (id)1;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting userInteractionEnabled of controls view to %d because of back light change", buf, 8u);
    }

  }
}

- (double)_topMargin
{
  +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing");
  return 0.0;
}

- (double)_verticalSpacing
{
  void *v2;
  id v3;
  double v4;
  void *v5;
  unsigned int v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  unint64_t v13;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  v4 = 0.0;
  if (v3 != (id)3)
  {
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[CNKFeatures sharedInstance](CNKFeatures, "sharedInstance"));
    v6 = objc_msgSend(v5, "isButtonLayoutEnabled");

    if (v6)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v7, "bounds");
      v9 = v8;
      v11 = v10;

      if (v9 < v11)
        v9 = v11;
      +[PHUIConfiguration inCallControlButtonVerticalSpacingRatio](PHUIConfiguration, "inCallControlButtonVerticalSpacingRatio");
      return v12 * v9;
    }
    else
    {
      v13 = +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing");
      if (v13 <= 5)
        return dbl_10023FDB0[v13];
    }
  }
  return v4;
}

- (double)_horizontalSpacing
{
  void *v2;
  id v3;
  double result;
  unint64_t v5;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView callDisplayStyleManager](self, "callDisplayStyleManager"));
  v3 = objc_msgSend(v2, "callDisplayStyle");

  if (v3 == (id)3)
  {
    +[PHUIConfiguration ambientInCallControlSpacing](PHUIConfiguration, "ambientInCallControlSpacing");
  }
  else
  {
    v5 = +[PHUIConfiguration inCallControlSpacing](PHUIConfiguration, "inCallControlSpacing");
    result = 0.0;
    if (v5 <= 5)
      return dbl_10023FDE0[v5];
  }
  return result;
}

- (id)menuForAudioControlsButton:(id)a3
{
  void *v3;
  void *v4;

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[PHAudioCallControlsView delegate](self, "delegate", a3));
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "audioRouteMenu"));

  return v4;
}

- (PHAudioCallControlsViewDelegate)delegate
{
  return (PHAudioCallControlsViewDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (BOOL)buttonsEnabled
{
  return self->_buttonsEnabled;
}

- (ICSCallDisplayStyleManager)callDisplayStyleManager
{
  return self->_callDisplayStyleManager;
}

- (void)setCallDisplayStyleManager:(id)a3
{
  self->_callDisplayStyleManager = (ICSCallDisplayStyleManager *)a3;
}

- (NSArray)buttonsArray
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void)setButtonsArray:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 32);
}

- (_UIVisualEffectBackdropView)captureView
{
  return self->_captureView;
}

- (void)setCaptureView:(id)a3
{
  objc_storeStrong((id *)&self->_captureView, a3);
}

- (NSMutableDictionary)buttonUpdates
{
  return self->_buttonUpdates;
}

- (void)setButtonUpdates:(id)a3
{
  objc_storeStrong((id *)&self->_buttonUpdates, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_buttonUpdates, 0);
  objc_storeStrong((id *)&self->_captureView, 0);
  objc_storeStrong((id *)&self->_buttonsArray, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

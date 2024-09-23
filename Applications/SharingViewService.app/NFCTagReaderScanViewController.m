@implementation NFCTagReaderScanViewController

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  int64_t mode;
  void *v9;
  int Int64Ranged;
  void *v11;
  void *v12;
  const __CFString *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  PKGlyphView *v21;
  PKGlyphView *nfcAnimationView;
  PKGlyphView *v23;
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
  id v62;
  void *v63;
  _QWORD v64[4];
  id v65;
  objc_super v66;
  _QWORD v67[8];

  v3 = a3;
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController viewWillAppear:]", 30, "Scan ViewWillAppear\n");
  v66.receiver = self;
  v66.super_class = (Class)NFCTagReaderScanViewController;
  -[NFCTagReaderScanViewController viewWillAppear:](&v66, "viewWillAppear:", v3);
  -[NFCTagReaderScanViewController setDismissalType:](self, "setDismissalType:", 1);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "userInfo"));
  self->_mode = (int)CFDictionaryGetInt64Ranged(v6, CFSTR("mode"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);

  mode = self->_mode;
  if (mode == 10 || mode == 0)
    self->_mode = 30;
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "userInfo"));
  Int64Ranged = CFDictionaryGetInt64Ranged(v9, CFSTR("operationMode"), 0xFFFFFFFF80000000, 0x7FFFFFFFLL, 0);

  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v12 = v11;
  if (Int64Ranged)
    v13 = CFSTR("HOLD_NEAR_READER");
  else
    v13 = CFSTR("READY_TO_SCAN");
  v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v11, "localizedStringForKey:value:table:", v13, &stru_10017E3D8, CFSTR("Localizable")));
  -[NFCTagReaderScanViewController setTitle:](self, "setTitle:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "purpose"));
  -[NFCTagReaderScanViewController setSubtitle:](self, "setSubtitle:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_10017E3D8, CFSTR("Localizable")));

  v64[0] = _NSConcreteStackBlock;
  v64[1] = 3221225472;
  v64[2] = sub_1000EDF30;
  v64[3] = &unk_10017DA08;
  v18 = WeakRetained;
  v65 = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v17, 0, v64));
  objc_storeStrong((id *)&self->_primaryAction, v19);
  v20 = -[NFCTagReaderScanViewController addAction:](self, "addAction:", v19);
  if (!self->_nfcAnimationView)
  {
    v21 = (PKGlyphView *)objc_msgSend(objc_alloc((Class)PKGlyphView), "initWithStyle:", 0);
    nfcAnimationView = self->_nfcAnimationView;
    self->_nfcAnimationView = v21;

    -[PKGlyphView setTranslatesAutoresizingMaskIntoConstraints:](self->_nfcAnimationView, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
    -[PKGlyphView setState:animated:completionHandler:](self->_nfcAnimationView, "setState:animated:completionHandler:", 9, 0, 0);
    v61 = v19;
    v23 = self->_nfcAnimationView;
    v62 = v18;
    v24 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
    objc_msgSend(v24, "scale");
    -[PKGlyphView updateRasterizationScale:](v23, "updateRasterizationScale:");

    v25 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    objc_msgSend(v25, "addSubview:", self->_nfcAnimationView);

    v60 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView heightAnchor](self->_nfcAnimationView, "heightAnchor"));
    v59 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v60, "constraintEqualToConstant:", 116.0));
    v67[0] = v59;
    v58 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView widthAnchor](self->_nfcAnimationView, "widthAnchor"));
    v57 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v58, "constraintEqualToConstant:", 116.0));
    v67[1] = v57;
    v55 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView centerXAnchor](self->_nfcAnimationView, "centerXAnchor"));
    v56 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    v54 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v56, "mainContentGuide"));
    v53 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v54, "centerXAnchor"));
    v52 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v55, "constraintEqualToAnchor:", v53));
    v67[2] = v52;
    v50 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView centerYAnchor](self->_nfcAnimationView, "centerYAnchor"));
    v51 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    v49 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v51, "mainContentGuide"));
    v48 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v49, "centerYAnchor"));
    v47 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v50, "constraintEqualToAnchor:", v48));
    v67[3] = v47;
    v45 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView leadingAnchor](self->_nfcAnimationView, "leadingAnchor"));
    v46 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    v44 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v46, "mainContentGuide"));
    v43 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v44, "leadingAnchor"));
    v42 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v45, "constraintGreaterThanOrEqualToAnchor:", v43));
    v67[4] = v42;
    v40 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView trailingAnchor](self->_nfcAnimationView, "trailingAnchor"));
    v41 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    v39 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "mainContentGuide"));
    v38 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v39, "trailingAnchor"));
    v37 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v40, "constraintLessThanOrEqualToAnchor:", v38));
    v67[5] = v37;
    v36 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView topAnchor](self->_nfcAnimationView, "topAnchor"));
    v63 = v17;
    v26 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "mainContentGuide"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "topAnchor"));
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v36, "constraintGreaterThanOrEqualToAnchor:", v28));
    v67[6] = v29;
    v30 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView bottomAnchor](self->_nfcAnimationView, "bottomAnchor"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController contentView](self, "contentView"));
    v32 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v31, "mainContentGuide"));
    v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v32, "bottomAnchor"));
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "constraintLessThanOrEqualToAnchor:", v33));
    v67[7] = v34;
    v35 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v67, 8));
    +[NSLayoutConstraint activateConstraints:](NSLayoutConstraint, "activateConstraints:", v35);

    v19 = v61;
    v18 = v62;

    v17 = v63;
  }

}

- (void)showFailureUI
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  PKGlyphView *nfcAnimationView;
  id v9;
  id v10;

  -[PKGlyphView setColorMode:animated:](self->_nfcAnimationView, "setColorMode:animated:", 3, 0);
  -[PKGlyphView setState:animated:completionHandler:](self->_nfcAnimationView, "setState:animated:completionHandler:", 10, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage systemImageNamed:](UIImage, "systemImageNamed:", CFSTR("exclamationmark")));
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImageSymbolConfiguration configurationWithPointSize:](UIImageSymbolConfiguration, "configurationWithPointSize:", 70.0));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "imageByApplyingSymbolConfiguration:", v4));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PKGlyphView primaryColor](self->_nfcAnimationView, "primaryColor"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_flatImageWithColor:", v6));

  nfcAnimationView = self->_nfcAnimationView;
  v10 = objc_retainAutorelease(v7);
  v9 = objc_msgSend(v10, "CGImage");
  objc_msgSend(v10, "alignmentRectInsets");
  -[PKGlyphView setCustomImage:withAlignmentEdgeInsets:](nfcAnimationView, "setCustomImage:withAlignmentEdgeInsets:", v9);
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController showFailureUI]", 30, "Playing nfc sound\n");
  AudioServicesPlaySystemSoundWithCompletion(0x576u, &stru_10017D668);
  -[NFCTagReaderScanViewController dismissEventually](self, "dismissEventually");

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id WeakRetained;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController viewDidAppear:]", 30, "Scan ViewDidAppear\n");
  v7.receiver = self;
  v7.super_class = (Class)NFCTagReaderScanViewController;
  -[NFCTagReaderScanViewController viewDidAppear:](&v7, "viewDidAppear:", v3);
  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  objc_msgSend(WeakRetained, "setAppeared:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(WeakRetained, "purpose"));
  -[NFCTagReaderScanViewController setSubtitle:](self, "setSubtitle:", v6);

  if ((uint64_t)objc_msgSend(WeakRetained, "tagCount") >= 1)
  {
    if (dword_1001A8408 <= 30
      && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    {
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController viewDidAppear:]", 30, "Apply deferred tag scan\n");
    }
    -[NFCTagReaderScanViewController nfcTagScanned](self, "nfcTagScanned");
    objc_msgSend(WeakRetained, "uiOperationEnd");
  }

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  OS_dispatch_source *timer;
  NSObject *v6;
  OS_dispatch_source *v7;
  objc_super v8;

  v3 = a3;
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController viewDidDisappear:]", 30, "Scan ViewDidDisappear\n");
  v8.receiver = self;
  v8.super_class = (Class)NFCTagReaderScanViewController;
  -[NFCTagReaderScanViewController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
  timer = self->_timer;
  if (timer)
  {
    v6 = timer;
    dispatch_source_cancel(v6);
    v7 = self->_timer;
    self->_timer = 0;

  }
}

- (void)nfcTagScanned
{
  id WeakRetained;
  id v4;
  void *v5;
  void *v6;
  PKGlyphView *nfcAnimationView;
  _QWORD v8[5];
  _QWORD inCompletionBlock[4];
  id v10;

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController nfcTagScanned]", 30, "nfcTagScanned, dismissing: %d\n", objc_msgSend(WeakRetained, "dismissing"));
  if ((objc_msgSend(WeakRetained, "dismissing") & 1) == 0)
  {
    objc_msgSend(WeakRetained, "uiOperationBegin");
    if (dword_1001A8408 <= 30
      && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    {
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderScanViewController nfcTagScanned]", 30, "Playing nfc sound\n");
    }
    inCompletionBlock[0] = _NSConcreteStackBlock;
    inCompletionBlock[1] = 3221225472;
    inCompletionBlock[2] = sub_1000EDC78;
    inCompletionBlock[3] = &unk_10017E1F0;
    v4 = WeakRetained;
    v10 = v4;
    AudioServicesPlaySystemSoundWithCompletion(0x488u, inCompletionBlock);
    if (self->_mode == 20)
    {
      -[NFCTagReaderScanViewController dismissEventually](self, "dismissEventually");
    }
    else if (objc_msgSend(v4, "tagCount") == (id)1 || (uint64_t)objc_msgSend(v4, "tagCount") >= 2)
    {
      v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10017E3D8, CFSTR("Localizable")));
      -[NFCTagReaderScanViewController updateButtonText:](self, "updateButtonText:", v6);

    }
    -[PKGlyphView setColorMode:animated:](self->_nfcAnimationView, "setColorMode:animated:", 2, 1);
    nfcAnimationView = self->_nfcAnimationView;
    v8[0] = _NSConcreteStackBlock;
    v8[1] = 3221225472;
    v8[2] = sub_1000EDD3C;
    v8[3] = &unk_10017DF28;
    v8[4] = self;
    -[PKGlyphView setState:animated:completionHandler:](nfcAnimationView, "setState:animated:completionHandler:", 11, 1, v8);

  }
}

- (void)dismissEventually
{
  id WeakRetained;
  OS_dispatch_source *timer;
  NSObject *v5;
  OS_dispatch_source *v6;
  OS_dispatch_source *v7;
  OS_dispatch_source *v8;
  NSObject *v9;
  _QWORD handler[5];

  WeakRetained = objc_loadWeakRetained((id *)&self->_mainController);
  objc_msgSend(WeakRetained, "setDismissing:", 1);

  timer = self->_timer;
  if (timer)
  {
    v5 = timer;
    dispatch_source_cancel(v5);
    v6 = self->_timer;
    self->_timer = 0;

  }
  v7 = (OS_dispatch_source *)dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v8 = self->_timer;
  self->_timer = v7;

  v9 = self->_timer;
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000EDBF4;
  handler[3] = &unk_10017E1F0;
  handler[4] = self;
  dispatch_source_set_event_handler(v9, handler);
  SFDispatchTimerSet(self->_timer, 2.5, -1.0, -4.0);
  dispatch_resume((dispatch_object_t)self->_timer);
}

- (void)updateButtonText:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderScanViewController mainController](self, "mainController"));
  -[NFCTagReaderScanViewController removeAction:](self, "removeAction:", self->_primaryAction);
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_1000EDB68;
  v9[3] = &unk_10017DA08;
  v10 = v5;
  v6 = v5;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[PRXAction actionWithTitle:style:handler:](PRXAction, "actionWithTitle:style:handler:", v4, 0, v9));

  objc_storeStrong((id *)&self->_primaryAction, v7);
  v8 = -[NFCTagReaderScanViewController addAction:](self, "addAction:", v7);

}

- (NFCTagReaderMainController)mainController
{
  return (NFCTagReaderMainController *)objc_loadWeakRetained((id *)&self->_mainController);
}

- (void)setMainController:(id)a3
{
  objc_storeWeak((id *)&self->_mainController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_mainController);
  objc_storeStrong((id *)&self->_timer, 0);
  objc_storeStrong((id *)&self->_primaryAction, 0);
  objc_storeStrong((id *)&self->_nfcAnimationView, 0);
}

@end

@implementation ShareAudioAcceptAskViewController

- (id)presentationControllerForPresentedViewController:(id)a3 presentingViewController:(id)a4 sourceViewController:(id)a5
{
  id v6;
  id v7;
  PopUpPresentationController *v8;

  v6 = a4;
  v7 = a3;
  v8 = -[PopUpPresentationController initWithPresentedViewController:presentingViewController:]([PopUpPresentationController alloc], "initWithPresentedViewController:presentingViewController:", v7, v6);

  -[PopUpPresentationController setBlurBackground:](v8, "setBlurBackground:", 1);
  return v8;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  CFTypeID TypeID;
  uint64_t TypedValue;
  __CFString *v11;
  CFTypeID v12;
  uint64_t v13;
  void *v14;
  id v15;
  void *v16;
  NSString *v17;
  id v18;
  const __CFString *v19;
  void *v20;
  objc_super v21;

  v3 = a3;
  if (dword_1001A8A38 <= 30 && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptAskViewController viewWillAppear:]", 30, "Ask ViewWillAppear\n");
  v21.receiver = self;
  v21.super_class = (Class)ShareAudioAcceptAskViewController;
  -[ShareAudioAcceptAskViewController viewWillAppear:](&v21, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAudioAcceptMainController _remoteViewControllerProxy](self->_mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setStatusBarHidden:withDuration:", 1, 0.0);

  self->_viewDidAppear = 1;
  v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont _preferredFontForTextStyle:variant:](UIFont, "_preferredFontForTextStyle:variant:", UIFontTextStyleTitle1, 1280));
  -[UILabel setFont:](self->_titleLabel, "setFont:", v6);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Sharing")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseMainController userInfo](self->_mainController, "userInfo"));
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v8, CFSTR("deviceName"), TypeID, 0);
  v11 = (__CFString *)objc_claimAutoreleasedReturnValue(TypedValue);
  v12 = CFStringGetTypeID();
  v13 = CFDictionaryGetTypedValue(v8, CFSTR("username"), v12, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  if (v14)
  {
    v15 = sub_100117218(v7, CFSTR("Localizable-ShareAudio"), CFSTR("SHARE_AUDIO_ACCEPT_USER_FORMAT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v14);
  }
  else
  {
    v18 = sub_100117218(v7, CFSTR("Localizable-ShareAudio"), CFSTR("SHARE_AUDIO_ACCEPT_DEVICE_FORMAT"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(v18);
    v19 = CFSTR("?");
    if (v11)
      v19 = v11;
    v17 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v16, v19);
  }
  v20 = (void *)objc_claimAutoreleasedReturnValue(v17);
  -[UILabel setText:](self->_titleLabel, "setText:", v20);

  -[ShareAudioAcceptAskViewController updateProductID:](self, "updateProductID:", -[ShareAudioAcceptMainController btProductID](self->_mainController, "btProductID"));
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8A38 <= 30 && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptAskViewController viewDidDisappear:]", 30, "Start ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)ShareAudioAcceptAskViewController;
  -[ShareAudioAcceptAskViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleJoinButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8A38 <= 30 && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptAskViewController handleJoinButton:]", 30, "Join button\n");
  -[UIButton setEnabled:](self->_joinButton, "setEnabled:", 0);
  -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", 0);
  -[ShareAudioAcceptMainController dismissWithAction:](self->_mainController, "dismissWithAction:", 2);

}

- (void)handleCancelButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8A38 <= 30 && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptAskViewController handleCancelButton:]", 30, "Cancel button\n");
  -[UIButton setEnabled:](self->_joinButton, "setEnabled:", 0);
  -[UIButton setEnabled:](self->_cancelButton, "setEnabled:", 0);
  -[ShareAudioAcceptMainController dismissWithAction:](self->_mainController, "dismissWithAction:", 3);

}

- (void)updateProductID:(unsigned int)a3
{
  uint64_t v3;
  void *v5;
  id v6;
  unsigned int v7;
  id v8;
  void *v9;
  void *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  __CFString *v13;
  const __CFString *v14;
  void *v15;
  void *v16;
  __CFString *v17;
  id v18;
  uint64_t v19;
  id v20;
  id v21;

  v3 = *(_QWORD *)&a3;
  if (self->_viewDidAppear)
  {
    if (dword_1001A8A38 <= 30
      && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    {
      LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptAskViewController updateProductID:]", 30, "Update product ID: 0x%04X\n", v3);
    }
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle bundleWithIdentifier:](NSBundle, "bundleWithIdentifier:", CFSTR("com.apple.Sharing")));
    v21 = v5;
    if ((v3 - 8194) <= 0xD && ((1 << (v3 - 2)) & 0x3001) != 0
      || !(_DWORD)v3
      || (_DWORD)v3 == 0x10000
      || (v6 = objc_msgSend(objc_alloc((Class)SFHeadphoneProduct), "initWithProductID:", v3),
          v7 = objc_msgSend(v6, "isAirPods"),
          v6,
          v5 = v21,
          v7))
    {
      v8 = sub_100117218(v5, CFSTR("Localizable-ShareAudio"), CFSTR("SHARE_AUDIO_ACCEPT_INFO_FORMAT_AIRPODS"));
      v9 = (void *)objc_claimAutoreleasedReturnValue(v8);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("SHARE_AUDIO_ACCEPT_INFO_FORMAT_PID_%u"), v3));
      v17 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("Localizable-PID_%d"), v3));
      v18 = sub_100117218(v21, v17, v16);
      v19 = objc_claimAutoreleasedReturnValue(v18);
      if ((void *)v19 == v16)
      {

        v17 = CFSTR("Localizable-ShareAudio");
        v20 = sub_100117218(v21, CFSTR("Localizable-ShareAudio"), v16);
        v9 = (void *)objc_claimAutoreleasedReturnValue(v20);

      }
      else
      {
        v9 = (void *)v19;
      }

    }
    v10 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseMainController userInfo](self->_mainController, "userInfo"));
    TypeID = CFStringGetTypeID();
    TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("deviceName"), TypeID, 0);
    v13 = (__CFString *)objc_claimAutoreleasedReturnValue(TypedValue);

    v14 = CFSTR("?");
    if (v13)
      v14 = v13;
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", v9, v14));
    -[UILabel setText:](self->_infoLabel, "setText:", v15);

  }
  else if (dword_1001A8A38 <= 30
         && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
  {
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptAskViewController updateProductID:]", 30, "Update product ID before view ready: 0x%04X\n", v3);
  }
}

- (SVSCardContainerView)containerView
{
  return self->_containerView;
}

- (void)setContainerView:(id)a3
{
  objc_storeStrong((id *)&self->_containerView, a3);
}

- (UILabel)titleLabel
{
  return self->_titleLabel;
}

- (void)setTitleLabel:(id)a3
{
  objc_storeStrong((id *)&self->_titleLabel, a3);
}

- (UILabel)infoLabel
{
  return self->_infoLabel;
}

- (void)setInfoLabel:(id)a3
{
  objc_storeStrong((id *)&self->_infoLabel, a3);
}

- (UIButton)cancelButton
{
  return self->_cancelButton;
}

- (void)setCancelButton:(id)a3
{
  objc_storeStrong((id *)&self->_cancelButton, a3);
}

- (UIButton)joinButton
{
  return self->_joinButton;
}

- (void)setJoinButton:(id)a3
{
  objc_storeStrong((id *)&self->_joinButton, a3);
}

- (ShareAudioAcceptMainController)mainController
{
  return self->_mainController;
}

- (void)setMainController:(id)a3
{
  objc_storeStrong((id *)&self->_mainController, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mainController, 0);
  objc_storeStrong((id *)&self->_joinButton, 0);
  objc_storeStrong((id *)&self->_cancelButton, 0);
  objc_storeStrong((id *)&self->_infoLabel, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_containerView, 0);
}

@end

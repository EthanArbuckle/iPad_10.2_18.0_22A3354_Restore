@implementation ShareAudioAcceptMainController

- (unint64_t)desiredHomeButtonEvents
{
  return 0;
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  CUBluetoothClient *v5;
  CUBluetoothClient *btClient;
  UIStoryboard *v7;
  UIStoryboard *storyboard;
  ShareAudioAcceptAskViewController *v9;
  ShareAudioAcceptAskViewController *vcAsk;
  _QWORD v11[5];
  objc_super v12;

  v3 = a3;
  if (dword_1001A8A38 <= 30 && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v12.receiver = self;
  v12.super_class = (Class)ShareAudioAcceptMainController;
  -[ShareAudioAcceptMainController viewDidAppear:](&v12, "viewDidAppear:", v3);
  v5 = (CUBluetoothClient *)objc_alloc_init((Class)CUBluetoothClient);
  btClient = self->_btClient;
  self->_btClient = v5;

  -[CUBluetoothClient setFlags:](self->_btClient, "setFlags:", 16);
  -[CUBluetoothClient setLabel:](self->_btClient, "setLabel:", CFSTR("ShareAudioAccept"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10010BF5C;
  v11[3] = &unk_10017DC18;
  v11[4] = self;
  -[CUBluetoothClient setDeviceConnectedHandler:](self->_btClient, "setDeviceConnectedHandler:", v11);
  -[CUBluetoothClient activate](self->_btClient, "activate");
  v7 = (UIStoryboard *)objc_claimAutoreleasedReturnValue(+[UIStoryboard storyboardWithName:bundle:](UIStoryboard, "storyboardWithName:bundle:", CFSTR("ShareAudioProx"), 0));
  storyboard = self->_storyboard;
  self->_storyboard = v7;

  v9 = (ShareAudioAcceptAskViewController *)objc_claimAutoreleasedReturnValue(-[UIStoryboard instantiateViewControllerWithIdentifier:](self->_storyboard, "instantiateViewControllerWithIdentifier:", CFSTR("ShareAudioProxAccept")));
  vcAsk = self->_vcAsk;
  self->_vcAsk = v9;

  -[ShareAudioAcceptAskViewController setMainController:](self->_vcAsk, "setMainController:", self);
  -[ShareAudioAcceptAskViewController setModalPresentationStyle:](self->_vcAsk, "setModalPresentationStyle:", 4);
  -[ShareAudioAcceptAskViewController setModalTransitionStyle:](self->_vcAsk, "setModalTransitionStyle:", 2);
  -[ShareAudioAcceptAskViewController setTransitioningDelegate:](self->_vcAsk, "setTransitioningDelegate:", self->_vcAsk);
  -[ShareAudioAcceptMainController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", self->_vcAsk, 1, 0);
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  CUBluetoothClient *btClient;
  UIStoryboard *storyboard;
  ShareAudioAcceptAskViewController *vcAsk;
  objc_super v8;

  v3 = a3;
  if (dword_1001A8A38 <= 30 && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  -[CUBluetoothClient invalidate](self->_btClient, "invalidate");
  btClient = self->_btClient;
  self->_btClient = 0;

  if (!self->_dismissed)
  {
    if (dword_1001A8A38 <= 30
      && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
    {
      LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[ShareAudioAcceptMainController dismiss:](self, "dismiss:", 21);
  }
  storyboard = self->_storyboard;
  self->_storyboard = 0;

  -[ShareAudioAcceptAskViewController setMainController:](self->_vcAsk, "setMainController:", 0);
  vcAsk = self->_vcAsk;
  self->_vcAsk = 0;

  v8.receiver = self;
  v8.super_class = (Class)ShareAudioAcceptMainController;
  -[SVSBaseMainController viewDidDisappear:](&v8, "viewDidDisappear:", v3);
}

- (void)dismiss:(int)a3
{
  -[ShareAudioAcceptMainController dismiss:completion:](self, "dismiss:completion:", *(_QWORD *)&a3, 0);
}

- (void)dismiss:(int)a3 completion:(id)a4
{
  void (**v6)(_QWORD);
  void *v7;
  ShareAudioAcceptAskViewController *vcAsk;
  _QWORD v9[4];
  id v10;
  void (**v11)(_QWORD);

  v6 = (void (**)(_QWORD))a4;
  if (!self->_dismissed)
  {
    self->_dismissed = 1;
    v7 = (void *)objc_claimAutoreleasedReturnValue(-[ShareAudioAcceptMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    vcAsk = self->_vcAsk;
    if (vcAsk)
    {
      v9[0] = _NSConcreteStackBlock;
      v9[1] = 3221225472;
      v9[2] = sub_10010BF2C;
      v9[3] = &unk_10017E100;
      v11 = v6;
      v10 = v7;
      -[ShareAudioAcceptAskViewController dismissViewControllerAnimated:completion:](vcAsk, "dismissViewControllerAnimated:completion:", a3 != 19, v9);

    }
    else
    {
      if (v6)
        v6[2](v6);
      objc_msgSend(v7, "dismiss");
    }

  }
}

- (void)xpcStarted:(id)a3
{
  id v3;
  void *v4;
  int v5;
  void *v6;

  v3 = a3;
  v4 = v3;
  if (dword_1001A8A38 <= 30
    && ((v6 = v3, dword_1001A8A38 != -1) || (v5 = _LogCategory_Initialize(&dword_1001A8A38, 30), v4 = v6, v5)))
  {
    LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptMainController xpcStarted:]", 30, "Main XPC started: %{error}\n", v4);

  }
  else
  {

  }
}

- (void)dismissWithAction:(int)a3
{
  uint64_t v3;
  SFProxCardSessionServer *v5;
  const char *v6;
  id v7;
  _QWORD v8[4];
  id v9;
  _QWORD v10[5];
  int v11;

  if (!self->_dismissed)
  {
    v3 = *(_QWORD *)&a3;
    self->_dismissed = 1;
    v5 = self->super._proxCardSessionServer;
    if (v5)
    {
      if (dword_1001A8A38 <= 30
        && (dword_1001A8A38 != -1 || _LogCategory_Initialize(&dword_1001A8A38, 30)))
      {
        if (v3 > 3)
          v6 = "?";
        else
          v6 = off_10017DC60[v3];
        LogPrintF(&dword_1001A8A38, "-[ShareAudioAcceptMainController dismissWithAction:]", 30, "PerformAction start: %s\n", v6);
      }
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_10010BE08;
      v10[3] = &unk_10017DC40;
      v11 = v3;
      v10[4] = self;
      -[SFProxCardSessionServer performAction:completion:](v5, "performAction:completion:", v3, v10);
    }
    else
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_10010BF1C;
      v8[3] = &unk_10017E1F0;
      v9 = (id)objc_claimAutoreleasedReturnValue(-[ShareAudioAcceptMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
      v7 = v9;
      -[ShareAudioAcceptMainController dismissViewControllerAnimated:completion:](self, "dismissViewControllerAnimated:completion:", 1, v8);

    }
  }
}

- (unsigned)btProductID
{
  return self->_btProductID;
}

- (void)setBtProductID:(unsigned int)a3
{
  self->_btProductID = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_vcAsk, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
  objc_storeStrong((id *)&self->_btClient, 0);
}

@end

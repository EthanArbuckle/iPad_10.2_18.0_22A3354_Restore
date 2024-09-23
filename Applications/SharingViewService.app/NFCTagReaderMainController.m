@implementation NFCTagReaderMainController

- (void)configureWithContext:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(_QWORD);
  NSDictionary *v8;
  NSDictionary *userInfo;
  NSDictionary *v10;
  CFTypeID TypeID;
  uint64_t TypedValue;
  NSString *v13;
  NSString *purpose;
  void *v15;
  id v16;
  void *v17;
  CUXPCAgent *v18;
  CUXPCAgent *xpcAgent;
  void *v20;
  void *v21;
  void *v22;
  CUXPCAgent *v23;
  _QWORD v24[5];
  _QWORD v25[5];
  _QWORD v26[5];

  v6 = a3;
  v7 = (void (**)(_QWORD))a4;
  v8 = (NSDictionary *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "userInfo"));
  userInfo = self->super._userInfo;
  self->super._userInfo = v8;

  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController configureWithContext:completion:]", 30, "Main configuration: %@\n", self->super._userInfo);
  v10 = self->super._userInfo;
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v10, CFSTR("purpose"), TypeID, 0);
  v13 = (NSString *)objc_claimAutoreleasedReturnValue(TypedValue);
  purpose = self->_purpose;
  self->_purpose = v13;

  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint"));
  if (v15
    && (v16 = objc_alloc_init((Class)NSXPCListenerEndpoint),
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "xpcEndpoint")),
        objc_msgSend(v16, "_setEndpoint:", v17),
        v17,
        v16))
  {
    if (dword_1001A8408 <= 30
      && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    {
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController configureWithContext:completion:]", 30, "XPC agent starting\n");
    }
    v18 = (CUXPCAgent *)objc_alloc_init((Class)CUXPCAgent);
    xpcAgent = self->_xpcAgent;
    self->_xpcAgent = v18;

    -[CUXPCAgent setDispatchQueue:](self->_xpcAgent, "setDispatchQueue:", &_dispatch_main_q);
    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFNFCTagReaderUIInterface));
    -[CUXPCAgent setExportedInterface:](self->_xpcAgent, "setExportedInterface:", v20);

    -[CUXPCAgent setExportedObject:](self->_xpcAgent, "setExportedObject:", self);
    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSString stringWithUTF8String:](NSString, "stringWithUTF8String:", off_1001A8420));
    -[CUXPCAgent setLabel:](self->_xpcAgent, "setLabel:", v21);

    -[CUXPCAgent setListenerEndpoint:](self->_xpcAgent, "setListenerEndpoint:", v16);
    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSXPCInterface interfaceWithProtocol:](NSXPCInterface, "interfaceWithProtocol:", &OBJC_PROTOCOL___SFNFCTagReaderControllerInterface));
    -[CUXPCAgent setRemoteObjectInterface:](self->_xpcAgent, "setRemoteObjectInterface:", v22);

    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000EDFBC;
    v26[3] = &unk_10017E1F0;
    v26[4] = self;
    -[CUXPCAgent setInterruptionHandler:](self->_xpcAgent, "setInterruptionHandler:", v26);
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_1000EE02C;
    v25[3] = &unk_10017E1F0;
    v25[4] = self;
    -[CUXPCAgent setInvalidationHandler:](self->_xpcAgent, "setInvalidationHandler:", v25);
    v23 = self->_xpcAgent;
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_1000EE09C;
    v24[3] = &unk_10017E070;
    v24[4] = self;
    -[CUXPCAgent activateWithCompletion:](v23, "activateWithCompletion:", v24);

  }
  else if (dword_1001A8408 <= 30
         && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
  {
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController configureWithContext:completion:]", 30, "No XPC endpoint (not starting XPC agent)\n");
  }
  if (v7)
    v7[2](v7);

}

- (unint64_t)supportedInterfaceOrientations
{
  return PRXSupportedInterfaceOrientations(self, 1);
}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  NFCTagReaderScanViewController *v5;
  NFCTagReaderScanViewController *vcScan;
  NFCTagReaderScanViewController *v7;
  UINavigationController *v8;
  UINavigationController *vcNav;
  void *v10;
  void *v11;
  objc_super v12;

  v3 = a3;
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController viewDidAppear:]", 30, "Main ViewDidAppear\n");
  v12.receiver = self;
  v12.super_class = (Class)NFCTagReaderMainController;
  -[NFCTagReaderMainController viewDidAppear:](&v12, "viewDidAppear:", v3);
  v5 = objc_alloc_init(NFCTagReaderScanViewController);
  -[NFCTagReaderScanViewController setMainController:](v5, "setMainController:", self);
  vcScan = self->_vcScan;
  self->_vcScan = v5;
  v7 = v5;

  v8 = (UINavigationController *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderMainController presentProxCardFlowWithDelegate:initialViewController:](self, "presentProxCardFlowWithDelegate:initialViewController:", self, v7));
  vcNav = self->_vcNav;
  self->_vcNav = v8;

  v10 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v10, "setStatusBarHidden:withDuration:", 1, 0.3);

  v11 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v11, "setIdleTimerDisabled:forReason:", 1, CFSTR("com.apple.SharingViewService.NFCTagReader"));

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CUXPCAgent *v6;
  CUXPCAgent *xpcAgent;
  CUXPCAgent *v8;
  void *v9;
  CUXPCAgent *v10;
  UIStoryboard *storyboard;
  UINavigationController *vcNav;
  NFCTagReaderScanViewController *vcScan;
  objc_super v14;
  _QWORD v15[4];
  CUXPCAgent *v16;
  _QWORD v17[4];
  CUXPCAgent *v18;

  v3 = a3;
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setIdleTimerDisabled:forReason:", 0, CFSTR("com.apple.SharingViewService.NFCTagReader"));

  if (!self->_dismissed)
  {
    if (dword_1001A8408 <= 30
      && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    {
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController viewDidDisappear:]", 30, "Main disappeared without dismiss (device locked?)...dismissing UI\n");
    }
    -[NFCTagReaderMainController dismiss:](self, "dismiss:", 21);
  }
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController viewDidDisappear:]", 30, "XPC agent UI invalidate\n");
  v6 = self->_xpcAgent;
  xpcAgent = self->_xpcAgent;
  self->_xpcAgent = 0;

  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1000ECB08;
  v17[3] = &unk_10017E070;
  v8 = v6;
  v18 = v8;
  v9 = (void *)objc_claimAutoreleasedReturnValue(-[CUXPCAgent remoteObjectProxyWithErrorHandler:](v8, "remoteObjectProxyWithErrorHandler:", v17));
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1000ECB98;
  v15[3] = &unk_10017E070;
  v16 = v8;
  v10 = v8;
  objc_msgSend(v9, "uiInvalidatedWithCompletion:", v15);

  storyboard = self->_storyboard;
  self->_storyboard = 0;

  vcNav = self->_vcNav;
  self->_vcNav = 0;

  -[NFCTagReaderScanViewController setMainController:](self->_vcScan, "setMainController:", 0);
  vcScan = self->_vcScan;
  self->_vcScan = 0;

  v14.receiver = self;
  v14.super_class = (Class)NFCTagReaderMainController;
  -[SVSBaseMainController viewDidDisappear:](&v14, "viewDidDisappear:", v3);

}

- (void)dismiss:(int)a3
{
  -[NFCTagReaderMainController dismissAnimated:](self, "dismissAnimated:", a3 != 19);
}

- (void)dismissAnimated:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  UINavigationController *vcNav;
  _QWORD v8[4];
  id v9;

  if (!self->_dismissed)
  {
    v3 = a3;
    self->_dismissed = 1;
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[NFCTagReaderMainController _remoteViewControllerProxy](self, "_remoteViewControllerProxy"));
    v6 = v5;
    vcNav = self->_vcNav;
    if (vcNav)
    {
      v8[0] = _NSConcreteStackBlock;
      v8[1] = 3221225472;
      v8[2] = sub_1000ECB00;
      v8[3] = &unk_10017E1F0;
      v9 = v5;
      -[UINavigationController dismissViewControllerAnimated:completion:](vcNav, "dismissViewControllerAnimated:completion:", v3, v8);

    }
    else
    {
      objc_msgSend(v5, "dismiss");
    }

  }
}

- (void)dismissIfIdle
{
  int operationCount;

  if (self->_dismissing)
  {
    if (dword_1001A8408 <= 30
      && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    {
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController dismissIfIdle]", 30, "Ignoring dismissIfIdle because already dismissing\n");
    }
    return;
  }
  operationCount = self->_operationCount;
  if (operationCount >= 1)
  {
    if (dword_1001A8408 <= 30)
    {
      if (dword_1001A8408 == -1)
      {
        if (!_LogCategory_Initialize(&dword_1001A8408, 30))
          goto LABEL_15;
        operationCount = self->_operationCount;
      }
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController dismissIfIdle]", 30, "Deferring dismiss with outstanding operations (%d)\n", operationCount);
    }
LABEL_15:
    self->_dismissPending = 1;
    return;
  }
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController dismissIfIdle]", 30, "dismissIfIdle: is idle\n");
  -[NFCTagReaderMainController dismiss:](self, "dismiss:", 8);
}

- (void)handleButtonActions:(id)a3
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];

  v4 = a3;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v10;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v10 != v7)
          objc_enumerationMutation(v4);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v9 + 1) + 8 * (_QWORD)i), "events") & 0x10) != 0)
        {
          if (dword_1001A8408 <= 30
            && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
          {
            LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController handleButtonActions:]", 30, "Home button\n");
          }
          -[NFCTagReaderMainController dismiss:](self, "dismiss:", 4);
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
    }
    while (v6);
  }

}

- (void)nfcTagScannedCount:(int64_t)a3
{
  if (dword_1001A8408 <= 30 && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController nfcTagScannedCount:]", 30, "nfcTagScannedCount: %ld, appeared: %d\n", a3, self->_appeared);
  if (a3)
  {
    if (a3 >= 1)
    {
      self->_tagCount = a3;
      if (self->_appeared)
        -[NFCTagReaderScanViewController nfcTagScanned](self->_vcScan, "nfcTagScanned");
      else
        -[NFCTagReaderMainController uiOperationBegin](self, "uiOperationBegin");
    }
  }
  else
  {
    -[NFCTagReaderScanViewController showFailureUI](self->_vcScan, "showFailureUI");
  }
}

- (void)setPurpose:(id)a3
{
  id v5;

  v5 = a3;
  objc_storeStrong((id *)&self->_purpose, a3);
  if (self->_appeared)
    -[NFCTagReaderScanViewController setSubtitle:](self->_vcScan, "setSubtitle:", v5);

}

- (void)uiOperationBegin
{
  ++self->_operationCount;
}

- (void)uiOperationEnd
{
  int v2;

  v2 = self->_operationCount - 1;
  self->_operationCount = v2;
  if (!v2 && self->_dismissPending && !self->_dismissing)
  {
    if (dword_1001A8408 <= 30
      && (dword_1001A8408 != -1 || _LogCategory_Initialize(&dword_1001A8408, 30)))
    {
      LogPrintF(&dword_1001A8408, "-[NFCTagReaderMainController uiOperationEnd]", 30, "Dismiss on final operation end\n");
    }
    self->_dismissPending = 0;
    -[NFCTagReaderMainController dismiss:](self, "dismiss:", 8);
  }
}

- (void)proxCardFlowDidDismiss
{
  -[NFCTagReaderMainController dismiss:](self, "dismiss:", 8);
}

- (BOOL)appeared
{
  return self->_appeared;
}

- (void)setAppeared:(BOOL)a3
{
  self->_appeared = a3;
}

- (BOOL)dismissing
{
  return self->_dismissing;
}

- (void)setDismissing:(BOOL)a3
{
  self->_dismissing = a3;
}

- (NSString)purpose
{
  return self->_purpose;
}

- (int64_t)tagCount
{
  return self->_tagCount;
}

- (void)setTagCount:(int64_t)a3
{
  self->_tagCount = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_purpose, 0);
  objc_storeStrong((id *)&self->_xpcAgent, 0);
  objc_storeStrong((id *)&self->_vcScan, 0);
  objc_storeStrong((id *)&self->_vcNav, 0);
  objc_storeStrong((id *)&self->_storyboard, 0);
}

@end

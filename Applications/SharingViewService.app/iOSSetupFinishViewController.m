@implementation iOSSetupFinishViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  unsigned int v6;
  const __CFString *v7;
  void *v8;
  id v9;
  void *v10;
  unsigned int v11;
  const __CFString *v12;
  void *v13;
  unsigned int v14;
  const __CFString *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  id v24;
  void *v25;
  NSObject *v26;
  uint64_t v27[4];
  dispatch_source_t v28;
  iOSSetupFinishViewController *v29;
  objc_super v30;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupFinishViewController viewWillAppear:]", 30, "Finish ViewWillAppear\n");
  v30.receiver = self;
  v30.super_class = (Class)iOSSetupFinishViewController;
  -[SVSBaseViewController viewWillAppear:](&v30, "viewWillAppear:", v3);
  objc_msgSend(self->super.super._mainController, "setBlockHardwareButtons:", 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setDesiredHardwareButtonEvents:", 17);
  v6 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
  if (v6 > 6)
    v7 = CFSTR("_IPHONE");
  else
    v7 = off_10017DF70[v6];
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_FINISH_TITLE"), "stringByAppendingString:", v7));
  v9 = sub_1001171A8(CFSTR("Localizable"), v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v10);

  v11 = SFDeviceClassCodeGet() - 1;
  if (v11 > 6)
    v12 = CFSTR("_IPHONE");
  else
    v12 = off_10017DF70[v11];
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_FINISH_TRANSFER"), "stringByAppendingString:", v12));
  v14 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
  if (v14 > 6)
    v15 = CFSTR("_IPHONE");
  else
    v15 = off_10017DF70[v14];
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "stringByAppendingString:", v15));

  v24 = sub_1001173A4(v16, v17, v18, v19, v20, v21, v22, v23, v27[0]);
  v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v25);

  if (objc_msgSend(self->super.super._mainController, "testMode"))
  {
    v27[0] = (uint64_t)_NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = (uint64_t)sub_1000E9068;
    v27[3] = (uint64_t)&unk_10017E1A0;
    v28 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
    v29 = self;
    v26 = v28;
    dispatch_source_set_event_handler(v26, v27);
    SFDispatchTimerSet(v26, 3.0, -1.0, -4.0);
    dispatch_resume(v26);

  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupFinishViewController viewDidDisappear:]", 30, "Finish ViewDidDisappear\n");
  v6.receiver = self;
  v6.super_class = (Class)iOSSetupFinishViewController;
  -[iOSSetupFinishViewController viewDidDisappear:](&v6, "viewDidDisappear:", v3);
  objc_msgSend(self->super.super._mainController, "setBlockHardwareButtons:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v5, "setDesiredHardwareButtonEvents:", objc_msgSend(self->super.super._mainController, "desiredHomeButtonEvents"));

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupFinishViewController handleDismissButton:]", 30, "Dismiss button\n");
  -[iOSSetupBaseViewController dismissWithType:](self, "dismissWithType:", 5);

}

- (void)handleProgressEvent:(unsigned int)a3
{
  id v4;
  unsigned int v5;
  const __CFString *v6;
  id v7;
  void *v8;
  id v9;

  if (a3 == 97)
  {
    v5 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
    if (v5 > 6)
      v6 = CFSTR("_IPHONE");
    else
      v6 = off_10017DF70[v5];
    v9 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_FINISH_TITLE"), "stringByAppendingString:", v6));
    v7 = sub_1001171A8(CFSTR("Localizable"), v9);
    v8 = (void *)objc_claimAutoreleasedReturnValue(v7);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v8);

    goto LABEL_9;
  }
  if (a3 == 99)
  {
    v4 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WAITING_FOR_SOFTWARE_UPDATE"));
    v9 = (id)objc_claimAutoreleasedReturnValue(v4);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v9);
LABEL_9:

  }
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end

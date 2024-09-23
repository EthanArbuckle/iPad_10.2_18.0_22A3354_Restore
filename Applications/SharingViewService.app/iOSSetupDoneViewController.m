@implementation iOSSetupDoneViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  id v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  unsigned int v20;
  const __CFString *v21;
  void *v22;
  id v23;
  void *v24;
  void *v25;
  id v26;
  __CFString *v27;
  __CFString *v28;
  unsigned int v29;
  const __CFString *v30;
  void *v31;
  id v32;
  void *v33;
  _BOOL8 v34;
  void *v35;
  objc_super v36;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v36.receiver = self;
  v36.super_class = (Class)iOSSetupDoneViewController;
  -[SVSBaseViewController viewWillAppear:](&v36, "viewWillAppear:", v3);
  v5 = *(uint64_t *)((char *)&self->_doneButton + 1);
  if (v5)
  {
    v6 = NSErrorToOSStatus(v5);
    v14 = sub_1001173A4(CFSTR("SETUP_FAILED_FORMAT"), v7, v8, v9, v10, v11, v12, v13, v6);
    v15 = (void *)objc_claimAutoreleasedReturnValue(v14);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v15);

    if (IsAppleInternalBuild(v16))
    {
      v17 = NSPrintF("%{error}", *(UIButton **)((char *)&self->_doneButton + 1));
      v18 = (void *)objc_claimAutoreleasedReturnValue(v17);
      objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v18);

    }
    else
    {
      v19 = objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setHidden:", 1);
    }
  }
  else
  {
    v20 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
    if (v20 > 6)
      v21 = CFSTR("_IPHONE");
    else
      v21 = off_10017DF70[v20];
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_FINISH_TITLE"), "stringByAppendingString:", v21));
    v23 = sub_1001171A8(CFSTR("Localizable"), v22);
    v24 = (void *)objc_claimAutoreleasedReturnValue(v23);
    objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v24);

    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super.super._mainController, "myAppleID"));
    v26 = objc_msgSend(v25, "length");
    v27 = CFSTR("IOS_SETUP_FINISH_INFO");
    if (!v26)
      v27 = CFSTR("IOS_SETUP_FINISH_INFO_NO_ID");
    v28 = v27;

    v29 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
    if (v29 > 6)
      v30 = CFSTR("_IPHONE");
    else
      v30 = off_10017DF70[v29];
    v31 = (void *)objc_claimAutoreleasedReturnValue(-[__CFString stringByAppendingString:](v28, "stringByAppendingString:", v30));

    v32 = sub_1001171A8(CFSTR("Localizable"), v31);
    v33 = (void *)objc_claimAutoreleasedReturnValue(v32);
    objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v33);

  }
  if (IsAppleInternalBuild(v19))
    v34 = *(UIButton **)((char *)&self->_doneButton + 1) == 0;
  else
    v34 = 1;
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setHidden:", v34);
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v35, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)iOSSetupDoneViewController;
  -[iOSSetupDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupDoneViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

}

- (void)handleReportBugButton:(id)a3
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  uint64_t v10;
  void *i;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _QWORD v23[8];
  _QWORD v24[8];

  v23[0] = CFSTR("Classification");
  v23[1] = CFSTR("ComponentID");
  v24[0] = CFSTR("Serious Bug");
  v24[1] = CFSTR("768684");
  v23[2] = CFSTR("ComponentName");
  v23[3] = CFSTR("ComponentVersion");
  v24[2] = CFSTR("Proximity Setup");
  v24[3] = CFSTR("all");
  v23[4] = CFSTR("ExtensionIdentifiers");
  v23[5] = CFSTR("Keywords");
  v24[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v24[5] = CFSTR("758122");
  v24[6] = CFSTR("I Didn't Try");
  v23[6] = CFSTR("Reproducibility");
  v23[7] = CFSTR("Title");
  v3 = NSPrintF("OOBE: Proximity Setup Failed: %{error}", a2, a3, *(UIButton **)((char *)&self->_doneButton + 1));
  v4 = (void *)objc_claimAutoreleasedReturnValue(v3);
  v24[7] = v4;
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v24, v23, 8));

  v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v7 = v5;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(_QWORD *)v19 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * (_QWORD)i);
        v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectForKeyedSubscript:", v12));
        v14 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v12, v13));
        objc_msgSend(v6, "addObject:", v14);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v9);
  }

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("tap-to-radar://new")));
  objc_msgSend(v15, "setQueryItems:", v6);
  v16 = (void *)UIApp;
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "URL"));
  objc_msgSend(v16, "openURL:withCompletionHandler:", v17, 0);

  if (dword_1001A82C8 <= 50 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 50)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupDoneViewController handleReportBugButton:]", 50, "Report Bug\n");

}

- (NSError)error
{
  return *(NSError **)((char *)&self->_doneButton + 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 65);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_doneButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end

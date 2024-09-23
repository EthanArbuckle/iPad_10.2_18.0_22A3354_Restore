@implementation iOSSetupBackupSyncViewController

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  unsigned int v7;
  const __CFString *v8;
  void *v9;
  unsigned int v10;
  const __CFString *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  id v20;
  void *v21;
  objc_super v22;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupBackupSyncViewController viewWillAppear:]", 30, "BackupSync ViewWillAppear\n");
  v22.receiver = self;
  v22.super_class = (Class)iOSSetupBackupSyncViewController;
  -[SVSBaseViewController viewWillAppear:](&v22, "viewWillAppear:", v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("IOS_SETUP_BACKUP_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v6);

  v7 = SFDeviceClassCodeGet() - 1;
  if (v7 > 6)
    v8 = CFSTR("_IPHONE");
  else
    v8 = off_10017DF70[v7];
  v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_BACKUP_INFO"), "stringByAppendingString:", v8));
  v10 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
  if (v10 > 6)
    v11 = CFSTR("_IPHONE");
  else
    v11 = off_10017DF70[v10];
  v12 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "stringByAppendingString:", v11));

  v20 = sub_1001173A4(v12, v13, v14, v15, v16, v17, v18, v19, (uint64_t)v22.receiver);
  v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v21);

  if (objc_msgSend(self->super.super._mainController, "testMode"))
    -[iOSSetupBackupSyncViewController _handleTestTimerFired](self, "_handleTestTimerFired");

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupBackupSyncViewController viewDidDisappear:]", 30, "BackupSync ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)iOSSetupBackupSyncViewController;
  -[iOSSetupBackupSyncViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleHideButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
    LogPrintF(&dword_1001A82C8, "-[iOSSetupBackupSyncViewController handleHideButton:]", 30, "BackupSync Hide button\n");
  objc_msgSend(self->super.super._mainController, "dismiss:", 5);

}

- (void)handleProgressEvent:(unsigned int)a3 info:(id)a4
{
  void *v6;
  void *v7;
  unsigned int v8;
  const __CFString *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  unsigned int v15;
  const __CFString *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  id v25;
  void *v26;
  double Double;
  double v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  id v38;
  void *v39;
  double v40;
  void *v41;
  id v42;
  void *v43;
  uint64_t v44;
  uint64_t v45;
  uint64_t v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  id v51;
  const char *v52;
  id v53;

  v53 = a4;
  if (dword_1001A82C8 <= 30 && (dword_1001A82C8 != -1 || _LogCategory_Initialize(&dword_1001A82C8, 30)))
  {
    v52 = sub_1000E5A3C(a3);
    LogPrintF(&dword_1001A82C8, "-[iOSSetupBackupSyncViewController handleProgressEvent:info:]", 30, "BackupSync Progress: %s %##@\n");
  }
  if (a3 == 310)
  {
    if (*(_DWORD *)((char *)&self->_progressLabel + 1) != 310)
    {
      v10 = sub_1001171A8(CFSTR("Localizable"), CFSTR("IOS_SETUP_SYNC_TITLE"));
      v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
      objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v11);

      v12 = sub_1001171A8(CFSTR("Localizable"), CFSTR("IOS_SETUP_SYNC_INFO"));
      v13 = (void *)objc_claimAutoreleasedReturnValue(v12);
      objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v13);

      *(_DWORD *)((char *)&self->_progressLabel + 1) = 310;
    }
  }
  else
  {
    if (a3 != 300)
      goto LABEL_27;
    if (*(_DWORD *)((char *)&self->_progressLabel + 1) != 300)
    {
      v6 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("IOS_SETUP_BACKUP_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
      objc_msgSend(*(id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v7);

      v8 = SFDeviceClassCodeGet() - 1;
      if (v8 > 6)
        v9 = CFSTR("_IPHONE");
      else
        v9 = off_10017DF70[v8];
      v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(CFSTR("IOS_SETUP_BACKUP_INFO"), "stringByAppendingString:", v9));
      v15 = objc_msgSend(self->super.super._mainController, "otherDeviceClassCode") - 1;
      if (v15 > 6)
        v16 = CFSTR("_IPHONE");
      else
        v16 = off_10017DF70[v15];
      v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "stringByAppendingString:", v16));

      v25 = sub_1001173A4(v17, v18, v19, v20, v21, v22, v23, v24, (uint64_t)v52);
      v26 = (void *)objc_claimAutoreleasedReturnValue(v25);
      objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v26);

      *(_DWORD *)((char *)&self->_progressLabel + 1) = 300;
    }
  }
  Double = CFDictionaryGetDouble(v53, CFSTR("progress"), 0);
  if (Double > 1.0)
    Double = 1.0;
  if (Double < 0.0)
    Double = 0.0;
  *(float *)&Double = Double;
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setProgress:", Double);
  v28 = CFDictionaryGetDouble(v53, CFSTR("remainSecs"), 0);
  if (v28 >= 0.0)
  {
    v40 = v28;
    v41 = *(void **)((char *)&self->_lastProgressEvent + 1);
    if (!v41)
    {
      v42 = objc_alloc_init((Class)NSDateComponentsFormatter);
      v43 = *(void **)((char *)&self->_lastProgressEvent + 1);
      *(_QWORD *)((char *)&self->_lastProgressEvent + 1) = v42;

      objc_msgSend(*(id *)((char *)&self->_lastProgressEvent + 1), "setUnitsStyle:", 3);
      objc_msgSend(*(id *)((char *)&self->_lastProgressEvent + 1), "setIncludesApproximationPhrase:", 1);
      objc_msgSend(*(id *)((char *)&self->_lastProgressEvent + 1), "setAllowedUnits:", 240);
      objc_msgSend(*(id *)((char *)&self->_lastProgressEvent + 1), "setMaximumUnitCount:", 1);
      v41 = *(void **)((char *)&self->_lastProgressEvent + 1);
    }
    v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v41, "stringFromTimeInterval:", v40));
    v51 = sub_1001173A4(CFSTR("IOS_SETUP_REMAINING_SECONDS_FORMAT"), v44, v45, v46, v47, v48, v49, v50, (uint64_t)v29);
    v30 = (void *)objc_claimAutoreleasedReturnValue(v51);
    objc_msgSend(*(id *)((char *)&self->_progressBar + 1), "setText:", v30);
  }
  else
  {
    v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("ESTIMATING"), &stru_10017E3D8, CFSTR("Localizable")));
    v38 = sub_1001173A4(CFSTR("IOS_SETUP_REMAINING_SECONDS_FORMAT"), v31, v32, v33, v34, v35, v36, v37, (uint64_t)v30);
    v39 = (void *)objc_claimAutoreleasedReturnValue(v38);
    objc_msgSend(*(id *)((char *)&self->_progressBar + 1), "setText:", v39);

  }
  objc_msgSend(*(id *)((char *)&self->_progressBar + 1), "setHidden:", 0);
LABEL_27:

}

- (void)_handleTestTimerFired
{
  int v3;
  double v4;
  uint64_t v5;
  int v6;
  id v7;
  double v8;
  void *v9;
  void *v10;
  void *v11;
  NSObject *v12;
  unsigned int v13;
  id mainController;
  uint64_t v15;
  id v16;
  _QWORD handler[4];
  dispatch_source_t v18;
  iOSSetupBackupSyncViewController *v19;
  _QWORD v20[2];
  _QWORD v21[2];

  v3 = *(_DWORD *)((char *)&self->_progressLabel + 5);
  if (v3 > 0xA)
  {
    if ((v3 - 11) > 0xA)
    {
      v13 = objc_msgSend(self->super.super._mainController, "testMode");
      mainController = self->super.super._mainController;
      if (v13 == 1)
      {
        objc_msgSend(mainController, "showDoneUI:", 0);
      }
      else
      {
        v15 = NSErrorWithOSStatusF(4294960574, "Fake Timeout");
        v16 = (id)objc_claimAutoreleasedReturnValue(v15);
        objc_msgSend(mainController, "showDoneUI:");

      }
      return;
    }
    if (v3 == 11)
      v4 = -1.0;
    else
      v4 = 2000.0 - (double)(v3 - 11) / 10.0 * 2000.0;
    v5 = 310;
    v6 = 21;
  }
  else
  {
    if (v3)
      v4 = 500.0 - (double)v3 / 10.0 * 500.0;
    else
      v4 = -1.0;
    v5 = 300;
    v6 = 10;
  }
  *(_DWORD *)((char *)&self->_progressLabel + 5) = v3 + 1;
  v7 = self->super.super._mainController;
  if (v3 == v6)
    v8 = 2.0;
  else
    v8 = 0.3;
  v20[0] = CFSTR("progress");
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:"));
  v20[1] = CFSTR("remainSecs");
  v21[0] = v9;
  v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", v4));
  v21[1] = v10;
  v11 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v21, v20, 2));
  objc_msgSend(v7, "showBackupSyncUI:info:", v5, v11);

  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1000E9AAC;
  handler[3] = &unk_10017E1A0;
  v18 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
  v19 = self;
  v12 = v18;
  dispatch_source_set_event_handler(v12, handler);
  SFDispatchTimerSet(v12, v8, -1.0, -4.0);
  dispatch_resume(v12);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_lastProgressEvent + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressBar + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super.super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end

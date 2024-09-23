@implementation RepairDoneViewController

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
  int v12;
  id v13;
  void *v14;
  __CFString *v15;
  id v16;
  void *v17;
  id v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  objc_super v27;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v27.receiver = self;
  v27.super_class = (Class)RepairDoneViewController;
  -[SVSBaseViewController viewWillAppear:](&v27, "viewWillAppear:", v3);
  v12 = *(_DWORD *)((char *)&self->_doneButton + 1);
  if (!v12)
    goto LABEL_12;
  if (v12 == 301004)
  {
    v16 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WIFI_INCOMPATIBLE_TITLE"));
    v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v17);

    v15 = CFSTR("AS_WIFI_INCOMPATIBLE_DETAIL");
    goto LABEL_10;
  }
  if (v12 != 301000)
  {
    v20 = sub_1001173A4(CFSTR("REPAIR_FAILED_TITLE_FORMAT"), v5, v6, v7, v8, v9, v10, v11, *(unsigned int *)((char *)&self->_doneButton + 1));
    v21 = (void *)objc_claimAutoreleasedReturnValue(v20);
    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v21);

    v22 = *(UIButton **)((char *)&self->_reportBugButton + 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(v22, "setTitle:forState:", v24, 0);

    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", IsAppleInternalBuild(v25) == 0);
LABEL_12:
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "productImage"));
    objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setImage:", v19);
    goto LABEL_13;
  }
  v13 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WIFI_NOT_CONNECTED_TITLE"));
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setText:", v14);

  v15 = CFSTR("AS_WIFI_NOT_CONNECTED_DETAIL");
LABEL_10:
  v18 = sub_1001171A8(CFSTR("Localizable"), v15);
  v19 = (void *)objc_claimAutoreleasedReturnValue(v18);
  objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v19);
LABEL_13:

  v26 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v26, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)RepairDoneViewController;
  -[RepairDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleActionButton:(id)a3
{
  id v4;
  __CFString *v5;
  uint64_t v6;
  id mainController;
  __CFString *v8;
  _QWORD v9[4];
  __CFString *v10;

  v4 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairDoneViewController handleActionButton:]", 30, "Action button\n");
  if ((*(_DWORD *)((char *)&self->_doneButton + 1) | 4) == 0x497CC)
  {
    v5 = CFSTR("prefs:root=WIFI");
    v6 = 12;
  }
  else
  {
    v5 = UIApplicationOpenSettingsURLString;
    v6 = 5;
  }
  mainController = self->super._mainController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100107F04;
  v9[3] = &unk_10017E1F0;
  v10 = v5;
  v8 = v5;
  objc_msgSend(mainController, "dismiss:completion:", v6, v9);

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8968 <= 30 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 30)))
    LogPrintF(&dword_1001A8968, "-[RepairDoneViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleReportBugButton:(id)a3
{
  id v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  id v11;
  uint64_t v12;
  void *i;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  _QWORD v25[8];
  _QWORD v26[8];

  v4 = a3;
  v25[0] = CFSTR("Classification");
  v25[1] = CFSTR("ComponentID");
  v26[0] = CFSTR("Serious Bug");
  v26[1] = CFSTR("768684");
  v25[2] = CFSTR("ComponentName");
  v25[3] = CFSTR("ComponentVersion");
  v26[2] = CFSTR("Proximity Setup");
  v26[3] = CFSTR("all");
  v25[4] = CFSTR("ExtensionIdentifiers");
  v25[5] = CFSTR("Keywords");
  v26[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v26[5] = CFSTR("794979");
  v26[6] = CFSTR("I Didn't Try");
  v25[6] = CFSTR("Reproducibility");
  v25[7] = CFSTR("Title");
  if (*(_QWORD *)((char *)&self->_status + 1))
    v5 = NSPrintF("TTF: Failed: %{error}", *(_QWORD *)((char *)&self->_status + 1));
  else
    v5 = NSPrintF("TTF: Failed: %#m", *(unsigned int *)((char *)&self->_doneButton + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v26[7] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 8));

  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v9 = v7;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v21;
    do
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(_QWORD *)v21 != v12)
          objc_enumerationMutation(v9);
        v14 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * (_QWORD)i);
        v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v9, "objectForKeyedSubscript:", v14));
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v14, v15));
        objc_msgSend(v8, "addObject:", v16);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v11);
  }

  v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("tap-to-radar://new")));
  objc_msgSend(v17, "setQueryItems:", v8);
  v18 = (void *)UIApp;
  v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "URL"));
  objc_msgSend(v18, "openURL:withCompletionHandler:", v19, 0);

  if (dword_1001A8968 <= 50 && (dword_1001A8968 != -1 || _LogCategory_Initialize(&dword_1001A8968, 50)))
    LogPrintF(&dword_1001A8968, "-[RepairDoneViewController handleReportBugButton:]", 50, "Report Bug\n");

}

- (NSError)error
{
  return *(NSError **)((char *)&self->_status + 1);
}

- (void)setError:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 81);
}

- (int)status
{
  return *(_DWORD *)((char *)&self->_doneButton + 1);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_doneButton + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_status + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end

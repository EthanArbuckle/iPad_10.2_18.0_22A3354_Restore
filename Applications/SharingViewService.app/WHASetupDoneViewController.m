@implementation WHASetupDoneViewController

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
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  id v27;
  void *v28;
  id v29;
  void *v30;
  id v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  objc_super v36;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v36.receiver = self;
  v36.super_class = (Class)WHASetupDoneViewController;
  -[SVSBaseViewController viewWillAppear:](&v36, "viewWillAppear:", v3);
  v12 = *(_DWORD *)((char *)&self->_infoLabel + 1);
  switch(v12)
  {
    case 301000:
      v13 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WIFI_NOT_CONNECTED_TITLE"));
      v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
      objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v14);

      v15 = CFSTR("WIFI_NOT_CONNECTED_DETAIL_WHA");
      goto LABEL_11;
    case 301001:
    case 301002:
    case 301003:
    case 301008:
    case 301009:
    case 301012:
    case 301013:
    case 301014:
      goto LABEL_9;
    case 301004:
      v27 = sub_1001171A8(CFSTR("Localizable"), CFSTR("WIFI_INCOMPATIBLE_TITLE"));
      v28 = (void *)objc_claimAutoreleasedReturnValue(v27);
      objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v28);

      v15 = CFSTR("WIFI_INCOMPATIBLE_DETAIL_WHA");
LABEL_11:
      v29 = sub_1001171A8(CFSTR("Localizable"), v15);
      v30 = (void *)objc_claimAutoreleasedReturnValue(v29);
      objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v30);
      goto LABEL_15;
    case 301005:
    case 301007:
    case 301010:
    case 301015:
      break;
    case 301006:
      v31 = sub_1001171A8(CFSTR("Localizable"), CFSTR("ICLOUD_INCOMPATIBLE_TITLE"));
      v32 = (void *)objc_claimAutoreleasedReturnValue(v31);
      objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v32);

      v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v33 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("ICLOUD_INCOMPATIBLE_DETAIL_WHA"), &stru_10017E3D8, CFSTR("Localizable")));
      objc_msgSend(*(id *)((char *)&self->_titleLabel + 1), "setText:", v33);
      goto LABEL_14;
    case 301011:
      v30 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("iCloudIcon.png")));
      v33 = (void *)objc_claimAutoreleasedReturnValue(+[UIScreen mainScreen](UIScreen, "mainScreen"));
      objc_msgSend(v33, "scale");
      v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "_applicationIconImageForFormat:precomposed:scale:", 2, 1));
      objc_msgSend(*(id *)((char *)&self->_doneButton + 1), "setImage:", v34);

LABEL_14:
LABEL_15:

      break;
    default:
      if (v12)
      {
LABEL_9:
        v21 = sub_1001173A4(CFSTR("SETUP_FAILED_FORMAT"), v5, v6, v7, v8, v9, v10, v11, *(unsigned int *)((char *)&self->_infoLabel + 1));
        v22 = (void *)objc_claimAutoreleasedReturnValue(v21);
        objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v22);

        v23 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
        v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
        objc_msgSend(v23, "setTitle:forState:", v25, 0);

        objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", IsAppleInternalBuild(v26) == 0);
      }
      else
      {
        v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("WHA_SUCCESS_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
        objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v17);

        v18 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
        v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
        v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10017E3D8, CFSTR("Localizable")));
        objc_msgSend(v18, "setTitle:forState:", v20, 0);

      }
      break;
  }
  v35 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v35, "setSwipeDismissible:", 1);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)WHASetupDoneViewController;
  -[WHASetupDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (void)handleActionButton:(id)a3
{
  id v4;
  unsigned int v5;
  uint64_t v6;
  const __CFString *v7;
  id mainController;
  _QWORD v9[4];
  __CFString *v10;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupDoneViewController handleActionButton:]", 30, "Action button\n");
  v5 = *(_DWORD *)((char *)&self->_infoLabel + 1) - 301000;
  if (v5 > 0xF)
  {
    v7 = CFSTR("prefs:root");
    v6 = 5;
  }
  else
  {
    v6 = dword_1001358EC[v5];
    v7 = *(&off_10017E2B8 + v5);
  }
  mainController = self->super._mainController;
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100121E1C;
  v9[3] = &unk_10017E1F0;
  v10 = (__CFString *)v7;
  objc_msgSend(mainController, "dismiss:completion:", v6, v9);

}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A9008 <= 30 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 30)))
    LogPrintF(&dword_1001A9008, "-[WHASetupDoneViewController handleDismissButton:]", 30, "Done button\n");
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
  _QWORD v25[7];
  _QWORD v26[7];

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
  v25[5] = CFSTR("Reproducibility");
  v26[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v26[5] = CFSTR("I Didn't Try");
  v25[6] = CFSTR("Title");
  if (*(_QWORD *)((char *)&self->_status + 1))
    v5 = NSPrintF("WHASetup: Proximity Setup Failed: %{error}", *(_QWORD *)((char *)&self->_status + 1));
  else
    v5 = NSPrintF("WHASetup: Proximity Setup Failed: %#m", *(unsigned int *)((char *)&self->_infoLabel + 1));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v26[6] = v6;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v26, v25, 7));

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

  if (dword_1001A9008 <= 50 && (dword_1001A9008 != -1 || _LogCategory_Initialize(&dword_1001A9008, 50)))
    LogPrintF(&dword_1001A9008, "-[WHASetupDoneViewController handleReportBugButton:]", 50, "Report Bug\n");

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
  return *(_DWORD *)((char *)&self->_infoLabel + 1);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_infoLabel + 1) = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_status + 1), 0);
  objc_storeStrong((id *)((char *)&self->_titleLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_doneButton + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

@end

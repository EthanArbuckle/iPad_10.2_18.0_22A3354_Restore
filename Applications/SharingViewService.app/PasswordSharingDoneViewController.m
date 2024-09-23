@implementation PasswordSharingDoneViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService33PasswordSharingDoneViewController *v2;

  v2 = self;
  sub_10002646C();

}

- (void)viewDidAppear:(BOOL)a3
{
  _TtC18SharingViewService33PasswordSharingDoneViewController *v4;

  v4 = self;
  sub_100026BC4(a3);

}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingDoneViewController viewDidDisappear:]", 30, "Done ViewDidDisappear\n");
  v5.receiver = self;
  v5.super_class = (Class)PasswordSharingDoneViewController;
  -[PasswordSharingDoneViewController viewDidDisappear:](&v5, "viewDidDisappear:", v3);
}

- (_TtC18SharingViewService33PasswordSharingDoneViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  objc_class *done;
  objc_super v9;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService33PasswordSharingDoneViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService33PasswordSharingDoneViewController_type] = 2;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService33PasswordSharingDoneViewController_model];
  done = (objc_class *)type metadata accessor for PasswordSharingDoneViewController();
  *(_OWORD *)v6 = 0u;
  *((_OWORD *)v6 + 1) = 0u;
  *((_OWORD *)v6 + 2) = 0u;
  *((_OWORD *)v6 + 3) = 0u;
  *((_OWORD *)v6 + 4) = 0u;
  *((_OWORD *)v6 + 5) = 0u;
  *((_QWORD *)v6 + 12) = 0;
  v9.receiver = self;
  v9.super_class = done;
  return -[PasswordSharingDoneViewController initWithContentView:](&v9, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_duration + 1), 0);
  objc_storeStrong((id *)((char *)&self->_reportBugButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_doneButton + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  objc_super v6;

  v3 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingDoneViewController viewWillAppear:]", 30, "Done ViewWillAppear\n");
  v6.receiver = self;
  v6.super_class = (Class)PasswordSharingDoneViewController;
  -[SVSBaseViewController viewWillAppear:](&v6, "viewWillAppear:", v3);
  if (objc_msgSend(self->super._mainController, "hotspot"))
    -[PasswordSharingDoneViewController configureUIElementsForHotspot](self, "configureUIElementsForHotspot");
  else
    -[PasswordSharingDoneViewController configureUIElementsDefault](self, "configureUIElementsDefault");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v5, "setSwipeDismissible:", 1);

}

- (void)configureUIElementsDefault
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;

  if (*(_DWORD *)((char *)&self->_titleLabel + 1))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("WIFI_SHARING_FAILED_DETAIL")));
    v4 = (id)IsAppleInternalBuild(v3);
    if ((_DWORD)v4)
      v4 = objc_msgSend(v3, "appendString:", CFSTR("_FORMAT"));
    if (SFIsGreenTeaDevice(v4))
      objc_msgSend(v3, "appendString:", CFSTR("_WLAN"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("AlertCircle.png")));
    v6 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "_flatImageWithColor:", v6));
    objc_msgSend(*(id *)((char *)&self->_doneButton + 1), "setImage:", v7);

    if (IsAppleInternalBuild(v8))
    {
      v16 = sub_1001173A4(v3, v9, v10, v11, v12, v13, v14, v15, *(unsigned int *)((char *)&self->_titleLabel + 1));
      v17 = (void *)objc_claimAutoreleasedReturnValue(v16);
      objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v17);
    }
    else
    {
      v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v29 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "localizedStringForKey:value:table:", v3, &stru_10017E3D8, CFSTR("Localizable")));
      objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v29);

    }
    v30 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v31 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("WIFI_SHARING_FAILED_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v31);

    v32 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
    v28 = v32;
  }
  else
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("WIFI_SHARING_SUCCESS_DETAIL")));
    if (SFIsGreenTeaDevice(v3))
      objc_msgSend(v3, "appendString:", CFSTR("_WLAN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("DoneCheck.png")));
    v19 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "_flatImageWithColor:", v19));
    objc_msgSend(*(id *)((char *)&self->_doneButton + 1), "setImage:", v20);

    v21 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v22 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v21, "localizedStringForKey:value:table:", v3, &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v22);

    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v24 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("COMPLETE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v24);

    v25 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10017E3D8, CFSTR("Localizable")));
    v28 = v25;
  }
  objc_msgSend(v28, "setTitle:forState:", v27, 0);

  if (IsAppleInternalBuild(v33) && *(double *)((char *)&self->_status + 1) > 0.0)
  {
    v34 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(*(id *)((char *)&self->_imageView + 1), "text"));
    v35 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v34, "stringByAppendingFormat:", CFSTR(" (internal: Duration = %f)"), *(_QWORD *)((char *)&self->_status + 1)));
    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v35);

  }
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setHidden:", 1);
}

- (void)configureUIElementsForHotspot
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;

  if (*(_DWORD *)((char *)&self->_titleLabel + 1))
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableString stringWithString:](NSMutableString, "stringWithString:", CFSTR("HOTSPOT_SHARING_FAILED_DETAIL")));
    if (IsAppleInternalBuild(v3))
      objc_msgSend(v3, "appendString:", CFSTR("_FORMAT"));
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("AlertCircle.png")));
    v5 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemRedColor](UIColor, "systemRedColor"));
    v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "_flatImageWithColor:", v5));
    objc_msgSend(*(id *)((char *)&self->_doneButton + 1), "setImage:", v6);

    if (IsAppleInternalBuild(v7))
    {
      v15 = sub_1001173A4(v3, v8, v9, v10, v11, v12, v13, v14, *(unsigned int *)((char *)&self->_titleLabel + 1));
      v16 = (void *)objc_claimAutoreleasedReturnValue(v15);
      objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v16);
    }
    else
    {
      v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", v3, &stru_10017E3D8, CFSTR("Localizable")));
      objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v26);

    }
    v27 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v28 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_SHARING_FAILED_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v28);

    v29 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("OK_BUTTON_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(v29, "setTitle:forState:", v30, 0);

  }
  else
  {
    v17 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("DoneCheck.png")));
    v18 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor systemBlueColor](UIColor, "systemBlueColor"));
    v19 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v17, "_flatImageWithColor:", v18));
    objc_msgSend(*(id *)((char *)&self->_doneButton + 1), "setImage:", v19);

    v20 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_SHARING_SUCCESS_DETAIL"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setText:", v21);

    v22 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v23 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("COMPLETE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(*(id *)((char *)&self->_reportBugButton + 1), "setText:", v23);

    v24 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("DONE"), &stru_10017E3D8, CFSTR("Localizable")));
    objc_msgSend(v24, "setTitle:forState:", v25, 0);
  }

  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setHidden:", 1);
}

- (void)handleDismissButton:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingDoneViewController handleDismissButton:]", 30, "Dismiss button\n");
  objc_msgSend(self->super._mainController, "ensureStoppedWithDismiss:reason:", 1, 5);

}

- (void)handleReportBugButton:(id)a3
{
  unsigned int v4;
  const __CFString *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  uint64_t v13;
  void *i;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  _QWORD v26[7];
  _QWORD v27[7];

  v4 = objc_msgSend(self->super._mainController, "hotspot", a3);
  v5 = CFSTR("WiFi");
  if (v4)
    v5 = CFSTR("Hotspot");
  v6 = NSPrintF("%@ Sharing: Share failed: %#m", v5, *(unsigned int *)((char *)&self->_titleLabel + 1));
  v7 = (void *)objc_claimAutoreleasedReturnValue(v6);
  v26[0] = CFSTR("Classification");
  v26[1] = CFSTR("ComponentID");
  v27[0] = CFSTR("Serious Bug");
  v27[1] = CFSTR("886090");
  v26[2] = CFSTR("ComponentName");
  v26[3] = CFSTR("ComponentVersion");
  v27[2] = CFSTR("WiFi Password Sharing");
  v27[3] = CFSTR("all");
  v26[4] = CFSTR("ExtensionIdentifiers");
  v26[5] = CFSTR("Reproducibility");
  v27[4] = CFSTR("com.apple.DiagnosticExtensions.Bluetooth");
  v27[5] = CFSTR("I Didn't Try");
  v26[6] = CFSTR("Title");
  v27[6] = v7;
  v8 = (void *)objc_claimAutoreleasedReturnValue(+[NSDictionary dictionaryWithObjects:forKeys:count:](NSDictionary, "dictionaryWithObjects:forKeys:count:", v27, v26, 7));
  v9 = (void *)objc_claimAutoreleasedReturnValue(+[NSMutableArray array](NSMutableArray, "array"));
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v10 = v8;
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v12; i = (char *)i + 1)
      {
        if (*(_QWORD *)v22 != v13)
          objc_enumerationMutation(v10);
        v15 = *(_QWORD *)(*((_QWORD *)&v21 + 1) + 8 * (_QWORD)i);
        v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "objectForKeyedSubscript:", v15));
        v17 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLQueryItem queryItemWithName:value:](NSURLQueryItem, "queryItemWithName:value:", v15, v16));
        objc_msgSend(v9, "addObject:", v17);

      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v12);
  }

  v18 = (void *)objc_claimAutoreleasedReturnValue(+[NSURLComponents componentsWithString:](NSURLComponents, "componentsWithString:", CFSTR("tap-to-radar://new")));
  objc_msgSend(v18, "setQueryItems:", v9);
  v19 = (void *)UIApp;
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v18, "URL"));
  objc_msgSend(v19, "openURL:withCompletionHandler:", v20, 0);

  if (dword_1001A8538 <= 50 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 50)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingDoneViewController handleReportBugButton:]", 50, "Report Bug\n");

}

- (double)duration
{
  return *(double *)((char *)&self->_status + 1);
}

- (void)setDuration:(double)a3
{
  *(double *)((char *)&self->_status + 1) = a3;
}

- (int)status
{
  return *(_DWORD *)((char *)&self->_titleLabel + 1);
}

- (void)setStatus:(int)a3
{
  *(_DWORD *)((char *)&self->_titleLabel + 1) = a3;
}

- (NSDictionary)userInfo
{
  return *(NSDictionary **)((char *)&self->_duration + 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 89);
}

@end

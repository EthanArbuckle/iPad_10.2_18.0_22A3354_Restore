@implementation PasswordSharingStartViewController

- (void)viewDidLoad
{
  _TtC18SharingViewService34PasswordSharingStartViewController *v2;

  v2 = self;
  sub_10005FA70();

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)PasswordSharingStartViewController;
  -[SVSBaseViewController viewDidAppear:](&v4, "viewDidAppear:", a3);
  if (objc_msgSend(self->super._mainController, "autoGrant"))
  {
    if (dword_1001A8538 <= 30
      && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    {
      LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController viewDidAppear:]", 30, "Automatically granting pw from pref\n");
    }
    -[PasswordSharingStartViewController handleAllowButtonPressed:](self, "handleAllowButtonPressed:", 0);
  }
}

- (void)viewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id mainController;
  void *v6;
  objc_super v7;

  v3 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController viewDidDisappear:]", 30, "Main ViewDidDisappear\n");
  v7.receiver = self;
  v7.super_class = (Class)PasswordSharingStartViewController;
  -[PasswordSharingStartViewController viewDidDisappear:](&v7, "viewDidDisappear:", v3);
  mainController = self->super._mainController;
  self->super._mainController = 0;

  v6 = *(NSString **)((char *)&self->_peerDisplayName + 1);
  *(NSString **)((char *)&self->_peerDisplayName + 1) = 0;

}

- (_TtC18SharingViewService34PasswordSharingStartViewController)initWithContentView:(id)a3
{
  unsigned __int8 *v5;
  unsigned __int8 *v6;
  objc_super v8;

  v5 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingStartViewController_presenter];
  *((_QWORD *)v5 + 1) = 0;
  swift_unknownObjectWeakInit(v5, 0);
  self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingStartViewController_type] = 0;
  v6 = &self->PRXCardContentViewController_opaque[OBJC_IVAR____TtC18SharingViewService34PasswordSharingStartViewController_activityIndicatorTitle];
  *(_QWORD *)v6 = 0;
  *((_QWORD *)v6 + 1) = 0xE000000000000000;
  v8.receiver = self;
  v8.super_class = (Class)type metadata accessor for PasswordSharingStartViewController();
  return -[PasswordSharingStartViewController initWithContentView:](&v8, "initWithContentView:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)((char *)&self->_peerDisplayName + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dispatchQueue + 1), 0);
  objc_storeStrong((id *)(&self->_displayNameIsDevice + 1), 0);
  objc_storeStrong((id *)((char *)&self->_progressView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_imageView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_infoLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_dismissButton + 1), 0);
  objc_storeStrong((id *)((char *)&self->_detailLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityLabel + 1), 0);
  objc_storeStrong((id *)((char *)&self->_activityIndicatorView + 1), 0);
  objc_storeStrong((id *)((char *)&self->_acceptButton + 1), 0);
  objc_storeStrong((id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), 0);
}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)PasswordSharingStartViewController;
  -[SVSBaseViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(self->super._mainController, "_remoteViewControllerProxy"));
  objc_msgSend(v4, "setStatusBarHidden:withDuration:", 1, 0.0);

  if (objc_msgSend(self->super._mainController, "hotspot"))
    -[PasswordSharingStartViewController configureUIElementsForHotspot](self, "configureUIElementsForHotspot");
  else
    -[PasswordSharingStartViewController configureUIElementsDefault](self, "configureUIElementsDefault");
  v5 = objc_msgSend(objc_alloc((Class)UITapGestureRecognizer), "initWithTarget:action:", self, "handleTapOutsideView:");
  objc_msgSend(v5, "setDelegate:", self);
  objc_msgSend(v5, "setNumberOfTapsRequired:", 1);
  objc_msgSend(v5, "setCancelsTouchesInView:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[PasswordSharingStartViewController view](self, "view"));
  objc_msgSend(v6, "addGestureRecognizer:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v7, "setSwipeDismissible:", 1);

}

- (void)configureUIElementsDefault
{
  uint64_t v3;
  CFTypeID TypeID;
  uint64_t TypedValue;
  uint64_t v6;
  void *v7;
  int v8;
  __CFString *v9;
  __CFString *v10;
  id v11;
  int v12;
  __CFString *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  __CFString *v21;
  uint64_t v22;
  id v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id v31;
  uint64_t v32;
  int v33;
  BOOL v34;
  __CFString *v35;
  __CFString *v36;
  __CFString *v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t v42;
  uint64_t v43;
  uint64_t v44;
  uint64_t v45;
  id v46;

  v3 = *(uint64_t *)((char *)&self->_peerDisplayName + 1);
  TypeID = CFStringGetTypeID();
  TypedValue = CFDictionaryGetTypedValue(v3, CFSTR("nw"), TypeID, 0);
  v6 = objc_claimAutoreleasedReturnValue(TypedValue);
  v7 = (void *)v6;
  if (!v6 && dword_1001A8538 <= 50)
  {
    if (dword_1001A8538 != -1 || (v6 = _LogCategory_Initialize(&dword_1001A8538, 50), (_DWORD)v6))
      v6 = LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController configureUIElementsDefault]", 50, "### No network name?");
  }
  v8 = SFIsGreenTeaDevice(v6);
  v9 = CFSTR("WIFI_SHARING_TITLE");
  if (v8)
    v9 = CFSTR("WIFI_SHARING_TITLE_WLAN");
  v10 = v9;
  v11 = objc_msgSend(self->super._mainController, "testMode");
  if ((_DWORD)v11 == 2 || (v11 = objc_msgSend(self->super._mainController, "testMode"), (_DWORD)v11 == 6))
  {
    v12 = SFIsGreenTeaDevice(v11);
    v13 = CFSTR("WIFI_SHARING_DETAIL_FORMAT");
    if (v12)
      v13 = CFSTR("WIFI_SHARING_DETAIL_FORMAT_WLAN");
    v21 = v13;
    if (BYTE1(self->_titleLabel))
    {
      v22 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_DEVICE"), v21));

      v21 = (__CFString *)v22;
    }
    v23 = sub_1001173A4(v21, v14, v15, v16, v17, v18, v19, v20, (uint64_t)CFSTR("WiFiNetwork"));
LABEL_15:
    v46 = (id)objc_claimAutoreleasedReturnValue(v23);
    goto LABEL_16;
  }
  v31 = objc_msgSend(self->super._mainController, "testMode");
  if ((_DWORD)v31 == 7)
  {

    v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v46 = (id)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", CFSTR("WIFI_SHARING_DETAIL_LONG"), &stru_10017E3D8, CFSTR("Localizable")));
    v10 = CFSTR("WIFI_SHARING_TITLE_LONG");
    goto LABEL_16;
  }
  v32 = *(uint64_t *)((char *)&self->_dispatchQueue + 1);
  v33 = SFIsGreenTeaDevice(v31);
  if (v7)
    v34 = v32 == 0;
  else
    v34 = 1;
  if (!v34)
  {
    v37 = CFSTR("WIFI_SHARING_DETAIL_FORMAT");
    if (v33)
      v37 = CFSTR("WIFI_SHARING_DETAIL_FORMAT_WLAN");
    v21 = v37;
    if (BYTE1(self->_titleLabel))
    {
      v45 = objc_claimAutoreleasedReturnValue(+[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@_DEVICE"), v21));

      v21 = (__CFString *)v45;
    }
    v23 = sub_1001173A4(v21, v38, v39, v40, v41, v42, v43, v44, (uint64_t)v7);
    goto LABEL_15;
  }
  v35 = CFSTR("WIFI_SHARING_DETAIL_GENERIC");
  if (v33)
    v35 = CFSTR("WIFI_SHARING_DETAIL_GENERIC_WLAN");
  v36 = v35;
  v21 = (__CFString *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v46 = (id)objc_claimAutoreleasedReturnValue(-[__CFString localizedStringForKey:value:table:](v21, "localizedStringForKey:value:table:", v36, &stru_10017E3D8, CFSTR("Localizable")));

LABEL_16:
  v24 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v25 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("WIFI_SHARING_ACTIVITY"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_activityIndicatorView + 1), "setText:", v25);

  objc_msgSend(*(id *)((char *)&self->_activityLabel + 1), "setText:", v46);
  v26 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v27 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v26, "localizedStringForKey:value:table:", v10, &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setText:", v27);

  v28 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
  v29 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v30 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v29, "localizedStringForKey:value:table:", CFSTR("WIFI_SHARING_BUTTON"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(v28, "setTitle:forState:", v30, 0);

}

- (void)configureUIElementsForHotspot
{
  const __CFString *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  __CFString *v21;

  if (!*(OS_dispatch_queue **)((char *)&self->_dispatchQueue + 1)
    || objc_msgSend(self->super._mainController, "testMode") == 4
    || objc_msgSend(self->super._mainController, "testMode") == 5)
  {
    v3 = CFSTR("John Appleseed");
  }
  else
  {
    v3 = (const __CFString *)*(id *)((char *)&self->_dispatchQueue + 1);
  }
  v21 = (__CFString *)v3;
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_SHARING_ACTIVITY"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_activityIndicatorView + 1), "setText:", v5);

  v13 = sub_1001173A4(CFSTR("HOTSPOT_SHARING_DETAIL_FORMAT"), v6, v7, v8, v9, v10, v11, v12, (uint64_t)v21);
  v14 = (void *)objc_claimAutoreleasedReturnValue(v13);
  objc_msgSend(*(id *)((char *)&self->_activityLabel + 1), "setText:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIImage imageNamed:](UIImage, "imageNamed:", CFSTR("Hotspot.png")));
  objc_msgSend(*(id *)((char *)&self->_infoLabel + 1), "setImage:", v15);

  v16 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v17 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v16, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_SHARING_TITLE"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(*(id *)((char *)&self->_progressView + 1), "setText:", v17);

  v18 = *(void **)(&self->super._didReactivateContainerViewAfterLayingOut + 1);
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("HOTSPOT_SHARING_BUTTON"), &stru_10017E3D8, CFSTR("Localizable")));
  objc_msgSend(v18, "setTitle:forState:", v20, 0);

}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;

  v5 = a3;
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(a4, "view"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "view"));

  return v6 == v7;
}

- (void)handleAllowButtonPressed:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  NSObject *v7;
  _QWORD v8[4];
  dispatch_source_t v9;
  PasswordSharingStartViewController *v10;

  v4 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController handleAllowButtonPressed:]", 30, "Allow button pressed\n");
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[SVSBaseViewController containerView](self, "containerView"));
  objc_msgSend(v5, "setSwipeDismissible:", 0);

  if (!objc_msgSend(self->super._mainController, "touchDelayActive")
    || (objc_msgSend(self->super._mainController, "autoGrant") & 1) != 0)
  {
    objc_msgSend(*(id *)((char *)&self->_acceptButton + 1), "setHidden:", 0);
    objc_msgSend(*(id *)((char *)&self->_acceptButton + 1), "startAnimating");
    objc_msgSend(*(id *)((char *)&self->_imageView + 1), "setHidden:", 0);
    objc_msgSend(*(id *)(&self->super._didReactivateContainerViewAfterLayingOut + 1), "setHidden:", 1);
    v6 = objc_msgSend(self->super._mainController, "testMode");
    if (v6 <= 5)
    {
      if (((1 << v6) & 0x16) != 0)
      {
        v8[0] = _NSConcreteStackBlock;
        v8[1] = 3221225472;
        v8[2] = sub_1000F1D30;
        v8[3] = &unk_10017E1A0;
        v9 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, (dispatch_queue_t)&_dispatch_main_q);
        v10 = self;
        v7 = v9;
        dispatch_source_set_event_handler(v7, v8);
        SFDispatchTimerSet(v7, 1.0, -1.0, -4.0);
        dispatch_resume(v7);

        goto LABEL_17;
      }
      if (((1 << v6) & 0x28) != 0)
      {
        objc_msgSend(self->super._mainController, "showDoneUI:", 4294960596);
        goto LABEL_17;
      }
    }
    objc_msgSend(self->super._mainController, "_sessionStart");
    goto LABEL_17;
  }
  if (dword_1001A8538 <= 50 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 50)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController handleAllowButtonPressed:]", 50, "Touch delay is active, ignoring allow button press\n");
LABEL_17:

}

- (void)handleDismissButtonPressed:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController handleDismissButtonPressed:]", 30, "Dismiss button pressed\n");
  objc_msgSend(self->super._mainController, "dismiss:", 5);

}

- (void)handleTapOutsideView:(id)a3
{
  id v4;

  v4 = a3;
  if (dword_1001A8538 <= 30 && (dword_1001A8538 != -1 || _LogCategory_Initialize(&dword_1001A8538, 30)))
    LogPrintF(&dword_1001A8538, "-[PasswordSharingStartViewController handleTapOutsideView:]", 30, "Dismissing on tap outside view\n");
  objc_msgSend(self->super._mainController, "dismiss:", 1);

}

- (OS_dispatch_queue)dispatchQueue
{
  return *(OS_dispatch_queue **)(&self->_displayNameIsDevice + 1);
}

- (void)setDispatchQueue:(id)a3
{
  objc_storeStrong((id *)(&self->_displayNameIsDevice + 1), a3);
}

- (BOOL)displayNameIsDevice
{
  return BYTE1(self->_titleLabel);
}

- (void)setDisplayNameIsDevice:(BOOL)a3
{
  BYTE1(self->_titleLabel) = a3;
}

- (NSString)peerDisplayName
{
  return *(NSString **)((char *)&self->_dispatchQueue + 1);
}

- (void)setPeerDisplayName:(id)a3
{
  objc_storeStrong((id *)((char *)&self->_dispatchQueue + 1), a3);
}

- (NSDictionary)userInfo
{
  return *(NSDictionary **)((char *)&self->_peerDisplayName + 1);
}

- (void)setUserInfo:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 129);
}

@end

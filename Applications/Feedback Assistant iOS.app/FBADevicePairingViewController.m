@implementation FBADevicePairingViewController

- (void)awakeFromNib
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController awakeFromNib](&v3, "awakeFromNib");
  -[FBADevicePairingViewController setContext:](self, "setContext:", 2);
  -[FBADevicePairingViewController setPinPairingInProgress:](self, "setPinPairingInProgress:", 0);
  -[FBADevicePairingViewController setFilterPlatform:](self, "setFilterPlatform:", 0);
}

- (void)viewDidLoad
{
  double v3;
  double v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController viewDidLoad](&v9, "viewDidLoad");
  +[FBADevicePairingCell estimatedRowHeight](FBADevicePairingCell, "estimatedRowHeight");
  v4 = v3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView](self, "tableView"));
  objc_msgSend(v5, "setEstimatedRowHeight:", v4);

  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView](self, "tableView"));
  objc_msgSend(v6, "setRowHeight:", UITableViewAutomaticDimension);

  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView](self, "tableView"));
  objc_msgSend(v7, "setEstimatedSectionHeaderHeight:", 40.0);

  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView](self, "tableView"));
  objc_msgSend(v8, "setSectionHeaderHeight:", UITableViewAutomaticDimension);

}

- (void)viewWillAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController viewWillAppear:](&v8, "viewWillAppear:", a3);
  -[FBADevicePairingViewController setupBarButtonItems](self, "setupBarButtonItems");
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PAIRING_VIEW_TITLE"), &stru_1000EA660, 0));
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationItem](self, "navigationItem"));
  objc_msgSend(v6, "setTitle:", v5);

  v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v7, "addObserver:selector:name:object:", self, "reload", FBKDeviceListDidChangeNotification, 0);

  -[FBADevicePairingViewController _showInternalUIIfNeeded](self, "_showInternalUIIfNeeded");
  -[FBADevicePairingViewController reload](self, "reload");
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController viewDidAppear:](&v5, "viewDidAppear:", a3);
  if (-[FBADevicePairingViewController pinPairingInProgress](self, "pinPairingInProgress"))
  {
    -[FBADevicePairingViewController setPinPairingInProgress:](self, "setPinPairingInProgress:", 0);
    -[FBADevicePairingViewController reload](self, "reload");
  }
  else
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
    objc_msgSend(v4, "beginScanning");

  }
}

- (void)viewWillDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController viewWillDisappear:](&v5, "viewWillDisappear:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSNotificationCenter defaultCenter](NSNotificationCenter, "defaultCenter"));
  objc_msgSend(v4, "removeObserver:", self);

}

- (void)viewDidDisappear:(BOOL)a3
{
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController viewDidDisappear:](&v5, "viewDidDisappear:", a3);
  if (!-[FBADevicePairingViewController pinPairingInProgress](self, "pinPairingInProgress"))
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
    objc_msgSend(v4, "stopScanning");

  }
}

- (void)didReceiveMemoryWarning
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)FBADevicePairingViewController;
  -[FBADevicePairingViewController didReceiveMemoryWarning](&v2, "didReceiveMemoryWarning");
}

- (int64_t)numberOfSectionsInTableView:(id)a3
{
  if (self->__internalMode)
    return 3;
  else
    return 2;
}

- (int64_t)tableView:(id)a3 numberOfRowsInSection:(int64_t)a4
{
  void *v5;
  void *v6;
  id v7;

  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController deviceGroups](self, "deviceGroups", a3));
  v6 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v5, "objectAtIndex:", a4));
  v7 = objc_msgSend(v6, "count");

  return (int64_t)v7;
}

- (id)tableView:(id)a3 viewForHeaderInSection:(int64_t)a4
{
  uint64_t v4;
  uint64_t v5;

  if (a4 == 1)
    return (id)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView:loadingSpinnerViewForSection:](self, "tableView:loadingSpinnerViewForSection:", a3, v4, v5));
  else
    return 0;
}

- (id)tableView:(id)a3 loadingSpinnerViewForSection:(int64_t)a4
{
  id v6;
  id v7;
  double y;
  double width;
  double height;
  id v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  double v16;
  id v17;

  v6 = a3;
  v7 = objc_alloc((Class)UIStackView);
  y = CGRectZero.origin.y;
  width = CGRectZero.size.width;
  height = CGRectZero.size.height;
  v11 = objc_msgSend(v7, "initWithFrame:", CGRectZero.origin.x, y, width, height);
  objc_msgSend(v11, "setAxis:", 0);
  objc_msgSend(v11, "setAlignment:", 3);
  objc_msgSend(v11, "setSpacing:", 1.17549435e-38);
  v12 = objc_msgSend(objc_alloc((Class)UILabel), "initWithFrame:", CGRectZero.origin.x, y, width, height);
  v13 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView:titleForHeaderInSection:](self, "tableView:titleForHeaderInSection:", v6, a4));

  objc_msgSend(v12, "setText:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue(+[UIFont preferredFontForTextStyle:](UIFont, "preferredFontForTextStyle:", UIFontTextStyleFootnote));
  objc_msgSend(v12, "setFont:", v14);

  v15 = (void *)objc_claimAutoreleasedReturnValue(+[UIColor secondaryLabelColor](UIColor, "secondaryLabelColor"));
  objc_msgSend(v12, "setTextColor:", v15);

  objc_msgSend(v12, "setAdjustsFontForContentSizeCategory:", 1);
  LODWORD(v16) = 1144750080;
  objc_msgSend(v12, "setContentHuggingPriority:forAxis:", 0, v16);
  objc_msgSend(v12, "sizeToFit");
  objc_msgSend(v11, "addArrangedSubview:", v12);
  v17 = objc_msgSend(objc_alloc((Class)UIActivityIndicatorView), "initWithActivityIndicatorStyle:", 100);
  objc_msgSend(v17, "startAnimating");
  objc_msgSend(v11, "addArrangedSubview:", v17);
  objc_msgSend(v11, "setLayoutMarginsRelativeArrangement:", 1);
  objc_msgSend(v11, "setDirectionalLayoutMargins:", 10.0, 16.0, 10.0, 16.0);

  return v11;
}

- (id)tableView:(id)a3 titleForHeaderInSection:(int64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  __CFString *v10;

  v6 = a3;
  if (a4 == 2)
  {
    if (self->__internalMode)
      v10 = CFSTR("All Devices Visible to DED");
    else
      v10 = 0;
  }
  else
  {
    if (a4 == 1)
    {
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("OTHER_DEVICES");
    }
    else
    {
      if (a4)
      {
        v10 = 0;
        goto LABEL_11;
      }
      v7 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
      v8 = v7;
      v9 = CFSTR("MY_DEVICES");
    }
    v10 = (__CFString *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_1000EA660, 0));

  }
LABEL_11:

  return v10;
}

- (id)tableView:(id)a3 titleForFooterInSection:(int64_t)a4
{
  void *v4;
  void *v5;

  if ((char *)objc_msgSend(a3, "numberOfSections") - 1 == (_BYTE *)a4)
  {
    v4 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("DEVICE_PAIRING_FOOTER_TEXT"), &stru_1000EA660, 0));

  }
  else
  {
    v5 = 0;
  }
  return v5;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  const __CFString *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v6 = a3;
  v7 = a4;
  if (qword_100118050 != -1)
    dispatch_once(&qword_100118050, &stru_1000E6E30);
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "dequeueReusableCellWithIdentifier:forIndexPath:", qword_100118058, v7));
  if (objc_msgSend(v7, "section") == (id)1)
  {
    v9 = (unint64_t)objc_msgSend(v8, "accessibilityTraits");
    objc_msgSend(v8, "setAccessibilityTraits:", UIAccessibilityTraitButton | v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("DEVICE_CELL_HINT_TAP_TO_PAIR");
  }
  else
  {
    objc_msgSend(v8, "setAccessibilityTraits:", (unint64_t)objc_msgSend(v8, "accessibilityTraits") & ~UIAccessibilityTraitButton);
    v10 = (void *)objc_claimAutoreleasedReturnValue(+[NSBundle mainBundle](NSBundle, "mainBundle"));
    v11 = v10;
    v12 = CFSTR("DEVICE_CELL_HINT_PAIRED");
  }
  v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v10, "localizedStringForKey:value:table:", v12, &stru_1000EA660, 0));
  objc_msgSend(v8, "setAccessibilityHint:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController deviceGroups](self, "deviceGroups"));
  v15 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v14, "objectAtIndexedSubscript:", objc_msgSend(v7, "section")));
  v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "objectAtIndexedSubscript:", objc_msgSend(v7, "row")));
  objc_msgSend(v8, "updateWithDevice:showsDetail:showsTransport:", v16, objc_msgSend(v7, "section") == 0, self->__internalMode);

  return v8;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  void *v12;
  int v13;
  void *v14;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController deviceGroups](self, "deviceGroups"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  v9 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicLogDescription"));
    v13 = 138543362;
    v14 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "selected [%{public}@] on pairing view", (uint8_t *)&v13, 0xCu);

  }
  v11 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    sub_10009A1A8();

  -[FBADevicePairingViewController handleDeviceTapWithDevice:inSection:](self, "handleDeviceTapWithDevice:inSection:", v8, objc_msgSend(v5, "section"));
  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView](self, "tableView"));
  objc_msgSend(v12, "deselectRowAtIndexPath:animated:", v5, 1);

}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  NSObject *v10;
  unsigned int v11;
  NSObject *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  objc_class *v23;
  NSString *v24;
  void *v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;

  v5 = a4;
  v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController deviceGroups](self, "deviceGroups"));
  v7 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v6, "objectAtIndexedSubscript:", objc_msgSend(v5, "section")));
  v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "objectAtIndexedSubscript:", objc_msgSend(v5, "row")));

  if (self->__internalMode)
  {
    v9 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));
    if ((objc_msgSend(v9, "isEqualToString:", &stru_1000EA660) & 1) != 0)
      v10 = CFSTR("Device Data");
    else
      v10 = objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "name"));

    v20 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "debugDetails"));
    -[FBADevicePairingViewController showTextViewWithText:title:](self, "showTextViewWithText:title:", v20, v10);

LABEL_10:
    goto LABEL_11;
  }
  if (!objc_msgSend(v5, "section"))
  {
    v11 = objc_msgSend(v8, "isCurrentDevice");
    v12 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
    v10 = v12;
    if (v11)
    {
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        sub_10009A208(v10, v13, v14, v15, v16, v17, v18, v19);
      goto LABEL_10;
    }
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      v21 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "publicLogDescription"));
      v28 = 138543362;
      v29 = v21;
      _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "showing device detail on device [%{public}@]", (uint8_t *)&v28, 0xCu);

    }
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController storyboard](self, "storyboard"));
    v23 = (objc_class *)objc_opt_class(FBAForgetDeviceViewController);
    v24 = NSStringFromClass(v23);
    v25 = (void *)objc_claimAutoreleasedReturnValue(v24);
    v26 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v22, "instantiateViewControllerWithIdentifier:", v25));

    objc_msgSend(v26, "setDevice:", v8);
    objc_msgSend(v26, "setDelegate:", self);
    v27 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationController](self, "navigationController"));
    objc_msgSend(v27, "pushViewController:animated:", v26, 1);

  }
LABEL_11:

}

- (void)didTapForgetDevice:(id)a3
{
  id v4;
  void *v5;
  unsigned int v6;
  unsigned int v7;
  NSObject *v8;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController pairedDevices](self, "pairedDevices"));
  if (objc_msgSend(v5, "containsObject:", v4))
  {
    v6 = objc_msgSend(v4, "isCurrentDevice");
    v7 = objc_msgSend(v4, "isFBKPaired");

    if (v7 && !v6)
    {
      objc_msgSend(v4, "removeFBKPairing");
      -[FBADevicePairingViewController didChangeDeviceParingWithDeviceAdded:removed:](self, "didChangeDeviceParingWithDeviceAdded:removed:", 0, v4);
      goto LABEL_9;
    }
  }
  else
  {

  }
  v8 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    sub_10009A23C(v4, v8);

LABEL_9:
}

- (void)handleDeviceTapWithDevice:(id)a3 inSection:(unint64_t)a4
{
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  NSObject *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  NSObject *v18;

  v6 = a3;
  v7 = v6;
  if (a4 == 2)
  {
    if (self->__internalMode)
    {
      v9 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        sub_10009A2F8();

      if ((objc_msgSend(v7, "isFBKPaired") & 1) == 0
        && (objc_msgSend(v7, "isCurrentDevice") & 1) == 0)
      {
        v10 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          sub_10009A2C4(v10, v11, v12, v13, v14, v15, v16, v17);

        -[FBADevicePairingViewController handleDeviceTapWithDevice:inSection:](self, "handleDeviceTapWithDevice:inSection:", v7, 1);
      }
    }
  }
  else if (a4 == 1)
  {
    if (objc_msgSend(v6, "needsPairing")
      && (v8 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "dedSharingDevice")), v8, v8))
    {
      -[FBADevicePairingViewController showPinPairingViewForDevice:](self, "showPinPairingViewForDevice:", v7);
    }
    else if (objc_msgSend(v7, "isReady"))
    {
      objc_msgSend(v7, "pairToFBK");
      -[FBADevicePairingViewController didChangeDeviceParingWithDeviceAdded:removed:](self, "didChangeDeviceParingWithDeviceAdded:removed:", v7, 0);
    }
    else
    {
      v18 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
        sub_10009A358();

    }
  }

}

- (void)reload
{
  NSObject *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  _QWORD v25[4];
  id v26;
  uint8_t buf[16];
  _QWORD v28[3];
  _QWORD v29[2];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_INFO, "reload devices view", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v4, "configuredDevices"));
  -[FBADevicePairingViewController setPairedDevices:](self, "setPairedDevices:", v5);

  if ((id)-[FBADevicePairingViewController context](self, "context") == (id)4
    && (v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController filterPlatform](self, "filterPlatform")),
        v6,
        v6))
  {
    v7 = DEDDevicePlatformiOS;
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController filterPlatform](self, "filterPlatform"));
    if (objc_msgSend(v8, "isEqualToString:", DEDDevicePlatformUnspecified))
      v9 = v7;
    else
      v9 = (id)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController filterPlatform](self, "filterPlatform"));
    v11 = v9;

    v12 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
    v13 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v12, "notConfiguredDevices"));
    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_100026D08;
    v25[3] = &unk_1000E6E58;
    v26 = v11;
    v10 = v11;
    v14 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v13, "ded_selectItemsPassingTest:", v25));
    -[FBADevicePairingViewController setNotConfiguredDevice:](self, "setNotConfiguredDevice:", v14);

  }
  else
  {
    v7 = (id)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
    v10 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v7, "notConfiguredDevices"));
    -[FBADevicePairingViewController setNotConfiguredDevice:](self, "setNotConfiguredDevice:", v10);
  }

  if (self->__internalMode)
  {
    v15 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
    v16 = (void *)objc_claimAutoreleasedReturnValue(objc_msgSend(v15, "allDevices"));
    -[FBADevicePairingViewController set_allDevices:](self, "set_allDevices:", v16);

  }
  v17 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController pairedDevices](self, "pairedDevices"));
  v29[0] = v17;
  v18 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController notConfiguredDevice](self, "notConfiguredDevice"));
  v29[1] = v18;
  v19 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v29, 2));
  -[FBADevicePairingViewController setDeviceGroups:](self, "setDeviceGroups:", v19);

  if (self->__internalMode)
  {
    v20 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController pairedDevices](self, "pairedDevices"));
    v28[0] = v20;
    v21 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController notConfiguredDevice](self, "notConfiguredDevice"));
    v28[1] = v21;
    v22 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController _allDevices](self, "_allDevices"));
    v28[2] = v22;
    v23 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v28, 3));
    -[FBADevicePairingViewController setDeviceGroups:](self, "setDeviceGroups:", v23);

  }
  v24 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController tableView](self, "tableView"));
  objc_msgSend(v24, "reloadData");

}

- (void)showPinPairingViewForDevice:(id)a3
{
  id v4;
  void *v5;
  FBADevicePairingViewController *v6;
  void *v7;
  id v8;
  id v9;
  FBADevicePairingViewController *v10;
  _QWORD v11[5];
  FBADevicePairingViewController *v12;
  id v13;
  id v14;

  v4 = a3;
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController storyboard](self, "storyboard"));
  v6 = self;
  v7 = (void *)objc_claimAutoreleasedReturnValue(+[FBKDeviceManager sharedInstance](FBKDeviceManager, "sharedInstance"));
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100026EB0;
  v11[3] = &unk_1000E6468;
  v11[4] = v6;
  v12 = v6;
  v13 = v5;
  v14 = v4;
  v8 = v4;
  v9 = v5;
  v10 = v6;
  objc_msgSend(v7, "beginPairingDevice:showUIBlock:", v8, v11);

}

- (void)setupBarButtonItems
{
  int64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  id v8;

  v3 = -[FBADevicePairingViewController context](self, "context");
  if ((unint64_t)(v3 - 2) < 2)
  {
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 0, self, "dismissSelf");
    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationItem](self, "navigationItem"));
    v6 = v5;
    v7 = v8;
  }
  else
  {
    if (v3 == 1)
    {
      v8 = (id)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationItem](self, "navigationItem"));
      objc_msgSend(v8, "setRightBarButtonItem:", 0);
      goto LABEL_8;
    }
    if (v3 != 4)
      return;
    v8 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 1, self, "didCancel");
    v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationItem](self, "navigationItem"));
    objc_msgSend(v4, "setLeftBarButtonItem:", v8);

    v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationItem](self, "navigationItem"));
    v6 = v5;
    v7 = 0;
  }
  objc_msgSend(v5, "setRightBarButtonItem:", v7);

LABEL_8:
}

- (void)didCancel
{
  NSObject *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  uint8_t v9[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v9 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device pairing view did cancel", v9, 2u);
  }

  v4 = objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController delegate](self, "delegate"));
  if (v4)
  {
    v5 = (void *)v4;
    v6 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController delegate](self, "delegate"));
    v7 = objc_opt_respondsToSelector(v6, "pairingViewDidCancel");

    if ((v7 & 1) != 0)
    {
      v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController delegate](self, "delegate"));
      objc_msgSend(v8, "pairingViewDidCancel");

    }
  }
}

- (void)dismissSelf
{
  NSObject *v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v7[4];
  id v8;
  uint8_t buf[16];

  v3 = objc_claimAutoreleasedReturnValue(+[FBALog ded](FBALog, "ded"));
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "device pairing view did hit done", buf, 2u);
  }

  v4 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController delegate](self, "delegate"));
  v5 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController presentingViewController](self, "presentingViewController"));
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_100027290;
  v7[3] = &unk_1000E61B8;
  v8 = v4;
  v6 = v4;
  objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v7);

}

- (void)didChangeDeviceParingWithDeviceAdded:(id)a3 removed:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  v7 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController delegate](self, "delegate"));

  if (v7)
  {
    v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController delegate](self, "delegate"));
    objc_msgSend(v8, "pairedDevicesDidChangeWithAddedDevice:removed:", v9, v6);

  }
  -[FBADevicePairingViewController reload](self, "reload");

}

- (void)showTextViewWithText:(id)a3 title:(id)a4
{
  id v6;
  id v7;
  void *v8;
  objc_class *v9;
  NSString *v10;
  void *v11;
  void *v12;
  id v13;

  v6 = a4;
  v7 = a3;
  v8 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController storyboard](self, "storyboard"));
  v9 = (objc_class *)objc_opt_class(FBATextViewController);
  v10 = NSStringFromClass(v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue(v10);
  v13 = (id)objc_claimAutoreleasedReturnValue(objc_msgSend(v8, "instantiateViewControllerWithIdentifier:", v11));

  objc_msgSend(v13, "setTitle:", v6);
  objc_msgSend(v13, "setText:", v7);

  v12 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationController](self, "navigationController"));
  objc_msgSend(v12, "pushViewController:animated:", v13, 1);

}

- (void)toggleDev
{
  -[FBADevicePairingViewController set_internalMode:](self, "set_internalMode:", -[FBADevicePairingViewController _internalMode](self, "_internalMode") ^ 1);
  -[FBADevicePairingViewController reload](self, "reload");
}

- (void)showFBAPairing
{
  id v3;

  v3 = (id)objc_claimAutoreleasedReturnValue(+[FBKGroupedDevice inspectFBKPairing](FBKGroupedDevice, "inspectFBKPairing"));
  -[FBADevicePairingViewController showTextViewWithText:title:](self, "showTextViewWithText:title:", v3, CFSTR("FBA Paired Devices"));

}

- (void)showDevUI
{
  void *v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  id v12;
  void *v13;
  void *v14;
  _QWORD v15[3];

  v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationController](self, "navigationController"));
  objc_msgSend(v3, "setToolbarHidden:animated:", 0, 1);

  v4 = objc_alloc((Class)UIBarButtonItem);
  v5 = sub_10002575C(CFSTR("Show FBA Pairing"));
  v6 = (void *)objc_claimAutoreleasedReturnValue(v5);
  v7 = objc_msgSend(v4, "initWithTitle:style:target:action:", v6, 0, self, "showFBAPairing");

  v8 = objc_alloc((Class)UIBarButtonItem);
  v9 = sub_10002575C(CFSTR("Toggle Internal Details"));
  v10 = (void *)objc_claimAutoreleasedReturnValue(v9);
  v11 = objc_msgSend(v8, "initWithTitle:style:target:action:", v10, 0, self, "toggleDev");

  v12 = objc_msgSend(objc_alloc((Class)UIBarButtonItem), "initWithBarButtonSystemItem:target:action:", 5, 0, 0, v7);
  v15[1] = v12;
  v15[2] = v11;
  v13 = (void *)objc_claimAutoreleasedReturnValue(+[NSArray arrayWithObjects:count:](NSArray, "arrayWithObjects:count:", v15, 3));
  -[FBADevicePairingViewController setToolbarItems:](self, "setToolbarItems:", v13);

  v14 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationController](self, "navigationController"));
  objc_msgSend(v14, "setToolbarHidden:", 0);

  -[FBADevicePairingViewController reload](self, "reload");
}

- (void)_showInternalUIIfNeeded
{
  void *v3;

  if (-[FBADevicePairingViewController shouldShowDevUI](self, "shouldShowDevUI"))
  {
    -[FBADevicePairingViewController showDevUI](self, "showDevUI");
  }
  else
  {
    -[FBADevicePairingViewController set_internalMode:](self, "set_internalMode:", 0);
    v3 = (void *)objc_claimAutoreleasedReturnValue(-[FBADevicePairingViewController navigationController](self, "navigationController"));
    objc_msgSend(v3, "setToolbarHidden:", 1);

    -[FBADevicePairingViewController setToolbarItems:](self, "setToolbarItems:", &__NSArray0__struct);
  }
}

- (BOOL)shouldShowDevUI
{
  int v2;
  void *v3;
  unsigned __int8 v4;

  v2 = FBKIsInternalInstall(self, a2);
  if (v2)
  {
    v3 = (void *)objc_claimAutoreleasedReturnValue(+[NSUserDefaults standardUserDefaults](NSUserDefaults, "standardUserDefaults"));
    v4 = objc_msgSend(v3, "BOOLForKey:", FBKShowDevicePairingInternal);

    LOBYTE(v2) = v4;
  }
  return v2;
}

- (int64_t)context
{
  return self->_context;
}

- (void)setContext:(int64_t)a3
{
  self->_context = a3;
}

- (FBAPairingPresentationDelegate)delegate
{
  return (FBAPairingPresentationDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (NSString)filterPlatform
{
  return self->_filterPlatform;
}

- (void)setFilterPlatform:(id)a3
{
  objc_storeStrong((id *)&self->_filterPlatform, a3);
}

- (NSArray)pairedDevices
{
  return self->_pairedDevices;
}

- (void)setPairedDevices:(id)a3
{
  objc_storeStrong((id *)&self->_pairedDevices, a3);
}

- (NSArray)notConfiguredDevice
{
  return self->_notConfiguredDevice;
}

- (void)setNotConfiguredDevice:(id)a3
{
  objc_storeStrong((id *)&self->_notConfiguredDevice, a3);
}

- (NSArray)_allDevices
{
  return self->__allDevices;
}

- (void)set_allDevices:(id)a3
{
  objc_storeStrong((id *)&self->__allDevices, a3);
}

- (NSArray)deviceGroups
{
  return self->_deviceGroups;
}

- (void)setDeviceGroups:(id)a3
{
  objc_storeStrong((id *)&self->_deviceGroups, a3);
}

- (BOOL)pinPairingInProgress
{
  return self->_pinPairingInProgress;
}

- (void)setPinPairingInProgress:(BOOL)a3
{
  self->_pinPairingInProgress = a3;
}

- (BOOL)_internalMode
{
  return self->__internalMode;
}

- (void)set_internalMode:(BOOL)a3
{
  self->__internalMode = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceGroups, 0);
  objc_storeStrong((id *)&self->__allDevices, 0);
  objc_storeStrong((id *)&self->_notConfiguredDevice, 0);
  objc_storeStrong((id *)&self->_pairedDevices, 0);
  objc_storeStrong((id *)&self->_filterPlatform, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

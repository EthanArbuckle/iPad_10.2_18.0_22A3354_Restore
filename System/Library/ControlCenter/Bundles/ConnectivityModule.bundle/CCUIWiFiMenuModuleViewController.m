@implementation CCUIWiFiMenuModuleViewController

- (CCUIWiFiMenuModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIWiFiMenuModuleViewController *v4;
  const char *v5;
  CCUIWiFiMenuModuleViewController *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  uint64_t v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)CCUIWiFiMenuModuleViewController;
  v4 = -[CCUIAlwaysExpandedMenuModuleViewController initWithNibName:bundle:](&v13, sel_initWithNibName_bundle_, a3, a4);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setExpanded_(v4, v5, 1);
    objc_msgSend_setMinimumMenuItems_(v6, v7, 6);
    objc_msgSend_setShouldProvideOwnPlatter_(v6, v8, 1);
    objc_msgSend_setIndentation_(v6, v9, 2);
    objc_msgSend_setVisibleMenuItems_(v6, v10, v11, 5.5);
  }
  return v6;
}

- (void)viewDidLoad
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  const char *v11;
  const char *v12;
  uint64_t v13;
  _QWORD v14[5];
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)CCUIWiFiMenuModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v15, sel_viewDidLoad);
  v3 = (void *)MEMORY[0x24BE19B00];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("WiFi"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_setGlyphPackageDescription_(self, v10, (uint64_t)v9);
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = sub_230FA5094;
  v14[3] = &unk_24FFCA830;
  v14[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], v11, (uint64_t)v14);
  objc_msgSend__updateWiFiMenuItems(self, v12, v13);

}

- (void)viewDidAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIWiFiMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  objc_msgSend__startScanning(self, v4, v5);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  id WeakRetained;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIWiFiMenuModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillDisappear:](&v8, sel_viewWillDisappear_, a3);
  objc_msgSend__stopScanning(self, v4, v5);
  WeakRetained = objc_loadWeakRetained((id *)&self->_listDelegate);
  objc_msgSend_networkListViewControllerDidFinish_(WeakRetained, v7, (uint64_t)self);

}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)_startScanning
{
  id v3;
  const char *v4;
  WFNetworkListController *v5;
  WFNetworkListController *wifiManager;
  uint64_t v7;

  v3 = objc_alloc(MEMORY[0x24BEC28E8]);
  v5 = (WFNetworkListController *)objc_msgSend_initWithViewController_viewProvider_(v3, v4, (uint64_t)self, self);
  wifiManager = self->_wifiManager;
  self->_wifiManager = v5;

  MEMORY[0x24BEDD108](self->_wifiManager, sel_startScanning, v7);
}

- (void)_stopScanning
{
  uint64_t v2;
  WFNetworkListController *wifiManager;

  objc_msgSend_stopScanning(self->_wifiManager, a2, v2);
  wifiManager = self->_wifiManager;
  self->_wifiManager = 0;

}

- (id)trailingViewForMenuItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  CCUIWifiMenuModuleItemTrailingView *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  id v15;
  const char *v16;
  void *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  void *v24;
  id v25;
  const char *v26;
  void *v27;
  const char *v28;
  const char *v29;

  v4 = a3;
  v5 = objc_opt_class();
  v6 = v4;
  if (v5)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v6;
    else
      v7 = 0;
  }
  else
  {
    v7 = 0;
  }
  v8 = v7;

  if (v8)
  {
    v9 = objc_alloc_init(CCUIWifiMenuModuleItemTrailingView);
    if (objc_msgSend_isSecure(v8, v10, v11))
    {
      objc_msgSend__wifiSecureImage(self, v12, v13);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_alloc(MEMORY[0x24BDF6AE8]);
      v17 = (void *)objc_msgSend_initWithImage_(v15, v16, (uint64_t)v14);
      objc_msgSend_setContentMode_(v17, v18, 1);
      objc_msgSend_addSubview_(v9, v19, (uint64_t)v17);

    }
    if (objc_msgSend_isHotspot(v8, v12, v13))
    {
      objc_msgSend__hotspotImage(self, v20, v21);
    }
    else
    {
      v22 = objc_msgSend_signalBars(v8, v20, v21);
      objc_msgSend__wifiImageForSignalBars_(self, v23, v22);
    }
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v25 = objc_alloc(MEMORY[0x24BDF6AE8]);
    v27 = (void *)objc_msgSend_initWithImage_(v25, v26, (uint64_t)v24);
    objc_msgSend_setContentMode_(v27, v28, 1);
    objc_msgSend_addSubview_(v9, v29, (uint64_t)v27);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (id)credentialsViewControllerWithContext:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;

  objc_msgSend_URLWithString_(MEMORY[0x24BDBCF48], a2, (uint64_t)CFSTR("prefs:root=WIFI&path=Credentials"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_contentModuleContext(self, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_openURL_completionHandler_(v7, v8, (uint64_t)v4, 0);

  return 0;
}

- (id)certificateViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkDetailsViewControllerWithContext:(id)a3
{
  return 0;
}

- (id)networkErrorViewControllerWithContext:(id)a3
{
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;

  objc_msgSend_error(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedDescription(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedRecoverySuggestion(v4, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__presentAlertWithTitle_message_completion_(self, v11, (uint64_t)v7, v10, 0);

  return 0;
}

- (void)setScanning:(BOOL)a3
{
  MEMORY[0x24BEDD108](self, sel_setBusy_, a3);
}

- (void)setCurrentNetwork:(id)a3
{
  const char *v5;
  uint64_t v6;
  id v7;

  v7 = a3;
  if ((BSEqualObjects() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_currentNetwork, a3);
    objc_msgSend__updateWiFiMenuItems(self, v5, v6);
  }

}

- (void)setNetworks:(id)a3
{
  void *v4;
  const char *v5;
  const char *v6;
  WFNetworkListRecord *currentNetwork;
  uint64_t v8;
  void *v9;
  const char *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  NSArray *v14;
  NSArray *networks;
  const char *v16;
  uint64_t v17;
  id v18;

  objc_msgSend_allObjects(a3, a2, (uint64_t)a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_bs_filter_(v4, v5, (uint64_t)&unk_24FFCA870);
  v18 = (id)objc_claimAutoreleasedReturnValue();

  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    objc_msgSend_arrayByAddingObject_(v18, v6, (uint64_t)currentNetwork);
    v8 = objc_claimAutoreleasedReturnValue();

    v18 = (id)v8;
  }
  WFScanRecordAlphaSortCompartor();
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sortedArrayUsingComparator_(v18, v10, (uint64_t)v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if ((BSEqualObjects() & 1) == 0)
  {
    v14 = (NSArray *)objc_msgSend_copy(v11, v12, v13);
    networks = self->_networks;
    self->_networks = v14;

    objc_msgSend__updateWiFiMenuItems(self, v16, v17);
  }

}

- (id)_wifiImageForSignalBars:(unint64_t)a3
{
  void *v3;

  if (a3 > 1)
  {
    if (a3 == 2)
      objc_msgSend__wifiSignalMediumImage(self, a2, 2);
    else
      objc_msgSend__wifiSignalHighImage(self, a2, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend__wifiSignalLowImage(self, a2, a3);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v3;
}

- (id)_hotspotImage
{
  UIImage *hotspotImage;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  UIImage *v13;
  UIImage *v14;

  hotspotImage = self->_hotspotImage;
  if (!hotspotImage)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v4, v9, (uint64_t)CFSTR("WiFiHotspotGlyph"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(v10, v11, v12);
    v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v14 = self->_hotspotImage;
    self->_hotspotImage = v13;

    hotspotImage = self->_hotspotImage;
  }
  return hotspotImage;
}

- (id)_wifiSecureImage
{
  UIImage *wifiSecureImage;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  UIImage *v13;
  UIImage *v14;

  wifiSecureImage = self->_wifiSecureImage;
  if (!wifiSecureImage)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v4, v9, (uint64_t)CFSTR("WiFiSecureGlyph"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(v10, v11, v12);
    v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v14 = self->_wifiSecureImage;
    self->_wifiSecureImage = v13;

    wifiSecureImage = self->_wifiSecureImage;
  }
  return wifiSecureImage;
}

- (id)_wifiSignalLowImage
{
  UIImage *wifiSignalLowImage;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  UIImage *v13;
  UIImage *v14;

  wifiSignalLowImage = self->_wifiSignalLowImage;
  if (!wifiSignalLowImage)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v4, v9, (uint64_t)CFSTR("WiFiSignalLowGlyph"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(v10, v11, v12);
    v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v14 = self->_wifiSignalLowImage;
    self->_wifiSignalLowImage = v13;

    wifiSignalLowImage = self->_wifiSignalLowImage;
  }
  return wifiSignalLowImage;
}

- (id)_wifiSignalMediumImage
{
  UIImage *wifiSignalMediumImage;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  UIImage *v13;
  UIImage *v14;

  wifiSignalMediumImage = self->_wifiSignalMediumImage;
  if (!wifiSignalMediumImage)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v4, v9, (uint64_t)CFSTR("WiFiSignalMediumGlyph"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(v10, v11, v12);
    v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v14 = self->_wifiSignalMediumImage;
    self->_wifiSignalMediumImage = v13;

    wifiSignalMediumImage = self->_wifiSignalMediumImage;
  }
  return wifiSignalMediumImage;
}

- (id)_wifiSignalHighImage
{
  UIImage *wifiSignalHighImage;
  void *v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  uint64_t v12;
  UIImage *v13;
  UIImage *v14;

  wifiSignalHighImage = self->_wifiSignalHighImage;
  if (!wifiSignalHighImage)
  {
    v4 = (void *)MEMORY[0x24BDF6AC8];
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v4, v9, (uint64_t)CFSTR("WiFiSignalHighGlyph"), v8);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__imageThatSuppressesAccessibilityHairlineThickening(v10, v11, v12);
    v13 = (UIImage *)objc_claimAutoreleasedReturnValue();
    v14 = self->_wifiSignalHighImage;
    self->_wifiSignalHighImage = v13;

    wifiSignalHighImage = self->_wifiSignalHighImage;
  }
  return wifiSignalHighImage;
}

- (void)_updateWiFiMenuItems
{
  uint64_t v2;
  const char *v4;
  void *v5;
  WFNetworkListRecord *currentNetwork;
  void *v7;
  const char *v8;
  NSArray *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  uint64_t v16;
  void *v17;
  const char *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  _QWORD v24[5];
  id v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  currentNetwork = self->_currentNetwork;
  if (currentNetwork)
  {
    objc_msgSend__menuItemFromNetworkRecord_(self, v4, (uint64_t)currentNetwork);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObject_(v5, v8, (uint64_t)v7);

  }
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v9 = self->_networks;
  v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v26, v30, 16);
  if (v11)
  {
    v13 = v11;
    v14 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v14)
          objc_enumerationMutation(v9);
        v16 = *(_QWORD *)(*((_QWORD *)&v26 + 1) + 8 * i);
        if ((objc_msgSend_isEqual_(self->_currentNetwork, v12, v16) & 1) == 0)
        {
          objc_msgSend__menuItemFromNetworkRecord_(self, v12, v16);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_addObject_(v5, v18, (uint64_t)v17);

        }
      }
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v26, v30, 16);
    }
    while (v13);
  }

  if (objc_msgSend__appearState(self, v19, v20) == 2)
  {
    objc_msgSend_setMenuItems_(self, v21, (uint64_t)v5);
  }
  else
  {
    v22 = (void *)MEMORY[0x24BDF6F90];
    v24[0] = MEMORY[0x24BDAC760];
    v24[1] = 3221225472;
    v24[2] = sub_230FA5C68;
    v24[3] = &unk_24FFCA898;
    v24[4] = self;
    v25 = v5;
    objc_msgSend_performWithoutAnimation_(v22, v23, (uint64_t)v24);

  }
}

- (id)_menuItemFromNetworkRecord:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  const char *v11;
  uint64_t isEqualToString;
  const char *v13;
  void *v14;
  CCUIWiFiMenuModuleItem *v15;
  id v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  uint64_t v25;
  uint64_t isSecure;
  const char *v27;
  const char *v28;
  uint64_t v29;
  uint64_t v30;
  const char *v31;
  _QWORD v33[4];
  id v34;
  id v35;
  id location;

  v4 = a3;
  objc_msgSend_ssid(v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_ssid(self->_currentNetwork, v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  isEqualToString = objc_msgSend_isEqualToString_(v7, v11, (uint64_t)v10);

  if ((_DWORD)isEqualToString)
    objc_msgSend_stringByAppendingString_(CFSTR("selected."), v13, (uint64_t)v7);
  else
    objc_msgSend_stringByAppendingString_(CFSTR("notselected."), v13, (uint64_t)v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  v15 = [CCUIWiFiMenuModuleItem alloc];
  v33[0] = MEMORY[0x24BDAC760];
  v33[1] = 3221225472;
  v33[2] = sub_230FA5E28;
  v33[3] = &unk_24FFCA8C0;
  objc_copyWeak(&v35, &location);
  v16 = v4;
  v34 = v16;
  v18 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v15, v17, (uint64_t)v7, v14, v33);
  objc_msgSend_setSelected_(v18, v19, isEqualToString);
  v22 = objc_msgSend_iOSHotspot(v16, v20, v21);
  objc_msgSend_setHotspot_(v18, v23, v22);
  isSecure = objc_msgSend_isSecure(v16, v24, v25);
  objc_msgSend_setSecure_(v18, v27, isSecure);
  objc_msgSend_scaledRSSI(v16, v28, v29);
  v30 = WFSignalBarsFromScaledRSSI();
  objc_msgSend_setSignalBars_(v18, v31, v30);

  objc_destroyWeak(&v35);
  objc_destroyWeak(&location);

  return v18;
}

- (void)_serializeNetworkRecord:(id)a3
{
  void *v3;
  const char *v4;
  uint64_t v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  char v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  const char *v15;
  int v16;
  void *v17;
  const char *v18;
  uint64_t v19;

  objc_msgSend_attributes(a3, a2, (uint64_t)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stringByExpandingTildeInPath(CFSTR("~/Library/Caches/com.apple.wifi"), v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend_fileExistsAtPath_(v9, v10, (uint64_t)v6);

  if ((v11 & 1) != 0
    || (objc_msgSend_defaultManager(MEMORY[0x24BDD1580], v12, v13),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v19 = 0,
        v16 = objc_msgSend_createDirectoryAtPath_withIntermediateDirectories_attributes_error_(v14, v15, (uint64_t)v6, 0, 0, &v19), v14, v16))
  {
    objc_msgSend_stringByAppendingPathComponent_(v6, v12, (uint64_t)CFSTR("LastEnterpriseNetwork.plist"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_writeToFile_atomically_(v3, v18, (uint64_t)v17, 0);

  }
}

- (void)_presentAlertWithTitle:(id)a3 message:(id)a4 completion:(id)a5
{
  void *v8;
  id v9;
  const char *v10;
  void *v11;
  uint64_t v12;
  const char *v13;
  void *v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  const char *v20;
  id v21;

  v8 = (void *)MEMORY[0x24BDF67F0];
  v9 = a5;
  objc_msgSend_alertControllerWithTitle_message_preferredStyle_(v8, v10, (uint64_t)a3, a4, 1);
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v11 = (void *)MEMORY[0x24BDD1488];
  v12 = objc_opt_class();
  objc_msgSend_bundleForClass_(v11, v13, v12);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v14, v15, (uint64_t)CFSTR("CONTROL_CENTER_ALERT_OK"), &stru_24FFCAEF8, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_actionWithTitle_style_handler_(MEMORY[0x24BDF67E8], v17, (uint64_t)v16, 0, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_addAction_(v21, v19, (uint64_t)v18);

  objc_msgSend_presentViewController_animated_completion_(self, v20, (uint64_t)v21, 1, v9);
}

- (BOOL)showOtherNetwork
{
  return self->_showOtherNetwork;
}

- (void)setShowOtherNetwork:(BOOL)a3
{
  self->_showOtherNetwork = a3;
}

- (float)currentNetworkScaledRSSI
{
  return self->_currentNetworkScaledRSSI;
}

- (void)setCurrentNetworkScaledRSSI:(float)a3
{
  self->_currentNetworkScaledRSSI = a3;
}

- (unint64_t)currentNetworkSignalBars
{
  return self->_currentNetworkSignalBars;
}

- (void)setCurrentNetworkSignalBars:(unint64_t)a3
{
  self->_currentNetworkSignalBars = a3;
}

- (WFNetworkListRecord)currentNetwork
{
  return (WFNetworkListRecord *)objc_getProperty(self, a2, 1320, 1);
}

- (int64_t)currentNetworkState
{
  return self->_currentNetworkState;
}

- (void)setCurrentNetworkState:(int64_t)a3
{
  self->_currentNetworkState = a3;
}

- (int64_t)deviceCapability
{
  return self->_deviceCapability;
}

- (void)setDeviceCapability:(int64_t)a3
{
  self->_deviceCapability = a3;
}

- (WFNetworkListDelegate)listDelegate
{
  return (WFNetworkListDelegate *)objc_loadWeakRetained((id *)&self->_listDelegate);
}

- (void)setListDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_listDelegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_listDelegate);
  objc_storeStrong((id *)&self->_currentNetwork, 0);
  objc_storeStrong((id *)&self->_wifiSignalHighImage, 0);
  objc_storeStrong((id *)&self->_wifiSignalMediumImage, 0);
  objc_storeStrong((id *)&self->_wifiSignalLowImage, 0);
  objc_storeStrong((id *)&self->_wifiSecureImage, 0);
  objc_storeStrong((id *)&self->_hotspotImage, 0);
  objc_storeStrong((id *)&self->_networks, 0);
  objc_storeStrong((id *)&self->_wifiManager, 0);
}

@end

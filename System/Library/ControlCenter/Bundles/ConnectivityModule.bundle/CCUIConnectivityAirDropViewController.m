@implementation CCUIConnectivityAirDropViewController

- (CCUIConnectivityAirDropViewController)init
{
  void *v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CCUIConnectivityAirDropViewController *v13;
  const char *v14;
  objc_super v16;

  v3 = (void *)MEMORY[0x24BDF6AC8];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_imageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("AirDropGlyph"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemBlueColor(MEMORY[0x24BDF6950], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v16.receiver = self;
  v16.super_class = (Class)CCUIConnectivityAirDropViewController;
  v13 = -[CCUIConnectivityButtonViewController initWithGlyphImage:highlightColor:](&v16, sel_initWithGlyphImage_highlightColor_, v9, v12);

  if (v13)
    objc_msgSend_setToggleStateOnTap_(v13, v14, 0);

  return v13;
}

+ (BOOL)isSupported
{
  if (qword_25414CBF8 != -1)
    dispatch_once(&qword_25414CBF8, &unk_24FFCAC38);
  return qword_25414CC00 != 0;
}

- (id)displayName
{
  void *v2;
  uint64_t v3;
  const char *v4;
  void *v5;
  const char *v6;
  void *v7;

  v2 = (void *)MEMORY[0x24BDD1488];
  v3 = objc_opt_class();
  objc_msgSend_bundleForClass_(v2, v4, v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_AIRDROP_NAME"), &stru_24FFCAEF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.AirDrop");
}

- (void)buttonTapped:(id)a3
{
  const char *v4;
  uint64_t v5;
  _BOOL4 v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityAirDropViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v8, sel_buttonTapped_, a3);
  v6 = objc_msgSend_discoverableMode(self->_airDropDiscoveryController, v4, v5) == 0;
  objc_msgSend_setDiscoverableMode_(self->_airDropDiscoveryController, v7, 2 * v6);
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivityAirDropViewController;
  -[CCUIConnectivityAirDropViewController viewWillAppear:](&v8, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  objc_msgSend__updateState(self, v6, v7);
}

- (void)viewDidDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityAirDropViewController;
  -[CCUIConnectivityAirDropViewController viewDidDisappear:](&v6, sel_viewDidDisappear_, a3);
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (id)_availableMenuItems
{
  SFAirDropDiscoveryController *v3;
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  SFAirDropDiscoveryController *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  id v18;
  void *v19;
  uint64_t v20;
  const char *v21;
  void *v22;
  const char *v23;
  void *v24;
  SFAirDropDiscoveryController *v25;
  const char *v26;
  void *v27;
  const char *v28;
  uint64_t v29;
  const char *v30;
  id v31;
  void *v32;
  uint64_t v33;
  const char *v34;
  void *v35;
  const char *v36;
  uint64_t v37;
  void *v38;
  const char *v39;
  void *v40;
  SFAirDropDiscoveryController *v41;
  const char *v42;
  void *v43;
  const char *v44;
  uint64_t v45;
  const char *v46;
  uint64_t v47;
  const char *v48;
  void *v49;
  uint64_t v51;
  uint64_t v52;
  uint64_t (*v53)(uint64_t, const char *);
  void *v54;
  SFAirDropDiscoveryController *v55;
  _QWORD v56[4];
  SFAirDropDiscoveryController *v57;
  _QWORD v58[4];
  SFAirDropDiscoveryController *v59;
  _QWORD v60[3];
  _QWORD v61[4];

  v61[2] = *MEMORY[0x24BDAC8D0];
  v3 = self->_airDropDiscoveryController;
  v4 = objc_alloc(MEMORY[0x24BE19B60]);
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v8, v9, (uint64_t)CFSTR("CONTROL_CENTER_AIRDROP_RECEIVING_OFF_ONE_LINE"), &stru_24FFCAEF8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x24BDAC760];
  v58[0] = MEMORY[0x24BDAC760];
  v58[1] = 3221225472;
  v58[2] = sub_230FB05C4;
  v58[3] = &unk_24FFCABE8;
  v12 = v3;
  v59 = v12;
  v14 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v4, v13, (uint64_t)v10, CFSTR("off"), v58);

  if (!objc_msgSend_discoverableMode(v12, v15, v16))
    objc_msgSend_setSelected_(v14, v17, 1);
  v18 = objc_alloc(MEMORY[0x24BE19B60]);
  v19 = (void *)MEMORY[0x24BDD1488];
  v20 = objc_opt_class();
  objc_msgSend_bundleForClass_(v19, v21, v20);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v22, v23, (uint64_t)CFSTR("CONTROL_CENTER_AIRDROP_CONTACTS_ONE_LINE"), &stru_24FFCAEF8, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v56[0] = v11;
  v56[1] = 3221225472;
  v56[2] = sub_230FB05E4;
  v56[3] = &unk_24FFCABE8;
  v25 = v12;
  v57 = v25;
  v27 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v18, v26, (uint64_t)v24, CFSTR("contacts"), v56);

  if (objc_msgSend_discoverableMode(v25, v28, v29) == 1)
    objc_msgSend_setSelected_(v27, v30, 1);
  v31 = objc_alloc(MEMORY[0x24BE19B60]);
  v32 = (void *)MEMORY[0x24BDD1488];
  v33 = objc_opt_class();
  objc_msgSend_bundleForClass_(v32, v34, v33);
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend__everyoneMenuItemTextKey(self, v36, v37);
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v35, v39, (uint64_t)v38, &stru_24FFCAEF8, 0);
  v40 = (void *)objc_claimAutoreleasedReturnValue();
  v51 = MEMORY[0x24BDAC760];
  v52 = 3221225472;
  v53 = sub_230FB0604;
  v54 = &unk_24FFCABE8;
  v41 = v25;
  v55 = v41;
  v43 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v31, v42, (uint64_t)v40, CFSTR("everyone"), &v51);

  if (objc_msgSend_discoverableMode(v41, v44, v45, v51, v52, v53, v54) == 2)
    objc_msgSend_setSelected_(v43, v46, 1);
  if ((objc_msgSend__isEduModeEnabled(self, v46, v47) & 1) != 0)
  {
    v61[0] = v14;
    v61[1] = v43;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v48, (uint64_t)v61, 2);
  }
  else
  {
    v60[0] = v14;
    v60[1] = v27;
    v60[2] = v43;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v48, (uint64_t)v60, 3);
  }
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  return v49;
}

- (void)_updateState
{
  uint64_t v2;
  uint64_t isVisible;
  const char *v5;
  uint64_t v6;
  uint64_t isAirDropRestricted;
  const char *v8;
  const char *v9;

  isVisible = objc_msgSend_isVisible(self->_airDropDiscoveryController, a2, v2);
  isAirDropRestricted = objc_msgSend__isAirDropRestricted(self, v5, v6);
  objc_msgSend__updateAirDropControlAsEnabled_(self, v8, isVisible);
  objc_msgSend_setInoperative_(self, v9, isAirDropRestricted);
}

- (void)_updateAirDropControlAsEnabled:(BOOL)a3
{
  uint64_t v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  id v21;

  v4 = objc_msgSend_discoverableMode(self->_airDropDiscoveryController, a2, a3);
  if (v4 == 2)
  {
    v10 = (void *)MEMORY[0x24BDD1488];
    v11 = objc_opt_class();
    objc_msgSend_bundleForClass_(v10, v12, v11);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v8, v13, (uint64_t)CFSTR("CONTROL_CENTER_AIRDROP_EVERYONE_ONE_LINE"), &stru_24FFCAEF8, 0);
  }
  else
  {
    if (v4 != 1)
    {
      v15 = (void *)MEMORY[0x24BDD1488];
      v16 = objc_opt_class();
      objc_msgSend_bundleForClass_(v15, v17, v16);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v8, v18, (uint64_t)CFSTR("CONTROL_CENTER_AIRDROP_RECEIVING_OFF_ONE_LINE"), &stru_24FFCAEF8, 0);
      v21 = (id)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      goto LABEL_7;
    }
    v5 = (void *)MEMORY[0x24BDD1488];
    v6 = objc_opt_class();
    objc_msgSend_bundleForClass_(v5, v7, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v8, v9, (uint64_t)CFSTR("CONTROL_CENTER_AIRDROP_CONTACTS_ONE_LINE"), &stru_24FFCAEF8, 0);
  }
  v21 = (id)objc_claimAutoreleasedReturnValue();
  v14 = 1;
LABEL_7:

  objc_msgSend_setEnabled_(self, v19, v14);
  objc_msgSend_setSubtitle_(self, v20, (uint64_t)v21);

}

- (BOOL)_isAirDropRestricted
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  char v6;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend_isAirDropAllowed(v3, v4, v5) ^ 1;

  return v6;
}

- (BOOL)_isEduModeEnabled
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  BOOL v11;

  objc_msgSend_sharedManager(MEMORY[0x24BEBF268], a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_isMultiUser(v3, v4, v5))
  {
    objc_msgSend_currentUser(v3, v6, v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend_userType(v8, v9, v10) == 1;

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

- (void)startObservingStateChanges
{
  SFAirDropDiscoveryController *v3;
  SFAirDropDiscoveryController *airDropDiscoveryController;
  const char *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CCUIConnectivityAirDropViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v11, sel_startObservingStateChanges);
  v3 = (SFAirDropDiscoveryController *)objc_alloc_init(NSClassFromString(CFSTR("SFAirDropDiscoveryController")));
  airDropDiscoveryController = self->_airDropDiscoveryController;
  self->_airDropDiscoveryController = v3;

  objc_msgSend_setDelegate_(self->_airDropDiscoveryController, v5, (uint64_t)self);
  objc_msgSend_setAlertControllerDelegate_(self->_airDropDiscoveryController, v6, (uint64_t)self);
  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_registerObserver_(v9, v10, (uint64_t)self);

}

- (void)stopObservingStateChanges
{
  const char *v3;
  const char *v4;
  SFAirDropDiscoveryController *airDropDiscoveryController;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivityAirDropViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v10, sel_stopObservingStateChanges);
  objc_msgSend_setDelegate_(self->_airDropDiscoveryController, v3, 0);
  objc_msgSend_setAlertControllerDelegate_(self->_airDropDiscoveryController, v4, 0);
  airDropDiscoveryController = self->_airDropDiscoveryController;
  self->_airDropDiscoveryController = 0;

  objc_msgSend_sharedConnection(MEMORY[0x24BE63CB0], v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_unregisterObserver_(v8, v9, (uint64_t)self);

}

- (id)_everyoneMenuItemTextKey
{
  const char *v3;
  uint64_t v4;

  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend_isTimeLimitedEveryoneMode(self->_airDropDiscoveryController, v3, v4) & 1) != 0)
  {
    return CFSTR("CONTROL_CENTER_AIRDROP_EVERYONE_TIME_LIMIT");
  }
  else
  {
    return CFSTR("CONTROL_CENTER_AIRDROP_EVERYONE_ONE_LINE");
  }
}

- (BOOL)showsMenuAsPrimaryAction
{
  return 1;
}

- (id)contextMenuItems
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  id v30;
  const char *v31;
  void *v32;
  const char *v33;
  id obj;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__availableMenuItems(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v37, v41, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v15 = objc_msgSend__contextMenuItemStateFromMenuItem_(self, v10, (uint64_t)v14);
        v16 = (void *)MEMORY[0x24BDF67B8];
        objc_msgSend_title(v14, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = sub_230FB0BEC;
        v36[3] = &unk_24FFCABA0;
        v36[4] = v14;
        objc_msgSend_actionWithTitle_image_identifier_handler_(v16, v20, (uint64_t)v19, 0, 0, v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setState_(v21, v22, v15);
        objc_msgSend_subtitle(v14, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend_subtitle(v14, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setSubtitle_(v21, v29, (uint64_t)v28);

        }
        v30 = objc_alloc(MEMORY[0x24BE19B28]);
        v32 = (void *)objc_msgSend_initWithMenuElement_(v30, v31, (uint64_t)v21);
        objc_msgSend_addObject_(v7, v33, (uint64_t)v32);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v37, v41, 16);
    }
    while (v11);
  }

  return v7;
}

- (id)contextMenu
{
  uint64_t v2;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  const char *v23;
  uint64_t v24;
  void *v25;
  const char *v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  const char *v30;
  uint64_t v31;
  const char *v32;
  void *v33;
  id obj;
  _QWORD v36[5];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _BYTE v41[128];
  uint64_t v42;

  v42 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__availableMenuItems(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v37 = 0u;
  v38 = 0u;
  v39 = 0u;
  v40 = 0u;
  obj = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v37, v41, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v38;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v38 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v37 + 1) + 8 * i);
        v15 = objc_msgSend__contextMenuItemStateFromMenuItem_(self, v10, (uint64_t)v14);
        v16 = (void *)MEMORY[0x24BDF67B8];
        objc_msgSend_title(v14, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v36[0] = MEMORY[0x24BDAC760];
        v36[1] = 3221225472;
        v36[2] = sub_230FB0E20;
        v36[3] = &unk_24FFCABA0;
        v36[4] = v14;
        objc_msgSend_actionWithTitle_image_identifier_handler_(v16, v20, (uint64_t)v19, 0, 0, v36);
        v21 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend_setState_(v21, v22, v15);
        objc_msgSend_subtitle(v14, v23, v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        if (v25)
        {
          objc_msgSend_subtitle(v14, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_setSubtitle_(v21, v29, (uint64_t)v28);

        }
        objc_msgSend_addObject_(v7, v26, (uint64_t)v21);

      }
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v37, v41, 16);
    }
    while (v11);
  }

  if (objc_msgSend_count(v7, v30, v31))
  {
    objc_msgSend_menuWithChildren_(MEMORY[0x24BDF6BA8], v32, (uint64_t)v7);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v33 = 0;
  }

  return v33;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_airDropDiscoveryController, 0);
}

@end

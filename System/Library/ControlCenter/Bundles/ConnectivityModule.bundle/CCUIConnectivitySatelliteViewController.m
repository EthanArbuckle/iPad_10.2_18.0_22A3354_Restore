@implementation CCUIConnectivitySatelliteViewController

- (CCUIConnectivitySatelliteViewController)init
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
  CCUIConnectivitySatelliteViewController *v13;
  CCUIConnectivitySatelliteMonitor *v14;
  void *SerialWithQoS;
  const char *v16;
  uint64_t v17;
  CCUIConnectivitySatelliteMonitor *satelliteMonitor;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  void *v23;
  const char *v24;
  void *v25;
  const char *v26;
  void *v27;
  uint64_t v28;
  OS_dispatch_queue *queue;
  objc_super v31;

  v3 = (void *)MEMORY[0x24BE19B00];
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_descriptionForPackageNamed_inBundle_(v3, v8, (uint64_t)CFSTR("Satellite"), v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_systemGreenColor(MEMORY[0x24BDF6950], v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v31.receiver = self;
  v31.super_class = (Class)CCUIConnectivitySatelliteViewController;
  v13 = -[CCUIConnectivityButtonViewController initWithGlyphPackageDescription:highlightColor:](&v31, sel_initWithGlyphPackageDescription_highlightColor_, v9, v12);

  if (v13)
  {
    v14 = [CCUIConnectivitySatelliteMonitor alloc];
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
    v17 = objc_msgSend_initWithQueue_(v14, v16, (uint64_t)SerialWithQoS);
    satelliteMonitor = v13->_satelliteMonitor;
    v13->_satelliteMonitor = (CCUIConnectivitySatelliteMonitor *)v17;

    objc_msgSend_start(v13->_satelliteMonitor, v19, v20);
    objc_msgSend_serial(MEMORY[0x24BE0BE18], v21, v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_autoreleaseFrequency_(v23, v24, 1);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_serviceClass_(v25, v26, 25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = BSDispatchQueueCreate();
    queue = v13->_queue;
    v13->_queue = (OS_dispatch_queue *)v28;

  }
  return v13;
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
  objc_msgSend_localizedStringForKey_value_table_(v5, v6, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_NAME"), &stru_24FFCAEF8, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)identifier
{
  return CFSTR("com.apple.ControlCenter.Satellite");
}

+ (BOOL)isSupported
{
  int v2;
  CCUIConnectivitySatelliteMonitor *v3;
  void *SerialWithQoS;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;

  v2 = _os_feature_enabled_impl();
  if (v2)
  {
    v3 = [CCUIConnectivitySatelliteMonitor alloc];
    SerialWithQoS = (void *)BSDispatchQueueCreateSerialWithQoS();
    v6 = (void *)objc_msgSend_initWithQueue_(v3, v5, (uint64_t)SerialWithQoS);

    LOBYTE(SerialWithQoS) = objc_msgSend_isSupported(v6, v7, v8);
    LOBYTE(v2) = (_BYTE)SerialWithQoS;
  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  objc_super v10;

  v10.receiver = self;
  v10.super_class = (Class)CCUIConnectivitySatelliteViewController;
  -[CCUIConnectivitySatelliteViewController viewWillAppear:](&v10, sel_viewWillAppear_, a3);
  objc_msgSend_startObservingStateChangesIfNecessary(self, v4, v5);
  v8 = objc_msgSend_state(self->_satelliteMonitor, v6, v7);
  objc_msgSend__updateState_(self, v9, v8);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  uint64_t v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivitySatelliteViewController;
  -[CCUIConnectivitySatelliteViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend_stopObservingStateChangesIfNecessary(self, v4, v5);
}

- (BOOL)_canShowWhileLocked
{
  return 1;
}

- (void)satelliteMonitor:(id)a3 didChangeState:(unint64_t)a4
{
  objc_msgSend__updateState_(self, a2, a4);
}

- (BOOL)showsMenuAsPrimaryAction
{
  uint64_t v2;
  void *v3;
  BOOL v4;

  objc_msgSend_contextMenuItems(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
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
  const char *v34;
  uint64_t v35;
  void *v36;
  id v37;
  id obj;
  _QWORD v40[5];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  uint64_t v46;

  v46 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__menuItemsForCurrentState(self, a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_array(MEMORY[0x24BDBCEB8], v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v41 = 0u;
  v42 = 0u;
  v43 = 0u;
  v44 = 0u;
  obj = v4;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v41, v45, 16);
  if (v9)
  {
    v11 = v9;
    v12 = *(_QWORD *)v42;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v42 != v12)
          objc_enumerationMutation(obj);
        v14 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
        v15 = objc_msgSend__contextMenuItemStateFromMenuItem_(self, v10, (uint64_t)v14);
        v16 = (void *)MEMORY[0x24BDF67B8];
        objc_msgSend_title(v14, v17, v18);
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v40[0] = MEMORY[0x24BDAC760];
        v40[1] = 3221225472;
        v40[2] = sub_230FAED74;
        v40[3] = &unk_24FFCABA0;
        v40[4] = v14;
        objc_msgSend_actionWithTitle_image_identifier_handler_(v16, v20, (uint64_t)v19, 0, 0, v40);
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
      v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v41, v45, 16);
    }
    while (v11);
  }

  if (objc_msgSend_count(v7, v34, v35))
    v36 = v7;
  else
    v36 = 0;
  v37 = v36;

  return v37;
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
  objc_msgSend__menuItemsForCurrentState(self, a2, v2);
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
        v36[2] = sub_230FAEFA8;
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

- (void)_openSOSBuddyApp
{
  dispatch_async((dispatch_queue_t)self->_queue, &unk_24FFCABC0);
}

- (void)_turnOff
{
  ((void (*)(CCUIConnectivitySatelliteMonitor *, char *))MEMORY[0x24BEDD108])(self->_satelliteMonitor, sel_turnOff);
}

- (void)_disconnectFromSatellite
{
  uint64_t v2;

  objc_msgSend_disconnectFromSatellite(self->_satelliteMonitor, a2, v2);
}

- (id)_tryDemoMenuItems
{
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend_canShowDemo(self->_satelliteMonitor, a2, v2))
    return MEMORY[0x24BDBD1A8];
  v4 = objc_alloc(MEMORY[0x24BE19B60]);
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v8, v9, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_TRY_DEMO"), &stru_24FFCAEF8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_230FAF238;
  v16[3] = &unk_24FFCABE8;
  v16[4] = self;
  v12 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v4, v11, (uint64_t)v10, CFSTR("demo"), v16);

  v17[0] = v12;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v13, (uint64_t)v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_offMenuItems
{
  uint64_t v2;
  id v4;
  void *v5;
  uint64_t v6;
  const char *v7;
  void *v8;
  const char *v9;
  void *v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  _QWORD v16[5];
  _QWORD v17[2];

  v17[1] = *MEMORY[0x24BDAC8D0];
  if (!objc_msgSend_isMessagingServiceAvailable(self->_satelliteMonitor, a2, v2))
    return MEMORY[0x24BDBD1A8];
  v4 = objc_alloc(MEMORY[0x24BE19B60]);
  v5 = (void *)MEMORY[0x24BDD1488];
  v6 = objc_opt_class();
  objc_msgSend_bundleForClass_(v5, v7, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v8, v9, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_USE_MESSAGES_VIA_SATELLITE"), &stru_24FFCAEF8, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = MEMORY[0x24BDAC760];
  v16[1] = 3221225472;
  v16[2] = sub_230FAF39C;
  v16[3] = &unk_24FFCABE8;
  v16[4] = self;
  v12 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v4, v11, (uint64_t)v10, CFSTR("use messages"), v16);

  v17[0] = v12;
  objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v13, (uint64_t)v17, 1);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (id)_notConnectedMenuItems
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[5];
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE19B60]);
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_CONNECT"), &stru_24FFCAEF8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_230FAF5B8;
  v28[3] = &unk_24FFCABE8;
  v28[4] = self;
  v12 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v3, v11, (uint64_t)v9, CFSTR("connect"), v28);

  v13 = objc_alloc(MEMORY[0x24BE19B60]);
  v14 = (void *)MEMORY[0x24BDD1488];
  v15 = objc_opt_class();
  objc_msgSend_bundleForClass_(v14, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v17, v18, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_SHOW_OPTIONS"), &stru_24FFCAEF8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = sub_230FAF5D4;
  v27[3] = &unk_24FFCABE8;
  v27[4] = self;
  v21 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v13, v20, (uint64_t)v19, CFSTR("show options"), v27);

  if (objc_msgSend_isMessagingServiceAvailable(self->_satelliteMonitor, v22, v23))
  {
    v30[0] = v12;
    v30[1] = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, (uint64_t)v30, 2);
  }
  else
  {
    v29 = v12;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, (uint64_t)&v29, 1);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_connectedMenuItems
{
  id v3;
  void *v4;
  uint64_t v5;
  const char *v6;
  void *v7;
  const char *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  void *v21;
  const char *v22;
  uint64_t v23;
  const char *v24;
  void *v25;
  _QWORD v27[5];
  _QWORD v28[5];
  void *v29;
  _QWORD v30[3];

  v30[2] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc(MEMORY[0x24BE19B60]);
  v4 = (void *)MEMORY[0x24BDD1488];
  v5 = objc_opt_class();
  objc_msgSend_bundleForClass_(v4, v6, v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v7, v8, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_DISCONNECT"), &stru_24FFCAEF8, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = MEMORY[0x24BDAC760];
  v28[0] = MEMORY[0x24BDAC760];
  v28[1] = 3221225472;
  v28[2] = sub_230FAF7F0;
  v28[3] = &unk_24FFCABE8;
  v28[4] = self;
  v12 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v3, v11, (uint64_t)v9, CFSTR("disconnect"), v28);

  v13 = objc_alloc(MEMORY[0x24BE19B60]);
  v14 = (void *)MEMORY[0x24BDD1488];
  v15 = objc_opt_class();
  objc_msgSend_bundleForClass_(v14, v16, v15);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_localizedStringForKey_value_table_(v17, v18, (uint64_t)CFSTR("CONTROL_CENTER_SATELLITE_MENU_SHOW_OPTIONS"), &stru_24FFCAEF8, 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v27[0] = v10;
  v27[1] = 3221225472;
  v27[2] = sub_230FAF80C;
  v27[3] = &unk_24FFCABE8;
  v27[4] = self;
  v21 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v13, v20, (uint64_t)v19, CFSTR("show options"), v27);

  if (objc_msgSend_isMessagingServiceAvailable(self->_satelliteMonitor, v22, v23))
  {
    v30[0] = v12;
    v30[1] = v21;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, (uint64_t)v30, 2);
  }
  else
  {
    v29 = v12;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v24, (uint64_t)&v29, 1);
  }
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  return v25;
}

- (id)_menuItemsForCurrentState
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  v6 = objc_msgSend_state(self->_satelliteMonitor, a2, v2);
  v7 = (void *)MEMORY[0x24BDBD1A8];
  switch(v6)
  {
    case 1:
      objc_msgSend__tryDemoMenuItems(self, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 2:
      objc_msgSend__offMenuItems(self, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 3:
      objc_msgSend__notConnectedMenuItems(self, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    case 5:
      objc_msgSend__connectedMenuItems(self, v4, v5);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      break;
    default:
      return v7;
  }
  return v7;
}

- (void)_updateState:(unint64_t)a3
{
  void *v5;
  const char *v6;
  const char *v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  void *v12;
  const char *v13;
  void *v14;
  const char *v15;
  uint64_t v16;
  const char *v17;
  const char *v18;
  const char *v19;
  const char *v20;
  const char *v21;
  const char *v22;
  uint64_t v23;
  void *v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  const char *v28;
  void *v29;
  NSObject *v30;
  const char *v31;
  void *v32;
  NSObject *v33;
  const char *v34;
  uint64_t v35;
  const char *v36;
  int v37;
  void *v38;
  __int16 v39;
  int v40;
  __int16 v41;
  int v42;
  __int16 v43;
  int v44;
  __int16 v45;
  void *v46;
  uint64_t v47;

  v47 = *MEMORY[0x24BDAC8D0];
  if (a3)
  {
    objc_msgSend_templateView(self, a2, a3);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v5, v6, 0);

    v8 = objc_msgSend__inoperativeForState_(self, v7, a3);
    v10 = objc_msgSend__enabledForState_(self, v9, a3);
    objc_msgSend__glyphStateForState_(self, v11, a3);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend__subtitleTextForState_(self, v13, a3);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = objc_msgSend__useAlternateBackgroundForState_(self, v15, a3);
    objc_msgSend_setInoperative_(self, v17, v8);
    objc_msgSend_setEnabled_(self, v18, v10);
    objc_msgSend_setGlyphState_(self, v19, (uint64_t)v12);
    objc_msgSend_setSubtitle_(self, v20, (uint64_t)v14);
    objc_msgSend_setUseAlternateBackground_(self, v21, v16);
    objc_msgSend_templateView(self, v22, v23);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = objc_msgSend_showsMenuAsPrimaryAction(self, v25, v26);
    objc_msgSend_setShowsMenuAffordance_(v24, v28, v27);

    v29 = (void *)*MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      v30 = v29;
      objc_msgSend__debugDescriptionForState_(self, v31, 1);
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v37 = 138544387;
      v38 = v32;
      v39 = 1024;
      v40 = v8;
      v41 = 1024;
      v42 = v16;
      v43 = 1024;
      v44 = v10;
      v45 = 2113;
      v46 = v14;
      _os_log_impl(&dword_230FA3000, v30, OS_LOG_TYPE_DEFAULT, "[Satellite] Satellite state updated to %{public}@ [ inoperative: %d enabled: %d useAlternateBackground: %d subtitle: %{private}@ ]", (uint8_t *)&v37, 0x28u);

    }
  }
  else
  {
    v33 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_230FA3000, v33, OS_LOG_TYPE_DEFAULT, "[Satellite] Hiding view", (uint8_t *)&v37, 2u);
    }
    objc_msgSend_templateView(self, v34, v35);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setHidden_(v12, v36, 1);
  }

}

- (id)_subtitleTextForState:(unint64_t)a3
{
  void *v3;
  uint64_t v4;
  const char *v5;
  void *v6;
  const char *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  const char *v11;
  const char *v12;
  void *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  void *v17;
  uint64_t v18;
  const char *v19;
  const char *v20;
  void *v21;
  uint64_t v22;
  const char *v23;
  const char *v24;
  void *v25;
  uint64_t v26;
  const char *v27;
  const char *v28;

  switch(a3)
  {
    case 1uLL:
      v3 = (void *)MEMORY[0x24BDD1488];
      v4 = objc_opt_class();
      objc_msgSend_bundleForClass_(v3, v5, v4);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v6, v7, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_NOT_AVAILABLE"), &stru_24FFCAEF8, 0);
      goto LABEL_9;
    case 2uLL:
      v9 = (void *)MEMORY[0x24BDD1488];
      v10 = objc_opt_class();
      objc_msgSend_bundleForClass_(v9, v11, v10);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v6, v12, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_OFF"), &stru_24FFCAEF8, 0);
      goto LABEL_9;
    case 3uLL:
      v13 = (void *)MEMORY[0x24BDD1488];
      v14 = objc_opt_class();
      objc_msgSend_bundleForClass_(v13, v15, v14);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v6, v16, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_NOT_CONNECTED"), &stru_24FFCAEF8, 0);
      goto LABEL_9;
    case 4uLL:
      v17 = (void *)MEMORY[0x24BDD1488];
      v18 = objc_opt_class();
      objc_msgSend_bundleForClass_(v17, v19, v18);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v6, v20, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_CONNECTING"), &stru_24FFCAEF8, 0);
      goto LABEL_9;
    case 5uLL:
      v21 = (void *)MEMORY[0x24BDD1488];
      v22 = objc_opt_class();
      objc_msgSend_bundleForClass_(v21, v23, v22);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v6, v24, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_CONNECTED"), &stru_24FFCAEF8, 0);
      goto LABEL_9;
    case 6uLL:
      v25 = (void *)MEMORY[0x24BDD1488];
      v26 = objc_opt_class();
      objc_msgSend_bundleForClass_(v25, v27, v26);
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_localizedStringForKey_value_table_(v6, v28, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_SATELLITE_DISCONNECTING"), &stru_24FFCAEF8, 0);
LABEL_9:
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      break;
    default:
      v8 = 0;
      break;
  }
  return v8;
}

- (id)_glyphStateForState:(unint64_t)a3
{
  if (a3 - 1 > 5)
    return CFSTR("hidden");
  else
    return off_24FFCAC08[a3 - 1];
}

- (BOOL)_useAlternateBackgroundForState:(unint64_t)a3
{
  return a3 == 3;
}

- (BOOL)_inoperativeForState:(unint64_t)a3
{
  return a3 == 0;
}

- (BOOL)_enabledForState:(unint64_t)a3
{
  return a3 - 4 < 3;
}

- (void)startObservingStateChanges
{
  const char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIConnectivitySatelliteViewController;
  -[CCUIConnectivityButtonViewController startObservingStateChanges](&v4, sel_startObservingStateChanges);
  objc_msgSend_setDelegate_(self->_satelliteMonitor, v3, (uint64_t)self);
}

- (void)stopObservingStateChanges
{
  const char *v3;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CCUIConnectivitySatelliteViewController;
  -[CCUIConnectivityButtonViewController stopObservingStateChanges](&v4, sel_stopObservingStateChanges);
  objc_msgSend_setDelegate_(self->_satelliteMonitor, v3, 0);
}

- (void)_buttonTapped
{
  uint64_t v2;
  const char *v4;
  uint64_t v5;

  if (objc_msgSend_state(self->_satelliteMonitor, a2, v2) == 2)
    objc_msgSend__openSOSBuddyApp(self, v4, v5);
}

- (void)buttonTapped:(id)a3
{
  id v4;
  NSObject *v5;
  const char *v6;
  uint64_t v7;
  objc_super v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = *MEMORY[0x24BE19AA0];
  if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_230FA3000, v5, OS_LOG_TYPE_DEFAULT, "[Satellite] button tapped", buf, 2u);
  }
  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivitySatelliteViewController;
  -[CCUIConnectivityButtonViewController buttonTapped:](&v8, sel_buttonTapped_, v4);
  objc_msgSend__buttonTapped(self, v6, v7);

}

- (id)_debugDescriptionForState:(BOOL)a3
{
  if (a3)
    return CFSTR("on");
  else
    return CFSTR("off");
}

- (void)setTemplateView:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  const char *v7;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)CCUIConnectivitySatelliteViewController;
  -[CCUIConnectivityButtonViewController setTemplateView:](&v8, sel_setTemplateView_, a3);
  v6 = objc_msgSend_state(self->_satelliteMonitor, v4, v5);
  objc_msgSend__updateState_(self, v7, v6);
}

- (BOOL)contentModuleDetailClickPresentationInteractionControllerInteractionShouldBegin:(id)a3
{
  return 1;
}

- (void)contentModuleDetailClickPresentationInteractionController:(id)a3 requestsAuthenticationForPresentationWithCompletionHandler:(id)a4
{
  const char *v5;
  uint64_t v6;
  id v7;
  void *v8;
  const char *v9;
  _QWORD v10[4];
  id v11;

  v7 = a4;
  if (v7)
  {
    objc_msgSend_contentModuleContext(self, v5, v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = sub_230FAFF64;
    v10[3] = &unk_24FFCA950;
    v11 = v7;
    objc_msgSend_requestAuthenticationWithCompletionHandler_(v8, v9, (uint64_t)v10);

  }
}

- (CCUIConnectivitySatelliteMonitor)satelliteMonitor
{
  return self->_satelliteMonitor;
}

- (void)setSatelliteMonitor:(id)a3
{
  objc_storeStrong((id *)&self->_satelliteMonitor, a3);
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (void)setQueue:(id)a3
{
  objc_storeStrong((id *)&self->_queue, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_satelliteMonitor, 0);
}

@end

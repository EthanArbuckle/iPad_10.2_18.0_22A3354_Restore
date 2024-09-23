@implementation CCUIConnectivityCellularModuleViewController

- (CCUIConnectivityCellularModuleViewController)initWithNibName:(id)a3 bundle:(id)a4
{
  CCUIConnectivityCellularModuleViewController *v4;
  const char *v5;
  CCUIConnectivityCellularModuleViewController *v6;
  const char *v7;
  const char *v8;
  const char *v9;
  const char *v10;
  const char *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  void *v22;
  const char *v23;
  void *v24;
  uint64_t v25;
  const char *v26;
  void *v27;
  const char *v28;
  void *v29;
  const char *v30;
  NSMutableDictionary *v31;
  NSMutableDictionary *simIndicatorCache;
  objc_super v34;

  v34.receiver = self;
  v34.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  v4 = -[CCUIAlwaysExpandedMenuModuleViewController initWithNibName:bundle:](&v34, sel_initWithNibName_bundle_, a3, a4);
  v6 = v4;
  if (v4)
  {
    objc_msgSend_setExpanded_(v4, v5, 1);
    objc_msgSend_setMinimumMenuItems_(v6, v7, 2);
    objc_msgSend_setShouldProvideOwnPlatter_(v6, v8, 1);
    objc_msgSend_setIndentation_(v6, v9, 2);
    objc_msgSend_setUseTrailingInset_(v6, v10, 1);
    objc_msgSend_setVisibleMenuItems_(v6, v11, v12, 2.0);
    v13 = (void *)MEMORY[0x24BDF6AC8];
    v14 = (void *)MEMORY[0x24BDD1488];
    v15 = objc_opt_class();
    objc_msgSend_bundleForClass_(v14, v16, v15);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageNamed_inBundle_(v13, v18, (uint64_t)CFSTR("CellularDataGlyph"), v17);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_imageFlippedForRightToLeftLayoutDirection(v19, v20, v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setGlyphImage_(v6, v23, (uint64_t)v22);

    v24 = (void *)MEMORY[0x24BDD1488];
    v25 = objc_opt_class();
    objc_msgSend_bundleForClass_(v24, v26, v25);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_localizedStringForKey_value_table_(v27, v28, (uint64_t)CFSTR("CONTROL_CENTER_STATUS_CELLULAR_DATA_NAME"), &stru_24FFCAEF8, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setTitle_(v6, v30, (uint64_t)v29);

    v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x24BDBCED8]);
    simIndicatorCache = v6->_simIndicatorCache;
    v6->_simIndicatorCache = v31;

  }
  return v6;
}

- (void)viewDidLoad
{
  const char *v3;
  _QWORD v4[5];
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  -[CCUIMenuModuleViewController viewDidLoad](&v5, sel_viewDidLoad);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = sub_230FADEC0;
  v4[3] = &unk_24FFCA830;
  v4[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], v3, (uint64_t)v4);
}

- (void)viewWillAppear:(BOOL)a3
{
  id v4;
  const char *v5;
  CoreTelephonyClient *v6;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v8;
  const char *v9;
  _QWORD v10[5];
  objc_super v11;

  v11.receiver = self;
  v11.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillAppear:](&v11, sel_viewWillAppear_, a3);
  v4 = objc_alloc(MEMORY[0x24BDC2810]);
  v6 = (CoreTelephonyClient *)objc_msgSend_initWithQueue_(v4, v5, MEMORY[0x24BDAC9B8]);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = v6;

  objc_msgSend_setDelegate_(self->_coreTelephonyClient, v8, (uint64_t)self);
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = sub_230FAE0F8;
  v10[3] = &unk_24FFCA830;
  v10[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], v9, (uint64_t)v10);
}

- (void)viewWillDisappear:(BOOL)a3
{
  const char *v4;
  CoreTelephonyClient *coreTelephonyClient;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)CCUIConnectivityCellularModuleViewController;
  -[CCUIAlwaysExpandedMenuModuleViewController viewWillDisappear:](&v6, sel_viewWillDisappear_, a3);
  objc_msgSend_setDelegate_(self->_coreTelephonyClient, v4, 0);
  coreTelephonyClient = self->_coreTelephonyClient;
  self->_coreTelephonyClient = 0;

}

- (id)indicatorForMenuItem:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  const char *v12;
  void *v13;

  v4 = a3;
  objc_msgSend_shortLabel(v4, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
  {
    objc_msgSend_objectForKeyedSubscript_(self->_simIndicatorCache, v7, (uint64_t)v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v10)
    {
      objc_msgSend_indicatorView(v4, v7, v8);
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setObject_forKeyedSubscript_(self->_simIndicatorCache, v12, (uint64_t)v11, v9);

    }
  }
  objc_msgSend_indicatorView(v4, v7, v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (id)trailingViewForMenuItem:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  CCUICellularMenuModuleItemTrailingView *v9;
  const char *v10;
  void *v11;
  const char *v12;
  const char *v13;

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
    v9 = objc_alloc_init(CCUICellularMenuModuleItemTrailingView);
    objc_msgSend_indicatorForMenuItem_(self, v10, (uint64_t)v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setContentMode_(v11, v12, 1);
    objc_msgSend_addSubview_(v9, v13, (uint64_t)v11);

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (void)_updateCellularMenuItems
{
  uint64_t v2;
  void *v4;
  CoreTelephonyClient *coreTelephonyClient;
  const char *v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  const char *v19;
  uint64_t v20;
  const char *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t i;
  void *v25;
  void *v26;
  const char *v27;
  uint64_t v28;
  void *v29;
  const char *v30;
  uint64_t v31;
  uint64_t v32;
  const char *v33;
  const char *v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  id v39;
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  objc_msgSend_array(MEMORY[0x24BDBCEB8], a2, v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  coreTelephonyClient = self->_coreTelephonyClient;
  v39 = 0;
  objc_msgSend_getSubscriptionInfoWithError_(coreTelephonyClient, v6, (uint64_t)&v39);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v39;
  if (v10)
  {
    v11 = *MEMORY[0x24BE19AA0];
    if (os_log_type_enabled((os_log_t)*MEMORY[0x24BE19AA0], OS_LOG_TYPE_ERROR))
      sub_230FB3254((uint64_t)v10, v11, v12, v13, v14, v15, v16, v17);
  }
  else
  {
    if (v7)
    {
      v37 = 0u;
      v38 = 0u;
      v35 = 0u;
      v36 = 0u;
      objc_msgSend_subscriptionsInUse(v7, v8, v9, 0);
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v35, v40, 16);
      if (v20)
      {
        v22 = v20;
        v23 = *(_QWORD *)v36;
        do
        {
          for (i = 0; i != v22; ++i)
          {
            if (*(_QWORD *)v36 != v23)
              objc_enumerationMutation(v18);
            v25 = *(void **)(*((_QWORD *)&v35 + 1) + 8 * i);
            objc_msgSend__menuItemForCellularPlan_(self, v21, (uint64_t)v25);
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend_userDataPreferred(v25, v27, v28);
            v29 = (void *)objc_claimAutoreleasedReturnValue();
            v32 = objc_msgSend_BOOLValue(v29, v30, v31);
            objc_msgSend_setSelected_(v26, v33, v32);

            if (v26)
              objc_msgSend_addObject_(v4, v34, (uint64_t)v26);

          }
          v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v35, v40, 16);
        }
        while (v22);
      }

    }
    objc_msgSend_setMenuItems_(self, v8, (uint64_t)v4);
  }

}

- (id)_menuItemForCellularPlan:(id)a3
{
  id v4;
  const char *v5;
  void *v6;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  CCUICellularMenuModuleItem *v13;
  id v14;
  const char *v15;
  void *v16;
  const char *v17;
  void *v18;
  const char *v19;
  _QWORD v21[4];
  id v22;
  id v23;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  objc_msgSend_getSubscriptionUserFacingName_error_(self->_coreTelephonyClient, v5, (uint64_t)v4, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_uuid(v4, v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_UUIDString(v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  v13 = [CCUICellularMenuModuleItem alloc];
  v21[0] = MEMORY[0x24BDAC760];
  v21[1] = 3221225472;
  v21[2] = sub_230FAE624;
  v21[3] = &unk_24FFCA8C0;
  objc_copyWeak(&v23, &location);
  v14 = v4;
  v22 = v14;
  v16 = (void *)objc_msgSend_initWithTitle_identifier_handler_(v13, v15, (uint64_t)v6, v12, v21);
  objc_msgSend_getShortLabel_error_(self->_coreTelephonyClient, v17, (uint64_t)v14, 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setShortLabel_(v16, v19, (uint64_t)v18);

  objc_destroyWeak(&v23);
  objc_destroyWeak(&location);

  return v16;
}

- (void)activeSubscriptionsDidChange
{
  _QWORD v2[5];

  v2[0] = MEMORY[0x24BDAC760];
  v2[1] = 3221225472;
  v2[2] = sub_230FAE794;
  v2[3] = &unk_24FFCA830;
  v2[4] = self;
  objc_msgSend_performWithoutAnimation_(MEMORY[0x24BDF6F90], a2, (uint64_t)v2);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_simIndicatorCache, 0);
  objc_storeStrong((id *)&self->_coreTelephonyClient, 0);
}

@end

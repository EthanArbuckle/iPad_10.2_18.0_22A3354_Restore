@implementation AXCCTextSizeHelper

- (AXCCTextSizeHelper)init
{
  AXCCTextSizeHelper *v2;
  uint64_t v3;
  NSString *categoryName;
  uint64_t v5;
  NSMutableArray *apps;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)AXCCTextSizeHelper;
  v2 = -[AXCCTextSizeHelper init](&v8, sel_init);
  if (v2)
  {
    v3 = _AXSCopyPreferredContentSizeCategoryNameGlobal();
    categoryName = v2->_categoryName;
    v2->_categoryName = (NSString *)v3;

    v5 = objc_opt_new();
    apps = v2->_apps;
    v2->_apps = (NSMutableArray *)v5;

    v2->_state = 3;
  }
  return v2;
}

- (NSString)categoryName
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  NSString *v8;

  if (self->_state == 3
    || (objc_msgSend__selectedAppSafely(self, a2, v2, v3),
        v5 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend_objectForKey_(v5, v6, (uint64_t)CFSTR("categoryName"), v7),
        v8 = (NSString *)objc_claimAutoreleasedReturnValue(),
        v5,
        !v8))
  {
    v8 = self->_categoryName;
  }
  return v8;
}

- (void)setCategoryName:(id)a3
{
  const char *v5;
  uint64_t v6;
  char *v7;

  v5 = (const char *)a3;
  v7 = (char *)v5;
  if (self->_state == 3)
  {
    _AXSSetPreferredContentSizeCategoryName();
    objc_storeStrong((id *)&self->_categoryName, a3);
  }
  else
  {
    objc_msgSend__setPerAppCategoryName_(self, v5, (uint64_t)v5, v6);
  }

}

- (BOOL)isPerAppAvailable
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_apps, a2, v2, v3) != 0;
}

- (void)setState:(int)a3
{
  uint64_t v3;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  id WeakRetained;

  if (objc_msgSend_isPerAppAvailable(self, a2, *(uint64_t *)&a3, v3) && self->_state != a3)
  {
    self->_state = a3;
    if (a3 == 3)
      objc_msgSend__resetAllPerAppCategoryNames(self, v6, v7, v8);
    WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
    objc_msgSend_perAppTextSizeToggled(WeakRetained, v9, v10, v11);

  }
}

- (BOOL)canSelectApps
{
  uint64_t v2;
  uint64_t v3;

  return (unint64_t)objc_msgSend_count(self->_apps, a2, v2, v3) > 1;
}

- (int64_t)appsNumber
{
  uint64_t v2;
  uint64_t v3;

  return objc_msgSend_count(self->_apps, a2, v2, v3);
}

- (NSArray)appsNames
{
  void *v3;
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_apps;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend_valueForKey_(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v11), v7, (uint64_t)CFSTR("name"), v8, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v13, (uint64_t)v12, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (NSArray)appsIdentifiers
{
  void *v3;
  NSMutableArray *v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v3 = (void *)objc_opt_new();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v4 = self->_apps;
  v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v6)
  {
    v9 = v6;
    v10 = *(_QWORD *)v17;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v17 != v10)
          objc_enumerationMutation(v4);
        objc_msgSend_valueForKey_(*(void **)(*((_QWORD *)&v16 + 1) + 8 * v11), v7, (uint64_t)CFSTR("appID"), v8, (_QWORD)v16);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend_addObject_(v3, v13, (uint64_t)v12, v14);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v16, (uint64_t)v20, 16);
    }
    while (v9);
  }

  return (NSArray *)v3;
}

- (NSString)appName
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  const char *v5;
  uint64_t v6;
  void *v7;

  objc_msgSend__selectedAppSafely(self, a2, v2, v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v4, v5, (uint64_t)CFSTR("name"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (void)refreshAppInfo
{
  uint64_t v2;
  uint64_t v3;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  NSMutableArray *v8;
  const char *v9;
  uint64_t v10;
  const char *v11;
  uint64_t v12;
  uint64_t v13;
  int v14;
  uint64_t v15;
  uint64_t v16;
  int v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  objc_msgSend__refreshForegroundAppInfo(self, a2, v2, v3);
  objc_msgSend__refreshPerAppCategoryName(self, v5, v6, v7);
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = self->_apps;
  v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v10)
  {
    v13 = v10;
    v14 = 0;
    v15 = *(_QWORD *)v20;
    while (2)
    {
      v16 = 0;
      v17 = v14 + v13;
      do
      {
        if (*(_QWORD *)v20 != v15)
          objc_enumerationMutation(v8);
        objc_msgSend_valueForKey_(*(void **)(*((_QWORD *)&v19 + 1) + 8 * v16), v11, (uint64_t)CFSTR("categoryName"), v12, (_QWORD)v19);
        v18 = (void *)objc_claimAutoreleasedReturnValue();

        if (v18)
        {
          self->_state = v14 + v16;
          goto LABEL_11;
        }
        ++v16;
      }
      while (v13 != v16);
      v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v19, (uint64_t)v23, 16);
      v14 = v17;
      if (v13)
        continue;
      break;
    }
  }
LABEL_11:

}

- (void)refreshCategoryName
{
  uint64_t v2;
  uint64_t v3;
  NSString *v5;
  NSString *categoryName;

  objc_msgSend__refreshPerAppCategoryName(self, a2, v2, v3);
  v5 = (NSString *)_AXSCopyPreferredContentSizeCategoryNameGlobal();
  categoryName = self->_categoryName;
  self->_categoryName = v5;

}

- (BOOL)_isHiddenBundleIdentifier:(id)a3
{
  return ((uint64_t (*)(void *, char *, id))MEMORY[0x24BEDD108])(&unk_24FFC8840, sel_containsObject_, a3);
}

- (void)_refreshForegroundAppInfo
{
  uint64_t v2;
  uint64_t v3;
  void (*v4)(void);
  const char *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  id v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  const char *v21;
  uint64_t v22;
  char isHiddenBundleIdentifier;
  id v24;
  const char *v25;
  uint64_t v26;
  uint64_t v27;
  void *v28;
  const char *v29;
  void *v30;
  const char *v31;
  uint64_t v32;
  uint64_t v33;
  void *v34;
  id v35;
  const char *v36;
  uint64_t v37;
  uint64_t v38;
  void *v39;
  const char *v40;
  uint64_t v41;
  uint64_t v42;
  void *v43;
  const char *v44;
  void *v45;
  const char *v46;
  NSObject *v47;
  const char *v48;
  uint64_t v49;
  const char *v50;
  uint64_t v51;
  uint64_t v52;
  id v53;
  void *v54;
  const char *v55;
  void *v56;
  const char *v57;
  void *v58;
  const char *v59;
  uint64_t v60;
  void *v61;
  const char *v62;
  uint64_t v63;
  uint64_t v64;
  const char *v65;
  uint64_t v66;
  uint64_t v67;
  _BOOL4 v68;
  NSObject *v69;
  const char *v70;
  uint64_t v71;
  uint64_t v72;
  _QWORD *v73;
  id obj;
  id v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  uint64_t v81;
  uint64_t *v82;
  uint64_t v83;
  void *v84;
  _QWORD v85[2];
  _QWORD v86[2];
  _BYTE v87[128];
  _QWORD v88[8];

  v88[6] = *MEMORY[0x24BDAC8D0];
  objc_msgSend_removeAllObjects(self->_apps, a2, v2, v3);
  v81 = 0;
  v82 = &v81;
  v83 = 0x2020000000;
  v4 = (void (*)(void))off_255EAF000;
  v84 = off_255EAF000;
  if (!off_255EAF000)
  {
    v88[0] = MEMORY[0x24BDAC760];
    v88[1] = 3221225472;
    v88[2] = sub_230F831A4;
    v88[3] = &unk_24FFC4420;
    v88[4] = &v81;
    sub_230F831A4((uint64_t)v88);
    v4 = (void (*)(void))v82[3];
  }
  _Block_object_dispose(&v81, 8);
  if (!v4)
  {
    sub_230F8C45C();
    __break(1u);
  }
  v4();
  obj = (id)objc_claimAutoreleasedReturnValue();
  v79 = 0u;
  v80 = 0u;
  v77 = 0u;
  v78 = 0u;
  v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v77, (uint64_t)v87, 16);
  if (v9)
  {
    v10 = *(_QWORD *)v78;
    v73 = (_QWORD *)((char *)v88 + 4);
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v78 != v10)
          objc_enumerationMutation(obj);
        v12 = *(void **)(*((_QWORD *)&v77 + 1) + 8 * i);
        objc_msgSend_bundleIdentifier(v12, v6, v7, v8, v73);
        v16 = (id)objc_claimAutoreleasedReturnValue();
        if (v16 && objc_msgSend_isForeground(v12, v13, v14, v15))
        {
          objc_msgSend_bundleIdentifier(v12, v17, v18, v19);
          v20 = (void *)objc_claimAutoreleasedReturnValue();
          isHiddenBundleIdentifier = objc_msgSend__isHiddenBundleIdentifier_(self, v21, (uint64_t)v20, v22);

          if ((isHiddenBundleIdentifier & 1) != 0)
            continue;
          v24 = objc_alloc(MEMORY[0x24BDC1540]);
          objc_msgSend_bundleIdentifier(v12, v25, v26, v27);
          v28 = (void *)objc_claimAutoreleasedReturnValue();
          v76 = 0;
          v30 = (void *)objc_msgSend_initWithBundleIdentifier_allowPlaceholder_error_(v24, v29, (uint64_t)v28, 0, &v76);
          v16 = v76;

          objc_msgSend_localizedName(v30, v31, v32, v33);
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          LODWORD(v28) = v34 == 0;

          if ((_DWORD)v28)
          {
            AXLogCommon();
            v47 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_ERROR))
              sub_230F8C4BC((uint8_t *)v88, v16, v73, v47);
          }
          else
          {
            v35 = objc_alloc(MEMORY[0x24BDBCED8]);
            objc_msgSend_bundleIdentifier(v12, v36, v37, v38);
            v39 = (void *)objc_claimAutoreleasedReturnValue();
            v86[0] = v39;
            objc_msgSend_localizedName(v30, v40, v41, v42);
            v43 = (void *)objc_claimAutoreleasedReturnValue();
            v86[1] = v43;
            objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v44, (uint64_t)v86, 2);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v47 = objc_msgSend_initWithObjects_forKeys_(v35, v46, (uint64_t)v45, (uint64_t)&unk_24FFC8858);

            objc_msgSend_addObject_(self->_apps, v48, (uint64_t)v47, v49);
          }

        }
      }
      v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v77, (uint64_t)v87, 16);
    }
    while (v9);
  }
  if (!objc_msgSend_count(self->_apps, v6, v7, v8))
  {
    v53 = objc_alloc(MEMORY[0x24BDBCED8]);
    v85[0] = CFSTR("com.apple.springboard");
    AXCCLocalizedString(CFSTR("home.screen"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    v85[1] = v54;
    objc_msgSend_arrayWithObjects_count_(MEMORY[0x24BDBCE30], v55, (uint64_t)v85, 2);
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    v58 = (void *)objc_msgSend_initWithObjects_forKeys_(v53, v57, (uint64_t)v56, (uint64_t)&unk_24FFC8870);

    objc_msgSend_addObject_(self->_apps, v59, (uint64_t)v58, v60);
  }
  objc_msgSend_currentDevice(MEMORY[0x24BEBD538], v50, v51, v52);
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_userInterfaceIdiom(v61, v62, v63, v64))
  {

  }
  else
  {
    v68 = (unint64_t)objc_msgSend_count(self->_apps, v65, v66, v67) > 1;

    if (v68)
    {
      AXLogCommon();
      v69 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_ERROR))
        sub_230F8C47C(v69);

      objc_msgSend_removeAllObjects(self->_apps, v70, v71, v72);
    }
  }

}

- (void)_refreshPerAppCategoryName
{
  NSMutableArray *v2;
  const char *v3;
  uint64_t v4;
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  void *v11;
  const char *v12;
  uint64_t v13;
  void *v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v2 = self->_apps;
  v4 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v3, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v4)
  {
    v7 = v4;
    v8 = *(_QWORD *)v16;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v16 != v8)
          objc_enumerationMutation(v2);
        v10 = *(void **)(*((_QWORD *)&v15 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v10, v5, (uint64_t)CFSTR("appID"), v6, (_QWORD)v15);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)_AXSCopyPreferredContentSizeCategoryNameApp();
        if (v14)
          objc_msgSend_setValue_forKey_(v10, v12, (uint64_t)v14, (uint64_t)CFSTR("categoryName"));
        else
          objc_msgSend_removeObjectForKey_(v10, v12, (uint64_t)CFSTR("categoryName"), v13);

      }
      v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v2, v5, (uint64_t)&v15, (uint64_t)v19, 16);
    }
    while (v7);
  }

}

- (id)_selectedAppSafely
{
  uint64_t v2;
  uint64_t v3;
  void *v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t state;
  uint64_t v10;
  const char *v11;
  uint64_t v12;

  v5 = (void *)objc_msgSend_count(self->_apps, a2, v2, v3);
  if (v5)
  {
    state = self->_state;
    if ((_DWORD)state == 3)
    {
      v5 = 0;
    }
    else
    {
      v10 = objc_msgSend_count(self->_apps, v6, v7, v8);
      if (v10 - 1 >= state)
        objc_msgSend_objectAtIndexedSubscript_(self->_apps, v11, state, v12);
      else
        objc_msgSend_objectAtIndexedSubscript_(self->_apps, v11, v10 - 1, v12);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }
  return v5;
}

- (void)_setPerAppCategoryName:(id)a3
{
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  const char *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  const char *v12;
  const char *v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  const char *v17;
  uint64_t v18;
  uint64_t v19;
  char *v20;

  v20 = (char *)a3;
  objc_msgSend__selectedAppSafely(self, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v7, v8, (uint64_t)CFSTR("appID"), v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  _AXSSetPreferredContentSizeCategoryNameApp();
  if (v20)
    objc_msgSend_setValue_forKey_(v7, v20, (uint64_t)v20, (uint64_t)CFSTR("categoryName"));
  else
    objc_msgSend_removeObjectForKey_(v7, 0, (uint64_t)CFSTR("categoryName"), v11);
  objc_msgSend__updateSavedAppID_categoryName_(self, v12, (uint64_t)v10, (uint64_t)v20);
  objc_msgSend_sharedInstance(MEMORY[0x24BE006C0], v13, v14, v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aggregatePerAppSettingsStatistics(v16, v17, v18, v19);

}

- (void)_resetAllPerAppCategoryNames
{
  NSMutableArray *v3;
  const char *v4;
  uint64_t v5;
  const char *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  const char *v13;
  uint64_t v14;
  const char *v15;
  const char *v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  const char *v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v3 = self->_apps;
  v5 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v4, (uint64_t)&v23, (uint64_t)v27, 16);
  if (v5)
  {
    v8 = v5;
    v9 = *(_QWORD *)v24;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v24 != v9)
          objc_enumerationMutation(v3);
        v11 = *(void **)(*((_QWORD *)&v23 + 1) + 8 * i);
        objc_msgSend_objectForKey_(v11, v6, (uint64_t)CFSTR("appID"), v7, (_QWORD)v23);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        _AXSSetPreferredContentSizeCategoryNameApp();
        objc_msgSend_removeObjectForKey_(v11, v13, (uint64_t)CFSTR("categoryName"), v14);
        objc_msgSend__updateSavedAppID_categoryName_(self, v15, (uint64_t)v12, 0);

      }
      v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v3, v6, (uint64_t)&v23, (uint64_t)v27, 16);
    }
    while (v8);
  }

  objc_msgSend_sharedInstance(MEMORY[0x24BE006C0], v16, v17, v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_aggregatePerAppSettingsStatistics(v19, v20, v21, v22);

}

- (void)_updateSavedAppID:(id)a3 categoryName:(id)a4
{
  const char *v5;
  uint64_t v6;
  uint64_t v7;
  id v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  void *v12;
  id v13;

  v13 = a3;
  v8 = a4;
  if (v13)
  {
    objc_msgSend_sharedInstance(MEMORY[0x24BE006C0], v5, v6, v7);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = v9;
    if (v8)
      objc_msgSend_addCustomizedAppID_(v9, v10, (uint64_t)v13, v11);
    else
      objc_msgSend_removeCustomizedAppID_(v9, v10, (uint64_t)v13, v11);

  }
}

- (int)state
{
  return self->_state;
}

- (AXCCTextSizeDelegate)delegate
{
  return (AXCCTextSizeDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_apps, 0);
  objc_storeStrong((id *)&self->_categoryName, 0);
}

@end

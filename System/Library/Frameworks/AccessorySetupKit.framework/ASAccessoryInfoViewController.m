@implementation ASAccessoryInfoViewController

- (ASAccessoryInfoViewController)init
{
  ASAccessoryInfoViewController *v2;
  ASAccessoryInfoViewController *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ASAccessoryInfoViewController;
  v2 = -[ASAccessoryInfoViewController init](&v5, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_useAsHeader = 0;
    v2->_supportsWAPI = MGGetBoolAnswer();
    v3->_didDismiss = 0;
  }
  return v3;
}

- (ASAccessoryInfoViewController)initWithDevice:(id)a3
{
  id v5;
  ASAccessoryInfoViewController *v6;
  DASession *v7;
  DASession *session;
  void *v9;
  void *v10;
  void *v11;
  ASAccessoryInfoViewController *v12;
  ASAccessoryInfoViewController *v13;
  _QWORD v15[4];
  ASAccessoryInfoViewController *v16;
  objc_super v17;

  v5 = a3;
  if (v5)
  {
    v17.receiver = self;
    v17.super_class = (Class)ASAccessoryInfoViewController;
    v6 = -[ASAccessoryInfoViewController init](&v17, sel_init);
    v7 = (DASession *)objc_alloc_init(MEMORY[0x24BE2BEF8]);
    session = v6->_session;
    v6->_session = v7;

    objc_msgSend(v5, "appAccessInfoMap");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "allKeys");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "firstObject");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[DASession setBundleID:](v6->_session, "setBundleID:", v11);

    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __48__ASAccessoryInfoViewController_initWithDevice___block_invoke;
    v15[3] = &unk_25041FA78;
    v12 = v6;
    v16 = v12;
    -[DASession setEventHandler:](v6->_session, "setEventHandler:", v15);
    -[DASession activate](v6->_session, "activate");
    objc_storeStrong((id *)&v12->_device, a3);
    v12->_useAsHeader = 1;
    self = v12;

    v13 = self;
  }
  else
  {
    v13 = 0;
  }

  return v13;
}

uint64_t __48__ASAccessoryInfoViewController_initWithDevice___block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDAEvent:", a2);
}

- (void)viewWillAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ASAccessoryInfoViewController;
  -[ASAccessoryInfoViewController viewWillAppear:](&v3, sel_viewWillAppear_, a3);
}

- (CGSize)preferredContentSize
{
  double v3;
  double v4;
  double v5;
  void *v6;
  double v7;
  double v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  CGSize result;

  +[ASAccessoryInfoHeaderCell headerHeight](ASAccessoryInfoHeaderCell, "headerHeight");
  v4 = v3 + 0.0 + 44.0 + 24.0 + 44.0 + 24.0;
  if (!self->_useAsHeader)
  {
    v5 = v4 + 24.0;
    -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v5 + (double)(unint64_t)(44 * objc_msgSend(v6, "count"));

    v4 = v7 + 100.0 + 24.0 + 44.0;
  }
  v8 = v4 + 24.0 + 44.0 + 24.0;
  -[ASAccessoryInfoViewController view](self, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "bounds");
  v11 = v10;

  v12 = v11;
  v13 = v8;
  result.height = v13;
  result.width = v12;
  return result;
}

- (BOOL)shouldReloadSpecifiersOnResume
{
  return 0;
}

- (id)specifiers
{
  void *v2;
  DADevice *v5;
  DADevice *device;
  DASession *v7;
  DASession *session;
  void *v9;
  void *v10;
  void *v11;
  Class PSSpecifierClass;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  Class v21;
  Class v22;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  _BOOL4 supportsWAPI;
  void *v39;
  void *v40;
  const __CFString *v41;
  void *v42;
  _BOOL4 v43;
  void *v44;
  const __CFString *v45;
  uint64_t v46;
  __objc2_class **p_superclass;
  void *v48;
  void *v49;
  void *v50;
  __objc2_class **v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  Class (__cdecl *v56)();
  Class v57;
  void *v58;
  void *v59;
  void *v60;
  objc_class *v61;
  void *v62;
  id v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  _QWORD v70[5];
  _QWORD v71[3];

  v71[2] = *MEMORY[0x24BDAC8D0];
  v2 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E8]);
  if (v2)
    return v2;
  v69 = (int)*MEMORY[0x24BE756E8];
  if (!self->_device)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757B0]), "propertyForKey:", CFSTR("device"));
    v5 = (DADevice *)objc_claimAutoreleasedReturnValue();
    device = self->_device;
    self->_device = v5;

    v7 = (DASession *)objc_alloc_init(MEMORY[0x24BE2BEF8]);
    session = self->_session;
    self->_session = v7;

    v70[0] = MEMORY[0x24BDAC760];
    v70[1] = 3221225472;
    v70[2] = __43__ASAccessoryInfoViewController_specifiers__block_invoke;
    v70[3] = &unk_25041FA78;
    v70[4] = self;
    -[DASession setEventHandler:](self->_session, "setEventHandler:", v70);
    -[DASession activate](self->_session, "activate");
  }
  -[ASAccessoryInfoViewController setTitle:](self, "setTitle:", 0);
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoViewController specifiersForHeader](self, "specifiersForHeader");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "addObjectsFromArray:", v10);

  -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](getPSSpecifierClass(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 0, 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setIdentifier:", CFSTR("rename"));
  v68 = v11;
  objc_msgSend(v9, "addObject:", v11);
  PSSpecifierClass = getPSSpecifierClass();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "localizedStringForKey:value:table:", CFSTR("Name"), &stru_250420148, 0);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](PSSpecifierClass, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, sel_deviceName_, objc_opt_class(), 2, 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v15, "setProperty:forKey:", self->_device, CFSTR("device"));
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "allKeys");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "firstObject");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "setProperty:forKey:", v18, CFSTR("bundleID"));

  v67 = v15;
  objc_msgSend(v9, "addObject:", v15);
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  -[ASAccessoryInfoViewController specifiersForApps:](self, "specifiersForApps:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v15) = self->_useAsHeader;
  v21 = getPSSpecifierClass();
  v22 = v21;
  v66 = v20;
  if (!(_DWORD)v15)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "localizedStringForKey:value:table:", CFSTR("App Access Header"), &stru_250420148, 0);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](v22, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, self, 0, 0, 0, 0, 0);
    v34 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v34, "setIdentifier:", CFSTR("appAccess"));
    -[DADevice bluetoothIdentifier](self->_device, "bluetoothIdentifier");
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    if (v35)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "localizedStringForKey:value:table:", CFSTR("App Access Footer Bluetooth"), &stru_250420148, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      -[DADevice SSID](self->_device, "SSID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();

      if (v37)
      {
        supportsWAPI = self->_supportsWAPI;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v39;
        if (supportsWAPI)
          v41 = CFSTR("App Access Footer Bluetooth And WLAN");
        else
          v41 = CFSTR("App Access Footer Bluetooth And WiFi");
        objc_msgSend(v39, "localizedStringForKey:value:table:", v41, &stru_250420148, 0);
        v46 = objc_claimAutoreleasedReturnValue();

        v24 = (void *)v46;
LABEL_21:
        p_superclass = ASAccessorySession.superclass;

        goto LABEL_22;
      }
    }
    else
    {
      -[DADevice SSID](self->_device, "SSID");
      v42 = (void *)objc_claimAutoreleasedReturnValue();

      if (v42)
      {
        v43 = self->_supportsWAPI;
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        v40 = v44;
        if (v43)
          v45 = CFSTR("App Access Footer WLAN");
        else
          v45 = CFSTR("App Access Footer WiFi");
        objc_msgSend(v44, "localizedStringForKey:value:table:", v45, &stru_250420148, 0);
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        goto LABEL_21;
      }
      v24 = 0;
    }
    p_superclass = (__objc2_class **)(ASAccessorySession + 8);
LABEL_22:
    objc_msgSend(v34, "setObject:forKeyedSubscript:", v24, *MEMORY[0x24BE75A70]);
    objc_msgSend(v9, "addObject:", v34);
    objc_msgSend(v9, "addObjectsFromArray:", v20);
    -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](((Class (__cdecl *)())p_superclass[266])(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 0, 0);
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "setIdentifier:", CFSTR("appLink"));
    objc_msgSend(v9, "addObject:", v29);
    objc_msgSend(v20, "firstObject");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    v48 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v49, "localizedStringForKey:value:table:", CFSTR("Open App"), &stru_250420148, 0);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "name");
    v65 = v34;
    v51 = p_superclass;
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v48, "stringWithFormat:", v50, v52);
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](((Class (__cdecl *)())v51[266])(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v64, self, 0, 0, 0, 13, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "propertyForKey:", CFSTR("bundleID"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "setProperty:forKey:", v54, CFSTR("bundleID"));

    objc_msgSend(v53, "setButtonAction:", sel_openApp_);
    objc_msgSend(v9, "addObject:", v53);
    -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](((Class (__cdecl *)())v51[266])(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 0, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "setIdentifier:", CFSTR("manage"));
    v56 = (Class (__cdecl *)())v51[266];
    v23 = v65;
    v57 = v56();
    +[ASAccessoryInfoViewFactory forgetDeviceButtonTitle](ASAccessoryInfoViewFactory, "forgetDeviceButtonTitle");
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](v57, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v58, self, 0, 0, 0, 13, 0);
    v59 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v59, "setButtonAction:", sel_forgetDevice_);
    v71[0] = v55;
    v71[1] = v59;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v71, 2);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObjectsFromArray:", v60);

    goto LABEL_23;
  }
  -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](v21, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 0, 0);
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setIdentifier:", CFSTR("appLink"));
  objc_msgSend(v9, "addObject:", v23);
  objc_msgSend(v20, "firstObject");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  v25 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "localizedStringForKey:value:table:", CFSTR("Open App"), &stru_250420148, 0);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "name");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "stringWithFormat:", v27, v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](getPSSpecifierClass(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, self, 0, 0, 0, 13, 0);
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "propertyForKey:", CFSTR("bundleID"));
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v30, "setProperty:forKey:", v31, CFSTR("bundleID"));

  objc_msgSend(v30, "setButtonAction:", sel_openApp_);
  objc_msgSend(v9, "addObject:", v30);
LABEL_23:

  v61 = (objc_class *)objc_msgSend(v9, "copy");
  v62 = *(Class *)((char *)&self->super.super.super.super.super.isa + v69);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v69) = v61;

  v63 = *(id *)((char *)&self->super.super.super.super.super.isa + v69);
  return v63;
}

uint64_t __43__ASAccessoryInfoViewController_specifiers__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "handleDAEvent:", a2);
}

- (id)specifiersForHeader
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x24BDAC8D0];
  -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](getPSSpecifierClass(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", 0, self, 0, 0, 0, 0, 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](getPSSpecifierClass(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", &stru_250420148, self, 0, 0, 0, -1, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setUserInfo:", self->_device);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", objc_opt_class(), *MEMORY[0x24BE75940]);
  objc_msgSend(v4, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C0], *MEMORY[0x24BE75A20]);
  v7[0] = v3;
  v7[1] = v4;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)specifiersForApps:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v14;
  id obj;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v14 = v3;
  objc_msgSend(v3, "allKeys");
  obj = (id)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v5)
  {
    v6 = v5;
    v17 = *MEMORY[0x24BE75B90];
    v18 = *(_QWORD *)v21;
    v16 = *MEMORY[0x24BE75B78];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v21 != v18)
          objc_enumerationMutation(obj);
        v8 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v7);
        v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDC1540]), "initWithBundleIdentifier:allowPlaceholder:error:", v8, 1, 0);
        objc_msgSend(v9, "localizedName");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[objc_class preferenceSpecifierNamed:target:set:get:detail:cell:edit:](getPSSpecifierClass(), "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v10, self, sel_setAppAllowed_specifier_, sel_isAppAllowed_, 0, 6, 0);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "setProperty:forKey:", v12, v17);

        objc_msgSend(v11, "setProperty:forKey:", v8, v16);
        objc_msgSend(v11, "setProperty:forKey:", v8, CFSTR("bundleID"));
        objc_msgSend(v4, "addObject:", v11);

        ++v7;
      }
      while (v6 != v7);
      v6 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v6);
  }

  objc_msgSend(v4, "sortUsingComparator:", &__block_literal_global_179);
  return v4;
}

uint64_t __51__ASAccessoryInfoViewController_specifiersForApps___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a2, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v5, "compare:", v6);
  return v7;
}

- (void)setAppAllowed:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  id v10;

  v6 = a3;
  objc_msgSend(a4, "propertyForKey:", CFSTR("bundleID"));
  v10 = (id)objc_claimAutoreleasedReturnValue();
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  LODWORD(v7) = objc_msgSend(v6, "BOOLValue");
  if ((_DWORD)v7)
    v9 = 25;
  else
    v9 = 28;
  objc_msgSend(v8, "setState:", v9);
  -[DASession setDeviceAppAccessInfo:device:completionHandler:](self->_session, "setDeviceAppAccessInfo:device:completionHandler:", v8, self->_device, &__block_literal_global_180);

}

- (id)deviceName:(id)a3
{
  return (id)-[DADevice name](self->_device, "name", a3);
}

- (id)isAppAllowed:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  _BOOL8 v8;
  void *v9;

  objc_msgSend(a3, "propertyForKey:", CFSTR("bundleID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DADevice appAccessInfoMap](self->_device, "appAccessInfoMap");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = (void *)MEMORY[0x24BDD16E0];
  v8 = objc_msgSend(v6, "state") == 20 || objc_msgSend(v6, "state") == 25;
  objc_msgSend(v7, "numberWithInt:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (void)linkToBluetooth:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=Bluetooth"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)linkToWiFi:(id)a3
{
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x24BDC1548], "defaultWorkspace", a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("prefs:root=WIFI"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "openSensitiveURL:withOptions:", v3, 0);

}

- (void)openApp:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  id v6;

  v3 = (void *)MEMORY[0x24BDC1548];
  v4 = a3;
  objc_msgSend(v3, "defaultWorkspace");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("bundleID"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "openApplicationWithBundleID:", v5);
}

- (void)forgetDevice:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[5];

  v4 = (void *)MEMORY[0x24BEBD3B0];
  +[ASAccessoryInfoViewFactory forgetDeviceAlertTitle](ASAccessoryInfoViewFactory, "forgetDeviceAlertTitle", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[ASAccessoryInfoViewFactory forgetDeviceAlertBody](ASAccessoryInfoViewFactory, "forgetDeviceAlertBody");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "alertControllerWithTitle:message:preferredStyle:", v5, v6, 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (void *)MEMORY[0x24BEBD3A8];
  +[ASAccessoryInfoViewFactory forgetDeviceAlertConfirm](ASAccessoryInfoViewFactory, "forgetDeviceAlertConfirm");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __46__ASAccessoryInfoViewController_forgetDevice___block_invoke;
  v14[3] = &unk_25041FB00;
  v14[4] = self;
  objc_msgSend(v8, "actionWithTitle:style:handler:", v9, 2, v14);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  v11 = (void *)MEMORY[0x24BEBD3A8];
  +[ASAccessoryInfoViewFactory forgetDeviceAlertCancel](ASAccessoryInfoViewFactory, "forgetDeviceAlertCancel");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionWithTitle:style:handler:", v12, 0, 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "addAction:", v10);
  objc_msgSend(v7, "addAction:", v13);
  -[ASAccessoryInfoViewController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v7, 1, 0);

}

void __46__ASAccessoryInfoViewController_forgetDevice___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  id v11;

  v2 = objc_alloc_init(MEMORY[0x24BE2BEF8]);
  objc_msgSend(v2, "setBundleID:", CFSTR("com.apple.Preferences"));
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 1384), "appAccessInfoMap");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "allValues");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "firstObject");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "setState:", 0);
  v6 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 1384);
  v11 = 0;
  objc_msgSend(MEMORY[0x24BE2BEF8], "setDeviceAppAccessInfo:device:session:error:", v5, v6, v2, &v11);
  v7 = v11;
  if (v7
    && gLogCategory_ASAccessoryInfoView <= 90
    && (gLogCategory_ASAccessoryInfoView != -1 || _LogCategory_Initialize()))
  {
    v10 = v7;
    LogPrintF();
  }
  *(_BYTE *)(*(_QWORD *)(a1 + 32) + 1409) = 1;
  objc_msgSend(*(id *)(a1 + 32), "navigationController", v10);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (id)objc_msgSend(v8, "popViewControllerAnimated:", 1);

}

- (void)handleDAEvent:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  DADevice *v11;
  DADevice *device;
  void *v13;
  uint64_t *v14;
  id v15;
  void *v16;
  void *v17;
  int v18;
  uint64_t v19;
  uint64_t v20;

  v4 = a3;
  v5 = objc_msgSend(v4, "eventType");
  if (v5 == 41)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && !self->_didDismiss)
    {
      v15 = v4;
      -[DADevice identifier](self->_device, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "device");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v16, "identifier");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "isEqualToString:", v7);

      if (v18)
      {
        self->_didDismiss = 1;
        v19 = MEMORY[0x24BDAC760];
        v13 = __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke_2;
        v14 = &v19;
        goto LABEL_10;
      }
LABEL_11:

    }
  }
  else if (v5 == 42)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v6 = v4;
      -[DADevice identifier](self->_device, "identifier");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "device");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "identifier");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "isEqualToString:", v7);

      if (v10)
      {
        objc_msgSend(v6, "device");
        v11 = (DADevice *)objc_claimAutoreleasedReturnValue();
        device = self->_device;
        self->_device = v11;

        v20 = MEMORY[0x24BDAC760];
        v13 = __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke;
        v14 = &v20;
LABEL_10:
        v14[1] = 3221225472;
        v14[2] = (uint64_t)v13;
        v14[3] = (uint64_t)&unk_25041F770;
        v14[4] = (uint64_t)self;
        dispatch_async(MEMORY[0x24BDAC9B8], v14);
        goto LABEL_11;
      }
      goto LABEL_11;
    }
  }

}

uint64_t __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "reloadSpecifiers");
}

void __47__ASAccessoryInfoViewController_handleDAEvent___block_invoke_2(uint64_t a1)
{
  id v1;
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "navigationController");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  v1 = (id)objc_msgSend(v2, "popViewControllerAnimated:", 1);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_headerCell, 0);
  objc_storeStrong((id *)&self->_device, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

@end

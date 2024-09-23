@implementation ContentFilterController

- (void)dealloc
{
  void *v3;
  void *v4;
  objc_super v5;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, kNotificationVPNConnectionStatusChanged, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VPNNEConfigurationChangedNotification"), 0);

  v5.receiver = self;
  v5.super_class = (Class)ContentFilterController;
  -[ContentFilterController dealloc](&v5, sel_dealloc);
}

- (ContentFilterController)init
{
  ContentFilterController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ContentFilterController;
  v2 = -[ContentFilterController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_someStatusChanged_, kNotificationVPNConnectionStatusChanged, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_someConfigurationChanged_, CFSTR("VPNNEConfigurationChangedNotification"), 0);

  }
  return v2;
}

- (id)specifiers
{
  id v3;
  id v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  void *v26;
  id v27;
  id v28;
  _QWORD v30[5];
  uint64_t v31;
  _QWORD v32[2];

  v32[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ContentFilterController setPerAppSpecifiers:](self, "setPerAppSpecifiers:", v3);

  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[ContentFilterController setSystemSpecifiers:](self, "setSystemSpecifiers:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v30[0] = MEMORY[0x24BDAC760];
  v30[1] = 3221225472;
  v30[2] = __37__ContentFilterController_specifiers__block_invoke;
  v30[3] = &unk_24EE4DF10;
  v30[4] = self;
  objc_msgSend(v6, "iterateContentFilterServicesWithBlock:", v30);

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = *MEMORY[0x24BE75A68];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("CONTENT_FILTER_FOOTER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32[0] = v9;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v32, &v31, 1);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setProperties:", v10);

  objc_msgSend(v5, "addObject:", v7);
  -[ContentFilterController perAppSpecifiers](self, "perAppSpecifiers");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v12)
  {
    v13 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("APP_CONTENT_FILTER_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "groupSpecifierWithName:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v16);

    -[ContentFilterController perAppSpecifiers](self, "perAppSpecifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v17);

  }
  -[ContentFilterController systemSpecifiers](self, "systemSpecifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "count");

  if (v19)
  {
    v20 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "localizedStringForKey:value:table:", CFSTR("CONTENT_FILTER_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "groupSpecifierWithName:", v22);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObject:", v23);

    -[ContentFilterController systemSpecifiers](self, "systemSpecifiers");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObjectsFromArray:", v24);

  }
  v25 = (int)*MEMORY[0x24BE756E0];
  v26 = *(Class *)((char *)&self->super.super.super.super.super.isa + v25);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v25) = (Class)v5;
  v27 = v5;

  v28 = *(id *)((char *)&self->super.super.super.super.super.isa + v25);
  return v28;
}

uint64_t __37__ContentFilterController_specifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
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
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v38;
  uint64_t v39;
  void *v40;
  void *v41;
  _QWORD v42[5];
  _QWORD v43[5];
  _QWORD v44[8];
  _QWORD v45[8];
  _QWORD v46[3];
  _QWORD v47[5];

  v47[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "displayName");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "organizationForServiceID:", v5);
    v10 = objc_claimAutoreleasedReturnValue();

    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isProfileBacked:", v5);

    v13 = objc_msgSend(v7, "isPerApp");
    v14 = (void *)MEMORY[0x24BE75590];
    v41 = (void *)v10;
    if (v13)
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, *(_QWORD *)(a1 + 32), 0, 0, objc_opt_class(), 2, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = *MEMORY[0x24BE75C60];
      v47[0] = CFSTR("ContentFilterSetupListController");
      v17 = *MEMORY[0x24BE75948];
      v46[0] = v16;
      v46[1] = v17;
      v18 = objc_opt_class();
      v46[2] = *MEMORY[0x24BE759F8];
      v47[1] = v18;
      v47[2] = CFSTR("ContentFilterSetupListController");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v47, v46, 3);
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setProperties:", v19);

      v44[0] = CFSTR("vpn-service-id");
      objc_msgSend(v7, "serviceID");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v45[0] = v38;
      v44[1] = CFSTR("vpn-user-created");
      v40 = v8;
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
      v39 = a1;
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v45[1] = v20;
      v45[2] = v10;
      v44[2] = CFSTR("vpn-organization");
      v44[3] = CFSTR("vpn-status");
      objc_msgSend(v7, "statusText");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v45[3] = v21;
      v44[4] = CFSTR("vpn-status-value");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      v45[4] = v22;
      v44[5] = CFSTR("service-grade");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      v45[5] = v23;
      v44[6] = CFSTR("overview-mode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      v45[6] = v24;
      v44[7] = CFSTR("vpn-profile-backed");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v12);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      v45[7] = v25;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v45, v44, 8);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserInfo:", v26);

      v8 = v40;
      v27 = v41;

      objc_msgSend(v15, "setProperty:forKey:", &unk_24EE55178, *MEMORY[0x24BE75A18]);
      objc_msgSend(*(id *)(v39 + 32), "perAppSpecifiers");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "addObject:", v15);
    }
    else
    {
      objc_msgSend(v7, "displayName");
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v29, *(_QWORD *)(a1 + 32), 0, 0, 0, 3, 0);
      v15 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v15, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      v42[0] = CFSTR("vpn-service-id");
      objc_msgSend(v7, "serviceID");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v43[0] = v30;
      v43[1] = v10;
      v42[1] = CFSTR("vpn-organization");
      v42[2] = CFSTR("vpn-status");
      objc_msgSend(v7, "statusText");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v43[2] = v31;
      v42[3] = CFSTR("vpn-status-value");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
      v32 = (void *)objc_claimAutoreleasedReturnValue();
      v43[3] = v32;
      v42[4] = CFSTR("service-grade");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v43[4] = v33;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v43, v42, 5);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "setUserInfo:", v34);

      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "imageForKey:", *MEMORY[0x24BE757D0]);
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      if (v28)
        objc_msgSend(v15, "setProperty:forKey:", v28, *MEMORY[0x24BE75AC8]);
      objc_msgSend(*(id *)(a1 + 32), "systemSpecifiers");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "addObject:", v15);

      v27 = v41;
    }

  }
  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)ContentFilterController;
  -[ContentFilterController tableView:didSelectRowAtIndexPath:](&v4, sel_tableView_didSelectRowAtIndexPath_, a3, a4);
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  void *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v14;

  v14.receiver = self;
  v14.super_class = (Class)ContentFilterController;
  v6 = a4;
  -[ContentFilterController tableView:cellForRowAtIndexPath:](&v14, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[ContentFilterController indexForIndexPath:](self, "indexForIndexPath:", v6, v14.receiver, v14.super_class);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "userInfo");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("vpn-organization"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setSubtitle:", v11);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v10, "objectForKey:", CFSTR("vpn-status"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setVpnPrimaryTableCellStatus:", v12);

  }
  return v7;
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1376);
}

- (NSMutableArray)perAppSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setPerAppSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (NSMutableArray)systemSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setSystemSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_systemSpecifiers, 0);
  objc_storeStrong((id *)&self->_perAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end

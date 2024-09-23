@implementation DNSSettingsController

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
  v5.super_class = (Class)DNSSettingsController;
  -[DNSSettingsController dealloc](&v5, sel_dealloc);
}

- (DNSSettingsController)init
{
  DNSSettingsController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)DNSSettingsController;
  v2 = -[DNSSettingsController init](&v6, sel_init);
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
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
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
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  id *v31;
  id v32;
  id v33;
  id v34;
  _QWORD v36[5];
  id v37;
  uint64_t *v38;
  uint64_t *v39;
  uint64_t v40;
  uint64_t *v41;
  uint64_t v42;
  char v43;
  uint64_t v44;
  uint64_t *v45;
  uint64_t v46;
  char v47;
  uint64_t v48;
  _QWORD v49[3];

  v49[1] = *MEMORY[0x24BDAC8D0];
  v3 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[DNSSettingsController setCurrentDNSSettingsSpecifiers:](self, "setCurrentDNSSettingsSpecifiers:", v4);

  v5 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  -[DNSSettingsController setPerAppSpecifiers:](self, "setPerAppSpecifiers:", v5);

  -[DNSSettingsController setHasDNSProxyProhibitDisablement:](self, "setHasDNSProxyProhibitDisablement:", 0);
  -[DNSSettingsController setHasDNSSettingsProhibitDisablement:](self, "setHasDNSSettingsProhibitDisablement:", 0);
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v44 = 0;
  v45 = &v44;
  v46 = 0x2020000000;
  v47 = 0;
  v40 = 0;
  v41 = &v40;
  v42 = 0x2020000000;
  v43 = 1;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = MEMORY[0x24BDAC760];
  v36[1] = 3221225472;
  v36[2] = __35__DNSSettingsController_specifiers__block_invoke;
  v36[3] = &unk_24EE4D9E0;
  v36[4] = self;
  v38 = &v44;
  v8 = v6;
  v37 = v8;
  v39 = &v40;
  objc_msgSend(v7, "iterateDNSServicesWithBlock:", v36);

  objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = *MEMORY[0x24BE75A68];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DNS_SETTINGS_FOOTER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v11 = objc_claimAutoreleasedReturnValue();
  v49[0] = v11;
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v49, &v48, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setProperties:", v12);

  objc_msgSend(v3, "addObject:", v9);
  -[DNSSettingsController perAppSpecifiers](self, "perAppSpecifiers");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v11) = objc_msgSend(v13, "count") == 0;

  if ((v11 & 1) == 0)
  {
    v14 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("APP_DNS_PROXY_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "groupSpecifierWithName:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v17);

    -[DNSSettingsController perAppSpecifiers](self, "perAppSpecifiers");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObjectsFromArray:", v18);

  }
  v19 = (void *)MEMORY[0x24BE75590];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("DNS_PROXY_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "groupSpecifierWithName:", v21);
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObject:", v22);

  if (*((_BYTE *)v41 + 24))
  {
    v23 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_DNS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v25, self, 0, 0, 0, 3, 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();

    if (*((_BYTE *)v45 + 24))
      v27 = &unk_24EE54FF8;
    else
      v27 = &unk_24EE54FE0;
    objc_msgSend(v26, "setProperty:forKey:", v27, *MEMORY[0x24BE75850]);
    objc_msgSend(v26, "setProperty:forKey:", &unk_24EE54FC8, *MEMORY[0x24BE75A18]);
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProperty:forKey:", CFSTR("Ethernet"), *MEMORY[0x24BE758B0]);
    objc_msgSend(v26, "setupIconImageWithBundle:", v28);
    -[DNSSettingsController setAutomaticDNSSettingsSpecifier:](self, "setAutomaticDNSSettingsSpecifier:", v26);
    -[DNSSettingsController automaticDNSSettingsSpecifier](self, "automaticDNSSettingsSpecifier");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObject:", v29);

  }
  -[DNSSettingsController currentDNSSettingsSpecifiers](self, "currentDNSSettingsSpecifiers");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "addObjectsFromArray:", v30);

  v31 = (id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  v32 = *v31;
  *v31 = v3;
  v33 = v3;

  v34 = *v31;
  _Block_object_dispose(&v40, 8);
  _Block_object_dispose(&v44, 8);

  return v34;
}

uint64_t __35__DNSSettingsController_specifiers__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  id v18;
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
  id v31;
  void *v32;
  void *v33;
  uint64_t v34;
  int v35;
  void *v36;
  char v37;
  void *v38;
  void *v39;
  void *v40;
  int v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v49;
  void *v50;
  unsigned int v51;
  void *v52;
  void *v53;
  const __CFString *v54;
  void *v55;
  _QWORD v56[5];
  _QWORD v57[5];
  _QWORD v58[8];
  _QWORD v59[8];
  _QWORD v60[3];
  _QWORD v61[5];

  v61[3] = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    objc_msgSend(v7, "displayName");
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "organizationForServiceID:", v5);
    v53 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v7, "isPerApp"))
    {
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v51 = objc_msgSend(v9, "isProfileBacked:", v5);

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v52, *(_QWORD *)(a1 + 32), 0, 0, objc_opt_class(), 2, 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = *MEMORY[0x24BE75C60];
      v61[0] = CFSTR("DNSProxySetupListController");
      v12 = *MEMORY[0x24BE75948];
      v60[0] = v11;
      v60[1] = v12;
      v13 = objc_opt_class();
      v60[2] = *MEMORY[0x24BE759F8];
      v61[1] = v13;
      v61[2] = CFSTR("DNSProxySetupListController");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v61, v60, 3);
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setProperties:", v14);

      v58[0] = CFSTR("vpn-service-id");
      objc_msgSend(v7, "serviceID");
      v50 = (void *)objc_claimAutoreleasedReturnValue();
      v59[0] = v50;
      v58[1] = CFSTR("vpn-user-created");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
      v49 = (void *)objc_claimAutoreleasedReturnValue();
      v59[1] = v49;
      v59[2] = v53;
      v58[2] = CFSTR("vpn-organization");
      v58[3] = CFSTR("vpn-status");
      objc_msgSend(v7, "statusText");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v59[3] = v15;
      v58[4] = CFSTR("vpn-status-value");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v59[4] = v16;
      v58[5] = CFSTR("service-grade");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v59[5] = v17;
      v58[6] = CFSTR("overview-mode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v18 = v5;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v59[6] = v19;
      v58[7] = CFSTR("vpn-profile-backed");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v51);
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      v59[7] = v20;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v59, v58, 8);
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "setUserInfo:", v21);

      v5 = v18;
      v22 = v10;

      objc_msgSend(v10, "setProperty:forKey:", &unk_24EE54FC8, *MEMORY[0x24BE75A18]);
      objc_msgSend(*(id *)(a1 + 32), "perAppSpecifiers");
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "addObject:", v10);
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v52, *(_QWORD *)(a1 + 32), 0, 0, 0, 3, 0);
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "serviceID");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setProperty:forKey:", v25, CFSTR("vpn-service-id"));

      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", a3);
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setProperty:forKey:", v26, CFSTR("service-grade"));

      objc_msgSend(v24, "setProperty:forKey:", objc_opt_class(), *MEMORY[0x24BE75948]);
      if (a3 == 5)
      {
        v56[0] = CFSTR("vpn-service-id");
        objc_msgSend(v7, "serviceID");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        v57[0] = v27;
        v57[1] = v53;
        v56[1] = CFSTR("vpn-organization");
        v56[2] = CFSTR("vpn-status");
        objc_msgSend(v7, "statusText");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        v57[2] = v28;
        v56[3] = CFSTR("vpn-status-value");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v7, "status"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v57[3] = v29;
        v56[4] = CFSTR("service-grade");
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", 5);
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        v57[4] = v30;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v57, v56, 5);
        v31 = v5;
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setUserInfo:", v32);

        v5 = v31;
        a3 = 5;

      }
      else
      {
        v54 = CFSTR("vpn-organization");
        v55 = v53;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v55, &v54, 1);
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v24, "setUserInfo:", v27);
      }

      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      v34 = a3;
      v35 = objc_msgSend(v33, "isEnabledWithServiceID:withGrade:", v5, a3);

      if (v35)
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v22 = v24;
      objc_msgSend(v24, "setProperty:forKey:", &unk_24EE54FC8, *MEMORY[0x24BE75A18]);
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "optionsForServiceID:withGrade:", v5, v34);
      v23 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v23)
        goto LABEL_18;
      v37 = v35 ^ 1;
      if (v34 != 4)
        v37 = 1;
      if ((v37 & 1) == 0)
      {
        v38 = *(void **)(a1 + 40);
        objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("server"));
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v38, "addObject:", v39);

      }
      objc_msgSend(v23, "objectForKeyedSubscript:", CFSTR("dnsProhibitDisablement"));
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v41 = objc_msgSend(v40, "BOOLValue");

      if (v41)
      {
        *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 0;
        if (objc_msgSend(v7, "status") == 3)
        {
          if (v34 == 5)
          {
            objc_msgSend(*(id *)(a1 + 32), "setHasDNSProxyProhibitDisablement:", 1);
          }
          else if (v34 == 4)
          {
            objc_msgSend(*(id *)(a1 + 32), "setHasDNSSettingsProhibitDisablement:", 1);
          }
        }
      }
      else
      {
LABEL_18:
        if (v35)
          v42 = &unk_24EE54FE0;
        else
          v42 = &unk_24EE54FF8;
        objc_msgSend(v24, "setProperty:forKey:", v42, *MEMORY[0x24BE75850]);
      }
      objc_msgSend(v7, "bundleID");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v43, "length"))
      {
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v22, "setProperty:forKey:", v44, *MEMORY[0x24BE75B88]);

        objc_msgSend(v22, "setProperty:forKey:", v43, *MEMORY[0x24BE75B70]);
      }
      else
      {
        objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v45, "imageForKey:", *MEMORY[0x24BE757D0]);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        if (v46)
          objc_msgSend(v22, "setProperty:forKey:", v46, *MEMORY[0x24BE75AC8]);

      }
      objc_msgSend(*(id *)(a1 + 32), "currentDNSSettingsSpecifiers");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v47, "addObject:", v22);

    }
  }

  return 1;
}

- (void)showDNSSettingsPrivacyPage
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x24BDF6800], "sharedApplication");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("https://www.apple.com/privacy"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "openURL:options:completionHandler:", v2, MEMORY[0x24BDBD1B8], 0);

}

- (void)disableAllDNSSettings
{
  void *v3;
  _QWORD v4[5];
  uint64_t v5;
  uint64_t *v6;
  uint64_t v7;
  char v8;

  v5 = 0;
  v6 = &v5;
  v7 = 0x2020000000;
  v8 = 0;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __46__DNSSettingsController_disableAllDNSSettings__block_invoke;
  v4[3] = &unk_24EE4DA08;
  v4[4] = &v5;
  objc_msgSend(v3, "iterateDNSServicesWithBlock:iterBlock:", 1, v4);

  if (*((_BYTE *)v6 + 24))
    -[DNSSettingsController reloadSpecifiers](self, "reloadSpecifiers");
  _Block_object_dispose(&v5, 8);
}

uint64_t __46__DNSSettingsController_disableAllDNSSettings__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  void *v8;

  v5 = a2;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabledWithServiceID:withGrade:", v5, a3);

  if (v7)
  {
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "enable:serviceID:withGrade:", 0, v5, a3);

  }
  return 1;
}

- (void)toggleDNSSettingsForSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  char v11;
  void *v12;
  char v13;
  void *v14;
  id v15;
  void *v16;
  BOOL v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t (*v20)(uint64_t, void *, uint64_t);
  void *v21;
  id v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t *v25;
  uint64_t v26;
  char v27;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("vpn-service-id"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "propertyForKey:", CFSTR("service-grade"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "unsignedIntegerValue");

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "optionsForServiceID:withGrade:", v5, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("dnsProhibitDisablement"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "BOOLValue");

  if ((v11 & 1) == 0)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEnabledWithServiceID:withGrade:", v5, v7);

    v24 = 0;
    v25 = &v24;
    v26 = 0x2020000000;
    v27 = 0;
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = MEMORY[0x24BDAC760];
    v19 = 3221225472;
    v20 = __55__DNSSettingsController_toggleDNSSettingsForSpecifier___block_invoke;
    v21 = &unk_24EE4DA30;
    v15 = v5;
    v22 = v15;
    v23 = &v24;
    objc_msgSend(v14, "iterateDNSServicesWithBlock:iterBlock:", 1, &v18);

    if ((v13 & 1) != 0)
    {
      if (*((_BYTE *)v25 + 24))
      {
        +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", v18, v19, v20, v21);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v16, "enable:serviceID:withGrade:", 0, v15, v7);
LABEL_11:

        -[DNSSettingsController reloadSpecifiers](self, "reloadSpecifiers");
      }
LABEL_12:

      _Block_object_dispose(&v24, 8);
      goto LABEL_13;
    }
    if (v7 == 5)
    {
      v17 = -[DNSSettingsController hasDNSSettingsProhibitDisablement](self, "hasDNSSettingsProhibitDisablement", v18, v19, v20, v21);
    }
    else
    {
      if (v7 != 4)
        goto LABEL_10;
      v17 = -[DNSSettingsController hasDNSProxyProhibitDisablement](self, "hasDNSProxyProhibitDisablement", v18, v19, v20, v21);
    }
    if (v17)
      goto LABEL_12;
LABEL_10:
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", v18, v19, v20, v21);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "enable:serviceID:withGrade:", 1, v15, v7);
    goto LABEL_11;
  }
LABEL_13:

}

uint64_t __55__DNSSettingsController_toggleDNSSettingsForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;

  v5 = a2;
  if ((objc_msgSend(v5, "isEqual:", *(_QWORD *)(a1 + 32)) & 1) == 0)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEnabledWithServiceID:withGrade:", v5, a3);

    if (v7)
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = 1;
  }

  return 1;
}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  DNSSettingsController **v13;
  DNSSettingsController *v14;
  DNSSettingsController *v15;
  DNSSettingsController *v16;

  v6 = a3;
  v7 = a4;
  v8 = -[DNSSettingsController indexForIndexPath:](self, "indexForIndexPath:", v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNSSettingsController automaticDNSSettingsSpecifier](self, "automaticDNSSettingsSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    -[DNSSettingsController disableAllDNSSettings](self, "disableAllDNSSettings");
    v16 = self;
    v13 = &v16;
  }
  else
  {
    -[DNSSettingsController currentDNSSettingsSpecifiers](self, "currentDNSSettingsSpecifiers");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "containsObject:", v9);

    if (v12)
    {
      -[DNSSettingsController toggleDNSSettingsForSpecifier:](self, "toggleDNSSettingsForSpecifier:", v9);
      v15 = self;
      v13 = &v15;
    }
    else
    {
      v14 = self;
      v13 = &v14;
    }
  }
  v13[1] = (DNSSettingsController *)DNSSettingsController;
  objc_msgSendSuper2((objc_super *)v13, sel_tableView_didSelectRowAtIndexPath_, v6, v7, v14);

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
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  objc_super v22;

  v22.receiver = self;
  v22.super_class = (Class)DNSSettingsController;
  v6 = a4;
  -[DNSSettingsController tableView:cellForRowAtIndexPath:](&v22, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[DNSSettingsController indexForIndexPath:](self, "indexForIndexPath:", v6, v22.receiver, v22.super_class);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNSSettingsController automaticDNSSettingsSpecifier](self, "automaticDNSSettingsSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 != v10)
  {
    objc_msgSend(v9, "userInfo");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("vpn-organization"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v7, "detailTextLabel");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setText:", v12);
      objc_msgSend(MEMORY[0x24BDF6950], "_secondaryLabelColor");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "setColor:", v14);

    }
  }
  objc_msgSend(v9, "userInfo");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v15;
  if (v15)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("service-grade"));
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = objc_msgSend(v17, "unsignedIntegerValue");

    if (v18 == 5)
    {
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "objectForKey:", CFSTR("vpn-organization"));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setSubtitle:", v19);

      }
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v16, "objectForKey:", CFSTR("vpn-status"));
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setVpnPrimaryTableCellStatus:", v20);

      }
    }
  }

  return v7;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;
  objc_super v17;
  _QWORD v18[3];

  v18[2] = *MEMORY[0x24BDAC8D0];
  v17.receiver = self;
  v17.super_class = (Class)DNSSettingsController;
  -[DNSSettingsController viewDidAppear:](&v17, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/ManagedConfigurationList/DNS"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithKey:table:locale:bundleURL:", CFSTR("DNS"), 0, v8, v6);

  v10 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v10, "initWithKey:table:locale:bundleURL:", CFSTR("General"), 0, v11, v6);

  v13 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = (void *)objc_msgSend(v13, "initWithKey:table:locale:bundleURL:", CFSTR("VPN & Device Management"), 0, v14, v6);

  v18[0] = v12;
  v18[1] = v15;
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v18, 2);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNSSettingsController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.vpn"), v9, v16, v4);

}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 1384);
}

- (NSString)applicationName
{
  return (NSString *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setApplicationName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (NSString)serverName
{
  return (NSString *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setServerName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (NSString)typeIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setTypeIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (PSSpecifier)automaticDNSSettingsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setAutomaticDNSSettingsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (NSMutableArray)currentDNSSettingsSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setCurrentDNSSettingsSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (NSMutableArray)perAppSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setPerAppSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (BOOL)hasDNSProxyProhibitDisablement
{
  return self->_hasDNSProxyProhibitDisablement;
}

- (void)setHasDNSProxyProhibitDisablement:(BOOL)a3
{
  self->_hasDNSProxyProhibitDisablement = a3;
}

- (BOOL)hasDNSSettingsProhibitDisablement
{
  return self->_hasDNSSettingsProhibitDisablement;
}

- (void)setHasDNSSettingsProhibitDisablement:(BOOL)a3
{
  self->_hasDNSSettingsProhibitDisablement = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perAppSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentDNSSettingsSpecifiers, 0);
  objc_storeStrong((id *)&self->_automaticDNSSettingsSpecifier, 0);
  objc_storeStrong((id *)&self->_typeIdentifier, 0);
  objc_storeStrong((id *)&self->_serverName, 0);
  objc_storeStrong((id *)&self->_applicationName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end

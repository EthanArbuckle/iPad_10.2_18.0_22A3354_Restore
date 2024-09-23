@implementation ContentFilterSetupListController

- (void)appWillEnterForeground:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id location;

  v4 = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vpn-service-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[ContentFilterSetupListController vpnGrade](self, "vpnGrade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  objc_destroyWeak(&location);
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, kNotificationVPNConnectionStatusChanged, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VPNNEConfigurationChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);

  v6.receiver = self;
  v6.super_class = (Class)ContentFilterSetupListController;
  -[ContentFilterSetupListController dealloc](&v6, sel_dealloc);
}

- (ContentFilterSetupListController)init
{
  ContentFilterSetupListController *v2;
  void *v3;
  void *v4;
  void *v5;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)ContentFilterSetupListController;
  v2 = -[ContentFilterSetupListController init](&v7, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_vpnStatusChanged_, kNotificationVPNConnectionStatusChanged, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_vpnConfigurationChanged_, CFSTR("VPNNEConfigurationChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_appWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

  }
  return v2;
}

- (void)viewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  objc_super v10;
  id location;

  v3 = a3;
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vpn-service-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[ContentFilterSetupListController vpnGrade](self, "vpnGrade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  v10.receiver = self;
  v10.super_class = (Class)ContentFilterSetupListController;
  -[ContentFilterSetupListController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  objc_destroyWeak(&location);

}

- (void)viewDidAppear:(BOOL)a3
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)ContentFilterSetupListController;
  -[ContentFilterSetupListController viewDidAppear:](&v3, sel_viewDidAppear_, a3);
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (void)setStateForServiceID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v4 = a3;
  v5 = (void *)objc_msgSend(v4, "copy");
  -[ContentFilterSetupListController setServiceID:](self, "setServiceID:", v5);

  v6 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "userInfo");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKey:", CFSTR("service-grade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContentFilterSetupListController setVpnGrade:](self, "setVpnGrade:", objc_msgSend(v8, "unsignedIntegerValue"));

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "optionsForServiceID:withGrade:", v4, -[ContentFilterSetupListController vpnGrade](self, "vpnGrade"));
  v15 = (id)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    objc_msgSend(v15, "objectForKey:", CFSTR("dispName"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentFilterSetupListController setDisplayName:](self, "setDisplayName:", v10);

    objc_msgSend(v15, "objectForKey:", CFSTR("VPNApplicationName"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentFilterSetupListController setAppName:](self, "setAppName:", v11);

    objc_msgSend(v15, "objectForKey:", CFSTR("VPNIncludedBundleIDs"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentFilterSetupListController setIncludedBundleIDs:](self, "setIncludedBundleIDs:", v12);

    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v6), "userInfo");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKey:", CFSTR("vpn-organization"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentFilterSetupListController setOrganization:](self, "setOrganization:", v14);

  }
}

- (void)loadView
{
  void *v3;
  void *v4;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)ContentFilterSetupListController;
  -[ContentFilterSetupListController loadView](&v5, sel_loadView);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", CFSTR("vpn-service-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  -[ContentFilterSetupListController setStateForServiceID:](self, "setStateForServiceID:", v4);
}

- (id)connection
{
  void *v3;
  void *v4;
  void *v5;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[ContentFilterSetupListController serviceID](self, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionWithServiceID:withGrade:", v4, -[ContentFilterSetupListController vpnGrade](self, "vpnGrade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)statusForConnection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[ContentFilterSetupListController connection](self, "connection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "statusText");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("INVALID"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)getDescriptionForApp:(id)a3
{
  void *v3;
  void *v4;
  __CFString *v5;

  objc_msgSend(a3, "propertyForKey:", CFSTR("AppDescription"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = v3;
  else
    v5 = &stru_24EE4DF70;

  return v5;
}

- (id)specifiers
{
  ContentFilterSetupListController *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;
  ContentFilterSetupListController *v24;
  uint64_t v25;
  uint64_t v26;
  unint64_t v27;
  uint64_t i;
  uint64_t v29;
  id v30;
  void *v31;
  id v32;
  void *v33;
  BOOL v34;
  uint64_t v35;
  void *v36;
  void *v37;
  void *v38;
  ContentFilterSetupListController *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  uint64_t v44;
  void *v45;
  id v46;
  id v47;
  void *v49;
  id v50;
  void *v51;
  void *v52;
  void *v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  void *v59;
  id obj;
  id v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  _BYTE v66[128];
  uint64_t v67;

  v2 = self;
  v67 = *MEMORY[0x24BDAC8D0];
  if (*(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]))
  {
    -[ContentFilterSetupListController displayName](self, "displayName");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[ContentFilterSetupListController setTitle:](v2, "setTitle:", v3);

    v4 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObject:", v5);
    v6 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VPN_GRADE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, v2, 0, sel_vpnGradeNameForSpecifier_, 0, 4, 0);
    v9 = objc_claimAutoreleasedReturnValue();

    v53 = (void *)v9;
    objc_msgSend(v4, "addObject:", v9);
    v10 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("STATUS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v12, v2, 0, sel_statusForConnection_, 0, 4, 0);
    v13 = objc_claimAutoreleasedReturnValue();

    v14 = (void *)v13;
    v59 = v4;
    objc_msgSend(v4, "addObject:", v13);
    -[ContentFilterSetupListController includedBundleIDs](v2, "includedBundleIDs");
    v15 = objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      v16 = (void *)v15;
      -[ContentFilterSetupListController includedBundleIDs](v2, "includedBundleIDs");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "count");

      if (v18)
      {
        v51 = (void *)v13;
        v52 = v5;
        v19 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("INCLUDED_APPS_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "groupSpecifierWithName:", v21);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v22);

        v64 = 0u;
        v65 = 0u;
        v62 = 0u;
        v63 = 0u;
        -[ContentFilterSetupListController includedBundleIDs](v2, "includedBundleIDs");
        obj = (id)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
        v24 = v2;
        if (v23)
        {
          v25 = v23;
          v26 = *(_QWORD *)v63;
          v58 = *MEMORY[0x24BE75AC0];
          v55 = *MEMORY[0x24BE75B88];
          v56 = *MEMORY[0x24BE75B70];
          v54 = *MEMORY[0x24BE75AC8];
          v27 = 0x24BDC1000uLL;
          v57 = *(_QWORD *)v63;
          do
          {
            for (i = 0; i != v25; ++i)
            {
              if (*(_QWORD *)v63 != v26)
                objc_enumerationMutation(obj);
              v29 = *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i);
              v30 = objc_alloc(*(Class *)(v27 + 1344));
              v61 = 0;
              v31 = (void *)objc_msgSend(v30, "initWithBundleIdentifier:allowPlaceholder:error:", v29, 0, &v61);
              v32 = v61;
              objc_msgSend(v31, "localizedName");
              v33 = (void *)objc_claimAutoreleasedReturnValue();

              if (v33)
                v34 = v32 == 0;
              else
                v34 = 0;
              if (v34)
              {
                v35 = v25;
                objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v33, v24, 0, sel_getDescriptionForApp_, 0, 4, 0);
                v36 = (void *)objc_claimAutoreleasedReturnValue();
                -[ContentFilterSetupListController includedBundleIDs](v24, "includedBundleIDs");
                v37 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v37, "objectForKeyedSubscript:", v29);
                v38 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v36, "setProperty:forKey:", v38, CFSTR("AppDescription"));

                objc_msgSend(v36, "setProperty:forKey:", v29, v58);
                if (objc_msgSend(MEMORY[0x24BDF6FD0], "bundleIdentifierContainsWebClipIdentifier:", v29))
                {
                  v39 = v24;
                  objc_msgSend(MEMORY[0x24BDF6FD0], "webClipIdentifierFromBundleIdentifier:", v29);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDF6FD0], "webClipWithIdentifier:", v40);
                  v41 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
                  v42 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v42, "scale");
                  objc_msgSend(v41, "generateIconImageForFormat:scale:", 0);
                  v43 = (void *)objc_claimAutoreleasedReturnValue();

                  if (v43)
                    objc_msgSend(v36, "setProperty:forKey:", v43, v54);

                  v24 = v39;
                  v26 = v57;
                }
                else
                {
                  objc_msgSend(v36, "setProperty:forKey:", v29, v56);
                  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
                  v40 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v36, "setProperty:forKey:", v40, v55);
                }
                v25 = v35;

                objc_msgSend(v59, "addObject:", v36);
                v27 = 0x24BDC1000;
              }

            }
            v25 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v62, v66, 16);
          }
          while (v25);
        }

        v2 = v24;
        v14 = v51;
        v5 = v52;
      }
    }
    v44 = (int)*MEMORY[0x24BE756E0];
    v45 = *(Class *)((char *)&v2->super.super.super.super.super.isa + v44);
    *(Class *)((char *)&v2->super.super.super.super.super.isa + v44) = (Class)v59;
    v46 = v59;

    v47 = *(id *)((char *)&v2->super.super.super.super.super.isa + v44);
    return v47;
  }
  else
  {
    -[ContentFilterSetupListController navigationController](self, "navigationController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = (id)objc_msgSend(v49, "popViewControllerAnimated:", 1);

    return 0;
  }
}

- (unint64_t)vpnGrade
{
  return self->_vpnGrade;
}

- (void)setVpnGrade:(unint64_t)a3
{
  self->_vpnGrade = a3;
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (NSString)organization
{
  return (NSString *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setOrganization:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (NSDictionary)includedBundleIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setIncludedBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_includedBundleIDs, 0);
  objc_storeStrong((id *)&self->_organization, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
}

@end

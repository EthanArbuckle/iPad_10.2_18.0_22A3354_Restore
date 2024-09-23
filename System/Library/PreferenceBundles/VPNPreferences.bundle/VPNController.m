@implementation VPNController

- (void)someVPNStatusChanged:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  objc_msgSend(v5, "object");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v4, "grade") == 1)
  {
    -[VPNController vpnPersonalStatusChanged:](self, "vpnPersonalStatusChanged:", v5);
  }
  else if (objc_msgSend(v4, "grade"))
  {
    if (objc_msgSend(v4, "grade") == 2 || objc_msgSend(v4, "grade") == 3)
      -[VPNController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    -[VPNController vpnEnterpriseStatusChanged:](self, "vpnEnterpriseStatusChanged:", v5);
  }

}

- (id)messageForConnection:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v23;
  void *v24;
  const __CFString *v25;
  char v26;

  v3 = a3;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "serviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "optionsForServiceID:withGrade:", v5, 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKey:", CFSTR("VPNOnDemandCapable"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "BOOLValue");

  if (v8)
  {
    objc_msgSend(v6, "objectForKey:", CFSTR("VPNOnDemandEnabled"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = objc_msgSend(v9, "BOOLValue");

  }
  else
  {
    v10 = 0;
  }
  v26 = 0;
  objc_msgSend(v3, "serviceID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v4, "isTypeEnabledWithServiceID:withGrade:outProviderAvailable:", v11, 0, &v26);

  v13 = objc_msgSend(v3, "vpnConnectionType");
  if (v13 == 3 && !v26)
  {
    v14 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("MISSING_PROVIDER_MESSAGE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceID");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appNameForServiceID:withGrade:", v17, 0);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "stringWithFormat:", v16, v18, v19);
LABEL_10:
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    goto LABEL_11;
  }
  if (v13 == 3 && (v12 & v8 & 1) == 0)
  {
    v20 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("SSL_MESSAGE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "serviceID");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appNameForServiceID:withGrade:", v18, 0);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "stringWithFormat:", v16, v17, v19);
    goto LABEL_10;
  }
  if (objc_msgSend(v3, "onDemandAction") == 2)
  {
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    v25 = CFSTR("ON_DEMAND_DISCONNECT");
  }
  else
  {
    if (!v10 || objc_msgSend(v3, "onDemandAction") == 4)
    {
      v21 = 0;
      goto LABEL_12;
    }
    v23 = (void *)MEMORY[0x24BDD17C8];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v24;
    v25 = CFSTR("ON_DEMAND_TEXT");
  }
  objc_msgSend(v24, "localizedStringForKey:value:table:", v25, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "displayName");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "stringWithFormat:", v16, v17);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_11:

LABEL_12:
  return v21;
}

- (void)vpnPersonalStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentConnectionWithGrade:", 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v4;
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);
  v9 = (uint64_t *)MEMORY[0x24BE75D18];
  v27 = v8;
  if (v8)
  {
    -[VPNController beginUpdates](self, "beginUpdates");
    -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", *v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "statusText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v14, 0);

  }
  v28 = v6;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[VPNController currentPersonalVPNSpecifiers](self, "currentPersonalVPNSpecifiers", self);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    v30 = *v9;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v19, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("vpn-service-id"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serviceID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v23)
        {
          objc_msgSend(v19, "propertyForKey:", v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "alertText");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setAlert:", v25);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v16);
  }

  if (v27)
    objc_msgSend(v26, "endUpdates");

}

- (void)vpnEnterpriseStatusChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t i;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  int v23;
  void *v24;
  void *v25;
  void *v26;
  int v27;
  void *v28;
  void *v29;
  uint64_t v30;
  id obj;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentConnectionWithGrade:", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v29 = v4;
  objc_msgSend(v4, "object");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v6, "isEqual:", v7);
  v9 = (uint64_t *)MEMORY[0x24BE75D18];
  v27 = v8;
  if (v8)
  {
    -[VPNController beginUpdates](self, "beginUpdates");
    -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "propertyForKey:", *v9);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v6, "statusText");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "detailTextLabel");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setText:", v12);

    -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController reloadSpecifier:animated:](self, "reloadSpecifier:animated:", v14, 0);

  }
  v28 = v6;
  v34 = 0u;
  v35 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[VPNController currentEnterpriseVPNSpecifiers](self, "currentEnterpriseVPNSpecifiers", self);
  obj = (id)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v33;
    v30 = *v9;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v33 != v17)
          objc_enumerationMutation(obj);
        v19 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * i);
        objc_msgSend(v19, "userInfo");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "objectForKey:", CFSTR("vpn-service-id"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "serviceID");
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        v23 = objc_msgSend(v21, "isEqual:", v22);

        if (v23)
        {
          objc_msgSend(v19, "propertyForKey:", v30);
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v7, "alertText");
          v25 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setAlert:", v25);

        }
      }
      v16 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v32, v36, 16);
    }
    while (v16);
  }

  if (v27)
    objc_msgSend(v26, "endUpdates");

}

- (BOOL)shouldHideAddVPNButton
{
  void *v2;
  int v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "effectiveBoolValueForSetting:", *MEMORY[0x24BE63AF8]);

  return v3 == 2;
}

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
  v5.super_class = (Class)VPNController;
  -[VPNController dealloc](&v5, sel_dealloc);
}

- (VPNController)init
{
  VPNController *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)VPNController;
  v2 = -[VPNController init](&v6, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_someVPNStatusChanged_, kNotificationVPNConnectionStatusChanged, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_vpnConfigurationChanged_, CFSTR("VPNNEConfigurationChangedNotification"), 0);

  }
  return v2;
}

- (void)setPersonalVPNActive:(BOOL)a3 specifier:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentConnectionWithGrade:", 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      if (+[VPNBundleController networkingIsDisabled](VPNBundleController, "networkingIsDisabled"))
      {
        -[VPNController rootController](self, "rootController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "topViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "showConfirmationViewForSpecifier:", v10);
      }
      else
      {
        objc_msgSend(v7, "connect");
      }
    }
    else
    {
      objc_msgSend(v7, "disconnect");
    }
    -[VPNController vpnPersonalStatusChanged:](self, "vpnPersonalStatusChanged:", 0);
  }

}

- (void)setEnterpriseVPNActive:(BOOL)a3 specifier:(id)a4
{
  _BOOL4 v4;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;

  v4 = a3;
  v10 = a4;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "currentConnectionWithGrade:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    if (v4)
    {
      if (+[VPNBundleController networkingIsDisabled](VPNBundleController, "networkingIsDisabled"))
      {
        -[VPNController rootController](self, "rootController");
        v8 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v8, "topViewController");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v9, "showConfirmationViewForSpecifier:", v10);
      }
      else
      {
        objc_msgSend(v7, "connect");
      }
    }
    else
    {
      objc_msgSend(v7, "disconnect");
    }
    -[VPNController vpnEnterpriseStatusChanged:](self, "vpnEnterpriseStatusChanged:", 0);
  }

}

- (void)startEnterpriseConnection:(id)a3
{
  -[VPNController setEnterpriseVPNActive:specifier:](self, "setEnterpriseVPNActive:specifier:", 1, a3);
}

- (void)cancelEnterpriseConnection:(id)a3
{
  -[VPNController setEnterpriseVPNActive:specifier:](self, "setEnterpriseVPNActive:specifier:", 0, a3);
}

- (void)setEnterpriseConnectionState:(id)a3 forSpecifier:(id)a4
{
  id v6;

  v6 = a4;
  -[VPNController setEnterpriseVPNActive:specifier:](self, "setEnterpriseVPNActive:specifier:", objc_msgSend(a3, "BOOLValue"), v6);

}

- (id)getEnterpriseConnectionStateForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConnectionWithGrade:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "notDisconnectedOrDisconnecting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)getDeviceRelayStateForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConnectionWithGrade:", 7);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "statusText");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)startPersonalConnection:(id)a3
{
  -[VPNController setPersonalVPNActive:specifier:](self, "setPersonalVPNActive:specifier:", 1, a3);
}

- (void)cancelPersonalConnection:(id)a3
{
  -[VPNController setPersonalVPNActive:specifier:](self, "setPersonalVPNActive:specifier:", 0, a3);
}

- (void)setAOVPNEnabled:(id)a3 forSpecifier:(id)a4
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  int v8;
  void *v9;
  id v10;

  v4 = a3;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "currentConnectionWithGrade:", 3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "BOOLValue");

  objc_msgSend(v5, "serviceID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v10, "isEnabledWithServiceID:withGrade:", v7, 3);

  if ((_DWORD)v6 != v8)
  {
    objc_msgSend(v5, "serviceID");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "enable:serviceID:withGrade:", v6, v9, 3);

  }
}

- (id)getAOVPNEnabledForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConnectionWithGrade:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)MEMORY[0x24BDD16E0];
  objc_msgSend(v4, "serviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "numberWithBool:", objc_msgSend(v3, "isEnabledWithServiceID:withGrade:", v6, 3));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (void)setPersonalConnectionState:(id)a3 forSpecifier:(id)a4
{
  id v6;

  v6 = a4;
  -[VPNController setPersonalVPNActive:specifier:](self, "setPersonalVPNActive:specifier:", objc_msgSend(a3, "BOOLValue"), v6);

}

- (id)getPersonalConnectionStateForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "currentConnectionWithGrade:", 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", objc_msgSend(v4, "notDisconnectedOrDisconnecting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)addVPNConfiguration:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  id WeakRetained;
  id v8;

  v4 = *(objc_class **)((char *)a3 + (int)*MEMORY[0x24BE75740]);
  v5 = a3;
  v6 = objc_alloc_init(v4);
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x24BE754E8]);
  v8 = v6;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE757A0]));
  objc_msgSend(v8, "setRootController:", WeakRetained);

  objc_msgSend(v8, "setParentController:", self);
  objc_msgSend(v8, "setSpecifier:", v5);

  -[VPNController showController:](self, "showController:", v8);
}

- (void)willBecomeActive
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VPNController;
  -[VPNController willBecomeActive](&v2, sel_willBecomeActive);
}

- (void)loadView
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)VPNController;
  -[VPNController loadView](&v2, sel_loadView);
}

- (void)addListForGrade:(unint64_t)a3 toSpecifiers:(id)a4
{
  unint64_t v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t v35;
  id v36;
  uint64_t v37;
  id obj;
  void *v40;
  uint64_t v41;
  unint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[7];
  _QWORD v48[7];
  _QWORD v49[4];
  _QWORD v50[4];
  _BYTE v51[128];
  uint64_t v52;

  v52 = *MEMORY[0x24BDAC8D0];
  v36 = a4;
  v5 = 0x25408B000uLL;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v42 = a3;
  objc_msgSend(v6, "vpnServicesForCurrentSetWithGrade:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (v7)
  {
    v45 = 0u;
    v46 = 0u;
    v43 = 0u;
    v44 = 0u;
    v31 = v7;
    obj = v7;
    v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
    if (v8)
    {
      v9 = v8;
      v41 = *(_QWORD *)v44;
      v35 = *MEMORY[0x24BE75C60];
      v34 = *MEMORY[0x24BE75948];
      v32 = *MEMORY[0x24BE75A18];
      v33 = *MEMORY[0x24BE759F8];
      do
      {
        v10 = 0;
        v37 = v9;
        do
        {
          if (*(_QWORD *)v44 != v41)
            objc_enumerationMutation(obj);
          v11 = *(_QWORD *)(*((_QWORD *)&v43 + 1) + 8 * v10);
          objc_msgSend((id)(v5 + 3704), "sharedInstance");
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "connectionWithServiceID:withGrade:", v11, v42);
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
          {
            objc_msgSend(v13, "displayName");
            v14 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend((id)(v5 + 3704), "sharedInstance");
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            v16 = objc_msgSend(v15, "isUserCreatedVPN:", v11);

            objc_msgSend((id)(v5 + 3704), "sharedInstance");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            v18 = objc_msgSend(v17, "isProfileBacked:", v11);

            objc_msgSend((id)(v5 + 3704), "sharedInstance");
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "organizationForServiceID:", v11);
            v20 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v14, self, 0, 0, objc_opt_class(), 1, 0);
            v21 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v21, "setIdentifier:", v14);
            if (v21)
            {
              v50[0] = CFSTR("VPNSetupListController");
              v49[0] = v35;
              v49[1] = v34;
              v50[1] = objc_opt_class();
              v50[2] = CFSTR("VPNSetupListController");
              v49[2] = v33;
              v49[3] = v32;
              v22 = objc_msgSend(v13, "vpnConnectionType");
              v23 = &unk_24EE55118;
              if (v22 == 1)
                v23 = &unk_24EE55100;
              v50[3] = v23;
              v40 = v14;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v50, v49, 4);
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setProperties:", v24);

              v48[0] = v11;
              v47[0] = CFSTR("vpn-service-id");
              v47[1] = CFSTR("vpn-user-created");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v16);
              v25 = (void *)objc_claimAutoreleasedReturnValue();
              v48[1] = v25;
              v48[2] = v20;
              v47[2] = CFSTR("vpn-organization");
              v47[3] = CFSTR("service-grade");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v42);
              v26 = (void *)objc_claimAutoreleasedReturnValue();
              v48[3] = v26;
              v47[4] = CFSTR("overview-mode");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              v48[4] = v27;
              v47[5] = CFSTR("vpn-alert");
              objc_msgSend(v13, "alertText");
              v28 = (void *)objc_claimAutoreleasedReturnValue();
              v48[5] = v28;
              v47[6] = CFSTR("vpn-profile-backed");
              objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v18);
              v29 = (void *)objc_claimAutoreleasedReturnValue();
              v48[6] = v29;
              objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v48, v47, 7);
              v30 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v21, "setUserInfo:", v30);

              v14 = v40;
              v9 = v37;

              v5 = 0x25408B000;
              objc_msgSend(v36, "addObject:", v21);
            }

          }
          ++v10;
        }
        while (v9 != v10);
        v9 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v43, v51, 16);
      }
      while (v9);
    }

    v7 = v31;
  }

}

- (id)specifiers
{
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  int v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  int v14;
  void *v15;
  unsigned int v16;
  void *v17;
  unsigned int v18;
  void *v19;
  id v20;
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
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  void *v52;
  int v53;
  void *v54;
  void *v55;
  const __CFString *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  int v62;
  int v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  uint64_t i;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  void *v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  void *v81;
  uint64_t v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  void *v92;
  uint64_t v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  id v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  const __CFString *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  int v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  void *v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  uint64_t v124;
  uint64_t v125;
  uint64_t k;
  uint64_t v127;
  void *v128;
  void *v129;
  void *v130;
  void *v131;
  void *v132;
  void *v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  uint64_t v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  void *v146;
  void *v147;
  void *v148;
  void *v149;
  id v150;
  void *v151;
  void *v152;
  void *v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  uint64_t m;
  uint64_t v160;
  void *v161;
  void *v162;
  void *v163;
  uint64_t v164;
  void *v165;
  void *v166;
  void *v167;
  uint64_t v168;
  void *v169;
  void *v170;
  void *v171;
  void *v172;
  void *v173;
  void *v174;
  void *v175;
  void *v176;
  int v177;
  void *v178;
  void *v179;
  void *v180;
  void *v181;
  void *v182;
  void *v183;
  uint64_t n;
  uint64_t v185;
  void *v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  uint64_t v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  id v202;
  void *v203;
  void *v204;
  uint64_t v205;
  uint64_t v206;
  uint64_t v207;
  uint64_t ii;
  void *v209;
  void *v210;
  void *v211;
  void *v212;
  void *v213;
  void *v214;
  void *v215;
  void *v216;
  void *v217;
  void *v218;
  objc_class *v219;
  void *v220;
  uint64_t v221;
  uint64_t v222;
  void *v223;
  void *v224;
  void *v225;
  void *v226;
  void *v227;
  void *v228;
  void *v229;
  void *v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  void *v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  void *v243;
  void *v244;
  void *v245;
  void *v246;
  void *v247;
  void *v248;
  void *v249;
  id v250;
  uint64_t v252;
  uint64_t v253;
  uint64_t v254;
  uint64_t j;
  uint64_t v256;
  int v257;
  int v258;
  int v259;
  unint64_t v260;
  uint64_t v261;
  id v262;
  uint64_t v263;
  uint64_t v264;
  id obj;
  id obja;
  uint64_t v267;
  uint64_t v268;
  void *v269;
  uint64_t v270;
  uint64_t v271;
  uint64_t v272;
  void *v273;
  uint64_t v274;
  void *v275;
  int v276;
  uint64_t v277;
  void *v278;
  int v279;
  void *v280;
  void *v281;
  void *v282;
  unsigned int v283;
  void *v284;
  VPNController *v285;
  __int128 v286;
  __int128 v287;
  __int128 v288;
  __int128 v289;
  __int128 v290;
  __int128 v291;
  __int128 v292;
  __int128 v293;
  __int128 v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 v298;
  __int128 v299;
  __int128 v300;
  __int128 v301;
  __int128 v302;
  __int128 v303;
  __int128 v304;
  __int128 v305;
  __int128 v306;
  __int128 v307;
  __int128 v308;
  __int128 v309;
  uint64_t v310;
  const __CFString *v311;
  _QWORD v312[2];
  _QWORD v313[2];
  _QWORD v314[5];
  _QWORD v315[5];
  uint64_t v316;
  void *v317;
  _BYTE v318[128];
  _QWORD v319[8];
  _QWORD v320[8];
  _QWORD v321[3];
  _QWORD v322[3];
  _BYTE v323[128];
  _QWORD v324[9];
  _QWORD v325[9];
  _QWORD v326[3];
  _QWORD v327[3];
  _BYTE v328[128];
  uint64_t v329;
  void *v330;
  const __CFString *v331;
  void *v332;
  _QWORD v333[3];
  _QWORD v334[3];
  _BYTE v335[128];
  uint64_t v336;
  void *v337;
  const __CFString *v338;
  void *v339;
  _QWORD v340[3];
  _QWORD v341[3];
  _BYTE v342[128];
  _BYTE v343[128];
  uint64_t v344;
  void *v345;
  _QWORD v346[7];
  _QWORD v347[7];
  _QWORD v348[3];
  _QWORD v349[5];
  NSRange v350;

  v349[3] = *MEMORY[0x24BDAC8D0];
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vpnServiceCountWithGrade:", 3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v279 = objc_msgSend(v4, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 7);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 1);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "intValue");

  objc_msgSend(v3, "vpnServiceCountWithGrade:", 5);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = objc_msgSend(v17, "intValue");

  v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  if (v19)
    goto LABEL_111;
  v276 = v10;
  v258 = v12;
  v259 = v14;
  v260 = __PAIR64__(v16, v18);
  v261 = (int)*MEMORY[0x24BE756E0];
  v20 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  v284 = v3;
  v285 = self;
  v269 = v20;
  if (v279)
  {
    -[VPNController alwaysOnGroupTitleSpecifier](self, "alwaysOnGroupTitleSpecifier");
    v21 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v21)
    {
      v22 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("ALWAYS_ON_VPN_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "groupSpecifierWithName:", v24);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNController setAlwaysOnGroupTitleSpecifier:](self, "setAlwaysOnGroupTitleSpecifier:", v25);

    }
    -[VPNController alwaysOnGroupTitleSpecifier](self, "alwaysOnGroupTitleSpecifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v26);

    objc_msgSend(v3, "currentConnectionWithGrade:", 3);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    if (v27)
    {
      v28 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(v3, "currentConnectionWithGrade:", 3);
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "displayName");
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v28, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v30, self, 0, 0, objc_opt_class(), 1, 0);
      v31 = (void *)objc_claimAutoreleasedReturnValue();

      v32 = *MEMORY[0x24BE75C60];
      v349[0] = CFSTR("VPNSetupListController");
      v33 = *MEMORY[0x24BE75948];
      v348[0] = v32;
      v348[1] = v33;
      v34 = objc_opt_class();
      v348[2] = *MEMORY[0x24BE759F8];
      v349[1] = v34;
      v349[2] = CFSTR("VPNSetupListController");
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v349, v348, 3);
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setProperties:", v35);

      v346[0] = CFSTR("vpn-service-id");
      objc_msgSend(v27, "serviceID");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      v347[0] = v280;
      v346[1] = CFSTR("vpn-user-created");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      v347[1] = v36;
      v346[2] = CFSTR("vpn-organization");
      objc_msgSend(v27, "serviceID");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v284, "organizationForServiceID:", v37);
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      v347[2] = v38;
      v346[3] = CFSTR("vpn-status");
      objc_msgSend(v27, "statusText");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      v347[3] = v39;
      v346[4] = CFSTR("service-grade");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
      v40 = (void *)objc_claimAutoreleasedReturnValue();
      v347[4] = v40;
      v346[5] = CFSTR("overview-mode");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      v347[5] = v41;
      v346[6] = CFSTR("vpn-profile-backed");
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v42 = v27;
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      v347[6] = v43;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v347, v346, 7);
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v31, "setUserInfo:", v44);

      v27 = v42;
      self = v285;

      v3 = v284;
      -[VPNController setCurrentAOVPNSpecifier:](v285, "setCurrentAOVPNSpecifier:", v31);
      -[VPNController currentAOVPNSpecifier](v285, "currentAOVPNSpecifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "addObject:", v45);

      objc_msgSend(v42, "serviceID");
      v46 = (void *)objc_claimAutoreleasedReturnValue();
      LODWORD(v40) = objc_msgSend(v284, "alwaysOnToggleEnabledForServiceID:", v46);

      if ((_DWORD)v40)
      {
        v47 = (void *)MEMORY[0x24BE754D0];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v48, "localizedStringForKey:value:table:", CFSTR("CONNECT_AUTOMATICALLY"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v49, v285, sel_setAOVPNEnabled_forSpecifier_, sel_getAOVPNEnabledForSpecifier_, 0, 6, 0);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v269, "addObject:", v50);
      }
      v51 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(v42, "serviceID");
      v52 = (void *)objc_claimAutoreleasedReturnValue();
      v53 = objc_msgSend(v284, "isEnabledWithServiceID:withGrade:", v52, 3);
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v54 = (void *)objc_claimAutoreleasedReturnValue();
      v55 = v54;
      if (v53)
        v56 = CFSTR("ALWAYS_ON_TEXT");
      else
        v56 = CFSTR("ALWAYS_ON_DISABLED_TEXT");
      objc_msgSend(v54, "localizedStringForKey:value:table:", v56, &stru_24EE4DF70, CFSTR("MobileVPN"));
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v42, "displayName");
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v51, "stringWithFormat:", v57, v58);
      v59 = (void *)objc_claimAutoreleasedReturnValue();

      -[VPNController alwaysOnGroupTitleSpecifier](v285, "alwaysOnGroupTitleSpecifier");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      v344 = *MEMORY[0x24BE75A68];
      v345 = v59;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v345, &v344, 1);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "setProperties:", v61);

    }
    goto LABEL_106;
  }
  -[VPNController setCurrentEnterpriseVPNSpecifiers:](self, "setCurrentEnterpriseVPNSpecifiers:", 0);
  v62 = v8;
  v63 = v6;
  v257 = v6;
  if (v6 | v62)
  {
    -[VPNController enterpriseGroupTitleSpecifier](self, "enterpriseGroupTitleSpecifier");
    v64 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v64)
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v65 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNController setEnterpriseGroupTitleSpecifier:](self, "setEnterpriseGroupTitleSpecifier:", v65);

    }
    -[VPNController enterpriseGroupTitleSpecifier](self, "enterpriseGroupTitleSpecifier");
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v66);

    if (v6)
    {
      objc_msgSend(v3, "currentConnectionWithGrade:", 0);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
      if (v67)
        goto LABEL_21;
    }
    else
    {
      v67 = 0;
    }
    if (v62)
    {
      objc_msgSend(v3, "currentConnectionWithGrade:", 7);
      v67 = (void *)objc_claimAutoreleasedReturnValue();
    }
LABEL_21:
    if (v67)
    {
LABEL_35:
      v75 = objc_msgSend(v67, "grade");
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v76 = (void *)objc_claimAutoreleasedReturnValue();
      v77 = v76;
      if (v75 == 7)
      {
        objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("RELAY_STATUS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v78 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v78, self, 0, sel_getDeviceRelayStateForSpecifier_, 0, 4, 0);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNController setConnectEnterpriseSpecifier:](self, "setConnectEnterpriseSpecifier:", v79);
        -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
        v80 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v80);

        -[VPNController enterpriseGroupTitleSpecifier](self, "enterpriseGroupTitleSpecifier");
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v81, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
      }
      else
      {
        objc_msgSend(v76, "localizedStringForKey:value:table:", CFSTR("VPN_STATUS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v82 = objc_claimAutoreleasedReturnValue();

        v281 = (void *)v82;
        objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v82, self, sel_setEnterpriseConnectionState_forSpecifier_, sel_getEnterpriseConnectionStateForSpecifier_, 0, 6, 0);
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v83 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_CANCEL"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setCancelButton:", v84);

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v85, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_OK_ABBREVIATED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v86 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setOkButton:", v86);

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v87, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v88 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setTitle:", v88);

        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v89 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v89, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v90 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setPrompt:", v90);

        v340[0] = *MEMORY[0x24BE75978];
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v91 = (void *)objc_claimAutoreleasedReturnValue();
        v341[0] = v91;
        v340[1] = *MEMORY[0x24BE75948];
        v341[1] = objc_opt_class();
        v340[2] = *MEMORY[0x24BE75A18];
        v92 = (void *)MEMORY[0x24BDD16E0];
        if (objc_msgSend(v67, "onDemandAction") == 2)
          v93 = 0;
        else
          v93 = objc_msgSend(v67, "isProviderAvailable");
        objc_msgSend(v92, "numberWithInt:", v93);
        v94 = (void *)objc_claimAutoreleasedReturnValue();
        v341[2] = v94;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v341, v340, 3);
        v95 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setProperties:", v95);

        v338 = CFSTR("vpn-status");
        objc_msgSend(v67, "statusText");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        v339 = v96;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v339, &v338, 1);
        v97 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v79, "setUserInfo:", v97);

        objc_msgSend(v79, "setConfirmationAction:", sel_confirmAirplaneModeDisable_);
        objc_msgSend(v79, "setConfirmationCancelAction:", sel_cancelAirplaneModeDisable_);
        -[VPNController setConnectEnterpriseSpecifier:](self, "setConnectEnterpriseSpecifier:", v79);
        -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v98);

        -[VPNController messageForConnection:](self, "messageForConnection:", v67);
        v81 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNController enterpriseGroupTitleSpecifier](self, "enterpriseGroupTitleSpecifier");
        v99 = (void *)objc_claimAutoreleasedReturnValue();
        v100 = v99;
        if (v81)
        {
          v336 = *MEMORY[0x24BE75A68];
          v337 = v81;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v337, &v336, 1);
          v101 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v100, "setProperties:", v101);

        }
        else
        {
          objc_msgSend(v99, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
        }

        v78 = v281;
      }

      v63 = v257;
      goto LABEL_45;
    }
    if (v63)
    {
      v308 = 0u;
      v309 = 0u;
      v306 = 0u;
      v307 = 0u;
      objc_msgSend(v3, "vpnServicesForCurrentSetWithGrade:", 0);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v69 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v306, v343, 16);
      if (v69)
      {
        v70 = v69;
        v71 = *(_QWORD *)v307;
        while (2)
        {
          for (i = 0; i != v70; ++i)
          {
            if (*(_QWORD *)v307 != v71)
              objc_enumerationMutation(v68);
            v73 = *(_QWORD *)(*((_QWORD *)&v306 + 1) + 8 * i);
            if (v73)
            {
              objc_msgSend(v3, "setActiveVPNID:withGrade:", v73, 0);
              goto LABEL_33;
            }
          }
          v70 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v306, v343, 16);
          if (v70)
            continue;
          break;
        }
      }
LABEL_33:
      v74 = 0;
    }
    else
    {
      if (!v62)
        goto LABEL_45;
      v304 = 0u;
      v305 = 0u;
      v302 = 0u;
      v303 = 0u;
      v74 = 7;
      objc_msgSend(v3, "vpnServicesForCurrentSetWithGrade:", 7);
      v68 = (void *)objc_claimAutoreleasedReturnValue();
      v252 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v302, v342, 16);
      if (v252)
      {
        v253 = v252;
        v254 = *(_QWORD *)v303;
        v74 = 7;
        while (2)
        {
          for (j = 0; j != v253; ++j)
          {
            if (*(_QWORD *)v303 != v254)
              objc_enumerationMutation(v68);
            v256 = *(_QWORD *)(*((_QWORD *)&v302 + 1) + 8 * j);
            if (v256)
            {
              v74 = 7;
              objc_msgSend(v3, "setActiveVPNID:withGrade:", v256, 7);
              goto LABEL_123;
            }
          }
          v253 = objc_msgSend(v68, "countByEnumeratingWithState:objects:count:", &v302, v342, 16);
          if (v253)
            continue;
          break;
        }
LABEL_123:
        v63 = v257;
      }
    }

    objc_msgSend(v3, "currentConnectionWithGrade:", v74);
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    if (v67)
      goto LABEL_35;
LABEL_45:
    v102 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[VPNController setCurrentEnterpriseVPNSpecifiers:](self, "setCurrentEnterpriseVPNSpecifiers:", v102);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v103 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v103, "localizedStringForKey:value:table:", CFSTR("ENTERPRISE_VPN_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v104 = (void *)objc_claimAutoreleasedReturnValue();

    if (v62)
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v105 = (void *)objc_claimAutoreleasedReturnValue();
      v106 = v105;
      if (v63)
        v107 = CFSTR("ENTERPRISE_VPN_AND_RELAYS_GROUP_TITLE");
      else
        v107 = CFSTR("ENTERPRISE_RELAYS_GROUP_TITLE");
      objc_msgSend(v105, "localizedStringForKey:value:table:", v107, &stru_24EE4DF70, CFSTR("MobileVPN"));
      v108 = objc_claimAutoreleasedReturnValue();

      v104 = (void *)v108;
    }
    -[VPNController currentEnterpriseVPNSpecifiers](self, "currentEnterpriseVPNSpecifiers");
    v109 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "groupSpecifierWithName:", v104);
    v110 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v109, "addObject:", v110);

    -[VPNController currentEnterpriseVPNSpecifiers](self, "currentEnterpriseVPNSpecifiers");
    v111 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController addListForGrade:toSpecifiers:](self, "addListForGrade:toSpecifiers:", 0, v111);

    -[VPNController currentEnterpriseVPNSpecifiers](self, "currentEnterpriseVPNSpecifiers");
    v112 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController addListForGrade:toSpecifiers:](self, "addListForGrade:toSpecifiers:", 7, v112);

    -[VPNController currentEnterpriseVPNSpecifiers](self, "currentEnterpriseVPNSpecifiers");
    v113 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v113);

  }
  -[VPNController setCurrentPersonalVPNSpecifiers:](self, "setCurrentPersonalVPNSpecifiers:", 0);
  v114 = v276;
  if (v14)
  {
    -[VPNController personalGroupTitleSpecifier](self, "personalGroupTitleSpecifier");
    v115 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v115)
    {
      v116 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v117 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v117, "localizedStringForKey:value:table:", CFSTR("PERSONAL_VPN_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v118 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v116, "groupSpecifierWithName:", v118);
      v119 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNController setPersonalGroupTitleSpecifier:](self, "setPersonalGroupTitleSpecifier:", v119);

    }
    -[VPNController personalGroupTitleSpecifier](self, "personalGroupTitleSpecifier");
    v120 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v120);

    objc_msgSend(v3, "currentConnectionWithGrade:", 1);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121)
      goto LABEL_66;
    v300 = 0u;
    v301 = 0u;
    v298 = 0u;
    v299 = 0u;
    objc_msgSend(v3, "vpnServicesForCurrentSetWithGrade:", 1);
    v122 = (void *)objc_claimAutoreleasedReturnValue();
    v123 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v298, v335, 16);
    if (v123)
    {
      v124 = v123;
      v125 = *(_QWORD *)v299;
      while (2)
      {
        for (k = 0; k != v124; ++k)
        {
          if (*(_QWORD *)v299 != v125)
            objc_enumerationMutation(v122);
          v127 = *(_QWORD *)(*((_QWORD *)&v298 + 1) + 8 * k);
          if (v127)
          {
            objc_msgSend(v3, "setActiveVPNID:withGrade:", v127, 1);
            goto LABEL_65;
          }
        }
        v124 = objc_msgSend(v122, "countByEnumeratingWithState:objects:count:", &v298, v335, 16);
        if (v124)
          continue;
        break;
      }
    }
LABEL_65:

    objc_msgSend(v3, "currentConnectionWithGrade:", 1);
    v121 = (void *)objc_claimAutoreleasedReturnValue();
    if (v121)
    {
LABEL_66:
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v128 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v128, "localizedStringForKey:value:table:", CFSTR("STATUS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v129 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE754D0], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v129, self, sel_setPersonalConnectionState_forSpecifier_, sel_getPersonalConnectionStateForSpecifier_, 0, 6, 0);
      v130 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v131 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_CANCEL"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v132 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setCancelButton:", v132);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v133 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v133, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_OK_ABBREVIATED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v134 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setOkButton:", v134);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v135 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v135, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v136 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setTitle:", v136);

      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v137 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v137, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v138 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setPrompt:", v138);

      v333[0] = *MEMORY[0x24BE75978];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
      v139 = (void *)objc_claimAutoreleasedReturnValue();
      v334[0] = v139;
      v333[1] = *MEMORY[0x24BE75948];
      v334[1] = objc_opt_class();
      v333[2] = *MEMORY[0x24BE75A18];
      v140 = objc_msgSend(v121, "onDemandAction");
      v141 = &unk_24EE55118;
      if (v140 == 2)
        v141 = &unk_24EE55100;
      v334[2] = v141;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v334, v333, 3);
      v142 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setProperties:", v142);

      v331 = CFSTR("vpn-status");
      objc_msgSend(v121, "statusText");
      v143 = (void *)objc_claimAutoreleasedReturnValue();
      v332 = v143;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v332, &v331, 1);
      v144 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v130, "setUserInfo:", v144);

      objc_msgSend(v130, "setConfirmationAction:", sel_confirmAirplaneModeDisable_);
      objc_msgSend(v130, "setConfirmationCancelAction:", sel_cancelAirplaneModeDisable_);
      -[VPNController setConnectPersonalSpecifier:](self, "setConnectPersonalSpecifier:", v130);
      -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
      v145 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "addObject:", v145);

      -[VPNController messageForConnection:](self, "messageForConnection:", v121);
      v146 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNController personalGroupTitleSpecifier](self, "personalGroupTitleSpecifier");
      v147 = (void *)objc_claimAutoreleasedReturnValue();
      v148 = v147;
      if (v146)
      {
        v329 = *MEMORY[0x24BE75A68];
        v330 = v146;
        objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v330, &v329, 1);
        v149 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v148, "setProperties:", v149);

      }
      else
      {
        objc_msgSend(v147, "removePropertyForKey:", *MEMORY[0x24BE75A68]);
      }

      v63 = v257;
      v114 = v276;
    }
    v150 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[VPNController setCurrentPersonalVPNSpecifiers:](self, "setCurrentPersonalVPNSpecifiers:", v150);

    -[VPNController currentPersonalVPNSpecifiers](self, "currentPersonalVPNSpecifiers");
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v151, "addObject:", v152);

    -[VPNController currentPersonalVPNSpecifiers](self, "currentPersonalVPNSpecifiers");
    v153 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController addListForGrade:toSpecifiers:](self, "addListForGrade:toSpecifiers:", 1, v153);

    -[VPNController currentPersonalVPNSpecifiers](self, "currentPersonalVPNSpecifiers");
    v154 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObjectsFromArray:", v154);

  }
  if (v114)
  {
    v155 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v156 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v156, "localizedStringForKey:value:table:", CFSTR("APP_RELAY_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v155, "groupSpecifierWithName:", v157);
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v158);

    objc_msgSend(v3, "vpnServicesForCurrentSetWithGrade:", 8);
    v294 = 0u;
    v295 = 0u;
    v296 = 0u;
    v297 = 0u;
    obj = (id)objc_claimAutoreleasedReturnValue();
    v277 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v294, v328, 16);
    if (v277)
    {
      v272 = *MEMORY[0x24BE75C60];
      v274 = *(_QWORD *)v295;
      v270 = *MEMORY[0x24BE75948];
      v267 = *MEMORY[0x24BE759F8];
      do
      {
        for (m = 0; m != v277; ++m)
        {
          if (*(_QWORD *)v295 != v274)
            objc_enumerationMutation(obj);
          v160 = *(_QWORD *)(*((_QWORD *)&v294 + 1) + 8 * m);
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v161 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v161, "connectionWithServiceID:withGrade:", v160, 8);
          v162 = (void *)objc_claimAutoreleasedReturnValue();

          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v163 = (void *)objc_claimAutoreleasedReturnValue();
          v164 = objc_msgSend(v163, "isProfileBacked:", v160);

          v165 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v162, "displayName");
          v166 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v165, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v166, v285, 0, 0, objc_opt_class(), 2, 0);
          v167 = (void *)objc_claimAutoreleasedReturnValue();

          v327[0] = CFSTR("VPNSetupListController");
          v326[0] = v272;
          v326[1] = v270;
          v168 = objc_opt_class();
          v326[2] = v267;
          v327[1] = v168;
          v327[2] = CFSTR("VPNSetupListController");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v327, v326, 3);
          v169 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "setProperties:", v169);

          v324[0] = CFSTR("vpn-service-id");
          objc_msgSend(v162, "serviceID");
          v282 = (void *)objc_claimAutoreleasedReturnValue();
          v325[0] = v282;
          v325[1] = &unk_24EE55100;
          v324[1] = CFSTR("vpn-user-created");
          v324[2] = CFSTR("vpn-organization");
          objc_msgSend(v162, "serviceID");
          v170 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v284, "organizationForServiceID:", v170);
          v171 = (void *)objc_claimAutoreleasedReturnValue();
          v325[2] = v171;
          v324[3] = CFSTR("vpn-status");
          objc_msgSend(v162, "statusText");
          v172 = (void *)objc_claimAutoreleasedReturnValue();
          v325[3] = v172;
          v324[4] = CFSTR("vpn-status-value");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v162, "status"));
          v173 = (void *)objc_claimAutoreleasedReturnValue();
          v325[4] = v173;
          v325[5] = &unk_24EE55130;
          v324[5] = CFSTR("service-grade");
          v324[6] = CFSTR("overview-mode");
          v325[6] = &unk_24EE55118;
          v324[7] = CFSTR("vpn-profile-backed");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v164);
          v174 = (void *)objc_claimAutoreleasedReturnValue();
          v325[7] = v174;
          v324[8] = CFSTR("vpn-alert");
          objc_msgSend(v162, "alertText");
          v175 = (void *)objc_claimAutoreleasedReturnValue();
          v325[8] = v175;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v325, v324, 9);
          v176 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v167, "setUserInfo:", v176);

          objc_msgSend(v269, "addObject:", v167);
        }
        v277 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v294, v328, 16);
      }
      while (v277);
    }

    v3 = v284;
    self = v285;
    v20 = v269;
    v63 = v257;
  }
  v177 = v259;
  if (v258)
  {
    -[VPNController appGroupTitleSpecifier](self, "appGroupTitleSpecifier");
    v178 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v178)
    {
      v179 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v180 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v180, "localizedStringForKey:value:table:", CFSTR("APP_VPN_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v181 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v179, "groupSpecifierWithName:", v181);
      v182 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNController setAppGroupTitleSpecifier:](self, "setAppGroupTitleSpecifier:", v182);

    }
    -[VPNController appGroupTitleSpecifier](self, "appGroupTitleSpecifier");
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "addObject:", v183);

    -[VPNController setCurrentAppVPNSpecifiers:](self, "setCurrentAppVPNSpecifiers:", 0);
    objc_msgSend(v3, "vpnServicesForCurrentSetWithGrade:", 2);
    v290 = 0u;
    v291 = 0u;
    v292 = 0u;
    v293 = 0u;
    v262 = (id)objc_claimAutoreleasedReturnValue();
    v271 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v290, v323, 16);
    if (v271)
    {
      obja = (id)*MEMORY[0x24BE75C60];
      v268 = *(_QWORD *)v291;
      v263 = *MEMORY[0x24BE759F8];
      v264 = *MEMORY[0x24BE75948];
      do
      {
        for (n = 0; n != v271; ++n)
        {
          if (*(_QWORD *)v291 != v268)
            objc_enumerationMutation(v262);
          v185 = *(_QWORD *)(*((_QWORD *)&v290 + 1) + 8 * n);
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v186 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v186, "connectionWithServiceID:withGrade:", v185, 2);
          v187 = (void *)objc_claimAutoreleasedReturnValue();

          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v188 = (void *)objc_claimAutoreleasedReturnValue();
          v283 = objc_msgSend(v188, "isProfileBacked:", v185);

          v189 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(v187, "displayName");
          v190 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v189, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v190, self, 0, 0, objc_opt_class(), 2, 0);
          v191 = (void *)objc_claimAutoreleasedReturnValue();

          v322[0] = CFSTR("VPNSetupListController");
          v321[0] = obja;
          v321[1] = v264;
          v192 = objc_opt_class();
          v321[2] = v263;
          v322[1] = v192;
          v322[2] = CFSTR("VPNSetupListController");
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v322, v321, 3);
          v193 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v191, "setProperties:", v193);

          v319[0] = CFSTR("vpn-service-id");
          objc_msgSend(v187, "serviceID");
          v278 = (void *)objc_claimAutoreleasedReturnValue();
          v320[0] = v278;
          v319[1] = CFSTR("vpn-user-created");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
          v275 = (void *)objc_claimAutoreleasedReturnValue();
          v320[1] = v275;
          v319[2] = CFSTR("vpn-organization");
          objc_msgSend(v187, "serviceID");
          v273 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "organizationForServiceID:", v273);
          v194 = (void *)objc_claimAutoreleasedReturnValue();
          v320[2] = v194;
          v319[3] = CFSTR("vpn-status");
          objc_msgSend(v187, "statusText");
          v195 = (void *)objc_claimAutoreleasedReturnValue();
          v320[3] = v195;
          v319[4] = CFSTR("vpn-status-value");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", objc_msgSend(v187, "status"));
          v196 = (void *)objc_claimAutoreleasedReturnValue();
          v320[4] = v196;
          v319[5] = CFSTR("service-grade");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
          v197 = (void *)objc_claimAutoreleasedReturnValue();
          v320[5] = v197;
          v319[6] = CFSTR("overview-mode");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
          v198 = (void *)objc_claimAutoreleasedReturnValue();
          v320[6] = v198;
          v319[7] = CFSTR("vpn-profile-backed");
          objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v283);
          v199 = (void *)objc_claimAutoreleasedReturnValue();
          v320[7] = v199;
          objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v320, v319, 8);
          v200 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v191, "setUserInfo:", v200);

          self = v285;
          -[VPNController currentAppVPNSpecifiers](v285, "currentAppVPNSpecifiers");
          v201 = (void *)objc_claimAutoreleasedReturnValue();

          if (!v201)
          {
            v202 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
            -[VPNController setCurrentAppVPNSpecifiers:](v285, "setCurrentAppVPNSpecifiers:", v202);

          }
          -[VPNController currentAppVPNSpecifiers](v285, "currentAppVPNSpecifiers");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "addObject:", v191);

          v3 = v284;
        }
        v271 = objc_msgSend(v262, "countByEnumeratingWithState:objects:count:", &v290, v323, 16);
      }
      while (v271);
    }
    v288 = 0u;
    v289 = 0u;
    v286 = 0u;
    v287 = 0u;
    -[VPNController currentAppVPNSpecifiers](self, "currentAppVPNSpecifiers");
    v204 = (void *)objc_claimAutoreleasedReturnValue();
    v205 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v286, v318, 16);
    v177 = v259;
    if (v205)
    {
      v206 = v205;
      v207 = *(_QWORD *)v287;
      do
      {
        for (ii = 0; ii != v206; ++ii)
        {
          if (*(_QWORD *)v287 != v207)
            objc_enumerationMutation(v204);
          objc_msgSend(v269, "addObject:", *(_QWORD *)(*((_QWORD *)&v286 + 1) + 8 * ii));
        }
        v206 = objc_msgSend(v204, "countByEnumeratingWithState:objects:count:", &v286, v318, 16);
      }
      while (v206);
    }

    v63 = v257;
  }
  if (-[VPNController shouldHideAddVPNButton](self, "shouldHideAddVPNButton"))
  {
    if (v258 | v63 | v177)
      goto LABEL_107;
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v316 = *MEMORY[0x24BE75A68];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v209 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v209, "localizedStringForKey:value:table:", CFSTR("VPN_RESTRICTED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v210 = (void *)objc_claimAutoreleasedReturnValue();
    v317 = v210;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v317, &v316, 1);
    v211 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setProperties:", v211);

    objc_msgSend(v269, "addObject:", v27);
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v212, "localizedStringForKey:value:table:", CFSTR("PRIVACY_BLURB"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v213 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v214 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v214, "localizedStringForKey:value:table:", CFSTR("PRIVACY_LINK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v215 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v213, "stringByAppendingString:", v215);
    v216 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v217 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController setPrivacyLinkSpecifier:](v285, "setPrivacyLinkSpecifier:", v217);

    -[VPNController privacyLinkSpecifier](v285, "privacyLinkSpecifier");
    v218 = (void *)objc_claimAutoreleasedReturnValue();
    v314[0] = *MEMORY[0x24BE75A30];
    v219 = (objc_class *)objc_opt_class();
    NSStringFromClass(v219);
    v220 = (void *)objc_claimAutoreleasedReturnValue();
    v221 = *MEMORY[0x24BE75A58];
    v315[0] = v220;
    v315[1] = v216;
    v222 = *MEMORY[0x24BE75A40];
    v314[1] = v221;
    v314[2] = v222;
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v223 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v223, "localizedStringForKey:value:table:", CFSTR("PRIVACY_LINK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v224 = (void *)objc_claimAutoreleasedReturnValue();
    v350.location = objc_msgSend(v216, "rangeOfString:", v224);
    NSStringFromRange(v350);
    v225 = (void *)objc_claimAutoreleasedReturnValue();
    v315[2] = v225;
    v314[3] = *MEMORY[0x24BE75A50];
    objc_msgSend(MEMORY[0x24BDD1968], "valueWithNonretainedObject:", v285);
    v226 = (void *)objc_claimAutoreleasedReturnValue();
    v315[3] = v226;
    v314[4] = *MEMORY[0x24BE75A38];
    NSStringFromSelector(sel_privacyLinkAction);
    v227 = (void *)objc_claimAutoreleasedReturnValue();
    v315[4] = v227;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v315, v314, 5);
    v228 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v218, "setProperties:", v228);

    v27 = v216;
    self = v285;

    v3 = v284;
    -[VPNController privacyLinkSpecifier](v285, "privacyLinkSpecifier");
    v229 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "addObject:", v229);

    v230 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v231 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v231, "localizedStringForKey:value:table:", CFSTR("OTHER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v232 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v230, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v232, v285, 0, 0, objc_opt_class(), 13, 0);
    v233 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNController setAddVPNButtonSpecifier:](v285, "setAddVPNButtonSpecifier:", v233);

    -[VPNController addVPNButtonSpecifier](v285, "addVPNButtonSpecifier");
    v234 = (void *)objc_claimAutoreleasedReturnValue();
    v312[0] = CFSTR("service-grade");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 0);
    v235 = (void *)objc_claimAutoreleasedReturnValue();
    v313[0] = v235;
    v312[1] = CFSTR("overview-mode");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 0);
    v236 = (void *)objc_claimAutoreleasedReturnValue();
    v313[1] = v236;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v313, v312, 2);
    v237 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v234, "setUserInfo:", v237);

    -[VPNController addVPNButtonSpecifier](v285, "addVPNButtonSpecifier");
    v238 = (void *)objc_claimAutoreleasedReturnValue();
    v310 = *MEMORY[0x24BE75C60];
    v311 = CFSTR("VPNSetupListController");
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v311, &v310, 1);
    v239 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v238, "setProperties:", v239);

    -[VPNController addVPNButtonSpecifier](v285, "addVPNButtonSpecifier");
    v240 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v240, "setButtonAction:", sel_addVPNConfiguration_);

    -[VPNController addVPNButtonSpecifier](v285, "addVPNButtonSpecifier");
    v241 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v269, "addObject:", v241);

  }
LABEL_106:

LABEL_107:
  if (v260)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
    v242 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v242, "objectForKey:", CFSTR("vpn-show-dns"));
    v243 = (void *)objc_claimAutoreleasedReturnValue();

    if (v243)
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v244 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v269, "addObject:", v244);
      v245 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v246 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v246, "localizedStringForKey:value:table:", CFSTR("DNS_SETTINGS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v245, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v247, self, 0, sel_getDNSSummary_, objc_opt_class(), 2, 0);
      v248 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v269, "addObject:", v248);
    }
  }
  v249 = *(Class *)((char *)&self->super.super.super.super.super.isa + v261);
  *(Class *)((char *)&self->super.super.super.super.super.isa + v261) = (Class)v269;

  v19 = *(Class *)((char *)&self->super.super.super.super.super.isa + v261);
LABEL_111:
  v250 = v19;

  return v250;
}

- (id)getDNSSummary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  _QWORD v8[6];
  _QWORD v9[3];
  int v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_DNS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  v9[0] = 0;
  v9[1] = v9;
  v9[2] = 0x2020000000;
  v10 = 0;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __31__VPNController_getDNSSummary___block_invoke;
  v8[3] = &unk_24EE4DEC0;
  v8[4] = v9;
  v8[5] = &v11;
  objc_msgSend(v5, "iterateDNSServicesWithBlock:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(v9, 8);
  _Block_object_dispose(&v11, 8);

  return v6;
}

BOOL __31__VPNController_getDNSSummary___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  int v7;
  int v8;
  _BOOL8 v9;
  void *v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;

  v5 = a2;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEnabledWithServiceID:withGrade:", v5, a3);

  if (v7)
  {
    v8 = ++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
    v9 = v8 == 1;
    if (v8 == 1)
    {
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "optionsForServiceID:withGrade:", v5, a3);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v11)
      {
        v9 = 1;
        goto LABEL_9;
      }
      objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("dispName"));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_DNS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v12 = objc_claimAutoreleasedReturnValue();
    }
    v13 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v14 = *(void **)(v13 + 40);
    *(_QWORD *)(v13 + 40) = v12;

LABEL_9:
    goto LABEL_10;
  }
  v9 = 1;
LABEL_10:

  return v9;
}

- (id)dnsStatusForSpecifier:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;
  _QWORD v8[4];
  id v9;
  uint64_t *v10;
  uint64_t v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t (*v14)(uint64_t, uint64_t);
  void (*v15)(uint64_t);
  id v16;

  v3 = a3;
  v11 = 0;
  v12 = &v11;
  v13 = 0x3032000000;
  v14 = __Block_byref_object_copy_;
  v15 = __Block_byref_object_dispose_;
  v16 = 0;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __39__VPNController_dnsStatusForSpecifier___block_invoke;
  v8[3] = &unk_24EE4DA30;
  v5 = v3;
  v9 = v5;
  v10 = &v11;
  objc_msgSend(v4, "iterateDNSServicesWithBlock:", v8);

  v6 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v6;
}

uint64_t __39__VPNController_dnsStatusForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  int v12;
  void *v13;
  void *v14;
  const __CFString *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;

  v5 = a2;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)(a1 + 32), "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "isEqualToString:", v9);

  if (v10)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "isEnabledWithServiceID:withGrade:", v5, a3);

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = v13;
    if (v12)
      v15 = CFSTR("ON");
    else
      v15 = CFSTR("OFF");
    objc_msgSend(v13, "localizedStringForKey:value:table:", v15, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v16 = objc_claimAutoreleasedReturnValue();
    v17 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v18 = *(void **)(v17 + 40);
    *(_QWORD *)(v17 + 40) = v16;

  }
  return v10 ^ 1u;
}

- (id)tableView:(id)a3 cellForRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  _BOOL8 v36;
  objc_super v38;

  v6 = a4;
  v7 = a3;
  v8 = -[VPNController indexForIndexPath:](self, "indexForIndexPath:", v6);
  v38.receiver = self;
  v38.super_class = (Class)VPNController;
  -[VPNController tableView:cellForRowAtIndexPath:](&v38, sel_tableView_cellForRowAtIndexPath_, v7, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "userInfo");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v11)
    goto LABEL_27;
  -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v12)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 0;
    goto LABEL_6;
  }
  -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10 == v13)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = v14;
    v16 = 1;
LABEL_6:
    objc_msgSend(v14, "currentConnectionWithGrade:", v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v17, "statusText");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "detailTextLabel");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setText:", v18);

  }
  -[VPNController addVPNButtonSpecifier](self, "addVPNButtonSpecifier");
  v20 = objc_claimAutoreleasedReturnValue();
  if (v10 == (void *)v20)
  {

  }
  else
  {
    v21 = (void *)v20;
    -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
    v22 = objc_claimAutoreleasedReturnValue();
    if (v10 == (void *)v22)
    {

    }
    else
    {
      v23 = (void *)v22;
      -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
      v24 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10 != v24)
        objc_msgSend(v9, "setAccessoryType:", 4);
    }
  }
  objc_msgSend(v10, "propertyForKey:", *MEMORY[0x24BE75948]);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_opt_class();

  if (v25 == (void *)v26 && (objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("vpn-service-id"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "objectForKey:", CFSTR("service-grade"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v28, "isActiveVPNID:withGrade:", v27, objc_msgSend(v29, "unsignedIntegerValue"));

    objc_msgSend(v9, "setChecked:", v30);
  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("vpn-organization"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setSubtitle:", v31);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("vpn-alert"));
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setAlert:", v32);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("vpn-status"));
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setVpnPrimaryTableCellStatus:", v33);

  }
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v11, "objectForKey:", CFSTR("vpn-status-value"));
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (v34)
    {
      objc_msgSend(v11, "objectForKey:", CFSTR("vpn-status-value"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      v36 = objc_msgSend(v35, "unsignedIntegerValue") == 5;

    }
    else
    {
      v36 = 0;
    }

    objc_msgSend(v9, "setDisabled:", v36);
  }
LABEL_27:

  return v9;
}

- (void)tableView:(id)a3 accessoryButtonTappedForRowWithIndexPath:(id)a4
{
  uint64_t v5;
  id v6;
  id WeakRetained;
  char *v8;

  v5 = -[VPNController indexForIndexPath:](self, "indexForIndexPath:", a4);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v5);
  v8 = (char *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(*(Class *)&v8[*MEMORY[0x24BE75740]]);
  if (!v6)
    v6 = objc_alloc_init(MEMORY[0x24BE754E8]);
  objc_msgSend(0, "pushViewController:animated:", v6, 1);
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                            + (int)*MEMORY[0x24BE757A0]));
  objc_msgSend(v6, "setRootController:", WeakRetained);

  objc_msgSend(v6, "setParentController:", self);
  objc_msgSend(v6, "setSpecifier:", v8);
  -[VPNController showController:](self, "showController:", v6);

}

- (void)changeActiveVPN:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  char v8;
  void *v9;
  id v10;

  objc_msgSend(a3, "userInfo");
  v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("vpn-service-id"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "objectForKey:", CFSTR("service-grade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "unsignedIntegerValue");

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "isActiveVPNID:withGrade:", v4, v6);

  if ((v8 & 1) == 0)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "setActiveVPNID:withGrade:", v4, v6);

  }
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]), "selectRowAtIndexPath:animated:scrollPosition:", 0, 0, 0);

}

- (void)tableView:(id)a3 didSelectRowAtIndexPath:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  objc_super v18;

  v6 = a3;
  v7 = a4;
  v8 = -[VPNController indexForIndexPath:](self, "indexForIndexPath:", v7);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "propertyForKey:", *MEMORY[0x24BE75948]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_opt_class();

  if (v10 == (void *)v11)
  {
    objc_msgSend(v9, "userInfo");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = v15;
    if (v15)
    {
      objc_msgSend(v15, "objectForKey:", CFSTR("vpn-service-id"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();

      if (v17)
        -[VPNController changeActiveVPN:](self, "changeActiveVPN:", v9);
    }

  }
  else
  {
    -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
    v12 = objc_claimAutoreleasedReturnValue();
    if (v9 == (void *)v12)
    {

    }
    else
    {
      v13 = (void *)v12;
      -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      if (v9 != v14)
      {
        v18.receiver = self;
        v18.super_class = (Class)VPNController;
        -[VPNController tableView:didSelectRowAtIndexPath:](&v18, sel_tableView_didSelectRowAtIndexPath_, v6, v7);
      }
    }
  }

}

- (void)confirmAirplaneModeDisable:(id)a3
{
  id v4;
  id v5;
  void *v6;
  id v7;

  v7 = a3;
  +[VPNBundleController disableAirplaneMode](VPNBundleController, "disableAirplaneMode");
  -[VPNController connectPersonalSpecifier](self, "connectPersonalSpecifier");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  if (v4 == v7)
  {
    -[VPNController setPersonalVPNActive:specifier:](self, "setPersonalVPNActive:specifier:", 1, 0);
    goto LABEL_5;
  }
  -[VPNController connectEnterpriseSpecifier](self, "connectEnterpriseSpecifier");
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v6 = v7;
  if (v5 == v7)
  {
    -[VPNController setEnterpriseVPNActive:specifier:](self, "setEnterpriseVPNActive:specifier:", 1, 0);
LABEL_5:
    v6 = v7;
  }

}

- (void)alertView:(id)a3 willDismissWithButtonIndex:(int64_t)a4
{
  -[VPNController reloadSpecifierAtIndex:](self, "reloadSpecifierAtIndex:", 1, a4);
}

- (void)handleURL:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("path"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("LocalAuthenticationTrigger")))
  {
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("configID"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("sender"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "triggerLocalAuthenticationForConfigurationIdentifier:requestedByApp:", v4, v5);

  }
}

- (void)privacyLinkAction
{
  id v3;

  objc_msgSend(MEMORY[0x24BE6E438], "presenterForPrivacySplashWithIdentifier:", CFSTR("com.apple.onboarding.vpn"));
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setPresentingViewController:", self);
  objc_msgSend(v3, "present");

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
  v17.super_class = (Class)VPNController;
  -[VPNController viewDidAppear:](&v17, sel_viewDidAppear_, a3);
  objc_msgSend(MEMORY[0x24BDBCF48], "URLWithString:", CFSTR("settings-navigation://com.apple.Settings.General/ManagedConfigurationList/VPN"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bundleURL");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_alloc(MEMORY[0x24BDD19B8]);
  objc_msgSend(MEMORY[0x24BDBCEA0], "currentLocale");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v7, "initWithKey:table:locale:bundleURL:", CFSTR("VPN"), 0, v8, v6);

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
  -[VPNController pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:](self, "pe_emitNavigationEventForSystemSettingsWithGraphicIconIdentifier:title:localizedNavigationComponents:deepLink:", CFSTR("com.apple.graphic-icon.vpn"), v9, v16, v4);

}

- (PSSpecifier)connectEnterpriseSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1376, 1);
}

- (void)setConnectEnterpriseSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1376);
}

- (PSSpecifier)connectPersonalSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1384, 1);
}

- (void)setConnectPersonalSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1384);
}

- (PSSpecifier)currentAOVPNSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1392, 1);
}

- (void)setCurrentAOVPNSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1392);
}

- (NSMutableArray)currentAppVPNSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1400, 1);
}

- (void)setCurrentAppVPNSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1400);
}

- (NSMutableArray)currentEnterpriseVPNSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1408, 1);
}

- (void)setCurrentEnterpriseVPNSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1408);
}

- (NSMutableArray)currentPersonalVPNSpecifiers
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1416, 1);
}

- (void)setCurrentPersonalVPNSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1416);
}

- (PSSpecifier)alwaysOnGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1424, 1);
}

- (void)setAlwaysOnGroupTitleSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1424);
}

- (PSSpecifier)enterpriseGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1432, 1);
}

- (void)setEnterpriseGroupTitleSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1432);
}

- (PSSpecifier)personalGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setPersonalGroupTitleSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (PSSpecifier)appGroupTitleSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setAppGroupTitleSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (PSSpecifier)addVPNButtonSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setAddVPNButtonSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1456);
}

- (PSSpecifier)privacyLinkSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setPrivacyLinkSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1464);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_privacyLinkSpecifier, 0);
  objc_storeStrong((id *)&self->_addVPNButtonSpecifier, 0);
  objc_storeStrong((id *)&self->_appGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_personalGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_enterpriseGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_alwaysOnGroupTitleSpecifier, 0);
  objc_storeStrong((id *)&self->_currentPersonalVPNSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentEnterpriseVPNSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentAppVPNSpecifiers, 0);
  objc_storeStrong((id *)&self->_currentAOVPNSpecifier, 0);
  objc_storeStrong((id *)&self->_connectPersonalSpecifier, 0);
  objc_storeStrong((id *)&self->_connectEnterpriseSpecifier, 0);
}

@end

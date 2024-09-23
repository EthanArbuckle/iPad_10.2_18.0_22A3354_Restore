@implementation VPNSetupListController

- (void)vpnConfigurationChanged:(id)a3
{
  if (-[VPNSetupListController overviewMode](self, "overviewMode", a3))
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
}

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
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  objc_destroyWeak(&location);
}

- (void)timerUpdated:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  -[VPNSetupListController timeSpecifierArray](self, "timeSpecifierArray", a3, 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v11;
    do
    {
      v8 = 0;
      do
      {
        if (*(_QWORD *)v11 != v7)
          objc_enumerationMutation(v4);
        -[VPNSetupListController reloadSpecifier:](self, "reloadSpecifier:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v8++));
      }
      while (v6 != v8);
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v6);
  }

  -[VPNSetupListController timeSpecifier](self, "timeSpecifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController reloadSpecifier:](self, "reloadSpecifier:", v9);

}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v7;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:name:object:", self, kNotificationVPNConnectionStatusChanged, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObserver:name:object:", self, kNotificationVPNConnectionTimerFired, 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VPNNEConfigurationChangedNotification"), 0);

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeObserver:name:object:", self, *MEMORY[0x24BDF75D0], 0);

  v7.receiver = self;
  v7.super_class = (Class)VPNSetupListController;
  -[VPNSetupListController dealloc](&v7, sel_dealloc);
}

- (VPNSetupListController)init
{
  VPNSetupListController *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)VPNSetupListController;
  v2 = -[VPNSetupListController init](&v8, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel_vpnStatusChanged_, kNotificationVPNConnectionStatusChanged, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", v2, sel_timerUpdated_, kNotificationVPNConnectionTimerFired, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "addObserver:selector:name:object:", v2, sel_vpnConfigurationChanged_, CFSTR("VPNNEConfigurationChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "addObserver:selector:name:object:", v2, sel_appWillEnterForeground_, *MEMORY[0x24BDF75D0], 0);

  }
  return v2;
}

- (int64_t)tableViewStyle
{
  return 2;
}

- (id)proxyServer:(id)a3
{
  void *v4;
  __CFString *v5;

  -[VPNSetupListController proxyServer](self, "proxyServer", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPNSetupListController proxyServer](self, "proxyServer");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24EE4DF70;
  }

  return v5;
}

- (void)setProxyServer:(id)a3 specifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController proxyServer](self, "proxyServer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setProxyServer:](self, "setProxyServer:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (id)proxyServerPort:(id)a3
{
  void *v4;
  __CFString *v5;

  -[VPNSetupListController proxyPort](self, "proxyPort", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPNSetupListController proxyPort](self, "proxyPort");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24EE4DF70;
  }

  return v5;
}

- (void)setProxyServerPort:(id)a3 specifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController proxyPort](self, "proxyPort");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setProxyPort:](self, "setProxyPort:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (id)proxyUsername:(id)a3
{
  void *v4;
  __CFString *v5;

  -[VPNSetupListController proxyUsername](self, "proxyUsername", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPNSetupListController proxyUsername](self, "proxyUsername");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24EE4DF70;
  }

  return v5;
}

- (void)setProxyUsername:(id)a3 specifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController proxyUsername](self, "proxyUsername");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setProxyUsername:](self, "setProxyUsername:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (id)proxyPassword:(id)a3
{
  void *v4;
  __CFString *v5;

  -[VPNSetupListController proxyPassword](self, "proxyPassword", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPNSetupListController proxyPassword](self, "proxyPassword");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24EE4DF70;
  }

  return v5;
}

- (void)setProxyPassword:(id)a3 specifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController proxyPassword](self, "proxyPassword");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setProxyPassword:](self, "setProxyPassword:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setProxyUsesAuthentication:(id)a3 specifier:(id)a4
{
  int v5;
  BOOL v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;

  v11 = a3;
  v5 = objc_msgSend(v11, "BOOLValue");
  v6 = v5 == -[VPNSetupListController proxyAuthenticated](self, "proxyAuthenticated");
  v7 = v11;
  if (!v6)
  {
    -[VPNSetupListController setProxyAuthenticated:](self, "setProxyAuthenticated:", objc_msgSend(v11, "BOOLValue"));
    if (v5)
    {
      -[VPNSetupListController setProxyUsername:](self, "setProxyUsername:", 0);
      -[VPNSetupListController setProxyPassword:](self, "setProxyPassword:", 0);
      -[VPNSetupListController proxyAuthSpecifiers](self, "proxyAuthSpecifiers");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v8, CFSTR("PROXY_AUTHENTICATION"), 1);

      -[VPNSetupListController proxyAuthSpecifiers](self, "proxyAuthSpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "lastObject");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollToSpecifier_, v10, 0.3);

    }
    else
    {
      -[VPNSetupListController proxyAuthSpecifiers](self, "proxyAuthSpecifiers");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v9, 1);
    }

    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
    v7 = v11;
  }

}

- (id)proxyUsesAuthentication:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController proxyAuthenticated](self, "proxyAuthenticated", a3));
}

- (id)proxyType:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController proxyType](self, "proxyType", a3));
}

- (void)setProxyType:(id)a3 specifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  int v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  uint64_t v28;
  void *v29;
  uint64_t v30;
  void *v31;
  uint64_t v32;
  void *v33;
  void *v34;
  void *v35;
  id v36;

  v6 = a3;
  -[VPNSetupListController proxyType:](self, "proxyType:", a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "intValue");

  v9 = objc_msgSend(v6, "intValue");
  v10 = objc_msgSend(v6, "unsignedIntegerValue");

  -[VPNSetupListController setProxyType:](self, "setProxyType:", v10);
  -[VPNSetupListController loseFocus](self, "loseFocus");
  v11 = (void *)MEMORY[0x24BDBCEB8];
  -[VPNSetupListController manualProxySpecifiers](self, "manualProxySpecifiers");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "arrayWithArray:", v12);
  v36 = (id)objc_claimAutoreleasedReturnValue();

  -[VPNSetupListController proxyUsesAuthentication:](self, "proxyUsesAuthentication:", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LODWORD(v12) = objc_msgSend(v13, "BOOLValue");

  if ((_DWORD)v12)
  {
    -[VPNSetupListController proxyAuthSpecifiers](self, "proxyAuthSpecifiers");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v36, "addObjectsFromArray:", v14);

  }
  if (!v8 && v9 == 1)
  {
    -[VPNSetupListController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v36, CFSTR("PROXY_TYPE"), 1);
    objc_msgSend(v36, "lastObject");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollToSpecifier_, v15, 0.3);

    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    goto LABEL_14;
  }
  if (!v8 && v9 == 2)
  {
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController insertContiguousSpecifiers:afterSpecifierID:animated:](self, "insertContiguousSpecifiers:afterSpecifierID:animated:", v16, CFSTR("PROXY_TYPE"), 1);

    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "lastObject");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollToSpecifier_, v18, 0.3);

LABEL_12:
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
LABEL_13:
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
    goto LABEL_14;
  }
  if (v8 == 1 && !v9)
  {
    -[VPNSetupListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v36, 1);
    goto LABEL_12;
  }
  if (v8 == 1 && v9 == 2)
  {
    v19 = objc_msgSend(v36, "count") - 1;
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "count") - 1;

    objc_msgSend(v36, "subarrayWithRange:", 1, v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "subarrayWithRange:", 1, v21);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[VPNSetupListController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v22, v24, 1);
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "lastObject");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollToSpecifier_, v26, 0.3);

LABEL_24:
    goto LABEL_25;
  }
  if (v8 == 2 && !v9)
  {
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController removeContiguousSpecifiers:animated:](self, "removeContiguousSpecifiers:animated:", v27, 1);

    goto LABEL_12;
  }
  if (v8 == 2 && v9 == 1)
  {
    v28 = objc_msgSend(v36, "count") - 1;
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v30 = objc_msgSend(v29, "count") - 1;

    objc_msgSend(v36, "subarrayWithRange:", 1, v28);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController pacSpecifiers](self, "pacSpecifiers");
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v31, "subarrayWithRange:", 1, v30);
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    -[VPNSetupListController replaceContiguousSpecifiers:withSpecifiers:animated:](self, "replaceContiguousSpecifiers:withSpecifiers:animated:", v24, v22, 1);
    objc_msgSend(v36, "lastObject");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController performSelector:withObject:afterDelay:](self, "performSelector:withObject:afterDelay:", sel_scrollToSpecifier_, v25, 0.3);
    goto LABEL_24;
  }
LABEL_25:
  if (v9 && v8)
  {
    v32 = -[VPNSetupListController indexOfGroup:](self, "indexOfGroup:", 3);
    v33 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
    -[VPNSetupListController indexPathForIndex:](self, "indexPathForIndex:", v32 + 1);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "cellForRowAtIndexPath:", v34);
    v35 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v35, "becomeFirstResponder");
  }
  -[VPNSetupListController setDirty:](self, "setDirty:", 1);
  if (v9 != 1)
    goto LABEL_13;
LABEL_14:

}

- (void)scrollToSpecifier:(id)a3
{
  uint64_t v4;
  void *v5;
  id v6;

  v4 = objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "indexOfObject:", a3);
  v5 = *(Class *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE75700]);
  -[VPNSetupListController indexPathForIndex:](self, "indexPathForIndex:", v4);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "scrollToRowAtIndexPath:atScrollPosition:animated:", v6, 2, 1);

}

- (id)pacFile:(id)a3
{
  void *v4;
  __CFString *v5;

  -[VPNSetupListController proxyPACFile](self, "proxyPACFile", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPNSetupListController proxyPACFile](self, "proxyPACFile");
    v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = &stru_24EE4DF70;
  }

  return v5;
}

- (void)setPacFile:(id)a3 specifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController proxyPACFile](self, "proxyPACFile");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setProxyPACFile:](self, "setProxyPACFile:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setUseRSASecurID:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;

  v5 = objc_msgSend(a3, "BOOLValue");
  if ((_DWORD)v5 != -[VPNSetupListController useRSASecurID](self, "useRSASecurID"))
  {
    -[VPNSetupListController setUseRSASecurID:](self, "setUseRSASecurID:", v5);
    -[VPNSetupListController passwordSpecifier](self, "passwordSpecifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[VPNSetupListController indexOfSpecifier:](self, "indexOfSpecifier:", v6);

    if (-[VPNSetupListController useRSASecurID](self, "useRSASecurID") || v7 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (!-[VPNSetupListController useRSASecurID](self, "useRSASecurID") || v7 == 0x7FFFFFFFFFFFFFFFLL)
        goto LABEL_10;
      -[VPNSetupListController passwordSpecifier](self, "passwordSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController removeSpecifier:animated:](self, "removeSpecifier:animated:", v8, 1);
    }
    else
    {
      -[VPNSetupListController passwordSpecifier](self, "passwordSpecifier");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController insertSpecifier:afterSpecifierID:animated:](self, "insertSpecifier:afterSpecifierID:animated:", v8, CFSTR("EAP_RSA"), 1);
    }

LABEL_10:
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }
}

- (id)useRSASecurIDForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController useRSASecurID](self, "useRSASecurID", a3));
}

- (void)setSendAllTraffic:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "BOOLValue");
  if ((_DWORD)v5 != -[VPNSetupListController sendAllTraffic](self, "sendAllTraffic"))
  {
    -[VPNSetupListController setSendAllTraffic:](self, "setSendAllTraffic:", v5);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }
}

- (id)sendAllTraffic:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController sendAllTraffic](self, "sendAllTraffic", a3));
}

- (void)setOnDemand:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "BOOLValue");
  if ((_DWORD)v5 != -[VPNSetupListController onDemandEnabled](self, "onDemandEnabled"))
  {
    -[VPNSetupListController setOnDemandEnabled:](self, "setOnDemandEnabled:", v5);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController saveButtonTapped:](self, "saveButtonTapped:", 0);
  }
}

- (id)onDemand:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController onDemandEnabled](self, "onDemandEnabled", a3));
}

- (void)setOnDemandService:(id)a3 forSpecifier:(id)a4
{
  if (a3)
    a3 = (id)objc_msgSend(a3, "BOOLValue");
  -[VPNSetupListController setOnDemandService:](self, "setOnDemandService:", a3, a4);
}

- (BOOL)haveEnoughValues
{
  unint64_t v3;
  _BOOL4 v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  BOOL v9;
  void *v10;
  void *v11;

  v3 = -[VPNSetupListController currentVPNType](self, "currentVPNType");
  v4 = -[VPNSetupListController dirty](self, "dirty");
  if (v3 == 4)
  {
    if (v4)
    {
      -[VPNSetupListController server](self, "server");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "length"))
      {
        -[VPNSetupListController displayName](self, "displayName");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v6, "length"))
        {
          -[VPNSetupListController remoteIdentifier](self, "remoteIdentifier");
          v7 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v7, "length"))
          {
            -[VPNSetupListController account](self, "account");
            v8 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v8, "length"))
            {
              v9 = 1;
            }
            else
            {
              -[VPNSetupListController sharedSecret](self, "sharedSecret");
              v10 = (void *)objc_claimAutoreleasedReturnValue();
              if (objc_msgSend(v10, "length"))
              {
                v9 = 1;
              }
              else
              {
                -[VPNSetupListController certificateID](self, "certificateID");
                v11 = (void *)objc_claimAutoreleasedReturnValue();
                v9 = v11 != 0;

              }
            }
            goto LABEL_23;
          }
          goto LABEL_18;
        }
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  else if (v4)
  {
    -[VPNSetupListController server](self, "server");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      -[VPNSetupListController displayName](self, "displayName");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v6, "length"))
      {
        -[VPNSetupListController account](self, "account");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v7, "length"))
        {
          v9 = 1;
LABEL_24:

          goto LABEL_25;
        }
        if (-[VPNSetupListController usesCertificates](self, "usesCertificates"))
        {
          -[VPNSetupListController certificateID](self, "certificateID");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          v9 = v8 != 0;
LABEL_23:

          goto LABEL_24;
        }
LABEL_18:
        v9 = 0;
        goto LABEL_24;
      }
LABEL_15:
      v9 = 0;
LABEL_25:

      goto LABEL_26;
    }
LABEL_14:
    v9 = 0;
LABEL_26:

    return v9;
  }
  return 0;
}

- (BOOL)saveConfigurationSettings
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  __CFString **v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  __CFString **v48;
  void *v49;
  void *v50;
  void *v51;
  unint64_t v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  int v60;

  if (-[VPNSetupListController onDemandService](self, "onDemandService")
    && -[VPNSetupListController dirty](self, "dirty"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController currentVPNType](self, "currentVPNType"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("VPNType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("VPNGrade"));

    v6 = (void *)MEMORY[0x24BDD16E0];
    -[VPNSetupListController onDemand:](self, "onDemand:", 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "numberWithInt:", objc_msgSend(v7, "intValue"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v3, "setValue:forKey:", v8, CFSTR("VPNOnDemandEnabled"));
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController serviceID](self, "serviceID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "connectionWithServiceID:withGrade:", v10, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = objc_msgSend(v11, "status");
    if (v11 && (v12 & 0xFFFFFFFFFFFFFFFELL) == 2)
      objc_msgSend(v11, "disconnect");
    -[VPNSetupListController serviceID](self, "serviceID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v9, "updateVPNWithServiceID:withOptions:", v13, v3);

    goto LABEL_74;
  }
  if (!-[VPNSetupListController haveEnoughValues](self, "haveEnoughValues"))
    return 0;
  if (-[VPNSetupListController dirty](self, "dirty"))
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController currentVPNType](self, "currentVPNType"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v15, CFSTR("VPNType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v16, CFSTR("VPNGrade"));

    -[VPNSetupListController displayName](self, "displayName");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v17, "length"))
    {
      -[VPNSetupListController displayName](self, "displayName");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v18, CFSTR("dispName"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("dispName"));
    }

    -[VPNSetupListController account](self, "account");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v19, "length"))
    {
      -[VPNSetupListController account](self, "account");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v20, CFSTR("authorization"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("authorization"));
    }

    -[VPNSetupListController server](self, "server");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v21, "length"))
    {
      -[VPNSetupListController server](self, "server");
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v22, CFSTR("server"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("server"));
    }

    -[VPNSetupListController sharedSecret](self, "sharedSecret");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v23, "length"))
    {
      -[VPNSetupListController sharedSecret](self, "sharedSecret");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v24, CFSTR("secret"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("secret"));
    }

    -[VPNSetupListController useRSASecurIDForSpecifier:](self, "useRSASecurIDForSpecifier:", 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v25, CFSTR("securID"));

    -[VPNSetupListController sendAllTraffic:](self, "sendAllTraffic:", 0);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v26, CFSTR("VPNSendAllTraffic"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController encryptionType](self, "encryptionType"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v27, CFSTR("encrypLevel"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController eapType](self, "eapType"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v28, CFSTR("eapType"));

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController authType](self, "authType"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setValue:forKey:", v29, CFSTR("authType"));

    -[VPNSetupListController groupDisplayName](self, "groupDisplayName");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v30, "length"))
    {
      -[VPNSetupListController groupDisplayName](self, "groupDisplayName");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v31, CFSTR("group"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("group"));
    }

    -[VPNSetupListController password](self, "password");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v32, "length"))
    {
      -[VPNSetupListController password](self, "password");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v33, CFSTR("password"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("password"));
    }

    -[VPNSetupListController localIdentifier](self, "localIdentifier");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v34, "length"))
    {
      -[VPNSetupListController localIdentifier](self, "localIdentifier");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v35, CFSTR("VPNLocalIdentifier"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("VPNLocalIdentifier"));
    }

    -[VPNSetupListController remoteIdentifier](self, "remoteIdentifier");
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v36, "length"))
    {
      -[VPNSetupListController remoteIdentifier](self, "remoteIdentifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "setObject:forKey:", v37, CFSTR("VPNRemoteIdentifier"));

    }
    else
    {
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("VPNRemoteIdentifier"));
    }

    if (!-[VPNSetupListController proxyType](self, "proxyType"))
    {
LABEL_59:
      if (-[VPNSetupListController usesCertificates](self, "usesCertificates"))
      {
        -[VPNSetupListController certificateID](self, "certificateID");
        v49 = (void *)objc_claimAutoreleasedReturnValue();

        if (v49)
        {
          -[VPNSetupListController certificateID](self, "certificateID");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v50, CFSTR("VPNCertificate"));

        }
      }
      -[VPNSetupListController serviceID](self, "serviceID");
      v51 = (void *)objc_claimAutoreleasedReturnValue();

      if (v51)
      {
        if (!-[VPNSetupListController originalVPNType](self, "originalVPNType")
          || (v52 = -[VPNSetupListController currentVPNType](self, "currentVPNType"),
              v52 == -[VPNSetupListController originalVPNType](self, "originalVPNType")))
        {
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v53 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController serviceID](self, "serviceID");
          v54 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v53, "connectionWithServiceID:withGrade:", v54, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
          v55 = (void *)objc_claimAutoreleasedReturnValue();

          v56 = objc_msgSend(v55, "status");
          if (v55 && (v56 & 0xFFFFFFFFFFFFFFFELL) == 2)
            objc_msgSend(v55, "disconnect");
          -[VPNSetupListController serviceID](self, "serviceID");
          v57 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v53, "updateVPNWithServiceID:withOptions:", v57, v3);

          goto LABEL_72;
        }
        +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
        v58 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController serviceID](self, "serviceID");
        v59 = (void *)objc_claimAutoreleasedReturnValue();
        v60 = objc_msgSend(v58, "deleteVPNWithServiceID:", v59);

        if (!v60)
        {
          v14 = 0;
          goto LABEL_73;
        }
      }
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v53 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v53, "createVPNWithOptions:", v3);
LABEL_72:

LABEL_73:
      -[VPNSetupListController setOriginalVPNType:](self, "setOriginalVPNType:", -[VPNSetupListController currentVPNType](self, "currentVPNType"));
LABEL_74:

      return v14;
    }
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", -[VPNSetupListController proxyType](self, "proxyType"));
    v38 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v38, CFSTR("VPNProxyType"));
    if (-[VPNSetupListController proxyType](self, "proxyType") == 1)
    {
      -[VPNSetupListController proxyServer](self, "proxyServer");
      v39 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v39, "length"))
      {
        -[VPNSetupListController proxyServer](self, "proxyServer");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v40, CFSTR("VPNProxyServer"));

      }
      else
      {
        objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("VPNProxyServer"));
      }

      -[VPNSetupListController proxyPort](self, "proxyPort");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v44, "length"))
      {
        -[VPNSetupListController proxyPort](self, "proxyPort");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v3, "setObject:forKey:", v45, CFSTR("VPNProxyPort"));

      }
      else
      {
        objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("VPNProxyPort"));
      }

      if (-[VPNSetupListController proxyAuthenticated](self, "proxyAuthenticated"))
      {
        objc_msgSend(v3, "setObject:forKey:", &unk_24EE55148, CFSTR("VPNProxyAuthenticate"));
        -[VPNSetupListController proxyUsername](self, "proxyUsername");
        v46 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v46, "length"))
        {
          -[VPNSetupListController proxyUsername](self, "proxyUsername");
          v47 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "setObject:forKey:", v47, CFSTR("VPNProxyUsername"));

        }
        else
        {
          objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, CFSTR("VPNProxyUsername"));
        }

        -[VPNSetupListController proxyPassword](self, "proxyPassword");
        v41 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v41, "length"))
        {
          -[VPNSetupListController proxyPassword](self, "proxyPassword");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          v43 = VPNProxyPassword;
          goto LABEL_54;
        }
        v48 = VPNProxyPassword;
        goto LABEL_56;
      }
      objc_msgSend(v3, "setObject:forKey:", &unk_24EE55160, CFSTR("VPNProxyAuthenticate"));
    }
    else if (-[VPNSetupListController proxyType](self, "proxyType") == 2)
    {
      -[VPNSetupListController proxyPACFile](self, "proxyPACFile");
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v41, "length"))
      {
        -[VPNSetupListController proxyPACFile](self, "proxyPACFile");
        v42 = (void *)objc_claimAutoreleasedReturnValue();
        v43 = VPNProxyPacFile;
LABEL_54:
        objc_msgSend(v3, "setObject:forKey:", v42, *v43);

LABEL_57:
        goto LABEL_58;
      }
      v48 = VPNProxyPacFile;
LABEL_56:
      objc_msgSend(v3, "setObject:forKey:", &stru_24EE4DF70, *v48);
      goto LABEL_57;
    }
LABEL_58:

    goto LABEL_59;
  }
  return 1;
}

- (void)displayAlertWithTitle:(id)a3 message:(id)a4 cancel:(id)a5
{
  void *v8;
  id v9;
  void *v10;
  id v11;

  v8 = (void *)MEMORY[0x24BDF67F0];
  v9 = a5;
  objc_msgSend(v8, "alertControllerWithTitle:message:preferredStyle:", a3, a4, 1);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDF67E8], "actionWithTitle:style:handler:", v9, 1, 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "addAction:", v10);
  -[VPNSetupListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v11, 1, 0);

}

- (void)saveButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  -[VPNSetupListController loseFocus](self, "loseFocus", a3);
  if (-[VPNSetupListController saveConfigurationSettings](self, "saveConfigurationSettings"))
  {
    -[VPNSetupListController setDirty:](self, "setDirty:", 0);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
    -[VPNSetupListController reload](self, "reload");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "localizedStringForKey:value:table:", CFSTR("VPN_ERROR"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("VPN_SAVE_FAILURE_GENERIC"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController displayAlertWithTitle:message:cancel:](self, "displayAlertWithTitle:message:cancel:", v4, v6, v8);

  }
}

- (void)enableButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  char v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[VPNSetupListController loseFocus](self, "loseFocus", a3);
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController serviceID](self, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connectionWithServiceID:withGrade:", v4, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "serviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v16, "isEnabledWithServiceID:withGrade:", v6, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  if ((v7 & 1) != 0
    || (objc_msgSend(v5, "serviceID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v16, "enable:serviceID:withGrade:", 1, v8, -[VPNSetupListController vpnGrade](self, "vpnGrade")), v8, (v9 & 1) == 0))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VPN_ERROR"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("VPN_SAVE_FAILURE_GENERIC"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController displayAlertWithTitle:message:cancel:](self, "displayAlertWithTitle:message:cancel:", v11, v13, v15);

  }
  else
  {
    -[VPNSetupListController setDirty:](self, "setDirty:", 0);
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
  }

}

- (void)disableButtonTapped:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  char v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;

  -[VPNSetupListController loseFocus](self, "loseFocus", a3);
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v16 = (id)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController serviceID](self, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "connectionWithServiceID:withGrade:", v4, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "serviceID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v16, "isEnabledWithServiceID:withGrade:", v6, -[VPNSetupListController vpnGrade](self, "vpnGrade"));

  if (v7
    && (objc_msgSend(v5, "serviceID"),
        v8 = (void *)objc_claimAutoreleasedReturnValue(),
        v9 = objc_msgSend(v16, "enable:serviceID:withGrade:", 0, v8, -[VPNSetupListController vpnGrade](self, "vpnGrade")), v8, (v9 & 1) != 0))
  {
    -[VPNSetupListController setDirty:](self, "setDirty:", 0);
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("VPN_ERROR"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "localizedStringForKey:value:table:", CFSTR("VPN_SAVE_FAILURE_GENERIC"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController displayAlertWithTitle:message:cancel:](self, "displayAlertWithTitle:message:cancel:", v11, v13, v15);

  }
}

- (void)saveButtonClicked:(id)a3
{
  void *v4;
  BOOL v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  int v18;
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
  id WeakRetained;
  void *v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  -[VPNSetupListController serviceID](self, "serviceID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "vpnServicesForCurrentSetWithGrade:", -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v33 = 0u;
    v34 = 0u;
    v31 = 0u;
    v32 = 0u;
    v8 = v7;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v32;
      while (2)
      {
        v12 = 0;
        do
        {
          if (*(_QWORD *)v32 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v12);
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "connectionWithServiceID:withGrade:", v13, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
          v15 = (void *)objc_claimAutoreleasedReturnValue();

          objc_msgSend(v15, "displayName");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController displayName](self, "displayName");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          v18 = objc_msgSend(v17, "isEqualToString:", v16);

          if (v18)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v30 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("VPN_ERROR"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v24 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v25 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v25, "localizedStringForKey:value:table:", CFSTR("VPN_SAVE_FAILURE_NAME_CONFLICT"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v26 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v27 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v28 = (void *)objc_claimAutoreleasedReturnValue();
            -[VPNSetupListController displayAlertWithTitle:message:cancel:](self, "displayAlertWithTitle:message:cancel:", v24, v26, v28);

            goto LABEL_18;
          }

          ++v12;
        }
        while (v10 != v12);
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v31, v35, 16);
        if (v10)
          continue;
        break;
      }
    }

  }
  if (-[VPNSetupListController currentVPNType](self, "currentVPNType") == 1
    && !-[VPNSetupListController pptpWarningAccepted](self, "pptpWarningAccepted"))
  {
    -[VPNSetupListController warnForPPTP](self, "warnForPPTP");
  }
  else
  {
    -[VPNSetupListController loseFocus](self, "loseFocus");
    v5 = -[VPNSetupListController saveConfigurationSettings](self, "saveConfigurationSettings");
    -[VPNSetupListController setPptpWarningAccepted:](self, "setPptpWarningAccepted:", 0);
    if (v5)
    {
      if (-[VPNSetupListController editMode](self, "editMode"))
      {
        -[VPNSetupListController leaveEditMode](self, "leaveEditMode");
      }
      else
      {
        WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                                  + (int)*MEMORY[0x24BE75790]));
        objc_msgSend(WeakRetained, "dismiss");

      }
    }
    else
    {
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v8 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "localizedStringForKey:value:table:", CFSTR("VPN_ERROR"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("VPN_SAVE_FAILURE_GENERIC"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v22, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController displayAlertWithTitle:message:cancel:](self, "displayAlertWithTitle:message:cancel:", v19, v21, v23);

LABEL_18:
    }
  }
}

- (void)leaveEditMode
{
  void *v3;
  void *v4;
  id v5;

  -[VPNSetupListController navigationItem](self, "navigationItem");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController backButton](self, "backButton");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setLeftBarButtonItem:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 2, self, sel_editButtonTapped_);
  objc_msgSend(v5, "setRightBarButtonItem:", v4);

  -[VPNSetupListController setBackButton:](self, "setBackButton:", 0);
  -[VPNSetupListController setOverviewMode:](self, "setOverviewMode:", 1);
  -[VPNSetupListController setEditMode:](self, "setEditMode:", 0);
  -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");

}

- (void)enterEditMode
{
  void *v3;
  void *v4;
  void *v5;
  id v6;

  -[VPNSetupListController navigationItem](self, "navigationItem");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "leftBarButtonItem");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController setBackButton:](self, "setBackButton:", v3);

  v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonClicked_);
  objc_msgSend(v6, "setLeftBarButtonItem:", v4);

  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_saveButtonClicked_);
  objc_msgSend(v6, "setRightBarButtonItem:", v5);

  -[VPNSetupListController setOverviewMode:](self, "setOverviewMode:", 0);
  -[VPNSetupListController setEditMode:](self, "setEditMode:", 1);
  -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");

}

- (BOOL)deleteConfiguration:(id)a3
{
  void *v4;
  void *v5;
  char v6;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController serviceID](self, "serviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "deleteVPNWithServiceID:", v5);

  return v6;
}

- (void)deleteVPNConfiguration:(id)a3
{
  id v4;
  id v5;

  if (-[VPNSetupListController deleteConfiguration:](self, "deleteConfiguration:", 0))
  {
    -[VPNSetupListController navigationController](self, "navigationController");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    v4 = (id)objc_msgSend(v5, "popViewControllerAnimated:", 1);

  }
}

- (void)deleteConfirm:(id)a3
{
  void *v4;
  void *v5;
  const __CFString *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD v17[5];

  if (-[VPNSetupListController vpnGrade](self, "vpnGrade", a3) == 7
    || -[VPNSetupListController vpnGrade](self, "vpnGrade") == 8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DELETE_RELAY?");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v4;
    v6 = CFSTR("DELETE_VPN?");
  }
  objc_msgSend(v4, "localizedStringForKey:value:table:", v6, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BDF67F0], "alertControllerWithTitle:message:preferredStyle:", v7, 0, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("DELETE_CONFIRMATION"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __40__VPNSetupListController_deleteConfirm___block_invoke;
  v17[3] = &unk_24EE4DEE8;
  v17[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 0, v17);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v12);

  v13 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("CANCEL"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "actionWithTitle:style:handler:", v15, 1, 0);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v16);

  -[VPNSetupListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __40__VPNSetupListController_deleteConfirm___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "deleteVPNConfiguration:", 0);
}

- (void)warnForPPTP
{
  void *v3;
  void *v4;
  void *v5;
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
  _QWORD v18[5];
  _QWORD v19[5];

  v3 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "localizedStringForKey:value:table:", CFSTR("PPTP_WARNING_TITLE?"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("PPTP_WARNING"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "alertControllerWithTitle:message:preferredStyle:", v5, v7, 1);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "localizedStringForKey:value:table:", CFSTR("PPTP_CANCEL"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = MEMORY[0x24BDAC760];
  v19[0] = MEMORY[0x24BDAC760];
  v19[1] = 3221225472;
  v19[2] = __37__VPNSetupListController_warnForPPTP__block_invoke;
  v19[3] = &unk_24EE4DEE8;
  v19[4] = self;
  objc_msgSend(v9, "actionWithTitle:style:handler:", v11, 1, v19);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v13);

  v14 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "localizedStringForKey:value:table:", CFSTR("PPTP_SAVE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v12;
  v18[1] = 3221225472;
  v18[2] = __37__VPNSetupListController_warnForPPTP__block_invoke_2;
  v18[3] = &unk_24EE4DEE8;
  v18[4] = self;
  objc_msgSend(v14, "actionWithTitle:style:handler:", v16, 0, v18);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "addAction:", v17);

  -[VPNSetupListController presentViewController:animated:completion:](self, "presentViewController:animated:completion:", v8, 1, 0);
}

uint64_t __37__VPNSetupListController_warnForPPTP__block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "editMode");
  if ((_DWORD)result)
    return objc_msgSend(*(id *)(a1 + 32), "cancelButtonClicked:", 0);
  return result;
}

uint64_t __37__VPNSetupListController_warnForPPTP__block_invoke_2(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setPptpWarningAccepted:", 1);
  return objc_msgSend(*(id *)(a1 + 32), "saveButtonClicked:", 0);
}

- (void)updateDoneButton
{
  _BOOL8 v3;
  void *v4;
  id v5;

  if (-[VPNSetupListController editMode](self, "editMode"))
  {
    v3 = -[VPNSetupListController haveEnoughValues](self, "haveEnoughValues");
    -[VPNSetupListController navigationItem](self, "navigationItem");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "rightBarButtonItem");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setEnabled:", v3);

  }
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
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v7, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, v8);

  v9 = objc_loadWeakRetained(&location);
  updateNEStatus(v9);

  v10.receiver = self;
  v10.super_class = (Class)VPNSetupListController;
  -[VPNSetupListController viewWillAppear:](&v10, sel_viewWillAppear_, v3);
  objc_destroyWeak(&location);

}

- (void)viewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  objc_super v5;

  v3 = a3;
  -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  v5.receiver = self;
  v5.super_class = (Class)VPNSetupListController;
  -[VPNSetupListController viewDidAppear:](&v5, sel_viewDidAppear_, v3);
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
  objc_super v18;

  v18.receiver = self;
  v18.super_class = (Class)VPNSetupListController;
  v6 = a4;
  -[VPNSetupListController tableView:cellForRowAtIndexPath:](&v18, sel_tableView_cellForRowAtIndexPath_, a3, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[VPNSetupListController indexForIndexPath:](self, "indexForIndexPath:", v6, v18.receiver, v18.super_class);

  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]), "objectAtIndex:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController certificateListSpecifier](self, "certificateListSpecifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
    -[VPNSetupListController certificateID](self, "certificateID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      -[VPNSetupListController certificateID](self, "certificateID");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = (void *)VPNCopyDisplayNameForCertificateWithPersistentID(v12);

    }
    objc_msgSend(v7, "setValue:", v11);

  }
  -[VPNSetupListController connectSpecifier](self, "connectSpecifier");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v13)
  {
    -[VPNSetupListController connection](self, "connection");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "statusText");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "detailTextLabel");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setText:", v15);

  }
  return v7;
}

- (id)bundle
{
  return (id)objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
}

- (void)setPPTPEncryptionLevel:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5 != -[VPNSetupListController encryptionType](self, "encryptionType"))
  {
    -[VPNSetupListController setEncryptionType:](self, "setEncryptionType:", v5);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
  }
}

- (id)pptpEncryptionLevelForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController encryptionType](self, "encryptionType", a3));
}

- (void)setEAPType:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5 != -[VPNSetupListController eapType](self, "eapType"))
  {
    -[VPNSetupListController setEapType:](self, "setEapType:", v5);
    if (-[VPNSetupListController eapType](self, "eapType"))
      -[VPNSetupListController setAuthType:](self, "setAuthType:", 1);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (id)eapTypeForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController eapType](self, "eapType", a3));
}

- (void)setAuthType:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5 != -[VPNSetupListController authType](self, "authType"))
  {
    -[VPNSetupListController setAuthType:](self, "setAuthType:", v5);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (id)authTypeForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController authType](self, "authType", a3));
}

- (void)setVPNGrade:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "unsignedIntegerValue");
  if (v5 != -[VPNSetupListController vpnGrade](self, "vpnGrade"))
  {
    -[VPNSetupListController setVpnGrade:](self, "setVpnGrade:", v5);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
  }
}

- (id)vpnGradeForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", -[VPNSetupListController vpnGrade](self, "vpnGrade", a3));
}

- (id)vpnGradeNameForSpecifier:(id)a3
{
  void *v5;
  void *v6;
  const __CFString *v7;
  void *v8;
  void *v9;

  if (!-[VPNSetupListController vpnGrade](self, "vpnGrade", a3)
    || -[VPNSetupListController vpnGrade](self, "vpnGrade") == 1)
  {
    if (!-[VPNSetupListController currentVPNType](self, "currentVPNType"))
      return CFSTR("L2TP");
    if (-[VPNSetupListController currentVPNType](self, "currentVPNType") == 1)
      return CFSTR("PPTP");
LABEL_7:
    if (-[VPNSetupListController currentVPNType](self, "currentVPNType") == 2)
      return CFSTR("IPsec");
    if (-[VPNSetupListController currentVPNType](self, "currentVPNType") == 4)
      return CFSTR("IKEv2");
    goto LABEL_18;
  }
  if (-[VPNSetupListController vpnGrade](self, "vpnGrade") == 2)
    goto LABEL_7;
  if (-[VPNSetupListController vpnGrade](self, "vpnGrade") == 3)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("ALWAYSON");
LABEL_17:
    objc_msgSend(v5, "localizedStringForKey:value:table:", v7, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    goto LABEL_19;
  }
  if (-[VPNSetupListController vpnGrade](self, "vpnGrade") == 7
    || -[VPNSetupListController vpnGrade](self, "vpnGrade") == 8)
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    v7 = CFSTR("RELAY");
    goto LABEL_17;
  }
LABEL_18:
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController serviceID](self, "serviceID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appNameForServiceID:withGrade:", v9, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();

LABEL_19:
  return v8;
}

- (void)setVPNType:(__CFString *)a3 forSpecifier:(id)a4
{
  unint64_t v5;

  v5 = +[VPNConnectionStore connectionTypeFromVPNType:](VPNConnectionStore, "connectionTypeFromVPNType:", a3, a4);
  if (v5 != -[VPNSetupListController currentVPNType](self, "currentVPNType"))
  {
    -[VPNSetupListController setCurrentVPNType:](self, "setCurrentVPNType:", v5);
    -[VPNSetupListController loseFocus](self, "loseFocus");
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (__CFString)vpnTypeForSpecifier:(id)a3
{
  return +[VPNConnectionStore vpnTypeFromConnectionType:](VPNConnectionStore, "vpnTypeFromConnectionType:", -[VPNSetupListController currentVPNType](self, "currentVPNType", a3));
}

- (id)usesCertificatesForSpecifier:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController usesCertificates](self, "usesCertificates", a3));
}

- (void)setUsername:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController account](self, "account");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setAccount:](self, "setAccount:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setDisplayName:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  id v8;

  v8 = a3;
  -[VPNSetupListController displayName](self, "displayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v8, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setDisplayName:](self, "setDisplayName:", v8);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
    -[VPNSetupListController serviceID](self, "serviceID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (v7)
      -[VPNSetupListController setTitle:](self, "setTitle:", v8);
  }

}

- (void)setServer:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController server](self, "server");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setServer:](self, "setServer:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setPassword:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[VPNSetupListController password](self, "password");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VPNSetupListController setPassword:](self, "setPassword:", v8);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");

  }
}

- (void)setPasswordRequired:(id)a3 forSpecifier:(id)a4
{
  _BOOL4 v5;
  void *v6;
  void *v7;

  -[VPNSetupListController setPasswordRequired:](self, "setPasswordRequired:", objc_msgSend(a3, "BOOLValue"));
  v5 = -[VPNSetupListController passwordRequired](self, "passwordRequired");
  -[VPNSetupListController passwordSpecifier](self, "passwordSpecifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", !v5);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x24BE75A18]);

  -[VPNSetupListController setDirty:](self, "setDirty:", 1);
  -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
}

- (void)setUsesCertificates:(id)a3 forSpecifier:(id)a4
{
  uint64_t v5;

  v5 = objc_msgSend(a3, "BOOLValue");
  if ((_DWORD)v5 != -[VPNSetupListController usesCertificates](self, "usesCertificates"))
  {
    -[VPNSetupListController setUsesCertificates:](self, "setUsesCertificates:", v5);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");
  }
}

- (void)setSharedSecret:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  -[VPNSetupListController sharedSecret](self, "sharedSecret");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v9, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDD14A8], "whitespaceCharacterSet");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "stringByTrimmingCharactersInSet:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VPNSetupListController setSharedSecret:](self, "setSharedSecret:", v8);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");

  }
}

- (id)certificateObjectForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  unint64_t v10;
  void *v11;
  unint64_t v12;
  void *v13;
  void *v14;

  -[VPNSetupListController certificateID](self, "certificateID", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v4)
    goto LABEL_5;
  -[VPNSetupListController certificateIDs](self, "certificateIDs");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController certificateID](self, "certificateID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "containsObject:", v6);

  if (!v7)
    goto LABEL_5;
  -[VPNSetupListController certificateIDs](self, "certificateIDs");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController certificateID](self, "certificateID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v8, "indexOfObject:", v9);

  -[VPNSetupListController certificateObjects](self, "certificateObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = objc_msgSend(v11, "count");

  if (v10 < v12)
  {
    -[VPNSetupListController certificateObjects](self, "certificateObjects");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectAtIndexedSubscript:", v10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
LABEL_5:
    v14 = 0;
  }
  return v14;
}

- (void)setCertificateObject:(id)a3 forSpecifier:(id)a4
{
  id v6;
  void *v7;
  int v8;
  void *v9;
  unint64_t v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  id v26;

  v26 = a3;
  v6 = a4;
  if (v26)
  {
    -[VPNSetupListController certificateObjects](self, "certificateObjects");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "containsObject:", v26);

    if (v8)
    {
      -[VPNSetupListController certificateObjects](self, "certificateObjects");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v9, "indexOfObject:", v26);

      -[VPNSetupListController certificateID](self, "certificateID");
      v11 = objc_claimAutoreleasedReturnValue();
      if (!v11)
        goto LABEL_6;
      v12 = (void *)v11;
      -[VPNSetupListController certificateIDs](self, "certificateIDs");
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController certificateID](self, "certificateID");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v13, "containsObject:", v14);

      if (!v15
        || (-[VPNSetupListController certificateIDs](self, "certificateIDs"),
            v16 = (void *)objc_claimAutoreleasedReturnValue(),
            -[VPNSetupListController certificateID](self, "certificateID"),
            v17 = (void *)objc_claimAutoreleasedReturnValue(),
            v18 = objc_msgSend(v16, "indexOfObject:", v17),
            v17,
            v16,
            v10 != v18))
      {
LABEL_6:
        -[VPNSetupListController certificateIDs](self, "certificateIDs");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        v20 = objc_msgSend(v19, "count");

        if (v10 < v20)
        {
          -[VPNSetupListController certificateIDs](self, "certificateIDs");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "objectAtIndexedSubscript:", v10);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController setCertificateID:](self, "setCertificateID:", v22);

        }
        -[VPNSetupListController setDirty:](self, "setDirty:", 1);
        v23 = (void *)MEMORY[0x24BDD16E0];
        -[VPNSetupListController certificateID](self, "certificateID");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "numberWithBool:", v24 != 0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();

        -[VPNSetupListController setUsesCertificates:forSpecifier:](self, "setUsesCertificates:forSpecifier:", v25, v6);
        -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
        -[VPNSetupListController reloadSpecifiers](self, "reloadSpecifiers");

      }
    }
  }

}

- (void)setGroupDisplayName:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController groupDisplayName](self, "groupDisplayName");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setGroupDisplayName:](self, "setGroupDisplayName:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setLocalIdentifier:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController localIdentifier](self, "localIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setLocalIdentifier:](self, "setLocalIdentifier:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setRemoteIdentifier:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  char v6;
  id v7;

  v7 = a3;
  -[VPNSetupListController remoteIdentifier](self, "remoteIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v7, "isEqualToString:", v5);

  if ((v6 & 1) == 0)
  {
    -[VPNSetupListController setRemoteIdentifier:](self, "setRemoteIdentifier:", v7);
    -[VPNSetupListController setDirty:](self, "setDirty:", 1);
    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }

}

- (void)setStateForServiceID:(id)a3
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
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  void *v37;
  id v38;

  v38 = a3;
  v4 = (void *)objc_msgSend(v38, "copy");
  -[VPNSetupListController setServiceID:](self, "setServiceID:", v4);

  if (v38)
  {
    objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + (int)*MEMORY[0x24BE757A8]), "userInfo");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKey:", CFSTR("service-grade"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setVpnGrade:](self, "setVpnGrade:", objc_msgSend(v6, "unsignedIntegerValue"));

    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "optionsForServiceID:withGrade:", v38, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      objc_msgSend(v8, "objectForKey:", CFSTR("VPNOnDemandCapable"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setOnDemandService:forSpecifier:](self, "setOnDemandService:forSpecifier:", v9, 0);

      if (-[VPNSetupListController onDemandService](self, "onDemandService"))
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("VPNOnDemandEnabled"));
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setOnDemandEnabled:](self, "setOnDemandEnabled:", objc_msgSend(v10, "BOOLValue"));

      }
      objc_msgSend(v8, "objectForKey:", CFSTR("VPNType"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setCurrentVPNType:](self, "setCurrentVPNType:", objc_msgSend(v11, "unsignedIntegerValue"));

      objc_msgSend(v8, "objectForKey:", CFSTR("dispName"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setDisplayName:forSpecifier:](self, "setDisplayName:forSpecifier:", v12, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("authorization"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setUsername:forSpecifier:](self, "setUsername:forSpecifier:", v13, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("server"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setServer:forSpecifier:](self, "setServer:forSpecifier:", v14, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("secret"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setSharedSecret:forSpecifier:](self, "setSharedSecret:forSpecifier:", v15, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNCertificate"));
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setCertificateID:](self, "setCertificateID:", v16);

      objc_msgSend(v8, "objectForKey:", CFSTR("securID"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setUseRSASecurID:forSpecifier:](self, "setUseRSASecurID:forSpecifier:", v17, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNSendAllTraffic"));
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setSendAllTraffic:forSpecifier:](self, "setSendAllTraffic:forSpecifier:", v18, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("encrypLevel"));
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setPPTPEncryptionLevel:forSpecifier:](self, "setPPTPEncryptionLevel:forSpecifier:", v19, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("eapType"));
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setEAPType:forSpecifier:](self, "setEAPType:forSpecifier:", v20, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("authType"));
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setAuthType:forSpecifier:](self, "setAuthType:forSpecifier:", v21, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("group"));
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setGroupDisplayName:forSpecifier:](self, "setGroupDisplayName:forSpecifier:", v22, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("password"));
      v23 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setPassword:forSpecifier:](self, "setPassword:forSpecifier:", v23, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNPasswordRequired"));
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setPasswordRequired:forSpecifier:](self, "setPasswordRequired:forSpecifier:", v24, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNLocalIdentifier"));
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setLocalIdentifier:forSpecifier:](self, "setLocalIdentifier:forSpecifier:", v25, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNRemoteIdentifier"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setRemoteIdentifier:forSpecifier:](self, "setRemoteIdentifier:forSpecifier:", v26, 0);

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyType"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setProxyType:specifier:](self, "setProxyType:specifier:", v27, 0);

      if (-[VPNSetupListController proxyType](self, "proxyType") == 1)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyServer"));
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setProxyServer:specifier:](self, "setProxyServer:specifier:", v28, 0);

        objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyPort"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setProxyServerPort:specifier:](self, "setProxyServerPort:specifier:", v29, 0);

        objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyAuthenticate"));
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setProxyUsesAuthentication:specifier:](self, "setProxyUsesAuthentication:specifier:", v30, 0);

        if (-[VPNSetupListController proxyAuthenticated](self, "proxyAuthenticated"))
        {
          objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyUsername"));
          v31 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController setProxyUsername:specifier:](self, "setProxyUsername:specifier:", v31, 0);

          objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyPassword"));
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController setProxyPassword:specifier:](self, "setProxyPassword:specifier:", v32, 0);
LABEL_11:

        }
      }
      else if (-[VPNSetupListController proxyType](self, "proxyType") == 2)
      {
        objc_msgSend(v8, "objectForKey:", CFSTR("VPNProxyPacFile"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setPacFile:specifier:](self, "setPacFile:specifier:", v32, 0);
        goto LABEL_11;
      }
      objc_msgSend(v8, "objectForKey:", CFSTR("VPNAlwaysPrompt"));
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setAlwaysPrompt:](self, "setAlwaysPrompt:", objc_msgSend(v33, "BOOLValue"));

      objc_msgSend(v8, "objectForKey:", CFSTR("VPNApplicationName"));
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setAppName:](self, "setAppName:", v34);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VPNIncludedBundleIDs"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setIncludedBundleIDs:](self, "setIncludedBundleIDs:", v35);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VPNMatchDomains"));
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setMatchDomains:](self, "setMatchDomains:", v36);

      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("VPNExcludeDomains"));
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setExcludeDomains:](self, "setExcludeDomains:", v37);

      -[VPNSetupListController setDirty:](self, "setDirty:", 0);
      -[VPNSetupListController setOriginalVPNType:](self, "setOriginalVPNType:", -[VPNSetupListController currentVPNType](self, "currentVPNType"));

    }
  }
  else
  {
    -[VPNSetupListController setCurrentVPNType:](self, "setCurrentVPNType:", 4);
    -[VPNSetupListController setEncryptionType:](self, "setEncryptionType:", 1);
    -[VPNSetupListController setEapType:](self, "setEapType:", 1);
    -[VPNSetupListController setAuthType:](self, "setAuthType:", 1);
    -[VPNSetupListController setSendAllTraffic:](self, "setSendAllTraffic:", 1);
    -[VPNSetupListController setUseRSASecurID:](self, "setUseRSASecurID:", 0);
    -[VPNSetupListController setOnDemandService:](self, "setOnDemandService:", 0);
    -[VPNSetupListController setVpnGrade:](self, "setVpnGrade:", 0);
  }

}

- (void)cancelButtonClicked:(id)a3
{
  void *v4;
  id WeakRetained;

  if (-[VPNSetupListController editMode](self, "editMode", a3))
  {
    -[VPNSetupListController serviceID](self, "serviceID");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setStateForServiceID:](self, "setStateForServiceID:", v4);

    -[VPNSetupListController leaveEditMode](self, "leaveEditMode");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE75790]));
    objc_msgSend(WeakRetained, "dismiss");

  }
}

- (void)loadView
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  v3 = (int)*MEMORY[0x24BE757A8];
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "userInfo");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("overview-mode"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController setOverviewMode:](self, "setOverviewMode:", objc_msgSend(v5, "BOOLValue"));

  v11.receiver = self;
  v11.super_class = (Class)VPNSetupListController;
  -[VPNSetupListController loadView](&v11, sel_loadView);
  objc_msgSend(*(id *)((char *)&self->super.super.super.super.super.isa + v3), "userInfo");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKey:", CFSTR("vpn-service-id"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController setStateForServiceID:](self, "setStateForServiceID:", v7);

  if (!-[VPNSetupListController overviewMode](self, "overviewMode"))
  {
    -[VPNSetupListController navigationItem](self, "navigationItem");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 1, self, sel_cancelButtonClicked_);
    objc_msgSend(v8, "setLeftBarButtonItem:", v9);

    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 0, self, sel_saveButtonClicked_);
    objc_msgSend(v8, "setRightBarButtonItem:", v10);

    -[VPNSetupListController updateDoneButton](self, "updateDoneButton");
  }
}

- (id)connection
{
  void *v3;
  void *v4;
  void *v5;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController serviceID](self, "serviceID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "connectionWithServiceID:withGrade:", v4, -[VPNSetupListController vpnGrade](self, "vpnGrade"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)statusForConnection:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[VPNSetupListController connection](self, "connection", a3);
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
    objc_msgSend(v6, "localizedStringForKey:value:table:", CFSTR("NOT_CONFIGURED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

- (id)interfaceTypeForConnection:(id)a3
{
  void *v4;
  void *v5;
  __CFString *v6;

  objc_msgSend(a3, "propertyForKey:", CFSTR("VPNSubConnectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[VPNSetupListController connection](self, "connection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "interfaceTypeForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
    v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v6 = &stru_24EE4DF70;
  }

  return v6;
}

- (id)serverForConnection:(id)a3
{
  void *v3;
  void *v4;

  -[VPNSetupListController connection](self, "connection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "server");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)usernameForConnection:(id)a3
{
  void *v3;
  void *v4;

  -[VPNSetupListController connection](self, "connection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accountName");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)typeForConnection:(id)a3
{
  void *v3;
  void *v4;

  -[VPNSetupListController connection](self, "connection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "vpnTypeLocalizedString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (id)localIPForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(a3, "propertyForKey:", CFSTR("VPNSubConnectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "ipAddressesForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  else
    objc_msgSend(v5, "ipAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v7, "count"))
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 0);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v8 = &stru_24EE4DF70;
  }

  return v8;
}

- (id)localIP2ForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  __CFString *v8;

  objc_msgSend(a3, "propertyForKey:", CFSTR("VPNSubConnectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "ipAddressesForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  else
    objc_msgSend(v5, "ipAddresses");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if ((unint64_t)objc_msgSend(v7, "count") < 2)
  {
    v8 = &stru_24EE4DF70;
  }
  else
  {
    objc_msgSend(v7, "objectAtIndexedSubscript:", 1);
    v8 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

- (id)remoteIPForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  _QWORD block[5];

  objc_msgSend(a3, "propertyForKey:", CFSTR("VPNSubConnectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    objc_msgSend(v5, "remoteAddressForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(v5, "remoteAddress");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[VPNSetupListController connection](self, "connection");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "server");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "isEqualToString:", v10);

    if (v11)
    {
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = __47__VPNSetupListController_remoteIPForSpecifier___block_invoke;
      block[3] = &unk_24EE4DA98;
      block[4] = self;
      dispatch_async(MEMORY[0x24BDAC9B8], block);
    }
    -[VPNSetupListController connection](self, "connection");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "remoteAddress");
    v7 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v7;
}

void __47__VPNSetupListController_remoteIPForSpecifier___block_invoke(uint64_t a1)
{
  void *v1;
  id v2;

  v1 = *(void **)(a1 + 32);
  objc_msgSend(v1, "serverAddressSpecifier");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "removeSpecifier:", v2);

}

- (id)timeConnectedForSpecifier:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  objc_msgSend(a3, "propertyForKey:", CFSTR("VPNSubConnectionIndex"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
    objc_msgSend(v5, "elapsedTimeLocalizedStringForSubConnection:", objc_msgSend(v4, "unsignedIntegerValue"));
  else
    objc_msgSend(v5, "elapsedTimeLocalizedString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)tunnelType:(id)a3
{
  void *v3;
  void *v4;

  -[VPNSetupListController connection](self, "connection", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "tunnelType");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
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

- (void)setConnectionState:(id)a3 forSpecifier:(id)a4
{
  void *v5;
  id v6;

  v6 = a3;
  -[VPNSetupListController connection](self, "connection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    if (objc_msgSend(v6, "BOOLValue"))
      objc_msgSend(v5, "connect");
    else
      objc_msgSend(v5, "disconnect");
  }

}

- (id)getConnectionStateForSpecifier:(id)a3
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD16E0];
  -[VPNSetupListController connection](self, "connection", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "numberWithBool:", objc_msgSend(v4, "notDisconnectedOrDisconnecting"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)specifiers
{
  VPNSetupListController *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  VPNSetupListController *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  uint64_t v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t i;
  void *v38;
  void *v39;
  id v40;
  _BOOL4 v42;
  uint64_t *v43;
  id v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  uint64_t v49;
  void *v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  uint64_t v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  void *v64;
  void *v65;
  void *v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  uint64_t v72;
  void *v73;
  uint64_t v74;
  void *v75;
  uint64_t v76;
  uint64_t v77;
  void *v78;
  void *v79;
  void *v80;
  uint64_t v81;
  id v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  void *v87;
  uint64_t v88;
  uint64_t v89;
  uint64_t v90;
  uint64_t j;
  void *v92;
  unint64_t v93;
  int v94;
  uint64_t v95;
  id v96;
  uint64_t v97;
  unint64_t v98;
  void *v99;
  void *v100;
  void *v101;
  void *v102;
  void *v103;
  void *v104;
  void *v105;
  void *v106;
  void *v107;
  void *v108;
  void *v109;
  void *v110;
  void *v111;
  void *v112;
  void *v113;
  void *v114;
  void *v115;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  void *v121;
  void *v122;
  uint64_t v123;
  void *v124;
  void *v125;
  void *v126;
  void *v127;
  uint64_t v128;
  void *v129;
  unint64_t v130;
  void *v131;
  void *v132;
  uint64_t v133;
  void *v134;
  void *v135;
  void *v136;
  void *v137;
  void *v138;
  void *v139;
  void *v140;
  void *v141;
  void *v142;
  void *v143;
  void *v144;
  void *v145;
  id *v146;
  void *v147;
  id v148;
  void *v149;
  void *v150;
  void *v151;
  void *v152;
  uint64_t v153;
  void *v154;
  void *v155;
  void *v156;
  void *v157;
  void *v158;
  void *v159;
  void *v160;
  void *v161;
  void *v162;
  void *v163;
  void *v164;
  void *v165;
  void *v166;
  const __CFString *v167;
  void *v168;
  void *v169;
  void *v170;
  void *v171;
  id v172;
  void *v173;
  void *v174;
  void *v175;
  id v176;
  void *v177;
  void *v178;
  void *v179;
  id v180;
  void *v181;
  void *v182;
  void *v183;
  void *v184;
  void *v185;
  id v186;
  void *v187;
  void *v188;
  void *v189;
  void *v190;
  void *v191;
  void *v192;
  void *v193;
  void *v194;
  void *v195;
  void *v196;
  void *v197;
  void *v198;
  void *v199;
  void *v200;
  void *v201;
  void *v202;
  void *v203;
  void *v204;
  void *v205;
  void *v206;
  void *v207;
  void *v208;
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
  void *v219;
  void *v220;
  void *v221;
  void *v222;
  void *v223;
  uint64_t v224;
  void *v225;
  void *v226;
  void *v227;
  uint64_t v228;
  void *v229;
  uint64_t v230;
  void *v231;
  void *v232;
  void *v233;
  void *v234;
  void *v235;
  void *v236;
  uint64_t v237;
  void *v238;
  void *v239;
  void *v240;
  void *v241;
  void *v242;
  id v243;
  void *v244;
  void *v245;
  uint64_t v246;
  void *v247;
  void *v248;
  void *v249;
  void *v250;
  void *v251;
  uint64_t v252;
  void *v253;
  void *v254;
  void *v255;
  void *v256;
  void *v257;
  void *v258;
  void *v259;
  void *v260;
  void *v261;
  void *v262;
  void *v263;
  void *v264;
  void *v265;
  void *v266;
  void *v267;
  void *v268;
  void *v269;
  char v270;
  void *v271;
  void *v272;
  void *v273;
  void *v274;
  void *v275;
  void *v276;
  char *v277;
  void *v278;
  void *v279;
  void *v280;
  void *v281;
  void *v282;
  _BOOL4 v283;
  _BOOL4 v284;
  void *v285;
  void *v286;
  void *v287;
  void *v288;
  void *v289;
  void *v290;
  void *v291;
  void *v292;
  void *v293;
  void *v294;
  id v295;
  void *v296;
  void *v297;
  void *v298;
  void *v299;
  void *v300;
  void *v301;
  void *v302;
  void *v303;
  void *v304;
  void *v305;
  void *v306;
  void *v307;
  void *v308;
  uint64_t v309;
  void *v310;
  void *v311;
  uint64_t v312;
  void *v313;
  void *v314;
  void *v315;
  void *v316;
  uint64_t v317;
  uint64_t v318;
  uint64_t v319;
  uint64_t v320;
  uint64_t v321;
  id v322;
  void *v323;
  id v324;
  void *v325;
  BOOL v326;
  void *v327;
  void *v328;
  void *v329;
  void *v330;
  void *v331;
  void *v332;
  void *v333;
  id *v334;
  void *v335;
  void *v336;
  void *v337;
  void *v338;
  uint64_t v339;
  void *v340;
  void *v341;
  void *v342;
  void *v343;
  void *v344;
  void *v345;
  uint64_t v346;
  void *v347;
  void *v348;
  void *v349;
  void *v350;
  void *v351;
  void *v352;
  uint64_t v353;
  void *v354;
  void *v355;
  void *v356;
  void *v357;
  void *v358;
  void *v359;
  void *v360;
  void *v361;
  uint64_t v362;
  void *v363;
  void *v364;
  void *v365;
  void *v366;
  void *v367;
  void *v368;
  void *v369;
  void *v370;
  void *v371;
  int v372;
  void *v373;
  void *v374;
  int v375;
  uint64_t v376;
  void *v377;
  id *v378;
  void *v379;
  void *v380;
  uint64_t v381;
  void *v382;
  void *v383;
  void *v384;
  void *v385;
  void *v386;
  void *v387;
  uint64_t v388;
  void *v389;
  void *v390;
  void *v391;
  uint64_t v392;
  void *v393;
  void *v394;
  void *v395;
  void *v396;
  void *v397;
  void *v398;
  void *v399;
  void *v400;
  void *v401;
  void *v402;
  uint64_t v403;
  void *v404;
  uint64_t v405;
  id v406;
  void *v407;
  void *v408;
  uint64_t v409;
  void *v410;
  void *v411;
  void *v412;
  uint64_t v413;
  uint64_t v414;
  uint64_t v415;
  uint64_t k;
  void *v417;
  void *v418;
  void *v419;
  void *v420;
  void *v421;
  void *v422;
  void *v423;
  void *v424;
  void *v425;
  uint64_t v426;
  uint64_t v427;
  uint64_t v428;
  uint64_t v429;
  void *v430;
  uint64_t v431;
  uint64_t v432;
  id obj;
  void *v434;
  void *v435;
  uint64_t v436;
  void *v437;
  VPNSetupListController *v438;
  id v439;
  __int128 v440;
  __int128 v441;
  __int128 v442;
  __int128 v443;
  __int128 v444;
  __int128 v445;
  __int128 v446;
  __int128 v447;
  __int128 v448;
  __int128 v449;
  __int128 v450;
  __int128 v451;
  __int128 v452;
  __int128 v453;
  __int128 v454;
  __int128 v455;
  _QWORD v456[2];
  _BYTE v457[128];
  uint64_t v458;
  void *v459;
  uint64_t v460;
  uint64_t v461;
  _BYTE v462[128];
  _BYTE v463[128];
  _BYTE v464[128];
  uint64_t v465;

  v2 = self;
  v465 = *MEMORY[0x24BDAC8D0];
  v3 = (int)*MEMORY[0x24BE757A8];
  v4 = *(Class *)((char *)&self->super.super.super.super.super.isa + v3);
  if (!v4)
  {
    -[VPNSetupListController navigationController](v2, "navigationController");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    v40 = (id)objc_msgSend(v39, "popViewControllerAnimated:", 1);

    return 0;
  }
  objc_msgSend(v4, "userInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)VPNCopyAvailableCertificateIDs();
  -[VPNSetupListController setCertificateIDs:](v2, "setCertificateIDs:", v7);

  v8 = (void *)VPNCopyAvailableCertificateObjects();
  -[VPNSetupListController setCertificateObjects:](v2, "setCertificateObjects:", v8);

  v9 = 0x24BDBC000uLL;
  v10 = (void *)MEMORY[0x24BDBCEB8];
  -[VPNSetupListController loadSpecifiersFromPlistName:target:](v2, "loadSpecifiersFromPlistName:target:", CFSTR("VPN"), v2);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "arrayWithArray:", v11);
  v425 = (void *)objc_claimAutoreleasedReturnValue();

  v438 = v2;
  if (-[VPNSetupListController overviewMode](v2, "overviewMode"))
  {
    objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa + v3), "name");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setTitle:](v2, "setTitle:", v12);

    objc_msgSend(v5, "objectForKeyedSubscript:");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "connectionWithServiceID:withGrade:", v13, -[VPNSetupListController vpnGrade](v2, "vpnGrade"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    v423 = v14;
    v424 = v15;
    if (objc_msgSend(v14, "grade") == 7 || objc_msgSend(v14, "grade") == 8)
    {
      v16 = v6;
      objc_msgSend(v14, "server");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "length");

      if (v18)
      {
        v19 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("SERVER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v21, v2, 0, sel_serverForConnection_, 0, 4, 0);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setServerSpecifier:](v2, "setServerSpecifier:", v22);

        -[VPNSetupListController serverSpecifier](v2, "serverSpecifier");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "addObject:", v23);

      }
      v24 = v2;
      v25 = v5;
      -[VPNSetupListController matchDomains](v24, "matchDomains");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = objc_msgSend(v26, "count");

      if (v27)
      {
        v28 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        v29 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("MATCH_DOMAINS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "groupSpecifierWithName:", v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v435 = v28;
        objc_msgSend(v28, "addObject:", v32);
        v454 = 0u;
        v455 = 0u;
        v452 = 0u;
        v453 = 0u;
        -[VPNSetupListController matchDomains](v24, "matchDomains");
        v33 = (void *)objc_claimAutoreleasedReturnValue();
        v34 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v452, v464, 16);
        if (v34)
        {
          v35 = v34;
          v36 = *(_QWORD *)v453;
          do
          {
            for (i = 0; i != v35; ++i)
            {
              if (*(_QWORD *)v453 != v36)
                objc_enumerationMutation(v33);
              objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", *(_QWORD *)(*((_QWORD *)&v452 + 1) + 8 * i), v438, 0, 0, 0, 4, 0);
              v38 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v435, "addObject:", v38);

            }
            v35 = objc_msgSend(v33, "countByEnumeratingWithState:objects:count:", &v452, v464, 16);
          }
          while (v35);
        }

        v9 = 0x24BDBC000;
      }
      else
      {
        v435 = 0;
      }
      -[VPNSetupListController excludeDomains](v438, "excludeDomains");
      v80 = (void *)objc_claimAutoreleasedReturnValue();
      v81 = objc_msgSend(v80, "count");

      if (v81)
      {
        v82 = objc_alloc_init(*(Class *)(v9 + 3768));
        v83 = (void *)MEMORY[0x24BE75590];
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v84 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v84, "localizedStringForKey:value:table:", CFSTR("EXCLUDE_DOMAINS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v85 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v83, "groupSpecifierWithName:", v85);
        v86 = (void *)objc_claimAutoreleasedReturnValue();

        v434 = v82;
        objc_msgSend(v82, "addObject:", v86);
        v450 = 0u;
        v451 = 0u;
        v448 = 0u;
        v449 = 0u;
        -[VPNSetupListController excludeDomains](v438, "excludeDomains");
        v87 = (void *)objc_claimAutoreleasedReturnValue();
        v88 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v448, v463, 16);
        v5 = v25;
        v2 = v438;
        if (v88)
        {
          v89 = v88;
          v90 = *(_QWORD *)v449;
          do
          {
            for (j = 0; j != v89; ++j)
            {
              if (*(_QWORD *)v449 != v90)
                objc_enumerationMutation(v87);
              objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", *(_QWORD *)(*((_QWORD *)&v448 + 1) + 8 * j), v438, 0, 0, 0, 4, 0);
              v92 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v434, "addObject:", v92);

            }
            v89 = objc_msgSend(v87, "countByEnumeratingWithState:objects:count:", &v448, v463, 16);
          }
          while (v89);
        }

        v422 = 0;
        v6 = v16;
        goto LABEL_36;
      }
      v422 = 0;
      v434 = 0;
      v5 = v25;
      v2 = v438;
      v14 = v423;
      v93 = 0x25408B000;
    }
    else
    {
      v94 = objc_msgSend(v14, "connected");
      v95 = -[VPNSetupListController vpnGrade](v2, "vpnGrade");
      v93 = 0x25408B000uLL;
      if (v94)
      {
        if (v95 != 3)
        {
          objc_msgSend(v14, "server");
          v338 = (void *)objc_claimAutoreleasedReturnValue();
          v339 = objc_msgSend(v338, "length");

          if (v339)
          {
            v340 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v341 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v341, "localizedStringForKey:value:table:", CFSTR("SERVER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v342 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v340, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v342, v2, 0, sel_serverForConnection_, 0, 4, 0);
            v343 = (void *)objc_claimAutoreleasedReturnValue();
            -[VPNSetupListController setServerSpecifier:](v2, "setServerSpecifier:", v343);

            -[VPNSetupListController serverSpecifier](v2, "serverSpecifier");
            v344 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v344);

          }
          objc_msgSend(v14, "accountName");
          v345 = (void *)objc_claimAutoreleasedReturnValue();
          v346 = objc_msgSend(v345, "length");

          if (v346)
          {
            v347 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v348 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v348, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_NAME"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v349 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v347, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v349, v2, 0, sel_usernameForConnection_, 0, 4, 0);
            v350 = (void *)objc_claimAutoreleasedReturnValue();
            -[VPNSetupListController setAccountSpecifier:](v2, "setAccountSpecifier:", v350);

            -[VPNSetupListController accountSpecifier](v2, "accountSpecifier");
            v351 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v351);

          }
          objc_msgSend(v14, "remoteAddress");
          v352 = (void *)objc_claimAutoreleasedReturnValue();
          v353 = objc_msgSend(v352, "length");

          if (v353)
          {
            v354 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v355 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v355, "localizedStringForKey:value:table:", CFSTR("REMOTE_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v356 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v354, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v356, v2, 0, sel_remoteIPForSpecifier_, 0, 4, 0);
            v357 = (void *)objc_claimAutoreleasedReturnValue();
            -[VPNSetupListController setServerAddressSpecifier:](v2, "setServerAddressSpecifier:", v357);

            -[VPNSetupListController serverAddressSpecifier](v2, "serverAddressSpecifier");
            v358 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v358);

          }
          objc_msgSend(v14, "ipAddresses");
          v359 = (void *)objc_claimAutoreleasedReturnValue();
          if (objc_msgSend(v359, "count"))
          {
            objc_msgSend(v14, "ipAddresses");
            v360 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v360, "objectAtIndexedSubscript:", 0);
            v361 = (void *)objc_claimAutoreleasedReturnValue();
            v362 = objc_msgSend(v361, "length");

            if (v362)
            {
              v363 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v364 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v364, "localizedStringForKey:value:table:", CFSTR("LOCAL_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
              v365 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v363, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v365, v2, 0, sel_localIPForSpecifier_, 0, 4, 0);
              v366 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "addObject:", v366);
            }
            else
            {
              v366 = 0;
            }
            v14 = v423;
          }
          else
          {

            v366 = 0;
          }
          v384 = v6;
          objc_msgSend(v14, "ipAddresses");
          v385 = (void *)objc_claimAutoreleasedReturnValue();
          if ((unint64_t)objc_msgSend(v385, "count") <= 1)
          {

          }
          else
          {
            objc_msgSend(v14, "ipAddresses");
            v386 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v386, "objectAtIndexedSubscript:", 1);
            v387 = (void *)objc_claimAutoreleasedReturnValue();
            v388 = objc_msgSend(v387, "length");

            if (v388)
            {
              v389 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v390 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v390, "localizedStringForKey:value:table:", CFSTR("LOCAL_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
              v391 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v389, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v391, v438, 0, sel_localIP2ForSpecifier_, 0, 4, 0);
              v392 = objc_claimAutoreleasedReturnValue();

              objc_msgSend(v15, "addObject:", v392);
              v366 = (void *)v392;
            }
          }
          v393 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v394 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v394, "localizedStringForKey:value:table:", CFSTR("CONNECT_TIME"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v395 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v393, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v395, v438, 0, sel_timeConnectedForSpecifier_, 0, 4, 0);
          v396 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController setTimeSpecifier:](v438, "setTimeSpecifier:", v396);

          -[VPNSetupListController timeSpecifier](v438, "timeSpecifier");
          v397 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v397);

          if (os_variant_has_internal_ui())
          {
            if (-[VPNSetupListController currentVPNType](v438, "currentVPNType") == 4
              && (-[VPNSetupListController vpnGrade](v438, "vpnGrade") == 1
               || !-[VPNSetupListController vpnGrade](v438, "vpnGrade")))
            {
              v400 = (void *)MEMORY[0x24BE75590];
              objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
              v401 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v401, "localizedStringForKey:value:table:", CFSTR("TUNNEL_TYPE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
              v402 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v400, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v402, v438, 0, sel_tunnelType_, 0, 4, 0);
              v403 = objc_claimAutoreleasedReturnValue();

              v422 = (void *)v403;
              objc_msgSend(v15, "addObject:", v403);
              v14 = v423;
              if ((objc_msgSend(v423, "isPrimary") & 1) == 0)
              {
                objc_msgSend(v423, "matchDomains");
                v404 = (void *)objc_claimAutoreleasedReturnValue();
                v405 = objc_msgSend(v404, "count");

                v93 = 0x25408B000;
                if (v405)
                {
                  v406 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
                  v437 = (void *)MEMORY[0x24BE75590];
                  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                  v407 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v407, "localizedStringForKey:value:table:", CFSTR("MATCH_DOMAINS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                  v408 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v437, "groupSpecifierWithName:", v408);
                  v409 = objc_claimAutoreleasedReturnValue();

                  v435 = v406;
                  v410 = v406;
                  v411 = (void *)v409;
                  objc_msgSend(v410, "addObject:", v409);
                  v446 = 0u;
                  v447 = 0u;
                  v444 = 0u;
                  v445 = 0u;
                  objc_msgSend(v423, "matchDomains");
                  v412 = (void *)objc_claimAutoreleasedReturnValue();
                  v413 = objc_msgSend(v412, "countByEnumeratingWithState:objects:count:", &v444, v462, 16);
                  if (v413)
                  {
                    v414 = v413;
                    v415 = *(_QWORD *)v445;
                    do
                    {
                      for (k = 0; k != v414; ++k)
                      {
                        if (*(_QWORD *)v445 != v415)
                          objc_enumerationMutation(v412);
                        objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", *(_QWORD *)(*((_QWORD *)&v444 + 1) + 8 * k), v438, 0, 0, 0, 4, 0);
                        v417 = (void *)objc_claimAutoreleasedReturnValue();
                        objc_msgSend(v435, "addObject:", v417);

                      }
                      v414 = objc_msgSend(v412, "countByEnumeratingWithState:objects:count:", &v444, v462, 16);
                    }
                    while (v414);
                  }

                  v434 = 0;
                  v6 = v384;
                  v2 = v438;
                  v14 = v423;
                  v15 = v424;
                }
                else
                {
                  v434 = 0;
                  v435 = 0;
                  v6 = v384;
                  v2 = v438;
                }
                goto LABEL_38;
              }
              v434 = 0;
              v435 = 0;
              v6 = v384;
              v2 = v438;
LABEL_37:
              v93 = 0x25408B000;
LABEL_38:
              v9 = 0x24BDBC000;
              goto LABEL_99;
            }
            v434 = 0;
            v435 = 0;
            v422 = v366;
          }
          else
          {
            v422 = v366;
            v434 = 0;
            v435 = 0;
          }
          v6 = v384;
          v2 = v438;
LABEL_36:
          v14 = v423;
          goto LABEL_37;
        }
        v96 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
        -[VPNSetupListController setTimeSpecifierArray:](v2, "setTimeSpecifierArray:", v96);

        v431 = objc_msgSend(v14, "subConnectionCount");
        if (v431)
        {
          v418 = v6;
          v422 = 0;
          v97 = 0;
          v98 = 0x24BDD1000uLL;
          do
          {
            objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
            v99 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v15, "addObject:", v99);

            v100 = (void *)MEMORY[0x24BE75590];
            v101 = v15;
            objc_msgSend(*(id *)(v98 + 1160), "bundleForClass:", objc_opt_class());
            v102 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v102, "localizedStringForKey:value:table:", CFSTR("INTERFACE_TYPE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v103 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v100, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v103, v2, 0, sel_interfaceTypeForConnection_, 0, 4, 0);
            v104 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v97);
            v105 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v104, "setProperty:forKey:", v105, CFSTR("VPNSubConnectionIndex"));

            objc_msgSend(v101, "addObject:", v104);
            v106 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(*(id *)(v98 + 1160), "bundleForClass:", objc_opt_class());
            v107 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v107, "localizedStringForKey:value:table:", CFSTR("REMOTE_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v108 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v106, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v108, v2, 0, sel_remoteIPForSpecifier_, 0, 4, 0);
            v109 = (void *)objc_claimAutoreleasedReturnValue();

            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v97);
            v110 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v109, "setProperty:forKey:", v110, CFSTR("VPNSubConnectionIndex"));

            objc_msgSend(v101, "addObject:", v109);
            v111 = (void *)MEMORY[0x24BE75590];
            objc_msgSend(*(id *)(v98 + 1160), "bundleForClass:", objc_opt_class());
            v112 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v112, "localizedStringForKey:value:table:", CFSTR("LOCAL_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v113 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v111, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v113, v2, 0, sel_localIPForSpecifier_, 0, 4, 0);
            v114 = (void *)objc_claimAutoreleasedReturnValue();

            v115 = v423;
            objc_msgSend(v423, "ipAddressesForSubConnection:", v97);
            v116 = (void *)objc_claimAutoreleasedReturnValue();
            if (objc_msgSend(v116, "count"))
            {
              objc_msgSend(v423, "ipAddressesForSubConnection:", v97);
              v117 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v117, "objectAtIndexedSubscript:", 0);
              v118 = (void *)objc_claimAutoreleasedReturnValue();
              v119 = objc_msgSend(v118, "length");

              if (v119)
              {
                v120 = (void *)MEMORY[0x24BE75590];
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v121 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v121, "localizedStringForKey:value:table:", CFSTR("LOCAL_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                v122 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v120, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v122, v438, 0, sel_localIPForSpecifier_, 0, 4, 0);
                v123 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v97);
                v124 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setProperty:forKey:", v124, CFSTR("VPNSubConnectionIndex"));

                objc_msgSend(v424, "addObject:", v114);
                v422 = (void *)v123;
              }
              v115 = v423;
            }
            else
            {

            }
            objc_msgSend(v115, "ipAddressesForSubConnection:", v97);
            v125 = (void *)objc_claimAutoreleasedReturnValue();
            v436 = v97;
            if ((unint64_t)objc_msgSend(v125, "count") <= 1)
            {

              v130 = 0x24BDD1000;
            }
            else
            {
              objc_msgSend(v115, "ipAddressesForSubConnection:", v97);
              v126 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v126, "objectAtIndexedSubscript:", 1);
              v127 = (void *)objc_claimAutoreleasedReturnValue();
              v128 = objc_msgSend(v127, "length");

              if (v128)
              {
                v129 = (void *)MEMORY[0x24BE75590];
                v130 = 0x24BDD1000uLL;
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v131 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v131, "localizedStringForKey:value:table:", CFSTR("LOCAL_IP"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                v132 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v129, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v132, v438, 0, sel_localIP2ForSpecifier_, 0, 4, 0);
                v133 = objc_claimAutoreleasedReturnValue();

                objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v97);
                v134 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v114, "setProperty:forKey:", v134, CFSTR("VPNSubConnectionIndex"));

                objc_msgSend(v424, "addObject:", v114);
                v422 = (void *)v133;
              }
              else
              {
                v130 = 0x24BDD1000uLL;
              }
            }
            v135 = (void *)MEMORY[0x24BE75590];
            v98 = v130;
            objc_msgSend(*(id *)(v130 + 1160), "bundleForClass:", objc_opt_class());
            v136 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v136, "localizedStringForKey:value:table:", CFSTR("CONNECT_TIME"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v137 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v135, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v137, v438, 0, sel_timeConnectedForSpecifier_, 0, 4, 0);
            v138 = (void *)objc_claimAutoreleasedReturnValue();

            v2 = v438;
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInteger:", v97);
            v139 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v138, "setProperty:forKey:", v139, CFSTR("VPNSubConnectionIndex"));

            v15 = v424;
            objc_msgSend(v424, "addObject:", v138);
            -[VPNSetupListController timeSpecifierArray](v438, "timeSpecifierArray");
            v140 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v140, "addObject:", v138);

            ++v97;
          }
          while (v431 != v436 + 1);
          v434 = 0;
          v435 = 0;
          v6 = v418;
          goto LABEL_36;
        }
      }
      else if (v95 != 3)
      {
        objc_msgSend(v14, "server");
        v229 = (void *)objc_claimAutoreleasedReturnValue();
        v230 = objc_msgSend(v229, "length");

        if (v230)
        {
          v231 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v232 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v232, "localizedStringForKey:value:table:", CFSTR("SERVER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v233 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v231, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v233, v2, 0, sel_serverForConnection_, 0, 4, 0);
          v234 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController setServerSpecifier:](v2, "setServerSpecifier:", v234);

          -[VPNSetupListController serverSpecifier](v2, "serverSpecifier");
          v235 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v235);

        }
        objc_msgSend(v14, "accountName");
        v236 = (void *)objc_claimAutoreleasedReturnValue();
        v237 = objc_msgSend(v236, "length");

        if (v237)
        {
          v238 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v239 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v239, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_NAME"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v240 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v238, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v240, v2, 0, sel_usernameForConnection_, 0, 4, 0);
          v241 = (void *)objc_claimAutoreleasedReturnValue();
          -[VPNSetupListController setAccountSpecifier:](v2, "setAccountSpecifier:", v241);

          -[VPNSetupListController accountSpecifier](v2, "accountSpecifier");
          v242 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "addObject:", v242);

        }
      }
      v422 = 0;
      v434 = 0;
      v435 = 0;
    }
LABEL_99:
    v243 = objc_alloc_init(*(Class *)(v9 + 3768));
    objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
    v421 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "addObject:");
    objc_msgSend(v425, "specifierForID:", CFSTR("VPN_GRADE"));
    v244 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v243, "addObject:", v244);

    if (v15)
      objc_msgSend(v243, "addObjectsFromArray:", v15);
    -[VPNSetupListController appName](v2, "appName");
    v245 = (void *)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend(v245, "length") && -[VPNSetupListController vpnGrade](v2, "vpnGrade") == 2)
    {
      v246 = -[VPNSetupListController currentVPNType](v2, "currentVPNType");

      if (v246 == 3 || !v14)
        goto LABEL_107;
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v247 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v247, "localizedStringForKey:value:table:", CFSTR("STATUS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v245 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v245, v2, sel_setConnectionState_forSpecifier_, sel_getConnectionStateForSpecifier_, 0, 6, 0);
      v248 = (void *)objc_claimAutoreleasedReturnValue();
      v460 = *MEMORY[0x24BE75948];
      v461 = objc_opt_class();
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v461, &v460, 1);
      v249 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v248, "setProperties:", v249);

      -[VPNSetupListController setConnectSpecifier:](v2, "setConnectSpecifier:", v248);
      -[VPNSetupListController connectSpecifier](v2, "connectSpecifier");
      v250 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "addObject:", v250);

    }
LABEL_107:
    -[VPNSetupListController appName](v2, "appName");
    v251 = (void *)objc_claimAutoreleasedReturnValue();
    v252 = objc_msgSend(v251, "length");

    if (v252)
    {
      v253 = (void *)MEMORY[0x24BDD17C8];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v254 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v254, "localizedStringForKey:value:table:", CFSTR("APP_CONFIG_MESSAGE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v255 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController displayName](v2, "displayName");
      v256 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController appName](v2, "appName");
      v257 = v6;
      v258 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v253, "stringWithFormat:", v255, v256, v258);
      v259 = (void *)objc_claimAutoreleasedReturnValue();

      v6 = v257;
      v14 = v423;

      objc_msgSend(v421, "setProperty:forKey:", v259, *MEMORY[0x24BE75A68]);
    }
    if (-[VPNSetupListController onDemandService](v2, "onDemandService"))
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v260 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "addObject:", v260);

      objc_msgSend(v425, "specifierForID:", CFSTR("ON_DEMAND"));
      v261 = (void *)objc_claimAutoreleasedReturnValue();
      v458 = *MEMORY[0x24BE75A18];
      objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", objc_msgSend(v14, "onDemandUserOverrideDisabled") ^ 1);
      v262 = (void *)objc_claimAutoreleasedReturnValue();
      v459 = v262;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", &v459, &v458, 1);
      v263 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v261, "setProperties:", v263);

      objc_msgSend(v243, "addObject:", v261);
    }
    if (objc_msgSend(v435, "count"))
      objc_msgSend(v243, "addObjectsFromArray:", v435);
    if (objc_msgSend(v434, "count"))
      objc_msgSend(v243, "addObjectsFromArray:", v434);
    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vpn-service-id"));
    v264 = (void *)objc_claimAutoreleasedReturnValue();
    v265 = (void *)objc_msgSend(v264, "copy");
    -[VPNSetupListController setServiceID:](v2, "setServiceID:", v265);

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vpn-user-created"));
    v266 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setUserCreated:](v2, "setUserCreated:", objc_msgSend(v266, "BOOLValue"));

    objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vpn-profile-backed"));
    v267 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setProfileBacked:](v2, "setProfileBacked:", objc_msgSend(v267, "BOOLValue"));

    objc_msgSend((id)(v93 + 3704), "sharedInstance");
    v268 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController serviceID](v2, "serviceID");
    v269 = (void *)objc_claimAutoreleasedReturnValue();
    v270 = objc_msgSend(v268, "isEnabledWithServiceID:withGrade:", v269, -[VPNSetupListController vpnGrade](v2, "vpnGrade"));

    if (-[VPNSetupListController vpnGrade](v2, "vpnGrade") == 2
      || -[VPNSetupListController vpnGrade](v2, "vpnGrade") == 8)
    {
      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v271 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "addObject:", v271);

      v272 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v273 = (void *)objc_claimAutoreleasedReturnValue();
      v274 = v273;
      if ((v270 & 1) != 0)
      {
        objc_msgSend(v273, "localizedStringForKey:value:table:", CFSTR("DEACTIVATE_CONFIGURATION"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v275 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v272, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v275, v2, 0, 0, 0, 13, 0);
        v276 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setEnableButton:](v2, "setEnableButton:", v276);

        v277 = sel_disableButtonTapped_;
      }
      else
      {
        objc_msgSend(v273, "localizedStringForKey:value:table:", CFSTR("ACTIVATE_CONFIGURATION"), &stru_24EE4DF70, CFSTR("MobileVPN"));
        v278 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v272, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v278, v2, 0, 0, 0, 13, 0);
        v279 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController setEnableButton:](v2, "setEnableButton:", v279);

        v277 = sel_enableButtonTapped_;
      }
      -[VPNSetupListController enableButton](v2, "enableButton");
      v280 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v280, "setButtonAction:", v277);

      -[VPNSetupListController enableButton](v2, "enableButton");
      v281 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v243, "addObject:", v281);

    }
    if (-[VPNSetupListController userCreated](v2, "userCreated"))
    {
      -[VPNSetupListController serviceID](v2, "serviceID");
      v282 = (void *)objc_claimAutoreleasedReturnValue();
      v283 = v282 != 0;

    }
    else
    {
      v283 = 0;
    }
    v430 = v243;
    if (-[VPNSetupListController onDemandService](v2, "onDemandService"))
    {
      v284 = 0;
LABEL_135:
      if (v283 || v284)
      {
        -[VPNSetupListController setPasswordEditOnly:](v2, "setPasswordEditOnly:", !v283);
        v289 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6860]), "initWithBarButtonSystemItem:target:action:", 2, v2, sel_editButtonTapped_);
        -[VPNSetupListController navigationItem](v2, "navigationItem");
        v290 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v290, "setRightBarButtonItem:", v289);

      }
      v291 = v424;
      v44 = v430;
      if (!-[VPNSetupListController profileBacked](v2, "profileBacked"))
      {
        objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
        v292 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v430, "addObject:", v292);

        objc_msgSend(v430, "lastObject");
        v293 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v293, "setProperty:forKey:", CFSTR("SPACER_GROUP"), *MEMORY[0x24BE75AC0]);

        if (objc_msgSend(v14, "grade") == 7 || objc_msgSend(v14, "grade") == 8)
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v294, "localizedStringForKey:value:table:", CFSTR("DELETE_RELAY"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v295 = (id)objc_claimAutoreleasedReturnValue();

        }
        else
        {
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v294 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v294, "localizedStringForKey:value:table:", CFSTR("DELETE_VPN"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v295 = (id)objc_claimAutoreleasedReturnValue();
        }

        objc_msgSend(MEMORY[0x24BE75590], "deleteButtonSpecifierWithName:target:action:", v295, v2, sel_deleteConfirm_);
        v299 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v430, "addObject:", v299);

      }
      objc_msgSend((id)(v93 + 3704), "sharedInstance");
      v300 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController serviceID](v2, "serviceID");
      v301 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v300, "getProfileIDForServiceID:", v301);
      v302 = (void *)objc_claimAutoreleasedReturnValue();

      if (v302)
      {
        objc_msgSend(v14, "lastStopCause");
        v303 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v303, "intValue") == 13
           || objc_msgSend(v303, "intValue") == 20
           || objc_msgSend(v303, "intValue") == 21
           || objc_msgSend(v303, "intValue") == 24)
          && -[VPNSetupListController vpnGrade](v2, "vpnGrade") != 7
          && -[VPNSetupListController vpnGrade](v2, "vpnGrade") != 8)
        {
          objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
          v304 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v430, "addObject:", v304);

          v305 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v306 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v306, "localizedStringForKey:value:table:", CFSTR("RENEW_CERTIFICATE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v307 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v305, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v307, v2, 0, 0, 0, 13, 0);
          v308 = (void *)objc_claimAutoreleasedReturnValue();

          v14 = v423;
          objc_msgSend(v308, "setButtonAction:", sel_renewCertificate_);
          objc_msgSend(v430, "addObject:", v308);

        }
      }
      -[VPNSetupListController includedBundleIDs](v2, "includedBundleIDs");
      v309 = objc_claimAutoreleasedReturnValue();
      if (v309)
      {
        v310 = (void *)v309;
        -[VPNSetupListController includedBundleIDs](v2, "includedBundleIDs");
        v311 = (void *)objc_claimAutoreleasedReturnValue();
        v312 = objc_msgSend(v311, "count");

        if (v312)
        {
          v419 = v6;
          v420 = v5;
          v313 = (void *)MEMORY[0x24BE75590];
          objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
          v314 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v314, "localizedStringForKey:value:table:", CFSTR("INCLUDED_APPS_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
          v315 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v313, "groupSpecifierWithName:", v315);
          v316 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v430, "addObject:", v316);

          v442 = 0u;
          v443 = 0u;
          v440 = 0u;
          v441 = 0u;
          -[VPNSetupListController includedBundleIDs](v2, "includedBundleIDs");
          obj = (id)objc_claimAutoreleasedReturnValue();
          v317 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v440, v457, 16);
          if (v317)
          {
            v318 = v317;
            v319 = *(_QWORD *)v441;
            v429 = *MEMORY[0x24BE75AC0];
            v427 = *MEMORY[0x24BE75B88];
            v428 = *MEMORY[0x24BE75B70];
            v426 = *MEMORY[0x24BE75AC8];
            do
            {
              v320 = 0;
              v432 = v318;
              do
              {
                if (*(_QWORD *)v441 != v319)
                  objc_enumerationMutation(obj);
                v321 = *(_QWORD *)(*((_QWORD *)&v440 + 1) + 8 * v320);
                v322 = objc_alloc(MEMORY[0x24BDC1540]);
                v439 = 0;
                v323 = (void *)objc_msgSend(v322, "initWithBundleIdentifier:allowPlaceholder:error:", v321, 0, &v439);
                v324 = v439;
                objc_msgSend(v323, "localizedName");
                v325 = (void *)objc_claimAutoreleasedReturnValue();

                if (v325)
                  v326 = v324 == 0;
                else
                  v326 = 0;
                if (v326)
                {
                  objc_msgSend(MEMORY[0x24BE75590], "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v325, v438, 0, sel_getDescriptionForApp_, 0, 4, 0);
                  v327 = (void *)objc_claimAutoreleasedReturnValue();
                  -[VPNSetupListController includedBundleIDs](v438, "includedBundleIDs");
                  v328 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v328, "objectForKeyedSubscript:", v321);
                  v329 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_msgSend(v327, "setProperty:forKey:", v329, CFSTR("AppDescription"));

                  objc_msgSend(v327, "setProperty:forKey:", v321, v429);
                  if (objc_msgSend(MEMORY[0x24BDF6FD0], "bundleIdentifierContainsWebClipIdentifier:", v321))
                  {
                    objc_msgSend(MEMORY[0x24BDF6FD0], "webClipIdentifierFromBundleIdentifier:", v321);
                    v330 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDF6FD0], "webClipWithIdentifier:", v330);
                    v331 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(MEMORY[0x24BDF6D38], "mainScreen");
                    v332 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v332, "scale");
                    objc_msgSend(v331, "generateIconImageForFormat:scale:", 0);
                    v333 = (void *)objc_claimAutoreleasedReturnValue();

                    if (v333)
                      objc_msgSend(v327, "setProperty:forKey:", v333, v426);

                  }
                  else
                  {
                    objc_msgSend(v327, "setProperty:forKey:", v321, v428);
                    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
                    v330 = (void *)objc_claimAutoreleasedReturnValue();
                    objc_msgSend(v327, "setProperty:forKey:", v330, v427);
                  }
                  v44 = v430;
                  v318 = v432;

                  objc_msgSend(v430, "addObject:", v327);
                }

                ++v320;
              }
              while (v318 != v320);
              v318 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v440, v457, 16);
            }
            while (v318);
          }

          v6 = v419;
          v5 = v420;
          v2 = v438;
          v14 = v423;
          v291 = v424;
        }
      }
      v334 = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
      objc_storeStrong(v334, v44);
      v148 = *v334;

      v335 = v422;
      v337 = v434;
      v336 = v435;
      goto LABEL_205;
    }
    objc_msgSend((id)(v93 + 3704), "sharedInstance");
    v285 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController serviceID](v2, "serviceID");
    v286 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v285, "getProfileIDForServiceID:", v286);
    v287 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v287)
    {
      v284 = 0;
      goto LABEL_134;
    }
    -[VPNSetupListController appName](v2, "appName");
    v288 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v288, "length")
      || -[VPNSetupListController currentVPNType](v2, "currentVPNType") == 3
      || -[VPNSetupListController vpnGrade](v2, "vpnGrade")
      || -[VPNSetupListController alwaysPrompt](v2, "alwaysPrompt"))
    {
      goto LABEL_131;
    }
    if (-[VPNSetupListController currentVPNType](v2, "currentVPNType") != 4)
    {
      v284 = 1;
      goto LABEL_132;
    }
    if (-[VPNSetupListController eapType](v2, "eapType") != 1)
    {
LABEL_131:
      v284 = 0;
    }
    else
    {
      objc_msgSend(v423, "accountName");
      v398 = v6;
      v399 = (void *)objc_claimAutoreleasedReturnValue();
      v284 = objc_msgSend(v399, "length") != 0;

      v6 = v398;
      v2 = v438;
    }
LABEL_132:

    v14 = v423;
LABEL_134:

    goto LABEL_135;
  }
  v42 = -[VPNSetupListController passwordEditOnly](v2, "passwordEditOnly");
  v43 = (uint64_t *)MEMORY[0x24BE75A18];
  if (!v42)
  {
    v61 = v6;
    objc_msgSend(v425, "specifierForID:", CFSTR("VPN_GRADE"));
    v62 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setVpnGradeStaticSpecifier:](v2, "setVpnGradeStaticSpecifier:", v62);

    objc_msgSend(v425, "specifierForID:", CFSTR("GROUP_NAME"));
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setGroupNameSpecifier:](v2, "setGroupNameSpecifier:", v63);

    objc_msgSend(v425, "specifierForID:", CFSTR("LOCAL_IDENTIFIER"));
    v64 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setLocalIdentifierSpecifier:](v2, "setLocalIdentifierSpecifier:", v64);

    objc_msgSend(v425, "specifierForID:", CFSTR("REMOTE_IDENTIFIER"));
    v65 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setRemoteIdentifierSpecifier:](v2, "setRemoteIdentifierSpecifier:", v65);

    objc_msgSend(v425, "specifierForID:", CFSTR("EAP_TYPE"));
    v66 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setEapTypeSpecifier:](v2, "setEapTypeSpecifier:", v66);

    objc_msgSend(v425, "specifierForID:", CFSTR("CERTIFICATE_BASED"));
    v67 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setUseCertificateSwitchSpecifier:](v2, "setUseCertificateSwitchSpecifier:", v67);

    objc_msgSend(v425, "specifierForID:", CFSTR("CERTIFICATE_IKEV2"));
    v68 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setAuthTypeSpecifier:](v2, "setAuthTypeSpecifier:", v68);

    objc_msgSend(v425, "specifierForID:", CFSTR("CERTIFICATE_LIST"));
    v69 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setCertificateListSpecifier:](v2, "setCertificateListSpecifier:", v69);

    -[VPNSetupListController certificateObjects](v2, "certificateObjects");
    v70 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v70, "count"))
    {
      -[VPNSetupListController certificateObjects](v2, "certificateObjects");
      v71 = (void *)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend(v71, "count");
      -[VPNSetupListController certificateIDs](v2, "certificateIDs");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      v74 = objc_msgSend(v73, "count");

      if (v72 == v74)
      {
        -[VPNSetupListController certificateListSpecifier](v2, "certificateListSpecifier");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        v76 = *v43;
        v77 = MEMORY[0x24BDBD1C8];
        objc_msgSend(v75, "setProperty:forKey:", MEMORY[0x24BDBD1C8], *v43);

        -[VPNSetupListController certificateListSpecifier](v2, "certificateListSpecifier");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController certificateObjects](v2, "certificateObjects");
        v79 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v78, "setValues:", v79);

        goto LABEL_63;
      }
    }
    else
    {

    }
    -[VPNSetupListController certificateListSpecifier](v2, "certificateListSpecifier");
    v78 = (void *)objc_claimAutoreleasedReturnValue();
    v76 = *v43;
    v77 = MEMORY[0x24BDBD1C0];
    objc_msgSend(v78, "setProperty:forKey:", MEMORY[0x24BDBD1C0], *v43);
LABEL_63:

    -[VPNSetupListController useCertificateSwitchSpecifier](v2, "useCertificateSwitchSpecifier");
    v149 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v149, "setProperty:forKey:", v77, v76);

    objc_msgSend(v425, "specifierForID:", CFSTR("SECRET"));
    v150 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setSharedSecretSpecifier:](v2, "setSharedSecretSpecifier:", v150);

    objc_msgSend(v425, "specifierForID:", CFSTR("ENCRYPTION_LEVEL"));
    v151 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setEncryptionTypeSpecifier:](v2, "setEncryptionTypeSpecifier:", v151);

    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v152 = (void *)objc_claimAutoreleasedReturnValue();
    v153 = objc_msgSend(v152, "userInterfaceIdiom");

    if ((v153 & 0xFFFFFFFFFFFFFFFBLL) != 1)
    {
      -[VPNSetupListController encryptionTypeSpecifier](v2, "encryptionTypeSpecifier");
      v154 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v155 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v155, "localizedStringForKey:value:table:", CFSTR("ENCRYPTION_LEVEL_ABBREVIATED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v156 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v154, "setName:", v156);

    }
    objc_msgSend(v425, "specifierForID:", CFSTR("EAP_RSA"));
    v157 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setRsaSpecifier:](v2, "setRsaSpecifier:", v157);

    objc_msgSend(v425, "specifierForID:", CFSTR("TYPE_SPECIFIER"));
    v158 = (void *)objc_claimAutoreleasedReturnValue();
    v456[0] = v158;
    objc_msgSend(v425, "specifierForID:", CFSTR("TYPE_GROUP"));
    v159 = (void *)objc_claimAutoreleasedReturnValue();
    v456[1] = v159;
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v456, 2);
    v160 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setTypeTabSpecifiers:](v2, "setTypeTabSpecifiers:", v160);

    objc_msgSend(v425, "specifierForID:", CFSTR("SERVER"));
    v161 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setEditServerSpecifier:](v2, "setEditServerSpecifier:", v161);

    objc_msgSend(v425, "specifierForID:", CFSTR("CISCO_IMAGE_GROUP"));
    v162 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setCiscoImageSpecifier:](v2, "setCiscoImageSpecifier:", v162);

    objc_msgSend(v425, "specifierForID:", CFSTR("PASSWORD"));
    v163 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setPasswordSpecifier:](v2, "setPasswordSpecifier:", v163);

    -[VPNSetupListController passwordSpecifier](v2, "passwordSpecifier");
    v164 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController passwordRequired](v2, "passwordRequired") ^ 1);
    v165 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v164, "setProperty:forKey:", v165, v76);

    objc_msgSend(v425, "specifierForID:", CFSTR("DISPLAY_NAME"));
    v166 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setDisplayNameSpecifier:](v2, "setDisplayNameSpecifier:", v166);

    if (-[VPNSetupListController currentVPNType](v2, "currentVPNType") == 4)
      v167 = CFSTR("USERNAME");
    else
      v167 = CFSTR("ACCOUNT_NAME");
    objc_msgSend(v425, "specifierForID:", v167);
    v168 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setAccountSpecifier:](v2, "setAccountSpecifier:", v168);

    -[VPNSetupListController accountSpecifier](v2, "accountSpecifier");
    v169 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v169, "setKeyboardType:autoCaps:autoCorrection:", 0, 0, 0);

    objc_msgSend(v425, "specifierForID:", CFSTR("SEND_ALL_TRAFFIC"));
    v170 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setSendAllTrafficSpecifier:](v2, "setSendAllTrafficSpecifier:", v170);

    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_LABEL"));
    v171 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setProxyLabelSpecifier:](v2, "setProxyLabelSpecifier:", v171);

    v172 = objc_alloc(MEMORY[0x24BDBCE30]);
    -[VPNSetupListController proxyLabelSpecifier](v2, "proxyLabelSpecifier");
    v173 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_TYPE"));
    v174 = (void *)objc_claimAutoreleasedReturnValue();
    v175 = (void *)objc_msgSend(v172, "initWithObjects:", v173, v174, 0);
    -[VPNSetupListController setProxyGroupSpecifiers:](v2, "setProxyGroupSpecifiers:", v175);

    v176 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_GROUP"));
    v177 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_URL"));
    v178 = (void *)objc_claimAutoreleasedReturnValue();
    v179 = (void *)objc_msgSend(v176, "initWithObjects:", v177, v178, 0);
    -[VPNSetupListController setPacSpecifiers:](v2, "setPacSpecifiers:", v179);

    v180 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_GROUP"));
    v181 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_SERVER"));
    v182 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_PORT"));
    v183 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_AUTHENTICATION"));
    v184 = (void *)objc_claimAutoreleasedReturnValue();
    v185 = (void *)objc_msgSend(v180, "initWithObjects:", v181, v182, v183, v184, 0);
    -[VPNSetupListController setManualProxySpecifiers:](v2, "setManualProxySpecifiers:", v185);

    v186 = objc_alloc(MEMORY[0x24BDBCE30]);
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_USERNAME"));
    v187 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v425, "specifierForID:", CFSTR("PROXY_PASSWORD"));
    v188 = (void *)objc_claimAutoreleasedReturnValue();
    v189 = (void *)objc_msgSend(v186, "initWithObjects:", v187, v188, 0);
    -[VPNSetupListController setProxyAuthSpecifiers:](v2, "setProxyAuthSpecifiers:", v189);

    -[VPNSetupListController serviceID](v2, "serviceID");
    v190 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v190)
    {
      objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa + v3), "userInfo");
      v191 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v191, "objectForKey:", CFSTR("vpn-service-id"));
      v192 = (void *)objc_claimAutoreleasedReturnValue();
      v193 = (void *)objc_msgSend(v192, "copy");
      -[VPNSetupListController setServiceID:](v2, "setServiceID:", v193);

    }
    -[VPNSetupListController serviceID](v2, "serviceID");
    v194 = (void *)objc_claimAutoreleasedReturnValue();

    v6 = v61;
    if (v194)
    {
      objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa + v3), "name");
      v195 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNSetupListController setTitle:](v2, "setTitle:", v195);

    }
    objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa + v3), "userInfo");
    v196 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v196, "objectForKey:", CFSTR("vpn-user-created"));
    v197 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setUserCreated:](v2, "setUserCreated:", objc_msgSend(v197, "BOOLValue"));

    objc_msgSend(*(id *)((char *)&v2->super.super.super.super.super.isa + v3), "userInfo");
    v198 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v198, "objectForKey:", CFSTR("vpn-profile-backed"));
    v199 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setProfileBacked:](v2, "setProfileBacked:", objc_msgSend(v199, "BOOLValue"));

    v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
    -[VPNSetupListController serviceID](v2, "serviceID");
    v200 = (void *)objc_claimAutoreleasedReturnValue();

    if (v200)
    {
      if (-[VPNSetupListController currentVPNType](v2, "currentVPNType") == 2)
      {
        -[VPNSetupListController ciscoImageSpecifier](v2, "ciscoImageSpecifier");
        v201 = (void *)objc_claimAutoreleasedReturnValue();

        if (v201)
        {
          -[VPNSetupListController ciscoImageSpecifier](v2, "ciscoImageSpecifier");
          v202 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v202);

          -[VPNSetupListController ciscoImageSpecifier](v2, "ciscoImageSpecifier");
          v203 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v203, "setProperty:forKey:", &unk_24EE55148, CFSTR("VisibleOnInit"));

        }
      }
      -[VPNSetupListController vpnGradeStaticSpecifier](v2, "vpnGradeStaticSpecifier");
      v204 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v204);

      objc_msgSend(MEMORY[0x24BE75590], "emptyGroupSpecifier");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v205);
    }
    else
    {
      -[VPNSetupListController ciscoImageSpecifier](v2, "ciscoImageSpecifier");
      v206 = (void *)objc_claimAutoreleasedReturnValue();

      if (v206)
      {
        -[VPNSetupListController ciscoImageSpecifier](v2, "ciscoImageSpecifier");
        v207 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v207);

        -[VPNSetupListController ciscoImageSpecifier](v2, "ciscoImageSpecifier");
        v208 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController currentVPNType](v2, "currentVPNType") == 2);
        v209 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v208, "setProperty:forKey:", v209, CFSTR("VisibleOnInit"));

      }
      -[VPNSetupListController typeTabSpecifiers](v2, "typeTabSpecifiers");
      v205 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObjectsFromArray:", v205);
    }

    if (-[VPNSetupListController userCreated](v2, "userCreated")
      || (-[VPNSetupListController serviceID](v2, "serviceID"),
          v210 = (void *)objc_claimAutoreleasedReturnValue(),
          v210,
          !v210))
    {
      -[VPNSetupListController displayNameSpecifier](v2, "displayNameSpecifier");
      v211 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v211);

    }
    -[VPNSetupListController editServerSpecifier](v2, "editServerSpecifier");
    v212 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v212);

    if (-[VPNSetupListController currentVPNType](v2, "currentVPNType") == 4)
    {
      -[VPNSetupListController remoteIdentifierSpecifier](v2, "remoteIdentifierSpecifier");
      v213 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v213);

      -[VPNSetupListController localIdentifierSpecifier](v2, "localIdentifierSpecifier");
      v214 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v214);

      v215 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v216 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v216, "localizedStringForKey:value:table:", CFSTR("AUTHENTICATION"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v217 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v215, "groupSpecifierWithName:", v217);
      v218 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v218);

      -[VPNSetupListController eapTypeSpecifier](v2, "eapTypeSpecifier");
      v219 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v219);

      if (!-[VPNSetupListController eapType](v2, "eapType"))
      {
        -[VPNSetupListController authTypeSpecifier](v2, "authTypeSpecifier");
        v220 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v220);

      }
      if (-[VPNSetupListController eapType](v2, "eapType") == 1)
      {
        -[VPNSetupListController accountSpecifier](v2, "accountSpecifier");
        v221 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v221);

        -[VPNSetupListController passwordSpecifier](v2, "passwordSpecifier");
        v222 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v222);

      }
      if (-[VPNSetupListController eapType](v2, "eapType") == 2
        || -[VPNSetupListController authType](v2, "authType") == 1 && !-[VPNSetupListController eapType](v2, "eapType"))
      {
        -[VPNSetupListController certificateListSpecifier](v2, "certificateListSpecifier");
        v223 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v223);

      }
      if (-[VPNSetupListController authType](v2, "authType"))
      {
LABEL_193:
        -[VPNSetupListController proxyGroupSpecifiers](v2, "proxyGroupSpecifiers");
        v369 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObjectsFromArray:", v369);

        objc_msgSend(v44, "specifierForID:", CFSTR("PROXY_TYPE"));
        v370 = (void *)objc_claimAutoreleasedReturnValue();
        -[VPNSetupListController proxyType:](v2, "proxyType:", v370);
        v371 = (void *)objc_claimAutoreleasedReturnValue();
        v372 = objc_msgSend(v371, "intValue");

        if (v372 == 2)
        {
          -[VPNSetupListController pacSpecifiers](v2, "pacSpecifiers");
          v376 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (v372 != 1)
            goto LABEL_199;
          -[VPNSetupListController manualProxySpecifiers](v2, "manualProxySpecifiers");
          v373 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObjectsFromArray:", v373);

          -[VPNSetupListController proxyUsesAuthentication:](v2, "proxyUsesAuthentication:", 0);
          v374 = (void *)objc_claimAutoreleasedReturnValue();
          v375 = objc_msgSend(v374, "BOOLValue");

          if (!v375)
          {
LABEL_199:
            v378 = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
            objc_storeStrong(v378, v44);
            -[VPNSetupListController serviceID](v2, "serviceID");
            v379 = (void *)objc_claimAutoreleasedReturnValue();
            if (v379)
            {

            }
            else
            {
              objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
              v380 = (void *)objc_claimAutoreleasedReturnValue();
              v381 = objc_msgSend(v380, "userInterfaceIdiom");

              if ((v381 & 0xFFFFFFFFFFFFFFFBLL) != 1)
              {
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v382 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v382, "localizedStringForKey:value:table:", CFSTR("ADD_VPN_ABBREVIATED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                v383 = (void *)objc_claimAutoreleasedReturnValue();
                -[VPNSetupListController setTitle:](v2, "setTitle:", v383);

                goto LABEL_203;
              }
            }
            -[VPNSetupListController displayName](v2, "displayName");
            v382 = (void *)objc_claimAutoreleasedReturnValue();
            -[VPNSetupListController setTitle:](v2, "setTitle:", v382);
LABEL_203:

            v148 = *v378;
            goto LABEL_204;
          }
          -[VPNSetupListController proxyAuthSpecifiers](v2, "proxyAuthSpecifiers");
          v376 = objc_claimAutoreleasedReturnValue();
        }
        v377 = (void *)v376;
        objc_msgSend(v44, "addObjectsFromArray:", v376);

        goto LABEL_199;
      }
    }
    else
    {
      v224 = -[VPNSetupListController currentVPNType](v2, "currentVPNType");
      -[VPNSetupListController accountSpecifier](v2, "accountSpecifier");
      v225 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v225);

      if (v224 != 2)
      {
        -[VPNSetupListController rsaSpecifier](v2, "rsaSpecifier");
        v296 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v296);

        if (!-[VPNSetupListController useRSASecurID](v2, "useRSASecurID"))
        {
          -[VPNSetupListController passwordSpecifier](v2, "passwordSpecifier");
          v297 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v44, "addObject:", v297);

        }
        -[VPNSetupListController sharedSecretSpecifier](v2, "sharedSecretSpecifier");
        v298 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "addObject:", v298);

        -[VPNSetupListController sendAllTrafficSpecifier](v2, "sendAllTrafficSpecifier");
        v228 = objc_claimAutoreleasedReturnValue();
        goto LABEL_192;
      }
      -[VPNSetupListController passwordSpecifier](v2, "passwordSpecifier");
      v226 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v226);

      -[VPNSetupListController useCertificateSwitchSpecifier](v2, "useCertificateSwitchSpecifier");
      v227 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v227);

      if (-[VPNSetupListController usesCertificates](v2, "usesCertificates"))
      {
        -[VPNSetupListController certificateListSpecifier](v2, "certificateListSpecifier");
        v228 = objc_claimAutoreleasedReturnValue();
LABEL_192:
        v368 = (void *)v228;
        objc_msgSend(v44, "addObject:", v228);

        goto LABEL_193;
      }
      -[VPNSetupListController groupNameSpecifier](v2, "groupNameSpecifier");
      v367 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "addObject:", v367);

    }
    -[VPNSetupListController sharedSecretSpecifier](v2, "sharedSecretSpecifier");
    v228 = objc_claimAutoreleasedReturnValue();
    goto LABEL_192;
  }
  v44 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_msgSend(v425, "specifierForID:", CFSTR("VPN_GRADE"));
  v45 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObject:", v45);

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("vpn-service-id"));
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v46, -[VPNSetupListController vpnGrade](v2, "vpnGrade"));
  v47 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v47, "server");
  v48 = (void *)objc_claimAutoreleasedReturnValue();
  v49 = objc_msgSend(v48, "length");

  if (v49)
  {
    v50 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v51 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v51, "localizedStringForKey:value:table:", CFSTR("SERVER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v52 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v52, v2, 0, sel_serverForConnection_, 0, 4, 0);
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setServerSpecifier:](v2, "setServerSpecifier:", v53);

    -[VPNSetupListController serverSpecifier](v2, "serverSpecifier");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v54);

  }
  if (-[VPNSetupListController currentVPNType](v2, "currentVPNType") != 4)
  {
    objc_msgSend(v425, "specifierForID:", CFSTR("ACCOUNT_NAME"));
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setAccountSpecifier:](v2, "setAccountSpecifier:", v58);
    goto LABEL_59;
  }
  objc_msgSend(v47, "accountName");
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  v56 = objc_msgSend(v55, "length");

  if (v56)
  {
    v57 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v58 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v58, "localizedStringForKey:value:table:", CFSTR("ACCOUNT_NAME"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v57, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v59, v2, 0, sel_usernameForConnection_, 0, 4, 0);
    v60 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNSetupListController setAccountSpecifier:](v2, "setAccountSpecifier:", v60);

LABEL_59:
    -[VPNSetupListController accountSpecifier](v2, "accountSpecifier");
    v141 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v44, "addObject:", v141);

  }
  objc_msgSend(v425, "specifierForID:", CFSTR("PASSWORD"));
  v142 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController setPasswordSpecifier:](v2, "setPasswordSpecifier:", v142);

  -[VPNSetupListController passwordSpecifier](v2, "passwordSpecifier");
  v143 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", -[VPNSetupListController passwordRequired](v2, "passwordRequired") ^ 1);
  v144 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v143, "setProperty:forKey:", v144, *v43);

  -[VPNSetupListController passwordSpecifier](v2, "passwordSpecifier");
  v145 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v44, "addObject:", v145);

  v146 = (id *)((char *)&v2->super.super.super.super.super.isa + (int)*MEMORY[0x24BE756E0]);
  objc_storeStrong(v146, v44);
  -[VPNSetupListController displayName](v2, "displayName");
  v147 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController setTitle:](v2, "setTitle:", v147);

  v148 = *v146;
LABEL_204:
  v335 = 0;
  v337 = 0;
  v336 = 0;
  v291 = 0;
LABEL_205:

  return v148;
}

- (void)renewCertificate:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id WeakRetained;
  id v8;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNSetupListController serviceID](self, "serviceID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "getProfileIDForServiceID:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  if (v8)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "showProfileErrorUIWithProfileIdentifier:outError:", v8, 0);

    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.super.super.super.isa
                                              + (int)*MEMORY[0x24BE75790]));
    objc_msgSend(WeakRetained, "dismiss");

  }
}

- (unint64_t)currentVPNType
{
  return self->_currentVPNType;
}

- (void)setCurrentVPNType:(unint64_t)a3
{
  self->_currentVPNType = a3;
}

- (unint64_t)originalVPNType
{
  return self->_originalVPNType;
}

- (void)setOriginalVPNType:(unint64_t)a3
{
  self->_originalVPNType = a3;
}

- (unint64_t)encryptionType
{
  return self->_encryptionType;
}

- (void)setEncryptionType:(unint64_t)a3
{
  self->_encryptionType = a3;
}

- (unint64_t)vpnGrade
{
  return self->_vpnGrade;
}

- (void)setVpnGrade:(unint64_t)a3
{
  self->_vpnGrade = a3;
}

- (unint64_t)eapType
{
  return self->_eapType;
}

- (void)setEapType:(unint64_t)a3
{
  self->_eapType = a3;
}

- (unint64_t)authType
{
  return self->_authType;
}

- (void)setAuthType:(unint64_t)a3
{
  self->_authType = a3;
}

- (UIBarButtonItem)backButton
{
  return (UIBarButtonItem *)objc_getProperty(self, a2, 1440, 1);
}

- (void)setBackButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1440);
}

- (BOOL)overviewMode
{
  return self->_overviewMode;
}

- (void)setOverviewMode:(BOOL)a3
{
  self->_overviewMode = a3;
}

- (BOOL)editMode
{
  return self->_editMode;
}

- (void)setEditMode:(BOOL)a3
{
  self->_editMode = a3;
}

- (BOOL)passwordEditOnly
{
  return self->_passwordEditOnly;
}

- (void)setPasswordEditOnly:(BOOL)a3
{
  self->_passwordEditOnly = a3;
}

- (BOOL)dirty
{
  return self->_dirty;
}

- (void)setDirty:(BOOL)a3
{
  self->_dirty = a3;
}

- (BOOL)sendAllTraffic
{
  return self->_sendAllTraffic;
}

- (void)setSendAllTraffic:(BOOL)a3
{
  self->_sendAllTraffic = a3;
}

- (BOOL)useRSASecurID
{
  return self->_useRSASecurID;
}

- (void)setUseRSASecurID:(BOOL)a3
{
  self->_useRSASecurID = a3;
}

- (BOOL)usesCertificates
{
  return self->_usesCertificates;
}

- (void)setUsesCertificates:(BOOL)a3
{
  self->_usesCertificates = a3;
}

- (BOOL)passwordRequired
{
  return self->_passwordRequired;
}

- (void)setPasswordRequired:(BOOL)a3
{
  self->_passwordRequired = a3;
}

- (BOOL)userCreated
{
  return self->_userCreated;
}

- (void)setUserCreated:(BOOL)a3
{
  self->_userCreated = a3;
}

- (BOOL)profileBacked
{
  return self->_profileBacked;
}

- (void)setProfileBacked:(BOOL)a3
{
  self->_profileBacked = a3;
}

- (BOOL)onDemandService
{
  return self->_onDemandService;
}

- (void)setOnDemandService:(BOOL)a3
{
  self->_onDemandService = a3;
}

- (BOOL)onDemandEnabled
{
  return self->_onDemandEnabled;
}

- (void)setOnDemandEnabled:(BOOL)a3
{
  self->_onDemandEnabled = a3;
}

- (BOOL)alwaysPrompt
{
  return self->_alwaysPrompt;
}

- (void)setAlwaysPrompt:(BOOL)a3
{
  self->_alwaysPrompt = a3;
}

- (PSSpecifier)connectSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1448, 1);
}

- (void)setConnectSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1448);
}

- (NSUUID)serviceID
{
  return (NSUUID *)objc_getProperty(self, a2, 1456, 1);
}

- (void)setServiceID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1456);
}

- (NSString)displayName
{
  return (NSString *)objc_getProperty(self, a2, 1464, 1);
}

- (void)setDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1464);
}

- (NSString)appName
{
  return (NSString *)objc_getProperty(self, a2, 1472, 1);
}

- (void)setAppName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1472);
}

- (NSDictionary)includedBundleIDs
{
  return (NSDictionary *)objc_getProperty(self, a2, 1480, 1);
}

- (void)setIncludedBundleIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1480);
}

- (NSArray)matchDomains
{
  return (NSArray *)objc_getProperty(self, a2, 1488, 1);
}

- (void)setMatchDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1488);
}

- (NSArray)excludeDomains
{
  return (NSArray *)objc_getProperty(self, a2, 1496, 1);
}

- (void)setExcludeDomains:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1496);
}

- (NSString)server
{
  return (NSString *)objc_getProperty(self, a2, 1504, 1);
}

- (void)setServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1504);
}

- (NSString)account
{
  return (NSString *)objc_getProperty(self, a2, 1512, 1);
}

- (void)setAccount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1512);
}

- (NSString)password
{
  return (NSString *)objc_getProperty(self, a2, 1520, 1);
}

- (void)setPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1520);
}

- (NSString)sharedSecret
{
  return (NSString *)objc_getProperty(self, a2, 1528, 1);
}

- (void)setSharedSecret:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1528);
}

- (NSString)groupDisplayName
{
  return (NSString *)objc_getProperty(self, a2, 1536, 1);
}

- (void)setGroupDisplayName:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1536);
}

- (NSString)localIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1544, 1);
}

- (void)setLocalIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1544);
}

- (NSString)remoteIdentifier
{
  return (NSString *)objc_getProperty(self, a2, 1552, 1);
}

- (void)setRemoteIdentifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1552);
}

- (PSSpecifier)displayNameSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1560, 1);
}

- (void)setDisplayNameSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1560);
}

- (PSSpecifier)serverSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1568, 1);
}

- (void)setServerSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1568);
}

- (PSSpecifier)serverAddressSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1576, 1);
}

- (void)setServerAddressSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1576);
}

- (PSSpecifier)ciscoImageSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1584, 1);
}

- (void)setCiscoImageSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1584);
}

- (PSSpecifier)sendAllTrafficSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1592, 1);
}

- (void)setSendAllTrafficSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1592);
}

- (PSSpecifier)rsaSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1600, 1);
}

- (void)setRsaSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1600);
}

- (PSSpecifier)sharedSecretSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1608, 1);
}

- (void)setSharedSecretSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1608);
}

- (PSSpecifier)encryptionTypeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1616, 1);
}

- (void)setEncryptionTypeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1616);
}

- (PSSpecifier)vpnGradeStaticSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1624, 1);
}

- (void)setVpnGradeStaticSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1624);
}

- (PSSpecifier)passwordSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1632, 1);
}

- (void)setPasswordSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1632);
}

- (PSSpecifier)groupNameSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1640, 1);
}

- (void)setGroupNameSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1640);
}

- (PSSpecifier)useCertificateSwitchSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1648, 1);
}

- (void)setUseCertificateSwitchSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1648);
}

- (PSSpecifier)certificateListSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1656, 1);
}

- (void)setCertificateListSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1656);
}

- (PSSpecifier)accountSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1664, 1);
}

- (void)setAccountSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1664);
}

- (PSSpecifier)localIdentifierSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1672, 1);
}

- (void)setLocalIdentifierSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1672);
}

- (PSSpecifier)remoteIdentifierSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1680, 1);
}

- (void)setRemoteIdentifierSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1680);
}

- (PSSpecifier)eapTypeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1688, 1);
}

- (void)setEapTypeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1688);
}

- (PSSpecifier)authTypeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1696, 1);
}

- (void)setAuthTypeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1696);
}

- (PSSpecifier)timeSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1704, 1);
}

- (void)setTimeSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1704);
}

- (NSMutableArray)timeSpecifierArray
{
  return (NSMutableArray *)objc_getProperty(self, a2, 1712, 1);
}

- (void)setTimeSpecifierArray:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1712);
}

- (NSArray)typeTabSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1720, 1);
}

- (void)setTypeTabSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1720);
}

- (PSSpecifier)editServerSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1728, 1);
}

- (void)setEditServerSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1728);
}

- (NSArray)proxyGroupSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1736, 1);
}

- (void)setProxyGroupSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1736);
}

- (NSArray)pacSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1744, 1);
}

- (void)setPacSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1744);
}

- (NSArray)manualProxySpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1752, 1);
}

- (void)setManualProxySpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1752);
}

- (NSArray)proxyAuthSpecifiers
{
  return (NSArray *)objc_getProperty(self, a2, 1760, 1);
}

- (void)setProxyAuthSpecifiers:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1760);
}

- (PSSpecifier)proxyLabelSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1768, 1);
}

- (void)setProxyLabelSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1768);
}

- (unint64_t)proxyType
{
  return self->_proxyType;
}

- (void)setProxyType:(unint64_t)a3
{
  self->_proxyType = a3;
}

- (BOOL)proxyAuthenticated
{
  return self->_proxyAuthenticated;
}

- (void)setProxyAuthenticated:(BOOL)a3
{
  self->_proxyAuthenticated = a3;
}

- (NSString)proxyServer
{
  return (NSString *)objc_getProperty(self, a2, 1784, 1);
}

- (void)setProxyServer:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1784);
}

- (NSString)proxyPort
{
  return (NSString *)objc_getProperty(self, a2, 1792, 1);
}

- (void)setProxyPort:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1792);
}

- (NSString)proxyUsername
{
  return (NSString *)objc_getProperty(self, a2, 1800, 1);
}

- (void)setProxyUsername:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1800);
}

- (NSString)proxyPassword
{
  return (NSString *)objc_getProperty(self, a2, 1808, 1);
}

- (void)setProxyPassword:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1808);
}

- (NSString)proxyPACFile
{
  return (NSString *)objc_getProperty(self, a2, 1816, 1);
}

- (void)setProxyPACFile:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1816);
}

- (NSObject)certificateID
{
  return objc_getProperty(self, a2, 1824, 1);
}

- (void)setCertificateID:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1824);
}

- (NSArray)certificateIDs
{
  return (NSArray *)objc_getProperty(self, a2, 1832, 1);
}

- (void)setCertificateIDs:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1832);
}

- (NSArray)certificateObjects
{
  return (NSArray *)objc_getProperty(self, a2, 1840, 1);
}

- (void)setCertificateObjects:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1840);
}

- (BOOL)pptpWarningAccepted
{
  return self->_pptpWarningAccepted;
}

- (void)setPptpWarningAccepted:(BOOL)a3
{
  self->_pptpWarningAccepted = a3;
}

- (PSSpecifier)editButton
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1848, 1);
}

- (void)setEditButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1848);
}

- (PSSpecifier)enableButton
{
  return (PSSpecifier *)objc_getProperty(self, a2, 1856, 1);
}

- (void)setEnableButton:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 1856);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_enableButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_storeStrong((id *)&self->_certificateObjects, 0);
  objc_storeStrong((id *)&self->_certificateIDs, 0);
  objc_storeStrong((id *)&self->_certificateID, 0);
  objc_storeStrong((id *)&self->_proxyPACFile, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyUsername, 0);
  objc_storeStrong((id *)&self->_proxyPort, 0);
  objc_storeStrong((id *)&self->_proxyServer, 0);
  objc_storeStrong((id *)&self->_proxyLabelSpecifier, 0);
  objc_storeStrong((id *)&self->_proxyAuthSpecifiers, 0);
  objc_storeStrong((id *)&self->_manualProxySpecifiers, 0);
  objc_storeStrong((id *)&self->_pacSpecifiers, 0);
  objc_storeStrong((id *)&self->_proxyGroupSpecifiers, 0);
  objc_storeStrong((id *)&self->_editServerSpecifier, 0);
  objc_storeStrong((id *)&self->_typeTabSpecifiers, 0);
  objc_storeStrong((id *)&self->_timeSpecifierArray, 0);
  objc_storeStrong((id *)&self->_timeSpecifier, 0);
  objc_storeStrong((id *)&self->_authTypeSpecifier, 0);
  objc_storeStrong((id *)&self->_eapTypeSpecifier, 0);
  objc_storeStrong((id *)&self->_remoteIdentifierSpecifier, 0);
  objc_storeStrong((id *)&self->_localIdentifierSpecifier, 0);
  objc_storeStrong((id *)&self->_accountSpecifier, 0);
  objc_storeStrong((id *)&self->_certificateListSpecifier, 0);
  objc_storeStrong((id *)&self->_useCertificateSwitchSpecifier, 0);
  objc_storeStrong((id *)&self->_groupNameSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSpecifier, 0);
  objc_storeStrong((id *)&self->_vpnGradeStaticSpecifier, 0);
  objc_storeStrong((id *)&self->_encryptionTypeSpecifier, 0);
  objc_storeStrong((id *)&self->_sharedSecretSpecifier, 0);
  objc_storeStrong((id *)&self->_rsaSpecifier, 0);
  objc_storeStrong((id *)&self->_sendAllTrafficSpecifier, 0);
  objc_storeStrong((id *)&self->_ciscoImageSpecifier, 0);
  objc_storeStrong((id *)&self->_serverAddressSpecifier, 0);
  objc_storeStrong((id *)&self->_serverSpecifier, 0);
  objc_storeStrong((id *)&self->_displayNameSpecifier, 0);
  objc_storeStrong((id *)&self->_remoteIdentifier, 0);
  objc_storeStrong((id *)&self->_localIdentifier, 0);
  objc_storeStrong((id *)&self->_groupDisplayName, 0);
  objc_storeStrong((id *)&self->_sharedSecret, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_server, 0);
  objc_storeStrong((id *)&self->_excludeDomains, 0);
  objc_storeStrong((id *)&self->_matchDomains, 0);
  objc_storeStrong((id *)&self->_includedBundleIDs, 0);
  objc_storeStrong((id *)&self->_appName, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_serviceID, 0);
  objc_storeStrong((id *)&self->_connectSpecifier, 0);
  objc_storeStrong((id *)&self->_backButton, 0);
}

@end

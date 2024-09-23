@implementation VPNBundleController

- (id)specifiersWithSpecifier:(id)a3
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
  int v48;
  void *v49;
  void *v50;
  const __CFString *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  void *v59;
  void *v60;
  void *v61;
  void *v62;
  uint64_t v63;
  void *v64;
  void *v65;
  uint64_t v66;
  void *v67;
  void *v68;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  void *v76;
  void *v77;
  uint64_t v78;
  uint64_t v79;
  void *v80;
  void *v81;
  BOOL v82;
  void *v83;
  void *v84;
  void *v85;
  void *v86;
  int v87;
  void *v88;
  int v89;
  void *v90;
  int v91;
  int v92;
  void *v93;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  int v100;
  void *v101;
  void *v103;
  void *v104;
  void *v105;
  char v106;
  void *v107;
  int v108;
  void *v109;
  const __CFString *v110;
  _QWORD v111[2];

  v111[1] = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v109 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v5)
  {
    v6 = (void *)MEMORY[0x24BE754D0];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "localizedStringForKey:value:table:", CFSTR("VPN"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v8, self, sel_setVPNActive_forSpecifier_, sel_vpnActiveForSpecifier_, 0, 6, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNBundleController setToggleVPNSpecifier:](self, "setToggleVPNSpecifier:", v9);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_CANCEL"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setCancelButton:", v12);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_OK_ABBREVIATED"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setOkButton:", v15);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setTitle:", v18);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "localizedStringForKey:value:table:", CFSTR("AIRPLANE_SHEET_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "setPrompt:", v21);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "setProperty:forKey:", v23, *MEMORY[0x24BE75978]);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "setConfirmationAction:", sel_confirmAirplaneModeDisable_);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "setConfirmationCancelAction:", sel_cancelAirplaneModeDisable_);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "setProperty:forKey:", *MEMORY[0x24BDBD270], CFSTR("restoreState"));

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v27, "setProperty:forKey:", CFSTR("VPN"), *MEMORY[0x24BE75AC0]);

    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "imageForKey:", *MEMORY[0x24BE75808]);
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "setProperty:forKey:", v30, *MEMORY[0x24BE75AC8]);

  }
  -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
  v31 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v31)
  {
    v52 = (void *)MEMORY[0x24BE75590];
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "localizedStringForKey:value:table:", CFSTR("VPN"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v52, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v54, self, 0, sel_statusForSpecifier_, objc_opt_class(), 2, 0);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNBundleController setLinkVPNSpecifier:](self, "setLinkVPNSpecifier:", v55);

    -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setProperty:forKey:", CFSTR("VPN"), *MEMORY[0x24BE75AC0]);

    if (!-[VPNBundleController isRootMenuItem](self, "isRootMenuItem")
      && !-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
    {
      -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
      v57 = (void *)objc_claimAutoreleasedReturnValue();
      v110 = CFSTR("vpn-show-dns");
      v111[0] = &unk_24EE550E8;
      objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v111, &v110, 1);
      v58 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v57, "setUserInfo:", v58);

    }
    if (-[VPNBundleController isRootMenuItem](self, "isRootMenuItem")
      || -[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
    {
      -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
      v59 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x24BE75450], "settingsIconCache");
      v60 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v60, "imageForKey:", *MEMORY[0x24BE75808]);
      v61 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v59, "setProperty:forKey:", v61, *MEMORY[0x24BE75AC8]);

      objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
      v62 = (void *)objc_claimAutoreleasedReturnValue();
      v63 = objc_msgSend(v62, "userInterfaceIdiom");

      if ((v63 & 0xFFFFFFFFFFFFFFFBLL) == 1)
      {
        -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
        v64 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v65 = (void *)objc_claimAutoreleasedReturnValue();
        v66 = *MEMORY[0x24BE75AB8];
        objc_msgSend(v64, "setProperty:forKey:", v65, *MEMORY[0x24BE75AB8]);

        -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
        v67 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
        v68 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v67, "setProperty:forKey:", v68, v66);

      }
    }
  }
  if (-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
  {
    -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v32)
    {
      v33 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v34, "localizedStringForKey:value:table:", CFSTR("DNS_SETTINGS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v33, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v35, self, 0, sel_getDNSSummary_, objc_opt_class(), 2, 0);
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNBundleController setDnsSpecifier:](self, "setDnsSpecifier:", v36);

      -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
      v37 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v37, "setProperty:forKey:", CFSTR("Ethernet"), *MEMORY[0x24BE758B0]);

      -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
      v38 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v38, "setupIconImageWithBundle:", v109);

    }
  }
  if (-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
  {
    -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
    v39 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v39)
    {
      v40 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v41 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v41, "localizedStringForKey:value:table:", CFSTR("CONTENT_FILTER"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v42 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v40, "preferenceSpecifierNamed:target:set:get:detail:cell:edit:", v42, self, 0, sel_contentFilterStatusForSpecifier_, objc_opt_class(), 2, 0);
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNBundleController setContentFilterSpecifier:](self, "setContentFilterSpecifier:", v43);

      -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
      v44 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v44, "setProperty:forKey:", CFSTR("Ethernet"), *MEMORY[0x24BE758B0]);

      -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
      v45 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v45, "setupIconImageWithBundle:", v109);

    }
  }
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v46, "gradePresent:", 8))
  {

LABEL_13:
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    v50 = v49;
    v51 = CFSTR("VPN_AND_RELAYS");
    goto LABEL_22;
  }
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  v48 = objc_msgSend(v47, "gradePresent:", 7);

  if (v48)
    goto LABEL_13;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v49 = (void *)objc_claimAutoreleasedReturnValue();
  v50 = v49;
  v51 = CFSTR("VPN");
LABEL_22:
  objc_msgSend(v49, "localizedStringForKey:value:table:", v51, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v69 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
  v70 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v70, "setName:", v69);

  if (-[VPNBundleController isRootMenuItem](self, "isRootMenuItem"))
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v71 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v71, "vpnServiceTotalCount");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNBundleController setLastServiceCount:](self, "setLastServiceCount:", v72);

    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v73 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v73, "gradePresent:", 3) & 1) == 0)
    {
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v74 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v74, "gradePresent:", 2) & 1) == 0)
      {
        +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
        v75 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v75, "gradePresent:", 8) & 1) == 0)
        {
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v76 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v76, "gradePresent:", 7) & 1) == 0)
          {
            +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
            v77 = (void *)objc_claimAutoreleasedReturnValue();
            if ((objc_msgSend(v77, "disableToggle") & 1) == 0)
            {
              -[VPNBundleController lastServiceCount](self, "lastServiceCount");
              v107 = (void *)objc_claimAutoreleasedReturnValue();
              v108 = objc_msgSend(v107, "intValue");

              if (v108 == 1)
              {
                -[VPNBundleController statusForSpecifier:](self, "statusForSpecifier:", 0);
                v103 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
                v104 = (void *)objc_claimAutoreleasedReturnValue();
                objc_msgSend(v104, "localizedStringForKey:value:table:", CFSTR("CONNECTION_FAILURE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
                v105 = (void *)objc_claimAutoreleasedReturnValue();
                v106 = objc_msgSend(v103, "isEqualToString:", v105);

                if ((v106 & 1) != 0)
                  goto LABEL_35;
                v78 = 1;
                goto LABEL_34;
              }
LABEL_33:
              v78 = 0;
LABEL_34:
              -[VPNBundleController setToggleSwitchInRootMenu:](self, "setToggleSwitchInRootMenu:", v78);
              goto LABEL_35;
            }

          }
        }

      }
    }

    goto LABEL_33;
  }
LABEL_35:
  if (-[VPNBundleController isRootMenuItem](self, "isRootMenuItem")
    && -[VPNBundleController isToggleSwitchInRootMenu](self, "isToggleSwitchInRootMenu"))
  {
    -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
    v79 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
    v79 = objc_claimAutoreleasedReturnValue();
  }
  v80 = (void *)v79;
  -[VPNBundleController setVpnSpecifier:](self, "setVpnSpecifier:", v79);

  -[VPNBundleController lastServiceCount](self, "lastServiceCount");
  v81 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v81, "intValue"))
  {

  }
  else
  {
    v82 = -[VPNBundleController isRootMenuItem](self, "isRootMenuItem");

    if (v82)
      goto LABEL_43;
  }
  -[VPNBundleController vpnSpecifier](self, "vpnSpecifier");
  v83 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addObject:", v83);

LABEL_43:
  if (-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
  {
    -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
    v84 = (void *)objc_claimAutoreleasedReturnValue();
    if (v84)
    {

    }
    else
    {
      -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
      v85 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v85)
        goto LABEL_58;
    }
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v86 = (void *)objc_claimAutoreleasedReturnValue();
    v87 = objc_msgSend(v86, "gradePresent:", 4);

    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v88 = (void *)objc_claimAutoreleasedReturnValue();
    v89 = objc_msgSend(v88, "gradePresent:", 5);

    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v90 = (void *)objc_claimAutoreleasedReturnValue();
    v91 = objc_msgSend(v90, "gradePresent:", 6);

    v92 = v87 | v89;
    if (((v87 | v89) & 1) != 0 || v91)
    {
      v93 = (void *)MEMORY[0x24BE75590];
      objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
      v94 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v94, "localizedStringForKey:value:table:", CFSTR("PROXY_GROUP_TITLE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
      v95 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v93, "groupSpecifierWithName:", v95);
      v96 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v96);

    }
    -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
    v97 = (void *)objc_claimAutoreleasedReturnValue();
    if (v97)
    {

      if (v92)
      {
        -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "addObject:", v98);

      }
    }
    -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
    v99 = (void *)objc_claimAutoreleasedReturnValue();
    if (v99)
      v100 = v91;
    else
      v100 = 0;

    if (v100 == 1)
    {
      -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
      v101 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "addObject:", v101);

    }
  }
LABEL_58:

  return v4;
}

- (BOOL)isRootMenuItem
{
  return self->_rootMenuItem;
}

- (NSNumber)lastServiceCount
{
  return (NSNumber *)objc_getProperty(self, a2, 32, 1);
}

- (BOOL)isDeviceManagement
{
  return self->_deviceManagement;
}

- (void)setVpnSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 48);
}

- (void)setToggleSwitchInRootMenu:(BOOL)a3
{
  self->_toggleSwitchInRootMenu = a3;
}

- (BOOL)isToggleSwitchInRootMenu
{
  return self->_toggleSwitchInRootMenu;
}

- (PSConfirmationSpecifier)toggleVPNSpecifier
{
  return (PSConfirmationSpecifier *)objc_getProperty(self, a2, 80, 1);
}

- (void)setLinkVPNSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 56);
}

- (void)setRegistered:(BOOL)a3
{
  self->_registered = a3;
}

- (VPNBundleController)initWithParentListController:(id)a3 properties:(id)a4
{
  id v5;
  VPNBundleController *v6;
  void *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  objc_super v15;

  v15.receiver = self;
  v15.super_class = (Class)VPNBundleController;
  v5 = a4;
  v6 = -[VPNBundleController initWithParentListController:](&v15, sel_initWithParentListController_, a3);
  if (v6)
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", v15.receiver, v15.super_class);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v7)
    {
      v8 = VPNSettingsCopyLog();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        -[VPNBundleController initWithParentListController:properties:].cold.1(v8);

    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObserver:selector:name:object:", v6, sel_vpnStatusChanged_, kNotificationVPNConnectionStatusChanged, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "addObserver:selector:name:object:", v6, sel_vpnConfigurationChanged_, CFSTR("VPNNEConfigurationChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "addObserver:selector:name:object:", v6, sel_vpnStatusChanged_, CFSTR("VPNConnectionsChangedNotification"), 0);

    -[VPNBundleController setRegistered:](v6, "setRegistered:", 1);
  }
  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isTopLevel"), v15.receiver, v15.super_class);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNBundleController setRootMenuItem:](v6, "setRootMenuItem:", objc_msgSend(v12, "BOOLValue"));

  objc_msgSend(v5, "objectForKeyedSubscript:", CFSTR("isDeviceManagement"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  -[VPNBundleController setDeviceManagement:](v6, "setDeviceManagement:", objc_msgSend(v13, "BOOLValue"));
  return v6;
}

- (void)dealloc
{
  void *v3;
  void *v4;
  void *v5;
  objc_super v6;

  if (-[VPNBundleController isRegistered](self, "isRegistered"))
  {
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "removeObserver:name:object:", self, kNotificationVPNConnectionStatusChanged, 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "removeObserver:name:object:", self, CFSTR("VPNNEConfigurationChangedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "removeObserver:name:object:", self, CFSTR("VPNConnectionsChangedNotification"), 0);

  }
  v6.receiver = self;
  v6.super_class = (Class)VPNBundleController;
  -[VPNBundleController dealloc](&v6, sel_dealloc);
}

- (void)setRootMenuItem:(BOOL)a3
{
  self->_rootMenuItem = a3;
}

- (void)setLastServiceCount:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 32);
}

- (void)setToggleVPNSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 80);
}

+ (BOOL)networkingIsDisabled
{
  void *v2;
  id v3;
  void *v4;
  const __SCPreferences *v5;
  unsigned int v6;

  os_unfair_lock_lock((os_unfair_lock_t)&gRadioPrefsLock);
  v2 = (void *)gRadiosPrefs;
  if (!gRadiosPrefs)
  {
    v3 = objc_alloc_init(MEMORY[0x24BE04788]);
    v4 = (void *)gRadiosPrefs;
    gRadiosPrefs = (uint64_t)v3;

    v2 = (void *)gRadiosPrefs;
  }
  objc_msgSend(v2, "refresh");
  os_unfair_lock_assert_owner((const os_unfair_lock *)&gRadioPrefsLock);
  v5 = (const __SCPreferences *)gWifiPreferences;
  if (!gWifiPreferences)
  {
    v5 = SCPreferencesCreate(0, CFSTR("com.apple.mobilevpn"), CFSTR("com.apple.wifi.plist"));
    gWifiPreferences = (uint64_t)v5;
  }
  SCPreferencesSynchronize(v5);
  v6 = objc_msgSend((id)SCPreferencesGetValue((SCPreferencesRef)gWifiPreferences, CFSTR("AllowEnable")), "BOOLValue");
  NSLog(CFSTR("%s: Airplane mode: %d, WiFi Enabled: %d"), "+[VPNBundleController networkingIsDisabled]", objc_msgSend((id)gRadiosPrefs, "airplaneMode"), v6);
  LOBYTE(v6) = objc_msgSend((id)gRadiosPrefs, "airplaneMode") & (v6 ^ 1);
  os_unfair_lock_unlock((os_unfair_lock_t)&gRadioPrefsLock);
  return v6;
}

+ (void)disableAirplaneMode
{
  id v2;

  os_unfair_lock_lock((os_unfair_lock_t)&gRadioPrefsLock);
  v2 = (id)gRadiosPrefs;
  os_unfair_lock_unlock((os_unfair_lock_t)&gRadioPrefsLock);
  objc_msgSend(v2, "setAirplaneMode:", 0);

}

- (id)vpnActiveForSpecifier:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;

  v3 = a3;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "aggregateStatus");

  if ((v5 & 0xFFFFFFFFFFFFFFFELL) == 2)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    if (v5 == 2)
      v9 = CFSTR("VPN_CONNECTING");
    else
      v9 = CFSTR("VPN");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInt:", 0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("VPN");
  }
  objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24EE4DF70, CFSTR("MobileVPN"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v3, "setName:", v10);
  objc_msgSend(v3, "setProperty:forKey:", v6, *MEMORY[0x24BE75DA0]);

  return v6;
}

- (id)statusForSpecifier:(id)a3
{
  void *v3;
  void *v4;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aggregateStatusText");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)setVPNActive:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  void *v14;
  void *v15;
  uint64_t v16;
  int v17;
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
  id WeakRetained;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  unsigned __int8 v37;

  v3 = a3;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "currentConnectionWithGrade:", objc_msgSend(v6, "currentOnlyConnectionGrade"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v7, "serviceID");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "displayName");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v7, "vpnConnectionType");
  if (!v7)
    goto LABEL_7;
  if (!v3)
  {
    objc_msgSend(v7, "disconnect");
    goto LABEL_9;
  }
  if (v10 != 3)
    goto LABEL_6;
  v37 = 0;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v11, "isTypeEnabledWithServiceID:withGrade:outProviderAvailable:", v8, objc_msgSend(v12, "currentOnlyConnectionGrade"), &v37);

  if (v13)
  {
    if (v37)
    {
LABEL_6:
      objc_msgSend(v7, "connect");
LABEL_7:
      -[VPNBundleController vpnStatusChanged:](self, "vpnStatusChanged:", 0);
      goto LABEL_9;
    }
  }
  NSLog(CFSTR("%s: Trying to start an SSL VPN service that is not eligible"), "-[VPNBundleController setVPNActive:]");
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "appNameForServiceID:withGrade:", v8, objc_msgSend(v15, "currentOnlyConnectionGrade"));
  v16 = objc_claimAutoreleasedReturnValue();

  v17 = v37;
  v18 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = v19;
  v35 = (void *)v16;
  if (v17)
  {
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("SSL_MESSAGE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v21, v9, v16);
  }
  else
  {
    objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MISSING_PROVIDER_MESSAGE"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "stringWithFormat:", v21, v16, v9);
  }
  v36 = (void *)objc_claimAutoreleasedReturnValue();

  v22 = (void *)MEMORY[0x24BDF67F0];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "localizedStringForKey:value:table:", CFSTR("VPN_CONNECTION"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "alertControllerWithTitle:message:preferredStyle:", v24, v36, 1);
  v25 = (void *)objc_claimAutoreleasedReturnValue();

  v26 = (void *)MEMORY[0x24BDF67E8];
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "localizedStringForKey:value:table:", CFSTR("OK"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "actionWithTitle:style:handler:", v28, 1, 0);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "addAction:", v29);

  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]));
  objc_msgSend(WeakRetained, "rootController");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v31, "topViewController");
  v32 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v32, "presentViewController:animated:completion:", v25, 1, 0);

  -[VPNBundleController vpnSpecifier](self, "vpnSpecifier");
  v33 = (void *)objc_claimAutoreleasedReturnValue();
  -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
  v34 = (void *)objc_claimAutoreleasedReturnValue();

  if (v33 == v34)
    -[VPNBundleController vpnStatusChanged:](self, "vpnStatusChanged:", 0);

LABEL_9:
}

- (void)setVPNActive:(id)a3 forSpecifier:(id)a4
{
  id v6;
  id WeakRetained;
  void *v8;
  void *v9;
  int v10;
  int v11;
  void *v12;
  id v13;

  v13 = a3;
  v6 = a4;
  WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]));
  objc_msgSend(WeakRetained, "rootController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "propertyForKey:", *MEMORY[0x24BE75DA0]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "intValue");
  v11 = objc_msgSend(v13, "intValue");

  if (v10 != v11)
  {
    if (objc_msgSend(v13, "BOOLValue")
      && +[VPNBundleController networkingIsDisabled](VPNBundleController, "networkingIsDisabled"))
    {
      objc_msgSend(v8, "topViewController");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v12, "showConfirmationViewForSpecifier:", v6);

    }
    else
    {
      -[VPNBundleController setVPNActive:](self, "setVPNActive:", objc_msgSend(v13, "BOOLValue"));
    }
  }

}

- (id)contentFilterStatusForSpecifier:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[5];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;

  v3 = a3;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __55__VPNBundleController_contentFilterStatusForSpecifier___block_invoke;
  v8[3] = &unk_24EE4DA08;
  v8[4] = &v9;
  objc_msgSend(v4, "iterateContentFilterServicesWithBlock:", v8);

  if (*((_BYTE *)v10 + 24))
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("RUNNING"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "localizedStringForKey:value:table:", CFSTR("INVALID"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  }
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  _Block_object_dispose(&v9, 8);
  return v6;
}

BOOL __55__VPNBundleController_contentFilterStatusForSpecifier___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5;
  void *v6;
  void *v7;
  int v8;
  _BOOL8 v9;

  v5 = a2;
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "connectionWithServiceID:withGrade:", v5, a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "session_status");
  if (v8 == 3)
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = 1;
  v9 = v8 != 3;

  return v9;
}

- (void)updateVPNSwitchStatus
{
  id *v3;
  id WeakRetained;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  id v9;

  if (-[VPNBundleController isRootMenuItem](self, "isRootMenuItem"))
  {
    v3 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]);
    WeakRetained = objc_loadWeakRetained(v3);
    objc_msgSend(WeakRetained, "specifierForID:", CFSTR("VPN"));
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v5 = objc_loadWeakRetained(v3);
    v6 = objc_msgSend(v5, "indexOfSpecifier:", v9);

    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v7 = -[VPNBundleController vpnActiveForSpecifier:](self, "vpnActiveForSpecifier:", v9);
      v8 = objc_loadWeakRetained(v3);
      objc_msgSend(v8, "reloadSpecifierAtIndex:", v6);

    }
  }
}

- (void)vpnStatusChanged:(id)a3
{
  _BOOL4 v5;
  int *v6;
  id WeakRetained;
  void *v8;
  void *v9;
  void *v10;
  int v11;
  id *v12;
  id v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;

  v5 = -[VPNBundleController isRootMenuItem](self, "isRootMenuItem");
  v6 = (int *)MEMORY[0x24BE75688];
  if (v5 && -[VPNBundleController isToggleSwitchInRootMenu](self, "isToggleSwitchInRootMenu"))
  {
    if (a3)
      -[VPNBundleController updateVPNSwitchStatus](self, "updateVPNSwitchStatus");
  }
  else
  {
    WeakRetained = objc_loadWeakRetained((id *)((char *)&self->super.super.isa + *v6));
    objc_msgSend(WeakRetained, "reloadSpecifierID:", CFSTR("VPN"));

  }
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "currentConnectionWithGrade:", objc_msgSend(v9, "currentOnlyConnectionGrade"));
  v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend(v17, "password");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "length"))
    {
      v11 = objc_msgSend(v17, "disconnected");

      if (v11)
        objc_msgSend(v17, "setPassword:", 0);
    }
    else
    {

    }
  }
  if (-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
  {
    v12 = (id *)((char *)&self->super.super.isa + *v6);
    v13 = objc_loadWeakRetained(v12);
    -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "indexOfSpecifier:", v14);

    if (v15 != 0x7FFFFFFFFFFFFFFFLL)
    {
      v16 = objc_loadWeakRetained(v12);
      objc_msgSend(v16, "reloadSpecifierAtIndex:", v15);

    }
  }

}

- (void)vpnConfigurationChanged:(id)a3
{
  void *v4;
  void *v5;
  int v6;
  void *v7;
  void *v8;
  const __CFString *v9;
  void *v10;
  void *v11;
  id *v12;
  id WeakRetained;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  id v18;
  void *v19;
  void *v20;
  int v21;
  int v22;
  int v23;
  _BOOL4 v24;
  void *v25;
  _BOOL8 v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  id v35;
  uint64_t v36;
  id v37;
  id v38;
  id v39;
  uint64_t v40;
  id v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id *location;
  id v52;

  if (-[VPNBundleController isDeviceManagement](self, "isDeviceManagement", a3))
  {
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v4, "gradePresent:", 8))
    {

    }
    else
    {
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "gradePresent:", 7);

      if (!v6)
      {
        objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        v8 = v7;
        v9 = CFSTR("VPN");
        goto LABEL_7;
      }
    }
    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v9 = CFSTR("VPN_AND_RELAYS");
LABEL_7:
    objc_msgSend(v7, "localizedStringForKey:value:table:", v9, &stru_24EE4DF70, CFSTR("MobileVPN"));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setName:", v10);

  }
  if (-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
  {
    v12 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]);
    WeakRetained = objc_loadWeakRetained(v12);
    -[VPNBundleController dnsSpecifier](self, "dnsSpecifier");
    v14 = objc_claimAutoreleasedReturnValue();
    goto LABEL_12;
  }
  if (!-[VPNBundleController isDeviceManagement](self, "isDeviceManagement"))
  {
    if (!-[VPNBundleController isRootMenuItem](self, "isRootMenuItem"))
      return;
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "vpnServiceTotalCount");
    v52 = (id)objc_claimAutoreleasedReturnValue();

    location = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]);
    v18 = objc_loadWeakRetained(location);
    objc_msgSend(v18, "specifierForID:", CFSTR("VPN"));
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    -[VPNBundleController lastServiceCount](self, "lastServiceCount");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v21 = objc_msgSend(v20, "intValue");

    v22 = objc_msgSend(v52, "intValue");
    if (v19)
      v23 = v21;
    else
      v23 = 0;
    v24 = -[VPNBundleController isToggleSwitchInRootMenu](self, "isToggleSwitchInRootMenu");
    +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0;
    if ((objc_msgSend(v25, "gradePresent:", 3) & 1) == 0)
    {
      +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_msgSend(v27, "gradePresent:", 2) & 1) != 0)
      {
        v26 = 0;
      }
      else
      {
        +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v28, "gradePresent:", 7) & 1) != 0)
        {
          v26 = 0;
        }
        else
        {
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          if ((objc_msgSend(v50, "gradePresent:", 8) & 1) != 0)
          {
            v26 = 0;
            v29 = v50;
          }
          else
          {
            +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
            v49 = (void *)objc_claimAutoreleasedReturnValue();
            v26 = (objc_msgSend(v49, "disableToggle") & 1) == 0 && objc_msgSend(v52, "intValue") == 1;
            v29 = v50;

          }
        }

      }
    }

    objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "localizedStringForKey:value:table:", CFSTR("VPN"), &stru_24EE4DF70, CFSTR("MobileVPN"));
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "setName:", v31);

    if (v23 != v22 || v24 != v26)
    {
      -[VPNBundleController setLastServiceCount:](self, "setLastServiceCount:", v52);
      -[VPNBundleController setToggleSwitchInRootMenu:](self, "setToggleSwitchInRootMenu:", v26);
      if (-[VPNBundleController isToggleSwitchInRootMenu](self, "isToggleSwitchInRootMenu"))
        -[VPNBundleController toggleVPNSpecifier](self, "toggleVPNSpecifier");
      else
        -[VPNBundleController linkVPNSpecifier](self, "linkVPNSpecifier");
      v33 = (void *)objc_claimAutoreleasedReturnValue();
      -[VPNBundleController setVpnSpecifier:](self, "setVpnSpecifier:", v33);

      if (v19 || v22 < 1)
      {
        if (v19)
        {
          if (v22
            && (-[VPNBundleController vpnSpecifier](self, "vpnSpecifier"),
                v43 = (void *)objc_claimAutoreleasedReturnValue(),
                v43,
                v43))
          {
            -[VPNBundleController vpnSpecifier](self, "vpnSpecifier");
            v44 = (void *)objc_claimAutoreleasedReturnValue();

            if (v19 == v44)
              goto LABEL_56;
            v41 = objc_loadWeakRetained(location);
            objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObject:", v19);
            v45 = (void *)objc_claimAutoreleasedReturnValue();
            v46 = (void *)MEMORY[0x24BDBCE30];
            -[VPNBundleController vpnSpecifier](self, "vpnSpecifier");
            v47 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v46, "arrayWithObject:", v47);
            v48 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v41, "replaceContiguousSpecifiers:withSpecifiers:animated:", v45, v48, 1);

          }
          else
          {
            v41 = objc_loadWeakRetained(location);
            objc_msgSend(v41, "removeSpecifier:animated:", v19, 1);
          }
LABEL_55:

        }
      }
      else
      {
        -[VPNBundleController vpnSpecifier](self, "vpnSpecifier");
        v34 = (void *)objc_claimAutoreleasedReturnValue();

        if (v34)
        {
          v35 = objc_loadWeakRetained(location);
          v36 = objc_msgSend(v35, "indexOfSpecifierID:", CFSTR("INTERNET_TETHERING"));

          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
          {
            v37 = objc_loadWeakRetained(location);
            v36 = objc_msgSend(v37, "indexOfSpecifierID:", CFSTR("MOBILE_DATA_SETTINGS_ID"));

            if (v36 == 0x7FFFFFFFFFFFFFFFLL)
            {
              v38 = objc_loadWeakRetained(location);
              v36 = objc_msgSend(v38, "indexOfSpecifierID:", CFSTR("Bluetooth"));

              if (v36 == 0x7FFFFFFFFFFFFFFFLL)
              {
                v39 = objc_loadWeakRetained(location);
                v36 = objc_msgSend(v39, "indexOfSpecifierID:", CFSTR("WIFI"));

              }
            }
          }
          if (v36 == 0x7FFFFFFFFFFFFFFFLL)
            v40 = 1;
          else
            v40 = v36 + 1;
          v41 = objc_loadWeakRetained(location);
          -[VPNBundleController vpnSpecifier](self, "vpnSpecifier");
          v42 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v41, "insertSpecifier:atIndex:animated:", v42, v40, 1);

          goto LABEL_55;
        }
      }
    }
LABEL_56:

    goto LABEL_57;
  }
  v12 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]);
  WeakRetained = objc_loadWeakRetained(v12);
  -[VPNBundleController contentFilterSpecifier](self, "contentFilterSpecifier");
  v14 = objc_claimAutoreleasedReturnValue();
LABEL_12:
  v15 = (void *)v14;
  v16 = objc_msgSend(WeakRetained, "indexOfSpecifier:", v14);

  if (v16 != 0x7FFFFFFFFFFFFFFFLL)
  {
    v52 = objc_loadWeakRetained(v12);
    objc_msgSend(v52, "reloadSpecifierAtIndex:", v16);
LABEL_57:

  }
}

- (id)getDNSSummary:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  void *v14;
  int v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  uint64_t v20;
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v22 = a3;
  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "localizedStringForKey:value:table:", CFSTR("AUTOMATIC_DNS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "vpnServicesForCurrentSetWithGrade:", 4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v8)
  {
    v9 = v8;
    v10 = 0;
    v11 = *(_QWORD *)v24;
    while (2)
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v24 != v11)
          objc_enumerationMutation(v7);
        v13 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", v22);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v15 = objc_msgSend(v14, "isEnabledWithServiceID:withGrade:", v13, 4);

        if (v15)
        {
          if (v10)
          {
            objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v19, "localizedStringForKey:value:table:", CFSTR("MULTIPLE_DNS"), &stru_24EE4DF70, CFSTR("MobileVPN"));
            v20 = objc_claimAutoreleasedReturnValue();

            v4 = (void *)v20;
            goto LABEL_15;
          }
          +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "optionsForServiceID:withGrade:", v13, 4);
          v17 = (void *)objc_claimAutoreleasedReturnValue();

          if (v17)
          {
            objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("dispName"));
            v18 = objc_claimAutoreleasedReturnValue();

            v4 = (void *)v18;
          }

          v10 = 1;
        }
      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v9)
        continue;
      break;
    }
  }
LABEL_15:

  return v4;
}

- (id)getContentFilterSummary:(id)a3
{
  void *v3;
  void *v4;

  +[VPNConnectionStore sharedInstance](VPNConnectionStore, "sharedInstance", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "aggregateStatusText:", 6);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)confirmAirplaneModeDisable:(id)a3
{
  +[VPNBundleController disableAirplaneMode](VPNBundleController, "disableAirplaneMode", a3);
  -[VPNBundleController setVPNActive:](self, "setVPNActive:", 1);
}

- (void)cancelAirplaneModeDisable:(id)a3
{
  id *v3;
  id v4;
  id WeakRetained;

  v3 = (id *)((char *)&self->super.super.isa + (int)*MEMORY[0x24BE75688]);
  v4 = a3;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "reloadSpecifier:", v4);

}

- (VPNConnectionStore)connectionStore
{
  return (VPNConnectionStore *)objc_getProperty(self, a2, 24, 1);
}

- (void)setConnectionStore:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 24);
}

- (PSSpecifier)passwordSetupSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 40, 1);
}

- (void)setPasswordSetupSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 40);
}

- (PSSpecifier)vpnSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 48, 1);
}

- (PSSpecifier)linkVPNSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 56, 1);
}

- (PSSpecifier)dnsSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 64, 1);
}

- (void)setDnsSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (PSSpecifier)contentFilterSpecifier
{
  return (PSSpecifier *)objc_getProperty(self, a2, 72, 1);
}

- (void)setContentFilterSpecifier:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 72);
}

- (void)setDeviceManagement:(BOOL)a3
{
  self->_deviceManagement = a3;
}

- (BOOL)isRegistered
{
  return self->_registered;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_toggleVPNSpecifier, 0);
  objc_storeStrong((id *)&self->_contentFilterSpecifier, 0);
  objc_storeStrong((id *)&self->_dnsSpecifier, 0);
  objc_storeStrong((id *)&self->_linkVPNSpecifier, 0);
  objc_storeStrong((id *)&self->_vpnSpecifier, 0);
  objc_storeStrong((id *)&self->_passwordSetupSpecifier, 0);
  objc_storeStrong((id *)&self->_lastServiceCount, 0);
  objc_storeStrong((id *)&self->_connectionStore, 0);
}

- (void)initWithParentListController:(os_log_t)log properties:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_226973000, log, OS_LOG_TYPE_ERROR, "Shared VPNConnectionStore is nil", v1, 2u);
}

@end

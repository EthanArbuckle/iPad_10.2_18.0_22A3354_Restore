@implementation MCUIMCSpecifierProvider

- (id)specifiers
{
  void *v3;
  id v4;
  id v5;
  id v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  __CFString *v16;
  void *v17;
  void *v18;
  id v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  void *v24;
  __CFString *v25;
  void *v26;
  void *v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t j;
  void *v33;
  void *v34;
  __CFString *v35;
  void *v36;
  void *v37;
  id v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t k;
  uint64_t v43;
  void *v44;
  id v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  id v51;
  id v52;
  id v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  char v66;
  id v67;
  id v68;
  id v69;
  id v70;
  id v71;
  id v72;
  _BYTE v73[128];
  _BYTE v74[128];
  _BYTE v75[128];
  _QWORD v76[3];

  v76[1] = *MEMORY[0x1E0C80C00];
  +[MCUIDataManager sharedManager](MCUIDataManager, "sharedManager");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v71 = 0;
  v72 = 0;
  v69 = 0;
  v70 = 0;
  v67 = 0;
  v68 = 0;
  objc_msgSend(v3, "allDeviceManagementOutMDMProfileInfo:outConfigurationProfilesInfo:outUninstalledProfilesInfo:outEnterpriseAppSigners:outFreeDevAppSigners:outBlockedApplications:", &v72, &v71, &v70, &v69, &v68, &v67);
  v4 = v72;
  v5 = v71;
  v6 = v70;
  v7 = v69;
  v8 = v68;
  v51 = v67;

  v9 = (void *)objc_opt_new();
  if (v4)
  {
    objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "dmc_visibleRemoteManagementAccounts");
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (!objc_msgSend(v11, "count"))
    {
      v76[0] = v4;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v76, 1);
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCUISpecifierProvider specifiersForMDMProfiles:](self, "specifiersForMDMProfiles:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();

      if (v13)
        objc_msgSend(v9, "addObjectsFromArray:", v13);

    }
  }
  -[MCUISpecifierProvider specifiersForUninstalledProfiles:](self, "specifiersForUninstalledProfiles:", v6);
  v14 = objc_claimAutoreleasedReturnValue();
  if (v14)
    objc_msgSend(v9, "addObjectsFromArray:", v14);
  v48 = (void *)v14;
  v49 = v6;
  v50 = v5;
  -[MCUISpecifierProvider specifiersForInstalledProfiles:](self, "specifiersForInstalledProfiles:", v5);
  v15 = objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v9, "addObjectsFromArray:", v15);
  v47 = (void *)v15;
  v66 = 0;
  v52 = v8;
  v53 = v7;
  if (-[MCUISpecifierProvider isSectionPopulated:outIsPlural:](self, "isSectionPopulated:outIsPlural:", v7, &v66))
  {
    if (v66)
      v16 = CFSTR("ENTERPRISE_APP_PLURAL");
    else
      v16 = CFSTR("ENTERPRISE_APP_SINGULAR");
    MCUILocalizedString(v16);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v18);

    v64 = 0u;
    v65 = 0u;
    v62 = 0u;
    v63 = 0u;
    v19 = v7;
    v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
    if (v20)
    {
      v21 = v20;
      v22 = *(_QWORD *)v63;
      do
      {
        for (i = 0; i != v21; ++i)
        {
          if (*(_QWORD *)v63 != v22)
            objc_enumerationMutation(v19);
          -[MCUIMCSpecifierProvider _specifierForAppSigner:](self, "_specifierForAppSigner:", *(_QWORD *)(*((_QWORD *)&v62 + 1) + 8 * i));
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v24);

        }
        v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v62, v75, 16);
      }
      while (v21);
    }

    v8 = v52;
    v7 = v53;
  }
  if (-[MCUISpecifierProvider isSectionPopulated:outIsPlural:](self, "isSectionPopulated:outIsPlural:", v8, &v66))
  {
    if (v66)
      v25 = CFSTR("DEVELOPER_APP_PLURAL");
    else
      v25 = CFSTR("DEVELOPER_APP_SINGULAR");
    MCUILocalizedString(v25);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v26);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v27);

    v60 = 0u;
    v61 = 0u;
    v58 = 0u;
    v59 = 0u;
    v28 = v8;
    v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
    if (v29)
    {
      v30 = v29;
      v31 = *(_QWORD *)v59;
      do
      {
        for (j = 0; j != v30; ++j)
        {
          if (*(_QWORD *)v59 != v31)
            objc_enumerationMutation(v28);
          -[MCUIMCSpecifierProvider _specifierForAppSigner:](self, "_specifierForAppSigner:", *(_QWORD *)(*((_QWORD *)&v58 + 1) + 8 * j));
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "addObject:", v33);

        }
        v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v58, v74, 16);
      }
      while (v30);
    }

    v8 = v52;
    v7 = v53;
  }
  v34 = v51;
  if (-[MCUISpecifierProvider isSectionPopulated:outIsPlural:](self, "isSectionPopulated:outIsPlural:", v51, &v66))
  {
    v46 = v4;
    if (v66)
      v35 = CFSTR("BLOCKED_APP_PLURAL");
    else
      v35 = CFSTR("BLOCKED_APP");
    MCUILocalizedString(v35);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0D804E8], "groupSpecifierWithName:", v36);
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addObject:", v37);

    v56 = 0u;
    v57 = 0u;
    v54 = 0u;
    v55 = 0u;
    v38 = v51;
    v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
    if (v39)
    {
      v40 = v39;
      v41 = *(_QWORD *)v55;
      do
      {
        for (k = 0; k != v40; ++k)
        {
          if (*(_QWORD *)v55 != v41)
            objc_enumerationMutation(v38);
          v43 = *(_QWORD *)(*((_QWORD *)&v54 + 1) + 8 * k);
          -[MCUIMCSpecifierProvider _specifierForBlockedApp:](self, "_specifierForBlockedApp:", v43);
          v44 = (void *)objc_claimAutoreleasedReturnValue();
          if (v44)
            objc_msgSend(v9, "addObject:", v44);
          else
            NSLog(CFSTR("MCUI MC Specifier Provider could not construct specifier for blocked app: %@"), v43);

        }
        v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v54, v73, 16);
      }
      while (v40);
    }

    v4 = v46;
    v8 = v52;
    v7 = v53;
    v34 = v51;
  }

  return v9;
}

- (id)_specifierForAppSigner:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = a3;
  objc_msgSend(v4, "identity");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MCUISpecifierProvider specifierWithName:detail:](self, "specifierWithName:detail:", v5, objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "displayName");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setProperty:forKey:", v7, *MEMORY[0x1E0D80978]);

  if ((objc_msgSend(v4, "isTrusted") & 1) != 0)
  {
    v8 = (void *)MEMORY[0x1E0CB37F0];
    v9 = (void *)MEMORY[0x1E0CB37E8];
    objc_msgSend(v4, "applications");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "numberWithInteger:", objc_msgSend(v10, "count"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    MCUILocalizedString(CFSTR("NOT_TRUSTED_PROFILE"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v6, "setProperty:forKey:", v12, *MEMORY[0x1E0D80950]);
  objc_msgSend(v6, "setProperty:forKey:", v4, CFSTR("MCUIPSItemKey"));
  objc_msgSend(v6, "setControllerLoadAction:", sel__loadAppSignerFromSpecifier_);
  objc_msgSend(v6, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80700]);

  return v6;
}

- (void)_loadAppSignerFromSpecifier:(id)a3
{
  void *v4;
  MCUIAppSignerViewController *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "propertyForKey:", CFSTR("MCUIPSItemKey"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    v5 = -[MCUIAppSignerViewController initWithAppSigner:]([MCUIAppSignerViewController alloc], "initWithAppSigner:", v4);
    -[MCUIMCSpecifierProvider _presentViewController:](self, "_presentViewController:", v5);

  }
  else
  {
    NSLog(CFSTR("MCUI MC Specifier Provider failed to find app signer in specifier: %@"), v6);
  }

}

- (id)_specifierForBlockedApp:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  if (objc_msgSend(v4, "isBlocked"))
  {
    objc_msgSend(v4, "bundleID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      MCUILocalizedString(CFSTR("UNKNOWN_APP"));
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v9 = v7;

    objc_msgSend(v4, "name");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v10)
      v12 = (void *)v10;
    else
      v12 = v9;
    v13 = v12;

    -[MCUISpecifierProvider specifierWithName:detail:](self, "specifierWithName:detail:", v13, objc_opt_class());
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "misCDHash");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v14, CFSTR("MCUIBlockedAppCdHash"));

    objc_msgSend(v4, "misHashType");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v15, CFSTR("MCUIBlockedAppHashType"));

    objc_msgSend(v8, "setProperty:forKey:", v13, CFSTR("MCUIBlockedAppName"));
    objc_msgSend(v8, "setProperty:forKey:", v13, *MEMORY[0x1E0D80978]);

    objc_msgSend(v4, "iconForVariant:", 0);
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setProperty:forKey:", v16, *MEMORY[0x1E0D80870]);

    objc_msgSend(v8, "setProperty:forKey:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D80808]);
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (void)loadProfileFromSpecifier:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  objc_msgSend(v4, "propertyForKey:", CFSTR("MCUIPSItemKey"));
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "propertyForKey:", CFSTR("MCUIPSInstalledKey"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5 && objc_msgSend(v5, "BOOLValue"))
    {
      objc_msgSend(v7, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCUIMCSpecifierProvider _selectInstalledProfileIdentifier:](self, "_selectInstalledProfileIdentifier:", v6);
    }
    else
    {
      objc_msgSend(v7, "identifier");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[MCUIMCSpecifierProvider _selectUninstalledProfileIdentifier:](self, "_selectUninstalledProfileIdentifier:", v6);
    }

  }
  else
  {
    NSLog(CFSTR("MCUI MC Specifier Provider failed to find profile info in specifier: %@"), v4);
    v5 = v4;
  }

}

- (void)_selectInstalledProfileIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MCRemoveProfileViewController *v7;
  id v8;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "installedProfileWithIdentifier:", v5);
  v8 = (id)objc_claimAutoreleasedReturnValue();

  v7 = -[MCRemoveProfileViewController initWithProfile:]([MCRemoveProfileViewController alloc], "initWithProfile:", v8);
  -[MCUIMCSpecifierProvider _presentViewController:](self, "_presentViewController:", v7);

}

- (void)_selectUninstalledProfileIdentifier:(id)a3
{
  void *v4;
  id v5;
  void *v6;
  MCInstallProfileViewController *v7;
  MCUINavigationViewController *v8;
  id v9;

  v4 = (void *)MEMORY[0x1E0D47230];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "uninstalledProfileDataWithIdentifier:targetDevice:", v5, objc_msgSend(MEMORY[0x1E0D47220], "thisDeviceType"));
  v9 = (id)objc_claimAutoreleasedReturnValue();

  if (!-[MCUIMCSpecifierProvider _showProfileDetailPageForUserEnrollmentProfile:](self, "_showProfileDetailPageForUserEnrollmentProfile:", v9))
  {
    v7 = -[MCInstallProfileViewController initWithInstallableProfileData:fromSource:]([MCInstallProfileViewController alloc], "initWithInstallableProfileData:fromSource:", v9, 1);
    v8 = -[MCUINavigationViewController initWithRootViewController:]([MCUINavigationViewController alloc], "initWithRootViewController:", v7);
    -[MCUIMCSpecifierProvider _presentModalNavController:](self, "_presentModalNavController:", v8);

  }
}

- (BOOL)_showProfileDetailPageForUserEnrollmentProfile:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  MCProfileTitlePageViewModel *v7;
  MCProfileTitlePageViewController *v8;
  MCUIDismissalAwareNavigationController *v9;
  BOOL v10;
  uint64_t v12;

  v4 = a3;
  v12 = 0;
  objc_msgSend(MEMORY[0x1E0D47220], "profileWithData:outError:", v4, &v12);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v12)
  {
    NSLog(CFSTR("MCUI MC Specifier Provider failed to deserialize profile"));
LABEL_5:
    v10 = 0;
    goto LABEL_6;
  }
  if (!objc_msgSend(v5, "isUserEnrollmentProfile"))
    goto LABEL_5;
  v7 = -[MCProfileTitlePageViewModel initWithProfile:profileData:]([MCProfileTitlePageViewModel alloc], "initWithProfile:profileData:", v6, v4);
  v8 = -[MCProfileTitlePageViewController initWithViewModel:]([MCProfileTitlePageViewController alloc], "initWithViewModel:", v7);
  v9 = -[MCUIDismissalAwareNavigationController initWithRootViewController:]([MCUIDismissalAwareNavigationController alloc], "initWithRootViewController:", v8);
  -[MCUIMCSpecifierProvider _presentModalNavController:](self, "_presentModalNavController:", v9);

  v10 = 1;
LABEL_6:

  return v10;
}

- (void)_presentModalNavController:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v7 = a3;
  if (MCUIIsiPad())
    objc_msgSend(v7, "setModalPresentationStyle:", 2);
  -[MCUISpecifierProvider delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "mcuiViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "presentViewController:animated:completion:", v7, 1, 0);

}

- (void)_presentViewController:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;

  v4 = a3;
  -[MCUISpecifierProvider delegate](self, "delegate");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "mcuiViewController");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "navigationController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "pushViewController:animated:", v4, 1);

}

@end

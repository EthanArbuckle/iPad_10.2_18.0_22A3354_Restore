@implementation MDMUserParser

- (id)_allCommands
{
  if (_allCommands_once != -1)
    dispatch_once(&_allCommands_once, &__block_literal_global_9);
  return (id)_allCommands_set;
}

void __29__MDMUserParser__allCommands__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[10];

  v4[9] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = CFSTR("ProfileList");
  v4[1] = CFSTR("InstallProfile");
  v4[2] = CFSTR("RemoveProfile");
  v4[3] = CFSTR("Restrictions");
  v4[4] = CFSTR("InviteToProgram");
  v4[5] = CFSTR("DeviceInformation");
  v4[6] = CFSTR("DeclarativeManagement");
  v4[7] = CFSTR("Settings");
  v4[8] = CFSTR("UserConfigured");
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 9);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)_allCommands_set;
  _allCommands_set = v2;

}

- (id)_allSettingsItems
{
  id v3;

  if (_allSettingsItems_onceToken != -1)
    dispatch_once(&_allSettingsItems_onceToken, &__block_literal_global_2);
  if (-[MDMParser isChaperoned](self, "isChaperoned"))
    v3 = (id)_allSettingsItems_supervisedSet;
  else
    v3 = 0;
  return v3;
}

void __34__MDMUserParser__allSettingsItems__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x24BDBCEF0], "setWithObject:", CFSTR("AccessibilitySettings"));
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_allSettingsItems_supervisedSet;
  _allSettingsItems_supervisedSet = v0;

}

- (id)_profileList:(id)a3
{
  return -[MDMParser _profileList:filterFlags:](self, "_profileList:filterFlags:", a3, 9);
}

- (id)_installProfile:(id)a3 accessRights:(unint64_t)a4
{
  return -[MDMParser _installProfile:accessRights:installationType:](self, "_installProfile:accessRights:installationType:", a3, a4, 1);
}

- (id)_removeProfile:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "objectForKey:", CFSTR("Identifier"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
    -[MDMParser _removeProfileWithIdentifier:forInstalledProfilesWithFilterFlags:](self, "_removeProfileWithIdentifier:forInstalledProfilesWithFilterFlags:", v4, 9);
  else
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("CommandFormatError"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)_declarativeManagement:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  void *v7;
  BOOL v8;
  id v9;
  NSObject *v10;
  NSObject *v11;
  void *v12;
  uint64_t v13;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v5, OS_LOG_TYPE_DEFAULT, "Processing DeclarativeManagement command", buf, 2u);
  }
  +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[MDMParser managingProfileIdentifier](self, "managingProfileIdentifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = 0;
  v8 = +[MDMDeclarativeManagementCommand processMultiUserDeviceUserChannelRequestTypeWithProfileIdentifier:request:error:](MDMDeclarativeManagementCommand, "processMultiUserDeviceUserChannelRequestTypeWithProfileIdentifier:request:error:", v7, v4, &v15);

  v9 = v15;
  if (!v8)
  {
    v10 = *(NSObject **)(DMCLogObjects() + 8);
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
    {
      v11 = v10;
      objc_msgSend(v9, "DMCVerboseDescription");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v17 = v12;
      _os_log_impl(&dword_222CB9000, v11, OS_LOG_TYPE_ERROR, "Failed to process DeclarativeManagement command with error: %{public}@", buf, 0xCu);

    }
    +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v9);
    v13 = objc_claimAutoreleasedReturnValue();

    v6 = (void *)v13;
  }

  return v6;
}

- (id)_restrictions:(id)a3
{
  return -[MDMParser _restrictions:withProfileFilterFlags:](self, "_restrictions:withProfileFilterFlags:", a3, 9);
}

- (id)_allowedDeviceQueriesForAccessRights:(unint64_t)a3
{
  return (id)objc_msgSend(MEMORY[0x24BE60D80], "allowedDeviceQueriesOnUserChannelForAccessRights:", a3);
}

- (void)_performQuery:(id)a3 withResultDictionary:(id)a4
{
  uint64_t v5;
  int v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v12 = a4;
  v5 = *MEMORY[0x24BE611F0];
  v6 = objc_msgSend(a3, "isEqualToString:", *MEMORY[0x24BE611F0]);
  v7 = v12;
  if (v6)
  {
    v8 = objc_alloc(MEMORY[0x24BDD17C8]);
    objc_msgSend(MEMORY[0x24BE60DC0], "sharedClient");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "pushToken");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = (void *)objc_msgSend(v8, "initWithData:encoding:", v10, 1);

    if (v11)
      objc_msgSend(v12, "setObject:forKeyedSubscript:", v11, v5);

    v7 = v12;
  }

}

- (void)_sendAnalyticsMDMCommandEventWithRequest:(id)a3 response:(id)a4
{
  void *v6;
  id v7;
  id v8;
  void *v9;
  void *v10;
  id v11;

  if (a3)
  {
    if (a4)
    {
      v6 = (void *)MEMORY[0x24BE60D68];
      v7 = a4;
      v8 = a3;
      objc_msgSend(v6, "sharedConfiguration");
      v11 = (id)objc_claimAutoreleasedReturnValue();
      -[MDMParser _analyticsCommandNameFromRequest:](self, "_analyticsCommandNameFromRequest:", v8);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      -[MDMParser _analyticsErrorFromResponse:](self, "_analyticsErrorFromResponse:", v7);
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      -[MDMParser _analyticsRequiresNetworkTetheringFromRequest:](self, "_analyticsRequiresNetworkTetheringFromRequest:", v8);
      objc_msgSend(v11, "isTeslaEnrolled");
      objc_msgSend(v11, "isSupervised");
      MDMAnalyticsSendCommandEvent(v9, v10);

    }
  }
}

- (id)_originator
{
  void *v2;
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "managingOrganizationInformation");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B8]);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (void)_userConfigured:(id)a3 assertion:(id)a4 completionBlock:(id)a5
{
  void (**v5)(id, void *);
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  void *v11;
  uint8_t buf[16];

  v5 = (void (**)(id, void *))a5;
  if (objc_msgSend(MEMORY[0x24BE2A820], "markCurrentUserAsConfigured"))
  {
    +[MDMAbstractTunnelParser responseWithStatus:](MDMParser, "responseWithStatus:", CFSTR("Acknowledged"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v5)
      goto LABEL_8;
    goto LABEL_7;
  }
  v7 = *(NSObject **)(DMCLogObjects() + 8);
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_222CB9000, v7, OS_LOG_TYPE_ERROR, "Could not update await user configured", buf, 2u);
  }
  v8 = (void *)MEMORY[0x24BDD1540];
  v9 = *MEMORY[0x24BE2A728];
  DMCErrorArray();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "DMCErrorWithDomain:code:descriptionArray:errorType:", v9, 12114, v10, *MEMORY[0x24BE2A588], 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  +[MDMAbstractTunnelParser responseWithError:](MDMParser, "responseWithError:", v11);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
LABEL_7:
    v5[2](v5, v6);
LABEL_8:

}

@end

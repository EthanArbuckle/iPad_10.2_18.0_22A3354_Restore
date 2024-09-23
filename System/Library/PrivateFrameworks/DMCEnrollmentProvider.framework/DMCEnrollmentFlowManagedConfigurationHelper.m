@implementation DMCEnrollmentFlowManagedConfigurationHelper

- (BOOL)isDevicePasscodeSet
{
  return MKBGetDeviceLockState() != 3;
}

- (BOOL)isDeviceMDMEnrolled
{
  void *v2;
  void *v3;
  BOOL v4;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "installedMDMProfileIdentifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3 != 0;

  return v4;
}

- (BOOL)isDeviceSupervised
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isSupervised");

  return v3;
}

- (BOOL)isDeviceSharediPad
{
  return objc_msgSend(MEMORY[0x24BE2A820], "isSharediPad");
}

- (BOOL)isStoredProfileInstalled
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isStoredProfileInstalled");

  return v3;
}

- (id)getMachineInfoForEnrollmentType:(unint64_t)a3 enrollmentMethod:(unint64_t)a4
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x24BDAC8D0];
  if (a3 - 1 > 1)
  {
    if (a3 <= 9 && ((1 << a3) & 0x388) != 0)
      goto LABEL_5;
    if (a4 > 6)
      return v4;
    if (((1 << a4) & 0x35) == 0)
    {
LABEL_5:
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getMachineInfo");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "getReducedMachineInfo");
      v8 = objc_claimAutoreleasedReturnValue();
    }
    v4 = (void *)v8;
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = *MEMORY[0x24BE60EE8];
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v11[0] = v6;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "getMachineInfoWithAdditionalInfo:", v7);
    v4 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v4;
}

- (id)detailsFromMDMProfile:(id)a3 error:(id *)a4
{
  void *v5;
  void *v6;
  id v7;
  id v8;
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

  objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:outError:", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
  {
    if (!a4)
    {
      v17 = 0;
      goto LABEL_13;
    }
    +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError](DMCEnrollmentFlowManagedConfigurationHelper, "_createProfileInvalidError");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v18;
    if (v18)
    {
      v7 = objc_retainAutorelease(v18);
      v17 = 0;
      *a4 = v7;
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  objc_msgSend(v5, "payloadsWithClass:", objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "firstObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (!v7)
  {
    if (a4)
    {
      +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError](DMCEnrollmentFlowManagedConfigurationHelper, "_createProfileInvalidError");
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = v19;
      if (v19)
      {
        v8 = objc_retainAutorelease(v19);
        v17 = 0;
        *a4 = v8;
      }
      else
      {
        v17 = 0;
      }
      goto LABEL_4;
    }
LABEL_11:
    v17 = 0;
    goto LABEL_12;
  }
  objc_msgSend(MEMORY[0x24BDBCED8], "dictionaryWithCapacity:", 7);
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v9, *MEMORY[0x24BE2A518]);

  objc_msgSend(v7, "managedAppleID");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v10, *MEMORY[0x24BE2A508]);

  objc_msgSend(v7, "assignedManagedAppleID");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v11, *MEMORY[0x24BE2A4F0]);

  objc_msgSend(v7, "friendlyName");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v12, *MEMORY[0x24BE2A500]);

  +[DMCEnrollmentFlowManagedConfigurationHelper organizationNameFromProfile:payload:](DMCEnrollmentFlowManagedConfigurationHelper, "organizationNameFromProfile:payload:", v5, v7);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v13, *MEMORY[0x24BE2A510]);

  objc_msgSend(v7, "enrollmentMode");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v14, *MEMORY[0x24BE2A4F8]);

  objc_msgSend(v7, "serverCapabilities");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v15, *MEMORY[0x24BE2A528]);

  objc_msgSend(v7, "requiredAppIDForMDM");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setObject:forKeyedSubscript:", v16, *MEMORY[0x24BE2A520]);

  v17 = (void *)objc_msgSend(v8, "copy");
LABEL_4:

LABEL_12:
LABEL_13:

  return v17;
}

+ (id)organizationNameFromProfile:(id)a3 payload:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  void *v19;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "details");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = *MEMORY[0x24BE2A4B8];
  objc_msgSend(v8, "objectForKeyedSubscript:", *MEMORY[0x24BE2A4B8]);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    objc_msgSend(v8, "objectForKeyedSubscript:", v9);
    v11 = objc_claimAutoreleasedReturnValue();
LABEL_8:
    v15 = (void *)v11;
    goto LABEL_9;
  }
  objc_msgSend(v6, "organization");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (v12)
  {
    v13 = v6;
LABEL_7:
    objc_msgSend(v13, "organization");
    v11 = objc_claimAutoreleasedReturnValue();
    goto LABEL_8;
  }
  objc_msgSend(v5, "organization");
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  if (v14)
  {
    v13 = v5;
    goto LABEL_7;
  }
  objc_msgSend(v6, "serverURLString");
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  if (v15)
  {
    v17 = (void *)MEMORY[0x24BDBCF48];
    objc_msgSend(v6, "serverURLString");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "URLWithString:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();

    if (v19)
    {
      objc_msgSend(v19, "host");
      v15 = (void *)objc_claimAutoreleasedReturnValue();

    }
    else
    {
      v15 = 0;
    }
  }
LABEL_9:

  return v15;
}

- (BOOL)isMDMProfileLocked
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isMDMUnremovable");

  return v3;
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 completionHandler:(id)a7
{
  -[DMCEnrollmentFlowManagedConfigurationHelper installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:managedProfileIdentifiers:installationSource:completionHandler:](self, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:managedProfileIdentifiers:installationSource:completionHandler:", a3, a4, a5, a6, 0, 0, 0, 0, a7);
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 managedProfileIdentifiers:(id)a7 installationSource:(id)a8 completionHandler:(id)a9
{
  -[DMCEnrollmentFlowManagedConfigurationHelper installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:managedProfileIdentifiers:installationSource:completionHandler:](self, "installEnrollmentProfile:devicePasscode:personaID:rmAccountIdentifier:isESSO:essoAppITunesStoreID:managedProfileIdentifiers:installationSource:completionHandler:", a3, a4, a5, a6, 0, 0, a7, a8, a9);
}

- (void)installEnrollmentProfile:(id)a3 devicePasscode:(id)a4 personaID:(id)a5 rmAccountIdentifier:(id)a6 isESSO:(BOOL)a7 essoAppITunesStoreID:(id)a8 managedProfileIdentifiers:(id)a9 installationSource:(id)a10 completionHandler:(id)a11
{
  _BOOL4 v12;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  uint64_t v28;
  void *v29;
  void *v30;
  void *v31;
  _BOOL8 v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  id v37;

  v12 = a7;
  v37 = a3;
  v17 = a8;
  v18 = a11;
  v19 = a10;
  v20 = a9;
  v21 = a6;
  v22 = a5;
  -[DMCEnrollmentFlowManagedConfigurationHelper setDevicePasscode:](self, "setDevicePasscode:", a4);
  -[DMCEnrollmentFlowManagedConfigurationHelper setInstallingProfileData:](self, "setInstallingProfileData:", v37);
  -[DMCEnrollmentFlowManagedConfigurationHelper setProfileInstallationCompletionHandler:](self, "setProfileInstallationCompletionHandler:", v18);

  v23 = (void *)objc_opt_new();
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v22, *MEMORY[0x24BE63E00]);

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v21, *MEMORY[0x24BE63E08]);
  objc_msgSend(v23, "setObject:forKeyedSubscript:", v20, *MEMORY[0x24BE63DA8]);

  objc_msgSend(v23, "setObject:forKeyedSubscript:", v19, *MEMORY[0x24BE63DC0]);
  objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:outError:", v37, 0);
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "payloadsWithClass:", objc_opt_class());
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  v26 = objc_msgSend(v25, "count");

  if (v26)
  {
    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "isMDMUnremovable");

    objc_msgSend(MEMORY[0x24BE60D68], "sharedConfiguration");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v29, "details");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "objectForKeyedSubscript:", *MEMORY[0x24BE2A470]);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    v32 = objc_msgSend(v31, "intValue") == 1;

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v28);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v33, *MEMORY[0x24BE63DD8]);

    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", v32);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v34, *MEMORY[0x24BE63DE0]);

  }
  if (v12)
  {
    objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x24BDBD1C8], *MEMORY[0x24BE63DE8]);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, *MEMORY[0x24BE63DB8]);
  }
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v35 = (void *)objc_claimAutoreleasedReturnValue();
  v36 = (void *)objc_msgSend(v23, "copy");
  objc_msgSend(v35, "installProfileData:options:interactionDelegate:", v37, v36, self);

}

- (void)removeProfileWithIdentifier:(id)a3 async:(BOOL)a4
{
  _BOOL4 v4;
  id v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a4;
  v5 = a3;
  if (v5)
  {
    v8 = v5;
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = v6;
    if (v4)
      objc_msgSend(v6, "removeProfileAsyncWithIdentifier:", v8);
    else
      objc_msgSend(v6, "removeProfileWithIdentifier:", v8);

    v5 = v8;
  }

}

- (BOOL)removeProfileAssociatedWithPersonaID:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;

  v3 = (void *)MEMORY[0x24BE60D70];
  v4 = a3;
  objc_msgSend(v3, "sharedConfiguration");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "personaID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isEqualToString:", v4);

  if (v7)
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BE60D70], "sharedConfiguration");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "memberQueueManagingProfileIdentifier");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "removeProfileWithIdentifier:", v10);

  }
  return v7;
}

- (BOOL)validateESSOConfigurationProfile:(id)a3 error:(id *)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  BOOL v18;
  void *v19;
  void *v20;
  void *v21;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  _BYTE v27[128];
  _QWORD v28[5];

  v28[4] = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = (void *)MEMORY[0x24BDBCF20];
  v28[0] = objc_opt_class();
  v28[1] = objc_opt_class();
  v28[2] = objc_opt_class();
  v28[3] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x24BE63CA8], "profileWithData:outError:", v5, a4);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v9;
  if (v9)
  {
    objc_msgSend(v9, "payloads");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "count");

    if (v12)
    {
      v25 = 0u;
      v26 = 0u;
      v24 = 0u;
      objc_msgSend(v10, "payloads", 0, 0);
      v13 = (id)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
      if (v14)
      {
        v15 = v14;
        v16 = *(_QWORD *)v24;
        while (2)
        {
          for (i = 0; i != v15; ++i)
          {
            if (*(_QWORD *)v24 != v16)
              objc_enumerationMutation(v13);
            if ((objc_msgSend(v8, "containsObject:", objc_opt_class()) & 1) == 0)
            {
              if (a4)
              {
                +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError](DMCEnrollmentFlowManagedConfigurationHelper, "_createProfileInvalidError");
                v20 = (void *)objc_claimAutoreleasedReturnValue();
                v21 = v20;
                if (v20)
                  *a4 = objc_retainAutorelease(v20);

              }
              goto LABEL_19;
            }
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
          v18 = 1;
          if (v15)
            continue;
          break;
        }
      }
      else
      {
        v18 = 1;
      }
      goto LABEL_22;
    }
  }
  if (a4)
  {
    +[DMCEnrollmentFlowManagedConfigurationHelper _createProfileInvalidError](DMCEnrollmentFlowManagedConfigurationHelper, "_createProfileInvalidError");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = v19;
    if (v19)
    {
      v13 = objc_retainAutorelease(v19);
      v18 = 0;
      *a4 = v13;
    }
    else
    {
LABEL_19:
      v18 = 0;
    }
LABEL_22:

    goto LABEL_23;
  }
  v18 = 0;
LABEL_23:

  return v18;
}

- (void)reauthenticationComplete
{
  id v2;

  objc_msgSend(MEMORY[0x24BE60D60], "sharedClient");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "reauthenticationComplete");

}

- (void)requestEnrollmentFlowMonitorWithPersonaID:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "startMonitoringEnrollmentStateWithPersonaID:", v4);

}

- (void)stopEnrollmentFlowMonitor
{
  id v2;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stopMonitoringEnrollmentState");

}

- (void)profileConnection:(id)a3 didFinishInstallationWithIdentifier:(id)a4 error:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void (**v17)(_QWORD, _QWORD, _QWORD, _QWORD);
  id v18;

  v18 = a3;
  v8 = a4;
  v9 = a5;
  -[DMCEnrollmentFlowManagedConfigurationHelper profileInstallationCompletionHandler](self, "profileInstallationCompletionHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v10)
  {
    if (v9 && objc_msgSend(v9, "code") == 4045)
    {
      v11 = (void *)MEMORY[0x24BE63CA8];
      -[DMCEnrollmentFlowManagedConfigurationHelper installingProfileData](self, "installingProfileData");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "profileWithData:outError:", v12, 0);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v13, "identifier");
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v15 = v14;
      objc_msgSend(v18, "installedProfileWithIdentifier:", v15);
      v16 = (void *)objc_claimAutoreleasedReturnValue();

      if (v16)
      {

        v9 = 0;
      }
      v8 = v15;
    }
    -[DMCEnrollmentFlowManagedConfigurationHelper profileInstallationCompletionHandler](self, "profileInstallationCompletionHandler");
    v17 = (void (**)(_QWORD, _QWORD, _QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id, _QWORD, id))v17)[2](v17, v8, 0, v9);

    -[DMCEnrollmentFlowManagedConfigurationHelper setProfileInstallationCompletionHandler:](self, "setProfileInstallationCompletionHandler:", 0);
  }
  -[DMCEnrollmentFlowManagedConfigurationHelper setInstallingProfileData:](self, "setInstallingProfileData:", 0);

}

- (void)profileConnectionDidRequestCurrentPasscode:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[DMCEnrollmentFlowManagedConfigurationHelper devicePasscode](self, "devicePasscode");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "respondToCurrentPasscodeRequestContinue:passcode:", 1, v5);

}

- (void)profileConnection:(id)a3 didShowUserWarnings:(id)a4
{
  objc_msgSend(a3, "respondToWarningsContinueInstallation:", 1, a4);
}

- (void)profileConnection:(id)a3 didRequestMAIDSignIn:(id)a4 personaID:(id)a5
{
  objc_msgSend(a3, "respondToMAIDAuthenticationRequest:error:isCancelled:", 1, 0, 0);
}

- (void)profileConnection:(id)a3 didRequestManagedRestoreWithManagedAppleID:(id)a4 personaID:(id)a5
{
  objc_msgSend(a3, "respondToManagedRestoreRequest:error:isCancelled:", 1, 0, 0);
}

- (void)profileConnection:(id)a3 didRequestUserInput:(id)a4
{
  -[DMCEnrollmentFlowManagedConfigurationHelper _handleUserInputRequest:](self, "_handleUserInputRequest:", a4);
}

- (void)profileConnection:(id)a3 didFinishPreflightWithError:(id)a4
{
  id v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v5 = a4;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __93__DMCEnrollmentFlowManagedConfigurationHelper_profileConnection_didFinishPreflightWithError___block_invoke;
  v7[3] = &unk_24D52E730;
  v7[4] = self;
  v8 = v5;
  v6 = v5;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __93__DMCEnrollmentFlowManagedConfigurationHelper_profileConnection_didFinishPreflightWithError___block_invoke(uint64_t a1)
{
  id v2;

  objc_msgSend(*(id *)(a1 + 32), "presenter");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "informQuestionViewControllerOfPreflightResult:", *(_QWORD *)(a1 + 40));

}

+ (id)_mdmProfileInfo
{
  void *v2;
  id v3;
  id v4;
  id v6;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  v3 = (id)objc_msgSend(v2, "installedConfigurationProfileInfoWithOutMDMProfileInfo:", &v6);
  v4 = v6;

  return v4;
}

- (void)_handleUserInputRequest:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;
  uint8_t buf[16];

  v4 = a3;
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_DEFAULT, "Will ask for user input", buf, 2u);
  }
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke;
  v7[3] = &unk_24D52E730;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v7);

}

void __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  _QWORD v4[4];
  id v5;

  objc_msgSend(*(id *)(a1 + 32), "presenter");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = *(void **)(a1 + 40);
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke_2;
  v4[3] = &unk_24D52E9A8;
  v5 = v3;
  objc_msgSend(v2, "requestUserInputWithRequest:completionHandler:", v5, v4);

}

void __71__DMCEnrollmentFlowManagedConfigurationHelper__handleUserInputRequest___block_invoke_2(uint64_t a1, void *a2, char a3)
{
  void *v5;
  id v6;

  v6 = a2;
  if ((a3 & 1) != 0 || !objc_msgSend(*(id *)(a1 + 32), "count"))
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "cancelUserInputResponses");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "submitUserInputResponses:", v6);
  }

}

+ (id)_createProfileInvalidError
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD1540];
  v3 = *MEMORY[0x24BE2A578];
  DMCErrorArray();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "DMCErrorWithDomain:code:descriptionArray:underlyingError:errorType:", v3, 15016, v4, 0, *MEMORY[0x24BE2A588], 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)blockAppInstallsWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE60D60];
  v4 = a3;
  objc_msgSend(v3, "sharedClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "blockAppInstallsWithCompletion:", v4);

}

- (void)unblockAppInstallsWithCompletion:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE60D60];
  v4 = a3;
  objc_msgSend(v3, "sharedClient");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "unblockAppInstallsWithCompletion:", v4);

}

- (void)manageApplicationWithBundleID:(id)a3 iTunesItemID:(id)a4 organization:(id)a5 personaID:(id)a6 associatedDomains:(id)a7 associatedDomainsEnableDirectDownloads:(id)a8 configuration:(id)a9 completionHandler:(id)a10
{
  id v15;
  void *v16;
  id v17;
  id v18;
  id v19;
  id v20;
  id v21;
  id v22;
  void *v23;
  void *v24;
  id v25;
  _QWORD v26[4];
  id v27;

  v15 = a10;
  v16 = (void *)MEMORY[0x24BE2C7E0];
  v17 = a9;
  v18 = a8;
  v19 = a7;
  v20 = a6;
  v21 = a5;
  v22 = a3;
  objc_msgSend(v16, "currentUserConnection");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_opt_new();
  objc_msgSend(v24, "setBundleIdentifier:", v22);

  objc_msgSend(v24, "setOriginator:", v21);
  objc_msgSend(v24, "setPersonaIdentifier:", v20);

  objc_msgSend(v24, "setManagementOptions:", 1);
  objc_msgSend(v24, "setInternal:", MEMORY[0x24BDBD1C8]);
  objc_msgSend(v24, "setAssociatedDomains:", v19);

  objc_msgSend(v24, "setAssociatedDomainsEnableDirectDownloads:", v18);
  objc_msgSend(v24, "setRemovable:", MEMORY[0x24BDBD1C0]);
  objc_msgSend(v24, "setConfiguration:", v17);

  v26[0] = MEMORY[0x24BDAC760];
  v26[1] = 3221225472;
  v26[2] = __202__DMCEnrollmentFlowManagedConfigurationHelper_manageApplicationWithBundleID_iTunesItemID_organization_personaID_associatedDomains_associatedDomainsEnableDirectDownloads_configuration_completionHandler___block_invoke;
  v26[3] = &unk_24D52E9D0;
  v27 = v15;
  v25 = v15;
  objc_msgSend(v23, "performRequest:completion:", v24, v26);

}

uint64_t __202__DMCEnrollmentFlowManagedConfigurationHelper_manageApplicationWithBundleID_iTunesItemID_organization_personaID_associatedDomains_associatedDomainsEnableDirectDownloads_configuration_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)removeApplicationWithBundleID:(id)a3 completionHandler:(id)a4
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[4];
  id v12;
  id v13;

  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BE2C7E0], "currentUserConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_opt_new();
  objc_msgSend(v8, "setBundleIdentifier:", v5);
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __95__DMCEnrollmentFlowManagedConfigurationHelper_removeApplicationWithBundleID_completionHandler___block_invoke;
  v11[3] = &unk_24D52E9F8;
  v12 = v5;
  v13 = v6;
  v9 = v6;
  v10 = v5;
  objc_msgSend(v7, "performRequest:completion:", v8, v11);

}

void __95__DMCEnrollmentFlowManagedConfigurationHelper_removeApplicationWithBundleID_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  uint64_t v8;
  uint64_t v9;
  int v10;
  uint64_t v11;
  __int16 v12;
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  if (v6)
  {
    v7 = *(NSObject **)DMCLogObjects();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v8 = *(_QWORD *)(a1 + 32);
      v10 = 138543618;
      v11 = v8;
      v12 = 2114;
      v13 = v6;
      _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_ERROR, "Failed to remove application with bundle ID: %{public}@, error: %{public}@", (uint8_t *)&v10, 0x16u);
    }
  }
  v9 = *(_QWORD *)(a1 + 40);
  if (v9)
    (*(void (**)(uint64_t, id))(v9 + 16))(v9, v6);

}

- (void)fetchCloudConfigWithCompletionHandler:(id)a3
{
  void (**v3)(id, void *, _QWORD);
  void *v4;
  char v5;
  NSObject *v6;
  _BOOL4 v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  _QWORD v11[4];
  void (**v12)(id, void *, _QWORD);
  uint8_t buf[16];

  v3 = (void (**)(id, void *, _QWORD))a3;
  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "activationRecordIndicatesCloudConfigurationIsAvailable");
  v6 = *(NSObject **)DMCLogObjects();
  v7 = os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT);
  if ((v5 & 1) != 0)
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_DEFAULT, "Activation record indicates cloud configuration is available, will fetch...", buf, 2u);
    }
    objc_msgSend(v4, "cloudConfigurationDetails");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = *(NSObject **)DMCLogObjects();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT);
    if (v8)
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "Cloud Configuration is available already, returning...", buf, 2u);
      }
      v3[2](v3, v8, 0);
    }
    else
    {
      if (v10)
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_216358000, v9, OS_LOG_TYPE_DEFAULT, "Fetching cloud config from cloud...", buf, 2u);
      }
      v11[0] = MEMORY[0x24BDAC760];
      v11[1] = 3221225472;
      v11[2] = __85__DMCEnrollmentFlowManagedConfigurationHelper_fetchCloudConfigWithCompletionHandler___block_invoke;
      v11[3] = &unk_24D52EA20;
      v12 = v3;
      objc_msgSend(v4, "retrieveCloudConfigurationDetailsCompletionBlock:", v11);

    }
  }
  else
  {
    if (v7)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_DEFAULT, "No cloud configuration according to activation record and obliteration shelter.", buf, 2u);
    }
    v3[2](v3, 0, 0);
  }

}

void __85__DMCEnrollmentFlowManagedConfigurationHelper_fetchCloudConfigWithCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void (*v8)(void);
  int v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = *(NSObject **)DMCLogObjects();
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
    {
      v9 = 138543362;
      v10 = v5;
      _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_ERROR, "Failed to retrieve and store cloud configuration with error: %{public}@", (uint8_t *)&v9, 0xCu);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_216358000, v7, OS_LOG_TYPE_DEFAULT, "Cloud Configuration fetched", (uint8_t *)&v9, 2u);
    }
    v8 = *(void (**)(void))(*(_QWORD *)(a1 + 32) + 16);
  }
  v8();

}

- (void)storeCloudConfig:(id)a3 completionHandler:(id)a4
{
  void *v5;
  id v6;
  id v7;
  id v8;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a4;
  v7 = a3;
  objc_msgSend(v5, "sharedConnection");
  v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "storeCloudConfigurationDetails:completion:", v7, v6);

}

- (void)awaitDeviceConfiguredWithCompletionHandler:(id)a3
{
  void (**v4)(void);

  v4 = (void (**)(void))a3;
  if (-[DMCEnrollmentFlowManagedConfigurationHelper isDeviceConfigured](self, "isDeviceConfigured"))
  {
    v4[2]();
  }
  else
  {
    -[DMCEnrollmentFlowManagedConfigurationHelper setAwaitDeviceConfigurationCompletionHandler:](self, "setAwaitDeviceConfigurationCompletionHandler:", v4);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "addObserver:selector:name:object:", self, sel__cloudConfigDidChange_, *MEMORY[0x24BE63738], 0);
  }

}

- (BOOL)isDeviceConfigured
{
  void *v2;
  char v3;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "isAwaitingDeviceConfigured") ^ 1;

  return v3;
}

- (void)_cloudConfigDidChange:(id)a3
{
  BOOL v4;
  NSObject *v5;
  _BOOL4 v6;
  void *v7;
  void *v8;
  void (**v9)(void);
  uint8_t v10[16];
  uint8_t buf[16];

  v4 = -[DMCEnrollmentFlowManagedConfigurationHelper isDeviceConfigured](self, "isDeviceConfigured", a3);
  v5 = *(NSObject **)DMCLogObjects();
  v6 = os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT);
  if (v4)
  {
    if (v6)
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_DEFAULT, "Device is configured!", v10, 2u);
    }
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "removeObserver:", self);

    -[DMCEnrollmentFlowManagedConfigurationHelper awaitDeviceConfigurationCompletionHandler](self, "awaitDeviceConfigurationCompletionHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
    {
      -[DMCEnrollmentFlowManagedConfigurationHelper awaitDeviceConfigurationCompletionHandler](self, "awaitDeviceConfigurationCompletionHandler");
      v9 = (void (**)(void))objc_claimAutoreleasedReturnValue();
      v9[2]();

      -[DMCEnrollmentFlowManagedConfigurationHelper setAwaitDeviceConfigurationCompletionHandler:](self, "setAwaitDeviceConfigurationCompletionHandler:", 0);
    }
  }
  else if (v6)
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_216358000, v5, OS_LOG_TYPE_DEFAULT, "Cloud config changed but device is not configured.", buf, 2u);
  }
}

- (void)restoreSetAsideCloudConfigAndProfilesWithCompletionHandler:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "restoreCloudConfigAndMDMProfileFromSetAsideDataWithCompletion:", v4);

}

- (void)markCloudConfigurationAsUICompletedWithCompletionHandler:(id)a3
{
  void *v3;
  id v4;
  id v5;

  v3 = (void *)MEMORY[0x24BE63CB0];
  v4 = a3;
  objc_msgSend(v3, "sharedConnection");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "cloudConfigurationUIDidCompleteWasApplied:completionHandler:", 1, v4);

}

- (void)markStoredProfileAsInstalled
{
  id v2;

  objc_msgSend(MEMORY[0x24BE63CB0], "sharedConnection");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "markStoredProfileAsInstalled");

}

- (DMCBYODEnrollmentFlowUIPresenter)presenter
{
  return (DMCBYODEnrollmentFlowUIPresenter *)objc_loadWeakRetained((id *)&self->_presenter);
}

- (void)setPresenter:(id)a3
{
  objc_storeWeak((id *)&self->_presenter, a3);
}

- (NSData)installingProfileData
{
  return self->_installingProfileData;
}

- (void)setInstallingProfileData:(id)a3
{
  objc_storeStrong((id *)&self->_installingProfileData, a3);
}

- (id)profileInstallationCompletionHandler
{
  return self->_profileInstallationCompletionHandler;
}

- (void)setProfileInstallationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSString)devicePasscode
{
  return self->_devicePasscode;
}

- (void)setDevicePasscode:(id)a3
{
  objc_storeStrong((id *)&self->_devicePasscode, a3);
}

- (id)awaitDeviceConfigurationCompletionHandler
{
  return self->_awaitDeviceConfigurationCompletionHandler;
}

- (void)setAwaitDeviceConfigurationCompletionHandler:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_awaitDeviceConfigurationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_devicePasscode, 0);
  objc_storeStrong(&self->_profileInstallationCompletionHandler, 0);
  objc_storeStrong((id *)&self->_installingProfileData, 0);
  objc_destroyWeak((id *)&self->_presenter);
}

@end

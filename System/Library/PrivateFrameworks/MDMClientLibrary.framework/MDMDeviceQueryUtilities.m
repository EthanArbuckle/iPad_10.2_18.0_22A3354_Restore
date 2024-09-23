@implementation MDMDeviceQueryUtilities

+ (id)allowedDeviceQueriesForAccessRights:(unint64_t)a3 isDataSeparated:(BOOL)a4
{
  _BOOL4 v4;
  __int16 v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  char v13;
  void *v14;
  int v15;
  void *v16;

  v4 = a4;
  v5 = a3;
  v6 = (void *)MEMORY[0x1E0C99E20];
  _alwaysAllowedQueries();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setWithSet:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  if ((v5 & 0x10) != 0)
  {
    _deviceInformationQueries();
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unionSet:", v9);

    if ((v5 & 0x1000) == 0)
    {
LABEL_3:
      if ((v5 & 0x20) == 0)
        goto LABEL_4;
      goto LABEL_8;
    }
  }
  else if ((v5 & 0x1000) == 0)
  {
    goto LABEL_3;
  }
  _appInstallationQueries();
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v10);

  if ((v5 & 0x20) == 0)
  {
LABEL_4:
    if (!v4)
      goto LABEL_12;
    goto LABEL_9;
  }
LABEL_8:
  _networkInformationQueries();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "unionSet:", v11);

  if (!v4)
    goto LABEL_12;
LABEL_9:
  if (_unavailableAppInstallationQueriesWithDataSeparation_onceToken != -1)
    dispatch_once(&_unavailableAppInstallationQueriesWithDataSeparation_onceToken, &__block_literal_global_15_0);
  objc_msgSend(v8, "minusSet:", _unavailableAppInstallationQueriesWithDataSeparation_set);
LABEL_12:
  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userMode") == 1)
    v13 = objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad");
  else
    v13 = 0;

  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "isSupervised");

  if (v15 && (v13 & 1) == 0)
    objc_msgSend(v8, "addObject:", CFSTR("AccessibilitySettings"));
  v16 = (void *)objc_msgSend(v8, "copy");

  return v16;
}

+ (id)allowedDeviceQueriesOnUserChannelForAccessRights:(unint64_t)a3
{
  __int16 v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  int v10;
  void *v11;

  v3 = a3;
  v4 = (void *)MEMORY[0x1E0C99E20];
  if (_alwaysAllowedUserQueries_onceToken != -1)
    dispatch_once(&_alwaysAllowedUserQueries_onceToken, &__block_literal_global_16_0);
  objc_msgSend(v4, "setWithSet:", _alwaysAllowedUserQueries_set);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if ((v3 & 0x1000) != 0)
  {
    _appInstallationQueries();
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v6);

  }
  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v7, "userMode") == 1)
    v8 = objc_msgSend(MEMORY[0x1E0D1C1E8], "isSharediPad") ^ 1;
  else
    v8 = 1;

  +[MDMCloudConfiguration sharedConfiguration](MDMCloudConfiguration, "sharedConfiguration");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "isSupervised");

  if (v10 && (v8 & 1) == 0)
    objc_msgSend(v5, "addObject:", CFSTR("AccessibilitySettings"));
  v11 = (void *)objc_msgSend(v5, "copy");

  return v11;
}

+ (id)allowedDeviceQueriesWithUserEnrollment
{
  if (allowedDeviceQueriesWithUserEnrollment_onceToken != -1)
    dispatch_once(&allowedDeviceQueriesWithUserEnrollment_onceToken, &__block_literal_global_3);
  return (id)allowedDeviceQueriesWithUserEnrollment_allowedQueries;
}

void __65__MDMDeviceQueryUtilities_allowedDeviceQueriesWithUserEnrollment__block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v0 = (void *)MEMORY[0x1E0C99E20];
  _alwaysAllowedQueries();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithSet:", v1);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  _deviceInformationQueries();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v2);

  _appInstallationQueries();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v3);

  _networkInformationQueries();
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "unionSet:", v4);

  if (_validDeviceQueriesWithUserEnrollment_onceToken != -1)
    dispatch_once(&_validDeviceQueriesWithUserEnrollment_onceToken, &__block_literal_global_17_0);
  objc_msgSend(v7, "intersectSet:", _validDeviceQueriesWithUserEnrollment_validMCKeys);
  v5 = objc_msgSend(v7, "copy");
  v6 = (void *)allowedDeviceQueriesWithUserEnrollment_allowedQueries;
  allowedDeviceQueriesWithUserEnrollment_allowedQueries = v5;

}

@end

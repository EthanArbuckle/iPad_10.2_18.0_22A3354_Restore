@implementation DMCProfileViewModel

- (DMCProfileViewModel)initWithProfile:(id)a3 managedPayloads:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  void *v7;
  DMCProfileViewModel *v8;

  v4 = a4;
  v6 = a3;
  v7 = (void *)objc_opt_new();
  v8 = -[DMCProfileViewModel initWithProfile:managedPayloads:profileUIDataProvider:](self, "initWithProfile:managedPayloads:profileUIDataProvider:", v6, v4, v7);

  return v8;
}

- (DMCProfileViewModel)initWithProfile:(id)a3 managedPayloads:(BOOL)a4 profileUIDataProvider:(id)a5
{
  _BOOL8 v6;
  id v8;
  id v9;
  DMCProfileViewModel *v10;
  DMCProfileViewModel *v11;
  void *v12;
  void *v13;
  void *v14;
  objc_super v16;

  v6 = a4;
  v8 = a3;
  v9 = a5;
  v16.receiver = self;
  v16.super_class = (Class)DMCProfileViewModel;
  v10 = -[DMCProfileViewModel init](&v16, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong((id *)&v10->_profileUIDataProvider, a5);
    -[DMCProfileViewModel setProfile:managedPayloads:](v11, "setProfile:managedPayloads:", v8, v6);
    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "addObserver:selector:name:object:", v11, sel__profilesUpdated_, CFSTR("kMCUIProfilesUpdatedNotification"), 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "addObserver:selector:name:object:", v11, sel__managedAppsChanged_, *MEMORY[0x24BE63B58], 0);

    objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "addObserver:selector:name:object:", v11, sel__managedBooksChanged_, *MEMORY[0x24BE60D18], 0);

  }
  return v11;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)DMCProfileViewModel;
  -[DMCProfileViewModel dealloc](&v4, sel_dealloc);
}

- (void)_managedAppsChanged:(id)a3
{
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("kMCUIManagedAppsDidChange");
  v6[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileViewModel _reloadProfile:](self, "_reloadProfile:", v4);

}

- (void)_managedBooksChanged:(id)a3
{
  void *v4;
  const __CFString *v5;
  _QWORD v6[2];

  v6[1] = *MEMORY[0x24BDAC8D0];
  v5 = CFSTR("kMCUIManagedBooksDidChange");
  v6[0] = MEMORY[0x24BDBD1C8];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v6, &v5, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileViewModel _reloadProfile:](self, "_reloadProfile:", v4);

}

- (void)_profilesUpdated:(id)a3
{
  -[DMCProfileViewModel _reloadProfile:](self, "_reloadProfile:", MEMORY[0x24BDBD1B8]);
}

- (void)setProfile:(id)a3 managedPayloads:(BOOL)a4
{
  _BOOL4 v4;
  MCProfile *v7;
  MCProfile *v8;

  v4 = a4;
  v7 = (MCProfile *)a3;
  if (self->_profile != v7 || self->_showManagedPayloads != v4)
  {
    v8 = v7;
    objc_storeStrong((id *)&self->_profile, a3);
    self->_showManagedPayloads = v4;
    -[DMCProfileViewModel _reloadProfile:](self, "_reloadProfile:", 0);
    v7 = v8;
  }

}

- (void)setShowManagedPayloads:(BOOL)a3
{
  if (self->_showManagedPayloads != a3)
  {
    self->_showManagedPayloads = a3;
    -[DMCProfileViewModel _reloadProfile:](self, "_reloadProfile:", 0);
  }
}

- (void)_reloadProfile:(id)a3
{
  id v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  NSString *v12;
  NSString *managedAppleID;
  NSArray *v14;
  NSArray *accountSections;
  NSArray *v16;
  NSArray *managedAppSections;
  NSArray *v18;
  NSArray *managedBookSections;
  NSArray *v20;
  NSArray *moreDetailsSections;
  NSArray *v22;
  NSArray *restrictionSections;
  NSArray *v24;
  NSArray *byodInfoSections;
  NSArray *v26;
  NSArray *payloadInfoSectionSummaries;
  void *v28;
  int v29;
  void *v30;
  __int16 v31;
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    v6 = v5;
    -[DMCProfileViewModel profile](self, "profile");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "identifier");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = 138543618;
    v30 = v8;
    v31 = 2114;
    v32 = v4;
    _os_log_impl(&dword_216358000, v6, OS_LOG_TYPE_DEFAULT, "DMCProfileViewModel (%{public}@) reloading profile with userInfo: %{public}@", (uint8_t *)&v29, 0x16u);

  }
  -[DMCProfileViewModel profileUIDataProvider](self, "profileUIDataProvider");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DMCProfileViewModel profile](self, "profile");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "payloadsSummaryForProfile:showManagedPayloads:", v10, -[DMCProfileViewModel showManagedPayloads](self, "showManagedPayloads"));
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v11, "managedAppleID");
  v12 = (NSString *)objc_claimAutoreleasedReturnValue();
  managedAppleID = self->_managedAppleID;
  self->_managedAppleID = v12;

  self->_finalInstallationWarningStyle = objc_msgSend(v11, "finalInstallationWarningStyle");
  objc_msgSend(v11, "accountSections");
  v14 = (NSArray *)objc_claimAutoreleasedReturnValue();
  accountSections = self->_accountSections;
  self->_accountSections = v14;

  objc_msgSend(v11, "managedAppSections");
  v16 = (NSArray *)objc_claimAutoreleasedReturnValue();
  managedAppSections = self->_managedAppSections;
  self->_managedAppSections = v16;

  objc_msgSend(v11, "managedBookSections");
  v18 = (NSArray *)objc_claimAutoreleasedReturnValue();
  managedBookSections = self->_managedBookSections;
  self->_managedBookSections = v18;

  objc_msgSend(v11, "moreDetailsSections");
  v20 = (NSArray *)objc_claimAutoreleasedReturnValue();
  moreDetailsSections = self->_moreDetailsSections;
  self->_moreDetailsSections = v20;

  objc_msgSend(v11, "restrictionSections");
  v22 = (NSArray *)objc_claimAutoreleasedReturnValue();
  restrictionSections = self->_restrictionSections;
  self->_restrictionSections = v22;

  objc_msgSend(v11, "byodInfoSections");
  v24 = (NSArray *)objc_claimAutoreleasedReturnValue();
  byodInfoSections = self->_byodInfoSections;
  self->_byodInfoSections = v24;

  objc_msgSend(v11, "payloadInfoSectionSummaries");
  v26 = (NSArray *)objc_claimAutoreleasedReturnValue();
  payloadInfoSectionSummaries = self->_payloadInfoSectionSummaries;
  self->_payloadInfoSectionSummaries = v26;

  -[DMCProfileViewModel _determineAvailableElevatedPayloadInfoTypes](self, "_determineAvailableElevatedPayloadInfoTypes");
  objc_msgSend(MEMORY[0x24BDD16D0], "defaultCenter");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "postNotificationName:object:userInfo:", CFSTR("kMCUIProfileDidChangeNotification"), 0, v4);

}

- (void)_determineAvailableElevatedPayloadInfoTypes
{
  NSArray *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSArray *elevatedPayloadTypes;

  v3 = (NSArray *)objc_opt_new();
  if (self->_accountSections)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v4);

  }
  if (self->_managedAppSections)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v5);

  }
  if (self->_managedBookSections)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v6);

  }
  if (self->_restrictionSections)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", 4);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSArray addObject:](v3, "addObject:", v7);

  }
  elevatedPayloadTypes = self->_elevatedPayloadTypes;
  self->_elevatedPayloadTypes = v3;

}

- (BOOL)isMDMProfile
{
  void *v3;
  void *v4;
  void *v5;
  char v6;

  -[DMCProfileViewModel profile](self, "profile");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    -[DMCProfileViewModel profile](self, "profile");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      -[DMCProfileViewModel profile](self, "profile");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v6 = objc_msgSend(v5, "isMDMProfile");

    }
    else
    {
      v6 = 0;
    }

  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (BOOL)managesAppID:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[DMCProfileViewModel managedAppSections](self, "managedAppSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "payloadViewModels", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "managedApp");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "bundleID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {

                v17 = 1;
                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

- (BOOL)managesBook:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t j;
  void *v14;
  void *v15;
  char v16;
  BOOL v17;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  _BYTE v29[128];
  _BYTE v30[128];
  uint64_t v31;

  v31 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v28 = 0u;
  -[DMCProfileViewModel managedBookSections](self, "managedBookSections");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
  if (v20)
  {
    v6 = *(_QWORD *)v26;
    v19 = *(_QWORD *)v26;
    do
    {
      for (i = 0; i != v20; ++i)
      {
        if (*(_QWORD *)v26 != v6)
          objc_enumerationMutation(v5);
        v8 = *(void **)(*((_QWORD *)&v25 + 1) + 8 * i);
        v21 = 0u;
        v22 = 0u;
        v23 = 0u;
        v24 = 0u;
        objc_msgSend(v8, "payloadViewModels", v19);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
        if (v10)
        {
          v11 = v10;
          v12 = *(_QWORD *)v22;
          while (2)
          {
            for (j = 0; j != v11; ++j)
            {
              if (*(_QWORD *)v22 != v12)
                objc_enumerationMutation(v9);
              objc_msgSend(*(id *)(*((_QWORD *)&v21 + 1) + 8 * j), "managedBook");
              v14 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v14, "persistentID");
              v15 = (void *)objc_claimAutoreleasedReturnValue();
              v16 = objc_msgSend(v15, "isEqualToString:", v4);

              if ((v16 & 1) != 0)
              {

                v17 = 1;
                goto LABEL_19;
              }
            }
            v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v21, v29, 16);
            if (v11)
              continue;
            break;
          }
        }

        v6 = v19;
      }
      v17 = 0;
      v20 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v25, v30, 16);
    }
    while (v20);
  }
  else
  {
    v17 = 0;
  }
LABEL_19:

  return v17;
}

+ (id)trustTextForProfile:(id)a3
{
  id v3;
  void *v4;
  __CFString *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  uint64_t v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  if (objc_msgSend(v3, "trustLevel") == 2)
  {
    v4 = 0;
  }
  else
  {
    if (objc_msgSend(v3, "isSigned"))
      v5 = CFSTR("DMC_PROFILE_TRUST_NOT_VERIFIED");
    else
      v5 = CFSTR("DMC_PROFILE_TRUST_NOT_SIGNED");
    DMCEnrollmentLocalizedString(v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_alloc(MEMORY[0x24BDD1458]);
    v11 = *MEMORY[0x24BEBB368];
    objc_msgSend(MEMORY[0x24BDF6950], "DMCProfileRedColor");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = v8;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (void *)objc_msgSend(v7, "initWithString:attributes:", v6, v9);

  }
  return v4;
}

- (int64_t)_numberOfItemsInSectionsArray:(id)a3
{
  id v3;
  uint64_t v4;
  uint64_t v5;
  int64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "payloadViewModels");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "count");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (int64_t)numberOfAccounts
{
  void *v3;
  int64_t v4;

  -[DMCProfileViewModel accountSections](self, "accountSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DMCProfileViewModel _numberOfItemsInSectionsArray:](self, "_numberOfItemsInSectionsArray:", v3);

  return v4;
}

- (int64_t)numberOfManagedApps
{
  void *v3;
  int64_t v4;

  -[DMCProfileViewModel managedAppSections](self, "managedAppSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DMCProfileViewModel _numberOfItemsInSectionsArray:](self, "_numberOfItemsInSectionsArray:", v3);

  return v4;
}

- (int64_t)numberOfManagedBooks
{
  void *v3;
  int64_t v4;

  -[DMCProfileViewModel managedBookSections](self, "managedBookSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DMCProfileViewModel _numberOfItemsInSectionsArray:](self, "_numberOfItemsInSectionsArray:", v3);

  return v4;
}

- (int64_t)numberOfRestrictions
{
  void *v3;
  int64_t v4;

  -[DMCProfileViewModel restrictionSections](self, "restrictionSections");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[DMCProfileViewModel _numberOfItemsInSectionsArray:](self, "_numberOfItemsInSectionsArray:", v3);

  return v4;
}

- (BOOL)showManagedPayloads
{
  return self->_showManagedPayloads;
}

- (int64_t)finalInstallationWarningStyle
{
  return self->_finalInstallationWarningStyle;
}

- (void)setFinalInstallationWarningStyle:(int64_t)a3
{
  self->_finalInstallationWarningStyle = a3;
}

- (MCProfile)profile
{
  return self->_profile;
}

- (NSString)managedAppleID
{
  return self->_managedAppleID;
}

- (NSArray)elevatedPayloadTypes
{
  return self->_elevatedPayloadTypes;
}

- (NSArray)accountSections
{
  return self->_accountSections;
}

- (NSArray)managedAppSections
{
  return self->_managedAppSections;
}

- (NSArray)managedBookSections
{
  return self->_managedBookSections;
}

- (NSArray)moreDetailsSections
{
  return self->_moreDetailsSections;
}

- (NSArray)restrictionSections
{
  return self->_restrictionSections;
}

- (NSArray)byodInfoSections
{
  return self->_byodInfoSections;
}

- (NSArray)payloadInfoSectionSummaries
{
  return self->_payloadInfoSectionSummaries;
}

- (DMCProfileUIDataProvider)profileUIDataProvider
{
  return self->_profileUIDataProvider;
}

- (void)setProfileUIDataProvider:(id)a3
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_profileUIDataProvider, 0);
  objc_storeStrong((id *)&self->_payloadInfoSectionSummaries, 0);
  objc_storeStrong((id *)&self->_byodInfoSections, 0);
  objc_storeStrong((id *)&self->_restrictionSections, 0);
  objc_storeStrong((id *)&self->_moreDetailsSections, 0);
  objc_storeStrong((id *)&self->_managedBookSections, 0);
  objc_storeStrong((id *)&self->_managedAppSections, 0);
  objc_storeStrong((id *)&self->_accountSections, 0);
  objc_storeStrong((id *)&self->_elevatedPayloadTypes, 0);
  objc_storeStrong((id *)&self->_managedAppleID, 0);
  objc_storeStrong((id *)&self->_profile, 0);
}

@end

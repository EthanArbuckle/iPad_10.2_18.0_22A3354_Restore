@implementation MDMESSODetails

+ (id)essoDetailsWithJSONDictionary:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  MDMESSODetails *v7;
  NSObject *v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  NSObject *v14;
  NSObject *v15;
  NSObject *v16;
  int v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("iTunesStoreID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    || (objc_msgSend(MEMORY[0x1E0D1C1B0], "ESSOTestModeEnabled") & 1) != 0)
  {
    if (objc_msgSend(MEMORY[0x1E0D1C1B0], "ESSOTestModeEnabled"))
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AppIDs"));
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend(v5, "count"))
      {
        v6 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
        {
          v18 = 138543362;
          v19 = v3;
          _os_log_impl(&dword_1D4BF7000, v6, OS_LOG_TYPE_ERROR, "ESSO app IDs is invalid: %{public}@", (uint8_t *)&v18, 0xCu);
        }
        v7 = 0;
LABEL_33:

        goto LABEL_34;
      }
    }
    else
    {
      v5 = 0;
    }
    objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AssociatedDomains"));
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    if (v9 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
    {
      v15 = *(NSObject **)DMCLogObjects();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        v18 = 138543362;
        v19 = v3;
        _os_log_impl(&dword_1D4BF7000, v15, OS_LOG_TYPE_ERROR, "ESSO associated domains is invalid: %{public}@", (uint8_t *)&v18, 0xCu);
      }
      v7 = 0;
    }
    else
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("AssociatedDomainsEnableDirectDownloads"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v10 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
      {
        v16 = *(NSObject **)DMCLogObjects();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
        {
          v18 = 138543362;
          v19 = v3;
          _os_log_impl(&dword_1D4BF7000, v16, OS_LOG_TYPE_ERROR, "ESSO associated domains enable direct downloads is invalid: %{public}@", (uint8_t *)&v18, 0xCu);
        }
        v7 = 0;
      }
      else
      {
        v11 = objc_alloc(MEMORY[0x1E0C99D50]);
        objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("ConfigurationProfile"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = (void *)objc_msgSend(v11, "initWithBase64EncodedString:options:", v12, 0);

        if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v7 = -[MDMESSODetails initWithiTunesStoreID:appIDs:associatedDomains:associatedDomainsEnableDirectDownloads:configurationProfile:]([MDMESSODetails alloc], "initWithiTunesStoreID:appIDs:associatedDomains:associatedDomainsEnableDirectDownloads:configurationProfile:", v4, v5, v9, v10, v13);
        }
        else
        {
          v14 = *(NSObject **)DMCLogObjects();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
          {
            v18 = 138543362;
            v19 = v3;
            _os_log_impl(&dword_1D4BF7000, v14, OS_LOG_TYPE_ERROR, "ESSO details configuration profile data is invalid or missing: %{public}@", (uint8_t *)&v18, 0xCu);
          }
          v7 = 0;
        }

      }
    }

    goto LABEL_33;
  }
  v8 = *(NSObject **)DMCLogObjects();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
  {
    v18 = 138543362;
    v19 = v3;
    _os_log_impl(&dword_1D4BF7000, v8, OS_LOG_TYPE_ERROR, "ESSO details app store ID is invalid or missing: %{public}@", (uint8_t *)&v18, 0xCu);
  }
  v7 = 0;
LABEL_34:

  return v7;
}

- (MDMESSODetails)initWithiTunesStoreID:(id)a3 appIDs:(id)a4 associatedDomains:(id)a5 associatedDomainsEnableDirectDownloads:(id)a6 configurationProfile:(id)a7
{
  id v13;
  id v14;
  id v15;
  id v16;
  id v17;
  MDMESSODetails *v18;
  MDMESSODetails *v19;
  uint64_t v20;
  NSArray *appIDs;
  uint64_t v22;
  NSArray *associatedDomains;
  objc_super v25;

  v13 = a3;
  v14 = a4;
  v15 = a5;
  v16 = a6;
  v17 = a7;
  v25.receiver = self;
  v25.super_class = (Class)MDMESSODetails;
  v18 = -[MDMESSODetails init](&v25, sel_init);
  v19 = v18;
  if (v18)
  {
    objc_storeStrong((id *)&v18->_iTunesStoreID, a3);
    v20 = objc_msgSend(v14, "copy");
    appIDs = v19->_appIDs;
    v19->_appIDs = (NSArray *)v20;

    v22 = objc_msgSend(v15, "copy");
    associatedDomains = v19->_associatedDomains;
    v19->_associatedDomains = (NSArray *)v22;

    objc_storeStrong((id *)&v19->_associatedDomainsEnableDirectDownloads, a6);
    objc_storeStrong((id *)&v19->_configurationProfile, a7);
  }

  return v19;
}

- (NSNumber)iTunesStoreID
{
  return self->_iTunesStoreID;
}

- (void)setITunesStoreID:(id)a3
{
  objc_storeStrong((id *)&self->_iTunesStoreID, a3);
}

- (NSArray)appIDs
{
  return self->_appIDs;
}

- (void)setAppIDs:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSArray)associatedDomains
{
  return self->_associatedDomains;
}

- (void)setAssociatedDomains:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSNumber)associatedDomainsEnableDirectDownloads
{
  return self->_associatedDomainsEnableDirectDownloads;
}

- (void)setAssociatedDomainsEnableDirectDownloads:(id)a3
{
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, a3);
}

- (NSData)configurationProfile
{
  return self->_configurationProfile;
}

- (void)setConfigurationProfile:(id)a3
{
  objc_storeStrong((id *)&self->_configurationProfile, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configurationProfile, 0);
  objc_storeStrong((id *)&self->_associatedDomainsEnableDirectDownloads, 0);
  objc_storeStrong((id *)&self->_associatedDomains, 0);
  objc_storeStrong((id *)&self->_appIDs, 0);
  objc_storeStrong((id *)&self->_iTunesStoreID, 0);
}

@end

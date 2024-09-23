@implementation DNDConfiguration(Record)

+ (id)configurationForRecord:()Record secureRecord:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t i;
  uint64_t v18;
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
  void *v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  _BYTE v38[128];
  uint64_t v39;

  v39 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x1E0D1D6E0], "defaultConfiguration");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "applicationConfigurationType");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setApplicationConfigurationType:", objc_msgSend(v8, "integerValue"));

  objc_msgSend(v5, "senderConfigurationType");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSenderConfigurationType:", objc_msgSend(v9, "integerValue"));

  objc_msgSend(v5, "suppressionType");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setSuppressionType:", objc_msgSend(v10, "unsignedIntegerValue"));

  objc_msgSend(v5, "suppressionMode");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v33 = v7;
  objc_msgSend(v7, "setSuppressionMode:", objc_msgSend(v11, "unsignedIntegerValue"));

  v12 = (void *)objc_opt_new();
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  objc_msgSend(v6, "allowedApplications");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v35;
    do
    {
      for (i = 0; i != v15; ++i)
      {
        if (*(_QWORD *)v35 != v16)
          objc_enumerationMutation(v13);
        v18 = *(_QWORD *)(*((_QWORD *)&v34 + 1) + 8 * i);
        objc_msgSend(v6, "allowedApplications");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "objectForKey:", v18);
        v20 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(MEMORY[0x1E0D1D590], "configurationForRecord:", v20);
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "setObject:forKey:", v21, v18);

      }
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v34, v38, 16);
    }
    while (v15);
  }

  objc_msgSend(v33, "setAllowedApplicationIdentifiers:", v12);
  objc_msgSend(v6, "deniedApplications");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDeniedApplicationIdentifiers:", v22);

  objc_msgSend(v6, "allowedWebApplications");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAllowedWebApplicationIdentifiers:", v23);

  objc_msgSend(v6, "deniedWebApplications");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setDeniedWebApplicationIdentifiers:", v24);

  v25 = (void *)MEMORY[0x1E0D1D740];
  objc_msgSend(v6, "senderConfiguration");
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "configurationForRecord:", v26);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setSenderConfiguration:", v27);

  objc_msgSend(v5, "minimumBreakthroughUrgency");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setMinimumBreakthroughUrgency:", objc_msgSend(v28, "integerValue"));

  objc_msgSend(v5, "hideApplicationBadges");
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setHideApplicationBadges:", objc_msgSend(v29, "integerValue"));

  objc_msgSend(v5, "allowIntelligentManagement");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setAllowIntelligentManagement:", objc_msgSend(v30, "integerValue"));

  objc_msgSend(v5, "compatibilityVersion");
  v31 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v33, "setCompatibilityVersion:", objc_msgSend(v31, "integerValue"));

  return v33;
}

- (DNDSMutableConfigurationRecord)makeRecord
{
  DNDSMutableConfigurationRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v2 = objc_alloc_init(DNDSMutableConfigurationRecord);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "applicationConfigurationType"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setApplicationConfigurationType:](v2, "setApplicationConfigurationType:", v3);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "senderConfigurationType"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setSenderConfigurationType:](v2, "setSenderConfigurationType:", v4);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "suppressionType"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setSuppressionType:](v2, "setSuppressionType:", v5);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "suppressionMode"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setSuppressionMode:](v2, "setSuppressionMode:", v6);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "minimumBreakthroughUrgency"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setMinimumBreakthroughUrgency:](v2, "setMinimumBreakthroughUrgency:", v7);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "hideApplicationBadges"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setHideApplicationBadges:](v2, "setHideApplicationBadges:", v8);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(a1, "allowIntelligentManagement"));
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setAllowIntelligentManagement:](v2, "setAllowIntelligentManagement:", v9);

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "compatibilityVersion"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationRecord setCompatibilityVersion:](v2, "setCompatibilityVersion:", v10);

  return v2;
}

- (DNDSMutableConfigurationSecureRecord)makeSecureRecord
{
  DNDSMutableConfigurationSecureRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(DNDSMutableConfigurationSecureRecord);
  objc_msgSend(a1, "senderConfiguration");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "makeRecord");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationSecureRecord setSenderConfiguration:](v2, "setSenderConfiguration:", v4);

  v5 = (void *)objc_opt_new();
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  objc_msgSend(a1, "allowedApplicationIdentifiers", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "allKeys");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v21;
    do
    {
      v11 = 0;
      do
      {
        if (*(_QWORD *)v21 != v10)
          objc_enumerationMutation(v7);
        v12 = *(_QWORD *)(*((_QWORD *)&v20 + 1) + 8 * v11);
        objc_msgSend(a1, "allowedApplicationIdentifiers");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "objectForKey:", v12);
        v14 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v14, "makeRecord");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "setObject:forKey:", v15, v12);

        ++v11;
      }
      while (v9 != v11);
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    }
    while (v9);
  }

  -[DNDSMutableConfigurationSecureRecord setAllowedApplications:](v2, "setAllowedApplications:", v5);
  objc_msgSend(a1, "deniedApplicationIdentifiers");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationSecureRecord setDeniedApplications:](v2, "setDeniedApplications:", v16);

  objc_msgSend(a1, "allowedWebApplicationIdentifiers");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationSecureRecord setAllowedWebApplications:](v2, "setAllowedWebApplications:", v17);

  objc_msgSend(a1, "deniedWebApplicationIdentifiers");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableConfigurationSecureRecord setDeniedWebApplications:](v2, "setDeniedWebApplications:", v18);

  return v2;
}

@end

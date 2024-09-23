@implementation DNDSenderConfiguration(Record)

+ (id)configurationForRecord:()Record
{
  id v3;
  id v4;
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
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  _BYTE v39[128];
  _BYTE v40[128];
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_alloc_init(MEMORY[0x1E0D1D728]);
  objc_msgSend(v3, "allowedContactTypes");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "mutableCopy");
  objc_msgSend(v4, "setAllowedContactTypes:", v6);

  objc_msgSend(v3, "deniedContactTypes");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (void *)objc_msgSend(v7, "mutableCopy");
  objc_msgSend(v4, "setDeniedContactTypes:", v8);

  objc_msgSend(v3, "allowedContactGroups");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (void *)objc_msgSend(v9, "mutableCopy");
  objc_msgSend(v4, "setAllowedContactGroups:", v10);

  objc_msgSend(v3, "deniedContactGroups");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)objc_msgSend(v11, "mutableCopy");
  objc_msgSend(v4, "setDeniedContactGroups:", v12);

  v13 = (void *)objc_opt_new();
  v35 = 0u;
  v36 = 0u;
  v37 = 0u;
  v38 = 0u;
  objc_msgSend(v3, "allowedContacts");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
  if (v15)
  {
    v16 = v15;
    v17 = *(_QWORD *)v36;
    do
    {
      v18 = 0;
      do
      {
        if (*(_QWORD *)v36 != v17)
          objc_enumerationMutation(v14);
        objc_msgSend(MEMORY[0x1E0D1D5C0], "contactForRecord:", *(_QWORD *)(*((_QWORD *)&v35 + 1) + 8 * v18));
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObject:", v19);

        ++v18;
      }
      while (v16 != v18);
      v16 = objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v35, v40, 16);
    }
    while (v16);
  }

  objc_msgSend(v4, "setAllowedContacts:", v13);
  v20 = (void *)objc_opt_new();
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  objc_msgSend(v3, "deniedContacts", 0);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v32;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v32 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(MEMORY[0x1E0D1D5C0], "contactForRecord:", *(_QWORD *)(*((_QWORD *)&v31 + 1) + 8 * v25));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v20, "addObject:", v26);

        ++v25;
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v31, v39, 16);
    }
    while (v23);
  }

  objc_msgSend(v4, "setDeniedContacts:", v20);
  v27 = (void *)MEMORY[0x1E0D1D5A8];
  objc_msgSend(v3, "phoneCallBypassSettings");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "settingsForRecord:", v28);
  v29 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setPhoneCallBypassSettings:", v29);

  return v4;
}

- (DNDSMutableSenderConfigurationRecord)makeRecord
{
  DNDSMutableSenderConfigurationRecord *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  void *v22;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  _BYTE v32[128];
  _BYTE v33[128];
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v2 = objc_alloc_init(DNDSMutableSenderConfigurationRecord);
  objc_msgSend(a1, "allowedContactTypes");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableSenderConfigurationRecord setAllowedContactTypes:](v2, "setAllowedContactTypes:", v3);

  objc_msgSend(a1, "deniedContactTypes");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableSenderConfigurationRecord setDeniedContactTypes:](v2, "setDeniedContactTypes:", v4);

  objc_msgSend(a1, "allowedContactGroups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableSenderConfigurationRecord setAllowedContactGroups:](v2, "setAllowedContactGroups:", v5);

  objc_msgSend(a1, "deniedContactGroups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableSenderConfigurationRecord setDeniedContactGroups:](v2, "setDeniedContactGroups:", v6);

  v7 = (void *)objc_opt_new();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  objc_msgSend(a1, "allowedContacts");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v29;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v29 != v11)
          objc_enumerationMutation(v8);
        objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v12), "makeRecord");
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "addObject:", v13);

        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v28, v33, 16);
    }
    while (v10);
  }

  -[DNDSMutableSenderConfigurationRecord setAllowedContacts:](v2, "setAllowedContacts:", v7);
  v14 = (void *)objc_opt_new();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(a1, "deniedContacts", 0);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
  if (v16)
  {
    v17 = v16;
    v18 = *(_QWORD *)v25;
    do
    {
      v19 = 0;
      do
      {
        if (*(_QWORD *)v25 != v18)
          objc_enumerationMutation(v15);
        objc_msgSend(*(id *)(*((_QWORD *)&v24 + 1) + 8 * v19), "makeRecord");
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "addObject:", v20);

        ++v19;
      }
      while (v17 != v19);
      v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v24, v32, 16);
    }
    while (v17);
  }

  -[DNDSMutableSenderConfigurationRecord setDeniedContacts:](v2, "setDeniedContacts:", v14);
  objc_msgSend(a1, "phoneCallBypassSettings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "makeRecord");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  -[DNDSMutableSenderConfigurationRecord setPhoneCallBypassSettings:](v2, "setPhoneCallBypassSettings:", v22);

  return v2;
}

@end

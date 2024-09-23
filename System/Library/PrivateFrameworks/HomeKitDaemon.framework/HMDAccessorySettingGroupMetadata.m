@implementation HMDAccessorySettingGroupMetadata

- (HMDAccessorySettingGroupMetadata)initWithName:(id)a3 settings:(id)a4 groups:(id)a5
{
  return -[HMDAccessorySettingGroupMetadata initWithName:settings:groups:parentKeyPath:](self, "initWithName:settings:groups:parentKeyPath:", a3, a4, a5, 0);
}

- (HMDAccessorySettingGroupMetadata)initWithName:(id)a3 settings:(id)a4 groups:(id)a5 parentKeyPath:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  HMDAccessorySettingGroupMetadata *v15;
  uint64_t v16;
  NSString *name;
  void *v18;
  HMDAccessorySettingGroupMetadata *v19;
  void *v20;
  void *v21;
  objc_super v23;

  v10 = a3;
  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (v10)
  {
    v14 = v10;
    v23.receiver = self;
    v23.super_class = (Class)HMDAccessorySettingGroupMetadata;
    v15 = -[HMDAccessorySettingGroupMetadata init](&v23, sel_init);
    if (v15)
    {
      v16 = objc_msgSend(v14, "copy");
      name = v15->_name;
      v15->_name = (NSString *)v16;

      if (v13)
      {
        objc_msgSend(v13, "stringByAppendingFormat:", CFSTR(".%@"), v15->_name);
        v18 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        v18 = v14;
      }
      objc_storeStrong((id *)&v15->_keyPath, v18);
      if (v13)

      if (v11)
        v20 = (void *)objc_msgSend(v11, "copy");
      else
        v20 = (void *)MEMORY[0x24BDBD1A8];
      objc_storeStrong((id *)&v15->_settings, v20);
      if (v11)

      if (v12)
        v21 = (void *)objc_msgSend(v12, "copy");
      else
        v21 = (void *)MEMORY[0x24BDBD1A8];
      objc_storeStrong((id *)&v15->_groups, v21);
      if (v12)

    }
    self = v15;

    v19 = self;
  }
  else
  {
    v19 = 0;
  }

  return v19;
}

- (NSString)propertyDescription
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessorySettingGroupMetadata name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroupMetadata settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroupMetadata groups](self, "groups");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR(", Name = %@, Settings = %@, Groups = %@"), v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v7;
}

- (id)modelsWithParentIdentifier:(id)a3
{
  id v4;
  HMDAccessorySettingGroupModel *v5;
  void *v6;
  HMDAccessorySettingGroupModel *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _BYTE v36[128];
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v5 = [HMDAccessorySettingGroupModel alloc];
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDBackingStoreModelObject initWithObjectChangeType:uuid:parentUUID:](v5, "initWithObjectChangeType:uuid:parentUUID:", 1, v6, v4);

  -[HMDAccessorySettingGroupMetadata name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroupModel setName:](v7, "setName:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithObject:", v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HMDAccessorySettingGroupMetadata settings](self, "settings");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v33;
    do
    {
      v14 = 0;
      do
      {
        if (*(_QWORD *)v33 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v32 + 1) + 8 * v14);
        -[HMDBackingStoreModelObject uuid](v7, "uuid");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v15, "modelsWithParentIdentifier:", v16);
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v17);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  -[HMDAccessorySettingGroupMetadata groups](self, "groups", 0);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v29;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v29 != v21)
          objc_enumerationMutation(v18);
        v23 = *(void **)(*((_QWORD *)&v28 + 1) + 8 * v22);
        -[HMDBackingStoreModelObject uuid](v7, "uuid");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v23, "modelsWithParentIdentifier:", v24);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "addObjectsFromArray:", v25);

        ++v22;
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v20);
  }

  v26 = (void *)objc_msgSend(v9, "copy");
  return v26;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 16, 1);
}

- (NSArray)groups
{
  return (NSArray *)objc_getProperty(self, a2, 24, 1);
}

- (NSArray)settings
{
  return (NSArray *)objc_getProperty(self, a2, 32, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_settings, 0);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

+ (id)groupsWithArrayRepresenation:(id)a3 parentKeyPath:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  v5 = a3;
  v6 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v8 = v5;
  v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v9)
  {
    v10 = v9;
    v11 = *(_QWORD *)v18;
    do
    {
      v12 = 0;
      do
      {
        if (*(_QWORD *)v18 != v11)
          objc_enumerationMutation(v8);
        v13 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v12);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
        {
          +[HMDAccessorySettingGroupMetadata groupWithDictonaryRepresentation:parentKeyPath:](HMDAccessorySettingGroupMetadata, "groupWithDictonaryRepresentation:parentKeyPath:", v13, v6, (_QWORD)v17);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          if (v14)
            objc_msgSend(v7, "addObject:", v14);

        }
        ++v12;
      }
      while (v10 != v12);
      v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v10);
  }

  v15 = (void *)objc_msgSend(v7, "copy");
  return v15;
}

+ (id)groupWithDictonaryRepresentation:(id)a3 parentKeyPath:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;

  v6 = a4;
  v7 = a3;
  objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("Key"));
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v6)
  {
    objc_msgSend(v6, "stringByAppendingFormat:", CFSTR(".%@"), v8);
    v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = v8;
  }
  v11 = v10;
  v12 = objc_alloc((Class)a1);
  objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("Settings"));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessorySettingMetadata settingsWithArrayRepresenation:parentKeyPath:](HMDAccessorySettingMetadata, "settingsWithArrayRepresenation:parentKeyPath:", v13, v11);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "hmf_arrayForKey:", CFSTR("Groups"));
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  +[HMDAccessorySettingGroupMetadata groupsWithArrayRepresenation:parentKeyPath:](HMDAccessorySettingGroupMetadata, "groupsWithArrayRepresenation:parentKeyPath:", v15, v11);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = (void *)objc_msgSend(v12, "initWithName:settings:groups:parentKeyPath:", v9, v14, v16, v6);

  return v17;
}

@end

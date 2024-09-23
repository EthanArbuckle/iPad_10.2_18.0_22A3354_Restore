@implementation HMDAccessorySettingGroup

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessorySettingGroup keyPath](self, "keyPath");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup mediaSystemSettingGroup](self, "mediaSystemSettingGroup");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "identifier");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("[HMD-Accessory-Settings-Group: %@/%@ (%@)]"), v4, v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v8;
}

- (id)fullDescription
{
  void *v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BDD16A8], "stringWithFormat:", CFSTR("\n"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE3F280], "indentation");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup description:indent:](self, "description:indent:", v3, v4);
  v5 = (void *)objc_msgSend(v3, "copy");

  return v5;
}

- (void)description:(id)a3 indent:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  void *v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  void *v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  _BYTE v34[128];
  _BYTE v35[128];
  uint64_t v36;

  v36 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingGroup name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup identifier](self, "identifier");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup groups](self, "groups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "count");
  -[HMDAccessorySettingGroup settings](self, "settings");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "count");
  -[HMDAccessorySettingGroup mediaSystemSettingGroup](self, "mediaSystemSettingGroup");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appendFormat:", CFSTR("\n %@ name = %@, identifier = %@, group = %tu, settings = %tu, media-system-settings-group = %@\n"), v7, v8, v9, v11, v13, v14);

  objc_msgSend(v7, "indentationByLevels:", 1);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v30 = 0u;
  v31 = 0u;
  v32 = 0u;
  v33 = 0u;
  -[HMDAccessorySettingGroup groups](self, "groups");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
  if (v17)
  {
    v18 = v17;
    v19 = *(_QWORD *)v31;
    do
    {
      v20 = 0;
      do
      {
        if (*(_QWORD *)v31 != v19)
          objc_enumerationMutation(v16);
        objc_msgSend(*(id *)(*((_QWORD *)&v30 + 1) + 8 * v20++), "description:indent:", v6, v15);
      }
      while (v18 != v20);
      v18 = objc_msgSend(v16, "countByEnumeratingWithState:objects:count:", &v30, v35, 16);
    }
    while (v18);
  }

  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  -[HMDAccessorySettingGroup settings](self, "settings");
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
  if (v22)
  {
    v23 = v22;
    v24 = *(_QWORD *)v27;
    do
    {
      v25 = 0;
      do
      {
        if (*(_QWORD *)v27 != v24)
          objc_enumerationMutation(v21);
        objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * v25++), "description:indent:", v6, v15);
      }
      while (v23 != v25);
      v23 = objc_msgSend(v21, "countByEnumeratingWithState:objects:count:", &v26, v34, 16);
    }
    while (v23);
  }

}

- (HMDAccessorySettingGroup)init
{
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;

  v2 = (void *)MEMORY[0x24BDBCE88];
  v3 = *MEMORY[0x24BDBCAB0];
  v4 = (void *)MEMORY[0x24BDD17C8];
  NSStringFromSelector(a2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringWithFormat:", CFSTR("%@ is unavailable"), v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "exceptionWithName:reason:userInfo:", v3, v6, 0);
  v7 = (id)objc_claimAutoreleasedReturnValue();

  objc_exception_throw(v7);
}

- (HMDAccessorySettingGroup)initWithModel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessorySettingGroup *v8;

  v4 = a3;
  objc_msgSend(v4, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "uuid");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "parentUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = -[HMDAccessorySettingGroup initWithName:identifier:parentIdentifier:](self, "initWithName:identifier:parentIdentifier:", v5, v6, v7);
  return v8;
}

- (HMDAccessorySettingGroup)initWithName:(id)a3 identifier:(id)a4 parentIdentifier:(id)a5
{
  id v9;
  id v10;
  id v11;
  HMDAccessorySettingGroup *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  NSString *keyPath;
  uint64_t v17;
  NSMutableSet *settings;
  uint64_t v19;
  NSMutableSet *groups;
  HMDAccessorySettingGroup *v21;
  objc_super v23;

  v9 = a4;
  v10 = a5;
  v11 = a3;
  if (v11)
  {
    v23.receiver = self;
    v23.super_class = (Class)HMDAccessorySettingGroup;
    v12 = -[HMDAccessorySettingGroup init](&v23, sel_init);
    if (v12)
    {
      objc_msgSend(v11, "hm_truncatedNameString");
      v13 = objc_claimAutoreleasedReturnValue();
      name = v12->_name;
      v12->_name = (NSString *)v13;

      v15 = objc_msgSend(v11, "copy");
      keyPath = v12->_keyPath;
      v12->_keyPath = (NSString *)v15;

      v12->_lock._os_unfair_lock_opaque = 0;
      objc_storeStrong((id *)&v12->_identifier, a4);
      objc_storeStrong((id *)&v12->_parentIdentifier, a5);
      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v17 = objc_claimAutoreleasedReturnValue();
      settings = v12->_settings;
      v12->_settings = (NSMutableSet *)v17;

      objc_msgSend(MEMORY[0x24BDBCEF0], "set");
      v19 = objc_claimAutoreleasedReturnValue();
      groups = v12->_groups;
      v12->_groups = (NSMutableSet *)v19;

    }
    self = v12;
    v21 = self;
  }
  else
  {
    v21 = 0;
  }

  return v21;
}

- (id)subGroupWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDAccessorySettingGroup groups](self, "groups");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __45__HMDAccessorySettingGroup_subGroupWithName___block_invoke;
  v9[3] = &unk_24E793C18;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)settingWithName:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[HMDAccessorySettingGroup settings](self, "settings");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __44__HMDAccessorySettingGroup_settingWithName___block_invoke;
  v9[3] = &unk_24E793BF0;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "na_firstObjectPassingTest:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (id)settingWithKeyPath:(id)a3
{
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(a3, "componentsSeparatedByString:", CFSTR("."));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "mutableCopy");

  -[HMDAccessorySettingGroup _settingWithKeys:](self, "_settingWithKeys:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (id)_settingWithKeys:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  uint64_t v9;
  void *v10;
  void *v11;
  HMDAccessorySettingGroup *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  int v17;
  void *v18;
  __int16 v19;
  void *v20;
  __int16 v21;
  HMDAccessorySettingGroup *v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if ((unint64_t)objc_msgSend(v4, "count") >= 2)
  {
    objc_msgSend(v4, "firstObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySettingGroup name](self, "name");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqualToString:", v6);

    if ((v8 & 1) != 0)
    {
      v9 = objc_msgSend(v4, "count");
      objc_msgSend(v4, "objectAtIndex:", 1);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9 == 2)
      {
        -[HMDAccessorySettingGroup settingWithName:](self, "settingWithName:", v10);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        -[HMDAccessorySettingGroup subGroupWithName:](self, "subGroupWithName:", v10);
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v4, "hmf_removeFirstObject");
        objc_msgSend(v15, "_settingWithKeys:", v4);
        v5 = (void *)objc_claimAutoreleasedReturnValue();

      }
    }
    else
    {
      v11 = (void *)MEMORY[0x227676638]();
      v12 = self;
      HMFGetOSLogHandle();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        HMFGetLogIdentifier();
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = 138543874;
        v18 = v14;
        v19 = 2112;
        v20 = v6;
        v21 = 2112;
        v22 = v12;
        _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Unexpected group name: %@ for group: %@", (uint8_t *)&v17, 0x20u);

      }
      objc_autoreleasePoolPop(v11);
      v5 = 0;
    }

  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[HMDAccessorySettingGroup name](self, "name");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (BOOL)isEqual:(id)a3
{
  HMDAccessorySettingGroup *v4;
  HMDAccessorySettingGroup *v5;
  HMDAccessorySettingGroup *v6;
  void *v7;
  void *v8;
  char v9;

  v4 = (HMDAccessorySettingGroup *)a3;
  if (self == v4)
  {
    v9 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v5 = v4;
    else
      v5 = 0;
    v6 = v5;
    if (v6)
    {
      -[HMDAccessorySettingGroup name](self, "name");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySettingGroup name](v6, "name");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = objc_msgSend(v7, "isEqualToString:", v8);

    }
    else
    {
      v9 = 0;
    }

  }
  return v9;
}

- (id)copyIdentical
{
  HMDAccessorySettingGroup *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessorySettingGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableSet *groups;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableSet *settings;
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
  v3 = [HMDAccessorySettingGroup alloc];
  -[HMDAccessorySettingGroup name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup identifier](self, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup parentIdentifier](self, "parentIdentifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAccessorySettingGroup initWithName:identifier:parentIdentifier:](v3, "initWithName:identifier:parentIdentifier:", v4, v5, v6);

  -[HMDAccessorySettingGroup dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup setDataSource:](v7, "setDataSource:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HMDAccessorySettingGroup groups](self, "groups");
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
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v14), "copyIdentical");
        objc_msgSend(v15, "_setParentGroup:", v7);
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

  groups = v7->_groups;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setSet:](groups, "setSet:", v17);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDAccessorySettingGroup settings](self, "settings", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23), "copyIdentical");
        objc_msgSend(v24, "setGroup:", v7);
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  settings = v7->_settings;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setSet:](settings, "setSet:", v26);

  return v7;
}

- (id)copyReplica
{
  HMDAccessorySettingGroup *v3;
  void *v4;
  void *v5;
  void *v6;
  HMDAccessorySettingGroup *v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  NSMutableSet *groups;
  void *v17;
  void *v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  void *v24;
  NSMutableSet *settings;
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
  v3 = [HMDAccessorySettingGroup alloc];
  -[HMDAccessorySettingGroup name](self, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = -[HMDAccessorySettingGroup initWithName:identifier:parentIdentifier:](v3, "initWithName:identifier:parentIdentifier:", v4, v5, v6);

  -[HMDAccessorySettingGroup dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup setDataSource:](v7, "setDataSource:", v8);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v32 = 0u;
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  -[HMDAccessorySettingGroup groups](self, "groups");
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
        v15 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v32 + 1) + 8 * v14), "copyReplica");
        objc_msgSend(v15, "_setParentGroup:", v7);
        objc_msgSend(v9, "addObject:", v15);

        ++v14;
      }
      while (v12 != v14);
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v32, v37, 16);
    }
    while (v12);
  }

  groups = v7->_groups;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v9);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setSet:](groups, "setSet:", v17);

  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v31 = 0u;
  -[HMDAccessorySettingGroup settings](self, "settings", 0);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v29;
    do
    {
      v23 = 0;
      do
      {
        if (*(_QWORD *)v29 != v22)
          objc_enumerationMutation(v19);
        v24 = (void *)objc_msgSend(*(id *)(*((_QWORD *)&v28 + 1) + 8 * v23), "copyReplica");
        objc_msgSend(v24, "setGroup:", v7);
        objc_msgSend(v18, "addObject:", v24);

        ++v23;
      }
      while (v21 != v23);
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v28, v36, 16);
    }
    while (v21);
  }

  settings = v7->_settings;
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v18);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet setSet:](settings, "setSet:", v26);

  return v7;
}

- (BOOL)isPrivateToDevice
{
  void *v3;
  char v4;
  void *v5;

  -[HMDAccessorySettingGroup name](self, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_msgSend(v3, "isEqualToString:", CFSTR("profiles")) & 1) != 0)
  {
    v4 = 1;
  }
  else
  {
    -[HMDAccessorySettingGroup name](self, "name");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v5, "isEqualToString:", CFSTR("analytics"));

  }
  return v4;
}

- (NSArray)settings
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_settings, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (id)settingWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_settings;
  v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (void)addSetting:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_settings, "containsObject:", v5) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_settings, "addObject:", v5);
      objc_msgSend(v5, "setGroup:", self);
    }
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)removeSetting:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_settings, "containsObject:", v5))
      -[NSMutableSet removeObject:](self->_settings, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (NSArray)groups
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  -[NSMutableSet allObjects](self->_groups, "allObjects");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSArray *)v4;
}

- (HMDAccessorySettingGroup)groupWithIdentifier:(id)a3
{
  id v4;
  os_unfair_lock_s *p_lock;
  NSMutableSet *v6;
  id v7;
  uint64_t v8;
  void *i;
  void *v10;
  void *v11;
  int v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  p_lock = &self->_lock;
  os_unfair_lock_lock_with_options();
  v16 = 0u;
  v17 = 0u;
  v14 = 0u;
  v15 = 0u;
  v6 = self->_groups;
  v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = *(_QWORD *)v15;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(_QWORD *)v15 != v8)
          objc_enumerationMutation(v6);
        v10 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v10, "identifier", (_QWORD)v14);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = objc_msgSend(v11, "isEqual:", v4);

        if (v12)
        {
          v7 = v10;
          goto LABEL_11;
        }
      }
      v7 = (id)-[NSMutableSet countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_11:

  os_unfair_lock_unlock(p_lock);
  return (HMDAccessorySettingGroup *)v7;
}

- (void)_reevaluateParentGroup:(id)a3
{
  id v4;

  v4 = a3;
  os_unfair_lock_lock_with_options();
  -[HMDAccessorySettingGroup _setParentGroup:](self, "_setParentGroup:", v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void)_setParentGroup:(id)a3
{
  id v4;
  NSUUID *v5;
  NSUUID *parentIdentifier;
  void *v7;
  void *v8;
  NSString *v9;
  NSString *keyPath;
  void *v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  _BYTE v32[128];
  uint64_t v33;

  v33 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (NSUUID *)objc_claimAutoreleasedReturnValue();
  parentIdentifier = self->_parentIdentifier;
  self->_parentIdentifier = v5;

  objc_msgSend(v4, "keyPath");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup name](self, "name");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "stringByAppendingFormat:", CFSTR(".%@"), v8);
  v9 = (NSString *)objc_claimAutoreleasedReturnValue();
  keyPath = self->_keyPath;
  self->_keyPath = v9;

  -[NSMutableSet allObjects](self->_groups, "allObjects");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[NSMutableSet allObjects](self->_settings, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v11;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v27 + 1) + 8 * v17++), "_reevaluateParentGroup:", self);
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v32, 16);
    }
    while (v15);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v18 = v12;
  v19 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
  if (v19)
  {
    v20 = v19;
    v21 = *(_QWORD *)v24;
    do
    {
      v22 = 0;
      do
      {
        if (*(_QWORD *)v24 != v21)
          objc_enumerationMutation(v18);
        objc_msgSend(*(id *)(*((_QWORD *)&v23 + 1) + 8 * v22++), "setGroup:", self);
      }
      while (v20 != v22);
      v20 = objc_msgSend(v18, "countByEnumeratingWithState:objects:count:", &v23, v31, 16);
    }
    while (v20);
  }

}

- (void)addGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if ((-[NSMutableSet containsObject:](self->_groups, "containsObject:", v5) & 1) == 0)
    {
      -[NSMutableSet addObject:](self->_groups, "addObject:", v5);
      objc_msgSend(v5, "_setParentGroup:", self);
    }
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (void)removeGroup:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    os_unfair_lock_lock_with_options();
    if (-[NSMutableSet containsObject:](self->_groups, "containsObject:", v5))
      -[NSMutableSet removeObject:](self->_groups, "removeObject:", v5);
    os_unfair_lock_unlock(&self->_lock);
    v4 = v5;
  }

}

- (id)logIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x24BDD17C8];
  -[HMDAccessorySettingGroup identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "UUIDString");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDAccessorySettingGroup name](self, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@/%@"), v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (HMDAccessorySettingGroup)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  HMDAccessorySettingGroup *v6;

  v4 = a3;
  v5 = (void *)MEMORY[0x227676638]();
  v6 = (HMDAccessorySettingGroup *)-[HMDAccessorySettingGroup _initWithCoder:](self, "_initWithCoder:", v4);
  objc_autoreleasePoolPop(v5);

  return v6;
}

- (id)_initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  HMDAccessorySettingGroup *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  id v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void *v22;
  void *v23;
  id *v24;
  void *v25;
  uint64_t v26;
  id v27;
  id v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  void *v34;
  void *v35;
  void *v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  _QWORD v41[4];
  id *v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  _QWORD v47[4];
  id *v48;
  _BYTE v49[128];
  _BYTE v50[128];
  uint64_t v51;

  v51 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4E10]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), *MEMORY[0x24BDD4E08]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1880], "UUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = -[HMDAccessorySettingGroup initWithName:identifier:parentIdentifier:](self, "initWithName:identifier:parentIdentifier:", v5, v6, v7);

  if (v8)
  {
    +[HMDAccessorySettingGroup supportedSettingsClasses](HMDAccessorySettingGroup, "supportedSettingsClasses");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v9, *MEMORY[0x24BDD4E18]);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    v11 = MEMORY[0x24BDAC760];
    v47[0] = MEMORY[0x24BDAC760];
    v47[1] = 3221225472;
    v47[2] = __43__HMDAccessorySettingGroup__initWithCoder___block_invoke;
    v47[3] = &unk_24E7906C8;
    v12 = v8;
    v48 = v12;
    v36 = v10;
    objc_msgSend(v10, "na_filter:", v47);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if (v13)
    {
      v14 = v13;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v13);
      v15 = objc_claimAutoreleasedReturnValue();
      v16 = v12[2];
      v12[2] = (id)v15;

      v45 = 0u;
      v46 = 0u;
      v43 = 0u;
      v44 = 0u;
      v17 = v12[2];
      v18 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
      if (v18)
      {
        v19 = v18;
        v20 = *(_QWORD *)v44;
        do
        {
          v21 = 0;
          do
          {
            if (*(_QWORD *)v44 != v20)
              objc_enumerationMutation(v17);
            objc_msgSend(*(id *)(*((_QWORD *)&v43 + 1) + 8 * v21++), "setGroup:", v12);
          }
          while (v19 != v21);
          v19 = objc_msgSend(v17, "countByEnumeratingWithState:objects:count:", &v43, v50, 16);
        }
        while (v19);
      }

      v13 = v14;
      v11 = MEMORY[0x24BDAC760];
    }
    +[HMDAccessorySettingGroup supportedGroupsClasses](HMDAccessorySettingGroup, "supportedGroupsClasses");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v22, *MEMORY[0x24BDD4E00]);
    v23 = (void *)objc_claimAutoreleasedReturnValue();

    v41[0] = v11;
    v41[1] = 3221225472;
    v41[2] = __43__HMDAccessorySettingGroup__initWithCoder___block_invoke_27;
    v41[3] = &unk_24E7906C8;
    v24 = v12;
    v42 = v24;
    objc_msgSend(v23, "na_filter:", v41);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    if (v25)
    {
      v34 = v13;
      v35 = v5;
      objc_msgSend(MEMORY[0x24BDBCEF0], "setWithArray:", v25);
      v26 = objc_claimAutoreleasedReturnValue();
      v27 = v24[3];
      v24[3] = (id)v26;

      v39 = 0u;
      v40 = 0u;
      v37 = 0u;
      v38 = 0u;
      v28 = v24[3];
      v29 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
      if (v29)
      {
        v30 = v29;
        v31 = *(_QWORD *)v38;
        do
        {
          v32 = 0;
          do
          {
            if (*(_QWORD *)v38 != v31)
              objc_enumerationMutation(v28);
            objc_msgSend(*(id *)(*((_QWORD *)&v37 + 1) + 8 * v32++), "_setParentGroup:", v24);
          }
          while (v30 != v32);
          v30 = objc_msgSend(v28, "countByEnumeratingWithState:objects:count:", &v37, v49, 16);
        }
        while (v30);
      }

      v13 = v34;
      v5 = v35;
    }

  }
  return v8;
}

- (BOOL)shouldEncodeForCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "hmd_isForNonAdminSharedUser"))
  {
    v20 = 0u;
    v21 = 0u;
    v18 = 0u;
    v19 = 0u;
    -[HMDAccessorySettingGroup settings](self, "settings");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v19;
LABEL_4:
      v9 = 0;
      while (1)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        if (-[HMDAccessorySettingGroup dataSourceShouldEncodeSetting:withCoder:](self, "dataSourceShouldEncodeSetting:withCoder:", *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v9), v4))
        {
          break;
        }
        if (v7 == ++v9)
        {
          v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
          if (v7)
            goto LABEL_4;
          goto LABEL_10;
        }
      }
    }
    else
    {
LABEL_10:

      v16 = 0u;
      v17 = 0u;
      v14 = 0u;
      v15 = 0u;
      -[HMDAccessorySettingGroup groups](self, "groups", 0);
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
      if (!v10)
      {
LABEL_21:

        goto LABEL_22;
      }
      v11 = *(_QWORD *)v15;
LABEL_12:
      v12 = 0;
      while (1)
      {
        if (*(_QWORD *)v15 != v11)
          objc_enumerationMutation(v5);
        if ((objc_msgSend(*(id *)(*((_QWORD *)&v14 + 1) + 8 * v12), "shouldEncodeForCoder:", v4) & 1) != 0)
          break;
        if (v10 == ++v12)
        {
          v10 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v14, v22, 16);
          if (v10)
            goto LABEL_12;
          goto LABEL_21;
        }
      }
    }
    LOBYTE(v10) = 1;
    goto LABEL_21;
  }
  LOBYTE(v10) = 1;
LABEL_22:

  return v10;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  id v5;

  v5 = a3;
  v4 = (void *)MEMORY[0x227676638]();
  -[HMDAccessorySettingGroup _encodeWithCoder:](self, "_encodeWithCoder:", v5);
  objc_autoreleasePoolPop(v4);

}

- (void)_encodeWithCoder:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySettingGroup *v17;
  NSObject *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  _QWORD v27[5];
  id v28;
  _QWORD v29[4];
  id v30;
  uint8_t buf[4];
  void *v32;
  __int16 v33;
  void *v34;
  __int16 v35;
  void *v36;
  uint64_t v37;

  v37 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (-[HMDAccessorySettingGroup shouldEncodeForCoder:](self, "shouldEncodeForCoder:", v4))
  {
    -[HMDAccessorySettingGroup groups](self, "groups");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = MEMORY[0x24BDAC760];
    v29[0] = MEMORY[0x24BDAC760];
    v29[1] = 3221225472;
    v29[2] = __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke;
    v29[3] = &unk_24E7906F0;
    v7 = v4;
    v30 = v7;
    objc_msgSend(v5, "hmf_objectsPassingTest:", v29);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    -[HMDAccessorySettingGroup settings](self, "settings");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v27[0] = v6;
    v27[1] = 3221225472;
    v27[2] = __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke_2;
    v27[3] = &unk_24E790718;
    v27[4] = self;
    v10 = v7;
    v28 = v10;
    objc_msgSend(v9, "na_filter:", v27);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    v12 = (void *)MEMORY[0x24BDBCF20];
    -[HMDAccessorySettingGroup settings](self, "settings");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setWithArray:", v13);
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x24BDBCF20], "setWithArray:", v11);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v18 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v26 = v8;
      v19 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySettingGroup dataSource](v17, "dataSource");
      v20 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "na_setByRemovingObjectsFromSet:", v15);
      v25 = v15;
      v21 = v14;
      v22 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543874;
      v32 = v19;
      v33 = 2112;
      v34 = v20;
      v35 = 2112;
      v36 = v22;
      _os_log_impl(&dword_2218F0000, v18, OS_LOG_TYPE_DEBUG, "%{public}@dataSource = %@, subtracted values = %@", buf, 0x20u);

      v14 = v21;
      v15 = v25;

      v8 = v26;
    }

    objc_autoreleasePoolPop(v16);
    -[HMDAccessorySettingGroup identifier](v17, "identifier");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v23, *MEMORY[0x24BDD4E08]);

    -[HMDAccessorySettingGroup name](v17, "name");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "encodeObject:forKey:", v24, *MEMORY[0x24BDD4E10]);

    objc_msgSend(v10, "encodeObject:forKey:", v11, *MEMORY[0x24BDD4E18]);
    objc_msgSend(v10, "encodeObject:forKey:", v8, *MEMORY[0x24BDD4E00]);

  }
}

- (BOOL)dataSourceShouldEncodeSetting:(id)a3 withCoder:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  char v10;
  void *v11;
  HMDAccessorySettingGroup *v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  HMDAccessorySettingGroup *v17;
  void *v18;
  int v20;
  void *v21;
  __int16 v22;
  void *v23;
  __int16 v24;
  void *v25;
  __int16 v26;
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  -[HMDAccessorySettingGroup dataSource](self, "dataSource");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = v8;
  if (v8)
  {
    v10 = objc_msgSend(v8, "shouldEncodeSetting:withCoder:forAccessorySettingGroup:", v6, v7, self);
    v11 = (void *)MEMORY[0x227676638]();
    v12 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      HMFGetLogIdentifier();
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "keyPath");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      HMFBooleanToString();
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138544130;
      v21 = v14;
      v22 = 2112;
      v23 = v9;
      v24 = 2112;
      v25 = v15;
      v26 = 2112;
      v27 = v16;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_DEBUG, "%{public}@dataSource: %@, shouldEncodeSetting = %@, %@", (uint8_t *)&v20, 0x2Au);

    }
  }
  else
  {
    v11 = (void *)MEMORY[0x227676638]();
    v17 = self;
    HMFGetOSLogHandle();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      v20 = 138543362;
      v21 = v18;
      _os_log_impl(&dword_2218F0000, v13, OS_LOG_TYPE_ERROR, "%{public}@Failed to encode settings due to no data source", (uint8_t *)&v20, 0xCu);

    }
    v10 = 0;
  }

  objc_autoreleasePoolPop(v11);
  return v10;
}

- (void)intersectSettingGroup:(id)a3 groupMetadata:(id)a4 shouldAddMissingItems:(BOOL)a5
{
  id v7;
  id v8;
  void *v9;
  HMDAccessorySettingGroup *v10;
  NSObject *v11;
  void *v12;
  void *v13;
  void *v14;
  HMDAccessorySettingGroup *v15;
  NSObject *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSMutableSet *v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  uint64_t v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t i;
  void *v35;
  void *v36;
  void *v37;
  void *v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  uint64_t v47;
  uint64_t v48;
  uint64_t v49;
  uint64_t v50;
  void *v51;
  void *v52;
  void *v53;
  void *v54;
  void *v55;
  void *v56;
  void *v57;
  void *v58;
  uint64_t v59;
  void *v60;
  void *v61;
  void *v62;
  void *v63;
  uint64_t v64;
  HMDAccessorySettingGroup *v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t k;
  void *v69;
  void *v70;
  void *v71;
  void *v72;
  uint64_t v73;
  uint64_t v74;
  uint64_t v75;
  uint64_t v76;
  void *v77;
  void *v78;
  void *v79;
  void *v80;
  id *v81;
  NSObject *v82;
  void *v83;
  uint64_t v84;
  void *v85;
  void *v86;
  void *v87;
  void *v88;
  void *v89;
  void *v90;
  void *v91;
  uint64_t v92;
  uint64_t m;
  void *v94;
  void *v95;
  void *v96;
  void *v97;
  void *v98;
  void *v99;
  void *v100;
  void *v101;
  BOOL v102;
  void *v103;
  BOOL v104;
  void *v105;
  id *v106;
  NSObject *v107;
  uint64_t v108;
  void *v109;
  void *v110;
  void *v111;
  uint64_t v112;
  uint64_t v113;
  uint64_t v114;
  uint64_t n;
  void *v116;
  void *v117;
  void *v118;
  uint64_t v119;
  void *v120;
  HMDAccessorySettingGroup *v121;
  NSObject *v122;
  void *v123;
  NSMutableSet *settings;
  uint64_t v125;
  NSMutableSet *groups;
  uint64_t v127;
  void *v128;
  void *v129;
  id *p_groups;
  HMDAccessorySettingGroup *v131;
  void *v132;
  void *v133;
  void *v134;
  NSMutableSet *v135;
  uint64_t v136;
  uint64_t v137;
  _BOOL4 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  __int128 v152;
  __int128 v153;
  __int128 v154;
  __int128 v155;
  __int128 v156;
  __int128 v157;
  __int128 v158;
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  _BYTE v167[128];
  _BYTE v168[128];
  _BYTE v169[128];
  _BYTE v170[128];
  _BYTE v171[128];
  _BYTE v172[128];
  uint8_t v173[128];
  uint8_t buf[4];
  void *v175;
  __int16 v176;
  void *v177;
  __int16 v178;
  _BOOL4 v179;
  uint64_t v180;

  v138 = a5;
  v180 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void *)MEMORY[0x227676638]();
  v10 = self;
  HMFGetOSLogHandle();
  v11 = objc_claimAutoreleasedReturnValue();
  v129 = v8;
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    HMFGetLogIdentifier();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDAccessorySettingGroup name](v10, "name");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543874;
    v175 = v12;
    v176 = 2112;
    v177 = v13;
    v178 = 1024;
    v179 = v138;
    _os_log_impl(&dword_2218F0000, v11, OS_LOG_TYPE_INFO, "%{public}@Group name is %@, intersecting. addMissing: %d", buf, 0x1Cu);

    v8 = v129;
  }

  objc_autoreleasePoolPop(v9);
  if (-[HMDAccessorySettingGroup isPrivateToDevice](v10, "isPrivateToDevice"))
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v10;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[HMDAccessorySettingGroup name](v15, "name");
      v18 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543618;
      v175 = v17;
      v176 = 2112;
      v177 = v18;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_INFO, "%{public}@Skipping private group %@", buf, 0x16u);

LABEL_90:
      v8 = v129;
      goto LABEL_91;
    }
    goto LABEL_91;
  }
  if (!v8)
  {
    v14 = (void *)MEMORY[0x227676638]();
    v15 = v10;
    HMFGetOSLogHandle();
    v16 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138543362;
      v175 = v17;
      _os_log_impl(&dword_2218F0000, v16, OS_LOG_TYPE_ERROR, "%{public}@Received metadata is nil, not intersecting", buf, 0xCu);
      goto LABEL_90;
    }
LABEL_91:

    objc_autoreleasePoolPop(v14);
    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v125 = objc_claimAutoreleasedReturnValue();
    groups = v15->_groups;
    v15->_groups = (NSMutableSet *)v125;

    objc_msgSend(MEMORY[0x24BDBCEF0], "set");
    v127 = objc_claimAutoreleasedReturnValue();
    settings = v15->_settings;
    v15->_settings = (NSMutableSet *)v127;
    goto LABEL_92;
  }
  v19 = (void *)MEMORY[0x24BDBCEF0];
  -[HMDAccessorySettingGroup groups](v10, "groups");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "hmf_objectsPassingTest:", &__block_literal_global_29_197477);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v21);
  v22 = (NSMutableSet *)objc_claimAutoreleasedReturnValue();

  v23 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v7, "groups");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "hmf_objectsPassingTest:", &__block_literal_global_30_197478);
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setWithArray:", v25);
  v26 = objc_claimAutoreleasedReturnValue();

  v134 = (void *)v26;
  -[NSMutableSet intersectSet:](v22, "intersectSet:", v26);
  p_groups = (id *)&v10->_groups;
  v135 = v22;
  objc_storeStrong((id *)&v10->_groups, v22);
  v27 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v8, "groups");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v27, "dictionaryWithCapacity:", objc_msgSend(v28, "count"));
  v29 = (void *)objc_claimAutoreleasedReturnValue();

  v165 = 0u;
  v166 = 0u;
  v163 = 0u;
  v164 = 0u;
  objc_msgSend(v8, "groups");
  v30 = (void *)objc_claimAutoreleasedReturnValue();
  v31 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v163, v173, 16);
  if (v31)
  {
    v32 = v31;
    v33 = *(_QWORD *)v164;
    do
    {
      for (i = 0; i != v32; ++i)
      {
        if (*(_QWORD *)v164 != v33)
          objc_enumerationMutation(v30);
        v35 = *(void **)(*((_QWORD *)&v163 + 1) + 8 * i);
        objc_msgSend(v35, "name");
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "setObject:forKey:", v35, v36);

      }
      v32 = objc_msgSend(v30, "countByEnumeratingWithState:objects:count:", &v163, v173, 16);
    }
    while (v32);
  }

  v161 = 0u;
  v162 = 0u;
  v159 = 0u;
  v160 = 0u;
  -[HMDAccessorySettingGroup groups](v10, "groups");
  v37 = (void *)objc_claimAutoreleasedReturnValue();
  v38 = (void *)objc_msgSend(v37, "copy");

  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v159, v172, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v160;
    do
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v160 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v159 + 1) + 8 * j);
        objc_msgSend(v43, "name");
        v44 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "objectForKey:", v44);
        v45 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v45)
          objc_msgSend(*p_groups, "removeObject:", v43);

      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v159, v172, 16);
    }
    while (v40);
  }
  v131 = v10;
  v128 = v7;

  v157 = 0u;
  v158 = 0u;
  v155 = 0u;
  v156 = 0u;
  objc_msgSend(v129, "groups");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  v47 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
  if (v47)
  {
    v48 = v47;
    v49 = *(_QWORD *)v156;
    do
    {
      v50 = 0;
      do
      {
        if (*(_QWORD *)v156 != v49)
          objc_enumerationMutation(v46);
        v51 = *(void **)(*((_QWORD *)&v155 + 1) + 8 * v50);
        v52 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v51, "name");
        v53 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v52, "predicateWithFormat:", CFSTR("name == %@"), v53);
        v54 = (void *)objc_claimAutoreleasedReturnValue();

        -[NSMutableSet filteredSetUsingPredicate:](v135, "filteredSetUsingPredicate:", v54);
        v55 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v55, "anyObject");
        v56 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v134, "filteredSetUsingPredicate:", v54);
        v57 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v57, "anyObject");
        v58 = (void *)objc_claimAutoreleasedReturnValue();

        if (v56)
        {
          objc_msgSend(v56, "intersectSettingGroup:groupMetadata:shouldAddMissingItems:", v58, v51, v138);
        }
        else if (v58 && v138 && (objc_msgSend(v58, "isPrivateToDevice") & 1) == 0)
        {
          -[HMDAccessorySettingGroup addGroup:](v131, "addGroup:", v58);
        }

        ++v50;
      }
      while (v48 != v50);
      v59 = objc_msgSend(v46, "countByEnumeratingWithState:objects:count:", &v155, v171, 16);
      v48 = v59;
    }
    while (v59);
  }

  v60 = (void *)MEMORY[0x24BDBCED8];
  objc_msgSend(v129, "settings");
  v61 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v60, "dictionaryWithCapacity:", objc_msgSend(v61, "count"));
  v62 = (void *)objc_claimAutoreleasedReturnValue();

  v153 = 0u;
  v154 = 0u;
  v151 = 0u;
  v152 = 0u;
  objc_msgSend(v129, "settings");
  v63 = (void *)objc_claimAutoreleasedReturnValue();
  v64 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
  v65 = v131;
  if (v64)
  {
    v66 = v64;
    v67 = *(_QWORD *)v152;
    do
    {
      for (k = 0; k != v66; ++k)
      {
        if (*(_QWORD *)v152 != v67)
          objc_enumerationMutation(v63);
        v69 = *(void **)(*((_QWORD *)&v151 + 1) + 8 * k);
        objc_msgSend(v69, "name");
        v70 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "setObject:forKey:", v69, v70);

      }
      v66 = objc_msgSend(v63, "countByEnumeratingWithState:objects:count:", &v151, v170, 16);
    }
    while (v66);
  }

  v149 = 0u;
  v150 = 0u;
  v147 = 0u;
  v148 = 0u;
  -[HMDAccessorySettingGroup settings](v131, "settings");
  v71 = (void *)objc_claimAutoreleasedReturnValue();
  v72 = (void *)objc_msgSend(v71, "copy");

  v73 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
  if (v73)
  {
    v74 = v73;
    v75 = *(_QWORD *)v148;
    do
    {
      v76 = 0;
      v136 = v74;
      do
      {
        if (*(_QWORD *)v148 != v75)
          objc_enumerationMutation(v72);
        v77 = *(void **)(*((_QWORD *)&v147 + 1) + 8 * v76);
        objc_msgSend(v77, "name");
        v78 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v62, "objectForKey:", v78);
        v79 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v79)
        {
          v80 = (void *)MEMORY[0x227676638]();
          v81 = v65;
          HMFGetOSLogHandle();
          v82 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v83 = v62;
            v84 = v75;
            v85 = v72;
            v86 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v175 = v86;
            v176 = 2112;
            v177 = v77;
            _os_log_impl(&dword_2218F0000, v82, OS_LOG_TYPE_INFO, "%{public}@Setting %@ does not have metadata, cannot merge", buf, 0x16u);

            v72 = v85;
            v75 = v84;
            v62 = v83;
            v74 = v136;
          }

          objc_autoreleasePoolPop(v80);
          objc_msgSend(v81[2], "removeObject:", v77);
          v65 = v131;
        }

        ++v76;
      }
      while (v74 != v76);
      v74 = objc_msgSend(v72, "countByEnumeratingWithState:objects:count:", &v147, v169, 16);
    }
    while (v74);
  }

  v87 = (void *)MEMORY[0x24BDBCEF0];
  -[HMDAccessorySettingGroup settings](v65, "settings");
  v88 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v87, "setWithArray:", v88);
  v133 = (void *)objc_claimAutoreleasedReturnValue();

  v89 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v128, "settings");
  v90 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v89, "setWithArray:", v90);
  v132 = (void *)objc_claimAutoreleasedReturnValue();

  v145 = 0u;
  v146 = 0u;
  v143 = 0u;
  v144 = 0u;
  objc_msgSend(v129, "settings");
  v91 = (void *)objc_claimAutoreleasedReturnValue();
  v137 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
  if (v137)
  {
    v92 = *(_QWORD *)v144;
    do
    {
      for (m = 0; m != v137; ++m)
      {
        if (*(_QWORD *)v144 != v92)
          objc_enumerationMutation(v91);
        v94 = *(void **)(*((_QWORD *)&v143 + 1) + 8 * m);
        v95 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v94, "name");
        v96 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v95, "predicateWithFormat:", CFSTR("name == %@"), v96);
        v97 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v133, "filteredSetUsingPredicate:", v97);
        v98 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v98, "anyObject");
        v99 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v132, "filteredSetUsingPredicate:", v97);
        v100 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v100, "anyObject");
        v101 = (void *)objc_claimAutoreleasedReturnValue();

        if (v99)
          v102 = v101 == 0;
        else
          v102 = 1;
        if (v102)
        {
          if (v101 && v138)
            -[HMDAccessorySettingGroup addSetting:](v65, "addSetting:", v101);
        }
        else
        {
          objc_msgSend(v94, "mergeStrategy");
          v103 = (void *)objc_claimAutoreleasedReturnValue();
          v104 = +[HMDAccessorySettingMergeHandler mergeFirst:second:mergeStrategy:shouldAddMissing:](HMDAccessorySettingMergeHandler, "mergeFirst:second:mergeStrategy:shouldAddMissing:", v99, v101, v103, v138);

          if (!v104)
          {
            v105 = (void *)MEMORY[0x227676638]();
            v106 = v65;
            HMFGetOSLogHandle();
            v107 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v108 = v92;
              v109 = v91;
              v110 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v175 = v110;
              v176 = 2112;
              v177 = v99;
              _os_log_impl(&dword_2218F0000, v107, OS_LOG_TYPE_INFO, "%{public}@Failed to merge setting %@, cannot merge", buf, 0x16u);

              v91 = v109;
              v92 = v108;
            }

            objc_autoreleasePoolPop(v105);
            objc_msgSend(v106[2], "removeObject:", v99);
            v65 = v131;
          }
        }

      }
      v137 = objc_msgSend(v91, "countByEnumeratingWithState:objects:count:", &v143, v168, 16);
    }
    while (v137);
  }

  v141 = 0u;
  v142 = 0u;
  v139 = 0u;
  v140 = 0u;
  -[HMDAccessorySettingGroup groups](v65, "groups");
  v111 = (void *)objc_claimAutoreleasedReturnValue();
  v112 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v139, v167, 16);
  if (v112)
  {
    v113 = v112;
    v114 = *(_QWORD *)v140;
    do
    {
      for (n = 0; n != v113; ++n)
      {
        if (*(_QWORD *)v140 != v114)
          objc_enumerationMutation(v111);
        v116 = *(void **)(*((_QWORD *)&v139 + 1) + 8 * n);
        objc_msgSend(v116, "groups");
        v117 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v117, "count"))
        {

        }
        else
        {
          objc_msgSend(v116, "settings");
          v118 = (void *)objc_claimAutoreleasedReturnValue();
          v119 = objc_msgSend(v118, "count");

          if (!v119)
          {
            v120 = (void *)MEMORY[0x227676638]();
            v121 = v65;
            HMFGetOSLogHandle();
            v122 = objc_claimAutoreleasedReturnValue();
            if (os_log_type_enabled(v122, OS_LOG_TYPE_INFO))
            {
              HMFGetLogIdentifier();
              v123 = (void *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138543618;
              v175 = v123;
              v176 = 2112;
              v177 = v116;
              _os_log_impl(&dword_2218F0000, v122, OS_LOG_TYPE_INFO, "%{public}@No subgroup or settings, removing group %@", buf, 0x16u);

            }
            objc_autoreleasePoolPop(v120);
            objc_msgSend(*p_groups, "removeObject:", v116);
            v65 = v131;
          }
        }
      }
      v113 = objc_msgSend(v111, "countByEnumeratingWithState:objects:count:", &v139, v167, 16);
    }
    while (v113);
  }

  v7 = v128;
  v8 = v129;
  settings = v135;
LABEL_92:

}

- (BOOL)compareSettingsTree:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  unint64_t v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  char v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t i;
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
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  uint64_t j;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  void *v47;
  void *v48;
  void *v49;
  void *v50;
  void *v51;
  BOOL v52;
  void *v53;
  HMDAccessorySettingGroup *v54;
  NSObject *v55;
  void *v56;
  void *v57;
  const char *v58;
  void *v60;
  HMDAccessorySettingGroup *v61;
  NSObject *v62;
  void *v63;
  void *v64;
  id obj;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  __int128 v71;
  __int128 v72;
  __int128 v73;
  _BYTE v74[128];
  uint8_t v75[128];
  uint8_t buf[4];
  void *v77;
  __int16 v78;
  void *v79;
  uint64_t v80;

  v80 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  -[HMDAccessorySettingGroup name](self, "name");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = HMFEqualObjects();

  if ((v7 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x227676638]();
    v54 = self;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    HMFGetLogIdentifier();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v56;
    v78 = 2112;
    v79 = v57;
    v58 = "%{public}@Name is not matching: %@";
    goto LABEL_27;
  }
  v8 = 0x24BDBC000uLL;
  v9 = (void *)MEMORY[0x24BDBCF20];
  -[HMDAccessorySettingGroup groups](self, "groups");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "groups");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setWithArray:", v13);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = HMFEqualObjects();

  if ((v15 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x227676638]();
    v54 = self;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    HMFGetLogIdentifier();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v56;
    v78 = 2112;
    v79 = v57;
    v58 = "%{public}@Sub-groups are not matching: %@";
    goto LABEL_27;
  }
  v16 = (void *)MEMORY[0x24BDBCF20];
  -[HMDAccessorySettingGroup settings](self, "settings");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setWithArray:", v17);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = (void *)MEMORY[0x24BDBCF20];
  objc_msgSend(v4, "settings");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setWithArray:", v20);
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = HMFEqualObjects();

  if ((v22 & 1) == 0)
  {
    v53 = (void *)MEMORY[0x227676638]();
    v54 = self;
    HMFGetOSLogHandle();
    v55 = objc_claimAutoreleasedReturnValue();
    if (!os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      goto LABEL_28;
    HMFGetLogIdentifier();
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "name");
    v57 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138543618;
    v77 = v56;
    v78 = 2112;
    v79 = v57;
    v58 = "%{public}@Sub-settings are not matching: %@";
LABEL_27:
    _os_log_impl(&dword_2218F0000, v55, OS_LOG_TYPE_INFO, v58, buf, 0x16u);

LABEL_28:
    objc_autoreleasePoolPop(v53);
LABEL_29:
    v52 = 0;
    goto LABEL_30;
  }
  v72 = 0u;
  v73 = 0u;
  v70 = 0u;
  v71 = 0u;
  -[HMDAccessorySettingGroup settings](self, "settings");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = (void *)objc_msgSend(v23, "copy");

  obj = v24;
  v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
  if (v25)
  {
    v26 = v25;
    v27 = *(_QWORD *)v71;
    while (2)
    {
      for (i = 0; i != v26; ++i)
      {
        if (*(_QWORD *)v71 != v27)
          objc_enumerationMutation(obj);
        v29 = *(void **)(*((_QWORD *)&v70 + 1) + 8 * i);
        v30 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v29, "name");
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "predicateWithFormat:", CFSTR("name == %@"), v31);
        v32 = (void *)objc_claimAutoreleasedReturnValue();

        v33 = (void *)MEMORY[0x24BDBCF20];
        objc_msgSend(v4, "settings");
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v33, "setWithArray:", v34);
        v35 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v35, "filteredSetUsingPredicate:", v32);
        v36 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v36, "anyObject");
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        if ((objc_msgSend(v29, "compareConstraints:", v37) & 1) == 0)
        {
          v60 = (void *)MEMORY[0x227676638]();
          v61 = self;
          HMFGetOSLogHandle();
          v62 = objc_claimAutoreleasedReturnValue();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
          {
            HMFGetLogIdentifier();
            v63 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v29, "name");
            v64 = (void *)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)buf = 138543618;
            v77 = v63;
            v78 = 2112;
            v79 = v64;
            _os_log_impl(&dword_2218F0000, v62, OS_LOG_TYPE_INFO, "%{public}@Constraints on settings are not matching: %@", buf, 0x16u);

          }
          objc_autoreleasePoolPop(v60);

          goto LABEL_29;
        }

        v8 = 0x24BDBC000uLL;
      }
      v26 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v70, v75, 16);
      if (v26)
        continue;
      break;
    }
  }

  v68 = 0u;
  v69 = 0u;
  v66 = 0u;
  v67 = 0u;
  -[HMDAccessorySettingGroup groups](self, "groups");
  v38 = (void *)objc_claimAutoreleasedReturnValue();
  v39 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
  if (v39)
  {
    v40 = v39;
    v41 = *(_QWORD *)v67;
    while (2)
    {
      for (j = 0; j != v40; ++j)
      {
        if (*(_QWORD *)v67 != v41)
          objc_enumerationMutation(v38);
        v43 = *(void **)(*((_QWORD *)&v66 + 1) + 8 * j);
        v44 = (void *)MEMORY[0x24BDD1758];
        objc_msgSend(v43, "name");
        v45 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v44, "predicateWithFormat:", CFSTR("name == %@"), v45);
        v46 = (void *)objc_claimAutoreleasedReturnValue();

        v47 = *(void **)(v8 + 3872);
        objc_msgSend(v4, "groups");
        v48 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v47, "setWithArray:", v48);
        v49 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v49, "filteredSetUsingPredicate:", v46);
        v50 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v50, "anyObject");
        v51 = (void *)objc_claimAutoreleasedReturnValue();
        LODWORD(v43) = objc_msgSend(v43, "compareSettingsTree:", v51);

        if (!(_DWORD)v43)
        {
          v52 = 0;
          goto LABEL_35;
        }
        v8 = 0x24BDBC000;
      }
      v40 = objc_msgSend(v38, "countByEnumeratingWithState:objects:count:", &v66, v74, 16);
      if (v40)
        continue;
      break;
    }
  }
  v52 = 1;
LABEL_35:

LABEL_30:
  return v52;
}

- (HMDAccessorySettingGroup)mediaSystemSettingGroup
{
  return (HMDAccessorySettingGroup *)objc_loadWeakRetained((id *)&self->_mediaSystemSettingGroup);
}

- (void)setMediaSystemSettingGroup:(id)a3
{
  objc_storeWeak((id *)&self->_mediaSystemSettingGroup, a3);
}

- (NSUUID)parentIdentifier
{
  return (NSUUID *)objc_getProperty(self, a2, 40, 1);
}

- (void)setParentIdentifier:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 40);
}

- (NSString)keyPath
{
  return (NSString *)objc_getProperty(self, a2, 48, 1);
}

- (HMDAccessorySettingGroupDataSource)dataSource
{
  return (HMDAccessorySettingGroupDataSource *)objc_loadWeakRetained((id *)&self->_dataSource);
}

- (void)setDataSource:(id)a3
{
  objc_storeWeak((id *)&self->_dataSource, a3);
}

- (NSUUID)identifier
{
  return (NSUUID *)objc_getProperty(self, a2, 64, 1);
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 72, 1);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_destroyWeak((id *)&self->_dataSource);
  objc_storeStrong((id *)&self->_keyPath, 0);
  objc_storeStrong((id *)&self->_parentIdentifier, 0);
  objc_destroyWeak((id *)&self->_mediaSystemSettingGroup);
  objc_storeStrong((id *)&self->_groups, 0);
  objc_storeStrong((id *)&self->_settings, 0);
}

uint64_t __86__HMDAccessorySettingGroup_intersectSettingGroup_groupMetadata_shouldAddMissingItems___block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrivateToDevice") ^ 1;
}

uint64_t __86__HMDAccessorySettingGroup_intersectSettingGroup_groupMetadata_shouldAddMissingItems___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "isPrivateToDevice") ^ 1;
}

uint64_t __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "shouldEncodeForCoder:", *(_QWORD *)(a1 + 32));
}

uint64_t __45__HMDAccessorySettingGroup__encodeWithCoder___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "dataSourceShouldEncodeSetting:withCoder:", a2, *(_QWORD *)(a1 + 40));
}

BOOL __43__HMDAccessorySettingGroup__initWithCoder___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding accessory setting", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5 != 0;
}

BOOL __43__HMDAccessorySettingGroup__initWithCoder___block_invoke_27(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  id v5;
  void *v6;
  id v7;
  NSObject *v8;
  void *v9;
  int v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  if (!v5)
  {
    v6 = (void *)MEMORY[0x227676638]();
    v7 = *(id *)(a1 + 32);
    HMFGetOSLogHandle();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      HMFGetLogIdentifier();
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = 138543362;
      v12 = v9;
      _os_log_impl(&dword_2218F0000, v8, OS_LOG_TYPE_ERROR, "%{public}@Unexpected type found while decoding accessory group", (uint8_t *)&v11, 0xCu);

    }
    objc_autoreleasePoolPop(v6);
  }

  return v5 != 0;
}

uint64_t __44__HMDAccessorySettingGroup_settingWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

uint64_t __45__HMDAccessorySettingGroup_subGroupWithName___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;

  objc_msgSend(a2, "name");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *(_QWORD *)(a1 + 32));

  return v4;
}

+ (id)logCategory
{
  if (logCategory__hmf_once_t11_197522 != -1)
    dispatch_once(&logCategory__hmf_once_t11_197522, &__block_literal_global_197523);
  return (id)logCategory__hmf_once_v12_197524;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)supportedSettingsClasses
{
  if (supportedSettingsClasses_onceToken != -1)
    dispatch_once(&supportedSettingsClasses_onceToken, &__block_literal_global_22_197521);
  return (id)supportedSettingsClasses_supportedSettingsClasses;
}

+ (id)supportedGroupsClasses
{
  if (supportedGroupsClasses_onceToken != -1)
    dispatch_once(&supportedGroupsClasses_onceToken, &__block_literal_global_25_197519);
  return (id)supportedGroupsClasses_supportedGroupsClasses;
}

void __50__HMDAccessorySettingGroup_supportedGroupsClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedGroupsClasses_supportedGroupsClasses;
  supportedGroupsClasses_supportedGroupsClasses = v2;

}

void __52__HMDAccessorySettingGroup_supportedSettingsClasses__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x24BDAC8D0];
  v0 = (void *)MEMORY[0x24BDBCF20];
  v4[0] = objc_opt_class();
  v4[1] = objc_opt_class();
  objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v4, 2);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "setWithArray:", v1);
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)supportedSettingsClasses_supportedSettingsClasses;
  supportedSettingsClasses_supportedSettingsClasses = v2;

}

void __39__HMDAccessorySettingGroup_logCategory__block_invoke()
{
  uint64_t v0;
  void *v1;

  HMFCreateOSLogHandle();
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)logCategory__hmf_once_v12_197524;
  logCategory__hmf_once_v12_197524 = v0;

}

@end

@implementation HMDAccessoryEventsGenerated

+ (id)topicMap
{
  return &unk_24E971EB0;
}

+ (id)allTopics
{
  return &unk_24E971258;
}

+ (id)indexTopicForTopic:(id)a3
{
  void *v4;
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

  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asAccessorySettingTopic");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
  {
    objc_msgSend(v5, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "homeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accessoryIndexForAccessoryUUID:homeUUID:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = 0;
  }
  else
  {
    objc_msgSend(v4, "asAccessoryTopic");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v10)
      goto LABEL_7;
    objc_msgSend(v4, "topicSuffix");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_24E972298, "objectForKeyedSubscript:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("indexes"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "objectForKeyedSubscript:", CFSTR("AppleAccessoryIndex"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v14)
    {
LABEL_7:
      v9 = 0;
      goto LABEL_8;
    }
    objc_msgSend(v10, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "homeUUID");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "accessoryIndexForAccessoryUUID:homeUUID:", v7, v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
  }

LABEL_8:
  return v9;
}

+ (id)appleMediaAccessoryTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  id v22;
  id v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x24BDAC8D0];
  v23 = a3;
  v22 = a4;
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v6 = objc_msgSend(&unk_24E972680, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v25 != v8)
          objc_enumerationMutation(&unk_24E972680);
        v10 = *(_QWORD *)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(&unk_24E972A68, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "objectForKeyedSubscript:", CFSTR("indexes"));
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("AppleAccessoryIndex"));
        v13 = (void *)objc_claimAutoreleasedReturnValue();

        if (v13)
        {
          v14 = (void *)MEMORY[0x24BE3F208];
          v15 = (void *)MEMORY[0x24BDD17C8];
          objc_msgSend(v22, "UUIDString");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "UUIDString");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v15, "stringWithFormat:", CFSTR("home.%@.accessory.%@.%@"), v16, v17, v10);
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v14, "hmf_cachedInstanceForString:", v18);
          v19 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "addObject:", v19);

        }
      }
      v7 = objc_msgSend(&unk_24E972680, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
    }
    while (v7);
  }
  v20 = (void *)objc_msgSend(v5, "copy");

  return v20;
}

+ (id)homePodAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return +[HMDAccessorySettingEventsGenerated topicsForAccessoryUUID:homeUUID:](HMDAccessorySettingEventsGenerated, "topicsForAccessoryUUID:homeUUID:", a3, a4);
}

+ (id)endpointAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return +[HMDAccessorySettingEventsGenerated topicsForAccessoryUUID:homeUUID:](HMDAccessorySettingEventsGenerated, "topicsForAccessoryUUID:homeUUID:", a3, a4);
}

+ (id)forwardingTopicsForTopics:(id)a3 residentAccessoryUUID:(id)a4 homeUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  id v12;
  id v13;
  id v14;
  void *v15;
  _QWORD v17[4];
  id v18;
  id v19;
  id v20;
  id v21;

  v8 = a4;
  v9 = a5;
  v10 = a3;
  objc_msgSend(a1, "accessoryIndexForAccessoryUUID:homeUUID:", v8, v9);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __88__HMDAccessoryEventsGenerated_forwardingTopicsForTopics_residentAccessoryUUID_homeUUID___block_invoke;
  v17[3] = &unk_24E7951F8;
  v18 = v8;
  v19 = v11;
  v20 = v9;
  v21 = a1;
  v12 = v9;
  v13 = v11;
  v14 = v8;
  objc_msgSend(v10, "na_map:", v17);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

+ (id)accessoryIndexForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;

  v5 = (void *)MEMORY[0x24BDD17C8];
  v6 = a3;
  objc_msgSend(a4, "UUIDString");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringWithFormat:", CFSTR("index.home.%@.accessory.%@.info"), v7, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (BOOL)topicSuffix:(id)a3 isPartOfIndex:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(&unk_24E973238, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("indexes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8 != 0;
}

+ (id)topicsRemovingAccessoryTopics:(id)a3 accessoryUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v5 = a4;
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __75__HMDAccessoryEventsGenerated_topicsRemovingAccessoryTopics_accessoryUUID___block_invoke;
  v9[3] = &unk_24E795220;
  v10 = v5;
  v6 = v5;
  objc_msgSend(a3, "na_filter:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

uint64_t __75__HMDAccessoryEventsGenerated_topicsRemovingAccessoryTopics_accessoryUUID___block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;

  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    v5 = *(void **)(a1 + 32);
    objc_msgSend(v3, "accessoryUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "hmf_isEqualToUUID:", v6) ^ 1;

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

id __88__HMDAccessoryEventsGenerated_forwardingTopicsForTopics_residentAccessoryUUID_homeUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  uint64_t v10;
  void *v11;
  void *v12;
  int v13;
  id v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  uint64_t v23;

  v3 = a2;
  objc_msgSend(MEMORY[0x24BDD7640], "decodeTopic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "asIndexAccessoryTopic");
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = (void *)v5;
    objc_msgSend(v4, "accessoryUUID");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v8)
    {
      v9 = v3;
LABEL_7:
      v14 = v9;
      v15 = 0;
      goto LABEL_17;
    }
  }
  objc_msgSend(v4, "asAccessorySettingTopic");
  v10 = objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)v10;
    objc_msgSend(v4, "accessoryUUID");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = objc_msgSend(v12, "isEqual:", *(_QWORD *)(a1 + 32));

    if (v13)
    {
      v9 = *(id *)(a1 + 40);
      goto LABEL_7;
    }
  }
  objc_msgSend(v4, "asAccessoryTopic");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15
    && (objc_msgSend(v4, "accessoryUUID"),
        v16 = (void *)objc_claimAutoreleasedReturnValue(),
        v17 = objc_msgSend(v16, "isEqual:", *(_QWORD *)(a1 + 32)),
        v16,
        v17))
  {
    objc_msgSend(v4, "topicSuffix");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(&unk_24E972E50, "objectForKeyedSubscript:", v18);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "objectForKeyedSubscript:", CFSTR("indexes"));
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("AppleAccessoryIndex"));
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v22 = v3;
    if (v21)
      v22 = *(void **)(a1 + 40);
    v14 = v22;

  }
  else
  {
    objc_msgSend(v4, "asIndexHomeTopic");
    v23 = objc_claimAutoreleasedReturnValue();
    if (!v23)
    {
      v14 = 0;
      goto LABEL_17;
    }
    v18 = (void *)v23;
    objc_msgSend(*(id *)(a1 + 56), "accessoryIndexForAccessoryUUID:homeUUID:", *(_QWORD *)(a1 + 32), *(_QWORD *)(a1 + 48));
    v14 = (id)objc_claimAutoreleasedReturnValue();
  }

LABEL_17:
  return v14;
}

@end

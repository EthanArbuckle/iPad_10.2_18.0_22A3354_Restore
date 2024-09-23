@implementation HMDAccessoryEventsGenerated

+ (id)topicMap
{
  return &unk_1E8B35F48;
}

+ (id)allTopics
{
  return &unk_1E8B32148;
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

  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", a3);
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
    objc_msgSend(&unk_1E8B36330, "objectForKeyedSubscript:", v11);
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
  return (id)MEMORY[0x1E0C9AA60];
}

+ (id)homePodAccessorySettingsTopicsForAccessoryUUID:(id)a3 homeUUID:(id)a4
{
  return (id)MEMORY[0x1E0C9AA60];
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
  v17[0] = MEMORY[0x1E0C809B0];
  v17[1] = 3221225472;
  v17[2] = __88__HMDAccessoryEventsGenerated_forwardingTopicsForTopics_residentAccessoryUUID_homeUUID___block_invoke;
  v17[3] = &unk_1E89B2008;
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

  v5 = (void *)MEMORY[0x1E0CB3940];
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
  objc_msgSend(&unk_1E8B36B00, "objectForKeyedSubscript:", a3);
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
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __75__HMDAccessoryEventsGenerated_topicsRemovingAccessoryTopics_accessoryUUID___block_invoke;
  v9[3] = &unk_1E89B9860;
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

  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", a2);
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
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v3);
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
    objc_msgSend(&unk_1E8B36718, "objectForKeyedSubscript:", v18);
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

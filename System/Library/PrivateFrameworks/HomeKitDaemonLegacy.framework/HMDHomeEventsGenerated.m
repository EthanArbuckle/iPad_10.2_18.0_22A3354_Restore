@implementation HMDHomeEventsGenerated

+ (id)topicMap
{
  return &unk_1E8B35390;
}

+ (id)allTopics
{
  return &unk_1E8B31CC8;
}

+ (id)indexTopicForTopicSuffix:(id)a3 indexName:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;

  v5 = a4;
  objc_msgSend(&unk_1E8B35408, "objectForKeyedSubscript:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "objectForKeyedSubscript:", CFSTR("indexes"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "objectForKeyedSubscript:", v5);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

+ (id)homeInfoIndexForHomeUUID:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("index.home.%@.info"), a3);
}

+ (id)clientIndexToHomeTopicsForHomeUUID:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v3 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a3, "UUIDString");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("index.home.%@.info"), v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v8[0] = v5;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v8, 1);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)forwardingTopicsWithTopics:(id)a3 forHomeRouterWithUUID:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v15;
  uint64_t v16;
  id (*v17)(uint64_t, void *);
  void *v18;
  id v19;
  id v20;

  v6 = a3;
  v7 = a4;
  v8 = (void *)MEMORY[0x1D17BA0A0]();
  v9 = (void *)MEMORY[0x1E0C99E60];
  v15 = MEMORY[0x1E0C809B0];
  v16 = 3221225472;
  v17 = __75__HMDHomeEventsGenerated_forwardingTopicsWithTopics_forHomeRouterWithUUID___block_invoke;
  v18 = &unk_1E89A6060;
  v10 = v7;
  v19 = v10;
  v20 = a1;
  objc_msgSend(v6, "na_flatMap:", &v15);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setWithArray:", v11, v15, v16, v17, v18);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "allObjects");
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v8);
  return v13;
}

+ (id)upstreamClientTopicForTopic:(id)a3
{
  void *v3;
  void *v4;
  void *v5;
  __CFString *v6;
  uint64_t v8;
  void *v9;
  void *v10;
  BOOL v11;
  void *v12;
  void *v13;

  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "asAccessorySettingTopic");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v6 = CFSTR("index.xpc.client.spi.settings");
    }
    else
    {
      objc_msgSend(v4, "asAccessoryTopic");
      v8 = objc_claimAutoreleasedReturnValue();
      if (v8
        && (v9 = (void *)v8,
            objc_msgSend(v4, "topicSuffix"),
            v10 = (void *)objc_claimAutoreleasedReturnValue(),
            v11 = +[HMDAccessoryEventsGenerated topicSuffix:isPartOfIndex:](HMDAccessoryEventsGenerated, "topicSuffix:isPartOfIndex:", v10, CFSTR("SpiIndex")), v10, v9, v11))
      {
        v6 = CFSTR("index.xpc.client.spi");
      }
      else
      {
        objc_msgSend(v4, "asHomeEventTopic");
        v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v6)
        {
          objc_msgSend(&unk_1E8B354F8, "objectForKeyedSubscript:", CFSTR("indexes"));
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "objectForKeyedSubscript:", CFSTR("SpiIndex"));
          v13 = (void *)objc_claimAutoreleasedReturnValue();

          if (v13)
            v6 = CFSTR("index.xpc.client.spi");
          else
            v6 = 0;
        }
      }
    }
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

+ (id)upstreamHomeTopicForTopic:(id)a3 homeUUID:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  int v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  uint64_t v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;

  v6 = a4;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", a3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (!v7)
    goto LABEL_9;
  objc_msgSend(v7, "homeUUID");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "hmf_isEqualToUUID:", v6);

  if (!v10)
    goto LABEL_9;
  objc_msgSend(v8, "asAccessorySettingTopic");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (v11)
    goto LABEL_4;
  objc_msgSend(v8, "asAccessoryTopic");
  v13 = objc_claimAutoreleasedReturnValue();
  if (v13)
  {
    v14 = (void *)v13;
    objc_msgSend(v8, "topicSuffix");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = +[HMDAccessoryEventsGenerated topicSuffix:isPartOfIndex:](HMDAccessoryEventsGenerated, "topicSuffix:isPartOfIndex:", v15, CFSTR("HomeIndex"));

    if (v16)
      goto LABEL_4;
  }
  objc_msgSend(v8, "asHomeEventTopic");
  v17 = objc_claimAutoreleasedReturnValue();
  if (!v17)
    goto LABEL_9;
  v18 = (void *)v17;
  objc_msgSend(v8, "topicSuffix");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E8B35570, "objectForKeyedSubscript:", v19);
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "objectForKeyedSubscript:", CFSTR("indexes"));
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v21, "objectForKeyedSubscript:", CFSTR("HomeIndex"));
  v22 = (void *)objc_claimAutoreleasedReturnValue();

  if (v22)
  {
LABEL_4:
    objc_msgSend(a1, "homeInfoIndexForHomeUUID:", v6);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_9:
    v12 = 0;
  }

  return v12;
}

+ (id)upstreamHomeAndAccessoryTopicsForTopic:(id)a3 homeUUID:(id)a4 accessoryUUID:(id)a5
{
  id v8;
  id v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  int v17;
  void *v18;
  void *v19;
  uint64_t v21;
  void *v22;
  void *v23;
  _BOOL4 v24;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "upstreamHomeTopicForTopic:homeUUID:", v8, v9);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (v12)
    objc_msgSend(v11, "addObject:", v12);
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v8);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = v13;
  if (v13)
  {
    objc_msgSend(v13, "homeUUID");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v15, "hmf_isEqualToUUID:", v9))
    {
      objc_msgSend(v14, "accessoryUUID");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      v17 = objc_msgSend(v16, "hmf_isEqualToUUID:", v10);

      if (!v17)
        goto LABEL_9;
      objc_msgSend(v14, "asAccessorySettingTopic");
      v18 = (void *)objc_claimAutoreleasedReturnValue();

      if (!v18)
      {
        objc_msgSend(v14, "asAccessoryTopic");
        v21 = objc_claimAutoreleasedReturnValue();
        if (!v21)
          goto LABEL_9;
        v22 = (void *)v21;
        objc_msgSend(v14, "topicSuffix");
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        v24 = +[HMDAccessoryEventsGenerated topicSuffix:isPartOfIndex:](HMDAccessoryEventsGenerated, "topicSuffix:isPartOfIndex:", v23, CFSTR("AppleAccessoryIndex"));

        if (!v24)
          goto LABEL_9;
      }
      +[HMDAccessoryEventsGenerated accessoryIndexForAccessoryUUID:homeUUID:](HMDAccessoryEventsGenerated, "accessoryIndexForAccessoryUUID:homeUUID:", v10, v9);
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "addObject:", v15);
    }

  }
LABEL_9:
  v19 = (void *)objc_msgSend(v11, "copy");

  return v19;
}

+ (id)upstreamTopicsForTopic:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "accessoryUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  if (v7
    && (v8 = (void *)v7,
        objc_msgSend(v6, "homeUUID"),
        v9 = (void *)objc_claimAutoreleasedReturnValue(),
        v9,
        v8,
        v9))
  {
    objc_msgSend(v6, "homeUUID");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "accessoryUUID");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "upstreamHomeAndAccessoryTopicsForTopic:homeUUID:accessoryUUID:", v4, v10, v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "unionSet:", v12);

  }
  else
  {
    objc_msgSend(v6, "homeUUID");
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v13)
      goto LABEL_8;
    objc_msgSend(v6, "homeUUID");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "upstreamHomeTopicForTopic:homeUUID:", v4, v14);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    if (v10)
      objc_msgSend(v5, "addObject:", v10);
  }

LABEL_8:
  objc_msgSend(a1, "upstreamClientTopicForTopic:", v4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  if (v15)
    objc_msgSend(v5, "addObject:", v15);
  v16 = (void *)objc_msgSend(v5, "copy");

  return v16;
}

+ (id)accessorySettingsTopicsForAccessory:(id)a3 homeUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;
  void *v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v5;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v10 = v9;
  else
    v10 = 0;
  v11 = v10;

  if (v8)
  {
    objc_msgSend(v8, "category");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "categoryType");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0CB7A58]) & 1) != 0)
    {

LABEL_14:
      objc_msgSend(v8, "uuid");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      +[HMDAccessoryEventsGenerated homePodAccessorySettingsTopicsForAccessoryUUID:homeUUID:](HMDAccessoryEventsGenerated, "homePodAccessorySettingsTopicsForAccessoryUUID:homeUUID:", v14, v6);
      v15 = objc_claimAutoreleasedReturnValue();
      goto LABEL_15;
    }
    v16 = objc_msgSend(v8, "homePodVariant");

    if (v16)
      goto LABEL_14;
LABEL_16:
    v17 = (void *)MEMORY[0x1E0C9AA60];
    goto LABEL_17;
  }
  if (!v11 || !objc_msgSend(v11, "hasSiriEndpointService"))
    goto LABEL_16;
  objc_msgSend(v11, "uuid");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  +[HMDAccessoryEventsGenerated endpointAccessorySettingsTopicsForAccessoryUUID:homeUUID:](HMDAccessoryEventsGenerated, "endpointAccessorySettingsTopicsForAccessoryUUID:homeUUID:", v14, v6);
  v15 = objc_claimAutoreleasedReturnValue();
LABEL_15:
  v17 = (void *)v15;

LABEL_17:
  return v17;
}

+ (id)accessoryTopicsForAccessory:(id)a3 homeUUID:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v7 = v5;
  else
    v7 = 0;
  v8 = v7;
  v9 = v8;
  if (v8)
  {
    objc_msgSend(v8, "uuid");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[HMDAccessoryEventsGenerated appleMediaAccessoryTopicsForAccessoryUUID:homeUUID:](HMDAccessoryEventsGenerated, "appleMediaAccessoryTopicsForAccessoryUUID:homeUUID:", v10, v6);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v11 = (void *)MEMORY[0x1E0C9AA60];
  }

  return v11;
}

+ (id)expandedTopicsWithTopics:(id)a3 homeManager:(id)a4
{
  id v6;
  void *v7;
  id v8;
  void *v9;
  id v10;
  id v11;
  void *v12;
  _QWORD v14[4];
  id v15;
  id v16;
  id v17;

  v6 = a4;
  v7 = (void *)MEMORY[0x1E0C99E20];
  v8 = a3;
  objc_msgSend(v7, "set");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = MEMORY[0x1E0C809B0];
  v14[1] = 3221225472;
  v14[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke;
  v14[3] = &unk_1E89A60D8;
  v15 = v6;
  v16 = v9;
  v17 = a1;
  v10 = v9;
  v11 = v6;
  objc_msgSend(v8, "na_each:", v14);

  objc_msgSend(v10, "allObjects");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  int v9;
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
  void *v20;
  uint64_t v21;
  void *v22;
  void *v23;
  int v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  id v29;
  uint64_t v30;
  id v31;
  uint64_t v32;
  uint64_t v33;
  uint64_t v34;
  uint64_t i;
  uint64_t v36;
  void *v37;
  void *v38;
  void *v39;
  void *v40;
  void *v41;
  void *v42;
  void *v43;
  void *v44;
  void *v45;
  void *v46;
  id v47;
  uint64_t v48;
  void *v49;
  void *v50;
  void *v51;
  id v52;
  uint64_t v53;
  void *v54;
  void *v55;
  id v56;
  uint64_t v57;
  _QWORD v58[4];
  id v59;
  uint64_t v60;
  _QWORD v61[4];
  id v62;
  uint64_t v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  _QWORD v68[4];
  id v69;
  id v70;
  uint64_t v71;
  _BYTE v72[128];
  uint64_t v73;

  v73 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isIndexTopic"))
  {
    objc_msgSend(v5, "asIndexAccessoryTopic");
    v6 = objc_claimAutoreleasedReturnValue();
    if (v6
      && (v7 = (void *)v6,
          objc_msgSend(v5, "topicSuffix"),
          v8 = (void *)objc_claimAutoreleasedReturnValue(),
          v9 = objc_msgSend(v8, "isEqualToString:", CFSTR("info")),
          v8,
          v7,
          v9))
    {
      v10 = *(void **)(a1 + 32);
      objc_msgSend(v5, "accessoryUUID");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "accessoryWithUUID:", v11);
      v12 = (void *)objc_claimAutoreleasedReturnValue();

      if (v12)
      {
        v13 = *(void **)(a1 + 40);
        v14 = *(void **)(a1 + 48);
        objc_msgSend(v5, "homeUUID");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v14, "accessoryTopicsForAccessory:homeUUID:", v12, v15);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v13, "addObjectsFromArray:", v16);

        v17 = *(void **)(a1 + 40);
        v18 = *(void **)(a1 + 48);
        objc_msgSend(v5, "homeUUID");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "accessorySettingsTopicsForAccessory:homeUUID:", v12, v19);
        v20 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v17, "addObjectsFromArray:", v20);

      }
    }
    else
    {
      objc_msgSend(v5, "asIndexHomeTopic");
      v21 = objc_claimAutoreleasedReturnValue();
      if (!v21
        || (v22 = (void *)v21,
            objc_msgSend(v5, "topicSuffix"),
            v23 = (void *)objc_claimAutoreleasedReturnValue(),
            v24 = objc_msgSend(v23, "isEqualToString:", CFSTR("info")),
            v23,
            v22,
            !v24))
      {
        if (objc_msgSend(v3, "isEqualToString:", CFSTR("index.xpc.client.spi")))
        {
          objc_msgSend(*(id *)(a1 + 32), "homes");
          v45 = (void *)objc_claimAutoreleasedReturnValue();
          v46 = (void *)objc_msgSend(v45, "copy");
          v61[0] = MEMORY[0x1E0C809B0];
          v61[1] = 3221225472;
          v61[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_3;
          v61[3] = &unk_1E89A60B0;
          v47 = *(id *)(a1 + 40);
          v48 = *(_QWORD *)(a1 + 48);
          v62 = v47;
          v63 = v48;
          objc_msgSend(v46, "na_each:", v61);

          v49 = v62;
        }
        else
        {
          if (!objc_msgSend(v3, "isEqualToString:", CFSTR("index.xpc.client.spi.settings")))
            goto LABEL_9;
          objc_msgSend(*(id *)(a1 + 32), "homes");
          v50 = (void *)objc_claimAutoreleasedReturnValue();
          v51 = (void *)objc_msgSend(v50, "copy");
          v58[0] = MEMORY[0x1E0C809B0];
          v58[1] = 3221225472;
          v58[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_5;
          v58[3] = &unk_1E89A60B0;
          v52 = *(id *)(a1 + 40);
          v53 = *(_QWORD *)(a1 + 48);
          v59 = v52;
          v60 = v53;
          objc_msgSend(v51, "na_each:", v58);

          v49 = v59;
        }

        goto LABEL_9;
      }
      v56 = v3;
      v25 = *(void **)(a1 + 32);
      objc_msgSend(v5, "homeUUID");
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "_homeWithUUID:", v26);
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "accessories");
      v28 = (void *)objc_claimAutoreleasedReturnValue();

      v68[0] = MEMORY[0x1E0C809B0];
      v68[1] = 3221225472;
      v68[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_2;
      v68[3] = &unk_1E89A6088;
      v29 = *(id *)(a1 + 40);
      v57 = a1;
      v30 = *(_QWORD *)(a1 + 48);
      v69 = v29;
      v71 = v30;
      v55 = v5;
      v31 = v5;
      v70 = v31;
      v54 = v28;
      objc_msgSend(v28, "na_each:", v68);
      v66 = 0u;
      v67 = 0u;
      v64 = 0u;
      v65 = 0u;
      v32 = objc_msgSend(&unk_1E8B355E8, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
      if (v32)
      {
        v33 = v32;
        v34 = *(_QWORD *)v65;
        do
        {
          for (i = 0; i != v33; ++i)
          {
            if (*(_QWORD *)v65 != v34)
              objc_enumerationMutation(&unk_1E8B355E8);
            v36 = *(_QWORD *)(*((_QWORD *)&v64 + 1) + 8 * i);
            objc_msgSend(&unk_1E8B35660, "objectForKeyedSubscript:", v36);
            v37 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v37, "objectForKeyedSubscript:", CFSTR("indexes"));
            v38 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v38, "objectForKeyedSubscript:", CFSTR("HomeIndex"));
            v39 = (void *)objc_claimAutoreleasedReturnValue();

            if (v39)
            {
              v40 = *(void **)(v57 + 40);
              v41 = (void *)MEMORY[0x1E0CB3940];
              objc_msgSend(v31, "homeUUID");
              v42 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v42, "UUIDString");
              v43 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v41, "stringWithFormat:", CFSTR("home.%@.%@"), v43, v36);
              v44 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v40, "addObject:", v44);

            }
          }
          v33 = objc_msgSend(&unk_1E8B355E8, "countByEnumeratingWithState:objects:count:", &v64, v72, 16);
        }
        while (v33);
      }

      v5 = v55;
      v3 = v56;
    }
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "addObject:", v3);
  }
LABEL_9:

}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  void *v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;

  v4 = *(void **)(a1 + 40);
  v3 = *(void **)(a1 + 48);
  v5 = *(void **)(a1 + 32);
  v6 = a2;
  objc_msgSend(v4, "homeUUID");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "accessoryTopicsForAccessory:homeUUID:", v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addObjectsFromArray:", v8);

  v9 = *(void **)(a1 + 48);
  v10 = *(void **)(a1 + 32);
  objc_msgSend(*(id *)(a1 + 40), "homeUUID");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "accessorySettingsTopicsForAccessory:homeUUID:", v6, v12);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v10, "addObjectsFromArray:", v11);
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_4;
  v9[3] = &unk_1E89A6088;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v7;
  v10 = v6;
  v8 = v3;
  objc_msgSend(v5, "na_each:", v9);

}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_5(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  uint64_t v7;
  id v8;
  _QWORD v9[4];
  id v10;
  id v11;
  uint64_t v12;

  v3 = a2;
  objc_msgSend(v3, "accessories");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = (void *)objc_msgSend(v4, "copy");
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_6;
  v9[3] = &unk_1E89A6088;
  v6 = *(id *)(a1 + 32);
  v7 = *(_QWORD *)(a1 + 40);
  v11 = v3;
  v12 = v7;
  v10 = v6;
  v8 = v3;
  objc_msgSend(v5, "na_each:", v9);

}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_6(_QWORD *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)a1[5];
  v2 = (void *)a1[6];
  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v3, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessorySettingsTopicsForAccessory:homeUUID:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", v6);
}

void __63__HMDHomeEventsGenerated_expandedTopicsWithTopics_homeManager___block_invoke_4(_QWORD *a1, void *a2)
{
  void *v2;
  void *v3;
  void *v4;
  id v5;
  void *v6;
  id v7;

  v3 = (void *)a1[5];
  v2 = (void *)a1[6];
  v4 = (void *)a1[4];
  v5 = a2;
  objc_msgSend(v3, "uuid");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "accessoryTopicsForAccessory:homeUUID:", v5, v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "addObjectsFromArray:", v6);
}

id __75__HMDHomeEventsGenerated_forwardingTopicsWithTopics_forHomeRouterWithUUID___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _BOOL4 v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void **v20;
  id v22;
  void *v23;
  void *v24;
  _QWORD v25[2];

  v25[1] = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(MEMORY[0x1E0CBA4C8], "decodeTopic:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "homeUUID");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "hmf_isEqualToUUID:", *(_QWORD *)(a1 + 32));

    if (v7)
    {
      objc_msgSend(v5, "asAccessorySettingTopic");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (v8)
      {
        objc_msgSend(*(id *)(a1 + 40), "homeInfoIndexForHomeUUID:", *(_QWORD *)(a1 + 32));
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v25[0] = v9;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v25, 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_18:

        goto LABEL_19;
      }
      objc_msgSend(v5, "asAccessoryTopic");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (v9)
      {
        objc_msgSend(v5, "topicSuffix");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        v12 = +[HMDAccessoryEventsGenerated topicSuffix:isPartOfIndex:](HMDAccessoryEventsGenerated, "topicSuffix:isPartOfIndex:", v11, CFSTR("HomeIndex"));

        if (v12)
        {
          objc_msgSend(*(id *)(a1 + 40), "homeInfoIndexForHomeUUID:", *(_QWORD *)(a1 + 32));
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v13;
          objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v24, 1);
          v10 = (void *)objc_claimAutoreleasedReturnValue();

          goto LABEL_18;
        }
        v14 = 0;
      }
      else
      {
        objc_msgSend(v5, "asHomeEventTopic");
        v14 = objc_claimAutoreleasedReturnValue();
        if (v14)
        {
          objc_msgSend(v5, "topicSuffix");
          v15 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(&unk_1E8B35480, "objectForKeyedSubscript:", v15);
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "objectForKeyedSubscript:", CFSTR("indexes"));
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "objectForKeyedSubscript:", CFSTR("HomeIndex"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (v18)
          {
            objc_msgSend(*(id *)(a1 + 40), "homeInfoIndexForHomeUUID:", *(_QWORD *)(a1 + 32));
            v9 = (void *)objc_claimAutoreleasedReturnValue();
            v23 = v9;
            v19 = (void *)MEMORY[0x1E0C99D20];
            v20 = &v23;
LABEL_17:
            objc_msgSend(v19, "arrayWithObjects:count:", v20, 1);
            v10 = (void *)objc_claimAutoreleasedReturnValue();

            v9 = (void *)v14;
            goto LABEL_18;
          }
        }
      }
      v22 = v3;
      v19 = (void *)MEMORY[0x1E0C99D20];
      v20 = &v22;
      goto LABEL_17;
    }
  }
  if (objc_msgSend(v3, "isEqualToString:", CFSTR("index.xpc.client.spi"))
    || objc_msgSend(v3, "isEqualToString:", CFSTR("index.xpc.client.spi.settings")))
  {
    objc_msgSend(*(id *)(a1 + 40), "clientIndexToHomeTopicsForHomeUUID:", *(_QWORD *)(a1 + 32));
    v10 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v10 = 0;
  }
LABEL_19:

  return v10;
}

@end

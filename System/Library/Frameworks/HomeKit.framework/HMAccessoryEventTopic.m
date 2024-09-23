@implementation HMAccessoryEventTopic

+ (unint64_t)suffixIDFromTopicSuffix:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(&unk_1E3B2FFF8, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topicID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedLongLongValue");
  else
    v5 = 0;

  return v5;
}

+ (id)topicFromSuffixID:(unint64_t)a3 homeUUID:(id)a4 accessoryUUID:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;

  v7 = a4;
  v8 = a5;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E3B30020, "objectForKeyedSubscript:", v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    v11 = (void *)MEMORY[0x1E0D28630];
    v12 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v7, "UUIDString");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "UUIDString");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "stringWithFormat:", CFSTR("home.%@.accessory.%@.%@"), v13, v14, v10);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "hmf_cachedInstanceForString:", v15);
    v16 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v16 = 0;
  }

  return v16;
}

+ (id)topicPrefixWithHomeUUID:(id)a3 accessoryUUID:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;

  v5 = (void *)MEMORY[0x1E0D28630];
  v6 = (void *)MEMORY[0x1E0CB3940];
  v7 = a4;
  objc_msgSend(a3, "UUIDString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "UUIDString");
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "stringWithFormat:", CFSTR("home.%@.accessory.%@."), v8, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hmf_cachedInstanceForString:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (id)filterTopicsReplacingWithIndex:(id)a3
{
  id v3;
  void *v4;
  void *v5;

  v3 = a3;
  v4 = (void *)MEMORY[0x1A1AC1AAC]();
  objc_msgSend(v3, "na_map:", &__block_literal_global_14929);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_autoreleasePoolPop(v4);

  return v5;
}

__CFString *__56__HMAccessoryEventTopic_filterTopicsReplacingWithIndex___block_invoke(uint64_t a1, void *a2)
{
  __CFString *v2;
  void *v3;
  void *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __CFString *v11;

  v2 = a2;
  +[HMEventTopicHelper decodeTopic:](HMEventTopicHelper, "decodeTopic:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "asAccessorySettingTopic");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    v5 = CFSTR("index.xpc.client.spi.settings");
  }
  else
  {
    objc_msgSend(v3, "asAccessoryTopic");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v3, "topicSuffix");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(&unk_1E3B303B8, "objectForKeyedSubscript:", v7);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("indexes"));
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "objectForKeyedSubscript:", CFSTR("SpiIndex"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = CFSTR("index.xpc.client.spi");
      if (!v10)
        v11 = v2;
      v5 = v11;

    }
    else
    {
      v5 = v2;
    }
  }

  return v5;
}

@end

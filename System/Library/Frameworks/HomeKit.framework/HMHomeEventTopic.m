@implementation HMHomeEventTopic

+ (unint64_t)suffixIDFromTopicSuffix:(id)a3
{
  void *v3;
  void *v4;
  unint64_t v5;

  objc_msgSend(&unk_1E3B2FC10, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("topicID"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
    v5 = objc_msgSend(v4, "unsignedLongLongValue");
  else
    v5 = 0;

  return v5;
}

+ (id)topicFromSuffixID:(unint64_t)a3 homeUUID:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%llu"), a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(&unk_1E3B2FC38, "objectForKeyedSubscript:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    v8 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(v5, "UUIDString");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "stringWithFormat:", CFSTR("home.%@.%@"), v9, v7);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v10 = 0;
  }

  return v10;
}

@end

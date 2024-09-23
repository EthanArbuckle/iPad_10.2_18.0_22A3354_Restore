@implementation HMParsedEventTopic

- (HMParsedEventTopic)initWithTopic:(id)a3
{
  id v5;
  HMParsedEventTopic *v6;
  HMParsedEventTopic *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)HMParsedEventTopic;
  v6 = -[HMParsedEventTopic init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_originalTopic, a3);

  return v7;
}

- (id)asAccessoryTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  void *v5;

  if (!-[HMParsedEventTopic isIndexTopic](self, "isIndexTopic"))
  {
    -[HMParsedEventTopic accessoryUUID](self, "accessoryUUID");
    v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
    if (!v3)
      return v3;
    v4 = v3;
    -[HMParsedEventTopic homeUUID](self, "homeUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v3 = self;
      return v3;
    }
  }
  v3 = 0;
  return v3;
}

- (id)asAccessorySettingTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  void *v5;

  -[HMParsedEventTopic asAccessoryTopic](self, "asAccessoryTopic");
  v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HMParsedEventTopic accessorySettingKeyPath](self, "accessorySettingKeyPath");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      v3 = self;
    else
      v3 = 0;
  }
  return v3;
}

- (id)asMediaSystemSettingTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[HMParsedEventTopic isIndexTopic](self, "isIndexTopic"))
    goto LABEL_7;
  -[HMParsedEventTopic homeUUID](self, "homeUUID");
  v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HMParsedEventTopic mediaSystemUUID](self, "mediaSystemUUID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HMParsedEventTopic mediaSystemSettingKeyPath](self, "mediaSystemSettingKeyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v3 = self;
        return v3;
      }
    }
    else
    {

    }
LABEL_7:
    v3 = 0;
  }
  return v3;
}

- (id)asMediaGroupSettingTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  if (-[HMParsedEventTopic isIndexTopic](self, "isIndexTopic"))
    goto LABEL_7;
  -[HMParsedEventTopic homeUUID](self, "homeUUID");
  v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HMParsedEventTopic mediaGroupUUID](self, "mediaGroupUUID");
    v5 = objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = (void *)v5;
      -[HMParsedEventTopic mediaGroupSettingKeyPath](self, "mediaGroupSettingKeyPath");
      v7 = (void *)objc_claimAutoreleasedReturnValue();

      if (v7)
      {
        v3 = self;
        return v3;
      }
    }
    else
    {

    }
LABEL_7:
    v3 = 0;
  }
  return v3;
}

- (id)asHomeEventTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  void *v5;

  if (-[HMParsedEventTopic isIndexTopic](self, "isIndexTopic"))
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  -[HMParsedEventTopic homeUUID](self, "homeUUID");
  v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HMParsedEventTopic accessoryUUID](self, "accessoryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v3 = self;
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (id)asIndexHomeTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  void *v5;

  if (!-[HMParsedEventTopic isIndexTopic](self, "isIndexTopic"))
  {
LABEL_4:
    v3 = 0;
    return v3;
  }
  -[HMParsedEventTopic homeUUID](self, "homeUUID");
  v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HMParsedEventTopic accessoryUUID](self, "accessoryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v5)
    {
      v3 = self;
      return v3;
    }
    goto LABEL_4;
  }
  return v3;
}

- (id)asIndexAccessoryTopic
{
  HMParsedEventTopic *v3;
  HMParsedEventTopic *v4;
  void *v5;

  if (!-[HMParsedEventTopic isIndexTopic](self, "isIndexTopic"))
    goto LABEL_5;
  -[HMParsedEventTopic homeUUID](self, "homeUUID");
  v3 = (HMParsedEventTopic *)objc_claimAutoreleasedReturnValue();
  if (v3)
  {
    v4 = v3;
    -[HMParsedEventTopic accessoryUUID](self, "accessoryUUID");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      v3 = self;
      return v3;
    }
LABEL_5:
    v3 = 0;
  }
  return v3;
}

- (unint64_t)accessoryEventTopicSuffixID
{
  void *v2;
  unint64_t v3;

  -[HMParsedEventTopic topicSuffix](self, "topicSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HMAccessoryEventTopic suffixIDFromTopicSuffix:](HMAccessoryEventTopic, "suffixIDFromTopicSuffix:", v2);

  return v3;
}

- (unint64_t)homeEventTopicSuffixID
{
  void *v2;
  unint64_t v3;

  -[HMParsedEventTopic topicSuffix](self, "topicSuffix");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = +[HMHomeEventTopic suffixIDFromTopicSuffix:](HMHomeEventTopic, "suffixIDFromTopicSuffix:", v2);

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  uint64_t v7;
  void *v8;
  const __CFString *v9;
  uint64_t v10;
  void *v11;
  const __CFString *v12;
  void *v13;

  v3 = (void *)MEMORY[0x1E0CB3940];
  -[HMParsedEventTopic homeUUID](self, "homeUUID");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("-");
  -[HMParsedEventTopic accessoryUUID](self, "accessoryUUID");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v7)
    v9 = (const __CFString *)v7;
  else
    v9 = CFSTR("-");
  -[HMParsedEventTopic topicSuffix](self, "topicSuffix");
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = (void *)v10;
  if (v10)
    v12 = (const __CFString *)v10;
  else
    v12 = CFSTR("-");
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<HMParsedEventTopic homeUUID: %@ accessoryUUID: %@ topicSuffix: %@>"), v6, v9, v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();

  return v13;
}

- (NSString)originalTopic
{
  return self->_originalTopic;
}

- (NSUUID)homeUUID
{
  return self->_homeUUID;
}

- (void)setHomeUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 24);
}

- (NSUUID)accessoryUUID
{
  return self->_accessoryUUID;
}

- (void)setAccessoryUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 32);
}

- (NSString)topicSuffix
{
  return self->_topicSuffix;
}

- (void)setTopicSuffix:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (BOOL)isIndexTopic
{
  return self->_isIndexTopic;
}

- (void)setIsIndexTopic:(BOOL)a3
{
  self->_isIndexTopic = a3;
}

- (NSUUID)userUUID
{
  return self->_userUUID;
}

- (void)setUserUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 48);
}

- (NSString)accessorySettingKeyPath
{
  return self->_accessorySettingKeyPath;
}

- (void)setAccessorySettingKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (NSUUID)mediaSystemUUID
{
  return self->_mediaSystemUUID;
}

- (void)setMediaSystemUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (NSString)mediaSystemSettingKeyPath
{
  return self->_mediaSystemSettingKeyPath;
}

- (void)setMediaSystemSettingKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 72);
}

- (NSUUID)mediaGroupUUID
{
  return self->_mediaGroupUUID;
}

- (void)setMediaGroupUUID:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 80);
}

- (NSString)mediaGroupSettingKeyPath
{
  return self->_mediaGroupSettingKeyPath;
}

- (void)setMediaGroupSettingKeyPath:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 88);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_mediaGroupSettingKeyPath, 0);
  objc_storeStrong((id *)&self->_mediaGroupUUID, 0);
  objc_storeStrong((id *)&self->_mediaSystemSettingKeyPath, 0);
  objc_storeStrong((id *)&self->_mediaSystemUUID, 0);
  objc_storeStrong((id *)&self->_accessorySettingKeyPath, 0);
  objc_storeStrong((id *)&self->_userUUID, 0);
  objc_storeStrong((id *)&self->_topicSuffix, 0);
  objc_storeStrong((id *)&self->_accessoryUUID, 0);
  objc_storeStrong((id *)&self->_homeUUID, 0);
  objc_storeStrong((id *)&self->_originalTopic, 0);
}

@end

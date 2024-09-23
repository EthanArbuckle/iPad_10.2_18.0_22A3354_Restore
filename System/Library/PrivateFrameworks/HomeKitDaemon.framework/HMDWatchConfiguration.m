@implementation HMDWatchConfiguration

- (HMDWatchConfiguration)initWithUniqueID:(id)a3
{
  id v4;
  HMDWatchConfiguration *v5;
  uint64_t v6;
  NSString *uniqueId;
  uint64_t v8;
  NSDictionary *homeConfig;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)HMDWatchConfiguration;
  v5 = -[HMDWatchConfiguration init](&v11, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    uniqueId = v5->_uniqueId;
    v5->_uniqueId = (NSString *)v6;

    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v8 = objc_claimAutoreleasedReturnValue();
    homeConfig = v5->_homeConfig;
    v5->_homeConfig = (NSDictionary *)v8;

  }
  return v5;
}

- (id)description
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc(MEMORY[0x24BDD17C8]);
  -[HMDWatchConfiguration uniqueId](self, "uniqueId");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWatchConfiguration metadataConfig](self, "metadataConfig");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDWatchConfiguration homeConfig](self, "homeConfig");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (void *)objc_msgSend(v3, "initWithFormat:", CFSTR("<HMDWatchConfiguration: Watch ID: %@, Metadata Config: %@, Homedata Config: %@>"), v4, v5, v6);

  return v7;
}

- (void)setHomeConfiguration:(id)a3
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (v4)
  {
    objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v16 = 0u;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v6 = v4;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v17;
      do
      {
        for (i = 0; i != v8; ++i)
        {
          if (*(_QWORD *)v17 != v9)
            objc_enumerationMutation(v6);
          v11 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          v12 = objc_alloc(MEMORY[0x24BDD1880]);
          v13 = (void *)objc_msgSend(v12, "initWithUUIDString:", v11, (_QWORD)v16);
          objc_msgSend(v6, "objectForKeyedSubscript:", v11);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v14, v13);

        }
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      }
      while (v8);
    }

    v15 = (void *)objc_msgSend(v5, "copy");
    -[HMDWatchConfiguration setHomeConfig:](self, "setHomeConfig:", v15);

  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionary");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[HMDWatchConfiguration setHomeConfig:](self, "setHomeConfig:", v5);
  }

}

- (void)setConfigVersion:(id)a3 forHome:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  id v10;

  v6 = a4;
  v7 = a3;
  -[HMDWatchConfiguration homeConfig](self, "homeConfig");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = (id)objc_msgSend(v8, "mutableCopy");

  objc_msgSend(v10, "setObject:forKeyedSubscript:", v7, v6);
  v9 = (void *)objc_msgSend(v10, "copy");
  -[HMDWatchConfiguration setHomeConfig:](self, "setHomeConfig:", v9);

}

- (NSString)uniqueId
{
  return self->_uniqueId;
}

- (void)setUniqueId:(id)a3
{
  objc_storeStrong((id *)&self->_uniqueId, a3);
}

- (NSDictionary)metadataConfig
{
  return self->_metadataConfig;
}

- (void)setMetadataConfig:(id)a3
{
  objc_storeStrong((id *)&self->_metadataConfig, a3);
}

- (NSDictionary)homeConfig
{
  return self->_homeConfig;
}

- (void)setHomeConfig:(id)a3
{
  objc_storeStrong((id *)&self->_homeConfig, a3);
}

- (NSUUID)primaryHome
{
  return self->_primaryHome;
}

- (void)setPrimaryHome:(id)a3
{
  objc_storeStrong((id *)&self->_primaryHome, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_primaryHome, 0);
  objc_storeStrong((id *)&self->_homeConfig, 0);
  objc_storeStrong((id *)&self->_metadataConfig, 0);
  objc_storeStrong((id *)&self->_uniqueId, 0);
}

@end

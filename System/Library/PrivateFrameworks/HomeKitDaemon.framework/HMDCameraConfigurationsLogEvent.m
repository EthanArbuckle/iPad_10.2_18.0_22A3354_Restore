@implementation HMDCameraConfigurationsLogEvent

- (HMDCameraConfigurationsLogEvent)initWithHomes:(id)a3
{
  id v4;
  HMDCameraConfigurationsLogEvent *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  HMDCameraHomeSettingsConfiguration *v13;
  HMDCameraHomeSettingsConfiguration *v14;
  uint64_t v15;
  NSArray *homeSettingsConfigurations;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  objc_super v22;
  _BYTE v23[128];
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)HMDCameraConfigurationsLogEvent;
  v5 = -[HMMLogEvent init](&v22, sel_init);
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCEB8], "array");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v4;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v11);
          v13 = [HMDCameraHomeSettingsConfiguration alloc];
          v14 = -[HMDCameraHomeSettingsConfiguration initWithHome:](v13, "initWithHome:", v12, (_QWORD)v18);
          objc_msgSend(v6, "addObject:", v14);

          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v23, 16);
      }
      while (v9);
    }

    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithArray:", v6);
    v15 = objc_claimAutoreleasedReturnValue();
    homeSettingsConfigurations = v5->_homeSettingsConfigurations;
    v5->_homeSettingsConfigurations = (NSArray *)v15;

  }
  return v5;
}

- (NSArray)homeSettingsConfigurations
{
  return self->_homeSettingsConfigurations;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_homeSettingsConfigurations, 0);
}

@end

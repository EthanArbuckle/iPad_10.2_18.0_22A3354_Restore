@implementation HMDAccessoryCount

- (HMDAccessoryCount)initWithHome:(id)a3
{
  id v4;
  HMDAccessoryCount *v5;
  HMDAccessoryCount *v6;
  objc_super v8;

  v4 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HMDAccessoryCount;
  v5 = -[HMDAccessoryCount init](&v8, sel_init);
  v6 = v5;
  if (v5)
    objc_storeWeak((id *)&v5->_home, v4);

  return v6;
}

- (unint64_t)numHAPAccessories
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDAccessoryCount home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "hapAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)numCameraAccessories
{
  void *v2;
  void *v3;
  unint64_t v4;

  -[HMDAccessoryCount home](self, "home");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "count");

  return v4;
}

- (unint64_t)numCameraAccessoriesRecordingEnabled
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x24BDAC8D0];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[HMDAccessoryCount home](self, "home", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "cameraAccessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v4)
  {
    v5 = v4;
    v6 = 0;
    v7 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v12 != v7)
          objc_enumerationMutation(v3);
        objc_msgSend(*(id *)(*((_QWORD *)&v11 + 1) + 8 * i), "cameraProfileSettingsManager");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        v6 += objc_msgSend(v9, "isRecordingEnabled");

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v5);
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (unint64_t)numSecurityClassAccessories
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDD6B98], *MEMORY[0x24BDD6BC0], *MEMORY[0x24BDD6C08], *MEMORY[0x24BDD6C30], *MEMORY[0x24BDD6CA0], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAccessoryCount numHAPAccessoriesWithAnyServiceWithTypes:](self, "numHAPAccessoriesWithAnyServiceWithTypes:", v3);

  return v4;
}

- (unint64_t)numCriticalSensorAccessories
{
  void *v3;
  unint64_t v4;

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", *MEMORY[0x24BDD6B80], *MEMORY[0x24BDD6B78], *MEMORY[0x24BDD6C40], 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = -[HMDAccessoryCount numHAPAccessoriesWithAnyServiceWithTypes:](self, "numHAPAccessoriesWithAnyServiceWithTypes:", v3);

  return v4;
}

- (unint64_t)numHAPAccessoriesWithAnyServiceWithTypes:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  unint64_t v9;
  uint64_t v10;
  uint64_t i;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  -[HMDAccessoryCount home](self, "home", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hapAccessories");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = 0;
    v10 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v14 != v10)
          objc_enumerationMutation(v6);
        v9 += objc_msgSend(*(id *)(*((_QWORD *)&v13 + 1) + 8 * i), "hasAnyServiceWithTypes:", v4);
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (HMDHome)home
{
  return (HMDHome *)objc_loadWeakRetained((id *)&self->_home);
}

- (void)setHome:(id)a3
{
  objc_storeWeak((id *)&self->_home, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_home);
}

@end

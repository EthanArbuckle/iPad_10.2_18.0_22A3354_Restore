@implementation ASDPlugin(ASDTDeviceManager)

- (id)objectIDsForDeviceUIDs:()ASDTDeviceManager
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  int v14;
  void *v15;
  void *v16;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (objc_msgSend(v4, "count"))
  {
    objc_msgSend(a1, "audioDevices");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x24BDBCEF0], "setWithCapacity:", objc_msgSend(v5, "count"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v7 = v5;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v9; ++i)
        {
          if (*(_QWORD *)v19 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          objc_msgSend(v12, "deviceUID", (_QWORD)v18);
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          v14 = objc_msgSend(v4, "containsObject:", v13);

          if (v14)
          {
            objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:", objc_msgSend(v12, "objectID"));
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v6, "addObject:", v15);

          }
        }
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v9);
    }

    v16 = (void *)objc_msgSend(v6, "copy");
  }
  else
  {
    objc_msgSend(MEMORY[0x24BDBCF20], "set");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v16;
}

@end

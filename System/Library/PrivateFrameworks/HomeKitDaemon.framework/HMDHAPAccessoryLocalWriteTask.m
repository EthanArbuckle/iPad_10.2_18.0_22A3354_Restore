@implementation HMDHAPAccessoryLocalWriteTask

- (void)_dispatchToAccessory:(id)a3 requests:(id)a4 logEvent:(id)a5 completion:(id)a6
{
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  id v18;
  void *v19;
  id v20;
  unint64_t v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  id v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x24BDAC8D0];
  v26 = a3;
  v10 = a4;
  v25 = a5;
  v11 = a6;
  objc_msgSend(MEMORY[0x24BDBCEB8], "arrayWithCapacity:", objc_msgSend(v10, "count"));
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v13 = v10;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v28;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v28 != v16)
          objc_enumerationMutation(v13);
        v18 = *(id *)(*((_QWORD *)&v27 + 1) + 8 * v17);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0)
          v19 = v18;
        else
          v19 = 0;
        v20 = v19;

        if (v20)
          objc_msgSend(v12, "addObject:", v20);

        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v27, v31, 16);
    }
    while (v15);
  }

  v21 = -[HMDHAPAccessoryTask sourceType](self, "sourceType");
  -[HMDHAPAccessoryTask context](self, "context");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "requestMessage");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[HMDHAPAccessoryTask workQueue](self, "workQueue");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v26, "writeCharacteristicValues:source:message:queue:logEvent:completionHandler:", v12, v21, v23, v24, v25, v11);

}

@end

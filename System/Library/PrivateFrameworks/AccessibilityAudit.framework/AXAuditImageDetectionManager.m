@implementation AXAuditImageDetectionManager

+ (id)sharedManager
{
  _QWORD block[5];

  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __45__AXAuditImageDetectionManager_sharedManager__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, block);
  return (id)sharedManager_instance;
}

void __45__AXAuditImageDetectionManager_sharedManager__block_invoke()
{
  uint64_t v0;
  void *v1;

  v0 = objc_opt_new();
  v1 = (void *)sharedManager_instance;
  sharedManager_instance = v0;

}

- (id)detectedTextResultsForImageData:(id)a3
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t i;
  void *v14;
  void *v15;
  void *v17;
  void *v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  _BYTE v23[128];
  _QWORD v24[3];
  _QWORD v25[5];

  v25[3] = *MEMORY[0x24BDAC8D0];
  v3 = a3;
  v4 = (void *)objc_opt_new();
  v5 = *MEMORY[0x24BDBF608];
  v24[0] = *MEMORY[0x24BDBF5E8];
  v24[1] = v5;
  v25[0] = *MEMORY[0x24BDBF5F0];
  v25[1] = MEMORY[0x24BDBD1C8];
  v24[2] = *MEMORY[0x24BDBF610];
  v25[2] = MEMORY[0x24BDBD1C0];
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v25, v24, 3);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBF650], "detectorOfType:context:options:", *MEMORY[0x24BDBF628], 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = v3;
  v7 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDF6AC8]), "initWithData:", v3);
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF660]), "initWithImage:", v7);
  objc_msgSend(v6, "featuresInImage:options:", v8, MEMORY[0x24BDBD1B8]);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  v22 = 0u;
  v10 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
  if (v10)
  {
    v11 = v10;
    v12 = *(_QWORD *)v20;
    do
    {
      for (i = 0; i != v11; ++i)
      {
        if (*(_QWORD *)v20 != v12)
          objc_enumerationMutation(v9);
        v14 = *(void **)(*((_QWORD *)&v19 + 1) + 8 * i);
        v15 = (void *)objc_opt_new();
        objc_msgSend(v15, "setDetectionType:", 0);
        objc_msgSend(v14, "bounds");
        objc_msgSend(v15, "setDetectionRegion:");
        objc_msgSend(v4, "addObject:", v15);

      }
      v11 = objc_msgSend(v9, "countByEnumeratingWithState:objects:count:", &v19, v23, 16);
    }
    while (v11);
  }

  return v4;
}

@end

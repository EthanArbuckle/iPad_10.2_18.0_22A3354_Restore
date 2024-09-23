@implementation TDSimpleArtworkElementProduction

- (void)deleteRenditionsInDocument:(id)a3 shouldDeleteAssetFiles:(BOOL)a4
{
  _BOOL4 v4;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v4 = a4;
  v19 = *MEMORY[0x24BDAC8D0];
  v6 = (void *)-[TDSimpleArtworkElementProduction renditions](self, "renditions");
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        v12 = (void *)objc_msgSend(v11, "asset");
        objc_msgSend(v11, "setAsset:", 0);
        if (!objc_msgSend((id)objc_msgSend(v12, "renditions"), "count"))
        {
          if (v4)
          {
            v13 = (void *)objc_msgSend(v12, "fileURLWithDocument:", a3);
            if (objc_msgSend(v13, "checkResourceIsReachableAndReturnError:", 0))
            {
              objc_msgSend(a3, "assetManagementDelegate");
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "willDeleteAsset:atURL:", v12, v13);
              objc_msgSend((id)objc_msgSend(MEMORY[0x24BDD1580], "defaultManager"), "removeItemAtURL:error:", v13, 0);
              objc_msgSend(a3, "assetManagementDelegate");
              if ((objc_opt_respondsToSelector() & 1) != 0)
                objc_msgSend((id)objc_msgSend(a3, "assetManagementDelegate"), "didDeleteAssetAtURL:", v13);
            }
          }
          objc_msgSend(a3, "deleteObject:", v12);
        }
      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }
  objc_msgSend(a3, "deleteObjects:", objc_msgSend(v6, "allObjects"));
}

- (id)associatedFileModificationDateWithDocument:(id)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = (void *)objc_msgSend(MEMORY[0x24BDBCE60], "distantPast");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = (void *)-[TDSimpleArtworkElementProduction renditions](self, "renditions", 0);
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v14;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v14 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * v10);
        if ((objc_opt_respondsToSelector() & 1) != 0)
          v5 = (void *)objc_msgSend(v5, "laterDate:", objc_msgSend(v11, "associatedFileModificationDateWithDocument:", a3));
        ++v10;
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v8);
  }
  return v5;
}

@end

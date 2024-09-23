@implementation GetBilingualInputModes

void __GetBilingualInputModes_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  int v11;
  void *v12;
  void *v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "supportedInputModeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v15;
    v5 = *MEMORY[0x24BEB5040];
    v6 = MEMORY[0x24BDBD1C8];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v15 != v4)
          objc_enumerationMutation(v1);
        v8 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v7);
        TIGetInputModeProperties();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqual:", v6);

        if (v11)
          objc_msgSend(v13, "addObject:", v8);
        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v3);
  }

  v12 = (void *)GetBilingualInputModes___bilingualInputModes;
  GetBilingualInputModes___bilingualInputModes = (uint64_t)v13;

}

@end

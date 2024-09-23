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
  char v13;
  void *v14;
  void *v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(MEMORY[0x24BDBCEB8], "array");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  objc_msgSend(MEMORY[0x24BEB4D50], "sharedInputModeController");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "supportedInputModeIdentifiers");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v17;
    v5 = *MEMORY[0x24BEB5040];
    v6 = *MEMORY[0x24BEB5030];
    do
    {
      v7 = 0;
      do
      {
        if (*(_QWORD *)v17 != v4)
          objc_enumerationMutation(v1);
        v8 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * v7);
        TIGetInputModeProperties();
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "objectForKeyedSubscript:", v5);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "BOOLValue");

        if (v11)
        {
          objc_msgSend(v9, "objectForKeyedSubscript:", v6);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          v13 = objc_msgSend(v12, "BOOLValue");

          if ((v13 & 1) == 0)
            objc_msgSend(v15, "addObject:", v8);
        }

        ++v7;
      }
      while (v3 != v7);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    }
    while (v3);
  }

  objc_msgSend(v15, "removeObject:", CFSTR("ko_KR"));
  v14 = (void *)GetBilingualInputModes___bilingualInputModes;
  GetBilingualInputModes___bilingualInputModes = (uint64_t)v15;

}

@end

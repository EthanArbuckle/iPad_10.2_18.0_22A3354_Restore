@implementation _DPKeyNames

+ (id)keyPropertiesForKey:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  uint64_t v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  +[_DPStrings keyNamesPath](_DPStrings, "keyNamesPath");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertiesFromNamesFile:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v6, "objectForKeyedSubscript:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v18 = 0u;
    v19 = 0u;
    v16 = 0u;
    v17 = 0u;
    v8 = (id)allKeyNamePatterns;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v17;
      while (2)
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v17 != v11)
            objc_enumerationMutation(v8);
          v13 = *(_QWORD *)(*((_QWORD *)&v16 + 1) + 8 * i);
          if (objc_msgSend(v4, "hasPrefix:", v13, (_QWORD)v16))
          {
            objc_msgSend(v6, "objectForKeyedSubscript:", v13);
            v14 = objc_claimAutoreleasedReturnValue();
            if (v14)
            {
              v7 = (void *)v14;
              goto LABEL_13;
            }
          }
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
        if (v10)
          continue;
        break;
      }
    }
    v7 = 0;
LABEL_13:

  }
  return v7;
}

+ (id)propertiesFromNamesFile:(id)a3
{
  id v4;
  void *v5;
  id v6;
  id v7;
  _QWORD v9[4];
  id v10;
  id v11;

  v4 = a3;
  v5 = (void *)MEMORY[0x1D8256B78]();
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39___DPKeyNames_propertiesFromNamesFile___block_invoke;
  v9[3] = &unk_1E95D92C0;
  v11 = a1;
  v6 = v4;
  v10 = v6;
  if (propertiesFromNamesFile__onceToken != -1)
    dispatch_once(&propertiesFromNamesFile__onceToken, v9);

  objc_autoreleasePoolPop(v5);
  v7 = (id)allKeys;

  return v7;
}

+ (id)allKeyNames
{
  void *v3;
  void *v4;
  void *v5;

  +[_DPStrings keyNamesPath](_DPStrings, "keyNamesPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "propertiesFromNamesFile:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v4, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)keyNamesGroupedByPropertyName
{
  void *v3;
  _QWORD block[5];

  v3 = (void *)MEMORY[0x1D8256B78](a1, a2);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __44___DPKeyNames_keyNamesGroupedByPropertyName__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (keyNamesGroupedByPropertyName_onceToken != -1)
    dispatch_once(&keyNamesGroupedByPropertyName_onceToken, block);
  objc_autoreleasePoolPop(v3);
  return (id)allKeysGroupedByPropertyName;
}

@end

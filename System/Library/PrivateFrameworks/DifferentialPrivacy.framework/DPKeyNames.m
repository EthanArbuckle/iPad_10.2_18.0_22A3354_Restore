@implementation DPKeyNames

void __39___DPKeyNames_propertiesFromNamesFile___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[5];
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pathForResource:ofType:", CFSTR("override.keynames"), CFSTR("plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__0;
  v14 = __Block_byref_object_dispose__0;
  v15 = (id)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
  v4 = *(_QWORD *)(a1 + 32);
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __39___DPKeyNames_propertiesFromNamesFile___block_invoke_5;
  v9[3] = &unk_1E95D9298;
  v9[4] = &v10;
  +[_DPPListHelper loadPropertyListFromPath:overridePath:usingBlock:](_DPPListHelper, "loadPropertyListFromPath:overridePath:usingBlock:", v4, v3, v9);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)allKeys;
  allKeys = v5;

  v7 = objc_msgSend((id)v11[5], "copy");
  v8 = (void *)allKeyNamePatterns;
  allKeyNamePatterns = v7;

  _Block_object_dispose(&v10, 8);
}

id __39___DPKeyNames_propertiesFromNamesFile___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v5;
  void *v6;
  void *v7;

  v5 = a2;
  objc_msgSend(a3, "objectForKeyedSubscript:", CFSTR("PropertiesName"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    +[_DPKeyProperties keyPropertiesForName:](_DPKeyProperties, "keyPropertiesForName:", v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "keyPatternsAllowed"))
      objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 40), "addObject:", v5);
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

void __44___DPKeyNames_keyNamesGroupedByPropertyName__block_invoke(uint64_t a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v1 = *(void **)(a1 + 32);
  +[_DPStrings keyNamesPath](_DPStrings, "keyNamesPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "propertiesFromNamesFile:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = (void *)objc_msgSend(MEMORY[0x1E0C9AA70], "mutableCopy");
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  objc_msgSend(v3, "allKeys", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v19;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v19 != v8)
          objc_enumerationMutation(v5);
        v10 = *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * i);
        objc_msgSend(v3, "objectForKeyedSubscript:", v10);
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v11, "propertiesName");
        v12 = (void *)objc_claimAutoreleasedReturnValue();

        objc_msgSend(v4, "objectForKeyedSubscript:", v12);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        if (!v14)
          v14 = (void *)objc_msgSend(MEMORY[0x1E0C9AA60], "mutableCopy");
        objc_msgSend(v14, "addObject:", v10);
        v15 = (void *)objc_msgSend(v14, "copy");
        objc_msgSend(v4, "setObject:forKeyedSubscript:", v15, v12);

      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v7);
  }

  v16 = objc_msgSend(v4, "copy");
  v17 = (void *)allKeysGroupedByPropertyName;
  allKeysGroupedByPropertyName = v16;

}

@end

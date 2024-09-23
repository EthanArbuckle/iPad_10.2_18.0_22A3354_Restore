@implementation NTKComplicationTypesToBundleIDMappingCompanion

void ___NTKComplicationTypesToBundleIDMappingCompanion_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;
  _QWORD v5[4];
  id v6;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 59);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  _NTKBundleIDToComplicationTypesMappingCompanion();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = ___NTKComplicationTypesToBundleIDMappingCompanion_block_invoke_2;
  v5[3] = &unk_1E6BD2B08;
  v6 = v0;
  v4 = v0;
  objc_msgSend(v1, "enumerateKeysAndObjectsUsingBlock:", v5);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)_NTKComplicationTypesToBundleIDMappingCompanion_complicationTypesTobundleIDMapping;
  _NTKComplicationTypesToBundleIDMappingCompanion_complicationTypesTobundleIDMapping = v2;

}

void ___NTKComplicationTypesToBundleIDMappingCompanion_block_invoke_2(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v5 = a2;
  v6 = a3;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v12;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v12 != v9)
          objc_enumerationMutation(v6);
        objc_msgSend(*(id *)(a1 + 32), "setObject:forKeyedSubscript:", v5, *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
      }
      while (v8 != v10);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v8);
  }

}

@end

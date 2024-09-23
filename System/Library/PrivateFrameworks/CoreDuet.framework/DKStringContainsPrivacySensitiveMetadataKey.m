@implementation DKStringContainsPrivacySensitiveMetadataKey

void ___DKStringContainsPrivacySensitiveMetadataKey_block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v0 = (void *)objc_opt_new();
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  _DKPrivacySensitiveMetadataKeys();
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)v12;
    do
    {
      v5 = 0;
      do
      {
        if (*(_QWORD *)v12 != v4)
          objc_enumerationMutation(v1);
        v6 = *(_QWORD *)(*((_QWORD *)&v11 + 1) + 8 * v5);
        +[_DKMetadataPersistenceLookupTable keyToAttribute]();
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "objectForKeyedSubscript:", v6, (_QWORD)v11);
        v8 = (void *)objc_claimAutoreleasedReturnValue();

        if (v8)
          objc_msgSend(v0, "addObject:", v8);
        objc_msgSend(v0, "addObject:", v6);

        ++v5;
      }
      while (v3 != v5);
      v3 = objc_msgSend(v1, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v3);
  }

  v9 = objc_msgSend(v0, "copy");
  v10 = (void *)_DKStringContainsPrivacySensitiveMetadataKey_sensitiveKeyPathStrings;
  _DKStringContainsPrivacySensitiveMetadataKey_sensitiveKeyPathStrings = v9;

}

@end

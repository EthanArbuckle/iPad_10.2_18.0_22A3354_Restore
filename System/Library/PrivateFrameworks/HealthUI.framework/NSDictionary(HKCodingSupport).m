@implementation NSDictionary(HKCodingSupport)

- (HKCodableMetadataDictionary)codableMetadata
{
  HKCodableMetadataDictionary *v2;
  HKCodableMetadataDictionary *v3;
  _QWORD v5[4];
  HKCodableMetadataDictionary *v6;

  v2 = objc_alloc_init(HKCodableMetadataDictionary);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __48__NSDictionary_HKCodingSupport__codableMetadata__block_invoke;
  v5[3] = &unk_1E9C47540;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

+ (id)dictionaryWithCodableMetadata:()HKCodingSupport
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  BOOL v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "keyValuePairsCount");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(v3, "keyValuePairs", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * i);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasNumberIntValue"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "numberIntValue"));
          v13 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v11, "hasStringValue"))
          {
            v14 = 0;
            goto LABEL_16;
          }
          objc_msgSend(v11, "stringValue");
          v13 = objc_claimAutoreleasedReturnValue();
        }
        v14 = (void *)v13;
        if (v12)
          v15 = v13 == 0;
        else
          v15 = 1;
        if (!v15)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v13, v12);
LABEL_16:

      }
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    }
    while (v8);
  }

  return v5;
}

@end

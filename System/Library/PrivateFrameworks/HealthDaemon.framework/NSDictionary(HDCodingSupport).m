@implementation NSDictionary(HDCodingSupport)

- (HDCodableMetadataDictionary)hk_codableMetadata
{
  HDCodableMetadataDictionary *v2;
  HDCodableMetadataDictionary *v3;
  _QWORD v5[4];
  HDCodableMetadataDictionary *v6;

  v2 = objc_alloc_init(HDCodableMetadataDictionary);
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __51__NSDictionary_HDCodingSupport__hk_codableMetadata__block_invoke;
  v5[3] = &unk_1E6CF4578;
  v3 = v2;
  v6 = v3;
  objc_msgSend(a1, "enumerateKeysAndObjectsUsingBlock:", v5);

  return v3;
}

+ (id)hk_dictionaryWithCodableMetadata:()HDCodingSupport
{
  id v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  void *v14;
  void *v15;
  BOOL v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  void *v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  _BYTE v28[128];
  uint64_t v29;

  v29 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = objc_msgSend(v3, "keyValuePairsCount");
  objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  v23 = v3;
  objc_msgSend(v3, "keyValuePairs");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v25;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v25 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * v10);
        objc_msgSend(v11, "key");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v11, "hasStringValue"))
        {
          objc_msgSend(v11, "stringValue");
          v13 = objc_claimAutoreleasedReturnValue();
LABEL_14:
          v15 = (void *)v13;
          goto LABEL_15;
        }
        if (objc_msgSend(v11, "hasNumberDoubleValue"))
        {
          v14 = (void *)MEMORY[0x1E0CB37E8];
          objc_msgSend(v11, "numberDoubleValue");
          objc_msgSend(v14, "numberWithDouble:");
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (objc_msgSend(v11, "hasNumberIntValue"))
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", objc_msgSend(v11, "numberIntValue"));
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (objc_msgSend(v11, "hasDateValue"))
        {
          objc_msgSend(v11, "dateValue");
          objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:");
          v13 = objc_claimAutoreleasedReturnValue();
          goto LABEL_14;
        }
        if (objc_msgSend(v11, "hasQuantityValue"))
        {
          v17 = (void *)MEMORY[0x1E0CB6A28];
          objc_msgSend(v11, "quantityValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "createWithCodable:", v18);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        else
        {
          if (!objc_msgSend(v11, "hasDataValue"))
          {
            v15 = 0;
            goto LABEL_20;
          }
          v20 = (void *)MEMORY[0x1E0C99D50];
          objc_msgSend(v11, "dataValue");
          v18 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v20, "dataWithData:", v18);
          v19 = objc_claimAutoreleasedReturnValue();
        }
        v15 = (void *)v19;

LABEL_15:
        if (v12)
          v16 = v15 == 0;
        else
          v16 = 1;
        if (!v16)
          objc_msgSend(v5, "setObject:forKeyedSubscript:", v15, v12);
LABEL_20:

        ++v10;
      }
      while (v8 != v10);
      v21 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v24, v28, 16);
      v8 = v21;
    }
    while (v21);
  }

  return v5;
}

+ (id)hk_dictionaryOrNilWithCodableMetadata:()HDCodingSupport
{
  id v4;
  void *v5;

  v4 = a3;
  if (objc_msgSend(v4, "keyValuePairsCount"))
  {
    objc_msgSend(a1, "hk_dictionaryWithCodableMetadata:", v4);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

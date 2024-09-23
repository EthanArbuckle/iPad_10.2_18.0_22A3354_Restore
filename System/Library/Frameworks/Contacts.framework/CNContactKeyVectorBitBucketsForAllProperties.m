@implementation CNContactKeyVectorBitBucketsForAllProperties

void __CNContactKeyVectorBitBucketsForAllProperties_block_invoke()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  id v5;
  const void *Value;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  _BYTE v11[128];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  +[CN allContactProperties](CN, "allContactProperties");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 0u;
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v1 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
  if (v1)
  {
    v2 = v1;
    v3 = *(_QWORD *)v8;
    do
    {
      v4 = 0;
      do
      {
        if (*(_QWORD *)v8 != v3)
          objc_enumerationMutation(v0);
        objc_msgSend(*(id *)(*((_QWORD *)&v7 + 1) + 8 * v4), "key");
        v5 = (id)objc_claimAutoreleasedReturnValue();
        if (v5)
        {
          if (CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken != -1)
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByPointer_onceToken, &__block_literal_global_129);
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByPointer_map, v5);
          if (Value)
            goto LABEL_13;
          if (CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken != -1)
            dispatch_once(&CNContactKeyVectorPropertyKeysToIndicesByValue_onceToken, &__block_literal_global_132);
          Value = CFDictionaryGetValue((CFDictionaryRef)CNContactKeyVectorPropertyKeysToIndicesByValue_map, v5);
          if (Value)
LABEL_13:
            *(_QWORD *)((char *)&CNContactKeyVectorBitBucketsForAllProperties_referenceBuckets
                      + ((((unint64_t)Value - 1) >> 3) & 0x1FFFFFFFFFFFFFF8)) |= 1 << ~(Value
                                                                                                 - 1);
        }

        ++v4;
      }
      while (v2 != v4);
      v2 = objc_msgSend(v0, "countByEnumeratingWithState:objects:count:", &v7, v11, 16);
    }
    while (v2);
  }

}

@end

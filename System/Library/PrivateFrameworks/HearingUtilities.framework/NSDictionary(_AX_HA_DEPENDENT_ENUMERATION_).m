@implementation NSDictionary(_AX_HA_DEPENDENT_ENUMERATION_)

- (void)enumerateKeysAndObjectsInDependentOrderUsingBlock:()_AX_HA_DEPENDENT_ENUMERATION_
{
  void (**v4)(id, uint64_t, void *, unsigned __int8 *);
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  void *v13;
  unsigned __int8 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  objc_msgSend(a1, "allKeys");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "sortedArrayUsingComparator:", &__block_literal_global_133_0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v7 = v6;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v16;
LABEL_3:
    v11 = 0;
    while (1)
    {
      if (*(_QWORD *)v16 != v10)
        objc_enumerationMutation(v7);
      v12 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v11);
      objc_msgSend(a1, "objectForKeyedSubscript:", v12);
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = 0;
      v4[2](v4, v12, v13, &v14);
      LODWORD(v12) = v14;

      if ((_DWORD)v12)
        break;
      if (v9 == ++v11)
      {
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
        if (v9)
          goto LABEL_3;
        break;
      }
    }
  }

}

@end

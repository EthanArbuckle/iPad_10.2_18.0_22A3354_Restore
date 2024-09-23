@implementation NTPBPersonalizationProfile(FCAdditions)

- (id)aggregatesByFeatureKey
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "aggregates");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_dictionaryWithKeyBlock:", &__block_literal_global_122);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (id)historiesByInstanceIdentifier
{
  void *v1;
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1, "histories");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "fc_dictionaryWithKeyBlock:", &__block_literal_global_2_2);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (!v2)
    v2 = (void *)MEMORY[0x1E0C9AA70];
  v4 = v2;

  return v4;
}

- (id)historyForInstanceIdentifier:()FCAdditions
{
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *i;
  void *v9;
  void *v10;
  int v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  objc_msgSend(a1, "histories", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v6)
  {
    v7 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(_QWORD *)v14 != v7)
          objc_enumerationMutation(v5);
        v9 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * (_QWORD)i);
        objc_msgSend(v9, "instanceIdentifier");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        v11 = objc_msgSend(v10, "isEqualToString:", v4);

        if (v11)
        {
          v6 = v9;
          goto LABEL_11;
        }
      }
      v6 = (id)objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
      if (v6)
        continue;
      break;
    }
  }
LABEL_11:

  return v6;
}

- (uint64_t)lastChangeNumberForInstanceIdentifier:()FCAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "historyForInstanceIdentifier:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "lastChangeNumber");

  return v2;
}

@end

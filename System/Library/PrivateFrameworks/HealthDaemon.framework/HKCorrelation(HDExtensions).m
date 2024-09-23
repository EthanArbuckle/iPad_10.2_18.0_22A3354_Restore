@implementation HKCorrelation(HDExtensions)

+ (uint64_t)hd_dataEntityClass
{
  return objc_opt_class();
}

- (id)hd_associatedObjects
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "objects");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "allObjects");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

- (id)hd_associatedSampleTypes
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E20], "set");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  objc_msgSend(a1, "hd_associatedObjects", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v15;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v15 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v14 + 1) + 8 * i);
        objc_msgSend(v8, "hd_sampleType");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (v9)
        {
          objc_msgSend(v8, "hd_sampleType");
          v10 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v2, "addObject:", v10);

        }
      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v5);
  }

  objc_msgSend(a1, "sampleType");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "addObject:", v11);

  objc_msgSend(MEMORY[0x1E0C99E60], "setWithSet:", v2);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

@end

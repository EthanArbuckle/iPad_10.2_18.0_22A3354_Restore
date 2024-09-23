@implementation HKObject(HDExtensions)

- (uint64_t)hd_dataEntityClass
{
  return objc_msgSend((id)objc_opt_class(), "hd_dataEntityClass");
}

+ (id)hd_allObjectsToInsertWithObjects:()HDExtensions
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t i;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  _BYTE v25[128];
  uint64_t v26;

  v26 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  v4 = (void *)MEMORY[0x1BCCACAC4]();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99E10], "orderedSet");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v21 = 0u;
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v7 = v3;
  v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
  if (v8)
  {
    v9 = v8;
    v10 = *(_QWORD *)v22;
    do
    {
      for (i = 0; i != v9; ++i)
      {
        if (*(_QWORD *)v22 != v10)
          objc_enumerationMutation(v7);
        v12 = *(void **)(*((_QWORD *)&v21 + 1) + 8 * i);
        objc_msgSend(v12, "hd_associatedObjects", (_QWORD)v21);
        v13 = (void *)objc_claimAutoreleasedReturnValue();
        v14 = (void *)objc_msgSend(v13, "mutableCopy");

        v15 = objc_msgSend(v14, "count");
        v16 = v5;
        if (v15)
        {
          objc_msgSend(v5, "addObjectsFromArray:", v14);
          v16 = v6;
        }
        objc_msgSend(v16, "addObject:", v12);

      }
      v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v21, v25, 16);
    }
    while (v9);
  }

  objc_msgSend(v5, "array");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "array");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "arrayByAddingObjectsFromArray:", v18);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  objc_autoreleasePoolPop(v4);
  return v19;
}

- (uint64_t)hd_associatedObjects
{
  return 0;
}

- (uint64_t)hd_sampleType
{
  return 0;
}

+ (uint64_t)hd_dataEntityClass
{
  NSRequestConcreteImplementation();
  return 0;
}

- (uint64_t)hd_associatedSampleTypes
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "set");
}

@end

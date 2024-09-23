@implementation NSDictionary(AvailabilityKit)

- (uint64_t)availabilityKit_BOOLForKey:()AvailabilityKit defaultValue:
{
  void *v5;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    a4 = objc_msgSend(v5, "BOOLValue");

  return a4;
}

- (id)availabilityKit_stringForKey:()AvailabilityKit
{
  void *v1;
  id v2;

  objc_msgSend(a1, "objectForKeyedSubscript:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v2 = v1;
  else
    v2 = 0;

  return v2;
}

- (id)availabilityKit_stringArrayForKey:()AvailabilityKit allowEmptyString:
{
  void *v5;
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "objectForKeyedSubscript:");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v7 = v5;
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v8 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v8)
    {
      v9 = v8;
      v10 = *(_QWORD *)v18;
      do
      {
        v11 = 0;
        do
        {
          if (*(_QWORD *)v18 != v10)
            objc_enumerationMutation(v7);
          v12 = *(void **)(*((_QWORD *)&v17 + 1) + 8 * v11);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0)
          {
            v13 = v12;
            v14 = v13;
            if (v13 && ((a4 & 1) != 0 || objc_msgSend(v13, "length")))
              objc_msgSend(v6, "addObject:", v14);

          }
          ++v11;
        }
        while (v9 != v11);
        v9 = objc_msgSend(v7, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v9);
    }

  }
  v15 = (void *)objc_msgSend(v6, "copy");

  return v15;
}

@end

@implementation NSDictionary(CARMutableDeepCopy)

- (id)carMutableDeepCopy
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  uint64_t v8;
  void *v9;
  id v10;
  void *v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  _BYTE v17[128];
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  objc_msgSend(a1, "allKeys");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v14;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v14 != v6)
          objc_enumerationMutation(v3);
        v8 = *(_QWORD *)(*((_QWORD *)&v13 + 1) + 8 * i);
        objc_msgSend(a1, "objectForKey:", v8);
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9A92F8))
        {
          objc_msgSend(v9, "carMutableDeepCopy");
          v10 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9A8FB8))
        {
          v10 = (id)objc_msgSend(v9, "mutableCopy");
        }
        else if (objc_msgSend(v9, "conformsToProtocol:", &unk_1EE9A0E68))
        {
          v10 = (id)objc_msgSend(v9, "copy");
        }
        else
        {
          v10 = v9;
        }
        v11 = v10;
        objc_msgSend(v2, "setValue:forKey:", v10, v8);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v13, v17, 16);
    }
    while (v5);
  }

  return v2;
}

@end

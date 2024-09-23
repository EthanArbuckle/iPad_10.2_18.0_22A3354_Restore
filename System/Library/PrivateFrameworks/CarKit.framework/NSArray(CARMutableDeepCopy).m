@implementation NSArray(CARMutableDeepCopy)

- (id)carMutableDeepCopy
{
  void *v2;
  id v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  void *v8;
  id v9;
  void *v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v2 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v3 = a1;
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v4)
  {
    v5 = v4;
    v6 = *(_QWORD *)v13;
    do
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v13 != v6)
          objc_enumerationMutation(v3);
        v8 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE9A92F8, (_QWORD)v12))
        {
          objc_msgSend(v8, "carMutableDeepCopy");
          v9 = (id)objc_claimAutoreleasedReturnValue();
        }
        else if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE9A8FB8))
        {
          v9 = (id)objc_msgSend(v8, "mutableCopy");
        }
        else if (objc_msgSend(v8, "conformsToProtocol:", &unk_1EE9A0E68))
        {
          v9 = (id)objc_msgSend(v8, "copy");
        }
        else
        {
          v9 = v8;
        }
        v10 = v9;
        objc_msgSend(v2, "addObject:", v9);

      }
      v5 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    }
    while (v5);
  }

  return v2;
}

@end

@implementation NSDictionary(MCDictionaryUtilities)

- (void)MSMutableDeepCopyWithZone:()MCDictionaryUtilities
{
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99E08]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  objc_msgSend(a1, "keyEnumerator", 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v18;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v18 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v10);
        objc_msgSend(a1, "objectForKey:", v11);
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v13 = objc_msgSend(v12, "MSMutableDeepCopyWithZone:", a3);
LABEL_9:
          v14 = (void *)v13;
          objc_msgSend(v5, "setObject:forKey:", v13, v11);

          goto LABEL_10;
        }
        if (objc_msgSend(v12, "conformsToProtocol:", &unk_1EFE36630))
        {
          v13 = objc_msgSend(v12, "copyWithZone:", a3);
          goto LABEL_9;
        }
        objc_msgSend(v5, "setObject:forKey:", v12, v11);
LABEL_10:

        ++v10;
      }
      while (v8 != v10);
      v15 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      v8 = v15;
    }
    while (v15);
  }

  return v5;
}

- (uint64_t)MSMutableDeepCopy
{
  return objc_msgSend(a1, "MSMutableDeepCopyWithZone:", 0);
}

- (uint64_t)MSDeepCopy
{
  return objc_msgSend(a1, "MSDeepCopyWithZone:", 0);
}

@end

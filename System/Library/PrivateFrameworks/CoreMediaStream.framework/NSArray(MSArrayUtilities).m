@implementation NSArray(MSArrayUtilities)

- (void)MSMutableDeepCopyWithZone:()MSArrayUtilities
{
  void *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  _BYTE v20[128];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(a1, "count"));
  v16 = 0u;
  v17 = 0u;
  v18 = 0u;
  v19 = 0u;
  v6 = a1;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v17;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v17 != v9)
          objc_enumerationMutation(v6);
        v11 = *(void **)(*((_QWORD *)&v16 + 1) + 8 * v10);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
        {
          v12 = objc_msgSend(v11, "MSMutableDeepCopyWithZone:", a3, (_QWORD)v16);
LABEL_9:
          v13 = (void *)v12;
          objc_msgSend(v5, "addObject:", v12);

          goto LABEL_10;
        }
        if (objc_msgSend(v11, "conformsToProtocol:", &unk_1EFE36630, (_QWORD)v16))
        {
          v12 = objc_msgSend(v11, "copyWithZone:", a3);
          goto LABEL_9;
        }
        objc_msgSend(v5, "addObject:", v11);
LABEL_10:
        ++v10;
      }
      while (v8 != v10);
      v14 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v16, v20, 16);
      v8 = v14;
    }
    while (v14);
  }

  return v5;
}

- (uint64_t)MSMutableDeepCopy
{
  return objc_msgSend(a1, "MSMutableDeepCopyWithZone:", 0);
}

@end

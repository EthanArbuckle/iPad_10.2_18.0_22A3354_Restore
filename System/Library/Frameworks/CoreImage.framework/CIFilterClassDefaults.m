@implementation CIFilterClassDefaults

+ (id)classDefaultsForClass:(Class)a3
{
  void *v4;
  objc_class *v5;
  void *v6;
  void *CustomAttributes;
  void *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  NSString *v13;
  void *v14;
  uint64_t StdAttrsForKey;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v20;
  Class v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  uint64_t v27;

  v27 = *MEMORY[0x1E0C80C00];
  v4 = (void *)objc_msgSend(a1, "cache");
  v5 = (objc_class *)objc_opt_class();
  if (!-[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", v5))
    return 0;
  if (v5 == a3)
    return (id)MEMORY[0x1E0C9AA70];
  v6 = (void *)objc_msgSend(v4, "objectForKey:", a3);
  if (!v6)
  {
    v20 = v4;
    CustomAttributes = (void *)getCustomAttributes(a3);
    v21 = a3;
    v8 = (void *)objc_msgSend(+[CIFilterClassInfo classInfoForClass:](CIFilterClassInfo, "classInfoForClass:", a3), "inputKeys");
    v6 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v22 = 0u;
    v23 = 0u;
    v24 = 0u;
    v25 = 0u;
    v9 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
    if (v9)
    {
      v10 = v9;
      v11 = *(_QWORD *)v23;
      do
      {
        for (i = 0; i != v10; ++i)
        {
          if (*(_QWORD *)v23 != v11)
            objc_enumerationMutation(v8);
          v13 = *(NSString **)(*((_QWORD *)&v22 + 1) + 8 * i);
          v14 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
          StdAttrsForKey = getStdAttrsForKey(v13);
          if (StdAttrsForKey)
            objc_msgSend(v14, "addEntriesFromDictionary:", StdAttrsForKey);
          v16 = objc_msgSend(CustomAttributes, "valueForKey:", v13);
          if (v16)
          {
            v17 = v16;
            objc_opt_class();
            if ((objc_opt_isKindOfClass() & 1) != 0)
              objc_msgSend(v14, "addEntriesFromDictionary:", v17);
          }
          v18 = objc_msgSend(v14, "objectForKey:", CFSTR("CIAttributeDefault"));
          if (!v18)
          {
            v18 = objc_msgSend(v14, "objectForKey:", CFSTR("CIAttributeIdentity"));
            if (!v18)
              continue;
          }
          objc_msgSend(v6, "setObject:forKey:", v18, v13);
        }
        v10 = objc_msgSend(v8, "countByEnumeratingWithState:objects:count:", &v22, v26, 16);
      }
      while (v10);
    }
    objc_msgSend(v20, "setObject:forKey:", v6, v21);
  }
  return v6;
}

+ (id)cache
{
  if (+[CIFilterClassDefaults cache]::onceToken != -1)
    dispatch_once(&+[CIFilterClassDefaults cache]::onceToken, &__block_literal_global_694);
  return (id)+[CIFilterClassDefaults cache]::cache;
}

uint64_t __30__CIFilterClassDefaults_cache__block_invoke()
{
  +[CIFilterClassDefaults cache]::cache = (uint64_t)objc_alloc_init(MEMORY[0x1E0C99D38]);
  objc_msgSend((id)+[CIFilterClassDefaults cache]::cache, "setName:", CFSTR("com.apple.coreimage.nscache.CIFilterClassDefaults"));
  objc_msgSend((id)+[CIFilterClassDefaults cache]::cache, "setCountLimit:", 256);
  return objc_msgSend((id)+[CIFilterClassDefaults cache]::cache, "setEvictsObjectsWhenApplicationEntersBackground:", 1);
}

+ (void)clearCache
{
  objc_msgSend((id)objc_msgSend(a1, "cache"), "removeAllObjects");
}

@end

@implementation NSMutableDictionary(Goodies)

- (id)mf_objectForKey:()Goodies ofClass:
{
  id v6;
  id v7;

  v6 = a3;
  objc_msgSend(a1, "objectForKey:", v6);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  if (!v7)
  {
    v7 = objc_alloc_init(a4);
    objc_msgSend(a1, "setObject:forKey:", v7, v6);
  }

  return v7;
}

- (uint64_t)mf_setBool:()Goodies forKey:
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  return objc_msgSend(a1, "setObject:forKey:", v3);
}

- (void)mf_setInteger:()Goodies forKey:
{
  void *v6;
  id v7;

  v7 = a4;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "setObject:forKey:", v6, v7);

}

- (void)mf_addObject:()Goodies forKey:
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  void *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6 && v7)
  {
    v9 = (void *)objc_msgSend(v7, "copy");

    v8 = v9;
    CFDictionaryAddValue(a1, v9, v6);
  }
  else
  {
    MFLogGeneral();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = 138412546;
      v12 = v6;
      v13 = 2112;
      v14 = v8;
      _os_log_impl(&dword_1A4F90000, v10, OS_LOG_TYPE_INFO, "Bad arguments to %@, %@", (uint8_t *)&v11, 0x16u);
    }

  }
}

@end

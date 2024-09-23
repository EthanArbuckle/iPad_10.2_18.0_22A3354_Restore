@implementation NSMutableDictionary(Goodies)

- (uint64_t)mf_setBool:()Goodies forKey:
{
  const __CFString *v3;

  if (a3)
    v3 = CFSTR("YES");
  else
    v3 = CFSTR("NO");
  return objc_msgSend(a1, "setObject:forKey:", v3);
}

- (uint64_t)mf_setInteger:()Goodies forKey:
{
  return objc_msgSend(a1, "setObject:forKey:", objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:"), a4);
}

- (void)mf_addObject:()Goodies forKey:
{
  NSObject *v7;
  id v8;
  uint8_t buf[4];
  const void *v10;
  __int16 v11;
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  if (a3 && a4)
  {
    v8 = (id)objc_msgSend(a4, "copyWithZone:", 0);
    CFDictionaryAddValue(a1, v8, a3);

  }
  else
  {
    v7 = MFLogGeneral();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v10 = a3;
      v11 = 2112;
      v12 = a4;
      _os_log_impl(&dword_1C8839000, v7, OS_LOG_TYPE_INFO, "Bad arguments to %@, %@", buf, 0x16u);
    }
  }
}

- (id)mf_objectForKey:()Goodies ofClass:
{
  id v7;

  v7 = (id)objc_msgSend(a1, "objectForKey:");
  if (!v7)
  {
    v7 = objc_alloc_init(a4);
    objc_msgSend(a1, "setObject:forKey:", v7, a3);

  }
  return v7;
}

@end

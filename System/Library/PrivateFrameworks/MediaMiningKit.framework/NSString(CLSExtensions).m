@implementation NSString(CLSExtensions)

- (__CFString)cls_normalizedString
{
  __CFString *v1;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", a1);
  v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  CFStringNormalize(v1, kCFStringNormalizationFormD);
  CFStringFold(v1, 0x181uLL, 0);
  return v1;
}

- (id)cls_indentBy:()CLSExtensions
{
  void *v4;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t i;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  _BYTE v18[128];
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "componentsSeparatedByString:", CFSTR("\n"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_alloc_init(MEMORY[0x1E0CB37A0]);
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v17 = 0u;
  v6 = v4;
  v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
  if (v7)
  {
    v8 = v7;
    v9 = *(_QWORD *)v15;
    do
    {
      v10 = 0;
      do
      {
        if (*(_QWORD *)v15 != v9)
          objc_enumerationMutation(v6);
        v11 = *(_QWORD *)(*((_QWORD *)&v14 + 1) + 8 * v10);
        for (i = a3; i; --i)
          objc_msgSend(v5, "appendString:", CFSTR("\t"));
        objc_msgSend(v5, "appendFormat:", CFSTR("%@\n"), v11);
        ++v10;
      }
      while (v10 != v8);
      v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v14, v18, 16);
    }
    while (v8);
  }

  objc_msgSend(v5, "deleteCharactersInRange:", objc_msgSend(v5, "length") - 1, 1);
  return v5;
}

- (id)clsBetterComponentsSeparatedByCharactersInSet:()CLSExtensions
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  unint64_t v9;
  void *v10;
  void *v11;

  v4 = a3;
  objc_msgSend(a1, "stringByTrimmingCharactersInSet:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)MEMORY[0x1E0C99DE8];
  objc_msgSend(v5, "componentsSeparatedByCharactersInSet:", v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "arrayWithArray:", v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "removeObject:", &stru_1E84F9D30);
  if (objc_msgSend(v8, "count"))
  {
    v9 = 0;
    do
    {
      objc_msgSend(v8, "objectAtIndexedSubscript:", v9);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "stringByTrimmingCharactersInSet:", v4);
      v11 = (void *)objc_claimAutoreleasedReturnValue();

      objc_msgSend(v8, "replaceObjectAtIndex:withObject:", v9, v11);
      ++v9;
    }
    while (v9 < objc_msgSend(v8, "count"));
  }

  return v8;
}

+ (id)cls_generateUUID
{
  const __CFUUID *v0;
  const __CFUUID *v1;
  CFStringRef v2;
  CFStringRef v3;
  void *v4;

  v0 = CFUUIDCreate(0);
  if (!v0)
    __assert_rtn("+[NSString(CLSExtensions) cls_generateUUID]", "NSString+CLSExtensions.m", 20, "uuid != NULL");
  v1 = v0;
  v2 = CFUUIDCreateString(0, v0);
  if (!v2)
    __assert_rtn("+[NSString(CLSExtensions) cls_generateUUID]", "NSString+CLSExtensions.m", 23, "uuidString != NULL");
  v3 = v2;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithString:", v2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CFRelease(v3);
  CFRelease(v1);
  return v4;
}

@end

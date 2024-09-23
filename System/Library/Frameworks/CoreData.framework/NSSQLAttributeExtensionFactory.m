@implementation NSSQLAttributeExtensionFactory

+ (void)newExtensionsForAttribute:(uint64_t *)a3 error:
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  NSObject *v22;
  _BYTE buf[12];
  __int16 v25;
  int v26;
  const __CFString *v27;
  _QWORD v28[2];

  v28[1] = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  v5 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v6 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
  v7 = (void *)objc_msgSend((id)objc_msgSend((id)objc_msgSend(a2, "attributeDescription"), "userInfo"), "objectForKey:", CFSTR("NSTriggerKey"));
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v7, "length"))
    {
      *(_QWORD *)buf = 0;
      v9 = (void *)+[NSSQLAttributeExtensionFactory createUnvalidatedTriggerForString:onAttribute:]((uint64_t)NSSQLAttributeExtensionFactory, v8, a2);
      if (objc_msgSend(v9, "validate:", buf))
      {
        v10 = v6;
        v11 = v9;
      }
      else
      {
        v11 = *(void **)buf;
        v10 = v5;
      }
      objc_msgSend(v10, "addObject:", v11);

    }
  }
  v12 = (void *)objc_msgSend(v6, "copy");
  if (objc_msgSend(v5, "count"))
  {

    if (objc_msgSend(v5, "count") == 1)
    {
      v13 = objc_msgSend(v5, "lastObject");
      if (v13)
        goto LABEL_10;
    }
    else
    {
      v14 = *MEMORY[0x1E0CB28A8];
      v27 = CFSTR("NSDetailedErrors");
      v28[0] = v5;
      v13 = objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", v14, 134060, objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v28, &v27, 1));
      if (v13)
      {
LABEL_10:
        if (a3)
        {
          v12 = 0;
          *a3 = v13;
          goto LABEL_16;
        }
LABEL_15:
        v12 = 0;
        goto LABEL_16;
      }
    }
    v15 = objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Illegal attempt to return an error without one in %s:%d");
    _NSCoreDataLog(17, v15, v16, v17, v18, v19, v20, v21, (uint64_t)"/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeExtensionFactory.m");
    v22 = __pflogFaultLog;
    if (os_log_type_enabled((os_log_t)__pflogFaultLog, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(_QWORD *)&buf[4] = "/Library/Caches/com.apple.xbs/Sources/Persistence/NSSQLAttributeExtensionFactory.m";
      v25 = 1024;
      v26 = 48;
      _os_log_fault_impl(&dword_18A253000, v22, OS_LOG_TYPE_FAULT, "CoreData: Illegal attempt to return an error without one in %s:%d", buf, 0x12u);
    }
    goto LABEL_15;
  }
LABEL_16:

  return v12;
}

+ (uint64_t)createUnvalidatedTriggerForString:(void *)a3 onAttribute:
{
  uint64_t v5;
  void *v6;
  int v7;
  __objc2_class **v8;

  objc_opt_self();
  v5 = objc_msgSend(a3, "entity");
  v6 = (void *)objc_msgSend(a2, "stringByTrimmingCharactersInSet:", objc_msgSend(MEMORY[0x1E0CB3500], "whitespaceAndNewlineCharacterSet"));
  v7 = objc_msgSend((id)objc_msgSend(v6, "lowercaseString"), "hasSuffix:", CFSTR("@count"));
  v8 = off_1E1EDAD18;
  if (!v7)
    v8 = off_1E1EDACE0;
  return objc_msgSend(objc_alloc(*v8), "initWithObjectFromUserInfo:onAttributeNamed:onEntity:", v6, objc_msgSend(a3, "name"), v5);
}

@end

@implementation PocketAPIKeychainUtils

+ (id)getPasswordForUsername:(id)a3 andServiceName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  void *v13;
  uint64_t v14;
  OSStatus v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  OSStatus v21;
  CFTypeRef v22;
  id v23;
  void *v24;
  void *v25;
  CFTypeRef v26;
  CFTypeRef result;

  if (!a3 || !a4)
  {
    if (a5)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = -2000;
      goto LABEL_11;
    }
    return 0;
  }
  if (a5)
    *a5 = 0;
  v8 = objc_alloc(MEMORY[0x24BDBCE30]);
  v9 = (id)objc_msgSend(v8, "initWithObjects:", *MEMORY[0x24BDE9220], *MEMORY[0x24BDE8FA8], *MEMORY[0x24BDE9128], 0);
  v10 = objc_alloc(MEMORY[0x24BDBCE30]);
  v11 = (id)objc_msgSend(v10, "initWithObjects:", *MEMORY[0x24BDE9230], a3, a4, 0);
  v12 = (id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCED8]), "initWithObjects:forKeys:", v11, v9);
  result = 0;
  v13 = (void *)objc_msgSend(v12, "mutableCopy");
  v14 = *MEMORY[0x24BDBD270];
  objc_msgSend(v13, "setObject:forKey:", *MEMORY[0x24BDBD270], *MEMORY[0x24BDE94C0]);
  v15 = SecItemCopyMatching((CFDictionaryRef)v13, &result);

  if (!v15)
  {
    v26 = 0;
    v20 = (void *)objc_msgSend(v12, "mutableCopy");
    objc_msgSend(v20, "setObject:forKey:", v14, *MEMORY[0x24BDE94C8]);
    v21 = SecItemCopyMatching((CFDictionaryRef)v20, &v26);
    v22 = (id)v26;

    if (!v21)
    {
      if (v26)
      {
        v23 = objc_alloc(MEMORY[0x24BDD17C8]);
        v24 = (void *)objc_msgSend(v23, "initWithData:encoding:", v26, 4);
      }
      else if (a5)
      {
        v25 = (void *)objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("PocketAPIKeychainUtilsErrorDomain"), -1999, 0);
        v24 = 0;
        *a5 = v25;
      }
      else
      {
        v24 = 0;
      }
      return v24;
    }
    if (v21 == -25300)
    {
      if (a5)
      {
        v17 = (void *)MEMORY[0x24BDD1540];
        v18 = -1999;
        goto LABEL_11;
      }
    }
    else if (a5)
    {
      v17 = (void *)MEMORY[0x24BDD1540];
      v18 = v21;
      goto LABEL_11;
    }
    return 0;
  }
  v16 = 0;
  if (a5 && v15 != -25300)
  {
    v17 = (void *)MEMORY[0x24BDD1540];
    v18 = v15;
LABEL_11:
    v19 = (void *)objc_msgSend(v17, "errorWithDomain:code:userInfo:", CFSTR("PocketAPIKeychainUtilsErrorDomain"), v18, 0);
    v16 = 0;
    *a5 = v19;
  }
  return v16;
}

+ (BOOL)storeUsername:(id)a3 andPassword:(id)a4 forServiceName:(id)a5 updateExisting:(BOOL)a6 error:(id *)a7
{
  _BOOL4 v10;
  id v13;
  id v14;
  void *v15;
  uint64_t v16;
  BOOL result;
  char v18;
  id v19;
  id v20;
  id v21;
  id v22;
  const __CFDictionary *v23;
  void *v24;
  uint64_t v25;
  OSStatus v26;
  id v27;
  id v28;
  id v29;
  id v30;
  OSStatus v31;
  id v32;

  if (!a3 || !a4 || !a5)
  {
    if (!a7)
      return 0;
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = -2000;
LABEL_11:
    v14 = (id)objc_msgSend(v15, "errorWithDomain:code:userInfo:", CFSTR("PocketAPIKeychainUtilsErrorDomain"), v16, 0, a6);
    goto LABEL_12;
  }
  v10 = a6;
  v32 = 0;
  v13 = +[PocketAPIKeychainUtils getPasswordForUsername:andServiceName:error:](PocketAPIKeychainUtils, "getPasswordForUsername:andServiceName:error:");
  if (objc_msgSend(0, "code") == -1999)
  {
    v32 = 0;
    objc_msgSend(a1, "deleteItemForUsername:andServiceName:error:", a3, a5, &v32);
  }
  if (objc_msgSend(v32, "code"))
  {
    if (a7)
    {
      v14 = v32;
LABEL_12:
      result = 0;
      *a7 = v14;
      return result;
    }
    return 0;
  }
  if (a7)
    *a7 = 0;
  if (v13)
  {
    v18 = objc_msgSend(v13, "isEqualToString:", a4);
    result = 1;
    if ((v18 & 1) != 0 || !v10)
      return result;
    v19 = objc_alloc(MEMORY[0x24BDBCE30]);
    v20 = (id)objc_msgSend(v19, "initWithObjects:", *MEMORY[0x24BDE9220], *MEMORY[0x24BDE9128], *MEMORY[0x24BDE90A0], *MEMORY[0x24BDE8FA8], 0);
    v21 = objc_alloc(MEMORY[0x24BDBCE30]);
    v22 = (id)objc_msgSend(v21, "initWithObjects:", *MEMORY[0x24BDE9230], a5, a5, a3, 0);
    v23 = (const __CFDictionary *)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v22, v20);
    v24 = (void *)MEMORY[0x24BDBCE70];
    v25 = objc_msgSend(a4, "dataUsingEncoding:", 4);
    v26 = SecItemUpdate(v23, (CFDictionaryRef)objc_msgSend(v24, "dictionaryWithObject:forKey:", v25, *MEMORY[0x24BDE9550]));
  }
  else
  {
    v27 = objc_alloc(MEMORY[0x24BDBCE30]);
    v28 = (id)objc_msgSend(v27, "initWithObjects:", *MEMORY[0x24BDE9220], *MEMORY[0x24BDE9128], *MEMORY[0x24BDE90A0], *MEMORY[0x24BDE8FA8], *MEMORY[0x24BDE9550], 0);
    v29 = objc_alloc(MEMORY[0x24BDBCE30]);
    v30 = (id)objc_msgSend(v29, "initWithObjects:", *MEMORY[0x24BDE9230], a5, a5, a3, objc_msgSend(a4, "dataUsingEncoding:", 4), 0);
    v26 = SecItemAdd((CFDictionaryRef)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v30, v28), 0);
  }
  v31 = v26;
  result = v26 == 0;
  if (a7 && v31)
  {
    v15 = (void *)MEMORY[0x24BDD1540];
    v16 = v31;
    goto LABEL_11;
  }
  return result;
}

+ (BOOL)deleteItemForUsername:(id)a3 andServiceName:(id)a4 error:(id *)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  OSStatus v12;
  BOOL result;
  void *v14;
  uint64_t v15;
  void *v16;

  if (a3 && a4)
  {
    if (a5)
      *a5 = 0;
    v8 = objc_alloc(MEMORY[0x24BDBCE30]);
    v9 = (id)objc_msgSend(v8, "initWithObjects:", *MEMORY[0x24BDE9220], *MEMORY[0x24BDE8FA8], *MEMORY[0x24BDE9128], *MEMORY[0x24BDE94C0], 0);
    v10 = objc_alloc(MEMORY[0x24BDBCE30]);
    v11 = (id)objc_msgSend(v10, "initWithObjects:", *MEMORY[0x24BDE9230], a3, a4, *MEMORY[0x24BDBD270], 0);
    v12 = SecItemDelete((CFDictionaryRef)(id)objc_msgSend(objc_alloc(MEMORY[0x24BDBCE70]), "initWithObjects:forKeys:", v11, v9));
    result = v12 == 0;
    if (a5 && v12)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = v12;
LABEL_10:
      v16 = (void *)objc_msgSend(v14, "errorWithDomain:code:userInfo:", CFSTR("PocketAPIKeychainUtilsErrorDomain"), v15, 0);
      result = 0;
      *a5 = v16;
    }
  }
  else
  {
    if (a5)
    {
      v14 = (void *)MEMORY[0x24BDD1540];
      v15 = -2000;
      goto LABEL_10;
    }
    return 0;
  }
  return result;
}

@end

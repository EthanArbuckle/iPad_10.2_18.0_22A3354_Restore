@implementation NSURL(NSURLPromisedItems)

- (BOOL)getPromisedItemResourceValue:()NSURLPromisedItems forKey:error:
{
  uint64_t *v7;
  int v8;
  _BOOL8 v9;
  _QWORD v11[9];
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  char v15;
  uint64_t v16;
  uint64_t *v17;
  uint64_t v18;
  void (*v19)(uint64_t, uint64_t);
  void (*v20)(uint64_t);
  uint64_t v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  uint64_t v27;
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0;
  v23 = &v22;
  v24 = 0x3052000000;
  v25 = __Block_byref_object_copy__8;
  v26 = __Block_byref_object_dispose__8;
  v27 = 0;
  v16 = 0;
  v17 = &v16;
  v18 = 0x3052000000;
  v19 = __Block_byref_object_copy__8;
  v20 = __Block_byref_object_dispose__8;
  v21 = 0;
  v12 = 0;
  v13 = &v12;
  v14 = 0x2020000000;
  v15 = 0;
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __71__NSURL_NSURLPromisedItems__getPromisedItemResourceValue_forKey_error___block_invoke;
  v11[3] = &unk_1E0F4EC30;
  v11[6] = &v12;
  v11[7] = &v22;
  v11[4] = a1;
  v11[5] = a4;
  v11[8] = &v16;
  objc_msgSend(a1, "_performWithPhysicalURL:", v11);
  v7 = v13;
  v8 = *((unsigned __int8 *)v13 + 24);
  if (a5 && !*((_BYTE *)v13 + 24))
  {
    *a5 = v17[5];
    v8 = *((unsigned __int8 *)v7 + 24);
  }
  if (a3 && v8)
  {
    *a3 = v23[5];
    v8 = *((unsigned __int8 *)v7 + 24);
  }
  v9 = v8 != 0;
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);
  _Block_object_dispose(&v22, 8);
  return v9;
}

- (void)_performWithPhysicalURL:()NSURLPromisedItems
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  _QWORD v9[2];

  v9[1] = *MEMORY[0x1E0C80C00];
  v5 = (void *)_CFURLPromiseCopyPhysicalURL();
  if (v5)
  {
    v6 = v5;
    if ((objc_msgSend(v5, "isEqual:", a1) & 1) != 0 || !_CFURLIsItemPromiseAtURL())
    {
      v7 = -1;
      v8 = a1;
    }
    else
    {
      v7 = objc_msgSend(v6, "_promiseExtensionConsume");
      v9[0] = 0;
      if (objc_msgSend(v6, "checkResourceIsReachableAndReturnError:", v9))
        v8 = v6;
      else
        v8 = a1;
    }
    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, v8);
    objc_msgSend(a1, "_promiseExtensionRelease:", v7);
    CFRelease(v6);
  }
  else
  {
    (*(void (**)(uint64_t, void *))(a3 + 16))(a3, a1);
    objc_msgSend(a1, "_promiseExtensionRelease:", -1);
  }
}

- (uint64_t)_promiseExtensionRelease:()NSURLPromisedItems
{
  uint64_t result;

  if ((a3 & 0x8000000000000000) == 0)
    return sandbox_extension_release();
  return result;
}

- (uint64_t)promisedItemResourceValuesForKeys:()NSURLPromisedItems error:
{
  uint64_t *v5;
  uint64_t v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  void (*v12)(uint64_t, uint64_t);
  void (*v13)(uint64_t);
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  void (*v18)(uint64_t, uint64_t);
  void (*v19)(uint64_t);
  uint64_t v20;
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v15 = 0;
  v16 = &v15;
  v17 = 0x3052000000;
  v18 = __Block_byref_object_copy__8;
  v19 = __Block_byref_object_dispose__8;
  v20 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x3052000000;
  v12 = __Block_byref_object_copy__8;
  v13 = __Block_byref_object_dispose__8;
  v14 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __69__NSURL_NSURLPromisedItems__promisedItemResourceValuesForKeys_error___block_invoke;
  v8[3] = &unk_1E0F4EC58;
  v8[4] = a1;
  v8[5] = a3;
  v8[6] = &v9;
  v8[7] = &v15;
  objc_msgSend(a1, "_performWithPhysicalURL:", v8);
  v5 = v10;
  v6 = v10[5];
  if (a4 && !v6)
  {
    *a4 = v16[5];
    v6 = v5[5];
  }
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v15, 8);
  return v6;
}

- (uint64_t)_promiseExtensionConsume
{
  const __CFData *v0;
  const __CFData *v1;
  uint64_t v2;

  v0 = (const __CFData *)MEMORY[0x186DA7DA8]();
  if (!v0)
    return -1;
  v1 = v0;
  CFDataGetBytePtr(v0);
  v2 = sandbox_extension_consume();
  CFRelease(v1);
  return v2;
}

- (NSError)_fixedUpSideFaultError:()NSURLPromisedItems
{
  void *v5;
  uint64_t v6;

  v5 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithDictionary:", objc_msgSend(a3, "userInfo"));
  if (objc_msgSend(v5, "objectForKey:", CFSTR("NSURL")))
    objc_msgSend(v5, "setObject:forKey:", a1, CFSTR("NSURL"));
  if (objc_msgSend(v5, "objectForKey:", CFSTR("NSFilePath")))
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a1, "path"), CFSTR("NSFilePath"));
  v6 = objc_msgSend(v5, "objectForKey:", CFSTR("NSUnderlyingError"));
  if (v6)
    objc_msgSend(v5, "setObject:forKey:", objc_msgSend(a1, "_fixedUpSideFaultError:", v6), CFSTR("NSUnderlyingError"));
  return +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", objc_msgSend(a3, "domain"), objc_msgSend(a3, "code"), v5);
}

- (BOOL)checkPromisedItemIsReachableAndReturnError:()NSURLPromisedItems
{
  uint64_t *v4;
  int v5;
  _BOOL8 v6;
  _QWORD v8[8];
  uint64_t v9;
  uint64_t *v10;
  uint64_t v11;
  char v12;
  uint64_t v13;
  uint64_t *v14;
  uint64_t v15;
  void (*v16)(uint64_t, uint64_t);
  void (*v17)(uint64_t);
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v13 = 0;
  v14 = &v13;
  v15 = 0x3052000000;
  v16 = __Block_byref_object_copy__8;
  v17 = __Block_byref_object_dispose__8;
  v18 = 0;
  v9 = 0;
  v10 = &v9;
  v11 = 0x2020000000;
  v12 = 0;
  v8[0] = MEMORY[0x1E0C809B0];
  v8[1] = 3221225472;
  v8[2] = __72__NSURL_NSURLPromisedItems__checkPromisedItemIsReachableAndReturnError___block_invoke;
  v8[3] = &unk_1E0F4EC08;
  v8[4] = a1;
  v8[5] = &v9;
  v8[6] = &v13;
  v8[7] = a3;
  objc_msgSend(a1, "_performWithPhysicalURL:", v8);
  v4 = v10;
  v5 = *((unsigned __int8 *)v10 + 24);
  if (a3 && !*((_BYTE *)v10 + 24))
  {
    *a3 = v14[5];
    v5 = *((unsigned __int8 *)v4 + 24);
  }
  v6 = v5 != 0;
  _Block_object_dispose(&v9, 8);
  _Block_object_dispose(&v13, 8);
  return v6;
}

- (id)_valueFromFaultDictionary:()NSURLPromisedItems forKey:
{
  uint64_t v6;
  const __CFString *v7;

  if (!objc_msgSend(a4, "isEqualToString:", *MEMORY[0x1E0C99AD0]))
    return (id)objc_msgSend(a3, "objectForKey:", a4);
  v6 = objc_msgSend((id)objc_msgSend(a3, "objectForKey:", *MEMORY[0x1E0C99A90]), "pathExtension");
  if (v6)
    v7 = (const __CFString *)v6;
  else
    v7 = &stru_1E0F56070;
  if (qword_1ECD09BC8 != -1)
    dispatch_once(&qword_1ECD09BC8, &__block_literal_global_15);
  return (id)_MergedGlobals_96(qword_1ECD09BC0, v7, 0);
}

@end

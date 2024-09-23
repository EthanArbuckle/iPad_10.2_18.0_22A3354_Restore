@implementation NSURL

+ (uint64_t)setIOPolicy:(uint64_t)a1 type:(uint64_t)a2 scope:forBlock:
{
  uint64_t result;
  int v4;
  int v5;
  uint8_t buf[4];
  int v7;
  __int16 v8;
  int v9;
  __int16 v10;
  int v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  objc_opt_self();
  getpid();
  if (sandbox_check())
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_debug_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "[NSURL setIOPolicy:] sandbox_check: current process does not allow iopolicy syscalls", buf, 2u);
    }
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  v4 = getiopolicy_np(3, 1);
  if (v4 == 1)
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  v5 = v4;
  if (v4 == -1)
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 67109632;
      v7 = 1;
      v8 = 1024;
      v9 = 3;
      v10 = 1024;
      v11 = 1;
      _os_log_error_impl(&dword_1817D9000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "[NSURL setIOPolicy:] getiopolicy_np failed when setting policy: %d, type: %d, scope: %d", buf, 0x14u);
    }
    return (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  }
  setiopolicy_np(3, 1, 1);
  result = (*(uint64_t (**)(uint64_t))(a2 + 16))(a2);
  if ((v5 & 0x80000000) == 0)
    return setiopolicy_np(3, 1, v5);
  return result;
}

uint64_t __57__NSURL_NSURLPathUtilities__URLByAppendingPathComponent___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40), "getResourceValue:forKey:error:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40, *MEMORY[0x1E0C999D0], 0);
  if ((_DWORD)result)
  {
    result = objc_msgSend(*(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40), "BOOLValue");
    if ((_DWORD)result)
    {
      result = objc_msgSend(*(id *)(a1 + 32), "URLByAppendingPathComponent:isDirectory:", *(_QWORD *)(a1 + 40), 1);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

uint64_t __68__NSURL_NSURLPathUtilities__checkResourceIsReachableAndReturnError___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = CFURLResourceIsReachable(*(CFURLRef *)(a1 + 40), *(CFErrorRef **)(a1 + 48));
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = (_DWORD)result != 0;
  return result;
}

void __31__NSURL_NSURL__parameterString__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  int v4;
  uint64_t v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v2 = _NSOSLog();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = 138477827;
    v5 = v3;
    _os_log_debug_impl(&dword_1817D9000, v2, OS_LOG_TYPE_DEBUG, "NSURL parameterString is deprecated and now always returns nil. The path component now includes the part of the URL string which parameterString used to return.\nURL = %{private}@", (uint8_t *)&v4, 0xCu);
  }
}

void __71__NSURL_NSURLPromisedItems__getPromisedItemResourceValue_forKey_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  uint64_t v5;
  const void *v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  void *v14;
  uint64_t v15;
  uint64_t v16;

  if (*(void **)(a1 + 32) == a2)
  {
    v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40;
    v9 = *(_QWORD *)(a1 + 40);
    v10 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40;
    v11 = a2;
LABEL_11:
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(v11, "getResourceValue:forKey:error:", v8, v9, v10);
    return;
  }
  v4 = objc_msgSend((id)unk_1EDD087D0(&unk_1E0FCED10, "objectForKey:", *(_QWORD *)(a1 + 40)), "unsignedIntegerValue");
  switch(v4)
  {
    case 3:
      v8 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40;
      v11 = *(void **)(a1 + 32);
      v9 = *(_QWORD *)(a1 + 40);
      v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
LABEL_10:
      v10 = v12 + 40;
      goto LABEL_11;
    case 2:
LABEL_7:
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      return;
    case 1:
      v5 = _CFURLCopyPropertiesOfPromiseAtURL();
      if (v5)
      {
        v6 = (const void *)v5;
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_valueFromFaultDictionary:forKey:", v5, *(_QWORD *)(a1 + 40));
        v7 = *(id *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
        CFRelease(v6);
        goto LABEL_7;
      }
      return;
  }
  v13 = *(void **)(a1 + 40);
  if (objc_msgSend(v13, "isEqualToString:", *MEMORY[0x1E0C999F0]))
    v14 = (void *)*MEMORY[0x1E0C9AC38];
  else
    v14 = v13;
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = objc_msgSend(a2, "getResourceValue:forKey:error:", *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40, v14, *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40);
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_fixedUpSideFaultError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8)+ 40));
    return;
  }
  v15 = *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8);
  v16 = *(_QWORD *)(v15 + 40);
  v8 = v15 + 40;
  if (!v16)
  {
    v11 = *(void **)(a1 + 32);
    v9 = *(_QWORD *)(a1 + 40);
    v12 = *(_QWORD *)(*(_QWORD *)(a1 + 64) + 8);
    goto LABEL_10;
  }
}

void __69__NSURL_NSURLPromisedItems__promisedItemResourceValuesForKeys_error___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  uint64_t v7;
  uint64_t v8;
  id v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  const void *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t j;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  void *v21;
  id v22;
  void *v23;
  id v24;
  uint64_t v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  void *v29;
  uint64_t k;
  void *v31;
  int v32;
  int v33;
  unint64_t v34;
  void *v35;
  uint64_t v36;
  uint64_t m;
  void *v38;
  _BYTE v40[128];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  _BYTE v45[128];
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  CFTypeRef cf;
  CFTypeRef *p_cf;
  uint64_t v54;
  void (*v55)(uint64_t, uint64_t);
  void (*v56)(uint64_t);
  uint64_t v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  uint64_t v62;

  v62 = *MEMORY[0x1E0C80C00];
  if (*(void **)(a1 + 32) == a2)
  {
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = objc_msgSend(a2, "resourceValuesForKeys:error:", *(_QWORD *)(a1 + 40), *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    return;
  }
  v50 = 0u;
  v51 = 0u;
  v46 = 0u;
  v47 = 0u;
  v48 = 0u;
  v49 = 0u;
  v3 = *(void **)(a1 + 40);
  v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
  if (v4)
  {
    v5 = *(_QWORD *)v47;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v47 != v5)
          objc_enumerationMutation(v3);
        v7 = *(_QWORD *)(*((_QWORD *)&v46 + 1) + 8 * i);
        v8 = objc_msgSend((id)unk_1EDD088A8(&unk_1E0FCED38, "objectForKey:", v7), "unsignedIntegerValue");
        v9 = (id)*((_QWORD *)&v50 + v8);
        if (!v9)
        {
          v9 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
          *((_QWORD *)&v50 + v8) = v9;
        }
        objc_msgSend(v9, "addObject:", v7);
      }
      v4 = objc_msgSend(v3, "countByEnumeratingWithState:objects:count:", &v46, v45, 16);
    }
    while (v4);
    v10 = *((_QWORD *)&v51 + 1);
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    if (v10)
    {
      v12 = objc_msgSend(*(id *)(a1 + 32), "resourceValuesForKeys:error:", v10, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
      if (!v12)
        goto LABEL_57;
      objc_msgSend(v11, "addEntriesFromDictionary:", v12);
    }
  }
  else
  {
    v11 = (void *)objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  }
  v13 = (void *)*((_QWORD *)&v50 + 1);
  if (*((_QWORD *)&v50 + 1))
  {
    cf = 0;
    v14 = (const void *)_CFURLCopyPropertiesOfPromiseAtURL();
    if (v14)
    {
      v43 = 0u;
      v44 = 0u;
      v41 = 0u;
      v42 = 0u;
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
      if (v15)
      {
        v16 = *(_QWORD *)v42;
        do
        {
          for (j = 0; j != v15; ++j)
          {
            if (*(_QWORD *)v42 != v16)
              objc_enumerationMutation(v13);
            v18 = *(_QWORD *)(*((_QWORD *)&v41 + 1) + 8 * j);
            v19 = objc_msgSend(*(id *)(a1 + 32), "_valueFromFaultDictionary:forKey:", v14, v18);
            if (v19)
              objc_msgSend(v11, "setObject:forKey:", v19, v18);
          }
          v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v41, v40, 16);
        }
        while (v15);
      }
      CFRelease(v14);
    }
    else
    {
      if (cf)
      {
        *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_fixedUpSideFaultError:");
        CFRelease(cf);
      }
      v11 = 0;
    }
  }
  v20 = (void *)v50;
  if ((_QWORD)v50)
  {
    cf = 0;
    p_cf = &cf;
    v54 = 0x3052000000;
    v55 = __Block_byref_object_copy__8;
    v56 = __Block_byref_object_dispose__8;
    v57 = 0;
    *(_QWORD *)&v58 = MEMORY[0x1E0C809B0];
    *((_QWORD *)&v58 + 1) = 3221225472;
    *(_QWORD *)&v59 = ___virtualizeURLKeysForAccessingFault_block_invoke;
    *((_QWORD *)&v59 + 1) = &unk_1E0F4EC80;
    *(_QWORD *)&v60 = v50;
    *((_QWORD *)&v60 + 1) = &cf;
    objc_msgSend((id)v50, "enumerateObjectsUsingBlock:", &v58);
    v21 = (void *)p_cf[5];
    v22 = v20;
    if (v21)
      v22 = v21;
    v38 = v20;
    _Block_object_dispose(&cf, 8);
    v23 = (void *)objc_msgSend(a2, "resourceValuesForKeys:error:", v22, *(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40);
    v24 = v23;
    if (!v23)
    {
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 40) = objc_msgSend(*(id *)(a1 + 32), "_fixedUpSideFaultError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)+ 40));
      goto LABEL_57;
    }
    v58 = 0u;
    v59 = 0u;
    v60 = 0u;
    v61 = 0u;
    v25 = objc_msgSend(v23, "countByEnumeratingWithState:objects:count:", &v58, &cf, 16);
    if (v25)
    {
      v26 = 0;
      v27 = *(_QWORD *)v59;
      v28 = *MEMORY[0x1E0C9AC38];
      v29 = (void *)*MEMORY[0x1E0C999F0];
      do
      {
        for (k = 0; k != v25; ++k)
        {
          if (*(_QWORD *)v59 != v27)
            objc_enumerationMutation(v24);
          v31 = *(void **)(*((_QWORD *)&v58 + 1) + 8 * k);
          v32 = objc_msgSend(v31, "isEqualToString:", v28);
          if (v29 == v31)
            v33 = 0;
          else
            v33 = v32;
          if (v33 == 1)
          {
            if (!v26)
              v26 = (void *)objc_msgSend(v24, "mutableCopy");
            objc_msgSend(v26, "setObject:forKey:", objc_msgSend(v24, "objectForKey:", v31), v29);
            objc_msgSend(v26, "removeObjectForKey:", v31);
          }
        }
        v25 = objc_msgSend(v24, "countByEnumeratingWithState:objects:count:", &v58, &cf, 16);
      }
      while (v25);
      if (v26)
        v24 = v26;
    }
    objc_msgSend(v11, "addEntriesFromDictionary:", v24);
    v34 = objc_msgSend(v24, "count");
    if (v34 < objc_msgSend(v38, "count"))
    {
      v35 = (void *)objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithArray:", v38);
      objc_msgSend(v35, "removeObjectsInArray:", objc_msgSend(v24, "allKeys"));
      v36 = objc_msgSend(*(id *)(a1 + 32), "resourceValuesForKeys:error:", v35, 0);
      if (v36)
        objc_msgSend(v11, "addEntriesFromDictionary:", v36);
      else
        NSLog((NSString *)CFSTR("-[NSURL promisedItemResourceValuesForKeys:error:]: Unable to handle keys: %@"), v35);
    }
  }
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = v11;
LABEL_57:
  for (m = 0; m != 32; m += 8)

}

uint64_t __50__NSURL_NSURL__initFileURLWithPath_relativeToURL___block_invoke(_QWORD *a1)
{
  uint64_t result;
  id v3[2];

  v3[1] = *(id *)MEMORY[0x1E0C80C00];
  v3[0] = 0;
  result = objc_msgSend(*(id *)(*(_QWORD *)(a1[6] + 8) + 24), "getResourceValue:forKey:error:", v3, *MEMORY[0x1E0C999D0], 0);
  if ((_DWORD)result)
  {
    result = objc_msgSend(v3[0], "BOOLValue");
    if ((_DWORD)result)
    {
      CFRelease(*(CFTypeRef *)(*(_QWORD *)(a1[6] + 8) + 24));
      result = MEMORY[0x186DA737C](*MEMORY[0x1E0C9AE00], a1[4], 0, 1, a1[5]);
      *(_QWORD *)(*(_QWORD *)(a1[6] + 8) + 24) = result;
    }
  }
  return result;
}

uint64_t __72__NSURL_NSURLPromisedItems__checkPromisedItemIsReachableAndReturnError___block_invoke(uint64_t a1, void *a2)
{
  void *v4;
  uint64_t result;

  v4 = *(void **)(a1 + 32);
  result = objc_msgSend(a2, "checkResourceIsReachableAndReturnError:", *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40);
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  if (v4 != a2 && !*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
  {
    if (*(_QWORD *)(a1 + 56))
    {
      result = objc_msgSend(*(id *)(a1 + 32), "_fixedUpSideFaultError:", *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = result;
    }
  }
  return result;
}

void __62__NSURL_NSURLPromisedItems___valueFromFaultDictionary_forKey___block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  BOOL v3;

  v0 = dlopen("/System/Library/Frameworks/MobileCoreServices.framework/MobileCoreServices", 256);
  if (v0)
  {
    v1 = v0;
    _MergedGlobals_96 = (uint64_t (*)(_QWORD, _QWORD, _QWORD))dlsym(v0, "UTTypeCreatePreferredIdentifierForTag");
    v2 = *(_QWORD *)dlsym(v1, "kUTTagClassFilenameExtension");
    qword_1ECD09BC0 = v2;
    if (_MergedGlobals_96)
      v3 = v2 == 0;
    else
      v3 = 1;
    if (v3)
      NSLog((NSString *)CFSTR("NSURL_Promises couldn't load a MobileCoreServices symbol."));
  }
}

void __20__NSURL_NSURL__init__block_invoke(uint64_t a1)
{
  NSLog((NSString *)CFSTR("-[NSURL init] called; %@ Please use one of the documented NSURL initialization methods instead (initWithString:, initFileURLWithPath:, etc.). This message shown only once."),
    *(_QWORD *)(a1 + 32));
}

@end

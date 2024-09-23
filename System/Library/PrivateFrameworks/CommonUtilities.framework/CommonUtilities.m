uint64_t CUTIsInternalInstall()
{
  if (qword_1ECD8FDE8 != -1)
    dispatch_once(&qword_1ECD8FDE8, &unk_1E448FEF8);
  return byte_1ECD8FDE0;
}

void sub_1A0BC43D0()
{
  id v0;
  void *v1;
  void *v2;
  uint64_t v3;
  void *v4;
  id v5;

  objc_msgSend(CFSTR("/"), "length");
  v0 = objc_alloc(MEMORY[0x1E0C99D20]);
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("System/Library/PrivateFrameworks/"));
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("System/Library/Frameworks/"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/"), "stringByAppendingPathComponent:", CFSTR("AppleInternal/Library/Frameworks/"));
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v0, "initWithObjects:", v5, v1, v2, 0);
  v4 = (void *)qword_1ECD8FE00;
  qword_1ECD8FE00 = v3;

}

void sub_1A0BC4554(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0BC4704(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0BC4730(uint64_t a1, uint64_t a2, int a3)
{
  void *v4;
  id v5;

  if (a3 == -536723200)
  {
    +[CUTPowerMonitor sharedInstance](CUTPowerMonitor, "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "updateBatteryLevelWithBatteryEntry:", a2);

    +[CUTPowerMonitor sharedInstance](CUTPowerMonitor, "sharedInstance");
    v5 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "updateBatteryConnectedStateWithBatteryEntry:", a2);

  }
}

void sub_1A0BC49B0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0BC4A6C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id CUTProcessNameForPid(int a1)
{
  __int128 v1;
  _OWORD v3[4];
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v3[2] = v1;
  v3[3] = v1;
  v3[0] = v1;
  v3[1] = v1;
  if (proc_name(a1, v3, 0x40u) < 1)
    return 0;
  else
    return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithUTF8String:", v3);
}

id CUTWeakLinkClass(void *a1, void *a2)
{
  NSString *v3;
  id v4;
  NSObject *v5;
  void *v6;
  int v8;
  NSString *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = a2;
  if (!sub_1A0BC5180(v4))
  {
    +[CUTLog weakLink](CUTLog, "weakLink");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 138543618;
      v9 = v3;
      v10 = 2114;
      v11 = v4;
      _os_log_impl(&dword_1A0BC3000, v5, OS_LOG_TYPE_DEFAULT, "Could not load class {class: %{public}@, framework: %{public}@}", (uint8_t *)&v8, 0x16u);
    }

  }
  NSClassFromString(v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

void *CUTWeakLinkSymbol(const char *a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  NSObject *v6;
  int v8;
  const char *v9;
  __int16 v10;
  id v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = sub_1A0BC5180(v3);
  if (v4)
  {
    v5 = dlsym(v4, a1);
  }
  else
  {
    +[CUTLog weakLink](CUTLog, "weakLink");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      v8 = 136446466;
      v9 = a1;
      v10 = 2114;
      v11 = v3;
      _os_log_impl(&dword_1A0BC3000, v6, OS_LOG_TYPE_DEFAULT, "Could not load symbol {symbol: %{public}s, framework: %{public}@}", (uint8_t *)&v8, 0x16u);
    }

    v5 = 0;
  }

  return v5;
}

void *sub_1A0BC5180(void *a1)
{
  id v1;
  unint64_t v2;
  const __CFDictionary *Mutable;
  void *Value;
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t i;
  void *v11;
  void *v12;
  void *v13;
  char v14;
  NSObject *v15;
  id v16;
  id v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  NSObject *v22;
  id v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint8_t buf[4];
  id v30;
  uint8_t v31[4];
  id v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD8FDF0);
  v2 = 0x1ECD8F000uLL;
  Mutable = (const __CFDictionary *)qword_1ECD8FDF8;
  if (!qword_1ECD8FDF8)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    qword_1ECD8FDF8 = (uint64_t)Mutable;
  }
  Value = (void *)CFDictionaryGetValue(Mutable, v1);
  os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD8FDF0);
  if (!Value)
  {
    v5 = v1;
    if (qword_1ECD8FE08 != -1)
      dispatch_once(&qword_1ECD8FE08, &unk_1E448FED8);
    if (objc_msgSend(v5, "rangeOfString:", CFSTR(".framework")) == 0x7FFFFFFFFFFFFFFFLL)
    {
      if (objc_msgSend(v5, "rangeOfString:", CFSTR(".dylib")) == 0x7FFFFFFFFFFFFFFFLL)
      {
        v24 = v1;
        v27 = 0u;
        v28 = 0u;
        v25 = 0u;
        v26 = 0u;
        v6 = (id)qword_1ECD8FE00;
        v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
        if (v7)
        {
          v8 = v7;
          v9 = *(_QWORD *)v26;
          while (2)
          {
            for (i = 0; i != v8; ++i)
            {
              if (*(_QWORD *)v26 != v9)
                objc_enumerationMutation(v6);
              objc_msgSend(*(id *)(*((_QWORD *)&v25 + 1) + 8 * i), "stringByAppendingPathComponent:", v5);
              v11 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v11, "stringByAppendingPathExtension:", CFSTR("framework"));
              v12 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
              v13 = (void *)objc_claimAutoreleasedReturnValue();
              v14 = objc_msgSend(v13, "fileExistsAtPath:", v12);

              if ((v14 & 1) != 0)
              {
                sub_1A0BC551C(v12);
                v18 = (void *)objc_claimAutoreleasedReturnValue();

                v1 = v24;
                v2 = 0x1ECD8F000;
                goto LABEL_22;
              }

            }
            v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v25, v31, 16);
            if (v8)
              continue;
            break;
          }
        }

        +[CUTLog weakLink](CUTLog, "weakLink");
        v15 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138543362;
          v30 = v5;
          _os_log_impl(&dword_1A0BC3000, v15, OS_LOG_TYPE_DEFAULT, "Could not find binary path for framework name: %{public}@", buf, 0xCu);
        }

        v16 = 0;
        v1 = v24;
        goto LABEL_27;
      }
      v17 = v5;
    }
    else
    {
      sub_1A0BC551C(v5);
      v17 = (id)objc_claimAutoreleasedReturnValue();
    }
    v18 = v17;
LABEL_22:

    if (v18)
    {
      v16 = objc_retainAutorelease(v18);
      v19 = dlopen((const char *)objc_msgSend(v16, "UTF8String"), 1);
      if (v19)
      {
        Value = v19;
        os_unfair_lock_lock((os_unfair_lock_t)&unk_1ECD8FDF0);
        v20 = (void *)CFDictionaryGetValue(*(CFDictionaryRef *)(v2 + 3576), v5);
        if (v20)
        {
          v21 = v20;
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD8FDF0);
          dlclose(Value);
          Value = v21;
        }
        else
        {
          CFDictionarySetValue(*(CFMutableDictionaryRef *)(v2 + 3576), v5, Value);
          os_unfair_lock_unlock((os_unfair_lock_t)&unk_1ECD8FDF0);
        }
LABEL_30:

        goto LABEL_31;
      }
    }
    else
    {
      v16 = 0;
    }
LABEL_27:
    +[CUTLog weakLink](CUTLog, "weakLink");
    v22 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)v31 = 138543362;
      v32 = v16;
      _os_log_impl(&dword_1A0BC3000, v22, OS_LOG_TYPE_DEFAULT, "Could not load framework binary: %{public}@", v31, 0xCu);
    }

    Value = 0;
    goto LABEL_30;
  }
LABEL_31:

  return Value;
}

id sub_1A0BC551C(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  id v9;
  void *v10;

  v1 = a1;
  objc_msgSend(v1, "lastPathComponent");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByDeletingPathExtension");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v1, "stringByAppendingPathComponent:", CFSTR("Versions"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("A"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "stringByAppendingPathComponent:", v3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (v8)
  {
    v9 = v6;
  }
  else
  {
    objc_msgSend(v1, "stringByAppendingPathComponent:", v3);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  v10 = v9;

  return v10;
}

void sub_1A0BC5604()
{
  const __CFBoolean *v0;
  const __CFBoolean *v1;
  CFTypeID v2;

  v0 = (const __CFBoolean *)MGCopyAnswer();
  if (v0)
  {
    v1 = v0;
    v2 = CFGetTypeID(v0);
    if (v2 == CFBooleanGetTypeID() && CFBooleanGetValue(v1) == 1)
      byte_1ECD8FDE0 = 1;
    CFRelease(v1);
  }
}

void sub_1A0BC5924(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  id *v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  objc_destroyWeak(v9);
  _Unwind_Resume(a1);
}

void sub_1A0BC594C(uint64_t a1, uint64_t a2)
{
  objc_moveWeak((id *)(a1 + 40), (id *)(a2 + 40));
}

void sub_1A0BC5958(uint64_t a1)
{
  objc_destroyWeak((id *)(a1 + 40));
}

void sub_1A0BC5960(uint64_t a1)
{
  void *v2;
  id WeakRetained;
  void *v4;
  id v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void (**v10)(_QWORD, _QWORD);

  v2 = (void *)MEMORY[0x1A1B01454]();
  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));

  if (WeakRetained)
  {
    objc_msgSend(*(id *)(a1 + 32), "pendingDispatchBlocks");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_loadWeakRetained((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40));
    objc_msgSend(v4, "removeObject:", v5);

  }
  objc_msgSend(*(id *)(a1 + 32), "pendingDispatchBlocks");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "count");

  if (!v7)
  {
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 32);
    *(_QWORD *)(v8 + 32) = 0;

  }
  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  objc_msgSend(*(id *)(a1 + 32), "originalBlock");
  v10 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v10[2](v10, *(_QWORD *)(a1 + 40));

  objc_autoreleasePoolPop(v2);
}

void sub_1A0BC5E4C(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  +[CUTLog utilities](CUTLog, "utilities");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    v5 = 138543362;
    v6 = v3;
    _os_log_impl(&dword_1A0BC3000, v4, OS_LOG_TYPE_INFO, "Reduce -- Finished {result: %{public}@}", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_completeWithResult:", v3);
}

void sub_1A0BC6250(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  CUTResult *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[CUTResult initWithError:]([CUTResult alloc], "initWithError:", v3);

  (*(void (**)(uint64_t, CUTResult *))(v2 + 16))(v2, v4);
}

void sub_1A0BC62B8(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  CUTResult *v4;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = a2;
  v4 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", v3);

  (*(void (**)(uint64_t, CUTResult *))(v2 + 16))(v2, v4);
}

void sub_1A0BC6320(_QWORD *a1, void *a2)
{
  void *v3;
  uint64_t v4;
  uint64_t v5;
  id v6;
  CUTResult *v7;

  v3 = (void *)a1[4];
  v4 = a1[5];
  v5 = a1[6];
  v6 = a2;
  v7 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", v6);

  objc_msgSend(v3, "_reduceWithPending:visited:currentResult:completion:", v4, v5, v7, a1[7]);
}

uint64_t CUTGetMainBundle()
{
  return MEMORY[0x1E0DE7D20](MEMORY[0x1E0CB34D0], sel_mainBundle);
}

__CFBundle *CUTGetMainBundleIdentifier()
{
  __CFBundle *MainBundle;

  MainBundle = CFBundleGetMainBundle();
  if (MainBundle)
  {
    CFBundleGetIdentifier(MainBundle);
    MainBundle = (__CFBundle *)objc_claimAutoreleasedReturnValue();
  }
  return MainBundle;
}

id CUTTemporaryPath()
{
  void *v0;
  void *v1;
  void *v2;
  char v3;
  void *v4;

  NSTemporaryDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "stringByAppendingPathComponent:", CFSTR("CUT"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "fileExistsAtPath:", v1);

  if ((v3 & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v1, 1, 0, 0);

  }
  return v1;
}

BOOL CUTAuditTokenTaskHasEntitlement(_OWORD *a1, void *a2)
{
  __CFString *v3;
  const __CFAllocator *v4;
  __int128 v5;
  __SecTask *v6;
  __SecTask *v7;
  const __CFBoolean *v8;
  const __CFBoolean *v9;
  CFTypeID v10;
  _BOOL8 v11;
  audit_token_t cf;

  v3 = a2;
  v4 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v5 = a1[1];
  *(_OWORD *)cf.val = *a1;
  *(_OWORD *)&cf.val[4] = v5;
  v6 = SecTaskCreateWithAuditToken(v4, &cf);
  if (v6)
  {
    v7 = v6;
    *(_QWORD *)cf.val = 0;
    v8 = (const __CFBoolean *)SecTaskCopyValueForEntitlement(v6, v3, (CFErrorRef *)&cf);
    if (v8)
    {
      v9 = v8;
      v10 = CFGetTypeID(v8);
      v11 = v10 == CFBooleanGetTypeID() && CFBooleanGetValue(v9) != 0;
      CFRelease(v9);
    }
    else
    {
      v11 = 0;
    }
    if (*(_QWORD *)cf.val)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
        sub_1A0BD1E28((uint64_t *)&cf);
      if (*(_QWORD *)cf.val)
        CFRelease(*(CFTypeRef *)cf.val);
    }
    CFRelease(v7);
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT))
      sub_1A0BD1DE4();
    v11 = 0;
  }

  return v11;
}

void CUTMapObjectProperties(void *a1, char a2, void *a3)
{
  id v4;
  uint64_t v5;
  objc_class *v6;
  _QWORD *v7;
  objc_property_t *v8;
  objc_property_t *v9;
  unint64_t i;
  objc_property *v11;
  const char *Name;
  char *v13;
  char *v14;
  void *v15;
  NSObject *v16;
  const char *v17;
  id v19;
  _QWORD v20[2];
  void (*v21)(uint64_t, void *, const char *, char *);
  void *v22;
  id v23;
  id v24;
  objc_class *v25;
  char v26;
  unsigned int outCount;
  uint8_t buf[4];
  objc_class *v29;
  __int16 v30;
  int v31;
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v4 = a1;
  v19 = a3;
  v5 = objc_opt_class();
  if (v5)
  {
    v6 = (objc_class *)v5;
    do
    {
      if (v6 == (objc_class *)objc_opt_class())
        break;
      v20[0] = MEMORY[0x1E0C809B0];
      v20[1] = 3221225472;
      v21 = sub_1A0BC6C4C;
      v22 = &unk_1E4490168;
      v26 = a2;
      v25 = v6;
      v23 = v4;
      v24 = v19;
      v7 = v20;
      outCount = 0;
      v8 = class_copyPropertyList(v6, &outCount);
      if (v8)
      {
        v9 = v8;
        if (outCount)
        {
          for (i = 0; i < outCount; ++i)
          {
            v11 = v9[i];
            Name = property_getName(v11);
            v13 = property_copyAttributeValue(v11, "V");
            v14 = property_copyAttributeValue(v11, "T");
            objc_msgSend(MEMORY[0x1E0CB3940], "stringWithCString:encoding:", Name, 4);
            v15 = (void *)objc_claimAutoreleasedReturnValue();
            if (v15)
            {
              if (v13)
              {
                if (v14)
                {
                  v21((uint64_t)v7, v15, v13, v14);
                  free(v14);
                }
                else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)buf = 138412546;
                  v29 = v6;
                  v30 = 1024;
                  v31 = i;
                  _os_log_error_impl(&dword_1A0BC3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "ObjectPropertyEnumeration failed -- failed to get ivar type {checkpoint: %@, index: %u}", buf, 0x12u);
                }
                free(v13);
                goto LABEL_19;
              }
              if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)buf = 138412546;
                v29 = v6;
                v30 = 1024;
                v31 = i;
                v16 = MEMORY[0x1E0C81028];
                v17 = "ObjectPropertyEnumeration failed -- failed to get ivar name {checkpoint: %@, index: %u}";
                goto LABEL_15;
              }
            }
            else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412546;
              v29 = v6;
              v30 = 1024;
              v31 = i;
              v16 = MEMORY[0x1E0C81028];
              v17 = "ObjectPropertyEnumeration failed -- failed to get property name {checkpoint: %@, index: %u}";
LABEL_15:
              _os_log_error_impl(&dword_1A0BC3000, v16, OS_LOG_TYPE_ERROR, v17, buf, 0x12u);
            }
LABEL_19:

          }
        }
        free(v9);
      }

      v6 = (objc_class *)-[objc_class superclass](v6, "superclass");
    }
    while (v6);
  }

}

void sub_1A0BC6C4C(uint64_t a1, void *a2, const char *a3, _BYTE *a4)
{
  id v7;
  objc_ivar *InstanceVariable;
  uint64_t v9;
  void *v10;
  void *v11;
  id v12;

  v7 = a2;
  v12 = v7;
  if (*(_BYTE *)(a1 + 56) && *a4 == 64)
  {
    InstanceVariable = class_getInstanceVariable(*(Class *)(a1 + 48), a3);
    object_getIvar(*(id *)(a1 + 32), InstanceVariable);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "valueForKey:", v7);
    v9 = objc_claimAutoreleasedReturnValue();
  }
  v10 = (void *)v9;
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (v11 != v10)
    objc_msgSend(*(id *)(a1 + 32), "setValue:forKey:", v11, v12);

}

__CFString *sub_1A0BC6D10()
{
  const __CFUUID *v0;
  __CFString *v1;

  v0 = CFUUIDCreate(0);
  v1 = (__CFString *)CFUUIDCreateString(0, v0);
  if (v0)
    CFRelease(v0);
  return v1;
}

id sub_1A0BC6D54(void *a1)
{
  void *v1;
  void *v2;
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  objc_msgSend(a1, "stringByExpandingTildeInPath");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "stringByStandardizingPath");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v2, "stringByResolvingSymlinksInPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = v3;
  objc_msgSend(MEMORY[0x1E0C99E98], "fileURLWithPath:isDirectory:", v4, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v4;
  if (v5)
  {
    objc_msgSend(MEMORY[0x1E0C99E98], "URLByResolvingAliasFileAtURL:options:error:", v5, 0, 0);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = v7;
    v6 = v4;
    if (v7)
    {
      objc_msgSend(v7, "path");
      v6 = (void *)objc_claimAutoreleasedReturnValue();

    }
  }

  return v6;
}

id sub_1A0BC6E18(void *a1)
{
  void *v2;

  v2 = (void *)objc_msgSend(a1, "count");
  if (v2)
  {
    objc_msgSend(a1, "objectAtIndex:", 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

uint64_t sub_1A0BC6E4C(uint64_t a1, uint64_t a2, void *a3)
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  int v8;
  uint64_t v9;

  objc_msgSend(a3, "cutStringByResolvingAndStandardizingPath");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "pathComponents");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v3, "hasPrefix:", CFSTR("/Volumes")))
    goto LABEL_4;
  if ((unint64_t)objc_msgSend(v4, "count") < 3)
    goto LABEL_4;
  objc_msgSend(v4, "objectAtIndex:", 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(CFSTR("/Volumes"), "stringByAppendingPathComponent:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "fileExistsAtPath:", v6);

  if (!v8)
    v9 = 1;
  else
LABEL_4:
    v9 = 0;

  return v9;
}

id sub_1A0BC6F28(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  void *v16;
  char v17;
  id v18;
  void *v19;
  int v20;
  int v21;
  id v23;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cutStringByResolvingAndStandardizingPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(a1, "_cutIsPathOnMissingVolume:", v12) & 1) != 0)
  {
    v13 = 0;
  }
  else
  {
    v14 = 0;
    v15 = 0;
    while (1)
    {
      v16 = v14;
      sub_1A0BC7088(v12, v15, v9);
      v14 = (void *)objc_claimAutoreleasedReturnValue();

      v23 = 0;
      v17 = objc_msgSend(a1, "createDirectoryAtPath:withIntermediateDirectories:attributes:error:", v14, 1, 0, &v23);
      v18 = v23;
      v19 = v18;
      v20 = 0;
      if ((v17 & 1) == 0 && v18)
        v20 = objc_msgSend(a1, "fileExistsAtPath:", v14);
      v21 = v19 ? v20 : 1;

      v13 = 0;
      if (v21 != 1 || (_DWORD)v15 == 99)
        break;
      v15 = (v15 + 1);
      if ((v20 & 1) == 0)
      {
        v13 = v14;
        break;
      }
    }

  }
  return v13;
}

id sub_1A0BC7088(void *a1, uint64_t a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  id v11;
  uint64_t v12;

  v5 = a1;
  v6 = a3;
  if ((int)a2 <= 0)
  {
    v11 = v5;
  }
  else
  {
    v7 = (void *)MEMORY[0x1E0CB3940];
    v8 = (void *)MEMORY[0x1E0CB37F0];
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", a2);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "localizedStringFromNumber:numberStyle:", v9, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringWithFormat:", CFSTR("%@-%@"), v5, v10);
    v11 = (id)objc_claimAutoreleasedReturnValue();

  }
  if (objc_msgSend(v6, "length"))
  {
    objc_msgSend(v11, "stringByAppendingPathExtension:", v6);
    v12 = objc_claimAutoreleasedReturnValue();

    v11 = (id)v12;
  }

  return v11;
}

id sub_1A0BC717C(void *a1, uint64_t a2, void *a3, void *a4, void *a5)
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  id v16;
  void *v17;

  v8 = a4;
  v9 = a5;
  objc_msgSend(a3, "lastPathComponent");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "stringByAppendingPathComponent:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "cutStringByResolvingAndStandardizingPath");
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  if (!objc_msgSend(v9, "length"))
  {

    v9 = 0;
  }
  v13 = 0;
  v14 = 0;
  while (1)
  {
    v15 = v13;
    sub_1A0BC7088(v12, v14, v9);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((_DWORD)v14 == 9999)
      break;
    v14 = (v14 + 1);
    if ((objc_msgSend(a1, "fileExistsAtPath:", v13) & 1) == 0)
    {
      v16 = v13;
      goto LABEL_8;
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "cutStringGUID");
  v16 = (id)objc_claimAutoreleasedReturnValue();
LABEL_8:
  v17 = v16;

  return v17;
}

id sub_1A0BC7294(void *a1, uint64_t a2, void *a3)
{
  void *v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  v4 = (void *)MEMORY[0x1E0CB3940];
  v5 = a3;
  objc_msgSend(v4, "cutStringGUID");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  NSTemporaryDirectory();
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "cutCreateUniqueDirectoryWithName:atPath:ofType:", v6, v7, 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v5, "lastPathComponent");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "stringByDeletingPathExtension");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "pathExtension");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend(a1, "cutUniqueFilename:atPath:ofType:", v10, v8, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

uint64_t sub_1A0BC7370(uint64_t a1)
{
  return MEMORY[0x1E0DE7D20](a1, sel_base64EncodedStringWithOptions_);
}

id sub_1A0BC7378(void *a1)
{
  int v3;
  int v4;
  int v5;
  void *v6;
  __int128 v7;
  id v8;
  void *v9;
  unint64_t v10;
  id v11;
  uint64_t v12;
  int v13;
  int v14;
  _BOOL4 v15;
  int v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;

  if ((unint64_t)objc_msgSend(a1, "length") > 0xC800000)
    return 0;
  if (!objc_msgSend(a1, "length"))
    return a1;
  if (!off_1EE5CD718)
    off_1EE5CD718 = (uint64_t (*)(_QWORD, _QWORD))CUTWeakLinkSymbol("inflate", CFSTR("/usr/lib/libz.dylib"));
  if (!off_1EE5CD720)
    off_1EE5CD720 = (uint64_t (*)(_QWORD))CUTWeakLinkSymbol("inflateEnd", CFSTR("/usr/lib/libz.dylib"));
  if (!off_1EE5CD728)
    off_1EE5CD728 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol("inflateInit2_", CFSTR("/usr/lib/libz.dylib"));
  v3 = objc_msgSend(a1, "length");
  v4 = objc_msgSend(a1, "length");
  if (v4 >= 0)
    v5 = v4;
  else
    v5 = v4 + 1;
  objc_msgSend(MEMORY[0x1E0C99DF0], "dataWithLength:", (v3 + (v5 >> 1)));
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  *(_QWORD *)&v7 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v7 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v23 = v7;
  v22 = v7;
  v21 = v7;
  v20 = v7;
  v19 = v7;
  v18 = v7;
  v8 = objc_retainAutorelease(a1);
  LODWORD(v18) = objc_msgSend(v8, "length", objc_msgSend(v8, "bytes"), v18, v19, v20, v21, v22, v23, 0xAAAAAAAAAAAAAAAALL);
  *((_QWORD *)&v21 + 1) = 0;
  *(_QWORD *)&v22 = 0;
  *(_QWORD *)&v20 = 0;
  v9 = 0;
  if (!off_1EE5CD728(&v17, 47, "1.2.12", 112))
  {
    do
    {
      v10 = v20;
      if (v10 >= objc_msgSend(v6, "length"))
        objc_msgSend(v6, "increaseLengthBy:", (v5 >> 1));
      v11 = objc_retainAutorelease(v6);
      v12 = objc_msgSend(v11, "mutableBytes");
      *(_QWORD *)&v19 = v12 + v20;
      v13 = objc_msgSend(v11, "length");
      DWORD2(v19) = v13 - v20;
      v14 = off_1EE5CD718(&v17, 2);
    }
    while (!v14);
    v15 = v14 == 1;
    v16 = off_1EE5CD720(&v17);
    v9 = 0;
    if (v15 && !v16)
    {
      objc_msgSend(v11, "setLength:", (_QWORD)v20);
      objc_msgSend(MEMORY[0x1E0C99D50], "dataWithData:", v11);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
    }
  }

  return v9;
}

id sub_1A0BC75AC(void *a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "_CUTDecompressData");
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = (void *)v2;
  if (v2)
    v4 = (void *)v2;
  else
    v4 = a1;
  v5 = v4;

  return v5;
}

id sub_1A0BC75EC(void *a1)
{
  __int128 v1;
  id v2;
  id v3;
  void *v4;
  unint64_t v5;
  uint64_t v6;
  int v7;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  unint64_t v13;
  unint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  unint64_t v18;

  if (!objc_msgSend(a1, "length"))
    return a1;
  if (!off_1EE5CD730)
    off_1EE5CD730 = (uint64_t (*)(_QWORD, _QWORD))CUTWeakLinkSymbol("deflate", CFSTR("/usr/lib/libz.dylib"));
  if (!off_1EE5CD738)
    off_1EE5CD738 = (uint64_t (*)(_QWORD))CUTWeakLinkSymbol("deflateEnd", CFSTR("/usr/lib/libz.dylib"));
  if (!off_1EE5CD740)
    off_1EE5CD740 = (uint64_t (*)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD))CUTWeakLinkSymbol("deflateInit2_", CFSTR("/usr/lib/libz.dylib"));
  *(_QWORD *)&v1 = 0xAAAAAAAAAAAAAAAALL;
  *((_QWORD *)&v1 + 1) = 0xAAAAAAAAAAAAAAAALL;
  v14 = 0xAAAAAAAAAAAAAAAALL;
  v15 = 0xAAAAAAAAAAAAAAAALL;
  v18 = 0xAAAAAAAAAAAAAAAALL;
  v17 = v1;
  v12 = v1;
  v11 = v1;
  v13 = 0;
  v16 = 0uLL;
  v2 = objc_retainAutorelease(a1);
  v10 = objc_msgSend(v2, "bytes");
  LODWORD(v11) = objc_msgSend(v2, "length");
  v3 = 0;
  if (!off_1EE5CD740(&v10, 0xFFFFFFFFLL, 8, 31, 8, 0, "1.2.12", 112))
  {
    v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DF0]), "initWithLength:", 0x4000);
    do
    {
      v5 = v13;
      if (v5 >= objc_msgSend(v4, "length"))
        objc_msgSend(v4, "increaseLengthBy:", 0x4000);
      v3 = objc_retainAutorelease(v4);
      v6 = objc_msgSend(v3, "mutableBytes");
      *(_QWORD *)&v12 = v6 + v13;
      v7 = objc_msgSend(v3, "length");
      DWORD2(v12) = v7 - v13;
      off_1EE5CD730(&v10, 4);
    }
    while (!DWORD2(v12));
    off_1EE5CD738(&v10);
    objc_msgSend(v3, "setLength:", v13);
  }
  return v3;
}

void sub_1A0BC7C50()
{
  CUTNetworkInterfaceListener *v0;
  void *v1;

  v0 = objc_alloc_init(CUTNetworkInterfaceListener);
  v1 = (void *)qword_1EE5CD6B0;
  qword_1EE5CD6B0 = (uint64_t)v0;

}

uint64_t sub_1A0BC7DFC(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a3, sel__handleNetworkChange_);
}

void sub_1A0BC80B4(uint64_t a1)
{
  uint64_t v1;
  int v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 32) != v2)
  {
    *(_DWORD *)(v1 + 32) = v2;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "cutNetworkInterfaceListenerDidWifiStateChange:", *(unsigned int *)(a1 + 40), (_QWORD)v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

void sub_1A0BC8248(uint64_t a1)
{
  uint64_t v1;
  int v2;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v1 = *(_QWORD *)(a1 + 32);
  v2 = *(_DWORD *)(a1 + 40);
  if (*(_DWORD *)(v1 + 36) != v2)
  {
    *(_DWORD *)(v1 + 36) = v2;
    v12 = 0u;
    v13 = 0u;
    v10 = 0u;
    v11 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v11;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v11 != v7)
            objc_enumerationMutation(v4);
          v9 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * v8);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v9, "cutNetworkInterfaceListenerDidCellStateChange:", *(unsigned int *)(a1 + 40), (_QWORD)v10);
          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
      }
      while (v6);
    }

  }
}

void sub_1A0BC840C(uint64_t a1)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  v2 = 40;
  if (!*(_BYTE *)(a1 + 48))
    v2 = 48;
  v3 = *(id *)(*(_QWORD *)(a1 + 32) + v2);
  if ((objc_msgSend(v3, "isEqualToSet:", *(_QWORD *)(a1 + 40)) & 1) == 0)
  {
    v4 = 40;
    if (!*(_BYTE *)(a1 + 48))
      v4 = 48;
    objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + v4), *(id *)(a1 + 40));
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v5 = *(id *)(*(_QWORD *)(a1 + 32) + 16);
    v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    if (v6)
    {
      v7 = v6;
      v8 = *(_QWORD *)v12;
      do
      {
        for (i = 0; i != v7; ++i)
        {
          if (*(_QWORD *)v12 != v8)
            objc_enumerationMutation(v5);
          v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v10, "cutNetworkInterfaceListenerDidAddressChange:isIPv6:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48), (_QWORD)v11);
        }
        v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
      }
      while (v7);
    }

  }
}

uint64_t sub_1A0BC8600(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  uint64_t result;

  v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0CB3690], "weakObjectsHashTable");
    v3 = objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v5 = *(void **)(v4 + 16);
    *(_QWORD *)(v4 + 16) = v3;

    v2 = *(void **)(*(_QWORD *)(a1 + 32) + 16);
  }
  result = objc_msgSend(v2, "containsObject:", *(_QWORD *)(a1 + 40));
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "addObject:", *(_QWORD *)(a1 + 40));
  return result;
}

void sub_1A0BC86EC(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "removeObject:", *(_QWORD *)(a1 + 40));
  if (!objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "count"))
  {
    v2 = *(_QWORD *)(a1 + 32);
    v3 = *(void **)(v2 + 16);
    *(_QWORD *)(v2 + 16) = 0;

  }
}

void sub_1A0BC87A4(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, &a9, 2u);
}

void sub_1A0BC87FC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_debug_impl(a1, v9, OS_LOG_TYPE_DEBUG, a4, &a9, 0xCu);
}

void sub_1A0BC885C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CommonUtilities", "CUTFileCopier");
  v1 = (void *)qword_1EE5CD748;
  qword_1EE5CD748 = (uint64_t)v0;

}

void sub_1A0BC888C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CommonUtilities", "Power");
  v1 = (void *)qword_1EE5CD6E0;
  qword_1EE5CD6E0 = (uint64_t)v0;

}

void sub_1A0BC88FC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CommonUtilities", "Network");
  v1 = (void *)qword_1ECD8FDB0;
  qword_1ECD8FDB0 = (uint64_t)v0;

}

void sub_1A0BC896C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CommonUtilities", "WeakLink");
  v1 = (void *)qword_1EE5CD6D8;
  qword_1EE5CD6D8 = (uint64_t)v0;

}

void sub_1A0BC89DC()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CommonUtilities", "CUTXPC");
  v1 = (void *)qword_1EE5CD758;
  qword_1EE5CD758 = (uint64_t)v0;

}

void sub_1A0BC8A4C()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.CommonUtilities", "utilities");
  v1 = (void *)qword_1EE5CD768;
  qword_1EE5CD768 = (uint64_t)v0;

}

id cut_backtrace()
{
  void *v0;
  unsigned int v1;
  char **v2;
  char **v3;
  uint64_t v4;
  uint64_t *v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *__b[67];

  __b[66] = *(void **)MEMORY[0x1E0C80C00];
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", 66);
  memset(__b, 170, 0x210uLL);
  v1 = backtrace(__b, 66);
  v2 = backtrace_symbols(__b, v1);
  v3 = v2;
  if (v1 >= 2)
  {
    v4 = (int)v1 - 1;
    v5 = (uint64_t *)(v2 + 1);
    do
    {
      v6 = objc_alloc(MEMORY[0x1E0CB3940]);
      v7 = *v5++;
      v8 = (void *)objc_msgSend(v6, "initWithUTF8String:", v7);
      objc_msgSend(v0, "addObject:", v8);

      --v4;
    }
    while (v4);
  }
  free(v3);
  if (objc_msgSend(v0, "count"))
  {
    objc_msgSend(v0, "subarrayWithRange:", 1, objc_msgSend(v0, "count") - 1);
    v9 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v9 = v0;
  }
  v10 = v9;

  return v10;
}

void cut_non_arc_os_release(id *a1)
{
  id v1;
  id v2;

  if (a1)
  {
    v2 = *a1;
    v1 = (id)objc_opt_self();

  }
}

void cut_dispatch_log_queue(void *a1)
{
  id v1;
  NSObject *v2;
  id v3;
  _QWORD block[4];
  id v5;

  v1 = a1;
  if (qword_1EE5CD6C0 != -1)
    dispatch_once(&qword_1EE5CD6C0, &unk_1E44902A8);
  v2 = qword_1EE5CD6C8;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_1A0BC8C98;
  block[3] = &unk_1E4490288;
  v5 = v1;
  v3 = v1;
  dispatch_async(v2, block);

}

uint64_t sub_1A0BC8C98(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void sub_1A0BC8CA4()
{
  NSObject *v0;
  dispatch_queue_t v1;
  void *v2;
  NSObject *v3;

  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v3 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v3, QOS_CLASS_UTILITY, 0);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = dispatch_queue_create("CUTLog.oversize.queue", v0);
  v2 = (void *)qword_1EE5CD6C8;
  qword_1EE5CD6C8 = (uint64_t)v1;

}

void sub_1A0BC8F40(uint64_t a1)
{
  uint64_t v1;
  id v2;

  v1 = *(_QWORD *)(a1 + 40);
  objc_msgSend(*(id *)(a1 + 32), "result");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v1 + 16))(v1, v2);

}

_xpc_connection_s *CUTXPCCreateServerConnection(const char *a1, void *a2, void *a3, void *a4, void *a5)
{
  id v9;
  id v10;
  id v11;
  id v12;
  xpc_connection_t mach_service;
  _xpc_connection_s *v14;
  id v15;
  id v16;
  id v17;
  id v18;
  void *v19;
  _xpc_connection_s *v20;
  _QWORD handler[4];
  _xpc_connection_s *v23;
  id v24;
  id v25;
  id v26;
  id v27;

  v9 = a2;
  v10 = a3;
  v11 = a4;
  v12 = a5;
  if (a1 && *a1)
    mach_service = xpc_connection_create_mach_service(a1, MEMORY[0x1E0C80D38], 1uLL);
  else
    mach_service = xpc_connection_create(0, MEMORY[0x1E0C80D38]);
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = sub_1A0BC9688;
  handler[3] = &unk_1E44902F8;
  v14 = mach_service;
  v25 = v9;
  v26 = v10;
  v23 = v14;
  v24 = v12;
  v27 = v11;
  v15 = v11;
  v16 = v12;
  v17 = v10;
  v18 = v9;
  xpc_connection_set_event_handler(v14, handler);
  v19 = v27;
  v20 = v14;

  return v20;
}

void sub_1A0BC9688(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;
  id v10;
  void (**v11)(void);
  void (**v12)(void);
  id v13;
  NSObject *v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  void (**v22)(void);
  void *v23;
  void *v24;
  id v25;
  id v26;
  id v27;
  NSObject *v28;
  _xpc_connection_s *v29;
  id v30;
  id v31;
  id v32;
  _xpc_connection_s *v33;
  NSObject *v34;
  uint64_t v35;
  uint64_t v36;
  uint64_t v37;
  uint64_t v38;
  uint64_t v39;
  uint64_t v40;
  uint64_t v41;
  int v42;
  NSObject *v43;
  _QWORD handler[4];
  id v45;
  _xpc_connection_s *v46;
  id v47;

  v3 = a2;
  v4 = MEMORY[0x1A1B01844]();
  if (v4 == MEMORY[0x1E0C81310])
  {
    v6 = *(void **)(a1 + 48);
    v7 = *(void **)(a1 + 56);
    v8 = *(void **)(a1 + 40);
    v9 = *(id *)(a1 + 32);
    v10 = v3;
    v11 = v6;
    v12 = v7;
    v13 = v8;
    if (v10 == (id)MEMORY[0x1E0C81260])
    {
      +[CUTLog xpc](CUTLog, "xpc");
      v34 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT))
        sub_1A0BD20E0(v34, v35, v36, v37, v38, v39, v40, v41);

      v22 = v11;
      if (!v11)
        goto LABEL_12;
    }
    else
    {
      if (v10 != (id)MEMORY[0x1E0C81288])
      {
        v42 = MEMORY[0x1A1B01844](v10);
        +[CUTLog xpc](CUTLog, "xpc");
        v43 = objc_claimAutoreleasedReturnValue();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          sub_1A0BD2140(v42, v43);

        exit(0);
      }
      +[CUTLog xpc](CUTLog, "xpc");
      v14 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        sub_1A0BD2110(v14, v15, v16, v17, v18, v19, v20, v21);

      v22 = v12;
      if (!v12)
        goto LABEL_12;
    }
    v22[2]();
LABEL_12:

    goto LABEL_16;
  }
  if (v4 == MEMORY[0x1E0C812E0])
  {
    v23 = *(void **)(a1 + 64);
    v24 = *(void **)(a1 + 40);
    v25 = *(id *)(a1 + 32);
    v26 = v3;
    v27 = v23;
    v28 = v24;
    v29 = (_xpc_connection_s *)v26;
    if (!v28)
    {
      v28 = MEMORY[0x1E0C80D38];
      v30 = MEMORY[0x1E0C80D38];
    }
    xpc_connection_set_target_queue(v29, v28);
    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = sub_1A0BCA59C;
    handler[3] = &unk_1E4490368;
    v46 = v29;
    v47 = v27;
    v45 = v25;
    v31 = v27;
    v32 = v25;
    v33 = v29;
    xpc_connection_set_event_handler(v33, handler);
    xpc_connection_resume(v33);

  }
  else
  {
    +[CUTLog xpc](CUTLog, "xpc");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      sub_1A0BD21B0();

  }
LABEL_16:

}

void CUTXPCConnectionSetEventHandlers(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  id v11;
  id v12;
  id v13;
  _xpc_connection_s *v14;
  _QWORD v15[4];
  id v16;
  id v17;
  id v18;
  id v19;

  v7 = a1;
  v8 = a2;
  v9 = a3;
  v10 = a4;
  v15[0] = MEMORY[0x1E0C809B0];
  v15[1] = 3221225472;
  v15[2] = sub_1A0BC9A08;
  v15[3] = &unk_1E4490320;
  v16 = v7;
  v17 = v8;
  v18 = v9;
  v19 = v10;
  v11 = v10;
  v12 = v9;
  v13 = v8;
  v14 = (_xpc_connection_s *)v7;
  xpc_connection_set_event_handler(v14, v15);

}

void sub_1A0BC9A08(_QWORD *a1, void *a2)
{
  id v3;
  uint64_t v4;
  NSObject *v5;
  id v6;
  _BOOL4 v7;
  uint64_t v8;
  void (*v9)(void);
  NSObject *v10;
  uint64_t v11;

  v3 = a2;
  v4 = MEMORY[0x1A1B01844]();
  if (v4 != MEMORY[0x1E0C81310])
  {
    if (v4 != MEMORY[0x1E0C812F8])
    {
      +[CUTLog xpc](CUTLog, "xpc");
      v5 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
        sub_1A0BD239C((uint64_t)a1);
LABEL_9:

      goto LABEL_21;
    }
    v8 = a1[7];
    if (!v8)
      goto LABEL_21;
    v9 = *(void (**)(void))(v8 + 16);
LABEL_20:
    v9();
    goto LABEL_21;
  }
  if (v3 == (id)MEMORY[0x1E0C81258])
  {
    +[CUTLog xpc](CUTLog, "xpc");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
      sub_1A0BD2218((uint64_t)a1, v10);

    v11 = a1[5];
    if (v11)
    {
LABEL_19:
      v9 = *(void (**)(void))(v11 + 16);
      goto LABEL_20;
    }
  }
  else
  {
    v6 = (id)MEMORY[0x1E0C81260];
    +[CUTLog xpc](CUTLog, "xpc");
    v5 = objc_claimAutoreleasedReturnValue();
    v7 = os_log_type_enabled(v5, OS_LOG_TYPE_FAULT);
    if (v3 != v6)
    {
      if (v7)
        sub_1A0BD22F8((uint64_t)a1, v3);
      goto LABEL_9;
    }
    if (v7)
      sub_1A0BD2288((uint64_t)a1, v5);

    v11 = a1[6];
    if (v11)
      goto LABEL_19;
  }
LABEL_21:

}

_xpc_connection_s *CUTXPCCreateConnectionForServiceWithQueue(char a1, int a2, const char *a3, void *a4, void *a5, void *a6)
{
  NSObject *v11;
  id v12;
  id v13;
  id v14;
  xpc_connection_t mach_service;
  _xpc_connection_s *v16;
  NSObject *v17;

  v11 = a4;
  v12 = a5;
  v13 = a6;
  if (a3)
  {
    if (!v11)
    {
      v14 = objc_retainAutorelease((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("%s_connection_queue"), a3));
      v11 = dispatch_queue_create((const char *)objc_msgSend(v14, "UTF8String"), 0);

    }
    if ((a1 & 1) != 0)
      mach_service = xpc_connection_create_mach_service(a3, v11, 0);
    else
      mach_service = xpc_connection_create(a3, v11);
    v16 = mach_service;
    if (mach_service)
    {
      if (a2)
      {
        CUTXPCConnectionSetEventHandlers(mach_service, v12, v13, 0);
        xpc_connection_resume(v16);
      }
    }
    else
    {
      +[CUTLog xpc](CUTLog, "xpc");
      v17 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        sub_1A0BD2414();

    }
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

_xpc_connection_s *CUTXPCCreateConnectionForService(char a1, const char *a2, void *a3, void *a4)
{
  return CUTXPCCreateConnectionForServiceWithQueue(a1, 1, a2, 0, a3, a4);
}

uint64_t CUTInsertBoolsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  uint64_t *v12;

  v12 = &a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_BOOL(xdict, a2, *(_DWORD *)v12 != 0);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t CUTInsertIntsToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  uint64_t *v12;

  v12 = &a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_int64(xdict, a2, *(int *)v12);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

uint64_t CUTInsertDatasToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  id v12;
  id v13;
  const char **v14;
  id *v16;
  _QWORD *v17;

  v10 = a1;
  v16 = (id *)&a9;
  if (a2)
  {
    do
    {
      v11 = v16;
      v17 = v16 + 1;
      v12 = *v11;
      if (!v12)
      {
        objc_msgSend(MEMORY[0x1E0C99D50], "data");
        v12 = (id)objc_claimAutoreleasedReturnValue();
      }
      v13 = objc_retainAutorelease(v12);
      xpc_dictionary_set_data(v10, a2, (const void *)objc_msgSend(v13, "bytes"), objc_msgSend(v13, "length"));

      v14 = (const char **)v17;
      v16 = (id *)(v17 + 1);
      a2 = *v14;
    }
    while (*v14);
  }

  return 1;
}

uint64_t CUTInsertNSStringsToXPCDictionary(void *a1, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  id v10;
  id *v11;
  const __CFString *v12;
  __CFString *v13;
  const char *CStringPtr;
  UInt8 *v15;
  const char **v16;
  id *v18;
  _QWORD *v19;
  CFIndex maxBufLen;
  CFRange v21;
  CFRange v22;

  v10 = a1;
  v18 = (id *)&a9;
  if (a2)
  {
    do
    {
      v11 = v18;
      v19 = v18 + 1;
      v12 = (const __CFString *)*v11;
      v13 = (__CFString *)v12;
      if (v12)
      {
        CStringPtr = CFStringGetCStringPtr(v12, 0x8000100u);
        if (CStringPtr)
        {
          xpc_dictionary_set_string(v10, a2, CStringPtr);
        }
        else
        {
          maxBufLen = 0;
          v21.length = CFStringGetLength(v13);
          v21.location = 0;
          CFStringGetBytes(v13, v21, 0x8000100u, 0, 0, 0, 0, &maxBufLen);
          v15 = (UInt8 *)malloc_type_malloc(maxBufLen + 1, 0x83B6CFF3uLL);
          v22.length = CFStringGetLength(v13);
          v22.location = 0;
          CFStringGetBytes(v13, v22, 0x8000100u, 0, 0, v15, maxBufLen, 0);
          v15[maxBufLen] = 0;
          xpc_dictionary_set_string(v10, a2, (const char *)v15);
          free(v15);
        }
      }

      v16 = (const char **)v19;
      v18 = (id *)(v19 + 1);
      a2 = *v16;
    }
    while (*v16);
  }

  return 1;
}

uint64_t CUTInsertDoublesToXPCDictionary(xpc_object_t xdict, const char *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  const char **v10;
  double *v12;

  v12 = (double *)&a9;
  if (a2)
  {
    do
    {
      xpc_dictionary_set_double(xdict, a2, *v12);
      v10 = (const char **)(v12 + 1);
      v12 += 2;
      a2 = *v10;
    }
    while (*v10);
  }
  return 1;
}

BOOL CUTGetXPCBoolFromDictionary(void *a1, const char *a2)
{
  return a2 && xpc_dictionary_get_BOOL(a1, a2);
}

int64_t CUTGetXPCIntFromDictionary(void *a1, const char *a2)
{
  if (a2)
    return xpc_dictionary_get_int64(a1, a2);
  else
    return 0;
}

id CUTGetXPCDataFromDictionary(void *a1, const char *a2)
{
  void *data;
  void *v3;
  id v4;
  size_t length;

  if (!a2)
    return 0;
  length = 0;
  data = (void *)xpc_dictionary_get_data(a1, a2, &length);
  if (data)
  {
    v3 = data;
    v4 = objc_alloc(MEMORY[0x1E0C99D50]);
    data = (void *)objc_msgSend(v4, "initWithBytes:length:", v3, length);
  }
  return data;
}

char *CUTGetXPCStringFromDictionary(void *a1, char *a2)
{
  id v3;
  void *v4;
  const char *string;
  size_t v6;

  v3 = a1;
  v4 = v3;
  if (a2)
  {
    string = xpc_dictionary_get_string(v3, a2);
    a2 = (char *)string;
    if (string)
    {
      v6 = strlen(string);
      a2 = (char *)CFStringCreateWithBytes((CFAllocatorRef)*MEMORY[0x1E0C9AE30], (const UInt8 *)a2, v6, 0x8000100u, 0);
    }
  }

  return a2;
}

double CUTGetXPCDoubleFromDictionary(xpc_object_t xdict, const char *key)
{
  if (key)
    return xpc_dictionary_get_double(xdict, key);
  else
    return 0.0;
}

id CUTGetXPCConnectionContext(_xpc_connection_s *a1)
{
  void *v1;
  void *v2;

  xpc_connection_get_context(a1);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "object");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

void CUTSetXPCConnectionContext(void *a1, void *a2)
{
  id v3;
  void *context;
  id v5;
  void *v6;
  _xpc_connection_s *connection;

  connection = a1;
  v3 = a2;
  context = xpc_connection_get_context(connection);
  v5 = (id)objc_opt_self();

  if (v3)
  {
    +[CUTWeakReference weakRefWithObject:](CUTWeakReference, "weakRefWithObject:", v3);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v6 = 0;
  }
  xpc_connection_set_context(connection, v6);

}

id CUTCreateXPCObjectFromDictionary(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "count"))
    v2 = (void *)_CFXPCCreateXPCMessageWithCFObject();
  else
    v2 = 0;

  return v2;
}

id CUTCreateDictionaryFromXPCObject(void *a1)
{
  if (a1)
    a1 = (void *)_CFXPCCreateCFObjectFromXPCMessage();
  return a1;
}

id CUTDataForPropertyList(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (v1)
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "dataWithPropertyList:format:options:error:", v1, 200, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v2)
      objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99778], CFSTR("argument can't be converted to a property list"));
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id CUTPropertyListFromNSData(void *a1)
{
  id v1;
  void *v2;

  v1 = a1;
  if (objc_msgSend(v1, "length"))
  {
    objc_msgSend(MEMORY[0x1E0CB38B0], "propertyListWithData:options:format:error:", v1, 0, 0, 0);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id CUTSafeArrayOfStrings(void *a1)
{
  id v1;
  id v2;
  uint64_t v3;
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t i;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  _BYTE v13[128];
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    v1 = 0;
  }
  objc_opt_class();
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v2 = v1;
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
  v4 = v2;
  if (v3)
  {
    v5 = v3;
    v6 = *(_QWORD *)v10;
    while (2)
    {
      for (i = 0; i != v5; ++i)
      {
        if (*(_QWORD *)v10 != v6)
          objc_enumerationMutation(v2);
        if ((objc_opt_isKindOfClass() & 1) == 0)
        {

          v4 = 0;
          goto LABEL_13;
        }
      }
      v5 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v9, v13, 16);
      if (v5)
        continue;
      break;
    }
    v4 = v2;
  }
LABEL_13:

  return v4;
}

void CUTXPCAlertv(void *a1, uint64_t a2)
{
  objc_class *v3;
  id v4;
  _xpc_connection_s *v5;
  xpc_object_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  id v19;

  if (a1)
  {
    v3 = (objc_class *)MEMORY[0x1E0CB3940];
    v4 = a1;
    v19 = (id)objc_msgSend([v3 alloc], "initWithFormat:arguments:", v4, a2);

    CUTXPCCreateConnectionForServiceWithQueue(1, 1, "com.apple.aps.alertprovider.xpc", 0, &unk_1E448FF58, 0);
    v5 = (_xpc_connection_s *)objc_claimAutoreleasedReturnValue();
    if (v5)
    {
      v6 = xpc_dictionary_create(0, 0, 0);
      CUTInsertIntsToXPCDictionary(v6, "type", v7, v8, v9, v10, v11, v12, 0);
      CUTInsertNSStringsToXPCDictionary(v6, "text", v13, v14, v15, v16, v17, v18, (uint64_t)v19);
      xpc_connection_send_message(v5, v6);

    }
  }
}

void sub_1A0BCA52C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  +[CUTLog xpc](CUTLog, "xpc");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_FAULT))
    sub_1A0BD247C(v0, v1, v2, v3, v4, v5, v6, v7);

}

void CUTXPCAlert(void *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9)
{
  CUTXPCAlertv(a1, (uint64_t)&a9);
}

uint64_t sub_1A0BCA59C(_QWORD *a1, uint64_t a2)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD, uint64_t))(a1[6] + 16))(a1[6], a1[4], a1[5], a2);
}

const char *sub_1A0BCA5B4(uint64_t a1)
{
  return xpc_connection_get_name(*(xpc_connection_t *)(a1 + 32));
}

void sub_1A0BCA5C0(void *a1, NSObject *a2, uint64_t a3, const char *a4, uint8_t *a5)
{
  _os_log_fault_impl(a1, a2, OS_LOG_TYPE_FAULT, a4, a5, 0xCu);
}

void sub_1A0BCA5CC(void *a1, uint64_t a2, uint64_t a3, const char *a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint8_t a9)
{
  NSObject *v9;

  _os_log_fault_impl(a1, v9, OS_LOG_TYPE_FAULT, a4, &a9, 0x16u);
}

void sub_1A0BCA834()
{
  CUTReporting *v0;
  void *v1;

  v0 = objc_alloc_init(CUTReporting);
  v1 = (void *)qword_1EE5CD6B8;
  qword_1EE5CD6B8 = (uint64_t)v0;

}

id sub_1A0BCA954()
{
  if (qword_1EE5CD698 != -1)
    dispatch_once(&qword_1EE5CD698, &unk_1E4490408);
  return (id)qword_1EE5CD6A0;
}

void sub_1A0BCA994(uint64_t a1)
{
  void *v2;
  _QWORD v3[4];
  id v4;
  id v5;

  +[CUTReporting _rtcReportingSession](CUTReporting, "_rtcReportingSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    v3[0] = MEMORY[0x1E0C809B0];
    v3[1] = 3221225472;
    v3[2] = sub_1A0BCAA40;
    v3[3] = &unk_1E4490398;
    v5 = *(id *)(a1 + 32);
    v4 = v2;
    objc_msgSend(v4, "startConfigurationWithCompletionHandler:", v3);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

uint64_t sub_1A0BCAA40(uint64_t a1, uint64_t a2)
{
  uint64_t v3;

  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
    a2 = *(_QWORD *)(a1 + 32);
  return (*(uint64_t (**)(uint64_t, uint64_t))(v3 + 16))(v3, a2);
}

void sub_1A0BCAF88()
{
  void *v0;

  v0 = (void *)qword_1EE5CD688;
  qword_1EE5CD688 = (uint64_t)&unk_1E44940B8;

}

void sub_1A0BCB034(uint64_t a1)
{
  uint64_t v2;
  void *v3;

  os_unfair_lock_lock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(void **)(v2 + 16);
  *(_QWORD *)(v2 + 16) = 0;

  os_unfair_lock_unlock((os_unfair_lock_t)(*(_QWORD *)(a1 + 32) + 8));
}

void sub_1A0BCB11C(uint64_t a1, uint64_t a2)
{
  void *v2;
  uint64_t v3;
  id v4;

  v2 = *(void **)(a1 + 32);
  v3 = *(_QWORD *)(a1 + 40);
  if (a2)
  {
    MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel__fullfillSeal_withSession_);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithDomain:code:userInfo:", CFSTR("CUTReportingErrorDomain"), 3, 0);
    v4 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "_failSeal:withError:", v3, v4);

  }
}

uint64_t sub_1A0BCB248(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", *(_QWORD *)(a1 + 40));
}

uint64_t sub_1A0BCB304(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "failWithError:", *(_QWORD *)(a1 + 40));
}

void sub_1A0BCB338()
{
  dispatch_queue_t v0;
  void *v1;
  NSObject *v2;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UTILITY, 0);
  v2 = objc_claimAutoreleasedReturnValue();
  v0 = dispatch_queue_create("CUTReporting.queue", v2);
  v1 = (void *)qword_1EE5CD6A0;
  qword_1EE5CD6A0 = (uint64_t)v0;

}

void *sub_1A0BCB38C()
{
  void *result;

  result = CUTWeakLinkSymbol("kRTCReportingSessionInfoClientType", CFSTR("RTCReporting"));
  qword_1EE5CD638 = (uint64_t)result;
  return result;
}

void *sub_1A0BCB3B8()
{
  void *result;

  result = CUTWeakLinkSymbol("kRTCReportingSessionInfoClientVersion", CFSTR("RTCReporting"));
  qword_1EE5CD648 = (uint64_t)result;
  return result;
}

void *sub_1A0BCB3E4()
{
  void *result;

  result = CUTWeakLinkSymbol("kRTCReportingSessionInfoSessionID", CFSTR("RTCReporting"));
  qword_1EE5CD658 = (uint64_t)result;
  return result;
}

void *sub_1A0BCB410()
{
  void *result;

  result = CUTWeakLinkSymbol("kRTCReportingSessionInfoBatchEvent", CFSTR("RTCReporting"));
  qword_1EE5CD628 = (uint64_t)result;
  return result;
}

void *sub_1A0BCB43C()
{
  void *result;

  result = CUTWeakLinkSymbol("kRTCReportingUserInfoClientName", CFSTR("RTCReporting"));
  qword_1EE5CD668 = (uint64_t)result;
  return result;
}

void *sub_1A0BCB468()
{
  void *result;

  result = CUTWeakLinkSymbol("kRTCReportingUserInfoServiceName", CFSTR("RTCReporting"));
  qword_1EE5CD678 = (uint64_t)result;
  return result;
}

void sub_1A0BCB528()
{
  CUTTelephonyManager *v0;
  void *v1;

  v0 = objc_alloc_init(CUTTelephonyManager);
  v1 = (void *)qword_1EE5CD710;
  qword_1EE5CD710 = (uint64_t)v0;

}

uint64_t sub_1A0BCB90C(uint64_t a1)
{
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "lock");
  byte_1EE5CD6F0 = 0;
  objc_msgSend(*(id *)(a1 + 32), "__adjustFastDormancyTokens");
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "unlock");
}

void sub_1A0BCBE2C(int a1, uint64_t a2)
{
  NSObject *v4;
  int v5;
  int v6;
  int v7;
  int v8;
  int v9;
  int v10;
  int v11;
  int v12;
  int v13;
  _DWORD v14[2];
  __int16 v15;
  int v16;
  __int16 v17;
  int v18;
  __int16 v19;
  int v20;
  __int16 v21;
  int v22;
  __int16 v23;
  int v24;
  __int16 v25;
  int v26;
  __int16 v27;
  int v28;
  __int16 v29;
  int v30;
  __int16 v31;
  uint64_t v32;
  uint64_t v33;

  v33 = *MEMORY[0x1E0C80C00];
  +[CUTLog network](CUTLog, "network");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    if ((a1 & 0x40000) != 0)
      v5 = 87;
    else
      v5 = 45;
    v14[0] = 67111426;
    v14[1] = v5;
    if ((a1 & 2) != 0)
      v6 = 82;
    else
      v6 = 45;
    v15 = 1024;
    v16 = v6;
    if ((a1 & 1) != 0)
      v7 = 116;
    else
      v7 = 45;
    v17 = 1024;
    v18 = v7;
    if ((a1 & 4) != 0)
      v8 = 99;
    else
      v8 = 45;
    v19 = 1024;
    v20 = v8;
    if ((a1 & 8) != 0)
      v9 = 67;
    else
      v9 = 45;
    v21 = 1024;
    if ((a1 & 0x10) != 0)
      v10 = 105;
    else
      v10 = 45;
    v22 = v9;
    v23 = 1024;
    if ((a1 & 0x20) != 0)
      v11 = 68;
    else
      v11 = 45;
    v24 = v10;
    if ((a1 & 0x10000) != 0)
      v12 = 108;
    else
      v12 = 45;
    v25 = 1024;
    v26 = v11;
    if ((a1 & 0x20000) != 0)
      v13 = 100;
    else
      v13 = 45;
    v27 = 1024;
    v28 = v12;
    v29 = 1024;
    v30 = v13;
    v31 = 2080;
    v32 = a2;
    _os_log_impl(&dword_1A0BC3000, v4, OS_LOG_TYPE_DEFAULT, "Reachability Flag Status: %c%c %c%c%c%c%c%c%c %s\n", (uint8_t *)v14, 0x42u);
  }

}

void sub_1A0BCC188()
{
  CUTWiFiManager *v0;
  void *v1;

  v0 = objc_alloc_init(CUTWiFiManager);
  v1 = (void *)qword_1ECD8FDC0;
  qword_1ECD8FDC0 = (uint64_t)v0;

}

uint64_t sub_1A0BCC518(uint64_t a1)
{
  NSObject *v2;
  uint8_t v4[16];

  +[CUTLog network](CUTLog, "network");
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v4 = 0;
    _os_log_impl(&dword_1A0BC3000, v2, OS_LOG_TYPE_DEFAULT, "Notified about link change, running network block async", v4, 2u);
  }

  return objc_msgSend(*(id *)(a1 + 32), "_updateIsWiFiAssociatedAsync:", 1);
}

uint64_t sub_1A0BCCA98(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a3, sel__handleDeviceAttachedCallback);
}

void sub_1A0BCCAA0()
{
  NSObject *v0;

  +[CUTLog network](CUTLog, "network");
  v0 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEBUG))
    sub_1A0BD24D8();

}

uint64_t sub_1A0BCCBA8(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePotentialDeviceChange:", a2);
}

void sub_1A0BCCD5C(const __SCDynamicStore *a1)
{
  const __CFAllocator *v2;
  const CFArrayCallBacks *v3;
  __CFArray *Mutable;
  const __CFString *v5;
  CFStringRef NetworkGlobalEntity;
  CFStringRef v7;
  __CFArray *v8;
  const __CFString *v9;
  CFStringRef NetworkServiceEntity;
  const __CFDictionary *v11;
  const __CFDictionary *Value;
  const __CFDictionary *v13;
  CFTypeID v14;
  const void *v15;
  _BOOL8 v16;
  BOOL v17;
  int v18;
  BOOL v19;
  const __CFDictionary *v20;
  const __CFDictionary *v21;
  CFTypeID v22;
  CFStringRef v23;
  const void *v24;
  id v25;

  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = (const CFArrayCallBacks *)MEMORY[0x1E0C9B378];
  Mutable = CFArrayCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B378]);
  v5 = (const __CFString *)*MEMORY[0x1E0CE8B30];
  NetworkGlobalEntity = SCDynamicStoreKeyCreateNetworkGlobalEntity(v2, (CFStringRef)*MEMORY[0x1E0CE8B30], (CFStringRef)*MEMORY[0x1E0CE8B78]);
  CFArrayAppendValue(Mutable, NetworkGlobalEntity);
  v7 = SCDynamicStoreKeyCreateNetworkGlobalEntity(v2, v5, (CFStringRef)*MEMORY[0x1E0CE8B80]);
  CFArrayAppendValue(Mutable, v7);
  v8 = CFArrayCreateMutable(v2, 0, v3);
  v9 = (const __CFString *)*MEMORY[0x1E0CE8B60];
  NetworkServiceEntity = SCDynamicStoreKeyCreateNetworkServiceEntity(v2, v5, (CFStringRef)*MEMORY[0x1E0CE8B20], (CFStringRef)*MEMORY[0x1E0CE8B60]);
  CFArrayAppendValue(v8, NetworkServiceEntity);
  CFRelease(NetworkServiceEntity);
  v11 = SCDynamicStoreCopyMultiple(a1, Mutable, v8);
  CFRelease(Mutable);
  CFRelease(v8);
  if (!v11)
  {
    v16 = 0;
    goto LABEL_25;
  }
  if (!NetworkGlobalEntity)
    goto LABEL_7;
  Value = (const __CFDictionary *)CFDictionaryGetValue(v11, NetworkGlobalEntity);
  v13 = Value;
  if (!Value)
  {
LABEL_8:
    v15 = 0;
    goto LABEL_9;
  }
  v14 = CFGetTypeID(Value);
  if (v14 != CFDictionaryGetTypeID())
  {
LABEL_7:
    v13 = 0;
    goto LABEL_8;
  }
  v15 = CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E0CE8B40]);
  v13 = (const __CFDictionary *)CFDictionaryGetValue(v13, (const void *)*MEMORY[0x1E0CE8B48]);
LABEL_9:
  if (v15)
    v17 = v13 == 0;
  else
    v17 = 1;
  v18 = v17;
  if (v7)
    v19 = v18 == 0;
  else
    v19 = 1;
  if (!v19)
  {
    v20 = (const __CFDictionary *)CFDictionaryGetValue(v11, v7);
    if (v20)
    {
      v21 = v20;
      v22 = CFGetTypeID(v20);
      if (v22 == CFDictionaryGetTypeID())
      {
        v15 = CFDictionaryGetValue(v21, (const void *)*MEMORY[0x1E0CE8B40]);
        v13 = (const __CFDictionary *)CFDictionaryGetValue(v21, (const void *)*MEMORY[0x1E0CE8B48]);
      }
    }
  }
  v16 = 0;
  if (v15 && v13)
  {
    v23 = SCDynamicStoreKeyCreateNetworkServiceEntity(v2, v5, (CFStringRef)v13, v9);
    v24 = CFDictionaryGetValue(v11, v23);
    CFRelease(v23);
    v16 = v24 != 0;
  }
LABEL_25:
  if (NetworkGlobalEntity)
    CFRelease(NetworkGlobalEntity);
  if (v7)
    CFRelease(v7);
  if (v11)
    CFRelease(v11);
  +[CUTWiFiManager sharedInstance](CUTWiFiManager, "sharedInstance");
  v25 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "setIsPrimaryCellularCached:", v16);

}

void sub_1A0BCD4A4(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  uint64_t v5;
  NSObject *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  const __CFString *v10;
  id v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  NSObject *v16;
  uint64_t i;
  uint64_t v18;
  uint64_t v19;
  void *v20;
  _QWORD block[6];
  id v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  uint8_t v27[128];
  uint8_t buf[4];
  uint64_t v29;
  uint64_t v30;

  v30 = *MEMORY[0x1E0C80C00];
  +[CUTLog network](CUTLog, "network");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    v29 = a2;
    _os_log_impl(&dword_1A0BC3000, v4, OS_LOG_TYPE_DEFAULT, "Found current network: %p", buf, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "_ssidFromNetwork:", a2);
  v5 = objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[CUTLog network](CUTLog, "network");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138477827;
      v29 = v5;
      _os_log_impl(&dword_1A0BC3000, v6, OS_LOG_TYPE_DEFAULT, "We are associated to %{private}@", buf, 0xCu);
    }

    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObject:forKey:", v5, CFSTR("@\"CUTWiFiManagerSSID\""));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v7 = 0;
  }
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock");
  +[CUTLog network](CUTLog, "network");
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138477827;
    v29 = a2;
    _os_log_impl(&dword_1A0BC3000, v8, OS_LOG_TYPE_DEFAULT, "Network change: %{private}@", buf, 0xCu);
  }
  v20 = (void *)v5;

  +[CUTLog network](CUTLog, "network");
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    v10 = CFSTR("YES");
    if (!a2)
      v10 = CFSTR("NO");
    *(_DWORD *)buf = 138412290;
    v29 = (uint64_t)v10;
    _os_log_impl(&dword_1A0BC3000, v9, OS_LOG_TYPE_DEFAULT, "Wifi is associated? %@", buf, 0xCu);
  }

  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v11 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
  v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16);
  if (v12)
  {
    v13 = v12;
    v14 = *(_QWORD *)v24;
    v15 = MEMORY[0x1E0C809B0];
    v16 = MEMORY[0x1E0C80D38];
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v24 != v14)
          objc_enumerationMutation(v11);
        v18 = *(_QWORD *)(*((_QWORD *)&v23 + 1) + 8 * i);
        block[0] = v15;
        block[1] = 3221225472;
        block[2] = sub_1A0BCD7DC;
        block[3] = &unk_1E4490560;
        v19 = *(_QWORD *)(a1 + 32);
        block[4] = v18;
        block[5] = v19;
        v22 = v7;
        dispatch_async(v16, block);

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v20);
    }
    while (v13);
  }

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
}

uint64_t sub_1A0BCD7DC(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_cutWiFiManagerLinkDidChange_context_);
  return result;
}

void sub_1A0BCDB3C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  id v11;
  uint64_t v12;
  id v13;
  id v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, const void *);
  void *v19;
  uint64_t v20;
  id v21;
  uint8_t buf[4];
  const void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock");
  v4 = *(_QWORD *)(a1 + 32);
  v5 = *(const void **)(v4 + 56);
  if (v5)
  {
    CFRetain(*(CFTypeRef *)(v4 + 56));
    +[CUTLog network](CUTLog, "network");
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v5;
      _os_log_impl(&dword_1A0BC3000, v6, OS_LOG_TYPE_DEFAULT, "Found cached network: %p", buf, 0xCu);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
LABEL_5:
    objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", v5);
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
    if (v5)
      CFRelease(v5);
    return;
  }
  objc_msgSend(*(id *)(v4 + 32), "unlock");
  if (!*(_BYTE *)(a1 + 48))
  {
    if (a2)
      v5 = (const void *)WiFiDeviceClientCopyCurrentNetwork();
    else
      v5 = 0;
    +[CUTLog network](CUTLog, "network");
    v15 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      v23 = v5;
      _os_log_impl(&dword_1A0BC3000, v15, OS_LOG_TYPE_DEFAULT, "Sync query found network: %p", buf, 0xCu);
    }

    goto LABEL_5;
  }
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = sub_1A0BCDDA4;
  v19 = &unk_1E44905B0;
  v7 = *(void **)(a1 + 40);
  v20 = *(_QWORD *)(a1 + 32);
  v21 = v7;
  v8 = (void *)MEMORY[0x1A1B015EC](&v16);
  if (a2)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock", v16, v17, v18, v19, v20);
    v9 = *(_QWORD *)(a1 + 32);
    v10 = *(void **)(v9 + 32);
    v11 = *(id *)(v9 + 120);
    objc_msgSend(v10, "unlock");
    v12 = objc_msgSend(v8, "copy");

    v13 = (id)MEMORY[0x1A1B015EC](v12);
    WiFiDeviceClientCopyCurrentNetworkAsync();

    v14 = (id)objc_opt_self();
    v8 = (void *)v12;
  }

}

void sub_1A0BCDDA4(uint64_t a1, const void *a2)
{
  NSObject *v4;
  int v5;
  const void *v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setCurrentNetwork:", a2);
  if (*(_QWORD *)(a1 + 40))
  {
    +[CUTLog network](CUTLog, "network");
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      v5 = 134217984;
      v6 = a2;
      _os_log_impl(&dword_1A0BC3000, v4, OS_LOG_TYPE_DEFAULT, "async query found network: %p", (uint8_t *)&v5, 0xCu);
    }

    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
  if (a2)
    CFRelease(a2);
}

void sub_1A0BCDE88(uint64_t a1, uint64_t a2, void (**a3)(_QWORD))
{
  void (**v3)(_QWORD);

  if (a3)
  {
    v3 = a3;
    a3[2](a3);
    a3 = v3;
  }

}

uint64_t sub_1A0BCDF74(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_handlePotentialDeviceChange:", a2);
}

uint64_t sub_1A0BCE238(int a1, CFDictionaryRef theDict, void *a3)
{
  const __CFBoolean *Value;
  int v6;
  const __CFNumber *v7;
  const __CFNumber *v8;
  uint64_t result;
  int v10;
  int valuePtr;

  v10 = -1431655766;
  valuePtr = -1431655766;
  Value = (const __CFBoolean *)CFDictionaryGetValue(theDict, CFSTR("DRIVER_AVAILABLE"));
  v6 = CFBooleanGetValue(Value);
  v7 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DRIVER_AVAILABLE_REASON"));
  CFNumberGetValue(v7, kCFNumberIntType, &valuePtr);
  v8 = (const __CFNumber *)CFDictionaryGetValue(theDict, CFSTR("DRIVER_AVAILABLE_SUBREASON"));
  result = CFNumberGetValue(v8, kCFNumberIntType, &v10);
  if (v6)
    return objc_msgSend(a3, "_performPowerReading");
  return result;
}

void sub_1A0BCE2CC(int a1, CFDictionaryRef theDict, uint64_t a3)
{
  if (theDict)
  {
    CFDictionaryGetValue(theDict, CFSTR("LINK_CHANGED_NETWORK"));
    MEMORY[0x1E0DE7D20](a3, sel__setCurrentNetwork_);
  }
}

uint64_t sub_1A0BCE30C(uint64_t a1, uint64_t a2)
{
  return MEMORY[0x1E0DE7D20](a2, sel__handleDevicePowerCallback);
}

uint64_t sub_1A0BCE314(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return MEMORY[0x1E0DE7D20](a3, sel__handleHostAPStateChangedCallback);
}

uint64_t sub_1A0BCE31C(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_cutWiFiManagerDeviceAttached_);
  return result;
}

void sub_1A0BCE500(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  _QWORD block[6];
  id v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (v3)
  {
    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock");
    v17 = 0u;
    v18 = 0u;
    v15 = 0u;
    v16 = 0u;
    v4 = *(id *)(*(_QWORD *)(a1 + 32) + 40);
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v16;
      v8 = MEMORY[0x1E0C809B0];
      v9 = MEMORY[0x1E0C80D38];
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v16 != v7)
            objc_enumerationMutation(v4);
          v11 = *(_QWORD *)(*((_QWORD *)&v15 + 1) + 8 * v10);
          block[0] = v8;
          block[1] = 3221225472;
          block[2] = sub_1A0BCE684;
          block[3] = &unk_1E4490560;
          v12 = *(_QWORD *)(a1 + 32);
          block[4] = v11;
          block[5] = v12;
          v14 = v3;
          dispatch_async(v9, block);

          ++v10;
        }
        while (v6 != v10);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v15, v19, 16);
      }
      while (v6);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
  }

}

uint64_t sub_1A0BCE684(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_cutWiFiManager_generatedPowerReading_);
  return result;
}

void sub_1A0BCE770(uint64_t a1, uint64_t a2)
{
  CFNumberRef v4;
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  void *v11;
  unint64_t v12;
  void *v13;
  unint64_t v14;
  void *v15;
  unint64_t v16;
  void *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  void *v28;
  void *v29;
  uint64_t v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  void *v35;
  uint64_t v36;
  void *v37;
  void *v38;
  id v39;
  uint64_t v40;
  uint64_t v41;
  void *v42;
  uint64_t v43;
  uint64_t v44;
  void (*v45)(uint64_t, uint64_t);
  void *v46;
  id v47;
  id v48;
  id v49;
  int valuePtr;

  if (a2 && objc_msgSend(*(id *)(a1 + 32), "isWiFiAssociated"))
  {
    valuePtr = 115;
    v4 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberIntType, &valuePtr);
    v5 = (void *)WiFiDeviceClientCopyProperty();
    objc_msgSend(v5, "objectForKey:", CFSTR("INSTANT_ASSOCIATED_SLEEP_DURATION"));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "integerValue");

    objc_msgSend(v5, "objectForKey:", CFSTR("INSTANT_UNASSOCIATED_SLEEP_DURATION"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "integerValue");

    if (v7 > 0 || v9 >= 1)
    {
      objc_msgSend(v5, "objectForKey:", CFSTR("CACHED_ASSOCIATED_SLEEP_DURATION"));
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = objc_msgSend(v11, "unsignedIntegerValue");

      objc_msgSend(v5, "objectForKey:", CFSTR("CACHED_TIME_STAMP"));
      v13 = (void *)objc_claimAutoreleasedReturnValue();
      v14 = objc_msgSend(v13, "unsignedIntegerValue");

      objc_msgSend(v5, "objectForKey:", CFSTR("INSTANT_ASSOCIATED_SLEEP_DURATION"));
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "unsignedIntegerValue");

      objc_msgSend(v5, "objectForKey:", CFSTR("INSTANT_TIME_STAMP"));
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      v18 = objc_msgSend(v17, "unsignedIntegerValue");

      v19 = v18 >= v14 ? v18 - v14 : 0;
      if (v19 >> 5 >= 0x753)
      {
        if (v16 >= v12)
          v20 = v16 - v12;
        else
          v20 = 0;
        objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v19);
        v22 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v22, CFSTR("@\"CUTWiFiManagerTotalDuration\""));

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v20);
        v23 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v23, CFSTR("@\"CUTWiFiManagerPMDuration\""));

        v24 = (void *)MEMORY[0x1E0CB37E8];
        objc_msgSend(*(id *)(a1 + 32), "_wifiMeasurementErrorForInterval:", (double)v19 / 1000.0);
        objc_msgSend(v24, "numberWithDouble:");
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v25, CFSTR("@\"CUTWiFiManagerMaxMeasurementError\""));

        objc_msgSend(v5, "objectForKey:", CFSTR("CACHED_ASSOCIATED_SLEEP_DURATION"));
        v26 = (void *)objc_claimAutoreleasedReturnValue();
        v27 = objc_msgSend(v26, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v27);
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v28, CFSTR("CACHED_ASSOCIATED_SLEEP_DURATION"));

        objc_msgSend(v5, "objectForKey:", CFSTR("CACHED_TIME_STAMP"));
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        v30 = objc_msgSend(v29, "unsignedIntValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v30);
        v31 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v31, CFSTR("CACHED_TIME_STAMP"));

        objc_msgSend(v5, "objectForKey:", CFSTR("INSTANT_ASSOCIATED_SLEEP_DURATION"));
        v32 = (void *)objc_claimAutoreleasedReturnValue();
        v33 = objc_msgSend(v32, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v33);
        v34 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v34, CFSTR("INSTANT_ASSOCIATED_SLEEP_DURATION"));

        objc_msgSend(v5, "objectForKey:", CFSTR("INSTANT_TIME_STAMP"));
        v35 = (void *)objc_claimAutoreleasedReturnValue();
        v36 = objc_msgSend(v35, "unsignedIntegerValue");

        objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v36);
        v37 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v21, "setObject:forKey:", v37, CFSTR("INSTANT_TIME_STAMP"));

        v43 = MEMORY[0x1E0C809B0];
        v44 = 3221225472;
        v45 = sub_1A0BCEB98;
        v46 = &unk_1E4490628;
        v38 = *(void **)(a1 + 40);
        v47 = *(id *)(a1 + 32);
        v48 = v21;
        v49 = v38;
        v39 = v21;
        objc_msgSend(v47, "_performCurrentNetworkBlock:withDevice:async:", &v43, a2, 1);
        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "lock", v43, v44, v45, v46, v47);
        v40 = objc_msgSend(v5, "copy");
        v41 = *(_QWORD *)(a1 + 32);
        v42 = *(void **)(v41 + 88);
        *(_QWORD *)(v41 + 88) = v40;

        objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 32), "unlock");
      }
    }
    if (v4)
      CFRelease(v4);

  }
}

void sub_1A0BCEB98(uint64_t a1, uint64_t a2)
{
  void *v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_ssidFromNetwork:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3;
  if (v3)
  {
    objc_msgSend(*(id *)(a1 + 40), "setObject:forKey:", v3, CFSTR("@\"CUTWiFiManagerSSID\""));
    v3 = v5;
  }
  v4 = *(_QWORD *)(a1 + 48);
  if (v4)
  {
    (*(void (**)(uint64_t, _QWORD, void *))(v4 + 16))(v4, *(_QWORD *)(a1 + 40), v3);
    v3 = v5;
  }

}

void sub_1A0BCECB4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A0BCECCC(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void sub_1A0BCECDC(uint64_t a1)
{

}

void sub_1A0BCECE4(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t v4;
  void *v5;

  objc_msgSend(*(id *)(a1 + 32), "_ssidFromNetwork:", a2);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = v3;

}

void sub_1A0BCEDDC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A0BCEDF4(uint64_t result, uint64_t a2)
{
  uint64_t v2;
  char v3;
  char v4;

  if (a2)
  {
    v2 = result;
    v3 = objc_msgSend(*(id *)(result + 32), "_isPrimaryCellular");
    result = WiFiNetworkIsCaptive();
    if ((_DWORD)result)
      v4 = v3;
    else
      v4 = 0;
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(v2 + 40) + 8) + 24) = v4;
  }
  return result;
}

id sub_1A0BCF4E0(void *a1, void *a2)
{
  id v3;
  id v4;
  CUTUnsafePromiseSeal *v5;
  id v6;
  CUTUnsafePromiseSeal *v7;
  void *v8;
  uint64_t v10;
  uint64_t v11;
  void (*v12)(uint64_t, void *);
  void *v13;
  CUTUnsafePromiseSeal *v14;
  id v15;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init(CUTUnsafePromiseSeal);
  v10 = MEMORY[0x1E0C809B0];
  v11 = 3221225472;
  v12 = sub_1A0BCF5AC;
  v13 = &unk_1E44906C8;
  v14 = v5;
  v15 = v3;
  v6 = v3;
  v7 = v5;
  objc_msgSend(v4, "registerResultBlock:", &v10);

  -[CUTUnsafePromiseSeal promise](v7, "promise", v10, v11, v12, v13);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

void sub_1A0BCF5AC(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(a1 + 32);
    objc_msgSend(v3, "error");
    v8 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v4, "failWithError:", v8);
  }
  else
  {
    v5 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "value");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, void *))(v5 + 16))(v5, v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();

    v9[0] = MEMORY[0x1E0C809B0];
    v9[1] = 3221225472;
    v9[2] = sub_1A0BCF6AC;
    v9[3] = &unk_1E44900C8;
    v10 = *(id *)(a1 + 32);
    objc_msgSend(v7, "registerResultBlock:", v9);

  }
}

void sub_1A0BCF6AC(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  id v6;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = *(void **)(a1 + 32);
  if (v4 == 1)
  {
    objc_msgSend(v3, "error");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "failWithError:", v6);
  }
  else
  {
    objc_msgSend(v3, "value");
    v6 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "fulfillWithValue:", v6);
  }

}

_CUTLockingPromise *sub_1A0BCF730(void *a1, void *a2)
{
  id v3;
  id v4;
  _CUTLockingPromise *v5;
  _CUTLockingPromise *v6;
  id v7;
  void *v8;
  _CUTLockingPromise *v9;
  _QWORD v11[4];
  _CUTLockingPromise *v12;
  id v13;

  v3 = a2;
  v4 = a1;
  v5 = objc_alloc_init(_CUTLockingPromise);
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = sub_1A0BCF7F4;
  v11[3] = &unk_1E44906C8;
  v6 = v5;
  v12 = v6;
  v13 = v3;
  v7 = v3;
  objc_msgSend(v4, "registerResultBlock:", v11);

  v8 = v13;
  v9 = v6;

  return v9;
}

void sub_1A0BCF7F4(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  CUTResult *v5;
  void *v6;
  CUTResult *v7;
  uint64_t v8;
  void *v9;
  void *v10;
  _QWORD v11[4];
  id v12;

  v3 = a2;
  if (objc_msgSend(v3, "state") == 1)
  {
    v4 = *(void **)(a1 + 32);
    v5 = [CUTResult alloc];
    objc_msgSend(v3, "error");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = -[CUTResult initWithError:](v5, "initWithError:", v6);
    objc_msgSend(v4, "_fulfillWithResult:", v7);

  }
  else
  {
    v8 = *(_QWORD *)(a1 + 40);
    objc_msgSend(v3, "value");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v9);
    v10 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      sub_1A0BD2568();
    v11[0] = MEMORY[0x1E0C809B0];
    v11[1] = 3221225472;
    v11[2] = sub_1A0BCF924;
    v11[3] = &unk_1E44900C8;
    v12 = *(id *)(a1 + 32);
    objc_msgSend(v10, "registerResultBlock:", v11);

  }
}

void sub_1A0BCF924(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  CUTResult *v6;
  uint64_t v7;
  void *v8;
  id v9;

  v3 = a2;
  v4 = objc_msgSend(v3, "state");
  v5 = *(void **)(a1 + 32);
  v6 = [CUTResult alloc];
  if (v4 == 1)
  {
    objc_msgSend(v3, "error");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = -[CUTResult initWithError:](v6, "initWithError:", v9);
  }
  else
  {
    objc_msgSend(v3, "value");
    v9 = (id)objc_claimAutoreleasedReturnValue();

    v7 = -[CUTResult initWithSuccess:](v6, "initWithSuccess:", v9);
  }
  v8 = (void *)v7;
  objc_msgSend(v5, "_fulfillWithResult:", v7);

}

void sub_1A0BCFD44(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

void sub_1A0BCFD70(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v7;
  BOOL v8;
  id v9;

  v3 = a2;
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24))
  {
    v9 = v3;
    if (objc_msgSend(v3, "state") == 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      v4 = *(void **)(a1 + 32);
      objc_msgSend(v9, "error");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v4, "failWithError:", v5);

    }
    else
    {
      objc_msgSend(v9, "value");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v6, *(int *)(a1 + 64));

      v7 = (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
      v8 = objc_msgSend(*(id *)(a1 + 40), "count") == v7;
      v3 = v9;
      if (!v8)
        goto LABEL_8;
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = 1;
      objc_msgSend(*(id *)(a1 + 32), "fulfillWithValue:", *(_QWORD *)(a1 + 40));
    }
    v3 = v9;
  }
LABEL_8:

}

void sub_1A0BD0028(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A0BD0048(uint64_t a1, uint64_t a2)
{
  uint64_t v3;
  uint64_t result;

  objc_msgSend(*(id *)(a1 + 32), "setObject:atIndexedSubscript:", a2, *(int *)(a1 + 56));
  v3 = (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  result = objc_msgSend(*(id *)(a1 + 32), "count");
  if (result == v3)
    return objc_msgSend(*(id *)(a1 + 40), "fulfillWithValue:", *(_QWORD *)(a1 + 32));
  return result;
}

void sub_1A0BD05E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  uint64_t v16;
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v16 - 136), 8);
  _Unwind_Resume(a1);
}

void sub_1A0BD060C(uint64_t a1, void *a2)
{
  void *v3;
  CUTResult *v4;
  CUTResult *v5;
  CUTResult *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  id v10;

  v10 = a2;
  objc_msgSend(*(id *)(a1 + 32), "lock");
  if (!*(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24))
  {
    if (objc_msgSend(v10, "state") == 1)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v3 = *(void **)(a1 + 40);
      v4 = [CUTResult alloc];
      objc_msgSend(v10, "error");
      v5 = (CUTResult *)objc_claimAutoreleasedReturnValue();
      v6 = -[CUTResult initWithError:](v4, "initWithError:", v5);
      objc_msgSend(v3, "_fulfillWithResult:", v6);

LABEL_6:
      goto LABEL_7;
    }
    objc_msgSend(v10, "value");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(*(id *)(a1 + 48), "setObject:atIndexedSubscript:", v7, *(int *)(a1 + 72));

    v8 = (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
    if (objc_msgSend(*(id *)(a1 + 48), "count") == v8)
    {
      *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = 1;
      v9 = *(void **)(a1 + 40);
      v5 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", *(_QWORD *)(a1 + 48));
      objc_msgSend(v9, "_fulfillWithResult:", v5);
      goto LABEL_6;
    }
  }
LABEL_7:
  objc_msgSend(*(id *)(a1 + 32), "unlock");

}

void sub_1A0BD09AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, ...)
{
  va_list va;

  va_start(va, a14);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t sub_1A0BD09CC(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  uint64_t v5;
  void *v6;
  CUTResult *v7;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v3, "lock");
  objc_msgSend(*(id *)(a1 + 40), "setObject:atIndexedSubscript:", v4, *(int *)(a1 + 64));

  v5 = (int)++*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
  if (objc_msgSend(*(id *)(a1 + 40), "count") == v5)
  {
    v6 = *(void **)(a1 + 48);
    v7 = -[CUTResult initWithSuccess:]([CUTResult alloc], "initWithSuccess:", *(_QWORD *)(a1 + 40));
    objc_msgSend(v6, "_fulfillWithResult:", v7);

  }
  return objc_msgSend(*(id *)(a1 + 32), "unlock");
}

uint64_t sub_1A0BD12F4()
{
  void *v0;
  void *v1;
  uint64_t v2;

  BOMCopierUserData();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = v0;
  v2 = 2;
  if (v0)
  {
    if (objc_msgSend(v0, "wasCancelled"))
      v2 = 2;
    else
      v2 = 0;
  }

  return v2;
}

uint64_t sub_1A0BD1338(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  NSObject *v6;
  int v8;
  void *v9;
  __int16 v10;
  uint64_t v11;
  __int16 v12;
  int v13;
  uint64_t v14;

  v14 = *MEMORY[0x1E0C80C00];
  BOMCopierUserData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUTLog fileCopier](CUTLog, "fileCopier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v8 = 138543875;
    v9 = v5;
    v10 = 2081;
    v11 = a2;
    v12 = 1024;
    v13 = a3;
    _os_log_fault_impl(&dword_1A0BC3000, v6, OS_LOG_TYPE_FAULT, "File error {cutCopier: %{public}@, path: %{private}s, errorNumber: %d}", (uint8_t *)&v8, 0x1Cu);
  }

  return 0;
}

uint64_t sub_1A0BD141C(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;

  BOMCopierUserData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUTLog fileCopier](CUTLog, "fileCopier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_1A0BD2590((uint64_t)v3, a2, v4);

  return 3;
}

void sub_1A0BD148C(uint64_t a1, uint64_t a2)
{
  void *v3;
  NSObject *v4;

  BOMCopierUserData();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUTLog fileCopier](CUTLog, "fileCopier");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    sub_1A0BD2604((uint64_t)v3, a2, v4);

}

void sub_1A0BD14F8(uint64_t a1, uint64_t a2, int a3)
{
  void *v5;
  NSObject *v6;
  int v7;
  void *v8;
  __int16 v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  BOMCopierUserData();
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[CUTLog fileCopier](CUTLog, "fileCopier");
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    v7 = 138543875;
    v8 = v5;
    v9 = 2081;
    v10 = a2;
    v11 = 1024;
    v12 = a3;
    _os_log_fault_impl(&dword_1A0BC3000, v6, OS_LOG_TYPE_FAULT, "Fatal File Error {cutCopier: %{public}@, path: %{private}s, errorNumber: %d}", (uint8_t *)&v7, 0x1Cu);
  }

}

void sub_1A0BD16A8(void *a1, uint64_t a2, os_log_t log, const char *a4, ...)
{
  va_list va;

  va_start(va, a4);
  _os_log_fault_impl(a1, log, OS_LOG_TYPE_FAULT, a4, (uint8_t *)va, 0x16u);
}

void sub_1A0BD18A8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t sub_1A0BD18CC(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_cutPowerMonitorSystemHasPoweredOn_);
  return result;
}

void sub_1A0BD19E8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  id v6;

  +[CUTPowerMonitor sharedInstance](CUTPowerMonitor, "sharedInstance");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_handlePowerChangedNotificationWithMessageType:notificationID:", a3, a4);

}

void sub_1A0BD1B48()
{
  id v0;
  void *v1;

  v0 = -[CUTPowerMonitor _init]([CUTPowerMonitor alloc], "_init");
  v1 = (void *)qword_1ECD8FDA8;
  qword_1ECD8FDA8 = (uint64_t)v0;

}

uint64_t sub_1A0BD1C50(uint64_t a1)
{
  uint64_t result;

  result = objc_opt_respondsToSelector();
  if ((result & 1) != 0)
    return MEMORY[0x1E0DE7D20](*(_QWORD *)(a1 + 32), sel_cutPowerMonitorBatteryConnectedStateDidChange_);
  return result;
}

void sub_1A0BD1D98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A0BD1DBC()
{
  __assert_rtn("-[CUTDeferredTaskQueue initWithCapacity:queue:block:]", "CUTDeferredTaskQueue.m", 25, "capacity >= 0");
}

void sub_1A0BD1DE4()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_fault_impl(&dword_1A0BC3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unable to create security task from audit token.", v0, 2u);
}

void sub_1A0BD1E28(uint64_t *a1)
{
  uint64_t v1;
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v1 = *a1;
  v2 = 138543362;
  v3 = v1;
  _os_log_fault_impl(&dword_1A0BC3000, MEMORY[0x1E0C81028], OS_LOG_TYPE_FAULT, "Unable to get entitlements for client task {error: %{public}@}", (uint8_t *)&v2, 0xCu);
}

void sub_1A0BD1EA8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, MEMORY[0x1E0C81028], a3, "*** SCDynamicStoreCreate() failed", a5, a6, a7, a8, 0);
}

void sub_1A0BD1EE0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, MEMORY[0x1E0C81028], a3, "*** SCDynamicStoreSetNotificationKeys failed", a5, a6, a7, a8, 0);
}

void sub_1A0BD1F18()
{
  void *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  cut_backtrace();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  sub_1A0BC87FC(&dword_1A0BC3000, v1, v2, "%{public}@", v3, v4, v5, v6, 2u);

  sub_1A0BC8810();
}

void sub_1A0BD1F94(uint64_t a1, int a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  int v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138543618;
  v4 = a1;
  v5 = 1024;
  v6 = a2;
  _os_log_fault_impl(&dword_1A0BC3000, log, OS_LOG_TYPE_FAULT, "Unable to create the power assertion {identifier: %{public}@, retVal: %d}", (uint8_t *)&v3, 0x12u);
}

void sub_1A0BD2018(uint64_t a1, int a2, NSObject *a3)
{
  uint64_t v6;
  pid_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  __int16 v11;
  int v12;
  __int16 v13;
  pid_t v14;
  __int16 v15;
  uint64_t v16;
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v6 = *(_QWORD *)(*(_QWORD *)a1 + 16);
  v7 = getpid();
  v8 = *(_QWORD *)(*(_QWORD *)a1 + 24);
  v9 = 138544130;
  v10 = v6;
  v11 = 1024;
  v12 = a2;
  v13 = 1024;
  v14 = v7;
  v15 = 2114;
  v16 = v8;
  _os_log_fault_impl(&dword_1A0BC3000, a3, OS_LOG_TYPE_FAULT, "Unable to properly release the power assertion - Dropping it stead {identifier: %{public}@, retVal: %d, pid: %d, stack: %{public}@ }", (uint8_t *)&v9, 0x22u);
}

void sub_1A0BD20E0(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, a1, a3, "Connection went invalid", a5, a6, a7, a8, 0);
  sub_1A0BCA5E0();
}

void sub_1A0BD2110(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, a1, a3, "connection termination imminent", a5, a6, a7, a8, 0);
  sub_1A0BCA5E0();
}

void sub_1A0BD2140(int a1, NSObject *a2)
{
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v2[0] = 67109120;
  v2[1] = a1;
  _os_log_fault_impl(&dword_1A0BC3000, a2, OS_LOG_TYPE_FAULT, "Unknown error type: %d, exiting", (uint8_t *)v2, 8u);
  sub_1A0BCA5E0();
}

void sub_1A0BD21B0()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1A0BCA5E8();
  sub_1A0BCA5C0(&dword_1A0BC3000, v0, v1, "Unhandled listener event:  %p", v2);
}

void sub_1A0BD2218(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1A0BCA5B4(a1);
  sub_1A0BCA5E8();
  sub_1A0BCA5C0(&dword_1A0BC3000, a2, v3, "Interrupted connection to service %s", v4);
  sub_1A0BC8810();
}

void sub_1A0BD2288(uint64_t a1, NSObject *a2)
{
  uint64_t v3;
  uint8_t v4[24];

  sub_1A0BCA5B4(a1);
  sub_1A0BCA5E8();
  sub_1A0BCA5C0(&dword_1A0BC3000, a2, v3, "Connection Invalid for service %{public}s", v4);
  sub_1A0BC8810();
}

void sub_1A0BD22F8(uint64_t a1, void *a2)
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  sub_1A0BCA5B4(a1);
  xpc_dictionary_get_string(a2, (const char *)*MEMORY[0x1E0C81270]);
  sub_1A0BCA5CC(&dword_1A0BC3000, v3, v4, "Unexpected error for service %{public}s: %{public}s", v5, v6, v7, v8, 2u);
}

void sub_1A0BD239C(uint64_t a1)
{
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint8_t v7;

  sub_1A0BCA5B4(a1);
  sub_1A0BCA5E8();
  sub_1A0BCA5CC(&dword_1A0BC3000, v1, v2, "Received unexpected event in hander for service %{public}s: %{public}@", v3, v4, v5, v6, v7);
  sub_1A0BC8810();
}

void sub_1A0BD2414()
{
  NSObject *v0;
  uint64_t v1;
  uint8_t v2[24];
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  sub_1A0BCA5E8();
  sub_1A0BCA5C0(&dword_1A0BC3000, v0, v1, "Unable to build service for name %{public}s", v2);
}

void sub_1A0BD247C(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, a1, a3, "CUT alert server disconnected", a5, a6, a7, a8, 0);
  sub_1A0BCA5E0();
}

void sub_1A0BD24AC()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A0BCF4D4();
  sub_1A0BC87A4(&dword_1A0BC3000, v0, v1, "WiFiManagerClientCreate() returned NULL. Check that the process has the appropriate entitlement(s).", v2, v3, v4, v5, v6);
  sub_1A0BCA5E0();
}

void sub_1A0BD24D8()
{
  os_log_t v0;
  uint8_t v1[16];

  sub_1A0BCF4D4();
  _os_log_debug_impl(&dword_1A0BC3000, v0, OS_LOG_TYPE_DEBUG, "_CUTWiFiManagerClientNotificationCallback", v1, 2u);
  sub_1A0BCA5E0();
}

void sub_1A0BD2510()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A0BCF4D4();
  sub_1A0BC87A4(&dword_1A0BC3000, v0, v1, "*** SCDynamicStoreCreate() failed", v2, v3, v4, v5, v6);
  sub_1A0BCA5E0();
}

void sub_1A0BD253C()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  sub_1A0BCF4D4();
  sub_1A0BC87A4(&dword_1A0BC3000, v0, v1, "CUTWiFiManager showNetworkOptions has been called before initialization has completed - please check entitlements for WiFi access and otherwise file a radar on Purple Common Utilities!", v2, v3, v4, v5, v6);
  sub_1A0BCA5E0();
}

void sub_1A0BD2568()
{
  __assert_rtn("_CUTSafeThenPromise_block_invoke", "CUTPromise.m", 38, "[nextPromise isKindOfClass:[CUTPromise class]]");
}

void sub_1A0BD2590(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543619;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2081;
  *(_QWORD *)&v3[14] = a2;
  sub_1A0BD16A8(&dword_1A0BC3000, a2, a3, "File Conflict Error {cutCopier: %{public}@, path: %{private}s}", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void sub_1A0BD2604(uint64_t a1, uint64_t a2, NSObject *a3)
{
  _BYTE v3[24];

  *(_DWORD *)v3 = 138543618;
  *(_QWORD *)&v3[4] = a1;
  *(_WORD *)&v3[12] = 2082;
  *(_QWORD *)&v3[14] = a2;
  sub_1A0BD16A8(&dword_1A0BC3000, a2, a3, "Fatal Error {cutCopier: %{public}@, error: %{public}s}", *(_QWORD *)v3, *(_QWORD *)&v3[8], *(_QWORD *)&v3[16], *MEMORY[0x1E0C80C00]);
}

void sub_1A0BD2678(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, MEMORY[0x1E0C81028], a3, "Cannot retrieve runloop source for battery monitor.", a5, a6, a7, a8, 0);
}

void sub_1A0BD26B0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  sub_1A0BC87A4(&dword_1A0BC3000, MEMORY[0x1E0C81028], a3, "Cannot listen to battery level change notification.", a5, a6, a7, a8, 0);
}

uint64_t BOMCopierCancelCopy()
{
  return MEMORY[0x1E0D03498]();
}

uint64_t BOMCopierCopyWithOptions()
{
  return MEMORY[0x1E0D034A8]();
}

uint64_t BOMCopierFree()
{
  return MEMORY[0x1E0D034B8]();
}

uint64_t BOMCopierNew()
{
  return MEMORY[0x1E0D034C0]();
}

uint64_t BOMCopierSetCopyFileStartedHandler()
{
  return MEMORY[0x1E0D034D8]();
}

uint64_t BOMCopierSetFatalErrorHandler()
{
  return MEMORY[0x1E0D034E8]();
}

uint64_t BOMCopierSetFatalFileErrorHandler()
{
  return MEMORY[0x1E0D034F0]();
}

uint64_t BOMCopierSetFileConflictErrorHandler()
{
  return MEMORY[0x1E0D034F8]();
}

uint64_t BOMCopierSetFileErrorHandler()
{
  return MEMORY[0x1E0D03500]();
}

uint64_t BOMCopierSetUserData()
{
  return MEMORY[0x1E0D03508]();
}

uint64_t BOMCopierUserData()
{
  return MEMORY[0x1E0D03510]();
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x1E0C97CF8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x1E0C97D38](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x1E0C97D60](theArray);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFStringRef CFBundleGetIdentifier(CFBundleRef bundle)
{
  return (CFStringRef)MEMORY[0x1E0C98120](bundle);
}

CFBundleRef CFBundleGetMainBundle(void)
{
  return (CFBundleRef)MEMORY[0x1E0C98150]();
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x1E0C985A8]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFNumberRef CFNumberCreate(CFAllocatorRef allocator, CFNumberType theType, const void *valuePtr)
{
  return (CFNumberRef)MEMORY[0x1E0C98928](allocator, theType, valuePtr);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x1E0C98BC0](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x1E0C98BD0](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98BF8](rl, source, mode);
}

Boolean CFRunLoopContainsSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  return MEMORY[0x1E0C98C10](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x1E0C98C90](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x1E0C98CA8]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFIndex CFStringGetBytes(CFStringRef theString, CFRange range, CFStringEncoding encoding, UInt8 lossByte, Boolean isExternalRepresentation, UInt8 *buffer, CFIndex maxBufLen, CFIndex *usedBufLen)
{
  return MEMORY[0x1E0C99080](theString, range.location, range.length, *(_QWORD *)&encoding, lossByte, isExternalRepresentation, buffer, maxBufLen);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

IOReturn IOAllowPowerChange(io_connect_t kernelPort, intptr_t notificationID)
{
  return MEMORY[0x1E0CBAD20](*(_QWORD *)&kernelPort, notificationID);
}

IOReturn IODeregisterForSystemPower(io_object_t *notifier)
{
  return MEMORY[0x1E0CBAE38](notifier);
}

IONotificationPortRef IONotificationPortCreate(mach_port_t mainPort)
{
  return (IONotificationPortRef)MEMORY[0x1E0CBB698](*(_QWORD *)&mainPort);
}

void IONotificationPortDestroy(IONotificationPortRef notify)
{
  MEMORY[0x1E0CBB6A0](notify);
}

CFRunLoopSourceRef IONotificationPortGetRunLoopSource(IONotificationPortRef notify)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0CBB6B0](notify);
}

void IONotificationPortSetDispatchQueue(IONotificationPortRef notify, dispatch_queue_t queue)
{
  MEMORY[0x1E0CBB6B8](notify, queue);
}

kern_return_t IOObjectRelease(io_object_t object)
{
  return MEMORY[0x1E0CBB6F0](*(_QWORD *)&object);
}

IOReturn IOPMAssertionCreateWithDescription(CFStringRef AssertionType, CFStringRef Name, CFStringRef Details, CFStringRef HumanReadableReason, CFStringRef LocalizationBundlePath, CFTimeInterval Timeout, CFStringRef TimeoutAction, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB700](AssertionType, Name, Details, HumanReadableReason, LocalizationBundlePath, TimeoutAction, AssertionID, Timeout);
}

IOReturn IOPMAssertionCreateWithName(CFStringRef AssertionType, IOPMAssertionLevel AssertionLevel, CFStringRef AssertionName, IOPMAssertionID *AssertionID)
{
  return MEMORY[0x1E0CBB708](AssertionType, *(_QWORD *)&AssertionLevel, AssertionName, AssertionID);
}

IOReturn IOPMAssertionRelease(IOPMAssertionID AssertionID)
{
  return MEMORY[0x1E0CBB738](*(_QWORD *)&AssertionID);
}

io_connect_t IORegisterForSystemPower(void *refcon, IONotificationPortRef *thePortRef, IOServiceInterestCallback callback, io_object_t *notifier)
{
  return MEMORY[0x1E0CBB8D8](refcon, thePortRef, callback, notifier);
}

CFTypeRef IORegistryEntryCreateCFProperty(io_registry_entry_t entry, CFStringRef key, CFAllocatorRef allocator, IOOptionBits options)
{
  return (CFTypeRef)MEMORY[0x1E0CBB900](*(_QWORD *)&entry, key, allocator, *(_QWORD *)&options);
}

kern_return_t IOServiceAddInterestNotification(IONotificationPortRef notifyPort, io_service_t service, const io_name_t interestType, IOServiceInterestCallback callback, void *refCon, io_object_t *notification)
{
  return MEMORY[0x1E0CBB9C0](notifyPort, *(_QWORD *)&service, interestType, callback, refCon, notification);
}

kern_return_t IOServiceClose(io_connect_t connect)
{
  return MEMORY[0x1E0CBB9D0](*(_QWORD *)&connect);
}

io_service_t IOServiceGetMatchingService(mach_port_t mainPort, CFDictionaryRef matching)
{
  return MEMORY[0x1E0CBB9E0](*(_QWORD *)&mainPort, matching);
}

CFMutableDictionaryRef IOServiceMatching(const char *name)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0CBBA00](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

CFDictionaryRef SCDynamicStoreCopyMultiple(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return (CFDictionaryRef)MEMORY[0x1E0CE8758](store, keys, patterns);
}

CFPropertyListRef SCDynamicStoreCopyValue(SCDynamicStoreRef store, CFStringRef key)
{
  return (CFPropertyListRef)MEMORY[0x1E0CE8768](store, key);
}

SCDynamicStoreRef SCDynamicStoreCreate(CFAllocatorRef allocator, CFStringRef name, SCDynamicStoreCallBack callout, SCDynamicStoreContext *context)
{
  return (SCDynamicStoreRef)MEMORY[0x1E0CE8770](allocator, name, callout, context);
}

CFStringRef SCDynamicStoreKeyCreateNetworkGlobalEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE8798](allocator, domain, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkInterfaceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef ifname, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87A8](allocator, domain, ifname, entity);
}

CFStringRef SCDynamicStoreKeyCreateNetworkServiceEntity(CFAllocatorRef allocator, CFStringRef domain, CFStringRef serviceID, CFStringRef entity)
{
  return (CFStringRef)MEMORY[0x1E0CE87B0](allocator, domain, serviceID, entity);
}

Boolean SCDynamicStoreSetDispatchQueue(SCDynamicStoreRef store, dispatch_queue_t queue)
{
  return MEMORY[0x1E0CE87C8](store, queue);
}

Boolean SCDynamicStoreSetNotificationKeys(SCDynamicStoreRef store, CFArrayRef keys, CFArrayRef patterns)
{
  return MEMORY[0x1E0CE87D8](store, keys, patterns);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithAddress(CFAllocatorRef allocator, const sockaddr *address)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88B8](allocator, address);
}

SCNetworkReachabilityRef SCNetworkReachabilityCreateWithName(CFAllocatorRef allocator, const char *nodename)
{
  return (SCNetworkReachabilityRef)MEMORY[0x1E0CE88C8](allocator, nodename);
}

Boolean SCNetworkReachabilityGetFlags(SCNetworkReachabilityRef target, SCNetworkReachabilityFlags *flags)
{
  return MEMORY[0x1E0CE88D8](target, flags);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

uint64_t WiFiDeviceClientCopyCurrentNetwork()
{
  return MEMORY[0x1E0D4FAF8]();
}

uint64_t WiFiDeviceClientCopyCurrentNetworkAsync()
{
  return MEMORY[0x1E0D4FB00]();
}

uint64_t WiFiDeviceClientCopyProperty()
{
  return MEMORY[0x1E0D4FB18]();
}

uint64_t WiFiDeviceClientRegisterDeviceAvailableCallback()
{
  return MEMORY[0x1E0D4FB60]();
}

uint64_t WiFiDeviceClientRegisterExtendedLinkCallback()
{
  return MEMORY[0x1E0D4FB68]();
}

uint64_t WiFiDeviceClientRegisterHostApStateChangedCallback()
{
  return MEMORY[0x1E0D4FB70]();
}

uint64_t WiFiDeviceClientRegisterPowerCallback()
{
  return MEMORY[0x1E0D4FB80]();
}

uint64_t WiFiManagerClientCopyDevices()
{
  return MEMORY[0x1E0D4FBE0]();
}

uint64_t WiFiManagerClientCopyEnabledNetworks()
{
  return MEMORY[0x1E0D4FBE8]();
}

uint64_t WiFiManagerClientCopyProperty()
{
  return MEMORY[0x1E0D4FC00]();
}

uint64_t WiFiManagerClientCreate()
{
  return MEMORY[0x1E0D4FC08]();
}

uint64_t WiFiManagerClientGetAskToJoinState()
{
  return MEMORY[0x1E0D4FC28]();
}

uint64_t WiFiManagerClientGetMISState()
{
  return MEMORY[0x1E0D4FC30]();
}

uint64_t WiFiManagerClientGetPower()
{
  return MEMORY[0x1E0D4FC38]();
}

uint64_t WiFiManagerClientGetType()
{
  return MEMORY[0x1E0D4FC40]();
}

uint64_t WiFiManagerClientGetWoWCapability()
{
  return MEMORY[0x1E0D4FC48]();
}

uint64_t WiFiManagerClientRegisterDeviceAttachmentCallback()
{
  return MEMORY[0x1E0D4FC58]();
}

uint64_t WiFiManagerClientRegisterNotificationCallback()
{
  return MEMORY[0x1E0D4FC60]();
}

uint64_t WiFiManagerClientScheduleWithRunLoop()
{
  return MEMORY[0x1E0D4FC88]();
}

uint64_t WiFiManagerClientSetAssociationMode()
{
  return MEMORY[0x1E0D4FC90]();
}

uint64_t WiFiManagerClientSetType()
{
  return MEMORY[0x1E0D4FCA8]();
}

uint64_t WiFiManagerClientSetWoWState()
{
  return MEMORY[0x1E0D4FCB0]();
}

uint64_t WiFiNetworkGetSSID()
{
  return MEMORY[0x1E0D4FD30]();
}

uint64_t WiFiNetworkIsCaptive()
{
  return MEMORY[0x1E0D4FD60]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFXPCCreateCFObjectFromXPCMessage()
{
  return MEMORY[0x1E0C9A7F0]();
}

uint64_t _CFXPCCreateXPCMessageWithCFObject()
{
  return MEMORY[0x1E0C9A808]();
}

uint64_t _CTServerConnectionCreateWithIdentifier()
{
  return MEMORY[0x1E0CA6F40]();
}

uint64_t _CTServerConnectionDormancySuspendAssertionCreate()
{
  return MEMORY[0x1E0CA6F50]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void _os_log_debug_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81020](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_error_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81038](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

int backtrace(void **a1, int a2)
{
  return MEMORY[0x1E0C816B8](a1, *(_QWORD *)&a2);
}

char **__cdecl backtrace_symbols(void *const *a1, int a2)
{
  return (char **)MEMORY[0x1E0C816C8](a1, *(_QWORD *)&a2);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Ivar class_getInstanceVariable(Class cls, const char *name)
{
  return (Ivar)MEMORY[0x1E0DE7AB8](cls, name);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_assert_queue_V2(dispatch_queue_t queue)
{
  MEMORY[0x1E0C82BE8](queue);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
}

void dispatch_block_cancel(dispatch_block_t block)
{
  MEMORY[0x1E0C82C58](block);
}

dispatch_block_t dispatch_block_create(dispatch_block_flags_t flags, dispatch_block_t block)
{
  return (dispatch_block_t)MEMORY[0x1E0C82C60](flags, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x1E0C82D20]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x1E0C82D28](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x1E0C82D30](group);
}

void dispatch_group_notify(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82D38](group, queue, block);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x1E0C82E08](predicate, block);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_autorelease_frequency(dispatch_queue_attr_t attr, dispatch_autorelease_frequency_t frequency)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E28](attr, frequency);
}

dispatch_queue_attr_t dispatch_queue_attr_make_with_qos_class(dispatch_queue_attr_t attr, dispatch_qos_class_t qos_class, int relative_priority)
{
  return (dispatch_queue_attr_t)MEMORY[0x1E0C82E38](attr, *(_QWORD *)&qos_class, *(_QWORD *)&relative_priority);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

void exit(int a1)
{
  MEMORY[0x1E0C83278](*(_QWORD *)&a1);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memset(void *__b, int __c, size_t __len)
{
  return (void *)MEMORY[0x1E0C840B0](__b, *(_QWORD *)&__c, __len);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

void objc_autoreleasePoolPop(void *context)
{
  MEMORY[0x1E0DE7BD8](context);
}

void *objc_autoreleasePoolPush(void)
{
  return (void *)MEMORY[0x1E0DE7BE0]();
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7BE8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x1E0DE7BF0](exc_buf);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x1E0DE7BF8]();
}

void objc_destroyWeak(id *location)
{
  MEMORY[0x1E0DE7C60](location);
}

void objc_end_catch(void)
{
  MEMORY[0x1E0DE7C80]();
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x1E0DE7C90](obj);
}

id objc_getProperty(id self, SEL _cmd, ptrdiff_t offset, BOOL atomic)
{
  return (id)MEMORY[0x1E0DE7CD0](self, _cmd, offset, atomic);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
}

void objc_moveWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7D18](to, from);
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x1E0DE7D30](a1, a2);
}

uint64_t objc_opt_class()
{
  return MEMORY[0x1E0DE7D38]();
}

uint64_t objc_opt_isKindOfClass()
{
  return MEMORY[0x1E0DE7D40]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
}

uint64_t objc_opt_self()
{
  return MEMORY[0x1E0DE7D58]();
}

void objc_release(id a1)
{
  MEMORY[0x1E0DE7D78](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x1E0DE7E50](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7E58](a1);
}

id objc_retainAutoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E60](a1);
}

id objc_retainAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7E68](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x1E0DE7E70](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x1E0DE7FA0](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x1E0DE7FB0](location, obj);
}

id objc_storeWeak(id *location, id obj)
{
  return (id)MEMORY[0x1E0DE7FB8](location, obj);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x1E0DE7FC8](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x1E0DE7FD0](obj);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

id object_getIvar(id a1, Ivar a2)
{
  return (id)MEMORY[0x1E0DE8018](a1, a2);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

int proc_name(int pid, void *buffer, uint32_t buffersize)
{
  return MEMORY[0x1E0C84C20](*(_QWORD *)&pid, buffer, *(_QWORD *)&buffersize);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

xpc_connection_t xpc_connection_create(const char *name, dispatch_queue_t targetq)
{
  return (xpc_connection_t)MEMORY[0x1E0C85F90](name, targetq);
}

xpc_connection_t xpc_connection_create_mach_service(const char *name, dispatch_queue_t targetq, uint64_t flags)
{
  return (xpc_connection_t)MEMORY[0x1E0C85FB0](name, targetq, flags);
}

void *__cdecl xpc_connection_get_context(xpc_connection_t connection)
{
  return (void *)MEMORY[0x1E0C85FE0](connection);
}

const char *__cdecl xpc_connection_get_name(xpc_connection_t connection)
{
  return (const char *)MEMORY[0x1E0C86000](connection);
}

void xpc_connection_resume(xpc_connection_t connection)
{
  MEMORY[0x1E0C86018](connection);
}

void xpc_connection_send_message(xpc_connection_t connection, xpc_object_t message)
{
  MEMORY[0x1E0C86030](connection, message);
}

void xpc_connection_set_context(xpc_connection_t connection, void *context)
{
  MEMORY[0x1E0C86070](connection, context);
}

void xpc_connection_set_event_handler(xpc_connection_t connection, xpc_handler_t handler)
{
  MEMORY[0x1E0C86080](connection, handler);
}

void xpc_connection_set_target_queue(xpc_connection_t connection, dispatch_queue_t targetq)
{
  MEMORY[0x1E0C860C8](connection, targetq);
}

xpc_object_t xpc_dictionary_create(const char *const *keys, xpc_object_t *values, size_t count)
{
  return (xpc_object_t)MEMORY[0x1E0C86208](keys, values, count);
}

BOOL xpc_dictionary_get_BOOL(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C86260](xdict, key);
}

const void *__cdecl xpc_dictionary_get_data(xpc_object_t xdict, const char *key, size_t *length)
{
  return (const void *)MEMORY[0x1E0C86278](xdict, key, length);
}

double xpc_dictionary_get_double(xpc_object_t xdict, const char *key)
{
  double result;

  MEMORY[0x1E0C86298](xdict, key);
  return result;
}

int64_t xpc_dictionary_get_int64(xpc_object_t xdict, const char *key)
{
  return MEMORY[0x1E0C862A0](xdict, key);
}

const char *__cdecl xpc_dictionary_get_string(xpc_object_t xdict, const char *key)
{
  return (const char *)MEMORY[0x1E0C862C8](xdict, key);
}

void xpc_dictionary_set_BOOL(xpc_object_t xdict, const char *key, BOOL value)
{
  MEMORY[0x1E0C86310](xdict, key, value);
}

void xpc_dictionary_set_data(xpc_object_t xdict, const char *key, const void *bytes, size_t length)
{
  MEMORY[0x1E0C86330](xdict, key, bytes, length);
}

void xpc_dictionary_set_double(xpc_object_t xdict, const char *key, double value)
{
  MEMORY[0x1E0C86348](xdict, key, value);
}

void xpc_dictionary_set_int64(xpc_object_t xdict, const char *key, int64_t value)
{
  MEMORY[0x1E0C86360](xdict, key, value);
}

void xpc_dictionary_set_string(xpc_object_t xdict, const char *key, const char *string)
{
  MEMORY[0x1E0C86390](xdict, key, string);
}

xpc_type_t xpc_get_type(xpc_object_t object)
{
  return (xpc_type_t)MEMORY[0x1E0C86520](object);
}


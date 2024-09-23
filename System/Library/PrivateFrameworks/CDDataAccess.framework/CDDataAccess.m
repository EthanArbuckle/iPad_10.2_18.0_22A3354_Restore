void sub_1C1CD414C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CD9D18(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CDC998(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy_(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose_(uint64_t a1)
{

}

void sub_1C1CDD910(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, ...)
{
  va_list va;

  va_start(va, a11);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE1DE8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE1F58(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE2298(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE2430(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE26DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, ...)
{
  va_list va;

  va_start(va, a16);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__0(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__0(uint64_t a1)
{

}

void sub_1C1CE2860(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

CFTypeRef _DASecCopyIdentityFromPersist(CFTypeRef a1)
{
  void *v1;
  const __CFDictionary *v2;
  OSStatus v3;
  NSObject *v4;
  os_log_type_t v5;
  CFTypeRef result;
  uint8_t buf[4];
  OSStatus v8;
  void *values[2];
  void *keys[3];

  keys[2] = *(void **)MEMORY[0x1E0C80C00];
  if (a1)
  {
    v1 = (void *)*MEMORY[0x1E0CD70E0];
    keys[0] = *(void **)MEMORY[0x1E0CD7028];
    keys[1] = v1;
    values[0] = *(void **)MEMORY[0x1E0C9AE50];
    values[1] = (void *)a1;
    v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)values, 2, 0, 0);
    result = 0;
    v3 = SecItemCopyMatching(v2, &result);
    if (v2)
      CFRelease(v2);
    if (v3)
    {
      DALoggingwithCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
      if (os_log_type_enabled(v4, v5))
      {
        *(_DWORD *)buf = 67109120;
        v8 = v3;
        _os_log_impl(&dword_1C1CD1000, v4, v5, "Could not find identity for persistent ref. %d", buf, 8u);
      }

    }
    return result;
  }
  return a1;
}

void *_DASecDeleteIdentityByPersistentRef(void *result)
{
  void *v1;
  const __CFDictionary *v2;
  OSStatus v3;
  NSObject *v4;
  os_log_type_t v5;
  _DWORD v6[2];
  void *values;
  void *keys[2];

  keys[1] = *(void **)MEMORY[0x1E0C80C00];
  if (result)
  {
    v1 = (void *)*MEMORY[0x1E0CD70E0];
    values = result;
    keys[0] = v1;
    v2 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, 0, 0);
    v3 = SecItemDelete(v2);
    if (v2)
      CFRelease(v2);
    if (v3)
    {
      DALoggingwithCategory();
      v4 = objc_claimAutoreleasedReturnValue();
      v5 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
      if (os_log_type_enabled(v4, v5))
      {
        v6[0] = 67109120;
        v6[1] = v3;
        _os_log_impl(&dword_1C1CD1000, v4, v5, "Could not delete identity by persistent ref. %d", (uint8_t *)v6, 8u);
      }

    }
    return (void *)(v3 == 0);
  }
  return result;
}

id _DASecIdentityCopySSLClientAuthenticationChain(__SecIdentity *a1)
{
  SecPolicyRef SSL;
  SecPolicyRef v3;
  void *v4;
  void *v5;
  CFIndex CertificateCount;
  CFIndex v8;
  uint64_t v9;
  CFIndex v10;
  int v11;
  SecTrustRef trust;
  SecCertificateRef certificateRef;

  SSL = SecPolicyCreateSSL(0, 0);
  if (!SSL)
    return 0;
  v3 = SSL;
  certificateRef = 0;
  v4 = 0;
  if (!SecIdentityCopyCertificate(a1, &certificateRef))
  {
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithObject:", certificateRef);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    CFRelease(certificateRef);
    trust = 0;
    v4 = 0;
    if (!SecTrustCreateWithCertificates(v5, v3, &trust))
    {
      v11 = 0;
      if (MEMORY[0x1C3BB50A4](trust, &v11))
      {
        v4 = 0;
      }
      else
      {
        CertificateCount = SecTrustGetCertificateCount(trust);
        v4 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", CertificateCount);
        objc_msgSend(v4, "addObject:", a1);
        v8 = CertificateCount - 2;
        if (CertificateCount >= 2)
        {
          v9 = 0;
          v10 = CertificateCount - 1;
          do
          {
            if (v8 != v9 || v11 != 4)
              objc_msgSend(v4, "addObject:", SecTrustGetCertificateAtIndex(trust, v9 + 1));
            ++v9;
          }
          while (v10 != v9);
        }
      }
      CFRelease(trust);
    }

  }
  CFRelease(v3);
  return v4;
}

uint64_t DAIsRunningInDataAccessD()
{
  return _sDAIsRunningInDataAccessD;
}

void setDAIsRunningInDataAccessD()
{
  _sDAIsRunningInDataAccessD = 1;
}

id acDataclassForDADataclass(uint64_t a1)
{
  id *v2;
  NSObject *v3;
  os_log_type_t v4;
  int v6;
  const char *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  switch(a1)
  {
    case 1:
      v2 = (id *)MEMORY[0x1E0C8F3D0];
      return *v2;
    case 2:
      v2 = (id *)MEMORY[0x1E0C8F388];
      return *v2;
    case 3:
    case 5:
    case 6:
    case 7:
      goto LABEL_6;
    case 4:
      v2 = (id *)MEMORY[0x1E0C8F378];
      return *v2;
    case 8:
      v2 = (id *)MEMORY[0x1E0C8F390];
      return *v2;
    default:
      if (a1 == 16)
      {
        v2 = (id *)MEMORY[0x1E0C8F400];
        return *v2;
      }
      if (a1 == 32)
      {
        v2 = (id *)MEMORY[0x1E0C8F3F8];
        return *v2;
      }
LABEL_6:
      DALoggingwithCategory();
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = *(_BYTE *)(MEMORY[0x1E0D03918] + 4);
      if (os_log_type_enabled(v3, v4))
      {
        v6 = 136315394;
        v7 = "NSString *acDataclassForDADataclass(DASingleDataclass)";
        v8 = 2048;
        v9 = a1;
        _os_log_impl(&dword_1C1CD1000, v3, v4, "%s unhandled dataclass %lx", (uint8_t *)&v6, 0x16u);
      }

      return 0;
  }
}

uint64_t daDataclassForACDataclass(void *a1)
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8F388]) & 1) != 0)
  {
    v2 = 2;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8F378]) & 1) != 0)
  {
    v2 = 4;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8F400]) & 1) != 0)
  {
    v2 = 16;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8F3F8]) & 1) != 0)
  {
    v2 = 32;
  }
  else if ((objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8F3D0]) & 1) != 0)
  {
    v2 = 1;
  }
  else if (objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C8F390]))
  {
    v2 = 8;
  }
  else
  {
    v2 = 0;
  }

  return v2;
}

id acDataclassesForDADataclasses(char a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = v2;
  if ((a1 & 2) != 0)
  {
    objc_msgSend(v2, "addObject:", *MEMORY[0x1E0C8F388]);
    if ((a1 & 4) == 0)
    {
LABEL_3:
      if ((a1 & 0x10) == 0)
        goto LABEL_4;
      goto LABEL_11;
    }
  }
  else if ((a1 & 4) == 0)
  {
    goto LABEL_3;
  }
  objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C8F378]);
  if ((a1 & 0x10) == 0)
  {
LABEL_4:
    if ((a1 & 0x20) == 0)
      goto LABEL_5;
    goto LABEL_12;
  }
LABEL_11:
  objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C8F400]);
  if ((a1 & 0x20) == 0)
  {
LABEL_5:
    if ((a1 & 1) == 0)
      goto LABEL_6;
LABEL_13:
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C8F3D0]);
    if ((a1 & 8) == 0)
      return v3;
    goto LABEL_7;
  }
LABEL_12:
  objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C8F3F8]);
  if ((a1 & 1) != 0)
    goto LABEL_13;
LABEL_6:
  if ((a1 & 8) != 0)
LABEL_7:
    objc_msgSend(v3, "addObject:", *MEMORY[0x1E0C8F390]);
  return v3;
}

uint64_t daDataclassesForACDataclasses(void *a1)
{
  uint64_t v1;
  id v2;
  uint64_t v3;
  uint64_t v4;
  int v5;

  v1 = *MEMORY[0x1E0C8F388];
  v2 = a1;
  if (objc_msgSend(v2, "containsObject:", v1))
    v3 = 2;
  else
    v3 = 0;
  if (objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C8F378]))
    v3 |= 4uLL;
  if (objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C8F400]))
    v3 |= 0x10uLL;
  if (objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C8F3F8]))
    v3 |= 0x20uLL;
  v4 = v3 | objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C8F3D0]);
  v5 = objc_msgSend(v2, "containsObject:", *MEMORY[0x1E0C8F390]);

  if (v5)
    return v4 | 8;
  else
    return v4;
}

uint64_t sharedDAAccountStore()
{
  return objc_msgSend(MEMORY[0x1E0C8F2B8], "defaultStore");
}

void sub_1C1CE3734(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE3C08(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,char a36)
{
  _Block_object_dispose(&a36, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1(uint64_t a1)
{

}

void sub_1C1CE3D00(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE3FB4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE41FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE4350(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE44AC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1C1CE482C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t flockWithProcessAssertion(int a1, int a2, void *a3)
{
  id v5;
  const void *v6;
  const void *v7;
  uint64_t v8;
  void *v10;
  void *v11;

  v5 = a3;
  if (flockWithProcessAssertion_pred == -1)
  {
    if (a2)
    {
LABEL_3:
      if (CFDictionaryGetValue((CFDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1))
      {
        objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "int flockWithProcessAssertion(int, BOOL, NSString *__strong)");
        v11 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("DAUtils.m"), 378, CFSTR("You can't flock a flocked file.  No ref counting for you"));

      }
      if ((_sDAIsRunningInDataAccessD & 1) == 0)
      {
        getpid();
        v6 = (const void *)SBSProcessAssertionCreateForPID();
        if (v6)
        {
          v7 = v6;
          CFDictionarySetValue((CFMutableDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1, v6);
          CFRelease(v7);
        }
      }
      v8 = flock(a1, 2);
      goto LABEL_12;
    }
  }
  else
  {
    dispatch_once(&flockWithProcessAssertion_pred, &__block_literal_global_51);
    if (a2)
      goto LABEL_3;
  }
  v8 = flock(a1, 8);
  if ((_sDAIsRunningInDataAccessD & 1) == 0)
  {
    CFDictionaryGetValue((CFDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1);
    CFDictionaryRemoveValue((CFMutableDictionaryRef)flockWithProcessAssertion_fdToProcessAssertions, (const void *)a1);
  }
LABEL_12:

  return v8;
}

CFMutableDictionaryRef __flockWithProcessAssertion_block_invoke()
{
  CFMutableDictionaryRef result;

  result = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, 0, MEMORY[0x1E0C9B3A0]);
  flockWithProcessAssertion_fdToProcessAssertions = (uint64_t)result;
  return result;
}

void addNullRunLoopSourceForRunLoopAndModes(__CFRunLoop *a1, void *a2)
{
  id v3;
  _QWORD *v4;
  __CFRunLoopSource *v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  CFRunLoopSourceContext context;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  v4 = malloc_type_malloc(0x10uLL, 0x1020040D5A9D86FuLL);
  context.version = 0;
  context.info = v4;
  context.schedule = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))_nullSourceSchedule;
  memset(&context.retain, 0, 40);
  context.cancel = (void (__cdecl *)(void *, CFRunLoopRef, CFRunLoopMode))_nullSourceCancel;
  context.perform = (void (__cdecl *)(void *))_nullSourcePerform;
  v5 = CFRunLoopSourceCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, &context);
  *(_DWORD *)v4 = 0;
  v4[1] = v5;
  if (v5)
  {
    v13 = 0u;
    v14 = 0u;
    v11 = 0u;
    v12 = 0u;
    v6 = v3;
    v7 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v12;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v12 != v9)
            objc_enumerationMutation(v6);
          CFRunLoopAddSource(a1, v5, *(CFRunLoopMode *)(*((_QWORD *)&v11 + 1) + 8 * v10++));
        }
        while (v8 != v10);
        v8 = objc_msgSend(v6, "countByEnumeratingWithState:objects:count:", &v11, v16, 16);
      }
      while (v8);
    }

    if (*(_DWORD *)v4)
    {
      CFRunLoopSourceSignal(v5);
      if (!v5)
        goto LABEL_14;
      goto LABEL_13;
    }
  }
  free(v4);
  if (v5)
LABEL_13:
    CFRelease(v5);
LABEL_14:

}

_DWORD *_nullSourceSchedule(_DWORD *result)
{
  ++*result;
  return result;
}

void _nullSourceCancel(void *a1)
{
  if ((*(_DWORD *)a1)-- == 1)
    free(a1);
}

void _nullSourcePerform(uint64_t a1)
{
  CFRunLoopSourceInvalidate(*(CFRunLoopSourceRef *)(a1 + 8));
}

uint64_t walkUpDAErrorChain(id *a1, _QWORD *a2)
{
  uint64_t v4;
  uint64_t v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v11;

  if (a1 && a2)
  {
    v4 = *MEMORY[0x1E0CB3388];
    v5 = *MEMORY[0x1E0D038F8];
    while (1)
    {
      objc_msgSend(*a1, "userInfo");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v4);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "objectForKeyedSubscript:", v5);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = v8;
      if (!v7 || v8 == 0)
        break;
      v11 = objc_retainAutorelease(v7);
      *a1 = v11;
      *a2 = objc_msgSend(v9, "integerValue");

    }
  }
  return 1;
}

BOOL statusAndErrorIndicateWeShouldTurnOnReachability(uint64_t a1, void *a2)
{
  id v2;
  id v3;
  _BOOL8 v4;
  void *v6;
  int v7;
  uint64_t v8;
  BOOL v10;
  void *v11;
  id v12;
  uint64_t v13;

  v12 = a2;
  v13 = a1;
  v2 = a2;
  walkUpDAErrorChain(&v12, &v13);
  v3 = v12;

  if (!v13)
  {
    objc_msgSend(v3, "domain");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "isEqualToString:", *MEMORY[0x1E0CB32E8]);

    if (v7)
    {
      v8 = objc_msgSend(v3, "code");
      v10 = (unint64_t)(v8 + 1020) <= 0x11 && ((1 << (v8 - 4)) & 0x3C805) != 0 || v8 == -1;
      if (v10 || v8 == -2000)
      {
        v4 = 1;
        goto LABEL_3;
      }
    }
    else
    {
      objc_msgSend(v3, "domain");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v11, "isEqualToString:", CFSTR("DAAccountValidationDomain")))
      {
        v4 = objc_msgSend(v3, "code") == 101;

        goto LABEL_3;
      }

    }
  }
  v4 = 0;
LABEL_3:

  return v4;
}

uint64_t statusAndErrorIndicatePersistentFolderSyncFailure(unint64_t a1, void *a2)
{
  id v2;
  id v3;
  uint64_t v4;
  id v6;
  unint64_t v7;

  v6 = a2;
  v7 = a1;
  v2 = a2;
  walkUpDAErrorChain(&v6, &v7);
  v3 = v6;

  v4 = 0;
  if (v7 <= 0x22)
  {
    if (((1 << v7) & 0x6C0200620) != 0)
    {
      v4 = 1;
    }
    else if (v7 == 1)
    {
      v4 = objc_msgSend(MEMORY[0x1E0D03908], "isAppleInternalInstall") ^ 1;
    }
  }

  return v4;
}

id runLoopModesToPerformDelayedSelectorsIn()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  uint64_t *v4;
  uint64_t v5;
  void *v6;
  uint64_t v8;
  void *v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99E58], "currentRunLoop");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "currentMode");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v2 = *MEMORY[0x1E0C99748];
  if (v1 && !objc_msgSend(v1, "isEqualToString:", *MEMORY[0x1E0C99748]))
  {
    v8 = v2;
    v9 = v1;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = &v8;
    v5 = 2;
  }
  else
  {
    v10[0] = v2;
    v3 = (void *)MEMORY[0x1E0C99D20];
    v4 = v10;
    v5 = 1;
  }
  objc_msgSend(v3, "arrayWithObjects:count:", v4, v5, v8, v9, v10[0]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

id DAUserAgent()
{
  void *v0;
  void *v1;
  void *v2;
  uint64_t v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v0 = (void *)DAUserAgent__sUserAgentString;
  if (!DAUserAgent__sUserAgentString)
  {
    objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v1, "infoDictionary");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("CFBundleVersion"));
    v3 = objc_claimAutoreleasedReturnValue();

    if (v3)
      v4 = (__CFString *)v3;
    else
      v4 = CFSTR("1.0");
    v5 = (void *)_CFCopyServerVersionDictionary();
    if (!v5)
      v5 = (void *)_CFCopySystemVersionDictionary();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9ABB0]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0C9AB90]);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_alloc(MEMORY[0x1E0CB3940]);
    objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "processName");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = objc_msgSend(v8, "initWithFormat:", CFSTR("iOS/%@ (%@) %@/%@"), v6, v7, v10, v4);
    v12 = (void *)DAUserAgent__sUserAgentString;
    DAUserAgent__sUserAgentString = v11;

    v0 = (void *)DAUserAgent__sUserAgentString;
  }
  return v0;
}

id DAProductString()
{
  if (DAProductString_onceToken != -1)
    dispatch_once(&DAProductString_onceToken, &__block_literal_global_91);
  return (id)DAProductString_sProduct;
}

id _MGStringForKey()
{
  __CFString *v0;
  const __CFString *v1;
  void *v2;

  v0 = (__CFString *)MGCopyAnswer();
  if (v0)
    v1 = v0;
  else
    v1 = CFSTR("iPhone");
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", v1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(" "), &stru_1E7B93480, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("-"), &stru_1E7B93480, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR("."), &stru_1E7B93480, 0, 0, objc_msgSend(v2, "length"));
  objc_msgSend(v2, "replaceOccurrencesOfString:withString:options:range:", CFSTR(","), CFSTR("C"), 0, 0, objc_msgSend(v2, "length"));

  return v2;
}

id DAModelString()
{
  if (DAModelString_onceToken != -1)
    dispatch_once(&DAModelString_onceToken, &__block_literal_global_94);
  return (id)DAModelString_sModel;
}

id appBundleIDsForDADataclasses(char a1)
{
  void *v2;
  void *v3;

  v2 = (void *)objc_opt_new();
  v3 = v2;
  if ((a1 & 0xA) != 0)
  {
    objc_msgSend(v2, "addObject:", CFSTR("com.apple.MobileAddressBook"));
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.mobilephone"));
  }
  if ((a1 & 4) != 0)
  {
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.mobilecal"));
    if ((a1 & 0x10) == 0)
    {
LABEL_5:
      if ((a1 & 0x20) == 0)
        goto LABEL_6;
LABEL_11:
      objc_msgSend(v3, "addObject:", CFSTR("com.apple.mobilenotes"));
      if ((a1 & 1) == 0)
        return v3;
      goto LABEL_7;
    }
  }
  else if ((a1 & 0x10) == 0)
  {
    goto LABEL_5;
  }
  objc_msgSend(v3, "addObject:", CFSTR("com.apple.reminders"));
  if ((a1 & 0x20) != 0)
    goto LABEL_11;
LABEL_6:
  if ((a1 & 1) != 0)
LABEL_7:
    objc_msgSend(v3, "addObject:", CFSTR("com.apple.mobilemail"));
  return v3;
}

uint64_t areDADiagnosticsEnabled()
{
  void *v0;
  uint64_t v1;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = objc_msgSend(v0, "BOOLForKey:", CFSTR("DADiagnosticsEnabled"));

  return v1;
}

id daDeviceID()
{
  if (daDeviceID_onceToken != -1)
    dispatch_once(&daDeviceID_onceToken, &__block_literal_global_203);
  return (id)daDeviceID___daDeviceID;
}

void __daDeviceID_block_invoke()
{
  id v0;
  int v1;
  int v2;
  void *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  void *v7;

  objc_msgSend((id)CPSharedResourcesDirectory(), "stringByAppendingPathComponent:", CFSTR("Library/Reminders/DataAccess/DeviceSpecificInfo.plist"));
  v0 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v1 = open((const char *)objc_msgSend(v0, "fileSystemRepresentation"), 514, 384);
  v2 = v1;
  if (v1 < 0)
  {
    v4 = 0;
  }
  else
  {
    flockWithProcessAssertion(v1, 1, CFSTR("com.apple.dataaccess.deviceid"));
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithContentsOfFile:", v0);
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3;
    if (v3)
    {
      objc_msgSend(v3, "objectForKeyedSubscript:", CFSTR("DAGlobalDeviceSpecificIdentifier"));
      v5 = objc_claimAutoreleasedReturnValue();
      if (v5)
      {
LABEL_9:
        flockWithProcessAssertion(v2, 0, CFSTR("com.apple.dataaccess.deviceid"));
        close(v2);
        goto LABEL_10;
      }
    }
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "da_newGUID");
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "mutableCopy");
  if (!v6)
    v6 = (void *)objc_opt_new();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", v5, CFSTR("DAGlobalDeviceSpecificIdentifier"));
  objc_msgSend(v6, "writeToFile:atomically:", v0, 1);

  if (v2 >= 0)
    goto LABEL_9;
LABEL_10:
  v7 = (void *)daDeviceID___daDeviceID;
  daDeviceID___daDeviceID = v5;

}

void sub_1C1CE7AD0(_Unwind_Exception *a1, int a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, int buf, __int128 a12)
{
  id v12;
  NSObject *v13;
  os_log_type_t v14;

  if (a2 == 1)
  {
    v12 = objc_begin_catch(a1);
    DALoggingwithCategory();
    v13 = objc_claimAutoreleasedReturnValue();
    v14 = *(_BYTE *)(MEMORY[0x1E0D03918] + 6);
    if (os_log_type_enabled(v13, v14))
    {
      buf = 138412546;
      WORD2(a12) = 2112;
      *(_QWORD *)((char *)&a12 + 6) = v12;
      _os_log_impl(&dword_1C1CD1000, v13, v14, "Exception when reading dictionary from %@: %@", (uint8_t *)&buf, 0x16u);
    }

    objc_end_catch();
    JUMPOUT(0x1C1CE7A00);
  }
  _Unwind_Resume(a1);
}

uint64_t dataaccess_get_global_queue()
{
  uint64_t v0;
  id v1;

  v0 = MEMORY[0x1E0C80D38];
  v1 = MEMORY[0x1E0C80D38];
  return v0;
}

void sub_1C1CE7F14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE7FE4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE83B8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE8CF4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE90FC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE9528(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE9A98(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CE9C54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

__CFString *getStateName(unsigned int a1)
{
  if (a1 > 5)
    return CFSTR("Out of bounds");
  else
    return getStateName_stateNames[a1];
}

void sub_1C1CEB6E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEBBE0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEBE1C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEBEF0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEDE54(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEDF50(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEE2C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEE60C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEE6E4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEE9E8(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CEED14(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CF1DA8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,os_activity_scope_state_s state)
{
  void *v21;

  objc_sync_exit(v21);
  os_activity_scope_leave(&state);
  _Unwind_Resume(a1);
}

void sub_1C1CF209C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CF2478(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1C1CF26CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1C1CF2854(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

id _InfoForNotification(uint64_t a1)
{
  void *v2;
  void *v3;

  _NotificationHandlerMap();
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKey:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

void _ReceiveNotificationResponseCallback(uint64_t a1, uint64_t a2)
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  os_log_type_t v10;
  void *v11;
  _QWORD block[4];
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint8_t buf[4];
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _InfoForNotification(a1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "groupIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    +[DAPowerAssertionManager sharedPowerAssertionManager](DAPowerAssertionManager, "sharedPowerAssertionManager");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "reattainPowerAssertionsForGroupIdentifier:", v5);

  }
  objc_msgSend(v4, "handler");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (v7)
  {
    objc_msgSend(v4, "callbackQueue");
    v8 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = ___ReceiveNotificationResponseCallback_block_invoke;
    block[3] = &unk_1E7B92818;
    v13 = v7;
    v14 = a1;
    v15 = a2;
    dispatch_async(v8, block);

    v9 = v13;
  }
  else
  {
    DALoggingwithCategory();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = *(_BYTE *)(MEMORY[0x1E0D03918] + 3);
    if (os_log_type_enabled(v9, v10))
    {
      *(_DWORD *)buf = 138412290;
      v17 = a1;
      _os_log_impl(&dword_1C1CD1000, v9, v10, "No completion block for notification %@", buf, 0xCu);
    }
  }

  _NotificationHandlerMap();
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "removeObjectForKey:", a1);

}

id _NotificationHandlerMap()
{
  if (_NotificationHandlerMap_onceToken != -1)
    dispatch_once(&_NotificationHandlerMap_onceToken, &__block_literal_global_5);
  return (id)_NotificationHandlerMap_sNotificationHandlerMap;
}

void sub_1C1CF42E8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 144), 8);
  _Unwind_Resume(a1);
}

void *DAWeakLinkSymbol(const char *a1, const void *a2)
{
  void *result;

  result = (void *)__HandleForSource(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

const void *__HandleForSource(const void *a1)
{
  const __CFDictionary *Mutable;
  const void *Value;
  id v4;
  void *v6;

  _os_nospin_lock_lock();
  Mutable = (const __CFDictionary *)__Handles;
  if (!__Handles)
  {
    Mutable = CFDictionaryCreateMutable(0, 0, 0, 0);
    __Handles = (uint64_t)Mutable;
  }
  Value = CFDictionaryGetValue(Mutable, a1);
  if (!Value)
  {
    if (a1
      || (objc_msgSend(&stru_1E7B93480, "stringByAppendingString:", CFSTR("/AppleInternal/Library/Frameworks/CalendarDiagnostics.framework/CalendarDiagnostics")), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
    {
      Value = 0;
      v4 = 0;
    }
    else
    {
      v4 = objc_retainAutorelease(v6);
      Value = dlopen((const char *)objc_msgSend(v4, "UTF8String"), 1);
      if (Value)
        CFDictionarySetValue((CFMutableDictionaryRef)__Handles, 0, Value);
    }

  }
  _os_nospin_lock_unlock();
  return Value;
}

id DAWeakLinkClass(void *a1, const void *a2)
{
  NSString *v3;
  void *v4;

  v3 = a1;
  if (__HandleForSource(a2))
  {
    NSClassFromString(v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t _reloadBabysitterProperties(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "_reloadBabysitterProperties");
}

uint64_t ABAccountCopyIdentifier()
{
  return MEMORY[0x1E0CF55A0]();
}

uint64_t ABAccountCopyInternalUUID()
{
  return MEMORY[0x1E0CF55A8]();
}

uint64_t ABAccountCreate()
{
  return MEMORY[0x1E0CF55B0]();
}

uint64_t ABAccountSetIdentifier()
{
  return MEMORY[0x1E0CF55B8]();
}

BOOL ABAddressBookAddRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x1E0CF55D8](addressBook, record, error);
}

uint64_t ABAddressBookCopyAccountWithIdentifier()
{
  return MEMORY[0x1E0CF55F8]();
}

uint64_t ABAddressBookCopyArrayOfAllAccounts()
{
  return MEMORY[0x1E0CF5620]();
}

uint64_t ABAddressBookCopySourcesWithUUIDs()
{
  return MEMORY[0x1E0CF56F0]();
}

uint64_t ABAddressBookGetAccountForSource()
{
  return MEMORY[0x1E0CF5770]();
}

ABRecordRef ABAddressBookGetPersonWithRecordID(ABAddressBookRef addressBook, ABRecordID recordID)
{
  return (ABRecordRef)MEMORY[0x1E0CF57A8](addressBook, *(_QWORD *)&recordID);
}

uint64_t ABAddressBookProcessAddedRecords()
{
  return MEMORY[0x1E0CF5810]();
}

BOOL ABAddressBookRemoveRecord(ABAddressBookRef addressBook, ABRecordRef record, CFErrorRef *error)
{
  return MEMORY[0x1E0CF5830](addressBook, record, error);
}

uint64_t ABAddressBookSetDefaultSource()
{
  return MEMORY[0x1E0CF5868]();
}

uint64_t ABDatabaseIntegrityCheckWithAddressBook()
{
  return MEMORY[0x1E0CF5958]();
}

CFTypeRef ABRecordCopyValue(ABRecordRef record, ABPropertyID property)
{
  return (CFTypeRef)MEMORY[0x1E0CF5C90](record, *(_QWORD *)&property);
}

uint64_t ABRecordGetAddressBook()
{
  return MEMORY[0x1E0CF5C98]();
}

uint64_t ABRecordGetIntValue()
{
  return MEMORY[0x1E0CF5CA0]();
}

ABRecordID ABRecordGetRecordID(ABRecordRef record)
{
  return MEMORY[0x1E0CF5CA8](record);
}

uint64_t ABRecordSetIntValue()
{
  return MEMORY[0x1E0CF5CB0]();
}

BOOL ABRecordSetValue(ABRecordRef record, ABPropertyID property, CFTypeRef value, CFErrorRef *error)
{
  return MEMORY[0x1E0CF5CB8](record, *(_QWORD *)&property, value, error);
}

uint64_t ABSourceAreFoldersReadonlyInCapabilityRestrictions()
{
  return MEMORY[0x1E0CF5CD8]();
}

uint64_t ABSourceIsContentReadonlyInCapabilityRestrictions()
{
  return MEMORY[0x1E0CF5CF8]();
}

uint64_t ABSourceSetContentReadonly()
{
  return MEMORY[0x1E0CF5D10]();
}

uint64_t ABSourceSetFoldersReadonly()
{
  return MEMORY[0x1E0CF5D18]();
}

uint64_t ABSourceSetMe()
{
  return MEMORY[0x1E0CF5D20]();
}

uint64_t ABSourceSetShouldIgnoreCapabilitiesRestrictions()
{
  return MEMORY[0x1E0CF5D28]();
}

uint64_t ADClientAddValueForScalarKey()
{
  return MEMORY[0x1E0CF63A0]();
}

uint64_t CDVExtractValuesFromRedirectString()
{
  return MEMORY[0x1E0D157E8]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

void CFDictionaryAddValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98500](theDict, key, value);
}

CFDictionaryRef CFDictionaryCreate(CFAllocatorRef allocator, const void **keys, const void **values, CFIndex numValues, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFDictionaryRef)MEMORY[0x1E0C98530](allocator, keys, values, numValues, keyCallBacks, valueCallBacks);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x1E0C98550](allocator, capacity, keyCallBacks, valueCallBacks);
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x1E0C985B8](theDict, key);
}

void CFDictionaryRemoveValue(CFMutableDictionaryRef theDict, const void *key)
{
  MEMORY[0x1E0C985E8](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x1E0C98610](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x1E0C98620](cf1, cf2);
}

uint64_t CFHTTPCookieStorageDeleteAllCookies()
{
  return MEMORY[0x1E0C927A0]();
}

uint64_t CFHTTPCookieStorageSetCookieAcceptPolicy()
{
  return MEMORY[0x1E0C927C8]();
}

void CFNotificationCenterAddObserver(CFNotificationCenterRef center, const void *observer, CFNotificationCallback callBack, CFStringRef name, const void *object, CFNotificationSuspensionBehavior suspensionBehavior)
{
  MEMORY[0x1E0C988B0](center, observer, callBack, name, object, suspensionBehavior);
}

CFNotificationCenterRef CFNotificationCenterGetDarwinNotifyCenter(void)
{
  return (CFNotificationCenterRef)MEMORY[0x1E0C988B8]();
}

void CFNotificationCenterRemoveObserver(CFNotificationCenterRef center, const void *observer, CFNotificationName name, const void *object)
{
  MEMORY[0x1E0C98900](center, observer, name, object);
}

Boolean CFPreferencesAppSynchronize(CFStringRef applicationID)
{
  return MEMORY[0x1E0C98A30](applicationID);
}

CFPropertyListRef CFPreferencesCopyAppValue(CFStringRef key, CFStringRef applicationID)
{
  return (CFPropertyListRef)MEMORY[0x1E0C98A40](key, applicationID);
}

void CFPreferencesSetAppValue(CFStringRef key, CFPropertyListRef value, CFStringRef applicationID)
{
  MEMORY[0x1E0C98A80](key, value, applicationID);
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

CFRunLoopMode CFRunLoopCopyCurrentMode(CFRunLoopRef rl)
{
  return (CFRunLoopMode)MEMORY[0x1E0C98C28](rl);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C30]();
}

CFRunLoopSourceRef CFRunLoopSourceCreate(CFAllocatorRef allocator, CFIndex order, CFRunLoopSourceContext *context)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C98CC8](allocator, order, context);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopSourceSignal(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CF0](source);
}

CFStringRef CFStringCreateCopy(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFStringRef)MEMORY[0x1E0C98F78](alloc, theString);
}

void CFStringTrimWhitespace(CFMutableStringRef theString)
{
  MEMORY[0x1E0C99258](theString);
}

uint64_t CFURLCacheCopySharedURLCache()
{
  return MEMORY[0x1E0C92900]();
}

uint64_t CFURLCacheRemoveAllCachedResponses()
{
  return MEMORY[0x1E0C92910]();
}

uint64_t CFURLCacheSetDiskCapacity()
{
  return MEMORY[0x1E0C92918]();
}

uint64_t CFURLCacheSetMemoryCapacity()
{
  return MEMORY[0x1E0C92920]();
}

CFStringRef CFURLCopyPath(CFURLRef anURL)
{
  return (CFStringRef)MEMORY[0x1E0C99318](anURL);
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x1E0C993F8](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

CFStringRef CFURLCreateStringByReplacingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveEscaped)
{
  return (CFStringRef)MEMORY[0x1E0C99400](allocator, originalString, charactersToLeaveEscaped);
}

CFURLRef CFURLCreateWithString(CFAllocatorRef allocator, CFStringRef URLString, CFURLRef baseURL)
{
  return (CFURLRef)MEMORY[0x1E0C99448](allocator, URLString, baseURL);
}

uint64_t CFURLRequestCreateMutableCopy()
{
  return MEMORY[0x1E0C929C8]();
}

CFUUIDRef CFUUIDCreate(CFAllocatorRef alloc)
{
  return (CFUUIDRef)MEMORY[0x1E0C99518](alloc);
}

CFStringRef CFUUIDCreateString(CFAllocatorRef alloc, CFUUIDRef uuid)
{
  return (CFStringRef)MEMORY[0x1E0C99538](alloc, uuid);
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

uint64_t CPPowerAssertionCreate()
{
  return MEMORY[0x1E0CFA3B0]();
}

uint64_t CPSharedResourcesDirectory()
{
  return MEMORY[0x1E0CFA6C0]();
}

uint64_t DACPLoggingAddCustomLogFile()
{
  return MEMORY[0x1E0D038C8]();
}

uint64_t DACPLoggingAppendDataToLogFile()
{
  return MEMORY[0x1E0D038D0]();
}

uint64_t DACPLoggingSlurpFileIntoLogFile()
{
  return MEMORY[0x1E0D038D8]();
}

uint64_t DACustomLogDirectory()
{
  return MEMORY[0x1E0D038E0]();
}

uint64_t DALoggingwithCategory()
{
  return MEMORY[0x1E0D038F0]();
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MKBDeviceUnlockedSinceBoot()
{
  return MEMORY[0x1E0D4E4A0]();
}

uint64_t MKBGetDeviceLockState()
{
  return MEMORY[0x1E0D4E4D0]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

uint64_t PLLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE28]();
}

uint64_t PLShouldLogRegisteredEvent()
{
  return MEMORY[0x1E0D7FE40]();
}

uint64_t SBSProcessAssertionCreateForPID()
{
  return MEMORY[0x1E0DAB8F0]();
}

uint64_t SecCertificateGetSHA1Digest()
{
  return MEMORY[0x1E0CD6038]();
}

OSStatus SecIdentityCopyCertificate(SecIdentityRef identityRef, SecCertificateRef *certificateRef)
{
  return MEMORY[0x1E0CD6270](identityRef, certificateRef);
}

OSStatus SecItemAdd(CFDictionaryRef attributes, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6290](attributes, result);
}

OSStatus SecItemCopyMatching(CFDictionaryRef query, CFTypeRef *result)
{
  return MEMORY[0x1E0CD6298](query, result);
}

OSStatus SecItemDelete(CFDictionaryRef query)
{
  return MEMORY[0x1E0CD62A0](query);
}

OSStatus SecItemUpdate(CFDictionaryRef query, CFDictionaryRef attributesToUpdate)
{
  return MEMORY[0x1E0CD62D8](query, attributesToUpdate);
}

SecPolicyRef SecPolicyCreateSSL(Boolean server, CFStringRef hostname)
{
  return (SecPolicyRef)MEMORY[0x1E0CD6520](server, hostname);
}

CFDataRef SecTrustCopyExceptions(SecTrustRef trust)
{
  return (CFDataRef)MEMORY[0x1E0CD6658](trust);
}

OSStatus SecTrustCreateWithCertificates(CFTypeRef certificates, CFTypeRef policies, SecTrustRef *trust)
{
  return MEMORY[0x1E0CD6698](certificates, policies, trust);
}

OSStatus SecTrustEvaluate(SecTrustRef trust, SecTrustResultType *result)
{
  return MEMORY[0x1E0CD66A8](trust, result);
}

SecCertificateRef SecTrustGetCertificateAtIndex(SecTrustRef trust, CFIndex ix)
{
  return (SecCertificateRef)MEMORY[0x1E0CD66D8](trust, ix);
}

CFIndex SecTrustGetCertificateCount(SecTrustRef trust)
{
  return MEMORY[0x1E0CD66E0](trust);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _CFCopyServerVersionDictionary()
{
  return MEMORY[0x1E0C9A0C0]();
}

uint64_t _CFCopySystemVersionDictionary()
{
  return MEMORY[0x1E0C9A0D0]();
}

uint64_t _CFURLRequestSetStorageSession()
{
  return MEMORY[0x1E0C92F70]();
}

uint64_t _CFURLStorageSessionCopyCache()
{
  return MEMORY[0x1E0C92F88]();
}

uint64_t _CFURLStorageSessionCopyCookieStorage()
{
  return MEMORY[0x1E0C92F90]();
}

uint64_t _CFURLStorageSessionCreate()
{
  return MEMORY[0x1E0C92F98]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

os_activity_t _os_activity_create(void *dso, const char *description, os_activity_t activity, os_activity_flag_t flags)
{
  return (os_activity_t)MEMORY[0x1E0C80FC0](dso, description, activity, *(_QWORD *)&flags);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _os_nospin_lock_lock()
{
  return MEMORY[0x1E0C81080]();
}

uint64_t _os_nospin_lock_unlock()
{
  return MEMORY[0x1E0C81090]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

int close(int a1)
{
  return MEMORY[0x1E0C82688](*(_QWORD *)&a1);
}

void dispatch_after(dispatch_time_t when, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82BC8](when, queue, block);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C00](queue, block);
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

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x1E0C82E48](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x1E0C82EB8](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x1E0C82EC8](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x1E0C82ED8](dsema, timeout);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

int flock(int a1, int a2)
{
  return MEMORY[0x1E0C83400](*(_QWORD *)&a1, *(_QWORD *)&a2);
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

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x1E0DE7BA8](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x1E0DE7BB8]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x1E0DE7BD0](a1);
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

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_loadWeakRetained(id *location)
{
  return (id)MEMORY[0x1E0DE7D08](location);
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

uint64_t objc_opt_new()
{
  return MEMORY[0x1E0DE7D48]();
}

uint64_t objc_opt_respondsToSelector()
{
  return MEMORY[0x1E0DE7D50]();
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

int open(const char *a1, int a2, ...)
{
  return MEMORY[0x1E0C84480](a1, *(_QWORD *)&a2);
}

void os_activity_scope_enter(os_activity_t activity, os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84510](activity, state);
}

void os_activity_scope_leave(os_activity_scope_state_t state)
{
  MEMORY[0x1E0C84518](state);
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

const char *__cdecl sel_getName(SEL sel)
{
  return (const char *)MEMORY[0x1E0DE80C8](sel);
}

uint64_t shouldDALogAtLevel()
{
  return MEMORY[0x1E0D03958]();
}

BOOL xpc_activity_set_state(xpc_activity_t activity, xpc_activity_state_t state)
{
  return MEMORY[0x1E0C85DB8](activity, state);
}

BOOL xpc_activity_should_defer(xpc_activity_t activity)
{
  return MEMORY[0x1E0C85DC8](activity);
}

void xpc_transaction_begin(void)
{
  MEMORY[0x1E0C86768]();
}

void xpc_transaction_end(void)
{
  MEMORY[0x1E0C86770]();
}


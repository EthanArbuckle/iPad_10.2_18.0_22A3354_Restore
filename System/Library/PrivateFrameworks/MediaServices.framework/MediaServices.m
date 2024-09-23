uint64_t MSVDeviceOSIsInternalInstall()
{
  return os_variant_has_internal_content();
}

uint64_t MSVDeviceIsAudioAccessory()
{
  return 0;
}

uint64_t MSVDeviceIsAppleTV()
{
  return 0;
}

void sub_1A077F3A4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A0780CE0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  id *v14;

  objc_destroyWeak(v14);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

BOOL msv_dispatch_sync_on_queue(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD);
  _BOOL8 v7;
  const void *v8;
  void *specific;
  const void *key;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = (void (**)(_QWORD))v4;
  if (v5 == MEMORY[0x1E0C80D38] && pthread_main_np() == 1)
  {
    v6[2](v6);
    v7 = 1;
  }
  else
  {
    key = &key;
    dispatch_queue_set_specific(v5, &key, (void *)1, 0);
    v8 = key;
    specific = dispatch_get_specific(key);
    dispatch_queue_set_specific(v5, v8, 0, 0);
    v7 = specific == (void *)1;
    if (specific == (void *)1)
      v6[2](v6);
    else
      dispatch_sync(v5, v6);
  }

  return v7;
}

double MSVGetMaximumScreenSize()
{
  if (MSVGetMaximumScreenSize_onceToken != -1)
    dispatch_once(&MSVGetMaximumScreenSize_onceToken, &__block_literal_global_88);
  return *(double *)&MSVGetMaximumScreenSize_maximumScreenSize_0;
}

uint64_t MSVDeviceSupportsExtendedColorDisplay()
{
  if (MSVDeviceSupportsExtendedColorDisplay___once != -1)
    dispatch_once(&MSVDeviceSupportsExtendedColorDisplay___once, &__block_literal_global_66);
  return MSVDeviceSupportsExtendedColorDisplay___deviceSupportsExtendedColorDisplay;
}

void sub_1A07830FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t MSVSignedUnionRange(uint64_t result, uint64_t a2, uint64_t a3)
{
  if (result >= a3)
    return a3;
  return result;
}

id MSVNanoIDCreateTaggedPointer()
{
  return MSVNanoIDCreateWithCharacters(CFSTR("eilotrmapdnsIcufkMShjTRxgC4013bDNvwyUL2O856PB79AFKEWVzGJHYX"), 9);
}

void sub_1A07834FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double MSVGetKernelBootTime()
{
  if (MSVGetKernelBootTime_onceToken != -1)
    dispatch_once(&MSVGetKernelBootTime_onceToken, &__block_literal_global_104);
  return *(double *)&MSVGetKernelBootTime___kernelBootTime;
}

id MSVPropertyListDataClasses()
{
  if (MSVPropertyListDataClasses___once != -1)
    dispatch_once(&MSVPropertyListDataClasses___once, &__block_literal_global_1475);
  return (id)MSVPropertyListDataClasses___msvPropertyListDataClasses;
}

id MSVTimelineChartPrefix(uint64_t a1, unint64_t a2, uint64_t a3, uint64_t a4)
{
  void *v8;
  uint64_t v9;
  uint64_t v10;
  const __CFString *v11;
  BOOL v12;
  const __CFString *v13;
  const __CFString *v14;

  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithCapacity:", a4);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (a4 >= 1)
  {
    v9 = 0;
    do
    {
      v10 = (1 << (v9 + 1)) & a3;
      if (a1 - 1 == v9)
      {
        v11 = CFSTR("┖");
        switch(a2)
        {
          case 1uLL:
            if (v10)
              goto LABEL_6;
            v11 = CFSTR("┎");
            break;
          case 2uLL:
LABEL_6:
            v11 = CFSTR("┠");
            break;
          case 3uLL:
            v11 = CFSTR("┃");
            break;
          case 4uLL:
            break;
          case 5uLL:
            v11 = CFSTR(" ");
            break;
          default:
            v11 = CFSTR("X");
            break;
        }
      }
      else
      {
        if (a2 <= 4 && ((1 << a2) & 0x16) != 0 && v9 + 1 > a1)
        {
          v12 = v10 == 0;
          v13 = CFSTR("╂");
          v14 = CFSTR("─");
        }
        else
        {
          v12 = v10 == 0;
          v13 = CFSTR("┃");
          v14 = CFSTR(" ");
        }
        if (v12)
          v11 = v14;
        else
          v11 = v13;
      }
      objc_msgSend(v8, "appendString:", v11);
      ++v9;
    }
    while (a4 != v9);
  }
  return v8;
}

id MSVArchivedDataWithRootObject(void *a1)
{
  id v1;
  void *v2;
  id v3;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nullable MSVArchivedDataWithRootObject(__strong id _Nonnull)");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MSVSecureCodingUtilities.m"), 55, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("object"));

  }
  v9 = 0;
  objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", v1, 1, &v9);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v9;
  if (v3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSData * _Nullable MSVArchivedDataWithRootObject(__strong id _Nonnull)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MSVSecureCodingUtilities.m"), 59, CFSTR("Archiving root object:%@ resulted in error:%@"), v1, v3);

  }
  return v2;
}

id MSVUnarchivedObjectOfClasses(void *a1, void *a2)
{
  id v3;
  id v4;
  void *v5;
  void *v6;
  id v7;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  id v15;

  v3 = a1;
  v4 = a2;
  v5 = v4;
  if (v3)
  {
    if (v4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClasses(NSSet<Class> *__strong _Nonnull, NSData *__strong _Nonnull)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MSVSecureCodingUtilities.m"), 44, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("classes"));

    if (v5)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClasses(NSSet<Class> *__strong _Nonnull, NSData *__strong _Nonnull)");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MSVSecureCodingUtilities.m"), 45, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

LABEL_3:
  v15 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClasses:fromData:error:", v3, v5, &v15);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v15;
  if (v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClasses(NSSet<Class> *__strong _Nonnull, NSData *__strong _Nonnull)");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "handleFailureInFunction:file:lineNumber:description:", v14, CFSTR("MSVSecureCodingUtilities.m"), 49, CFSTR("Unarchiving object of classes:%@ resulted in error:%@"), v3, v7);

  }
  return v6;
}

BOOL msv_dispatch_on_main_queue(void *a1)
{
  void (**v1)(_QWORD);
  int v2;

  v1 = a1;
  v2 = pthread_main_np();
  if (v2 == 1)
    v1[2](v1);
  else
    dispatch_async(MEMORY[0x1E0C80D38], v1);

  return v2 == 1;
}

uint64_t MSVDeviceIsWatch()
{
  return 0;
}

uint64_t MSVDeviceSupportsMultipleLibraries()
{
  return 0;
}

uint64_t MSVSignedIntersectionRange(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  if (a3 > result || result >= a3 + a4)
  {
    if (result <= a3 && a3 < result + a2)
      return a3;
    else
      return 0;
  }
  return result;
}

uint64_t MSVKeychainCopyKeychainValue(void *a1, void *a2)
{
  __CFDictionary *v2;
  const __CFDictionary *v3;
  OSStatus v4;
  void *v5;
  void *v6;
  uint64_t v7;
  CFTypeRef result;

  v2 = _MSVCreateKeychainQuery(a1, a2);
  if (!v2)
    return 0;
  v3 = v2;
  CFDictionarySetValue(v2, (const void *)*MEMORY[0x1E0CD7018], (const void *)*MEMORY[0x1E0C9AE50]);
  result = 0;
  v4 = SecItemCopyMatching(v3, &result);
  v5 = (id)result;
  v6 = v5;
  v7 = 0;
  if (!v4)
  {
    if (objc_msgSend(v5, "length"))
      v7 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithData:encoding:", v6, 4);
    else
      v7 = 0;
  }
  CFRelease(v3);

  return v7;
}

void MSVKeychainSetKeychainValue(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  __CFDictionary *v7;
  const __CFDictionary *v8;
  void *v9;
  void *v10;
  __CFDictionary *Mutable;
  id v12;

  v12 = a1;
  v5 = a2;
  v6 = a3;
  v7 = _MSVCreateKeychainQuery(v5, v6);
  if (v7)
  {
    v8 = v7;
    if (objc_msgSend(v12, "length"))
    {
      objc_msgSend(v12, "dataUsingEncoding:", 4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      v10 = (void *)MSVKeychainCopyKeychainValue(v5, v6);
      if (v10)
      {
        Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 1, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD70D8], v9);
        CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
        SecItemUpdate(v8, Mutable);
        CFRelease(Mutable);
      }
      else
      {
        CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CD70D8], v9);
        CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E0CD68A0], (const void *)*MEMORY[0x1E0CD68E8]);
        SecItemAdd(v8, 0);
      }

    }
    else
    {
      SecItemDelete(v8);
    }
    CFRelease(v8);
  }

}

__CFDictionary *_MSVCreateKeychainQuery(void *a1, void *a2)
{
  id v3;
  id v4;
  __CFDictionary *Mutable;

  v3 = a1;
  v4 = a2;
  if (objc_msgSend(v3, "length") && objc_msgSend(v4, "length"))
  {
    Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 3, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6C98], (const void *)*MEMORY[0x1E0CD6CA8]);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD68F8], v3);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD6B58], v4);
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E0CD70C0], (const void *)*MEMORY[0x1E0C9AE50]);
  }
  else
  {
    Mutable = 0;
  }

  return Mutable;
}

void sub_1A0785F00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,id a26)
{
  id *v26;

  objc_destroyWeak(v26);
  objc_destroyWeak(location);
  objc_destroyWeak(&a26);
  _Unwind_Resume(a1);
}

void sub_1A07862F0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id location)
{
  id *v18;

  objc_destroyWeak(v18);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t NSStringFromMSVSignedRange(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("{%ld, %ld}"), a1, a2);
}

id _MSVXPCTransactionsGet()
{
  if (_MSVXPCTransactionsGet_onceToken != -1)
    dispatch_once(&_MSVXPCTransactionsGet_onceToken, &__block_literal_global_2032);
  return (id)_MSVXPCTransactionsGet___MSVXPCTransactions;
}

id MSVNanoIDCreateWithCharacters(void *a1, int64_t a2)
{
  id v3;
  uint64_t v4;
  id v5;
  _BYTE *v6;
  _BYTE *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  _BYTE *v11;
  int64_t v12;
  char v13;
  uint64_t v14;
  id v15;
  uint64_t v16;
  _BYTE *v17;
  int64_t v18;
  void *v19;

  v3 = a1;
  if (_MSVNanoIDSharedArc4State_onceToken != -1)
    dispatch_once(&_MSVNanoIDSharedArc4State_onceToken, &__block_literal_global_3608);
  if (__MSVNanoIDTestingArc4State)
    v4 = __MSVNanoIDTestingArc4State;
  else
    v4 = _MSVNanoIDSharedArc4State__state;
  v5 = v3;
  v6 = malloc_type_malloc(a2, 0x1A8D6082uLL);
  v7 = v6;
  LODWORD(v9) = *(_DWORD *)v4;
  v8 = *(_DWORD *)(v4 + 4);
  if (a2)
  {
    v10 = *(_QWORD *)(v4 + 8);
    v11 = v6;
    v12 = a2;
    do
    {
      v9 = (v9 + 1);
      v13 = *(_BYTE *)(v10 + v9);
      LOBYTE(v8) = v13 + v8;
      *(_BYTE *)(v10 + v9) = *(_BYTE *)(v10 + v8);
      *(_BYTE *)(v10 + v8) = v13;
      *v11++ = *(_BYTE *)(v10 + (*(_BYTE *)(v10 + v9) + v13));
      --v12;
    }
    while (v12);
    v8 = v8;
  }
  *(_DWORD *)v4 = v9;
  *(_DWORD *)(v4 + 4) = v8;
  v14 = objc_msgSend(v5, "length");
  v15 = objc_retainAutorelease(v5);
  v16 = objc_msgSend(v15, "cStringUsingEncoding:", 4);
  if (a2 >= 1)
  {
    v17 = v7;
    v18 = a2;
    do
    {
      *v17 = *(_BYTE *)(v16 + *v17 % v14);
      ++v17;
      --v18;
    }
    while (v18);
  }
  v19 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytesNoCopy:length:encoding:freeWhenDone:", v7, a2, 4, 1);

  return v19;
}

id MSVBundleIDForAuditToken(_OWORD *a1)
{
  const __CFAllocator *v2;
  __int128 v3;
  __SecTask *v4;
  __int128 v5;
  pid_t v6;
  void *v7;
  NSObject *v8;
  NSObject *v9;
  id v10;
  unint64_t v11;
  int v12;
  _BOOL4 v14;
  uint64_t v15;
  NSObject *v16;
  id v17;
  void *v19;
  void *v20;
  __int128 v21;
  void *v22;
  void *v23;
  audit_token_t token;
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = a1[1];
  *(_OWORD *)token.val = *a1;
  *(_OWORD *)&token.val[4] = v3;
  v4 = SecTaskCreateWithAuditToken(v2, &token);
  if (v4)
  {
    v5 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v5;
    v6 = audit_token_to_pid(&token);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *MSVBundleIDForAuditToken(audit_token_t)");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInFunction:file:lineNumber:description:", v20, CFSTR("MSVSystemUtilities.m"), 61, CFSTR("Failed to get SecTask from audit_token"));

    v21 = a1[1];
    *(_OWORD *)token.val = *a1;
    *(_OWORD *)&token.val[4] = v21;
    v6 = audit_token_to_pid(&token);
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *_MSVBundleIDForSecTask(SecTaskRef, pid_t, BOOL)");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "handleFailureInFunction:file:lineNumber:description:", v23, CFSTR("MSVSystemUtilities.m"), 985, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("task"));

  }
  v7 = (void *)SecTaskCopyValueForEntitlement(v4, CFSTR("application-identifier"), 0);
  v8 = os_log_create("com.apple.amp.MediaServices", "Entitlements");
  v9 = v8;
  if (v7)
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      token.val[0] = 138543618;
      *(_QWORD *)&token.val[1] = CFSTR("application-identifier");
      LOWORD(token.val[3]) = 2114;
      *(_QWORD *)((char *)&token.val[3] + 2) = v7;
      _os_log_impl(&dword_1A077D000, v9, OS_LOG_TYPE_DEFAULT, "Retrieved %{public}@ from SecTask: applicationID=%{public}@", (uint8_t *)&token, 0x16u);
    }

    v10 = v7;
    if ((unint64_t)objc_msgSend(v10, "length") >= 0xB
      && objc_msgSend(v10, "characterAtIndex:", 10) == 46)
    {
      v11 = 0;
      do
      {
        v12 = objc_msgSend(v10, "characterAtIndex:", v11);
        v14 = (v12 - 65) < 0x1A || (v12 - 48) < 0xA;
        if (v11 > 8)
          break;
        ++v11;
      }
      while (v14);
      if (v14)
      {
        objc_msgSend(v10, "substringWithRange:", 11, objc_msgSend(v10, "length") - 11);
        v15 = objc_claimAutoreleasedReturnValue();

        v10 = (id)v15;
      }
      v16 = os_log_create("com.apple.amp.MediaServices", "Entitlements");
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
      {
        token.val[0] = 138543874;
        *(_QWORD *)&token.val[1] = CFSTR("application-identifier");
        LOWORD(token.val[3]) = 1024;
        *(unsigned int *)((char *)&token.val[3] + 2) = v14;
        HIWORD(token.val[4]) = 2114;
        *(_QWORD *)&token.val[5] = v10;
        _os_log_impl(&dword_1A077D000, v16, OS_LOG_TYPE_DEFAULT, "Processed teamID from %{public}@: teamIDIsValid=%{BOOL}u bundleID=%{public}@", (uint8_t *)&token, 0x1Cu);
      }

    }
    v17 = v10;
  }
  else
  {
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT))
    {
      token.val[0] = 138543874;
      *(_QWORD *)&token.val[1] = CFSTR("application-identifier");
      LOWORD(token.val[3]) = 2114;
      *(_QWORD *)((char *)&token.val[3] + 2) = CFSTR("application-identifier");
      HIWORD(token.val[5]) = 2048;
      *(_QWORD *)&token.val[6] = v6;
      _os_log_impl(&dword_1A077D000, v9, OS_LOG_TYPE_FAULT, "Failed to retrieve %{public}@ from SecTask. This typically indicates that the process is missing the %{public}@ entitlement. It must match the process' bundle identifier. This is a client-issue. Check the crash report for the Coalition process. PID: %lld", (uint8_t *)&token, 0x20u);
    }

    v17 = 0;
  }

  CFRelease(v4);
  return v17;
}

id MSVTCCIdentityForCurrentProcess()
{
  void *v0;
  void *v1;
  id v2;
  uint64_t v3;
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "bundleIdentifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  if (v1)
  {
    objc_msgSend(v0, "bundleIdentifier");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    MSVTCCIdentityForBundleID(v2);
    v3 = objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v0, "executablePath");
    v4 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v4)
    {
      v5 = 0;
      goto LABEL_6;
    }
    objc_msgSend(v0, "executablePath");
    v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
    objc_msgSend(v2, "UTF8String");
    v3 = tcc_identity_create();
  }
  v5 = (void *)v3;

LABEL_6:
  return v5;
}

id MSVTCCIdentityForBundleID(void *a1)
{
  if (a1)
  {
    objc_msgSend(objc_retainAutorelease(a1), "UTF8String");
    a1 = (void *)tcc_identity_create();
  }
  return a1;
}

void sub_1A07875BC(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t MSVCopyLocalizedModelName()
{
  return MGCopyAnswer();
}

uint64_t MSVGetCurrentThreadPriority()
{
  _opaque_pthread_t *v0;
  thread_inspect_t v1;
  mach_msg_type_number_t thread_info_outCnt;
  integer_t thread_info_out[4];
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  *(_OWORD *)thread_info_out = 0u;
  thread_info_outCnt = 28;
  v0 = pthread_self();
  v1 = pthread_mach_thread_np(v0);
  if (thread_info(v1, 5u, thread_info_out, &thread_info_outCnt))
    return 0xFFFFFFFFLL;
  else
    return DWORD1(v6);
}

uint64_t MSVLogAddStateHandler(uint64_t a1, void *a2, void *a3)
{
  id v4;
  id v5;
  uint64_t v6;
  id v8;
  id v9;

  v8 = a2;
  v9 = a3;
  v4 = v9;
  v5 = v8;
  v6 = os_state_add_handler();

  return v6;
}

BOOL MSVDeviceIsInternalCarry()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _BOOL8 v4;

  if (!os_variant_has_internal_content())
    return 0;
  v0 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99EA0]), "initWithSuiteName:", CFSTR("com.apple.da"));
  objc_msgSend(v0, "objectForKey:", CFSTR("ExperimentGroup"));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "lowercaseString");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if ((objc_msgSend(v2, "containsString:", CFSTR("carry")) & 1) != 0
    || objc_msgSend(v2, "containsString:", CFSTR("walkabout")))
  {
    objc_msgSend(v0, "objectForKey:", CFSTR("AutomatedDeviceGroup"));
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = objc_msgSend(v3, "length") == 0;

  }
  else
  {
    v4 = 0;
  }

  return v4;
}

uint64_t MSVReplacementRangeForRanges(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;

  if (a1 + a2 >= a3 + a4)
    v4 = a3 + a4;
  else
    v4 = a1 + a2;
  if ((a3 > a1 || (v5 = a1, a1 >= a3 + a4)) && (a1 > a3 || (v5 = a3, a3 >= a1 + a2)) || v4 == v5)
  {
    if (a3 >= a1)
      return a2;
    else
      return 0;
  }
  else
  {
    if (a1 >= 0)
      v6 = a1;
    else
      v6 = -a1;
    return v5 + v6;
  }
}

uint64_t MSVDeviceSupportsDelegatedIdentities()
{
  return 0;
}

id MSVLogDateFormatter()
{
  if (MSVLogDateFormatter_onceToken != -1)
    dispatch_once(&MSVLogDateFormatter_onceToken, &__block_literal_global_35);
  return (id)MSVLogDateFormatter___formatter;
}

uint64_t MSVDeviceSupportsVocalAttenuation()
{
  if (MSVDeviceSupportsVocalAttenuation___once != -1)
    dispatch_once(&MSVDeviceSupportsVocalAttenuation___once, &__block_literal_global_73);
  return MSVDeviceSupportsVocalAttenuation_supportsVocalAttenuation;
}

id MSVGetDeviceProductType()
{
  if (MSVGetDeviceProductType___once != -1)
    dispatch_once(&MSVGetDeviceProductType___once, &__block_literal_global_98);
  return (id)MSVGetDeviceProductType___deviceProductType;
}

uint64_t MSVSignedSubtractedRange(uint64_t result, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  BOOL v10;
  uint64_t v11;

  if (result + a2 >= a3 + a4)
    v4 = a3 + a4;
  else
    v4 = result + a2;
  if (a3 > result || result >= a3 + a4)
  {
    if (a3 < result)
      return result;
    if (a3 >= result + a2)
      return result;
    v5 = a3;
    if (v4 == a3)
      return result;
  }
  else
  {
    v5 = result;
    if (v4 == result)
      return result;
  }
  if (v5 != result || v4 - v5 != a2)
  {
    if (a4 <= 1)
      v6 = 1;
    else
      v6 = a4;
    v7 = v6 + a3;
    v8 = a3 + v6 - 1;
    if (a2 <= 1)
      v9 = 1;
    else
      v9 = a2;
    v10 = v8 < result + v9 - 1;
    v11 = 0x7FFFFFFFFFFFFFFFLL;
    if (!v10)
      v11 = result;
    if (a3 > result)
      return v11;
    else
      return v7;
  }
  return result;
}

id _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(void *a1)
{
  id v1;
  __CFString *v2;
  void *v3;
  void *v5;
  void *v6;

  v1 = a1;
  if ((objc_msgSend(v1, "isEqualToString:", CFSTR("NSKeyedArchive")) & 1) != 0)
  {
    v2 = CFSTR("keyedArchive");
  }
  else
  {
    if ((objc_msgSend(v1, "isEqualToString:", CFSTR("MSVOPACKCoder")) & 1) == 0)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString * _Nonnull _MSVFileExtensionForCoderTypeAndCompressionAlgorithm(NSString * _Nonnull __strong)");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "handleFailureInFunction:file:lineNumber:description:", v6, CFSTR("MSVSegmentedCodingPackage.m"), 50, CFSTR("Unsupported coder type %@"), v1);

      abort();
    }
    v2 = CFSTR("opackCoder");
  }
  -[__CFString stringByAppendingPathExtension:](v2, "stringByAppendingPathExtension:", CFSTR("gz"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MSVGzipCompressData()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  z_stream strm;
  _BYTE v9[16384];
  uint64_t v10;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v10 = *MEMORY[0x1E0C80C00];
  v1 = v0;
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = objc_msgSend(v1, "length");
  v2 = objc_retainAutorelease(v1);
  strm.next_in = (Bytef *)objc_msgSend(v2, "bytes");
  v3 = 0;
  if (!deflateInit2_(&strm, -1, 8, 31, 8, 0, "1.2.12", 112))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v9;
      v5 = deflate(&strm, 4 * (strm.avail_in == 0));
      if (v5 > 1)
        break;
      v6 = v5;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v4, "appendBytes:length:", v9, 0x4000 - strm.avail_out);
      if (v6)
      {
        deflateEnd(&strm);
        v3 = (void *)objc_msgSend(v4, "copy");
        goto LABEL_9;
      }
    }
    deflateEnd(&strm);
    v3 = 0;
LABEL_9:

  }
  return v3;
}

id MSVGzipDecompressData()
{
  void *v0;
  id v1;
  id v2;
  void *v3;
  void *v4;
  unsigned int v5;
  unsigned int v6;
  z_stream strm;
  _BYTE v9[16384];
  uint64_t v10;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v10 = *MEMORY[0x1E0C80C00];
  v1 = v0;
  memset(&strm.avail_in, 0, 104);
  strm.avail_in = objc_msgSend(v1, "length");
  v2 = objc_retainAutorelease(v1);
  strm.next_in = (Bytef *)objc_msgSend(v2, "bytes");
  v3 = 0;
  if (!inflateInit2_(&strm, 31, "1.2.12", 112))
  {
    objc_msgSend(MEMORY[0x1E0C99DF0], "data");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    while (1)
    {
      strm.avail_out = 0x4000;
      strm.next_out = v9;
      v5 = inflate(&strm, 4 * (strm.avail_in == 0));
      if (v5 > 1)
        break;
      v6 = v5;
      if (strm.avail_out != 0x4000)
        objc_msgSend(v4, "appendBytes:length:", v9, 0x4000 - strm.avail_out);
      if (v6)
      {
        inflateEnd(&strm);
        v3 = (void *)objc_msgSend(v4, "copy");
        goto LABEL_9;
      }
    }
    inflateEnd(&strm);
    v3 = 0;
LABEL_9:

  }
  return v3;
}

void sub_1A078B5F0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,char a31)
{
  _Block_object_dispose(&a31, 8);
  _Unwind_Resume(a1);
}

uint64_t MSVHasherSharedSeed()
{
  if (MSVHasherSharedSeed_onceToken != -1)
    dispatch_once(&MSVHasherSharedSeed_onceToken, &__block_literal_global_2790);
  return MSVHasherSharedSeed___seed_0;
}

uint64_t OpenSQLiteConnection(void *a1, sqlite3 **a2, int a3)
{
  id v5;
  id v6;
  uint64_t v7;
  sqlite3 *ppDb;

  v5 = a1;
  if (!a2)
    __assert_rtn("OpenSQLiteConnection", "MSVSQLDatabase.m", 1033, "outConnectionHandle");
  ppDb = 0;
  v6 = objc_retainAutorelease(v5);
  v7 = sqlite3_open_v2((const char *)objc_msgSend(v6, "UTF8String"), &ppDb, a3, 0);
  if ((_DWORD)v7)
    sqlite3_close(ppDb);
  else
    *a2 = ppDb;

  return v7;
}

char *_MSV_XXH_XXH64_update(char *result, char *__src, size_t __n)
{
  int v3;
  char *v4;
  char *v5;
  uint64_t v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  unint64_t v10;
  unint64_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;

  if (__src)
  {
    v3 = __n;
    v4 = __src;
    v5 = result;
    *(_QWORD *)result += __n;
    v6 = *((unsigned int *)result + 18);
    if (v6 + __n <= 0x1F)
    {
      result = (char *)memcpy(&result[v6 + 40], __src, __n);
      LODWORD(v7) = *((_DWORD *)v5 + 18) + v3;
LABEL_12:
      *((_DWORD *)v5 + 18) = v7;
      return result;
    }
    v8 = &__src[__n];
    if ((_DWORD)v6)
    {
      result = (char *)memcpy(&result[v6 + 40], __src, (32 - v6));
      v9 = __ROR8__(*((_QWORD *)v5 + 2) - 0x3D4D51C2D82B14B1 * *((_QWORD *)v5 + 6), 33);
      *((_QWORD *)v5 + 1) = 0x9E3779B185EBCA87
                          * __ROR8__(*((_QWORD *)v5 + 1) - 0x3D4D51C2D82B14B1 * *((_QWORD *)v5 + 5), 33);
      *((_QWORD *)v5 + 2) = 0x9E3779B185EBCA87 * v9;
      v10 = 0x9E3779B185EBCA87 * __ROR8__(*((_QWORD *)v5 + 4) - 0x3D4D51C2D82B14B1 * *((_QWORD *)v5 + 8), 33);
      *((_QWORD *)v5 + 3) = 0x9E3779B185EBCA87
                          * __ROR8__(*((_QWORD *)v5 + 3) - 0x3D4D51C2D82B14B1 * *((_QWORD *)v5 + 7), 33);
      *((_QWORD *)v5 + 4) = v10;
      v4 += (32 - *((_DWORD *)v5 + 18));
      *((_DWORD *)v5 + 18) = 0;
    }
    if (v4 + 32 <= v8)
    {
      v11 = *((_QWORD *)v5 + 1);
      v12 = *((_QWORD *)v5 + 2);
      v14 = *((_QWORD *)v5 + 3);
      v13 = *((_QWORD *)v5 + 4);
      do
      {
        v11 = 0x9E3779B185EBCA87 * __ROR8__(v11 - 0x3D4D51C2D82B14B1 * *(_QWORD *)v4, 33);
        v12 = 0x9E3779B185EBCA87 * __ROR8__(v12 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 1), 33);
        v14 = 0x9E3779B185EBCA87 * __ROR8__(v14 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 2), 33);
        v13 = 0x9E3779B185EBCA87 * __ROR8__(v13 - 0x3D4D51C2D82B14B1 * *((_QWORD *)v4 + 3), 33);
        v4 += 32;
      }
      while (v4 <= v8 - 32);
      *((_QWORD *)v5 + 1) = v11;
      *((_QWORD *)v5 + 2) = v12;
      *((_QWORD *)v5 + 3) = v14;
      *((_QWORD *)v5 + 4) = v13;
    }
    if (v4 < v8)
    {
      v7 = v8 - v4;
      result = (char *)memcpy(v5 + 40, v4, v7);
      goto LABEL_12;
    }
  }
  return result;
}

unint64_t _MSV_XXH_XXH64_digest(_QWORD *a1)
{
  uint64_t v1;
  unint64_t v2;
  uint64_t *v3;
  unint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unsigned int v7;
  unint64_t v8;

  if (*a1 < 0x20uLL)
    v1 = a1[3] + 0x27D4EB2F165667C5;
  else
    v1 = 0x85EBCA77C2B2AE63
       - 0x61C8864E7A143579
       * ((0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579
         * ((0x85EBCA77C2B2AE63
           - 0x61C8864E7A143579
           * ((0x85EBCA77C2B2AE63
             - 0x61C8864E7A143579
             * ((__ROR8__(a1[2], 57) + __ROR8__(a1[1], 63) + __ROR8__(a1[3], 52) + __ROR8__(a1[4], 46)) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[1], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[2], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[3], 33)))) ^ (0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * a1[4], 33)));
  v2 = v1 + *a1;
  v3 = a1 + 5;
  v4 = *a1 & 0x1FLL;
  if (v4 >= 8)
  {
    do
    {
      v5 = *v3++;
      v2 = 0x85EBCA77C2B2AE63
         - 0x61C8864E7A143579 * __ROR8__((0x9E3779B185EBCA87 * __ROR8__(0xC2B2AE3D27D4EB4FLL * v5, 33)) ^ v2, 37);
      v4 -= 8;
    }
    while (v4 > 7);
  }
  if (v4 >= 4)
  {
    v6 = *(_DWORD *)v3;
    v3 = (uint64_t *)((char *)v3 + 4);
    v2 = 0x165667B19E3779F9 - 0x3D4D51C2D82B14B1 * __ROR8__((0x9E3779B185EBCA87 * v6) ^ v2, 41);
    v4 -= 4;
  }
  for (; v4; --v4)
  {
    v7 = *(unsigned __int8 *)v3;
    v3 = (uint64_t *)((char *)v3 + 1);
    v2 = 0x9E3779B185EBCA87 * __ROR8__((0x27D4EB2F165667C5 * v7) ^ v2, 53);
  }
  v8 = 0x165667B19E3779F9
     * ((0xC2B2AE3D27D4EB4FLL * (v2 ^ (v2 >> 33))) ^ ((0xC2B2AE3D27D4EB4FLL * (v2 ^ (v2 >> 33))) >> 29));
  return v8 ^ HIDWORD(v8);
}

id MSVMediaLoggingDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  _QWORD v5[5];

  v5[4] = *MEMORY[0x1E0C80C00];
  MSVMobileHomeDirectory();
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v1 = (void *)MEMORY[0x1E0CB3940];
  v5[0] = v0;
  v5[1] = CFSTR("Library");
  v5[2] = CFSTR("Logs");
  v5[3] = CFSTR("MediaServices");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

id MSVMobileHomeDirectory()
{
  void *v0;
  void *v1;
  _QWORD v3[5];

  v3[4] = *MEMORY[0x1E0C80C00];
  v3[0] = CFSTR("/");
  v3[1] = CFSTR("private");
  v3[2] = CFSTR("var");
  v3[3] = CFSTR("mobile");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v3, 4);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  return v1;
}

const __CFString *MSVSystemRootDirectory()
{
  return CFSTR("/");
}

uint64_t MSVDeviceIsiPad()
{
  if (MSVDeviceIsiPad___once != -1)
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2127);
  return MSVDeviceIsiPad___deviceIsiPad;
}

BOOL MSVDeviceSupportsMultiChannelMusic()
{
  if (MSVDeviceIsiPhone___once != -1)
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_69);
  if (MSVDeviceIsiPhone___deviceIsPhone)
    return 1;
  if (MSVDeviceIsiPod___once != -1)
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_70);
  if (MSVDeviceIsiPod___deviceIsPod)
    return 1;
  if (MSVDeviceIsiPad___once != -1)
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2127);
  return MSVDeviceIsiPad___deviceIsiPad != 0;
}

void sub_1A078EB0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

double MSVGetProcessLaunchTime()
{
  if (MSVGetProcessLaunchTime_onceToken != -1)
    dispatch_once(&MSVGetProcessLaunchTime_onceToken, &__block_literal_global_105);
  return *(double *)&MSVGetProcessLaunchTime___processLaunchTime;
}

double MSVGetMaximumScreenScale()
{
  if (MSVGetMaximumScreenScale_onceToken != -1)
    dispatch_once(&MSVGetMaximumScreenScale_onceToken, &__block_literal_global_93_2142);
  return *(double *)&MSVGetMaximumScreenScale_deviceScreenScale;
}

BOOL msv_dispatch_async_on_queue(void *a1, void *a2)
{
  id v3;
  id v4;
  NSObject *v5;
  void (**v6)(_QWORD);
  _BOOL8 v7;
  const void *v8;
  void *specific;
  const void *key;

  v3 = a1;
  v4 = a2;
  v5 = v3;
  v6 = (void (**)(_QWORD))v4;
  if (v5 == MEMORY[0x1E0C80D38] && pthread_main_np() == 1)
  {
    v6[2](v6);
    v7 = 1;
  }
  else
  {
    key = &key;
    dispatch_queue_set_specific(v5, &key, (void *)1, 0);
    v8 = key;
    specific = dispatch_get_specific(key);
    dispatch_queue_set_specific(v5, v8, 0, 0);
    v7 = specific == (void *)1;
    if (specific == (void *)1)
      v6[2](v6);
    else
      dispatch_async(v5, v6);
  }

  return v7;
}

void sub_1A078F7E0(_Unwind_Exception *exception_object, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, void *a11)
{
  _QWORD *v11;
  void *v12;
  id v13;
  void *v14;
  int v15;
  id v16;
  void *v17;

  if (a2 == 1)
  {
    v13 = objc_begin_catch(exception_object);
    v14 = (void *)objc_opt_class();
    a11 = 0;
    v15 = objc_msgSend(v14, "__categorizeException:intoError:", v13, &a11);
    v16 = a11;
    if (v15)
    {
      v17 = v16;
      objc_msgSend(v12, "__setError:", v16);
      if (v11)
        *v11 = objc_retainAutorelease(v17);

      objc_end_catch();
      JUMPOUT(0x1A078F758);
    }
    objc_exception_throw(objc_retainAutorelease(v13));
  }
  _Unwind_Resume(exception_object);
}

void sub_1A0790044(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MSVProcessCopyUUID()
{
  int image_uuid;
  id v1;
  _QWORD *v2;
  _QWORD v4[3];

  v4[2] = *MEMORY[0x1E0C80C00];
  dlsym((void *)0xFFFFFFFFFFFFFFFBLL, "_mh_execute_header");
  v4[0] = 0;
  v4[1] = 0;
  image_uuid = _dyld_get_image_uuid();
  v1 = objc_alloc(MEMORY[0x1E0CB3A28]);
  if (image_uuid)
    v2 = v4;
  else
    v2 = &UUID_NULL;
  return (id)objc_msgSend(v1, "initWithUUIDBytes:", v2);
}

BOOL MSVDeviceSupportsSideLoadedMediaContent()
{
  if (MSVDeviceIsiPhone___once != -1)
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_69);
  if (MSVDeviceIsiPhone___deviceIsPhone)
    return 1;
  if (MSVDeviceIsiPod___once != -1)
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_70);
  if (MSVDeviceIsiPod___deviceIsPod)
    return 1;
  if (MSVDeviceIsiPad___once != -1)
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2127);
  return MSVDeviceIsiPad___deviceIsiPad != 0;
}

void sub_1A07905E0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

id MSVProcessCopyMediaFrameworksDescriptions()
{
  int has_internal_content;
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  uint64_t v8;

  has_internal_content = os_variant_has_internal_content();
  v1 = (id)MEMORY[0x1E0C9AA60];
  if (has_internal_content)
  {
    if (MSVProcessCopyMediaFrameworksDescriptions_onceToken != -1)
      dispatch_once(&MSVProcessCopyMediaFrameworksDescriptions_onceToken, &__block_literal_global_1790);
    if (_dyld_process_info_create())
    {
      _dyld_process_info_get_state();
      MSVProcessCopyMediaFrameworksDescriptions_lastTimestamp = 0;
      objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkNames, "count"));
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (os_variant_has_internal_content())
        dyld_shared_cache_some_image_overridden();
      v8 = MEMORY[0x1E0C809B0];
      v1 = v2;
      _dyld_process_info_for_each_image();
      _dyld_process_info_release();
      os_unfair_lock_lock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      v3 = objc_msgSend(v1, "copy", v8, 3221225472, __MSVProcessCopyMediaFrameworksDescriptions_block_invoke_3, &unk_1E43E8AE0);
      v4 = (void *)MSVProcessCopyMediaFrameworksDescriptions_frameworkDescriptions;
      MSVProcessCopyMediaFrameworksDescriptions_frameworkDescriptions = v3;

      os_unfair_lock_unlock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      v5 = v1;
    }
    else
    {
      os_unfair_lock_lock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      v5 = (void *)objc_msgSend((id)MSVProcessCopyMediaFrameworksDescriptions_frameworkDescriptions, "copy");
      os_unfair_lock_unlock((os_unfair_lock_t)&MSVProcessCopyMediaFrameworksDescriptions_lock);
      if (v5)
        v6 = v5;
      else
        v6 = v1;
      v1 = v6;
    }

  }
  return v1;
}

void sub_1A07916C8(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  _Unwind_Resume(a1);
}

void sub_1A07919F4(_Unwind_Exception *a1)
{

  _Unwind_Resume(a1);
}

void sub_1A0791AC0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, objc_super a9)
{
  a9.super_class = (Class)ImageAnalyzerImageColor;
  -[_Unwind_Exception dealloc](&a9, sel_dealloc);
  _Unwind_Resume(a1);
}

void sub_1A0791D64(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0791DDC(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A0791F4C(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void __clang_call_terminate(void *a1)
{
  __cxa_begin_catch(a1);
  std::terminate();
}

void sub_1A0792608(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, _QWORD *a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,std::exception a26,char a27)
{
  void *v27;
  uint64_t v28;
  void *v31;

  __cxa_free_exception(v27);
  v31 = *(void **)(v28 - 224);
  if (v31)
    free(v31);
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_1>::~final_act(v28 - 192);
  final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_0>::~final_act(v28 - 176);
  if (a2 == 1)
  {
    __cxa_begin_catch(a1);
    a26.__vftable = (std::exception_vtbl *)(MEMORY[0x1E0DE5060] + 16);
    CPPExceptionToNSErrorOut(&a26, a11);
    std::exception::~exception(&a26);
    __cxa_end_catch();
    JUMPOUT(0x1A0792470);
  }
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)&a27);
  _Unwind_Resume(a1);
}

void sub_1A0792814(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, std::exception a10, std::exception a11)
{
  _QWORD *v11;
  void *v12;
  std::exception_vtbl *v15;

  __cxa_free_exception(v12);
  if (a2 == 1)
  {
    __cxa_get_exception_ptr(a1);
    v15 = (std::exception_vtbl *)(MEMORY[0x1E0DE5060] + 16);
    a11.__vftable = (std::exception_vtbl *)(MEMORY[0x1E0DE5060] + 16);
    __cxa_begin_catch(a1);
    a10.__vftable = v15;
    CPPExceptionToNSErrorOut(&a10, v11);
    std::exception::~exception(&a10);
    std::exception::~exception(&a11);
    __cxa_end_catch();
    JUMPOUT(0x1A07927C0);
  }

  _Unwind_Resume(a1);
}

uint64_t ImageAnalyzer::image_analyzer_error::image_analyzer_error(uint64_t a1, int a2, const char *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, char a9)
{
  int v12;
  size_t v13;
  std::string::size_type v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  std::string *v18;
  std::runtime_error v20;
  int v21;
  std::string v22;
  va_list v23;
  char *v24;

  std::runtime_error::runtime_error((std::runtime_error *)a1, "")->__vftable = (std::runtime_error_vtbl *)&off_1E43E8588;
  v23 = &a9;
  v24 = &a9;
  v12 = vsnprintf(0, 0, a3, &a9);
  v13 = v12;
  v14 = v12 + 1;
  if (v14 >= 0x7FFFFFFFFFFFFFF8)
    std::string::__throw_length_error[abi:ne180100]();
  if (v14 >= 0x17)
  {
    v16 = (v14 & 0xFFFFFFFFFFFFFFF8) + 8;
    if ((v14 | 7) != 0x17)
      v16 = v14 | 7;
    v17 = v16 + 1;
    v15 = operator new(v16 + 1);
    v22.__r_.__value_.__l.__size_ = v14;
    v22.__r_.__value_.__r.__words[2] = v17 | 0x8000000000000000;
    v22.__r_.__value_.__r.__words[0] = (std::string::size_type)v15;
    goto LABEL_8;
  }
  *((_BYTE *)&v22.__r_.__value_.__s + 23) = v12 + 1;
  v15 = &v22;
  if (v12 != -1)
LABEL_8:
    bzero(v15, v14);
  *((_BYTE *)v15 + v14) = 0;
  if ((v22.__r_.__value_.__r.__words[2] & 0x8000000000000000) == 0)
    v18 = &v22;
  else
    v18 = (std::string *)v22.__r_.__value_.__r.__words[0];
  vsnprintf((char *)v18, v13, a3, v23);
  std::runtime_error::runtime_error(&v20, &v22);
  v20.__vftable = (std::runtime_error_vtbl *)&off_1E43E8588;
  v21 = a2;
  std::runtime_error::operator=((std::runtime_error *)a1, &v20);
  *(_DWORD *)(a1 + 16) = v21;
  std::runtime_error::~runtime_error(&v20);
  if (SHIBYTE(v22.__r_.__value_.__r.__words[2]) < 0)
    operator delete(v22.__r_.__value_.__l.__data_);
  return a1;
}

void sub_1A0792B98(_Unwind_Exception *a1)
{
  std::runtime_error *v1;

  std::runtime_error::~runtime_error(v1);
  _Unwind_Resume(a1);
}

void CPPExceptionToNSErrorOut(const std::exception *a1, _QWORD *a2)
{
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[2];

  v7[1] = *MEMORY[0x1E0C80C00];
  if (a2)
  {
    v3 = (void *)MEMORY[0x1E0CB35C8];
    v6 = *MEMORY[0x1E0CB2D50];
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", std::exception::what(a1));
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = v4;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v7, &v6, 1);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "errorWithDomain:code:userInfo:", *MEMORY[0x1E0CB2FE0], 0, v5);
    *a2 = (id)objc_claimAutoreleasedReturnValue();

  }
}

void sub_1A0792C9C(_Unwind_Exception *a1, int a2)
{
  if (!a2)
    _Unwind_Resume(a1);
  __clang_call_terminate(a1);
}

void std::string::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("basic_string");
}

void std::__throw_length_error[abi:ne180100](const char *a1)
{
  std::logic_error *exception;

  exception = (std::logic_error *)__cxa_allocate_exception(0x10uLL);
  std::length_error::length_error[abi:ne180100](exception, a1);
  __cxa_throw(exception, (struct type_info *)off_1E43E7930, MEMORY[0x1E0DE42D0]);
}

void sub_1A0792CF8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

std::logic_error *std::length_error::length_error[abi:ne180100](std::logic_error *a1, const char *a2)
{
  std::logic_error *result;

  result = std::logic_error::logic_error(a1, a2);
  result->__vftable = (std::logic_error_vtbl *)(MEMORY[0x1E0DE5020] + 16);
  return result;
}

void ImageAnalyzer::image_analyzer_error::~image_analyzer_error(std::runtime_error *this)
{
  std::runtime_error::~runtime_error(this);
  JUMPOUT(0x1A1AFB494);
}

uint64_t MSVSignedRangeFromString(void *a1)
{
  id v1;
  __CFString *v2;
  CFIndex Length;
  CFIndex v4;
  uint64_t v5;
  int v6;
  CFIndex v7;
  CFIndex location;
  CFIndex v9;
  CFIndex v10;
  int CharacterAtIndex;
  CFIndex v13;
  const __CFString *v14;
  const __CFString *v15;
  uint64_t IntValue;
  CFIndex *v18;
  CFIndex v19;
  CFRange result;
  CFRange v21;
  CFRange v22;
  CFRange v23;

  v1 = a1;
  if ((unint64_t)objc_msgSend(v1, "length") < 5)
    goto LABEL_37;
  v2 = (__CFString *)v1;
  if (!ParseBracesAndCommas___braceCharacters)
    ParseBracesAndCommas___braceCharacters = (uint64_t)CFCharacterSetCreateWithCharactersInString(0, CFSTR("{[,]}"));
  v19 = 0;
  Length = CFStringGetLength(v2);
  result.location = 0;
  result.length = 0;
  if (Length < 1)
  {
    v5 = 0;
    location = -1;
  }
  else
  {
    v4 = Length;
    v5 = 0;
    v6 = 0;
    v7 = 0;
    v18 = &v19;
    location = -1;
    v9 = Length;
    v10 = -1;
    while (1)
    {
      v21.location = v7;
      v21.length = v9;
      if (!CFStringFindCharacterFromSet(v2, (CFCharacterSetRef)ParseBracesAndCommas___braceCharacters, v21, 0, &result))break;
      if (result.location >= v4 || result.length != 1)
        break;
      CharacterAtIndex = CFStringGetCharacterAtIndex(v2, result.location);
      if ((CharacterAtIndex & 0xFFFFFFDF) == 0x5B)
      {
        if (!v6)
          location = result.location;
        ++v6;
      }
      else if (CharacterAtIndex == 44)
      {
        if (v6 == 1)
        {
          if (v5 <= 0)
          {
            *v18++ = result.location;
            v5 = 1;
            v6 = 1;
          }
          else
          {
            v6 = 1;
            v5 = 1;
          }
        }
      }
      else if ((CharacterAtIndex & 0xFFFFFFDF) == 0x5D && !--v6)
      {
        v10 = result.location;
        goto LABEL_29;
      }
      if (result.location + 1 < v4)
      {
        v9 += v7 + ~result.location;
        v7 = result.location + 1;
        if (v9 > 0)
          continue;
      }
      goto LABEL_29;
    }
  }
  v10 = -1;
LABEL_29:
  if (location == -1 || v10 == -1 || v5 != 1 || location >= v10 || (v13 = v19, v19 <= location + 1) || v19 >= v10 - 1)
  {

LABEL_37:
    IntValue = 0;
    goto LABEL_38;
  }
  v22.length = v19 + ~location;
  v22.location = location + 1;
  v14 = CFStringCreateWithSubstring(0, v2, v22);
  v23.location = v13 + 1;
  v23.length = v10 + ~v13;
  v15 = CFStringCreateWithSubstring(0, v2, v23);

  IntValue = CFStringGetIntValue(v14);
  CFStringGetIntValue(v15);
  CFRelease(v14);
  CFRelease(v15);
LABEL_38:

  return IntValue;
}

uint64_t MSVMediaAssetFileExtensions()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("mp3"), CFSTR("m4a"), CFSTR("m4p"), CFSTR("aa"), CFSTR("aax"), CFSTR("mp4"), CFSTR("m4v"), CFSTR("mov"), CFSTR("m4b"), CFSTR("movpkg"), CFSTR("m4bpkg"), 0);
}

uint64_t MSVArtworkAssetFileExtensions()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("jpg"), CFSTR("blob"), CFSTR("png"), CFSTR("jpeg"), 0);
}

uint64_t MSVOfflineHLSFileExtensions()
{
  return objc_msgSend(MEMORY[0x1E0C99E60], "setWithObjects:", CFSTR("movpkg"), CFSTR("m4bpkg"), 0);
}

double *HSV2RGB(double a1, double a2, double a3, double *result, double *a5, double *a6)
{
  double v6;
  double v7;
  double v8;
  int v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  BOOL v19;
  BOOL v20;

  if (a2 > 1.0)
    a2 = 1.0;
  if (a2 >= 0.0)
    v6 = a2;
  else
    v6 = 0.0;
  if (a3 <= 1.0)
    v7 = a3;
  else
    v7 = 1.0;
  if (v7 < 0.0)
    v7 = 0.0;
  if (v6 == 0.0)
  {
    *result = v7;
    *a5 = v7;
  }
  else
  {
    if (a1 > 1.0)
      a1 = 1.0;
    if (a1 >= 0.0)
      v8 = a1 * 6.0;
    else
      v8 = 0.0;
    v9 = (int)v8;
    v10 = v6 * v7 * (v8 - (double)(int)v8);
    v11 = v7 - v6 * v7;
    v12 = v11 + v10;
    if (v11 + v10 > 1.0)
      v12 = 1.0;
    v13 = v7 - v10;
    if (v13 > 1.0)
      v13 = 1.0;
    v14 = v11;
    if ((v9 & 1) != 0)
      v15 = v13;
    else
      v15 = v12;
    if (v14 <= 1.0)
      v16 = v14;
    else
      v16 = 1.0;
    v17 = v7;
    switch(v9)
    {
      case 0:
      case 5:
        break;
      case 1:
      case 4:
        v17 = v15;
        break;
      default:
        v17 = v16;
        break;
    }
    *result = v17;
    v18 = v7;
    if ((v9 - 1) >= 2)
    {
      v19 = v9 == 3 || v9 == 0;
      v18 = v15;
      if (!v19)
        v18 = v16;
    }
    *a5 = v18;
    if ((v9 - 3) >= 2)
    {
      v20 = v9 == 5 || v9 == 2;
      v7 = v15;
      if (!v20)
        v7 = v16;
    }
  }
  *a6 = v7;
  return result;
}

double ITColor::CreateFromHSVDoubles(ITColor *this, double a2, double a3, double a4)
{
  double v5;
  double v6;
  double v7;

  v7 = 0.0;
  v5 = 0.0;
  v6 = 0.0;
  HSV2RGB(a2, a3, a4, &v7, &v6, &v5);
  return v7;
}

double ITColor::GetHSVColor(ITColor *this)
{
  float64x2_t v6;
  int8x16_t v7;
  double var2;
  double result;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;

  __asm { FMOV            V2.2D, #1.0 }
  v6 = (float64x2_t)vbslq_s8((int8x16_t)vcgeq_f64(*(float64x2_t *)&this->var0, _Q2), (int8x16_t)_Q2, *(int8x16_t *)&this->var0);
  v7 = vbicq_s8((int8x16_t)v6, (int8x16_t)vcltzq_f64(v6));
  if (this->var2 < 1.0)
    var2 = this->var2;
  else
    var2 = 1.0;
  result = 0.0;
  if (var2 >= 0.0)
    v10 = var2;
  else
    v10 = 0.0;
  if (*(double *)&v7.i64[1] <= *(double *)v7.i64)
    v11 = *(double *)v7.i64;
  else
    v11 = *(double *)&v7.i64[1];
  if (*(double *)&v7.i64[1] >= *(double *)v7.i64)
    v12 = *(double *)v7.i64;
  else
    v12 = *(double *)&v7.i64[1];
  if (v10 <= *(double *)v7.i64)
    v13 = *(double *)v7.i64;
  else
    v13 = v10;
  if (v10 >= *(double *)v7.i64)
    v14 = *(double *)v7.i64;
  else
    v14 = v10;
  if (*(double *)&v7.i64[1] <= v10)
    v11 = v13;
  if (*(double *)&v7.i64[1] >= v10)
    v12 = v14;
  if (v11 != 0.0)
  {
    v15 = v11 - v12;
    if (v15 / v11 > 1.0 || v15 / v11 != 0.0)
    {
      if (v15 == 0.0)
      {
        v16 = 0.0;
        v17 = 0.0;
      }
      else
      {
        result = (v11 - *(double *)v7.i64) / v15;
        v16 = (v11 - *(double *)&v7.i64[1]) / v15;
        v17 = (v11 - v10) / v15;
      }
      if (*(double *)v7.i64 == v11)
      {
        v18 = v17 - v16;
      }
      else if (*(double *)&v7.i64[1] == v11)
      {
        v18 = result + 2.0 - v17;
      }
      else
      {
        v18 = v16 + 4.0 - result;
      }
      result = v18 / 6.0;
      if (result < 0.0)
        result = result + 1.0;
      if (result > 1.0)
        return 1.0;
    }
  }
  return result;
}

void ITColor::GetLuminance(ITColor *this, __n128 a2, double a3)
{
  uint64_t v3;
  double v4;
  double v5;
  __n128 v6;
  double v7;
  uint64_t v8;

  v3 = 0;
  v8 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a3;
  do
  {
    v4 = v6.n128_f64[v3];
    if (v4 <= 0.0392800011)
      v5 = v4 / 12.9200001;
    else
      v5 = pow((v4 + 0.0549999997) / 1.05499995, 2.4);
    v6.n128_f64[v3++] = v5;
  }
  while (v3 != 3);
}

void sub_1A0798380(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A07995B4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
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

os_log_t _MSVLogCategoryStreamReader()
{
  return os_log_create("com.apple.amp.MediaServices", "StreamReader");
}

os_log_t _MSVLogCategoryStreamWriter()
{
  return os_log_create("com.apple.amp.MediaServices", "StreamWriter");
}

os_log_t _MSVLogCategoryQuickRelay()
{
  return os_log_create("com.apple.amp.MediaServices", "QuickRelay");
}

os_log_t _MSVLogCategoryLyricsTTMLParser()
{
  return os_log_create("com.apple.amp.MediaServices", "LyricsTTMLParser");
}

os_log_t _MSVLogCategorySQL()
{
  return os_log_create("com.apple.amp.MediaServices", "SQL");
}

__CFString *NSStringFromMSVErrorCode(uint64_t a1)
{
  __CFString *v1;

  if (!a1)
    return CFSTR("Unknown");
  if (a1 == 1)
  {
    v1 = CFSTR("MissingDependency");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
    v1 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  return v1;
}

__CFString *NSStringFromMSVHasherErrorCode(unint64_t a1)
{
  if (a1 < 3)
    return off_1E43E8850[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

__CFString *NSStringFromMSVSQLDatabaseErrorCode(unint64_t a1)
{
  if (a1 < 3)
    return off_1E43E8868[a1];
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("UnknownCode/%lld"), a1);
  return (__CFString *)(id)objc_claimAutoreleasedReturnValue();
}

void ___Z19CGColorSpaceGetSRGBv_block_invoke()
{
  const ColorSyncProfile *v0;
  const ColorSyncProfile *v1;
  CFDataRef v2;
  CFDataRef v3;

  v0 = ColorSyncProfileCreateWithName((CFStringRef)*MEMORY[0x1E0C955D8]);
  if (v0)
  {
    v1 = v0;
    v2 = ColorSyncProfileCopyData(v0, 0);
    if (v2)
    {
      v3 = v2;
      CGColorSpaceGetSRGB(void)::sSpace = MEMORY[0x1A1AFB11C]();
      CFRelease(v3);
    }
    CFRelease(v1);
  }
}

void ImageAnalyzer::~ImageAnalyzer(ImageAnalyzer *this)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = *(void **)this;
  if (v2)
  {
    free(v2);
    *(_QWORD *)this = 0;
  }
  v3 = (void *)*((_QWORD *)this + 1);
  if (v3)
  {
    free(v3);
    *((_QWORD *)this + 1) = 0;
  }
  v4 = (void *)*((_QWORD *)this + 43);
  if (v4)
  {
    *((_QWORD *)this + 44) = v4;
    operator delete(v4);
  }
  v5 = (void *)*((_QWORD *)this + 40);
  if (v5)
  {
    *((_QWORD *)this + 41) = v5;
    operator delete(v5);
  }
}

void ImageAnalyzer::QuantizeColorMaps(ImageAnalyzer *this)
{
  void *v2;
  _BYTE *v3;
  _BYTE *v4;
  uint64_t v5;
  unint64_t v6;
  unint64_t i;
  uint64_t v8;
  __int128 v9;
  __int128 v10;
  double v11;
  __int128 v12;
  uint64_t v13;
  unint64_t v14;
  unint64_t v15;
  _OWORD *v16;
  uint64_t v17;
  __int128 v18;
  _OWORD *v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  char *v23;
  unint64_t v24;
  uint64_t v25;
  __int128 v26;
  double v27;
  unint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  uint64_t v36;
  uint64_t v37;
  unint64_t v38;
  unint64_t v39;
  unint64_t v40;
  uint64_t v41;
  unint64_t v42;
  uint64_t v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  void *v47;
  int64_t v48;
  unint64_t v49;
  uint64_t v50;
  double v51;
  unint64_t v52;
  double *v53;
  uint64_t v54;
  double v55;
  uint64_t v56;
  __int128 v57;
  __int128 v58;
  uint64_t v59;
  void *exception;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  char v71;
  char *v72;
  __int128 v73;
  __int128 v74;
  uint64_t v75;
  _OWORD v76[2];
  uint64_t v77;
  ITColor v78;
  uint64_t v79;
  __int128 v80;
  __int128 v81;
  uint64_t v82;
  ITColor v83;
  uint64_t v84;
  _OWORD v85[2];
  uint64_t v86;
  ITColor v87;
  uint64_t v88;

  v2 = malloc_type_calloc(0x190uLL, 8uLL, 0x100004000313F17uLL);
  *((_QWORD *)this + 1) = v2;
  if (!v2)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 1, "ImageAnalyzer::QuantizeColorMaps() - failed to allocate mColorCounts.", v61, v62, v63, v64, v65, v71);
    goto LABEL_69;
  }
  v3 = malloc_type_calloc(0x190uLL, 1uLL, 0x100004077774924uLL);
  if (!v3)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 1, "ImageAnalyzer::QuantizeColorMaps() - failed to allocate completedIndexes.", v66, v67, v68, v69, v70, v71);
LABEL_69:
  }
  v4 = v3;
  v72 = 0;
  v5 = 0;
  v6 = 0;
  for (i = 0; i != 400; ++i)
  {
    if (!v4[i])
    {
      v8 = *(_QWORD *)this + 40 * i;
      v9 = *(_OWORD *)(v8 + 16);
      *(_OWORD *)&v83.var0 = *(_OWORD *)v8;
      *(_OWORD *)&v83.var2 = v9;
      v84 = *(_QWORD *)(v8 + 32);
      if (*(double *)(v8 + 32) >= 127.0)
      {
        v10 = *(_OWORD *)(v8 + 16);
        v80 = *(_OWORD *)v8;
        v81 = v10;
        v82 = *(_QWORD *)(v8 + 32);
        v11 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)(i - 20 * ((unsigned __int16)i / 0x14u)), (unsigned __int16)i / 0x14u);
        if (v6 >= (unint64_t)v72)
        {
          v14 = 0xDB6DB6DB6DB6DB6ELL * ((uint64_t)&v72[-v6] >> 3);
          if (v14 <= 1)
            v14 = 1;
          if ((unint64_t)(0x6DB6DB6DB6DB6DB7 * ((uint64_t)&v72[-v6] >> 3)) >= 0x249249249249249)
            v15 = 0x492492492492492;
          else
            v15 = v14;
          v16 = std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(v15);
          v18 = v81;
          *v16 = v80;
          v16[1] = v18;
          *((_QWORD *)v16 + 4) = v82;
          *((_QWORD *)v16 + 5) = i;
          *((double *)v16 + 6) = v11;
          if (v6 == v5)
          {
            v23 = (char *)v16;
          }
          else
          {
            v19 = v16;
            do
            {
              v20 = *(_OWORD *)(v6 - 56);
              v21 = *(_OWORD *)(v6 - 40);
              v22 = *(_OWORD *)(v6 - 24);
              v23 = (char *)v19 - 56;
              *((_QWORD *)v19 - 1) = *(_QWORD *)(v6 - 8);
              *(_OWORD *)((char *)v19 - 24) = v22;
              *(_OWORD *)((char *)v19 - 40) = v21;
              *(_OWORD *)((char *)v19 - 56) = v20;
              v6 -= 56;
              v19 = (_OWORD *)((char *)v19 - 56);
            }
            while (v6 != v5);
          }
          v72 = (char *)v16 + 56 * v17;
          v6 = (unint64_t)v16 + 56;
          if (v5)
            operator delete((void *)v5);
          v5 = (uint64_t)v23;
        }
        else
        {
          v12 = *(_OWORD *)(v8 + 16);
          v13 = *(_QWORD *)(v8 + 32);
          *(_OWORD *)v6 = *(_OWORD *)v8;
          *(_OWORD *)(v6 + 16) = v12;
          *(_QWORD *)(v6 + 32) = v13;
          *(_QWORD *)(v6 + 40) = i;
          *(double *)(v6 + 48) = v11;
          v6 += 56;
        }
        *(double *)(*((_QWORD *)this + 1) + 8 * i) = v11;
        v4[i] = 1;
        v24 = i;
        if (i <= 0x18E)
        {
          do
          {
            if (!v4[++v24])
            {
              if (*(double *)(*(_QWORD *)this + 40 * v24 + 32) >= 127.0)
              {
                v25 = *(_QWORD *)this + 40 * v24;
                v78 = v83;
                v79 = v84;
                v26 = *(_OWORD *)(v25 + 16);
                v76[0] = *(_OWORD *)v25;
                v76[1] = v26;
                v77 = *(_QWORD *)(v25 + 32);
                if (!isCloseToColor(&v78, (double *)v76, 0, 0.0799999982))
                  continue;
                v73 = *(_OWORD *)v25;
                v74 = *(_OWORD *)(v25 + 16);
                v75 = *(_QWORD *)(v25 + 32);
                v27 = ImageAnalyzer::WeightForPointOnEdge((ImageAnalyzer *)(v24 - 20 * ((unsigned __int16)v24 / 0x14u)), (unsigned __int16)v24 / 0x14u);
                v28 = v6;
                if (v6 == v5)
                {
LABEL_34:
                  if (v6 >= (unint64_t)v72)
                  {
                    v37 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(v6 - v28) >> 3);
                    v38 = v37 + 1;
                    if ((unint64_t)(v37 + 1) > 0x492492492492492)
                      std::vector<ITColor>::__throw_length_error[abi:ne180100]();
                    v39 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)&v72[-v28] >> 3);
                    if (2 * v39 > v38)
                      v38 = 2 * v39;
                    if (v39 >= 0x249249249249249)
                      v40 = 0x492492492492492;
                    else
                      v40 = v38;
                    if (v40)
                      v40 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(v40);
                    else
                      v41 = 0;
                    v42 = v40 + 56 * v37;
                    *(_OWORD *)v42 = v73;
                    *(_OWORD *)(v42 + 16) = v74;
                    *(_QWORD *)(v42 + 32) = v75;
                    *(_QWORD *)(v42 + 40) = v24;
                    *(double *)(v42 + 48) = v27;
                    if (v6 == v5)
                    {
                      v47 = (void *)v6;
                      v5 = v40 + 56 * v37;
                    }
                    else
                    {
                      v43 = v40 + 56 * v37;
                      do
                      {
                        v44 = *(_OWORD *)(v6 - 56);
                        v45 = *(_OWORD *)(v6 - 40);
                        v46 = *(_OWORD *)(v6 - 24);
                        *(_QWORD *)(v43 - 8) = *(_QWORD *)(v6 - 8);
                        *(_OWORD *)(v43 - 24) = v46;
                        *(_OWORD *)(v43 - 40) = v45;
                        *(_OWORD *)(v43 - 56) = v44;
                        v43 -= 56;
                        v6 -= 56;
                      }
                      while (v6 != v5);
                      v47 = (void *)v5;
                      v5 = v43;
                    }
                    v72 = (char *)(v40 + 56 * v41);
                    v6 = v42 + 56;
                    if (v47)
                      operator delete(v47);
                  }
                  else
                  {
                    v35 = *(_OWORD *)(v25 + 16);
                    v36 = *(_QWORD *)(v25 + 32);
                    *(_OWORD *)v6 = *(_OWORD *)v25;
                    *(_OWORD *)(v6 + 16) = v35;
                    *(_QWORD *)(v6 + 32) = v36;
                    *(_QWORD *)(v6 + 40) = v24;
                    *(double *)(v6 + 48) = v27;
                    v6 += 56;
                  }
                }
                else
                {
                  v29 = 0;
                  if ((unint64_t)((uint64_t)(v6 - v5) / 56) <= 1)
                    v30 = 1;
                  else
                    v30 = (uint64_t)(v6 - v5) / 56;
                  v31 = v5;
                  while (1)
                  {
                    v32 = *(_OWORD *)(v25 + 16);
                    *(_OWORD *)&v87.var0 = *(_OWORD *)v25;
                    *(_OWORD *)&v87.var2 = v32;
                    v88 = *(_QWORD *)(v25 + 32);
                    v34 = *(_OWORD *)v31;
                    v33 = *(_OWORD *)(v31 + 16);
                    v86 = *(_QWORD *)(v31 + 32);
                    v85[0] = v34;
                    v85[1] = v33;
                    if ((isCloseToColor(&v87, (double *)v85, 0, 0.0799999982) & 1) != 0)
                      break;
                    ++v29;
                    v31 += 56;
                    if (v30 == v29)
                    {
                      v28 = v5;
                      goto LABEL_34;
                    }
                  }
                  *(double *)(v5 + 56 * v29 + 48) = v27 + *(double *)(v5 + 56 * v29 + 48);
                }
              }
              v4[v24] = 1;
            }
          }
          while (v24 != 399);
        }
        v48 = v6 - v5;
        if (v6 != v5)
        {
          v49 = v48 / 56;
          *(_QWORD *)&v87.var0 = CompareQuantizeSortcolor;
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(v5, v6, (uint64_t (**)(__int128 *, __int128 *))&v87, 126 - 2 * __clz(v48 / 56), 1);
          v50 = *(_QWORD *)(v5 + 40);
          v51 = *(double *)(v5 + 48);
          if (v49 >= 2)
          {
            v52 = v49 - 1;
            v53 = (double *)(v5 + 104);
            do
            {
              v54 = *((_QWORD *)v53 - 1);
              v55 = *v53;
              if (!v4[v54])
                v4[v54] = 1;
              v51 = v51 + v55;
              v56 = *(_QWORD *)this + 40 * v50;
              v57 = *(_OWORD *)v56;
              v58 = *(_OWORD *)(v56 + 16);
              v59 = *(_QWORD *)this + 40 * v54;
              *(_QWORD *)(v59 + 32) = *(_QWORD *)(v56 + 32);
              *(_OWORD *)v59 = v57;
              *(_OWORD *)(v59 + 16) = v58;
              v53 += 7;
              --v52;
            }
            while (v52);
          }
          *(double *)(*((_QWORD *)this + 1) + 8 * v50) = v51;
          v6 = v5;
        }
      }
    }
  }
  if (v5)
    operator delete((void *)v5);
  free(v4);
}

void sub_1A079D4E8(_Unwind_Exception *a1)
{
  void *v1;

  __cxa_free_exception(v1);
  _Unwind_Resume(a1);
}

void ImageAnalyzer::PickBackgroundColor(ImageAnalyzer *this)
{
  double v2;
  void **v3;
  _OWORD *v4;
  void **v5;
  __int128 v6;
  ITColor *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  unint64_t v14;
  uint64_t v15;
  double *v16;
  uint64_t v17;
  uint64_t v18;
  double v19;
  double v20;
  __n128 *v21;
  __n128 *v22;
  __n128 v23;
  double v24;
  double v25;
  BOOL v26;
  double v27;
  double v28;
  __n128 v29;
  double v30;
  double v31;
  _BOOL4 v32;
  double HSVColor;
  double v34;
  double v35;
  _BOOL4 v36;
  double v37;
  double v38;
  double v39;
  double v40;
  double v41;

  v2 = *((double *)this + 47);
  v3 = ImageAnalyzer::DominantColors((ITColor *)this);
  v4 = *v3;
  if (v3[1] != *v3)
  {
    v5 = v3;
    v6 = v4[1];
    *((_OWORD *)this + 2) = *v4;
    *((_OWORD *)this + 3) = v6;
    ITColor::GetLuminance((ITColor *)v3, *((__n128 *)this + 2), *((double *)this + 6));
    v9 = v8;
    v10 = v8 + 0.0500000007;
    if (v9 <= 0.180000007)
      v11 = 0.230000008;
    else
      v11 = v10;
    if (v9 <= 0.180000007)
      v12 = v10;
    else
      v12 = 0.230000008;
    v13 = v11 / v12;
    if (v11 / v12 < 1.29999995)
    {
      v14 = ((_BYTE *)v5[1] - (_BYTE *)*v5) >> 5;
      if (v14 >= 3)
        v14 = 3;
      if (v14 >= 2)
      {
        v15 = 0;
        v16 = (double *)*((_QWORD *)this + 43);
        v17 = 8 * v14;
        v18 = 8;
        do
        {
          v19 = v16[(unint64_t)v18 / 8];
          if (v19 <= 0.0)
            break;
          v20 = *v16 / v19;
          if (v20 <= 0.9 || v20 >= 1.112)
            break;
          v21 = (__n128 *)((char *)*v5 + v15);
          v23 = v21[2];
          v22 = v21 + 2;
          ITColor::GetLuminance(v7, v23, v22[1].n128_f64[0]);
          v25 = v24 + 0.0500000007;
          v26 = v24 <= 0.180000007;
          if (v24 <= 0.180000007)
            v27 = 0.230000008;
          else
            v27 = v24 + 0.0500000007;
          if (!v26)
            v25 = 0.230000008;
          v28 = v27 / v25;
          if (v28 > v13)
          {
            v29 = v22[1];
            *((__n128 *)this + 2) = *v22;
            *((__n128 *)this + 3) = v29;
            v13 = v28;
          }
          v18 += 8;
          v15 += 32;
        }
        while (v17 != v18);
        ITColor::GetLuminance(v7, *((__n128 *)this + 2), *((double *)this + 6));
        v9 = v30;
        v10 = v30 + 0.0500000007;
      }
    }
    if (v9 <= 0.180000007)
      v31 = 0.230000008;
    else
      v31 = v10;
    if (v9 > 0.180000007)
      v10 = 0.230000008;
    if (v31 / v10 < 1.29999995)
    {
      v32 = v2 >= 0.180000007;
      HSVColor = ITColor::GetHSVColor((ITColor *)this + 1);
      v36 = v9 >= 0.180000007;
      if (!v32 || !v36)
        v34 = v34 * 1.10000002;
      v40 = 0.0;
      v41 = 0.0;
      if (!v32 || !v36)
        v35 = v35 * 0.800000012;
      v39 = 0.0;
      HSV2RGB(HSVColor, v34, v35, &v41, &v40, &v39);
      v37 = v40;
      v38 = v39;
      *((double *)this + 4) = v41;
      *((double *)this + 5) = v37;
      *((double *)this + 6) = v38;
      *((_QWORD *)this + 7) = 0x3FF0000000000000;
    }
  }
}

void ImageAnalyzer::PickTextColors(ImageAnalyzer *this)
{
  void **v2;
  __n128 *v3;
  unint64_t v4;
  unint64_t v5;
  double *v6;
  double *v7;
  double v8;
  double v9;
  ITColor *v10;
  ITColor *v11;
  double v12;
  uint64_t v13;
  int v14;
  double v15;
  double v16;
  unint64_t v17;
  double *v18;
  unsigned int v19;
  unsigned int v20;
  unsigned int v21;
  double v22;
  __n128 v23;
  double v24;
  double v25;
  double v26;
  double v27;
  BOOL v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  uint64_t v32;
  double v33;
  double v34;
  double v35;
  int v36;
  uint64_t v37;
  double v38;
  uint64_t v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  int v46;
  BOOL v47;
  char v48;
  __n128 v49;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  double var0;
  double var1;
  double var2;
  double var3;
  ITColor *v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  double v63;
  double v64;
  double v65;
  double v66;
  ITColor *v67;
  uint64_t v68;
  uint64_t v69;
  uint64_t v70;
  uint64_t v71;
  double v72;
  double v73;
  __n128 *v74;
  double v75;
  ITColor *v76;
  double v77;
  double v78;
  __n128 *v79;
  double v80;
  ITColor *v81;
  ITColor *v82;
  double v83;
  double v84;
  char v85;
  BOOL v86;
  double v87;
  double v88;
  char v89;
  BOOL v90;
  double v91;
  double v92;
  double v93;
  double v94;
  double v95;
  double v96;
  double v97;
  ITColor *v98;
  double v99;
  double v100;
  double v101;
  double v102;
  double v103;
  double v104;
  __int128 v105;
  __n128 v106;
  __int128 v107;
  unsigned int v108;
  double v109;
  __n128 v110;
  double v111;
  __int128 v112;
  __int128 v113;
  ITColor v114;
  ITColor v115;
  ITColor v116;
  ITColor v117;
  ITColor v118;
  ITColor v119;
  ITColor v120;
  ITColor v121;
  ITColor v122;
  ITColor v123;
  ITColor v124;
  ITColor v125;
  ITColor v126;
  ITColor v127;
  ITColor v128;
  ITColor v129;

  v2 = ImageAnalyzer::DominantColors((ITColor *)this);
  v3 = (__n128 *)*v2;
  v4 = (_BYTE *)v2[1] - (_BYTE *)*v2;
  v5 = v4 >> 5;
  v6 = (double *)&unk_1A07D4000;
  v7 = (double *)&unk_1A07D4000;
  if ((v4 >> 5) <= 1)
  {
    v47 = 0;
    v48 = 0;
    v49 = *((__n128 *)this + 2);
    v41 = *((double *)this + 5);
    goto LABEL_52;
  }
  v110 = *((__n128 *)this + 2);
  v109 = *((double *)this + 6);
  ITColor::GetLuminance((ITColor *)v2, v110, v109);
  v9 = v8;
  ITColor::GetLuminance(v10, v3[2], v3[3].n128_f64[0]);
  v13 = 0;
  v14 = 0;
  if (v12 <= v9)
    v15 = v9;
  else
    v15 = v12;
  if (v12 > v9)
    v12 = v9;
  v16 = (v15 + 0.0500000007) / (v12 + 0.0500000007);
  v17 = (v4 >> 5);
  v18 = &v3[1].n128_f64[1];
  v19 = 1;
  v108 = v5;
  v20 = v5;
  v21 = 1;
  v22 = v16;
  do
  {
    v23 = *(__n128 *)(v18 - 3);
    v24 = *(v18 - 1);
    if ((v14 & 1) == 0)
    {
      v25 = *v18;
      v112 = *(_OWORD *)(v18 - 3);
      ITColor::GetLuminance(v11, v23, v24);
      if (v26 >= 0.180000007 == v9 >= 0.180000007)
      {
        v23 = (__n128)v112;
      }
      else
      {
        if (v26 <= v9)
          v27 = v9;
        else
          v27 = v26;
        if (v26 > v9)
          v26 = v9;
        v28 = (v27 + 0.0500000007) / (v26 + 0.0500000007) < 4.5999999;
        v23 = (__n128)v112;
        if (!v28)
        {
          v114.var1 = *((double *)&v112 + 1);
          v121.var3 = *((double *)this + 7);
          *(_QWORD *)&v121.var0 = v110.n128_u64[0];
          *(_QWORD *)&v114.var0 = v112;
          v114.var2 = v24;
          v114.var3 = v25;
          v121.var2 = v109;
          *(_QWORD *)&v121.var1 = v110.n128_u64[1];
          ImageAnalyzer::EnhanceContrastWithColor(v114, v121, 0.449999988);
          *((_QWORD *)this + 8) = v29;
          *((_QWORD *)this + 9) = v30;
          v23 = (__n128)v112;
          *((_QWORD *)this + 10) = v31;
          *((_QWORD *)this + 11) = v32;
          v20 = v13 + 1;
          v14 = 1;
        }
      }
    }
    ITColor::GetLuminance(v11, v23, v24);
    if (v33 <= v9)
      v34 = v9;
    else
      v34 = v33;
    if (v33 > v9)
      v33 = v9;
    v35 = (v34 + 0.0500000007) / (v33 + 0.0500000007);
    if (v35 <= v22)
    {
      v35 = v16;
    }
    else if (v35 <= v16)
    {
      v22 = v35;
      v35 = v16;
      v21 = v13;
    }
    else
    {
      v22 = v16;
      v21 = v19;
      v19 = v13;
    }
    ++v13;
    v18 += 4;
    v16 = v35;
  }
  while (v17 != v13);
  if (v20 >= v108)
  {
    v46 = 0;
    v38 = *((double *)this + 7);
    if ((v14 & 1) != 0)
    {
      v6 = (double *)&unk_1A07D4000;
      v40 = v109;
      v41 = v110.n128_f64[1];
LABEL_47:
      v7 = (double *)&unk_1A07D4000;
      goto LABEL_48;
    }
    LOBYTE(v36) = 1;
    v40 = v109;
    v41 = v110.n128_f64[1];
  }
  else
  {
    v36 = 0;
    v37 = v20;
    v38 = *((double *)this + 7);
    v39 = (uint64_t)&v3[2 * v20 + 1];
    v40 = v109;
    v41 = v110.n128_f64[1];
    while (1)
    {
      v42 = *(double *)(v39 - 16);
      v43 = *(double *)(v39 - 8);
      v44 = *(double *)v39;
      v45 = *(double *)(v39 + 8);
      v115.var0 = v42;
      v115.var1 = v43;
      v115.var2 = *(double *)v39;
      v115.var3 = v45;
      *(__n128 *)&v122.var0 = v110;
      v122.var2 = v109;
      v122.var3 = v38;
      LODWORD(v11) = contrastsEnoughWithColor(v115, v122, v11);
      if ((_DWORD)v11)
        break;
      v36 = ++v37 >= v17;
      v39 += 32;
      if (v17 == v37)
      {
        v46 = 0;
        if ((v14 & 1) == 0)
        {
          LOBYTE(v36) = 1;
          goto LABEL_40;
        }
        v6 = (double *)&unk_1A07D4000;
        goto LABEL_47;
      }
    }
    v116.var0 = v42;
    v116.var1 = v43;
    v116.var2 = v44;
    v116.var3 = v45;
    *(__n128 *)&v123.var0 = v110;
    v123.var2 = v109;
    v123.var3 = v38;
    ImageAnalyzer::EnhanceContrastWithColor(v116, v123, 0.449999988);
    *((_QWORD *)this + 12) = v50;
    *((_QWORD *)this + 13) = v51;
    *((_QWORD *)this + 14) = v52;
    *((_QWORD *)this + 15) = v53;
    if ((v14 & ~v36 & 1) != 0)
    {
      v48 = 1;
      v46 = 1;
      v6 = (double *)&unk_1A07D4000;
      v49 = v110;
      LODWORD(v5) = v108;
      v7 = (double *)&unk_1A07D4000;
      goto LABEL_51;
    }
    v46 = 1;
    if ((v14 & 1) != 0)
      goto LABEL_42;
  }
LABEL_40:
  *(_QWORD *)&v124.var0 = v110.n128_u64[0];
  v124.var1 = v41;
  v124.var2 = v40;
  v124.var3 = v38;
  ImageAnalyzer::EnhanceContrastWithColor(*(ITColor *)v3[2 * v19].n128_u64, v124, 0.200000003);
  var0 = v117.var0;
  var1 = v117.var1;
  var2 = v117.var2;
  var3 = v117.var3;
  *(_QWORD *)&v125.var0 = v110.n128_u64[0];
  v125.var1 = v41;
  v125.var2 = v40;
  v125.var3 = v38;
  v2 = (void **)contrastsEnoughWithColor(v117, v125, v58);
  if ((_DWORD)v2)
  {
    v118.var0 = var0;
    v118.var1 = var1;
    v118.var2 = var2;
    v118.var3 = var3;
    *(_QWORD *)&v126.var0 = v110.n128_u64[0];
    v126.var1 = v41;
    v126.var2 = v40;
    v126.var3 = v38;
    ImageAnalyzer::EnhanceContrastWithColor(v118, v126, 0.449999988);
    *((_QWORD *)this + 8) = v59;
    *((_QWORD *)this + 9) = v60;
    *((_QWORD *)this + 10) = v61;
    *((_QWORD *)this + 11) = v62;
    LOBYTE(v14) = 1;
  }
LABEL_42:
  v6 = (double *)&unk_1A07D4000;
  v7 = (double *)&unk_1A07D4000;
  if ((v36 & 1) != 0)
  {
LABEL_48:
    *(_QWORD *)&v127.var0 = v110.n128_u64[0];
    v127.var1 = v41;
    v127.var2 = v40;
    v127.var3 = v38;
    ImageAnalyzer::EnhanceContrastWithColor(*(ITColor *)v3[2 * v21].n128_u64, v127, 0.200000003);
    v63 = v119.var0;
    v64 = v119.var1;
    v65 = v119.var2;
    v66 = v119.var3;
    *(_QWORD *)&v128.var0 = v110.n128_u64[0];
    v128.var1 = v41;
    v128.var2 = v40;
    v128.var3 = v38;
    v2 = (void **)contrastsEnoughWithColor(v119, v128, v67);
    if ((_DWORD)v2)
    {
      v120.var0 = v63;
      v120.var1 = v64;
      v120.var2 = v65;
      v120.var3 = v66;
      *(_QWORD *)&v129.var0 = v110.n128_u64[0];
      v129.var1 = v41;
      v129.var2 = v40;
      v129.var3 = v38;
      ImageAnalyzer::EnhanceContrastWithColor(v120, v129, 0.449999988);
      *((_QWORD *)this + 12) = v68;
      *((_QWORD *)this + 13) = v69;
      *((_QWORD *)this + 14) = v70;
      *((_QWORD *)this + 15) = v71;
      v46 = 1;
    }
  }
  v48 = v14;
  v49 = v110;
  LODWORD(v5) = v108;
LABEL_51:
  v47 = v46 != 0;
LABEL_52:
  v111 = v49.n128_f64[0];
  v113 = *((_OWORD *)this + 3);
  ITColor::GetLuminance((ITColor *)v2, v49, *(double *)&v113);
  v73 = v72;
  v74 = (__n128 *)((char *)this + 64);
  v75 = *((double *)this + 10);
  ITColor::GetLuminance(v76, *((__n128 *)this + 4), v75);
  v78 = v77;
  v79 = (__n128 *)((char *)this + 96);
  v80 = *((double *)this + 14);
  ITColor::GetLuminance(v81, *((__n128 *)this + 6), v80);
  v84 = v7[343];
  if (v73 < v84)
  {
    if (v78 >= v84)
      v89 = v48;
    else
      v89 = 0;
    v90 = v83 >= v84 && v47;
    if ((v89 & 1) != 0)
    {
      if (v90)
        goto LABEL_84;
      if ((_DWORD)v5)
      {
        v91 = v111;
        v92 = *(double *)&v113;
LABEL_78:
        v94 = v91 * 0.100000001 + 0.899999999;
        v95 = v41 * 0.100000001 + 0.899999999;
        v80 = v92 * 0.100000001 + 0.899999999;
        v96 = *((double *)&v113 + 1) * 0.100000001 + 0.899999999;
        goto LABEL_83;
      }
    }
    else
    {
      if ((_DWORD)v5)
      {
        v97 = v6[364];
        v91 = v111;
        v92 = *(double *)&v113;
        v75 = *(double *)&v113 * v97 + 0.949999999;
        *((double *)this + 8) = v111 * v97 + 0.949999999;
        *((double *)this + 9) = v41 * v97 + 0.949999999;
        *((double *)this + 10) = v75;
        *((double *)this + 11) = *((double *)&v113 + 1) * v97 + 0.949999999;
        if (v90)
          goto LABEL_84;
        goto LABEL_78;
      }
      *((_QWORD *)this + 8) = 0x3FF0000000000000;
      *((_QWORD *)this + 9) = 0x3FF0000000000000;
      *((_QWORD *)this + 10) = 0x3FF0000000000000;
      *((_QWORD *)this + 11) = 0x3FF0000000000000;
      v75 = 1.0;
      if (v90)
        goto LABEL_84;
    }
    v94 = 1.0;
    v95 = 1.0;
    v80 = 1.0;
    v96 = 1.0;
    goto LABEL_83;
  }
  if (v78 < v84)
    v85 = v48;
  else
    v85 = 0;
  v86 = v83 < v84 && v47;
  if ((v85 & 1) == 0)
  {
    if ((_DWORD)v5)
    {
      v93 = v6[364];
      v87 = v111;
      v88 = *(double *)&v113;
      v75 = *(double *)&v113 * v93 + 0.0;
      *((double *)this + 8) = v111 * v93 + 0.0;
      *((double *)this + 9) = v41 * v93 + 0.0;
      *((double *)this + 10) = v75;
      *((double *)this + 11) = *((double *)&v113 + 1) * v93 + 0.949999999;
      if (v86)
        goto LABEL_84;
      goto LABEL_75;
    }
    *((_QWORD *)this + 8) = 0;
    *((_QWORD *)this + 9) = 0;
    *((_QWORD *)this + 10) = 0;
    *((_QWORD *)this + 11) = 0x3FF0000000000000;
    v75 = 0.0;
    if (v86)
      goto LABEL_84;
LABEL_80:
    v96 = 1.0;
    v94 = 0.0;
    v95 = 0.0;
    v80 = 0.0;
    goto LABEL_83;
  }
  if (v86)
    goto LABEL_84;
  if (!(_DWORD)v5)
    goto LABEL_80;
  v87 = v111;
  v88 = *(double *)&v113;
LABEL_75:
  v94 = v87 * 0.100000001 + 0.0;
  v95 = v41 * 0.100000001 + 0.0;
  v80 = v88 * 0.100000001 + 0.0;
  v96 = *((double *)&v113 + 1) * 0.100000001 + 0.899999999;
LABEL_83:
  *((double *)this + 12) = v94;
  *((double *)this + 13) = v95;
  *((double *)this + 14) = v80;
  *((double *)this + 15) = v96;
LABEL_84:
  ITColor::GetLuminance(v82, *v74, v75);
  if (v99 <= v73)
    v100 = v73;
  else
    v100 = v99;
  if (v99 > v73)
    v99 = v73;
  v101 = v6[364];
  v102 = (v100 + v101) / (v99 + v101);
  ITColor::GetLuminance(v98, *v79, v80);
  if (v103 <= v73)
    v104 = v73;
  else
    v104 = v103;
  if (v103 > v73)
    v103 = v73;
  if ((v104 + v101) / (v103 + v101) > v102)
  {
    v106 = *v74;
    v105 = *((_OWORD *)this + 5);
    v107 = *((_OWORD *)this + 7);
    *v74 = *v79;
    *((_OWORD *)this + 5) = v107;
    *v79 = v106;
    *((_OWORD *)this + 7) = v105;
  }
}

void ImageAnalyzer::DoPostImageAnalysis(ImageAnalyzer *this, ITColor *a2, ITColor *a3)
{
  __n128 *v3;
  float64x2_t v4;
  float64x2_t v5;
  __n128 v6;
  float64x2_t v7;
  float64x2_t v8;
  float64x2_t v9;
  float64x2_t v10;
  float64x2_t v11;
  unint64_t v12;
  unint64_t v13;
  unint64_t v14;
  unint64_t v15;
  ITColor *v16;
  ITColor *v17;
  unint64_t v18;
  unint64_t v19;
  unint64_t v20;
  unint64_t v21;
  ITColor *v22;
  ITColor *v23;
  unint64_t v24;
  unint64_t v25;
  unint64_t v26;
  unint64_t v27;
  ITColor *v28;
  ITColor *v29;
  unint64_t v30;
  unint64_t v31;
  unint64_t v32;
  unint64_t v33;
  float64x2_t v34;
  double v35;
  float64x2_t v36;

  v3 = (__n128 *)((char *)this + 32);
  v4 = *((float64x2_t *)this + 2);
  v5 = (float64x2_t)vdupq_n_s64(0x3FE9999998000000uLL);
  v7 = *((float64x2_t *)this + 3);
  v6 = *((__n128 *)this + 4);
  v8 = (float64x2_t)vdupq_n_s64(0x3FC99999A0000000uLL);
  v9 = *((float64x2_t *)this + 5);
  v10 = *((float64x2_t *)this + 6);
  v11 = vmlaq_f64(vmulq_f64(v9, v5), v8, v7);
  *((float64x2_t *)this + 8) = vmlaq_f64(vmulq_f64((float64x2_t)v6, v5), v8, v4);
  *((float64x2_t *)this + 9) = v11;
  v34 = *((float64x2_t *)this + 7);
  v35 = v11.f64[0];
  v36 = vmlaq_f64(vmulq_f64(v34, v5), v8, v7);
  *((float64x2_t *)this + 10) = vmlaq_f64(vmulq_f64(v10, v5), v8, v4);
  *((float64x2_t *)this + 11) = v36;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)this + 1, a2, a3, v6, v9.f64[0]);
  v3[10].n128_u64[0] = v12;
  v3[10].n128_u64[1] = v13;
  v3[11].n128_u64[0] = v14;
  v3[11].n128_u64[1] = v15;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)v3, v16, v17, v3[4], v34.f64[0]);
  v3[14].n128_u64[0] = v18;
  v3[14].n128_u64[1] = v19;
  v3[15].n128_u64[0] = v20;
  v3[15].n128_u64[1] = v21;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)v3, v22, v23, v3[6], v35);
  v3[12].n128_u64[0] = v24;
  v3[12].n128_u64[1] = v25;
  v3[13].n128_u64[0] = v26;
  v3[13].n128_u64[1] = v27;
  ImageAnalyzer::CalculateOneShadowColor((ITColor *)v3, v28, v29, v3[8], v36.f64[0]);
  v3[16].n128_u64[0] = v30;
  v3[16].n128_u64[1] = v31;
  v3[17].n128_u64[0] = v32;
  v3[17].n128_u64[1] = v33;
}

void ImageAnalyzer::CalculateOneShadowColor(ITColor *this, ITColor *a2, ITColor *a3, __n128 a4, double a5)
{
  double v6;
  double v7;
  ITColor *v8;
  ITColor *v9;
  double v10;
  double v11;

  ITColor::GetLuminance(this, a4, a5);
  v7 = v6;
  ITColor::GetLuminance(v8, *(__n128 *)&this->var0, this->var2);
  if (v7 >= v10)
    v11 = 0.0;
  else
    v11 = 1.0;
  ITColor::GetLuminance(v9, (__n128)vdupq_lane_s64(*(uint64_t *)&v11, 0), v11);
}

void **ImageAnalyzer::DominantColors(ITColor *this)
{
  void **v1;
  ITColor *v2;
  ITColor *v3;
  double *n128_f64;
  char *v5;
  uint64_t v6;
  double v7;
  double v13;
  uint64_t v14;
  __n128 v15;
  double v16;
  unint64_t v17;
  unint64_t v18;
  char *v19;
  uint64_t v20;
  uint64_t v21;
  double v22;
  double *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double HSVColor;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  ITColor *v38;
  double v39;
  uint64_t v40;
  unint64_t v41;
  uint64_t v42;
  unint64_t v43;
  __n128 *v44;
  ITColor *v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  void *v49;
  uint64_t v50;
  unint64_t v51;
  double var0;
  double var1;
  char *v54;
  char *v55;
  uint64_t v56;
  char *v57;
  double v58;
  double v59;
  double v60;
  __int128 v61;
  double var3;
  double v63;
  char *v64;
  char *v65;
  uint64_t v66;
  char *v67;
  double v68;
  double v69;
  double v70;
  uint64_t v71;
  uint64_t v72;
  char *v73;
  double v74;
  double var2;
  __int128 v76;
  _OWORD *v77;
  uint64_t v78;
  unint64_t v79;
  uint64_t v80;
  unint64_t v81;
  uint64_t v82;
  _OWORD *v83;
  __int128 v84;
  double v85;
  double v86;
  _OWORD *v87;
  __int128 v88;
  char *v89;
  double v90;
  double v91;
  _QWORD *v92;
  double v93;
  uint64_t v94;
  unint64_t v95;
  uint64_t v96;
  unint64_t v97;
  uint64_t v98;
  _QWORD *v99;
  uint64_t v100;
  unint64_t v102;
  unint64_t v103;
  double v104;
  double v105;
  __n128 v106;
  __n128 v107;
  double v108[5];
  ITColor v109;
  uint64_t v110;

  v1 = (void **)&this[10];
  if (*(_QWORD *)&this[10].var1 == *(_QWORD *)&this[10].var0)
  {
    v2 = this;
    v3 = 0;
    n128_f64 = 0;
    v5 = 0;
    v6 = 0;
    v7 = 1.0;
    __asm { FMOV            V0.2D, #1.0 }
    v103 = *((_QWORD *)&_Q0 + 1);
    do
    {
      v13 = *(double *)(*(_QWORD *)&v2->var1 + 8 * v6);
      if (v13 >= v7 && *(double *)(*(_QWORD *)&v2->var0 + 40 * v6 + 32) >= 127.0)
      {
        v14 = *(_QWORD *)&v2->var0 + 40 * v6;
        v15.n128_f64[0] = ITColor::CreateFromHSVDoubles(this, *(double *)v14, *(double *)(v14 + 8), *(double *)(v14 + 16));
        v15.n128_u64[1] = v17;
        v107 = v15;
        v15.n128_u64[1] = v103;
        v15.n128_f64[0] = v16;
        v106 = v15;
        v18 = *(_QWORD *)(v14 + 24);
        v19 = (char *)n128_f64;
        v20 = (char *)n128_f64 - v5;
        if (n128_f64 == (double *)v5)
        {
LABEL_13:
          if (n128_f64 >= (double *)v3)
          {
            v40 = ((char *)n128_f64 - v19) >> 6;
            v41 = v40 + 1;
            if ((unint64_t)(v40 + 1) >> 58)
              std::vector<ITColor>::__throw_length_error[abi:ne180100]();
            v42 = (char *)v3 - v19;
            if (v42 >> 5 > v41)
              v41 = v42 >> 5;
            if ((unint64_t)v42 >= 0x7FFFFFFFFFFFFFC0)
              v43 = 0x3FFFFFFFFFFFFFFLL;
            else
              v43 = v41;
            if (v43)
            {
              if (v43 >> 58)
                std::__throw_bad_array_new_length[abi:ne180100]();
              this = (ITColor *)operator new(v43 << 6);
            }
            else
            {
              this = 0;
            }
            v44 = (__n128 *)&this[2 * v40];
            v44->n128_f64[0] = v13;
            v44[1] = v107;
            v44[2] = v106;
            v44[3].n128_u64[0] = v18;
            if (n128_f64 == (double *)v5)
            {
              v49 = n128_f64;
              v5 = (char *)&this[2 * v40];
            }
            else
            {
              v45 = &this[2 * v40];
              do
              {
                v46 = *((_OWORD *)n128_f64 - 4);
                v47 = *((_OWORD *)n128_f64 - 3);
                v48 = *((_OWORD *)n128_f64 - 1);
                *(_OWORD *)&v45[-1].var0 = *((_OWORD *)n128_f64 - 2);
                *(_OWORD *)&v45[-1].var2 = v48;
                *(_OWORD *)&v45[-2].var0 = v46;
                *(_OWORD *)&v45[-2].var2 = v47;
                v45 -= 2;
                n128_f64 -= 8;
              }
              while (n128_f64 != (double *)v5);
              v49 = v5;
              v5 = (char *)v45;
            }
            v3 = &this[2 * v43];
            n128_f64 = v44[4].n128_f64;
            if (v49)
              operator delete(v49);
          }
          else
          {
            *n128_f64 = v13;
            *((__n128 *)n128_f64 + 1) = v107;
            *((__n128 *)n128_f64 + 2) = v106;
            *((_QWORD *)n128_f64 + 6) = v18;
            n128_f64 += 8;
          }
        }
        else
        {
          v102 = *(_QWORD *)(v14 + 24);
          v104 = v13;
          if ((unint64_t)(v20 >> 6) <= 1)
            v21 = 1;
          else
            v21 = v20 >> 6;
          ITColor::GetLuminance(this, v107, v16);
          v105 = v22;
          v23 = (double *)v5;
          while (1)
          {
            v24 = v23[2];
            v25 = v23[3];
            v27 = v23[4];
            v26 = v23[5];
            *(__n128 *)&v109.var0 = v107;
            *(__n128 *)&v109.var2 = v106;
            HSVColor = ITColor::GetHSVColor(&v109);
            v30 = v29;
            v32 = v31;
            v109.var0 = v24;
            v109.var1 = v25;
            v109.var2 = v27;
            v109.var3 = v26;
            v33 = ITColor::GetHSVColor(&v109);
            v35 = v34;
            v37 = v36;
            ITColor::GetLuminance(v38, *(__n128 *)&v109.var0, v27);
            v109.var0 = HSVColor;
            v109.var1 = v30;
            v109.var2 = v32;
            v109.var3 = v105;
            v110 = 0x3FF0000000000000;
            v108[0] = v33;
            v108[1] = v35;
            v108[2] = v37;
            v108[3] = v39;
            v108[4] = v26;
            this = (ITColor *)isCloseToColor(&v109, v108, 1, 0.0700000003);
            if ((this & 1) != 0)
              break;
            v23 += 8;
            if (!--v21)
            {
              v19 = v5;
              v7 = 1.0;
              v18 = v102;
              v13 = v104;
              goto LABEL_13;
            }
          }
          *v23 = v104 + *v23;
          v7 = 1.0;
        }
      }
      ++v6;
    }
    while (v6 != 400);
    v50 = (char *)n128_f64 - v5;
    if (n128_f64 != (double *)v5)
    {
      v51 = v50 >> 6;
      *(_QWORD *)&v109.var0 = CompareSortColor;
      std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>((uint64_t)v5, (__n128 *)n128_f64, (uint64_t (**)(__n128 *, __n128 *))&v109, 126 - 2 * __clz(v50 >> 6), 1);
      var0 = v2[10].var0;
      if (v50 >> 6 > (unint64_t)((uint64_t)(*(_QWORD *)&v2[10].var2 - *(_QWORD *)&var0) >> 5))
      {
        if (v50 < 0)
          std::vector<ITColor>::__throw_length_error[abi:ne180100]();
        var1 = v2[10].var1;
        v54 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v50 >> 6);
        v55 = &v54[(*(_QWORD *)&var1 - *(_QWORD *)&var0) & 0xFFFFFFFFFFFFFFE0];
        v57 = &v54[32 * v56];
        v59 = v2[10].var0;
        v58 = v2[10].var1;
        v60 = *(double *)&v55;
        if (*(_QWORD *)&v58 != *(_QWORD *)&v59)
        {
          do
          {
            v61 = *(_OWORD *)(*(_QWORD *)&v58 - 16);
            *(_OWORD *)(*(_QWORD *)&v60 - 32) = *(_OWORD *)(*(_QWORD *)&v58 - 32);
            *(_OWORD *)(*(_QWORD *)&v60 - 16) = v61;
            *(_QWORD *)&v60 -= 32;
            *(_QWORD *)&v58 -= 32;
          }
          while (*(_QWORD *)&v58 != *(_QWORD *)&v59);
          v58 = *(double *)v1;
        }
        v2[10].var0 = v60;
        *(_QWORD *)&v2[10].var1 = v55;
        *(_QWORD *)&v2[10].var2 = v57;
        if (v58 != 0.0)
          operator delete(*(void **)&v58);
      }
      var3 = v2[10].var3;
      if (v51 > (uint64_t)(*(_QWORD *)&v2[11].var1 - *(_QWORD *)&var3) >> 3)
      {
        if (v50 < 0)
          std::vector<ITColor>::__throw_length_error[abi:ne180100]();
        v63 = v2[11].var0;
        v64 = (char *)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v50 >> 6);
        v65 = &v64[(*(_QWORD *)&v63 - *(_QWORD *)&var3) & 0xFFFFFFFFFFFFFFF8];
        v67 = &v64[8 * v66];
        v68 = v2[10].var3;
        v69 = v2[11].var0;
        v70 = *(double *)&v65;
        if (*(_QWORD *)&v69 != *(_QWORD *)&v68)
        {
          v70 = *(double *)&v65;
          do
          {
            v71 = *(_QWORD *)(*(_QWORD *)&v69 - 8);
            *(_QWORD *)&v69 -= 8;
            *(_QWORD *)(*(_QWORD *)&v70 - 8) = v71;
            *(_QWORD *)&v70 -= 8;
          }
          while (*(_QWORD *)&v69 != *(_QWORD *)&v68);
        }
        v2[10].var3 = v70;
        *(_QWORD *)&v2[11].var0 = v65;
        *(_QWORD *)&v2[11].var1 = v67;
        if (v68 != 0.0)
          operator delete(*(void **)&v68);
      }
      v72 = 0;
      if (v51 <= 1)
        v51 = 1;
      do
      {
        v73 = &v5[64 * v72 + 16];
        v74 = v2[10].var1;
        var2 = v2[10].var2;
        if (*(_QWORD *)&v74 >= *(_QWORD *)&var2)
        {
          v78 = (uint64_t)(*(_QWORD *)&v74 - (_QWORD)*v1) >> 5;
          v79 = v78 + 1;
          if ((unint64_t)(v78 + 1) >> 59)
            std::vector<ITColor>::__throw_length_error[abi:ne180100]();
          v80 = *(_QWORD *)&var2 - (_QWORD)*v1;
          if (v80 >> 4 > v79)
            v79 = v80 >> 4;
          if ((unint64_t)v80 >= 0x7FFFFFFFFFFFFFE0)
            v81 = 0x7FFFFFFFFFFFFFFLL;
          else
            v81 = v79;
          if (v81)
            v81 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(v81);
          else
            v82 = 0;
          v83 = (_OWORD *)(v81 + 32 * v78);
          v84 = *(_OWORD *)&v5[64 * v72 + 32];
          *v83 = *(_OWORD *)v73;
          v83[1] = v84;
          v86 = v2[10].var0;
          v85 = v2[10].var1;
          v87 = v83;
          if (*(_QWORD *)&v85 != *(_QWORD *)&v86)
          {
            do
            {
              v88 = *(_OWORD *)(*(_QWORD *)&v85 - 16);
              *(v87 - 2) = *(_OWORD *)(*(_QWORD *)&v85 - 32);
              *(v87 - 1) = v88;
              v87 -= 2;
              *(_QWORD *)&v85 -= 32;
            }
            while (*(_QWORD *)&v85 != *(_QWORD *)&v86);
            v85 = *(double *)v1;
          }
          v77 = v83 + 2;
          *(_QWORD *)&v2[10].var0 = v87;
          *(_QWORD *)&v2[10].var1 = v83 + 2;
          *(_QWORD *)&v2[10].var2 = v81 + 32 * v82;
          if (v85 != 0.0)
            operator delete(*(void **)&v85);
        }
        else
        {
          v76 = *(_OWORD *)&v5[64 * v72 + 32];
          **(_OWORD **)&v74 = *(_OWORD *)v73;
          *(_OWORD *)(*(_QWORD *)&v74 + 16) = v76;
          v77 = (_OWORD *)(*(_QWORD *)&v74 + 32);
        }
        *(_QWORD *)&v2[10].var1 = v77;
        v89 = &v5[64 * v72];
        v91 = v2[11].var0;
        v90 = v2[11].var1;
        if (*(_QWORD *)&v91 >= *(_QWORD *)&v90)
        {
          v93 = v2[10].var3;
          v94 = (uint64_t)(*(_QWORD *)&v91 - *(_QWORD *)&v93) >> 3;
          v95 = v94 + 1;
          if ((unint64_t)(v94 + 1) >> 61)
            std::vector<ITColor>::__throw_length_error[abi:ne180100]();
          v96 = *(_QWORD *)&v90 - *(_QWORD *)&v93;
          if (v96 >> 2 > v95)
            v95 = v96 >> 2;
          if ((unint64_t)v96 >= 0x7FFFFFFFFFFFFFF8)
            v97 = 0x1FFFFFFFFFFFFFFFLL;
          else
            v97 = v95;
          if (v97)
          {
            v97 = (unint64_t)std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(v97);
            v93 = v2[10].var3;
            v91 = v2[11].var0;
          }
          else
          {
            v98 = 0;
          }
          v99 = (_QWORD *)(v97 + 8 * v94);
          *v99 = *(_QWORD *)v89;
          v92 = v99 + 1;
          while (*(_QWORD *)&v91 != *(_QWORD *)&v93)
          {
            v100 = *(_QWORD *)(*(_QWORD *)&v91 - 8);
            *(_QWORD *)&v91 -= 8;
            *--v99 = v100;
          }
          *(_QWORD *)&v2[10].var3 = v99;
          *(_QWORD *)&v2[11].var0 = v92;
          *(_QWORD *)&v2[11].var1 = v97 + 8 * v98;
          if (v93 != 0.0)
            operator delete(*(void **)&v93);
        }
        else
        {
          **(_QWORD **)&v91 = *(_QWORD *)v89;
          v92 = (_QWORD *)(*(_QWORD *)&v91 + 8);
        }
        *(_QWORD *)&v2[11].var0 = v92;
        ++v72;
      }
      while (v72 != v51);
      n128_f64 = (double *)v5;
    }
    if (n128_f64)
      operator delete(n128_f64);
  }
  return v1;
}

void sub_1A079E544(_Unwind_Exception *exception_object)
{
  void *v1;

  if (v1)
    operator delete(v1);
  _Unwind_Resume(exception_object);
}

void ImageAnalyzer::EnhanceContrastWithColor(ITColor a1, ITColor a2, double a3)
{
  double var2;
  double HSVColor;
  double v6;
  double v7;
  double v8;
  double v9;
  __n128 v10;
  ITColor *v11;
  ITColor *v12;
  double v13;
  double v14;
  double var0;
  double var1;
  ITColor v17;

  var2 = a2.var2;
  var0 = a2.var0;
  var1 = a2.var1;
  v17 = a1;
  HSVColor = ITColor::GetHSVColor(&v17);
  v7 = v6;
  v9 = v8;
  v10.n128_f64[0] = var0;
  v10.n128_f64[1] = var1;
  ITColor::GetLuminance(v11, v10, var2);
  v13 = 1.0 - (1.0 - v9) * a3;
  if (v14 >= 0.180000007)
    v13 = v9 * a3;
  ITColor::CreateFromHSVDoubles(v12, HSVColor, v7, v13);
}

BOOL contrastsEnoughWithColor(ITColor a1, ITColor a2, ITColor *a3)
{
  double var2;
  double var1;
  double v5;
  double v6;
  double v7;
  _BOOL4 v8;
  ITColor *v9;
  double v10;
  double v11;
  __n128 v13;

  var2 = a2.var2;
  var1 = a1.var1;
  v5 = a2.var1;
  v13 = *(__n128 *)&a2.var0;
  ITColor::GetLuminance(a3, *(__n128 *)&a1.var0, a1.var2);
  v7 = v6;
  v8 = v6 >= 0.180000007;
  ITColor::GetLuminance(v9, v13, var2);
  if (v8 == v10 >= 0.180000007)
    return 0;
  if (v7 <= v10)
    v11 = v10;
  else
    v11 = v7;
  if (v7 <= v10)
    v10 = v7;
  return (v11 + 0.0500000007) / (v10 + 0.0500000007) >= 3.0999999;
}

BOOL CompareSortColor(double *a1, double *a2)
{
  return *a1 > *a2;
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(uint64_t a1, __n128 *a2, uint64_t (**a3)(__n128 *, __n128 *), uint64_t a4, char a5)
{
  __n128 *v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  __n128 *v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  uint64_t (*v24)(__n128 *, __n128 *);
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 *v34;
  __n128 *v35;
  uint64_t (*v36)(__n128 *, __n128 *);
  __n128 v37;
  __n128 v38;
  __n128 v39;
  __n128 *v40;
  __n128 *v41;
  uint64_t (*v42)(__n128 *, __n128 *);
  __n128 v43;
  __n128 v44;
  __n128 v45;
  int v46;
  __n128 *v47;
  uint64_t (*v48)(__n128 *, __n128 *);
  __n128 v49;
  __n128 v50;
  __n128 v51;
  char v52;
  __n128 *v53;
  __n128 *v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  __n128 v58;
  __n128 v59;
  __n128 v60;
  __n128 v61;
  uint64_t (*v62)(__n128 *, __n128 *);
  __n128 v63;
  __n128 v64;
  __n128 v65;
  __n128 v66;
  __n128 v67;
  __n128 v68;
  __n128 v69;
  uint64_t (*v70)(__n128 *, __n128 *);
  __n128 v71;
  __n128 v72;
  __n128 v73;
  __n128 v74;
  __n128 v75;
  __n128 v76;
  BOOL v77;
  __n128 v78;
  __n128 v79;
  __n128 v80;
  uint64_t (*v81)(__n128 *, __n128 *);
  __n128 v82;
  __n128 v83;
  __n128 v84;
  __n128 v85;
  __n128 v86;
  __n128 v87;
  __n128 *v88;
  uint64_t (*v89)(__n128 *, __n128 *);
  __n128 v90;
  __n128 v91;
  __n128 v92;
  char v93;
  __n128 *v94;
  uint64_t (*v95)(__n128 *, __n128 *);
  __n128 v96;
  __n128 v97;
  __n128 v98;
  int v99;
  __n128 *v100;
  __n128 *v101;
  uint64_t (*v102)(__n128 *, __n128 *);
  __n128 v103;
  __n128 v104;
  __n128 v105;
  char v106;
  __n128 v107;
  __n128 v108;
  __n128 v109;
  __n128 v110;
  __n128 v111;
  __n128 v112;
  __n128 v113;
  __n128 v114;
  __n128 v115;
  __n128 v116;
  __n128 v117;
  __n128 v118;
  __n128 v119;
  uint64_t (*v120)(__n128 *, __n128 *);
  __n128 v121;
  __n128 v122;
  __n128 v123;
  __n128 v124;
  uint64_t (*v125)(__n128 *, __n128 *);
  __n128 *v126;
  __n128 v127;
  __n128 v128;
  __n128 v129;
  __n128 v130;
  __n128 v131;
  __n128 v132;
  uint64_t (*v133)(__n128 *, __n128 *);
  __n128 v134;
  __n128 v135;
  __n128 v136;
  __int128 v137;
  __int128 v138;
  __n128 v139;
  __n128 v140;
  __n128 v141;
  __n128 v142;
  __n128 v143;
  __n128 v144;
  __n128 v145;
  __n128 v146;
  __n128 v147;
  __n128 v148;
  __n128 *v149;
  BOOL v151;
  uint64_t v152;
  __n128 *v153;
  __n128 *v154;
  uint64_t (*v155)(__n128 *, __n128 *);
  __n128 v156;
  __n128 v157;
  __n128 v158;
  __n128 v159;
  __n128 v160;
  __n128 v161;
  __n128 *v162;
  __n128 v163;
  __n128 v164;
  __n128 v165;
  uint64_t v166;
  __n128 *v167;
  __n128 v168;
  __n128 v169;
  uint64_t (*v170)(__n128 *, __n128 *);
  __n128 v171;
  __n128 v172;
  __n128 v173;
  _OWORD *v174;
  __n128 v175;
  __n128 v176;
  __n128 v177;
  int64_t v178;
  int64_t v179;
  uint64_t v180;
  __n128 *v181;
  uint64_t (*v182)(__n128 *, __n128 *);
  __n128 v183;
  __n128 v184;
  __n128 v185;
  __n128 v186;
  __n128 v187;
  __n128 v188;
  __n128 *v189;
  uint64_t (*v190)(__n128 *, __n128 *);
  __n128 v191;
  __n128 v192;
  __n128 v193;
  __n128 v194;
  __n128 v195;
  __n128 v196;
  __n128 v197;
  __n128 v198;
  __n128 v199;
  __n128 *v200;
  __n128 v201;
  __n128 v202;
  __n128 v203;
  uint64_t v204;
  uint64_t v205;
  uint64_t (*v206)(__n128 *, __n128 *);
  __n128 v207;
  __n128 v208;
  __n128 v209;
  __n128 v210;
  __n128 v211;
  __n128 v212;
  uint64_t (*v213)(__n128 *, __n128 *);
  __n128 v214;
  __n128 v215;
  __n128 v216;
  __n128 v217;
  __n128 v218;
  __n128 v219;
  uint64_t v220;
  __n128 *v221;
  uint64_t v222;
  __n128 v223;
  __n128 v224;
  __n128 v225;
  uint64_t v226;
  uint64_t v227;
  _OWORD *v228;
  __n128 *v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t (*v232)(__n128 *, __n128 *);
  __n128 v233;
  __n128 v234;
  __n128 v235;
  __n128 v236;
  __n128 v237;
  __n128 v238;
  __n128 v239;
  __n128 v240;
  __n128 v241;
  __n128 v242;
  __n128 v243;
  __n128 v244;
  __n128 v245;
  __n128 v246;
  __n128 v247;
  uint64_t v248;
  unint64_t v249;
  __n128 *v250;
  uint64_t (*v251)(__n128 *, __n128 *);
  __n128 v252;
  __n128 v253;
  __n128 v254;
  __n128 v255;
  __n128 v256;
  __n128 v257;
  __n128 v258;
  __n128 v259;
  __n128 v260;
  __n128 *v261;
  __n128 v262;
  __n128 v263;
  __n128 v264;
  uint64_t (*v265)(__n128 *, __n128 *);
  __n128 v266;
  __n128 v267;
  __n128 v268;
  __n128 v269;
  __n128 v270;
  __n128 v271;
  __n128 v272;
  __n128 v273;
  __n128 v274;
  __n128 *v276;
  uint64_t (*v277)(__n128 *, __n128 *);
  __n128 v278;
  __n128 v279;
  __n128 v280;
  __n128 v281;
  __n128 v282;
  __n128 v283;
  __n128 v284;
  __n128 v285;
  __n128 v286;
  __n128 *v287;
  __n128 *v288;
  __n128 v289;
  __n128 v290;
  uint64_t (*v291)(__n128 *, __n128 *);
  __n128 v292;
  __n128 v293;
  __n128 v294;
  char v295;
  __n128 v296;
  __n128 v297;
  __n128 v298;
  __n128 *v299;
  __n128 *v300;
  int64_t v301;
  _OWORD v302[4];
  _OWORD v303[4];
  _OWORD v304[4];
  _OWORD v305[4];
  _OWORD v306[4];
  _OWORD v307[4];
  __n128 v308;
  __n128 v309;
  __n128 v310;
  __n128 v311;
  __n128 v312;
  __n128 v313;
  __n128 v314;
  __n128 v315;
  __n128 v316;
  __n128 v317;
  __n128 v318;
  __n128 v319;
  __n128 v320;
  __n128 v321;
  __n128 v322;
  __n128 v323;
  __n128 v324;
  __n128 v325;
  __n128 v326;
  __n128 v327;
  __n128 v328;
  __n128 v329;
  __n128 v330;
  __n128 v331;
  __n128 v332;
  __n128 v333;
  __n128 v334;
  __n128 v335;
  __n128 v336;
  __n128 v337;
  __n128 v338;
  __n128 v339;
  __n128 v340;
  __n128 v341;
  __n128 v342;
  __n128 v343;
  __n128 v344;
  __n128 v345;
  __n128 v346;
  __n128 v347;

LABEL_1:
  v300 = a2 - 4;
  v10 = (__n128 *)a1;
  while (2)
  {
    a1 = (uint64_t)v10;
    v11 = (char *)a2 - (char *)v10;
    v12 = ((char *)a2 - (char *)v10) >> 6;
    switch(v12)
    {
      case 0:
      case 1:
        return;
      case 2:
        v133 = *a3;
        v134 = a2[-1];
        v136 = *v300;
        v135 = a2[-3];
        v305[2] = a2[-2];
        v305[3] = v134;
        v305[0] = v136;
        v305[1] = v135;
        v137 = *(_OWORD *)(a1 + 48);
        v139 = *(__n128 *)a1;
        v138 = *(_OWORD *)(a1 + 16);
        v304[2] = *(_OWORD *)(a1 + 32);
        v304[3] = v137;
        v304[0] = v139;
        v304[1] = v138;
        if (v133((__n128 *)v305, (__n128 *)v304))
        {
          v140 = *(__n128 *)a1;
          v141 = *(__n128 *)(a1 + 16);
          v142 = *(__n128 *)(a1 + 48);
          v346 = *(__n128 *)(a1 + 32);
          v347 = v142;
          v344 = v140;
          v345 = v141;
          v143 = *v300;
          v144 = a2[-3];
          v145 = a2[-1];
          *(__n128 *)(a1 + 32) = a2[-2];
          *(__n128 *)(a1 + 48) = v145;
          *(__n128 *)a1 = v143;
          *(__n128 *)(a1 + 16) = v144;
          v146 = v344;
          v147 = v345;
          v148 = v347;
          a2[-2] = v346;
          a2[-1] = v148;
          *v300 = v146;
          a2[-3] = v147;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), v300, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), v300, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      case 5:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), v300, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      default:
        if (v11 <= 1535)
        {
          v149 = (__n128 *)(a1 + 64);
          v151 = (__n128 *)a1 == a2 || v149 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v151)
            {
              v152 = 0;
              v153 = (__n128 *)a1;
              do
              {
                v154 = v153;
                v153 = v149;
                v155 = *a3;
                v156 = v153[3];
                v158 = *v153;
                v157 = v153[1];
                v346 = v153[2];
                v347 = v156;
                v344 = v158;
                v345 = v157;
                v159 = v154[3];
                v161 = *v154;
                v160 = v154[1];
                v342 = v154[2];
                v343 = v159;
                v340 = v161;
                v341 = v160;
                if (v155(&v344, &v340))
                {
                  v162 = a2;
                  v163 = *v153;
                  v164 = v153[1];
                  v165 = v153[3];
                  v338 = v153[2];
                  v339 = v165;
                  v336 = v163;
                  v337 = v164;
                  v166 = v152;
                  while (1)
                  {
                    v167 = (__n128 *)(a1 + v166);
                    v168 = *(__n128 *)(a1 + v166 + 16);
                    v167[4] = *(__n128 *)(a1 + v166);
                    v167[5] = v168;
                    v169 = *(__n128 *)(a1 + v166 + 48);
                    v167[6] = *(__n128 *)(a1 + v166 + 32);
                    v167[7] = v169;
                    if (!v166)
                      break;
                    v170 = *a3;
                    v332 = v336;
                    v333 = v337;
                    v334 = v338;
                    v335 = v339;
                    v171 = v167[-1];
                    v173 = v167[-4];
                    v172 = v167[-3];
                    v330 = v167[-2];
                    v331 = v171;
                    v328 = v173;
                    v329 = v172;
                    v166 -= 64;
                    if ((v170(&v332, &v328) & 1) == 0)
                    {
                      v174 = (_OWORD *)(a1 + v166 + 64);
                      goto LABEL_73;
                    }
                  }
                  v174 = (_OWORD *)a1;
LABEL_73:
                  v175 = v336;
                  v176 = v337;
                  v177 = v339;
                  v174[2] = v338;
                  v174[3] = v177;
                  *v174 = v175;
                  v174[1] = v176;
                  a2 = v162;
                }
                v149 = v153 + 4;
                v152 += 64;
              }
              while (&v153[4] != a2);
            }
          }
          else if (!v151)
          {
            do
            {
              v276 = (__n128 *)a1;
              a1 = (uint64_t)v149;
              v277 = *a3;
              v278 = *(__n128 *)(a1 + 48);
              v280 = *(__n128 *)a1;
              v279 = *(__n128 *)(a1 + 16);
              v346 = *(__n128 *)(a1 + 32);
              v347 = v278;
              v344 = v280;
              v345 = v279;
              v281 = v276[3];
              v283 = *v276;
              v282 = v276[1];
              v342 = v276[2];
              v343 = v281;
              v340 = v283;
              v341 = v282;
              if (v277(&v344, &v340))
              {
                v284 = *(__n128 *)a1;
                v285 = *(__n128 *)(a1 + 16);
                v286 = *(__n128 *)(a1 + 48);
                v338 = *(__n128 *)(a1 + 32);
                v339 = v286;
                v336 = v284;
                v337 = v285;
                v287 = (__n128 *)a1;
                do
                {
                  v288 = v287 - 4;
                  v289 = v287[-3];
                  *v287 = v287[-4];
                  v287[1] = v289;
                  v290 = v287[-1];
                  v287[2] = v287[-2];
                  v287[3] = v290;
                  v291 = *a3;
                  v332 = v336;
                  v333 = v337;
                  v334 = v338;
                  v335 = v339;
                  v292 = v287[-5];
                  v294 = v287[-8];
                  v293 = v287[-7];
                  v330 = v287[-6];
                  v331 = v292;
                  v328 = v294;
                  v329 = v293;
                  v295 = v291(&v332, &v328);
                  v287 = v288;
                }
                while ((v295 & 1) != 0);
                v296 = v336;
                v297 = v337;
                v298 = v339;
                v288[2] = v338;
                v288[3] = v298;
                *v288 = v296;
                v288[1] = v297;
              }
              v149 = (__n128 *)(a1 + 64);
            }
            while ((__n128 *)(a1 + 64) != a2);
          }
          return;
        }
        if (!a4)
        {
          if ((__n128 *)a1 != a2)
          {
            v178 = (unint64_t)(v12 - 2) >> 1;
            v299 = a2;
            v301 = v178;
            do
            {
              v179 = v178;
              if (v301 >= v178)
              {
                v180 = (2 * v178) | 1;
                v181 = (__n128 *)(a1 + (v180 << 6));
                if (2 * v178 + 2 < v12)
                {
                  v182 = *a3;
                  v183 = v181[3];
                  v185 = *v181;
                  v184 = v181[1];
                  v346 = v181[2];
                  v347 = v183;
                  v344 = v185;
                  v345 = v184;
                  v186 = v181[7];
                  v188 = v181[4];
                  v187 = v181[5];
                  v342 = v181[6];
                  v343 = v186;
                  v340 = v188;
                  v341 = v187;
                  if (v182(&v344, &v340))
                  {
                    v181 += 4;
                    v180 = 2 * v179 + 2;
                  }
                }
                v189 = (__n128 *)(a1 + (v179 << 6));
                v190 = *a3;
                v191 = v181[3];
                v193 = *v181;
                v192 = v181[1];
                v338 = v181[2];
                v339 = v191;
                v336 = v193;
                v337 = v192;
                v194 = v189[3];
                v196 = *v189;
                v195 = v189[1];
                v334 = v189[2];
                v335 = v194;
                v332 = v196;
                v333 = v195;
                if ((v190(&v336, &v332) & 1) == 0)
                {
                  v197 = *v189;
                  v198 = v189[1];
                  v199 = v189[3];
                  v330 = v189[2];
                  v331 = v199;
                  v328 = v197;
                  v329 = v198;
                  do
                  {
                    v200 = v181;
                    v201 = *v181;
                    v202 = v181[1];
                    v203 = v181[3];
                    v189[2] = v181[2];
                    v189[3] = v203;
                    *v189 = v201;
                    v189[1] = v202;
                    if (v301 < v180)
                      break;
                    v204 = (2 * v180) | 1;
                    v181 = (__n128 *)(a1 + (v204 << 6));
                    v205 = 2 * v180 + 2;
                    if (v205 < v12)
                    {
                      v206 = *a3;
                      v207 = v181[3];
                      v209 = *v181;
                      v208 = v181[1];
                      v326 = v181[2];
                      v327 = v207;
                      v324 = v209;
                      v325 = v208;
                      v210 = v181[7];
                      v212 = v181[4];
                      v211 = v181[5];
                      v322 = v181[6];
                      v323 = v210;
                      v320 = v212;
                      v321 = v211;
                      if (v206(&v324, &v320))
                      {
                        v181 += 4;
                        v204 = v205;
                      }
                    }
                    v213 = *a3;
                    v214 = v181[3];
                    v216 = *v181;
                    v215 = v181[1];
                    v318 = v181[2];
                    v319 = v214;
                    v316 = v216;
                    v317 = v215;
                    v312 = v328;
                    v313 = v329;
                    v314 = v330;
                    v315 = v331;
                    v189 = v200;
                    v180 = v204;
                  }
                  while (!v213(&v316, &v312));
                  v217 = v328;
                  v218 = v329;
                  v219 = v331;
                  v200[2] = v330;
                  v200[3] = v219;
                  *v200 = v217;
                  v200[1] = v218;
                }
              }
              v178 = v179 - 1;
            }
            while (v179);
            v220 = (unint64_t)v11 >> 6;
            v221 = v299;
            do
            {
              v222 = 0;
              v223 = *(__n128 *)a1;
              v224 = *(__n128 *)(a1 + 16);
              v225 = *(__n128 *)(a1 + 48);
              v326 = *(__n128 *)(a1 + 32);
              v327 = v225;
              v324 = v223;
              v325 = v224;
              v226 = v220 - 2;
              if (v220 < 2)
                v226 = v220 - 1;
              v227 = v226 >> 1;
              v228 = (_OWORD *)a1;
              do
              {
                v229 = (__n128 *)&v228[4 * v222 + 4];
                v230 = (2 * v222) | 1;
                v231 = 2 * v222 + 2;
                if (v231 < v220)
                {
                  v232 = *a3;
                  v233 = v229[3];
                  v235 = *v229;
                  v234 = v229[1];
                  v346 = v229[2];
                  v347 = v233;
                  v344 = v235;
                  v345 = v234;
                  v236 = v229[7];
                  v238 = v229[4];
                  v237 = v229[5];
                  v342 = v229[6];
                  v343 = v236;
                  v340 = v238;
                  v341 = v237;
                  if (v232(&v344, &v340))
                  {
                    v229 += 4;
                    v230 = v231;
                  }
                }
                v239 = *v229;
                v240 = v229[1];
                v241 = v229[3];
                v228[2] = v229[2];
                v228[3] = v241;
                *v228 = v239;
                v228[1] = v240;
                v228 = v229;
                v222 = v230;
              }
              while (v230 <= v227);
              v221 -= 4;
              if (v229 == v221)
              {
                v272 = v324;
                v273 = v325;
                v274 = v327;
                v229[2] = v326;
                v229[3] = v274;
                *v229 = v272;
                v229[1] = v273;
              }
              else
              {
                v242 = *v221;
                v243 = v221[1];
                v244 = v221[3];
                v229[2] = v221[2];
                v229[3] = v244;
                *v229 = v242;
                v229[1] = v243;
                v245 = v324;
                v246 = v325;
                v247 = v327;
                v221[2] = v326;
                v221[3] = v247;
                *v221 = v245;
                v221[1] = v246;
                v248 = (uint64_t)&v229[4] - a1;
                if (v248 >= 65)
                {
                  v249 = (unint64_t)((v248 >> 6) - 2) >> 1;
                  v250 = (__n128 *)(a1 + (v249 << 6));
                  v251 = *a3;
                  v252 = v250[3];
                  v254 = *v250;
                  v253 = v250[1];
                  v346 = v250[2];
                  v347 = v252;
                  v344 = v254;
                  v345 = v253;
                  v255 = v229[3];
                  v257 = *v229;
                  v256 = v229[1];
                  v342 = v229[2];
                  v343 = v255;
                  v340 = v257;
                  v341 = v256;
                  if (v251(&v344, &v340))
                  {
                    v258 = *v229;
                    v259 = v229[1];
                    v260 = v229[3];
                    v338 = v229[2];
                    v339 = v260;
                    v336 = v258;
                    v337 = v259;
                    do
                    {
                      v261 = v250;
                      v262 = *v250;
                      v263 = v250[1];
                      v264 = v250[3];
                      v229[2] = v250[2];
                      v229[3] = v264;
                      *v229 = v262;
                      v229[1] = v263;
                      if (!v249)
                        break;
                      v265 = *a3;
                      v249 = (v249 - 1) >> 1;
                      v250 = (__n128 *)(a1 + (v249 << 6));
                      v266 = v250[3];
                      v268 = *v250;
                      v267 = v250[1];
                      v334 = v250[2];
                      v335 = v266;
                      v332 = v268;
                      v333 = v267;
                      v328 = v336;
                      v329 = v337;
                      v330 = v338;
                      v331 = v339;
                      v229 = v261;
                    }
                    while ((v265(&v332, &v328) & 1) != 0);
                    v269 = v336;
                    v270 = v337;
                    v271 = v339;
                    v261[2] = v338;
                    v261[3] = v271;
                    *v261 = v269;
                    v261[1] = v270;
                  }
                }
              }
            }
            while (v220-- > 2);
          }
          return;
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = (__n128 *)(a1 + ((unint64_t)v12 >> 1 << 6));
        if ((unint64_t)v11 <= 0x2000)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(v14, (_OWORD *)a1, v300, (uint64_t (**)(_QWORD, _QWORD))a3);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, v14, v300, (uint64_t (**)(_QWORD, _QWORD))a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)(a1 + 64), (__n128 *)v14[-4].n128_u64, (__n128 *)a2[-8].n128_u64, (uint64_t (**)(_QWORD, _QWORD))a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)(a1 + 128), (_OWORD *)(a1 + 64 + (v13 << 6)), (__n128 *)a2[-12].n128_u64, (uint64_t (**)(_QWORD, _QWORD))a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)v14[-4].n128_u64, v14, (_OWORD *)(a1 + 64 + (v13 << 6)), (uint64_t (**)(_QWORD, _QWORD))a3);
          v15 = *(__n128 *)a1;
          v16 = *(__n128 *)(a1 + 16);
          v17 = *(__n128 *)(a1 + 48);
          v346 = *(__n128 *)(a1 + 32);
          v347 = v17;
          v344 = v15;
          v345 = v16;
          v18 = *v14;
          v19 = v14[1];
          v20 = v14[3];
          *(__n128 *)(a1 + 32) = v14[2];
          *(__n128 *)(a1 + 48) = v20;
          *(__n128 *)a1 = v18;
          *(__n128 *)(a1 + 16) = v19;
          v21 = v344;
          v22 = v345;
          v23 = v347;
          v14[2] = v346;
          v14[3] = v23;
          *v14 = v21;
          v14[1] = v22;
        }
        --a4;
        if ((a5 & 1) == 0)
        {
          v24 = *a3;
          v25 = *(_OWORD *)(a1 - 16);
          v27 = *(_OWORD *)(a1 - 64);
          v26 = *(_OWORD *)(a1 - 48);
          v303[2] = *(_OWORD *)(a1 - 32);
          v303[3] = v25;
          v303[0] = v27;
          v303[1] = v26;
          v28 = *(_OWORD *)(a1 + 48);
          v30 = *(__n128 *)a1;
          v29 = *(_OWORD *)(a1 + 16);
          v302[2] = *(_OWORD *)(a1 + 32);
          v302[3] = v28;
          v302[0] = v30;
          v302[1] = v29;
          if ((v24((__n128 *)v303, (__n128 *)v302) & 1) == 0)
          {
            v78 = *(__n128 *)a1;
            v79 = *(__n128 *)(a1 + 16);
            v80 = *(__n128 *)(a1 + 48);
            v342 = *(__n128 *)(a1 + 32);
            v343 = v80;
            v340 = v78;
            v341 = v79;
            v81 = *a3;
            v82 = *(__n128 *)(a1 + 48);
            v84 = *(__n128 *)a1;
            v83 = *(__n128 *)(a1 + 16);
            v338 = *(__n128 *)(a1 + 32);
            v339 = v82;
            v336 = v84;
            v337 = v83;
            v86 = a2[-2];
            v85 = a2[-1];
            v87 = a2[-3];
            v332 = *v300;
            v333 = v87;
            v334 = v86;
            v335 = v85;
            if ((v81(&v336, &v332) & 1) != 0)
            {
              v88 = (__n128 *)a1;
              do
              {
                v10 = v88 + 4;
                v89 = *a3;
                v328 = v340;
                v329 = v341;
                v330 = v342;
                v331 = v343;
                v90 = v88[7];
                v92 = v88[4];
                v91 = v88[5];
                v326 = v88[6];
                v327 = v90;
                v324 = v92;
                v325 = v91;
                v93 = v89(&v328, &v324);
                v88 = v10;
              }
              while ((v93 & 1) == 0);
            }
            else
            {
              v94 = (__n128 *)(a1 + 64);
              do
              {
                v10 = v94;
                if (v94 >= a2)
                  break;
                v95 = *a3;
                v328 = v340;
                v329 = v341;
                v330 = v342;
                v331 = v343;
                v96 = v10[3];
                v98 = *v10;
                v97 = v10[1];
                v326 = v10[2];
                v327 = v96;
                v324 = v98;
                v325 = v97;
                v99 = v95(&v328, &v324);
                v94 = v10 + 4;
              }
              while (!v99);
            }
            v100 = a2;
            if (v10 < a2)
            {
              v101 = a2;
              do
              {
                v100 = v101 - 4;
                v102 = *a3;
                v320 = v340;
                v321 = v341;
                v322 = v342;
                v323 = v343;
                v103 = v101[-1];
                v105 = v101[-4];
                v104 = v101[-3];
                v318 = v101[-2];
                v319 = v103;
                v316 = v105;
                v317 = v104;
                v106 = v102(&v320, &v316);
                v101 = v100;
              }
              while ((v106 & 1) != 0);
            }
            while (v10 < v100)
            {
              v107 = *v10;
              v108 = v10[1];
              v109 = v10[3];
              v346 = v10[2];
              v347 = v109;
              v344 = v107;
              v345 = v108;
              v110 = *v100;
              v111 = v100[1];
              v112 = v100[3];
              v10[2] = v100[2];
              v10[3] = v112;
              *v10 = v110;
              v10[1] = v111;
              v113 = v344;
              v114 = v345;
              v115 = v347;
              v100[2] = v346;
              v100[3] = v115;
              *v100 = v113;
              v100[1] = v114;
              do
              {
                v312 = v340;
                v313 = v341;
                v314 = v342;
                v315 = v343;
                v116 = v10[6];
                v117 = v10[7];
                v119 = v10[4];
                v118 = v10[5];
                v10 += 4;
                v120 = *a3;
                v310 = v116;
                v311 = v117;
                v308 = v119;
                v309 = v118;
              }
              while (!v120(&v312, &v308));
              do
              {
                v307[0] = v340;
                v307[1] = v341;
                v307[2] = v342;
                v307[3] = v343;
                v121 = v100[-2];
                v122 = v100[-1];
                v124 = v100[-4];
                v123 = v100[-3];
                v100 -= 4;
                v125 = *a3;
                v306[2] = v121;
                v306[3] = v122;
                v306[0] = v124;
                v306[1] = v123;
              }
              while ((v125((__n128 *)v307, (__n128 *)v306) & 1) != 0);
            }
            v126 = v10 - 4;
            if (&v10[-4] != (__n128 *)a1)
            {
              v127 = *v126;
              v128 = v10[-3];
              v129 = v10[-1];
              *(__n128 *)(a1 + 32) = v10[-2];
              *(__n128 *)(a1 + 48) = v129;
              *(__n128 *)a1 = v127;
              *(__n128 *)(a1 + 16) = v128;
            }
            a5 = 0;
            v130 = v340;
            v131 = v341;
            v132 = v343;
            v10[-2] = v342;
            v10[-1] = v132;
            *v126 = v130;
            v10[-3] = v131;
            continue;
          }
        }
        v31 = *(__n128 *)a1;
        v32 = *(__n128 *)(a1 + 16);
        v33 = *(__n128 *)(a1 + 48);
        v342 = *(__n128 *)(a1 + 32);
        v343 = v33;
        v340 = v31;
        v341 = v32;
        v34 = (__n128 *)a1;
        do
        {
          v35 = v34;
          v36 = *a3;
          v34 += 4;
          v37 = v35[7];
          v39 = v35[4];
          v38 = v35[5];
          v338 = v35[6];
          v339 = v37;
          v336 = v39;
          v337 = v38;
          v332 = v340;
          v333 = v341;
          v334 = v342;
          v335 = v343;
        }
        while ((v36(&v336, &v332) & 1) != 0);
        v40 = a2;
        if (v35 == (__n128 *)a1)
        {
          v47 = a2;
          while (v34 < v47)
          {
            v48 = *a3;
            v41 = v47 - 4;
            v49 = v47[-1];
            v51 = v47[-4];
            v50 = v47[-3];
            v330 = v47[-2];
            v331 = v49;
            v328 = v51;
            v329 = v50;
            v324 = v340;
            v325 = v341;
            v326 = v342;
            v327 = v343;
            v52 = v48(&v328, &v324);
            v47 = v41;
            if ((v52 & 1) != 0)
              goto LABEL_20;
          }
          v41 = v47;
        }
        else
        {
          do
          {
            v41 = v40 - 4;
            v42 = *a3;
            v43 = v40[-1];
            v45 = v40[-4];
            v44 = v40[-3];
            v330 = v40[-2];
            v331 = v43;
            v328 = v45;
            v329 = v44;
            v324 = v340;
            v325 = v341;
            v326 = v342;
            v327 = v343;
            v46 = v42(&v328, &v324);
            v40 = v41;
          }
          while (!v46);
        }
LABEL_20:
        if (v34 < v41)
        {
          v53 = v34;
          v54 = v41;
          do
          {
            v56 = v53[1];
            v344 = *v53;
            v55 = v344;
            v345 = v56;
            v58 = v53[3];
            v346 = v53[2];
            v57 = v346;
            v347 = v58;
            v60 = v54[2];
            v59 = v54[3];
            v61 = v54[1];
            *v53 = *v54;
            v53[1] = v61;
            v53[2] = v60;
            v53[3] = v59;
            v54[2] = v57;
            v54[3] = v58;
            *v54 = v55;
            v54[1] = v56;
            do
            {
              v35 = v53;
              v62 = *a3;
              v53 += 4;
              v63 = v35[7];
              v65 = v35[4];
              v64 = v35[5];
              v322 = v35[6];
              v323 = v63;
              v320 = v65;
              v321 = v64;
              v316 = v340;
              v317 = v341;
              v318 = v342;
              v319 = v343;
            }
            while ((v62(&v320, &v316) & 1) != 0);
            do
            {
              v66 = v54[-2];
              v67 = v54[-1];
              v69 = v54[-4];
              v68 = v54[-3];
              v54 -= 4;
              v70 = *a3;
              v314 = v66;
              v315 = v67;
              v312 = v69;
              v313 = v68;
              v308 = v340;
              v309 = v341;
              v310 = v342;
              v311 = v343;
            }
            while (!v70(&v312, &v308));
          }
          while (v53 < v54);
        }
        if (v35 != (__n128 *)a1)
        {
          v71 = *v35;
          v72 = v35[1];
          v73 = v35[3];
          *(__n128 *)(a1 + 32) = v35[2];
          *(__n128 *)(a1 + 48) = v73;
          *(__n128 *)a1 = v71;
          *(__n128 *)(a1 + 16) = v72;
        }
        v74 = v340;
        v75 = v341;
        v76 = v343;
        v35[2] = v342;
        v35[3] = v76;
        *v35 = v74;
        v35[1] = v75;
        if (v34 < v41)
        {
LABEL_31:
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*,false>(a1, v35, a3, a4, a5 & 1);
          a5 = 0;
          v10 = v35 + 4;
          continue;
        }
        v77 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, v35, (uint64_t (**)(_QWORD, _QWORD))a3);
        v10 = v35 + 4;
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((uint64_t)&v35[4], a2, (uint64_t (**)(_QWORD, _QWORD))a3))
        {
          if (v77)
            continue;
          goto LABEL_31;
        }
        a2 = v35;
        if (!v77)
          goto LABEL_1;
        return;
    }
  }
}

  v299 = (__int128 *)(a2 - 112);
  v302 = a2 - 56;
  v298 = (__int128 *)(a2 - 168);
  v10 = a1;
  while (2)
  {
    a1 = v10;
    v11 = a2 - v10;
    v12 = 0x6DB6DB6DB6DB6DB7 * ((uint64_t)(a2 - v10) >> 3);
    switch(v12)
    {
      case 0:
      case 1:
        return;
      case 2:
        v136 = *a3;
        v138 = *(_OWORD *)(v302 + 16);
        v137 = *(_OWORD *)(v302 + 32);
        v139 = *(_OWORD *)v302;
        v311 = *(_QWORD *)(v302 + 48);
        v310[1] = v138;
        v310[2] = v137;
        v310[0] = v139;
        v141 = *(_OWORD *)(a1 + 16);
        v140 = *(_OWORD *)(a1 + 32);
        v142 = *(_OWORD *)a1;
        v309 = *(_QWORD *)(a1 + 48);
        v308[1] = v141;
        v308[2] = v140;
        v308[0] = v142;
        if (v136(v310, v308))
        {
          v143 = *(_OWORD *)a1;
          v144 = *(_OWORD *)(a1 + 16);
          v145 = *(_OWORD *)(a1 + 32);
          v355 = *(_QWORD *)(a1 + 48);
          v353 = v144;
          v354 = v145;
          v352 = v143;
          v146 = *(_OWORD *)v302;
          v147 = *(_OWORD *)(v302 + 16);
          v148 = *(_OWORD *)(v302 + 32);
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(v302 + 48);
          *(_OWORD *)(a1 + 16) = v147;
          *(_OWORD *)(a1 + 32) = v148;
          *(_OWORD *)a1 = v146;
          v149 = v352;
          v150 = v353;
          v151 = v354;
          *(_QWORD *)(v302 + 48) = v355;
          *(_OWORD *)(v302 + 16) = v150;
          *(_OWORD *)(v302 + 32) = v151;
          *(_OWORD *)v302 = v149;
        }
        return;
      case 3:
        std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)a1, (__int128 *)(a1 + 56), (__int128 *)v302, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      case 4:
        std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, (__int128 *)v302, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      case 5:
        std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, a1 + 168, (__int128 *)v302, (uint64_t (**)(_QWORD, _QWORD))a3);
        return;
      default:
        if (v11 <= 1343)
        {
          v152 = a1 + 56;
          v154 = a1 == a2 || v152 == a2;
          if ((a5 & 1) != 0)
          {
            if (!v154)
            {
              v155 = 0;
              v156 = a1;
              do
              {
                v157 = v156;
                v156 = v152;
                v158 = *a3;
                v160 = *(_OWORD *)(v156 + 16);
                v159 = *(_OWORD *)(v156 + 32);
                v161 = *(_OWORD *)v156;
                v355 = *(_QWORD *)(v156 + 48);
                v353 = v160;
                v354 = v159;
                v352 = v161;
                v163 = *(_OWORD *)(v157 + 16);
                v162 = *(_OWORD *)(v157 + 32);
                v164 = *(_OWORD *)v157;
                v351 = *(_QWORD *)(v157 + 48);
                v349 = v163;
                v350 = v162;
                v348 = v164;
                if (v158(&v352, &v348))
                {
                  v165 = *(_OWORD *)v156;
                  v166 = *(_OWORD *)(v156 + 16);
                  v167 = *(_OWORD *)(v156 + 32);
                  v347 = *(_QWORD *)(v156 + 48);
                  v345 = v166;
                  v346 = v167;
                  v344 = v165;
                  v168 = v155;
                  while (1)
                  {
                    v169 = a1 + v168;
                    v170 = *(_OWORD *)(a1 + v168 + 16);
                    *(_OWORD *)(v169 + 56) = *(_OWORD *)(a1 + v168);
                    *(_OWORD *)(v169 + 72) = v170;
                    *(_OWORD *)(v169 + 88) = *(_OWORD *)(a1 + v168 + 32);
                    *(_QWORD *)(v169 + 104) = *(_QWORD *)(a1 + v168 + 48);
                    if (!v168)
                      break;
                    v171 = *a3;
                    v340 = v344;
                    v341 = v345;
                    v342 = v346;
                    v343 = v347;
                    v172 = *(_OWORD *)(v169 - 40);
                    v173 = *(_OWORD *)(v169 - 24);
                    v174 = *(_OWORD *)(v169 - 56);
                    v339 = *(_QWORD *)(v169 - 8);
                    v337 = v172;
                    v338 = v173;
                    v336 = v174;
                    v168 -= 56;
                    if ((v171(&v340, &v336) & 1) == 0)
                    {
                      v175 = a1 + v168 + 56;
                      goto LABEL_74;
                    }
                  }
                  v175 = a1;
LABEL_74:
                  v176 = v344;
                  v177 = v345;
                  v178 = v346;
                  *(_QWORD *)(v175 + 48) = v347;
                  *(_OWORD *)(v175 + 16) = v177;
                  *(_OWORD *)(v175 + 32) = v178;
                  *(_OWORD *)v175 = v176;
                }
                v152 = v156 + 56;
                v155 += 56;
              }
              while (v156 + 56 != a2);
            }
          }
          else if (!v154)
          {
            do
            {
              v276 = a1;
              a1 = v152;
              v277 = *a3;
              v279 = *(_OWORD *)(a1 + 16);
              v278 = *(_OWORD *)(a1 + 32);
              v280 = *(_OWORD *)a1;
              v355 = *(_QWORD *)(a1 + 48);
              v353 = v279;
              v354 = v278;
              v352 = v280;
              v282 = *(_OWORD *)(v276 + 16);
              v281 = *(_OWORD *)(v276 + 32);
              v283 = *(_OWORD *)v276;
              v351 = *(_QWORD *)(v276 + 48);
              v349 = v282;
              v350 = v281;
              v348 = v283;
              if (v277(&v352, &v348))
              {
                v284 = *(_OWORD *)a1;
                v285 = *(_OWORD *)(a1 + 16);
                v286 = *(_OWORD *)(a1 + 32);
                v347 = *(_QWORD *)(a1 + 48);
                v345 = v285;
                v346 = v286;
                v344 = v284;
                v287 = a1;
                do
                {
                  v288 = v287 - 56;
                  v289 = *(_OWORD *)(v287 - 40);
                  *(_OWORD *)v287 = *(_OWORD *)(v287 - 56);
                  *(_OWORD *)(v287 + 16) = v289;
                  *(_OWORD *)(v287 + 32) = *(_OWORD *)(v287 - 24);
                  *(_QWORD *)(v287 + 48) = *(_QWORD *)(v287 - 8);
                  v290 = *a3;
                  v340 = v344;
                  v341 = v345;
                  v342 = v346;
                  v343 = v347;
                  v292 = *(_OWORD *)(v287 - 96);
                  v291 = *(_OWORD *)(v287 - 80);
                  v293 = *(_OWORD *)(v287 - 112);
                  v339 = *(_QWORD *)(v287 - 64);
                  v337 = v292;
                  v338 = v291;
                  v336 = v293;
                  v294 = v290(&v340, &v336);
                  v287 = v288;
                }
                while ((v294 & 1) != 0);
                v295 = v344;
                v296 = v345;
                v297 = v346;
                *(_QWORD *)(v288 + 48) = v347;
                *(_OWORD *)(v288 + 16) = v296;
                *(_OWORD *)(v288 + 32) = v297;
                *(_OWORD *)v288 = v295;
              }
              v152 = a1 + 56;
            }
            while (a1 + 56 != a2);
          }
          return;
        }
        if (!a4)
        {
          if (a1 != a2)
          {
            v179 = (unint64_t)(v12 - 2) >> 1;
            v300 = (__int128 *)a2;
            v303 = v179;
            do
            {
              v180 = v179;
              if (v303 >= v179)
              {
                v181 = (2 * v179) | 1;
                v182 = a1 + 56 * v181;
                if (2 * v179 + 2 < v12)
                {
                  v183 = *a3;
                  v185 = *(_OWORD *)(v182 + 16);
                  v184 = *(_OWORD *)(v182 + 32);
                  v186 = *(_OWORD *)v182;
                  v355 = *(_QWORD *)(v182 + 48);
                  v353 = v185;
                  v354 = v184;
                  v352 = v186;
                  v187 = *(_OWORD *)(v182 + 72);
                  v188 = *(_OWORD *)(v182 + 88);
                  v189 = *(_OWORD *)(v182 + 56);
                  v351 = *(_QWORD *)(v182 + 104);
                  v349 = v187;
                  v350 = v188;
                  v348 = v189;
                  if (v183(&v352, &v348))
                  {
                    v182 += 56;
                    v181 = 2 * v180 + 2;
                  }
                }
                v190 = a1 + 56 * v180;
                v191 = *a3;
                v193 = *(_OWORD *)(v182 + 16);
                v192 = *(_OWORD *)(v182 + 32);
                v194 = *(_OWORD *)v182;
                v347 = *(_QWORD *)(v182 + 48);
                v345 = v193;
                v346 = v192;
                v344 = v194;
                v196 = *(_OWORD *)(v190 + 16);
                v195 = *(_OWORD *)(v190 + 32);
                v197 = *(_OWORD *)v190;
                v343 = *(_QWORD *)(v190 + 48);
                v341 = v196;
                v342 = v195;
                v340 = v197;
                if ((v191(&v344, &v340) & 1) == 0)
                {
                  v198 = *(_OWORD *)v190;
                  v199 = *(_OWORD *)(v190 + 16);
                  v200 = *(_OWORD *)(v190 + 32);
                  v339 = *(_QWORD *)(v190 + 48);
                  v337 = v199;
                  v338 = v200;
                  v336 = v198;
                  do
                  {
                    v201 = v182;
                    v202 = *(_OWORD *)v182;
                    v203 = *(_OWORD *)(v182 + 16);
                    v204 = *(_OWORD *)(v182 + 32);
                    *(_QWORD *)(v190 + 48) = *(_QWORD *)(v182 + 48);
                    *(_OWORD *)(v190 + 16) = v203;
                    *(_OWORD *)(v190 + 32) = v204;
                    *(_OWORD *)v190 = v202;
                    if (v303 < v181)
                      break;
                    v205 = (2 * v181) | 1;
                    v182 = a1 + 56 * v205;
                    if (2 * v181 + 2 < v12)
                    {
                      v206 = *a3;
                      v208 = *(_OWORD *)(v182 + 16);
                      v207 = *(_OWORD *)(v182 + 32);
                      v209 = *(_OWORD *)v182;
                      v335 = *(_QWORD *)(v182 + 48);
                      v333 = v208;
                      v334 = v207;
                      v332 = v209;
                      v210 = *(_OWORD *)(v182 + 72);
                      v211 = *(_OWORD *)(v182 + 88);
                      v212 = *(_OWORD *)(v182 + 56);
                      v331 = *(_QWORD *)(v182 + 104);
                      v329 = v210;
                      v330 = v211;
                      v328 = v212;
                      if (v206(&v332, &v328))
                      {
                        v182 += 56;
                        v205 = 2 * v181 + 2;
                      }
                    }
                    v213 = *a3;
                    v215 = *(_OWORD *)(v182 + 16);
                    v214 = *(_OWORD *)(v182 + 32);
                    v216 = *(_OWORD *)v182;
                    v327 = *(_QWORD *)(v182 + 48);
                    v325 = v215;
                    v326 = v214;
                    v324 = v216;
                    v320 = v336;
                    v321 = v337;
                    v322 = v338;
                    v323 = v339;
                    v190 = v201;
                    v181 = v205;
                  }
                  while (!v213(&v324, &v320));
                  v217 = v336;
                  v218 = v337;
                  v219 = v338;
                  *(_QWORD *)(v201 + 48) = v339;
                  *(_OWORD *)(v201 + 16) = v218;
                  *(_OWORD *)(v201 + 32) = v219;
                  *(_OWORD *)v201 = v217;
                }
              }
              v179 = v180 - 1;
            }
            while (v180);
            v220 = v11 / 0x38uLL;
            v221 = v300;
            do
            {
              v222 = 0;
              v223 = *(_OWORD *)a1;
              v224 = *(_OWORD *)(a1 + 16);
              v225 = *(_OWORD *)(a1 + 32);
              v335 = *(_QWORD *)(a1 + 48);
              v333 = v224;
              v334 = v225;
              v332 = v223;
              v226 = v220 - 2;
              v301 = v221;
              if (v220 < 2)
                v226 = v220 - 1;
              v227 = v226 >> 1;
              v228 = a1;
              do
              {
                v229 = v228 + 56 * v222 + 56;
                v230 = (2 * v222) | 1;
                v231 = 2 * v222 + 2;
                if (v231 < v220)
                {
                  v232 = *a3;
                  v234 = *(_OWORD *)(v229 + 16);
                  v233 = *(_OWORD *)(v229 + 32);
                  v235 = *(_OWORD *)v229;
                  v355 = *(_QWORD *)(v229 + 48);
                  v353 = v234;
                  v354 = v233;
                  v352 = v235;
                  v236 = *(_OWORD *)(v229 + 72);
                  v237 = *(_OWORD *)(v229 + 88);
                  v238 = *(_OWORD *)(v229 + 56);
                  v351 = *(_QWORD *)(v229 + 104);
                  v349 = v236;
                  v350 = v237;
                  v348 = v238;
                  if (v232(&v352, &v348))
                  {
                    v229 += 56;
                    v230 = v231;
                  }
                }
                v239 = *(_OWORD *)v229;
                v240 = *(_OWORD *)(v229 + 16);
                v241 = *(_OWORD *)(v229 + 32);
                *(_QWORD *)(v228 + 48) = *(_QWORD *)(v229 + 48);
                *(_OWORD *)(v228 + 16) = v240;
                *(_OWORD *)(v228 + 32) = v241;
                *(_OWORD *)v228 = v239;
                v228 = v229;
                v222 = v230;
              }
              while (v230 <= v227);
              v221 = (__int128 *)((char *)v301 - 56);
              if ((__int128 *)v229 == (__int128 *)((char *)v301 - 56))
              {
                v272 = v332;
                v273 = v333;
                v274 = v334;
                *(_QWORD *)(v229 + 48) = v335;
                *(_OWORD *)(v229 + 16) = v273;
                *(_OWORD *)(v229 + 32) = v274;
                *(_OWORD *)v229 = v272;
              }
              else
              {
                v242 = *v221;
                v243 = *(__int128 *)((char *)v301 - 40);
                v244 = *(__int128 *)((char *)v301 - 24);
                *(_QWORD *)(v229 + 48) = *((_QWORD *)v301 - 1);
                *(_OWORD *)(v229 + 16) = v243;
                *(_OWORD *)(v229 + 32) = v244;
                *(_OWORD *)v229 = v242;
                v245 = v332;
                v246 = v333;
                v247 = v334;
                *((_QWORD *)v301 - 1) = v335;
                *(__int128 *)((char *)v301 - 40) = v246;
                *(__int128 *)((char *)v301 - 24) = v247;
                *v221 = v245;
                v248 = v229 - a1 + 56;
                if (v248 >= 57)
                {
                  v249 = (unint64_t)(0x6DB6DB6DB6DB6DB7 * (v248 >> 3) - 2) >> 1;
                  v250 = a1 + 56 * v249;
                  v251 = *a3;
                  v253 = *(_OWORD *)(v250 + 16);
                  v252 = *(_OWORD *)(v250 + 32);
                  v254 = *(_OWORD *)v250;
                  v355 = *(_QWORD *)(v250 + 48);
                  v353 = v253;
                  v354 = v252;
                  v352 = v254;
                  v256 = *(_OWORD *)(v229 + 16);
                  v255 = *(_OWORD *)(v229 + 32);
                  v257 = *(_OWORD *)v229;
                  v351 = *(_QWORD *)(v229 + 48);
                  v349 = v256;
                  v350 = v255;
                  v348 = v257;
                  if (v251(&v352, &v348))
                  {
                    v258 = *(_OWORD *)v229;
                    v259 = *(_OWORD *)(v229 + 16);
                    v260 = *(_OWORD *)(v229 + 32);
                    v347 = *(_QWORD *)(v229 + 48);
                    v345 = v259;
                    v346 = v260;
                    v344 = v258;
                    do
                    {
                      v261 = v250;
                      v262 = *(_OWORD *)v250;
                      v263 = *(_OWORD *)(v250 + 16);
                      v264 = *(_OWORD *)(v250 + 32);
                      *(_QWORD *)(v229 + 48) = *(_QWORD *)(v250 + 48);
                      *(_OWORD *)(v229 + 16) = v263;
                      *(_OWORD *)(v229 + 32) = v264;
                      *(_OWORD *)v229 = v262;
                      if (!v249)
                        break;
                      v249 = (v249 - 1) >> 1;
                      v265 = *a3;
                      v250 = a1 + 56 * v249;
                      v267 = *(_OWORD *)(v250 + 16);
                      v266 = *(_OWORD *)(v250 + 32);
                      v268 = *(_OWORD *)v250;
                      v343 = *(_QWORD *)(v250 + 48);
                      v341 = v267;
                      v342 = v266;
                      v340 = v268;
                      v336 = v344;
                      v337 = v345;
                      v338 = v346;
                      v339 = v347;
                      v229 = v261;
                    }
                    while ((v265(&v340, &v336) & 1) != 0);
                    v269 = v344;
                    v270 = v345;
                    v271 = v346;
                    *(_QWORD *)(v261 + 48) = v347;
                    *(_OWORD *)(v261 + 16) = v270;
                    *(_OWORD *)(v261 + 32) = v271;
                    *(_OWORD *)v261 = v269;
                  }
                }
              }
            }
            while (v220-- > 2);
          }
          return;
        }
        v13 = (unint64_t)v12 >> 1;
        v14 = a1 + 56 * ((unint64_t)v12 >> 1);
        if ((unint64_t)v11 < 0x1C01)
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)v14, (__int128 *)a1, (__int128 *)v302, (uint64_t (**)(_QWORD, _QWORD))a3);
        }
        else
        {
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)a1, (__int128 *)v14, (__int128 *)v302, (uint64_t (**)(_QWORD, _QWORD))a3);
          v15 = 56 * v13;
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)(a1 + 56), (__int128 *)(v15 + a1 - 56), v299, (uint64_t (**)(_QWORD, _QWORD))a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)(a1 + 112), (__int128 *)(a1 + 56 + v15), v298, (uint64_t (**)(_QWORD, _QWORD))a3);
          std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)(v15 + a1 - 56), (__int128 *)v14, (__int128 *)(a1 + 56 + v15), (uint64_t (**)(_QWORD, _QWORD))a3);
          v16 = *(_OWORD *)a1;
          v17 = *(_OWORD *)(a1 + 16);
          v18 = *(_OWORD *)(a1 + 32);
          v355 = *(_QWORD *)(a1 + 48);
          v353 = v17;
          v354 = v18;
          v352 = v16;
          v19 = *(_OWORD *)v14;
          v20 = *(_OWORD *)(v14 + 16);
          v21 = *(_OWORD *)(v14 + 32);
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(v14 + 48);
          *(_OWORD *)(a1 + 16) = v20;
          *(_OWORD *)(a1 + 32) = v21;
          *(_OWORD *)a1 = v19;
          v22 = v352;
          v23 = v353;
          v24 = v354;
          *(_QWORD *)(v14 + 48) = v355;
          *(_OWORD *)(v14 + 16) = v23;
          *(_OWORD *)(v14 + 32) = v24;
          *(_OWORD *)v14 = v22;
        }
        --a4;
        if ((a5 & 1) == 0)
        {
          v25 = *a3;
          v26 = *(_OWORD *)(a1 - 40);
          v27 = *(_OWORD *)(a1 - 24);
          v28 = *(_OWORD *)(a1 - 56);
          v307 = *(_QWORD *)(a1 - 8);
          v306[1] = v26;
          v306[2] = v27;
          v306[0] = v28;
          v30 = *(_OWORD *)(a1 + 16);
          v29 = *(_OWORD *)(a1 + 32);
          v31 = *(_OWORD *)a1;
          v305 = *(_QWORD *)(a1 + 48);
          v304[1] = v30;
          v304[2] = v29;
          v304[0] = v31;
          if ((v25(v306, v304) & 1) == 0)
          {
            v81 = *(_OWORD *)a1;
            v82 = *(_OWORD *)(a1 + 16);
            v83 = *(_OWORD *)(a1 + 32);
            v351 = *(_QWORD *)(a1 + 48);
            v349 = v82;
            v350 = v83;
            v348 = v81;
            v84 = *a3;
            v86 = *(_OWORD *)(a1 + 16);
            v85 = *(_OWORD *)(a1 + 32);
            v87 = *(_OWORD *)a1;
            v347 = *(_QWORD *)(a1 + 48);
            v345 = v86;
            v346 = v85;
            v344 = v87;
            v88 = *(_QWORD *)(v302 + 48);
            v90 = *(_OWORD *)(v302 + 16);
            v89 = *(_OWORD *)(v302 + 32);
            v340 = *(_OWORD *)v302;
            v341 = v90;
            v342 = v89;
            v343 = v88;
            if ((v84(&v344, &v340) & 1) != 0)
            {
              v91 = a1;
              do
              {
                v10 = v91 + 56;
                v92 = *a3;
                v336 = v348;
                v337 = v349;
                v338 = v350;
                v339 = v351;
                v93 = *(_OWORD *)(v91 + 72);
                v94 = *(_OWORD *)(v91 + 88);
                v95 = *(_OWORD *)(v91 + 56);
                v335 = *(_QWORD *)(v91 + 104);
                v333 = v93;
                v334 = v94;
                v332 = v95;
                v96 = v92(&v336, &v332);
                v91 = v10;
              }
              while ((v96 & 1) == 0);
            }
            else
            {
              v97 = a1 + 56;
              do
              {
                v10 = v97;
                if (v97 >= a2)
                  break;
                v98 = *a3;
                v336 = v348;
                v337 = v349;
                v338 = v350;
                v339 = v351;
                v100 = *(_OWORD *)(v10 + 16);
                v99 = *(_OWORD *)(v10 + 32);
                v101 = *(_OWORD *)v10;
                v335 = *(_QWORD *)(v10 + 48);
                v333 = v100;
                v334 = v99;
                v332 = v101;
                v102 = v98(&v336, &v332);
                v97 = v10 + 56;
              }
              while (!v102);
            }
            v103 = a2;
            if (v10 < a2)
            {
              v104 = a2;
              do
              {
                v103 = v104 - 56;
                v105 = *a3;
                v328 = v348;
                v329 = v349;
                v330 = v350;
                v331 = v351;
                v106 = *(_OWORD *)(v104 - 40);
                v107 = *(_OWORD *)(v104 - 24);
                v108 = *(_OWORD *)(v104 - 56);
                v327 = *(_QWORD *)(v104 - 8);
                v325 = v106;
                v326 = v107;
                v324 = v108;
                v109 = v105(&v328, &v324);
                v104 = v103;
              }
              while ((v109 & 1) != 0);
            }
            while (v10 < v103)
            {
              v110 = *(_OWORD *)v10;
              v111 = *(_OWORD *)(v10 + 16);
              v112 = *(_OWORD *)(v10 + 32);
              v355 = *(_QWORD *)(v10 + 48);
              v353 = v111;
              v354 = v112;
              v352 = v110;
              v113 = *(_OWORD *)v103;
              v114 = *(_OWORD *)(v103 + 16);
              v115 = *(_OWORD *)(v103 + 32);
              *(_QWORD *)(v10 + 48) = *(_QWORD *)(v103 + 48);
              *(_OWORD *)(v10 + 16) = v114;
              *(_OWORD *)(v10 + 32) = v115;
              *(_OWORD *)v10 = v113;
              v116 = v352;
              v117 = v353;
              v118 = v354;
              *(_QWORD *)(v103 + 48) = v355;
              *(_OWORD *)(v103 + 16) = v117;
              *(_OWORD *)(v103 + 32) = v118;
              *(_OWORD *)v103 = v116;
              do
              {
                v320 = v348;
                v321 = v349;
                v322 = v350;
                v323 = v351;
                v119 = *(_OWORD *)(v10 + 72);
                v120 = *(_OWORD *)(v10 + 88);
                v121 = *(_QWORD *)(v10 + 104);
                v122 = *(_OWORD *)(v10 + 56);
                v10 += 56;
                v123 = *a3;
                v319 = v121;
                v317 = v119;
                v318 = v120;
                v316 = v122;
              }
              while (!v123(&v320, &v316));
              do
              {
                v314[0] = v348;
                v314[1] = v349;
                v314[2] = v350;
                v315 = v351;
                v124 = *(_OWORD *)(v103 - 40);
                v125 = *(_OWORD *)(v103 - 24);
                v126 = *(_QWORD *)(v103 - 8);
                v127 = *(_OWORD *)(v103 - 56);
                v103 -= 56;
                v128 = *a3;
                v313 = v126;
                v312[1] = v124;
                v312[2] = v125;
                v312[0] = v127;
              }
              while ((v128(v314, v312) & 1) != 0);
            }
            v129 = (__int128 *)(v10 - 56);
            if (v10 - 56 != a1)
            {
              v130 = *v129;
              v131 = *(_OWORD *)(v10 - 40);
              v132 = *(_OWORD *)(v10 - 24);
              *(_QWORD *)(a1 + 48) = *(_QWORD *)(v10 - 8);
              *(_OWORD *)(a1 + 16) = v131;
              *(_OWORD *)(a1 + 32) = v132;
              *(_OWORD *)a1 = v130;
            }
            a5 = 0;
            v133 = v348;
            v134 = v349;
            v135 = v350;
            *(_QWORD *)(v10 - 8) = v351;
            *(_OWORD *)(v10 - 40) = v134;
            *(_OWORD *)(v10 - 24) = v135;
            *v129 = v133;
            continue;
          }
        }
        v32 = *(_OWORD *)a1;
        v33 = *(_OWORD *)(a1 + 16);
        v34 = *(_OWORD *)(a1 + 32);
        v351 = *(_QWORD *)(a1 + 48);
        v349 = v33;
        v350 = v34;
        v348 = v32;
        v35 = a1;
        do
        {
          v36 = v35;
          v37 = *a3;
          v35 += 56;
          v38 = *(_OWORD *)(v36 + 72);
          v39 = *(_OWORD *)(v36 + 88);
          v40 = *(_OWORD *)(v36 + 56);
          v347 = *(_QWORD *)(v36 + 104);
          v345 = v38;
          v346 = v39;
          v344 = v40;
          v340 = v348;
          v341 = v349;
          v342 = v350;
          v343 = v351;
        }
        while ((v37(&v344, &v340) & 1) != 0);
        v41 = a2;
        v42 = a2;
        if (v36 == a1)
        {
          v49 = a2;
          while (v35 < v49)
          {
            v50 = *a3;
            v43 = v49 - 56;
            v51 = *(_OWORD *)(v49 - 40);
            v52 = *(_OWORD *)(v49 - 24);
            v53 = *(_OWORD *)(v49 - 56);
            v339 = *(_QWORD *)(v49 - 8);
            v337 = v51;
            v338 = v52;
            v336 = v53;
            v332 = v348;
            v333 = v349;
            v334 = v350;
            v335 = v351;
            v54 = v50(&v336, &v332);
            v49 = v43;
            if ((v54 & 1) != 0)
              goto LABEL_20;
          }
          v43 = v49;
        }
        else
        {
          do
          {
            v43 = v42 - 56;
            v44 = *a3;
            v45 = *(_OWORD *)(v42 - 40);
            v46 = *(_OWORD *)(v42 - 24);
            v47 = *(_OWORD *)(v42 - 56);
            v339 = *(_QWORD *)(v42 - 8);
            v337 = v45;
            v338 = v46;
            v336 = v47;
            v332 = v348;
            v333 = v349;
            v334 = v350;
            v335 = v351;
            v48 = v44(&v336, &v332);
            v42 = v43;
          }
          while (!v48);
        }
LABEL_20:
        if (v35 < v43)
        {
          v55 = v35;
          v56 = v43;
          do
          {
            v58 = *(_OWORD *)(v55 + 16);
            v352 = *(_OWORD *)v55;
            v57 = v352;
            v353 = v58;
            v354 = *(_OWORD *)(v55 + 32);
            v59 = v354;
            v355 = *(_QWORD *)(v55 + 48);
            v60 = v355;
            v61 = *(_QWORD *)(v56 + 48);
            v63 = *(_OWORD *)(v56 + 16);
            v62 = *(_OWORD *)(v56 + 32);
            *(_OWORD *)v55 = *(_OWORD *)v56;
            *(_OWORD *)(v55 + 16) = v63;
            *(_OWORD *)(v55 + 32) = v62;
            *(_QWORD *)(v55 + 48) = v61;
            *(_OWORD *)(v56 + 16) = v58;
            *(_OWORD *)(v56 + 32) = v59;
            *(_QWORD *)(v56 + 48) = v60;
            *(_OWORD *)v56 = v57;
            do
            {
              v36 = v55;
              v64 = *a3;
              v55 += 56;
              v65 = *(_OWORD *)(v36 + 72);
              v66 = *(_OWORD *)(v36 + 88);
              v67 = *(_OWORD *)(v36 + 56);
              v331 = *(_QWORD *)(v36 + 104);
              v329 = v65;
              v330 = v66;
              v328 = v67;
              v324 = v348;
              v325 = v349;
              v326 = v350;
              v327 = v351;
            }
            while ((v64(&v328, &v324) & 1) != 0);
            do
            {
              v68 = *(_OWORD *)(v56 - 40);
              v69 = *(_OWORD *)(v56 - 24);
              v70 = *(_QWORD *)(v56 - 8);
              v71 = *(_OWORD *)(v56 - 56);
              v56 -= 56;
              v72 = *a3;
              v323 = v70;
              v321 = v68;
              v322 = v69;
              v320 = v71;
              v316 = v348;
              v317 = v349;
              v318 = v350;
              v319 = v351;
            }
            while (!v72(&v320, &v316));
          }
          while (v55 < v56);
        }
        if (v36 != a1)
        {
          v73 = *(_OWORD *)v36;
          v74 = *(_OWORD *)(v36 + 16);
          v75 = *(_OWORD *)(v36 + 32);
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(v36 + 48);
          *(_OWORD *)(a1 + 16) = v74;
          *(_OWORD *)(a1 + 32) = v75;
          *(_OWORD *)a1 = v73;
        }
        v76 = v348;
        v77 = v349;
        v78 = v350;
        *(_QWORD *)(v36 + 48) = v351;
        *(_OWORD *)(v36 + 16) = v77;
        *(_OWORD *)(v36 + 32) = v78;
        *(_OWORD *)v36 = v76;
        v79 = v35 >= v43;
        a2 = v41;
        if (!v79)
        {
LABEL_32:
          std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(a1, v36, a3, a4, a5 & 1);
          a5 = 0;
          v10 = v36 + 56;
          continue;
        }
        v80 = std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, v36, (uint64_t (**)(_QWORD, _QWORD))a3);
        v10 = v36 + 56;
        if (!std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(v36 + 56, v41, (uint64_t (**)(_QWORD, _QWORD))a3))
        {
          if (v80)
            continue;
          goto LABEL_32;
        }
        a2 = v36;
        if (!v80)
          goto LABEL_1;
        return;
    }
  }
}

void std::vector<ITColor>::__throw_length_error[abi:ne180100]()
{
  std::__throw_length_error[abi:ne180100]("vector");
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<ITColor>>(unint64_t a1)
{
  if (a1 >> 59)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(32 * a1);
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<double>>(unint64_t a1)
{
  if (a1 >> 61)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(8 * a1);
}

void std::__throw_bad_array_new_length[abi:ne180100]()
{
  std::bad_array_new_length *exception;
  std::bad_array_new_length *v1;

  exception = (std::bad_array_new_length *)__cxa_allocate_exception(8uLL);
  v1 = std::bad_array_new_length::bad_array_new_length(exception);
  __cxa_throw(v1, MEMORY[0x1E0DE4E98], MEMORY[0x1E0DE4390]);
}

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(_OWORD *a1, _OWORD *a2, _OWORD *a3, uint64_t (**a4)(_QWORD, _QWORD))
{
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  char v13;
  uint64_t (*v14)(_QWORD, _QWORD);
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t result;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  uint64_t (*v38)(_QWORD, _QWORD);
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  uint64_t (*v59)(_QWORD, _QWORD);
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  __int128 v64;
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  _OWORD v69[4];
  _OWORD v70[4];
  _OWORD v71[4];
  _OWORD v72[4];
  _OWORD v73[4];
  _OWORD v74[4];
  _OWORD v75[4];
  _OWORD v76[4];
  _OWORD v77[4];
  _OWORD v78[24];

  v8 = *a4;
  v9 = a2[1];
  v78[0] = *a2;
  v78[1] = v9;
  v10 = a2[3];
  v78[2] = a2[2];
  v78[3] = v10;
  v11 = a1[1];
  v77[0] = *a1;
  v77[1] = v11;
  v12 = a1[3];
  v77[2] = a1[2];
  v77[3] = v12;
  v13 = v8(v78, v77);
  v14 = *a4;
  if ((v13 & 1) != 0)
  {
    v15 = a3[1];
    v72[0] = *a3;
    v72[1] = v15;
    v16 = a3[3];
    v72[2] = a3[2];
    v72[3] = v16;
    v17 = a2[1];
    v71[0] = *a2;
    v71[1] = v17;
    v18 = a2[3];
    v71[2] = a2[2];
    v71[3] = v18;
    result = v14(v72, v71);
    if ((_DWORD)result)
    {
      v21 = a1[2];
      v20 = a1[3];
      v23 = *a1;
      v22 = a1[1];
      v24 = a3[3];
      v26 = *a3;
      v25 = a3[1];
      a1[2] = a3[2];
      a1[3] = v24;
      *a1 = v26;
      a1[1] = v25;
    }
    else
    {
      v53 = a1[2];
      v52 = a1[3];
      v55 = *a1;
      v54 = a1[1];
      v56 = a2[3];
      v58 = *a2;
      v57 = a2[1];
      a1[2] = a2[2];
      a1[3] = v56;
      *a1 = v58;
      a1[1] = v57;
      *a2 = v55;
      a2[1] = v54;
      a2[2] = v53;
      a2[3] = v52;
      v59 = *a4;
      v60 = *a3;
      v61 = a3[1];
      v62 = a3[3];
      v70[2] = a3[2];
      v70[3] = v62;
      v70[0] = v60;
      v70[1] = v61;
      v63 = *a2;
      v64 = a2[1];
      v65 = a2[3];
      v69[2] = a2[2];
      v69[3] = v65;
      v69[0] = v63;
      v69[1] = v64;
      result = v59(v70, v69);
      if (!(_DWORD)result)
        return result;
      v21 = a2[2];
      v20 = a2[3];
      v23 = *a2;
      v22 = a2[1];
      v66 = a3[3];
      v68 = *a3;
      v67 = a3[1];
      a2[2] = a3[2];
      a2[3] = v66;
      *a2 = v68;
      a2[1] = v67;
    }
    *a3 = v23;
    a3[1] = v22;
    a3[2] = v21;
    a3[3] = v20;
  }
  else
  {
    v27 = a3[1];
    v76[0] = *a3;
    v76[1] = v27;
    v28 = a3[3];
    v76[2] = a3[2];
    v76[3] = v28;
    v29 = a2[1];
    v75[0] = *a2;
    v75[1] = v29;
    v30 = a2[3];
    v75[2] = a2[2];
    v75[3] = v30;
    result = v14(v76, v75);
    if ((_DWORD)result)
    {
      v32 = a2[2];
      v31 = a2[3];
      v34 = *a2;
      v33 = a2[1];
      v35 = a3[3];
      v37 = *a3;
      v36 = a3[1];
      a2[2] = a3[2];
      a2[3] = v35;
      *a2 = v37;
      a2[1] = v36;
      *a3 = v34;
      a3[1] = v33;
      a3[2] = v32;
      a3[3] = v31;
      v38 = *a4;
      v39 = *a2;
      v40 = a2[1];
      v41 = a2[3];
      v74[2] = a2[2];
      v74[3] = v41;
      v74[0] = v39;
      v74[1] = v40;
      v42 = *a1;
      v43 = a1[1];
      v44 = a1[3];
      v73[2] = a1[2];
      v73[3] = v44;
      v73[0] = v42;
      v73[1] = v43;
      result = v38(v74, v73);
      if ((_DWORD)result)
      {
        v46 = a1[2];
        v45 = a1[3];
        v48 = *a1;
        v47 = a1[1];
        v49 = a2[3];
        v51 = *a2;
        v50 = a2[1];
        a1[2] = a2[2];
        a1[3] = v49;
        *a1 = v51;
        a1[1] = v50;
        *a2 = v48;
        a2[1] = v47;
        a2[2] = v46;
        a2[3] = v45;
      }
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(__n128 *a1, __n128 *a2, __n128 *a3, __n128 *a4, uint64_t (**a5)(_QWORD, _QWORD))
{
  uint64_t (*v10)(_QWORD, _QWORD);
  __n128 v11;
  __n128 v12;
  __n128 v13;
  __n128 v14;
  __n128 result;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  uint64_t (*v23)(_QWORD, _QWORD);
  __n128 v24;
  __n128 v25;
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  uint64_t (*v37)(_QWORD, _QWORD);
  __n128 v38;
  __n128 v39;
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[4];
  _OWORD v53[4];
  _OWORD v54[4];
  _OWORD v55[16];

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, a2, a3, a5);
  v10 = *a5;
  v11 = a4[1];
  v55[0] = *a4;
  v55[1] = v11;
  v12 = a4[3];
  v55[2] = a4[2];
  v55[3] = v12;
  v13 = a3[1];
  v54[0] = *a3;
  v54[1] = v13;
  v14 = a3[3];
  v54[2] = a3[2];
  v54[3] = v14;
  if (v10(v55, v54))
  {
    v17 = a3[2];
    v16 = a3[3];
    v19 = *a3;
    v18 = a3[1];
    v20 = a4[3];
    v22 = *a4;
    v21 = a4[1];
    a3[2] = a4[2];
    a3[3] = v20;
    *a3 = v22;
    a3[1] = v21;
    *a4 = v19;
    a4[1] = v18;
    a4[2] = v17;
    a4[3] = v16;
    v23 = *a5;
    v24 = *a3;
    v25 = a3[1];
    v26 = a3[3];
    v53[2] = a3[2];
    v53[3] = v26;
    v53[0] = v24;
    v53[1] = v25;
    v27 = *a2;
    v28 = a2[1];
    v29 = a2[3];
    v52[2] = a2[2];
    v52[3] = v29;
    v52[0] = v27;
    v52[1] = v28;
    if (v23(v53, v52))
    {
      v31 = a2[2];
      v30 = a2[3];
      v33 = *a2;
      v32 = a2[1];
      v34 = a3[3];
      v36 = *a3;
      v35 = a3[1];
      a2[2] = a3[2];
      a2[3] = v34;
      *a2 = v36;
      a2[1] = v35;
      *a3 = v33;
      a3[1] = v32;
      a3[2] = v31;
      a3[3] = v30;
      v37 = *a5;
      v38 = *a2;
      v39 = a2[1];
      v40 = a2[3];
      v51[2] = a2[2];
      v51[3] = v40;
      v51[0] = v38;
      v51[1] = v39;
      v41 = *a1;
      v42 = a1[1];
      v43 = a1[3];
      v50[2] = a1[2];
      v50[3] = v43;
      v50[0] = v41;
      v50[1] = v42;
      if (v37(v51, v50))
      {
        v44 = a1[2];
        result = a1[3];
        v46 = *a1;
        v45 = a1[1];
        v47 = a2[3];
        v49 = *a2;
        v48 = a2[1];
        a1[2] = a2[2];
        a1[3] = v47;
        *a1 = v49;
        a1[1] = v48;
        *a2 = v46;
        a2[1] = v45;
        a2[2] = v44;
        a2[3] = result;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, __n128 *a3, __n128 *a4, __n128 *a5, uint64_t (**a6)(_QWORD, _QWORD))
{
  uint64_t (*v12)(_QWORD, _QWORD);
  __n128 v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 result;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 v21;
  __n128 v22;
  __n128 v23;
  __n128 v24;
  uint64_t (*v25)(_QWORD, _QWORD);
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  __n128 v33;
  __n128 v34;
  __n128 v35;
  __n128 v36;
  __n128 v37;
  __n128 v38;
  uint64_t (*v39)(_QWORD, _QWORD);
  __n128 v40;
  __n128 v41;
  __n128 v42;
  __n128 v43;
  __n128 v44;
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  __n128 v49;
  __n128 v50;
  __n128 v51;
  __n128 v52;
  uint64_t (*v53)(_QWORD, _QWORD);
  __n128 v54;
  __n128 v55;
  __n128 v56;
  __n128 v57;
  __int128 v58;
  __int128 v59;
  __n128 v60;
  __n128 v61;
  __n128 v62;
  __n128 v63;
  __n128 v64;
  __n128 v65;
  _OWORD v66[4];
  _OWORD v67[4];
  _OWORD v68[4];
  _OWORD v69[4];
  _OWORD v70[4];
  _OWORD v71[4];
  _OWORD v72[4];
  _OWORD v73[20];

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, a2, a3, a4, a6);
  v12 = *a6;
  v13 = a5[1];
  v73[0] = *a5;
  v73[1] = v13;
  v14 = a5[3];
  v73[2] = a5[2];
  v73[3] = v14;
  v15 = a4[1];
  v72[0] = *a4;
  v72[1] = v15;
  v16 = a4[3];
  v72[2] = a4[2];
  v72[3] = v16;
  if (v12(v73, v72))
  {
    v19 = a4[2];
    v18 = a4[3];
    v21 = *a4;
    v20 = a4[1];
    v22 = a5[3];
    v24 = *a5;
    v23 = a5[1];
    a4[2] = a5[2];
    a4[3] = v22;
    *a4 = v24;
    a4[1] = v23;
    *a5 = v21;
    a5[1] = v20;
    a5[2] = v19;
    a5[3] = v18;
    v25 = *a6;
    v26 = *a4;
    v27 = a4[1];
    v28 = a4[3];
    v71[2] = a4[2];
    v71[3] = v28;
    v71[0] = v26;
    v71[1] = v27;
    v29 = *a3;
    v30 = a3[1];
    v31 = a3[3];
    v70[2] = a3[2];
    v70[3] = v31;
    v70[0] = v29;
    v70[1] = v30;
    if (v25(v71, v70))
    {
      v33 = a3[2];
      v32 = a3[3];
      v35 = *a3;
      v34 = a3[1];
      v36 = a4[3];
      v38 = *a4;
      v37 = a4[1];
      a3[2] = a4[2];
      a3[3] = v36;
      *a3 = v38;
      a3[1] = v37;
      *a4 = v35;
      a4[1] = v34;
      a4[2] = v33;
      a4[3] = v32;
      v39 = *a6;
      v40 = *a3;
      v41 = a3[1];
      v42 = a3[3];
      v69[2] = a3[2];
      v69[3] = v42;
      v69[0] = v40;
      v69[1] = v41;
      v43 = *a2;
      v44 = a2[1];
      v45 = a2[3];
      v68[2] = a2[2];
      v68[3] = v45;
      v68[0] = v43;
      v68[1] = v44;
      if (v39(v69, v68))
      {
        v47 = a2[2];
        v46 = a2[3];
        v49 = *a2;
        v48 = a2[1];
        v50 = a3[3];
        v52 = *a3;
        v51 = a3[1];
        a2[2] = a3[2];
        a2[3] = v50;
        *a2 = v52;
        a2[1] = v51;
        *a3 = v49;
        a3[1] = v48;
        a3[2] = v47;
        a3[3] = v46;
        v53 = *a6;
        v54 = *a2;
        v55 = a2[1];
        v56 = a2[3];
        v67[2] = a2[2];
        v67[3] = v56;
        v67[0] = v54;
        v67[1] = v55;
        v57 = *(__n128 *)a1;
        v58 = *(_OWORD *)(a1 + 16);
        v59 = *(_OWORD *)(a1 + 48);
        v66[2] = *(_OWORD *)(a1 + 32);
        v66[3] = v59;
        v66[0] = v57;
        v66[1] = v58;
        if (v53(v67, v66))
        {
          v60 = *(__n128 *)(a1 + 32);
          result = *(__n128 *)(a1 + 48);
          v62 = *(__n128 *)a1;
          v61 = *(__n128 *)(a1 + 16);
          v63 = a2[3];
          v65 = *a2;
          v64 = a2[1];
          *(__n128 *)(a1 + 32) = a2[2];
          *(__n128 *)(a1 + 48) = v63;
          *(__n128 *)a1 = v65;
          *(__n128 *)(a1 + 16) = v64;
          *a2 = v62;
          a2[1] = v61;
          a2[2] = v60;
          a2[3] = result;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(uint64_t a1, __n128 *a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t (*v8)(_QWORD, _QWORD);
  __n128 v9;
  __n128 v10;
  __int128 v11;
  __int128 v12;
  __n128 *v13;
  __n128 v14;
  __n128 v15;
  __n128 v16;
  __n128 v17;
  __n128 v18;
  __n128 v19;
  __n128 v20;
  __n128 *v21;
  __n128 *v22;
  uint64_t v23;
  int v24;
  uint64_t (*v25)(_QWORD, _QWORD);
  __n128 v26;
  __n128 v27;
  __n128 v28;
  __n128 v29;
  __n128 v30;
  __n128 v31;
  __n128 v32;
  uint64_t v33;
  _OWORD *v34;
  __int128 v35;
  __int128 v36;
  uint64_t (*v37)(_QWORD, _QWORD);
  __int128 v38;
  __int128 v39;
  _OWORD *v40;
  __n128 v41;
  __n128 v42;
  _OWORD v43[4];
  _OWORD v44[4];
  __n128 v45;
  __n128 v46;
  __n128 v47;
  __n128 v48;
  _OWORD v49[4];
  _OWORD v50[4];
  _OWORD v51[4];
  _OWORD v52[8];

  v6 = ((uint64_t)a2 - a1) >> 6;
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a3;
      v9 = a2[-3];
      v52[0] = a2[-4];
      v52[1] = v9;
      v10 = a2[-1];
      v52[2] = a2[-2];
      v52[3] = v10;
      v11 = *(_OWORD *)(a1 + 16);
      v51[0] = *(_OWORD *)a1;
      v51[1] = v11;
      v12 = *(_OWORD *)(a1 + 48);
      v51[2] = *(_OWORD *)(a1 + 32);
      v51[3] = v12;
      if (!v8(v52, v51))
        return 1;
      v13 = a2 - 4;
      v15 = *(__n128 *)(a1 + 32);
      v14 = *(__n128 *)(a1 + 48);
      v17 = *(__n128 *)a1;
      v16 = *(__n128 *)(a1 + 16);
      v18 = a2[-1];
      v20 = a2[-4];
      v19 = a2[-3];
      *(__n128 *)(a1 + 32) = a2[-2];
      *(__n128 *)(a1 + 48) = v18;
      *(__n128 *)a1 = v20;
      *(__n128 *)(a1 + 16) = v19;
      *v13 = v17;
      v13[1] = v16;
      result = 1;
      v13[2] = v15;
      v13[3] = v14;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (__n128 *)a2[-4].n128_u64, a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((__n128 *)a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), a2 - 4, a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>(a1, (__n128 *)(a1 + 64), (__n128 *)(a1 + 128), (__n128 *)(a1 + 192), a2 - 4, a3);
      return 1;
    default:
      v21 = (__n128 *)(a1 + 128);
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortColorEntry,sortColorEntry),sortColorEntry*>((_OWORD *)a1, (_OWORD *)(a1 + 64), (_OWORD *)(a1 + 128), a3);
      v22 = (__n128 *)(a1 + 192);
      if ((__n128 *)(a1 + 192) == a2)
        return 1;
      v23 = 0;
      v24 = 0;
      break;
  }
  while (1)
  {
    v25 = *a3;
    v26 = v22[1];
    v50[0] = *v22;
    v50[1] = v26;
    v27 = v22[3];
    v50[2] = v22[2];
    v50[3] = v27;
    v28 = v21[3];
    v30 = *v21;
    v29 = v21[1];
    v49[2] = v21[2];
    v49[3] = v28;
    v49[0] = v30;
    v49[1] = v29;
    if (v25(v50, v49))
    {
      v31 = v22[1];
      v45 = *v22;
      v46 = v31;
      v32 = v22[3];
      v47 = v22[2];
      v48 = v32;
      v33 = v23;
      while (1)
      {
        v34 = (_OWORD *)(a1 + v33);
        v35 = *(_OWORD *)(a1 + v33 + 144);
        v34[12] = *(_OWORD *)(a1 + v33 + 128);
        v34[13] = v35;
        v36 = *(_OWORD *)(a1 + v33 + 176);
        v34[14] = *(_OWORD *)(a1 + v33 + 160);
        v34[15] = v36;
        if (v33 == -128)
          break;
        v37 = *a3;
        v44[0] = v45;
        v44[1] = v46;
        v44[2] = v47;
        v44[3] = v48;
        v38 = v34[5];
        v43[0] = v34[4];
        v43[1] = v38;
        v39 = v34[7];
        v43[2] = v34[6];
        v43[3] = v39;
        v33 -= 64;
        if ((v37(v44, v43) & 1) == 0)
        {
          v40 = (_OWORD *)(a1 + v33 + 192);
          goto LABEL_12;
        }
      }
      v40 = (_OWORD *)a1;
LABEL_12:
      v41 = v46;
      *v40 = v45;
      v40[1] = v41;
      v42 = v48;
      v40[2] = v47;
      v40[3] = v42;
      if (++v24 == 8)
        return &v22[4] == a2;
    }
    v21 = v22;
    v23 += 64;
    v22 += 4;
    if (v22 == a2)
      return 1;
  }
}

uint64_t isCloseToColor(ITColor *a1, double *a2, int a3, double a4)
{
  double var1;
  double v8;
  __n128 v9;
  double v10;
  double v11;
  unint64_t v12;
  ITColor *v13;
  __n128 v14;
  unint64_t v15;
  ITColor *v16;
  double v17;
  double v18;
  double v19;
  ITColor *v20;
  double v21;
  double v22;
  double var0;
  double v24;
  __n128 v26;

  var1 = a1->var1;
  if (!a3)
    goto LABEL_13;
  if (var1 >= 0.0500000007 || (v8 = a2[1], v8 >= 0.0500000007))
  {
    if (a1->var3 >= 0.0149999997 || a2[3] >= 0.0149999997)
      goto LABEL_13;
    v8 = a2[1];
  }
  v9.n128_f64[0] = ITColor::CreateFromHSVDoubles(a1, a1->var0, a1->var1, a1->var2);
  v11 = v10;
  v9.n128_u64[1] = v12;
  v26 = v9;
  v14.n128_f64[0] = ITColor::CreateFromHSVDoubles(v13, *a2, v8, a2[2]);
  v14.n128_u64[1] = v15;
  ITColor::GetLuminance(v16, v14, v17);
  v19 = v18;
  ITColor::GetLuminance(v20, v26, v11);
  if (v21 <= v19)
    v22 = v19;
  else
    v22 = v21;
  if (v21 > v19)
    v21 = v19;
  if ((v22 + 0.0500000007) / (v21 + 0.0500000007) <= 1.65999997)
    return 1;
LABEL_13:
  if (vabdd_f64(var1, a2[1]) <= a4 && vabdd_f64(a1->var2, a2[2]) <= a4)
  {
    var0 = a1->var0;
    v24 = *a2;
    if (vabdd_f64(a1->var0, *a2) <= a4)
      return 1;
    if (var0 < a4)
      var0 = var0 + 1.0;
    if (v24 < a4)
      v24 = v24 + 1.0;
    if (vabdd_f64(var0, v24) <= a4)
      return 1;
  }
  return 0;
}

double ImageAnalyzer::WeightForPointOnEdge(ImageAnalyzer *this, unint64_t a2)
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double result;

  v2 = (double)(unint64_t)this;
  if ((unint64_t)this <= 4 && a2 <= 4)
  {
    v3 = (double)a2;
    v4 = 4.00000006 - v2;
    goto LABEL_4;
  }
  if ((unint64_t)this > 4)
  {
    if ((unint64_t)this >= 0x10 && a2 <= 4)
    {
      v3 = (double)a2;
      v4 = 15.9999999 - v2;
LABEL_4:
      v5 = 4.00000006 - v3;
      if (v4 >= 1.0)
        v6 = v4 * 0.75;
      else
        v6 = 0.75;
      if (v5 >= 1.0)
        v7 = v5 * 0.75;
      else
        v7 = 0.75;
      if (v7 <= v6)
        v7 = v6;
      goto LABEL_22;
    }
    v7 = 1.0;
    if ((unint64_t)this < 0x10)
      goto LABEL_22;
    v8 = 15.9999999;
  }
  else
  {
    v8 = 4.00000006;
  }
  v9 = v8 - v2;
  v7 = 0.75;
  if (v9 >= 1.0)
    v7 = v9 * 0.75;
LABEL_22:
  result = 1.0;
  if (v7 >= 1.0)
    return v7;
  return result;
}

void *std::__allocate_at_least[abi:ne180100]<std::allocator<sortQuantizeColorEntry>>(unint64_t a1)
{
  if (a1 >= 0x492492492492493)
    std::__throw_bad_array_new_length[abi:ne180100]();
  return operator new(56 * a1);
}

BOOL CompareQuantizeSortcolor(uint64_t a1, uint64_t a2)
{
  return *(double *)(a1 + 48) > *(double *)(a2 + 48);
}

void std::__introsort<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*,false>(uint64_t a1, unint64_t a2, uint64_t (**a3)(__int128 *, __int128 *), uint64_t a4, char a5)
{
  unint64_t v10;
  uint64_t v11;
  uint64_t v12;
  unint64_t v13;
  unint64_t v14;
  uint64_t v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t (*v25)(__int128 *, __int128 *);
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  unint64_t v35;
  uint64_t v36;
  uint64_t (*v37)(__int128 *, __int128 *);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  uint64_t v41;
  unint64_t v42;
  unint64_t v43;
  uint64_t (*v44)(__int128 *, __int128 *);
  __int128 v45;
  __int128 v46;
  __int128 v47;
  int v48;
  unint64_t v49;
  uint64_t (*v50)(__int128 *, __int128 *);
  __int128 v51;
  __int128 v52;
  __int128 v53;
  char v54;
  unint64_t v55;
  unint64_t v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  uint64_t v60;
  uint64_t v61;
  __int128 v62;
  __int128 v63;
  uint64_t (*v64)(__int128 *, __int128 *);
  __int128 v65;
  __int128 v66;
  __int128 v67;
  __int128 v68;
  __int128 v69;
  uint64_t v70;
  __int128 v71;
  uint64_t (*v72)(__int128 *, __int128 *);
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  BOOL v79;
  BOOL v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t (*v84)(__int128 *, __int128 *);
  __int128 v85;
  __int128 v86;
  __int128 v87;
  uint64_t v88;
  __int128 v89;
  __int128 v90;
  uint64_t v91;
  uint64_t (*v92)(__int128 *, __int128 *);
  __int128 v93;
  __int128 v94;
  __int128 v95;
  char v96;
  unint64_t v97;
  uint64_t (*v98)(__int128 *, __int128 *);
  __int128 v99;
  __int128 v100;
  __int128 v101;
  int v102;
  unint64_t v103;
  unint64_t v104;
  uint64_t (*v105)(__int128 *, __int128 *);
  __int128 v106;
  __int128 v107;
  __int128 v108;
  char v109;
  __int128 v110;
  __int128 v111;
  __int128 v112;
  __int128 v113;
  __int128 v114;
  __int128 v115;
  __int128 v116;
  __int128 v117;
  __int128 v118;
  __int128 v119;
  __int128 v120;
  uint64_t v121;
  __int128 v122;
  uint64_t (*v123)(__int128 *, __int128 *);
  __int128 v124;
  __int128 v125;
  uint64_t v126;
  __int128 v127;
  uint64_t (*v128)(__int128 *, __int128 *);
  __int128 *v129;
  __int128 v130;
  __int128 v131;
  __int128 v132;
  __int128 v133;
  __int128 v134;
  __int128 v135;
  uint64_t (*v136)(__int128 *, __int128 *);
  __int128 v137;
  __int128 v138;
  __int128 v139;
  __int128 v140;
  __int128 v141;
  __int128 v142;
  __int128 v143;
  __int128 v144;
  __int128 v145;
  __int128 v146;
  __int128 v147;
  __int128 v148;
  __int128 v149;
  __int128 v150;
  __int128 v151;
  uint64_t v152;
  BOOL v154;
  uint64_t v155;
  uint64_t v156;
  uint64_t v157;
  uint64_t (*v158)(__int128 *, __int128 *);
  __int128 v159;
  __int128 v160;
  __int128 v161;
  __int128 v162;
  __int128 v163;
  __int128 v164;
  __int128 v165;
  __int128 v166;
  __int128 v167;
  uint64_t v168;
  uint64_t v169;
  __int128 v170;
  uint64_t (*v171)(__int128 *, __int128 *);
  __int128 v172;
  __int128 v173;
  __int128 v174;
  uint64_t v175;
  __int128 v176;
  __int128 v177;
  __int128 v178;
  int64_t v179;
  int64_t v180;
  uint64_t v181;
  uint64_t v182;
  uint64_t (*v183)(__int128 *, __int128 *);
  __int128 v184;
  __int128 v185;
  __int128 v186;
  __int128 v187;
  __int128 v188;
  __int128 v189;
  uint64_t v190;
  uint64_t (*v191)(__int128 *, __int128 *);
  __int128 v192;
  __int128 v193;
  __int128 v194;
  __int128 v195;
  __int128 v196;
  __int128 v197;
  __int128 v198;
  __int128 v199;
  __int128 v200;
  uint64_t v201;
  __int128 v202;
  __int128 v203;
  __int128 v204;
  uint64_t v205;
  uint64_t (*v206)(__int128 *, __int128 *);
  __int128 v207;
  __int128 v208;
  __int128 v209;
  __int128 v210;
  __int128 v211;
  __int128 v212;
  uint64_t (*v213)(__int128 *, __int128 *);
  __int128 v214;
  __int128 v215;
  __int128 v216;
  __int128 v217;
  __int128 v218;
  __int128 v219;
  int64_t v220;
  __int128 *v221;
  uint64_t v222;
  __int128 v223;
  __int128 v224;
  __int128 v225;
  uint64_t v226;
  uint64_t v227;
  uint64_t v228;
  uint64_t v229;
  uint64_t v230;
  uint64_t v231;
  uint64_t (*v232)(__int128 *, __int128 *);
  __int128 v233;
  __int128 v234;
  __int128 v235;
  __int128 v236;
  __int128 v237;
  __int128 v238;
  __int128 v239;
  __int128 v240;
  __int128 v241;
  __int128 v242;
  __int128 v243;
  __int128 v244;
  __int128 v245;
  __int128 v246;
  __int128 v247;
  uint64_t v248;
  unint64_t v249;
  unint64_t v250;
  uint64_t (*v251)(__int128 *, __int128 *);
  __int128 v252;
  __int128 v253;
  __int128 v254;
  __int128 v255;
  __int128 v256;
  __int128 v257;
  __int128 v258;
  __int128 v259;
  __int128 v260;
  uint64_t v261;
  __int128 v262;
  __int128 v263;
  __int128 v264;
  uint64_t (*v265)(__int128 *, __int128 *);
  __int128 v266;
  __int128 v267;
  __int128 v268;
  __int128 v269;
  __int128 v270;
  __int128 v271;
  __int128 v272;
  __int128 v273;
  __int128 v274;
  uint64_t v276;
  uint64_t (*v277)(__int128 *, __int128 *);
  __int128 v278;
  __int128 v279;
  __int128 v280;
  __int128 v281;
  __int128 v282;
  __int128 v283;
  __int128 v284;
  __int128 v285;
  __int128 v286;
  uint64_t v287;
  uint64_t v288;
  __int128 v289;
  uint64_t (*v290)(__int128 *, __int128 *);
  __int128 v291;
  __int128 v292;
  __int128 v293;
  char v294;
  __int128 v295;
  __int128 v296;
  __int128 v297;
  __int128 *v298;
  __int128 *v299;
  __int128 *v300;
  __int128 *v301;
  unint64_t v302;
  int64_t v303;
  _OWORD v304[3];
  uint64_t v305;
  _OWORD v306[3];
  uint64_t v307;
  _OWORD v308[3];
  uint64_t v309;
  _OWORD v310[3];
  uint64_t v311;
  _OWORD v312[3];
  uint64_t v313;
  _OWORD v314[3];
  uint64_t v315;
  __int128 v316;
  __int128 v317;
  __int128 v318;
  uint64_t v319;
  __int128 v320;
  __int128 v321;
  __int128 v322;
  uint64_t v323;
  __int128 v324;
  __int128 v325;
  __int128 v326;
  uint64_t v327;
  __int128 v328;
  __int128 v329;
  __int128 v330;
  uint64_t v331;
  __int128 v332;
  __int128 v333;
  __int128 v334;
  uint64_t v335;
  __int128 v336;
  __int128 v337;
  __int128 v338;
  uint64_t v339;
  __int128 v340;
  __int128 v341;
  __int128 v342;
  uint64_t v343;
  __int128 v344;
  __int128 v345;
  __int128 v346;
  uint64_t v347;
  __int128 v348;
  __int128 v349;
  __int128 v350;
  uint64_t v351;
  __int128 v352;
  __int128 v353;
  __int128 v354;
  uint64_t v355;

uint64_t std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(__int128 *a1, __int128 *a2, __int128 *a3, uint64_t (**a4)(_QWORD, _QWORD))
{
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  char v11;
  uint64_t (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  uint64_t result;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  uint64_t v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  uint64_t (*v32)(_QWORD, _QWORD);
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  uint64_t v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  __int128 v51;
  __int128 v52;
  uint64_t (*v53)(_QWORD, _QWORD);
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  _OWORD v63[3];
  uint64_t v64;
  _OWORD v65[3];
  uint64_t v66;
  _OWORD v67[3];
  uint64_t v68;
  _OWORD v69[3];
  uint64_t v70;
  _OWORD v71[3];
  uint64_t v72;
  _OWORD v73[3];
  uint64_t v74;
  _OWORD v75[3];
  uint64_t v76;
  _OWORD v77[3];
  uint64_t v78;
  _OWORD v79[3];
  uint64_t v80;
  _OWORD v81[3];
  uint64_t v82;

  v8 = *a4;
  v9 = a2[1];
  v81[0] = *a2;
  v81[1] = v9;
  v81[2] = a2[2];
  v82 = *((_QWORD *)a2 + 6);
  v10 = a1[1];
  v79[0] = *a1;
  v79[1] = v10;
  v79[2] = a1[2];
  v80 = *((_QWORD *)a1 + 6);
  v11 = v8(v81, v79);
  v12 = *a4;
  if ((v11 & 1) != 0)
  {
    v13 = a3[1];
    v69[0] = *a3;
    v69[1] = v13;
    v69[2] = a3[2];
    v70 = *((_QWORD *)a3 + 6);
    v14 = a2[1];
    v67[0] = *a2;
    v67[1] = v14;
    v67[2] = a2[2];
    v68 = *((_QWORD *)a2 + 6);
    result = v12(v69, v67);
    if ((_DWORD)result)
    {
      v16 = *((_QWORD *)a1 + 6);
      v18 = a1[1];
      v17 = a1[2];
      v19 = *a1;
      v21 = a3[1];
      v20 = a3[2];
      v22 = *a3;
      *((_QWORD *)a1 + 6) = *((_QWORD *)a3 + 6);
      a1[1] = v21;
      a1[2] = v20;
      *a1 = v22;
    }
    else
    {
      v46 = *((_QWORD *)a1 + 6);
      v48 = a1[1];
      v47 = a1[2];
      v49 = *a1;
      v51 = a2[1];
      v50 = a2[2];
      v52 = *a2;
      *((_QWORD *)a1 + 6) = *((_QWORD *)a2 + 6);
      a1[1] = v51;
      a1[2] = v50;
      *a1 = v52;
      *a2 = v49;
      a2[1] = v48;
      a2[2] = v47;
      *((_QWORD *)a2 + 6) = v46;
      v53 = *a4;
      v54 = *a3;
      v55 = a3[1];
      v56 = a3[2];
      v66 = *((_QWORD *)a3 + 6);
      v65[1] = v55;
      v65[2] = v56;
      v65[0] = v54;
      v57 = *a2;
      v58 = a2[1];
      v59 = a2[2];
      v64 = *((_QWORD *)a2 + 6);
      v63[1] = v58;
      v63[2] = v59;
      v63[0] = v57;
      result = v53(v65, v63);
      if (!(_DWORD)result)
        return result;
      v16 = *((_QWORD *)a2 + 6);
      v18 = a2[1];
      v17 = a2[2];
      v19 = *a2;
      v61 = a3[1];
      v60 = a3[2];
      v62 = *a3;
      *((_QWORD *)a2 + 6) = *((_QWORD *)a3 + 6);
      a2[1] = v61;
      a2[2] = v60;
      *a2 = v62;
    }
    *a3 = v19;
    a3[1] = v18;
    a3[2] = v17;
    *((_QWORD *)a3 + 6) = v16;
  }
  else
  {
    v23 = a3[1];
    v77[0] = *a3;
    v77[1] = v23;
    v77[2] = a3[2];
    v78 = *((_QWORD *)a3 + 6);
    v24 = a2[1];
    v75[0] = *a2;
    v75[1] = v24;
    v75[2] = a2[2];
    v76 = *((_QWORD *)a2 + 6);
    result = v12(v77, v75);
    if ((_DWORD)result)
    {
      v25 = *((_QWORD *)a2 + 6);
      v27 = a2[1];
      v26 = a2[2];
      v28 = *a2;
      v30 = a3[1];
      v29 = a3[2];
      v31 = *a3;
      *((_QWORD *)a2 + 6) = *((_QWORD *)a3 + 6);
      a2[1] = v30;
      a2[2] = v29;
      *a2 = v31;
      *a3 = v28;
      a3[1] = v27;
      a3[2] = v26;
      *((_QWORD *)a3 + 6) = v25;
      v32 = *a4;
      v33 = *a2;
      v34 = a2[1];
      v35 = a2[2];
      v74 = *((_QWORD *)a2 + 6);
      v73[1] = v34;
      v73[2] = v35;
      v73[0] = v33;
      v36 = *a1;
      v37 = a1[1];
      v38 = a1[2];
      v72 = *((_QWORD *)a1 + 6);
      v71[1] = v37;
      v71[2] = v38;
      v71[0] = v36;
      result = v32(v73, v71);
      if ((_DWORD)result)
      {
        v39 = *((_QWORD *)a1 + 6);
        v41 = a1[1];
        v40 = a1[2];
        v42 = *a1;
        v44 = a2[1];
        v43 = a2[2];
        v45 = *a2;
        *((_QWORD *)a1 + 6) = *((_QWORD *)a2 + 6);
        a1[1] = v44;
        a1[2] = v43;
        *a1 = v45;
        *a2 = v42;
        a2[1] = v41;
        a2[2] = v40;
        *((_QWORD *)a2 + 6) = v39;
      }
    }
  }
  return result;
}

__n128 std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, uint64_t a3, __int128 *a4, uint64_t (**a5)(_QWORD, _QWORD))
{
  uint64_t (*v10)(_QWORD, _QWORD);
  __int128 v11;
  __int128 v12;
  __n128 result;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  uint64_t (*v21)(_QWORD, _QWORD);
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  uint64_t v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  uint64_t (*v35)(_QWORD, _QWORD);
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  uint64_t v42;
  __int128 v43;
  __int128 v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  _OWORD v48[3];
  uint64_t v49;
  _OWORD v50[3];
  uint64_t v51;
  _OWORD v52[3];
  uint64_t v53;
  _OWORD v54[3];
  uint64_t v55;
  _OWORD v56[3];
  uint64_t v57;
  _OWORD v58[3];
  uint64_t v59;

  std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)a1, (__int128 *)a2, (__int128 *)a3, a5);
  v10 = *a5;
  v11 = a4[1];
  v58[0] = *a4;
  v58[1] = v11;
  v58[2] = a4[2];
  v59 = *((_QWORD *)a4 + 6);
  v12 = *(_OWORD *)(a3 + 16);
  v56[0] = *(_OWORD *)a3;
  v56[1] = v12;
  v56[2] = *(_OWORD *)(a3 + 32);
  v57 = *(_QWORD *)(a3 + 48);
  if (v10(v58, v56))
  {
    v14 = *(_QWORD *)(a3 + 48);
    v16 = *(_OWORD *)(a3 + 16);
    v15 = *(_OWORD *)(a3 + 32);
    v17 = *(_OWORD *)a3;
    v19 = a4[1];
    v18 = a4[2];
    v20 = *a4;
    *(_QWORD *)(a3 + 48) = *((_QWORD *)a4 + 6);
    *(_OWORD *)(a3 + 16) = v19;
    *(_OWORD *)(a3 + 32) = v18;
    *(_OWORD *)a3 = v20;
    *a4 = v17;
    a4[1] = v16;
    a4[2] = v15;
    *((_QWORD *)a4 + 6) = v14;
    v21 = *a5;
    v22 = *(_OWORD *)a3;
    v23 = *(_OWORD *)(a3 + 16);
    v24 = *(_OWORD *)(a3 + 32);
    v55 = *(_QWORD *)(a3 + 48);
    v54[1] = v23;
    v54[2] = v24;
    v54[0] = v22;
    v25 = *(_OWORD *)a2;
    v26 = *(_OWORD *)(a2 + 16);
    v27 = *(_OWORD *)(a2 + 32);
    v53 = *(_QWORD *)(a2 + 48);
    v52[1] = v26;
    v52[2] = v27;
    v52[0] = v25;
    if (v21(v54, v52))
    {
      v28 = *(_QWORD *)(a2 + 48);
      v30 = *(_OWORD *)(a2 + 16);
      v29 = *(_OWORD *)(a2 + 32);
      v31 = *(_OWORD *)a2;
      v33 = *(_OWORD *)(a3 + 16);
      v32 = *(_OWORD *)(a3 + 32);
      v34 = *(_OWORD *)a3;
      *(_QWORD *)(a2 + 48) = *(_QWORD *)(a3 + 48);
      *(_OWORD *)(a2 + 16) = v33;
      *(_OWORD *)(a2 + 32) = v32;
      *(_OWORD *)a2 = v34;
      *(_OWORD *)a3 = v31;
      *(_OWORD *)(a3 + 16) = v30;
      *(_OWORD *)(a3 + 32) = v29;
      *(_QWORD *)(a3 + 48) = v28;
      v35 = *a5;
      v36 = *(_OWORD *)a2;
      v37 = *(_OWORD *)(a2 + 16);
      v38 = *(_OWORD *)(a2 + 32);
      v51 = *(_QWORD *)(a2 + 48);
      v50[1] = v37;
      v50[2] = v38;
      v50[0] = v36;
      v39 = *(_OWORD *)a1;
      v40 = *(_OWORD *)(a1 + 16);
      v41 = *(_OWORD *)(a1 + 32);
      v49 = *(_QWORD *)(a1 + 48);
      v48[1] = v40;
      v48[2] = v41;
      v48[0] = v39;
      if (v35(v50, v48))
      {
        v42 = *(_QWORD *)(a1 + 48);
        v43 = *(_OWORD *)(a1 + 16);
        result = *(__n128 *)(a1 + 32);
        v44 = *(_OWORD *)a1;
        v46 = *(_OWORD *)(a2 + 16);
        v45 = *(_OWORD *)(a2 + 32);
        v47 = *(_OWORD *)a2;
        *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
        *(_OWORD *)(a1 + 16) = v46;
        *(_OWORD *)(a1 + 32) = v45;
        *(_OWORD *)a1 = v47;
        *(_OWORD *)a2 = v44;
        *(_OWORD *)(a2 + 16) = v43;
        *(__n128 *)(a2 + 32) = result;
        *(_QWORD *)(a2 + 48) = v42;
      }
    }
  }
  return result;
}

__n128 std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, __int128 *a5, uint64_t (**a6)(_QWORD, _QWORD))
{
  uint64_t (*v12)(_QWORD, _QWORD);
  __int128 v13;
  __int128 v14;
  __n128 result;
  uint64_t v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  uint64_t (*v23)(_QWORD, _QWORD);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t (*v37)(_QWORD, _QWORD);
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  uint64_t v44;
  __int128 v45;
  __int128 v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  uint64_t (*v51)(_QWORD, _QWORD);
  __int128 v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  uint64_t v58;
  __int128 v59;
  __int128 v60;
  __int128 v61;
  __int128 v62;
  __int128 v63;
  _OWORD v64[3];
  uint64_t v65;
  _OWORD v66[3];
  uint64_t v67;
  _OWORD v68[3];
  uint64_t v69;
  _OWORD v70[3];
  uint64_t v71;
  _OWORD v72[3];
  uint64_t v73;
  _OWORD v74[3];
  uint64_t v75;
  _OWORD v76[3];
  uint64_t v77;
  _OWORD v78[3];
  uint64_t v79;

  std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a2, a3, (__int128 *)a4, a6);
  v12 = *a6;
  v13 = a5[1];
  v78[0] = *a5;
  v78[1] = v13;
  v78[2] = a5[2];
  v79 = *((_QWORD *)a5 + 6);
  v14 = *(_OWORD *)(a4 + 16);
  v76[0] = *(_OWORD *)a4;
  v76[1] = v14;
  v76[2] = *(_OWORD *)(a4 + 32);
  v77 = *(_QWORD *)(a4 + 48);
  if (v12(v78, v76))
  {
    v16 = *(_QWORD *)(a4 + 48);
    v18 = *(_OWORD *)(a4 + 16);
    v17 = *(_OWORD *)(a4 + 32);
    v19 = *(_OWORD *)a4;
    v21 = a5[1];
    v20 = a5[2];
    v22 = *a5;
    *(_QWORD *)(a4 + 48) = *((_QWORD *)a5 + 6);
    *(_OWORD *)(a4 + 16) = v21;
    *(_OWORD *)(a4 + 32) = v20;
    *(_OWORD *)a4 = v22;
    *a5 = v19;
    a5[1] = v18;
    a5[2] = v17;
    *((_QWORD *)a5 + 6) = v16;
    v23 = *a6;
    v24 = *(_OWORD *)a4;
    v25 = *(_OWORD *)(a4 + 16);
    v26 = *(_OWORD *)(a4 + 32);
    v75 = *(_QWORD *)(a4 + 48);
    v74[1] = v25;
    v74[2] = v26;
    v74[0] = v24;
    v27 = *(_OWORD *)a3;
    v28 = *(_OWORD *)(a3 + 16);
    v29 = *(_OWORD *)(a3 + 32);
    v73 = *(_QWORD *)(a3 + 48);
    v72[1] = v28;
    v72[2] = v29;
    v72[0] = v27;
    if (v23(v74, v72))
    {
      v30 = *(_QWORD *)(a3 + 48);
      v32 = *(_OWORD *)(a3 + 16);
      v31 = *(_OWORD *)(a3 + 32);
      v33 = *(_OWORD *)a3;
      v35 = *(_OWORD *)(a4 + 16);
      v34 = *(_OWORD *)(a4 + 32);
      v36 = *(_OWORD *)a4;
      *(_QWORD *)(a3 + 48) = *(_QWORD *)(a4 + 48);
      *(_OWORD *)(a3 + 16) = v35;
      *(_OWORD *)(a3 + 32) = v34;
      *(_OWORD *)a3 = v36;
      *(_OWORD *)a4 = v33;
      *(_OWORD *)(a4 + 16) = v32;
      *(_OWORD *)(a4 + 32) = v31;
      *(_QWORD *)(a4 + 48) = v30;
      v37 = *a6;
      v38 = *(_OWORD *)a3;
      v39 = *(_OWORD *)(a3 + 16);
      v40 = *(_OWORD *)(a3 + 32);
      v71 = *(_QWORD *)(a3 + 48);
      v70[1] = v39;
      v70[2] = v40;
      v70[0] = v38;
      v41 = *(_OWORD *)a2;
      v42 = *(_OWORD *)(a2 + 16);
      v43 = *(_OWORD *)(a2 + 32);
      v69 = *(_QWORD *)(a2 + 48);
      v68[1] = v42;
      v68[2] = v43;
      v68[0] = v41;
      if (v37(v70, v68))
      {
        v44 = *(_QWORD *)(a2 + 48);
        v46 = *(_OWORD *)(a2 + 16);
        v45 = *(_OWORD *)(a2 + 32);
        v47 = *(_OWORD *)a2;
        v49 = *(_OWORD *)(a3 + 16);
        v48 = *(_OWORD *)(a3 + 32);
        v50 = *(_OWORD *)a3;
        *(_QWORD *)(a2 + 48) = *(_QWORD *)(a3 + 48);
        *(_OWORD *)(a2 + 16) = v49;
        *(_OWORD *)(a2 + 32) = v48;
        *(_OWORD *)a2 = v50;
        *(_OWORD *)a3 = v47;
        *(_OWORD *)(a3 + 16) = v46;
        *(_OWORD *)(a3 + 32) = v45;
        *(_QWORD *)(a3 + 48) = v44;
        v51 = *a6;
        v52 = *(_OWORD *)a2;
        v53 = *(_OWORD *)(a2 + 16);
        v54 = *(_OWORD *)(a2 + 32);
        v67 = *(_QWORD *)(a2 + 48);
        v66[1] = v53;
        v66[2] = v54;
        v66[0] = v52;
        v55 = *(_OWORD *)a1;
        v56 = *(_OWORD *)(a1 + 16);
        v57 = *(_OWORD *)(a1 + 32);
        v65 = *(_QWORD *)(a1 + 48);
        v64[1] = v56;
        v64[2] = v57;
        v64[0] = v55;
        if (v51(v66, v64))
        {
          v58 = *(_QWORD *)(a1 + 48);
          v59 = *(_OWORD *)(a1 + 16);
          result = *(__n128 *)(a1 + 32);
          v60 = *(_OWORD *)a1;
          v62 = *(_OWORD *)(a2 + 16);
          v61 = *(_OWORD *)(a2 + 32);
          v63 = *(_OWORD *)a2;
          *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 + 48);
          *(_OWORD *)(a1 + 16) = v62;
          *(_OWORD *)(a1 + 32) = v61;
          *(_OWORD *)a1 = v63;
          *(_OWORD *)a2 = v60;
          *(_OWORD *)(a2 + 16) = v59;
          *(__n128 *)(a2 + 32) = result;
          *(_QWORD *)(a2 + 48) = v58;
        }
      }
    }
  }
  return result;
}

BOOL std::__insertion_sort_incomplete[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(uint64_t a1, uint64_t a2, uint64_t (**a3)(_QWORD, _QWORD))
{
  uint64_t v6;
  _BOOL8 result;
  uint64_t (*v8)(_QWORD, _QWORD);
  __int128 v9;
  __int128 v10;
  uint64_t v11;
  uint64_t v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  int v22;
  uint64_t (*v23)(_QWORD, _QWORD);
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  uint64_t v29;
  uint64_t v30;
  __int128 v31;
  uint64_t (*v32)(_QWORD, _QWORD);
  __int128 v33;
  uint64_t v34;
  __int128 v35;
  _OWORD v36[3];
  uint64_t v37;
  _OWORD v38[3];
  uint64_t v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  uint64_t v43;
  _OWORD v44[3];
  uint64_t v45;
  _OWORD v46[3];
  uint64_t v47;
  _OWORD v48[3];
  uint64_t v49;
  _OWORD v50[3];
  uint64_t v51;

  v6 = 0x6DB6DB6DB6DB6DB7 * ((a2 - a1) >> 3);
  result = 1;
  switch(v6)
  {
    case 0:
    case 1:
      return result;
    case 2:
      v8 = *a3;
      v9 = *(_OWORD *)(a2 - 40);
      v50[0] = *(_OWORD *)(a2 - 56);
      v50[1] = v9;
      v50[2] = *(_OWORD *)(a2 - 24);
      v51 = *(_QWORD *)(a2 - 8);
      v10 = *(_OWORD *)(a1 + 16);
      v48[0] = *(_OWORD *)a1;
      v48[1] = v10;
      v48[2] = *(_OWORD *)(a1 + 32);
      v49 = *(_QWORD *)(a1 + 48);
      if (!v8(v50, v48))
        return 1;
      v11 = a2 - 56;
      v12 = *(_QWORD *)(a1 + 48);
      v14 = *(_OWORD *)(a1 + 16);
      v13 = *(_OWORD *)(a1 + 32);
      v15 = *(_OWORD *)a1;
      v17 = *(_OWORD *)(a2 - 40);
      v16 = *(_OWORD *)(a2 - 24);
      v18 = *(_OWORD *)(a2 - 56);
      *(_QWORD *)(a1 + 48) = *(_QWORD *)(a2 - 8);
      *(_OWORD *)(a1 + 16) = v17;
      *(_OWORD *)(a1 + 32) = v16;
      *(_OWORD *)a1 = v18;
      *(_OWORD *)v11 = v15;
      *(_OWORD *)(v11 + 16) = v14;
      *(_OWORD *)(v11 + 32) = v13;
      result = 1;
      *(_QWORD *)(v11 + 48) = v12;
      return result;
    case 3:
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)a1, (__int128 *)(a1 + 56), (__int128 *)(a2 - 56), a3);
      return 1;
    case 4:
      std::__sort4[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, (__int128 *)(a2 - 56), a3);
      return 1;
    case 5:
      std::__sort5[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>(a1, a1 + 56, a1 + 112, a1 + 168, (__int128 *)(a2 - 56), a3);
      return 1;
    default:
      v19 = a1 + 112;
      std::__sort3[abi:ne180100]<std::_ClassicAlgPolicy,BOOL (*&)(sortQuantizeColorEntry,sortQuantizeColorEntry),sortQuantizeColorEntry*>((__int128 *)a1, (__int128 *)(a1 + 56), (__int128 *)(a1 + 112), a3);
      v20 = a1 + 168;
      if (a1 + 168 == a2)
        return 1;
      v21 = 0;
      v22 = 0;
      break;
  }
  while (1)
  {
    v23 = *a3;
    v24 = *(_OWORD *)(v20 + 16);
    v46[0] = *(_OWORD *)v20;
    v46[1] = v24;
    v46[2] = *(_OWORD *)(v20 + 32);
    v47 = *(_QWORD *)(v20 + 48);
    v26 = *(_OWORD *)(v19 + 16);
    v25 = *(_OWORD *)(v19 + 32);
    v27 = *(_OWORD *)v19;
    v45 = *(_QWORD *)(v19 + 48);
    v44[1] = v26;
    v44[2] = v25;
    v44[0] = v27;
    if (v23(v46, v44))
    {
      v28 = *(_OWORD *)(v20 + 16);
      v40 = *(_OWORD *)v20;
      v41 = v28;
      v42 = *(_OWORD *)(v20 + 32);
      v43 = *(_QWORD *)(v20 + 48);
      v29 = v21;
      while (1)
      {
        v30 = a1 + v29;
        v31 = *(_OWORD *)(a1 + v29 + 128);
        *(_OWORD *)(v30 + 168) = *(_OWORD *)(a1 + v29 + 112);
        *(_OWORD *)(v30 + 184) = v31;
        *(_OWORD *)(v30 + 200) = *(_OWORD *)(a1 + v29 + 144);
        *(_QWORD *)(v30 + 216) = *(_QWORD *)(a1 + v29 + 160);
        if (v29 == -112)
          break;
        v32 = *a3;
        v38[0] = v40;
        v38[1] = v41;
        v38[2] = v42;
        v39 = v43;
        v33 = *(_OWORD *)(v30 + 72);
        v36[0] = *(_OWORD *)(v30 + 56);
        v36[1] = v33;
        v36[2] = *(_OWORD *)(v30 + 88);
        v37 = *(_QWORD *)(v30 + 104);
        v29 -= 56;
        if ((v32(v38, v36) & 1) == 0)
        {
          v34 = a1 + v29 + 168;
          goto LABEL_12;
        }
      }
      v34 = a1;
LABEL_12:
      v35 = v41;
      *(_OWORD *)v34 = v40;
      *(_OWORD *)(v34 + 16) = v35;
      *(_OWORD *)(v34 + 32) = v42;
      *(_QWORD *)(v34 + 48) = v43;
      if (++v22 == 8)
        return v20 + 56 == a2;
    }
    v19 = v20;
    v21 += 56;
    v20 += 56;
    if (v20 == a2)
      return 1;
  }
}

uint64_t final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_1>::~final_act(uint64_t a1)
{
  CGImage *v2;

  if (*(_BYTE *)(a1 + 8))
  {
    v2 = *(CGImage **)a1;
    if (*(_QWORD *)a1)
      CGImageRelease(v2);
  }
  return a1;
}

uint64_t final_act<ImageAnalyzer::GenerateColorMaps(CGImage *)::$_0>::~final_act(uint64_t a1)
{
  if (*(_BYTE *)(a1 + 8))
    CGContextRelease(*(CGContextRef *)a1);
  return a1;
}

void AnalyzeImagePlease(CGContext *a1, AnalyzedImageColors *a2)
{
  size_t BytesPerRow;
  int Width;
  int Height;
  char v7;
  __int16 BitmapInfo;
  char *Data;
  char *v10;
  unint64_t v11;
  int v12;
  double v13;
  double *v14;
  uint64_t v15;
  int64x2_t v16;
  uint64_t v17;
  char *v18;
  double *v19;
  char *v20;
  char *v21;
  uint64_t v22;
  uint64_t v23;
  unint64_t v24;
  __n128 v25;
  __int128 v26;
  double HSVColor;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  ITColor *v32;
  __n128 *v33;
  ITColor *v34;
  ITColor *v35;
  double v36;
  __n128 v37;
  uint64_t v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  ITColor *v42;
  double v43;
  ITColor *v44;
  double v45;
  ITColor *v46;
  double v47;
  double v48;
  void *exception;
  uint64_t v50;
  uint64_t v51;
  uint64_t v52;
  uint64_t v53;
  uint64_t v54;
  uint64_t v55;
  uint64_t v56;
  uint64_t v57;
  uint64_t v58;
  uint64_t v59;
  uint64_t v60;
  uint64_t v61;
  uint64_t v62;
  uint64_t v63;
  uint64_t v64;
  char v65;
  char *v66;
  AnalyzedImageColors *v67;
  uint64_t v68;
  __n128 v69;
  double v70;
  _QWORD v71[4];
  __n128 v72;
  double v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  __int128 v79;
  __int128 v80;
  __int128 v81;
  __int128 v82;
  __int128 v83;
  uint64_t v84;
  __int128 v85;
  __int128 v86;
  __int128 v87;
  __int128 v88;
  __int128 v89;
  __int128 v90;
  __int128 v91;
  __int128 v92;
  __int128 v93;
  __int128 v94;
  ITColor v95;

  v72 = 0uLL;
  v73 = 0.0;
  v74 = 0x3FF0000000000000uLL;
  v75 = 0uLL;
  v76 = 0x3FF0000000000000uLL;
  v77 = 0uLL;
  v78 = 0x3FF0000000000000uLL;
  v79 = 0uLL;
  v80 = 0x3FF0000000000000uLL;
  v81 = 0uLL;
  v82 = 0x3FF0000000000000uLL;
  v83 = 0uLL;
  v84 = 0x3FF0000000000000;
  v85 = 0uLL;
  *(_QWORD *)&v86 = 0;
  *((_QWORD *)&v86 + 1) = 0x3FF0000000000000;
  v87 = 0uLL;
  *(_QWORD *)&v88 = 0;
  *((_QWORD *)&v88 + 1) = 0x3FF0000000000000;
  v89 = 0uLL;
  *(_QWORD *)&v90 = 0;
  *((_QWORD *)&v90 + 1) = 0x3FF0000000000000;
  v71[0] = 0;
  v71[1] = 0;
  v93 = 0u;
  v94 = 0u;
  v91 = 0u;
  v92 = 0u;
  BytesPerRow = CGBitmapContextGetBytesPerRow(a1);
  Width = CGBitmapContextGetWidth(a1);
  Height = CGBitmapContextGetHeight(a1);
  v7 = Height;
  if (Height != 22 || Width != 22)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 5, "ImageAnalyzer::GenerateColorMaps() - invalid height (%ud) or width (%ud) parameter", v50, v51, v52, v53, v54, v7);
    goto LABEL_21;
  }
  BitmapInfo = CGBitmapContextGetBitmapInfo(a1);
  Data = (char *)CGBitmapContextGetData(a1);
  if (!Data)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 3, "ImageAnalyzer::GenerateColorMaps() - Failed to obtain bitmap image data", v55, v56, v57, v58, v59, v65);
    goto LABEL_21;
  }
  v10 = (char *)malloc_type_calloc(0x1E4uLL, 0x28uLL, 0x10000400A747E1EuLL);
  v67 = a2;
  if (!v10)
  {
    exception = __cxa_allocate_exception(0x18uLL);
    ImageAnalyzer::image_analyzer_error::image_analyzer_error((uint64_t)exception, 1, "ImageAnalyzer::getHSVMap() - failed to allocate memory for imageHSVMap.", v60, v61, v62, v63, v64, v65);
LABEL_21:
  }
  v12 = BitmapInfo & 0x3000;
  v13 = *((double *)&v94 + 1);
  v66 = v10;
  v14 = (double *)(v10 + 16);
  v15 = 1;
  v16 = vdupq_lane_s64(0x406FE00000000000, 0);
  v68 = v16.i64[1];
  do
  {
    v17 = 0;
    v18 = &Data[v15 * BytesPerRow];
    v19 = v14;
    do
    {
      v20 = &v18[v17];
      v21 = &v18[v17 + 4];
      if (v12)
        v22 = 6;
      else
        v22 = 5;
      if (v12)
        v23 = 5;
      else
        v23 = 6;
      if (!v12)
        v21 = &v18[v17 + 7];
      v16.i8[0] = v20[v22];
      *(double *)&v24 = (double)v16.u64[0];
      v25.n128_f64[0] = *(double *)&v24 / 255.0;
      LOBYTE(v24) = v20[v23];
      LOBYTE(v11) = *v21;
      v25.n128_f64[1] = (double)v24 / 255.0;
      v69 = v25;
      v70 = (double)v11 / 255.0;
      *((_QWORD *)&v26 + 1) = v68;
      *(double *)&v26 = v70;
      *(__n128 *)&v95.var0 = v25;
      *(_OWORD *)&v95.var2 = v26;
      HSVColor = ITColor::GetHSVColor(&v95);
      v29 = v28;
      v31 = v30;
      ITColor::GetLuminance(v32, v69, v70);
      *(v19 - 2) = HSVColor;
      *((_QWORD *)v19 - 1) = v29;
      *(_QWORD *)v19 = v31;
      v19[1] = *(double *)v16.i64;
      v19[2] = 255.0;
      v13 = *(double *)v16.i64 + v13;
      *((double *)&v94 + 1) = v13;
      v17 += 4;
      v19 += 5;
    }
    while (v17 != 80);
    ++v15;
    v14 += 100;
  }
  while (v15 != 21);
  *((double *)&v94 + 1) = v13 / 400.0;
  v71[0] = v66;
  ImageAnalyzer::QuantizeColorMaps((ImageAnalyzer *)v71);
  v33 = (__n128 *)v67;
  ImageAnalyzer::PickBackgroundColor((ImageAnalyzer *)v71);
  ImageAnalyzer::PickTextColors((ImageAnalyzer *)v71);
  ImageAnalyzer::DoPostImageAnalysis((ImageAnalyzer *)v71, v34, v35);
  v36 = v73;
  v37 = v72;
  *(__n128 *)&v67->var0.var0 = v72;
  v67->var0.var2 = v36;
  *(_OWORD *)&v67->var0.var3 = v74;
  *(_OWORD *)&v67->var1.var1 = v75;
  *(_OWORD *)&v67->var1.var3 = v76;
  *(_OWORD *)&v67->var2.var1 = v77;
  *(_OWORD *)&v67->var2.var3 = v78;
  *(_OWORD *)&v67->var3.var1 = v79;
  *(_OWORD *)&v67->var3.var3 = v80;
  *(_OWORD *)&v67->var4.var1 = v81;
  v38 = v84;
  *(_OWORD *)&v67->var4.var3 = v82;
  *(_OWORD *)&v67->var5.var1 = v83;
  *(_QWORD *)&v67->var5.var3 = v38;
  v39 = v86;
  *(_OWORD *)&v67->var7.var0 = v85;
  *(_OWORD *)&v67->var7.var2 = v39;
  v40 = v88;
  *(_OWORD *)&v67->var6.var0 = v87;
  *(_OWORD *)&v67->var6.var2 = v40;
  v41 = v90;
  *(_OWORD *)&v67->var8.var0 = v89;
  *(_OWORD *)&v67->var8.var2 = v41;
  v67->var10 = 1;
  ITColor::GetLuminance(v42, v37, v36);
  v67->var11 = v43 >= 0.180000007;
  ITColor::GetLuminance(v44, v33[2], v33[3].n128_f64[0]);
  v67->var12 = v45 >= 0.180000007;
  ITColor::GetLuminance(v46, v33[4], v33[5].n128_f64[0]);
  v67->var13 = v47 >= 0.180000007;
  v48 = *(double *)&v94;
  v67->var14 = *(double *)&v94 > 0.0;
  v67->var9 = v48;
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)v71);
}

void sub_1A07A18F8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,char a21)
{
  void *v21;

  __cxa_free_exception(v21);
  ImageAnalyzer::~ImageAnalyzer((ImageAnalyzer *)&a21);
  _Unwind_Resume(a1);
}

void sub_1A07A2328(_Unwind_Exception *a1)
{
  id *v1;
  uint64_t v2;

  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v2 - 120));
  _Unwind_Resume(a1);
}

id MSVUnarchivedObjectOfClass(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;

  v3 = a2;
  v4 = v3;
  if (a1)
  {
    if (v3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClass(__unsafe_unretained Class _Nonnull, NSData *__strong _Nonnull)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MSVSecureCodingUtilities.m"), 33, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("cls"));

    if (v4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClass(__unsafe_unretained Class _Nonnull, NSData *__strong _Nonnull)");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MSVSecureCodingUtilities.m"), 34, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("data"));

LABEL_3:
  v14 = 0;
  objc_msgSend(MEMORY[0x1E0CB3710], "unarchivedObjectOfClass:fromData:error:", a1, v4, &v14);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v14;
  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "id  _Nullable MSVUnarchivedObjectOfClass(__unsafe_unretained Class _Nonnull, NSData *__strong _Nonnull)");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInFunction:file:lineNumber:description:", v13, CFSTR("MSVSecureCodingUtilities.m"), 38, CFSTR("Unarchiving object of class:%@ resulted in error:%@"), a1, v6);

  }
  return v5;
}

void sub_1A07A4008(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07A4174(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07A447C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A07A44E0(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07A4594(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07A46CC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07A4A20(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, id *location, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, id a18)
{
  objc_destroyWeak(location);
  objc_destroyWeak(&a18);
  _Unwind_Resume(a1);
}

void sub_1A07A5260(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, char a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,id location)
{
  id *v22;

  objc_destroyWeak(v22);
  _Block_object_dispose(&a16, 8);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1608(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1609(uint64_t a1)
{

}

id MSVCryptoDigestForString(void *a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "dataUsingEncoding:", 4);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSVCryptoDigestForData(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSVCryptoDigestForData(void *a1, uint64_t a2)
{
  id v3;
  void *v4;
  id v5;
  uint64_t v6;
  id v7;
  id v8;
  void *v9;
  unsigned __int8 md[32];
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = v3;
  if (a2 == 2)
  {
    v7 = objc_retainAutorelease(v3);
    CC_SHA256((const void *)objc_msgSend(v7, "bytes"), objc_msgSend(v7, "length"), md);
    v6 = 2;
  }
  else if (a2 == 1)
  {
    v8 = objc_retainAutorelease(v3);
    CC_SHA1((const void *)objc_msgSend(v8, "bytes"), objc_msgSend(v8, "length"), md);
    v6 = 1;
  }
  else
  {
    if (a2)
    {
      v9 = 0;
      goto LABEL_9;
    }
    v5 = objc_retainAutorelease(v3);
    CC_MD5((const void *)objc_msgSend(v5, "bytes"), objc_msgSend(v5, "length"), md);
    v6 = 0;
  }
  MSVCryptoUtilitiesHexStringFromDigest(md, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_9:

  return v9;
}

id MSVCryptoUtilitiesHexStringFromDigest(unsigned __int8 *a1, uint64_t a2)
{
  void *v2;
  char v4[65];
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (a2 == 2)
  {
    __sprintf_chk(v4, 0, 0x41uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7], a1[8], a1[9], a1[10], a1[11], a1[12], a1[13]);
  }
  else if (a2 == 1)
  {
    __sprintf_chk(v4, 0, 0x29uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5], a1[6], a1[7]);
  }
  else
  {
    if (a2)
    {
      v2 = 0;
      return v2;
    }
    __sprintf_chk(v4, 0, 0x21uLL, "%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x%02x", *a1, a1[1], a1[2], a1[3], a1[4], a1[5]);
  }
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", v4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  return v2;
}

id MSVCryptoDigestForContentsOfFile(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", a1);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  MSVCryptoDigestForContentsOfInputStream(v3, a2);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

id MSVCryptoDigestForContentsOfInputStream(void *a1, uint64_t a2)
{
  id v3;
  dispatch_semaphore_t v4;
  MSVStreamReader *v5;
  uint64_t v6;
  NSObject *v7;
  NSObject *v8;
  id v9;
  uint64_t v11;
  uint64_t v12;
  intptr_t (*v13)(uint64_t);
  void *v14;
  NSObject *v15;
  uint64_t *v16;
  CC_SHA256_CTX *p_c;
  uint64_t v18;
  _QWORD v19[5];
  _QWORD v20[4];
  NSObject *v21;
  uint64_t *v22;
  CC_SHA256_CTX *v23;
  uint64_t v24;
  _QWORD v25[5];
  _QWORD v26[4];
  NSObject *v27;
  uint64_t *v28;
  CC_SHA256_CTX *v29;
  uint64_t v30;
  _QWORD v31[5];
  _QWORD v32[4];
  NSObject *v33;
  uint64_t v34;
  uint64_t *v35;
  uint64_t v36;
  uint64_t (*v37)(uint64_t, uint64_t);
  void (*v38)(uint64_t);
  id v39;
  CC_SHA256_CTX c;
  uint64_t v41;

  v41 = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v34 = 0;
  v35 = &v34;
  v36 = 0x3032000000;
  v37 = __Block_byref_object_copy__1688;
  v38 = __Block_byref_object_dispose__1689;
  v39 = 0;
  v4 = dispatch_semaphore_create(0);
  v5 = -[MSVStreamReader initWithInputStream:queue:]([MSVStreamReader alloc], "initWithInputStream:queue:", v3, 0);
  v6 = MEMORY[0x1E0C809B0];
  v32[0] = MEMORY[0x1E0C809B0];
  v32[1] = 3221225472;
  v32[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke;
  v32[3] = &unk_1E43E8A28;
  v7 = v4;
  v33 = v7;
  -[MSVStreamReader setDidEncounterErrorBlock:](v5, "setDidEncounterErrorBlock:", v32);
  if (a2 == 2)
  {
    memset(&c, 0, sizeof(c));
    CC_SHA256_Init(&c);
    v19[0] = v6;
    v19[1] = 3221225472;
    v19[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_6;
    v19[3] = &__block_descriptor_40_e16_v16__0__NSData_8l;
    v19[4] = &c;
    -[MSVStreamReader setDidReadDataBlock:](v5, "setDidReadDataBlock:", v19);
    v11 = v6;
    v12 = 3221225472;
    v13 = __MSVCryptoDigestForContentsOfInputStream_block_invoke_7;
    v14 = &unk_1E43E8A70;
    v16 = &v34;
    p_c = &c;
    v18 = 2;
    v15 = v7;
    -[MSVStreamReader setDidFinishReadingBlock:](v5, "setDidFinishReadingBlock:", &v11);

  }
  else if (a2 == 1)
  {
    memset(&c, 0, 96);
    CC_SHA1_Init((CC_SHA1_CTX *)&c);
    v25[0] = v6;
    v25[1] = 3221225472;
    v25[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_4;
    v25[3] = &__block_descriptor_40_e16_v16__0__NSData_8l;
    v25[4] = &c;
    -[MSVStreamReader setDidReadDataBlock:](v5, "setDidReadDataBlock:", v25);
    v20[0] = v6;
    v20[1] = 3221225472;
    v20[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_5;
    v20[3] = &unk_1E43E8A70;
    v22 = &v34;
    v23 = &c;
    v24 = 1;
    v21 = v7;
    -[MSVStreamReader setDidFinishReadingBlock:](v5, "setDidFinishReadingBlock:", v20);

  }
  else if (a2)
  {
    v8 = os_log_create("com.apple.amp.MediaServices", "CryptoUtil");
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      c.count[0] = 67109120;
      c.count[1] = a2;
      _os_log_impl(&dword_1A077D000, v8, OS_LOG_TYPE_ERROR, "Invalid crypto format: %d", (uint8_t *)&c, 8u);
    }

    dispatch_semaphore_signal(v7);
  }
  else
  {
    memset(&c, 0, 92);
    CC_MD5_Init((CC_MD5_CTX *)&c);
    v31[0] = v6;
    v31[1] = 3221225472;
    v31[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_2;
    v31[3] = &__block_descriptor_40_e16_v16__0__NSData_8l;
    v31[4] = &c;
    -[MSVStreamReader setDidReadDataBlock:](v5, "setDidReadDataBlock:", v31);
    v26[0] = v6;
    v26[1] = 3221225472;
    v26[2] = __MSVCryptoDigestForContentsOfInputStream_block_invoke_3;
    v26[3] = &unk_1E43E8A70;
    v28 = &v34;
    v29 = &c;
    v30 = 0;
    v27 = v7;
    -[MSVStreamReader setDidFinishReadingBlock:](v5, "setDidFinishReadingBlock:", v26);

  }
  -[MSVStreamReader start](v5, "start", v11, v12, v13, v14);
  dispatch_semaphore_wait(v7, 0xFFFFFFFFFFFFFFFFLL);
  v9 = (id)v35[5];

  _Block_object_dispose(&v34, 8);
  return v9;
}

void sub_1A07A5EC8(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 224), 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__1688(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__1689(uint64_t a1)
{

}

id MSVCryptoUtilitiesDigestDataFromHexString(void *a1, uint64_t a2)
{
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  _BYTE *v8;
  BOOL v9;
  unint64_t v11;
  uint64_t v12;
  _BYTE v14[12];
  char v15;
  char __str[2];
  char v17;
  _QWORD v18[2];

  v18[1] = *MEMORY[0x1E0C80C00];
  v3 = a1;
  v4 = objc_alloc_init(MEMORY[0x1E0C99DF0]);
  v5 = 32;
  if (a2 == 1)
    v5 = 40;
  if (a2 == 2)
    v6 = 64;
  else
    v6 = v5;
  v18[0] = 0;
  MEMORY[0x1E0C80A78]();
  v8 = &v14[-v7];
  if (objc_msgSend(v3, "getBytes:maxLength:usedLength:encoding:options:range:remainingRange:", &v14[-v7], v6, v18, 1, 0, 0, objc_msgSend(v3, "length"), 0))v9 = v18[0] == v6;
  else
    v9 = 0;
  if (v9 && v18[0] != 0)
  {
    v11 = 0;
    do
    {
      *(_WORD *)__str = *(_WORD *)&v8[v11];
      v17 = 0;
      v12 = strtol(__str, 0, 16);
      if (v12 <= 255)
      {
        v15 = v12;
        objc_msgSend(v4, "appendBytes:length:", &v15, 1);
      }
      v11 += 2;
    }
    while (v11 < v18[0]);
  }

  return v4;
}

uint64_t MSVProcessIsDebugging()
{
  size_t v1;
  _OWORD v2[2];
  __int128 v3;
  __int128 v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  int v33[2];
  int v34;
  pid_t v35;
  uint64_t v36;

  v36 = *MEMORY[0x1E0C80C00];
  v31 = 0u;
  v32 = 0u;
  v29 = 0u;
  v30 = 0u;
  v27 = 0u;
  v28 = 0u;
  v25 = 0u;
  v26 = 0u;
  v23 = 0u;
  v24 = 0u;
  v21 = 0u;
  v22 = 0u;
  v19 = 0u;
  v20 = 0u;
  v17 = 0u;
  v18 = 0u;
  v15 = 0u;
  v16 = 0u;
  v13 = 0u;
  v14 = 0u;
  v11 = 0u;
  v12 = 0u;
  v9 = 0u;
  v10 = 0u;
  v7 = 0u;
  v8 = 0u;
  v5 = 0u;
  v6 = 0u;
  v3 = 0u;
  v4 = 0u;
  memset(v2, 0, sizeof(v2));
  LODWORD(v3) = 0;
  *(_QWORD *)v33 = 0xE00000001;
  v34 = 1;
  v35 = getpid();
  v1 = 648;
  if (sysctl(v33, 4u, v2, &v1, 0, 0))
    __assert_rtn("MSVProcessIsDebugging", "MSVDebugUtilities.m", 64, "junk == 0");
  return (v3 >> 11) & 1;
}

void _MSVEnumerateClassHierarchy(void *a1, uint64_t a2, void *a3)
{
  uint64_t v5;
  uint64_t v6;
  void (**v7)(id, void *, BOOL);

  v7 = a3;
  v5 = objc_msgSend(a1, "superclass");
  v6 = v5;
  if ((_DWORD)a2)
    v7[2](v7, a1, v5 == 0);
  if (v6)
    _MSVEnumerateClassHierarchy(v6, a2, v7);
  if ((a2 & 1) == 0)
    v7[2](v7, a1, v6 == 0);

}

void _MSVEnumerateClassProtocols(objc_class *a1, void *a2)
{
  void (**v3)(id, _QWORD);
  Protocol **v4;
  unint64_t i;
  unsigned int outCount;

  v3 = a2;
  outCount = 0;
  v4 = class_copyProtocolList(a1, &outCount);
  if (outCount)
  {
    for (i = 0; i < outCount; ((void (**)(id, Protocol *))v3)[2](v3, v4[i++]))
      ;
  }
  free(v4);

}

id _MSVDescribeMethod(objc_method *a1, int a2)
{
  void *v3;
  void *v4;
  const __CFString *v5;
  char *v6;
  void *v7;
  const char *Name;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  __CFString *v13;
  id v14;
  id v15;
  uint64_t v16;
  unsigned int v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  char *v21;
  void *v22;
  void *v23;
  BOOL v24;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _QWORD v31[4];
  id v32;
  const __CFString *v33;
  _QWORD *v34;
  _QWORD v35[3];
  char v36;
  _BYTE v37[128];
  uint64_t v38;

  v38 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (a2)
    v5 = CFSTR("+");
  else
    v5 = CFSTR("-");
  objc_msgSend(v3, "appendString:", v5);
  v6 = method_copyReturnType(a1);
  _MSVObjCTypeDescription(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendFormat:", CFSTR(" (%@)"), v7);

  free(v6);
  Name = method_getName(a1);
  NSStringFromSelector(Name);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "componentsSeparatedByString:", CFSTR(":"));
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  v36 = 0;
  v31[0] = MEMORY[0x1E0C809B0];
  v31[1] = 3221225472;
  v31[2] = ___MSVMethodComponents_block_invoke;
  v31[3] = &unk_1E43E8CD8;
  v34 = v35;
  v12 = v11;
  v32 = v12;
  v33 = CFSTR(":");
  objc_msgSend(v10, "enumerateObjectsUsingBlock:", v31);
  v13 = (__CFString *)v33;
  v14 = v12;

  _Block_object_dispose(v35, 8);
  v27 = 0u;
  v28 = 0u;
  v29 = 0u;
  v30 = 0u;
  v15 = v14;
  v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
  if (v16)
  {
    v17 = 2;
    v18 = *(_QWORD *)v28;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v28 != v18)
          objc_enumerationMutation(v15);
        v20 = *(void **)(*((_QWORD *)&v27 + 1) + 8 * i);
        objc_msgSend(v4, "appendFormat:", CFSTR("%@"), v20);
        if (objc_msgSend(v20, "hasSuffix:", CFSTR(":")))
        {
          v21 = method_copyArgumentType(a1, v17);
          _MSVObjCTypeDescription(v21);
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v4, "appendFormat:", CFSTR("(%@)arg%ld"), v22, v17 - 1);

          free(v21);
        }
        if (++v17 >= 3)
        {
          objc_msgSend(v15, "lastObject");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          v24 = v20 == v23;

          if (!v24)
            objc_msgSend(v4, "appendString:", CFSTR(" "));
        }
      }
      v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v27, v37, 16);
    }
    while (v16);
  }

  objc_msgSend(v4, "appendString:", CFSTR(";"));
  return v4;
}

void sub_1A07A7830(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Unwind_Resume(a1);
}

__CFString *_MSVObjCTypeDescription(const char *a1)
{
  unsigned int v2;
  int v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFString *v8;
  void *v9;
  void *v10;
  size_t v11;
  uint64_t v12;
  char *v13;
  uint64_t v14;
  unsigned int v15;
  uint64_t v16;
  const char *v17;
  size_t v18;
  char *v19;
  void *v20;
  const __CFString *v21;
  uint64_t v23;

  if (!strcmp(a1, "@"))
  {
    v4 = CFSTR("id");
    return v4;
  }
  if (!strcmp(a1, "v"))
  {
    v4 = CFSTR("void");
    return v4;
  }
  if (!strcmp(a1, "^v"))
  {
    v4 = CFSTR("void *");
    return v4;
  }
  if (!strcmp(a1, ":"))
  {
    v4 = CFSTR("SEL");
    return v4;
  }
  if (!strcmp(a1, "B"))
  {
    v4 = CFSTR("BOOL");
    return v4;
  }
  if (!strcmp(a1, "c"))
  {
    v4 = CFSTR("char");
    return v4;
  }
  if (!strcmp(a1, "i"))
  {
    v4 = CFSTR("int");
    return v4;
  }
  if (!strcmp(a1, "s"))
  {
    v4 = CFSTR("short");
    return v4;
  }
  if (!strcmp(a1, "q"))
  {
    v4 = CFSTR("long");
    return v4;
  }
  if (!strcmp(a1, "C"))
  {
    v4 = CFSTR("unsigned char");
    return v4;
  }
  if (!strcmp(a1, "I"))
  {
    v4 = CFSTR("unsigned int");
    return v4;
  }
  if (!strcmp(a1, "S"))
  {
    v4 = CFSTR("unsigned short");
    return v4;
  }
  if (!strcmp(a1, "Q"))
  {
    v4 = CFSTR("unsigned long");
    return v4;
  }
  if (!strcmp(a1, "f"))
  {
    v4 = CFSTR("float");
    return v4;
  }
  if (!strcmp(a1, "d"))
  {
    v4 = CFSTR("double");
    return v4;
  }
  if (!strcmp(a1, "*"))
  {
    v4 = CFSTR("char *");
    return v4;
  }
  if (!strcmp(a1, "#"))
  {
    v4 = CFSTR("Class");
    return v4;
  }
  if (!strcmp(a1, "@?"))
  {
    v4 = CFSTR("^");
    return v4;
  }
  v2 = *(unsigned __int8 *)a1;
  v3 = (char)v2;
  if (v2 <= 0x5A)
  {
    if (v2 != 40)
    {
      if (v2 == 64 && strlen(a1) >= 4)
      {
        v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1 + 2, strlen(a1) - 3, 1);
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ *"), v5, v23);
LABEL_78:
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_79:

        return v4;
      }
      goto LABEL_61;
    }
  }
  else
  {
    if (v2 == 91)
      goto LABEL_56;
    if (v2 == 94)
    {
LABEL_54:
      if (strlen(a1) >= 2)
      {
        v9 = (void *)MEMORY[0x1E0CB3940];
        _MSVObjCTypeDescription(a1 + 1);
        v10 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v9, "stringWithFormat:", CFSTR("%@ *"), v10);
        v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_60:

        return v4;
      }
      goto LABEL_61;
    }
    if (v2 != 123)
      goto LABEL_61;
  }
  if (strlen(a1) >= 4)
  {
    v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1 + 1, strlen(a1) - 2, 1);
    objc_msgSend(v5, "componentsSeparatedByString:", CFSTR("="));
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    if ((unint64_t)objc_msgSend(v6, "count") < 2)
    {
      v4 = v5;
    }
    else
    {
      objc_msgSend(v6, "objectAtIndex:", 0);
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (*a1 == 123)
        v8 = CFSTR("struct");
      else
        v8 = CFSTR("union");
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v8, v7);
      v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    }
    goto LABEL_79;
  }
  if (v3 != 91)
  {
    if (v3 != 94)
      goto LABEL_61;
    goto LABEL_54;
  }
LABEL_56:
  v11 = strlen(a1);
  if (v11 >= 4)
  {
    v12 = 1;
    v13 = (char *)malloc_type_calloc(1uLL, v11 + 1, 0x86D38055uLL);
    do
    {
      v14 = v12;
      v15 = a1[v12++] - 48;
    }
    while (v15 < 0xA);
    v16 = v14 - 1;
    v17 = &a1[v14];
    v10 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", a1 + 1, v14 - 1, 1);
    v18 = strlen(a1);
    v19 = strncpy(v13, v17, v18 - v16 - 2);
    _MSVObjCTypeDescription(v19);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    free(v13);
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@[%@]"), v20, v10);
    v4 = (__CFString *)objc_claimAutoreleasedReturnValue();

    goto LABEL_60;
  }
LABEL_61:
  if (strlen(a1) >= 2)
  {
    if (v3 <= 109)
    {
      switch(v3)
      {
        case 'N':
          v21 = CFSTR("inout");
          goto LABEL_77;
        case 'O':
          v21 = CFSTR("bycopy");
          goto LABEL_77;
        case 'R':
          v21 = CFSTR("byref");
          goto LABEL_77;
        case 'V':
          v21 = CFSTR("oneway");
          goto LABEL_77;
        default:
          goto LABEL_69;
      }
    }
    switch(v3)
    {
      case 'r':
        v21 = CFSTR("const");
        goto LABEL_77;
      case 'o':
        v21 = CFSTR("out");
        goto LABEL_77;
      case 'n':
        v21 = CFSTR("in");
LABEL_77:
        _MSVObjCTypeDescription(a1 + 1);
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@ %@"), v21, v5);
        goto LABEL_78;
    }
  }
LABEL_69:
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%s"), a1);
  v4 = (__CFString *)objc_claimAutoreleasedReturnValue();
  return v4;
}

__CFString *_MSVDebugIvarValue(unsigned int *a1, char *__s, int a3)
{
  size_t v6;
  const char *v7;
  char *v8;
  char v9;
  char *v10;
  char *v11;
  int v12;
  int v13;
  id v14;
  double v15;
  void *v16;
  uint64_t v17;
  __CFString *v18;
  __CFString *v20;
  __CFString *v21;
  uint64_t v22;
  NSRange v23;

  v6 = strlen(__s);
  v7 = (const char *)malloc_type_calloc(v6 + 1, 1uLL, 0x6E06EADDuLL);
  v8 = (char *)v7;
  v9 = 0;
  v10 = __s;
  v11 = (char *)v7;
  while (1)
  {
    v12 = *v10;
    if (v12 == 34)
    {
      v9 ^= 1u;
      goto LABEL_8;
    }
    if (!*v10)
      break;
    if ((v9 & 1) != 0)
    {
      v9 = 1;
    }
    else
    {
      v9 = 0;
      *v11++ = v12;
    }
LABEL_8:
    ++v10;
  }
  v13 = *__s;
  if (v13 != 64)
  {
    if (!strcmp(v7, "{CGRect={CGPoint=dd}{CGSize=dd}}"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a1, __s);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bs_CGRectValue");
      BSNSStringFromCGRect();
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (!strcmp(v8, "{CGPoint=dd}"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a1, __s);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bs_CGPointValue");
      BSNSStringFromCGPoint();
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (!strcmp(v8, "{CGSize=dd}"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a1, __s);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "bs_CGSizeValue");
      BSNSStringFromCGSize();
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (!strcmp(v8, "{_NSRange=QQ}"))
    {
      objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithBytes:objCType:", a1, __s);
      v14 = (id)objc_claimAutoreleasedReturnValue();
      v23.location = objc_msgSend(v14, "rangeValue");
      NSStringFromRange(v23);
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    if (!strcmp(v8, "^v"))
    {
      objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), *(_QWORD *)a1, v22);
LABEL_35:
      v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
LABEL_36:
      v18 = v20;
      goto LABEL_33;
    }
    if (v13 > 82)
    {
      switch(v13)
      {
        case '^':
          v16 = (void *)MEMORY[0x1E0CB3940];
          if ((a3 & 1) != 0)
            goto LABEL_64;
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p -> %p"), a1, *(_QWORD *)a1);
          goto LABEL_35;
        case '_':
        case 'a':
        case 'e':
        case 'g':
        case 'h':
        case 'j':
        case 'k':
        case 'm':
        case 'n':
        case 'o':
        case 'p':
        case 'r':
          goto LABEL_66;
        case 'b':
          objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%i (?)"), *a1 & ~(-1 << atoi(__s + 1)), v22);
          goto LABEL_35;
        case 'c':
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithChar:", *(char *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 'd':
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", *(double *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 'f':
          LODWORD(v15) = *a1;
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithFloat:", v15);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 'i':
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInt:", *a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 'l':
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLong:", *(_QWORD *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 'q':
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithLongLong:", *(_QWORD *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        case 's':
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithShort:", *(__int16 *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        default:
          if (v13 == 83)
          {
            objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", *(unsigned __int16 *)a1);
            v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
            goto LABEL_36;
          }
          if (v13 != 123)
            goto LABEL_66;
          break;
      }
      goto LABEL_58;
    }
    if (v13 > 66)
    {
      if (v13 > 75)
      {
        if (v13 == 76)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLong:", *(_QWORD *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        if (v13 == 81)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", *(_QWORD *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
      }
      else
      {
        if (v13 == 67)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedChar:", *(unsigned __int8 *)a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        if (v13 == 73)
        {
          objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", *a1);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
      }
      goto LABEL_66;
    }
    if (v13 > 57)
    {
      if (v13 != 58)
      {
        if (v13 == 66)
        {
          if (*(_BYTE *)a1)
            v21 = CFSTR("YES");
          else
            v21 = CFSTR("NO");
          v20 = v21;
          goto LABEL_36;
        }
LABEL_66:
        objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("Value not representable, %s"), v8, v22);
        goto LABEL_35;
      }
      if ((a3 & 1) == 0)
      {
        NSStringFromSelector(*(SEL *)a1);
        v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
        goto LABEL_36;
      }
    }
    else
    {
      if (v13 != 35)
      {
        if (v13 == 40)
        {
LABEL_58:
          _MSVStructDescription(a1, __s);
          v20 = (__CFString *)objc_claimAutoreleasedReturnValue();
          goto LABEL_36;
        }
        goto LABEL_66;
      }
      if ((a3 & 1) == 0)
      {
        v20 = a1;
        goto LABEL_36;
      }
    }
    v16 = (void *)MEMORY[0x1E0CB3940];
LABEL_64:
    objc_msgSend(v16, "stringWithFormat:", CFSTR("%p"), a1, v22);
    goto LABEL_35;
  }
  v14 = *(id *)a1;
  if (a3)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%p"), v14);
    goto LABEL_26;
  }
  if (_NSIsNSString())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@\"%@\""), v14);
    goto LABEL_26;
  }
  if (_NSIsNSNumber())
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("@(%@)"), v14);
LABEL_26:
    v17 = objc_claimAutoreleasedReturnValue();
LABEL_32:
    v18 = (__CFString *)v17;

  }
  else
  {
    if (v14)
    {
      objc_msgSend(v14, "__msv_objectDescription");
      v17 = objc_claimAutoreleasedReturnValue();
      goto LABEL_32;
    }
    v18 = CFSTR("nil");
  }
LABEL_33:
  free(v8);
  return v18;
}

id _MSVStructDescription(_DWORD *a1, char *__s1)
{
  char *v4;
  int v5;
  const __CFString *v6;
  void *v7;
  int v8;
  uint64_t v9;
  uint64_t v10;
  char *v11;
  char *v12;
  int v13;
  int v14;
  char *v15;
  int v16;
  int v17;
  int v18;
  _DWORD *v19;
  uint64_t v20;
  BOOL v21;
  const __CFString *v22;
  _DWORD *v23;
  _BOOL4 v24;
  NSUInteger v25;
  void *v26;
  void *v27;
  int v28;
  void *v29;
  uint64_t v30;
  void *v31;
  NSUInteger v32;
  uint64_t v33;
  const __CFString *v34;
  char *v36;
  NSUInteger alignp;
  NSUInteger sizep;

  v4 = strdup(__s1);
  v5 = *__s1;
  v6 = CFSTR("{");
  if (v5 == 40)
    v6 = CFSTR("[values are interpreted] (");
  v36 = v4;
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithFormat:", CFSTR("%@\n"), v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v4[strlen(v4) - 1] = 0;
  do
    v8 = *v4++;
  while (v8 != 61);
  v9 = 0;
  do
  {
    while (1)
    {
      v10 = (uint64_t)(*v4 == 34 ? v4 + 1 : v4);
      v11 = (char *)v10;
      do
      {
        v12 = v11;
        v13 = *v11++;
      }
      while (v13 != 34);
      v14 = 0;
      *v12 = 0;
      v15 = v11;
      do
      {
        v16 = *v15;
        if (v16 == 40 || v16 == 123 || v16 == 91)
          ++v14;
        if (v16 == 41 || v16 == 125 || v16 == 93)
          --v14;
        ++v15;
      }
      while (v14 > 0);
      while (*v15)
      {
        if (*v15 == 34)
        {
          *v15 = 0;
          v4 = v15 + 1;
          goto LABEL_27;
        }
        ++v15;
      }
      v4 = 0;
LABEL_27:
      if (*v11 != 98)
        break;
      v17 = atoi(v12 + 2);
      v18 = v17;
      v19 = a1 + 1;
      if (v5 == 40)
        v19 = a1;
      if ((unint64_t)(v9 + v17) > 0x20)
      {
        v9 = 0;
        a1 = v19;
      }
      v20 = (*a1 >> v9) & ~(-1 << v17);
      if (v17 == 1)
      {
        v21 = (_DWORD)v20 == 0;
        v22 = CFSTR("YES");
        if (v21)
          v22 = CFSTR("NO");
        objc_msgSend(v7, "appendFormat:", CFSTR("\t\t.%s (%s): %@\n"), v10, v11, v22);
      }
      else
      {
        objc_msgSend(v7, "appendFormat:", CFSTR("\t\t.%s (%s): %u\n"), v10, v11, v20);
      }
      v33 = v18;
      if (v5 == 40)
        v33 = 0;
      v9 += v33;
      if (!v4)
        goto LABEL_52;
    }
    alignp = 0;
    sizep = 0;
    NSGetSizeAndAlignment(v11, &sizep, &alignp);
    v23 = a1 + 1;
    if (v9)
      v24 = v5 == 40;
    else
      v24 = 1;
    if (v24)
      v23 = a1;
    v25 = ((unint64_t)v23 + alignp - 1) & -(uint64_t)alignp;
    _MSVDebugIvarValue(((_DWORD)v23 + alignp - 1) & -(int)alignp, v11);
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = v26;
    v28 = *v11;
    if (v28 == 123 || v28 == 40)
    {
      objc_msgSend(v26, "componentsSeparatedByString:", CFSTR("\n"));
      v29 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v29, "componentsJoinedByString:", CFSTR("\n\t"));
      v30 = objc_claimAutoreleasedReturnValue();

      v27 = (void *)v30;
    }
    _MSVObjCTypeDescription(v11);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "appendFormat:", CFSTR("\t\t.%s (%@): %@\n"), v10, v31, v27);

    v32 = sizep;
    if (v5 == 40)
      v32 = 0;
    a1 = (_DWORD *)(v32 + v25);

    v9 = 0;
  }
  while (v4);
LABEL_52:
  v34 = CFSTR("}");
  if (v5 == 40)
    v34 = CFSTR(")");
  objc_msgSend(v7, "appendFormat:", CFSTR("\t%@"), v34);
  free(v36);
  return v7;
}

void sub_1A07A8E8C(void *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, void *a12)
{
  objc_begin_catch(a1);
  if (a2 == 2)
  {
    objc_end_catch();
    JUMPOUT(0x1A07A8E60);
  }
  free(a12);
  objc_exception_rethrow();
}

void sub_1A07A8ECC(_Unwind_Exception *a1)
{
  objc_end_catch();
  _Unwind_Resume(a1);
}

uint64_t MSVProcessIsUsingRoots()
{
  uint64_t result;

  result = os_variant_has_internal_content();
  if ((_DWORD)result)
    return dyld_shared_cache_some_image_overridden();
  return result;
}

void *MSVProcessLinkMediaFrameworks()
{
  dlopen("/System/Library/Frameworks/MediaPlayer.framework/MediaPlayer", 1);
  dlopen("/System/Library/PrivateFrameworks/AirTraffic.framework/AirTraffic", 1);
  dlopen("/System/Library/PrivateFrameworks/DAAPKit.framework/DAAPKit", 1);
  dlopen("/System/Library/PrivateFrameworks/HomeSharing.framework/HomeSharing", 1);
  dlopen("/System/Library/PrivateFrameworks/iTunesCloud.framework/iTunesCloud", 1);
  dlopen("/System/Library/PrivateFrameworks/MediaLibraryCore.framework/MediaLibraryCore", 1);
  dlopen("/System/Library/PrivateFrameworks/MediaPlaybackCore.framework/MediaPlaybackCore", 1);
  dlopen("/System/Library/PrivateFrameworks/MusicLibrary.framework/MusicLibrary", 1);
  return dlopen("/System/Library/PrivateFrameworks/MediaFoundation.framework/MediaFoundation", 1);
}

uint64_t MSVGetDiskUsageForPath(void *a1)
{
  id v1;
  void *v2;
  id v3;
  NSObject *v4;
  int *v5;
  char *v6;
  uint8_t buf[4];
  id v9;
  __int16 v10;
  char *v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  v2 = v1;
  if (v1)
  {
    v3 = objc_retainAutorelease(v1);
    objc_msgSend(v3, "UTF8String");
    if (dirstat_np() == -1)
    {
      v4 = os_log_create("com.apple.amp.MediaServices", "Default");
      if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      {
        v5 = __error();
        v6 = strerror(*v5);
        *(_DWORD *)buf = 138543618;
        v9 = v3;
        v10 = 2080;
        v11 = v6;
        _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_ERROR, "MSVGetUsageForPath encountered error. path=%{public}@ err=%s", buf, 0x16u);
      }

    }
  }

  return 0;
}

uint64_t MSVEnableDirStatsForDirectory(void *a1)
{
  id v1;
  NSObject *v2;
  int *v3;
  char *v4;
  NSObject *v5;
  id v6;
  NSObject *v7;
  int *v8;
  char *v9;
  uint64_t v10;
  uint64_t v11;
  int v13;
  id v14;
  __int16 v15;
  char *v16;
  uint8_t buf[16];
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  __int128 v31;
  __int128 v32;
  __int128 v33;
  uint64_t v34;

  v34 = *MEMORY[0x1E0C80C00];
  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)buf = 0u;
  v1 = objc_retainAutorelease(a1);
  if (fsctl((const char *)objc_msgSend(v1, "UTF8String"), 0xC1104A71uLL, buf, 0))
  {
    v2 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      v3 = __error();
      v4 = strerror(*v3);
      v13 = 138478083;
      v14 = v1;
      v15 = 2080;
      v16 = v4;
      _os_log_impl(&dword_1A077D000, v2, OS_LOG_TYPE_ERROR, "Unable to check dirstats for directory %{private}@, error %s", (uint8_t *)&v13, 0x16u);
    }

  }
  else
  {
    v11 = v19;

    if (v11)
    {
LABEL_12:
      v10 = 1;
      goto LABEL_13;
    }
  }
  v5 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138543362;
    *(_QWORD *)&buf[4] = v1;
    _os_log_impl(&dword_1A077D000, v5, OS_LOG_TYPE_DEFAULT, "MSVEnableDirStatsForDirectory - Enabling dirstat for path %{public}@", buf, 0xCu);
  }

  v32 = 0u;
  v33 = 0u;
  v30 = 0u;
  v31 = 0u;
  v28 = 0u;
  v29 = 0u;
  v26 = 0u;
  v27 = 0u;
  v24 = 0u;
  v25 = 0u;
  v22 = 0u;
  v23 = 0u;
  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  *(_OWORD *)buf = 0u;
  *(_DWORD *)&buf[4] = 1;
  v6 = objc_retainAutorelease(v1);
  if (!fsctl((const char *)objc_msgSend(v6, "UTF8String"), 0xC1104A71uLL, buf, 0))
    goto LABEL_12;
  v7 = os_log_create("com.apple.amp.MediaServices", "Default");
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
  {
    v8 = __error();
    v9 = strerror(*v8);
    v13 = 138478083;
    v14 = v6;
    v15 = 2080;
    v16 = v9;
    _os_log_impl(&dword_1A077D000, v7, OS_LOG_TYPE_ERROR, "Unable to enable dirstats for directory %{private}@, error %s", (uint8_t *)&v13, 0x16u);
  }

  v10 = 0;
LABEL_13:

  return v10;
}

id _MSVSanitizedPropertyListValue(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  void *v4;
  id v5;

  v1 = a1;
  if (_NSIsNSArray())
  {
    objc_msgSend(v1, "msv_compactMap:", &__block_literal_global_92);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (!_NSIsNSDictionary())
    {
      if (objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v1, 200))
        v5 = v1;
      else
        v5 = 0;
      goto LABEL_9;
    }
    objc_msgSend(v1, "msv_compactMapValues:", &__block_literal_global_93);
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  v3 = v2;
  if (objc_msgSend(v2, "count"))
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

LABEL_9:
  return v5;
}

id MSVBundleIDForTCCIdentity(uint64_t a1)
{
  void *v1;
  NSObject *v2;
  uint8_t v4[16];

  if (a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", tcc_identity_get_identifier());
    v1 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1A077D000, v2, OS_LOG_TYPE_ERROR, "MSVBundleIDForTCCIdentity() invalid input - returning nil. [clientIdentity=nil]", v4, 2u);
    }

    v1 = 0;
  }
  return v1;
}

void MSVAuditTokenForCurrentProcess(uint64_t a1@<X8>)
{
  __int128 v1;
  kern_return_t v2;
  mach_error_t v3;
  NSObject *v4;
  char *v5;
  mach_msg_type_number_t task_info_outCnt;
  uint8_t buf[4];
  char *v8;
  __int16 v9;
  mach_error_t v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  *(_QWORD *)&v1 = -1;
  *((_QWORD *)&v1 + 1) = -1;
  *(_OWORD *)a1 = v1;
  *(_OWORD *)(a1 + 16) = v1;
  task_info_outCnt = 8;
  v2 = task_info(*MEMORY[0x1E0C83DA0], 0xFu, (task_info_t)a1, &task_info_outCnt);
  if (v2)
  {
    v3 = v2;
    v4 = os_log_create("com.apple.amp.MediaServices", "Default");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      v5 = mach_error_string(v3);
      *(_DWORD *)buf = 136446466;
      v8 = v5;
      v9 = 1024;
      v10 = v3;
      _os_log_impl(&dword_1A077D000, v4, OS_LOG_TYPE_ERROR, "MSVAuditTokenForCurrentProcess() failed: %{public}s (0x%x)", buf, 0x12u);
    }

  }
}

id MSVTCCIdentityForAuditToken()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  id v6;
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  id v12;

  v0 = (void *)tcc_server_create();
  v1 = (void *)tcc_credential_create_for_process_with_audit_token();
  v2 = (void *)tcc_message_options_create();
  tcc_message_options_set_reply_handler_policy();
  v3 = 0;
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__2081;
  v11 = __Block_byref_object_dispose__2082;
  v12 = 0;
  if (v1 && v0)
  {
    v6 = v0;
    tcc_server_message_get_identity_for_credential();

    v3 = (void *)v8[5];
  }
  v4 = v3;
  _Block_object_dispose(&v7, 8);

  return v4;
}

void sub_1A07AC6DC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2081(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2082(uint64_t a1)
{

}

void MSVLaunchApplication(void *a1, void *a2, void *a3)
{
  MSVLaunchApplicationWithOptions(a1, 0, a2, a3);
}

void MSVLaunchApplicationWithOptions(void *a1, void *a2, void *a3, void *a4)
{
  id v7;
  id v8;
  id v9;
  id v10;
  void *v11;
  NSObject *v12;
  NSObject *v13;
  dispatch_time_t v14;
  uint64_t v15;
  id v16;
  NSObject *v17;
  void *v18;
  void *v19;
  id v20;
  void *v21;
  void *v22;
  id v23;
  _QWORD handler[4];
  id v25;
  _QWORD v26[4];
  NSObject *v27;
  id v28;

  v7 = a1;
  v8 = a2;
  v23 = a3;
  v9 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVLaunchApplicationWithOptions(NSString *__strong, NSDictionary *__strong, __strong dispatch_queue_t, void (^__strong)(NSError *__strong))");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "handleFailureInFunction:file:lineNumber:description:", v22, CFSTR("MSVSystemUtilities.m"), 147, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("bundleID"));

  }
  v10 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  objc_msgSend(v10, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0D22D00]);
  if (v8)
    objc_msgSend(v10, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0D22D70]);
  objc_msgSend(MEMORY[0x1E0D23158], "optionsWithDictionary:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(0, 0);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = dispatch_source_create(MEMORY[0x1E0C80DD0], 0, 0, v12);
  v14 = dispatch_time(0, 10000000000);
  dispatch_source_set_timer(v13, v14, 0xFFFFFFFFFFFFFFFFLL, 0x989680uLL);
  v15 = MEMORY[0x1E0C809B0];
  v26[0] = MEMORY[0x1E0C809B0];
  v26[1] = 3221225472;
  v26[2] = __MSVLaunchApplicationWithOptions_block_invoke;
  v26[3] = &unk_1E43E8EC0;
  v27 = v13;
  v28 = v9;
  v16 = v9;
  v17 = v13;
  v18 = (void *)MEMORY[0x1A1AFBD28](v26);
  objc_msgSend(MEMORY[0x1E0D23170], "serviceWithDefaultShellEndpoint");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "openApplication:withOptions:completion:", v7, v11, v18);
  handler[0] = v15;
  handler[1] = 3221225472;
  handler[2] = __MSVLaunchApplicationWithOptions_block_invoke_2;
  handler[3] = &unk_1E43E9ED0;
  v25 = v18;
  v20 = v18;
  dispatch_source_set_event_handler(v17, handler);
  dispatch_resume(v17);

}

id MSVHomeSharingCacheDirectory()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  id v4;
  _QWORD v6[4];

  v6[3] = *MEMORY[0x1E0C80C00];
  NSSearchPathForDirectoriesInDomains(NSCachesDirectory, 1uLL, 1);
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "lastObject");
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v6[0] = v1;
  v6[1] = CFSTR("com.apple.mobileipod");
  v6[2] = CFSTR("HomeSharingLibraries");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v6, 3);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "pathWithComponents:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "length"))
  {
    v4 = v3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99DA0], "raise:format:", *MEMORY[0x1E0C99768], CFSTR("unable to create cache directory"));
    v4 = 0;
  }

  return v4;
}

uint64_t MSVDeviceOSHasInternalDiagnostics()
{
  return os_variant_has_internal_diagnostics();
}

uint64_t MSVCopyDeviceUniqueIdentifier()
{
  return MGCopyAnswer();
}

uint64_t MSVCopySystemBuildVersion()
{
  return MGCopyAnswer();
}

id MSVCreateTemporaryFileHandle(void *a1, _QWORD *a2)
{
  id v3;
  void *v4;
  id v5;
  const char *v6;
  size_t v7;
  char *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;

  v3 = a1;
  if (!v3)
  {
    NSTemporaryDirectory();
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringByAppendingPathComponent:", CFSTR("tmp.XXXXXX"));
    v3 = (id)objc_claimAutoreleasedReturnValue();

  }
  v5 = objc_retainAutorelease(v3);
  v6 = (const char *)objc_msgSend(v5, "fileSystemRepresentation");
  v7 = strlen(v6);
  v8 = strndup(v6, v7);
  v9 = mkstemp(v8);
  if ((int)v9 < 1)
  {
    v12 = 0;
  }
  else
  {
    v10 = v9;
    if (a2)
    {
      objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "stringWithFileSystemRepresentation:length:", v8, v7);
      *a2 = (id)objc_claimAutoreleasedReturnValue();

    }
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3608]), "initWithFileDescriptor:closeOnDealloc:", v10, 1);
  }
  free(v8);

  return v12;
}

uint64_t MSVGzipCompressFile(void *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  gzFile_s *v6;
  dispatch_semaphore_t v7;
  MSVStreamReader *v8;
  void *v9;
  MSVStreamReader *v10;
  uint64_t v11;
  NSObject *v12;
  NSObject *v13;
  int v14;
  uint64_t v15;
  _QWORD v17[4];
  NSObject *v18;
  uint64_t *v19;
  _QWORD v20[4];
  NSObject *v21;
  _QWORD v22[6];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  char v26;

  v3 = a1;
  v4 = a2;
  v23 = 0;
  v24 = &v23;
  v25 = 0x2020000000;
  v26 = 0;
  objc_msgSend(v4, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = gzopen((const char *)objc_msgSend(v5, "UTF8String"), "w9");

  if (v6)
  {
    v7 = dispatch_semaphore_create(0);
    v8 = [MSVStreamReader alloc];
    objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v3);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[MSVStreamReader initWithInputStream:queue:](v8, "initWithInputStream:queue:", v9, 0);

    v11 = MEMORY[0x1E0C809B0];
    v22[0] = MEMORY[0x1E0C809B0];
    v22[1] = 3221225472;
    v22[2] = __MSVGzipCompressFile_block_invoke;
    v22[3] = &unk_1E43E8EE8;
    v22[4] = &v23;
    v22[5] = v6;
    -[MSVStreamReader setDidReadDataBlock:](v10, "setDidReadDataBlock:", v22);
    v20[0] = v11;
    v20[1] = 3221225472;
    v20[2] = __MSVGzipCompressFile_block_invoke_2;
    v20[3] = &unk_1E43E9C88;
    v12 = v7;
    v21 = v12;
    -[MSVStreamReader setDidFinishReadingBlock:](v10, "setDidFinishReadingBlock:", v20);
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __MSVGzipCompressFile_block_invoke_3;
    v17[3] = &unk_1E43E8F10;
    v19 = &v23;
    v13 = v12;
    v18 = v13;
    -[MSVStreamReader setDidEncounterErrorBlock:](v10, "setDidEncounterErrorBlock:", v17);
    -[MSVStreamReader start](v10, "start");
    dispatch_semaphore_wait(v13, 0xFFFFFFFFFFFFFFFFLL);
    v14 = gzclose(v6);
    if (*((_BYTE *)v24 + 24))
      *((_BYTE *)v24 + 24) = v14 == 0;

  }
  v15 = *((unsigned __int8 *)v24 + 24);
  _Block_object_dispose(&v23, 8);

  return v15;
}

void sub_1A07ACFEC(_Unwind_Exception *a1)
{
  uint64_t v1;

  _Block_object_dispose((const void *)(v1 - 112), 8);
  _Unwind_Resume(a1);
}

BOOL MSVGzipDecompressFile()
{
  void *v0;
  void *v1;
  void *v2;
  id v3;
  id v4;
  id v5;
  gzFile_s *v6;
  void *v7;
  void *v8;
  char v9;
  void *v10;
  uint64_t v11;
  void *v12;
  int v13;
  void *v14;
  int v15;
  _BOOL8 v16;
  _BYTE buf[16384];
  uint64_t v19;

  v0 = (void *)MEMORY[0x1E0C80A78]();
  v2 = v1;
  v19 = *MEMORY[0x1E0C80C00];
  v3 = v0;
  v4 = v2;
  objc_msgSend(v3, "path");
  v5 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  v6 = gzopen((const char *)objc_msgSend(v5, "UTF8String"), "r");

  if (v6)
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "path");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v7, "fileExistsAtPath:", v8);

    if ((v9 & 1) == 0)
    {
      objc_msgSend(v4, "path");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v7, "createFileAtPath:contents:attributes:", v10, 0, 0);

    }
    objc_msgSend(MEMORY[0x1E0CB3608], "fileHandleForWritingToURL:error:", v4, 0);
    v11 = objc_claimAutoreleasedReturnValue();
    if (v11)
    {
      v12 = (void *)v11;
      while (1)
      {
        v13 = gzread(v6, buf, 0x4000u);
        if (v13 <= 0)
          break;
        objc_msgSend(MEMORY[0x1E0C99D50], "dataWithBytesNoCopy:length:freeWhenDone:", buf, v13, 0);
        v14 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v12, "writeData:", v14);

      }
      if (v13)
      {
        v15 = 0;
      }
      else
      {
        objc_msgSend(v12, "closeFile");

        v12 = 0;
        v15 = 1;
      }

    }
    else
    {
      v15 = 0;
    }

    v16 = v15 != 0;
  }
  else
  {
    v16 = 0;
  }

  return v16;
}

uint64_t MSVDeviceIsHomePod()
{
  return 0;
}

uint64_t MSVDeviceIsHomePodMini()
{
  return 0;
}

uint64_t MSVDeviceHasCellularBaseband()
{
  if (MSVDeviceHasCellularBaseband___once != -1)
    dispatch_once(&MSVDeviceHasCellularBaseband___once, &__block_literal_global_63);
  return MSVDeviceHasCellularBaseband___deviceHasCellularBaseband;
}

uint64_t MSVDeviceIsiPhone()
{
  if (MSVDeviceIsiPhone___once != -1)
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_69);
  return MSVDeviceIsiPhone___deviceIsPhone;
}

uint64_t MSVDeviceIsiPod()
{
  if (MSVDeviceIsiPod___once != -1)
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_70);
  return MSVDeviceIsiPod___deviceIsPod;
}

uint64_t MSVDeviceIsROSDevice()
{
  return 0;
}

BOOL MSVDeviceSupportsEnhancedMusic()
{
  return MSVDeviceSupportsLosslessMusic() || MSVDeviceSupportsMultiChannelMusic();
}

BOOL MSVDeviceSupportsLosslessMusic()
{
  if (MSVDeviceIsiPhone___once != -1)
    dispatch_once(&MSVDeviceIsiPhone___once, &__block_literal_global_69);
  if (MSVDeviceIsiPhone___deviceIsPhone)
    return 1;
  if (MSVDeviceIsiPod___once != -1)
    dispatch_once(&MSVDeviceIsiPod___once, &__block_literal_global_70);
  if (MSVDeviceIsiPod___deviceIsPod)
    return 1;
  if (MSVDeviceIsiPad___once != -1)
    dispatch_once(&MSVDeviceIsiPad___once, &__block_literal_global_2127);
  return MSVDeviceIsiPad___deviceIsiPad != 0;
}

id MSVGetDeviceHardwarePlatform()
{
  if (MSVGetDeviceHardwarePlatform_onceToken != -1)
    dispatch_once(&MSVGetDeviceHardwarePlatform_onceToken, &__block_literal_global_101);
  return (id)MSVGetDeviceHardwarePlatform___hardwarePlatform;
}

void sub_1A07AF0CC(_Unwind_Exception *a1)
{
  uint64_t v1;

  objc_destroyWeak((id *)(v1 - 80));
  _Unwind_Resume(a1);
}

void sub_1A07AF374(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  uint64_t v9;
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Block_object_dispose((const void *)(v9 - 80), 8);
  _Unwind_Resume(a1);
}

void sub_1A07AF5BC(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v3 - 112));
  _Unwind_Resume(a1);
}

void sub_1A07AF804(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  id *v3;
  uint64_t v4;

  objc_destroyWeak(v3);
  objc_destroyWeak(v2);
  objc_destroyWeak(v1);
  objc_destroyWeak((id *)(v4 - 104));
  _Unwind_Resume(a1);
}

void sub_1A07B0390(_Unwind_Exception *a1, int a2)
{
  if (a2)
  {
    objc_end_catch();
    JUMPOUT(0x1A07B039CLL);
  }
  _Unwind_Resume(a1);
}

void sub_1A07B03AC(_Unwind_Exception *a1)
{
  int v1;

  if (v1)
    objc_end_catch();
  _Unwind_Resume(a1);
}

void sub_1A07B03C4(uint64_t a1, int a2)
{
  if (a2)
    objc_terminate();
  JUMPOUT(0x1A07B03D0);
}

uint64_t __Block_byref_object_copy__2578(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2579(uint64_t a1)
{

}

void sub_1A07B0A50(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void __getSDRDiagnosticReporterClass_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;

  SymptomDiagnosticReporterLibrary();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = objc_getClass("SDRDiagnosticReporter");
  if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    getSDRDiagnosticReporterClass_softClass = *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "Class getSDRDiagnosticReporterClass(void)_block_invoke");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MSVAutoBugCapture.m"), 30, CFSTR("Unable to find class %s"), "SDRDiagnosticReporter");

    __break(1u);
  }
}

void sub_1A07B1348(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, ...)
{
  va_list va;

  va_start(va, a3);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void *SymptomDiagnosticReporterLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
    SymptomDiagnosticReporterLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)SymptomDiagnosticReporterLibraryCore_frameworkLibrary;
  if (!SymptomDiagnosticReporterLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SymptomDiagnosticReporterLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("MSVAutoBugCapture.m"), 29, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void *MSVWeakLinkSymbol(const char *a1, void *a2)
{
  void *result;

  result = (void *)_MSVDYLDHandle(a2);
  if (result)
    return dlsym(result, a1);
  return result;
}

uint64_t _MSVDYLDHandle(void *a1)
{
  id v1;
  void *v2;
  id v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  id v14;
  uint64_t v15;
  void *i;
  void *v17;
  void *v18;
  NSObject *v19;
  uint64_t v20;
  void *v22;
  _QWORD block[4];
  id v24;
  uint64_t *v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  uint64_t v30;
  uint64_t *v31;
  uint64_t v32;
  uint64_t v33;
  _QWORD v34[4];
  _QWORD v35[4];
  _QWORD v36[4];
  _QWORD v37[5];

  v37[3] = *MEMORY[0x1E0C80C00];
  v1 = a1;
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "fileExistsAtPath:", v1))
  {
    v3 = v1;
  }
  else
  {
    v4 = CFSTR("/");
    v5 = (void *)MEMORY[0x1E0CB3940];
    v36[0] = CFSTR("/");
    v36[1] = CFSTR("System");
    v36[2] = CFSTR("Library");
    v36[3] = CFSTR("PrivateFrameworks");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v36, 4);
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "pathWithComponents:", v22);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v37[0] = v6;
    v7 = (void *)MEMORY[0x1E0CB3940];
    v35[0] = CFSTR("/");
    v35[1] = CFSTR("System");
    v35[2] = CFSTR("Library");
    v35[3] = CFSTR("Frameworks");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v35, 4);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "pathWithComponents:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v37[1] = v9;
    v10 = (void *)MEMORY[0x1E0CB3940];
    v34[0] = CFSTR("/");
    v34[1] = CFSTR("AppleInternal");
    v34[2] = CFSTR("Library");
    v34[3] = CFSTR("Frameworks");
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v34, 4);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "pathWithComponents:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v37[2] = v12;
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v37, 3);
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    v28 = 0u;
    v29 = 0u;
    v26 = 0u;
    v27 = 0u;
    v14 = v13;
    v3 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, &v30, 16);
    if (v3)
    {
      v15 = *(_QWORD *)v27;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(_QWORD *)v27 != v15)
            objc_enumerationMutation(v14);
          objc_msgSend(*(id *)(*((_QWORD *)&v26 + 1) + 8 * (_QWORD)i), "stringByAppendingPathComponent:", v1);
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "stringByAppendingPathExtension:", CFSTR("framework"));
          v18 = (void *)objc_claimAutoreleasedReturnValue();

          if (objc_msgSend(v2, "fileExistsAtPath:", v18))
          {
            objc_msgSend(v18, "stringByAppendingPathComponent:", v1);
            v3 = (id)objc_claimAutoreleasedReturnValue();

            goto LABEL_13;
          }

        }
        v3 = (id)objc_msgSend(v14, "countByEnumeratingWithState:objects:count:", &v26, &v30, 16);
        if (v3)
          continue;
        break;
      }
    }
LABEL_13:

  }
  v30 = 0;
  v31 = &v30;
  v32 = 0x2020000000;
  v33 = 0;
  if (_MSVDYLDHandle___once != -1)
  {
    dispatch_once(&_MSVDYLDHandle___once, &__block_literal_global_2767);
    if (v3)
      goto LABEL_16;
LABEL_18:
    NSLog(CFSTR("Framework %@ could not be found."), v1);
    goto LABEL_19;
  }
  if (!v3)
    goto LABEL_18;
LABEL_16:
  v19 = __handlesQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___MSVDYLDHandle_block_invoke_2;
  block[3] = &unk_1E43E9F70;
  v25 = &v30;
  v24 = v3;
  dispatch_sync(v19, block);

LABEL_19:
  v20 = v31[3];
  _Block_object_dispose(&v30, 8);

  return v20;
}

void sub_1A07B2600(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,char a26)
{
  _Block_object_dispose(&a26, 8);
  _Unwind_Resume(a1);
}

id *MSVWeakLinkStringConstant(const char *a1, void *a2)
{
  id *v3;

  v3 = (id *)_MSVDYLDHandle(a2);
  if (v3)
  {
    v3 = (id *)dlsym(v3, a1);
    if (v3)
      v3 = (id *)*v3;
  }
  return v3;
}

id MSVWeakLinkClass(void *a1, void *a2)
{
  NSString *v3;
  void *v4;
  id v5;

  v3 = a1;
  v4 = (void *)_MSVDYLDHandle(a2);
  if (v4)
    v4 = NSClassFromString(v3);
  v5 = v4;

  return v5;
}

double MSVHasherCreate@<D0>(uint64_t a1@<X8>)
{
  uint64_t v2;
  double result;
  uint64_t v4;

  v2 = MSVHasherSharedSeed();
  result = 0.0;
  *(_OWORD *)(a1 + 40) = 0u;
  *(_OWORD *)(a1 + 56) = 0u;
  *(_OWORD *)(a1 + 72) = 0u;
  *(_OWORD *)(a1 + 88) = 0u;
  *(_OWORD *)(a1 + 104) = 0u;
  *(_OWORD *)(a1 + 120) = 0u;
  *(_OWORD *)(a1 + 136) = 0u;
  *(_OWORD *)(a1 + 152) = 0u;
  *(_OWORD *)(a1 + 168) = 0u;
  *(_OWORD *)(a1 + 184) = 0u;
  *(_OWORD *)(a1 + 200) = 0u;
  *(_QWORD *)a1 = 1000;
  *(_QWORD *)(a1 + 8) = v2 ^ 0x736F6D6570736575;
  *(_QWORD *)(a1 + 16) = v4 ^ 0x646F72616E646F6DLL;
  *(_QWORD *)(a1 + 24) = v2 ^ 0x6C7967656E657261;
  *(_QWORD *)(a1 + 32) = v4 ^ 0x7465646279746573;
  return result;
}

id MSVHasherDigestDataBlocksFromURL(void *a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  MSVBlockGuard *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  MSVStreamReader *v14;
  uint64_t v15;
  id v16;
  id v17;
  id v18;
  MSVBlockGuard *v19;
  id v20;
  id v21;
  MSVBlockGuard *v22;
  id v23;
  id v24;
  MSVBlockGuard *v25;
  MSVStreamReader *v26;
  void *v27;
  id v28;
  uint64_t v30;
  uint64_t v31;
  void (*v32)(uint64_t);
  void *v33;
  MSVStreamReader *v34;
  MSVBlockGuard *v35;
  id v36;
  _QWORD v37[4];
  id v38;
  MSVBlockGuard *v39;
  id v40;
  _QWORD v41[4];
  id v42;
  MSVBlockGuard *v43;
  id v44;
  _QWORD v45[4];
  id v46;
  id v47;

  v5 = a1;
  v6 = a2;
  v7 = a3;
  v8 = objc_alloc_init(MEMORY[0x1E0CB38A8]);
  v9 = -[MSVBlockGuard initWithDeallocHandler:]([MSVBlockGuard alloc], "initWithDeallocHandler:", &__block_literal_global_2);
  if (objc_msgSend(v5, "isFileURL"))
  {
    objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "path");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "attributesOfItemAtPath:error:", v11, 0);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v8, "setTotalUnitCount:", objc_msgSend(v12, "fileSize"));
  }
  else
  {
    objc_msgSend(v8, "setTotalUnitCount:", -1);
  }
  objc_msgSend(MEMORY[0x1E0C99DB0], "inputStreamWithURL:", v5);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[MSVStreamReader initWithInputStream:queue:]([MSVStreamReader alloc], "initWithInputStream:queue:", v13, 0);
  v15 = MEMORY[0x1E0C809B0];
  v45[0] = MEMORY[0x1E0C809B0];
  v45[1] = 3221225472;
  v45[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_2;
  v45[3] = &unk_1E43E9390;
  v16 = v8;
  v46 = v16;
  v47 = v6;
  v17 = v6;
  -[MSVStreamReader setDidReadDataBlock:](v14, "setDidReadDataBlock:", v45);
  v41[0] = v15;
  v41[1] = 3221225472;
  v41[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_3;
  v41[3] = &unk_1E43E93B8;
  v18 = v16;
  v42 = v18;
  v19 = v9;
  v43 = v19;
  v20 = v7;
  v44 = v20;
  -[MSVStreamReader setDidFinishReadingBlock:](v14, "setDidFinishReadingBlock:", v41);
  v37[0] = v15;
  v37[1] = 3221225472;
  v37[2] = __MSVHasherDigestDataBlocksFromURL_block_invoke_4;
  v37[3] = &unk_1E43E9870;
  v21 = v18;
  v38 = v21;
  v22 = v19;
  v39 = v22;
  v23 = v20;
  v40 = v23;
  -[MSVStreamReader setDidEncounterErrorBlock:](v14, "setDidEncounterErrorBlock:", v37);
  v30 = v15;
  v31 = 3221225472;
  v32 = __MSVHasherDigestDataBlocksFromURL_block_invoke_5;
  v33 = &unk_1E43E93B8;
  v34 = v14;
  v35 = v22;
  v36 = v23;
  v24 = v23;
  v25 = v22;
  v26 = v14;
  objc_msgSend(v21, "setCancellationHandler:", &v30);
  -[MSVStreamReader start](v26, "start", v30, v31, v32, v33);
  v27 = v36;
  v28 = v21;

  return v28;
}

void sub_1A07B3094(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07B31E8(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07B3320(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__2839(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__2840(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__45(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AFBD28](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__46(uint64_t a1)
{

}

void sub_1A07B5340(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3331(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3332(uint64_t a1)
{

}

uint64_t __Block_byref_object_copy__3372(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3373(uint64_t a1)
{

}

_DWORD *_MSV_XXH_XXH32_update(_DWORD *result, char *__src, size_t __n)
{
  int v3;
  char *v4;
  _DWORD *v5;
  int v6;
  unsigned int v7;
  _BOOL4 v9;
  uint64_t v10;
  size_t v11;
  char *v12;
  unint64_t v13;
  int v14;
  int v15;
  int v16;
  int v17;
  int v18;
  unint64_t v19;

  if (__src)
  {
    v3 = __n;
    v4 = __src;
    v5 = result;
    v6 = result[1];
    v7 = *result + __n;
    v9 = __n > 0xF || v7 > 0xF;
    *result = v7;
    result[1] = v6 | v9;
    v10 = result[10];
    if (v10 + __n <= 0xF)
    {
      result = memcpy((char *)result + v10 + 24, __src, __n);
      LODWORD(v11) = v5[10] + v3;
LABEL_18:
      v5[10] = v11;
      return result;
    }
    v12 = &__src[__n];
    if ((_DWORD)v10)
    {
      result = memcpy((char *)result + v10 + 24, __src, (16 - v10));
      HIDWORD(v13) = v5[2] - 2048144777 * v5[6];
      LODWORD(v13) = HIDWORD(v13);
      v14 = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[3] - 2048144777 * v5[7];
      LODWORD(v13) = HIDWORD(v13);
      v5[2] = v14;
      v5[3] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[4] - 2048144777 * v5[8];
      LODWORD(v13) = HIDWORD(v13);
      v5[4] = -1640531535 * (v13 >> 19);
      HIDWORD(v13) = v5[5] - 2048144777 * v5[9];
      LODWORD(v13) = HIDWORD(v13);
      v5[5] = -1640531535 * (v13 >> 19);
      v4 += (16 - v5[10]);
      v5[10] = 0;
    }
    if (v4 <= v12 - 16)
    {
      v15 = v5[2];
      v16 = v5[3];
      v17 = v5[4];
      v18 = v5[5];
      do
      {
        HIDWORD(v19) = v15 - 2048144777 * *(_DWORD *)v4;
        LODWORD(v19) = HIDWORD(v19);
        v15 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v16 - 2048144777 * *((_DWORD *)v4 + 1);
        LODWORD(v19) = HIDWORD(v19);
        v16 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v17 - 2048144777 * *((_DWORD *)v4 + 2);
        LODWORD(v19) = HIDWORD(v19);
        v17 = -1640531535 * (v19 >> 19);
        HIDWORD(v19) = v18 - 2048144777 * *((_DWORD *)v4 + 3);
        LODWORD(v19) = HIDWORD(v19);
        v18 = -1640531535 * (v19 >> 19);
        v4 += 16;
      }
      while (v4 <= v12 - 16);
      v5[2] = v15;
      v5[3] = v16;
      v5[4] = v17;
      v5[5] = v18;
    }
    if (v4 < v12)
    {
      v11 = v12 - v4;
      result = memcpy(v5 + 6, v4, v11);
      goto LABEL_18;
    }
  }
  return result;
}

void _aggregateFunctionValue(sqlite3_context *a1)
{
  _QWORD *v2;
  _MSVSQLDatabaseFunctionContext *v3;
  id v4;
  void *v5;
  id v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  objc_super v11;

  sqlite3_user_data(a1);
  v2 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v3 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v3)
  {
    v11.receiver = v3;
    v11.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    v4 = -[sqlite3_context init](&v11, sel_init);
    v5 = v4;
    if (v4)
    {
      *((_QWORD *)v4 + 1) = a1;
      *((_DWORD *)v4 + 4) = 0;
      *((_QWORD *)v4 + 3) = 0;
    }
  }
  else
  {
    v5 = 0;
  }
  v6 = *(id *)sqlite3_aggregate_context(a1, 8);
  if (v2)
    v7 = v2[7];
  else
    v7 = 0;
  (*(void (**)(uint64_t, void *, id))(v7 + 16))(v7, v5, v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8 != v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _aggregateFunctionValue(sqlite3_context *)");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "handleFailureInFunction:file:lineNumber:description:", v10, CFSTR("MSVSQLDatabase.m"), 1301, CFSTR("function did not return any result"));

  }
}

void _aggregateFunctionInverse(sqlite3_context *a1, int a2, uint64_t a3)
{
  _QWORD *v6;
  _MSVSQLDatabaseFunctionContext *v7;
  id v8;
  void *v9;
  void **v10;
  void *v11;
  _QWORD *v12;
  void (*v13)(void);
  _QWORD *v14;
  uint64_t v15;
  objc_super v16;

  sqlite3_user_data(a1);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v7)
  {
    v16.receiver = v7;
    v16.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    v8 = -[sqlite3_context init](&v16, sel_init);
    v9 = v8;
    if (v8)
    {
      *((_QWORD *)v8 + 1) = a1;
      *((_DWORD *)v8 + 4) = a2;
      *((_QWORD *)v8 + 3) = a3;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = (void **)sqlite3_aggregate_context(a1, 8);
  v11 = *v10;
  if (v6)
    v12 = (_QWORD *)v6[6];
  else
    v12 = 0;
  v13 = (void (*)(void))v12[2];
  v14 = v12;
  v13();
  v15 = objc_claimAutoreleasedReturnValue();

  *v10 = (void *)v15;
}

void _aggregateFunctionStep(sqlite3_context *a1, int a2, uint64_t a3)
{
  _QWORD *v6;
  _MSVSQLDatabaseFunctionContext *v7;
  id v8;
  void *v9;
  void **v10;
  void *v11;
  _QWORD *v12;
  void (*v13)(void);
  _QWORD *v14;
  _QWORD *v15;
  void (*v16)(void);
  _QWORD *v17;
  uint64_t v18;
  objc_super v19;

  sqlite3_user_data(a1);
  v6 = (_QWORD *)objc_claimAutoreleasedReturnValue();
  v7 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v7)
  {
    v19.receiver = v7;
    v19.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    v8 = -[sqlite3_context init](&v19, sel_init);
    v9 = v8;
    if (v8)
    {
      *((_QWORD *)v8 + 1) = a1;
      *((_DWORD *)v8 + 4) = a2;
      *((_QWORD *)v8 + 3) = a3;
    }
  }
  else
  {
    v9 = 0;
  }
  v10 = (void **)sqlite3_aggregate_context(a1, 8);
  v11 = *v10;
  if (!*v10)
  {
    if (v6)
      v12 = (_QWORD *)v6[4];
    else
      v12 = 0;
    v13 = (void (*)(void))v12[2];
    v14 = v12;
    v13();
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    *v10 = v11;
  }
  if (v6)
    v15 = (_QWORD *)v6[5];
  else
    v15 = 0;
  v16 = (void (*)(void))v15[2];
  v17 = v15;
  v16();
  v18 = objc_claimAutoreleasedReturnValue();

  *v10 = (void *)v18;
}

void _aggregateFunctionFinal(sqlite3_context *a1)
{
  void *v2;

  _aggregateFunctionValue(a1);
  v2 = *(void **)sqlite3_aggregate_context(a1, 8);
  if (v2)

}

void _scalarFunctionImplementation(sqlite3_context *a1, int a2, uint64_t a3)
{
  void (**v6)(_QWORD, _QWORD);
  _MSVSQLDatabaseFunctionContext *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  objc_super v13;

  sqlite3_user_data(a1);
  v6 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
  v7 = [_MSVSQLDatabaseFunctionContext alloc];
  if (v7)
  {
    v13.receiver = v7;
    v13.super_class = (Class)_MSVSQLDatabaseFunctionContext;
    v8 = -[sqlite3_context init](&v13, sel_init);
    v9 = v8;
    if (v8)
    {
      *((_QWORD *)v8 + 1) = a1;
      *((_DWORD *)v8 + 4) = a2;
      *((_QWORD *)v8 + 3) = a3;
    }
  }
  else
  {
    v9 = 0;
  }
  ((void (**)(_QWORD, void *))v6)[2](v6, v9);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10 != v9)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void _scalarFunctionImplementation(sqlite3_context *, int, sqlite3_value **)");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInFunction:file:lineNumber:description:", v12, CFSTR("MSVSQLDatabase.m"), 1268, CFSTR("function did not return any result"));

  }
}

uint64_t _MSV_XXH_XXH32_digest(uint64_t a1)
{
  int v1;
  unsigned int v2;
  int *v3;
  unint64_t v4;
  int v5;
  unint64_t v6;
  int v7;
  unint64_t v8;
  unsigned int v9;

  if (*(_DWORD *)(a1 + 4))
    v1 = vaddvq_s32((int32x4_t)vorrq_s8((int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1A07D4D20), (int8x16_t)vshlq_u32(*(uint32x4_t *)(a1 + 8), (uint32x4_t)xmmword_1A07D4D10)));
  else
    v1 = *(_DWORD *)(a1 + 16) + 374761393;
  v2 = *(_DWORD *)a1 + v1;
  v3 = (int *)(a1 + 24);
  v4 = *(_DWORD *)(a1 + 40) & 0xF;
  if ((*(_DWORD *)(a1 + 40) & 0xFu) >= 4)
  {
    do
    {
      v5 = *v3++;
      HIDWORD(v6) = v2 - 1028477379 * v5;
      LODWORD(v6) = HIDWORD(v6);
      v2 = 668265263 * (v6 >> 15);
      v4 -= 4;
    }
    while (v4 > 3);
  }
  for (; v4; --v4)
  {
    v7 = *(unsigned __int8 *)v3;
    v3 = (int *)((char *)v3 + 1);
    HIDWORD(v8) = v2 + 374761393 * v7;
    LODWORD(v8) = HIDWORD(v8);
    v2 = -1640531535 * (v8 >> 21);
  }
  v9 = -1028477379 * ((-2048144777 * (v2 ^ (v2 >> 15))) ^ ((-2048144777 * (v2 ^ (v2 >> 15))) >> 13));
  return v9 ^ HIWORD(v9);
}

_QWORD *__MSVNanoIDSetTestingArc4StateSeed(uint64_t a1, unint64_t a2)
{
  _QWORD *result;
  _QWORD *v5;
  uint64_t v6;
  uint64_t v7;
  unint64_t v8;
  int v9;
  uint64_t v10;
  int v11;
  uint64_t v12;
  int v13;
  int v14;
  uint64_t v15;
  char v16;

  if (__MSVNanoIDTestingArc4State)
  {
    free((void *)__MSVNanoIDTestingArc4State);
    __MSVNanoIDTestingArc4State = 0;
  }
  result = malloc_type_malloc(0x10uLL, 0x1010040466105CCuLL);
  __MSVNanoIDTestingArc4State = (uint64_t)result;
  if (result)
  {
    v5 = result;
    *result = 0;
    result = malloc_type_malloc(0x100uLL, 0xE14FBD05uLL);
    v6 = 0;
    v5[1] = result;
    do
    {
      *(_BYTE *)(v5[1] + v6) = v6;
      ++v6;
    }
    while (v6 != 256);
    v7 = __MSVNanoIDTestingArc4State;
  }
  else
  {
    v7 = 0;
  }
  v8 = 0;
  v9 = 0;
  v10 = *(_QWORD *)(v7 + 8);
  do
  {
    v11 = *(unsigned __int8 *)(v10 + v8);
    v9 += v11 + *(unsigned __int8 *)(a1 + v8 % a2);
    *(_BYTE *)(v10 + v8) = *(_BYTE *)(v10 + v9);
    *(_BYTE *)(v10 + v9) = v11;
    ++v8;
  }
  while (v8 != 255);
  v12 = *(_QWORD *)(v7 + 8);
  v13 = 768;
  LODWORD(v15) = *(_DWORD *)v7;
  v14 = *(_DWORD *)(v7 + 4);
  do
  {
    v15 = (v15 + 1);
    v16 = *(_BYTE *)(v12 + v15);
    LOBYTE(v14) = v16 + v14;
    *(_BYTE *)(v12 + v15) = *(_BYTE *)(v12 + v14);
    *(_BYTE *)(v12 + v14) = v16;
    --v13;
  }
  while (v13);
  *(_DWORD *)v7 = v15;
  *(_DWORD *)(v7 + 4) = v14;
  return result;
}

id MSVNanoIDCreate()
{
  return MSVNanoIDCreateWithCharacters(CFSTR("0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ_abcdefghijklmnopqrstuvwxyz-"), 21);
}

id MSVNanoIDCreateWithRandomSource(void *a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  uint64_t v7;
  id v8;
  uint64_t v9;
  id v10;
  uint64_t v11;
  _BYTE *v12;
  uint64_t v13;
  void *v14;

  v5 = a1;
  objc_msgSend(a3, "mutableBytesWithLength:", a2);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v5, "length");
  v8 = objc_retainAutorelease(v5);
  v9 = objc_msgSend(v8, "cStringUsingEncoding:", 4);
  v10 = objc_retainAutorelease(v6);
  v11 = objc_msgSend(v10, "mutableBytes");
  if (a2 >= 1)
  {
    v12 = (_BYTE *)v11;
    v13 = a2;
    do
    {
      *v12 = *(_BYTE *)(v9 + (char)*v12 % v7);
      ++v12;
      --v13;
    }
    while (v13);
  }
  v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithBytes:length:encoding:", v11, a2, 4);

  return v14;
}

BOOL msv_dispatch_sync_on_main_queue(void *a1)
{
  void (**v1)(_QWORD);
  int v2;

  v1 = a1;
  v2 = pthread_main_np();
  if (v2 == 1)
    v1[2](v1);
  else
    dispatch_sync(MEMORY[0x1E0C80D38], v1);

  return v2 == 1;
}

uint64_t msv_dispatch_sync_BOOL(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  char v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_BOOL_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = *((unsigned __int8 *)v11 + 24);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t msv_dispatch_sync_int64(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_int64_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_int64_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_uint64(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_uint64_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_uint64_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_int32(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_int32_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = *((unsigned int *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_int32_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_uint32(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  int v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_uint32_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = *((unsigned int *)v11 + 6);

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_uint32_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_int(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_int_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_int_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

uint64_t msv_dispatch_sync_uint(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_uint_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __msv_dispatch_sync_uint_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = result;
  return result;
}

float msv_dispatch_sync_float(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  float v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  float *v11;
  uint64_t v12;
  int v13;

  v3 = a2;
  v10 = 0;
  v11 = (float *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_float_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = v11[6];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __msv_dispatch_sync_float_block_invoke(uint64_t a1)
{
  *(float *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(float (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

double msv_dispatch_sync_double(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  double v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  double *v11;
  uint64_t v12;
  uint64_t v13;

  v3 = a2;
  v10 = 0;
  v11 = (double *)&v10;
  v12 = 0x2020000000;
  v13 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_double_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = v11[3];

  _Block_object_dispose(&v10, 8);
  return v5;
}

void __msv_dispatch_sync_double_block_invoke(uint64_t a1)
{
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = (*(double (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

id msv_dispatch_sync_object(NSObject *a1, void *a2)
{
  id v3;
  id v4;
  id v5;
  _QWORD v7[4];
  id v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t *v11;
  uint64_t v12;
  uint64_t (*v13)(uint64_t, uint64_t);
  void (*v14)(uint64_t);
  id v15;

  v3 = a2;
  v10 = 0;
  v11 = &v10;
  v12 = 0x3032000000;
  v13 = __Block_byref_object_copy__3614;
  v14 = __Block_byref_object_dispose__3615;
  v15 = 0;
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __msv_dispatch_sync_object_block_invoke;
  v7[3] = &unk_1E43E9628;
  v8 = v3;
  v9 = &v10;
  v4 = v3;
  dispatch_sync(a1, v7);
  v5 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v5;
}

uint64_t __Block_byref_object_copy__3614(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3615(uint64_t a1)
{

}

void __msv_dispatch_sync_object_block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = objc_claimAutoreleasedReturnValue();
  v3 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v4 = *(void **)(v3 + 40);
  *(_QWORD *)(v3 + 40) = v2;

}

void sub_1A07BBD90(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,char a25,uint64_t a26,uint64_t a27,uint64_t a28,char a29)
{
  _Block_object_dispose(&a29, 8);
  _Block_object_dispose(&a25, 8);
  _Unwind_Resume(a1);
}

void *SpringBoardServicesLibrary()
{
  void *v0;
  void *v2;
  void *v3;

  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
    SpringBoardServicesLibraryCore_frameworkLibrary = _sl_dlopen();
  v0 = (void *)SpringBoardServicesLibraryCore_frameworkLibrary;
  if (!SpringBoardServicesLibraryCore_frameworkLibrary)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void *SpringBoardServicesLibrary(void)");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "handleFailureInFunction:file:lineNumber:description:", v2, CFSTR("MSVSystemDialog.m"), 18, CFSTR("%s"), 0);

    __break(1u);
    free(v3);
  }
  return v0;
}

void _MSVSystemDialogUserNotificationCallback(__CFUserNotification *a1, char a2)
{
  void *v4;
  void *v5;
  uint64_t v6;
  const __CFDictionary *ResponseDictionary;
  void *v8;
  id v9;
  void *v10;
  MSVSystemDialogResponse *v11;
  uint64_t v12;
  void *v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  +[MSVSystemDialogManager sharedManager](MSVSystemDialogManager, "sharedManager");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "systemDialogForUserNotification:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_17;
  if ((a2 & 3) != 0)
    v6 = 2 * ((a2 & 3) == 1);
  else
    v6 = 1;
  ResponseDictionary = CFUserNotificationGetResponseDictionary(a1);
  if (ResponseDictionary)
  {
    CFDictionaryGetValue(ResponseDictionary, (const void *)*MEMORY[0x1E0C9B880]);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v14[0] = v8;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v14, 1);
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0)
      {
        v10 = 0;
        goto LABEL_13;
      }
      v9 = v8;
    }
    v10 = v9;
LABEL_13:

    goto LABEL_14;
  }
  v10 = 0;
LABEL_14:
  v11 = -[MSVSystemDialogResponse initWithIdentifier:textFieldValues:]([MSVSystemDialogResponse alloc], "initWithIdentifier:textFieldValues:", v6, v10);
  objc_msgSend(v5, "pendingCompletion");
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  if (v12)
    (*(void (**)(uint64_t, MSVSystemDialogResponse *))(v12 + 16))(v12, v11);
  objc_msgSend(v4, "unregisterSystemDialogWithUserNotification:", a1);
  objc_msgSend(v5, "setPresentedUserNotification:", 0);
  objc_msgSend(v5, "setPendingCompletion:", 0);
  objc_msgSend(v5, "setActiveRunLoopSource:", 0);

LABEL_17:
}

uint64_t __Block_byref_object_copy__3749(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3750(uint64_t a1)
{

}

void sub_1A07BED04(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BEDD4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BEEA0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BEF6C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF034(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF0FC(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF1C4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF28C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF354(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF41C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07BF530(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__3891(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__3892(uint64_t a1)
{

}

void sub_1A07C1348(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A07C13D4(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id obj)
{
  objc_sync_exit(obj);
  _Unwind_Resume(a1);
}

void sub_1A07C17E8(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, id location)
{
  void *v17;

  objc_sync_exit(v17);
  _Unwind_Resume(a1);
}

void sub_1A07C1A44(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07C1F88(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  id *v16;

  objc_destroyWeak(v16);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A07C244C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, id location)
{
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A07C2890(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07C2A00(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, id location)
{
  id *v15;

  objc_destroyWeak(v15);
  objc_destroyWeak(&location);
  _Unwind_Resume(a1);
}

void sub_1A07C2D98(_Unwind_Exception *a1)
{
  id *v1;
  id *v2;
  uint64_t v3;

  objc_destroyWeak(v1);
  objc_destroyWeak(v2);
  objc_destroyWeak((id *)(v3 - 136));
  _Unwind_Resume(a1);
}

void sub_1A07C3060(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A07C34EC(_Unwind_Exception *a1)
{
  id *v1;

  objc_destroyWeak(v1);
  _Unwind_Resume(a1);
}

void sub_1A07C3C08(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07C3DEC(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_1A07C4384(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, ...)
{
  uint64_t v11;
  va_list va;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  va_list va1;

  va_start(va1, a10);
  va_start(va, a10);
  v11 = va_arg(va1, _QWORD);
  v13 = va_arg(va1, _QWORD);
  v14 = va_arg(va1, _QWORD);
  v15 = va_arg(va1, _QWORD);
  v16 = va_arg(va1, _QWORD);
  v17 = va_arg(va1, _QWORD);
  _Block_object_dispose(va, 8);
  _Block_object_dispose(va1, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4153(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4154(uint64_t a1)
{

}

void _MSVPropertyListEncoderAppendCharacters(void *a1, unsigned __int16 *a2, unint64_t a3)
{
  id v5;
  unint64_t v6;
  unsigned __int16 *v7;
  uint64_t v8;
  unsigned int v9;
  unint64_t v10;
  unint64_t v11;
  unsigned int v12;
  CFIndex v13;
  const __CFAllocator *v14;
  const __CFString *v15;
  const __CFString *v16;
  const __CFData *ExternalRepresentation;
  const __CFData *v18;
  const UInt8 *BytePtr;
  _BYTE v20[400];
  uint64_t v21;

  v21 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  v6 = 0;
  v7 = a2 + 1;
  while (1)
  {
    if (v6 == 0 || v6 >= 0xFFFFFFFFFFFFFE71)
    {
      v8 = a3 - 1 >= v6 + 399 ? v6 + 399 : a3 - 1;
      v9 = *a2;
      if (v9 <= 0x7F)
      {
        v10 = 0;
        v11 = v8 + 1;
        while (1)
        {
          v20[v10] = v9;
          if (v8 == v10)
            break;
          v12 = v7[v10];
          LOBYTE(v9) = v7[v10++];
          if (v12 > 0x7F)
          {
            v11 = v10;
            goto LABEL_12;
          }
        }
        ++v10;
LABEL_12:
        if (v11 > v6)
        {
          objc_msgSend(v5, "appendBytes:length:", v20, v10 - v6);
          v6 = v11;
        }
      }
    }
    v13 = a3 - v6;
    if (a3 <= v6)
      break;
    if (a2[v6] >= 0x80u)
    {
      v14 = (const __CFAllocator *)*MEMORY[0x1E0C9AE30];
      v15 = CFStringCreateWithCharactersNoCopy((CFAllocatorRef)*MEMORY[0x1E0C9AE30], &a2[v6], v13, (CFAllocatorRef)*MEMORY[0x1E0C9AE20]);
      if (v15)
      {
        v16 = v15;
        ExternalRepresentation = CFStringCreateExternalRepresentation(v14, v15, 0x8000100u, 0);
        if (ExternalRepresentation)
        {
          v18 = ExternalRepresentation;
          BytePtr = CFDataGetBytePtr(ExternalRepresentation);
          objc_msgSend(v5, "appendBytes:length:", BytePtr, CFDataGetLength(v18));
          CFRelease(v18);
        }
        CFRelease(v16);
      }
      break;
    }
  }

}

id MSVImageUtilitiesCopyUTTypeForImageFormat(unint64_t a1)
{
  __CFString *v1;
  void *v2;
  void *v3;

  if (a1 >= 3)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSString *MSVImageUtilitiesCopyUTTypeForImageFormat(MSVImageFormat)");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "handleFailureInFunction:file:lineNumber:description:", v3, CFSTR("MSVImageUtilities.m"), 33, CFSTR("Unsupported MSVImageFormat"));

    v1 = 0;
  }
  else
  {
    v1 = off_1E43E9B08[a1];
  }
  return (id)-[__CFString copy](v1, "copy");
}

id MSVImageUtilitiesCopyUTTypeForImage()
{
  void *Property;
  void *v1;
  CFTypeID v2;

  Property = (void *)CGImageGetProperty();
  if (Property)
  {
    v1 = Property;
    v2 = CFGetTypeID(Property);
    if (v2 == CFStringGetTypeID())
      Property = v1;
    else
      Property = 0;
  }
  return Property;
}

BOOL MSVImageUtilitiesImageFormatSupportsTransparency(uint64_t a1)
{
  return a1 == 1;
}

CGImageSourceRef MSVImageUtilitiesCreateImageSource(void *a1)
{
  id v1;
  void *v2;
  void *v3;
  int v4;
  CGImageSourceRef v5;
  void *v7;
  void *v8;

  v1 = a1;
  if (!v1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageSourceRef MSVImageUtilitiesCreateImageSource(NSURL *__strong)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MSVImageUtilities.m"), 53, CFSTR("MSVImageUtilitiesCreateImageSource: imageURL cannot be NULL"));

  }
  objc_msgSend(MEMORY[0x1E0CB3620], "defaultManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "path");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v2, "fileExistsAtPath:", v3);

  if (v4)
    v5 = CGImageSourceCreateWithURL((CFURLRef)v1, 0);
  else
    v5 = 0;

  return v5;
}

CGImageRef MSVImageUtilitiesCreateImageFromSource(CGImageSource *a1, size_t a2)
{
  const __CFDictionary *v4;
  CGImageRef ImageAtIndex;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[2];

  v10[1] = *MEMORY[0x1E0C80C00];
  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "CGImageRef MSVImageUtilitiesCreateImageFromSource(CGImageSourceRef, size_t)");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "handleFailureInFunction:file:lineNumber:description:", v8, CFSTR("MSVImageUtilities.m"), 64, CFSTR("MSVImageUtilitiesCreateImageFromSource: imageSource cannot be NULL"));

  }
  v9 = *MEMORY[0x1E0CBD240];
  v10[0] = MEMORY[0x1E0C9AAA0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v10, &v9, 1);
  v4 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  ImageAtIndex = CGImageSourceCreateImageAtIndex(a1, a2, v4);

  return ImageAtIndex;
}

CGImageDestinationRef MSVImageUtilitiesCreateDataImageDestination(unint64_t a1, void *a2, size_t a3)
{
  __CFData *v5;
  const __CFString *v6;
  CGImageDestinationRef v7;

  v5 = a2;
  v6 = (const __CFString *)MSVImageUtilitiesCopyUTTypeForImageFormat(a1);
  v7 = CGImageDestinationCreateWithData(v5, v6, a3, 0);

  return v7;
}

CGImageDestinationRef MSVImageUtilitiesCreateFileImageDestination(unint64_t a1, void *a2, size_t a3)
{
  const __CFURL *v5;
  const __CFString *v6;
  CGImageDestinationRef v7;

  v5 = a2;
  v6 = (const __CFString *)MSVImageUtilitiesCopyUTTypeForImageFormat(a1);
  v7 = CGImageDestinationCreateWithURL(v5, v6, a3, 0);

  return v7;
}

BOOL MSVImageUtilitiesResizeSourceImageToDestination(CGImageSource *a1, size_t a2, uint64_t a3, CGImageDestination *a4, double a5)
{
  void *v10;
  const __CFDictionary *v11;
  CGImage *ThumbnailAtIndex;
  const __CFDictionary *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a4)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef, CGFloat)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("MSVImageUtilities.m"), 83, CFSTR("MSVImageUtilitiesResizeSourceImageToDestination: imageSource cannot be NULL"));

    if (a4)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef, CGFloat)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MSVImageUtilities.m"), 84, CFSTR("MSVImageUtilitiesResizeSourceImageToDestination: imageDestination cannot be NULL"));

LABEL_3:
  v19[0] = *MEMORY[0x1E0CBD2A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = *MEMORY[0x1E0CBD178];
  v20[0] = v10;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, a2, v11);
  if (ThumbnailAtIndex)
  {
    _MSVImageUtilitiesCreateImageProperties(a3, 0.0, a5);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImage(a4, ThumbnailAtIndex, v13);
    CFRelease(ThumbnailAtIndex);

  }
  return ThumbnailAtIndex != 0;
}

id _MSVImageUtilitiesCreateImageProperties(uint64_t a1, double a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  _QWORD *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CBD240]);
  if (a3 > 0.00000011920929)
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a3);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v7, *MEMORY[0x1E0CBC778]);

  }
  if (a1 == 2)
  {
    objc_msgSend(v6, "setObject:forKeyedSubscript:", *MEMORY[0x1E0CBC840], *MEMORY[0x1E0CBCA18]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", &unk_1E43FC820, *MEMORY[0x1E0CBC830]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], *MEMORY[0x1E0CBC848]);
    objc_msgSend(v6, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAA0], *MEMORY[0x1E0CBC858]);
    v9 = &unk_1E43FC838;
    v10 = (_QWORD *)MEMORY[0x1E0CBC780];
LABEL_9:
    objc_msgSend(v6, "setObject:forKeyedSubscript:", v9, *v10);
    return v6;
  }
  if (!a1)
  {
    if (a2 > 0.00000011920929)
    {
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a2);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "setObject:forKeyedSubscript:", v8, *MEMORY[0x1E0CBC780]);

    }
    v9 = (void *)MEMORY[0x1E0C9AAB0];
    v10 = (_QWORD *)MEMORY[0x1E0CBC7C0];
    goto LABEL_9;
  }
  return v6;
}

BOOL MSVImageUtilitiesResizeSourceImageToJPEGDestination(CGImageSource *a1, size_t a2, CGImageDestination *a3, double a4, double a5)
{
  void *v10;
  const __CFDictionary *v11;
  CGImage *ThumbnailAtIndex;
  const __CFDictionary *v13;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  _QWORD v19[2];
  _QWORD v20[3];

  v20[2] = *MEMORY[0x1E0C80C00];
  if (a1)
  {
    if (a3)
      goto LABEL_3;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat, CGFloat)");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "handleFailureInFunction:file:lineNumber:description:", v16, CFSTR("MSVImageUtilities.m"), 102, CFSTR("MSVImageUtilitiesResizeSourceImageToJPEGDestination: imageSource cannot be NULL"));

    if (a3)
      goto LABEL_3;
  }
  objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "BOOL MSVImageUtilitiesResizeSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat, CGFloat)");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInFunction:file:lineNumber:description:", v18, CFSTR("MSVImageUtilities.m"), 103, CFSTR("MSVImageUtilitiesResizeSourceImageToJPEGDestination: imageDestination cannot be NULL"));

LABEL_3:
  v19[0] = *MEMORY[0x1E0CBD2A0];
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v19[1] = *MEMORY[0x1E0CBD178];
  v20[0] = v10;
  v20[1] = MEMORY[0x1E0C9AAB0];
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v20, v19, 2);
  v11 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();

  ThumbnailAtIndex = CGImageSourceCreateThumbnailAtIndex(a1, a2, v11);
  if (ThumbnailAtIndex)
  {
    _MSVImageUtilitiesCreateImageProperties(0, a4, a5);
    v13 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
    CGImageDestinationAddImage(a3, ThumbnailAtIndex, v13);
    CFRelease(ThumbnailAtIndex);

  }
  return ThumbnailAtIndex != 0;
}

void MSVImageUtilitiesAddSourceImageToDestination(CGImageSource *a1, size_t a2, uint64_t a3, CGImageDestination *a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MSVImageUtilities.m"), 121, CFSTR("MSVImageUtilitiesAddSourceImageToDestination: imageSource cannot be NULL"));

    if (a4)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToDestination(CGImageSourceRef, size_t, MSVImageFormat, CGImageDestinationRef)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MSVImageUtilities.m"), 122, CFSTR("MSVImageUtilitiesAddSourceImageToDestination: imageDestination cannot be NULL"));

    goto LABEL_3;
  }
  if (!a4)
    goto LABEL_5;
LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(a3, 0.0, 0.0);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImageFromSource(a4, a1, a2, v12);

}

void MSVImageUtilitiesAddSourceImageToJPEGDestination(CGImageSource *a1, size_t a2, CGImageDestination *a3, double a4)
{
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  const __CFDictionary *v12;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MSVImageUtilities.m"), 129, CFSTR("MSVImageUtilitiesAddSourceImageToJPEGDestination: imageSource cannot be NULL"));

    if (a3)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddSourceImageToJPEGDestination(CGImageSourceRef, size_t, CGImageDestinationRef, CGFloat)");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "handleFailureInFunction:file:lineNumber:description:", v11, CFSTR("MSVImageUtilities.m"), 130, CFSTR("MSVImageUtilitiesAddSourceImageToJPEGDestination: imageDestination cannot be NULL"));

    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(0, a4, 0.0);
  v12 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImageFromSource(a3, a1, a2, v12);

}

void MSVImageUtilitiesAddImageToDestination(CGImage *a1, uint64_t a2, CGImageDestination *a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddImageToDestination(CGImageRef, MSVImageFormat, CGImageDestinationRef)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MSVImageUtilities.m"), 137, CFSTR("MSVImageUtilitiesAddImageToDestination: image cannot be NULL"));

    if (a3)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddImageToDestination(CGImageRef, MSVImageFormat, CGImageDestinationRef)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MSVImageUtilities.m"), 138, CFSTR("MSVImageUtilitiesAddImageToDestination: imageDestination cannot be NULL"));

    goto LABEL_3;
  }
  if (!a3)
    goto LABEL_5;
LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(a2, 0.0, 0.0);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImage(a3, a1, v10);

}

void MSVImageUtilitiesAddJPEGToDestination(CGImage *a1, CGImageDestination *a2, double a3)
{
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  const __CFDictionary *v10;

  if (!a1)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddJPEGToDestination(CGImageRef, CGFloat, CGImageDestinationRef)");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInFunction:file:lineNumber:description:", v7, CFSTR("MSVImageUtilities.m"), 145, CFSTR("MSVImageUtilitiesAddJPEGToDestination: image cannot be NULL"));

    if (a2)
      goto LABEL_3;
LABEL_5:
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "void MSVImageUtilitiesAddJPEGToDestination(CGImageRef, CGFloat, CGImageDestinationRef)");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "handleFailureInFunction:file:lineNumber:description:", v9, CFSTR("MSVImageUtilities.m"), 146, CFSTR("MSVImageUtilitiesAddJPEGToDestination: imageDestination cannot be NULL"));

    goto LABEL_3;
  }
  if (!a2)
    goto LABEL_5;
LABEL_3:
  _MSVImageUtilitiesCreateImageProperties(0, a3, 0.0);
  v10 = (const __CFDictionary *)objc_claimAutoreleasedReturnValue();
  CGImageDestinationAddImage(a2, a1, v10);

}

double MSVImageUtilitiesMakeBoundingBoxSize(double a1, double a2, double a3, double a4)
{
  double v4;
  double v5;

  if (a1 == 0.0 || a2 == 0.0)
    return *MEMORY[0x1E0C9D820];
  v4 = a3 / a1;
  v5 = a4 / a2;
  if (v4 >= v5)
    v4 = v5;
  return a1 * v4;
}

id _MSVTransformStateValue(void *a1)
{
  id v1;
  id v2;
  id v3;
  id v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  void *v10;
  id v11;
  void *v12;
  id v14;
  _QWORD v15[4];
  id v16;
  __int128 v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  _BYTE v21[128];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v1 = a1;
  if (_NSIsNSArray())
  {
    v2 = v1;
    objc_msgSend(MEMORY[0x1E0C99DE8], "arrayWithCapacity:", objc_msgSend(v2, "count"));
    v3 = (id)objc_claimAutoreleasedReturnValue();
    v17 = 0u;
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v4 = v2;
    v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
    if (v5)
    {
      v6 = v5;
      v7 = *(_QWORD *)v18;
      do
      {
        v8 = 0;
        do
        {
          if (*(_QWORD *)v18 != v7)
            objc_enumerationMutation(v4);
          _MSVTransformStateValue(*(_QWORD *)(*((_QWORD *)&v17 + 1) + 8 * v8));
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v3, "addObject:", v9);

          ++v8;
        }
        while (v6 != v8);
        v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v17, v21, 16);
      }
      while (v6);
    }

    goto LABEL_14;
  }
  if (_NSIsNSDictionary())
  {
    v10 = (void *)MEMORY[0x1E0C99E08];
    v11 = v1;
    objc_msgSend(v10, "dictionaryWithCapacity:", objc_msgSend(v11, "count"));
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = ___MSVTransformStateValue_block_invoke;
    v15[3] = &unk_1E43E9B80;
    v3 = v12;
    v16 = v3;
    objc_msgSend(v11, "enumerateKeysAndObjectsUsingBlock:", v15);

  }
  else
  {
    if ((objc_opt_respondsToSelector() & 1) != 0)
    {
      objc_msgSend(v1, "_stateDumpObject");
      v4 = (id)objc_claimAutoreleasedReturnValue();
      _MSVTransformStateValue(v4);
      v3 = (id)objc_claimAutoreleasedReturnValue();
LABEL_14:

      goto LABEL_15;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v1, "UUIDString");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    else if ((objc_msgSend(MEMORY[0x1E0CB38B0], "propertyList:isValidForFormat:", v1, 200) & 1) != 0)
    {
      v14 = v1;
    }
    else
    {
      objc_msgSend(v1, "debugDescription");
      v14 = (id)objc_claimAutoreleasedReturnValue();
    }
    v3 = v14;
  }
LABEL_15:

  return v3;
}

void sub_1A07C8BF4(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_1A07C8D0C(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, ...)
{
  va_list va;

  va_start(va, a7);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__4818(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__4819(uint64_t a1)
{

}

void sub_1A07C93E0(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, char a18, uint64_t a19, uint64_t a20,uint64_t a21,char a22)
{
  id *v22;
  id *v23;
  id *v24;
  uint64_t v25;

  objc_destroyWeak(v24);
  _Block_object_dispose(&a18, 8);
  _Block_object_dispose(&a22, 8);
  objc_destroyWeak(v23);
  objc_destroyWeak(v22);
  objc_destroyWeak((id *)(v25 - 104));
  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5185(uint64_t a1, uint64_t a2)
{
  uint64_t result;

  result = MEMORY[0x1A1AFBD28](*(_QWORD *)(a2 + 40));
  *(_QWORD *)(a1 + 40) = result;
  return result;
}

void __Block_byref_object_dispose__5186(uint64_t a1)
{

}

void sub_1A07CB364(_Unwind_Exception *a1)
{
  void *v1;

  _Unwind_Resume(a1);
}

void sub_1A07CB700(_Unwind_Exception *a1)
{
  void *v1;
  void *v2;

  _Unwind_Resume(a1);
}

void sub_1A07CB85C(_Unwind_Exception *a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, id a10)
{

  _Unwind_Resume(a1);
}

uint64_t __Block_byref_object_copy__5513(uint64_t result, uint64_t a2)
{
  *(_QWORD *)(result + 40) = *(_QWORD *)(a2 + 40);
  *(_QWORD *)(a2 + 40) = 0;
  return result;
}

void __Block_byref_object_dispose__5514(uint64_t a1)
{

}

uint64_t BKSProcessAssertionBackgroundTimeRemaining()
{
  return MEMORY[0x1E0CFE2E0]();
}

uint64_t BSNSStringFromCGPoint()
{
  return MEMORY[0x1E0D01430]();
}

uint64_t BSNSStringFromCGRect()
{
  return MEMORY[0x1E0D01438]();
}

uint64_t BSNSStringFromCGSize()
{
  return MEMORY[0x1E0D01440]();
}

unsigned __int8 *__cdecl CC_MD5(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80308](data, *(_QWORD *)&len, md);
}

int CC_MD5_Final(unsigned __int8 *md, CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80310](md, c);
}

int CC_MD5_Init(CC_MD5_CTX *c)
{
  return MEMORY[0x1E0C80318](c);
}

int CC_MD5_Update(CC_MD5_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80320](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA1(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80328](data, *(_QWORD *)&len, md);
}

int CC_SHA1_Final(unsigned __int8 *md, CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80330](md, c);
}

int CC_SHA1_Init(CC_SHA1_CTX *c)
{
  return MEMORY[0x1E0C80338](c);
}

int CC_SHA1_Update(CC_SHA1_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80340](c, data, *(_QWORD *)&len);
}

unsigned __int8 *__cdecl CC_SHA256(const void *data, CC_LONG len, unsigned __int8 *md)
{
  return (unsigned __int8 *)MEMORY[0x1E0C80368](data, *(_QWORD *)&len, md);
}

int CC_SHA256_Final(unsigned __int8 *md, CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80370](md, c);
}

int CC_SHA256_Init(CC_SHA256_CTX *c)
{
  return MEMORY[0x1E0C80378](c);
}

int CC_SHA256_Update(CC_SHA256_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C80380](c, data, *(_QWORD *)&len);
}

int CC_SHA512_Final(unsigned __int8 *md, CC_SHA512_CTX *c)
{
  return MEMORY[0x1E0C803B0](md, c);
}

int CC_SHA512_Update(CC_SHA512_CTX *c, const void *data, CC_LONG len)
{
  return MEMORY[0x1E0C803C0](c, data, *(_QWORD *)&len);
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x1E0C97C58]();
  return result;
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x1E0C97D90]();
}

CFTypeRef CFAutorelease(CFTypeRef arg)
{
  return (CFTypeRef)MEMORY[0x1E0C97E90](arg);
}

CFBitVectorRef CFBitVectorCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex numBits)
{
  return (CFBitVectorRef)MEMORY[0x1E0C97F58](allocator, bytes, numBits);
}

CFMutableBitVectorRef CFBitVectorCreateMutable(CFAllocatorRef allocator, CFIndex capacity)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F68](allocator, capacity);
}

CFMutableBitVectorRef CFBitVectorCreateMutableCopy(CFAllocatorRef allocator, CFIndex capacity, CFBitVectorRef bv)
{
  return (CFMutableBitVectorRef)MEMORY[0x1E0C97F70](allocator, capacity, bv);
}

CFBit CFBitVectorGetBitAtIndex(CFBitVectorRef bv, CFIndex idx)
{
  return MEMORY[0x1E0C97F78](bv, idx);
}

void CFBitVectorGetBits(CFBitVectorRef bv, CFRange range, UInt8 *bytes)
{
  MEMORY[0x1E0C97F80](bv, range.location, range.length, bytes);
}

CFIndex CFBitVectorGetCountOfBit(CFBitVectorRef bv, CFRange range, CFBit value)
{
  return MEMORY[0x1E0C97F90](bv, range.location, range.length, *(_QWORD *)&value);
}

void CFBitVectorSetBitAtIndex(CFMutableBitVectorRef bv, CFIndex idx, CFBit value)
{
  MEMORY[0x1E0C97FB0](bv, idx, *(_QWORD *)&value);
}

void CFBitVectorSetCount(CFMutableBitVectorRef bv, CFIndex count)
{
  MEMORY[0x1E0C97FC0](bv, count);
}

CFTypeID CFBooleanGetTypeID(void)
{
  return MEMORY[0x1E0C97FC8]();
}

Boolean CFBooleanGetValue(CFBooleanRef BOOLean)
{
  return MEMORY[0x1E0C97FE0](BOOLean);
}

CFCharacterSetRef CFCharacterSetCreateWithCharactersInString(CFAllocatorRef alloc, CFStringRef theString)
{
  return (CFCharacterSetRef)MEMORY[0x1E0C982E8](alloc, theString);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x1E0C983E0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x1E0C983F8](theData);
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

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x1E0C98738](cf);
}

CFStringRef CFHTTPMessageCopyVersion(CFHTTPMessageRef message)
{
  return (CFStringRef)MEMORY[0x1E0C92820](message);
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x1E0C989C0](number, theType, valuePtr);
}

Boolean CFNumberIsFloatType(CFNumberRef number)
{
  return MEMORY[0x1E0C989D0](number);
}

void CFReadStreamSetDispatchQueue(CFReadStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x1E0C98BA0](stream, q);
}

uint64_t CFReadStreamSignalEvent()
{
  return MEMORY[0x1E0C98BB0]();
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

CFRunLoopRef CFRunLoopGetMain(void)
{
  return (CFRunLoopRef)MEMORY[0x1E0C98C40]();
}

void CFRunLoopPerformBlock(CFRunLoopRef rl, CFTypeRef mode, void *block)
{
  MEMORY[0x1E0C98C80](rl, mode, block);
}

void CFRunLoopSourceInvalidate(CFRunLoopSourceRef source)
{
  MEMORY[0x1E0C98CE0](source);
}

void CFRunLoopWakeUp(CFRunLoopRef rl)
{
  MEMORY[0x1E0C98D68](rl);
}

CFDataRef CFStringCreateExternalRepresentation(CFAllocatorRef alloc, CFStringRef theString, CFStringEncoding encoding, UInt8 lossByte)
{
  return (CFDataRef)MEMORY[0x1E0C98F80](alloc, theString, *(_QWORD *)&encoding, lossByte);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x1E0C98FB8](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

CFStringRef CFStringCreateWithCharactersNoCopy(CFAllocatorRef alloc, const UniChar *chars, CFIndex numChars, CFAllocatorRef contentsDeallocator)
{
  return (CFStringRef)MEMORY[0x1E0C98FF8](alloc, chars, numChars, contentsDeallocator);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x1E0C99018](alloc, formatOptions, format);
}

CFStringRef CFStringCreateWithSubstring(CFAllocatorRef alloc, CFStringRef str, CFRange range)
{
  return (CFStringRef)MEMORY[0x1E0C99030](alloc, str, range.location, range.length);
}

Boolean CFStringFindCharacterFromSet(CFStringRef theString, CFCharacterSetRef theSet, CFRange rangeToSearch, CFStringCompareFlags searchOptions, CFRange *result)
{
  return MEMORY[0x1E0C99060](theString, theSet, rangeToSearch.location, rangeToSearch.length, searchOptions, result);
}

const char *__cdecl CFStringGetCStringPtr(CFStringRef theString, CFStringEncoding encoding)
{
  return (const char *)MEMORY[0x1E0C990A0](theString, *(_QWORD *)&encoding);
}

UniChar CFStringGetCharacterAtIndex(CFStringRef theString, CFIndex idx)
{
  return MEMORY[0x1E0C990B0](theString, idx);
}

void CFStringGetCharacters(CFStringRef theString, CFRange range, UniChar *buffer)
{
  MEMORY[0x1E0C990C0](theString, range.location, range.length, buffer);
}

const UniChar *__cdecl CFStringGetCharactersPtr(CFStringRef theString)
{
  return (const UniChar *)MEMORY[0x1E0C990C8](theString);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x1E0C990F0](str);
}

CFIndex CFStringGetLength(CFStringRef theString)
{
  return MEMORY[0x1E0C99100](theString);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x1E0C99170]();
}

uint64_t CFURLResponseGetHTTPResponse()
{
  return MEMORY[0x1E0C92A68]();
}

CFUUIDRef CFUUIDCreateFromUUIDBytes(CFAllocatorRef alloc, CFUUIDBytes bytes)
{
  return (CFUUIDRef)MEMORY[0x1E0C99530](alloc, *(_QWORD *)&bytes.byte0, *(_QWORD *)&bytes.byte8);
}

CFUUIDBytes CFUUIDGetUUIDBytes(CFUUIDRef uuid)
{
  uint64_t v1;
  uint64_t v2;
  CFUUIDBytes result;

  v1 = MEMORY[0x1E0C99568](uuid);
  result.byte8 = v2;
  result.byte9 = BYTE1(v2);
  result.byte10 = BYTE2(v2);
  result.byte11 = BYTE3(v2);
  result.byte12 = BYTE4(v2);
  result.byte13 = BYTE5(v2);
  result.byte14 = BYTE6(v2);
  result.byte15 = HIBYTE(v2);
  result.byte0 = v1;
  result.byte1 = BYTE1(v1);
  result.byte2 = BYTE2(v1);
  result.byte3 = BYTE3(v1);
  result.byte4 = BYTE4(v1);
  result.byte5 = BYTE5(v1);
  result.byte6 = BYTE6(v1);
  result.byte7 = HIBYTE(v1);
  return result;
}

SInt32 CFUserNotificationCancel(CFUserNotificationRef userNotification)
{
  return MEMORY[0x1E0C995A0](userNotification);
}

CFUserNotificationRef CFUserNotificationCreate(CFAllocatorRef allocator, CFTimeInterval timeout, CFOptionFlags flags, SInt32 *error, CFDictionaryRef dictionary)
{
  return (CFUserNotificationRef)MEMORY[0x1E0C995A8](allocator, flags, error, dictionary, timeout);
}

CFRunLoopSourceRef CFUserNotificationCreateRunLoopSource(CFAllocatorRef allocator, CFUserNotificationRef userNotification, CFUserNotificationCallBack callout, CFIndex order)
{
  return (CFRunLoopSourceRef)MEMORY[0x1E0C995B8](allocator, userNotification, callout, order);
}

CFDictionaryRef CFUserNotificationGetResponseDictionary(CFUserNotificationRef userNotification)
{
  return (CFDictionaryRef)MEMORY[0x1E0C995D8](userNotification);
}

void CFWriteStreamSetDispatchQueue(CFWriteStreamRef stream, dispatch_queue_t q)
{
  MEMORY[0x1E0C99668](stream, q);
}

CGAffineTransform *__cdecl CGAffineTransformMakeScale(CGAffineTransform *__return_ptr retstr, CGFloat sx, CGFloat sy)
{
  return (CGAffineTransform *)MEMORY[0x1E0C9BAD8](retstr, sx, sy);
}

CGContextRef CGBitmapContextCreate(void *data, size_t width, size_t height, size_t bitsPerComponent, size_t bytesPerRow, CGColorSpaceRef space, uint32_t bitmapInfo)
{
  return (CGContextRef)MEMORY[0x1E0C9BB10](data, width, height, bitsPerComponent, bytesPerRow, space, *(_QWORD *)&bitmapInfo);
}

CGImageRef CGBitmapContextCreateImage(CGContextRef context)
{
  return (CGImageRef)MEMORY[0x1E0C9BB20](context);
}

CGBitmapInfo CGBitmapContextGetBitmapInfo(CGContextRef context)
{
  return MEMORY[0x1E0C9BB48](context);
}

size_t CGBitmapContextGetBytesPerRow(CGContextRef context)
{
  return MEMORY[0x1E0C9BB60](context);
}

void *__cdecl CGBitmapContextGetData(CGContextRef context)
{
  return (void *)MEMORY[0x1E0C9BB70](context);
}

size_t CGBitmapContextGetHeight(CGContextRef context)
{
  return MEMORY[0x1E0C9BB78](context);
}

size_t CGBitmapContextGetWidth(CGContextRef context)
{
  return MEMORY[0x1E0C9BB80](context);
}

CGColorRef CGColorCreate(CGColorSpaceRef space, const CGFloat *components)
{
  return (CGColorRef)MEMORY[0x1E0C9BC78](space, components);
}

CGColorRef CGColorCreateGenericRGB(CGFloat red, CGFloat green, CGFloat blue, CGFloat alpha)
{
  return (CGColorRef)MEMORY[0x1E0C9BCB0](red, green, blue, alpha);
}

BOOL CGColorEqualToColor(CGColorRef color1, CGColorRef color2)
{
  return MEMORY[0x1E0C9BCD8](color1, color2);
}

CGColorSpaceRef CGColorGetColorSpace(CGColorRef color)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BD00](color);
}

const CGFloat *__cdecl CGColorGetComponents(CGColorRef color)
{
  return (const CGFloat *)MEMORY[0x1E0C9BD08](color);
}

size_t CGColorGetNumberOfComponents(CGColorRef color)
{
  return MEMORY[0x1E0C9BD20](color);
}

void CGColorRelease(CGColorRef color)
{
  MEMORY[0x1E0C9BD60](color);
}

CGColorSpaceRef CGColorSpaceCreateDeviceRGB(void)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BDF0]();
}

CGColorSpaceRef CGColorSpaceCreateWithICCData(CFTypeRef data)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE40](data);
}

CGColorSpaceRef CGColorSpaceCreateWithName(CFStringRef name)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9BE50](name);
}

CGColorSpaceModel CGColorSpaceGetModel(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BEC8](space);
}

void CGColorSpaceRelease(CGColorSpaceRef space)
{
  MEMORY[0x1E0C9BF30](space);
}

BOOL CGColorSpaceSupportsOutput(CGColorSpaceRef space)
{
  return MEMORY[0x1E0C9BF40](space);
}

void CGContextDrawImage(CGContextRef c, CGRect rect, CGImageRef image)
{
  MEMORY[0x1E0C9C170](c, image, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextFillRect(CGContextRef c, CGRect rect)
{
  MEMORY[0x1E0C9C220](c, (__n128)rect.origin, *(__n128 *)&rect.origin.y, (__n128)rect.size, *(__n128 *)&rect.size.height);
}

void CGContextRelease(CGContextRef c)
{
  MEMORY[0x1E0C9C340](c);
}

void CGContextSetFillColorWithColor(CGContextRef c, CGColorRef color)
{
  MEMORY[0x1E0C9C408](c, color);
}

CGImageRef CGImageCreateCopyWithColorSpace(CGImageRef image, CGColorSpaceRef space)
{
  return (CGImageRef)MEMORY[0x1E0C9CB98](image, space);
}

void CGImageDestinationAddImage(CGImageDestinationRef idst, CGImageRef image, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC308](idst, image, properties);
}

void CGImageDestinationAddImageFromSource(CGImageDestinationRef idst, CGImageSourceRef isrc, size_t index, CFDictionaryRef properties)
{
  MEMORY[0x1E0CBC318](idst, isrc, index, properties);
}

CGImageDestinationRef CGImageDestinationCreateWithData(CFMutableDataRef data, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC338](data, type, count, options);
}

CGImageDestinationRef CGImageDestinationCreateWithURL(CFURLRef url, CFStringRef type, size_t count, CFDictionaryRef options)
{
  return (CGImageDestinationRef)MEMORY[0x1E0CBC348](url, type, count, options);
}

BOOL CGImageDestinationFinalize(CGImageDestinationRef idst)
{
  return MEMORY[0x1E0CBC358](idst);
}

CGImageAlphaInfo CGImageGetAlphaInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBE8](image);
}

CGBitmapInfo CGImageGetBitmapInfo(CGImageRef image)
{
  return MEMORY[0x1E0C9CBF0](image);
}

CGColorSpaceRef CGImageGetColorSpace(CGImageRef image)
{
  return (CGColorSpaceRef)MEMORY[0x1E0C9CC20](image);
}

size_t CGImageGetHeight(CGImageRef image)
{
  return MEMORY[0x1E0C9CC60](image);
}

uint64_t CGImageGetProperty()
{
  return MEMORY[0x1E0C9CC98]();
}

size_t CGImageGetWidth(CGImageRef image)
{
  return MEMORY[0x1E0C9CCD0](image);
}

void CGImageRelease(CGImageRef image)
{
  MEMORY[0x1E0C9CDA0](image);
}

CGImageRef CGImageSourceCreateImageAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC568](isrc, index, options);
}

CGImageRef CGImageSourceCreateThumbnailAtIndex(CGImageSourceRef isrc, size_t index, CFDictionaryRef options)
{
  return (CGImageRef)MEMORY[0x1E0CBC588](isrc, index, options);
}

CGImageSourceRef CGImageSourceCreateWithURL(CFURLRef url, CFDictionaryRef options)
{
  return (CGImageSourceRef)MEMORY[0x1E0CBC5C0](url, options);
}

CFDataRef ColorSyncProfileCopyData(ColorSyncProfileRef prof, CFErrorRef *error)
{
  return (CFDataRef)MEMORY[0x1E0C95458](prof, error);
}

ColorSyncProfileRef ColorSyncProfileCreateWithName(CFStringRef name)
{
  return (ColorSyncProfileRef)MEMORY[0x1E0C95498](name);
}

uint64_t MGCopyAnswer()
{
  return MEMORY[0x1E0DE2B20]();
}

uint64_t MGCopyAnswerWithError()
{
  return MEMORY[0x1E0DE2B38]();
}

uint64_t MGGetBoolAnswer()
{
  return MEMORY[0x1E0DE2B50]();
}

uint64_t MGGetSInt32Answer()
{
  return MEMORY[0x1E0DE2B70]();
}

Class NSClassFromString(NSString *aClassName)
{
  return (Class)MEMORY[0x1E0CB28A0](aClassName);
}

uint64_t NSErrorWithOSStatusF()
{
  return MEMORY[0x1E0D1B200]();
}

const char *__cdecl NSGetSizeAndAlignment(const char *typePtr, NSUInteger *sizep, NSUInteger *alignp)
{
  return (const char *)MEMORY[0x1E0C99758](typePtr, sizep, alignp);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x1E0CB2D88](format);
}

void *__cdecl NSMapGet(NSMapTable *table, const void *key)
{
  return (void *)MEMORY[0x1E0CB2DA0](table, key);
}

void NSMapInsert(NSMapTable *table, const void *key, const void *value)
{
  MEMORY[0x1E0CB2DA8](table, key, value);
}

NSArray *__cdecl NSSearchPathForDirectoriesInDomains(NSSearchPathDirectory directory, NSSearchPathDomainMask domainMask, BOOL expandTilde)
{
  return (NSArray *)MEMORY[0x1E0CB3178](directory, domainMask, expandTilde);
}

SEL NSSelectorFromString(NSString *aSelectorName)
{
  return (SEL)MEMORY[0x1E0CB3190](aSelectorName);
}

NSString *__cdecl NSStringFromClass(Class aClass)
{
  return (NSString *)MEMORY[0x1E0CB3200](aClass);
}

NSString *__cdecl NSStringFromRange(NSRange range)
{
  return (NSString *)MEMORY[0x1E0CB3220](range.location, range.length);
}

NSString *__cdecl NSStringFromSelector(SEL aSelector)
{
  return (NSString *)MEMORY[0x1E0CB3230](aSelector);
}

NSString *NSTemporaryDirectory(void)
{
  return (NSString *)MEMORY[0x1E0CB3250]();
}

uint64_t OPACKDecodeData()
{
  return MEMORY[0x1E0D1B4C0]();
}

uint64_t OPACKEncoderCreateData()
{
  return MEMORY[0x1E0D1B4D0]();
}

uint64_t PBDataWriterWriteBareVarint()
{
  return MEMORY[0x1E0D82C18]();
}

uint64_t PBReaderReadVarIntBuf()
{
  return MEMORY[0x1E0D82D08]();
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

int SecRandomCopyBytes(SecRandomRef rnd, size_t count, void *bytes)
{
  return MEMORY[0x1E0CD65A0](rnd, count, bytes);
}

CFTypeRef SecTaskCopyValueForEntitlement(SecTaskRef task, CFStringRef entitlement, CFErrorRef *error)
{
  return (CFTypeRef)MEMORY[0x1E0CD65F0](task, entitlement, error);
}

SecTaskRef SecTaskCreateFromSelf(CFAllocatorRef allocator)
{
  return (SecTaskRef)MEMORY[0x1E0CD6610](allocator);
}

SecTaskRef SecTaskCreateWithAuditToken(CFAllocatorRef allocator, audit_token_t *token)
{
  return (SecTaskRef)MEMORY[0x1E0CD6620](allocator, token);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x1E0C80948](a1, *(_QWORD *)&a2);
}

uint64_t _NSIsNSArray()
{
  return MEMORY[0x1E0C9A860]();
}

uint64_t _NSIsNSData()
{
  return MEMORY[0x1E0C9A878]();
}

uint64_t _NSIsNSDate()
{
  return MEMORY[0x1E0C9A880]();
}

uint64_t _NSIsNSDictionary()
{
  return MEMORY[0x1E0C9A888]();
}

uint64_t _NSIsNSNumber()
{
  return MEMORY[0x1E0C9A890]();
}

uint64_t _NSIsNSSet()
{
  return MEMORY[0x1E0C9A8A8]();
}

uint64_t _NSIsNSString()
{
  return MEMORY[0x1E0C9A8B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x1E0C80A20](exception_object);
}

const char *__cdecl std::exception::what(const std::exception *this)
{
  return (const char *)MEMORY[0x1E0DE4270](this);
}

std::logic_error *__cdecl std::logic_error::logic_error(std::logic_error *this, const char *a2)
{
  return (std::logic_error *)MEMORY[0x1E0DE4288](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const char *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4320](this, a2);
}

std::runtime_error *__cdecl std::runtime_error::runtime_error(std::runtime_error *this, const std::string *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4328](this, a2);
}

void std::runtime_error::~runtime_error(std::runtime_error *this)
{
  MEMORY[0x1E0DE4340](this);
}

std::runtime_error *__cdecl std::runtime_error::operator=(std::runtime_error *this, const std::runtime_error *a2)
{
  return (std::runtime_error *)MEMORY[0x1E0DE4348](this, a2);
}

std::bad_array_new_length *__cdecl std::bad_array_new_length::bad_array_new_length(std::bad_array_new_length *this)
{
  return (std::bad_array_new_length *)MEMORY[0x1E0DE4388](this);
}

void std::exception::~exception(std::exception *this)
{
  MEMORY[0x1E0DE4DD0](this);
}

void std::terminate(void)
{
  MEMORY[0x1E0DE4E18]();
}

void operator delete(void *__p)
{
  off_1E43E7968(__p);
}

uint64_t operator delete()
{
  return off_1E43E7970();
}

void *__cdecl operator new(size_t __sz)
{
  return (void *)off_1E43E7978(__sz);
}

void __assert_rtn(const char *a1, const char *a2, int a3, const char *a4)
{
  MEMORY[0x1E0C80A58](a1, a2, *(_QWORD *)&a3, a4);
}

void *__cxa_allocate_exception(size_t thrown_size)
{
  return (void *)MEMORY[0x1E0DE5068](thrown_size);
}

void *__cxa_begin_catch(void *a1)
{
  return (void *)MEMORY[0x1E0DE5080](a1);
}

void __cxa_end_catch(void)
{
  MEMORY[0x1E0DE5098]();
}

void __cxa_free_exception(void *a1)
{
  MEMORY[0x1E0DE50A0](a1);
}

void *__cxa_get_exception_ptr(void *a1)
{
  return (void *)MEMORY[0x1E0DE50A8](a1);
}

void __cxa_throw(void *a1, struct type_info *lptinfo, void (*a3)(void *))
{
  MEMORY[0x1E0DE50D8](a1, lptinfo, a3);
}

int *__error(void)
{
  return (int *)MEMORY[0x1E0C80AC0]();
}

uint64_t __memcpy_chk()
{
  return MEMORY[0x1E0C80B68]();
}

int __sprintf_chk(char *a1, int a2, size_t a3, const char *a4, ...)
{
  return MEMORY[0x1E0C80BE8](a1, *(_QWORD *)&a2, a3, a4);
}

uint64_t _dyld_get_image_uuid()
{
  return MEMORY[0x1E0C80E78]();
}

uint64_t _dyld_get_shared_cache_uuid()
{
  return MEMORY[0x1E0C80EA0]();
}

uint64_t _dyld_process_info_create()
{
  return MEMORY[0x1E0C80EF8]();
}

uint64_t _dyld_process_info_for_each_image()
{
  return MEMORY[0x1E0C80F00]();
}

uint64_t _dyld_process_info_get_state()
{
  return MEMORY[0x1E0C80F20]();
}

uint64_t _dyld_process_info_release()
{
  return MEMORY[0x1E0C80F40]();
}

void _os_log_fault_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81040](dso, log, type, format, buf, *(_QWORD *)&size);
}

void _os_log_impl(void *dso, os_log_t log, os_log_type_t type, const char *format, uint8_t *buf, uint32_t size)
{
  MEMORY[0x1E0C81048](dso, log, type, format, buf, *(_QWORD *)&size);
}

uint64_t _sl_dlopen()
{
  return MEMORY[0x1E0DA88F0]();
}

void abort(void)
{
  MEMORY[0x1E0C813A8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x1E0C81570]();
}

void arc4random_buf(void *__buf, size_t __nbytes)
{
  MEMORY[0x1E0C81580](__buf, __nbytes);
}

int atoi(const char *a1)
{
  return MEMORY[0x1E0C81668](a1);
}

pid_t audit_token_to_pid(audit_token_t *atoken)
{
  return MEMORY[0x1E0DE40F0](atoken);
}

void bzero(void *a1, size_t a2)
{
  MEMORY[0x1E0C81758](a1, a2);
}

Ivar *__cdecl class_copyIvarList(Class cls, unsigned int *outCount)
{
  return (Ivar *)MEMORY[0x1E0DE7A70](cls, outCount);
}

Method *__cdecl class_copyMethodList(Class cls, unsigned int *outCount)
{
  return (Method *)MEMORY[0x1E0DE7A78](cls, outCount);
}

objc_property_t *__cdecl class_copyPropertyList(Class cls, unsigned int *outCount)
{
  return (objc_property_t *)MEMORY[0x1E0DE7A80](cls, outCount);
}

Protocol **__cdecl class_copyProtocolList(Class cls, unsigned int *outCount)
{
  return (Protocol **)MEMORY[0x1E0DE7A88](cls, outCount);
}

Method class_getClassMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7A98](cls, name);
}

Method class_getInstanceMethod(Class cls, SEL name)
{
  return (Method)MEMORY[0x1E0DE7AA8](cls, name);
}

const char *__cdecl class_getName(Class cls)
{
  return (const char *)MEMORY[0x1E0DE7AC8](cls);
}

int deflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE92C0](strm, *(_QWORD *)&flush);
}

int deflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE92D0](strm);
}

int deflateInit2_(z_streamp strm, int level, int method, int windowBits, int memLevel, int strategy, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92D8](strm, *(_QWORD *)&level, *(_QWORD *)&method, *(_QWORD *)&windowBits, *(_QWORD *)&memLevel, *(_QWORD *)&strategy, version, *(_QWORD *)&stream_size);
}

int deflateInit_(z_streamp strm, int level, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE92E0](strm, *(_QWORD *)&level, version, *(_QWORD *)&stream_size);
}

uint64_t dirstat_np()
{
  return MEMORY[0x1E0C82BB8]();
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

void dispatch_barrier_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82C28](queue, block);
}

dispatch_data_t dispatch_data_create(const void *buffer, size_t size, dispatch_queue_t queue, dispatch_block_t destructor)
{
  return (dispatch_data_t)MEMORY[0x1E0C82CB0](buffer, size, queue, destructor);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x1E0C82D00](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x1E0C82D08](key);
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

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x1E0C82E80](queue, key, context, destructor);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x1E0C82EA0](object);
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

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x1E0C82F10](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x1E0C82F20](type, handle, mask, queue);
}

uintptr_t dispatch_source_get_data(dispatch_source_t source)
{
  return MEMORY[0x1E0C82F28](source);
}

void dispatch_source_set_cancel_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F48](source, handler);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x1E0C82F58](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x1E0C82F78](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x1E0C82F88](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x1E0C82F90](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x1E0C82FB8](when, delta);
}

int dlclose(void *__handle)
{
  return MEMORY[0x1E0C83030](__handle);
}

char *dlerror(void)
{
  return (char *)MEMORY[0x1E0C83038]();
}

void *__cdecl dlopen(const char *__path, int __mode)
{
  return (void *)MEMORY[0x1E0C83040](__path, *(_QWORD *)&__mode);
}

void *__cdecl dlsym(void *__handle, const char *__symbol)
{
  return (void *)MEMORY[0x1E0C83050](__handle, __symbol);
}

uint64_t dyld_has_inserted_or_interposing_libraries()
{
  return MEMORY[0x1E0C830C8]();
}

uint64_t dyld_shared_cache_iterate_text()
{
  return MEMORY[0x1E0C831A0]();
}

uint64_t dyld_shared_cache_some_image_overridden()
{
  return MEMORY[0x1E0C831A8]();
}

int fcntl(int a1, int a2, ...)
{
  return MEMORY[0x1E0C83300](*(_QWORD *)&a1, *(_QWORD *)&a2);
}

void free(void *a1)
{
  MEMORY[0x1E0C834A8](a1);
}

int fsctl(const char *a1, unint64_t a2, void *a3, unsigned int a4)
{
  return MEMORY[0x1E0C83528](a1, a2, a3, *(_QWORD *)&a4);
}

pid_t getpid(void)
{
  return MEMORY[0x1E0C83760]();
}

int gzclose(gzFile file)
{
  return MEMORY[0x1E0DE9310](file);
}

gzFile gzopen(const char *a1, const char *a2)
{
  return (gzFile)MEMORY[0x1E0DE9358](a1, a2);
}

int gzread(gzFile file, voidp buf, unsigned int len)
{
  return MEMORY[0x1E0DE9370](file, buf, *(_QWORD *)&len);
}

int gzwrite(gzFile file, voidpc buf, unsigned int len)
{
  return MEMORY[0x1E0DE9390](file, buf, *(_QWORD *)&len);
}

int inflate(z_streamp strm, int flush)
{
  return MEMORY[0x1E0DE93A0](strm, *(_QWORD *)&flush);
}

int inflateEnd(z_streamp strm)
{
  return MEMORY[0x1E0DE93B8](strm);
}

int inflateInit2_(z_streamp strm, int windowBits, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93C8](strm, *(_QWORD *)&windowBits, version, *(_QWORD *)&stream_size);
}

int inflateInit_(z_streamp strm, const char *version, int stream_size)
{
  return MEMORY[0x1E0DE93D0](strm, version, *(_QWORD *)&stream_size);
}

const char *__cdecl ivar_getName(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B28](v);
}

ptrdiff_t ivar_getOffset(Ivar v)
{
  return MEMORY[0x1E0DE7B30](v);
}

const char *__cdecl ivar_getTypeEncoding(Ivar v)
{
  return (const char *)MEMORY[0x1E0DE7B38](v);
}

ldiv_t ldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  ldiv_t result;

  v2 = MEMORY[0x1E0C83B50](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

lldiv_t lldiv(uint64_t a1, uint64_t a2)
{
  uint64_t v2;
  uint64_t v3;
  lldiv_t result;

  v2 = MEMORY[0x1E0C83B90](a1, a2);
  result.rem = v3;
  result.quot = v2;
  return result;
}

long double log(long double __x)
{
  long double result;

  MEMORY[0x1E0C83BB8](__x);
  return result;
}

char *__cdecl mach_error_string(mach_error_t error_value)
{
  return (char *)MEMORY[0x1E0C83C80](*(_QWORD *)&error_value);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83EF8](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x1E0C83F00](size, type_id);
}

void *__cdecl memcpy(void *__dst, const void *__src, size_t __n)
{
  return (void *)MEMORY[0x1E0C84088](__dst, __src, __n);
}

char *__cdecl method_copyArgumentType(Method m, unsigned int index)
{
  return (char *)MEMORY[0x1E0DE7B40](m, *(_QWORD *)&index);
}

char *__cdecl method_copyReturnType(Method m)
{
  return (char *)MEMORY[0x1E0DE7B48](m);
}

IMP method_getImplementation(Method m)
{
  return (IMP)MEMORY[0x1E0DE7B68](m);
}

SEL method_getName(Method m)
{
  return (SEL)MEMORY[0x1E0DE7B70](m);
}

int mkstemp(char *a1)
{
  return MEMORY[0x1E0C841A0](a1);
}

uint32_t notify_cancel(int token)
{
  return MEMORY[0x1E0C843D8](*(_QWORD *)&token);
}

uint32_t notify_register_dispatch(const char *name, int *out_token, dispatch_queue_t queue, notify_handler_t handler)
{
  return MEMORY[0x1E0C84408](name, out_token, queue, handler);
}

void nw_connection_cancel(nw_connection_t connection)
{
  MEMORY[0x1E0CCEFB8](connection);
}

nw_protocol_metadata_t nw_connection_copy_protocol_metadata(nw_connection_t connection, nw_protocol_definition_t definition)
{
  return (nw_protocol_metadata_t)MEMORY[0x1E0CCF020](connection, definition);
}

nw_connection_t nw_connection_create(nw_endpoint_t endpoint, nw_parameters_t parameters)
{
  return (nw_connection_t)MEMORY[0x1E0CCF030](endpoint, parameters);
}

void nw_connection_receive_message(nw_connection_t connection, nw_connection_receive_completion_t completion)
{
  MEMORY[0x1E0CCF130](connection, completion);
}

void nw_connection_send(nw_connection_t connection, dispatch_data_t content, nw_content_context_t context, BOOL is_complete, nw_connection_send_completion_t completion)
{
  MEMORY[0x1E0CCF168](connection, content, context, is_complete, completion);
}

uint64_t nw_connection_set_event_handler()
{
  return MEMORY[0x1E0CCF190]();
}

void nw_connection_set_queue(nw_connection_t connection, dispatch_queue_t queue)
{
  MEMORY[0x1E0CCF1B0](connection, queue);
}

void nw_connection_set_state_changed_handler(nw_connection_t connection, nw_connection_state_changed_handler_t handler)
{
  MEMORY[0x1E0CCF1C0](connection, handler);
}

void nw_connection_start(nw_connection_t connection)
{
  MEMORY[0x1E0CCF1D8](connection);
}

nw_protocol_metadata_t nw_content_context_copy_protocol_metadata(nw_content_context_t context, nw_protocol_definition_t protocol)
{
  return (nw_protocol_metadata_t)MEMORY[0x1E0CCF218](context, protocol);
}

nw_content_context_t nw_content_context_create(const char *context_identifier)
{
  return (nw_content_context_t)MEMORY[0x1E0CCF220](context_identifier);
}

void nw_content_context_set_metadata_for_protocol(nw_content_context_t context, nw_protocol_metadata_t protocol_metadata)
{
  MEMORY[0x1E0CCF258](context, protocol_metadata);
}

CFErrorRef nw_error_copy_cf_error(nw_error_t error)
{
  return (CFErrorRef)MEMORY[0x1E0CCF458](error);
}

nw_protocol_definition_t nw_framer_create_definition(const char *identifier, uint32_t flags, nw_framer_start_handler_t start_handler)
{
  return (nw_protocol_definition_t)MEMORY[0x1E0CCF5E8](identifier, *(_QWORD *)&flags, start_handler);
}

nw_protocol_options_t nw_framer_create_options(nw_protocol_definition_t framer_definition)
{
  return (nw_protocol_options_t)MEMORY[0x1E0CCF5F0](framer_definition);
}

BOOL nw_framer_deliver_input_no_copy(nw_framer_t framer, size_t input_length, nw_framer_message_t message, BOOL is_complete)
{
  return MEMORY[0x1E0CCF5F8](framer, input_length, message, is_complete);
}

void nw_framer_mark_failed_with_error(nw_framer_t framer, int error_code)
{
  MEMORY[0x1E0CCF600](framer, *(_QWORD *)&error_code);
}

id nw_framer_message_copy_object_value(nw_framer_message_t message, const char *key)
{
  return (id)MEMORY[0x1E0CCF610](message, key);
}

nw_framer_message_t nw_framer_message_create(nw_framer_t framer)
{
  return (nw_framer_message_t)MEMORY[0x1E0CCF618](framer);
}

void nw_framer_message_set_object_value(nw_framer_message_t message, const char *key, id value)
{
  MEMORY[0x1E0CCF620](message, key, value);
}

BOOL nw_framer_parse_input(nw_framer_t framer, size_t minimum_incomplete_length, size_t maximum_length, uint8_t *temp_buffer, nw_framer_parse_completion_t parse)
{
  return MEMORY[0x1E0CCF628](framer, minimum_incomplete_length, maximum_length, temp_buffer, parse);
}

nw_framer_message_t nw_framer_protocol_create_message(nw_protocol_definition_t definition)
{
  return (nw_framer_message_t)MEMORY[0x1E0CCF640](definition);
}

void nw_framer_set_cleanup_handler(nw_framer_t framer, nw_framer_cleanup_handler_t cleanup_handler)
{
  MEMORY[0x1E0CCF648](framer, cleanup_handler);
}

void nw_framer_set_input_handler(nw_framer_t framer, nw_framer_input_handler_t input_handler)
{
  MEMORY[0x1E0CCF650](framer, input_handler);
}

void nw_framer_set_output_handler(nw_framer_t framer, nw_framer_output_handler_t output_handler)
{
  MEMORY[0x1E0CCF658](framer, output_handler);
}

void nw_framer_set_stop_handler(nw_framer_t framer, nw_framer_stop_handler_t stop_handler)
{
  MEMORY[0x1E0CCF660](framer, stop_handler);
}

void nw_framer_set_wakeup_handler(nw_framer_t framer, nw_framer_wakeup_handler_t wakeup_handler)
{
  MEMORY[0x1E0CCF668](framer, wakeup_handler);
}

void nw_framer_write_output(nw_framer_t framer, const uint8_t *output_buffer, size_t output_length)
{
  MEMORY[0x1E0CCF670](framer, output_buffer, output_length);
}

BOOL nw_framer_write_output_no_copy(nw_framer_t framer, size_t output_length)
{
  return MEMORY[0x1E0CCF678](framer, output_length);
}

nw_protocol_stack_t nw_parameters_copy_default_protocol_stack(nw_parameters_t parameters)
{
  return (nw_protocol_stack_t)MEMORY[0x1E0CCF8C8](parameters);
}

uint64_t nw_parameters_create_quic_stream()
{
  return MEMORY[0x1E0CCF978]();
}

uint64_t nw_protocol_copy_quic_connection_definition()
{
  return MEMORY[0x1E0CCFEB0]();
}

void nw_protocol_stack_clear_application_protocols(nw_protocol_stack_t stack)
{
  MEMORY[0x1E0CCFFC8](stack);
}

void nw_protocol_stack_prepend_application_protocol(nw_protocol_stack_t stack, nw_protocol_options_t protocol)
{
  MEMORY[0x1E0CCFFF8](stack, protocol);
}

uint64_t nw_quic_connection_copy_sec_protocol_options()
{
  return MEMORY[0x1E0CD0150]();
}

uint64_t nw_quic_connection_set_initial_max_streams_bidirectional()
{
  return MEMORY[0x1E0CD01A0]();
}

uint64_t nw_quic_connection_set_initial_max_streams_unidirectional()
{
  return MEMORY[0x1E0CD01A8]();
}

uint64_t nw_quic_connection_set_keepalive()
{
  return MEMORY[0x1E0CD01B0]();
}

uint64_t nw_quic_connection_set_max_datagram_frame_size()
{
  return MEMORY[0x1E0CD01C0]();
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

void objc_copyWeak(id *to, id *from)
{
  MEMORY[0x1E0DE7C38](to, from);
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

void objc_exception_rethrow(void)
{
  MEMORY[0x1E0DE7C98]();
}

void objc_exception_throw(id exception)
{
  MEMORY[0x1E0DE7CA0](exception);
}

id objc_getAssociatedObject(id object, const void *key)
{
  return (id)MEMORY[0x1E0DE7CA8](object, key);
}

Class objc_getClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CB0](name);
}

Class objc_getMetaClass(const char *name)
{
  return (Class)MEMORY[0x1E0DE7CC8](name);
}

id objc_initWeak(id *location, id val)
{
  return (id)MEMORY[0x1E0DE7CE0](location, val);
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

void objc_setAssociatedObject(id object, const void *key, id value, void *policy)
{
  MEMORY[0x1E0DE7F40](object, key, value, policy);
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

void objc_terminate(void)
{
  MEMORY[0x1E0DE7FD8]();
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x1E0DE7FE0](a1);
}

const char *__cdecl object_getClassName(id a1)
{
  return (const char *)MEMORY[0x1E0DE8000](a1);
}

os_log_t os_log_create(const char *subsystem, const char *category)
{
  return (os_log_t)MEMORY[0x1E0C84728](subsystem, category);
}

BOOL os_log_type_enabled(os_log_t oslog, os_log_type_t type)
{
  return MEMORY[0x1E0C84780](oslog, type);
}

uint64_t os_state_add_handler()
{
  return MEMORY[0x1E0C84940]();
}

uint64_t os_state_remove_handler()
{
  return MEMORY[0x1E0C84948]();
}

uint64_t os_transaction_create()
{
  return MEMORY[0x1E0C84970]();
}

void os_unfair_lock_lock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C84998](lock);
}

void os_unfair_lock_unlock(os_unfair_lock_t lock)
{
  MEMORY[0x1E0C849B0](lock);
}

uint64_t os_unfair_recursive_lock_lock_with_options()
{
  return MEMORY[0x1E0C849B8]();
}

uint64_t os_unfair_recursive_lock_unlock()
{
  return MEMORY[0x1E0C849D0]();
}

uint64_t os_variant_has_internal_content()
{
  return MEMORY[0x1E0C849F0]();
}

uint64_t os_variant_has_internal_diagnostics()
{
  return MEMORY[0x1E0C849F8]();
}

long double pow(long double __x, long double __y)
{
  long double result;

  MEMORY[0x1E0C84BB8](__x, __y);
  return result;
}

objc_property_attribute_t *__cdecl property_copyAttributeList(objc_property_t property, unsigned int *outCount)
{
  return (objc_property_attribute_t *)MEMORY[0x1E0DE8058](property, outCount);
}

char *__cdecl property_copyAttributeValue(objc_property_t property, const char *attributeName)
{
  return (char *)MEMORY[0x1E0DE8060](property, attributeName);
}

const char *__cdecl property_getName(objc_property_t property)
{
  return (const char *)MEMORY[0x1E0DE8070](property);
}

objc_method_description *__cdecl protocol_copyMethodDescriptionList(Protocol *p, BOOL isRequiredMethod, BOOL isInstanceMethod, unsigned int *outCount)
{
  return (objc_method_description *)MEMORY[0x1E0DE8088](p, isRequiredMethod, isInstanceMethod, outCount);
}

objc_method_description protocol_getMethodDescription(Protocol *p, SEL aSel, BOOL isRequiredMethod, BOOL isInstanceMethod)
{
  const char *v4;
  char *v5;
  objc_method_description result;

  v4 = (const char *)MEMORY[0x1E0DE80A8](p, aSel, isRequiredMethod, isInstanceMethod);
  result.types = v5;
  result.name = v4;
  return result;
}

const char *__cdecl protocol_getName(Protocol *p)
{
  return (const char *)MEMORY[0x1E0DE80B0](p);
}

mach_port_t pthread_mach_thread_np(pthread_t a1)
{
  return MEMORY[0x1E0C84E00](a1);
}

int pthread_main_np(void)
{
  return MEMORY[0x1E0C84E08]();
}

pthread_t pthread_self(void)
{
  return (pthread_t)MEMORY[0x1E0C84ED8]();
}

char *__cdecl realpath_DARWIN_EXTSN(const char *a1, char *a2)
{
  return (char *)MEMORY[0x1E0C85040](a1, a2);
}

uint64_t sandbox_check()
{
  return MEMORY[0x1E0C85178]();
}

uint64_t sandbox_extension_consume()
{
  return MEMORY[0x1E0C851A0]();
}

uint64_t sandbox_extension_issue_file()
{
  return MEMORY[0x1E0C851A8]();
}

uint64_t sandbox_extension_release()
{
  return MEMORY[0x1E0C851F8]();
}

void sec_protocol_options_add_tls_application_protocol(sec_protocol_options_t options, const char *application_protocol)
{
  MEMORY[0x1E0CD7218](options, application_protocol);
}

void sec_protocol_options_set_verify_block(sec_protocol_options_t options, sec_protocol_verify_t verify_block, dispatch_queue_t verify_block_queue)
{
  MEMORY[0x1E0CD7350](options, verify_block, verify_block_queue);
}

SEL sel_getUid(const char *str)
{
  return (SEL)MEMORY[0x1E0DE80D0](str);
}

void *__cdecl sqlite3_aggregate_context(sqlite3_context *a1, int nBytes)
{
  return (void *)MEMORY[0x1E0DE8550](a1, *(_QWORD *)&nBytes);
}

int sqlite3_bind_blob64(sqlite3_stmt *a1, int a2, const void *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE8588](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_double(sqlite3_stmt *a1, int a2, double a3)
{
  return MEMORY[0x1E0DE8598](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_int(sqlite3_stmt *a1, int a2, int a3)
{
  return MEMORY[0x1E0DE85A0](a1, *(_QWORD *)&a2, *(_QWORD *)&a3);
}

int sqlite3_bind_int64(sqlite3_stmt *a1, int a2, sqlite3_int64 a3)
{
  return MEMORY[0x1E0DE85A8](a1, *(_QWORD *)&a2, a3);
}

int sqlite3_bind_null(sqlite3_stmt *a1, int a2)
{
  return MEMORY[0x1E0DE85B0](a1, *(_QWORD *)&a2);
}

int sqlite3_bind_parameter_index(sqlite3_stmt *a1, const char *zName)
{
  return MEMORY[0x1E0DE85C0](a1, zName);
}

int sqlite3_bind_pointer(sqlite3_stmt *a1, int a2, void *a3, const char *a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D0](a1, *(_QWORD *)&a2, a3, a4, a5);
}

int sqlite3_bind_text(sqlite3_stmt *a1, int a2, const char *a3, int a4, void (__cdecl *a5)(void *))
{
  return MEMORY[0x1E0DE85D8](a1, *(_QWORD *)&a2, a3, *(_QWORD *)&a4, a5);
}

int sqlite3_bind_text64(sqlite3_stmt *a1, int a2, const char *a3, sqlite3_uint64 a4, void (__cdecl *a5)(void *), unsigned __int8 encoding)
{
  return MEMORY[0x1E0DE85E8](a1, *(_QWORD *)&a2, a3, a4, a5, encoding);
}

int sqlite3_busy_timeout(sqlite3 *a1, int ms)
{
  return MEMORY[0x1E0DE8638](a1, *(_QWORD *)&ms);
}

int sqlite3_clear_bindings(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE8648](a1);
}

int sqlite3_close(sqlite3 *a1)
{
  return MEMORY[0x1E0DE8650](a1);
}

const void *__cdecl sqlite3_column_blob(sqlite3_stmt *a1, int iCol)
{
  return (const void *)MEMORY[0x1E0DE8660](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_bytes(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8668](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_count(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE8678](pStmt);
}

double sqlite3_column_double(sqlite3_stmt *a1, int iCol)
{
  double result;

  MEMORY[0x1E0DE8688](a1, *(_QWORD *)&iCol);
  return result;
}

int sqlite3_column_int(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8690](a1, *(_QWORD *)&iCol);
}

sqlite3_int64 sqlite3_column_int64(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE8698](a1, *(_QWORD *)&iCol);
}

const char *__cdecl sqlite3_column_name(sqlite3_stmt *a1, int N)
{
  return (const char *)MEMORY[0x1E0DE86A0](a1, *(_QWORD *)&N);
}

const unsigned __int8 *__cdecl sqlite3_column_text(sqlite3_stmt *a1, int iCol)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE86B8](a1, *(_QWORD *)&iCol);
}

int sqlite3_column_type(sqlite3_stmt *a1, int iCol)
{
  return MEMORY[0x1E0DE86C8](a1, *(_QWORD *)&iCol);
}

int sqlite3_create_function_v2(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xFunc)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8710](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xFunc, xStep, xFinal);
}

int sqlite3_create_window_function(sqlite3 *db, const char *zFunctionName, int nArg, int eTextRep, void *pApp, void (__cdecl *xStep)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xFinal)(sqlite3_context *), void (__cdecl *xValue)(sqlite3_context *), void (__cdecl *xInverse)(sqlite3_context *, int, sqlite3_value **), void (__cdecl *xDestroy)(void *))
{
  return MEMORY[0x1E0DE8728](db, zFunctionName, *(_QWORD *)&nArg, *(_QWORD *)&eTextRep, pApp, xStep, xFinal, xValue);
}

int sqlite3_errcode(sqlite3 *db)
{
  return MEMORY[0x1E0DE8780](db);
}

const char *__cdecl sqlite3_errmsg(sqlite3 *a1)
{
  return (const char *)MEMORY[0x1E0DE8788](a1);
}

int sqlite3_exec(sqlite3 *a1, const char *sql, int (__cdecl *callback)(void *, int, char **, char **), void *a4, char **errmsg)
{
  return MEMORY[0x1E0DE8798](a1, sql, callback, a4, errmsg);
}

char *__cdecl sqlite3_expanded_sql(sqlite3_stmt *pStmt)
{
  return (char *)MEMORY[0x1E0DE87A8](pStmt);
}

int sqlite3_finalize(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE87C8](pStmt);
}

void *__cdecl sqlite3_get_auxdata(sqlite3_context *a1, int N)
{
  return (void *)MEMORY[0x1E0DE87E8](a1, *(_QWORD *)&N);
}

int sqlite3_open_v2(const char *filename, sqlite3 **ppDb, int flags, const char *zVfs)
{
  return MEMORY[0x1E0DE8870](filename, ppDb, *(_QWORD *)&flags, zVfs);
}

int sqlite3_prepare_v2(sqlite3 *db, const char *zSql, int nByte, sqlite3_stmt **ppStmt, const char **pzTail)
{
  return MEMORY[0x1E0DE8880](db, zSql, *(_QWORD *)&nByte, ppStmt, pzTail);
}

int sqlite3_reset(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE88B0](pStmt);
}

void sqlite3_result_blob64(sqlite3_context *a1, const void *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE88C0](a1, a2, a3, a4);
}

void sqlite3_result_double(sqlite3_context *a1, double a2)
{
  MEMORY[0x1E0DE88C8](a1, a2);
}

void sqlite3_result_error(sqlite3_context *a1, const char *a2, int a3)
{
  MEMORY[0x1E0DE88D0](a1, a2, *(_QWORD *)&a3);
}

void sqlite3_result_error_code(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88D8](a1, *(_QWORD *)&a2);
}

void sqlite3_result_error_nomem(sqlite3_context *a1)
{
  MEMORY[0x1E0DE88E0](a1);
}

void sqlite3_result_error_toobig(sqlite3_context *a1)
{
  MEMORY[0x1E0DE88E8](a1);
}

void sqlite3_result_int(sqlite3_context *a1, int a2)
{
  MEMORY[0x1E0DE88F0](a1, *(_QWORD *)&a2);
}

void sqlite3_result_int64(sqlite3_context *a1, sqlite3_int64 a2)
{
  MEMORY[0x1E0DE88F8](a1, a2);
}

void sqlite3_result_null(sqlite3_context *a1)
{
  MEMORY[0x1E0DE8900](a1);
}

void sqlite3_result_pointer(sqlite3_context *a1, void *a2, const char *a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8908](a1, a2, a3, a4);
}

void sqlite3_result_text(sqlite3_context *a1, const char *a2, int a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8910](a1, a2, *(_QWORD *)&a3, a4);
}

void sqlite3_result_text64(sqlite3_context *a1, const char *a2, sqlite3_uint64 a3, void (__cdecl *a4)(void *), unsigned __int8 encoding)
{
  MEMORY[0x1E0DE8918](a1, a2, a3, a4, encoding);
}

void sqlite3_set_auxdata(sqlite3_context *a1, int N, void *a3, void (__cdecl *a4)(void *))
{
  MEMORY[0x1E0DE8948](a1, *(_QWORD *)&N, a3, a4);
}

int sqlite3_step(sqlite3_stmt *a1)
{
  return MEMORY[0x1E0DE89A8](a1);
}

int sqlite3_stmt_readonly(sqlite3_stmt *pStmt)
{
  return MEMORY[0x1E0DE89B8](pStmt);
}

void *__cdecl sqlite3_user_data(sqlite3_context *a1)
{
  return (void *)MEMORY[0x1E0DE8A10](a1);
}

const void *__cdecl sqlite3_value_blob(sqlite3_value *a1)
{
  return (const void *)MEMORY[0x1E0DE8A18](a1);
}

int sqlite3_value_bytes(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A20](a1);
}

double sqlite3_value_double(sqlite3_value *a1)
{
  double result;

  MEMORY[0x1E0DE8A30](a1);
  return result;
}

int sqlite3_value_int(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A48](a1);
}

sqlite3_int64 sqlite3_value_int64(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A50](a1);
}

void *__cdecl sqlite3_value_pointer(sqlite3_value *a1, const char *a2)
{
  return (void *)MEMORY[0x1E0DE8A58](a1, a2);
}

const unsigned __int8 *__cdecl sqlite3_value_text(sqlite3_value *a1)
{
  return (const unsigned __int8 *)MEMORY[0x1E0DE8A60](a1);
}

int sqlite3_value_type(sqlite3_value *a1)
{
  return MEMORY[0x1E0DE8A70](a1);
}

int strcmp(const char *__s1, const char *__s2)
{
  return MEMORY[0x1E0C85520](__s1, __s2);
}

char *__cdecl strdup(const char *__s1)
{
  return (char *)MEMORY[0x1E0C85540](__s1);
}

char *__cdecl strerror(int __errnum)
{
  return (char *)MEMORY[0x1E0C85548](*(_QWORD *)&__errnum);
}

size_t strlen(const char *__s)
{
  return MEMORY[0x1E0C85578](__s);
}

char *__cdecl strncpy(char *__dst, const char *__src, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B0](__dst, __src, __n);
}

char *__cdecl strndup(const char *__s1, size_t __n)
{
  return (char *)MEMORY[0x1E0C855B8](__s1, __n);
}

uint64_t strtol(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C85658](__str, __endptr, *(_QWORD *)&__base);
}

unint64_t strtoull(const char *__str, char **__endptr, int __base)
{
  return MEMORY[0x1E0C856A8](__str, __endptr, *(_QWORD *)&__base);
}

int sysctl(int *a1, u_int a2, void *a3, size_t *a4, void *a5, size_t a6)
{
  return MEMORY[0x1E0C85798](a1, *(_QWORD *)&a2, a3, a4, a5, a6);
}

kern_return_t task_info(task_name_t target_task, task_flavor_t flavor, task_info_t task_info_out, mach_msg_type_number_t *task_info_outCnt)
{
  return MEMORY[0x1E0C85838](*(_QWORD *)&target_task, *(_QWORD *)&flavor, task_info_out, task_info_outCnt);
}

uint64_t tcc_credential_create_for_process_with_audit_token()
{
  return MEMORY[0x1E0DB1240]();
}

uint64_t tcc_identity_create()
{
  return MEMORY[0x1E0DB1290]();
}

uint64_t tcc_identity_get_identifier()
{
  return MEMORY[0x1E0DB12A0]();
}

uint64_t tcc_identity_get_type()
{
  return MEMORY[0x1E0DB12A8]();
}

uint64_t tcc_message_options_create()
{
  return MEMORY[0x1E0DB12C8]();
}

uint64_t tcc_message_options_set_reply_handler_policy()
{
  return MEMORY[0x1E0DB12F0]();
}

uint64_t tcc_server_create()
{
  return MEMORY[0x1E0DB1320]();
}

uint64_t tcc_server_message_get_identity_for_credential()
{
  return MEMORY[0x1E0DB1338]();
}

kern_return_t thread_info(thread_inspect_t target_act, thread_flavor_t flavor, thread_info_t thread_info_out, mach_msg_type_number_t *thread_info_outCnt)
{
  return MEMORY[0x1E0C858F8](*(_QWORD *)&target_act, *(_QWORD *)&flavor, thread_info_out, thread_info_outCnt);
}

int unlink(const char *a1)
{
  return MEMORY[0x1E0C859B8](a1);
}

vImage_Error vImageBuffer_InitWithCGImage(vImage_Buffer *buf, vImage_CGImageFormat *format, const CGFloat *backgroundColor, CGImageRef image, vImage_Flags flags)
{
  return MEMORY[0x1E0C8CC28](buf, format, backgroundColor, image, *(_QWORD *)&flags);
}

vImage_Error vImageUnpremultiplyData_ARGB8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D7A8](src, dest, *(_QWORD *)&flags);
}

vImage_Error vImageUnpremultiplyData_RGBA8888(const vImage_Buffer *src, const vImage_Buffer *dest, vImage_Flags flags)
{
  return MEMORY[0x1E0C8D7D8](src, dest, *(_QWORD *)&flags);
}

int vsnprintf(char *__str, size_t __size, const char *__format, va_list a4)
{
  return MEMORY[0x1E0C85B98](__str, __size, __format, a4);
}

ssize_t write(int __fd, const void *__buf, size_t __nbyte)
{
  return MEMORY[0x1E0C85D40](*(_QWORD *)&__fd, __buf, __nbyte);
}


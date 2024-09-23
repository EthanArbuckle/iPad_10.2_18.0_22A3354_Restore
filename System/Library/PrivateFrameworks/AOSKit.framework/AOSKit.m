_QWORD *AOSAccountCreate(uint64_t a1, const void *a2, const void *a3, const void *a4)
{
  _QWORD *Instance;
  CFTypeRef v8;
  CFTypeRef v9;

  if (!kAOSAccountTypeID)
    kAOSAccountTypeID = _CFRuntimeRegisterClass();
  Instance = (_QWORD *)_CFRuntimeCreateInstance();
  if (Instance)
  {
    if (a2)
      Instance[2] = CFRetain(a2);
    if (a3)
      v8 = CFRetain(a3);
    else
      v8 = 0;
    Instance[3] = v8;
    if (a4)
      v9 = CFRetain(a4);
    else
      v9 = 0;
    Instance[4] = v9;
    if (!Instance[2])
    {
      CFRelease(Instance);
      return 0;
    }
  }
  return Instance;
}

void *AOSAccountCopyAuthInfo(uint64_t a1, void *a2, uint64_t a3, CFErrorRef *a4)
{
  id v7;
  void *v8;
  void *v9;
  void *v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  CFErrorRef v14;
  CFIndex v15;

  v7 = objc_alloc_init(MEMORY[0x24BDD1460]);
  if (!a1)
  {
    if (_AOSValidateURL(a2))
    {
      v8 = 0;
      goto LABEL_11;
    }
LABEL_13:
    NSLog(CFSTR("AOSKit ERROR: Invalid url, cannot return auth info: %@"), a2);
    v15 = 5001;
    if (!a4)
    {
LABEL_19:
      v8 = 0;
      goto LABEL_20;
    }
LABEL_14:
    v14 = CFErrorCreate(0, kAOSErrorDomain, v15, 0);
    v8 = 0;
    goto LABEL_15;
  }
  v8 = *(void **)(a1 + 16);
  if (!_AOSValidateURL(a2))
    goto LABEL_13;
  if (!v8)
    goto LABEL_11;
  v9 = (void *)objc_msgSend((id)objc_msgSend(MEMORY[0x24BE048E0], "sharedManager"), "accountWithUsername:", v8);
  if (!v9)
  {
    NSLog(CFSTR("AOSKit ERROR: No account info found for %@"), v8);
    goto LABEL_18;
  }
  v10 = v9;
  v11 = objc_msgSend(v9, "personID");
  v12 = objc_msgSend(v10, "authToken");
  v13 = v12;
  if (!v11 || !v12)
  {
    NSLog(CFSTR("AOSKit ERROR: Invalid account info found for %@, dsid='%@', tokenFound=%d"), v8, v11, v12 != 0);
LABEL_18:
    v15 = 5000;
    if (!a4)
      goto LABEL_19;
    goto LABEL_14;
  }
  v8 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  objc_msgSend(v8, "setObject:forKey:", v11, kAOSPersonIDKey);
  objc_msgSend(v8, "setObject:forKey:", v13, kAOSAuthTokenKey);
  if (v8)
    CFRetain(v8);
LABEL_11:
  if (a4)
  {
    v14 = 0;
LABEL_15:
    *a4 = v14;
  }
LABEL_20:
  objc_msgSend(v7, "drain");
  return v8;
}

uint64_t AOSAccountGetUser(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t _AOSValidateURL(void *a1)
{
  id v2;
  void *v3;
  int v4;
  void *v5;
  int v6;
  int v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  void *v11;
  void *v12;
  unint64_t v13;
  _BOOL4 v14;

  v2 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v3 = (void *)objc_msgSend(a1, "host");
  v4 = objc_msgSend((id)objc_msgSend((id)objc_msgSend(a1, "scheme"), "lowercaseString"), "isEqualToString:", CFSTR("https"));
  v5 = (void *)objc_msgSend((id)objc_msgSend(v3, "lowercaseString"), "componentsSeparatedByString:", CFSTR("."));
  v6 = objc_msgSend(v5, "count");
  v7 = v6;
  v14 = 0;
  if (v6 >= 2)
  {
    v8 = objc_msgSend(v5, "objectAtIndex:", (v6 - 1));
    v9 = objc_msgSend(v5, "objectAtIndex:", (v7 - 2));
    v10 = (void *)objc_msgSend(MEMORY[0x24BDD17C8], "stringWithFormat:", CFSTR("%@.%@"), v9, v8);
    v11 = v10;
    if (v10)
    {
      if (objc_msgSend(v10, "length"))
      {
        if ((objc_msgSend(v11, "isEqualToString:", CFSTR("icloud.com")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("me.com")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("mac.com")) & 1) != 0
          || (objc_msgSend(v11, "isEqualToString:", CFSTR("apple.com")) & 1) != 0
          || (v12 = (void *)objc_msgSend(v3, "lowercaseString"),
              (objc_msgSend(v12, "isEqualToString:", CFSTR("icloud.com.cn")) & 1) != 0)
          || objc_msgSend(v12, "hasSuffix:", CFSTR(".icloud.com.cn"))
          && (v13 = objc_msgSend(v12, "length"), v13 > objc_msgSend(CFSTR(".icloud.com.cn"), "length"))
          || objc_msgSend(v11, "isEqualToString:", GetDomain()))
        {
          v14 = 1;
        }
      }
    }
  }
  objc_msgSend(v2, "drain");
  return v4 & v14;
}

void sub_22987A884()
{
  objc_end_catch();
  JUMPOUT(0x22987A88CLL);
}

AOSTransaction *_AOSAccountResolveAuthFailure(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, uint64_t *a6)
{
  id v12;
  void *v13;
  void *v14;
  uint64_t v15;
  AOSTransaction *v16;

  v12 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v13 = (void *)objc_msgSend(MEMORY[0x24BDBCED8], "dictionary");
  v14 = v13;
  if (a2)
    objc_msgSend(v13, "setObject:forKey:", a2, kAOSAuthRequestURLKey);
  if (a3)
    objc_msgSend(v14, "setObject:forKey:", a3, kAOSAuthRealmKey);
  if (a4)
    objc_msgSend(v14, "setObject:forKey:", a4, kAOSAuthPreviousTokenKey);
  v15 = objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a5 != 0);
  objc_msgSend(v14, "setObject:forKey:", v15, kAOSAuthUIAllowedKey);
  v16 = AOSLaunchAuthThread(a1, (uint64_t)v14, a6);
  objc_msgSend(v12, "drain");
  return v16;
}

uint64_t AOSAccountGetPassword(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

uint64_t AOSAccountGetAppleID(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

uint64_t AOSAccountGetProperties(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 32);
  return result;
}

void _AOSAccountSetProperties(uint64_t a1, CFTypeRef cf)
{
  const void *v3;
  CFTypeRef v4;

  if (a1)
  {
    v3 = *(const void **)(a1 + 32);
    if (cf)
      v4 = CFRetain(cf);
    else
      v4 = 0;
    *(_QWORD *)(a1 + 32) = v4;
    if (v3)
      CFRelease(v3);
  }
}

uint64_t GetDomain()
{
  uint64_t result;

  result = _otherDomain;
  if (!_otherDomain)
  {
    _otherDomain = (uint64_t)objc_alloc_init(MEMORY[0x24BDD16A8]);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%@"), CFSTR("digit"));
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%c"), 97);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%c"), 108);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%c"), 104);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%c"), 117);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%c"), 98);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%c"), 46);
    objc_msgSend((id)_otherDomain, "appendFormat:", CFSTR("%@"), CFSTR("com"));
    return _otherDomain;
  }
  return result;
}

void AOSAccountDestroy(_QWORD *a1)
{
  const void *v2;
  const void *v3;
  const void *v4;

  v2 = (const void *)a1[2];
  if (v2)
  {
    CFRelease(v2);
    a1[2] = 0;
  }
  v3 = (const void *)a1[3];
  if (v3)
  {
    CFRelease(v3);
    a1[3] = 0;
  }
  v4 = (const void *)a1[4];
  if (v4)
  {
    CFRelease(v4);
    a1[4] = 0;
  }
}

void sub_22987AF7C()
{
  objc_end_catch();
  JUMPOUT(0x22987AF84);
}

AOSTransaction *AOSLaunchAuthThread(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  id v6;
  AOSTransaction *v7;
  AOSContext *v8;
  AOSContext *v9;

  v6 = objc_alloc_init(MEMORY[0x24BDD1460]);
  v7 = AOSTransactionCreate(*MEMORY[0x24BDBD240], a3);
  v8 = +[AOSContext contextWithAccount:andTransaction:](AOSContext, "contextWithAccount:andTransaction:", a1, v7);
  v9 = v8;
  if (v8)
    CFRetain(v8);
  -[AOSContext setInfo:](v9, "setInfo:", a2);
  objc_msgSend(MEMORY[0x24BDD17F0], "detachNewThreadSelector:toTarget:withObject:", sel_runAuthThreadWithContext_, +[AOSThreadManager sharedManager](AOSThreadManager, "sharedManager"), v9);
  if (!AOSTransactionIsAsync((uint64_t)v7))
    AOSTransactionWaitUntilFinished((uint64_t)v7);
  objc_msgSend(v6, "drain");
  return v7;
}

void sub_22987B41C(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

void sub_22987B4C4(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

AOSTransaction *AOSTransactionCreate(uint64_t a1, uint64_t *a2)
{
  AOSTransaction *v3;
  AOSTransaction *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  NSObject *global_queue;
  uint64_t v9;
  uint64_t (*v10)(void);
  void *v11;

  v3 = objc_alloc_init(AOSTransaction);
  v4 = v3;
  if (!a2)
    return v4;
  if (!v3)
    return v4;
  v5 = (void *)a2[1];
  if (!v5 && !a2[6])
    return v4;
  v6 = *a2;
  v3->callbackFunction = v5;
  if (v6 >= 1)
  {
    v7 = (void *)a2[6];
    if (v7)
      v7 = (void *)CFRetain((CFTypeRef)objc_msgSend(v7, "copy"));
    v4->callbackBlock = v7;
    global_queue = a2[7];
    if (global_queue)
    {
      v4->callbackQueue = (OS_dispatch_queue *)global_queue;
    }
    else
    {
      global_queue = dispatch_get_global_queue(0, 0);
      v4->callbackQueue = (OS_dispatch_queue *)global_queue;
      if (!global_queue)
        goto LABEL_12;
    }
    dispatch_retain(global_queue);
  }
LABEL_12:
  v9 = a2[2];
  if (v9)
  {
    v10 = (uint64_t (*)(void))a2[3];
    if (v10)
    {
      v4->contextRetain = v10;
      v9 = v10();
    }
    v4->context = (void *)v9;
    v11 = (void *)a2[4];
    if (v11)
      v4->contextRelease = v11;
  }
  return v4;
}

uint64_t AOSTransactionSuccessful(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 8);
}

uint64_t AOSTransactionSetSuccessful(uint64_t result, char a2)
{
  *(_BYTE *)(result + 8) = a2;
  return result;
}

uint64_t AOSTransactionGetResult(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 16);
  return result;
}

void AOSTransactionSetResult(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v2;

  if (a1)
  {
    if (cf)
    {
      v2 = *(CFTypeRef *)(a1 + 16);
      if (v2 != cf)
      {
        *(_QWORD *)(a1 + 16) = CFRetain(cf);
        if (v2)
          CFRelease(v2);
      }
    }
  }
}

uint64_t AOSTransactionGetError(uint64_t result)
{
  if (result)
    return *(_QWORD *)(result + 24);
  return result;
}

void AOSTransactionSetError(uint64_t a1, CFTypeRef cf)
{
  CFTypeRef v2;

  if (a1)
  {
    if (cf)
    {
      v2 = *(CFTypeRef *)(a1 + 24);
      if (v2 != cf)
      {
        *(_QWORD *)(a1 + 24) = CFRetain(cf);
        if (v2)
          CFRelease(v2);
      }
    }
  }
}

uint64_t AOSTransactionIsFinished(uint64_t a1)
{
  return *(unsigned __int8 *)(a1 + 9);
}

uint64_t AOSTransactionSetIsFinished(uint64_t result, int a2)
{
  uint64_t v2;

  if (result)
  {
    v2 = result;
    *(_BYTE *)(result + 9) = a2;
    if (a2)
    {
      objc_msgSend(*(id *)(result + 64), "lock");
      return objc_msgSend(*(id *)(v2 + 64), "unlockWithCondition:", 1);
    }
  }
  return result;
}

_QWORD *AOSTransactionCancel(_QWORD *result)
{
  _QWORD *v1;
  const void *v2;
  void *v3;

  if (result)
  {
    v1 = result;
    objc_sync_enter(result);
    v1[4] = 0;
    v2 = (const void *)v1[5];
    if (v2)
    {
      CFRelease(v2);
      v3 = (void *)v1[5];
    }
    else
    {
      v3 = 0;
    }

    v1[5] = 0;
    return (_QWORD *)objc_sync_exit(v1);
  }
  return result;
}

void sub_22987B880(_Unwind_Exception *a1)
{
  void *v1;

  objc_sync_exit(v1);
  _Unwind_Resume(a1);
}

uint64_t AOSTransactionGetCallbackFunction(uint64_t a1)
{
  return *(_QWORD *)(a1 + 32);
}

uint64_t AOSTransactionGetCallbackBlock(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40);
}

uint64_t AOSTransactionGetCallbackQueue(uint64_t a1)
{
  return *(_QWORD *)(a1 + 48);
}

uint64_t AOSTransactionGetContext(uint64_t a1)
{
  return *(_QWORD *)(a1 + 56);
}

uint64_t AOSTransactionWaitUntilFinished(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 64), "lockWhenCondition:", 1);
  return objc_msgSend(*(id *)(a1 + 64), "unlock");
}

BOOL AOSTransactionIsAsync(uint64_t a1)
{
  return *(_QWORD *)(a1 + 40) || *(_QWORD *)(a1 + 32) != 0;
}

void AOSTransactionUpdate(uint64_t a1, uint64_t a2)
{
  const void *v4;
  int v5;

  if (a2)
  {
    AOSTransactionSetResult(a1, *(CFTypeRef *)(a2 + 16));
    v4 = *(const void **)(a2 + 24);
  }
  else
  {
    AOSTransactionSetResult(a1, 0);
    v4 = 0;
  }
  AOSTransactionSetError(a1, v4);
  *(_BYTE *)(a1 + 8) = *(_BYTE *)(a2 + 8);
  v5 = *(unsigned __int8 *)(a2 + 9);
  *(_BYTE *)(a1 + 9) = v5;
  if (v5)
  {
    objc_msgSend(*(id *)(a1 + 64), "lock");
    objc_msgSend(*(id *)(a1 + 64), "unlockWithCondition:", 1);
  }
}

CFErrorRef CFErrorCreate(CFAllocatorRef allocator, CFErrorDomain domain, CFIndex code, CFDictionaryRef userInfo)
{
  return (CFErrorRef)MEMORY[0x24BDBBE88](allocator, domain, code, userInfo);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void NSLog(NSString *format, ...)
{
  MEMORY[0x24BDD1000](format);
}

uint64_t _CFRuntimeCreateInstance()
{
  return MEMORY[0x24BDBD0A8]();
}

uint64_t _CFRuntimeRegisterClass()
{
  return MEMORY[0x24BDBD0B0]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
}

id objc_autorelease(id a1)
{
  return (id)MEMORY[0x24BEDCFA8](a1);
}

id objc_begin_catch(void *exc_buf)
{
  return (id)MEMORY[0x24BEDCFD8](exc_buf);
}

void objc_end_catch(void)
{
  MEMORY[0x24BEDD050]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

int objc_sync_enter(id obj)
{
  return MEMORY[0x24BEDD438](obj);
}

int objc_sync_exit(id obj)
{
  return MEMORY[0x24BEDD440](obj);
}


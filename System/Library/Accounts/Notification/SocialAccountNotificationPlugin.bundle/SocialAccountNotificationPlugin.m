CFStringRef sub_230F6AC24(CFStringRef originalString)
{
  return objc_autoreleaseReturnValue((id)CFURLCreateStringByAddingPercentEscapes((CFAllocatorRef)*MEMORY[0x24BDBD240], originalString, 0, CFSTR(":/?#[]@!$&‚Äö√Ñ√¥()*+,;='"),
                                           0x8000100u));
}

void sub_230F6ADD0(_Unwind_Exception *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, ...)
{
  va_list va;

  va_start(va, a9);
  _Block_object_dispose(va, 8);
  _Unwind_Resume(a1);
}

void sub_230F6ADE8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v4;
  id v5;
  __int128 v6;
  _QWORD v7[4];
  __int128 v8;

  if (a3)
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 40));
  }
  else
  {
    v4 = *(void **)(a1 + 32);
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = sub_230F6AE84;
    v7[3] = &unk_24FFC06C8;
    v6 = *(_OWORD *)(a1 + 40);
    v5 = (id)v6;
    v8 = v6;
    objc_msgSend(v4, "accountsWithAccountType:handler:", a2, v7);

  }
}

intptr_t sub_230F6AE84(uint64_t a1, void *a2)
{
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = objc_msgSend(a2, "count") != 0;
  return dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));
}

void sub_230F6B0F0(uint64_t a1)
{
  uint64_t v2;
  id v3;
  id v4;
  id v5;
  void *v6;
  id v7;
  id v8;

  v2 = *(_QWORD *)(a1 + 32);
  v7 = 0;
  v8 = 0;
  v3 = (id)objc_msgSend(MEMORY[0x24BDD1810], "sendSynchronousRequest:returningResponse:error:", v2, &v8, &v7);
  v4 = v8;
  v5 = v7;
  if (v5)
  {
    _SLLog();
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 40), "username");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    _SLLog();

  }
}

CFStringRef CFURLCreateStringByAddingPercentEscapes(CFAllocatorRef allocator, CFStringRef originalString, CFStringRef charactersToLeaveUnescaped, CFStringRef legalURLCharactersToBeEscaped, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC838](allocator, originalString, charactersToLeaveUnescaped, legalURLCharactersToBeEscaped, *(_QWORD *)&encoding);
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t _SLLog()
{
  return MEMORY[0x24BDE9940]();
}

void _Unwind_Resume(_Unwind_Exception *exception_object)
{
  MEMORY[0x24BDAC780](exception_object);
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

dispatch_semaphore_t dispatch_semaphore_create(intptr_t value)
{
  return (dispatch_semaphore_t)MEMORY[0x24BDADF28](value);
}

intptr_t dispatch_semaphore_signal(dispatch_semaphore_t dsema)
{
  return MEMORY[0x24BDADF30](dsema);
}

intptr_t dispatch_semaphore_wait(dispatch_semaphore_t dsema, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADF38](dsema, timeout);
}

id objc_alloc(Class a1)
{
  return (id)MEMORY[0x24BEDCF68](a1);
}

id objc_autoreleaseReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDCFD0](a1);
}

uint64_t objc_claimAutoreleasedReturnValue()
{
  return MEMORY[0x24BEDCFE8]();
}

id objc_msgSendSuper2(objc_super *a1, SEL a2, ...)
{
  return (id)MEMORY[0x24BEDD120](a1, a2);
}

id objc_unsafeClaimAutoreleasedReturnValue(id a1)
{
  return (id)MEMORY[0x24BEDD458](a1);
}


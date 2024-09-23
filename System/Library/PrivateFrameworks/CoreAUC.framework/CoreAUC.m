uint64_t cVtdPOVleEtmSPBdy(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(uint64_t);

  result = CMBaseObjectGetVTable();
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 8);
  if (v3)
    return v3(a1);
  return result;
}

uint64_t HtERfbh945Re3oy(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t (*v12)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);

  v12 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                       + 24);
  if (v12)
    return v12(a1, a2, a3, a4, a5, a6);
  else
    return 4294954514;
}

uint64_t Gnf6vZyAVLNQta0BwK_0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t v4;

  if (!a4)
    return 4294954786;
  sub_206844C60();
  v4 = CMDerivedObjectCreate();
  if ((_DWORD)v4)
    return v4;
  else
    return 4294954785;
}

void sub_206841E54()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  sub_206843870(DerivedStorage);
}

CFStringRef sub_206841E68(const void *a1)
{
  uint64_t DerivedStorage;
  __CFString *v3;
  const __CFAllocator *v4;
  CFIndex v5;
  CFStringRef v6;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = sub_206843EC0(DerivedStorage + 72);
  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFGetRetainCount(a1);
  v6 = CFStringCreateWithFormat(v4, 0, CFSTR("[AUCHDCPMonitor(Barney) %p retain count %d]\n%@"), a1, v5, v3);
  if (v3)
    CFRelease(v3);
  return v6;
}

uint64_t sub_206841EE8()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206843E8C(DerivedStorage);
}

uint64_t sub_206841EFC()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206843EA4(DerivedStorage);
}

uint64_t sub_206841F10(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _BYTE *a5, _DWORD *a6)
{
  uint64_t DerivedStorage;
  uint64_t result;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  result = sub_2068438D4(DerivedStorage, a2, a3, a4, a5, 0);
  if (a6)
  {
    if (!(_DWORD)result)
      *a6 = ++dword_253E53058;
  }
  return result;
}

uint64_t sub_206841F84(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206843DF8(DerivedStorage, a2, a3);
}

uint64_t sub_206841FB0(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4)
{
  *a3 = 4;
  if (a4)
    *a4 = ++dword_254514B94;
  return 0;
}

uint64_t sub_206841FD8()
{
  return 0;
}

void sub_206841FE0(uint64_t a1, uint64_t a2, uint64_t *a3)
{
  uint64_t v5;
  const void *v6;
  uint64_t DerivedStorage;
  uint64_t v8;
  void (*v9)(uint64_t, int *);
  NSObject *v10;
  NSObject *global_queue;
  _QWORD v12[6];
  int v13;
  uint64_t v14;
  int v15;
  int v16;
  uint64_t block;
  uint64_t v18;
  void (*v19)(uint64_t);
  void *v20;
  const void *v21;

  v5 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v5)
  {
    v6 = (const void *)v5;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    sub_206842F78(DerivedStorage);
    v8 = MEMORY[0x24BDAC760];
    if (*(_QWORD *)(DerivedStorage + 136))
    {
      v16 = 0;
      v9 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v9)
        v9(a1, &v16);
      block = *a3;
      LODWORD(v18) = *((_DWORD *)a3 + 2);
      CFRetain(v6);
      v10 = *(NSObject **)(DerivedStorage + 32);
      v12[0] = v8;
      v12[1] = 0x40000000;
      v12[2] = sub_2068423D8;
      v12[3] = &unk_24BFE5F00;
      v13 = v16;
      v15 = v18;
      v14 = block;
      v12[4] = DerivedStorage;
      v12[5] = v6;
      dispatch_async(v10, v12);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block = v8;
    v18 = 0x40000000;
    v19 = sub_206842460;
    v20 = &unk_24BFE5F20;
    v21 = v6;
    dispatch_async(global_queue, &block);
  }
}

void sub_206842104(uint64_t a1)
{
  CFStringRef v2;
  uint64_t v3;
  NSObject *global_queue;
  char *cStr;
  _QWORD block[5];

  cStr = 0;
  v2 = 0;
  if (!sub_20685026C((uint64_t)&cStr) && cStr)
  {
    v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
    sub_206847DD8((uint64_t)cStr);
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, CFStringRef))(*(_QWORD *)(a1 + 32) + 120))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 72), 0, *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), v2);
  if (v2)
    CFRelease(v2);
  v3 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206842460;
  block[3] = &unk_24BFE5F20;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void sub_2068421DC(uint64_t a1, int a2, uint64_t *a3)
{
  uint64_t v6;
  _QWORD *DerivedStorage;
  NSObject *global_queue;
  _QWORD block[5];

  v6 = FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = (_QWORD *)CMBaseObjectGetDerivedStorage();
  if (v6)
  {
    sub_20684322C(DerivedStorage, a1, a2, a3);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_206842460;
    block[3] = &unk_24BFE5F20;
    block[4] = v6;
    dispatch_async(global_queue, block);
  }
}

void sub_206842278(uint64_t a1)
{
  CFStringRef v2;
  uint64_t v3;
  NSObject *global_queue;
  char *cStr;
  _QWORD block[5];

  cStr = 0;
  v2 = 0;
  if (!sub_206842B10((uint64_t)&cStr) && cStr)
  {
    v2 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x24BDBD240], cStr, 0x8000100u);
    sub_206842B50((uint64_t)cStr);
  }
  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD, _QWORD, CFStringRef))(*(_QWORD *)(a1 + 32) + 120))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(*(_QWORD *)(a1 + 32) + 72), 0, 0, *(unsigned int *)(a1 + 52), v2);
  if (v2)
    CFRelease(v2);
  v3 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206842460;
  block[3] = &unk_24BFE5F20;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

void sub_206842350(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 136))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206842460;
  block[3] = &unk_24BFE5F20;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_2068423D8(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 136))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56), *(unsigned __int8 *)(a1 + 60));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206842460;
  block[3] = &unk_24BFE5F20;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_206842460(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t sub_206842470(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  v6 = 4294951836;
  if (a2 && a1 && a6)
  {
    sub_2068452C8();
    v7 = CMDerivedObjectCreate();
    if ((_DWORD)v7)
      return v7;
    else
      return 4294951835;
  }
  return v6;
}

void sub_206842678()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  uint64_t v2;
  NSObject *v3;
  NSObject *v4;
  NSObject *v5;
  const void *v6;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = CMBaseObjectGetDerivedStorage();
  v2 = CMBaseObjectGetDerivedStorage();
  v3 = *(NSObject **)(v2 + 64);
  if (v3)
  {
    dispatch_source_cancel(v3);
    v4 = *(NSObject **)(v2 + 64);
    if (v4)
    {
      dispatch_release(v4);
      *(_QWORD *)(v2 + 64) = 0;
    }
  }
  v5 = *(NSObject **)(v2 + 72);
  if (v5)
  {
    dispatch_release(v5);
    *(_QWORD *)(v2 + 72) = 0;
  }
  sub_206845474(v1);
  v6 = *(const void **)(DerivedStorage + 48);
  if (v6)
    CFRelease(v6);
}

CFStringRef sub_206842708(const void *a1)
{
  return sub_206845418(a1, (uint64_t)CFSTR("GPO"));
}

uint64_t sub_206842714(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_2068454E0(DerivedStorage, a2);
}

uint64_t sub_206842738(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206845504(DerivedStorage, a2);
}

uint64_t sub_20684275C(uint64_t a1, _DWORD *a2, _DWORD *a3, _DWORD *a4, _DWORD *a5, _BYTE *a6)
{
  uint64_t result;

  if (!CMBaseObjectGetDerivedStorage())
    return 4294951836;
  CMBaseObjectGetDerivedStorage();
  IOMobileFramebufferGetProtectionOptions();
  if (a2)
    *a2 = 2;
  if (a4)
    *a4 = 2;
  if (a3)
    *a3 = 0;
  if (a5)
    *a5 = 0;
  result = 0;
  if (a6)
    *a6 = 1;
  return result;
}

void sub_206842824(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void sub_206842830()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t DerivedStorage;
  uint64_t v3;
  NSObject *global_queue;
  _QWORD block[5];

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v0)
  {
    v1 = v0;
    DerivedStorage = CMBaseObjectGetDerivedStorage();
    v3 = CMBaseObjectGetDerivedStorage();
    CMBaseObjectGetDerivedStorage();
    block[0] = 0;
    IOMobileFramebufferGetProtectionOptions();
    if (*(_QWORD *)(v3 + 56))
    {
      *(_QWORD *)(v3 + 56) = 0;
      sub_206845320(DerivedStorage, -469794786);
    }
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_206842904;
    block[3] = &unk_24BFE5F78;
    block[4] = v1;
    dispatch_async(global_queue, block);
  }
}

void sub_206842904(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t AUCWirelessHDCPSessionManagerGetHDCPCapabilityOfDevice(_BYTE *a1)
{
  uint64_t MatchingIOAVObjectOfType;
  const void *v3;

  MatchingIOAVObjectOfType = __IOAVCopyFirstMatchingIOAVObjectOfType();
  if (!MatchingIOAVObjectOfType)
    return 4294893562;
  v3 = (const void *)MatchingIOAVObjectOfType;
  IOAVServiceGetContentProtectionCapabilities();
  *a1 = *MEMORY[0x24BDBD268];
  CFRelease(v3);
  return 0;
}

uint64_t AUCWirelessHDCPSessionManagerGetProtectionBitsOfDisplay(int a1, _QWORD *a2)
{
  uint64_t ProtectionOptions;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  uint64_t v11;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  __int128 v16;
  CFTypeRef cf;
  uint64_t v18;
  _BYTE v19[128];
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  ProtectionOptions = 4294893563;
  cf = 0;
  v18 = 0;
  v5 = (void *)objc_msgSend(MEMORY[0x24BDE5660], "displays");
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  v16 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v14;
    while (2)
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v14 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v13 + 1) + 8 * i);
        if (objc_msgSend(v10, "displayId") == a1)
        {
          if (objc_msgSend(v10, "deviceName"))
          {
            v11 = IOMobileFramebufferOpenByName();
            if ((_DWORD)v11)
            {
              ProtectionOptions = v11;
            }
            else
            {
              ProtectionOptions = IOMobileFramebufferGetProtectionOptions();
              if (!(_DWORD)ProtectionOptions)
                *a2 = v18;
            }
          }
          goto LABEL_14;
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v13, v19, 16);
      if (v7)
        continue;
      break;
    }
  }
LABEL_14:
  if (cf)
    CFRelease(cf);
  return ProtectionOptions;
}

uint64_t sub_206842B14(int a1, _QWORD *a2)
{
  if (a1 != 1)
    return sub_2068501BC(a1, (uint64_t)a2);
  *a2 = &unk_254514B90;
  return 0;
}

uint64_t sub_206842B34(void *a1)
{
  if (a1 == &unk_254514B90)
    return 0;
  else
    return sub_206848100((uint64_t)a1);
}

uint64_t sub_206842B54(void *a1, uint64_t a2, _DWORD *a3)
{
  if (a1 != &unk_254514B90)
    return sub_206846E14((uint64_t)a1, a2, (uint64_t)a3);
  if (a2)
  {
    *(_QWORD *)a2 = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_DWORD *)a2 = 1346585672;
    *(_BYTE *)(a2 + 4) = 1;
    *(_WORD *)(a2 + 14) = 0;
  }
  *a3 = 16;
  return 0;
}

uint64_t sub_206842B98(void *a1, uint64_t a2, int a3, _DWORD *a4)
{
  if (a1 != &unk_254514B90)
    return sub_206850108((uint64_t)a1, a2, a3, (uint64_t)a4);
  *a4 = bswap32(*(_DWORD *)(a2 + 8));
  if (*(_BYTE *)(a2 + 12))
    return -43000 - *(unsigned __int8 *)(a2 + 12);
  else
    return 0;
}

uint64_t sub_206842BD0(uint64_t result, int a2)
{
  BOOL v2;

  if (!(_DWORD)result && a2 == 1)
    return 1;
  if (!(_DWORD)result && a2 == 2)
    return 2;
  if ((_DWORD)result == 1 && a2 == 2 || (result - 1) <= 1 && a2 == 1)
    return 1;
  if ((_DWORD)result == 2 && a2 == 2)
    return 2;
  if (a2)
    v2 = 1;
  else
    v2 = (_DWORD)result == 0;
  if (v2)
    return 0;
  else
    return result;
}

uint64_t sub_206842C38(uint64_t result, int a2)
{
  if ((a2 - 2) < 2)
  {
    if (result <= 1)
      return 1;
    else
      return result;
  }
  else if (a2 == 4 || a2 == 1)
  {
    return 2;
  }
  return result;
}

uint64_t sub_206842C68(uint64_t result, int a2)
{
  if (a2 == 2)
  {
    if ((int)result <= 2)
      return 2;
    else
      return result;
  }
  else if (a2 == 1)
  {
    if ((int)result <= 1)
      return 1;
    else
      return result;
  }
  return result;
}

double sub_206842C94(uint64_t a1)
{
  const void *v2;
  const void *v3;
  double result;

  v2 = *(const void **)(a1 + 24);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 16);
  if (v3)
    CFRelease(v3);
  result = 0.0;
  *(_OWORD *)a1 = 0u;
  *(_OWORD *)(a1 + 16) = 0u;
  return result;
}

void sub_206842CD0(uint64_t a1)
{
  uint64_t v2;
  NSObject *v3;
  _QWORD v4[6];

  if (a1)
  {
    v2 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v2)
    {
      v3 = *(NSObject **)(a1 + 32);
      v4[0] = MEMORY[0x24BDAC760];
      v4[1] = 3221225472;
      v4[2] = sub_206842D44;
      v4[3] = &unk_24BFE5F98;
      v4[4] = a1;
      v4[5] = v2;
      dispatch_async(v3, v4);
    }
  }
}

void sub_206842D44(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  unint64_t v4;
  unint64_t v5;
  uint64_t *v6;
  char v7;
  uint64_t v8;
  unsigned int (*v9)(uint64_t, _QWORD *);
  BOOL v10;
  uint64_t v11;
  unint64_t v12;
  unint64_t v13;
  uint64_t *v14;
  char v15;
  uint64_t v16;
  unsigned int (*v17)(uint64_t, _QWORD *);
  BOOL v18;
  uint64_t UpTimeNanoseconds;
  uint64_t v20;
  uint64_t v21;
  unint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  void (*v25)(uint64_t);
  uint64_t v26;
  unint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  void (*v30)(uint64_t);
  uint64_t v31;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = *(_QWORD *)(v2 + 80);
  if (v3)
  {
    v4 = *(unsigned int *)(v2 + 76);
    if ((_DWORD)v4)
    {
      v5 = 0;
      v6 = (uint64_t *)(v3 + 16);
      v7 = 1;
      do
      {
        v8 = *v6;
        if (*v6)
        {
          LOBYTE(block[0]) = 0;
          v9 = *(unsigned int (**)(uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
          if (v9 && !v9(v8, block))
          {
            if (v7)
              v10 = LOBYTE(block[0]) == 0;
            else
              v10 = 1;
            v7 = !v10;
          }
          v4 = *(unsigned int *)(v2 + 76);
        }
        ++v5;
        v6 += 4;
      }
      while (v5 < v4);
      if (!v7)
        goto LABEL_48;
      v2 = *(_QWORD *)(a1 + 32);
    }
  }
  v11 = *(_QWORD *)(v2 + 96);
  if (!v11)
    goto LABEL_33;
  v12 = *(unsigned int *)(v2 + 88);
  if (!(_DWORD)v12)
    goto LABEL_33;
  v13 = 0;
  v14 = (uint64_t *)(v11 + 16);
  v15 = 1;
  do
  {
    v16 = *v14;
    if (*v14)
    {
      LOBYTE(block[0]) = 0;
      v17 = *(unsigned int (**)(uint64_t, _QWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
      if (v17 && !v17(v16, block))
      {
        if (v15)
          v18 = LOBYTE(block[0]) == 0;
        else
          v18 = 1;
        v15 = !v18;
      }
      v12 = *(unsigned int *)(v2 + 88);
    }
    ++v13;
    v14 += 4;
  }
  while (v13 < v12);
  if (v15)
  {
    v2 = *(_QWORD *)(a1 + 32);
LABEL_33:
    ++*(_DWORD *)(v2 + 48);
    UpTimeNanoseconds = FigGetUpTimeNanoseconds();
    v20 = *(_QWORD *)(a1 + 32);
    *(_QWORD *)(v20 + 40) = UpTimeNanoseconds;
    v21 = *(_QWORD *)(v20 + 80);
    if (v21 && *(_DWORD *)(v20 + 76))
    {
      v22 = 0;
      v23 = (uint64_t *)(v21 + 16);
      do
      {
        v24 = *v23;
        if (*v23)
        {
          v25 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
          if (v25)
            v25(v24);
        }
        ++v22;
        v23 += 4;
      }
      while (v22 < *(unsigned int *)(v20 + 76));
      v20 = *(_QWORD *)(a1 + 32);
    }
    v26 = *(_QWORD *)(v20 + 96);
    if (v26 && *(_DWORD *)(v20 + 88))
    {
      v27 = 0;
      v28 = (uint64_t *)(v26 + 16);
      do
      {
        v29 = *v28;
        if (*v28)
        {
          v30 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
          if (v30)
            v30(v29);
        }
        ++v27;
        v28 += 4;
      }
      while (v27 < *(unsigned int *)(v20 + 88));
    }
  }
LABEL_48:
  v31 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_206844138;
  block[3] = &unk_24BFE5FD8;
  block[4] = v31;
  dispatch_async(global_queue, block);
}

void sub_206842F78(uint64_t a1)
{
  const void *v2;
  const void *v3;
  uint64_t v4;
  unint64_t v5;
  unint64_t v6;
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  void (*v11)(uint64_t, int *);
  uint64_t v12;
  void (*v13)(uint64_t, int *);
  int v14;
  _QWORD v15[5];
  int v16;
  int v17;
  _QWORD block[6];

  if (qword_253E53008 == -1)
  {
    if (!a1)
      return;
  }
  else
  {
    dispatch_once(&qword_253E53008, &unk_24BFE5A10);
    if (!a1)
      return;
  }
  v2 = (const void *)FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = v2;
    if (*(_DWORD *)(a1 + 8) && *(_QWORD *)(a1 + 16))
    {
      CFRetain(v2);
      v4 = MEMORY[0x24BDAC760];
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_2068431C0;
      block[3] = &unk_24BFE5F98;
      block[4] = a1;
      block[5] = v3;
      dispatch_async((dispatch_queue_t)qword_253E53010, block);
      v5 = *(unsigned int *)(a1 + 76);
      if ((_DWORD)v5)
      {
        v6 = 0;
        v7 = 0;
        v8 = 0;
        v9 = 16;
        do
        {
          v10 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + v9);
          if (v10)
          {
            v17 = 0;
            v11 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 64);
            if (v11)
              v11(v10, &v17);
            if ((v17 - 2) < 2)
            {
              if (v8 <= 1)
                v8 = 1;
            }
            else if (v17 == 4 || v17 == 1)
            {
              v8 = 2;
            }
            v16 = 0;
            v12 = *(_QWORD *)(*(_QWORD *)(a1 + 80) + v9);
            v13 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 72);
            if (v13)
              v13(v12, &v16);
            if (v7 <= 1)
              v14 = 1;
            else
              v14 = v7;
            if (v16 != 1)
              v14 = v7;
            if (v16 == 2)
              v7 = 2;
            else
              v7 = v14;
            v5 = *(unsigned int *)(a1 + 76);
          }
          ++v6;
          v9 += 32;
        }
        while (v6 < v5);
      }
      else
      {
        v8 = 0;
        v7 = 0;
      }
      if (v8 != *(_DWORD *)(a1 + 52) || v7 != *(_DWORD *)(a1 + 56))
      {
        *(_DWORD *)(a1 + 52) = v8;
        *(_DWORD *)(a1 + 56) = v7;
        CFRetain(v3);
        v15[0] = v4;
        v15[1] = 3221225472;
        v15[2] = sub_2068431EC;
        v15[3] = &unk_24BFE5FD8;
        v15[4] = v3;
        dispatch_async((dispatch_queue_t)qword_253E53010, v15);
      }
    }
    CFRelease(v3);
  }
}

dispatch_queue_t sub_206843198()
{
  dispatch_queue_t result;

  result = dispatch_queue_create("com.apple.CoreAUC.ConnectionStatusChanged", 0);
  qword_253E53010 = (uint64_t)result;
  return result;
}

void sub_2068431C0(uint64_t a1)
{
  (*(void (**)(_QWORD))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));
  CFRelease(*(CFTypeRef *)(a1 + 40));
}

void sub_2068431EC(uint64_t a1)
{
  CMNotificationCenterGetDefaultLocalCenter();
  CMNotificationCenterPostNotification();
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

void sub_20684322C(_QWORD *a1, uint64_t a2, int a3, uint64_t *a4)
{
  uint64_t v8;
  const void *v9;
  void (*v10)(uint64_t, int *);
  NSObject *v11;
  _QWORD *v12;
  uint64_t v13;
  _QWORD v14[6];
  int v15;
  uint64_t v16;
  _QWORD block[6];
  int v18;
  _QWORD v19[6];
  int v20;
  _QWORD v21[6];
  int v22;
  int v23;

  v23 = 0;
  if (a1)
  {
    v8 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v8)
    {
      v9 = (const void *)v8;
      v10 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
      if (v10)
        v10(a2, &v23);
      if (a3 > 1023)
      {
        if (a3 == 1024)
        {
          if (a1[20])
          {
            CFRetain(v9);
            v11 = a1[4];
            v19[0] = MEMORY[0x24BDAC760];
            v19[1] = 3221225472;
            v19[2] = sub_206843504;
            v19[3] = &unk_24BFE5FF8;
            v20 = v23;
            v19[4] = a1;
            v19[5] = v9;
            v12 = v19;
            goto LABEL_21;
          }
        }
        else
        {
          if (a3 != 2048)
          {
            if (a3 != 4096 || !a1[18])
              goto LABEL_22;
            v13 = *a4;
            CFRetain(v9);
            v11 = a1[4];
            v14[0] = MEMORY[0x24BDAC760];
            v14[1] = 3221225472;
            v14[2] = sub_206843604;
            v14[3] = &unk_24BFE6018;
            v15 = v23;
            v16 = v13;
            v14[4] = a1;
            v14[5] = v9;
            v12 = v14;
            goto LABEL_21;
          }
          if (a1[19])
          {
            CFRetain(v9);
            v11 = a1[4];
            block[0] = MEMORY[0x24BDAC760];
            block[1] = 3221225472;
            block[2] = sub_206843584;
            block[3] = &unk_24BFE5FF8;
            v18 = v23;
            block[4] = a1;
            block[5] = v9;
            v12 = block;
            goto LABEL_21;
          }
        }
      }
      else
      {
        switch(a3)
        {
          case 1:
            sub_206842CD0((uint64_t)a1);
            break;
          case 2:
            sub_206842F78((uint64_t)a1);
            break;
          case 4:
            CFRetain(v9);
            v11 = a1[4];
            v21[0] = MEMORY[0x24BDAC760];
            v21[1] = 3221225472;
            v21[2] = sub_20684344C;
            v21[3] = &unk_24BFE5FF8;
            v22 = v23;
            v21[4] = a1;
            v21[5] = v9;
            v12 = v21;
LABEL_21:
            dispatch_async(v11, v12);
            break;
        }
      }
LABEL_22:
      CFRelease(v9);
    }
  }
}

void sub_20684344C(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  void (*v5)(_QWORD, _QWORD);
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 80;
  if ((*(_DWORD *)(a1 + 48) & 0xFF00) == 0x100)
    v3 = 96;
  v4 = *(_QWORD *)(v2 + v3);
  if (v4)
  {
    sub_206842C94(v4 + (((unint64_t)*(unsigned int *)(a1 + 48) >> 11) & 0x1FFFE0));
    v2 = *(_QWORD *)(a1 + 32);
  }
  v5 = *(void (**)(_QWORD, _QWORD))(v2 + 128);
  if (v5)
    v5(*(_QWORD *)(v2 + 112), *(unsigned int *)(a1 + 48));
  v6 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_206844138;
  block[3] = &unk_24BFE5FD8;
  block[4] = v6;
  dispatch_async(global_queue, block);
}

void sub_206843504(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 160))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_206844138;
  block[3] = &unk_24BFE5FD8;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_206843584(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 152))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_206844138;
  block[3] = &unk_24BFE5FD8;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_206843604(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 144))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 112), *(unsigned int *)(a1 + 48), *(unsigned int *)(a1 + 52), *(unsigned int *)(a1 + 56));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = sub_206844138;
  block[3] = &unk_24BFE5FD8;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

void sub_206843688(uint64_t a1, int a2)
{
  uint64_t v3;
  NSObject *v4;
  NSObject *v5;
  uint64_t v6;
  _QWORD v7[5];
  _QWORD block[5];

  if (a1)
  {
    if (a2 == 1)
    {
      v3 = MEMORY[0x24BDAC760];
      v4 = *(NSObject **)(a1 + 32);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 3221225472;
      block[2] = sub_206843750;
      block[3] = &unk_24BFE5FD8;
      block[4] = a1;
      dispatch_sync(v4, block);
      v5 = *(NSObject **)(a1 + 32);
      v7[0] = v3;
      v7[1] = 3221225472;
      v7[2] = sub_2068437E0;
      v7[3] = &unk_24BFE5FD8;
      v7[4] = a1;
      dispatch_sync(v5, v7);
    }
    else
    {
      v6 = a1 + 72;
      sub_20684375C(a1 + 72);
      sub_2068437EC(v6);
    }
  }
}

void sub_206843750(uint64_t a1)
{
  sub_20684375C(*(_QWORD *)(a1 + 32) + 72);
}

void sub_20684375C(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  __int128 v6;
  _OWORD v7[2];

  if (a1)
  {
    v2 = *(void **)(a1 + 8);
    if (v2)
    {
      v3 = *(unsigned int *)(a1 + 4);
      if ((_DWORD)v3)
      {
        v4 = 0;
        v5 = *(_OWORD **)(a1 + 8);
        do
        {
          v6 = v5[1];
          v7[0] = *v5;
          v7[1] = v6;
          if ((_QWORD)v6)
          {
            sub_206842C94((uint64_t)v7);
            v3 = *(unsigned int *)(a1 + 4);
          }
          ++v4;
          v5 += 2;
        }
        while (v4 < v3);
        free(v2);
        *(_QWORD *)(a1 + 8) = 0;
        *(_DWORD *)(a1 + 4) = 0;
      }
    }
  }
}

void sub_2068437E0(uint64_t a1)
{
  sub_2068437EC(*(_QWORD *)(a1 + 32) + 72);
}

void sub_2068437EC(uint64_t a1)
{
  void *v2;
  unint64_t v3;
  unint64_t v4;
  _OWORD *v5;
  __int128 v6;
  _OWORD v7[2];

  if (a1)
  {
    v2 = *(void **)(a1 + 24);
    if (v2)
    {
      v3 = *(unsigned int *)(a1 + 16);
      if ((_DWORD)v3)
      {
        v4 = 0;
        v5 = *(_OWORD **)(a1 + 24);
        do
        {
          v6 = v5[1];
          v7[0] = *v5;
          v7[1] = v6;
          if ((_QWORD)v6)
          {
            sub_206842C94((uint64_t)v7);
            v3 = *(unsigned int *)(a1 + 16);
          }
          ++v4;
          v5 += 2;
        }
        while (v4 < v3);
        free(v2);
        *(_QWORD *)(a1 + 24) = 0;
        *(_DWORD *)(a1 + 16) = 0;
      }
    }
  }
}

void sub_206843870(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  const void *v4;

  sub_206843688(a1, 0);
  v2 = *(NSObject **)(a1 + 32);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v3 = *(NSObject **)(a1 + 64);
  if (v3)
  {
    dispatch_release(v3);
    *(_QWORD *)(a1 + 64) = 0;
  }
  if (*(_QWORD *)a1)
  {
    CFRelease(*(CFTypeRef *)a1);
    *(_QWORD *)a1 = 0;
  }
  v4 = *(const void **)(a1 + 168);
  if (v4)
  {
    CFRelease(v4);
    *(_QWORD *)(a1 + 168) = 0;
  }
}

uint64_t sub_2068438D4(uint64_t a1, uint64_t a2, _DWORD *a3, _DWORD *a4, _BYTE *a5, _DWORD *a6)
{
  uint64_t v6;
  NSObject *v11;
  _QWORD v13[10];
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  int v17;
  uint64_t v18;
  uint64_t *v19;
  uint64_t v20;
  int v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  char v25;
  uint64_t v26;
  uint64_t *v27;
  uint64_t v28;
  int v29;

  v26 = 0;
  v27 = &v26;
  v28 = 0x2020000000;
  v29 = 0;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2020000000;
  v25 = 0;
  v18 = 0;
  v19 = &v18;
  v20 = 0x2020000000;
  v21 = 0;
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v6 = 4294954786;
  v17 = 0;
  if (a5)
  {
    if (a1)
    {
      if (a3)
      {
        if (a4)
        {
          v11 = *(NSObject **)(a1 + 32);
          v13[0] = MEMORY[0x24BDAC760];
          v13[1] = 3221225472;
          v13[2] = sub_206843A34;
          v13[3] = &unk_24BFE6040;
          v13[8] = a2;
          v13[9] = a1;
          v13[4] = &v26;
          v13[5] = &v18;
          v13[6] = &v22;
          v13[7] = &v14;
          dispatch_sync(v11, v13);
          *a3 = *((_DWORD *)v27 + 6);
          *a4 = *((_DWORD *)v19 + 6);
          *a5 = *((_BYTE *)v23 + 24);
          v6 = 0;
          if (a6)
            *a6 = *((_DWORD *)v15 + 6);
        }
      }
    }
  }
  _Block_object_dispose(&v14, 8);
  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v22, 8);
  _Block_object_dispose(&v26, 8);
  return v6;
}

uint64_t sub_206843A34(_QWORD *a1)
{
  uint64_t result;
  const __CFArray *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  CFIndex v8;
  uint64_t v9;
  int v10;
  char v11;
  const void *ValueAtIndex;
  uint64_t v13;
  uint64_t v14;
  unint64_t v15;
  uint64_t v16;
  const void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t, char *, char *);
  uint64_t v21;
  void (*v22)(uint64_t, uint64_t *);
  int v23;
  BOOL v24;
  int v25;
  uint64_t v26;
  uint64_t v27;
  unint64_t v28;
  unint64_t v29;
  int v30;
  uint64_t v31;
  uint64_t v32;
  char v33;
  uint64_t v34;
  uint64_t v35;
  void (*v36)(uint64_t, char *, char *);
  void (*v37)(uint64_t, uint64_t *);
  int v38;
  BOOL v39;
  int v40;
  uint64_t v41;
  uint64_t v42;
  _QWORD *v43;
  char v44;
  unsigned int v45;
  char v46;
  uint64_t v47;

  result = a1[8];
  v43 = a1;
  if (result && (result = CFArrayGetCount((CFArrayRef)result)) != 0)
  {
    v3 = (const __CFArray *)a1[8];
    if (v3
      && (v4 = a1[9],
          v5 = *(_QWORD *)(a1[5] + 8),
          v6 = *(_QWORD *)(a1[6] + 8),
          (result = CFArrayGetCount((CFArrayRef)a1[8])) != 0))
    {
      v7 = result;
      if (result < 1)
      {
        v25 = 0;
        v10 = 4;
        v11 = 1;
      }
      else
      {
        v41 = v5;
        v42 = v6;
        v8 = 0;
        v9 = 0;
        v10 = 4;
        v11 = 1;
        do
        {
          v44 = v11;
          v47 = 0;
          v46 = 0;
          ValueAtIndex = CFArrayGetValueAtIndex(v3, v8);
          CFRetain(ValueAtIndex);
          if (ValueAtIndex)
          {
            v45 = v9;
            v13 = v7;
            if (*(_DWORD *)(v4 + 76))
            {
              v14 = 0;
              v15 = 0;
              do
              {
                v16 = *(_QWORD *)(v4 + 80);
                v17 = *(const void **)(v16 + v14 + 24);
                if (v17 && CFEqual(v17, ValueAtIndex))
                {
                  HIDWORD(v47) = 0;
                  v18 = v16 + v14;
                  v19 = *(_QWORD *)(v16 + v14 + 16);
                  v20 = *(void (**)(uint64_t, char *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
                  if (v20)
                    v20(v19, (char *)&v47 + 4, &v46);
                  LODWORD(v47) = 0;
                  v21 = *(_QWORD *)(v18 + 16);
                  v22 = *(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
                  if (v22)
                    v22(v21, &v47);
                }
                ++v15;
                v14 += 32;
              }
              while (v15 < *(unsigned int *)(v4 + 76));
            }
            CFRelease(ValueAtIndex);
            v7 = v13;
            v9 = v45;
          }
          v23 = 2;
          if (v10 == 2
            || HIDWORD(v47) == 2
            || (v23 = 3, v10 == 3)
            || HIDWORD(v47) == 3
            || (v23 = 0, !v10)
            || !HIDWORD(v47)
            || (v23 = 1, v10 == 1)
            || HIDWORD(v47) == 1)
          {
            result = sub_206842BD0(v9, v47);
            v9 = result;
            v11 = 1;
            v10 = v23;
          }
          else
          {
            result = sub_206842BD0(v9, v47);
            v9 = result;
            if (v44)
              v24 = v46 == 0;
            else
              v24 = 1;
            v11 = !v24;
            v10 = 4;
          }
          ++v8;
        }
        while (v8 != v7);
        if (v10 == 4)
          v25 = v9;
        else
          v25 = 0;
        if (v10 == 1)
          v25 = v9;
        v5 = v41;
        v6 = v42;
      }
      *(_DWORD *)(v5 + 24) = v25;
      *(_BYTE *)(v6 + 24) = v11;
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    v26 = a1[9];
    v27 = *(_QWORD *)(a1[6] + 8);
    v28 = *(unsigned int *)(v26 + 76);
    if (!(_DWORD)v28)
      goto LABEL_73;
    v29 = 0;
    v30 = 0;
    v31 = 0;
    v32 = *(_QWORD *)(a1[5] + 8);
    v10 = 4;
    v33 = 1;
    v34 = 16;
    do
    {
      v35 = *(_QWORD *)(*(_QWORD *)(v26 + 80) + v34);
      if (v35)
      {
        v46 = 0;
        HIDWORD(v47) = 0;
        v36 = *(void (**)(uint64_t, char *, char *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
        if (v36)
          v36(v35, (char *)&v47 + 4, &v46);
        LODWORD(v47) = 0;
        v37 = *(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 56);
        if (v37)
          v37(v35, &v47);
        v38 = 2;
        if (v10 == 2
          || HIDWORD(v47) == 2
          || (v38 = 3, v10 == 3)
          || HIDWORD(v47) == 3
          || (v38 = 0, !v10)
          || !HIDWORD(v47)
          || (v38 = 1, v10 == 1)
          || HIDWORD(v47) == 1)
        {
          result = sub_206842BD0(v31, v47);
          v31 = result;
          v33 = 1;
        }
        else
        {
          result = sub_206842BD0(v31, v47);
          v31 = result;
          if (v33)
            v39 = v46 == 0;
          else
            v39 = 1;
          v33 = !v39;
          v38 = 4;
        }
        ++v30;
        v28 = *(unsigned int *)(v26 + 76);
        v10 = v38;
      }
      ++v29;
      v34 += 32;
    }
    while (v29 < v28);
    if (v30)
    {
      if (v10 == 4)
        v40 = v31;
      else
        v40 = 0;
      if (v10 == 1)
        v40 = v31;
      *(_DWORD *)(v32 + 24) = v40;
    }
    else
    {
LABEL_73:
      v10 = 0;
      v33 = 1;
    }
    *(_BYTE *)(v27 + 24) = v33;
  }
  *(_DWORD *)(*(_QWORD *)(v43[4] + 8) + 24) = v10;
  *(_DWORD *)(*(_QWORD *)(v43[7] + 8) + 24) = *(_DWORD *)(v43[9] + 48);
  return result;
}

uint64_t sub_206843DF8(uint64_t a1, uint64_t a2, uint64_t a3)
{
  NSObject *v3;
  _QWORD block[7];

  if (a2 | a3)
  {
    v3 = *(NSObject **)(a1 + 32);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = sub_206843E60;
    block[3] = &unk_24BFE6060;
    block[4] = a2;
    block[5] = a1;
    block[6] = a3;
    dispatch_sync(v3, block);
  }
  return 0;
}

_QWORD *sub_206843E60(_QWORD *result)
{
  _DWORD *v1;
  _DWORD *v2;

  v1 = (_DWORD *)result[4];
  if (v1)
    *v1 = *(_DWORD *)(result[5] + 52);
  v2 = (_DWORD *)result[6];
  if (v2)
    *v2 = *(_DWORD *)(result[5] + 56);
  return result;
}

uint64_t sub_206843E8C(uint64_t a1)
{
  if (a1)
    ++*(_DWORD *)(a1 + 8);
  return 0;
}

uint64_t sub_206843EA4(uint64_t a1)
{
  int v1;

  if (a1)
  {
    v1 = *(_DWORD *)(a1 + 8);
    if (v1)
      *(_DWORD *)(a1 + 8) = v1 - 1;
  }
  return 0;
}

__CFString *sub_206843EC0(uint64_t a1)
{
  __CFString *Mutable;
  __CFString *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  unint64_t v7;
  const void *v8;

  Mutable = CFStringCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 0);
  v3 = Mutable;
  if (*(_DWORD *)(a1 + 4))
  {
    v4 = 0;
    v5 = 16;
    do
    {
      v6 = FigBaseObjectCopyDebugDescription();
      v7 = v4 + 1;
      if (v6)
      {
        v8 = (const void *)v6;
        if (v7 >= *(unsigned int *)(a1 + 4))
          CFStringAppendFormat(v3, 0, CFSTR("\tUpstreamConnection[%d]: %@"), v4, v6);
        else
          CFStringAppendFormat(v3, 0, CFSTR("\tUpstreamConnection[%d]: %@\n"), v4, v6);
        CFRelease(v8);
      }
      v5 += 32;
      ++v4;
    }
    while (v7 < *(unsigned int *)(a1 + 4));
  }
  else
  {
    CFStringAppendFormat(Mutable, 0, CFSTR("\tno upstream connections"));
  }
  return v3;
}

uint64_t sub_206843FA0(uint64_t a1, uint64_t a2, uint64_t a3, const __CFDictionary *a4, int a5)
{
  const void *Value;
  const __CFDictionary *v11;
  const __CFDictionary *v12;
  CFTypeID v13;
  dispatch_queue_t v14;
  dispatch_queue_t v15;

  *(_QWORD *)a1 = FigCFWeakReferenceHolderCreateWithReferencedObject();
  *(_DWORD *)(a1 + 72) = a5;
  *(_QWORD *)(a1 + 16) = a2;
  *(_QWORD *)(a1 + 24) = a3;
  *(_DWORD *)(a1 + 8) = 1;
  if (a4)
  {
    Value = CFDictionaryGetValue(a4, CFSTR("StartOnCreation"));
    v11 = (const __CFDictionary *)CFDictionaryGetValue(a4, CFSTR("DelegateHooks"));
    v12 = v11;
    if (Value == (const void *)*MEMORY[0x24BDBD268])
      *(_DWORD *)(a1 + 8) = 0;
    if (v11)
    {
      v13 = CFGetTypeID(v11);
      if (v13 == CFDictionaryGetTypeID())
      {
        *(_QWORD *)(a1 + 112) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_Refcon"));
        *(_QWORD *)(a1 + 120) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_DidInitialize"));
        *(_QWORD *)(a1 + 128) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_WillUninitialize"));
        *(_QWORD *)(a1 + 136) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_StatusDidChange"));
        *(_QWORD *)(a1 + 144) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_DidReceiveMessage"));
        *(_QWORD *)(a1 + 152) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_WillPowerDown"));
        *(_QWORD *)(a1 + 160) = CFDictionaryGetValue(v12, CFSTR("DelegateHooks_DidPowerUp"));
      }
    }
  }
  *(_QWORD *)(a1 + 48) = 1;
  *(_DWORD *)(a1 + 56) = 0;
  v14 = dispatch_queue_create("com.apple.CoreAUC.monitorQueue", 0);
  *(_QWORD *)(a1 + 32) = v14;
  if (!v14)
    return 4294954785;
  v15 = dispatch_queue_create("com.apple.CoreAUC.upstreamConnectionQueue", 0);
  *(_QWORD *)(a1 + 64) = v15;
  if (v15)
    return 0;
  else
    return 4294954785;
}

void sub_206844138(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t sub_206844148(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, _QWORD *a8)
{
  uint64_t v9;
  uint64_t v11;

  if (a8)
  {
    sub_206845630();
    v9 = CMDerivedObjectCreate();
    if ((_DWORD)v9)
      v11 = v9;
    else
      v11 = 4294955072;
  }
  else
  {
    v11 = 4294955076;
  }
  *a8 = 0;
  return v11;
}

void sub_20684429C()
{
  uint64_t DerivedStorage;
  uint64_t v1;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = CMBaseObjectGetDerivedStorage();
  sub_206845EEC(v1, DerivedStorage + 96);
}

void sub_2068442D0(uint64_t a1, int a2)
{
  uint64_t v4;
  uint64_t DerivedStorage;
  uint64_t v6;
  NSObject *global_queue;
  _QWORD block[5];

  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v6 = CMBaseObjectGetDerivedStorage();
  if (v4)
  {
    sub_206845688(a1, a2, v6, DerivedStorage + 96);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_206844548;
    block[3] = &unk_24BFE6080;
    block[4] = v4;
    dispatch_async(global_queue, block);
  }
}

void sub_206844378(uint64_t a1)
{
  uint64_t DerivedStorage;
  uint64_t v3;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v3 = CMBaseObjectGetDerivedStorage();
  sub_206846984(v3, DerivedStorage + 96, a1, (uint64_t)sub_20684429C);
}

CFStringRef sub_2068443B4(const void *a1)
{
  const __CFAllocator *v2;
  CFIndex v3;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("[UpstreamConnection(Framebuffer) %p retain count %d]"), a1, v3);
}

uint64_t sub_206844400()
{
  uint64_t DerivedStorage;
  uint64_t v1;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = CMBaseObjectGetDerivedStorage();
  return sub_206845FEC(v1, DerivedStorage + 96);
}

uint64_t sub_206844430(uint64_t a1, _DWORD *a2)
{
  _DWORD *DerivedStorage;

  DerivedStorage = (_DWORD *)CMBaseObjectGetDerivedStorage();
  return sub_206846108(DerivedStorage, a2);
}

uint64_t sub_206844454(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846134(DerivedStorage, a2);
}

uint64_t sub_206844478(uint64_t a1, _BYTE *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846188(DerivedStorage, a2);
}

uint64_t sub_20684449C()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_20684621C(DerivedStorage);
}

uint64_t sub_2068444B0(uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_20684622C(DerivedStorage, a2, a3);
}

uint64_t sub_2068444DC(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846300(DerivedStorage, a2);
}

uint64_t sub_206844500(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_2068463B4(DerivedStorage, a2);
}

uint64_t sub_206844524(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846468(DerivedStorage, a2);
}

void sub_206844548(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t sub_206844558(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  uint64_t v6;
  uint64_t v7;

  v6 = 4294951836;
  if (a2 && a1 && a6)
  {
    sub_2068452C8();
    v7 = CMDerivedObjectCreate();
    if ((_DWORD)v7)
      return v7;
    else
      return 4294951835;
  }
  return v6;
}

void sub_2068446EC(__CFRunLoopSource *a1, int a2)
{
  const __CFString *v4;

  if (qword_253E53018 != -1)
    dispatch_once(&qword_253E53018, &unk_24BFE5A30);
  FigEventWaitRelative();
  v4 = (const __CFString *)*MEMORY[0x24BDBD5A0];
  if (a2)
  {
    CFRunLoopAddSource((CFRunLoopRef)qword_253E53020, a1, v4);
    FigEventSet();
  }
  else
  {
    CFRunLoopRemoveSource((CFRunLoopRef)qword_253E53020, a1, v4);
  }
}

void sub_206844778()
{
  uint64_t v0;
  uint64_t DerivedStorage;
  NSObject *v2;
  _QWORD v3[6];

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v0)
  {
    v2 = *(NSObject **)(DerivedStorage + 16);
    v3[0] = MEMORY[0x24BDAC760];
    v3[1] = 0x40000000;
    v3[2] = sub_206844BE0;
    v3[3] = &unk_24BFE6140;
    v3[4] = DerivedStorage;
    v3[5] = v0;
    dispatch_async(v2, v3);
  }
}

void sub_2068447EC(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void sub_2068447F8()
{
  uint64_t DerivedStorage;
  uint64_t v1;
  NSObject *v2;
  __CFRunLoopSource *HDCPRunLoopSource;
  uint64_t HotPlugRunLoopSource;
  __CFRunLoopSource *v5;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  v1 = CMBaseObjectGetDerivedStorage();
  v2 = *(NSObject **)(DerivedStorage + 56);
  if (v2)
  {
    dispatch_release(v2);
    *(_QWORD *)(DerivedStorage + 56) = 0;
  }
  if (*(_QWORD *)(DerivedStorage + 48))
  {
    HDCPRunLoopSource = (__CFRunLoopSource *)IOMobileFramebufferGetHDCPRunLoopSource();
    sub_2068446EC(HDCPRunLoopSource, 0);
    HotPlugRunLoopSource = IOMobileFramebufferGetHotPlugRunLoopSource();
    if (HotPlugRunLoopSource)
    {
      v5 = (__CFRunLoopSource *)HotPlugRunLoopSource;
      IOMobileFramebufferDisableHotPlugDetectNotifications();
      sub_2068446EC(v5, 0);
    }
    CFRelease(*(CFTypeRef *)(DerivedStorage + 48));
  }
  sub_206845474(v1);
}

CFStringRef sub_206844884(const void *a1)
{
  return sub_206845418(a1, (uint64_t)CFSTR("Framebuffer"));
}

uint64_t sub_206844890()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (!DerivedStorage)
    return 4294951836;
  dispatch_retain(*(dispatch_object_t *)(DerivedStorage + 56));
  return IOMobileFramebufferHDCPSendRequest();
}

uint64_t sub_2068448F4(uint64_t a1, uint64_t a2, _QWORD *a3)
{
  uint64_t result;

  CMBaseObjectGetDerivedStorage();
  if (!a1 || *a3 < 0x10uLL)
    return 4294951836;
  result = IOMobileFramebufferHDCPGetReply();
  if ((_DWORD)result)
  {
    result = 0;
    *(_QWORD *)(a2 + 8) = 0;
    *(_QWORD *)a2 = 0x1000150434448;
    *(_DWORD *)(a2 + 8) = 0;
    *(_BYTE *)(a2 + 12) = 12;
    *(_WORD *)(a2 + 14) = 0;
    *a3 = 16;
  }
  return result;
}

uint64_t sub_20684497C(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_2068454E0(DerivedStorage, a2);
}

uint64_t sub_2068449A0(uint64_t a1, int *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206845504(DerivedStorage, a2);
}

void sub_2068449C4(uint64_t a1, dispatch_queue_t queue, char a3)
{
  _QWORD v4[5];
  char v5;

  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 0x40000000;
  v4[2] = sub_206844A2C;
  v4[3] = &unk_24BFE60A0;
  v4[4] = a1;
  v5 = a3;
  dispatch_sync(queue, v4);
  dispatch_release(queue);
}

void sub_206844A2C(uint64_t a1)
{
  int v1;
  uint64_t v2;
  uint64_t DerivedStorage;
  NSObject *global_queue;
  _QWORD block[5];

  v1 = *(unsigned __int8 *)(a1 + 40);
  dispatch_get_specific("UserClientInstance");
  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v2)
  {
    if (v1)
      sub_206845320(DerivedStorage, -469794786);
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_206844AC0;
    block[3] = &unk_24BFE60C0;
    block[4] = v2;
    dispatch_async(global_queue, block);
  }
}

void sub_206844AC0(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

void sub_206844AD0()
{
  __CFDictionary *Mutable;

  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x24BDBD240], 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFDictionarySetValue(Mutable, CFSTR("com.apple.fig.ThreadCreateKey_AdoptVoucher"), (const void *)*MEMORY[0x24BDBD268]);
  qword_253E53028 = FigEventCreate();
  qword_253E53030 = FigEventCreate();
  FigThreadCreate();
  if (Mutable)
    CFRelease(Mutable);
}

uint64_t sub_206844B88(uint64_t a1)
{
  (*(void (**)(void))(a1 + 16))();
  return 0;
}

void sub_206844BA4()
{
  qword_253E53020 = (uint64_t)CFRunLoopGetCurrent();
  FigEventSet();
  while (1)
  {
    FigEventWaitRelative();
    CFRunLoopRun();
  }
}

void sub_206844BE0(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, uint64_t, _QWORD))(*(_QWORD *)(a1 + 32) + 32))(*(_QWORD *)(a1 + 40), 3825172514, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206844AC0;
  block[3] = &unk_24BFE60C0;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

uint64_t sub_206844C60()
{
  MEMORY[0x20BCFE80C](&unk_253E52FD0, sub_206844C8C);
  return qword_253E53038;
}

uint64_t sub_206844C8C()
{
  CMBaseGetClassID();
  return FigBaseClassRegisterClass();
}

uint64_t AIp6m6e0e4SJ5Ql(uint64_t a1)
{
  uint64_t result;
  uint64_t (*v3)(uint64_t);

  result = CMBaseObjectGetVTable();
  v3 = *(uint64_t (**)(uint64_t))(*(_QWORD *)(result + 16) + 16);
  if (v3)
    return v3(a1);
  return result;
}

uint64_t vRThfplNqwR36hfR(uint64_t a1, _DWORD *a2)
{
  void (*v4)(uint64_t, char *, uint64_t *);
  uint64_t v6;

  v6 = 0;
  v4 = *(void (**)(uint64_t, char *, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 32);
  if (v4)
    v4(a1, (char *)&v6 + 4, &v6);
  if (a2)
    *a2 = v6;
  return HIDWORD(v6);
}

void tQN5x9ksL4jeZ(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

uint64_t tpz1bPiDnP0U7Zm(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t (*v8)(uint64_t, uint64_t, uint64_t, int *, char *, uint64_t);
  int v10;
  char v11;

  v10 = 0;
  v11 = 0;
  v8 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, int *, char *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                               + 16)
                                                                                   + 24);
  if (v8)
    return v8(a1, a2, a3, &v10, &v11, a4);
  else
    return 4294954514;
}

uint64_t MbgwT9G43SsdaVw(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  uint64_t (*v10)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t);
  char v12;

  v12 = 0;
  v10 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t, uint64_t, char *, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                                  + 16)
                                                                                      + 24);
  if (v10)
    return v10(a1, a2, a3, a4, &v12, a5);
  else
    return 4294954514;
}

uint64_t PsZXJ2EK7ifxrtgc()
{
  return 1;
}

uint64_t UeKhmE9GuHm0LgF(uint64_t a1)
{
  int v2;

  v2 = 0;
  return vRThfplNqwR36hfR(a1, &v2);
}

CFStringRef sub_206844E7C(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("[AUCHDCPMonitor %p]"), a1);
}

uint64_t sub_206844EB8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, _QWORD *a9)
{
  uint64_t v9;
  uint64_t v11;

  if (a9)
  {
    sub_206845630();
    v9 = CMDerivedObjectCreate();
    if ((_DWORD)v9)
      v11 = v9;
    else
      v11 = 4294955072;
  }
  else
  {
    v11 = 4294955076;
  }
  *a9 = 0;
  return v11;
}

void sub_206845048()
{
  uint64_t v0;
  uint64_t DerivedStorage;
  uint64_t v2;
  uint64_t v3;
  unsigned int (*v4)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t);
  NSObject *global_queue;
  uint64_t v6;
  int v7;
  _QWORD block[5];

  v0 = FigCFWeakReferenceHolderCopyReferencedObject();
  DerivedStorage = CMBaseObjectGetDerivedStorage();
  if (v0)
  {
    v2 = DerivedStorage;
    v3 = *(_QWORD *)(DerivedStorage + 24);
    v4 = *(unsigned int (**)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16)
                                                                                             + 64);
    if (v4)
    {
      if (!v4(v3, v2 + 48, v2 + 52, v2 + 56, v2 + 60, v2 + 65))
      {
        v7 = 0;
        v6 = *(_QWORD *)(v2 + 48);
        LOBYTE(v7) = *(_BYTE *)(v2 + 65);
        (*(void (**)(uint64_t, uint64_t, uint64_t *, _QWORD))(v2 + 72))(v0, 2, &v6, *(_QWORD *)(v2 + 80));
      }
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_2068452B8;
  block[3] = &unk_24BFE61B0;
  block[4] = v0;
  dispatch_async(global_queue, block);
}

void sub_20684512C()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  sub_206846984(DerivedStorage, 0, 0, 0);
}

CFStringRef sub_20684514C(const void *a1)
{
  const __CFAllocator *v2;
  CFIndex v3;

  v2 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v3 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(v2, 0, CFSTR("[UpstreamConnection(GPO) %p retain count %d]"), a1, v3);
}

uint64_t sub_206845198()
{
  return 0;
}

uint64_t sub_2068451A0(uint64_t a1, _DWORD *a2)
{
  _DWORD *DerivedStorage;

  DerivedStorage = (_DWORD *)CMBaseObjectGetDerivedStorage();
  return sub_206846108(DerivedStorage, a2);
}

uint64_t sub_2068451C4(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846134(DerivedStorage, a2);
}

uint64_t sub_2068451E8(uint64_t a1, _BYTE *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846188(DerivedStorage, a2);
}

uint64_t sub_20684520C()
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_20684621C(DerivedStorage);
}

uint64_t sub_206845220(uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_20684622C(DerivedStorage, a2, a3);
}

uint64_t sub_20684524C(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846300(DerivedStorage, a2);
}

uint64_t sub_206845270(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_2068463B4(DerivedStorage, a2);
}

uint64_t sub_206845294(uint64_t a1, _DWORD *a2)
{
  uint64_t DerivedStorage;

  DerivedStorage = CMBaseObjectGetDerivedStorage();
  return sub_206846468(DerivedStorage, a2);
}

void sub_2068452B8(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t sub_2068452C8()
{
  MEMORY[0x20BCFE80C](&unk_253E52FF0, sub_2068452F4);
  return qword_253E53048;
}

uint64_t sub_2068452F4()
{
  CMBaseGetClassID();
  return FigBaseClassRegisterClass();
}

void sub_206845320(uint64_t a1, int a2)
{
  uint64_t v4;
  NSObject *v5;
  NSObject *v6;
  _QWORD block[6];
  int v8;

  if (a1)
  {
    v4 = FigCFWeakReferenceHolderCopyReferencedObject();
    if (v4)
    {
      v5 = *(NSObject **)(a1 + 16);
      v6 = *(NSObject **)(a1 + 24);
      block[0] = MEMORY[0x24BDAC760];
      block[1] = 0x40000000;
      block[2] = sub_20684539C;
      block[3] = &unk_24BFE61D0;
      block[4] = a1;
      block[5] = v4;
      v8 = a2;
      dispatch_group_async(v6, v5, block);
    }
  }
}

void sub_20684539C(uint64_t a1)
{
  uint64_t v2;
  NSObject *global_queue;
  _QWORD block[5];

  (*(void (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 32) + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 48), *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40));
  v2 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206845620;
  block[3] = &unk_24BFE61F0;
  block[4] = v2;
  dispatch_async(global_queue, block);
}

CFStringRef sub_206845418(const void *a1, uint64_t a2)
{
  const __CFAllocator *v4;
  CFIndex v5;

  v4 = (const __CFAllocator *)*MEMORY[0x24BDBD240];
  v5 = CFGetRetainCount(a1);
  return CFStringCreateWithFormat(v4, 0, CFSTR("[UserClient(%@) %p retain count %d]"), a2, a1, v5);
}

void sub_206845474(uint64_t a1)
{
  NSObject *v2;
  NSObject *v3;
  NSObject *v4;
  const void *v5;

  v2 = *(NSObject **)(a1 + 24);
  if (v2)
  {
    dispatch_group_wait(v2, 0xFFFFFFFFFFFFFFFFLL);
    v3 = *(NSObject **)(a1 + 24);
    if (v3)
    {
      dispatch_release(v3);
      *(_QWORD *)(a1 + 24) = 0;
    }
  }
  v4 = *(NSObject **)(a1 + 16);
  if (v4)
  {
    dispatch_release(v4);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v5 = *(const void **)(a1 + 40);
  if (v5)
  {
    CFRelease(v5);
    *(_QWORD *)(a1 + 40) = 0;
  }
  if (*(_QWORD *)a1)
  {
    CFRelease(*(CFTypeRef *)a1);
    *(_QWORD *)a1 = 0;
  }
}

uint64_t sub_2068454E0(uint64_t a1, _DWORD *a2)
{
  int v2;

  if (!a1)
  {
    v2 = 0;
    if (!a2)
      return 0;
    goto LABEL_3;
  }
  v2 = *(_DWORD *)(a1 + 12);
  if (a2)
LABEL_3:
    *a2 = v2;
  return 0;
}

uint64_t sub_206845504(uint64_t a1, int *a2)
{
  int v2;
  int v3;

  if (a1)
  {
    v2 = *(_DWORD *)(a1 + 12) - 3;
    if (v2 <= 5)
    {
      v3 = dword_206850850[v2];
      if (!a2)
        return 0;
      goto LABEL_6;
    }
  }
  v3 = 1;
  if (a2)
LABEL_6:
    *a2 = v3;
  return 0;
}

uint64_t sub_206845540(uint64_t a1, NSObject *a2, uint64_t a3, const void *a4, int a5, uint64_t a6)
{
  uint64_t result;
  dispatch_group_t v12;
  CFTypeRef v13;

  if (!a1)
    return 4294951835;
  result = 4294951836;
  if (a2 && a3 && a4 && a6)
  {
    *(_QWORD *)a1 = FigCFWeakReferenceHolderCreateWithReferencedObject();
    *(_DWORD *)(a1 + 8) = a5;
    *(_QWORD *)(a1 + 16) = a2;
    dispatch_retain(a2);
    v12 = dispatch_group_create();
    *(_QWORD *)(a1 + 24) = v12;
    if (v12)
    {
      *(_QWORD *)(a1 + 32) = a3;
      v13 = CFRetain(a4);
      result = 0;
      *(_QWORD *)(a1 + 40) = v13;
    }
    else
    {
      return 4294951835;
    }
  }
  return result;
}

CFStringRef sub_2068455E4(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("[AUCHDCPMonitor %p]"), a1);
}

void sub_206845620(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t sub_206845630()
{
  MEMORY[0x20BCFE80C](&unk_253E52FE0, sub_20684565C);
  return qword_253E53040;
}

uint64_t sub_20684565C()
{
  CMBaseGetClassID();
  return FigBaseClassRegisterClass();
}

void sub_206845688(uint64_t a1, int a2, uint64_t a3, uint64_t a4)
{
  unint64_t v4;
  uint64_t v8;
  NSObject *v9;
  dispatch_time_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  unsigned int (*v14)(uint64_t, uint64_t, unint64_t *);
  int v15;
  int v16;
  int v17;
  int v18;
  uint64_t v19;
  void (*v20)(uint64_t, uint64_t *);
  int v21;
  int v22;
  int v23;
  int v24;
  unsigned int v25;
  int v26;
  NSObject *global_queue;
  NSObject *v28;
  NSObject *v29;
  uint64_t v30;
  uint64_t v31;
  unint64_t v32;
  unint64_t block;
  uint64_t v34;
  void (*v35)(uint64_t);
  void *v36;
  uint64_t v37;

  v4 = MEMORY[0x24BDAC760];
  if (!a3)
    goto LABEL_63;
  v8 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v8)
  {
    switch(a2)
    {
      case -469794786:
        v32 = 0;
        v11 = FigCFWeakReferenceHolderCopyReferencedObject();
        if (!v11)
          goto LABEL_55;
        v32 = *(unsigned int *)(a4 + 32);
        v12 = *(_QWORD *)(a3 + 24);
        v13 = *(_QWORD *)(a4 + 24);
        v14 = *(unsigned int (**)(uint64_t, uint64_t, unint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable()
                                                                                              + 16)
                                                                                  + 24);
        if (!v14 || v14(v12, v13, &v32))
        {
          v15 = 0;
          v16 = 0;
          LOBYTE(v17) = 0;
          LOBYTE(v18) = 1;
LABEL_54:
          sub_206845B64(a3, a4, v16, v17, v15, v18);
LABEL_55:
          global_queue = dispatch_get_global_queue(0, 0);
          block = v4;
          v34 = 0x40000000;
          v35 = sub_206846D88;
          v36 = &unk_24BFE6340;
          v37 = v11;
          dispatch_async(global_queue, &block);
          goto LABEL_56;
        }
        v31 = 0;
        v19 = *(_QWORD *)(a3 + 24);
        v20 = *(void (**)(uint64_t, uint64_t *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
        if (v20)
        {
          v20(v19, &v31);
          v21 = v31;
        }
        else
        {
          v21 = 0;
        }
        v22 = v32;
        v30 = *(_QWORD *)(a4 + 24);
        v23 = sub_206846AE8(v21, v30, v32);
        if (v23)
        {
          v24 = v23;
          v25 = 0;
        }
        else
        {
          v24 = sub_206842B98(*(void **)(a4 + 16), v30, v22, (_DWORD *)&v31 + 1);
          v25 = HIDWORD(v31);
        }
        if ((*(_BYTE *)(a3 + 69) & 0x10) != 0)
        {
          block = __PAIR64__(v25, v24);
          (*(void (**)(uint64_t, uint64_t, unint64_t *, _QWORD))(a3 + 72))(v11, 4096, &block, *(_QWORD *)(a3 + 80));
          v25 = HIDWORD(v31);
        }
        *(_DWORD *)(a4 + 36) = 0;
        if (v24 <= -43102)
        {
          if (v24 == -43103)
          {
            v15 = 0;
            LOBYTE(v18) = 0;
            v16 = 100;
            goto LABEL_53;
          }
          if (v24 != -43102)
            goto LABEL_43;
        }
        else
        {
          if (v24 != -43101)
          {
            if (v24 == -43011)
            {
              FigSignalErrorAt();
              if ((*(_BYTE *)(a3 + 68) & 4) != 0)
                (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a3 + 72))(v11, 4, 0, *(_QWORD *)(a3 + 80));
              goto LABEL_55;
            }
            if (!v24)
            {
              if ((v25 & 0x200) != 0)
                goto LABEL_52;
              if ((v25 & 0x80) == 0)
              {
                v26 = v25 & 0x28;
                if ((v25 & 0x10) != 0 && v26 == 40)
                {
                  v15 = 1;
                  if ((v25 & 7) == 2)
                  {
                    if (((v25 >> 2) & 0x2000 | v25 & 0x4000 | (((v25 >> 13) & 1) << 15)) == 0x2000)
                      v15 = 2;
                    else
                      v15 = 1;
                  }
                  v16 = 1;
                  goto LABEL_46;
                }
                if (v26 != 8)
                {
                  v15 = 0;
                  if ((v25 & 8) != 0)
                    v16 = 2;
                  else
                    v16 = 4;
                  v18 = (v25 & 8) >> 3;
                  goto LABEL_53;
                }
LABEL_52:
                v15 = 0;
                LOBYTE(v18) = 1;
                v16 = 3;
                goto LABEL_53;
              }
              v16 = 1;
              v15 = 2;
LABEL_46:
              LOBYTE(v18) = 1;
              goto LABEL_53;
            }
LABEL_43:
            v15 = 0;
            LOBYTE(v18) = 1;
            v16 = 2;
LABEL_53:
            v17 = (v25 >> 8) & 1;
            goto LABEL_54;
          }
          sub_206846B5C(a3, a4);
        }
        v15 = 0;
        v16 = 0;
        goto LABEL_46;
      case -469794785:
      case -469794782:
        *(_QWORD *)(a4 + 8) = 27500000000;
        v9 = *(NSObject **)a4;
        if (*(_QWORD *)a4)
        {
          v10 = dispatch_time(0, 1900000000);
          dispatch_source_set_timer(v9, v10, *(_QWORD *)(a4 + 8), 0xA3E9AB80uLL);
        }
        goto LABEL_64;
      case -469794784:
        if (*(_QWORD *)(a4 + 16))
        {
          dispatch_suspend(*(dispatch_object_t *)a4);
          sub_206845B24(a4);
          sub_206845B64(a3, a4, 4, 0, 0, 1);
          if ((*(_BYTE *)(a3 + 69) & 8) != 0)
            (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a3 + 72))(v8, 2048, 0, *(_QWORD *)(a3 + 80));
        }
        goto LABEL_64;
      case -469794783:
        if (!*(_QWORD *)(a4 + 16))
        {
          sub_206845B64(a3, a4, 4, 0, 0, 0);
          *(_QWORD *)(a4 + 8) = 27500000000;
          if (*(_QWORD *)a4)
            dispatch_source_set_timer(*(dispatch_source_t *)a4, 0, 0x66720B300uLL, 0xA3E9AB80uLL);
          if (sub_206845E6C(a3, a4))
            dispatch_resume(*(dispatch_object_t *)a4);
          if ((*(_BYTE *)(a3 + 69) & 4) != 0)
            (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a3 + 72))(v8, 1024, 0, *(_QWORD *)(a3 + 80));
        }
        goto LABEL_64;
      default:
        goto LABEL_64;
    }
  }
  if (a2 == -469794786)
  {
LABEL_56:
    v28 = *(NSObject **)(a3 + 16);
    if (v28)
      dispatch_group_leave(v28);
  }
  else
  {
LABEL_63:
    v8 = 0;
  }
LABEL_64:
  v29 = dispatch_get_global_queue(0, 0);
  block = v4;
  v34 = 0x40000000;
  v35 = sub_206846D88;
  v36 = &unk_24BFE6340;
  v37 = v8;
  dispatch_async(v29, &block);
}

void sub_206845B24(uint64_t a1)
{
  void *v2;
  void *v3;

  v2 = *(void **)(a1 + 16);
  if (v2)
  {
    sub_206842B34(v2);
    *(_QWORD *)(a1 + 16) = 0;
  }
  v3 = *(void **)(a1 + 24);
  if (v3)
  {
    free(v3);
    *(_QWORD *)(a1 + 24) = 0;
    *(_DWORD *)(a1 + 32) = 0;
  }
}

void sub_206845B64(uint64_t a1, uint64_t a2, int a3, char a4, int a5, char a6)
{
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void (*v15)(uint64_t, int *);
  char v16;
  NSObject *v17;
  NSObject *global_queue;
  _QWORD v19[12];
  int v20;
  int v21;
  int v22;
  char v23;
  char v24;
  uint64_t v25;
  uint64_t *v26;
  uint64_t v27;
  char v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  int v32;
  uint64_t v33;
  uint64_t *v34;
  uint64_t v35;
  int v36;
  uint64_t v37;
  uint64_t *v38;
  uint64_t v39;
  char v40;
  uint64_t v41;
  uint64_t *v42;
  uint64_t v43;
  int v44;
  uint64_t v45;
  uint64_t *v46;
  uint64_t v47;
  int v48;
  int v49;
  _QWORD block[5];

  v49 = 0;
  v45 = 0;
  v46 = &v45;
  v47 = 0x2000000000;
  v48 = 0;
  v41 = 0;
  v42 = &v41;
  v43 = 0x2000000000;
  v44 = 0;
  v37 = 0;
  v38 = &v37;
  v39 = 0x2000000000;
  v40 = 0;
  v33 = 0;
  v34 = &v33;
  v35 = 0x2000000000;
  v36 = 0;
  v29 = 0;
  v30 = &v29;
  v31 = 0x2000000000;
  v32 = 0;
  v25 = 0;
  v26 = &v25;
  v27 = 0x2000000000;
  v28 = 0;
  v12 = FigCFWeakReferenceHolderCopyReferencedObject();
  v13 = MEMORY[0x24BDAC760];
  if (v12)
  {
    *((_DWORD *)v46 + 6) = *(_DWORD *)(a1 + 48);
    *((_DWORD *)v42 + 6) = *(_DWORD *)(a1 + 52);
    *((_BYTE *)v38 + 24) = *(_BYTE *)(a1 + 65);
    *((_DWORD *)v34 + 6) = a3;
    *((_DWORD *)v30 + 6) = a5;
    *((_BYTE *)v26 + 24) = a6;
    v14 = *(_QWORD *)(a1 + 24);
    v15 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v15)
      v15(v14, &v49);
    if (a3 == 100)
    {
      a5 = 0;
      a3 = 0;
      *((_DWORD *)v34 + 6) = 0;
      *((_DWORD *)v30 + 6) = 0;
      *((_BYTE *)v26 + 24) = 0;
      v16 = 1;
    }
    else
    {
      v16 = 0;
    }
    if (!*(_BYTE *)a1)
    {
      a3 = 4;
      *((_DWORD *)v34 + 6) = 4;
      a5 = 2;
      *((_DWORD *)v30 + 6) = 2;
      *((_BYTE *)v26 + 24) = 1;
    }
    v17 = *(NSObject **)(a1 + 40);
    v19[0] = v13;
    v19[1] = 0x40000000;
    v19[2] = sub_206846BD4;
    v19[3] = &unk_24BFE6320;
    v23 = v16;
    v19[10] = a2;
    v19[11] = a1;
    v19[4] = &v33;
    v19[5] = &v45;
    v24 = a4;
    v19[6] = &v29;
    v19[7] = &v41;
    v19[8] = &v25;
    v19[9] = &v37;
    v20 = v49;
    v21 = a3;
    v22 = a5;
    dispatch_sync(v17, v19);
    if ((*(_BYTE *)(a1 + 68) & 1) != 0)
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 72))(v12, 1, 0, *(_QWORD *)(a1 + 80));
    if ((*((_DWORD *)v34 + 6) != *((_DWORD *)v46 + 6)
       || *((_DWORD *)v30 + 6) != *((_DWORD *)v42 + 6)
       || *((unsigned __int8 *)v26 + 24) != *((unsigned __int8 *)v38 + 24))
      && (*(_BYTE *)(a1 + 68) & 2) != 0)
    {
      (*(void (**)(uint64_t, uint64_t, _QWORD, _QWORD))(a1 + 72))(v12, 2, 0, *(_QWORD *)(a1 + 80));
    }
  }
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = v13;
  block[1] = 0x40000000;
  block[2] = sub_206846D88;
  block[3] = &unk_24BFE6340;
  block[4] = v12;
  dispatch_async(global_queue, block);
  _Block_object_dispose(&v25, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(&v37, 8);
  _Block_object_dispose(&v41, 8);
  _Block_object_dispose(&v45, 8);
}

BOOL sub_206845E6C(uint64_t a1, uint64_t a2)
{
  int v3;
  uint64_t v4;
  void (*v5)(uint64_t, int *);
  int v6;
  int v8;
  uint64_t v9;

  v9 = 0;
  v3 = 1;
  v8 = 1;
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 48);
  if (v5)
  {
    v5(v4, &v8);
    v3 = v8;
  }
  v6 = sub_206842B14(v3, &v9);
  if (!v6)
    *(_QWORD *)(a2 + 16) = v9;
  return v6 == 0;
}

void sub_206845EEC(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  NSObject *v5;
  _QWORD v6[6];

  v4 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v4)
  {
    v5 = *(NSObject **)(a1 + 32);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 0x40000000;
    v6[2] = sub_206845F60;
    v6[3] = &unk_24BFE6210;
    v6[4] = a2;
    v6[5] = v4;
    dispatch_async(v5, v6);
  }
}

void sub_206845F60(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  NSObject *global_queue;
  _QWORD block[5];

  v2 = *(_QWORD *)(a1 + 32);
  if (*(_QWORD *)v2)
    dispatch_source_set_timer(*(dispatch_source_t *)v2, 0, *(_QWORD *)(v2 + 8), 0xA3E9AB80uLL);
  v3 = *(_QWORD *)(a1 + 40);
  global_queue = dispatch_get_global_queue(0, 0);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206846D88;
  block[3] = &unk_24BFE6340;
  block[4] = v3;
  dispatch_async(global_queue, block);
}

uint64_t sub_206845FEC(uint64_t a1, uint64_t a2)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD block[7];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  v2 = *(NSObject **)(a1 + 32);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = sub_206846080;
  block[3] = &unk_24BFE6238;
  block[5] = a1;
  block[6] = a2;
  block[4] = &v6;
  dispatch_sync(v2, block);
  v3 = *((unsigned int *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

void sub_206846080(uint64_t a1)
{
  uint64_t v2;
  void (*v3)(uint64_t, int *);
  int v4;

  v4 = 0;
  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 24);
  v3 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (!v3 || (v3(v2, &v4), v4 != 5))
  {
    if (sub_206845E6C(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48)))
      dispatch_resume(**(dispatch_object_t **)(a1 + 48));
    else
      *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = -12223;
  }
}

uint64_t sub_206846108(_DWORD *a1, _DWORD *a2)
{
  uint64_t result;

  if (!a1)
    return 4294955076;
  if (!a2)
    return 0;
  result = 0;
  *a2 = *a1;
  return result;
}

uint64_t sub_206846134(uint64_t a1, _DWORD *a2)
{
  uint64_t v3;
  void (*v4)(uint64_t, _DWORD *);

  if (a2)
  {
    *a2 = 0;
    if (a1)
    {
      v3 = *(_QWORD *)(a1 + 24);
      if (v3)
      {
        v4 = *(void (**)(uint64_t, _DWORD *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
        if (v4)
          v4(v3, a2);
      }
    }
  }
  return 0;
}

uint64_t sub_206846188(uint64_t a1, _BYTE *a2)
{
  uint64_t v3;
  void (*v5)(uint64_t, int *);
  uint64_t result;
  int v7;

  v7 = 0;
  if (!a1)
    return 4294955076;
  v3 = *(_QWORD *)(a1 + 24);
  if (!v3)
    return 4294955074;
  v5 = *(void (**)(uint64_t, int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
  if (v5)
  {
    v5(v3, &v7);
    if (v7 == 5)
      return 4294955075;
  }
  result = 0;
  if (a2)
    *a2 = *(_BYTE *)(a1 + 64);
  return result;
}

uint64_t sub_20684621C(uint64_t a1)
{
  if (a1)
    *(_BYTE *)(a1 + 64) = 0;
  return 0;
}

uint64_t sub_20684622C(uint64_t a1, _DWORD *a2, _BYTE *a3)
{
  NSObject *v4;
  _QWORD block[7];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  int v10;

  v7 = 0;
  v8 = &v7;
  v9 = 0x2000000000;
  v10 = 0;
  if (a3)
    *a3 = 0;
  if (a1)
  {
    v4 = *(NSObject **)(a1 + 40);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_2068462DC;
    block[3] = &unk_24BFE6260;
    block[4] = &v7;
    block[5] = a1;
    block[6] = a3;
    dispatch_sync(v4, block);
  }
  if (a2)
    *a2 = *((_DWORD *)v8 + 6);
  _Block_object_dispose(&v7, 8);
  return 0;
}

_QWORD *sub_2068462DC(_QWORD *result)
{
  uint64_t v1;
  _BYTE *v2;

  v1 = result[5];
  *(_DWORD *)(*(_QWORD *)(result[4] + 8) + 24) = *(_DWORD *)(v1 + 48);
  v2 = (_BYTE *)result[6];
  if (v2)
    *v2 = *(_BYTE *)(v1 + 65);
  return result;
}

uint64_t sub_206846300(uint64_t a1, _DWORD *a2)
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = sub_2068463A0;
    v5[3] = &unk_24BFE6288;
    v5[4] = &v6;
    v5[5] = a1;
    dispatch_sync(v3, v5);
  }
  if (a2)
    *a2 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return 0;
}

uint64_t sub_2068463A0(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 52);
  return result;
}

uint64_t sub_2068463B4(uint64_t a1, _DWORD *a2)
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = sub_206846454;
    v5[3] = &unk_24BFE62B0;
    v5[4] = &v6;
    v5[5] = a1;
    dispatch_sync(v3, v5);
  }
  if (a2)
    *a2 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return 0;
}

uint64_t sub_206846454(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 56);
  return result;
}

uint64_t sub_206846468(uint64_t a1, _DWORD *a2)
{
  NSObject *v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2000000000;
  v9 = 0;
  if (a1)
  {
    v3 = *(NSObject **)(a1 + 40);
    v5[0] = MEMORY[0x24BDAC760];
    v5[1] = 0x40000000;
    v5[2] = sub_206846508;
    v5[3] = &unk_24BFE62D8;
    v5[4] = &v6;
    v5[5] = a1;
    dispatch_sync(v3, v5);
  }
  if (a2)
    *a2 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return 0;
}

uint64_t sub_206846508(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 40) + 60);
  return result;
}

uint64_t sub_20684651C(uint64_t a1, uint64_t a2, int a3, int a4, NSObject *a5, int a6, uint64_t a7, const void *a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12)
{
  uint64_t result;
  dispatch_queue_t v21;
  dispatch_group_t v22;
  dispatch_source_t v23;
  void *v24;
  NSObject *v25;
  _QWORD handler[7];

  if (!a1)
    return 4294951835;
  result = 4294951836;
  if (a5 && a7 && a8 && a10)
  {
    *(_QWORD *)(a1 + 8) = FigCFWeakReferenceHolderCreateWithReferencedObject();
    *(_DWORD *)a1 = a3;
    *(_DWORD *)(a1 + 4) = a4;
    *(_QWORD *)(a1 + 32) = a5;
    dispatch_retain(a5);
    *(_DWORD *)(a1 + 68) = a6;
    *(_QWORD *)(a1 + 72) = a7;
    *(_QWORD *)(a1 + 80) = CFRetain(a8);
    v21 = dispatch_queue_create("com.apple.CoreAUC.statusQueue", 0);
    *(_QWORD *)(a1 + 40) = v21;
    if (v21)
    {
      v22 = dispatch_group_create();
      *(_QWORD *)(a1 + 16) = v22;
      if (v22)
      {
        if (!a2)
        {
LABEL_11:
          result = 0;
          *(_OWORD *)(a1 + 48) = xmmword_2068508C0;
          *(_BYTE *)(a1 + 65) = 0;
          if (a11 && a12)
          {
            if (qword_253E53050 != -1)
              dispatch_once(&qword_253E53050, &unk_24BFE5A50);
            result = dword_253E53000;
            if (!dword_253E53000)
            {
              CMNotificationCenterGetDefaultLocalCenter();
              return FigNotificationCenterAddWeakListener();
            }
          }
          return result;
        }
        v23 = dispatch_source_create(MEMORY[0x24BDACA18], 0, 1uLL, *(dispatch_queue_t *)(a1 + 32));
        *(_QWORD *)a2 = v23;
        if (v23)
        {
          v24 = (void *)CFRetain(*(CFTypeRef *)(a1 + 8));
          dispatch_set_context(*(dispatch_object_t *)a2, v24);
          dispatch_set_finalizer_f(*(dispatch_object_t *)a2, (dispatch_function_t)sub_20684672C);
          v25 = *(NSObject **)a2;
          handler[0] = MEMORY[0x24BDAC760];
          handler[1] = 0x40000000;
          handler[2] = sub_206846738;
          handler[3] = &unk_24BFE62F8;
          handler[4] = v24;
          handler[5] = a2;
          handler[6] = a1;
          dispatch_source_set_event_handler(v25, handler);
          *(_QWORD *)(a2 + 8) = 27500000000;
          dispatch_source_set_timer(*(dispatch_source_t *)a2, 0, 0x66720B300uLL, 0xA3E9AB80uLL);
          goto LABEL_11;
        }
      }
    }
    return 4294955072;
  }
  return result;
}

void sub_20684672C(CFTypeRef cf)
{
  if (cf)
    CFRelease(cf);
}

void sub_206846738(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void (*v7)(uint64_t, unsigned int *);
  unsigned int v8;
  int v9;
  void *v10;
  unsigned int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t (*v16)(uint64_t, uint64_t, uint64_t);
  int v17;
  int v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  NSObject *global_queue;
  unsigned int v22;
  _QWORD block[5];

  v2 = FigCFWeakReferenceHolderCopyReferencedObject();
  if (v2)
  {
    v3 = v2;
    v4 = *(_QWORD *)(a1 + 40);
    if (!*(_QWORD *)(v4 + 16))
      goto LABEL_30;
    v5 = *(_QWORD *)(a1 + 48);
    v22 = 0;
    v6 = *(_QWORD *)(v5 + 24);
    if (!v6)
      goto LABEL_30;
    v7 = *(void (**)(uint64_t, unsigned int *))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 40);
    if (v7)
    {
      v7(v6, &v22);
      if (v22 <= 8 && ((1 << v22) & 0x1C8) != 0)
      {
        v8 = *(_DWORD *)(v4 + 36);
        if (v8 >= 3)
        {
LABEL_18:
          sub_206846B5C(v5, v4);
          goto LABEL_30;
        }
        if (v8)
        {
          v9 = v8 + 1;
LABEL_29:
          *(_DWORD *)(v4 + 36) = v9;
          goto LABEL_30;
        }
      }
    }
    v10 = *(void **)(v4 + 24);
    if (!v10)
    {
      *(_DWORD *)(v4 + 32) = 0;
      sub_206842B54(*(void **)(v4 + 16), 0, (_DWORD *)(v4 + 32));
      v11 = *(_DWORD *)(v4 + 32);
      if (v22 == 3)
      {
        v11 *= 2;
        *(_DWORD *)(v4 + 32) = v11;
      }
      if (v11)
      {
        v10 = malloc_type_malloc(v11, 0x2EB03CA7uLL);
        *(_QWORD *)(v4 + 24) = v10;
        if (!v10)
          goto LABEL_30;
      }
      else
      {
        v10 = *(void **)(v4 + 24);
        if (!v10)
          goto LABEL_30;
      }
    }
    LODWORD(block[0]) = *(_DWORD *)(v4 + 32);
    v12 = sub_206842B54(*(void **)(v4 + 16), (uint64_t)v10, block);
    if (v12 == -43101)
      goto LABEL_18;
    if (v12 || sub_206846AE8(v22, *(_QWORD *)(v4 + 24), LODWORD(block[0])))
      goto LABEL_30;
    dispatch_group_enter(*(dispatch_group_t *)(v5 + 16));
    v13 = *(_QWORD *)(v5 + 24);
    v14 = *(_QWORD *)(v4 + 24);
    v15 = LODWORD(block[0]);
    v16 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 16);
    if (v16)
    {
      v17 = v16(v13, v14, v15);
      if (!v17)
      {
        v9 = 1;
        goto LABEL_29;
      }
      v18 = v17;
      dispatch_group_leave(*(dispatch_group_t *)(v5 + 16));
      if (v18 == -536870181)
      {
        v19 = *(_QWORD *)(v5 + 24);
        v20 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
        if (v20)
          v20(v19);
      }
    }
    else
    {
      dispatch_group_leave(*(dispatch_group_t *)(v5 + 16));
    }
    sub_206845B64(v5, v4, 0, 0, 0, 1);
LABEL_30:
    global_queue = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = sub_206846D88;
    block[3] = &unk_24BFE6340;
    block[4] = v3;
    dispatch_async(global_queue, block);
  }
}

void sub_206846984(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  dispatch_time_t v6;
  NSObject *v7;
  const void *v8;
  NSObject *v9;
  NSObject *v10;
  const void *v11;
  const void *v12;
  const void *v13;

  if (a3 && a4)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    FigNotificationCenterRemoveWeakListener();
  }
  if (a2 && *(_QWORD *)a2)
  {
    dispatch_source_cancel(*(dispatch_source_t *)a2);
    if (!*(_QWORD *)(a2 + 16))
      dispatch_resume(*(dispatch_object_t *)a2);
    if (*(_QWORD *)a2)
    {
      dispatch_release(*(dispatch_object_t *)a2);
      *(_QWORD *)a2 = 0;
    }
  }
  if (*(_QWORD *)(a1 + 16))
  {
    v6 = dispatch_time(0, 5000000000);
    dispatch_group_wait(*(dispatch_group_t *)(a1 + 16), v6);
    v7 = *(NSObject **)(a1 + 16);
    if (v7)
    {
      dispatch_release(v7);
      *(_QWORD *)(a1 + 16) = 0;
    }
  }
  v8 = *(const void **)(a1 + 24);
  if (v8)
  {
    CFRelease(v8);
    *(_QWORD *)(a1 + 24) = 0;
  }
  if (a2)
    sub_206845B24(a2);
  v9 = *(NSObject **)(a1 + 32);
  if (v9)
  {
    dispatch_release(v9);
    *(_QWORD *)(a1 + 32) = 0;
  }
  v10 = *(NSObject **)(a1 + 40);
  if (v10)
  {
    dispatch_release(v10);
    *(_QWORD *)(a1 + 40) = 0;
  }
  v11 = *(const void **)(a1 + 80);
  if (v11)
  {
    CFRelease(v11);
    *(_QWORD *)(a1 + 80) = 0;
  }
  v12 = *(const void **)(a1 + 8);
  if (v12)
  {
    CFRelease(v12);
    *(_QWORD *)(a1 + 8) = 0;
  }
  v13 = *(const void **)(a1 + 88);
  if (v13)
  {
    CFRelease(v13);
    *(_QWORD *)(a1 + 88) = 0;
  }
}

CFStringRef sub_206846AAC(uint64_t a1)
{
  return CFStringCreateWithFormat((CFAllocatorRef)*MEMORY[0x24BDBD240], 0, CFSTR("[AUCHDCPMonitor %p]"), a1);
}

uint64_t sub_206846AE8(int a1, uint64_t a2, unint64_t a3)
{
  int v4;

  if (a3 < 0x10 || a3 - 16 != bswap32(*(unsigned __int16 *)(a2 + 14)) >> 16)
    return 4294924288;
  if (*(_DWORD *)a2 != 1346585672)
    return 4294924293;
  if ((a1 - 1) > 7)
    v4 = -1;
  else
    v4 = dword_206850878[a1 - 1];
  if (v4 == *(unsigned __int8 *)(a2 + 4))
    return 0;
  else
    return 4294924294;
}

BOOL sub_206846B5C(uint64_t a1, uint64_t a2)
{
  uint64_t v4;
  void (*v5)(uint64_t);

  sub_206845B24(a2);
  v4 = *(_QWORD *)(a1 + 24);
  v5 = *(void (**)(uint64_t))(*(_QWORD *)(CMBaseObjectGetVTable() + 16) + 8);
  if (v5)
    v5(v4);
  *(_DWORD *)(a2 + 36) = 0;
  sub_206845B64(a1, a2, 2, 0, 0, 0);
  return sub_206845E6C(a1, a2);
}

void sub_206846BD4(uint64_t a1)
{
  int v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  int64_t v6;
  dispatch_time_t v7;
  uint64_t v8;
  int v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;

  v2 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) - 1;
  if (v2 > 3)
    v3 = 1900000000;
  else
    v3 = qword_206850898[v2];
  v4 = *(_QWORD *)(a1 + 80);
  if (*(_BYTE *)(a1 + 108) || v3 != *(_QWORD *)(v4 + 8))
  {
    *(_QWORD *)(v4 + 8) = v3;
    v5 = *(NSObject **)v4;
    if (*(_QWORD *)v4)
    {
      if (*(_BYTE *)(a1 + 108))
        v6 = 0;
      else
        v6 = v3;
      v7 = dispatch_time(0, v6);
      dispatch_source_set_timer(v5, v7, v3, 0xA3E9AB80uLL);
    }
  }
  v8 = *(_QWORD *)(a1 + 88);
  *(_BYTE *)(v8 + 64) = 1;
  v9 = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  if ((v9 | 2) != 2 || (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) | 2) == 2)
    goto LABEL_13;
  if (!v9)
  {
    v10 = *(_QWORD *)(a1 + 80);
    v12 = *(_DWORD *)(v10 + 40);
    if (v12 > 2)
      goto LABEL_14;
LABEL_24:
    *(_DWORD *)(v10 + 40) = v12 + 1;
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8)
                                                                            + 24);
    *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
    *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 72) + 8)
                                                                          + 24);
    v8 = *(_QWORD *)(a1 + 88);
    goto LABEL_15;
  }
  if (v9 == 2)
  {
    if (*(_DWORD *)(a1 + 96) == 8)
      v11 = 10;
    else
      v11 = 1;
    v10 = *(_QWORD *)(a1 + 80);
    v12 = *(_DWORD *)(v10 + 40);
    if (v12 >= v11)
      goto LABEL_14;
    goto LABEL_24;
  }
LABEL_13:
  v10 = *(_QWORD *)(a1 + 80);
LABEL_14:
  *(_DWORD *)(v10 + 40) = 0;
LABEL_15:
  *(_DWORD *)(v8 + 48) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24);
  *(_DWORD *)(v8 + 56) = *(_DWORD *)(a1 + 100);
  *(_DWORD *)(v8 + 52) = *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  *(_DWORD *)(v8 + 60) = *(_DWORD *)(a1 + 104);
  *(_BYTE *)(v8 + 65) = *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 64) + 8) + 24);
}

void sub_206846D88(uint64_t a1)
{
  const void *v1;

  v1 = *(const void **)(a1 + 32);
  if (v1)
    CFRelease(v1);
}

uint64_t sub_206846D98()
{
  uint64_t result;

  CMNotificationCenterGetDefaultLocalCenter();
  result = CMNotificationCenterAddListener();
  dword_253E53000 = result;
  if (!(_DWORD)result)
  {
    CMNotificationCenterGetDefaultLocalCenter();
    result = CMNotificationCenterRegisterForBarrierSupport();
    dword_253E53000 = result;
  }
  return result;
}

uint64_t sub_206846DFC()
{
  return CMNotificationCenterPostNotification();
}

uint64_t sub_206846E14(uint64_t a1, uint64_t a2, uint64_t a3)
{
  _QWORD v4[5];
  _DWORD v5[2];
  _QWORD *v6;
  uint64_t v7;
  uint64_t vars0;

  v7 = *MEMORY[0x24BDAC8D0];
  v4[0] = 0x206846F50;
  v4[1] = a1;
  v4[3] = a2;
  v4[4] = a3;
  v5[0] = 111364217
        * ((((&vars0 - 24) | 0x5D3F2887) - ((&vars0 - 24) & 0x5D3F2887)) ^ 0x17D7BB89)
        - 250794294;
  v6 = v4;
  sub_206846EC4((uint64_t)v5);
  return v5[1];
}

void sub_206846EC4(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_206846F48()
{
  uint64_t v0;

  *(_DWORD *)(v0 + 4) = -43002;
}

uint64_t sub_206847DD8(uint64_t a1)
{
  unint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 462267737
     * ((-2 - ((~(unint64_t)&v3 | 0xDA0EC6D8DB4E39A5) + ((unint64_t)&v3 | 0x25F1392724B1C65ALL))) ^ 0x873B4B35E92132E2);
  v4 = a1;
  v5 = v1 ^ 0x206847F1CLL;
  v3 = 1995507721 - v1;
  sub_206847EA0((uint64_t)&v3);
  return v6;
}

void sub_206847EA0(uint64_t a1)
{
  __asm { BR              X8 }
}

void sub_206847F1C(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, int a13, int a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21)
{
  uint64_t v21;
  void *v22;

  free(v22);
  *(_DWORD *)(v21 + 24) = 0;
}

uint64_t sub_206848100(uint64_t a1)
{
  unint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 462267737
     * ((((unint64_t)&v3 | 0xA0E8335166F4C700) - (_QWORD)&v3 + ((unint64_t)&v3 & 0x5F17CCAE990B38F8)) ^ 0xFDDDBEBC549BCC47);
  v3 = 1995507721 - v1;
  v4 = a1;
  v5 = v1 ^ 0x206848000;
  sub_206847EA0((uint64_t)&v3);
  return v6;
}

void sub_2068481C4(_QWORD *a1)
{
  _BOOL4 v4;

  v4 = a1[5] != 0x22AB66BAB6ADB379 && a1[4] != 0x13F4C241A706B52FLL && a1[2] != 0 && a1[1] != 0;
  __asm { BR              X14 }
}

uint64_t sub_2068482C4@<X0>(uint64_t a1@<X0>, uint64_t a2@<X4>, int a3@<W8>)
{
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a2 + 8 * ((94 * (*(_DWORD *)(a1 + 48) + v3 < 1303932092)) ^ (a3 - 63))) - 8))();
}

uint64_t sub_206848300@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * ((57 * (v3 == v2 + a2 - 28 - 83)) ^ a2)) - 4))();
}

uint64_t sub_20684832C@<X0>(uint64_t a1@<X4>, int a2@<W8>)
{
  int v2;
  int v3;

  return ((uint64_t (*)(void))(*(_QWORD *)(a1 + 8 * (a2 ^ (57 * (v3 == v2)))) - (((a2 - 78) | 0x32u) ^ 0x33)))();
}

uint64_t sub_206848360(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6)
{
  int v6;
  int v7;
  int v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t);

  v10 = (uint64_t (*)(uint64_t))(*(_QWORD *)(a5 + 8 * ((((2 * v6) ^ 0x39) * (v8 == v7 - 28)) ^ v6)) - 8);
  *(_QWORD *)(v9 - 144) = a6;
  return v10(677214123);
}

uint64_t sub_2068483D0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,uint64_t a36)
{
  int v36;
  unsigned __int8 *v37;
  int v38;
  uint64_t v39;
  _BYTE *v40;
  uint64_t v41;
  int v42;
  unsigned int v43;
  int v44;
  int v45;
  unsigned int v46;
  int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
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
  uint64_t v65;
  uint64_t v66;
  uint64_t v67;

  v42 = (*v40 - 15) - ((v36 ^ 0x1E2) & (2 * (*v40 - 15))) - 805742650;
  v43 = 173 * (v42 ^ 0x82A77580) - ((346 * (v42 ^ 0x82A77580)) & 0x5027FE70) - 1475084488;
  v44 = (*(_BYTE *)(v39 - 0x22AB66BAB6ADB377) - 15)
      - ((2 * (*(unsigned __int8 *)(v39 - 0x22AB66BAB6ADB377) - 15)) & 0x18C)
      - 805742650;
  v45 = ((*(_BYTE *)(v39 - 0x22AB66BAB6ADB378) - 15)
       - ((2 * (*(unsigned __int8 *)(v39 - 0x22AB66BAB6ADB378) - 15)) & 0x18C)
       - 805742650) ^ 0x67EA00ED;
  v46 = 173 * (v45 ^ v43 ^ HIWORD(v43)) - ((346 * (v45 ^ v43 ^ HIWORD(v43))) & 0x5027FE70) - 1475084488;
  v47 = (*(_BYTE *)(v39 - 0x22AB66BAB6ADB376) - 15)
      - ((2 * (*(unsigned __int8 *)(v39 - 0x22AB66BAB6ADB376) - 15)) & 0x18C)
      - 805742650;
  v48 = 173 * (v44 ^ 0x67EA00ED ^ v46 ^ HIWORD(v46))
      - ((346 * (v44 ^ 0x67EA00ED ^ v46 ^ HIWORD(v46))) & 0x5027FE70)
      - 1475084488;
  v49 = v42 ^ (173 * (v47 ^ v48 ^ HIWORD(v48) ^ 0x67EA00ED)
             - ((346 * (v47 ^ v48 ^ HIWORD(v48) ^ 0x67EA00ED)) & 0x5027FE70)
             - 1475084488) ^ ((173 * (v47 ^ v48 ^ HIWORD(v48) ^ 0x67EA00ED)
                             - ((346 * (v47 ^ v48 ^ HIWORD(v48) ^ 0x67EA00ED)) & 0x5027FE70)
                             - 1475084488) >> 16) ^ 0x67EA00ED;
  v50 = 173 * v49 - ((346 * v49) & 0x5027FE70) - 1475084488;
  v51 = 173 * (v45 ^ v50 ^ HIWORD(v50)) - ((346 * (v45 ^ v50 ^ HIWORD(v50))) & 0x5027FE70) - 1475084488;
  v52 = v47 ^ (173 * (v44 ^ 0x67EA00ED ^ v51 ^ HIWORD(v51))
             - ((346 * (v44 ^ 0x67EA00ED ^ v51 ^ HIWORD(v51))) & 0x5027FE70)
             - 1475084488) ^ ((173 * (v44 ^ 0x67EA00ED ^ v51 ^ HIWORD(v51))
                             - ((346 * (v44 ^ 0x67EA00ED ^ v51 ^ HIWORD(v51))) & 0x5027FE70)
                             - 1475084488) >> 16) ^ 0x5F17F441;
  HIDWORD(v64) = v37[12];
  LODWORD(v60) = v37[19];
  HIDWORD(a19) = v37[27];
  HIDWORD(v67) = v37[15];
  LODWORD(v66) = v37[9];
  LODWORD(v67) = v37[2];
  HIDWORD(a18) = v37[18];
  HIDWORD(v66) = v37[6];
  LODWORD(v61) = v37[22];
  HIDWORD(v62) = v37[4];
  LODWORD(v59) = v37[20];
  LODWORD(v64) = v37[1];
  v53 = 51 * (v52 ^ v38) - ((102 * (v52 ^ v38)) & 0xD8099A82) - 335229631;
  HIDWORD(v57) = v37[23];
  LODWORD(v63) = v37[5];
  LODWORD(v65) = v37[3];
  LODWORD(v55) = v37[24];
  HIDWORD(v55) = v37[28];
  HIDWORD(v60) = v37[31];
  HIDWORD(v59) = v37[30];
  HIDWORD(a13) = v37[25];
  HIDWORD(v58) = v37[26];
  HIDWORD(a36) = v37[13];
  HIDWORD(v61) = *v37;
  HIDWORD(v63) = v37[8];
  LODWORD(v62) = v37[7];
  HIDWORD(v56) = v37[29];
  LODWORD(v57) = v37[17];
  HIDWORD(v65) = v37[14];
  LODWORD(v58) = v37[16];
  *(_DWORD *)(v41 - 220) = v37[11];
  LODWORD(v56) = v37[21];
  *(_DWORD *)(v41 - 148) = v53;
  *(_DWORD *)(v41 - 196) = HIBYTE(v53);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[v36 ^ 0x63] - 8))(1326374545, 1437007557, 2294123119, 2787081181, 2951771162, 1443885043, 2533654286, 3414310791, a9, a10, a11, a12, a13, v55, v56, v57, v58, a18, a19,
           v59,
           v60,
           v61,
           v62,
           v63,
           v64,
           v65,
           v66,
           v67,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34,
           a35,
           a36);
}

void sub_2068489F4()
{
  JUMPOUT(0x206848880);
}

uint64_t sub_206848A04()
{
  int v0;
  uint64_t v1;

  *(_DWORD *)(v1 - 152) = *(_DWORD *)(v1 - 196) ^ 0x70;
  *(_DWORD *)(v1 - 156) = *(_DWORD *)(v1 - 148) ^ 0xFFFFFFDD;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(qword_24BFE6380[v0] - 12))(542721880, 2418844588, 3437665148);
}

void sub_206848B14()
{
  JUMPOUT(0x206848AB4);
}

uint64_t sub_206848B20(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6, int a7)
{
  int v7;
  unsigned int v8;
  uint64_t v9;
  uint64_t v10;
  unsigned int v11;
  unsigned int v12;
  unsigned int v13;
  int v14;
  int v15;
  int v16;

  v11 = ((a6 ^ v7) + 1859498991) & 0xDFABDD6A;
  *(_DWORD *)(v9 - 144) = HIWORD(*(_DWORD *)(v9 - 148)) ^ 0xFFFFFF98;
  v12 = HIBYTE(v8) ^ 0xFFFFFFD4;
  v13 = (v11 - 1317114167) * (a7 ^ 0x25FFBF9E) - ((102 * (a7 ^ 0x25FFBF9E)) & 0x705F365E) - 1204839633;
  v14 = (v8 >> 8) ^ 0x28;
  v15 = (v13 >> 8) ^ 7;
  v16 = HIBYTE(v13) ^ 0x24;
  *(_DWORD *)(v9 - 192) = v15;
  *(_DWORD *)(v9 - 188) = v13 ^ 0xFFFFFFB3;
  *(_BYTE *)(v9 - 119) = v15;
  *(_BYTE *)(v9 - 130) = ((v11 - 55) * (a7 ^ 0x9E) - ((102 * (a7 ^ 0x9E)) & 0x5E) + 47) ^ 0xB3;
  *(_DWORD *)(v9 - 164) = v8 ^ 0x75;
  *(_DWORD *)(v9 - 160) = HIWORD(v8) ^ 0xFFFFFFE3;
  *(_BYTE *)(v9 - 122) = BYTE2(v8) ^ 0xE3;
  *(_WORD *)(v9 - 125) = -27492;
  *(_DWORD *)(v9 - 176) = v14;
  *(_DWORD *)(v9 - 172) = v12;
  *(_BYTE *)(v9 - 111) = v12;
  *(_DWORD *)(v9 - 184) = v16;
  *(_DWORD *)(v9 - 180) = HIWORD(v13) ^ 0xFFFFFFB3;
  *(_BYTE *)(v9 - 108) = BYTE2(v13) ^ 0xB3;
  *(_BYTE *)(v9 - 127) = v16;
  *(_BYTE *)(v9 - 116) = 109;
  *(_BYTE *)(v9 - 103) = v14;
  *(_BYTE *)(v9 - 114) = v8 ^ 0x75;
  *(_BYTE *)(v9 - 105) = 27;
  *(_BYTE *)(v9 - 113) = -92;
  return ((uint64_t (*)(void))(*(_QWORD *)(v10
                                        + 8
                                        * (int)(((2 * (((1317114193 - v11) | (v11 - 1317114193)) >> 31)) | (16 * (((1317114193 - v11) | (v11 - 1317114193)) >> 31))) ^ v11 & 0xA11E2402))
                            - 12))();
}

void sub_206848D40()
{
  JUMPOUT(0x206848CC0);
}

uint64_t sub_206848D5C(int a1)
{
  uint64_t v1;
  uint64_t v2;

  *(_BYTE *)(v1 - 125) = -99;
  return (*(uint64_t (**)(void))(v2 + 8 * ((a1 - 51) ^ 0xB)))();
}

void sub_206848E8C()
{
  JUMPOUT(0x206848E0CLL);
}

uint64_t sub_206848EA0(int a1, uint64_t a2, uint64_t a3, uint64_t a4, int a5, int a6, int a7)
{
  uint64_t v7;

  *(_DWORD *)(v7 - 200) = a7 - a6;
  *(_DWORD *)(v7 - 168) = (102 * (a5 ^ 0x5D4316E3)) & 0xD7272A0A;
  *(_BYTE *)(v7 - 125) = -98;
  *(_DWORD *)(v7 - 208) = a1 ^ 0x4F;
  *(_DWORD *)(v7 - 204) = 51 * (a5 ^ 0x5D4316E3) - 342649595;
  return ((uint64_t (*)(void))(qword_24BFE6380[(a1 - 20) ^ 0x53] - 8))();
}

void sub_2068490A4()
{
  JUMPOUT(0x206848F98);
}

uint64_t sub_2068490AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  uint64_t v6;
  int v7;
  char v8;
  int v9;

  v7 = 3 * (*(_DWORD *)(v6 - 208) ^ 0x19);
  v8 = BYTE1(*(_DWORD *)(v6 - 148)) ^ 0x51;
  v9 = *(_DWORD *)(v6 - 172);
  *(_DWORD *)(v6 - 168) = *(_DWORD *)(v6 - 204) - *(_DWORD *)(v6 - 168);
  *(_BYTE *)(v6 - 112) = *(_DWORD *)(v6 - 192);
  *(_BYTE *)(v6 - 121) = *(_DWORD *)(v6 - 156);
  *(_BYTE *)(v6 - 104) = v9;
  *(_DWORD *)(v6 - 156) = (v7 ^ 0x9131080E) & (102 * (a6 ^ 0x1243C4BE));
  *(_BYTE *)(v6 - 109) = 109;
  *(_BYTE *)(v6 - 123) = *(_DWORD *)(v6 - 188);
  *(_BYTE *)(v6 - 129) = *(_DWORD *)(v6 - 144);
  *(_BYTE *)(v6 - 107) = *(_DWORD *)(v6 - 164);
  *(_BYTE *)(v6 - 128) = 27;
  *(_BYTE *)(v6 - 131) = *(_DWORD *)(v6 - 180);
  *(_BYTE *)(v6 - 110) = v8;
  *(_BYTE *)(v6 - 126) = *(_DWORD *)(v6 - 176);
  *(_BYTE *)(v6 - 120) = *(_DWORD *)(v6 - 184);
  *(_BYTE *)(v6 - 106) = -92;
  *(_BYTE *)(v6 - 117) = -108;
  *(_BYTE *)(v6 - 118) = *(_DWORD *)(v6 - 152);
  *(_BYTE *)(v6 - 115) = *(_DWORD *)(v6 - 160);
  *(_BYTE *)(v6 - 132) = -100;
  return ((uint64_t (*)(_QWORD, uint64_t, _QWORD))(qword_24BFE6380[v7 ^ 0x13] - 4))(0, 2920467299, 0);
}

void sub_2068492A8()
{
  JUMPOUT(0x206849214);
}

uint64_t sub_2068492BC@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  *(_DWORD *)(v2 - 204) = v1 - *(_DWORD *)(v2 - 156);
  *(_BYTE *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD))(qword_24BFE6380[a1 ^ 0x60] - 12))(3061854389, 2290649225, 30, ((*(unsigned __int8 *)(v2 - 132) ^ 0x9C)+ 835548278+ (~(2 * (*(unsigned __int8 *)(v2 - 132) ^ 0x9C)) | 0xFFFFFF15)) ^ 0xF1002DE0);
}

void sub_206849444()
{
  JUMPOUT(0x2068493B4);
}

uint64_t sub_206849458(uint64_t a1, uint64_t a2, uint64_t a3, int a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23)
{
  int v23;
  uint64_t v24;
  unsigned int v25;

  *(_DWORD *)(v24 - 144) = (v25 >> 8) ^ 0x7A;
  *(_DWORD *)(v24 - 152) = v25 ^ 0x1F;
  *(_DWORD *)(v24 - 172) = (~(102 * (a4 ^ 0x8D937BD3)) | 0x4A397501) + 51 * (a4 ^ 0x8D937BD3) - 622639744;
  *(_BYTE *)(v24 - 132) = -98;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_24BFE6380[(v23 + 892537130) ^ 0x35330948 ^ (62 * (((14 - v23) | (v23 - 14)) >> 31))])(3817008664, 173, 346, 67378900, 33689389, 2138042366, 11, 2251337750, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23);
}

void sub_2068495EC()
{
  JUMPOUT(0x206849554);
}

uint64_t sub_206849604@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  int v5;

  *(_DWORD *)(v2 - 216) = v3;
  *(_DWORD *)(v2 - 156) = HIWORD(v3) ^ 0x2A;
  *(_DWORD *)(v2 - 208) = 51 * (a1 ^ 0x17854762) - ((102 * (a1 ^ 0x17854762)) & 0x7B52D61E) + v1 - 1112970542;
  *(_BYTE *)(v2 - 132) = -97;
  v4 = ((v1 + 1699986699) & 0x9AAC42FF ^ 0x821B4265)
     - 17 * ((((v1 + 1699986699) & 0x9AAC42FF ^ 0x821B4265) + 2112142803) / 0x11)
     + 2112142803;
  v5 = *(unsigned __int8 *)(v2 - 132 + (11 * (((2 * v4) & 0x32) + (v4 ^ 0x3DEEFB79)) + 1455108557) % 0x1E) ^ 0x9C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(qword_24BFE6380[(v1 - 42) ^ 0x2E] - 12))(4042322161, 1039072121, 50, 674590096, 173, (v5 - ((2 * v5) & 0x16A) - 498506571) ^ 0xF80C3578, 346, 1789215960);
}

void sub_2068497B0()
{
  JUMPOUT(0x206849720);
}

uint64_t sub_2068497C0(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, int a6)
{
  int v6;
  char v7;
  char v8;
  uint64_t v9;
  int v10;
  int v11;
  int v12;
  unsigned int v14;

  v10 = *(_DWORD *)(v9 - 172);
  v11 = *(_DWORD *)(v9 - 208);
  v12 = (v6 - 1832767578) & 0x6D3DD039;
  *(_BYTE *)(v9 - 118) = HIBYTE(*(_DWORD *)(v9 - 216)) ^ 0xC6;
  *(_BYTE *)(v9 - 129) = *(_DWORD *)(v9 - 156);
  *(_BYTE *)(v9 - 110) = *(_DWORD *)(v9 - 144);
  *(_BYTE *)(v9 - 121) = *(_DWORD *)(v9 - 152);
  *(_BYTE *)(v9 - 115) = BYTE2(v10) ^ 0x7F;
  *(_BYTE *)(v9 - 131) = (v12 + 13) ^ BYTE2(v11);
  *(_BYTE *)(v9 - 123) = v11 ^ 0x93;
  *(_BYTE *)(v9 - 132) = -100;
  v14 = 51 * (a6 ^ 0x571B738B) - ((102 * (a6 ^ 0x571B738B)) & 0xA5C537EC) + 1390582774;
  *(_BYTE *)(v9 - 117) = BYTE2(v14) ^ 0x7E;
  *(_BYTE *)(v9 - 126) = v8;
  *(_BYTE *)(v9 - 128) = BYTE1(v14) ^ 7;
  *(_BYTE *)(v9 - 109) = (51 * (a6 ^ 0x8B) - ((102 * (a6 ^ 0x8B)) & 0xEC) - 10) ^ 0x6A;
  *(_BYTE *)(v9 - 120) = HIBYTE(v11) ^ 0x21;
  *(_BYTE *)(v9 - 106) = HIBYTE(v14) ^ 0xCE;
  *(_BYTE *)(v9 - 104) = v7;
  *(_BYTE *)(v9 - 107) = v10 ^ 0xE3;
  *(_BYTE *)(v9 - 112) = BYTE1(v11) ^ 0xF7;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[v12 ^ 0x60u] - 12))(243418392, 173, 346, 2358261742);
}

void sub_2068499D8()
{
  JUMPOUT(0x20684995CLL);
}

uint64_t sub_2068499F0@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  *(_DWORD *)(v2 - 144) = 51 * (v1 ^ 0x44777784) - ((102 * (v1 ^ 0x44777784)) & 0xAA049A04) - 721269502;
  *(_BYTE *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_24BFE6380[a1])(173, 346, 1162243656, 2728605476, 4293916659, 998, 1050637, 2290649225);
}

void sub_206849B58()
{
  JUMPOUT(0x206849AD8);
}

uint64_t sub_206849B70(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28)
{
  int v28;
  int v29;
  uint64_t v30;
  unsigned int v31;

  v31 = *(_DWORD *)(v30 - 144);
  *(_DWORD *)(v30 - 152) = v31 ^ 0xFFFFFF9E;
  *(_DWORD *)(v30 - 176) = 51 * (v29 ^ 0x8B7DE13A) - 1871229785 - (((v28 + 42) * (v29 ^ 0x8B7DE13A)) & 0x20EE994E);
  *(_BYTE *)(v30 - 132) = -98;
  *(_DWORD *)(v30 - 156) = HIWORD(v31) ^ 0xFFFFFF9E;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_24BFE6380[(v28 - 51) ^ 0x35])(4042322161, 11, 3200090619, 22, 1014, 1094876677, 2290649225, 30, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28);
}

void sub_206849D44()
{
  JUMPOUT(0x206849C64);
}

uint64_t sub_206849D4C@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;
  uint64_t v3;

  *(_BYTE *)(v2 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * (v1 - a1 - 191)) - 12))(58, 1106151568, 173, 346, 2202601728, 3248784512, 11, 1053838113);
}

void sub_206849EC4()
{
  JUMPOUT(0x206849E44);
}

uint64_t sub_206849ED0@<X0>(unsigned int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15)
{
  char v15;
  char v16;
  char v17;
  int v18;
  int v19;
  uint64_t v20;
  uint64_t v21;
  char v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  unsigned int v26;

  v22 = HIBYTE(*(_DWORD *)(v20 - 144)) ^ 0x49;
  v23 = *(_DWORD *)(v20 - 176);
  *(_DWORD *)(v20 - 212) = v19;
  *(_BYTE *)(v20 - 112) = v19 ^ 0xBD;
  *(_BYTE *)(v20 - 129) = v16;
  v24 = 51 * (v18 ^ 0x9E2F59DB) - ((102 * (v18 ^ 0x9E2F59DB)) & 0xF628FBD8) - 82543124;
  *(_BYTE *)(v20 - 131) = BYTE1(v19) ^ 0x25;
  *(_BYTE *)(v20 - 123) = v15;
  *(_BYTE *)(v20 - 110) = *(_DWORD *)(v20 - 152);
  *(_BYTE *)(v20 - 120) = BYTE2(v19) ^ 0x80;
  *(_BYTE *)(v20 - 126) = v23 ^ 0x3B;
  *(_BYTE *)(v20 - 128) = v24 ^ 0x70;
  *(_BYTE *)(v20 - 117) = BYTE1(v24) ^ 0xE1;
  *(_BYTE *)(v20 - 104) = v17;
  *(_BYTE *)(v20 - 118) = *(_DWORD *)(v20 - 156);
  *(_BYTE *)(v20 - 132) = -100;
  *(_BYTE *)(v20 - 115) = BYTE1(v23) ^ 0xD0;
  v25 = ((v24 >> 15) | 0xFFFFFFF9) - (HIWORD(v24) & 3) + 532232595;
  v26 = ((v25 & 5) - 1828536161 + (v25 & 0x1A ^ 0x8100403)) ^ 0x9B12C4AE | ((HIWORD(v24) & 0x78 ^ 0xA818B26B)
                                                                          + (HIWORD(v24) & 0x84 ^ 0x10040405)
                                                                          - 2) ^ 0xB81CB67A;
  *(_BYTE *)(v20 - 107) = v22;
  *(_BYTE *)(v20 - 109) = HIBYTE(v19) ^ 0x58;
  *(_BYTE *)(v20 - 106) = (v26 - ((2 * v26) & 0xF6) + 123) ^ 0xE7;
  return (*(uint64_t (**)(_QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(v21 + 8 * a1))(((a1 - 25) | 0x41) ^ 0xFF57BF4D, 556, 11026666, 2290649225, 30, 2356836256, 173, 346, a2, a3, a4, a5, a6, a7, a8, a9, a10, a11, a12,
           a13,
           a14,
           a15);
}

void sub_20684A16C()
{
  JUMPOUT(0x20684A0F0);
}

uint64_t sub_20684A184()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;

  *(_BYTE *)(v2 - 132) = -99;
  v3 = 51 * (v1 ^ 0x263D7C0D) + 842822710 - ((102 * (v1 ^ 0x263D7C0D)) & 0x6479051E) + 3673;
  *(_DWORD *)(v2 - 152) = v3;
  *(_DWORD *)(v2 - 156) = v3 >> (v0 - 75);
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[(v0 - 62) ^ 0x46] - 4))(2403821612, 11, 3094871519, 22, 958, 1200095777, 2290649225, 30);
}

void sub_20684A360()
{
  JUMPOUT(0x20684A27CLL);
}

uint64_t sub_20684A368()
{
  int v0;
  int v1;
  uint64_t v2;
  unsigned int v3;
  unsigned int v4;
  unsigned int v5;
  unsigned int v6;
  unint64_t v7;
  int v8;

  *(_DWORD *)(v2 - 156) ^= 0xFFFFFFA0;
  *(_DWORD *)(v2 - 160) = HIBYTE(*(_DWORD *)(v2 - 152)) ^ 0xFFFFFFAE;
  v3 = 51 * (v0 ^ 0xA8336D92) - ((102 * (v0 ^ 0xA8336D92)) & 0x1FF534DC) + 268081774;
  *(_DWORD *)(v2 - 180) = v3;
  *(_DWORD *)(v2 - 164) = HIBYTE(v3) ^ 0xFFFFFF93;
  *(_BYTE *)(v2 - 132) = -98;
  v4 = (((v1 - 15) | 0x10) - 879915686) ^ 0xD9B9DBF3;
  v5 = 173 * v4 - ((346 * v4) & 0x7F6BE274) + 1068888378;
  v6 = ((2834432 * v4 - ((5668864 * v4) & 0xABE90000) + 1442101372) & 0xC0000000 | (v5 >> 18)) ^ 0x40000FED;
  HIDWORD(v7) = (v5 >> 18) ^ 0xFED;
  LODWORD(v7) = (v6 - ((2 * v6) & 0x8000661A) - 197266675) ^ 0xF43DE000;
  v8 = (v7 >> 13) - ((2 * (v7 >> 13)) & 0xB834AD0E) + 1545229959;
  HIDWORD(v7) = v8 ^ 0x5687;
  LODWORD(v7) = v8 ^ 0x5C1A0000;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))qword_24BFE6380[v1])(1545229959, 22151, ((*(unsigned __int8 *)(v2 - 132) ^ 0x9C) - ((2 * (*(unsigned __int8 *)(v2 - 132) ^ 0x9C)) & 0xBC) - 2051697058) ^ v5 ^ ((v7 >> 17) - ((2 * (v7 >> 17)) & 0xE31BD5DE) + 1905126127), 1545207808, 3810252254, 2884173824, 1905126127);
}

void sub_20684A5A8()
{
  JUMPOUT(0x20684A468);
}

uint64_t sub_20684A5B8(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29)
{
  int v29;
  uint64_t v30;

  HIDWORD(a29) = HIBYTE(*(_DWORD *)(v30 - 204));
  *(_BYTE *)(v30 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[v29] - 8))(836286099, 2290649225, 30, 3368429321, 173, 346, 3933801108, 1966900554, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29);
}

void sub_20684A728()
{
  JUMPOUT(0x20684A6A0);
}

uint64_t sub_20684A73C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18)
{
  int v18;
  char v19;
  __int16 v20;
  int v21;
  uint64_t v22;
  unsigned int v23;
  char v24;
  __int16 v25;

  v23 = *(_DWORD *)(v22 - 180);
  v24 = BYTE1(*(_DWORD *)(v22 - 152)) ^ 0x1E;
  LODWORD(a18) = v21;
  v25 = 51 * (v20 ^ 0x449D) - ((102 * (v20 ^ 0x449D)) & 0xAEA8) + 22356;
  *(_BYTE *)(v22 - 104) = BYTE1(v23) ^ 6;
  *(_BYTE *)(v22 - 118) = v24;
  *(_BYTE *)(v22 - 129) = v19;
  *(_BYTE *)(v22 - 112) = *(_DWORD *)(v22 - 164);
  *(_BYTE *)(v22 - 131) = v21 ^ 0x1D;
  *(_BYTE *)(v22 - 120) = BYTE1(v21) ^ 0xC4;
  *(_BYTE *)(v22 - 109) = BYTE2(v21) ^ 0x91;
  *(_BYTE *)(v22 - 132) = -100;
  *(_BYTE *)(v22 - 117) = v25 ^ 0xC8;
  *(_BYTE *)(v22 - 106) = HIBYTE(v25) ^ 0xCB;
  *(_BYTE *)(v22 - 107) = *(_DWORD *)(v22 - 156);
  *(_BYTE *)(v22 - 126) = *(_DWORD *)(v22 - 160);
  *(_BYTE *)(v22 - 115) = v23 ^ 0xF2;
  *(_BYTE *)(v22 - 128) = HIBYTE(v21) ^ 0xFB;
  *(_BYTE *)(v22 - 123) = ((((BYTE2(v23) & 0x25 ^ 0xFA) - ((2 * (BYTE2(v23) & 0x25 ^ 0xFA)) & 0xC) - 122) ^ 0x86) & (((~HIWORD(v23) | 0x25) + ((2 * (BYTE2(v23) & 0x1A ^ (~HIWORD(v23) | 0x7D))) ^ 0x39) - 99) ^ 0x9C))
                        - ((2
                          * ((((BYTE2(v23) & 0x25 ^ 0xFA) - ((2 * (BYTE2(v23) & 0x25 ^ 0xFA)) & 0xC) - 122) ^ 0x86) & (((~HIWORD(v23) | 0x25) + ((2 * (BYTE2(v23) & 0x1A ^ (~HIWORD(v23) | 0x7D))) ^ 0x39) - 99) ^ 0x9C))) & 0x38)
                        - 100;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[v18] - 4))(3593275373, 2290649225, 30, 1610259001, 50, 4160579056, 1353244970, 173, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18);
}

void sub_20684A9E8()
{
  JUMPOUT(0x20684A924);
}

uint64_t sub_20684A9F8@<X0>(int a1@<W8>)
{
  int v1;
  uint64_t v2;

  *(_DWORD *)(v2 - 156) = 51 * (v1 ^ 0x6DEF0EF) - ((102 * (v1 ^ 0x6DEF0EF)) & 0xF53BAC3C) + 2057164318;
  *(_BYTE *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_24BFE6380[a1])(238, 270143881, 1927249119, 2367718177, 250797320, 173, 346, 1221341732);
}

void sub_20684AB80()
{
  JUMPOUT(0x20684AACCLL);
}

uint64_t sub_20684AB98()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 - 184) = 51 * ((v0 + 1593112631) ^ v1) - ((102 * ((v0 + 1593112631) ^ v1)) & 0x5EB8676A) + 794571701;
  *(_BYTE *)(v2 - 132) = -98;
  *(_DWORD *)(v2 - 160) = HIBYTE(*(_DWORD *)(v2 - 156)) ^ 0xFFFFFFE6;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * ((v0 - 34) ^ 0x22)) - 4))(3152490459, 950, 1748344822, ((*(unsigned __int8 *)(v2 - 132) ^ 0x9C) - ((2 * (*(unsigned __int8 *)(v2 - 132) ^ 0x9C)) & 0x9E) + 1844856399) ^ 0x57A2ABF3u, 173, 346, 905520786, 452760393);
}

void sub_20684AD18()
{
  JUMPOUT(0x20684AC8CLL);
}

uint64_t sub_20684AD2C@<X0>(int a1@<W8>)
{
  uint64_t v1;
  unsigned int v2;
  int v3;

  *(_BYTE *)(v1 - 132) = -97;
  v2 = (0 % ((a1 + 18) ^ 0xBu) - 1674579545 - 2 * ((0 % ((a1 + 18) ^ 0xBu)) & 7)) ^ 0x9C2FF1A7;
  v3 = *(unsigned __int8 *)(v1 - 132 + (((22 * v2) & 0x17BA) + ((11 * v2) ^ 0x5BBC7BDD) - 1539079133) % 0x1E) ^ 0x9C;
  return ((uint64_t (*)(uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t))qword_24BFE6380[a1])(22, 6074, (v3 - ((2 * v3) & 0xF6) + 804201339) ^ 0x3D6B5175u, 2755888163, 2290649225, 30);
}

void sub_20684AEA4()
{
  JUMPOUT(0x20684AE0CLL);
}

uint64_t sub_20684AEB0(uint64_t a1, uint64_t a2, char a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,int a35,char a36,char a37,char a38,char a39,char a40)
{
  char v40;
  char v41;
  char v42;
  char v43;
  int v44;
  uint64_t v45;
  int v46;
  unsigned int v47;
  char v48;
  unsigned int v49;
  unint64_t v50;
  int v51;
  uint64_t (*v52)(uint64_t, uint64_t, _QWORD, _QWORD);

  v46 = *(_DWORD *)(v45 - 184);
  v47 = (v44 + 1731100093) & 0xBAFBFA7F;
  v48 = *(_DWORD *)(v45 - 156) ^ 0x82;
  *(_BYTE *)(v45 - 107) = v41;
  *(_BYTE *)(v45 - 104) = v43;
  *(_BYTE *)(v45 - 132) = -100;
  *(_BYTE *)(v45 - 118) = v48;
  *(_BYTE *)(v45 - 120) = a40 ^ 0x9C;
  *(_BYTE *)(v45 - 131) = (v44 - 67) & 0x7F ^ HIBYTE(v46) ^ 0xE4;
  *(_BYTE *)(v45 - 126) = v42;
  *(_BYTE *)(v45 - 109) = a37 ^ 0x5D;
  *(_BYTE *)(v45 - 115) = *(_DWORD *)(v45 - 160);
  *(_BYTE *)(v45 - 117) = a39 ^ 0xB3;
  *(_BYTE *)(v45 - 112) = BYTE2(v46) ^ 0xC0;
  *(_BYTE *)(v45 - 123) = v40;
  *(_BYTE *)(v45 - 128) = a38 ^ 0x92;
  *(_BYTE *)(v45 - 106) = (51 * (a3 ^ 0x48) - ((102 * (a3 ^ 0x48)) & 0x86) + 67) ^ 0xDF;
  v49 = 305419896 * ((v47 + 1375048790) & 0x8BDFF37F | 0x80) + 1597465181;
  HIDWORD(v50) = v49 ^ HIWORD(v49) ^ 0x5BD420A ^ ((*(unsigned __int8 *)(v45 - 132) ^ 0x9C)
                                                - ((2 * (*(unsigned __int8 *)(v45 - 132) ^ 0x9C)) & 0x158)
                                                + 74849708);
  LODWORD(v50) = v49 ^ 0xE0000000;
  v51 = (v50 >> 27) + 1878956032 - ((2 * (v50 >> 27)) & 0xDFFD3018) + 12;
  HIDWORD(v50) = v51 ^ 0xC;
  LODWORD(v50) = v51 ^ 0x6FFE9800;
  v52 = (uint64_t (*)(uint64_t, uint64_t, _QWORD, _QWORD))(qword_24BFE6380[(116
                                                                                  * ((((573208630 - v47) | (v47 - 573208630)) & 0x80000000) == 0)) ^ (v47 - 573208637)]
                                                                 - 8);
  return v52(237417256, 116, (v50 >> 5) - 2028775020 - ((2 * (v50 >> 5)) & 0xE26B328), v52);
}

uint64_t sub_20684B1BC(uint64_t a1, uint64_t a2, int a3)
{
  int v3;
  int v4;
  uint64_t v5;
  unsigned int v6;

  v6 = (v4 + 438140990) & 0xE5E27FBD;
  *(_DWORD *)(v5 - 160) = (v6 ^ 0x1A) * (a3 ^ v3) - ((102 * (a3 ^ v3)) & 0xF743F884) + 2074213442;
  *(_BYTE *)(v5 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))qword_24BFE6380[v6 ^ 4])(156, 116, 2981610810, 3151373375, 173, 346, 515132872, 2405050084);
}

void sub_20684B3AC()
{
  JUMPOUT(0x20684B2ACLL);
}

uint64_t sub_20684B3B4()
{
  int v0;
  uint64_t v1;
  int v2;
  int v3;

  *(_DWORD *)(v1 - 188) = 51 * (v2 ^ 0x3EED6C84) - ((102 * (v2 ^ 0x3EED6C84)) & 0x80D3FD6E) - 1066795337;
  *(_BYTE *)(v1 - 132) = -98;
  v3 = *(unsigned __int8 *)(v1 - 132 + (((v0 - 2) ^ 0x80000080) + 2147483454) % 0x1E) ^ 0x9C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t))(qword_24BFE6380[(v0 - 12) ^ 0x7C] - 4))(4042322161, 374, 187, 636, 2290649225, 30, (v3 - ((2 * v3) & 0x77777777) - 769429317) ^ 0xC8795D1D, 4258265189);
}

void sub_20684B520()
{
  JUMPOUT(0x20684B488);
}

uint64_t sub_20684B538(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34)
{
  int v34;
  uint64_t v35;
  uint64_t v36;

  *(_BYTE *)(v35 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v36 + 8 * v34) - 4))(54, 11, 3313945495, 2290649225, 30, 345743661, 173, 346, a9, a10, a11, a12, a13, a14, a15, a16, a17, a18, a19,
           a20,
           a21,
           a22,
           a23,
           a24,
           a25,
           a26,
           a27,
           a28,
           a29,
           a30,
           a31,
           a32,
           a33,
           a34);
}

void sub_20684B684()
{
  JUMPOUT(0x20684B60CLL);
}

uint64_t sub_20684B690@<X0>(int a1@<W8>, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, uint64_t a12, uint64_t a13, uint64_t a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,char a28,char a29,char a30,char a31)
{
  char v31;
  int v32;
  char v33;
  char v34;
  char v35;
  char v36;
  uint64_t v37;
  int v38;
  char v39;
  int v40;

  v38 = *(_DWORD *)(v37 - 188);
  v39 = *(_DWORD *)(v37 - 160) ^ 0xDE;
  *(_BYTE *)(v37 - 104) = v31;
  *(_BYTE *)(v37 - 109) = a28 ^ 0xD8;
  *(_BYTE *)(v37 - 123) = v36;
  *(_BYTE *)(v37 - 106) = a31 ^ 0xAA;
  *(_BYTE *)(v37 - 128) = a29 ^ 0x48;
  *(_BYTE *)(v37 - 126) = v33;
  *(_BYTE *)(v37 - 115) = v35;
  *(_BYTE *)(v37 - 107) = v39;
  *(_BYTE *)(v37 - 117) = a30 ^ 0xFA;
  *(_BYTE *)(v37 - 132) = -100;
  *(_BYTE *)(v37 - 131) = v34;
  *(_BYTE *)(v37 - 112) = BYTE1(v38) ^ 0x62;
  *(_BYTE *)(v37 - 120) = HIBYTE(v38) ^ 0x5C;
  v40 = *(unsigned __int8 *)(v37
                           - 132
                           + (11
                            * (((2 * a1 - 82 - 34 * ((a1 - 41) / 0x11u)) & 0x32) + (((a1 - 41) % 0x11u) ^ 0xBF65DE99))
                            - 962629779)
                           % 0x1E) ^ 0x9C;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD))qword_24BFE6380[v32])(34, 902018255, 173, 346, 2142193898, 1071096949, 3211124377, (v40 - ((2 * v40) & 0xDE) + 1137249391) ^ 0x7289B9E4u);
}

void sub_20684B83C()
{
  JUMPOUT(0x20684B7BCLL);
}

uint64_t sub_20684B850@<X0>(int a1@<W7>, int a2@<W8>)
{
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 - 164) = 51 * (a1 ^ 0x7C1E97CD) - ((102 * (a1 ^ 0x7C1E97CD)) & 0x2AA1F69E) + 357628751;
  *(_BYTE *)(v2 - 132) = -99;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v3 + 8 * a2) - 8))(1754236522, 2290649225, 30);
}

void sub_20684B9A0()
{
  JUMPOUT(0x20684B914);
}

uint64_t sub_20684B9B0()
{
  int v0;
  int v1;
  uint64_t v2;
  uint64_t v3;

  *(_DWORD *)(v2 - 192) = (~(102 * (v1 ^ 0x40E0228D)) | 0x46DD9991) + 51 * (v1 ^ 0x40E0228D) - 594463944;
  *(_BYTE *)(v2 - 132) = -98;
  return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t))(v3 + 8 * v0))(22, 3950, 2889941065, ((*(unsigned __int8 *)(v2 - 132) ^ 0x9C)- ((2 * (*(unsigned __int8 *)(v2 - 132) ^ 0x9C)) & 0x66666666)+ 2092378931) ^ 0x49B6FC28u, 2290649225, 30);
}

void sub_20684BB30()
{
  JUMPOUT(0x20684BA9CLL);
}

uint64_t sub_20684BB44()
{
  int v0;
  uint64_t v1;

  *(_BYTE *)(v1 - 132) = -97;
  return ((uint64_t (*)(uint64_t))qword_24BFE6380[v0])(4042322161);
}

void sub_20684BD00()
{
  JUMPOUT(0x20684BC64);
}

uint64_t sub_20684BD18(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, int a7, uint64_t a8, uint64_t a9, uint64_t a10, int a11, char a12, __int16 a13, char a14, uint64_t a15, uint64_t a16, uint64_t a17, uint64_t a18, uint64_t a19, uint64_t a20,uint64_t a21,uint64_t a22,uint64_t a23,uint64_t a24,uint64_t a25,uint64_t a26,uint64_t a27,uint64_t a28,uint64_t a29,uint64_t a30,uint64_t a31,uint64_t a32,uint64_t a33,uint64_t a34,uint64_t a35,int a36,char a37,char a38,char a39)
{
  int v39;
  uint64_t v40;
  int v41;
  int v42;

  v41 = *(_DWORD *)(v40 - 164);
  v42 = *(_DWORD *)(v40 - 192);
  HIDWORD(a10) = 51 * (a7 ^ 0x9525EFA1) - 1847947522;
  *(_BYTE *)(v40 - 104) = a14;
  *(_BYTE *)(v40 - 109) = a10;
  *(_BYTE *)(v40 - 115) = BYTE4(a9);
  *(_BYTE *)(v40 - 131) = BYTE1(v42) ^ 0xAF;
  *(_BYTE *)(v40 - 123) = HIBYTE(v41) ^ 0x89;
  *(_BYTE *)(v40 - 126) = v41 ^ 0xD3;
  *(_BYTE *)(v40 - 112) = a12;
  *(_BYTE *)(v40 - 117) = a38 ^ 0xDA;
  *(_BYTE *)(v40 - 120) = BYTE2(v42) ^ 0xD;
  *(_BYTE *)(v40 - 106) = a39 ^ 0x1F;
  *(_BYTE *)(v40 - 132) = -100;
  *(_BYTE *)(v40 - 128) = a37 ^ 0x40;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[v39] - 12))(22, 14316, 2536047626, 2290649225, 30, 1240431451, 173, 346, a9, a10);
}

void sub_20684BF08()
{
  JUMPOUT(0x20684BE6CLL);
}

uint64_t sub_20684BF1C(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11)
{
  int v11;
  int v12;
  uint64_t v13;
  uint64_t v14;
  unsigned int v15;

  LODWORD(a10) = (102 * (v12 ^ 0x5D86027C)) & 0xCFE0EC6A;
  HIDWORD(a9) = 51 * (v12 ^ 0x5D86027C) - 403671499;
  *(_BYTE *)(v13 - 132) = -99;
  v15 = 173 * (((v11 ^ 7) + 2144877) ^ 0x1214ECB8)
      - ((346 * (((v11 ^ 7) + 2144877) ^ 0x1214ECB8)) & 0x5C366E6E)
      - 1373948105;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, _QWORD, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(v14 + 8 * ((v11 ^ 7) - 72)) - 12))(1547071086, 2921019191, 11, 1558879547, 22, v15 ^ HIWORD(v15) ^ ((*(unsigned __int8 *)(v13 - 132) ^ 0x9C)- ((2 * (*(unsigned __int8 *)(v13 - 132) ^ 0x9C)) & 0x11A)- 185298291), 2736087749, 2290649225, a9, a10, a11);
}

void sub_20684C094()
{
  JUMPOUT(0x20684C000);
}

uint64_t sub_20684C0AC(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8, uint64_t a9, uint64_t a10, uint64_t a11, int a12)
{
  uint64_t v12;

  *(_BYTE *)(v12 - 132) = -98;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t))(qword_24BFE6380[(a12 + 47) | 1] - 8))(3403567304, 1042316814, 1284643429);
}

void sub_20684C360()
{
  JUMPOUT(0x20684C244);
}

uint64_t sub_20684C370(uint64_t a1, uint64_t a2, uint64_t a3, int a4)
{
  int v4;
  uint64_t v5;
  uint64_t v7;

  HIDWORD(v7) = (102 * (v4 ^ 0x27957438)) & 0xE6C8C57C;
  LODWORD(v7) = 51 * (v4 ^ 0x27957438) - 211524930;
  *(_BYTE *)(v5 - 132) = -97;
  return ((uint64_t (*)(uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t, uint64_t))(qword_24BFE6380[a4 - 65] - 4))(11, 960493298, 22, 3556, 3334473998, 2290649225, 30, 2060393137, v7);
}

void sub_20684C4F4()
{
  JUMPOUT(0x20684C458);
}

uint64_t sub_20684C50C()
{
  int v0;
  uint64_t v1;
  unsigned int v2;
  unsigned int v3;
  int v4;
  int v5;
  unsigned int v6;
  unsigned int v7;
  unsigned int v8;
  int v9;
  unsigned int v10;
  int v11;
  unsigned int v12;
  unsigned int v13;
  unsigned int v14;
  unsigned int v15;
  int v16;
  unsigned int v17;
  unsigned int v18;
  unsigned int v19;
  int v20;
  int v21;
  unsigned int v22;
  int v23;
  unsigned int v24;
  unsigned int v25;
  int v26;
  unsigned int v27;
  unsigned int v28;
  unsigned int v29;
  unsigned int v30;
  unsigned int v31;
  int v32;
  unsigned int v33;
  unsigned int v34;
  unint64_t v35;
  int v36;
  int v37;
  int v38;
  int v39;
  unsigned int v40;
  unsigned int v41;
  unsigned int v42;
  unsigned int v43;
  int v44;
  unsigned int v45;
  unsigned int v46;
  unsigned int v47;
  unsigned int v48;
  unsigned int v49;
  unsigned int v50;
  unsigned int v51;
  unsigned int v52;
  unsigned int v53;
  int v54;
  unsigned int v55;
  unsigned int v56;
  unsigned int v57;
  unsigned int v58;
  unsigned int v59;
  unsigned int v60;
  unsigned int v61;
  unsigned int v62;
  int v63;
  unsigned int v64;
  unsigned int v65;
  unsigned int v66;
  unsigned int v67;
  unsigned int v68;
  unsigned int v69;
  unsigned int v70;
  unsigned int v71;
  int v72;
  unsigned int v73;
  int v74;
  int v75;
  unsigned int v76;
  unsigned int v77;
  unsigned int v78;
  unsigned int v79;
  int v80;
  unsigned int v81;
  unsigned int v82;
  unsigned int v83;
  unsigned int v84;
  int v85;
  int v86;
  unsigned int v87;
  int v88;
  int v89;
  int v90;
  int v91;
  int v92;
  int v93;
  int v94;
  unsigned int v95;
  int v96;
  unint64_t v97;
  int v98;
  unsigned int v99;
  int v100;
  unsigned int v101;
  int v102;
  unsigned int v103;
  unsigned int v104;
  int v105;
  int v106;
  int v107;
  unsigned int v108;
  unsigned int v109;
  unsigned int v110;
  unsigned int v111;
  int v112;
  int v113;
  int v114;
  unsigned int v115;
  unsigned int v116;
  int v117;
  unsigned int v118;
  int v119;
  unsigned int v120;
  unsigned int v121;
  int v122;
  unsigned int v123;
  unsigned int v124;
  unsigned int v125;
  int v126;
  int v127;
  int v128;
  int v129;
  int v130;
  unsigned int v131;
  unsigned int v132;
  int v133;
  unsigned int v134;
  unsigned int v135;
  unsigned int v136;
  int v137;
  unsigned int v138;
  int v139;
  unsigned int v140;
  unsigned int v141;
  int v142;
  int v143;
  int v144;
  unsigned int v145;
  unsigned int v146;
  unsigned int v147;
  unsigned int v148;
  int v149;
  int v150;
  unsigned int v151;
  unsigned int v152;
  unsigned int v153;
  int v154;
  unsigned int v155;
  int v156;
  unsigned int v157;
  unsigned int v158;
  unsigned int v159;
  int v160;
  int v161;
  unsigned int v162;
  unsigned int v163;
  unsigned int v164;
  unsigned int v165;
  int v166;
  int v167;
  unsigned int v168;
  unsigned int v169;
  int v170;
  int v171;
  unsigned int v172;
  unsigned int v173;
  unsigned int v174;
  unsigned int v175;
  unsigned int v176;
  int v177;
  unsigned int v178;
  unsigned int v179;
  unsigned int v180;
  int v181;
  unsigned int v182;
  unsigned int v183;
  unsigned int v184;
  unsigned int v185;
  unsigned int v186;
  unsigned int v187;
  unsigned int v188;
  unsigned int v189;
  unsigned int v190;
  unsigned int v191;
  int v192;
  int v193;
  int v194;
  int v195;
  int v196;
  int v197;
  unsigned int v198;
  unsigned int v199;
  int v200;
  int v201;
  int v202;
  unsigned int v203;
  int v204;
  int v205;
  int v206;
  unsigned int v207;
  int v208;
  int v209;
  unsigned int v210;
  unsigned int v211;
  unsigned int v212;
  unsigned int v213;
  int v214;
  int v215;
  unsigned int v216;
  unsigned int v217;
  unsigned int v218;
  unsigned int v219;
  int v220;
  unsigned int v221;
  unsigned int v222;
  unsigned int v223;
  unsigned int v224;
  int v225;
  unsigned int v226;
  unsigned int v227;
  unsigned int v228;
  int v229;
  unsigned int v230;
  int v231;
  unsigned int v232;
  unsigned int v233;
  unsigned int v234;
  unsigned int v235;
  unsigned int v236;
  unsigned int v237;
  unsigned int v238;
  int v239;
  unsigned int v240;
  int v241;
  int v242;
  unsigned int v243;
  unsigned int v244;
  int v245;
  unsigned int v246;
  unsigned int v247;
  int v248;
  int v249;
  unsigned int v250;
  int v251;
  unsigned int v252;
  unsigned int v253;
  unsigned int v254;
  int v255;
  unsigned int v256;
  int v257;
  int v258;
  unsigned int v259;
  int v260;
  unsigned int v261;
  unsigned int v262;
  unsigned int v263;
  unsigned int v264;
  unsigned int v265;
  unsigned int v266;
  int v267;
  int v268;
  unsigned int v269;
  int v270;
  int v271;
  int v272;
  int v273;
  unsigned int v274;
  int v275;
  unsigned int v276;
  unsigned int v277;
  int v278;
  int v279;
  unsigned int v280;
  unsigned int v281;
  unsigned int v282;
  int v283;
  unsigned int v284;
  unsigned int v285;
  unsigned int v286;
  int v287;
  unsigned int v288;
  unsigned int v289;
  unsigned int v290;
  int v291;
  unsigned int v292;
  int v293;
  unsigned int v294;
  unsigned int v295;
  int v296;
  unsigned int v297;
  unsigned int v298;
  int v299;
  unsigned int v300;
  unsigned int v301;
  unsigned __int8 v302;
  char v303;
  unsigned int v304;
  unsigned int v305;
  unsigned int v306;
  unsigned int v307;
  int v308;
  char v309;
  int v310;
  char v311;
  unsigned int v312;
  int v313;
  int v314;
  int v315;
  BOOL v317;
  int v318;
  BOOL v319;
  unsigned int v320;
  unsigned int v321;
  BOOL v322;
  unsigned int v323;
  int v324;
  int v325;
  int v326;
  int v327;
  unsigned int v328;
  int v329;
  int v330;
  int v331;
  int v332;
  unsigned int v333;
  char v334;
  int v335;
  unsigned __int8 v336;
  int v337;
  int v338;
  BOOL v340;
  int v341;
  int v342;
  unsigned int v343;
  int v344;
  int v345;
  char v346;
  int v347;
  int v348;
  unsigned int v349;
  unsigned int v350;
  int v351;
  unint64_t v352;
  int v353;
  int v354;
  int v355;
  unsigned int v356;
  unsigned int v357;
  unsigned int v358;
  unsigned int v359;
  unsigned int v360;
  int v361;
  int v362;
  unsigned int v363;
  unsigned int v364;
  unsigned int v365;
  unsigned int v366;
  int v367;
  int v368;
  char v369;
  int v370;
  int v371;
  int v372;
  int v373;
  unsigned int v374;
  int v375;
  unsigned int v376;
  int v377;
  unsigned int v378;
  unsigned int v379;
  unsigned int v380;
  unsigned int v381;
  int v382;
  char v383;
  int v384;
  unsigned int v385;
  unsigned int v386;
  int v387;
  int v388;
  int v389;
  int v390;
  unsigned int v391;
  unsigned int v392;
  unsigned int v393;
  unsigned int v394;
  unsigned int v395;
  unsigned int v396;
  unsigned int v397;
  unsigned int v398;
  char v399;
  int v400;
  int v401;
  unsigned int v402;
  int v403;
  int v404;
  int v405;
  int v406;
  BOOL v407;
  char v408;
  BOOL v410;
  int v411;
  int v428;
  int v429;
  uint64_t result;
  int v431;
  int v432;
  int v433;
  int v434;
  int v435;
  int v436;
  int v437;
  int v438;
  unsigned int v439;
  int v440;
  unsigned int v441;
  int v442;
  int v443;
  int v444;
  int v445;
  int v446;
  int v447;
  int v448;
  int v449;
  int v450;
  unsigned int v451;
  int v452;
  int v453;
  int v454;
  int v455;
  int v456;
  int v457;
  int v458;
  int v459;
  int v460;
  int v461;
  int v462;
  int v463;
  unsigned int v464;
  int v465;
  int v466;
  int v467;
  int v468;
  int v469;
  unsigned int v470;
  int v471;
  int v472;
  int v473;
  int v474;
  unsigned int v475;
  int v476;
  int v477;
  int v478;
  unsigned int v479;
  int v480;
  int v481;
  int v482;
  unsigned int v483;
  int v484;
  int v485;
  unsigned int v486;
  int v487;
  int v488;
  int v489;
  int v490;
  char v491;
  int v492;
  int v493;
  char v494;
  unsigned int v495;
  int v496;
  int v497;
  int v498;
  char v499;
  uint64_t v500;
  int v501;
  int v502;
  int v503;
  int v504;
  int v505;
  unsigned int v506;
  int v507;
  int v508;
  int v509;
  int v510;
  int v511;
  int v512;
  unsigned int v513;
  int v514;

  v437 = v434 - v436;
  v435 = v431 - v432;
  v2 = v442 - ((2 * v442) & 0x58) + 930368300;
  v3 = 51 * (v0 ^ 0xCF97AAAF) - ((102 * (v0 ^ 0xCF97AAAF)) & 0x3FD24F7C) - 1612109890;
  v4 = (((v469 - ((2 * v469) & 0x172)) << 16) + 884539392) ^ 0x34B90000;
  v5 = (((v508 - ((2 * v508) & 0x4C)) << 8) + 1647257088) ^ 0x622F2600;
  v6 = (v5 - ((2 * v5) & 0x767DA400) + 993972848) ^ 0x3B3ED270 | (v4 - ((2 * v4) & 0x61CE0000) - 253278827) ^ 0xF0E74595;
  v7 = (v6 - 109409940 + (~(2 * v6) | 0x8D0AED27) + 1) ^ 0xF97A896C | (v484 - ((2 * v484) & 0xFFFFFFFB) + 2122065661) ^ 0x7E7C26FD;
  v8 = v7 - ((2 * v7) & 0x1FA826);
  v9 = (((v444 - ((2 * v444) & 0x1D2)) << 16) + 1391001600) ^ 0x52E90000;
  v10 = (((v446 - ((2 * v446) & 0xB6)) << 8) - 509781248) ^ 0xE19D5B00;
  v11 = (v10 - ((2 * v10) & 0x271C2600) + 328078220) ^ 0x138E138C | (v9 - ((2 * v9) & 0x71280000) + 949232305) ^ 0x389422B1;
  v12 = (v11 - ((2 * v11) & 0x78CB6652) + 1013297961) ^ 0x3C65B329 | (v452 - ((2 * v452) & 0xDE) - 1539381393) ^ 0xA43EE76F;
  v13 = (((v12 - ((2 * v12) & 0x47474C)) << 8) - 1549556224) ^ 0xA3A3A600;
  v14 = (v13 - ((2 * v13) & 0x39B92400) - 1663266200) ^ 0x9CDC9268 | (v454 - ((2 * v454) & 0x9C) + 1046051150) ^ 0x3E59794E;
  v15 = v14 - ((2 * v14) & 0x11607E92);
  v16 = ((v448 - ((2 * v448) & 0x100)) << 20) - 402653184;
  v17 = (((v450 - ((2 * v450) & 0x10A)) << 12) - 1505210368) ^ 0xA6485000;
  v18 = (((v2 << 28) ^ 0xC0000000) - ((2 * ((v2 << 28) ^ 0xC0000000)) & 0xBFFFFFFF) - 752047130) ^ 0xD32CABE6 | ((v16 ^ 0xE8000000) - ((2 * v16) & 0x7600000) - 2085091860) ^ 0x83B805EC;
  v19 = (v18 - ((2 * v18) & 0x83BAC9E4) + 1105028338) ^ 0x41DD64F2;
  v20 = (v17 - ((2 * v17) & 0x1E60E000) + 1328576725) ^ 0x4F3078D5;
  v21 = (v19 | v20) - ((2 * (v19 | v20)) & 0x16C97F22) - 1956331631;
  v22 = (((v476 - ((2 * v476) & 0xDDDDDDDD)) << 16) - 1326579712) ^ 0xB0EE0000;
  v23 = (((v462 - ((2 * v462) & 0x1CC)) << 8) + 783279616) ^ 0x2EAFE600;
  v24 = (v23 - ((2 * v23) & 0x7FFDDE00) - 1073811650) ^ 0xBFFEEF3E | (v22 - ((2 * v22) & 0x3E5A0000) + 1596826988) ^ 0x5F2DA56C;
  v25 = (((v445 - ((2 * v445) & 0x1AE)) << 16) - 69795840) ^ 0xFBD70000;
  v26 = (((v447 - ((2 * v447) & 0x78)) << 8) + 1880177664) ^ 0x70113C00;
  v27 = (v25 - ((2 * v25) & 0x17060000) - 1954295074) ^ 0x8B83D2DE | (v26 - ((2 * v26) & 0xA881800) + 1162087652) ^ 0x45440CE4;
  v28 = (v27 - ((2 * v27) & 0x333E1B30) + 1503595928) ^ 0x599F0D98 | (v455 - ((2 * v455) & 0xFFFFFFE3) - 2103555087) ^ 0x829E4BF1;
  v29 = v28 - ((2 * v28) & 0x680F9E);
  v30 = -654471207 * ((v15 + 145768265) ^ 0x8B03F49)
      - ((838541234 * ((v15 + 145768265) ^ 0x8B03F49)) & 0x2BAA1C26)
      + 366284307;
  v31 = (((v443 - ((2 * v443) & 0x174)) << 16) - 390463488) ^ 0xE8BA0000;
  v32 = (((v449 - ((2 * v449) & 0x1E8)) << 8) + 48034816) ^ 0x2DCF400;
  v33 = (v32 - ((2 * v32) & 0x2D03E200) + 1451356648) ^ 0x5681F1E8 | ((v31 + 1218146591 + (~(2 * v31) | 0xEEC9FFFF)) | 1) ^ 0x489B711F;
  v34 = (v33 - ((2 * v33) & 0x9DFD7E90) - 822165688) ^ 0xCEFEBF48 | (v457 - ((2 * v457) & 0x7C) - 1504094402) ^ 0xA659573E;
  HIDWORD(v35) = ((v20 | (v2 >> 4) ^ 0x37744B2) - ((2 * (v20 | (v2 >> 4) ^ 0x37744B2)) & 0x2EE86) + 227139) ^ 0x37743;
  LODWORD(v35) = v21 ^ 0x8B640000;
  v36 = (v35 >> 18) - ((2 * (v35 >> 18)) & 0x519A0BCA) - 1462958619;
  v37 = (((v34 - ((2 * v34) & 0x102A2E)) << 8) + 135599872) ^ 0x8151700;
  HIDWORD(v35) = v36 ^ 0x105E5;
  LODWORD(v35) = v36 ^ 0xA8CC0000;
  v38 = ((v35 >> 18) - ((2 * (v35 >> 18)) & 0xC8E97FD4) + 1685372906) ^ 0x6474BFEA | (v456
                                                                                    - ((2 * v456) & 0x7A)
                                                                                    + 963525949) ^ 0x396E3D3D;
  v39 = ((v466 - ((2 * v466) & 0x26)) << 16) - 1055719424;
  v40 = (((v460 - ((2 * v460) & 0x146)) << 8) - 345005312) ^ 0xEB6FA300;
  v41 = ((v39 ^ 0xC1130000) - ((2 * v39) & 0x4880000) + 1111765246) ^ 0x424430FE | ((v40
                                                                                   + 580490535
                                                                                   + (~(2 * v40) | 0xBACCD5FF)) | 1) ^ 0x22999527;
  v42 = v41 - ((2 * v41) & 0xE50E5514);
  v43 = (v38 - ((2 * v38) & 0xB03621A6) + 1478168787) ^ 0x581B10D3;
  v44 = -371456631 * v43 - ((330828562 * v43) & 0x236C6682) + 297153345;
  v45 = (v37 - ((2 * v37) & 0x297A8000) + 347947111) ^ 0x14BD4067 | (v459 + 1721123744 + (~(2 * v459) | 0xFFFFFEBF) + 1) ^ 0x669643A0;
  v46 = (v24 - ((2 * v24) & 0x9698057E) + 1263272639) ^ 0x4B4C02BF | (v511 - ((2 * v511) & 0x1D2) + 1646308841) ^ 0x6220ADE9;
  v47 = v46 - ((2 * v46) & 0x7E3BC2);
  v48 = ((((v29 << 8) + 872926976) ^ 0x3407CF00)
       - ((2 * (((v29 << 8) + 872926976) ^ 0x3407CF00)) & 0xC37BC800)
       + 1639834823) ^ 0x61BDE4C7 | (v458 - ((2 * v458) & 0x9C) - 64956594) ^ 0xFC20D74E;
  v49 = (v45 - ((2 * v45) & 0x7F7D3A5C) - 1078026962) ^ 0xBFBE9D2E;
  v50 = 1062196213 * v49 - ((2124392426 * v49) & 0xD661F56E) + 1798372023;
  v51 = (((v465 - ((2 * v465) & 0x28)) << 16) - 2028732416) ^ 0x87140000;
  v52 = (((v467 - ((2 * v467) & 0x168)) << 8) - 1855998976) ^ 0x915FB400;
  v53 = (v51 - ((2 * v51) & 0x24E20000) - 1838023331) ^ 0x9271FD5D | (v52 - ((2 * v52) & 0x4CA4DC00) - 1504547208) ^ 0xA6526E78;
  v54 = (((v47 << 8) + 1058922752) ^ 0x3F1DE100) - ((2 * (((v47 << 8) + 1058922752) ^ 0x3F1DE100)) & 0x1994F800);
  v55 = v463 - ((2 * v463) & 0xFFFFFFF7) - 655732485;
  v56 = (v53 - ((2 * v53) & 0x5643D0B0) - 1423841192) ^ 0xAB21E858 | v55 ^ 0xD8EA50FB;
  v57 = ((((v8 << 8) - 1881926912) ^ 0x8FD41300)
       - ((2 * (((v8 << 8) - 1881926912) ^ 0x8FD41300)) & 0x37C6E200)
       + 467890628) ^ 0x1BE371C4 | (*(_DWORD *)(v1 - 220) - ((2 * *(_DWORD *)(v1 - 220)) & 0xF4) + 1649096314) ^ 0x624B367A;
  v58 = v433 ^ v44;
  v59 = (v57 - ((2 * v57) & 0x2856236E) - 1809116745) ^ 0x942B11B7;
  v60 = (v48 - ((2 * v48) & 0xF066B758) - 130851924) ^ 0xF8335BAC;
  v61 = 842553393 * v60 - ((1685106786 * v60) & 0x93CAAF32) - 907716711;
  v62 = (v54 - 1932886972) ^ 0x8CCA7C44 | (v473 - ((2 * v473) & 0x80) + 2084678464) ^ 0x7C41AB40;
  v63 = (((v56 - ((2 * v56) & 0x643A26)) << 8) + 840766208) ^ 0x321D1300;
  v64 = (v62 - ((2 * v62) & 0xC62640C0) + 1662197856) ^ 0x63132060;
  v65 = -371456631 * v64 - ((-742913262 * v64) & 0xD120B41C) + 1754290702;
  v66 = (v63 - ((2 * v63) & 0xFE07CA00) + 2130961814) ^ 0x7F03E596 | (v487 - ((2 * v487) & 0x22222222) + 1395931665) ^ 0x53343A11;
  v67 = (v66 - ((2 * v66) & 0xC8215ADE) + 1678814575) ^ 0x6410AD6F;
  v68 = 842553393 * v67 - ((1685106786 * v67) & 0xBA1AD750) - 586323032;
  v69 = (v42 - 226022774) ^ 0xF2872A8A | (v471 - ((2 * v471) & 0xB6) + 1226989915) ^ 0x4922615B;
  v70 = (((v69 - ((2 * v69) & 0x93C174)) << 8) - 908019200) ^ 0xC9E0BA00;
  v71 = v70 - ((2 * v70) & 0x33A35C00);
  v461 = v58 ^ v460;
  v73 = (v30 & 4 ^ 0xFFFFFFA7) - 81;
  if ((v30 & 4 & v55) == 0)
    v73 = ((v30 & 4 ^ 0xFFFFFFF7) & 0xFFFFFFF7 | (8 * (((v30 & 4) >> 2) & 1))) + 95;
  v74 = ((2 * ((HIBYTE(v30) ^ 0x15) & v462)) & 0x194) - ((HIBYTE(v30) ^ 0x15) & v462) - 75;
  v464 = (v463 + v73 - 86 - ((2 * (v463 + v73 - 86)) & 0xFFFFFFAC) - 42) ^ v30 & 0xFFFFFFFB ^ v439;
  v75 = 2 * ((v74 & 0x3B ^ 0x31) + (v74 & 0x44 ^ 0x41)) - 2;
  v76 = (HIBYTE(v30) ^ 0xA)
      + v462
      + ((v30 >> 23) & 0x3E ^ 0x2A)
      + (v75 ^ 0xFFFFFF99)
      + ((2 * v75) & 0xFFFFFFDF ^ 0xFFFFFFEF);
  v77 = v76 - ((2 * (_BYTE)v76 + 34) & 0x70);
  v78 = v465 ^ ((v439 ^ v30) >> 8);
  v79 = v3 ^ v50;
  v80 = (v3 ^ v50) ^ v469;
  v81 = (v71 - 1714311477) ^ 0x99D1AECB | (v480 - ((2 * v480) & 0x55555555) + 1114953130) ^ 0x4274D5AA;
  v82 = (v81 - ((2 * v81) & 0x213B4D5E) - 1868716369) ^ 0x909DA6AF;
  v83 = 1062196213 * v82 - ((2124392426 * v82) & 0x8996F13E) + 1154185375;
  v84 = v435 ^ v61;
  v85 = (v78 ^ 0xB1) - ((2 * (v78 ^ 0xB1)) & 0x7A);
  v86 = v435 ^ v61 ^ v466;
  v87 = v501 ^ v68;
  v88 = v467 ^ (v58 >> 8);
  v89 = (v77 - 119) ^ HIBYTE(v439);
  v90 = v476 ^ (v84 >> 8);
  v91 = (v90 ^ 0x35) - ((2 * (v90 ^ 0x35)) & 0x70);
  v92 = v484 ^ HIWORD(v58);
  v477 = ((v484 ^ BYTE2(v58)) ^ 0x46) - ((2 * (v92 ^ 0x46)) & 0x4C);
  v481 = v438 ^ HIWORD(v30) ^ v480;
  v93 = v471 ^ HIBYTE(v58);
  v94 = ((((v88 ^ 0x45) - ((2 * (v88 ^ 0x45)) & 0x1F8)) << 8) + 1499724800) ^ 0x5963FC00;
  v95 = ((((v85 << 16) - 1673723904) ^ 0x9C3D0000)
       - ((2 * (((v85 << 16) - 1673723904) ^ 0x9C3D0000)) & 0x239A0000)
       - 1848777690) ^ 0x91CDE426 | (v94 - ((2 * v94) & 0x2A4BF400) + 354810374) ^ 0x1525FA06;
  v96 = v473 ^ HIWORD(v79);
  HIDWORD(v97) = v96 ^ 1;
  LODWORD(v97) = (v96 ^ 0xFFFFFFDF) << 24;
  v98 = (v80 ^ 9) - ((2 * (v80 ^ 9)) & 0x4E);
  v99 = (v95 - ((2 * v95) & 0x7D35529E) - 23418545) ^ 0xFE9AA94F | ((v464 ^ 0x35)
                                                                  - ((2 * (v464 ^ 0x35)) & 0x44)
                                                                  - 318034398) ^ 0xED0B2E22;
  v100 = ((((~(2 * (v86 ^ 0x27)) | 0xFE2B) + (v86 ^ 0x27)) << 16) + 116064256) ^ 0x6EA0000;
  v72 = (v461 ^ 0x74) - ((2 * (v461 ^ 0x74)) & 0x152);
  v101 = (v100 - ((2 * v100) & 0x6B20000) + 525931784) ^ 0x1F591508 | ((((v72 << 8) + 731949312) ^ 0x2BA0A900)
                                                                     - ((2 * (((v72 << 8) + 731949312) ^ 0x2BA0A900)) & 0x4C8AAE00)
                                                                     - 1505405015) ^ 0xA64557A9;
  v485 = v86 ^ v87;
  v472 = ((v86 ^ v87) ^ 0x53) - ((2 * (v86 ^ v87 ^ 0x53)) & 0x1BE);
  v102 = (v89 ^ 0x7C) - ((2 * (v89 ^ 0x7C)) & 0xF2);
  v103 = (v101 - ((2 * v101) & 0x3B277BD2) + 496221673) ^ 0x1D93BDE9 | ((v93 ^ 0xF6)
                                                                      - ((2 * (v93 ^ 0xF6)) & 0x1B4)
                                                                      - 1694088486) ^ 0x9B0642DA;
  v104 = *(_DWORD *)(v1 - 192) ^ (-654471207 * v59 - ((-1308942414 * v59) & 0xA0C7BEB6) + 1348722523);
  v105 = (v97 >> 27) + (~(2 * (v97 >> 27)) | 0xFFFFFFA3) - 81;
  HIDWORD(v97) = v105 ^ 0xE;
  LODWORD(v97) = (v105 ^ 0xFFFFFFBF) << 24;
  v106 = (((v103 - ((2 * v103) & 0xBFD3CC)) << 8) + 1609164288) ^ 0x5FE9E600;
  v474 = (v97 >> 29) - ((2 * (v97 >> 29)) & 0x10) - 120;
  v107 = (((v99 - ((2 * v99) & 0x110A0C)) << 8) + 142935552) ^ 0x8850600;
  v108 = v107 - ((2 * v107) & 0xD32CEC00);
  v109 = (v106 - ((2 * v106) & 0xB85D6400) + 1546564323) ^ 0x5C2EB2E3 | ((v481 ^ 0x6D)
                                                                       - ((2 * (v481 ^ 0x6D)) & 0xC8)
                                                                       - 931178908) ^ 0xC87F5664;
  v110 = v109 - ((2 * v109) & 0x58418E4A);
  v111 = v437 ^ v83;
  v112 = v80 ^ (v437 ^ v83);
  v113 = v508 ^ (v79 >> 8);
  v488 = v487 ^ HIBYTE(v79);
  v114 = (v113 ^ 0xDD) - ((2 * (v113 ^ 0xDD)) & 0x106);
  v115 = v92 ^ HIWORD(v65) ^ 0xFFFFFFD6;
  v116 = *(_DWORD *)(v1 - 164);
  v117 = (v115 & (HIWORD(v116) ^ 0x50)) - ((2 * (v115 & (HIWORD(v116) ^ 0x50))) & 0x12);
  v118 = 1062196213 * ((v110 - 1407138011) ^ 0xAC20C725)
       - ((2124392426 * ((v110 - 1407138011) ^ 0xAC20C725)) & 0xBFFA1846)
       - 537064413;
  v509 = v90 ^ (v87 >> 8);
  v119 = (v509 ^ 0x18) - ((2 * (v509 ^ 0x18)) & 0xF6);
  v120 = v116 ^ v65;
  v121 = (HIWORD(v116) ^ 0xFFFFFFA2) + ((v116 >> 15) & 0x1FFE4 ^ 0xFFFFFFA0) + v115;
  v122 = v89 ^ HIBYTE(v104);
  *(_DWORD *)(v1 - 164) = v122;
  v123 = ((v488 ^ 0xF4) - 2 * ((v488 ^ 0xF4) & 0x3F) - 1189724865) ^ 0xB9163D3F | (v108 + 1771468480) ^ 0x699676C0;
  v124 = ((v121 + 14) ^ 0x7F)
       + 2 * (v121 + 14)
       + ((2 * v117 + 18) ^ 0xFFFFFFDF)
       + ((2 * (2 * v117 + 18)) & 0x64 ^ 0xFFFFFFDB)
       + 1;
  v470 = v124 - ((2 * v124 + 104) & 0xFFFFFFCC);
  v125 = (v123 - ((2 * v123) & 0x91FF0196) - 922779445) ^ 0xC8FF80CB;
  *(_DWORD *)(v1 - 192) = 842553393 * v125 - ((1685106786 * v125) & 0xC6A34C7C) + 1666295358;
  v126 = v461 ^ v120;
  v127 = v88 ^ (v120 >> 8);
  v128 = v93 ^ HIBYTE(v120);
  v129 = ((((v122 ^ 0xF0) - ((2 * (v122 ^ 0xF0)) & 0x8C)) << 8) + 1001801216) ^ 0x3BB64600;
  v130 = ((((v119 << 16) + 981139456) ^ 0x3A7B0000)
        - ((2 * (((v119 << 16) + 981139456) ^ 0x3A7B0000)) & 0x33BA0000)
        + 1507665899) ^ 0x59DD27EB | (v129 - ((2 * v129) & 0x7FBD7800) + 1071561852) ^ 0x3FDEBC7C;
  v131 = v130 + 1807062635 + (~(2 * v130) | 0xA894D329);
  v132 = v113 ^ ((v437 ^ v83) >> 8);
  v133 = BYTE2(v84) ^ v511;
  v134 = ((((v91 << 16) - 1858600960) ^ 0x91380000)
        - ((2 * (((v91 << 16) - 1858600960) ^ 0x91380000)) & 0x5FC80000)
        - 270237285) ^ 0xEFE4819B | ((((v102 << 8) + 2111535360) ^ 0x7DDB7900)
                                   - ((2 * (((v102 << 8) + 2111535360) ^ 0x7DDB7900)) & 0x3D0C3A00)
                                   + 1585847790) ^ 0x5E861DEE;
  v135 = v134 - ((2 * v134) & 0x3605669E);
  v512 = v78 ^ (v104 >> 8);
  v136 = ((((v114 << 8) - 680033536) ^ 0xD7778300)
        - ((2 * (((v114 << 8) - 680033536) ^ 0xD7778300)) & 0x52F53A00)
        - 1451582173) ^ 0xA97A9D23 | ((((v98 << 16) + 287768576) ^ 0x11270000)
                                    - ((2 * (((v98 << 16) + 287768576) ^ 0x11270000)) & 0x1FC0000)
                                    + 1090443918) ^ 0x40FEDA8E;
  v137 = (v133 ^ 0x81) - ((2 * (v133 ^ 0x81)) & 0xBE);
  v138 = v87;
  v139 = v133 ^ BYTE2(v87);
  v140 = (v136 - ((2 * v136) & 0x4CDF91E6) - 1502623501) ^ 0xA66FC8F3 | (v477 + 103369766) ^ 0x6294C26;
  v141 = v140 - ((2 * v140) & 0xB6CD20);
  v142 = *(_DWORD *)(v1 - 220) ^ HIBYTE(v84);
  v143 = ((((v512 ^ 0x5D) - ((2 * (v512 ^ 0x5D)) & 0x176)) << 16) + 1220214784) ^ 0x48BB0000;
  v144 = ((((v127 ^ 0xE4) - ((2 * v127) & 0x22)) << 8) + 1604391168) ^ 0x5FA11100;
  v145 = (v143 - ((2 * v143) & 0x647E0000) - 230704576) ^ 0xF23FBA40 | (v144 - ((2 * v144) & 0x1C68EE00) + 238319542) ^ 0xE3477B6;
  v146 = v145 - ((2 * v145) & 0x1EDC2C8);
  v147 = (v135 - 1694321841) ^ 0x9B02B34F | (v137 - 529927585) ^ 0xE069F25F;
  v148 = v118 ^ v440;
  v149 = v112 ^ (v118 ^ v440);
  v150 = (((v147 - ((2 * v147) & 0x8B7AB8)) << 8) + 1170037760) ^ 0x45BD5C00;
  v151 = ((v474 ^ 0x88) - ((2 * (v474 ^ 0x88)) & 0x18E) + 1133230023) ^ 0x438BB7C7 | (v150 - ((2 * v150) & 0xF3D55C00) - 102060462) ^ 0xF9EAAE52;
  v152 = (v151 - ((2 * v151) & 0xC15AB98C) + 1621974214) ^ 0x60AD5CC6;
  v153 = 842822710 - 371456631 * v152 - ((1404570386 * v152) & 0x6478E86C);
  v154 = ((((v126 ^ 0xB5) - ((2 * (v126 ^ 0xB5)) & 0x48)) << 8) + 1711219712) ^ 0x65FF2400;
  v155 = ((((v472 << 16) - 2082537472) ^ 0x83DF0000)
        - ((2 * (((v472 << 16) - 2082537472) ^ 0x83DF0000)) & 0x52A40000)
        - 1454196450) ^ 0xA952B91E | (v154 - ((2 * v154) & 0x73052A00) + 2038601191) ^ 0x798295E7;
  v156 = v104 ^ 0x59 ^ v464;
  v157 = (v146 - 2131304092) ^ 0x80F6E164 | ((v104 ^ 0x59 ^ v464)
                                           - ((2 * v156) & 0x13A)
                                           - 245508707) ^ 0xF15DD59D;
  v158 = (v155 - ((2 * v155) & 0x4676688C) - 482659258) ^ 0xE33B3446 | ((v128 ^ 0x8B)
                                                                      - ((2 * (v128 ^ 0x8B)) & 0x12E)
                                                                      + 1978814103) ^ 0x75F24E97;
  v159 = v158 - ((2 * v158) & 0xCBD56A);
  v160 = (v131 + 1) ^ 0x6BB5966B | ((v139 ^ 0xF) - ((2 * (v139 ^ 0xF)) & 0xD2) + 1966851689) ^ 0x753BC669;
  v161 = ((((v132 ^ 0x2B) - ((2 * (v132 ^ 0x2B)) & 0x5A)) << 8) + 2052533504) ^ 0x7A572D00;
  v162 = (v161 - ((2 * v161) & 0x177D4600) + 1270784936) ^ 0x4BBEA3A8 | ((((((v112 ^ 0x68) - ((2 * v112) & 0xA)) << 16)
                                                                         - 301662208) ^ 0xEE050000)
                                                                       - ((2
                                                                         * (((((v112 ^ 0x68) - ((2 * v112) & 0xA)) << 16)
                                                                           - 301662208) ^ 0xEE050000)) & 0x30380000)
                                                                       - 1742945470) ^ 0x981CC342;
  v163 = v162 - ((2 * v162) & 0x2A2E5CE);
  v468 = v481 ^ HIWORD(v104);
  v164 = ((((v141 << 8) - 614035456) ^ 0xDB669000)
        - ((2 * (((v141 << 8) - 614035456) ^ 0xDB669000)) & 0xE2465E00)
        + 1898131269) ^ 0x71232F45 | ((v142 ^ 0x3A) - ((2 * (v142 ^ 0x3A)) & 0x13C) - 857463138) ^ 0xCCE4269E;
  v165 = (v164 - ((2 * v164) & 0x893134D2) + 1150851689) ^ 0x44989A69;
  v166 = -654471207 * v165 - ((838541234 * v165) & 0x3E224092) - 1626267575;
  v167 = (((v157 - ((2 * v157) & 0xA4B5EE)) << 8) + 1381693184) ^ 0x525AF700;
  v168 = (((v160 - ((2 * v160) & 0x402214)) << 8) - 1609496064) ^ 0xA0110A00;
  v169 = v168 - ((2 * v168) & 0xF50F7000);
  v170 = v488 ^ HIBYTE(v111);
  v171 = v474 ^ HIWORD(v111);
  v172 = ((v170 ^ 0x21) - ((2 * v170) & 0x98) + 1007146828) ^ 0x3C07D74C | (v167 - ((2 * v167) & 0xC2C1C000) + 1633738891) ^ 0x6160E08B;
  v173 = ((((v159 << 8) + 1709880576) ^ 0x65EAB500)
        - ((2 * (((v159 << 8) + 1709880576) ^ 0x65EAB500)) & 0xE2DFD400)
        + 1903160009) ^ 0x716FEAC9 | (((v481 ^ BYTE2(v104)) ^ 0x9F)
                                    - ((2 * (v468 ^ 0x9F)) & 0xA4)
                                    + 727316306) ^ 0x2B59F752;
  v174 = (v173 - ((2 * v173) & 0xC8AA5AAE) - 464179881) ^ 0xE4D52D57;
  v489 = 1062196213 * v174 - ((245344234 * v174) & 0x886019A) + 71499981;
  v175 = (v172 - ((2 * v172) & 0x83E023FC) - 1041231362) ^ 0xC1F011FE;
  v176 = 842553393 * v175 - ((611364962 * v175) & 0x3F457E3C) + 530759454;
  v177 = (v163 + 1095856871) ^ 0x415172E7 | (((v470 - 102) ^ 0xE6)
                                           - ((2 * ((v470 - 102) ^ 0xE6)) & 0x16E)
                                           + 649067959) ^ 0x26AFFDB7;
  v478 = v149;
  v178 = (v149 ^ 6) - ((2 * v149) & 0xFFFFFFF3);
  v179 = (((v177 - ((2 * v177) & 0xEEB99E)) << 8) - 144912640) ^ 0xF75CCF00;
  v180 = ((v171 ^ 0x99) - ((2 * (v171 ^ 0x99)) & 0x62) - 1505048527) ^ 0xA64AC831 | (v169 + 2055714862) ^ 0x7A87B82E;
  v181 = v142 ^ HIBYTE(v138);
  v182 = (v179 - ((2 * v179) & 0xCC3C7000) + 1713256624) ^ 0x661E38B0 | ((v181 ^ 0x36)
                                                                       - ((2 * (v181 ^ 0x36)) & 0x64)
                                                                       + 2032259122) ^ 0x7921D032;
  v183 = (v180 - ((2 * v180) & 0xB0E84BF6) - 663476741) ^ 0xD87425FB;
  v184 = -371456631 * v183 - ((-742913262 * v183) & 0xAE9EBF3A) - 682664035;
  v185 = (v182 - ((2 * v182) & 0x55E28876) - 1427028933) ^ 0xAAF1443B;
  v475 = -654471207 * v185 - ((-1308942414 * v185) & 0xD8986532) + 1816933017;
  v186 = *(_DWORD *)(v1 - 192) ^ v503;
  v187 = v127 ^ (v153 >> 8) ^ 0xFFFFFF90;
  v188 = *(_DWORD *)(v1 - 160);
  v189 = v153 ^ v188;
  v190 = (v188 >> 8) ^ 0xFFFFFFFC;
  v191 = (v187 | v190) - ((2 * (v187 | v190)) & 0xFFFFFFFB);
  v192 = BYTE2(v186) ^ v139;
  *(_DWORD *)(v1 - 160) = v186 ^ v485;
  v193 = ((v186 ^ v485) ^ 0x29) - ((2 * (v186 ^ v485)) & 0x80);
  v194 = (v187 & v190) - ((2 * (v187 & v190)) & 0x30);
  v195 = v128 ^ HIBYTE(v189);
  *(_DWORD *)(v1 - 192) = v195;
  v504 = (v470 - 102) ^ HIWORD(v189);
  v196 = v189 ^ v126;
  v197 = (((((v189 ^ v126) ^ 0x41) - ((2 * (v189 ^ v126 ^ 0x41)) & 0xA0)) << 8) + 1112494080) ^ 0x424F5000;
  v198 = (v197 - ((2 * v197) & 0x4FBED400) + 1742695061) ^ 0x67DF6A95 | ((((v193 << 16) + 1161822208) ^ 0x45400000)
                                                                       - 1346271872
                                                                       + (~(2
                                                                          * (((v193 << 16) + 1161822208) ^ 0x45400000)) | 0xA07DFFFF)
                                                                       + 1) ^ 0xAFC18580;
  v199 = v198 - ((2 * v198) & 0x70187B0);
  v200 = (v191 + 125) ^ (v194 + 24);
  v482 = v132 ^ (v148 >> 8);
  HIDWORD(v97) = v196 ^ v184 ^ 0x1C;
  LODWORD(v97) = (v196 ^ ~v184) << 24;
  v201 = v509 ^ (v186 >> 8) ^ 0x6A;
  v202 = ((v509 ^ BYTE1(v186)) ^ 0x6A) - ((2 * v201) & 0x1AA);
  v203 = (v201 & ((v176 >> 8) ^ 0xFFFFFFBF)) - ((2 * (v201 & ((v176 >> 8) ^ 0xFFFFFFBF))) & 0x4A);
  v204 = v171 ^ HIWORD(v148);
  v205 = v170 ^ HIBYTE(v148);
  v206 = (v97 >> 30) - ((2 * (v97 >> 30)) & 0xFFFFFFFB) + 125;
  HIDWORD(v97) = v206 ^ 1;
  LODWORD(v97) = (v206 ^ 0x7C) << 24;
  v207 = ((((v482 ^ 0xC7) - ((2 * (v482 ^ 0xC7)) & 0x132)) << 8) - 1296066304) ^ 0xB2BF9900;
  v208 = (v207 - ((2 * v207) & 0xD6DAC00) + 1186387511) ^ 0x46B6D637 | ((((v178 << 16) + 1324941312) ^ 0x4EF90000)
                                                                      - ((2 * (((v178 << 16) + 1324941312) ^ 0x4EF90000)) & 0x35F40000)
                                                                      + 1526337231) ^ 0x5AFA0ECF;
  v209 = v208 - ((2 * v208) & 0x1479F4B0);
  v210 = *(_DWORD *)(v1 - 188);
  v211 = *(_DWORD *)(v1 - 164) ^ ((v166 ^ v210) >> 24);
  v212 = v176;
  *(_DWORD *)(v1 - 220) = v176;
  v213 = (v176 >> 8) + (~(v176 >> 7) & 0x7E) + v201;
  v214 = ((v504 ^ 0x7B) - ((2 * (v504 ^ 0x7B)) & 0xF6) + 1489638267) ^ 0x58CA137B | (v209 + 171768408) ^ 0xA3CFA58;
  v215 = v214 - ((2 * v214) & 0xE5C2AA);
  v216 = v512 ^ ((v166 ^ v210) >> 8);
  v217 = (((v215 << 8) - 220113664) ^ 0xF2E15500) - ((2 * (((v215 << 8) - 220113664) ^ 0xF2E15500)) & 0x577EAC00);
  v218 = v468 ^ ((v166 ^ v210) >> 16);
  *(_DWORD *)(v1 - 164) = v218;
  v219 = ((v213 + 65) ^ 0xFFFFFFE7)
       + ((2 * (v213 + 65)) & 0xFFFFFFCF)
       + ((2 * v203 + 74) ^ 0xFFFFFF83)
       + ((2 * (2 * v203 + 74)) & 0x6C ^ 0xFFFFFFFB);
  v220 = v219 + 1 + ~(2 * ((v219 + 17) & 0x27 ^ (v219 + 1) & 1));
  v221 = ((v166 ^ 0x49 | v156) - ((v166 ^ 0x49 | v156) >> 5 << 6) + 96) ^ v210 ^ (((v166 ^ 0x49) & v156)
                                                                                              + (~(2
                                                                                                 * ((v166 ^ 0x49) & v156)) | 0xFFFFFF9D)
                                                                                              - 78);
  v222 = ((((v211 ^ 0xAF) - ((2 * (v211 ^ 0xAF)) & 0x170)) << 8) - 433014784) ^ 0xE630B800;
  v223 = (v222 - ((2 * v222) & 0x5EBE5A00) - 278975064) ^ 0xEF5F2DA8 | ((((v202 << 16) + 1893007360) ^ 0x70D50000)
                                                                      - ((2 * (((v202 << 16) + 1893007360) ^ 0x70D50000)) & 0x4BA00000)
                                                                      + 634416609) ^ 0x25D06DE1;
  v224 = v223 - ((2 * v223) & 0x52CC58B4);
  v225 = ((((v216 ^ 0x83) - ((2 * (v216 ^ 0x83)) & 0x152)) << 16) + 1789460480) ^ 0x6AA90000;
  v226 = ((((v200 ^ 0x65) - ((2 * (v200 ^ 0x65)) & 0xDA)) << 8) - 1214681856) ^ 0xB7996D00;
  v227 = (v225 - ((2 * v225) & 0x7E200000) + 1058061698) ^ 0x3F10BD82 | (v226 - ((2 * v226) & 0x3E4D1C00) - 551121257) ^ 0xDF268E97;
  v228 = v227 - ((2 * v227) & 0x53AB12FA);
  v229 = v181 ^ HIBYTE(v186);
  v230 = (v217 - 1413523960) ^ 0xABBF5608 | ((v229 ^ 0x63) - ((2 * (v229 ^ 0x63)) & 0x196) + 543159755) ^ 0x205FF5CB;
  v231 = v192;
  v232 = (v224 - 1452921766) ^ 0xA9662C5A | ((v192 ^ 0x38) - ((2 * (v192 ^ 0x38)) & 0xDDDDDDDD) - 2059853074) ^ 0x853922EE;
  v233 = (v230 - ((2 * v230) & 0x9A9ACC52) - 850565591) ^ 0xCD4D6629;
  v234 = v475 ^ *(_DWORD *)(v1 - 184);
  v235 = (v199 + 58770392) ^ 0x380C3D8 | ((v195 ^ 0xC2) - ((2 * (v195 ^ 0xC2)) & 0x130) - 1267211880) ^ 0xB477E198;
  v236 = (v228 - 1445623427) ^ 0xA9D5897D | ((v221 ^ 0x66) - ((2 * (v221 ^ 0x66)) & 0x14A) - 1118859355) ^ 0xBD4F8FA5;
  v237 = (((v235 + (~(2 * v235) | 0xDBB5A1)) << 8) - 1843056640) ^ 0x92252F00;
  v238 = v237 - ((2 * v237) & 0xED0D9600);
  v239 = (((v236 - ((2 * v236) & 0x3D394C)) << 8) + 513582592) ^ 0x1E9CA600;
  v240 = (v239 - ((2 * v239) & 0x70333C00) - 1206280680) ^ 0xB8199E18 | ((v205 ^ 0xAB)
                                                                       - ((2 * (v205 ^ 0xAB)) & 0x55555555)
                                                                       - 1343278678) ^ 0xAFEF31AA;
  v241 = (((v232 - ((2 * v232) & 0x5F5DD4)) << 8) + 799992320) ^ 0x2FAEEA00;
  v242 = v478 ^ (v489 ^ v441);
  v243 = (v241 - ((2 * v241) & 0x8E412A00) - 954165996) ^ 0xC7209514 | ((v204 ^ 0x63)
                                                                      - ((2 * (v204 ^ 0x63)) & 0x46)
                                                                      - 1804063197) ^ 0x94782E23;
  v244 = v243 - ((2 * v243) & 0xF6578BEA);
  v245 = *(_DWORD *)(v1 - 156);
  *(_DWORD *)(v1 - 184) = ((v97 >> 26) - ((2 * (v97 >> 26)) & 0x14) + 10) ^ v245;
  v246 = v184 ^ v245;
  v247 = (v240 - ((2 * v240) & 0xBECFA1D8) + 1600639212) ^ 0x5F67D0EC;
  v248 = 842553393 * v247 - ((1685106786 * v247) & 0x74DF9610) - 1167078648;
  v249 = (v220 + 119) ^ (v506 >> 8);
  v250 = v216 ^ (v234 >> 8) ^ 0xFFFFFF82;
  *(_DWORD *)(v1 - 156) = v250;
  v251 = ((v216 ^ BYTE1(v234)) ^ 0x82) - ((2 * v250) & 0x8E);
  v252 = -371456631 * ((v244 - 81017355) ^ 0xFB2BC5F5)
       - ((-742913262 * ((v244 - 81017355) ^ 0xFB2BC5F5)) & 0xA34565CC)
       + 1369617126;
  v253 = (v238 - 158938121) ^ 0xF686CBF7 | ((v218 ^ 0xE7) - ((2 * (v218 ^ 0xE7)) & 0x70) + 1991705656) ^ 0x76B70438;
  v254 = v212 ^ v506;
  v255 = v231 ^ ((v212 ^ v506) >> 16);
  v256 = (v253 - ((2 * v253) & 0x696BEC04) - 1263143422) ^ 0xB4B5F602;
  v257 = 1062196213 * v256 - ((2124392426 * v256) & 0x7F45E7CC) + 1067643878;
  v258 = v211 ^ HIBYTE(v234);
  v259 = v234;
  *(_DWORD *)(v1 - 188) = v234;
  v260 = ((((v249 ^ 0xE7) - ((2 * (v249 ^ 0xE7)) & 0x14)) << 16) + 1846149120) ^ 0x6E0A0000;
  v261 = ((((v258 ^ 0xEC) - ((2 * (v258 ^ 0xEC)) & 0xE4)) << 8) - 48729600) ^ 0xFD187200;
  v262 = (v261 - ((2 * v261) & 0x693A4800) - 1264769866) ^ 0xB49D24B6 | (v260 - ((2 * v260) & 0x209A0000) + 273502320) ^ 0x104D5070;
  v263 = v262 - ((2 * v262) & 0x6CA0F008);
  v264 = v248 ^ v451;
  v265 = v205 ^ ((v489 ^ v441) >> 24);
  v266 = v204 ^ ((v489 ^ v441) >> 16);
  v513 = v482 ^ ((v489 ^ v441) >> 8);
  v486 = v246;
  v267 = v200 ^ (v246 >> 8);
  v268 = ((((v267 ^ 0xEC) - ((2 * (v267 ^ 0xEC)) & 0x60)) << 8) + 1969041408) ^ 0x755D3000;
  v269 = ((((v251 << 16) - 649658368) ^ 0xD9470000)
        - ((2 * (((v251 << 16) - 649658368) ^ 0xD9470000)) & 0x28CE0000)
        - 731401366) ^ 0xD467B36A | (v268 - ((2 * v268) & 0x18239800) - 1944990678) ^ 0x8C11CC2A;
  v270 = v229 ^ HIBYTE(v254);
  v271 = ((((v242 ^ 0x88) - ((2 * v242) & 0xC0)) << 16) + 241172480) ^ 0xE600000;
  v272 = ((((v513 ^ 0x68) - ((2 * (v513 ^ 0x68)) & 0x11A)) << 8) + 581733632) ^ 0x22AC8D00;
  v273 = (v272 - ((2 * v272) & 0x5E63BA00) + 1865538849) ^ 0x6F31DD21 | (v271 - ((2 * v271) & 0x4E020000) + 1728151833) ^ 0x67018119;
  v274 = (v263 + 911243268) ^ 0x36507804 | ((v255 ^ 0x94) - ((2 * (v255 ^ 0x94)) & 0x3A) - 1895829987) ^ 0x8EFFEE1D;
  v275 = v221 ^ v259;
  v276 = (v269 - ((2 * v269) & 0x724BEDF4) - 114952454) ^ 0xF925F6FA | (((v221 ^ v259) ^ 0x4A)
                                                                      - ((2 * (v221 ^ v259 ^ 0x4A)) & 0x12E)
                                                                      + 576637591) ^ 0x225ECA97;
  v277 = v276 - ((2 * v276) & 0x74C7EE);
  v278 = (((v274 - ((2 * v274) & 0x5EF048)) << 8) + 796402688) ^ 0x2F782400;
  v279 = v504 ^ HIWORD(v246);
  v280 = v257 ^ v453;
  v281 = (v278 - ((2 * v278) & 0xABF46A00) + 1442461170) ^ 0x55FA35F2 | ((v266 ^ 0x6D)
                                                                       - ((2 * (v266 ^ 0x6D)) & 0x11E)
                                                                       + 2026723727) ^ 0x78CD598F;
  v282 = (((v504 ^ BYTE2(v246)) ^ 0xA9) - ((2 * v279) & 0x20) - 969731824) ^ 0xC6331110 | (v273 - ((2 * v273) & 0x36B1323A) - 1688692451) ^ 0x9B58991D;
  v283 = (v281 - ((2 * v281) & 0x2B5A661C) + 363672334) ^ 0x15AD330E;
  v284 = -371456631 * v283 - ((-742913262 * v283) & 0xE11CEFB8) - 259098660;
  v285 = v252 ^ *(_DWORD *)(v1 - 152);
  v286 = v249 ^ ((v248 ^ v451) >> 8);
  *(_DWORD *)(v1 - 152) = v286;
  v287 = (v286 ^ 0x74) - ((2 * (v286 ^ 0x74)) & 0x13C);
  v288 = (((((v282 - ((2 * v282) & 0x9C314)) << 8) + 81889792) ^ 0x4E18A00)
        - ((2 * ((((v282 - ((2 * v282) & 0x9C314)) << 8) + 81889792) ^ 0x4E18A00)) & 0x45C33800)
        - 1562272726) ^ 0xA2E19C2A | ((v270 ^ 0x53) - ((2 * (v270 ^ 0x53)) & 0x180) - 1099065920) ^ 0xBE7D95C0;
  v289 = (v288 - ((2 * v288) & 0x2D4E04EC) - 1767439754) ^ 0x96A70276;
  v502 = -654471207 * v289 - ((838541234 * v289) & 0x33FE3764) - 1711334478;
  v290 = ((((v277 << 8) + 979629824) ^ 0x3A63F700)
        - ((2 * (((v277 << 8) + 979629824) ^ 0x3A63F700)) & 0x777D2800)
        + 1002345681) ^ 0x3BBE94D1 | ((v265 ^ 0xAB) - ((2 * (v265 ^ 0xAB)) & 0x2E) - 1928865513) ^ 0x8D07D917;
  v291 = (v290 - ((2 * v290) & 0x7598E8D0) + 986477672) ^ 0x3ACC7468;
  v292 = 842553393 * v291 - ((1685106786 * v291) & 0x8A88543A) - 985388515;
  v293 = ((v248 ^ v451) >> 16) ^ v255;
  v294 = (-654471207 * v233 - ((838541234 * v233) & 0x6E84BFBE) + 927096799) ^ *(_DWORD *)(v1 - 180);
  v295 = -654471207 * v233 - ((838541234 * v233) & 0x6E84BFBE) + 927096799;
  v510 = v258 ^ HIBYTE(v294);
  v296 = ((((v510 ^ 0xD4) - ((2 * v510) & 0x12)) << 8) + 1448806656) ^ 0x565B0900;
  v297 = ((((v287 << 16) - 811728896) ^ 0xCF9E0000)
        - ((2 * (((v287 << 16) - 811728896) ^ 0xCF9E0000)) & 0xBA00000)
        - 2049916922) ^ 0x85D0C006 | (v296 - ((2 * v296) & 0x38AFE000) + 475525189) ^ 0x1C57F045;
  v298 = (v297 - ((2 * v297) & 0x952E5598) - 896062772) ^ 0xCA972ACC | ((v293 ^ 0xF6)
                                                                      - ((2 * (v293 ^ 0xF6)) & 0x12E)
                                                                      - 555139689) ^ 0xDEE93D97;
  v299 = (((v298 - ((2 * v298) & 0xC40222)) << 8) + 1644237056) ^ 0x62011100;
  v505 = v266 ^ HIWORD(v280);
  v300 = (v299 - ((2 * v299) & 0xFC083C00) - 33284465) ^ 0xFE041E8F | (((v266 ^ BYTE2(v280)) ^ 0x90)
                                                                     - 2
                                                                     * (((v266 ^ BYTE2(v280)) ^ 0x90) & 0x3F)
                                                                     - 1644082369) ^ 0x9E014B3F;
  v301 = (v300 - 945739587 + (~(2 * v300) | 0x70BDAE85) + 1) ^ 0xC7A128BD;
  v490 = v294 ^ v275;
  v302 = v502 ^ (-39 * v233 - ((-78 * v233) & 0xBE) - 33) ^ *(_BYTE *)(v1 - 180) ^ v275 ^ 0x49;
  v303 = v491 & 1;
  v304 = (-371456631 * v301 - ((-742913262 * v301) & 0xA268D7DA) + 1362389997) ^ *(_DWORD *)(v1 - 216);
  v483 = v304;
  v305 = ((v304 & 0xFF00 ^ 0x4900 | 0xEBFFDA34) - (v304 & 0xFF00 ^ 0x4900 | 0x140025CB) + 335553995) ^ 0x927F1A3F;
  v306 = (v305 - ((2 * v305) & 0x1DDADAE0) - 1897042576) ^ 0xF76D697B | ((v304 ^ 0x8392447F)
                                                                       - ((2 * (v304 ^ 0x8392447F)) & 0x120884A)
                                                                       - 191240923) ^ 0x770BA134;
  v307 = v306 - ((2 * v306) & 0x6474B2F0);
  v308 = *(_DWORD *)(v1 - 212) ^ *(_DWORD *)(v1 - 168) ^ v292;
  *(_DWORD *)(v1 - 216) = v308;
  v309 = v292;
  v479 = v292;
  v310 = v293 ^ BYTE2(v308);
  if ((v302 & !(v491 & 1)) != 0)
    v311 = 0;
  else
    v311 = (2 * (v491 & 1)) ^ 2;
  v312 = v284;
  v313 = *(_DWORD *)(v1 - 144) ^ *(_DWORD *)(v1 - 148) ^ v284;
  v314 = *(_DWORD *)(v1 - 184);
  v315 = (v285 ^ v314 ^ *(_BYTE *)(v1 - 144) ^ *(_BYTE *)(v1 - 148) ^ v284);
  *(_DWORD *)(v1 - 148) = v310 == 61;
  v317 = v315 == 226 && v307 == 0 && (v279 ^ BYTE2(v285) ^ BYTE2(v313)) == 191;
  v318 = v267 ^ (v285 >> 8);
  v319 = v317 && (v267 ^ BYTE1(v285) ^ BYTE1(v313)) == 43;
  v320 = (((2 * (v304 & 0xFF0000 ^ 0xAD0000)) & 0x14C0000) - (v304 & 0xFF0000 ^ 0xAD0000) - 1554391448) ^ 0xEF5D4C78;
  v321 = ((2 * v320) & 0xC8FF2420) - v320;
  v322 = v319 && v321 == 1009488400;
  v323 = v280;
  v492 = v280 ^ v242;
  v324 = v513 ^ (v280 >> 8);
  v325 = ((((v492 ^ 0x3A) - ((2 * (v492 ^ 0x3A)) & 0x1C)) << 16) + 34471936) ^ 0x20E0000;
  v326 = (((((v513 ^ BYTE1(v280)) ^ 0xCC) - ((2 * (v324 ^ 0xCC)) & 0x9A)) << 8) + 425020672) ^ 0x19554D00;
  v327 = (v326 - ((2 * v326) & 0x65406600) + 849359691) ^ 0x32A0334B | (v325 - ((2 * v325) & 0x3CD80000) + 510396492) ^ 0x1E6C084C;
  v328 = (((v279 ^ BYTE2(v285)) ^ 0x37) - ((2 * (v279 ^ HIWORD(v285) ^ 0x37)) & 0x1C2) + 784432097) ^ 0x2EC17BE1 | (v327 - ((2 * v327) & 0x4301A2A2) - 1585393327) ^ 0xA180D151;
  v329 = (((v328 - ((2 * v328) & 0xED7784)) << 8) + 1992016384) ^ 0x76BBC200;
  v514 = v270 ^ HIBYTE(v264);
  v330 = (v329 - ((2 * v329) & 0x28E0F600) + 342915957) ^ 0x14707B75 | ((v514 ^ 0x8E)
                                                                      - ((2 * (v514 ^ 0x8E)) & 0x138)
                                                                      + 917189788) ^ 0x36AB349C;
  v331 = (v330 - ((2 * v330) & 0x4A3E31A0) + 622794960) ^ 0x251F18D0;
  v332 = -654471207 * v331 - ((838541234 * v331) & 0x3214C620) + 420111120;
  v333 = *(_DWORD *)(v1 - 176);
  v334 = (((2 * (v333 & 0xFE ^ 0xCC)) | 0xA) - (v333 & 0xFE ^ 0xCC) + 123) ^ 0xE5;
  LOBYTE(v331) = (v303 + v302 + v311 - 1 - ((2 * (v303 + v302 + v311 - 1)) & 0xD4) + 106) ^ (((2 * v334) & 0xA4)
                                                                                           - v334
                                                                                           - 83);
  v335 = *(_DWORD *)(v1 - 172);
  v336 = v331 ^ v335 ^ ((v332 ^ 0x10 | v331 ^ 0xCD) - ((2 * (v332 ^ 0x10 | v331 ^ 0xCD)) & 0x4A) - 91) ^ (((v332 ^ 0x10) & (v331 ^ 0xCD)) + (~(2 * ((v332 ^ 0x10) & (v331 ^ 0xCD))) | 0xDF) - 111);
  v337 = *(_DWORD *)(v1 - 200);
  v338 = (v331 ^ v337);
  v340 = v322 && v338 == 22 && v336 == 135;
  v341 = *(_DWORD *)(v1 - 160) ^ *(_DWORD *)(v1 - 220) ^ v507;
  v342 = (v314 ^ 0x14) - ((2 * (v314 ^ 0x14)) & 0x1EE);
  v343 = v295;
  v344 = ((((v341 ^ 0x37) - ((2 * (v341 ^ 0x37)) & 0xEE)) << 16) + 729219072) ^ 0x2B770000;
  v345 = ((((v342 << 8) + 852621056) ^ 0x32D1F700)
        - ((2 * (((v342 << 8) + 852621056) ^ 0x32D1F700)) & 0x6CE61400)
        + 913509072) ^ 0x36730AD0 | (v344 - ((2 * v344) & 0x1AC20000) + 1298252413) ^ 0x4D61C27D;
  v346 = v264 ^ v341;
  v347 = ((v264 ^ v341) ^ 0xBE) - ((2 * (v264 ^ v341 ^ 0xBE)) & 0x158);
  v348 = *(_DWORD *)(v1 - 192) ^ HIBYTE(v486);
  v349 = (v345 - ((2 * v345) & 0x2D935484) - 691426750) ^ 0xD6C9AA42 | ((v348 ^ 0x6F)
                                                                      - ((2 * (v348 ^ 0x6F)) & 0x1BE)
                                                                      + 1662209503) ^ 0x63134DDF;
  v350 = *(_DWORD *)(v1 - 180);
  v351 = (((v295 >> 8) ^ 0x5F | *(_DWORD *)(v1 - 156)) - ((2 * ((v295 >> 8) ^ 0x5F | *(_DWORD *)(v1 - 156))) & 0x4E) - 89) ^ (v350 >> 8) ^ ((((v295 >> 8) ^ 0x5F) & *(_DWORD *)(v1 - 156)) - ((2 * (((v295 >> 8) ^ 0x5F) & *(_DWORD *)(v1 - 156))) & 0x1FFFF8C) + 70);
  HIDWORD(v352) = v351 ^ 0x3B;
  LODWORD(v352) = (v351 ^ 0x40) << 24;
  v353 = (v352 >> 30) - ((2 * (v352 >> 30)) & 0xFFFFFFCC) + 102;
  HIDWORD(v352) = v353 ^ 6;
  LODWORD(v352) = (v353 ^ 0x60) << 24;
  v354 = (v352 >> 29) + (~(2 * (v352 >> 29)) | 0x6D) + 74;
  HIDWORD(v352) = v354 ^ 9;
  LODWORD(v352) = (v354 ^ 0x40) << 24;
  v355 = (((v349 - ((2 * v349) & 0x193EA)) << 8) + 13235456) ^ 0xC9F500;
  v356 = *(_DWORD *)(v1 - 164) ^ HIWORD(*(_DWORD *)(v1 - 188)) ^ 0xFFFFFFF7;
  v357 = (v355 - ((2 * v355) & 0xEFE13C00) + 2012257977) ^ 0x77F09EB9 | (((*(_BYTE *)(v1 - 164) ^ HIWORD(*(_DWORD *)(v1 - 188))) ^ 0xF7)
                                                                       - ((2 * v356) & 0xB4)
                                                                       - 246229926) ^ 0xF152D45A;
  v358 = (((((v285 ^ v314) ^ 0x7D) - ((2 * (v285 ^ v314 ^ 0x7D)) & 0x174)) << 8) - 1286096384) ^ 0xB357BA00;
  v359 = ((((v347 << 16) - 492044288) ^ 0xE2AC0000)
        - ((2 * (((v347 << 16) - 492044288) ^ 0xE2AC0000)) & 0x5A280000)
        + 756299769) ^ 0x2D1437F9 | (v358 - ((2 * v358) & 0x4D995E00) - 422793367) ^ 0xE6CCAF69;
  v360 = (v357 - ((2 * v357) & 0xBBFFB902) - 570434431) ^ 0xDDFFDC81;
  v361 = 1062196213 * v360 - ((513779690 * v360) & 0x1C8C7B54) - 1907999318;
  v362 = v348 ^ HIBYTE(v285);
  v363 = (v359 - ((2 * v359) & 0x322D8E9A) + 1494665037) ^ 0x5916C74D | ((v362 ^ 0xC)
                                                                       - ((2 * (v362 ^ 0xC)) & 0x48)
                                                                       - 66836956) ^ 0xFC042624;
  v364 = (((HIWORD(v343) ^ 0x42) & v356) - ((2 * ((HIWORD(v343) ^ 0x42) & v356)) & 0x1FFFC) + 126) ^ HIWORD(v350) ^ ((HIWORD(v343) ^ 0x42 | v356) - ((2 * (HIWORD(v343) ^ 0x42 | v356)) & 0xFFFFFFD4) + 106);
  v365 = (((v363 - ((2 * v363) & 0x5403F6)) << 8) - 1442710784) ^ 0xAA01FB00;
  v366 = v365 - ((2 * v365) & 0x3DE70A00);
  LOBYTE(v350) = v309 ^ v346 ^ 0xA3;
  v367 = *(_DWORD *)(v1 - 212);
  LOBYTE(v348) = 2 * ((v350 & (v367 ^ 0x21)) - ((2 * (v350 & (v367 ^ 0x21))) & 0x24)) + 36;
  v368 = v265 ^ HIBYTE(v323);
  v369 = (v367 ^ 0x1E) + ((2 * (v367 & 0x3F)) ^ 0x42) + v350;
  v370 = (v352 >> 29) - ((2 * (v352 >> 29)) & 0xFFFFFFAA) + 85;
  v371 = ((((v370 ^ 0x55) - ((2 * (v370 ^ 0x55)) & 0xB2)) << 16) + 609812480) ^ 0x24590000;
  v372 = ((((v318 ^ 0xDC) - ((2 * (v318 ^ 0xDC)) & 0xC)) << 8) + 1278412288) ^ 0x4C330600;
  v373 = (v372 - ((2 * v372) & 0x4EE37E00) + 1735507925) ^ 0x6771BFD5 | (v371 - ((2 * v371) & 0x331C0000) + 428797539) ^ 0x198EEE63;
  v374 = (v373 - ((2 * v373) & 0x664BA860) - 1289366480) ^ 0xB325D430 | ((v490 ^ 0xFB)
                                                                       - ((2 * (v490 ^ 0xFB)) & 0x30)
                                                                       + 246752792) ^ 0xEB52618;
  v375 = (((v374 + (~(2 * v374) | 0x35E3B7)) << 8) + 1695425792) ^ 0x650E2400;
  v376 = (v375 - ((2 * v375) & 0x7D535200) - 1096177306) ^ 0xBEA9A966 | ((v368 ^ 0xE2)
                                                                       - ((2 * (v368 ^ 0xE2)) & 0x192)
                                                                       - 1939851319) ^ 0x8C6037C9;
  v377 = (v376 - ((2 * v376) & 0x783DB9EC) + 1008655606) ^ 0x3C1EDCF6;
  v378 = v362 ^ ((v312 ^ *(_DWORD *)(v1 - 144)) >> 24) ^ 0x29;
  v379 = (v378 ^ 0xF6EF7A9B) + ((2 * v378) & 0x136) + 152077669;
  v380 = (v366 - 1628207743) ^ 0x9EF38581 | ((v364 ^ 0xEE) - ((2 * (v364 ^ 0xEE)) & 0xEE) + 913316471) ^ 0x36701A77;
  v381 = (v380 - ((2 * v380) & 0x83D7F174) - 1041499974) ^ 0xC1EBF8BA;
  v382 = (842553393 * v377 - ((1685106786 * v377) & 0x42E64232) - 1586290407) ^ *(_DWORD *)(v1 - 208);
  v383 = ((v369 - 63) ^ 0x5F) + ((2 * (v369 - 63)) & 0xBF) + (v348 ^ 0x35) + ((2 * v348) & 0xDD ^ 0xB7);
  v384 = ((49 * v377 - ((98 * v377) & 0x32) + 25) ^ *(_BYTE *)(v1 - 208)) ^ 0x105C0052;
  v385 = (1062196213 * v381 - ((2124392426 * v381) & 0xCEFFF75E) + 1736440751) ^ v496;
  v386 = v324 ^ ((v361 ^ v495) >> 8);
  HIDWORD(v352) = v386 ^ (v385 >> 8);
  LODWORD(v352) = (HIDWORD(v352) ^ 0xEC) << 24;
  v387 = (v352 >> 25) - 8 * ((v352 >> 25) >> 2) + 124;
  HIDWORD(v352) = v387 ^ 0x1C;
  LODWORD(v352) = (v387 ^ 0x60) << 24;
  v388 = (v352 >> 29) - ((2 * (v352 >> 29)) & 0xFFFFFFEF);
  HIDWORD(v352) = -124 - v388;
  LODWORD(v352) = ((v388 + 119) ^ 0x77777777) << 24;
  v389 = v332 ^ v335;
  v390 = (v352 >> 26) - ((2 * (v352 >> 26)) & 0x40);
  v391 = ((v389 & 0xFF00 ^ 0x7B00 | 0x9D528BDF) - (v389 & 0xFF00 ^ 0x7B00 | 0x62AD7420) + 1655534624) ^ 0x1C5296DE;
  v392 = (((2 * v391) | 0xF36F2708) - v391 - 2042073988) ^ 0xF8B7D385;
  v393 = ((v392 | v389 & 0xFF0000 ^ 0xE90000)
        - 2 * ((v392 | v389 & 0xFF0000 ^ 0xE90000) & 0x50972F57 ^ v392 & 3)
        - 795398316) ^ 0xD0972F54 | (v384 + (v382 & 0x8E ^ 0xCB83888C) - (v384 & 0x44008E)) ^ 0xDB9B88CA;
  v394 = v393 - ((2 * v393) & 0x396373F8);
  v395 = ((v382 & 0xFF0000 ^ 0x640000) + (v382 & 0xB50000 ^ 0x5091EF81) - ((v382 & 0xFF0000 ^ 0x640000) & 0xB50000)) ^ 0x8B89B311;
  v396 = ((v395 | 0xF0DC8A7E) - (v395 | 0xF237581) + 253982081) ^ 0x2B5ED6EE | ((-11 * v381
                                                                                                - ((-22 * v381) & 0x5E)
                                                                                                - 81) ^ v496) ^ 0x59;
  v397 = v396 - ((2 * v396) & 0x283C493C);
  v398 = *(_DWORD *)(v1 - 204);
  v399 = v494 ^ ((v361 ^ v398) >> 16) ^ v505;
  v400 = v333 ^ v337 ^ v502;
  v401 = (v495 ^ v499 ^ v361) ^ v492;
  v402 = v368 ^ ((v361 ^ v495) >> 24) ^ 0x97;
  v403 = (v368 ^ ((v361 ^ v495) >> 24)) ^ 0x7FEDBB69;
  v404 = (v383 - 111);
  v405 = (2 * v402) & 0x1FC;
  v406 = (v370 ^ BYTE1(v400));
  v407 = v340 && v406 == 110;
  v408 = v390 + 32;
  v410 = v407 && (v483 ^ 0xB000000) >> 24 == 0 && (*(_DWORD *)(v1 - 196) ^ 0xEC) == v379;
  v411 = v403 + v405 - 2146286590;
  v428 = v410
      && v404 == (*(_BYTE *)(v1 - 168) ^ 5)
      && (v364 ^ BYTE2(v400)) == 62
      && v394 == 0
      && (*(_DWORD *)(v1 - 152) ^ BYTE1(*(_DWORD *)(v1 - 216))) == 114
      && (v497 ^ 0xEB) == ((v514 ^ ((v479 ^ v367) >> 24)) ^ 0x777FEE7D)
                        + ((2 * (v514 ^ ((v479 ^ v367) >> 24) ^ 0x8F)) & 0x1E4)
                        - 2004872946
      && (v498 ^ 0xF8) == ((v510 ^ ((v502 ^ v333) >> 24)) ^ 0x7CFF9F3C)
                        + ((2 * (v510 ^ ((v502 ^ v333) >> 24) ^ 0xDD)) & 0x1C2)
                        - 2097127393
      && v401 == 124
      && (v408 ^ v386) == 172
      && (((v382 & 0xFF00 ^ 0xDBB104E9) - 1) ^ 0xD9C665E9 | 0x7DB233F1)
       - (((v382 & 0xFF00 ^ 0xDBB104E9) - 1) ^ 0xD9C665E9 | 0x824DCC0E) == -42513182
      && v399 == 53
      && (v386 ^ BYTE1(v398)) == 8
      && v397 == 0
      && (((v382 ^ 0x1CDA4A16 | v389 ^ 0xC3E9266F) ^ 0x6EF7EBEF)
        - 1861741551
        + ((2 * (v382 ^ 0x1CDA4A16 | v389 ^ 0xC3E9266F)) & 0xDDEFD7DE)) >> 24 == 0
      && (((v385 & 0xFF0000 ^ 0xA2BED027) - 1) ^ 0xB380D736)
       - ((2 * (((v385 & 0xFF0000 ^ 0xA2BED027) - 1) ^ 0xB380D736)) & 0x201E0820) == -241369360
      && (v493 ^ 0x48) == v411
      && (v385 ^ 0x35000000) >> 24 == 0;
  if ((*(_DWORD *)(v1 - 148) & v428) != 0)
    v429 = 66312069;
  else
    v429 = 66312070;
  result = v500;
  *(_DWORD *)(v500 + 24) = v429;
  return result;
}

uint64_t sub_206850108(uint64_t a1, uint64_t a2, int a3, uint64_t a4)
{
  _QWORD v5[2];
  int v6;
  uint64_t v7;
  uint64_t v8;
  _DWORD v9[2];
  _QWORD *v10;
  uint64_t v11;
  uint64_t vars0;

  v11 = *MEMORY[0x24BDAC8D0];
  v5[0] = 0x206847344;
  v5[1] = a1;
  v6 = a3;
  v7 = a2;
  v8 = a4;
  v10 = v5;
  v9[0] = 111364217
        * ((((2 * (&vars0 - 24)) | 0x3A2C5A84) - (&vars0 - 24) + 1659491006) ^ 0xD7FEBE4C)
        - 250794294;
  sub_206846EC4((uint64_t)v9);
  return v9[1];
}

uint64_t sub_2068501BC(int a1, uint64_t a2)
{
  _QWORD v3[2];
  int v4;
  _DWORD v5[2];
  _QWORD *v6;
  uint64_t v7;
  uint64_t vars0;

  v7 = *MEMORY[0x24BDAC8D0];
  v4 = a1;
  v3[0] = 0x206847BF0;
  v3[1] = a2;
  v6 = v3;
  v5[0] = 111364217
        * ((&vars0 - 1403023817 - 2 * ((&vars0 - 24) & 0xAC5F8E4F)) ^ 0xE6B71D41)
        - 250794294;
  sub_206846EC4((uint64_t)v5);
  return v5[1];
}

uint64_t sub_20685026C(uint64_t a1)
{
  unint64_t v1;
  int v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  v1 = 462267737
     * ((2 * ((unint64_t)&v3 & 0x2333668BA929A930) - (_QWORD)&v3 - 0x2333668BA929A937) ^ 0x81F9149964B95D8ELL);
  v3 = 1995507721 - v1;
  v4 = a1;
  v5 = v1 ^ 0x206847F2CLL;
  sub_206847EA0((uint64_t)&v3);
  return v6;
}

_BYTE *sub_206850330(_BYTE *result, char a2, unint64_t a3)
{
  unint64_t v3;
  unint64_t v4;
  unint64_t v5;
  unint64_t v6;

  v3 = -(int)result & 7;
  if (v3 > a3)
    LODWORD(v3) = a3;
  switch((int)v3)
  {
    case 1:
      goto LABEL_10;
    case 2:
      goto LABEL_9;
    case 3:
      goto LABEL_8;
    case 4:
      goto LABEL_7;
    case 5:
      goto LABEL_6;
    case 6:
      goto LABEL_5;
    case 7:
      *result++ = a2;
LABEL_5:
      *result++ = a2;
LABEL_6:
      *result++ = a2;
LABEL_7:
      *result++ = a2;
LABEL_8:
      *result++ = a2;
LABEL_9:
      *result++ = a2;
LABEL_10:
      *result++ = a2;
      break;
    default:
      break;
  }
  v4 = a3 - v3;
  v6 = v4;
  v5 = v4 & 7;
  switch(v6)
  {
    case 0uLL:
      return result;
    case 1uLL:
      goto LABEL_20;
    case 2uLL:
      goto LABEL_19;
    case 3uLL:
      goto LABEL_18;
    case 4uLL:
      goto LABEL_17;
    case 5uLL:
      goto LABEL_16;
    case 6uLL:
      goto LABEL_15;
    case 7uLL:
      *result++ = a2;
LABEL_15:
      *result++ = a2;
LABEL_16:
      *result++ = a2;
LABEL_17:
      *result++ = a2;
LABEL_18:
      *result++ = a2;
LABEL_19:
      *result++ = a2;
LABEL_20:
      *result = a2;
      break;
    default:
      result = (_BYTE *)((uint64_t (*)(void))((char *)&loc_2068503C0 + 4 * byte_2068508D7[(v5 >> 3) & 7]))();
      break;
  }
  return result;
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFIndex CFGetRetainCount(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEE8](cf);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFTypeRef CFRetain(CFTypeRef cf)
{
  return (CFTypeRef)MEMORY[0x24BDBC2A8](cf);
}

void CFRunLoopAddSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC2C8](rl, source, mode);
}

CFRunLoopRef CFRunLoopGetCurrent(void)
{
  return (CFRunLoopRef)MEMORY[0x24BDBC2F8]();
}

void CFRunLoopRemoveSource(CFRunLoopRef rl, CFRunLoopSourceRef source, CFRunLoopMode mode)
{
  MEMORY[0x24BDBC348](rl, source, mode);
}

void CFRunLoopRun(void)
{
  MEMORY[0x24BDBC358]();
}

void CFStringAppendFormat(CFMutableStringRef theString, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  MEMORY[0x24BDBC4C0](theString, formatOptions, format);
}

CFArrayRef CFStringCreateArrayBySeparatingStrings(CFAllocatorRef alloc, CFStringRef theString, CFStringRef separatorString)
{
  return (CFArrayRef)MEMORY[0x24BDBC510](alloc, theString, separatorString);
}

CFMutableStringRef CFStringCreateMutable(CFAllocatorRef alloc, CFIndex maxLength)
{
  return (CFMutableStringRef)MEMORY[0x24BDBC538](alloc, maxLength);
}

CFStringRef CFStringCreateWithCString(CFAllocatorRef alloc, const char *cStr, CFStringEncoding encoding)
{
  return (CFStringRef)MEMORY[0x24BDBC568](alloc, cStr, *(_QWORD *)&encoding);
}

CFStringRef CFStringCreateWithFormat(CFAllocatorRef alloc, CFDictionaryRef formatOptions, CFStringRef format, ...)
{
  return (CFStringRef)MEMORY[0x24BDBC598](alloc, formatOptions, format);
}

SInt32 CFStringGetIntValue(CFStringRef str)
{
  return MEMORY[0x24BDBC650](str);
}

uint64_t CMBaseGetClassID()
{
  return MEMORY[0x24BDC0078]();
}

uint64_t CMBaseObjectGetDerivedStorage()
{
  return MEMORY[0x24BDC0080]();
}

uint64_t CMBaseObjectGetVTable()
{
  return MEMORY[0x24BDC0090]();
}

uint64_t CMDerivedObjectCreate()
{
  return MEMORY[0x24BDC0180]();
}

uint64_t CMNotificationCenterAddListener()
{
  return MEMORY[0x24BDC0228]();
}

uint64_t CMNotificationCenterGetDefaultLocalCenter()
{
  return MEMORY[0x24BDC0230]();
}

uint64_t CMNotificationCenterPostNotification()
{
  return MEMORY[0x24BDC0238]();
}

uint64_t CMNotificationCenterRegisterForBarrierSupport()
{
  return MEMORY[0x24BDC0240]();
}

uint64_t FigBaseClassRegisterClass()
{
  return MEMORY[0x24BDC0698]();
}

uint64_t FigBaseObjectCopyDebugDescription()
{
  return MEMORY[0x24BDC06A0]();
}

uint64_t FigCFWeakReferenceHolderCopyReferencedObject()
{
  return MEMORY[0x24BDC0798]();
}

uint64_t FigCFWeakReferenceHolderCreateWithReferencedObject()
{
  return MEMORY[0x24BDC07A0]();
}

uint64_t FigEventCreate()
{
  return MEMORY[0x24BDC0888]();
}

uint64_t FigEventSet()
{
  return MEMORY[0x24BDC0890]();
}

uint64_t FigEventWaitRelative()
{
  return MEMORY[0x24BDC0898]();
}

uint64_t FigGetUpTimeNanoseconds()
{
  return MEMORY[0x24BDC08D0]();
}

uint64_t FigNotificationCenterAddWeakListener()
{
  return MEMORY[0x24BDC0968]();
}

uint64_t FigNotificationCenterRemoveWeakListener()
{
  return MEMORY[0x24BDC0970]();
}

uint64_t FigSignalErrorAt()
{
  return MEMORY[0x24BDC09E0]();
}

uint64_t FigThreadCreate()
{
  return MEMORY[0x24BDC0A68]();
}

uint64_t FigThreadRunOnce()
{
  return MEMORY[0x24BDC0A80]();
}

uint64_t IOAVServiceGetContentProtectionCapabilities()
{
  return MEMORY[0x24BDD7EA0]();
}

uint64_t IOMobileFramebufferCreateDisplayList()
{
  return MEMORY[0x24BE516C8]();
}

uint64_t IOMobileFramebufferDisableHotPlugDetectNotifications()
{
  return MEMORY[0x24BE516D0]();
}

uint64_t IOMobileFramebufferEnableHotPlugDetectNotifications()
{
  return MEMORY[0x24BE516D8]();
}

uint64_t IOMobileFramebufferGetHDCPAuthenticationProtocol()
{
  return MEMORY[0x24BE516E8]();
}

uint64_t IOMobileFramebufferGetHDCPRunLoopSource()
{
  return MEMORY[0x24BE516F0]();
}

uint64_t IOMobileFramebufferGetHotPlugRunLoopSource()
{
  return MEMORY[0x24BE516F8]();
}

uint64_t IOMobileFramebufferGetProtectionOptions()
{
  return MEMORY[0x24BE51700]();
}

uint64_t IOMobileFramebufferHDCPGetReply()
{
  return MEMORY[0x24BE51708]();
}

uint64_t IOMobileFramebufferHDCPSendRequest()
{
  return MEMORY[0x24BE51710]();
}

uint64_t IOMobileFramebufferOpenByName()
{
  return MEMORY[0x24BE51718]();
}

void _Block_object_dispose(const void *a1, const int a2)
{
  MEMORY[0x24BDAC730](a1, *(_QWORD *)&a2);
}

uint64_t __IOAVCopyFirstMatchingIOAVObjectOfType()
{
  return MEMORY[0x24BDD8AD8]();
}

uint32_t arc4random(void)
{
  return MEMORY[0x24BDAD158]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_global_t dispatch_get_global_queue(intptr_t identifier, uintptr_t flags)
{
  return (dispatch_queue_global_t)MEMORY[0x24BDADDA8](identifier, flags);
}

void *__cdecl dispatch_get_specific(const void *key)
{
  return (void *)MEMORY[0x24BDADDB0](key);
}

void dispatch_group_async(dispatch_group_t group, dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADDB8](group, queue, block);
}

dispatch_group_t dispatch_group_create(void)
{
  return (dispatch_group_t)MEMORY[0x24BDADDC8]();
}

void dispatch_group_enter(dispatch_group_t group)
{
  MEMORY[0x24BDADDD0](group);
}

void dispatch_group_leave(dispatch_group_t group)
{
  MEMORY[0x24BDADDD8](group);
}

intptr_t dispatch_group_wait(dispatch_group_t group, dispatch_time_t timeout)
{
  return MEMORY[0x24BDADDF0](group, timeout);
}

void dispatch_once(dispatch_once_t *predicate, dispatch_block_t block)
{
  MEMORY[0x24BDADE98](predicate, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_queue_set_specific(dispatch_queue_t queue, const void *key, void *context, dispatch_function_t destructor)
{
  MEMORY[0x24BDADF00](queue, key, context, destructor);
}

void dispatch_release(dispatch_object_t object)
{
  MEMORY[0x24BDADF10](object);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
}

void dispatch_retain(dispatch_object_t object)
{
  MEMORY[0x24BDADF20](object);
}

void dispatch_set_context(dispatch_object_t object, void *context)
{
  MEMORY[0x24BDADF40](object, context);
}

void dispatch_set_finalizer_f(dispatch_object_t object, dispatch_function_t finalizer)
{
  MEMORY[0x24BDADF48](object, finalizer);
}

void dispatch_source_cancel(dispatch_source_t source)
{
  MEMORY[0x24BDADF68](source);
}

dispatch_source_t dispatch_source_create(dispatch_source_type_t type, uintptr_t handle, uintptr_t mask, dispatch_queue_t queue)
{
  return (dispatch_source_t)MEMORY[0x24BDADF70](type, handle, mask, queue);
}

void dispatch_source_set_event_handler(dispatch_source_t source, dispatch_block_t handler)
{
  MEMORY[0x24BDADFB0](source, handler);
}

void dispatch_source_set_timer(dispatch_source_t source, dispatch_time_t start, uint64_t interval, uint64_t leeway)
{
  MEMORY[0x24BDADFD0](source, start, interval, leeway);
}

void dispatch_suspend(dispatch_object_t object)
{
  MEMORY[0x24BDADFE0](object);
}

void dispatch_sync(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADFE8](queue, block);
}

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

void *__cdecl malloc_type_calloc(size_t count, size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED70](count, size, type_id);
}

void *__cdecl malloc_type_malloc(size_t size, malloc_type_id_t type_id)
{
  return (void *)MEMORY[0x24BDAED78](size, type_id);
}

void objc_enumerationMutation(id obj)
{
  MEMORY[0x24BEDD068](obj);
}

int snprintf(char *__str, size_t __size, const char *__format, ...)
{
  return MEMORY[0x24BDAFE40](__str, __size, __format);
}


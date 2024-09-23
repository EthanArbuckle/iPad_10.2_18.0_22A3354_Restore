uint64_t _pairSetupPromptForSetupCode(int a1, int a2, void *a3)
{
  id v5;
  void *v6;
  NSObject *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  _QWORD v12[5];
  int v13;
  int v14;

  v5 = a3;
  v6 = (void *)*((_QWORD *)v5 + 15);
  if (v6)
  {
    v7 = v6;
    dispatch_source_cancel(v7);
    v8 = (void *)*((_QWORD *)v5 + 15);
    *((_QWORD *)v5 + 15) = 0;

  }
  if (*((_QWORD *)v5 + 21))
  {
    *((CFAbsoluteTime *)v5 + 51) = CFAbsoluteTimeGetCurrent();
    v9 = *((_QWORD *)v5 + 2);
    v12[0] = MEMORY[0x24BDAC760];
    v12[1] = 3221225472;
    v12[2] = ___pairSetupPromptForSetupCode_block_invoke;
    v12[3] = &unk_24D1B9150;
    v12[4] = v5;
    v13 = a1;
    v14 = a2;
    dispatch_async(v9, v12);
    v10 = 0;
  }
  else
  {
    v10 = 4294960551;
  }

  return v10;
}

uint64_t ___pairSetupPromptForSetupCode_block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 168);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD, _QWORD))(result + 16))(result, *(unsigned int *)(a1 + 40), *(unsigned int *)(a1 + 44));
  return result;
}

__CFDictionary *EasyConfigCreateDictionaryFromTLV(uint64_t a1, uint64_t a2, int *a3)
{
  CFMutableDictionaryRef Mutable;
  __CFDictionary *v5;
  CFStringRef v6;
  CFStringRef v7;
  __CFDictionary *v8;
  int v10;

  Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  if (Mutable)
  {
    v5 = Mutable;
    while (1)
    {
      if (TLV8GetNext())
      {
        v10 = 0;
        v8 = v5;
        v5 = 0;
        goto LABEL_7;
      }
      v6 = CFStringCreateWithBytes(0, 0, 0, 0x8000100u, 0);
      if (!v6)
        break;
      v7 = v6;
      CFDictionarySetValue(v5, CFSTR("adminPassword"), v6);
      CFRelease(v7);
    }
    v8 = 0;
    v10 = -6742;
LABEL_7:
    if (v5)
      CFRelease(v5);
  }
  else
  {
    v8 = 0;
    v10 = -6728;
  }
  if (a3)
    *a3 = v10;
  return v8;
}

uint64_t EasyConfigCreateTLVfromDictionary(const __CFDictionary *a1, uint64_t a2, _DWORD *a3)
{
  _OWORD context[35];
  int v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  memset(context, 0, 512);
  DataBuffer_Init();
  v7 = 0;
  CFDictionaryApplyFunction(a1, (CFDictionaryApplierFunction)_EasyConfigCreateTLVfromDictionaryApplier, context);
  if (!v7)
    v7 = DataBuffer_Detach();
  DataBuffer_Free();
  if (a3)
    *a3 = v7;
  return 0;
}

uint64_t _EasyConfigCreateTLVfromDictionaryApplier(uint64_t result, const __CFString *cf, uint64_t a3)
{
  const void *v5;
  CFTypeID v6;
  CFIndex Count;
  CFIndex v8;
  CFIndex v9;
  const __CFString *ValueAtIndex;
  CFTypeID v11;
  char buffer[256];
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  if (!*(_DWORD *)(a3 + 568))
  {
    v5 = (const void *)result;
    v6 = CFGetTypeID(cf);
    if (CFEqual(v5, CFSTR("adminPassword"))
      || CFEqual(v5, CFSTR("bundleSeedID"))
      || CFEqual(v5, CFSTR("countryCode"))
      || CFEqual(v5, CFSTR("firmwareRevision"))
      || CFEqual(v5, CFSTR("hardwareRevision"))
      || CFEqual(v5, CFSTR("indoorOutdoorMode"))
      || CFEqual(v5, CFSTR("language"))
      || CFEqual(v5, CFSTR("manufacturer"))
      || CFEqual(v5, CFSTR("model"))
      || CFEqual(v5, CFSTR("name"))
      || CFEqual(v5, CFSTR("operationType"))
      || CFEqual(v5, CFSTR("playPassword"))
      || CFEqual(v5, CFSTR("serialNumber"))
      || CFEqual(v5, CFSTR("wifiEAPTLSCert"))
      || CFEqual(v5, CFSTR("wifiPSK"))
      || CFEqual(v5, CFSTR("wifiRouterCert"))
      || CFEqual(v5, CFSTR("wifiSSID")))
    {
      if (v6 == CFStringGetTypeID())
      {
        buffer[0] = 0;
        if (!CFStringGetCString(cf, buffer, 256, 0x8000100u))
        {
LABEL_44:
          result = 4294960559;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if (v6 == CFDataGetTypeID())
      {
        CFDataGetBytePtr((CFDataRef)cf);
        CFDataGetLength((CFDataRef)cf);
LABEL_26:
        result = DataBuffer_AppendIE();
LABEL_27:
        *(_DWORD *)(a3 + 568) = result;
        return result;
      }
      if (v6 == CFNumberGetTypeID())
      {
        *(_QWORD *)buffer = 0;
        CFNumberGetValue((CFNumberRef)cf, kCFNumberSInt64Type, buffer);
        if (*(_QWORD *)buffer > 0xFFuLL)
        {
          result = 4294960586;
          goto LABEL_27;
        }
        goto LABEL_26;
      }
      if ((int)*MEMORY[0x24BE29BC0] <= 50 && (*MEMORY[0x24BE29BC0] != -1 || _LogCategory_Initialize()))
        LogPrintF();
LABEL_33:
      result = 4294960540;
      goto LABEL_27;
    }
    if (CFEqual(v5, CFSTR("mfiProtocols")))
    {
      if (v6 != CFArrayGetTypeID())
        goto LABEL_33;
      Count = CFArrayGetCount((CFArrayRef)cf);
      if (Count >= 1)
      {
        v8 = Count;
        v9 = 0;
        while (1)
        {
          ValueAtIndex = (const __CFString *)CFArrayGetValueAtIndex((CFArrayRef)cf, v9);
          v11 = CFGetTypeID(ValueAtIndex);
          if (v11 != CFStringGetTypeID())
            goto LABEL_33;
          buffer[0] = 0;
          if (!CFStringGetCString(ValueAtIndex, buffer, 256, 0x8000100u))
            goto LABEL_44;
          result = DataBuffer_AppendIE();
          if (!(_DWORD)result && v8 != ++v9)
            continue;
          goto LABEL_27;
        }
      }
    }
    else if ((int)*MEMORY[0x24BE29BC0] <= 50)
    {
      if (*MEMORY[0x24BE29BC0] == -1)
      {
        result = _LogCategory_Initialize();
        if (!(_DWORD)result)
          goto LABEL_27;
      }
      LogPrintF();
    }
    result = 0;
    goto LABEL_27;
  }
  return result;
}

uint64_t BonjourBrowser_Create()
{
  return MEMORY[0x24BE28EC0]();
}

uint64_t BonjourBrowser_SetDispatchQueue()
{
  return MEMORY[0x24BE28EC8]();
}

uint64_t BonjourBrowser_SetEventHandlerBlock()
{
  return MEMORY[0x24BE28ED0]();
}

uint64_t BonjourBrowser_Start()
{
  return MEMORY[0x24BE28ED8]();
}

uint64_t BonjourBrowser_Stop()
{
  return MEMORY[0x24BE28EE0]();
}

uint64_t BonjourDevice_GetDNSName()
{
  return MEMORY[0x24BE28EE8]();
}

uint64_t BonjourDevice_GetDeviceID()
{
  return MEMORY[0x24BE28EF0]();
}

uint64_t BonjourDevice_GetInt64()
{
  return MEMORY[0x24BE28EF8]();
}

uint64_t BonjourDevice_Reconfirm()
{
  return MEMORY[0x24BE28F00]();
}

CFAbsoluteTime CFAbsoluteTimeGetCurrent(void)
{
  CFAbsoluteTime result;

  MEMORY[0x24BDBB780]();
  return result;
}

void CFArrayAppendValue(CFMutableArrayRef theArray, const void *value)
{
  MEMORY[0x24BDBB7C8](theArray, value);
}

CFMutableArrayRef CFArrayCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFArrayCallBacks *callBacks)
{
  return (CFMutableArrayRef)MEMORY[0x24BDBB808](allocator, capacity, callBacks);
}

CFIndex CFArrayGetCount(CFArrayRef theArray)
{
  return MEMORY[0x24BDBB820](theArray);
}

CFTypeID CFArrayGetTypeID(void)
{
  return MEMORY[0x24BDBB850]();
}

const void *__cdecl CFArrayGetValueAtIndex(CFArrayRef theArray, CFIndex idx)
{
  return (const void *)MEMORY[0x24BDBB860](theArray, idx);
}

uint64_t CFCreateWithPlistBytes()
{
  return MEMORY[0x24BE28F40]();
}

CFDataRef CFDataCreate(CFAllocatorRef allocator, const UInt8 *bytes, CFIndex length)
{
  return (CFDataRef)MEMORY[0x24BDBBC98](allocator, bytes, length);
}

const UInt8 *__cdecl CFDataGetBytePtr(CFDataRef theData)
{
  return (const UInt8 *)MEMORY[0x24BDBBCE0](theData);
}

CFIndex CFDataGetLength(CFDataRef theData)
{
  return MEMORY[0x24BDBBCF8](theData);
}

CFTypeID CFDataGetTypeID(void)
{
  return MEMORY[0x24BDBBD08]();
}

void CFDictionaryApplyFunction(CFDictionaryRef theDict, CFDictionaryApplierFunction applier, void *context)
{
  MEMORY[0x24BDBBDB8](theDict, applier, context);
}

CFMutableDictionaryRef CFDictionaryCreateMutable(CFAllocatorRef allocator, CFIndex capacity, const CFDictionaryKeyCallBacks *keyCallBacks, const CFDictionaryValueCallBacks *valueCallBacks)
{
  return (CFMutableDictionaryRef)MEMORY[0x24BDBBDF0](allocator, capacity, keyCallBacks, valueCallBacks);
}

uint64_t CFDictionaryGetHardwareAddress()
{
  return MEMORY[0x24BE28F80]();
}

uint64_t CFDictionaryGetInt64()
{
  return MEMORY[0x24BE28F88]();
}

CFTypeID CFDictionaryGetTypeID(void)
{
  return MEMORY[0x24BDBBE18]();
}

uint64_t CFDictionaryGetTypedValue()
{
  return MEMORY[0x24BE28F98]();
}

const void *__cdecl CFDictionaryGetValue(CFDictionaryRef theDict, const void *key)
{
  return (const void *)MEMORY[0x24BDBBE30](theDict, key);
}

uint64_t CFDictionarySetInt64()
{
  return MEMORY[0x24BE28FC0]();
}

void CFDictionarySetValue(CFMutableDictionaryRef theDict, const void *key, const void *value)
{
  MEMORY[0x24BDBBE60](theDict, key, value);
}

Boolean CFEqual(CFTypeRef cf1, CFTypeRef cf2)
{
  return MEMORY[0x24BDBBE68](cf1, cf2);
}

CFTypeID CFGetTypeID(CFTypeRef cf)
{
  return MEMORY[0x24BDBBEF8](cf);
}

CFTypeID CFNumberGetTypeID(void)
{
  return MEMORY[0x24BDBC118]();
}

Boolean CFNumberGetValue(CFNumberRef number, CFNumberType theType, void *valuePtr)
{
  return MEMORY[0x24BDBC130](number, theType, valuePtr);
}

void CFRelease(CFTypeRef cf)
{
  MEMORY[0x24BDBC298](cf);
}

CFComparisonResult CFStringCompare(CFStringRef theString1, CFStringRef theString2, CFStringCompareFlags compareOptions)
{
  return MEMORY[0x24BDBC4D0](theString1, theString2, compareOptions);
}

CFStringRef CFStringCreateWithBytes(CFAllocatorRef alloc, const UInt8 *bytes, CFIndex numBytes, CFStringEncoding encoding, Boolean isExternalRepresentation)
{
  return (CFStringRef)MEMORY[0x24BDBC558](alloc, bytes, numBytes, *(_QWORD *)&encoding, isExternalRepresentation);
}

Boolean CFStringGetCString(CFStringRef theString, char *buffer, CFIndex bufferSize, CFStringEncoding encoding)
{
  return MEMORY[0x24BDBC600](theString, buffer, bufferSize, *(_QWORD *)&encoding);
}

CFTypeID CFStringGetTypeID(void)
{
  return MEMORY[0x24BDBC698]();
}

uint64_t DataBuffer_AppendIE()
{
  return MEMORY[0x24BE29318]();
}

uint64_t DataBuffer_Detach()
{
  return MEMORY[0x24BE29328]();
}

uint64_t DataBuffer_Free()
{
  return MEMORY[0x24BE29330]();
}

uint64_t DataBuffer_Init()
{
  return MEMORY[0x24BE29338]();
}

uint64_t DebugGetErrorString()
{
  return MEMORY[0x24BE29350]();
}

uint64_t HTTPClientCreate()
{
  return MEMORY[0x24BE29418]();
}

uint64_t HTTPClientInvalidate()
{
  return MEMORY[0x24BE29438]();
}

uint64_t HTTPClientSendMessage()
{
  return MEMORY[0x24BE29440]();
}

uint64_t HTTPClientSetDestination()
{
  return MEMORY[0x24BE29458]();
}

uint64_t HTTPClientSetDispatchQueue()
{
  return MEMORY[0x24BE29460]();
}

uint64_t HTTPClientSetFlags()
{
  return MEMORY[0x24BE29468]();
}

uint64_t HTTPClientSetLogging()
{
  return MEMORY[0x24BE29470]();
}

uint64_t HTTPClientSetTransportDelegate()
{
  return MEMORY[0x24BE29480]();
}

uint64_t HTTPHeader_InitRequest()
{
  return MEMORY[0x24BE294C0]();
}

uint64_t HTTPHeader_InitRequestF()
{
  return MEMORY[0x24BE294C8]();
}

uint64_t HTTPHeader_SetField()
{
  return MEMORY[0x24BE294E0]();
}

uint64_t HTTPMessageCreate()
{
  return MEMORY[0x24BE294F8]();
}

uint64_t HTTPMessageSetBody()
{
  return MEMORY[0x24BE29510]();
}

uint64_t HTTPMessageSetBodyLength()
{
  return MEMORY[0x24BE29518]();
}

uint64_t HTTPMessageSetCompletionBlock()
{
  return MEMORY[0x24BE29520]();
}

uint64_t IEGetVendorSpecific()
{
  return MEMORY[0x24BE295A0]();
}

uint64_t LogControl()
{
  return MEMORY[0x24BE295D8]();
}

uint64_t LogPrintF()
{
  return MEMORY[0x24BE295F0]();
}

uint64_t MFiSAP_Create()
{
  return MEMORY[0x24BE29610]();
}

uint64_t MFiSAP_Decrypt()
{
  return MEMORY[0x24BE29618]();
}

uint64_t MFiSAP_Delete()
{
  return MEMORY[0x24BE29620]();
}

uint64_t MFiSAP_Encrypt()
{
  return MEMORY[0x24BE29628]();
}

uint64_t MFiSAP_Exchange()
{
  return MEMORY[0x24BE29630]();
}

uint64_t NetTransportChaCha20Poly1305Configure()
{
  return MEMORY[0x24BE29760]();
}

uint64_t PairingSessionCreate()
{
  return MEMORY[0x24BE298A8]();
}

uint64_t PairingSessionDeriveKey()
{
  return MEMORY[0x24BE298B8]();
}

uint64_t PairingSessionExchange()
{
  return MEMORY[0x24BE298C0]();
}

uint64_t PairingSessionSetFlags()
{
  return MEMORY[0x24BE298D0]();
}

uint64_t PairingSessionSetKeychainInfo()
{
  return MEMORY[0x24BE298D8]();
}

uint64_t PairingSessionSetLogging()
{
  return MEMORY[0x24BE298E0]();
}

uint64_t PairingSessionSetSetupCode()
{
  return MEMORY[0x24BE298E8]();
}

uint64_t TLV8Get()
{
  return MEMORY[0x24BE29A60]();
}

uint64_t TLV8GetNext()
{
  return MEMORY[0x24BE29A68]();
}

uint64_t TLVParseSInt64()
{
  return MEMORY[0x24BE29A80]();
}

const void *__cdecl TXTRecordGetValuePtr(uint16_t txtLen, const void *txtRecord, const char *key, uint8_t *valueLen)
{
  return (const void *)MEMORY[0x24BDAC588](txtLen, txtRecord, key, valueLen);
}

uint64_t TextToSourceVersion()
{
  return MEMORY[0x24BE29AB0]();
}

uint64_t _LogCategory_Initialize()
{
  return MEMORY[0x24BE29B48]();
}

void dispatch_async(dispatch_queue_t queue, dispatch_block_t block)
{
  MEMORY[0x24BDADCC0](queue, block);
}

dispatch_queue_t dispatch_queue_create(const char *label, dispatch_queue_attr_t attr)
{
  return (dispatch_queue_t)MEMORY[0x24BDADED0](label, attr);
}

void dispatch_resume(dispatch_object_t object)
{
  MEMORY[0x24BDADF18](object);
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

dispatch_time_t dispatch_time(dispatch_time_t when, int64_t delta)
{
  return MEMORY[0x24BDADFF8](when, delta);
}

void free(void *a1)
{
  MEMORY[0x24BDAE450](a1);
}

errno_t memset_s(void *__s, rsize_t __smax, int __c, rsize_t __n)
{
  return MEMORY[0x24BDAEEC8](__s, __smax, *(_QWORD *)&__c, __n);
}

uint64_t objc_alloc_init()
{
  return MEMORY[0x24BEDCF88]();
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

uint64_t objc_opt_class()
{
  return MEMORY[0x24BEDD130]();
}

void objc_release(id a1)
{
  MEMORY[0x24BEDD188](a1);
}

id objc_retain(id a1)
{
  return (id)MEMORY[0x24BEDD2A0](a1);
}

id objc_retainAutorelease(id a1)
{
  return (id)MEMORY[0x24BEDD2A8](a1);
}

id objc_retainBlock(id a1)
{
  return (id)MEMORY[0x24BEDD2C0](a1);
}

void objc_setProperty_nonatomic_copy(id self, SEL _cmd, id newValue, ptrdiff_t offset)
{
  MEMORY[0x24BEDD408](self, _cmd, newValue, offset);
}

void objc_storeStrong(id *location, id obj)
{
  MEMORY[0x24BEDD410](location, obj);
}


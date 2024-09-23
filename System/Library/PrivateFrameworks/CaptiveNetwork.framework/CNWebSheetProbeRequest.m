@implementation CNWebSheetProbeRequest

void __CNWebSheetProbeRequest_block_invoke(uint64_t a1)
{
  const void *v2;
  CFDictionaryRef v3;
  _BOOL4 v4;
  NSObject *logger;
  os_log_type_t v6;
  CFDictionaryRef v7;
  CFTypeID TypeID;
  const void *Value;
  CFTypeID v10;
  __CFDictionary *Mutable;
  NSObject *v12;
  os_log_type_t v13;
  NSObject *v14;
  os_log_type_t v15;
  __CFRunLoop *v16;
  const void *v17;
  CFDictionaryRef theDict;
  void *values;
  int valuePtr;
  _BYTE keys[24];
  void *v22;
  const void *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = *(const void **)(a1 + 32);
  theDict = 0;
  valuePtr = 1;
  *(_QWORD *)keys = CFSTR("Type");
  values = CFNumberCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], kCFNumberSInt32Type, &valuePtr);
  v3 = CFDictionaryCreate(0, (const void **)keys, (const void **)&values, 1, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
  CFRelease(values);
  v4 = ServerConnectionProcessControl(*(_QWORD *)G_websheet, v3, &theDict);
  CFRelease(v3);
  if (!v4)
  {
    logger = mysyslog_get_logger();
    v6 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(logger, v6))
    {
      *(_WORD *)keys = 0;
      _os_log_impl(&dword_2064D4000, logger, v6, "ServerConnectionProcessControl failed", keys, 2u);
    }
  }
  v7 = theDict;
  TypeID = CFDictionaryGetTypeID();
  if (v7)
  {
    if (CFGetTypeID(v7) == TypeID)
    {
      Value = CFDictionaryGetValue(theDict, CFSTR("ProbeID"));
      v10 = CFStringGetTypeID();
      if (Value)
      {
        if (CFGetTypeID(Value) == v10)
        {
          Mutable = *(__CFDictionary **)(G_websheet + 48);
          if (!Mutable)
          {
            Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x24BDBD6A0], MEMORY[0x24BDBD6B0]);
            *(_QWORD *)(G_websheet + 48) = Mutable;
          }
          CFDictionarySetValue(Mutable, Value, v2);
          v12 = mysyslog_get_logger();
          v13 = _SC_syslog_os_log_mapping();
          if (os_log_type_enabled(v12, v13))
          {
            *(_DWORD *)keys = 138412546;
            *(_QWORD *)&keys[4] = Value;
            *(_WORD *)&keys[12] = 2048;
            *(_QWORD *)&keys[14] = v2;
            _os_log_impl(&dword_2064D4000, v12, v13, "%@ prober %p", keys, 0x16u);
          }
          v4 = 1;
        }
      }
    }
  }
  if (theDict)
  {
    CFRelease(theDict);
    theDict = 0;
  }
  if (!v4)
  {
    v14 = mysyslog_get_logger();
    v15 = _SC_syslog_os_log_mapping();
    if (os_log_type_enabled(v14, v15))
    {
      *(_WORD *)keys = 0;
      _os_log_impl(&dword_2064D4000, v14, v15, "Prober failed", keys, 2u);
    }
    CFRetain(v2);
    v16 = *(__CFRunLoop **)(G_websheet + 40);
    v17 = (const void *)*MEMORY[0x24BDBD598];
    *(_QWORD *)keys = MEMORY[0x24BDAC760];
    *(_QWORD *)&keys[8] = 0x40000000;
    *(_QWORD *)&keys[16] = __startProbe_block_invoke;
    v22 = &__block_descriptor_tmp_22;
    v23 = v2;
    CFRunLoopPerformBlock(v16, v17, keys);
    CFRunLoopWakeUp(*(CFRunLoopRef *)(G_websheet + 40));
  }
  CFRelease(*(CFTypeRef *)(a1 + 32));
}

@end

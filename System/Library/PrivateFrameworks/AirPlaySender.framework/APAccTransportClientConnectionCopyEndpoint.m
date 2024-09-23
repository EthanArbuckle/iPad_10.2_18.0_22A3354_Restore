@implementation APAccTransportClientConnectionCopyEndpoint

void __APAccTransportClientConnectionCopyEndpoint_block_invoke(uint64_t a1)
{
  const __CFAllocator *v2;
  CFStringRef v3;
  _QWORD *Value;
  _QWORD *v5;
  uint64_t v6;
  const __CFDictionary *v7;
  const void *v8;
  const char *v9;
  const void *v10;
  uint64_t Instance;
  dispatch_queue_t v12;
  CFTypeRef v13;
  int v14;

  if (!*(_QWORD *)(*(_QWORD *)(a1 + 40) + 32))
    *(_QWORD *)(*(_QWORD *)(a1 + 40) + 32) = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  v2 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v3 = CFStringCreateWithCString((CFAllocatorRef)*MEMORY[0x1E0C9AE00], *(const char **)(a1 + 48), 0x8000100u);
  Value = CFDictionaryGetValue(*(CFDictionaryRef *)(*(_QWORD *)(a1 + 40) + 32), v3);
  if (Value)
  {
    v5 = Value;
    CFRetain(Value);
    goto LABEL_24;
  }
  v6 = *(_QWORD *)(a1 + 40);
  v7 = *(const __CFDictionary **)(v6 + 40);
  if (v7)
  {
    v8 = CFDictionaryGetValue(v7, CFSTR("authenticationCertificateSerial"));
    v6 = *(_QWORD *)(a1 + 40);
  }
  else
  {
    v8 = 0;
  }
  v9 = *(const char **)(a1 + 48);
  if (!v9 || (v10 = *(const void **)(v6 + 24)) == 0)
  {
    APSLogErrorAt();
    v5 = 0;
    v14 = -6705;
    goto LABEL_22;
  }
  if (gAPAccTransportClientEndpointInitOnce != -1)
    dispatch_once_f(&gAPAccTransportClientEndpointInitOnce, 0, (dispatch_function_t)_APAccTransportClientEndpointGetTypeID);
  Instance = _CFRuntimeCreateInstance();
  v5 = (_QWORD *)Instance;
  if (!Instance)
  {
    APSLogErrorAt();
LABEL_34:
    v14 = -6728;
    goto LABEL_22;
  }
  *(_QWORD *)(Instance + 80) = 0;
  *(_OWORD *)(Instance + 48) = 0u;
  *(_OWORD *)(Instance + 64) = 0u;
  *(_OWORD *)(Instance + 16) = 0u;
  *(_OWORD *)(Instance + 32) = 0u;
  v12 = dispatch_queue_create(v9, 0);
  v5[3] = v12;
  if (!v12)
  {
    APSLogErrorAt();
    CFRelease(v5);
    v5 = 0;
    goto LABEL_34;
  }
  v5[4] = CFStringCreateWithCString(v2, v9, 0x8000100u);
  v5[5] = CFRetain(v10);
  if (v8)
    v13 = CFRetain(v8);
  else
    v13 = 0;
  v5[7] = v13;
  if (gLogCategory_APAccTransportClientEndpoint <= 50
    && (gLogCategory_APAccTransportClientEndpoint != -1 || _LogCategory_Initialize()))
  {
    LogPrintF();
  }
  v14 = 0;
LABEL_22:
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = v14;
  if (!*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24))
  {
    CFDictionaryAddValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 40) + 32), v3, v5);
LABEL_24:
    **(_QWORD **)(a1 + 56) = v5;
    v5 = 0;
    if (!v3)
      goto LABEL_26;
    goto LABEL_25;
  }
  APSLogErrorAt();
  if (v3)
LABEL_25:
    CFRelease(v3);
LABEL_26:
  if (v5)
    CFRelease(v5);
}

@end

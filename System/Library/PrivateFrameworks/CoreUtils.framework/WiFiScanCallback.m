@implementation WiFiScanCallback

void ___WiFiScanCallback_block_invoke(uint64_t a1)
{
  _QWORD *v1;
  uint64_t v2;
  void (*v3)(uint64_t, __CFArray *, uint64_t);
  uint64_t v4;
  const __CFArray *v5;
  CFMutableArrayRef Mutable;
  __CFArray *v7;
  CFIndex Count;
  CFIndex v9;
  CFIndex v10;
  const void *v11;
  const void *ValueAtIndex;
  CFMutableDictionaryRef v13;
  __CFDictionary *v14;
  const __CFString *Property;
  const void *Channel;
  uint64_t v17;
  const void *v18;
  const void *v19;
  uint64_t SSID;
  const __CFString *v21;
  uint64_t v22;
  const void *v23;
  uint64_t v24;
  void (*v25)(uint64_t, __CFArray *, uint64_t);
  _QWORD *v26;
  int v27;
  __int16 v28;

  v1 = (_QWORD *)a1;
  v2 = *(unsigned int *)(a1 + 56);
  v3 = (void (*)(uint64_t, __CFArray *, uint64_t))v1[5];
  v4 = v1[6];
  if ((_DWORD)v2)
    goto LABEL_42;
  v5 = (const __CFArray *)v1[4];
  if (!v5)
  {
    v2 = 4294960596;
LABEL_42:
    v3(v2, 0, v4);
    goto LABEL_36;
  }
  Mutable = CFArrayCreateMutable(0, 0, MEMORY[0x1E0C9B378]);
  if (!Mutable)
  {
    v2 = 4294960568;
    goto LABEL_42;
  }
  v7 = Mutable;
  Count = CFArrayGetCount(v5);
  if (Count < 1)
  {
    v3(0, v7, v4);
    goto LABEL_35;
  }
  v9 = Count;
  v24 = v4;
  v25 = v3;
  v26 = v1;
  v10 = 0;
  v11 = (const void *)*MEMORY[0x1E0C9AE50];
  while (1)
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v5, v10);
    v13 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
    if (!v13)
      break;
    v14 = v13;
    if (WiFiNetworkIsAdHoc())
      CFDictionarySetValue(v14, CFSTR("adhoc"), v11);
    v28 = 0;
    v27 = 0;
    Property = (const __CFString *)WiFiNetworkGetProperty();
    CFGetHardwareAddress(Property, (char *)&v27, 6uLL, 0);
    CFDictionarySetHardwareAddress(v14, CFSTR("bssid"), (unsigned __int8 *)&v27, 6);
    Channel = (const void *)WiFiNetworkGetChannel();
    if (Channel)
      CFDictionarySetValue(v14, CFSTR("channel"), Channel);
    if (WiFiNetworkGetDirectedState())
      CFDictionarySetValue(v14, CFSTR("directed"), v11);
    if (WiFiNetworkIsEAP())
      CFDictionarySetValue(v14, CFSTR("enterprise"), v11);
    if (WiFiNetworkIsHidden())
      CFDictionarySetValue(v14, CFSTR("hidden"), v11);
    if (WiFiNetworkIsHotspot20())
    {
      v17 = 2;
LABEL_21:
      CFDictionarySetInt64(v14, CFSTR("hotspot"), v17);
      goto LABEL_22;
    }
    if (WiFiNetworkIsHotspot())
    {
      v17 = 1;
      goto LABEL_21;
    }
LABEL_22:
    v18 = (const void *)WiFiNetworkGetProperty();
    if (v18)
      CFDictionarySetValue(v14, CFSTR("ie"), v18);
    CFDictionarySetValue(v14, CFSTR("platformNetwork"), ValueAtIndex);
    if (WiFiNetworkIsProfileBased())
      CFDictionarySetValue(v14, CFSTR("profileBased"), v11);
    v19 = (const void *)WiFiNetworkGetProperty();
    if (v19)
      CFDictionarySetValue(v14, CFSTR("rssi"), v19);
    SSID = WiFiNetworkGetSSID();
    if (SSID)
      v21 = (const __CFString *)SSID;
    else
      v21 = &stru_1E25DF9F8;
    CFDictionarySetValue(v14, CFSTR("ssid"), v21);
    CFArrayAppendValue(v7, v14);
    CFRelease(v14);
    if (v9 == ++v10)
    {
      v22 = 0;
      goto LABEL_33;
    }
  }
  v22 = 4294960568;
LABEL_33:
  v1 = v26;
  v25(v22, v7, v24);
LABEL_35:
  CFRelease(v7);
LABEL_36:
  v23 = (const void *)v1[4];
  if (v23)
    CFRelease(v23);
}

@end

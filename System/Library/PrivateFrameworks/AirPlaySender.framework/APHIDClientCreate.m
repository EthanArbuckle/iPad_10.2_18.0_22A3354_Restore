@implementation APHIDClientCreate

void __APHIDClientCreate_block_invoke(uint64_t a1, const void *a2)
{
  CFMutableArrayRef *v3;
  __CFDictionary *Mutable;
  __CFDictionary *v5;
  const void *TypedValue;
  const void *v7;
  const void *v8;
  const void *v9;
  const void *v10;
  const void *v11;
  const void *v12;
  const void *v13;
  const void *v14;
  const void *v15;
  int v16;
  int v17;

  v3 = *(CFMutableArrayRef **)(a1 + 32);
  v17 = 0;
  Mutable = CFDictionaryCreateMutable((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, MEMORY[0x1E0C9B390], MEMORY[0x1E0C9B3A0]);
  if (!Mutable)
  {
    APSLogErrorAt();
LABEL_30:
    if (gLogCategory_APHIDClient <= 60 && (gLogCategory_APHIDClient != -1 || _LogCategory_Initialize()))
      LogPrintF();
    return;
  }
  v5 = Mutable;
  CFDictionarySetValue(Mutable, CFSTR("Category"), CFSTR("Automotive"));
  CFNumberGetTypeID();
  TypedValue = (const void *)CFDictionaryGetTypedValue();
  if (TypedValue)
    CFDictionarySetValue(v5, CFSTR("CountryCode"), TypedValue);
  CFDataGetTypeID();
  v7 = (const void *)CFDictionaryGetTypedValue();
  CFDictionarySetValue(v5, CFSTR("ReportDescriptor"), v7);
  CFStringGetTypeID();
  v8 = (const void *)CFDictionaryGetTypedValue();
  CFDictionarySetValue(v5, CFSTR("SerialNumber"), v8);
  CFStringGetTypeID();
  v9 = (const void *)CFDictionaryGetTypedValue();
  if (v9)
    CFDictionarySetValue(v5, CFSTR("Product"), v9);
  CFNumberGetTypeID();
  v10 = (const void *)CFDictionaryGetTypedValue();
  if (v10)
    CFDictionarySetValue(v5, CFSTR("ProductID"), v10);
  CFDictionarySetValue(v5, CFSTR("Transport"), CFSTR("AirPlay"));
  CFNumberGetTypeID();
  v11 = (const void *)CFDictionaryGetTypedValue();
  if (v11)
    CFDictionarySetValue(v5, CFSTR("VendorID"), v11);
  CFDictionarySetInt64();
  CFStringGetTypeID();
  v12 = (const void *)CFDictionaryGetTypedValue();
  if (v12)
    CFDictionarySetValue(v5, CFSTR("displayUUID"), v12);
  v13 = (const void *)IOHIDUserDeviceCreate();
  if (v13)
  {
    v14 = v13;
    CFDictionarySetValue(v3[3], v8, v13);
    CFNumberGetTypeID();
    v15 = (const void *)CFDictionaryGetTypedValue();
    if (v15)
      CFDictionarySetValue(v3[4], v8, v15);
    else
      CFDictionarySetInt64();
    CFArrayAppendValue(v3[2], a2);
    if (gLogCategory_APHIDClient <= 40 && (gLogCategory_APHIDClient != -1 || _LogCategory_Initialize()))
    {
      CFDictionaryGetValue((CFDictionaryRef)a2, CFSTR("name"));
      v16 = gLogCategory_APHIDClient;
      if (gLogCategory_APHIDClient <= 20)
      {
        if (gLogCategory_APHIDClient != -1
          || (_LogCategory_Initialize(), v16 = gLogCategory_APHIDClient, gLogCategory_APHIDClient <= 20))
        {
          if (v16 == -1)
            _LogCategory_Initialize();
        }
      }
      LogPrintF();
    }
    CFRelease(v14);
  }
  else
  {
    APSLogErrorAt();
    v17 = -72041;
  }
  CFRelease(v5);
  if (v17)
    goto LABEL_30;
}

@end

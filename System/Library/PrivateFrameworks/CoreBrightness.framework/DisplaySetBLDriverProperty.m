@implementation DisplaySetBLDriverProperty

uint64_t ____DisplaySetBLDriverProperty_block_invoke_2(uint64_t result)
{
  *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(result + 32) + 8) + 24) = *(_QWORD *)(*(_QWORD *)(result + 40) + 128);
  *(_QWORD *)(*(_QWORD *)(result + 40) + 128) = 0;
  return result;
}

void ____DisplaySetBLDriverProperty_block_invoke(uint64_t a1)
{
  NSObject *v2;
  CFTypeRef cf;
  const void *Value;
  CFTypeRef property;
  CFIndex Count;
  void (*v8)(void);
  int v9;
  int v10;
  uint64_t (*v11)(uint64_t);
  void *v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t *v16;
  int v17;
  int v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;

  v21 = a1;
  v20 = a1;
  v15 = 0;
  v16 = &v15;
  v17 = 0x20000000;
  v18 = 32;
  v19 = 0;
  v2 = *(NSObject **)(*(_QWORD *)(a1 + 32) + 144);
  v8 = (void (*)(void))MEMORY[0x1E0C809B0];
  v9 = -1073741824;
  v10 = 0;
  v11 = ____DisplaySetBLDriverProperty_block_invoke_2;
  v12 = &unk_1E68EB450;
  v13 = &v15;
  v14 = *(_QWORD *)(a1 + 32);
  disp_dispatch_sync(v2, &v8);
  if (v16[3])
  {
    Count = CFDictionaryGetCount((CFDictionaryRef)v16[3]);
    if (Count > 0)
    {
      property = CFDictionaryGetValue((CFDictionaryRef)v16[3], CFSTR("brightness-nits-cap"));
      if (property)
      {
        if ((DisplayHasDCP(*(_QWORD *)(a1 + 32)) & 1) != 0
          && *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108)
          && (*(_BYTE *)(*(_QWORD *)(a1 + 32) + 321) & 1) == 0)
        {
          IORegistryEntrySetCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 108), CFSTR("BLNitsCap"), property);
        }
        else
        {
          __SetBLDriverProperty(CFSTR("brightness-nits-cap"), property, *(_QWORD *)(a1 + 32));
        }
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v16[3], CFSTR("brightness-nits-cap"));
        --Count;
      }
      Value = CFDictionaryGetValue((CFDictionaryRef)v16[3], CFSTR("PreStrobeConfigNits"));
      if (Value)
      {
        __SetBLDriverProperty(CFSTR("PreStrobeConfigNits"), Value, *(_QWORD *)(a1 + 32));
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v16[3], CFSTR("PreStrobeConfigNits"));
        --Count;
      }
      cf = CFDictionaryGetValue((CFDictionaryRef)v16[3], CFSTR("DisplayBrightnessSliderPosition"));
      if (cf)
      {
        CFRetain(cf);
        CFDictionaryRemoveValue((CFMutableDictionaryRef)v16[3], CFSTR("DisplayBrightnessSliderPosition"));
        --Count;
      }
      if (Count > 0)
        CFDictionaryApplyFunction((CFDictionaryRef)v16[3], (CFDictionaryApplierFunction)__SetBLDriverProperty, *(void **)(a1 + 32));
      if (cf)
      {
        __SetBLDriverProperty(CFSTR("DisplayBrightnessSliderPosition"), cf, *(_QWORD *)(a1 + 32));
        CFRelease(cf);
      }
    }
    CFRelease((CFTypeRef)v16[3]);
  }
  _Block_object_dispose(&v15, 8);
}

@end

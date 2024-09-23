@implementation DisplaySetCurrentAmbient

void __DisplaySetCurrentAmbient_block_invoke(uint64_t a1)
{
  float v1;
  uint64_t v2;
  float v3;
  const __CFAllocator *v4;
  uint64_t v5;
  NSObject *v6;
  uint64_t inited;
  NSObject *v8;
  CFNumberRef property;
  int v11;
  float v12;
  void *__base;
  float v14;
  os_log_type_t type;
  os_log_t oslog;
  float v17;
  float v18;
  float v19;
  CFNumberRef v20;
  float v21;
  float v22;
  float BrightDotCap;
  float v24;
  BOOL v25;
  float v26;
  BOOL v27;
  uint64_t v28;
  uint64_t v29;
  uint8_t v30[32];
  uint8_t v31[56];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  v29 = a1;
  v28 = a1;
  v27 = 0;
  v27 = *(float *)(*(_QWORD *)(a1 + 32) + 1192) != *(float *)(a1 + 40);
  v26 = 0.0;
  v26 = *(float *)(a1 + 40) - *(float *)(*(_QWORD *)(a1 + 32) + 1192);
  *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1192) = *(_DWORD *)(a1 + 40);
  v25 = 0;
  if ((*(_BYTE *)(*(_QWORD *)(a1 + 32) + 1517) & 1) != 0 && (_DisplayBDMAvailable(*(_QWORD *)(a1 + 32)) & 1) != 0)
  {
    v24 = 0.0;
    v24 = *(float *)(*(_QWORD *)(a1 + 32) + 1168);
    BrightDotCap = 0.0;
    BrightDotCap = _DisplayGetBrightDotCap(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1192));
    v25 = v24 != BrightDotCap;
    if (v24 != BrightDotCap)
    {
      if (v26 < 850.0)
      {
        v22 = 0.0;
        v22 = *(float *)(*(_QWORD *)(a1 + 32) + 1172);
        v21 = BrightDotCap - v24;
        if ((float)(BrightDotCap - v24) <= v22)
        {
          if (v21 < (float)-v22)
            v21 = -v22;
        }
        else
        {
          v21 = v22;
        }
        *(float *)(*(_QWORD *)(a1 + 32) + 1168) = *(float *)(*(_QWORD *)(a1 + 32) + 1168) + v21;
      }
      else
      {
        *(float *)(*(_QWORD *)(a1 + 32) + 1168) = BrightDotCap;
      }
    }
  }
  if (v27)
  {
    v20 = 0;
    v20 = CFNumberCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], kCFNumberFloatType, (const void *)(a1 + 40));
    if (v20)
    {
      CFDictionarySetValue(*(CFMutableDictionaryRef *)(*(_QWORD *)(a1 + 32) + 192), CFSTR("TrustedLux"), v20);
      (*(void (**)(_QWORD, const __CFString *, CFNumberRef))(*(_QWORD *)(a1 + 32) + 16))(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 24), CFSTR("TrustedLux"), v20);
      CFRelease(v20);
    }
  }
  if (v25)
  {
    v1 = (float)*(int *)(*(_QWORD *)(a1 + 32) + 1248) / 65536.0;
    SendSyncDBVNotification(*(_QWORD *)(a1 + 32), 0, v1);
    v19 = 0.0;
    v19 = __DisplayLogicalToPhysicalBrightness(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1256));
    v18 = 0.0;
    v18 = _DisplayLogicalToSliderBrightnessInternal(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1256));
    v2 = *(_QWORD *)(a1 + 32);
    v3 = (float)*(int *)(v2 + 1248) / 65536.0;
    __DisplayUpdateSlider((float *)v2, v18, v19, v3);
  }
  if (v27 || v25)
  {
    v17 = 0.0;
    v17 = _DisplayComputeEDRNitsCap(*(_QWORD *)(a1 + 32));
    oslog = 0;
    if (_logHandle)
    {
      v8 = _logHandle;
    }
    else
    {
      if (_COREBRIGHTNESS_LOG_DEFAULT)
        inited = _COREBRIGHTNESS_LOG_DEFAULT;
      else
        inited = init_default_corebrightness_log();
      v8 = inited;
    }
    oslog = v8;
    type = OS_LOG_TYPE_DEBUG;
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      __os_log_helper_16_0_5_8_0_8_0_4_0_8_0_8_0((uint64_t)v31, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 1500)), COERCE__INT64(v17), *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12600), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 1192)), COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 12528)));
      _os_log_debug_impl(&dword_1B5291000, oslog, type, "Ambient change - SetLibEDRBrightness - physicalBrightness:%f, maxLum: %f, edrState: %d, lux: %f, brightness boost: %f\n", v31, 0x30u);
    }
    SetLibEDRBrightness(*(_QWORD *)(a1 + 32), *(float *)(*(_QWORD *)(a1 + 32) + 1500), v17, *(float *)(*(_QWORD *)(a1 + 32) + 1192), *(float *)(*(_QWORD *)(a1 + 32) + 12528));
  }
  if ((DisplayHasDCP(*(_QWORD *)(a1 + 32)) & 1) != 0
    && !-[CBAODState isAODActive](+[CBAODState sharedInstance](CBAODState, "sharedInstance"), "isAODActive")&& *(_DWORD *)(*(_QWORD *)(a1 + 32) + 108))
  {
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12740 + 4 * (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 12728))++) = *(_DWORD *)(*(_QWORD *)(a1 + 32) + 1192);
    *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12728) %= *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12736);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 12732) < *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12736))
      ++*(_DWORD *)(*(_QWORD *)(a1 + 32) + 12732);
    v14 = 0.0;
    v14 = *(float *)(*(_QWORD *)(a1 + 32) + 1192);
    if (*(_DWORD *)(*(_QWORD *)(a1 + 32) + 12732) > 1u)
    {
      __base = 0;
      __base = malloc_type_malloc(4 * *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12732), 0x100004052888210uLL);
      if (__base)
      {
        __memcpy_chk();
        qsort(__base, *(unsigned int *)(*(_QWORD *)(a1 + 32) + 12732), 4uLL, (int (__cdecl *)(const void *, const void *))_DisplayCompareFloats);
        v14 = *((float *)__base + *(_DWORD *)(*(_QWORD *)(a1 + 32) + 12732) / 2u);
        free(__base);
      }
    }
    if (v14 >= 0.0 && v14 != *(float *)(*(_QWORD *)(a1 + 32) + 12940))
    {
      *(float *)(*(_QWORD *)(a1 + 32) + 12940) = v14;
      v12 = fminf(v14, 30000.0);
      v11 = (int)(float)(v12 * 65536.0);
      v4 = CFGetAllocator(*(CFTypeRef *)(a1 + 32));
      property = CFNumberCreate(v4, kCFNumberSInt32Type, &v11);
      if (property)
      {
        if (_logHandle)
        {
          v6 = _logHandle;
        }
        else
        {
          if (_COREBRIGHTNESS_LOG_DEFAULT)
            v5 = _COREBRIGHTNESS_LOG_DEFAULT;
          else
            v5 = init_default_corebrightness_log();
          v6 = v5;
        }
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          __os_log_helper_16_0_2_8_0_8_0((uint64_t)v30, COERCE__INT64(*(float *)(*(_QWORD *)(a1 + 32) + 1192)), COERCE__INT64((float)((float)v11 / 65536.0)));
          _os_log_debug_impl(&dword_1B5291000, v6, OS_LOG_TYPE_DEBUG, "Set capped lux to IOMFB %f (%f)", v30, 0x16u);
        }
        IORegistryEntrySetCFProperty(*(_DWORD *)(*(_QWORD *)(a1 + 32) + 108), CFSTR("AmbientBrightness"), property);
        CFRelease(property);
      }
    }
  }
}

@end

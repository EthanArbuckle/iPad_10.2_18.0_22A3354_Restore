@implementation IOPSSetBatteryDateOfFirstUse

void __IOPSSetBatteryDateOfFirstUse_block_invoke()
{
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
    __IOPSSetBatteryDateOfFirstUse_block_invoke_cold_1();
}

void __IOPSSetBatteryDateOfFirstUse_block_invoke_63(uint64_t a1)
{
  unsigned int v2;
  double Current;
  const __CFArray *v4;
  double v5;
  const __CFArray *v6;
  CFTypeRef v7;
  const void *ValueAtIndex;
  const __CFDictionary *v9;
  CFTypeRef cf;

  if (*(_DWORD *)(a1 + 40))
    v2 = *(_DWORD *)(a1 + 40);
  else
    v2 = 300;
  Current = CFAbsoluteTimeGetCurrent();
  cf = 0;
  if (!IOPSCopyPowerSourcesByTypePrecise(1, (uint64_t *)&cf))
  {
    v5 = Current + (double)v2;
    while (cf)
    {
      v6 = IOPSCopyPowerSourcesList(cf);
      v4 = v6;
      if (!v6)
        goto LABEL_6;
      if (!CFArrayGetCount(v6))
        goto LABEL_6;
      v7 = cf;
      ValueAtIndex = CFArrayGetValueAtIndex(v4, 0);
      v9 = IOPSGetPowerSourceDescription(v7, ValueAtIndex);
      if (!v9 || CFDictionaryGetValue(v9, CFSTR("Date of first use")) || CFAbsoluteTimeGetCurrent() > v5)
        goto LABEL_6;
      CFRelease(v4);
      CFRelease(cf);
      cf = 0;
      sleep(1u);
      if (IOPSCopyPowerSourcesByTypePrecise(1, (uint64_t *)&cf))
      {
        v4 = 0;
        goto LABEL_6;
      }
    }
  }
  v4 = 0;
LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  if (v4)
    CFRelease(v4);
  if (cf)
    CFRelease(cf);
}

void __IOPSSetBatteryDateOfFirstUse_block_invoke_cold_1()
{
  uint64_t v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint8_t v5;

  OUTLINED_FUNCTION_4_1();
  OUTLINED_FUNCTION_5(&dword_18AAAF000, MEMORY[0x1E0C81028], v0, "Event handler is called %@\n", v1, v2, v3, v4, v5);
  OUTLINED_FUNCTION_3();
}

@end

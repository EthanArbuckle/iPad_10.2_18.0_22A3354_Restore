@implementation ZN13LSHandlerPref12CopyHandlersEv

const __CFArray *___ZN13LSHandlerPref12CopyHandlersEv_block_invoke(uint64_t a1, CFDictionaryRef theDict)
{
  const __CFArray *result;
  const __CFArray *v4;
  NSObject *v5;
  int v6;
  CFIndex Count;
  uint8_t v8[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  result = (const __CFArray *)CFDictionaryGetValue(theDict, CFSTR("LSHandlers"));
  if (result)
  {
    v4 = result;
    _LSDefaultLog();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      v6 = _CFGetEUID();
      Count = CFArrayGetCount(v4);
      ___ZN13LSHandlerPref12CopyHandlersEv_block_invoke_cold_1(v8, v6, Count, v5);
    }

    result = (const __CFArray *)CFRetain(v4);
    *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = result;
  }
  return result;
}

@end

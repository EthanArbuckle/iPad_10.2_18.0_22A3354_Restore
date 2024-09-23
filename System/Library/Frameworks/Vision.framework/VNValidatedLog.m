@implementation VNValidatedLog

void __VNValidatedLog_block_invoke(uint64_t a1, CFStringRef format, va_list arguments)
{
  const __CFString *v4;
  const __CFString *v5;
  const char *CStringPtr;
  const char *v7;
  NSObject *v8;
  unsigned int v9;
  const char *v10;
  int v11;
  const char *v12;
  __int16 v13;
  const char *v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v4 = CFStringCreateWithFormatAndArguments((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0, format, arguments);
  if (v4)
  {
    v5 = v4;
    CStringPtr = CFStringGetCStringPtr(v4, 0x8000100u);
    if (CStringPtr)
    {
      v7 = CStringPtr;
      if (_VisionLogger(void)::onceToken != -1)
        dispatch_once(&_VisionLogger(void)::onceToken, &__block_literal_global_8009);
      v8 = (id)_VisionLogger(void)::_visionLogger;
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        v9 = *(_DWORD *)(a1 + 32) - 1;
        if (v9 > 3)
          v10 = "Unknown type: ";
        else
          v10 = off_1E45447A0[v9];
        v11 = 136315394;
        v12 = v10;
        v13 = 2080;
        v14 = v7;
        _os_log_impl(&dword_1A1254000, v8, OS_LOG_TYPE_DEFAULT, "%s%s\n", (uint8_t *)&v11, 0x16u);
      }

      CFRelease(v5);
    }
  }
}

@end

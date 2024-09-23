@implementation CGPerspectiveCacheCreateDebugDesc

void __CGPerspectiveCacheCreateDebugDesc_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("   - Image: %p, id %llu\n"), a2, *(_QWORD *)(a3 + 16));
}

void __CGPerspectiveCacheCreateDebugDesc_block_invoke_2(uint64_t a1, CFNumberRef number, uint64_t a3)
{
  NSObject *v5;
  uint8_t buf[8];
  uint64_t valuePtr;

  valuePtr = 0;
  if (!CFNumberGetValue(number, kCFNumberSInt64Type, &valuePtr))
  {
    if (__CGPerspectiveOSLog_onceToken != -1)
    {
      dispatch_once(&__CGPerspectiveOSLog_onceToken, &__block_literal_global_53);
      v5 = __CGPerspectiveOSLog_log;
      if (!os_log_type_enabled((os_log_t)__CGPerspectiveOSLog_log, OS_LOG_TYPE_DEFAULT))
        goto LABEL_5;
      goto LABEL_4;
    }
    v5 = __CGPerspectiveOSLog_log;
    if (os_log_type_enabled((os_log_t)__CGPerspectiveOSLog_log, OS_LOG_TYPE_DEFAULT))
    {
LABEL_4:
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_224FE9000, v5, OS_LOG_TYPE_DEFAULT, "Internal inconsistency: invalid number type", buf, 2u);
    }
  }
LABEL_5:
  CFStringAppendFormat(*(CFMutableStringRef *)(a1 + 32), 0, CFSTR("   - Image: %p, id %llu\n"), *(_QWORD *)(a3 + 40), valuePtr);
}

@end

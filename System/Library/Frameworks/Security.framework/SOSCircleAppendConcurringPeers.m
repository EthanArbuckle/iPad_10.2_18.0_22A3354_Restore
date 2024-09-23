@implementation SOSCircleAppendConcurringPeers

void __SOSCircleAppendConcurringPeers_block_invoke(uint64_t a1, CFDictionaryRef *a2)
{
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  const void *Copy;
  NSObject *v10;
  CFTypeRef v11;
  CFTypeRef cf;
  uint8_t buf[4];
  CFTypeRef v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  cf = 0;
  if (SOSCircleVerifyPeerSigned(*(_QWORD *)(a1 + 32), a2, &cf))
  {
    Copy = (const void *)SOSPeerInfoCreateCopy((const __CFAllocator *)*MEMORY[0x1E0C9AE00], (uint64_t)a2, *(CFTypeRef **)(a1 + 40), v4, v5, v6, v7, v8);
    CFArrayAppendValue(*(CFMutableArrayRef *)(a1 + 48), Copy);
    CFRelease(Copy);
  }
  else if (*(_QWORD *)(a1 + 40))
  {
    v10 = secLogObjForScope("SecError");
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v14 = cf;
      _os_log_impl(&dword_18A900000, v10, OS_LOG_TYPE_DEFAULT, "Error checking concurrence: %@", buf, 0xCu);
    }
  }
  v11 = cf;
  if (cf)
  {
    cf = 0;
    CFRelease(v11);
  }
}

@end

@implementation SecSecurityClientGet

CFTypeRef __SecSecurityClientGet_block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  const void *v2;
  const void *v3;
  CFTypeRef result;
  uint8_t v5[16];

  v0 = secLogObjForScope("thread-local-client-debug");
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_18A900000, v0, OS_LOG_TYPE_DEFAULT, "SecSecurityClientGet new thread!", v5, 2u);
  }
  v1 = threadLocalClient(&threadLocalClient);
  *(_OWORD *)v1 = gClient;
  *(_OWORD *)(v1 + 16) = xmmword_1ECD358E0;
  *(_OWORD *)(v1 + 32) = xmmword_1ECD358F0;
  *(_OWORD *)(v1 + 48) = xmmword_1ECD35900;
  if (*(_QWORD *)v1)
    CFRetain(*(CFTypeRef *)v1);
  v2 = *(const void **)(v1 + 8);
  if (v2)
    CFRetain(v2);
  v3 = *(const void **)(v1 + 24);
  if (v3)
    CFRetain(v3);
  result = *(CFTypeRef *)(v1 + 48);
  if (result)
    return CFRetain(result);
  return result;
}

void __SecSecurityClientGet_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  const __CFAllocator *v8;
  const __CFArray *v9;
  __CFArray *MutableCopy;

  *(_QWORD *)&gClient = 0;
  v8 = (const __CFAllocator *)*MEMORY[0x1E0C9AE00];
  v9 = CFArrayCreateForCFTypes((CFAllocatorRef)*MEMORY[0x1E0C9AE00], a2, a3, a4, a5, a6, a7, a8, (uint64_t)CFSTR("sync"));
  if (_os_feature_enabled_impl())
  {
    MutableCopy = CFArrayCreateMutableCopy(v8, 0, v9);
    CFArrayAppendValue(MutableCopy, CFSTR("com.apple.token"));
    if (v9)
      CFRelease(v9);
  }
  else
  {
    MutableCopy = v9;
  }
  *((_QWORD *)&gClient + 1) = MutableCopy;
  LOWORD(xmmword_1ECD358E0) = 257;
  DWORD2(xmmword_1ECD358F0) = 501;
  BYTE2(xmmword_1ECD358E0) = 0;
  BYTE4(xmmword_1ECD358F0) = 0;
  *((_QWORD *)&xmmword_1ECD358E0 + 1) = 0;
  WORD4(xmmword_1ECD35900) = 0;
  *(_QWORD *)&xmmword_1ECD35900 = 0;
  BYTE12(xmmword_1ECD358F0) = 0;
}

@end

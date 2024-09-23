@implementation GetAuthChallengeResponse

void ___GetAuthChallengeResponse_block_invoke(uint64_t a1, void *a2)
{
  const UInt8 *data;
  const UInt8 *v5;
  CFDataRef v6;
  const void *v7;
  NSObject *v8;
  const void *v9;
  _QWORD block[6];
  size_t length;
  uint64_t v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t v15;

  if (MEMORY[0x22E2E9674](a2) == MEMORY[0x24BDACFA0])
  {
    v12 = 0;
    v13 = &v12;
    v14 = 0x2000000000;
    v15 = 0;
    length = 0;
    data = (const UInt8 *)xpc_dictionary_get_data(a2, "outData", &length);
    if (length)
    {
      v5 = data;
      syslog(4, "%s:%s-%d got data from authd, len=%d\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_GetAuthChallengeResponse_block_invoke", 563, length);
      v6 = CFDataCreate((CFAllocatorRef)*MEMORY[0x24BDBD240], v5, length);
      v13[3] = (uint64_t)v6;
      if (v6)
        syslog(4, "%s:%s-%d iPod signature created!\n");
      else
        syslog(4, "%s:%s-%d iPod signature failed!\n");
    }
    else
    {
      syslog(4, "%s:%s-%d len is 0!\n");
    }
    v7 = (const void *)v13[3];
    if (v7)
      CFRetain(v7);
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 0x40000000;
    block[2] = ___GetAuthChallengeResponse_block_invoke_2;
    block[3] = &unk_24F53D258;
    v8 = *(NSObject **)(a1 + 40);
    block[4] = *(_QWORD *)(a1 + 32);
    block[5] = &v12;
    dispatch_async(v8, block);
    xpc_release(*(xpc_object_t *)(a1 + 48));
    v9 = (const void *)v13[3];
    if (v9)
      CFRelease(v9);
    _Block_object_dispose(&v12, 8);
  }
}

void ___GetAuthChallengeResponse_block_invoke_2(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

@end

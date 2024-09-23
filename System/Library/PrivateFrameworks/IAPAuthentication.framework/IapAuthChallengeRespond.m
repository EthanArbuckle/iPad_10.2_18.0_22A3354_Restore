@implementation IapAuthChallengeRespond

void __IapAuthChallengeRespond_block_invoke(uint64_t a1, const void *a2)
{
  NSObject *v4;
  _QWORD block[6];

  syslog(4, "%s:%s-%d got reply from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "IapAuthChallengeRespond_block_invoke", 627);
  if (a2)
    CFRetain(a2);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __IapAuthChallengeRespond_block_invoke_2;
  block[3] = &unk_24F53D1B8;
  v4 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = a2;
  dispatch_async(v4, block);
}

void __IapAuthChallengeRespond_block_invoke_2(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
}

@end

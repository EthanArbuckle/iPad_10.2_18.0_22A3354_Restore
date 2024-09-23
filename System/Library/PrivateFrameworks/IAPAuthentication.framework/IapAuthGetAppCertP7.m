@implementation IapAuthGetAppCertP7

void __IapAuthGetAppCertP7_block_invoke(uint64_t a1, uint64_t a2)
{
  const void *v4;
  NSObject *v5;
  const void *v6;
  _QWORD block[6];
  uint64_t v8;
  uint64_t *v9;
  uint64_t v10;
  uint64_t v11;

  syslog(4, "%s:%s-%d got reply from authd\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "IapAuthGetAppCertP7_block_invoke", 472);
  v8 = 0;
  v9 = &v8;
  v10 = 0x2000000000;
  v11 = 0;
  if (a2)
  {
    v4 = (const void *)SecCMSCreateCertificatesOnlyMessageIAP();
    v9[3] = (uint64_t)v4;
    CFRetain(v4);
  }
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = __IapAuthGetAppCertP7_block_invoke_2;
  block[3] = &unk_24F53D168;
  v5 = *(NSObject **)(a1 + 40);
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = &v8;
  dispatch_async(v5, block);
  v6 = (const void *)v9[3];
  if (v6)
    CFRelease(v6);
  _Block_object_dispose(&v8, 8);
}

void __IapAuthGetAppCertP7_block_invoke_2(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

@end

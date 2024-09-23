@implementation GetCertForApplication

void ___GetCertForApplication_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v4;
  const void *v5;
  NSObject *v6;
  const void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  _QWORD block[6];
  size_t length;

  if (MEMORY[0x22E2E9674](a2) == MEMORY[0x24BDACFA0])
  {
    length = 0;
    xpc_dictionary_get_data(a2, "certData", &length);
    if (length)
    {
      syslog(4, "%s:%s-%d got data from authd, len=%d\n", "/Library/Caches/com.apple.xbs/Sources/IAPFramework/IAPAuthentication/IAPSecurity.c", "_GetCertForApplication_block_invoke", 297, length);
      *(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24) = SecCertificateCreateWithBytes();
      if (*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24))
        syslog(4, "cert created!\n", v8, v9, v10);
      else
        syslog(4, "cert FAILED!\n");
    }
    else
    {
      syslog(4, "%s:%s-%d len is 0!\n");
    }
  }
  v4 = *(_QWORD *)(a1 + 40);
  v5 = *(const void **)(*(_QWORD *)(v4 + 8) + 24);
  if (v5)
  {
    CFRetain(v5);
    v4 = *(_QWORD *)(a1 + 40);
  }
  v6 = *(NSObject **)(a1 + 48);
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 0x40000000;
  block[2] = ___GetCertForApplication_block_invoke_2;
  block[3] = &unk_24F53D208;
  block[4] = *(_QWORD *)(a1 + 32);
  block[5] = v4;
  dispatch_async(v6, block);
  v7 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v7)
    CFRelease(v7);
  xpc_release(*(xpc_object_t *)(a1 + 56));
}

void ___GetCertForApplication_block_invoke_2(uint64_t a1)
{
  const void *v2;

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  v2 = *(const void **)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);
  if (v2)
    CFRelease(v2);
}

@end

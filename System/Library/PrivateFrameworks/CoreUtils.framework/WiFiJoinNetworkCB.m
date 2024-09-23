@implementation WiFiJoinNetworkCB

void ___WiFiJoinNetworkCB_block_invoke(_QWORD *a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(void))(a1[4] + 16))();
  v2 = (const void *)a1[5];
  if (v2)
    CFRelease(v2);
  v3 = (const void *)a1[6];
  if (v3)
    CFRelease(v3);
}

uint64_t ___WiFiJoinNetworkCB_block_invoke_129(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(a1 + 32))(*(unsigned int *)(a1 + 48), *(_QWORD *)(a1 + 40));
}

@end

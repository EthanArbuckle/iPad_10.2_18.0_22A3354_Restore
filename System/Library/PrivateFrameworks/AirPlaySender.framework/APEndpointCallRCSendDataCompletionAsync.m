@implementation APEndpointCallRCSendDataCompletionAsync

void __APEndpointCallRCSendDataCompletionAsync_block_invoke(uint64_t a1)
{
  const void *v2;
  const void *v3;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 40);
  if (v2)
    CFRelease(v2);
  v3 = *(const void **)(a1 + 48);
  if (v3)
    CFRelease(v3);
}

@end

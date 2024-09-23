@implementation APConnectivityHelperDispatchEventToClient

void ___APConnectivityHelperDispatchEventToClient_block_invoke(uint64_t a1)
{
  const void *v2;

  (*(void (**)(_QWORD, _QWORD, _QWORD, _QWORD))(a1 + 32))(*(_QWORD *)(a1 + 40), *(unsigned int *)(a1 + 64), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  v2 = *(const void **)(a1 + 48);
  if (v2)
    CFRelease(v2);
  CFRelease(*(CFTypeRef *)(a1 + 40));
  CFRelease(*(CFTypeRef *)(a1 + 56));
}

@end

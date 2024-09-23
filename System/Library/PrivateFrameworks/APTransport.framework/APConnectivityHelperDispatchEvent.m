@implementation APConnectivityHelperDispatchEvent

void ___APConnectivityHelperDispatchEvent_block_invoke(uint64_t a1, const void *a2)
{
  CFSetAddValue(*(CFMutableSetRef *)(a1 + 32), a2);
}

void ___APConnectivityHelperDispatchEvent_block_invoke_2(uint64_t a1, const void *a2)
{
  _APConnectivityHelperDispatchEventToClient(*(_QWORD *)(a1 + 32), a2, *(_DWORD *)(a1 + 48), *(const void **)(a1 + 40));
}

@end

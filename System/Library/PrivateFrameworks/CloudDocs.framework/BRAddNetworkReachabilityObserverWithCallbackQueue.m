@implementation BRAddNetworkReachabilityObserverWithCallbackQueue

uint64_t __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke(uint64_t a1)
{
  uint64_t v3;

  v3 = 1;
  brc_notify_get_state(*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24), &v3, objc_msgSend(objc_retainAutorelease(*(id *)(a1 + 32)), "UTF8String"));
  return (*(uint64_t (**)(_QWORD, BOOL))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), v3 != 0);
}

uint64_t __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_2(uint64_t result, int a2)
{
  if (*(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) == a2)
    return (*(uint64_t (**)(void))(*(_QWORD *)(result + 32) + 16))();
  return result;
}

uint64_t __BRAddNetworkReachabilityObserverWithCallbackQueue_block_invoke_45(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

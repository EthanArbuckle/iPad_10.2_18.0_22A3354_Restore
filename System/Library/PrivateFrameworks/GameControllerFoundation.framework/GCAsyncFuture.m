@implementation GCAsyncFuture

uint64_t __49___GCAsyncFuture__initOnQueue_withOptions_block___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

_QWORD *__84___GCAsyncFuture__observeFinishOnQueue_withOptions_qosClass_relativePriority_block___block_invoke(uint64_t a1)
{
  return Observer::Create(*(void **)(a1 + 40), *(void **)(a1 + 32), *(_DWORD *)(a1 + 48), (dispatch_qos_class_t)*(_DWORD *)(a1 + 52), *(_DWORD *)(a1 + 56));
}

@end

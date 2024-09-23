@implementation DKSyncCompositeOperation

uint64_t __44___DKSyncCompositeOperation_initWithParent___block_invoke(uint64_t a1)
{
  uint64_t result;
  unsigned __int8 v3;

  result = objc_msgSend(*(id *)(a1 + 32), "isExecuting");
  if ((_DWORD)result)
  {
    v3 = atomic_load((unsigned __int8 *)(*(_QWORD *)(a1 + 40) + 264));
    if ((v3 & 1) == 0)
    {
      result = objc_msgSend(*(id *)(a1 + 40), "isCancelled");
      if ((result & 1) == 0)
        return objc_msgSend(*(id *)(a1 + 40), "setReadyToStart:", 1);
    }
  }
  return result;
}

@end

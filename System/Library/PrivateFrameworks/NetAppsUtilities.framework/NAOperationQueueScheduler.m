@implementation NAOperationQueueScheduler

uint64_t __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __53___NAOperationQueueScheduler_performCancelableBlock___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

uint64_t __54___NAOperationQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "performBlock:", *(_QWORD *)(a1 + 48));
  return result;
}

@end

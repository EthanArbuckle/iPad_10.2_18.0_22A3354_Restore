@implementation CNOperationQueueScheduler

uint64_t __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

void __70___CNOperationQueueScheduler_performCancelableBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "cancel");

}

uint64_t __71___CNOperationQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return objc_msgSend(*(id *)(a1 + 40), "_enqueueBlock:qualityOfService:", *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 56));
  return result;
}

@end

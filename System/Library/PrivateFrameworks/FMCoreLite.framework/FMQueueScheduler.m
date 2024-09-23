@implementation FMQueueScheduler

uint64_t __44___FMQueueScheduler_performCancelableBlock___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = objc_msgSend(*(id *)(a1 + 32), "isCanceled");
  if ((result & 1) == 0)
    return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  return result;
}

void __45___FMQueueScheduler_afterDelay_performBlock___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

void __45___FMQueueScheduler_afterDelay_performBlock___block_invoke_2(uint64_t a1)
{
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
}

@end

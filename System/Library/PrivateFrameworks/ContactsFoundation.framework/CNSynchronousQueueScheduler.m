@implementation CNSynchronousQueueScheduler

void __72___CNSynchronousQueueScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __73___CNSynchronousQueueScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260](objc_msgSend(MEMORY[0x1E0CB3978], "sleepForTimeInterval:", *(double *)(a1 + 40)));
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end

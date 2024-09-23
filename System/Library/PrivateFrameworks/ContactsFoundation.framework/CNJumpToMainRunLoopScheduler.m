@implementation CNJumpToMainRunLoopScheduler

void __73___CNJumpToMainRunLoopScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  if ((objc_msgSend(*(id *)(a1 + 32), "isCanceled") & 1) == 0)
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __63___CNJumpToMainRunLoopScheduler_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __74___CNJumpToMainRunLoopScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

@end

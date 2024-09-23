@implementation CNInlineScheduler

void __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

void __63___CNInlineScheduler_afterDelay_performBlock_qualityOfService___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "invalidate");

}

@end

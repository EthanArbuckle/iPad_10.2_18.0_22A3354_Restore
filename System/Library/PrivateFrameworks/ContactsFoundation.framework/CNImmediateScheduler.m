@implementation CNImmediateScheduler

void __65___CNImmediateScheduler_performCancelableBlock_qualityOfService___block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x194004260]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end

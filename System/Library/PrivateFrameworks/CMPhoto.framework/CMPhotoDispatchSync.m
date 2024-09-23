@implementation CMPhotoDispatchSync

void __CMPhotoDispatchSync_block_invoke(uint64_t a1)
{
  void *v2;

  v2 = (void *)MEMORY[0x1A85D1038]();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  objc_autoreleasePoolPop(v2);
}

@end

@implementation CMPhotoAsyncDispatcherDispatchBlockWithOrderedCompletionAndTimeout

void __CMPhotoAsyncDispatcherDispatchBlockWithOrderedCompletionAndTimeout_block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v5;
  _QWORD block[7];

  (*(void (**)(void))(a1[4] + 16))();
  v2 = a1[7];
  v3 = a1[8];
  v4 = a1[5];
  v5 = *(NSObject **)(v2 + 56);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = ___addToFunnel_block_invoke;
  block[3] = &unk_1E53F6390;
  block[5] = v3;
  block[6] = v2;
  block[4] = v4;
  dispatch_sync(v5, block);
}

@end

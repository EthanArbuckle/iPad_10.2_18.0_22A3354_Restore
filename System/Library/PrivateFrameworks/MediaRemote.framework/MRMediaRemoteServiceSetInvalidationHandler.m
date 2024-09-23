@implementation MRMediaRemoteServiceSetInvalidationHandler

void __MRMediaRemoteServiceSetInvalidationHandler_block_invoke(uint64_t a1)
{
  id WeakRetained;
  void *v3;
  NSObject *v4;
  _QWORD block[4];
  id v6;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  v3 = WeakRetained;
  if (WeakRetained)
  {
    objc_msgSend(WeakRetained, "connectionQueue");
    v4 = objc_claimAutoreleasedReturnValue();
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __MRMediaRemoteServiceSetInvalidationHandler_block_invoke_2;
    block[3] = &unk_1E30C6770;
    v6 = *(id *)(a1 + 32);
    dispatch_async(v4, block);

  }
}

uint64_t __MRMediaRemoteServiceSetInvalidationHandler_block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

@end

@implementation MRMediaRemoteSetCommandHandlerCallbackForOrigin

void __MRMediaRemoteSetCommandHandlerCallbackForOrigin_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, void *a5)
{
  id v9;
  uint64_t v10;
  void (*v11)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *);
  id v12;
  _QWORD v13[4];
  id v14;

  v9 = a5;
  v10 = *(_QWORD *)(a1 + 32);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __MRMediaRemoteSetCommandHandlerCallbackForOrigin_block_invoke_2;
  v13[3] = &unk_1E30C6C30;
  v14 = v9;
  v11 = *(void (**)(uint64_t, uint64_t, uint64_t, uint64_t, _QWORD *))(v10 + 16);
  v12 = v9;
  v11(v10, a2, a3, a4, v13);

}

void __MRMediaRemoteSetCommandHandlerCallbackForOrigin_block_invoke_2(uint64_t a1, uint64_t a2)
{
  MRCommandResult *v3;

  v3 = -[MRCommandResult initWithHandlerStatuses:sendError:]([MRCommandResult alloc], "initWithHandlerStatuses:sendError:", a2, 0);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

@end

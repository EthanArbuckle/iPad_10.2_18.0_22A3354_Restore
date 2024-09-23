@implementation MRMediaRemoteAddCommandHandlerBlockForPlayer

void __MRMediaRemoteAddCommandHandlerBlockForPlayer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  void (**v8)(id, id);
  id v9;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8 = a4;
  v9 = (id)v7(v6, a2, a3);
  v8[2](v8, v9);

}

@end

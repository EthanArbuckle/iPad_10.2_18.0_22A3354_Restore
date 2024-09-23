@implementation MRMediaRemoteSetCommandHandlerBlockForPlayer

void __MRMediaRemoteSetCommandHandlerBlockForPlayer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  uint64_t v6;
  uint64_t (*v7)(uint64_t, uint64_t, uint64_t);
  void (**v8)(id, void *);
  void *v9;
  id v10;

  v6 = *(_QWORD *)(a1 + 32);
  v7 = *(uint64_t (**)(uint64_t, uint64_t, uint64_t))(v6 + 16);
  v8 = a4;
  v10 = (id)v7(v6, a2, a3);
  objc_msgSend(v10, "msv_map:", &__block_literal_global_64);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v8[2](v8, v9);

}

MRSendCommandResultStatus *__MRMediaRemoteSetCommandHandlerBlockForPlayer_block_invoke_2(uint64_t a1, void *a2)
{
  return +[MRSendCommandResultStatus statusWithCode:](MRSendCommandResultStatus, "statusWithCode:", objc_msgSend(a2, "unsignedIntValue"));
}

@end

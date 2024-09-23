@implementation MRMediaRemoteAddAsyncCommandHandlerBlockForPlayer

void __MRMediaRemoteAddAsyncCommandHandlerBlockForPlayer_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, void *a4)
{
  id v7;
  void *v8;
  uint64_t v9;
  _QWORD v10[4];
  id v11;

  v7 = a4;
  v8 = v7;
  v9 = *(_QWORD *)(a1 + 32);
  if (v9)
  {
    v10[0] = MEMORY[0x1E0C809B0];
    v10[1] = 3221225472;
    v10[2] = __MRMediaRemoteAddAsyncCommandHandlerBlockForPlayer_block_invoke_2;
    v10[3] = &unk_1E30C6C30;
    v11 = v7;
    (*(void (**)(uint64_t, uint64_t, uint64_t, _QWORD *))(v9 + 16))(v9, a2, a3, v10);

  }
}

void __MRMediaRemoteAddAsyncCommandHandlerBlockForPlayer_block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;

  v2 = *(_QWORD *)(a1 + 32);
  objc_msgSend(a2, "msv_map:", &__block_literal_global_16_1);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  (*(void (**)(uint64_t, id))(v2 + 16))(v2, v3);

}

MRSendCommandResultStatus *__MRMediaRemoteAddAsyncCommandHandlerBlockForPlayer_block_invoke_3(uint64_t a1, void *a2)
{
  return +[MRSendCommandResultStatus statusWithCode:](MRSendCommandResultStatus, "statusWithCode:", objc_msgSend(a2, "unsignedIntValue"));
}

@end

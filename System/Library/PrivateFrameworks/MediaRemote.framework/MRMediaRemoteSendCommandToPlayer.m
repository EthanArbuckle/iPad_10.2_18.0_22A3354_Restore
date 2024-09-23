@implementation MRMediaRemoteSendCommandToPlayer

void __MRMediaRemoteSendCommandToPlayer_block_invoke(uint64_t a1, void *a2)
{
  uint64_t v2;
  id v3;
  uint64_t v4;
  id v5;

  v2 = *(_QWORD *)(a1 + 32);
  if (v2)
  {
    v3 = a2;
    v4 = objc_msgSend(v3, "sendError");
    objc_msgSend(v3, "handlerReturnStatuses");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    (*(void (**)(uint64_t, uint64_t, id))(v2 + 16))(v2, v4, v5);
  }
}

@end

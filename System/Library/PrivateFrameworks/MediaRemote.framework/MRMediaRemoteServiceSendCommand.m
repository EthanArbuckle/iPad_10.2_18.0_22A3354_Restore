@implementation MRMediaRemoteServiceSendCommand

void __MRMediaRemoteServiceSendCommand_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  os_signpost_id_t v6;
  void *v7;
  uint64_t v8;
  uint8_t v9[16];

  v3 = a2;
  _MRLogForCategory(2uLL);
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(*(id *)(a1 + 32), "hash");
  if ((unint64_t)(v5 - 1) <= 0xFFFFFFFFFFFFFFFDLL)
  {
    v6 = v5;
    if (os_signpost_enabled(v4))
    {
      *(_WORD *)v9 = 0;
      _os_signpost_emit_with_name_impl(&dword_193827000, v4, OS_SIGNPOST_INTERVAL_END, v6, "SendCommandXPCResultFromDaemon", ", v9, 2u);
    }
  }

  MRCreateCommandResultFromXPCMessage(v3);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = *(_QWORD *)(a1 + 40);
  if (v8)
    (*(void (**)(uint64_t, void *))(v8 + 16))(v8, v7);
  kdebug_trace();

}

@end

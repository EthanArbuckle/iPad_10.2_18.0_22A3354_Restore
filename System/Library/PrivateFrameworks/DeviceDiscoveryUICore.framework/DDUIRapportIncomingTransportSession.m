@implementation DDUIRapportIncomingTransportSession

void __75___DDUIRapportIncomingTransportSession_sendMessage_withTimeout_completion___block_invoke(_QWORD *a1, void *a2, uint64_t a3, void *a4)
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  int v12;
  uint64_t v13;
  __int16 v14;
  uint64_t v15;
  __int16 v16;
  id v17;
  __int16 v18;
  id v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a2;
  v7 = a4;
  _DDUICoreRapportLog();
  v8 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    v9 = a1[4];
    v10 = a1[5];
    v12 = 134218754;
    v13 = v9;
    v14 = 2112;
    v15 = v10;
    v16 = 2112;
    v17 = v6;
    v18 = 2112;
    v19 = v7;
    _os_log_impl(&dword_1C87B2000, v8, OS_LOG_TYPE_DEFAULT, "_DDUIRapportIncomingTransportSession finished sending message {self: %p, messageID: %@, inResponse: %@ inError: %@}", (uint8_t *)&v12, 0x2Au);
  }

  v11 = a1[6];
  if (v11)
    (*(void (**)(uint64_t, id))(v11 + 16))(v11, v7);

}

@end

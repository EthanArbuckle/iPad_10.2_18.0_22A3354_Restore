@implementation BCSNFCCodeParser

- (void)postNotificationForURL:(id)a3 payload:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  BCSNotificationServiceConnection *v11;
  BCSNotificationServiceConnection *notificationServiceConnection;
  BCSNFCCodePayload *v13;
  BCSNotificationServiceConnection *v14;
  _QWORD v15[4];
  id v16;
  uint8_t buf[4];
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a4;
  v9 = a5;
  +[BCSURLDataParser parseURL:](BCSURLDataParser, "parseURL:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      v18 = objc_msgSend(v10, "type");
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNFCCodeParser: Detected NFC URL has type %ld", buf, 0xCu);
    }
    if (!self->_notificationServiceConnection)
    {
      v11 = objc_alloc_init(BCSNotificationServiceConnection);
      notificationServiceConnection = self->_notificationServiceConnection;
      self->_notificationServiceConnection = v11;

    }
    v13 = -[BCSNFCCodePayload initWithNFCPayload:]([BCSNFCCodePayload alloc], "initWithNFCPayload:", v8);
    v14 = self->_notificationServiceConnection;
    v15[0] = MEMORY[0x24BDAC760];
    v15[1] = 3221225472;
    v15[2] = __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke;
    v15[3] = &unk_24D788048;
    v16 = v9;
    -[BCSNotificationServiceConnection notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:withReply:](v14, "notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:withReply:", v10, v13, 0, v15);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BCSNFCCodeParser postNotificationForURL:payload:completionHandler:].cold.1();
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 3, 0);
    v13 = (BCSNFCCodePayload *)objc_claimAutoreleasedReturnValue();
    (*((void (**)(id, _QWORD, BCSNFCCodePayload *))v9 + 2))(v9, 0, v13);
  }

}

void __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  uint8_t v9[16];

  v5 = a2;
  v6 = a3;
  if (v5)
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke_cold_1(v5);
    v7 = *(_QWORD *)(a1 + 32);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 4, 0);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v7 + 16))(v7, 0, v8);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_INFO, "BCSNFCCodeParser: Finished posting notification", v9, 2u);
    }
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationServiceConnection, 0);
}

- (void)postNotificationForURL:payload:completionHandler:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNFCCodeParser: Does not recognize NFC URL", v0, 2u);
}

void __69__BCSNFCCodeParser_postNotificationForURL_payload_completionHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "_bcs_privacyPreservingDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNFCCodeParser: Error posting notification: %@", (uint8_t *)&v2, 0xCu);

}

@end

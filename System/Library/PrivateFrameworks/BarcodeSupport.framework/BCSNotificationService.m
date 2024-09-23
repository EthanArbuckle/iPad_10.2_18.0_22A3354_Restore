@implementation BCSNotificationService

- (BCSNotificationService)initWithConnection:(id)a3
{
  id v5;
  BCSNotificationService *v6;
  BCSNotificationService *v7;
  BCSNotificationService *v8;
  objc_super v10;

  v5 = a3;
  v10.receiver = self;
  v10.super_class = (Class)BCSNotificationService;
  v6 = -[BCSNotificationService init](&v10, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_connection, a3);
    v8 = v7;
  }

  return v7;
}

- (void)notifyParsedCodeWithData:(id)a3 codePayload:(id)a4 shouldReplacePreviousNotifications:(BOOL)a5 reply:(id)a6
{
  id v10;
  id v11;
  id v12;
  id v13;
  id v14;
  _QWORD v15[5];
  id v16;
  id v17;
  BOOL v18;

  v10 = a3;
  v11 = a4;
  v12 = a6;
  if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
    -[BCSNotificationService notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:reply:].cold.1();
  v15[0] = MEMORY[0x24BDAC760];
  v15[1] = 3221225472;
  v15[2] = __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke;
  v15[3] = &unk_24D787C90;
  v16 = v11;
  v17 = v12;
  v15[4] = self;
  v18 = a5;
  v13 = v11;
  v14 = v12;
  +[BCSAction getActionWithData:codePayload:completionHandler:](BCSAction, "getActionWithData:codePayload:completionHandler:", v10, v13, v15);

}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  uint64_t v5;
  void *v6;
  id v7;
  _QWORD block[4];
  id v9;
  uint64_t v10;
  id v11;
  id v12;
  char v13;

  v3 = a2;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2;
  block[3] = &unk_24D787C68;
  v9 = v3;
  v4 = *(id *)(a1 + 48);
  v5 = *(_QWORD *)(a1 + 32);
  v6 = *(void **)(a1 + 40);
  v12 = v4;
  v10 = v5;
  v11 = v6;
  v13 = *(_BYTE *)(a1 + 56);
  v7 = v3;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  id v13;
  _OWORD v14[2];

  if (*(_QWORD *)(a1 + 32))
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG))
      __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_2();
    v2 = (void *)MEMORY[0x24BDC1550];
    v3 = *(void **)(*(_QWORD *)(a1 + 40) + 16);
    if (v3)
      objc_msgSend(v3, "auditToken");
    else
      memset(v14, 0, sizeof(v14));
    v13 = 0;
    objc_msgSend(v2, "bundleProxyWithAuditToken:error:", v14, &v13);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = v13;
    +[BCSAnalyticsLogger sharedLogger](BCSAnalyticsLogger, "sharedLogger");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    objc_msgSend(v6, "bundleIdentifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "logBarcodeDetectedEventForAction:fromBundleID:", v8, v9);

    v10 = objc_msgSend(*(id *)(a1 + 48), "codeType");
    if (*(_BYTE *)(a1 + 64))
      objc_msgSend(*(id *)(a1 + 40), "_cancelNotificationsForCodeType:", v10);
    +[BCSNotification notificationForAction:](BCSNotification, "notificationForAction:", *(_QWORD *)(a1 + 32));
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRequestingProcessID:", objc_msgSend(*(id *)(*(_QWORD *)(a1 + 40) + 16), "processIdentifier"));
    +[BCSNotificationManager sharedManager](BCSNotificationManager, "sharedManager");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "scheduleNotification:codeType:", v11, v10);

    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_1();
    v4 = *(_QWORD *)(a1 + 56);
    objc_msgSend(MEMORY[0x24BDD1540], "errorWithDomain:code:userInfo:", CFSTR("BCSErrorDomain"), 4, 0);
    v5 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, id, _QWORD))(v4 + 16))(v4, v5, 0);
  }

}

- (void)cancelNotificationsForCodeType:(int64_t)a3
{
  _QWORD v3[6];

  v3[0] = MEMORY[0x24BDAC760];
  v3[1] = 3221225472;
  v3[2] = __57__BCSNotificationService_cancelNotificationsForCodeType___block_invoke;
  v3[3] = &unk_24D787CB8;
  v3[4] = self;
  v3[5] = a3;
  dispatch_async(MEMORY[0x24BDAC9B8], v3);
}

uint64_t __57__BCSNotificationService_cancelNotificationsForCodeType___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_cancelNotificationsForCodeType:", *(_QWORD *)(a1 + 40));
}

- (void)_cancelNotificationsForCodeType:(int64_t)a3
{
  uint64_t v4;
  id v5;

  v4 = -[NSXPCConnection processIdentifier](self->_connection, "processIdentifier");
  +[BCSNotificationManager sharedManager](BCSNotificationManager, "sharedManager");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "withdrawNotificationsWithProcessID:codeType:", v4, a3);

}

- (void)didReceiveNotificationResponse:(id)a3
{
  id v4;
  id v5;
  _QWORD v6[5];
  id v7;

  v4 = a3;
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __57__BCSNotificationService_didReceiveNotificationResponse___block_invoke;
  v6[3] = &unk_24D7879A0;
  v6[4] = self;
  v7 = v4;
  v5 = v4;
  dispatch_async(MEMORY[0x24BDAC9B8], v6);

}

uint64_t __57__BCSNotificationService_didReceiveNotificationResponse___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_didReceiveNotificationResponse:", *(_QWORD *)(a1 + 40));
}

- (void)_didReceiveNotificationResponse:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[BCSNotificationManager sharedManager](BCSNotificationManager, "sharedManager");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "didReceiveNotificationResponse:", v3);

}

- (void)startNFCReaderWithDelegate:(id)a3
{
  BCSNFCReader *nfcReader;
  id v5;
  BCSNFCReader *v6;
  BCSNFCReader *v7;

  nfcReader = self->_nfcReader;
  if (!nfcReader)
  {
    v5 = a3;
    v6 = -[BCSNFCReader initWithDelegate:]([BCSNFCReader alloc], "initWithDelegate:", v5);

    v7 = self->_nfcReader;
    self->_nfcReader = v6;

    -[BCSNFCReader setNotificationService:](self->_nfcReader, "setNotificationService:", self);
    nfcReader = self->_nfcReader;
  }
  -[BCSNFCReader startReading](nfcReader, "startReading", a3);
}

- (void)stopNFCReader
{
  -[BCSNFCReader stopReading](self->_nfcReader, "stopReading");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connection, 0);
  objc_storeStrong((id *)&self->_nfcReader, 0);
}

- (void)notifyParsedCodeWithData:codePayload:shouldReplacePreviousNotifications:reply:.cold.1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BarcodeNotificationService: Received parsed barcode data.", v0, 2u);
}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_1()
{
  uint8_t v0[16];

  *(_WORD *)v0 = 0;
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNotificationService: Detected QR code is not actionable", v0, 2u);
}

void __104__BCSNotificationService_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply___block_invoke_2_cold_2()
{
  int v0;
  uint64_t v1;
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v0 = 138412290;
  v1 = objc_opt_class();
  _os_log_debug_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_DEBUG, "BCSNotificationService: Detected QR code has resolved to action of class %@", (uint8_t *)&v0, 0xCu);
}

@end

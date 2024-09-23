@implementation BCSNotificationServiceDelegate

- (BOOL)listener:(id)a3 shouldAcceptNewConnection:(id)a4
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  BOOL v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  BCSNotificationService *v20;
  BCSNotificationService *v21;
  uint64_t v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t);
  void *v26;
  BCSNotificationService *v27;
  _QWORD v28[2];
  _QWORD v29[2];
  _QWORD v30[9];

  v30[8] = *MEMORY[0x24BDAC8D0];
  v4 = a4;
  objc_msgSend(v4, "valueForEntitlement:", CFSTR("com.apple.private.barcodesupport.allowNotifications"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (objc_msgSend(v5, "BOOLValue") & 1) != 0)
  {
    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254EFA040);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = (void *)MEMORY[0x24BDBCF20];
    v30[0] = objc_opt_class();
    v30[1] = objc_opt_class();
    v30[2] = objc_opt_class();
    v30[3] = objc_opt_class();
    v30[4] = objc_opt_class();
    v30[5] = objc_opt_class();
    v30[6] = objc_opt_class();
    v30[7] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v30, 8);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "setWithArray:", v8);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply_, 0, 0);

    v10 = (void *)MEMORY[0x24BDBCF20];
    v29[0] = objc_opt_class();
    v29[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v29, 2);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "setWithArray:", v11);
    v12 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v12, "setByAddingObject:", objc_opt_class());
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v13, "setByAddingObject:", objc_opt_class());
    v14 = (void *)objc_claimAutoreleasedReturnValue();

    v15 = 1;
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v14, sel_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply_, 1, 0);
    v16 = (void *)MEMORY[0x24BDBCF20];
    v28[0] = objc_opt_class();
    v28[1] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v28, 2);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setWithArray:", v17);
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setClasses:forSelector:argumentIndex:ofReply:", v18, sel_notifyParsedCodeWithData_codePayload_shouldReplacePreviousNotifications_reply_, 1, 1);

    objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254F00B48);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setInterface:forSelector:argumentIndex:ofReply:", v19, sel_startNFCReaderWithDelegate_, 0, 0);

    objc_msgSend(v4, "setExportedInterface:", v6);
    v20 = -[BCSNotificationService initWithConnection:]([BCSNotificationService alloc], "initWithConnection:", v4);
    objc_msgSend(v4, "setExportedObject:", v20);
    v23 = MEMORY[0x24BDAC760];
    v24 = 3221225472;
    v25 = __69__BCSNotificationServiceDelegate_listener_shouldAcceptNewConnection___block_invoke;
    v26 = &unk_24D787300;
    v27 = v20;
    v21 = v20;
    objc_msgSend(v4, "setInvalidationHandler:", &v23);
    objc_msgSend(v4, "resume", v23, v24, v25, v26);

  }
  else
  {
    if (os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
      -[BCSNotificationServiceDelegate listener:shouldAcceptNewConnection:].cold.1(v4);
    v15 = 0;
  }

  return v15;
}

uint64_t __69__BCSNotificationServiceDelegate_listener_shouldAcceptNewConnection___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopNFCReader");
}

- (void)listener:(void *)a1 shouldAcceptNewConnection:.cold.1(void *a1)
{
  _DWORD v1[2];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  v1[0] = 67109120;
  v1[1] = objc_msgSend(a1, "processIdentifier");
  _os_log_error_impl(&dword_21748C000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "BCSNotificationServiceDelegate: Connection rejected for lacking entitlement for pid %d", (uint8_t *)v1, 8u);
}

@end

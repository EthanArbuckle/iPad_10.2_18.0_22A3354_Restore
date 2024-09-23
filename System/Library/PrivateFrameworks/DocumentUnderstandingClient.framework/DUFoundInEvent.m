@implementation DUFoundInEvent

- (void)foundInEventResultWithSerializedDocument:(id)a3 documentType:(int64_t)a4 completion:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  _QWORD v11[4];
  id v12;

  v7 = a5;
  v8 = a3;
  +[DUXPCClient sharedInstance](DUXPCClient, "sharedInstance");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __83__DUFoundInEvent_foundInEventResultWithSerializedDocument_documentType_completion___block_invoke;
  v11[3] = &unk_250B87F28;
  v12 = v7;
  v10 = v7;
  objc_msgSend(v9, "foundInEventResultWithSerializedDocument:documentType:completion:", v8, a4, v11);

}

void __83__DUFoundInEvent_foundInEventResultWithSerializedDocument_documentType_completion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;

  v5 = a2;
  v6 = a3;
  if (v6 && os_log_type_enabled(MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR))
    __83__DUFoundInEvent_foundInEventResultWithSerializedDocument_documentType_completion___block_invoke_cold_1(v6);
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __83__DUFoundInEvent_foundInEventResultWithSerializedDocument_documentType_completion___block_invoke_cold_1(void *a1)
{
  void *v1;
  int v2;
  void *v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = 138412290;
  v3 = v1;
  _os_log_error_impl(&dword_23A6C9000, MEMORY[0x24BDACB70], OS_LOG_TYPE_ERROR, "Error in foundInEventResultWithSerializedDocument: %@", (uint8_t *)&v2, 0xCu);

}

@end

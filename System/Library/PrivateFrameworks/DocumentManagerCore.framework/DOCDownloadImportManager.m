@implementation DOCDownloadImportManager

- (void)importPlaceholderAtURLToDownloadsDirectory:(id)a3 completion:(id)a4
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  uint64_t v11;
  id v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;

  v7 = a3;
  v8 = a4;
  if (!v7)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCDownloadImportManager.m"), 30, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("placeholderDocumentURL"));

  }
  v9 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.DocumentManagerCore.Downloads"));
  -[DOCDownloadImportManager interface](self, "interface");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "setRemoteObjectInterface:", v10);

  objc_msgSend(v9, "resume");
  v11 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke;
  v20[3] = &unk_24C0FE530;
  v12 = v8;
  v21 = v12;
  objc_msgSend(v9, "remoteObjectProxyWithErrorHandler:", v20);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v19 = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v7, 0, &v19);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v15 = v19;
  if (v14)
  {
    v17[0] = v11;
    v17[1] = 3221225472;
    v17[2] = __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_12;
    v17[3] = &unk_24C0FE950;
    v18 = v12;
    objc_msgSend(v13, "importPlaceholderAtURLToDownloadsDirectory:completionHandler:", v14, v17);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v12 + 2))(v12, 0, v15);
  }

}

void __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  v4 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v4 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

void __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_12(uint64_t a1, void *a2)
{
  int v3;
  id v4;

  if (a2)
  {
    objc_msgSend(a2, "url");
    v4 = (id)objc_claimAutoreleasedReturnValue();
    v3 = objc_msgSend(v4, "startAccessingSecurityScopedResource");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v3)
      objc_msgSend(v4, "stopAccessingSecurityScopedResource");

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (void)replacePlaceholder:(id)a3 withFinalFileURL:(id)a4 completionHandler:(id)a5
{
  id v8;
  objc_class *v9;
  id v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  id v16;
  void *v17;
  id v18;
  _QWORD v19[4];
  id v20;
  id v21;
  id v22;

  v8 = a5;
  v9 = (objc_class *)MEMORY[0x24BDD1988];
  v10 = a4;
  v11 = a3;
  v12 = (void *)objc_msgSend([v9 alloc], "initWithServiceName:", CFSTR("com.apple.DocumentManagerCore.Downloads"));
  -[DOCDownloadImportManager interface](self, "interface");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "setRemoteObjectInterface:", v13);

  objc_msgSend(v12, "resume");
  objc_msgSend(v12, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_6);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v22 = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v11, 0, &v22);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v22;
  v21 = v16;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v10, 0, &v21);
  v17 = (void *)objc_claimAutoreleasedReturnValue();

  v18 = v21;
  if (v15 && v17)
  {
    v19[0] = MEMORY[0x24BDAC760];
    v19[1] = 3221225472;
    v19[2] = __82__DOCDownloadImportManager_replacePlaceholder_withFinalFileURL_completionHandler___block_invoke_14;
    v19[3] = &unk_24C0FE950;
    v20 = v8;
    objc_msgSend(v14, "replacePlaceholder:withFinalFileURL:completionHandler:", v15, v17, v19);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v18);
  }

}

void __82__DOCDownloadImportManager_replacePlaceholder_withFinalFileURL_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  v3 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v3 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();

}

void __82__DOCDownloadImportManager_replacePlaceholder_withFinalFileURL_completionHandler___block_invoke_14(uint64_t a1, void *a2)
{
  id v3;

  if (a2)
  {
    objc_msgSend(a2, "url");
    v3 = (id)objc_claimAutoreleasedReturnValue();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
}

- (id)interface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545A92A0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_importPlaceholderAtURLToDownloadsDirectory_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_importPlaceholderAtURLToDownloadsDirectory_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_importPlaceholderAtURLToDownloadsDirectory_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_replacePlaceholder_withFinalFileURL_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v7, sel_replacePlaceholder_withFinalFileURL_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v8, sel_replacePlaceholder_withFinalFileURL_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_replacePlaceholder_withFinalFileURL_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v10, sel_importItemAtURL_toLocation_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v11, sel_importItemAtURL_toLocation_completionHandler_, 1, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v12, sel_namedLocationExists_completionHandler_, 1, 1);

  return v2;
}

- (id)_moveItemAtURL:(id)a3 toNamedLocation:(int64_t)a4 error:(id *)a5
{
  id v8;
  int v9;
  void *v10;
  id v11;
  void *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  int v20;
  _QWORD v21[6];
  _QWORD v22[5];
  uint64_t v23;
  uint64_t *v24;
  uint64_t v25;
  uint64_t (*v26)(uint64_t, uint64_t);
  void (*v27)(uint64_t);
  id v28;
  uint64_t v29;
  uint64_t *v30;
  uint64_t v31;
  uint64_t (*v32)(uint64_t, uint64_t);
  void (*v33)(uint64_t);
  id v34;
  id v35[2];

  v8 = a3;
  v9 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
  v35[0] = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v8, 0, v35);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = v35[0];
  v12 = v11;
  if (v11)
  {
    v13 = 0;
    if (a5)
      *a5 = objc_retainAutorelease(v11);
  }
  else
  {
    v20 = v9;
    v14 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.DocumentManagerCore.Downloads"));
    -[DOCDownloadImportManager interface](self, "interface");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "setRemoteObjectInterface:", v15);

    objc_msgSend(v14, "resume");
    v29 = 0;
    v30 = &v29;
    v31 = 0x3032000000;
    v32 = __Block_byref_object_copy__1;
    v33 = __Block_byref_object_dispose__1;
    v34 = 0;
    v23 = 0;
    v24 = &v23;
    v25 = 0x3032000000;
    v26 = __Block_byref_object_copy__1;
    v27 = __Block_byref_object_dispose__1;
    v16 = MEMORY[0x24BDAC760];
    v28 = 0;
    v22[0] = MEMORY[0x24BDAC760];
    v22[1] = 3221225472;
    v22[2] = __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke;
    v22[3] = &unk_24C0FE998;
    v22[4] = &v29;
    objc_msgSend(v14, "synchronousRemoteObjectProxyWithErrorHandler:", v22);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v21[0] = v16;
    v21[1] = 3221225472;
    v21[2] = __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke_31;
    v21[3] = &unk_24C0FE9C0;
    v21[4] = &v23;
    v21[5] = &v29;
    objc_msgSend(v17, "importItemAtURL:toLocation:completionHandler:", v10, a4, v21);
    if (a5)
    {
      v18 = (void *)v30[5];
      if (v18)
        *a5 = objc_retainAutorelease(v18);
    }
    if (v20)
      objc_msgSend(v8, "stopAccessingSecurityScopedResource");
    v13 = (id)v24[5];

    _Block_object_dispose(&v23, 8);
    _Block_object_dispose(&v29, 8);

  }
  return v13;
}

void __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v4 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __65__DOCDownloadImportManager__moveItemAtURL_toNamedLocation_error___block_invoke_31(uint64_t a1, void *a2, void *a3)
{
  id v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  uint64_t v9;
  id v10;
  id v11;

  v5 = a3;
  v11 = v5;
  if (a2)
  {
    objc_msgSend(a2, "url");
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
    v8 = *(void **)(v7 + 40);
    *(_QWORD *)(v7 + 40) = v6;
  }
  else
  {
    v9 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v10 = v5;
    v8 = *(void **)(v9 + 40);
    *(_QWORD *)(v9 + 40) = v10;
  }

}

- (BOOL)_doc_destinationLocationExists:(int64_t)a3
{
  void *v5;
  void *v6;
  uint64_t v7;
  void *v8;
  char v9;
  void *v12;
  _QWORD v13[5];
  _QWORD v14[5];
  uint64_t v15;
  uint64_t *v16;
  uint64_t v17;
  char v18;
  _QWORD v19[5];
  id v20;

  if (a3 != 2)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("DOCDownloadImportManager.m"), 165, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("location == _DOCFileDestinationDocuments"));

  }
  v5 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.DocumentManagerCore.Downloads"));
  -[DOCDownloadImportManager interface](self, "interface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setRemoteObjectInterface:", v6);

  objc_msgSend(v5, "resume");
  v19[0] = 0;
  v19[1] = v19;
  v19[2] = 0x3032000000;
  v19[3] = __Block_byref_object_copy__1;
  v19[4] = __Block_byref_object_dispose__1;
  v20 = 0;
  v15 = 0;
  v16 = &v15;
  v17 = 0x2020000000;
  v7 = MEMORY[0x24BDAC760];
  v18 = 0;
  v14[0] = MEMORY[0x24BDAC760];
  v14[1] = 3221225472;
  v14[2] = __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke;
  v14[3] = &unk_24C0FE998;
  v14[4] = v19;
  objc_msgSend(v5, "synchronousRemoteObjectProxyWithErrorHandler:", v14);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = v7;
  v13[1] = 3221225472;
  v13[2] = __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_34;
  v13[3] = &unk_24C0FE9E8;
  v13[4] = &v15;
  objc_msgSend(v8, "namedLocationExists:completionHandler:", a3, v13);
  v9 = *((_BYTE *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  _Block_object_dispose(v19, 8);

  return v9;
}

void __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;

  v3 = a2;
  v4 = docDownloadServiceLogHandle;
  if (!docDownloadServiceLogHandle)
  {
    DOCInitLogging();
    v4 = docDownloadServiceLogHandle;
  }
  if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT))
    __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v3;

}

void __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_34(uint64_t a1, char a2, void *a3)
{
  id v5;
  NSObject *v6;

  v5 = a3;
  if (v5)
  {
    v6 = docDownloadServiceLogHandle;
    if (!docDownloadServiceLogHandle)
    {
      DOCInitLogging();
      v6 = docDownloadServiceLogHandle;
    }
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
      __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_34_cold_1();
  }
  *(_BYTE *)(*(_QWORD *)(*(_QWORD *)(a1 + 32) + 8) + 24) = a2;

}

void __82__DOCDownloadImportManager_importPlaceholderAtURLToDownloadsDirectory_completion___block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2(&dword_2090A2000, v0, v1, "Remote object proxy error: %@", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_1();
}

void __59__DOCDownloadImportManager__doc_destinationLocationExists___block_invoke_34_cold_1()
{
  os_log_t v0;
  uint8_t v1[24];
  uint64_t v2;

  v2 = *MEMORY[0x24BDAC8D0];
  OUTLINED_FUNCTION_2_1();
  _os_log_error_impl(&dword_2090A2000, v0, OS_LOG_TYPE_ERROR, "Named location error: %@", v1, 0xCu);
  OUTLINED_FUNCTION_1();
}

@end

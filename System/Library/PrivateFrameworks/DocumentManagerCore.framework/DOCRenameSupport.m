@implementation DOCRenameSupport

+ (id)_spi_renameDocumentAtURL:(id)a3 proposedName:(id)a4 error:(id *)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  NSObject *v15;
  uint64_t v16;
  uint64_t v17;
  void *v18;
  id v19;
  _QWORD v21[6];
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t (*v25)(uint64_t, uint64_t);
  void (*v26)(uint64_t);
  id v27;
  uint64_t v28;
  uint64_t *v29;
  uint64_t v30;
  uint64_t (*v31)(uint64_t, uint64_t);
  void (*v32)(uint64_t);
  id v33;
  id v34;
  uint8_t buf[4];
  const char *v36;
  __int16 v37;
  uint64_t v38;
  __int16 v39;
  uint64_t v40;
  uint64_t v41;

  v41 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v34 = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", v7, 0, &v34);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v34;
  v11 = v10;
  if (v9)
  {
    v12 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.DocumentManagerCore.Rename"));
    objc_msgSend((id)objc_opt_class(), "interface");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setRemoteObjectInterface:", v13);

    objc_msgSend(v12, "resume");
    objc_msgSend(v12, "synchronousRemoteObjectProxyWithErrorHandler:", &__block_literal_global_10);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = 0;
    v29 = &v28;
    v30 = 0x3032000000;
    v31 = __Block_byref_object_copy__4;
    v32 = __Block_byref_object_dispose__4;
    v33 = 0;
    v22 = 0;
    v23 = &v22;
    v24 = 0x3032000000;
    v25 = __Block_byref_object_copy__4;
    v26 = __Block_byref_object_dispose__4;
    v27 = 0;
    v21[0] = MEMORY[0x24BDAC760];
    v21[1] = 3221225472;
    v21[2] = __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3;
    v21[3] = &unk_24C0FE9C0;
    v21[4] = &v22;
    v21[5] = &v28;
    objc_msgSend(v14, "renameDocumentAtURL:proposedName:completionHandler:", v9, v8, v21);
    objc_msgSend(v12, "invalidate");
    v15 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v15 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = v23[5];
      v17 = v29[5];
      *(_DWORD *)buf = 136315650;
      v36 = "+[DOCRenameSupport _spi_renameDocumentAtURL:proposedName:error:]";
      v37 = 2112;
      v38 = v16;
      v39 = 2112;
      v40 = v17;
      _os_log_impl(&dword_2090A2000, v15, OS_LOG_TYPE_INFO, "%s new url: %@ error: %@", buf, 0x20u);
    }
    if (a5)
    {
      v18 = (void *)v29[5];
      if (v18)
        *a5 = objc_retainAutorelease(v18);
    }
    v19 = (id)v23[5];
    _Block_object_dispose(&v22, 8);

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    v19 = 0;
    if (a5 && v10)
    {
      v19 = 0;
      *a5 = objc_retainAutorelease(v10);
    }
  }

  return v19;
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = docRenameLogHandle;
  if (!docRenameLogHandle)
  {
    DOCInitLogging();
    v3 = docRenameLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  uint64_t v12;
  void *v13;
  int v14;
  const char *v15;
  __int16 v16;
  id v17;
  __int16 v18;
  uint64_t v19;
  uint64_t v20;

  v20 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  v8 = docRenameLogHandle;
  if (!v5 || v6)
  {
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v8 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3_cold_1();
  }
  else
  {
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v8 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v14 = 136315650;
      v15 = "+[DOCRenameSupport _spi_renameDocumentAtURL:proposedName:error:]_block_invoke";
      v16 = 2112;
      v17 = v5;
      v18 = 2112;
      v19 = 0;
      _os_log_impl(&dword_2090A2000, v8, OS_LOG_TYPE_INFO, "%s new url: %@ error: %@", (uint8_t *)&v14, 0x20u);
    }
  }
  objc_msgSend(v5, "url");
  v9 = objc_claimAutoreleasedReturnValue();
  v10 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 8);
  v11 = *(void **)(v10 + 40);
  *(_QWORD *)(v10 + 40) = v9;

  v12 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v13 = *(void **)(v12 + 40);
  *(_QWORD *)(v12 + 40) = v7;

}

+ (void)_spi_renameDocumentAtURL:(id)a3 proposedName:(id)a4 completionHandler:(id)a5
{
  id v7;
  id v8;
  void *v9;
  id v10;
  void *v11;
  void *v12;
  void *v13;
  _QWORD v14[4];
  id v15;
  id v16;

  v7 = a4;
  v8 = a5;
  v16 = 0;
  objc_msgSend(MEMORY[0x24BDC8310], "wrapperWithURL:readonly:error:", a3, 0, &v16);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = v16;
  if (v9)
  {
    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1988]), "initWithServiceName:", CFSTR("com.apple.DocumentManagerCore.Rename"));
    objc_msgSend((id)objc_opt_class(), "interface");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "setRemoteObjectInterface:", v12);

    objc_msgSend(v11, "resume");
    objc_msgSend(v11, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_5);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = MEMORY[0x24BDAC760];
    v14[1] = 3221225472;
    v14[2] = __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_6;
    v14[3] = &unk_24C0FE950;
    v15 = v8;
    objc_msgSend(v13, "renameDocumentAtURL:proposedName:completionHandler:", v9, v7, v14);

  }
  else
  {
    (*((void (**)(id, _QWORD, id))v8 + 2))(v8, 0, v10);
  }

}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;

  v2 = a2;
  v3 = docRenameLogHandle;
  if (!docRenameLogHandle)
  {
    DOCInitLogging();
    v3 = docRenameLogHandle;
  }
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_6(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  void *v7;
  void *v8;
  NSObject *v9;
  int v10;
  NSObject *v11;
  int v12;
  const char *v13;
  __int16 v14;
  void *v15;
  __int16 v16;
  uint64_t v17;
  uint64_t v18;

  v18 = *MEMORY[0x24BDAC8D0];
  v5 = a2;
  v6 = a3;
  v7 = v6;
  if (!v5 || v6)
  {
    v11 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v11 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_6_cold_1();
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
  }
  else
  {
    objc_msgSend(v5, "url");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = docRenameLogHandle;
    if (!docRenameLogHandle)
    {
      DOCInitLogging();
      v9 = docRenameLogHandle;
    }
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v12 = 136315650;
      v13 = "+[DOCRenameSupport _spi_renameDocumentAtURL:proposedName:completionHandler:]_block_invoke";
      v14 = 2112;
      v15 = v8;
      v16 = 2112;
      v17 = 0;
      _os_log_impl(&dword_2090A2000, v9, OS_LOG_TYPE_INFO, "%s new url: %@ error: %@", (uint8_t *)&v12, 0x20u);
    }
    v10 = objc_msgSend(v8, "startAccessingSecurityScopedResource");
    (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
    if (v10)
      objc_msgSend(v8, "stopAccessingSecurityScopedResource");

  }
}

+ (id)interface
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_2545A9300);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v3, sel_renameDocumentAtURL_proposedName_completionHandler_, 0, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v4, sel_renameDocumentAtURL_proposedName_completionHandler_, 1, 0);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v5, sel_renameDocumentAtURL_proposedName_completionHandler_, 0, 1);

  objc_msgSend(MEMORY[0x24BDBCF20], "setWithObjects:", objc_opt_class(), 0);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setClasses:forSelector:argumentIndex:ofReply:", v6, sel_renameDocumentAtURL_proposedName_completionHandler_, 1, 1);

  return v2;
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Synchronous remote object proxy error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __64__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_error___block_invoke_3_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "ERROR: Remote object renameDocumentAtURL: call retured bookmarkData: %@ error: %@");
  OUTLINED_FUNCTION_1();
}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_2090A2000, a2, a3, "Remote object proxy error: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

void __76__DOCRenameSupport__spi_renameDocumentAtURL_proposedName_completionHandler___block_invoke_6_cold_1()
{
  uint64_t v0;
  os_log_t v1;

  OUTLINED_FUNCTION_2_0();
  OUTLINED_FUNCTION_1_0(&dword_2090A2000, v0, v1, "ERROR: Remote object renameDocumentAtURL: call retured bookmark data: %@ error: %@");
  OUTLINED_FUNCTION_1();
}

@end

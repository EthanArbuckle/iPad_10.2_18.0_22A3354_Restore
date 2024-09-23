@implementation FPDExtensionIndexer

- (void)indexOneBatchWithCompletionHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v4 = a3;
  -[FPDDomainIndexer domain](self, "domain");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "session");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v5, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);
  -[FPDDomainIndexer domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "identifier");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "indexOneBatchInDomain:completionHandler:", v8, v4);

}

- (void)dropIndexForReason:(unint64_t)a3 completion:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  id v12;
  _QWORD v13[5];
  id v14;
  unint64_t v15;

  v6 = a4;
  -[FPDDomainIndexer domain](self, "domain");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "session");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = (void *)objc_msgSend(v8, "newFileProviderProxyWithTimeout:pid:", 0, 180.0);

  -[FPDDomainIndexer domain](self, "domain");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "identifier");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke;
  v13[3] = &unk_1E8C790E0;
  v14 = v6;
  v15 = a3;
  v13[4] = self;
  v12 = v6;
  objc_msgSend(v9, "dropIndexForDomain:dropReason:completionHandler:", v11, a3, v13);

}

void __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  uint64_t v8;
  objc_super v9;

  v3 = a2;
  if (v3)
  {
    fp_current_or_default_log();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke_cold_1(v3, v4);

    v6 = *(_QWORD *)(a1 + 40);
    v5 = *(_QWORD *)(a1 + 48);
    v9.receiver = *(id *)(a1 + 32);
    v9.super_class = (Class)FPDExtensionIndexer;
    objc_msgSendSuper2(&v9, sel_dropIndexForReason_completion_, v5, v6);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "state");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "recordIndexDropReason:", *(_QWORD *)(a1 + 48));

    v8 = *(_QWORD *)(a1 + 40);
    if (v8)
      (*(void (**)(uint64_t, _QWORD))(v8 + 16))(v8, 0);
  }

}

void __53__FPDExtensionIndexer_dropIndexForReason_completion___block_invoke_cold_1(void *a1, NSObject *a2)
{
  void *v3;
  int v4;
  void *v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  objc_msgSend(a1, "fp_prettyDescription");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = 138412290;
  v5 = v3;
  _os_log_error_impl(&dword_1CF55F000, a2, OS_LOG_TYPE_ERROR, "[ERROR] Failed to drop index in extension, will try in fileproviderd, error %@", (uint8_t *)&v4, 0xCu);

}

@end

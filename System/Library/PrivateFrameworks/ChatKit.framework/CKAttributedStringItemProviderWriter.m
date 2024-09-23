@implementation CKAttributedStringItemProviderWriter

- (CKAttributedStringItemProviderWriter)initWithAttributedString:(id)a3
{
  id v4;
  CKAttributedStringItemProviderWriter *v5;
  uint64_t v6;
  NSAttributedString *attributedString;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CKAttributedStringItemProviderWriter;
  v5 = -[CKAttributedStringItemProviderWriter init](&v9, sel_init);
  if (v5)
  {
    v6 = objc_msgSend(v4, "copy");
    attributedString = v5->_attributedString;
    v5->_attributedString = (NSAttributedString *)v6;

  }
  return v5;
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  if (writableTypeIdentifiersForItemProvider_onceToken_0 != -1)
    dispatch_once(&writableTypeIdentifiersForItemProvider_onceToken_0, &__block_literal_global_121);
  return (NSArray *)(id)writableTypeIdentifiersForItemProvider_sTypeIdentifiers_0;
}

void __78__CKAttributedStringItemProviderWriter_writableTypeIdentifiersForItemProvider__block_invoke()
{
  void *v0;
  void *v1;
  uint64_t v2;
  void *v3;
  id v4;

  objc_msgSend(MEMORY[0x1E0CB3498], "writableTypeIdentifiersForItemProvider");
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v0, "mutableCopy");

  objc_msgSend((id)*MEMORY[0x1E0CEC5C8], "identifier");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "removeObject:", v1);

  v2 = objc_msgSend(v4, "copy");
  v3 = (void *)writableTypeIdentifiersForItemProvider_sTypeIdentifiers_0;
  writableTypeIdentifiersForItemProvider_sTypeIdentifiers_0 = v2;

}

- (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)objc_msgSend((id)objc_opt_class(), "writableTypeIdentifiersForItemProvider");
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id v9;
  id v10;
  void *v11;
  _QWORD v13[4];
  id v14;
  id v15;

  v6 = a3;
  v7 = a4;
  -[CKAttributedStringItemProviderWriter attributedString](self, "attributedString");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke;
  v13[3] = &unk_1E2750FE8;
  v14 = v6;
  v15 = v7;
  v9 = v7;
  v10 = v6;
  objc_msgSend(v8, "loadDataWithTypeIdentifier:forItemProviderCompletionHandler:", v10, v13);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

void __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if (v6)
  {
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(a1, (uint64_t)v6, v7);
  }
  else
  {
    if (v5)
      goto LABEL_6;
    IMLogHandleForCategory();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR))
      __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(a1, v7);
  }

LABEL_6:
  (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();

}

- (NSAttributedString)attributedString
{
  return self->_attributedString;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attributedString, 0);
}

void __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *(_QWORD *)(a1 + 32);
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_18DFCD000, a2, OS_LOG_TYPE_ERROR, "Writing nil data to pasteboard for attributed string serialized using type \"%@\", (uint8_t *)&v3, 0xCu);
}

void __100__CKAttributedStringItemProviderWriter_loadDataWithTypeIdentifier_forItemProviderCompletionHandler___block_invoke_cold_2(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  uint64_t v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = *(_QWORD *)(a1 + 32);
  v4 = 138412546;
  v5 = v3;
  v6 = 2112;
  v7 = a2;
  _os_log_error_impl(&dword_18DFCD000, log, OS_LOG_TYPE_ERROR, "Failed to load data of type, \"%@\", error: %@", (uint8_t *)&v4, 0x16u);
}

@end

@implementation CXExtensionCallSource

- (CXExtensionCallSource)initWithExtension:(id)a3
{
  id v5;
  void *v6;
  CXExtensionCallSource *v7;
  uint64_t v8;
  void *v9;
  id v10;
  id v11;
  id v12;
  _QWORD v14[4];
  id v15;
  id v16;
  _QWORD v17[4];
  id v18;
  id v19;
  _QWORD v20[4];
  id v21;
  id v22;
  _QWORD v23[4];
  CXExtensionCallSource *v24;
  id v25;
  id location;
  objc_super v27;

  v5 = a3;
  objc_msgSend(v5, "identifier");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v27.receiver = self;
  v27.super_class = (Class)CXExtensionCallSource;
  v7 = -[CXCallSource initWithIdentifier:](&v27, sel_initWithIdentifier_, v6);

  if (v7)
  {
    objc_storeStrong((id *)&v7->_extension, a3);
    objc_initWeak(&location, v7);
    v8 = MEMORY[0x1E0C809B0];
    v23[0] = MEMORY[0x1E0C809B0];
    v23[1] = 3221225472;
    v23[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke;
    v23[3] = &unk_1E4B88CD0;
    v24 = v7;
    objc_copyWeak(&v25, &location);
    v9 = (void *)MEMORY[0x1A859A7A4](v23);
    v20[0] = v8;
    v20[1] = 3221225472;
    v20[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_3;
    v20[3] = &unk_1E4B88CF8;
    objc_copyWeak(&v22, &location);
    v10 = v9;
    v21 = v10;
    -[NSExtension setRequestCompletionBlock:](v7->_extension, "setRequestCompletionBlock:", v20);
    v17[0] = v8;
    v17[1] = 3221225472;
    v17[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_2;
    v17[3] = &unk_1E4B88D20;
    objc_copyWeak(&v19, &location);
    v11 = v10;
    v18 = v11;
    -[NSExtension setRequestCancellationBlock:](v7->_extension, "setRequestCancellationBlock:", v17);
    v14[0] = v8;
    v14[1] = 3221225472;
    v14[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_4;
    v14[3] = &unk_1E4B88D48;
    objc_copyWeak(&v16, &location);
    v12 = v11;
    v15 = v12;
    -[NSExtension setRequestInterruptionBlock:](v7->_extension, "setRequestInterruptionBlock:", v14);

    objc_destroyWeak(&v16);
    objc_destroyWeak(&v19);

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v25);

    objc_destroyWeak(&location);
  }

  return v7;
}

void __43__CXExtensionCallSource_initWithExtension___block_invoke(uint64_t a1)
{
  NSObject *v2;
  _QWORD block[4];
  id v4;

  objc_msgSend(*(id *)(a1 + 32), "queue");
  v2 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __43__CXExtensionCallSource_initWithExtension___block_invoke_2;
  block[3] = &unk_1E4B88CA8;
  objc_copyWeak(&v4, (id *)(a1 + 40));
  dispatch_async(v2, block);

  objc_destroyWeak(&v4);
}

void __43__CXExtensionCallSource_initWithExtension___block_invoke_2(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "setExtensionContext:", 0);
  objc_msgSend(WeakRetained, "setConnected:", 0);

}

uint64_t __43__CXExtensionCallSource_initWithExtension___block_invoke_3(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Request completed for extension call source %@", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __43__CXExtensionCallSource_initWithExtension___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  NSObject *v5;
  id WeakRetained;
  int v7;
  id v8;
  __int16 v9;
  id v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  CXDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v7 = 138412546;
    v8 = WeakRetained;
    v9 = 2112;
    v10 = v4;
    _os_log_impl(&dword_1A402D000, v5, OS_LOG_TYPE_DEFAULT, "[WARN] Request canceled for extension call source %@: %@", (uint8_t *)&v7, 0x16u);

  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

uint64_t __43__CXExtensionCallSource_initWithExtension___block_invoke_4(uint64_t a1)
{
  NSObject *v2;
  id WeakRetained;
  int v5;
  id v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
    v5 = 138412290;
    v6 = WeakRetained;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "[WARN] Request interrupted for extension call source %@", (uint8_t *)&v5, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (CXExtensionCallSource)initWithExtensionIdentifier:(id)a3
{
  id v4;
  void *v5;
  id v6;
  CXExtensionCallSource *v7;
  NSObject *v8;
  id v10;

  v4 = a3;
  v10 = 0;
  objc_msgSend(MEMORY[0x1E0CB35D8], "extensionWithIdentifier:error:", v4, &v10);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v10;
  if (v5)
  {
    v7 = -[CXExtensionCallSource initWithExtension:](self, "initWithExtension:", v5);
  }
  else
  {
    CXDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[CXExtensionCallSource initWithExtensionIdentifier:].cold.1((uint64_t)v4, (uint64_t)v6, v8);

    v7 = 0;
  }

  return v7;
}

- (CXExtensionCallSource)init
{

  return 0;
}

- (id)bundle
{
  void *v2;
  void *v3;

  -[CXExtensionCallSource extension](self, "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionBundle");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (int)processIdentifier
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  int v7;
  objc_super v9;

  -[CXExtensionCallSource extensionContext](self, "extensionContext");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_auxiliaryConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if (v4)
  {
    -[CXExtensionCallSource extensionContext](self, "extensionContext");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "_auxiliaryConnection");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "processIdentifier");

  }
  else
  {
    v9.receiver = self;
    v9.super_class = (Class)CXExtensionCallSource;
    v7 = -[CXCallSource processIdentifier](&v9, sel_processIdentifier);
  }

  return v7;
}

- (void)beginWithCompletionHandler:(id)a3
{
  id v4;
  NSObject *v5;
  id v6;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  -[CXCallSource queue](self, "queue");
  v5 = objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x1E0C809B0];
  v7[1] = 3221225472;
  v7[2] = __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke;
  v7[3] = &unk_1E4B88B30;
  v7[4] = self;
  v8 = v4;
  v6 = v4;
  dispatch_async(v5, v7);

}

void __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  NSObject *v4;
  uint64_t v5;
  void *v6;
  void *v7;
  _QWORD v8[5];
  id v9;
  uint8_t buf[4];
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v11 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Asked to begin extension call source %@", buf, 0xCu);
  }

  if (objc_msgSend(*(id *)(a1 + 32), "isConnected"))
  {
    CXDefaultLog();
    v4 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A402D000, v4, OS_LOG_TYPE_DEFAULT, "Extension call source is already connected", buf, 2u);
    }

    v5 = *(_QWORD *)(a1 + 40);
    if (v5)
      (*(void (**)(uint64_t, _QWORD))(v5 + 16))(v5, 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "extension");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v8[0] = MEMORY[0x1E0C809B0];
    v8[1] = 3221225472;
    v8[2] = __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_8;
    v8[3] = &unk_1E4B88D70;
    v7 = *(void **)(a1 + 40);
    v8[4] = *(_QWORD *)(a1 + 32);
    v9 = v7;
    objc_msgSend(v6, "beginExtensionRequestWithInputItems:completion:", 0, v8);

  }
}

void __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_8(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;
  void *v8;
  id v9;
  id v10;
  _QWORD v11[5];
  id v12;
  id v13;
  id v14;

  v5 = a2;
  v6 = a3;
  objc_msgSend(*(id *)(a1 + 32), "queue");
  v7 = objc_claimAutoreleasedReturnValue();
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2;
  v11[3] = &unk_1E4B88C18;
  v8 = *(void **)(a1 + 40);
  v11[4] = *(_QWORD *)(a1 + 32);
  v12 = v5;
  v13 = v6;
  v14 = v8;
  v9 = v6;
  v10 = v5;
  dispatch_async(v7, v11);

}

uint64_t __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSObject *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t result;
  int v14;
  uint64_t v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "setRequestIdentifier:", *(_QWORD *)(a1 + 40));
  objc_msgSend(*(id *)(a1 + 32), "extension");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "_extensionContextForUUID:", *(_QWORD *)(a1 + 40));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "setExtensionContext:", v3);

  v4 = *(void **)(a1 + 32);
  objc_msgSend(v4, "extensionContext");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setDelegate:", v4);

  objc_msgSend(*(id *)(a1 + 32), "extensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "_auxiliaryConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "exportedInterface");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "cx_setAllowedClassesForProviderHostProtocol");

  v9 = *(_QWORD *)(a1 + 48);
  CXDefaultLog();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = v10;
  if (v9)
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2_cold_1((uint64_t *)(a1 + 48), v11);

  }
  else
  {
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      v12 = *(_QWORD *)(a1 + 40);
      v14 = 138412290;
      v15 = v12;
      _os_log_impl(&dword_1A402D000, v11, OS_LOG_TYPE_DEFAULT, "Extension call source began successfully with request identifier %@", (uint8_t *)&v14, 0xCu);
    }

    objc_msgSend(*(id *)(a1 + 32), "setConnected:", 1);
  }
  result = *(_QWORD *)(a1 + 56);
  if (result)
    return (*(uint64_t (**)(uint64_t, _QWORD))(result + 16))(result, *(_QWORD *)(a1 + 48));
  return result;
}

- (CXProviderExtensionHostContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContext, a3);
}

- (NSExtension)extension
{
  return self->_extension;
}

- (void)setExtension:(id)a3
{
  objc_storeStrong((id *)&self->_extension, a3);
}

- (NSCopying)requestIdentifier
{
  return self->_requestIdentifier;
}

- (void)setRequestIdentifier:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 56);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_requestIdentifier, 0);
  objc_storeStrong((id *)&self->_extension, 0);
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

- (void)initWithExtensionIdentifier:(os_log_t)log .cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  int v3;
  uint64_t v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v3 = 138412546;
  v4 = a1;
  v5 = 2112;
  v6 = a2;
  _os_log_error_impl(&dword_1A402D000, log, OS_LOG_TYPE_ERROR, "Could not create extension with identifier %@: %@", (uint8_t *)&v3, 0x16u);
}

void __52__CXExtensionCallSource_beginWithCompletionHandler___block_invoke_2_cold_1(uint64_t *a1, NSObject *a2)
{
  uint64_t v2;
  int v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = *a1;
  v3 = 138412290;
  v4 = v2;
  _os_log_error_impl(&dword_1A402D000, a2, OS_LOG_TYPE_ERROR, "Extension call source failed to begin: %@", (uint8_t *)&v3, 0xCu);
}

@end

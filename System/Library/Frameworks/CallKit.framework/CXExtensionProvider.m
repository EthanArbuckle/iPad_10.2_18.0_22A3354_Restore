@implementation CXExtensionProvider

- (BOOL)requiresProxyingAVAudioSessionState
{
  return 1;
}

- (void)invalidate
{
  void *v3;
  NSObject *v4;
  _QWORD block[5];

  -[CXProvider abstractProvider](self, "abstractProvider");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "queue");
  v4 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __33__CXExtensionProvider_invalidate__block_invoke;
  block[3] = &unk_1E4B88AE8;
  block[4] = self;
  dispatch_async(v4, block);

}

void __33__CXExtensionProvider_invalidate__block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "self: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 32), "extensionContext");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "completeRequestReturningItems:completionHandler:", 0, 0);

}

- (void)beginRequestWithExtensionContext:(id)a3
{
  id v4;
  void *v5;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;
  CXExtensionProvider *v10;

  v4 = a3;
  -[CXProvider abstractProvider](self, "abstractProvider");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "queue");
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke;
  block[3] = &unk_1E4B88A20;
  v9 = v4;
  v10 = self;
  v7 = v4;
  dispatch_sync(v6, block);

}

void __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  _QWORD v9[4];
  id v10;
  uint8_t buf[4];
  uint64_t v12;
  __int16 v13;
  uint64_t v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  CXDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138412546;
    v12 = v3;
    v13 = 2112;
    v14 = v4;
    _os_log_impl(&dword_1A402D000, v2, OS_LOG_TYPE_DEFAULT, "Beginning request with extension context %@ for extension provider %@", buf, 0x16u);
  }

  objc_msgSend(*(id *)(a1 + 40), "setExtensionContext:", *(_QWORD *)(a1 + 32));
  v5 = *(void **)(a1 + 40);
  objc_msgSend(v5, "extensionContext");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setDelegate:", v5);

  objc_initWeak((id *)buf, *(id *)(a1 + 40));
  v9[0] = MEMORY[0x1E0C809B0];
  v9[1] = 3221225472;
  v9[2] = __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke_1;
  v9[3] = &unk_1E4B88CA8;
  objc_copyWeak(&v10, (id *)buf);
  objc_msgSend(*(id *)(a1 + 40), "extensionContext");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "_setRequestCleanUpBlock:", v9);

  objc_msgSend(*(id *)(a1 + 40), "registerCurrentConfiguration");
  objc_msgSend(*(id *)(a1 + 40), "abstractProvider");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "sendDidBeginForProvider:", *(_QWORD *)(a1 + 40));

  objc_destroyWeak(&v10);
  objc_destroyWeak((id *)buf);
}

void __56__CXExtensionProvider_beginRequestWithExtensionContext___block_invoke_1(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "abstractProvider");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "handleConnectionInterruptionForProvider:", WeakRetained);

}

- (void)providerExtensionVendorContext:(id)a3 receivedCommittedTransaction:(id)a4
{
  -[CXProvider commitTransaction:](self, "commitTransaction:", a4);
}

- (void)providerExtensionVendorContext:(id)a3 handledActionTimeout:(id)a4
{
  -[CXProvider handleActionTimeout:](self, "handleActionTimeout:", a4);
}

- (void)providerExtensionVendorContext:(id)a3 handledAudioSessionActivationStateChangedTo:(BOOL)a4
{
  id v5;

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a4);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CXProvider handleAudioSessionActivationStateChangedTo:](self, "handleAudioSessionActivationStateChangedTo:", v5);

}

- (CXProviderExtensionVendorContext)extensionContext
{
  return self->_extensionContext;
}

- (void)setExtensionContext:(id)a3
{
  objc_storeStrong((id *)&self->_extensionContext, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionContext, 0);
}

@end

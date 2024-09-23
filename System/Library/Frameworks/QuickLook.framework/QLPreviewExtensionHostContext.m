@implementation QLPreviewExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  return +[QLPreviewExtensionServiceContext_iOS _extensionAuxiliaryVendorProtocol](QLPreviewExtensionServiceContext_iOS, "_extensionAuxiliaryVendorProtocol");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return +[QLPreviewExtensionServiceContext_iOS _extensionAuxiliaryHostProtocol](QLPreviewExtensionServiceContext_iOS, "_extensionAuxiliaryHostProtocol");
}

- (id)protocolServiceWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  id v6;
  void *v7;
  _QWORD v9[4];
  id v10;

  v4 = a3;
  -[QLPreviewExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = MEMORY[0x24BDAC760];
  v9[1] = 3221225472;
  v9[2] = __65__QLPreviewExtensionHostContext_protocolServiceWithErrorHandler___block_invoke;
  v9[3] = &unk_24C7256F8;
  v10 = v4;
  v6 = v4;
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v9);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

void __65__QLPreviewExtensionHostContext_protocolServiceWithErrorHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject **v4;
  NSObject *v5;
  NSObject *v6;
  void *v7;
  uint64_t v8;
  int v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x24BDAC8D0];
  v3 = a2;
  v4 = (NSObject **)MEMORY[0x24BE7BF48];
  v5 = *MEMORY[0x24BE7BF48];
  if (!*MEMORY[0x24BE7BF48])
  {
    QLSInitLogging();
    v5 = *v4;
  }
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
  {
    v6 = v5;
    objc_msgSend(v3, "localizedDescription");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = 138412290;
    v10 = v7;
    _os_log_impl(&dword_20D4F5000, v6, OS_LOG_TYPE_ERROR, "Error calling service: %@ #Remote", (uint8_t *)&v9, 0xCu);

  }
  v8 = *(_QWORD *)(a1 + 32);
  if (v8)
    (*(void (**)(uint64_t, id))(v8 + 16))(v8, v3);

}

- (id)protocolService
{
  return -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", 0);
}

- (void)previewControllerWantsFullScreen:(BOOL)a3
{
  QLRunInMainThread();
}

void __66__QLPreviewExtensionHostContext_previewControllerWantsFullScreen___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "previewControllerWantsFullScreen:", *(unsigned __int8 *)(a1 + 40));

}

- (void)previewControllerDidUpdateTitle:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __65__QLPreviewExtensionHostContext_previewControllerDidUpdateTitle___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "previewControllerDidUpdateTitle:", *(_QWORD *)(a1 + 40));

}

- (void)previewControllerDidUpdatePreferredContentSize:(id)a3
{
  id v3;
  id v4;

  v4 = a3;
  v3 = v4;
  QLRunInMainThread();

}

void __80__QLPreviewExtensionHostContext_previewControllerDidUpdatePreferredContentSize___block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 24));
  objc_msgSend(WeakRetained, "previewControllerDidUpdatePreferredContentSize:", *(_QWORD *)(a1 + 40));

}

- (void)previewWillAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewWillAppear:", v3);

}

- (void)previewDidAppear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewDidAppear:", v3);

}

- (void)previewWillDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewWillDisappear:", v3);

}

- (void)previewDidDisappear:(BOOL)a3
{
  _BOOL8 v3;
  id v4;

  v3 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "previewDidDisappear:", v3);

}

- (void)setAppearance:(id)a3 animated:(BOOL)a4
{
  _BOOL8 v4;
  id v6;
  id v7;

  v4 = a4;
  v6 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "setAppearance:animated:", v6, v4);

}

- (void)setHostViewControllerProxy:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setHostViewControllerProxy:", v4);

}

- (void)loadPreviewControllerWithContents:(id)a3 context:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  id v11;
  void *v12;
  id v13;
  uint64_t v14;
  id v15;
  void *v16;
  id v17;
  _QWORD v18[4];
  id v19;
  _QWORD v20[4];
  id v21;

  v8 = a3;
  v9 = a5;
  v10 = v8;
  v11 = a4;
  objc_opt_class();
  v12 = v10;
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = objc_alloc(MEMORY[0x24BDE5F10]);
    v12 = (void *)objc_msgSend(v13, "initWithURL:sandboxType:", v10, *MEMORY[0x24BDAC000]);

  }
  v14 = MEMORY[0x24BDAC760];
  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke;
  v20[3] = &unk_24C7256F8;
  v15 = v9;
  v21 = v15;
  -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", v20);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v14;
  v18[1] = 3221225472;
  v18[2] = __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3;
  v18[3] = &unk_24C726C88;
  v19 = v15;
  v17 = v15;
  objc_msgSend(v16, "loadPreviewControllerWithContents:context:completionHandler:", v12, v11, v18);

}

void __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  QLRunInMainThread();

}

uint64_t __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32), 0);
}

void __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;

  v5 = a2;
  v8 = a3;
  v9 = *(id *)(a1 + 32);
  v6 = v8;
  v7 = v5;
  QLRunInMainThread();

}

uint64_t __93__QLPreviewExtensionHostContext_loadPreviewControllerWithContents_context_completionHandler___block_invoke_4(_QWORD *a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD, _QWORD))(a1[6] + 16))(a1[6], a1[4], a1[5]);
}

- (void)getPrinterProxyWithCompletionHandler:(id)a3
{
  id v4;
  uint64_t v5;
  id v6;
  void *v7;
  id v8;
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v4 = a3;
  v5 = MEMORY[0x24BDAC760];
  v11[0] = MEMORY[0x24BDAC760];
  v11[1] = 3221225472;
  v11[2] = __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke;
  v11[3] = &unk_24C7256F8;
  v6 = v4;
  v12 = v6;
  -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", v11);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v9[0] = v5;
  v9[1] = 3221225472;
  v9[2] = __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_3;
  v9[3] = &unk_24C726CB0;
  v10 = v6;
  v8 = v6;
  objc_msgSend(v7, "getPrinterProxyWithCompletionHandler:", v9);

}

void __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke(uint64_t a1)
{
  id v1;

  v1 = *(id *)(a1 + 32);
  QLRunInMainThread();

}

uint64_t __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_3(uint64_t a1, void *a2)
{
  id v3;
  id v4;
  id v5;

  v3 = a2;
  v5 = *(id *)(a1 + 32);
  v4 = v3;
  QLRunInMainThread();

}

uint64_t __70__QLPreviewExtensionHostContext_getPrinterProxyWithCompletionHandler___block_invoke_4(uint64_t a1)
{
  return (*(uint64_t (**)(_QWORD, _QWORD))(*(_QWORD *)(a1 + 40) + 16))(*(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 32));
}

- (void)invalidateServiceWithCompletionHandler:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  -[QLPreviewExtensionHostContext protocolService](self, "protocolService");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "invalidateServiceWithCompletionHandler:", v4);

}

- (void)generatePreviewForURL:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  id v8;
  void *v9;
  _QWORD v10[4];
  id v11;

  v6 = a4;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __66__QLPreviewExtensionHostContext_generatePreviewForURL_completion___block_invoke;
  v10[3] = &unk_24C7256F8;
  v11 = v6;
  v7 = v6;
  v8 = a3;
  -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", v10);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "generatePreviewForURL:completion:", v8, v7);

}

uint64_t __66__QLPreviewExtensionHostContext_generatePreviewForURL_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getARQLInlineProxyWithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __73__QLPreviewExtensionHostContext_getARQLInlineProxyWithCompletionHandler___block_invoke;
  v7[3] = &unk_24C7256F8;
  v8 = v4;
  v5 = v4;
  -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getARQLInlineProxyWithCompletionHandler:", v5);

}

uint64_t __73__QLPreviewExtensionHostContext_getARQLInlineProxyWithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getARQLInlineProxy2WithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__QLPreviewExtensionHostContext_getARQLInlineProxy2WithCompletionHandler___block_invoke;
  v7[3] = &unk_24C7256F8;
  v8 = v4;
  v5 = v4;
  -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getARQLInlineProxy2WithCompletionHandler:", v5);

}

uint64_t __74__QLPreviewExtensionHostContext_getARQLInlineProxy2WithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)getARQLInlineProxy3WithCompletionHandler:(id)a3
{
  id v4;
  id v5;
  void *v6;
  _QWORD v7[4];
  id v8;

  v4 = a3;
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __74__QLPreviewExtensionHostContext_getARQLInlineProxy3WithCompletionHandler___block_invoke;
  v7[3] = &unk_24C7256F8;
  v8 = v4;
  v5 = v4;
  -[QLPreviewExtensionHostContext protocolServiceWithErrorHandler:](self, "protocolServiceWithErrorHandler:", v7);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "getARQLInlineProxy3WithCompletionHandler:", v5);

}

uint64_t __74__QLPreviewExtensionHostContext_getARQLInlineProxy3WithCompletionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (QLRemoteItemViewController)remoteItemViewController
{
  return (QLRemoteItemViewController *)objc_loadWeakRetained((id *)&self->_remoteItemViewController);
}

- (void)setRemoteItemViewController:(id)a3
{
  objc_storeWeak((id *)&self->_remoteItemViewController, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_remoteItemViewController);
}

@end

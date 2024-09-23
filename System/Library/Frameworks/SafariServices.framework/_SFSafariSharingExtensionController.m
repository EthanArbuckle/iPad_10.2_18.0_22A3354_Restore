@implementation _SFSafariSharingExtensionController

- (_SFSafariSharingExtensionController)initWithWebView:(id)a3
{
  id v4;
  _SFSafariSharingExtensionController *v5;
  _SFSafariSharingExtensionController *v6;
  _SFSafariSharingExtensionController *v7;
  objc_super v9;

  v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)_SFSafariSharingExtensionController;
  v5 = -[_SFSafariSharingExtensionController init](&v9, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_webView, v4);
    v7 = v6;
  }

  return v6;
}

- (id)_extensionControllerProxy
{
  SFSharingExtensionWebProcessController *extensionControllerProxy;
  id WeakRetained;
  void *v5;
  void *v6;
  SFSharingExtensionWebProcessController *v7;
  SFSharingExtensionWebProcessController *v8;

  extensionControllerProxy = self->_extensionControllerProxy;
  if (!extensionControllerProxy)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_webView);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE7D81F0);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "remoteObjectProxyWithInterface:", v6);
    v7 = (SFSharingExtensionWebProcessController *)objc_claimAutoreleasedReturnValue();
    v8 = self->_extensionControllerProxy;
    self->_extensionControllerProxy = v7;

    extensionControllerProxy = self->_extensionControllerProxy;
  }
  return extensionControllerProxy;
}

- (void)prepareJavaScriptWorldForSharingExtension:(id)a3 javaScript:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[_SFSafariSharingExtensionController _extensionControllerProxy](self, "_extensionControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "prepareJavaScriptWorldForSharingExtension:javaScript:", v8, v6);

}

- (void)runJavaScriptForSharingExtension:(id)a3 extraArguments:(id)a4 completion:(id)a5
{
  id v8;
  id v9;
  void *v10;
  uint64_t v11;
  dispatch_time_t v12;
  NSObject *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];
  _QWORD v22[5];
  _QWORD v23[5];
  id v24;

  v8 = a3;
  v9 = a4;
  v23[0] = 0;
  v23[1] = v23;
  v23[2] = 0x3032000000;
  v23[3] = __Block_byref_object_copy__18;
  v23[4] = __Block_byref_object_dispose__18;
  v24 = (id)MEMORY[0x1A8598C40](a5);
  -[_SFSafariSharingExtensionController _extensionControllerProxy](self, "_extensionControllerProxy");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = MEMORY[0x1E0C809B0];
  v22[0] = MEMORY[0x1E0C809B0];
  v22[1] = 3221225472;
  v22[2] = __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke;
  v22[3] = &unk_1E4AC8248;
  v22[4] = v23;
  objc_msgSend(v10, "evaluateJavaScriptForSharingExtension:extraArguments:completionHandler:", v8, v9, v22);

  v12 = dispatch_time(0, 2000000000);
  v21[0] = v11;
  v21[1] = 3221225472;
  v21[2] = __98___SFSafariSharingExtensionController_runJavaScriptForSharingExtension_extraArguments_completion___block_invoke_50;
  v21[3] = &unk_1E4ABFDC0;
  v21[4] = v23;
  dispatch_after(v12, MEMORY[0x1E0C80D38], v21);
  v13 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    -[_SFSafariSharingExtensionController runJavaScriptForSharingExtension:extraArguments:completion:].cold.1(v13, v14, v15, v16, v17, v18, v19, v20);
  _Block_object_dispose(v23, 8);

}

- (void)finalizeJavaScriptForSharingExtension:(id)a3 arguments:(id)a4
{
  id v6;
  void *v7;
  id v8;

  v8 = a3;
  v6 = a4;
  -[_SFSafariSharingExtensionController _extensionControllerProxy](self, "_extensionControllerProxy");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "finalizeJavaScriptForSharingExtension:arguments:", v8, v6);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionControllerProxy, 0);
  objc_destroyWeak((id *)&self->_webView);
}

- (void)runJavaScriptForSharingExtension:(uint64_t)a3 extraArguments:(uint64_t)a4 completion:(uint64_t)a5 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Starting timer waiting for result from JavaScript", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end

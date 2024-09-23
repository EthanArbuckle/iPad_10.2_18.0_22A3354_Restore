@implementation SFWebProcessPlugInPageExtensionController

- (SFWebProcessPlugInPageExtensionController)initWithBrowserContextController:(id)a3
{
  id v4;
  SFWebProcessPlugInPageExtensionController *v5;
  SFWebProcessPlugInPageExtensionController *v6;
  NSMutableDictionary *v7;
  NSMutableDictionary *extensionToScriptWorldMap;
  SFWebProcessPlugInPageExtensionController *v9;
  objc_super v11;

  v4 = a3;
  v11.receiver = self;
  v11.super_class = (Class)SFWebProcessPlugInPageExtensionController;
  v5 = -[SFWebProcessPlugInPageExtensionController init](&v11, sel_init);
  v6 = v5;
  if (v5)
  {
    objc_storeWeak((id *)&v5->_browserContextController, v4);
    -[SFWebProcessPlugInPageExtensionController _setUpExtensionControllerInterface](v6, "_setUpExtensionControllerInterface");
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    extensionToScriptWorldMap = v6->_extensionToScriptWorldMap;
    v6->_extensionToScriptWorldMap = v7;

    v9 = v6;
  }

  return v6;
}

- (void)_setUpExtensionControllerInterface
{
  _WKRemoteObjectInterface *v3;
  _WKRemoteObjectInterface *extensionControllerInterface;
  void *v5;
  id WeakRetained;

  objc_msgSend(MEMORY[0x1E0CEF6C8], "remoteObjectInterfaceWithProtocol:", &unk_1EE7D81F0);
  v3 = (_WKRemoteObjectInterface *)objc_claimAutoreleasedReturnValue();
  extensionControllerInterface = self->_extensionControllerInterface;
  self->_extensionControllerInterface = v3;

  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
  objc_msgSend(WeakRetained, "_remoteObjectRegistry");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "registerExportedObject:interface:", self, self->_extensionControllerInterface);

}

- (void)dealloc
{
  objc_super v3;

  -[SFWebProcessPlugInPageExtensionController clearExtensionScriptWorlds](self, "clearExtensionScriptWorlds");
  -[SFWebProcessPlugInPageExtensionController _clearExtensionControllerInterface](self, "_clearExtensionControllerInterface");
  v3.receiver = self;
  v3.super_class = (Class)SFWebProcessPlugInPageExtensionController;
  -[SFWebProcessPlugInPageExtensionController dealloc](&v3, sel_dealloc);
}

- (void)_clearExtensionControllerInterface
{
  id WeakRetained;
  _WKRemoteObjectInterface *extensionControllerInterface;
  id v5;

  if (self->_extensionControllerInterface)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
    objc_msgSend(WeakRetained, "_remoteObjectRegistry");
    v5 = (id)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v5, "unregisterExportedObject:interface:", self, self->_extensionControllerInterface);
    extensionControllerInterface = self->_extensionControllerInterface;
    self->_extensionControllerInterface = 0;

  }
}

- (void)prepareJavaScriptWorldForSharingExtension:(id)a3 javaScript:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  void *v16;
  id WeakRetained;
  void *v18;
  void *v19;
  id v20;
  NSObject *v21;
  uint8_t v22[16];

  v6 = a3;
  v7 = a4;
  v8 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    -[SFWebProcessPlugInPageExtensionController prepareJavaScriptWorldForSharingExtension:javaScript:].cold.1(v8, v9, v10, v11, v12, v13, v14, v15);
  -[NSMutableDictionary objectForKey:](self->_extensionToScriptWorldMap, "objectForKey:", v6);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E0CEF628], "world");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    -[NSMutableDictionary setObject:forKey:](self->_extensionToScriptWorldMap, "setObject:forKey:", v16, v6);
  }
  WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
  objc_msgSend(WeakRetained, "mainFrame");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "jsContextForWorld:", v16);
  v19 = (void *)objc_claimAutoreleasedReturnValue();

  v20 = (id)objc_msgSend(v19, "evaluateScript:", v7);
  v21 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v22 = 0;
    _os_log_impl(&dword_1A3B2D000, v21, OS_LOG_TYPE_INFO, "Finished setting up JavaScript world", v22, 2u);
  }

}

- (void)evaluateJavaScriptForSharingExtension:(id)a3 extraArguments:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  void (**v10)(id, _QWORD);
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  void *v19;
  id WeakRetained;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  int v26;
  NSObject *v27;
  id v28;
  void *v29;
  void *v30;
  void *v31;
  void *v32;
  NSObject *v33;
  void *v34;
  id v35;
  void *v36;
  uint8_t buf[8];
  _QWORD v38[4];
  void (**v39)(id, _QWORD);
  void *v40;
  _QWORD v41[2];
  _QWORD v42[3];

  v42[2] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v9 = a4;
  v10 = (void (**)(id, _QWORD))a5;
  v11 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[SFWebProcessPlugInPageExtensionController evaluateJavaScriptForSharingExtension:extraArguments:completionHandler:].cold.2(v11, v12, v13, v14, v15, v16, v17, v18);
  -[NSMutableDictionary objectForKey:](self->_extensionToScriptWorldMap, "objectForKey:", v8);
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  if (v19)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
    objc_msgSend(WeakRetained, "mainFrame");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "jsContextForWorld:", v19);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v22, "globalObject");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "valueForProperty:", CFSTR("ExtensionPreprocessingJS"));
    v24 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v24, "isUndefined") & 1) != 0
      || (objc_msgSend(v24, "valueForProperty:", CFSTR("run")),
          v25 = (void *)objc_claimAutoreleasedReturnValue(),
          v26 = objc_msgSend(v25, "isUndefined"),
          v25,
          v26))
    {
      v10[2](v10, MEMORY[0x1E0C9AA70]);
    }
    else
    {
      v38[0] = MEMORY[0x1E0C809B0];
      v38[1] = 3221225472;
      v38[2] = __116__SFWebProcessPlugInPageExtensionController_evaluateJavaScriptForSharingExtension_extraArguments_completionHandler___block_invoke;
      v38[3] = &unk_1E4AC47A0;
      v39 = v10;
      v36 = (void *)MEMORY[0x1A8598C40](v38);
      v28 = objc_alloc(MEMORY[0x1E0C99E08]);
      v41[0] = CFSTR("extensionName");
      v41[1] = CFSTR("completionFunction");
      v42[0] = v8;
      v29 = (void *)MEMORY[0x1A8598C40](v36);
      v42[1] = v29;
      objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v42, v41, 2);
      v30 = (void *)objc_claimAutoreleasedReturnValue();
      v31 = (void *)objc_msgSend(v28, "initWithDictionary:", v30);

      if (v9)
        objc_msgSend(v31, "setObject:forKey:", v9, CFSTR("extraArguments"));
      v32 = (void *)objc_msgSend(v31, "copy");
      v33 = WBS_LOG_CHANNEL_PREFIXExtensions();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A3B2D000, v33, OS_LOG_TYPE_INFO, "Invoking extension's JavaScript", buf, 2u);
      }
      v40 = v32;
      objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v40, 1);
      v34 = (void *)objc_claimAutoreleasedReturnValue();
      v35 = (id)objc_msgSend(v24, "invokeMethod:withArguments:", CFSTR("run"), v34);

    }
  }
  else
  {
    v27 = WBS_LOG_CHANNEL_PREFIXExtensions();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
      -[SFWebProcessPlugInPageExtensionController evaluateJavaScriptForSharingExtension:extraArguments:completionHandler:].cold.1(v27);
    v10[2](v10, 0);
  }

}

void __116__SFWebProcessPlugInPageExtensionController_evaluateJavaScriptForSharingExtension_extraArguments_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  int v6;
  void *v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  objc_msgSend(v3, "toDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = WBS_LOG_CHANNEL_PREFIXExtensions();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6 = 134217984;
    v7 = v4;
    _os_log_impl(&dword_1A3B2D000, v5, OS_LOG_TYPE_INFO, "Script returned results to native code: %p", (uint8_t *)&v6, 0xCu);
  }
  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();

}

- (void)finalizeJavaScriptForSharingExtension:(id)a3 arguments:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id WeakRetained;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  char v15;
  void *v16;
  id v17;
  void *v18;
  _QWORD v19[2];

  v19[1] = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  -[NSMutableDictionary objectForKey:](self->_extensionToScriptWorldMap, "objectForKey:", v6);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    -[NSMutableDictionary removeObjectForKey:](self->_extensionToScriptWorldMap, "removeObjectForKey:", v6);
    WeakRetained = objc_loadWeakRetained((id *)&self->_browserContextController);
    objc_msgSend(WeakRetained, "mainFrame");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "jsContextForWorld:", v8);
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(v11, "globalObject");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "valueForProperty:", CFSTR("ExtensionPreprocessingJS"));
    v13 = (void *)objc_claimAutoreleasedReturnValue();

    if ((objc_msgSend(v13, "isUndefined") & 1) == 0)
    {
      objc_msgSend(v13, "valueForProperty:", CFSTR("finalize"));
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      v15 = objc_msgSend(v14, "isUndefined");

      if ((v15 & 1) == 0)
      {
        v19[0] = v7;
        objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v19, 1);
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        v17 = (id)objc_msgSend(v13, "invokeMethod:withArguments:", CFSTR("finalize"), v16);

        objc_msgSend(v11, "globalObject");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v18, "deleteProperty:", CFSTR("ExtensionPreprocessingJS"));

      }
    }
    objc_msgSend(v8, "clearWrappers");

  }
}

- (void)clearExtensionScriptWorlds
{
  -[NSMutableDictionary enumerateKeysAndObjectsUsingBlock:](self->_extensionToScriptWorldMap, "enumerateKeysAndObjectsUsingBlock:", &__block_literal_global_35);
  -[NSMutableDictionary removeAllObjects](self->_extensionToScriptWorldMap, "removeAllObjects");
}

uint64_t __71__SFWebProcessPlugInPageExtensionController_clearExtensionScriptWorlds__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  return objc_msgSend(a3, "clearWrappers");
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_extensionToScriptWorldMap, 0);
  objc_storeStrong((id *)&self->_extensionControllerInterface, 0);
  objc_destroyWeak((id *)&self->_browserContextController);
}

- (void)prepareJavaScriptWorldForSharingExtension:(uint64_t)a3 javaScript:(uint64_t)a4 .cold.1(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Setting up JavaScript world to run extension", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

- (void)evaluateJavaScriptForSharingExtension:(os_log_t)log extraArguments:completionHandler:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1A3B2D000, log, OS_LOG_TYPE_ERROR, "Can't find extension JavaScript world, possibly because the page navigated; won't run JavaScript code",
    v1,
    2u);
  OUTLINED_FUNCTION_1();
}

- (void)evaluateJavaScriptForSharingExtension:(uint64_t)a3 extraArguments:(uint64_t)a4 completionHandler:(uint64_t)a5 .cold.2(NSObject *a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_5(&dword_1A3B2D000, a1, a3, "Running JavaScript extension", a5, a6, a7, a8, 0);
  OUTLINED_FUNCTION_1();
}

@end

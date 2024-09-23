@implementation DEExtensionHostContext

+ (id)_extensionAuxiliaryVendorProtocol
{
  if (_extensionAuxiliaryVendorProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryVendorProtocol_onceToken, &__block_literal_global_0);
  return (id)_extensionAuxiliaryVendorProtocol___interface;
}

void __59__DEExtensionHostContext__extensionAuxiliaryVendorProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  id v9;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE790F80);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryVendorProtocol___interface;
  _extensionAuxiliaryVendorProtocol___interface = v0;

  v2 = (void *)MEMORY[0x1E0C99E60];
  v3 = objc_opt_class();
  v4 = objc_opt_class();
  v5 = objc_opt_class();
  v6 = objc_opt_class();
  v7 = objc_opt_class();
  v8 = objc_opt_class();
  objc_msgSend(v2, "setWithObjects:", v3, v4, v5, v6, v7, v8, objc_opt_class(), 0);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_attachmentListWithHandler_, 0, 1);
  objc_msgSend((id)_extensionAuxiliaryVendorProtocol___interface, "setClasses:forSelector:argumentIndex:ofReply:", v9, sel_attachmentsForParameters_withHandler_, 0, 1);

}

+ (id)_extensionAuxiliaryHostProtocol
{
  if (_extensionAuxiliaryHostProtocol_onceToken != -1)
    dispatch_once(&_extensionAuxiliaryHostProtocol_onceToken, &__block_literal_global_104);
  return (id)_extensionAuxiliaryHostProtocol___interface;
}

void __57__DEExtensionHostContext__extensionAuxiliaryHostProtocol__block_invoke()
{
  uint64_t v0;
  void *v1;

  objc_msgSend(MEMORY[0x1E0CB3B50], "interfaceWithProtocol:", &unk_1EE78F4C8);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_extensionAuxiliaryHostProtocol___interface;
  _extensionAuxiliaryHostProtocol___interface = v0;

}

- (BOOL)hasEntitlement
{
  void *v2;
  void *v3;
  char v4;
  NSObject *v5;

  -[DEExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "valueForEntitlement:", CFSTR("com.apple.DiagnosticExtensions.extension"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = objc_msgSend(v3, "BOOLValue");
  if ((v4 & 1) == 0)
  {
    +[DELogging fwHandle](DELogging, "fwHandle");
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR))
      -[DEExtensionHostContext hasEntitlement].cold.1(v5);

  }
  return v4;
}

- (void)attachmentListWithHandler:(id)a3
{
  void *v4;
  void *v5;
  void (**v6)(id, _QWORD);

  v6 = (void (**)(id, _QWORD))a3;
  if (-[DEExtensionHostContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_111);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
      objc_msgSend(v5, "attachmentListWithHandler:", v6);
    else
      v6[2](v6, 0);

  }
  else
  {
    v6[2](v6, 0);
  }

}

void __52__DEExtensionHostContext_attachmentListWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __52__DEExtensionHostContext_attachmentListWithHandler___block_invoke_cold_1(v2);

}

- (void)attachmentsForParameters:(id)a3 withProgressHandler:(id)a4 withHandler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  _BOOL4 v20;
  id v21;
  void *v22;
  void *v23;
  void *v24;
  NSObject *v25;
  void *v26;
  void *v27;
  void *v28;
  uint64_t v29;
  id v30;
  void *v31;
  void *v32;
  void *v33;
  DEExtensionHostContext *val;
  id v35;
  _QWORD v36[4];
  id v37;
  id v38;
  _QWORD v39[4];
  id v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  __int128 v44;
  uint8_t buf[4];
  const __CFString *v46;
  __int16 v47;
  void *v48;
  __int16 v49;
  const __CFString *v50;
  __int16 v51;
  void *v52;
  _BYTE v53[128];
  uint64_t v54;

  v54 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  v35 = a4;
  v9 = a5;
  val = self;
  v33 = v8;
  if (-[DEExtensionHostContext hasEntitlement](self, "hasEntitlement"))
  {
    v32 = v9;
    v10 = (void *)objc_msgSend(v8, "mutableCopy");
    objc_msgSend(v8, "objectForKey:", CFSTR("DEExtensionAttachmentsParamBundleIDKey"));
    v11 = (void *)objc_claimAutoreleasedReturnValue();

    if (v11)
    {
      v44 = 0u;
      v42 = 0u;
      v43 = 0u;
      v41 = 0u;
      objc_msgSend(v8, "objectForKeyedSubscript:", CFSTR("DEExtensionAttachmentsParamBundleIDKey"));
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
      if (v13)
      {
        v14 = *(_QWORD *)v42;
        do
        {
          for (i = 0; i != v13; ++i)
          {
            if (*(_QWORD *)v42 != v14)
              objc_enumerationMutation(v12);
            v16 = *(void **)(*((_QWORD *)&v41 + 1) + 8 * i);
            v17 = (void *)SBSCopyExecutablePathForDisplayIdentifier();
            objc_msgSend(v17, "lastPathComponent");
            v18 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v10, "objectForKey:", CFSTR("DEExtensionAttachmentsParamDisplayNameKey"));
            v19 = (void *)objc_claimAutoreleasedReturnValue();
            v20 = v19 == 0;

            if (v20)
            {
              v21 = objc_alloc_init(MEMORY[0x1E0C99DE8]);
              objc_msgSend(v10, "setObject:forKeyedSubscript:", v21, CFSTR("DEExtensionAttachmentsParamDisplayNameKey"));

            }
            if (v18)
            {
              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DEExtensionAttachmentsParamDisplayNameKey"));
              v22 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v22, "addObject:", v18);
            }
            else
            {
              objc_msgSend(v16, "componentsSeparatedByString:", CFSTR("."));
              v23 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v23, "lastObject");
              v22 = (void *)objc_claimAutoreleasedReturnValue();

              objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DEExtensionAttachmentsParamDisplayNameKey"));
              v24 = (void *)objc_claimAutoreleasedReturnValue();
              objc_msgSend(v24, "addObject:", v22);

            }
          }
          v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v41, v53, 16);
        }
        while (v13);
      }

    }
    +[DELogging fwHandle](DELogging, "fwHandle");
    v25 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DEExtensionAttachmentsParamBundleIDKey"));
      v26 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "objectForKeyedSubscript:", CFSTR("DEExtensionAttachmentsParamDisplayNameKey"));
      v27 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138413058;
      v46 = CFSTR("DEExtensionAttachmentsParamBundleIDKey");
      v47 = 2112;
      v48 = v26;
      v49 = 2112;
      v50 = CFSTR("DEExtensionAttachmentsParamDisplayNameKey");
      v51 = 2112;
      v52 = v27;
      _os_log_impl(&dword_1A4EEE000, v25, OS_LOG_TYPE_DEFAULT, "attachmentsForParameters:withProgressHandler: {%@:%@, %@:%@}", buf, 0x2Au);

    }
    -[DEExtensionHostContext _auxiliaryConnection](val, "_auxiliaryConnection");
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v29 = MEMORY[0x1E0C809B0];
    v39[0] = MEMORY[0x1E0C809B0];
    v39[1] = 3221225472;
    v39[2] = __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke;
    v39[3] = &unk_1E4E35298;
    v30 = v32;
    v40 = v30;
    objc_msgSend(v28, "remoteObjectProxyWithErrorHandler:", v39);
    v31 = (void *)objc_claimAutoreleasedReturnValue();

    -[DEExtensionHostContext setProgressHandler:](val, "setProgressHandler:", v35);
    objc_initWeak((id *)buf, val);
    v36[0] = v29;
    v36[1] = 3221225472;
    v36[2] = __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke_115;
    v36[3] = &unk_1E4E352C0;
    objc_copyWeak(&v38, (id *)buf);
    v37 = v30;
    objc_msgSend(v31, "attachmentsForParameters:withHandler:", v10, v36);

    objc_destroyWeak(&v38);
    objc_destroyWeak((id *)buf);

    v9 = v32;
  }
  else
  {
    (*((void (**)(id, _QWORD))v9 + 2))(v9, 0);
  }

}

void __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  NSObject *v4;

  v3 = a2;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke_cold_1(v3);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

void __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke_115(uint64_t a1, void *a2)
{
  id *v3;
  id WeakRetained;
  id v5;

  v3 = (id *)(a1 + 40);
  v5 = a2;
  WeakRetained = objc_loadWeakRetained(v3);
  objc_msgSend(WeakRetained, "setProgressHandler:", 0);

  (*(void (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setupForParameters:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[DEExtensionHostContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_117);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "setupWithParameters:withHandler:", v9, v6);

  }
}

void __57__DEExtensionHostContext_setupForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __57__DEExtensionHostContext_setupForParameters_withHandler___block_invoke_cold_1(v2);

}

- (void)teardownForParameters:(id)a3 withHandler:(id)a4
{
  id v6;
  void *v7;
  void *v8;
  id v9;

  v9 = a3;
  v6 = a4;
  if (-[DEExtensionHostContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_118);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (v8)
      objc_msgSend(v8, "teardownWithParameters:withHandler:", v9, v6);

  }
}

void __60__DEExtensionHostContext_teardownForParameters_withHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __60__DEExtensionHostContext_teardownForParameters_withHandler___block_invoke_cold_1(v2);

}

- (void)isExtensionEnhancedLoggingStateOnWithHandler:(id)a3
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  if (-[DEExtensionHostContext hasEntitlement](self, "hasEntitlement"))
  {
    -[DEExtensionHostContext _auxiliaryConnection](self, "_auxiliaryConnection");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "remoteObjectProxyWithErrorHandler:", &__block_literal_global_119);
    v5 = (void *)objc_claimAutoreleasedReturnValue();

    if (v5)
    {
      objc_msgSend(v5, "isExtensionEnhancedLoggingStateOnWithHandler:", v6);

    }
  }

}

void __71__DEExtensionHostContext_isExtensionEnhancedLoggingStateOnWithHandler___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  +[DELogging fwHandle](DELogging, "fwHandle");
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __71__DEExtensionHostContext_isExtensionEnhancedLoggingStateOnWithHandler___block_invoke_cold_1(v2);

}

- (void)collectionDidUpdateWithProgress:(id)a3
{
  void *v4;
  void (**v5)(_QWORD, _QWORD);
  id v6;

  v6 = a3;
  -[DEExtensionHostContext progressHandler](self, "progressHandler");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4)
  {
    -[DEExtensionHostContext progressHandler](self, "progressHandler");
    v5 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    ((void (**)(_QWORD, id))v5)[2](v5, v6);

  }
}

- (id)progressHandler
{
  return objc_getProperty(self, a2, 24, 1);
}

- (void)setProgressHandler:(id)a3
{
  objc_setProperty_atomic_copy(self, a2, a3, 24);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_progressHandler, 0);
}

- (void)hasEntitlement
{
  int v1;
  const __CFString *v2;
  uint64_t v3;

  v3 = *MEMORY[0x1E0C80C00];
  v1 = 138412290;
  v2 = CFSTR("com.apple.DiagnosticExtensions.extension");
  _os_log_error_impl(&dword_1A4EEE000, log, OS_LOG_TYPE_ERROR, "Missing entitlement: %@", (uint8_t *)&v1, 0xCu);
}

void __52__DEExtensionHostContext_attachmentListWithHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "error calling attachmentList - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __83__DEExtensionHostContext_attachmentsForParameters_withProgressHandler_withHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "error calling attachmentsForParameters: - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __57__DEExtensionHostContext_setupForParameters_withHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "error calling setupForParameters: - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __60__DEExtensionHostContext_teardownForParameters_withHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "error calling teardownForParameters: - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

void __71__DEExtensionHostContext_isExtensionEnhancedLoggingStateOnWithHandler___block_invoke_cold_1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "localizedDescription");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_2();
  OUTLINED_FUNCTION_2_0(&dword_1A4EEE000, v2, v3, "error calling isExtensionEnhancedLoggingStateOn: - %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_0();
}

@end

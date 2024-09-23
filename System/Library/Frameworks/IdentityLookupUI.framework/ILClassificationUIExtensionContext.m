@implementation ILClassificationUIExtensionContext

- (void)setReadyForClassificationResponse:(BOOL)readyForClassificationResponse
{
  _BOOL8 v3;
  id v4;

  v3 = readyForClassificationResponse;
  self->_readyForClassificationResponse = readyForClassificationResponse;
  -[ILClassificationUIExtensionContext remoteObjectProxyWithErrorHandler:](self, "remoteObjectProxyWithErrorHandler:", &__block_literal_global);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setReadyForClassificationResponse:", v3);

}

void __72__ILClassificationUIExtensionContext_setReadyForClassificationResponse___block_invoke(uint64_t a1, void *a2)
{
  id v2;
  NSObject *v3;

  v2 = a2;
  ILDefaultLog();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __72__ILClassificationUIExtensionContext_setReadyForClassificationResponse___block_invoke_cold_1((uint64_t)v2, v3);

}

- (void)prepareForClassificationRequest:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  char isKindOfClass;
  NSObject *v8;
  _QWORD v9[4];
  NSObject *v10;
  ILClassificationUIExtensionContext *v11;
  uint8_t buf[4];
  id v13;
  uint64_t v14;

  v14 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  ILDefaultLog();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v13 = v4;
    _os_log_impl(&dword_228FAC000, v5, OS_LOG_TYPE_DEFAULT, "Asked to prepare view controller for classification request %@", buf, 0xCu);
  }

  -[ILClassificationUIExtensionContext viewController](self, "viewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v9[0] = MEMORY[0x24BDAC760];
    v9[1] = 3221225472;
    v9[2] = __70__ILClassificationUIExtensionContext_prepareForClassificationRequest___block_invoke;
    v9[3] = &unk_24F1A2770;
    v10 = v4;
    v11 = self;
    dispatch_async(MEMORY[0x24BDAC9B8], v9);
    v8 = v10;
  }
  else
  {
    ILDefaultLog();
    v8 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      -[ILClassificationUIExtensionContext prepareForClassificationRequest:].cold.1(self);
  }

}

void __70__ILClassificationUIExtensionContext_prepareForClassificationRequest___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  void *v4;
  int v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    v5 = 138412290;
    v6 = v3;
    _os_log_impl(&dword_228FAC000, v2, OS_LOG_TYPE_DEFAULT, "Asking extension to prepare for classification request: %@", (uint8_t *)&v5, 0xCu);
  }

  objc_msgSend(*(id *)(a1 + 40), "viewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "prepareForClassificationRequest:", *(_QWORD *)(a1 + 32));

}

- (void)classificationResponseForRequest:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  void *v8;
  char isKindOfClass;
  NSObject *v10;
  _QWORD block[5];
  id v12;
  uint64_t *v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  uint64_t (*v17)(uint64_t, uint64_t);
  void (*v18)(uint64_t);
  id v19;

  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  -[ILClassificationUIExtensionContext viewController](self, "viewController");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  isKindOfClass = objc_opt_isKindOfClass();

  if ((isKindOfClass & 1) != 0)
  {
    v14 = 0;
    v15 = &v14;
    v16 = 0x3032000000;
    v17 = __Block_byref_object_copy_;
    v18 = __Block_byref_object_dispose_;
    v19 = 0;
    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __82__ILClassificationUIExtensionContext_classificationResponseForRequest_completion___block_invoke;
    block[3] = &unk_24F1A27D8;
    v13 = &v14;
    block[4] = self;
    v12 = v6;
    dispatch_sync(MEMORY[0x24BDAC9B8], block);
    v7[2](v7, v15[5], 0);

    _Block_object_dispose(&v14, 8);
  }
  else
  {
    ILDefaultLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      -[ILClassificationUIExtensionContext classificationResponseForRequest:completion:].cold.1(self);

  }
}

void __82__ILClassificationUIExtensionContext_classificationResponseForRequest_completion___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  uint8_t v7[16];

  ILDefaultLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_228FAC000, v2, OS_LOG_TYPE_DEFAULT, "Asking extension to for classification response...", v7, 2u);
  }

  objc_msgSend(*(id *)(a1 + 32), "viewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "classificationResponseForRequest:", *(_QWORD *)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = *(_QWORD *)(*(_QWORD *)(a1 + 48) + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = v4;

}

- (id)remoteObjectProxyWithErrorHandler:(id)a3
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  -[ILClassificationUIExtensionContext _auxiliaryConnection](self, "_auxiliaryConnection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "remoteObjectProxyWithErrorHandler:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

+ (id)_extensionAuxiliaryVendorProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "il_classificationUIExtensionVendorInterface");
}

+ (id)_extensionAuxiliaryHostProtocol
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "il_classificationUIExtensionHostInterface");
}

- (BOOL)isReadyForClassificationResponse
{
  return self->_readyForClassificationResponse;
}

void __72__ILClassificationUIExtensionContext_setReadyForClassificationResponse___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_228FAC000, a2, OS_LOG_TYPE_ERROR, "remoteObjectProxy error: %@", (uint8_t *)&v2, 0xCu);
}

- (void)prepareForClassificationRequest:(void *)a1 .cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "viewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_228FAC000, v2, v3, "View controller %@ is not of class %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

- (void)classificationResponseForRequest:(void *)a1 completion:.cold.1(void *a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint8_t v8;

  objc_msgSend(a1, "viewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  OUTLINED_FUNCTION_1_0();
  OUTLINED_FUNCTION_0_0(&dword_228FAC000, v2, v3, "View controller %@ is not of class %@", v4, v5, v6, v7, v8);

  OUTLINED_FUNCTION_2();
}

@end

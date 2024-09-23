@implementation FLExtensionViewController

- (void)beginRequestWithExtensionContext:(id)a3
{
  NSExtensionContext *v4;
  NSObject *v5;
  NSExtensionContext *context;
  uint8_t v7[16];

  v4 = (NSExtensionContext *)a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "Follow up extension starting", v7, 2u);
  }

  context = self->_context;
  self->_context = v4;

}

+ (id)_exportedInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E3ECA8);
}

+ (id)_remoteViewControllerInterface
{
  return (id)objc_msgSend(MEMORY[0x24BDD1990], "interfaceWithProtocol:", &unk_254E47148);
}

- (id)hostInterface
{
  return (id)-[NSExtensionContext hostContextWithErrorHandler:](self->_context, "hostContextWithErrorHandler:", &__block_literal_global_0);
}

void __42__FLExtensionViewController_hostInterface__block_invoke(uint64_t a1, void *a2)
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
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__FLExtensionViewController_hostInterface__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (id)syncHostInterface
{
  return (id)-[NSExtensionContext syncHostContextWithErrorHandler:](self->_context, "syncHostContextWithErrorHandler:", &__block_literal_global_48);
}

void __46__FLExtensionViewController_syncHostInterface__block_invoke(uint64_t a1, void *a2)
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
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__FLExtensionViewController_hostInterface__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

- (void)finishProcessing
{
  -[FLExtensionViewController finishProcessingWithUserInfo:](self, "finishProcessingWithUserInfo:", 0);
}

- (void)finishProcessingWithUserInfo:(id)a3
{
  id v4;
  NSObject *v5;
  void *v6;
  _QWORD v7[5];
  uint8_t buf[16];

  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "Extension called finish", buf, 2u);
  }

  -[NSExtensionContext syncHostContextWithErrorHandler:](self->_context, "syncHostContextWithErrorHandler:", &__block_literal_global_49);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = MEMORY[0x24BDAC760];
  v7[1] = 3221225472;
  v7[2] = __58__FLExtensionViewController_finishProcessingWithUserInfo___block_invoke_50;
  v7[3] = &unk_24D55CAC8;
  v7[4] = self;
  objc_msgSend(v6, "extensionDidFinishWithUserInfo:completionHandler:", v4, v7);

}

void __58__FLExtensionViewController_finishProcessingWithUserInfo___block_invoke(uint64_t a1, void *a2)
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
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR))
    __42__FLExtensionViewController_hostInterface__block_invoke_cold_1((uint64_t)v2, v3, v4, v5, v6, v7, v8, v9);

}

uint64_t __58__FLExtensionViewController_finishProcessingWithUserInfo___block_invoke_50(uint64_t result)
{
  uint64_t v1;
  NSObject *v2;
  uint8_t v3[16];

  if (*(_QWORD *)(*(_QWORD *)(result + 32) + 968))
  {
    v1 = result;
    _FLLogSystem();
    v2 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)v3 = 0;
      _os_log_impl(&dword_21641D000, v2, OS_LOG_TYPE_DEFAULT, "Running within extension context, terminating... ", v3, 2u);
    }

    return objc_msgSend(*(id *)(*(_QWORD *)(v1 + 32) + 968), "completeRequestReturningItems:completionHandler:", 0, 0);
  }
  return result;
}

- (void)viewDidAppear:(BOOL)a3
{
  void *v4;
  void *v5;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)FLExtensionViewController;
  -[FLExtensionViewController viewDidAppear:](&v6, sel_viewDidAppear_, a3);
  -[FLExtensionViewController view](self, "view");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "window");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "makeKeyAndVisible");

}

- (void)processFollowUpItem:(id)a3 selectedAction:(id)a4 completion:(id)a5
{
  id v7;
  id v8;
  void (**v9)(id, _QWORD);
  NSObject *v10;
  int v11;
  id v12;
  __int16 v13;
  id v14;
  uint64_t v15;

  v15 = *MEMORY[0x24BDAC8D0];
  v7 = a3;
  v8 = a4;
  v9 = (void (**)(id, _QWORD))a5;
  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    v11 = 138412546;
    v12 = v7;
    v13 = 2112;
    v14 = v8;
    _os_log_impl(&dword_21641D000, v10, OS_LOG_TYPE_DEFAULT, "Extension is processing item: %@ action: %@", (uint8_t *)&v11, 0x16u);
  }

  if (v9)
    v9[2](v9, 0);

}

- (void)followUpPerformUpdateWithCompletionHandler:(id)a3
{
  (*((void (**)(id, _QWORD))a3 + 2))(a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
}

void __42__FLExtensionViewController_hostInterface__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0(&dword_21641D000, a2, a3, "Host experienced a failure: %@", a5, a6, a7, a8, 2u);
  OUTLINED_FUNCTION_1();
}

@end

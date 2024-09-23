@implementation FLFollowUpActionHandler

- (id)_extensionLoader
{
  FLViewExtensionLoader *extensionLoader;
  FLViewExtensionLoader *v4;
  void *v5;
  FLViewExtensionLoader *v6;
  FLViewExtensionLoader *v7;
  FLViewExtensionLoader *v8;
  _QWORD v10[4];
  id v11;
  id location;

  extensionLoader = self->_extensionLoader;
  if (!extensionLoader)
  {
    v4 = [FLViewExtensionLoader alloc];
    -[FLHeadlessActionHandler item](self, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = -[FLHeadlessExtensionLoader initWithFollowUp:andDelegate:](v4, "initWithFollowUp:andDelegate:", v5, self);
    v7 = self->_extensionLoader;
    self->_extensionLoader = v6;

    objc_initWeak(&location, self);
    v8 = self->_extensionLoader;
    v10[0] = MEMORY[0x24BDAC760];
    v10[1] = 3221225472;
    v10[2] = __43__FLFollowUpActionHandler__extensionLoader__block_invoke;
    v10[3] = &unk_24D55CCC8;
    objc_copyWeak(&v11, &location);
    -[FLHeadlessExtensionLoader setRequestInterruptionBlock:](v8, "setRequestInterruptionBlock:", v10);
    objc_destroyWeak(&v11);
    objc_destroyWeak(&location);
    extensionLoader = self->_extensionLoader;
  }
  return extensionLoader;
}

void __43__FLFollowUpActionHandler__extensionLoader__block_invoke(uint64_t a1)
{
  void *v1;
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    FLError();
    v1 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(WeakRetained, "extensionDidFinishWithError:", v1);

  }
}

- (void)handleExtensionBasedAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  _QWORD v8[4];
  id v9;

  v6 = a4;
  v8[0] = MEMORY[0x24BDAC760];
  v8[1] = 3221225472;
  v8[2] = __65__FLFollowUpActionHandler_handleExtensionBasedAction_completion___block_invoke;
  v8[3] = &unk_24D55CCF0;
  v9 = v6;
  v7 = v6;
  -[FLFollowUpActionHandler handleExtensionBasedAction:completionWithUserInfo:](self, "handleExtensionBasedAction:completionWithUserInfo:", a3, v8);

}

uint64_t __65__FLFollowUpActionHandler_handleExtensionBasedAction_completion___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(uint64_t, uint64_t, uint64_t))(result + 16))(result, a2, a4);
  return result;
}

- (void)handleExtensionBasedAction:(id)a3 completionWithUserInfo:(id)a4
{
  id v6;
  id v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  NSObject *v11;
  uint64_t v12;
  id v13;
  void *v14;
  id completionHandler;
  NSObject *v16;
  void *v17;
  NSObject *v18;
  id v19;
  _QWORD block[5];
  id v21;
  _QWORD v22[4];
  id v23;
  uint64_t v24;
  uint64_t v25;
  uint8_t buf[4];
  void *v27;
  uint64_t v28;

  v28 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v8 = _FLSignpostCreate();
  v10 = v9;
  _FLSignpostLogSystem();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    -[FLFollowUpActionHandler handleExtensionBasedAction:completionWithUserInfo:].cold.1(v8, v11);

  v12 = MEMORY[0x24BDAC760];
  v22[0] = MEMORY[0x24BDAC760];
  v22[1] = 3221225472;
  v22[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke;
  v22[3] = &unk_24D55CD18;
  v24 = v8;
  v25 = v10;
  v13 = v7;
  v23 = v13;
  v14 = (void *)MEMORY[0x2199F81EC](v22);
  completionHandler = self->_completionHandler;
  self->_completionHandler = v14;

  _FLLogSystem();
  v16 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    -[FLHeadlessActionHandler item](self, "item");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v27 = v17;
    _os_log_impl(&dword_21641D000, v16, OS_LOG_TYPE_DEFAULT, "Starting to load extension for follow up: %@", buf, 0xCu);

  }
  objc_msgSend(MEMORY[0x24BE1B3C8], "sharedExtensionQueue");
  v18 = objc_claimAutoreleasedReturnValue();
  block[0] = v12;
  block[1] = 3221225472;
  block[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_3;
  block[3] = &unk_24D55CCA0;
  block[4] = self;
  v21 = v6;
  v19 = v6;
  dispatch_async(v18, block);

}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  id v7;
  id v8;
  unint64_t Nanoseconds;
  NSObject *v10;
  uint64_t v11;

  v7 = a3;
  v8 = a4;
  Nanoseconds = _FLSignpostGetNanoseconds();
  _FLSignpostLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_cold_1(Nanoseconds, (uint64_t *)(a1 + 40), v10);

  v11 = *(_QWORD *)(a1 + 32);
  if (v11)
    (*(void (**)(uint64_t, uint64_t, id, id))(v11 + 16))(v11, a2, v7, v8);

}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_3(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  uint64_t v6;
  _QWORD v7[5];

  objc_msgSend(*(id *)(a1 + 32), "_extensionLoader");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "remoteInterface");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  v4 = *(void **)(a1 + 32);
  if (v3)
  {
    objc_msgSend(v4, "item");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7[0] = MEMORY[0x24BDAC760];
    v7[1] = 3221225472;
    v7[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_2;
    v7[3] = &unk_24D55CD40;
    v6 = *(_QWORD *)(a1 + 40);
    v7[4] = *(_QWORD *)(a1 + 32);
    objc_msgSend(v3, "processFollowUpItem:selectedAction:completion:", v5, v6, v7);

  }
  else
  {
    objc_msgSend(v4, "extensionDidFinish");
  }

}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  void *v9;
  _QWORD block[5];
  uint8_t buf[4];
  void *v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v12 = v5;
    _os_log_impl(&dword_21641D000, v4, OS_LOG_TYPE_DEFAULT, "Extension processed follow up: %@", buf, 0xCu);

  }
  if ((a2 & 1) != 0)
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionDidFinish");
  }
  else
  {
    _FLLogSystem();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21641D000, v6, OS_LOG_TYPE_DEFAULT, "Extension did not handle this event silently, trying to fetch remote UI", buf, 2u);
    }

    objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 16), "remoteViewController");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = *(_QWORD *)(a1 + 32);
    v9 = *(void **)(v8 + 24);
    *(_QWORD *)(v8 + 24) = v7;

    block[0] = MEMORY[0x24BDAC760];
    block[1] = 3221225472;
    block[2] = __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_5;
    block[3] = &unk_24D55CAC8;
    block[4] = *(_QWORD *)(a1 + 32);
    dispatch_async(MEMORY[0x24BDAC9B8], block);
  }
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_5(uint64_t a1)
{
  void *v2;
  void (**v3)(id, _QWORD);

  objc_msgSend(*(id *)(a1 + 32), "extensionRequestedViewControllerPresentation");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    objc_msgSend(*(id *)(a1 + 32), "extensionRequestedViewControllerPresentation");
    v3 = (void (**)(id, _QWORD))objc_claimAutoreleasedReturnValue();
    v3[2](v3, *(_QWORD *)(*(_QWORD *)(a1 + 32) + 24));

  }
}

- (void)extensionDidFinishWithUserInfo:(id)a3 completionHandler:(id)a4
{
  -[FLFollowUpActionHandler extensionDidFinishWithError:userInfo:completionHandler:](self, "extensionDidFinishWithError:userInfo:completionHandler:", 0, a3, a4);
}

- (void)extensionDidFinish
{
  -[FLFollowUpActionHandler extensionDidFinishWithError:](self, "extensionDidFinishWithError:", 0);
}

- (void)extensionDidFinishWithError:(id)a3
{
  -[FLFollowUpActionHandler extensionDidFinishWithError:userInfo:completionHandler:](self, "extensionDidFinishWithError:userInfo:completionHandler:", 0, 0, 0);
}

- (void)extensionDidFinishWithError:(id)a3 userInfo:(id)a4 completionHandler:(id)a5
{
  id v8;
  id v9;
  id v10;
  uint64_t v11;
  id v12;
  id v13;
  id v14;
  id v15;
  _QWORD v16[5];
  id v17;
  _QWORD v18[5];
  id v19;
  id v20;
  id v21;

  v8 = a3;
  v9 = a4;
  v10 = a5;
  v11 = MEMORY[0x24BDAC760];
  v18[0] = MEMORY[0x24BDAC760];
  v18[1] = 3221225472;
  v18[2] = __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke;
  v18[3] = &unk_24D55CD68;
  v18[4] = self;
  v19 = v8;
  v20 = v9;
  v21 = v10;
  v12 = v10;
  v13 = v9;
  v14 = v8;
  v16[0] = v11;
  v16[1] = 3221225472;
  v16[2] = __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_8;
  v16[3] = &unk_24D55CD90;
  v16[4] = self;
  v17 = (id)MEMORY[0x2199F81EC](v18);
  v15 = v17;
  dispatch_async(MEMORY[0x24BDAC9B8], v16);

}

uint64_t __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke(_QWORD *a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;
  NSObject *v5;
  uint64_t result;
  uint8_t v7[16];

  v2 = *(_QWORD *)(a1[4] + 32);
  if (v2)
  {
    (*(void (**)(uint64_t, BOOL, _QWORD))(v2 + 16))(v2, a1[5] == 0, a1[6]);
    v3 = a1[4];
    v4 = *(void **)(v3 + 32);
    *(_QWORD *)(v3 + 32) = 0;

  }
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)v7 = 0;
    _os_log_impl(&dword_21641D000, v5, OS_LOG_TYPE_DEFAULT, "Handler completed", v7, 2u);
  }

  result = a1[7];
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_8(uint64_t a1)
{
  void *v2;
  NSObject *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  uint8_t buf[16];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2)
  {
    _FLLogSystem();
    v3 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_21641D000, v3, OS_LOG_TYPE_DEFAULT, "Dismissing remote view contrller", buf, 2u);
    }

    v4 = *(void **)(a1 + 40);
    v5 = *(void **)(*(_QWORD *)(a1 + 32) + 24);
    v6[0] = MEMORY[0x24BDAC760];
    v6[1] = 3221225472;
    v6[2] = __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_9;
    v6[3] = &unk_24D55CAF0;
    v7 = v4;
    objc_msgSend(v5, "dismissViewControllerAnimated:completion:", 1, v6);

  }
  else
  {
    (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
  }
}

uint64_t __82__FLFollowUpActionHandler_extensionDidFinishWithError_userInfo_completionHandler___block_invoke_9(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (NSString)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FLFollowUpActionHandler *v6;
  uint64_t v7;

  v7 = *MEMORY[0x24BDAC8D0];
  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v6 = self;
    _os_log_impl(&dword_21641D000, v3, OS_LOG_TYPE_DEFAULT, "%@ going away", buf, 0xCu);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLFollowUpActionHandler;
  -[FLHeadlessActionHandler dealloc](&v4, sel_dealloc);
}

- (id)extensionRequestedViewControllerPresentation
{
  return self->_extensionRequestedViewControllerPresentation;
}

- (void)setExtensionRequestedViewControllerPresentation:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 40);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_extensionRequestedViewControllerPresentation, 0);
  objc_storeStrong(&self->_completionHandler, 0);
  objc_storeStrong((id *)&self->_remoteViewController, 0);
  objc_storeStrong((id *)&self->_extensionLoader, 0);
}

- (void)handleExtensionBasedAction:(uint64_t)a1 completionWithUserInfo:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 134217984;
  v3 = a1;
  _os_log_debug_impl(&dword_21641D000, a2, OS_LOG_TYPE_DEBUG, "BEGIN [%llu]: Extension Processing", (uint8_t *)&v2, 0xCu);
}

void __77__FLFollowUpActionHandler_handleExtensionBasedAction_completionWithUserInfo___block_invoke_cold_1(unint64_t a1, uint64_t *a2, os_log_t log)
{
  uint64_t v3;
  int v4;
  uint64_t v5;
  __int16 v6;
  double v7;
  uint64_t v8;

  v8 = *MEMORY[0x24BDAC8D0];
  v3 = *a2;
  v4 = 134218240;
  v5 = v3;
  v6 = 2048;
  v7 = (double)a1 / 1000000000.0;
  _os_log_debug_impl(&dword_21641D000, log, OS_LOG_TYPE_DEBUG, "END [%llu] %fs: Extension Processing", (uint8_t *)&v4, 0x16u);
}

@end

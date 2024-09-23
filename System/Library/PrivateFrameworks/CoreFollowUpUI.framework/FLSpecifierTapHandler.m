@implementation FLSpecifierTapHandler

- (void)actionTapped:(id)a3 eventSource:(unint64_t)a4 withCompletionHandler:(id)a5
{
  id v8;
  id v9;
  NSObject *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  int v15;
  _QWORD v16[5];
  id v17;
  id v18;
  id v19;
  unint64_t v20;
  uint8_t buf[4];
  id v22;
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v22 = v8;
    _os_log_impl(&dword_21641D000, v10, OS_LOG_TYPE_DEFAULT, "Handling specifier %@", buf, 0xCu);
  }

  objc_msgSend(v8, "fl_startSpinner");
  objc_msgSend(v8, "propertyForKey:", *MEMORY[0x24BE1B2C8]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BE1B3D8], "sharedTelemetryController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "captureActionForItem:withEvent:source:", v11, 2, 4);

  -[FLSpecifierTapHandler delegate](self, "delegate");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) != 0
    && (objc_msgSend(v11, "groupIdentifier"),
        v14 = (void *)objc_claimAutoreleasedReturnValue(),
        v15 = objc_msgSend(v14, "isEqualToString:", *MEMORY[0x24BE1B2D8]),
        v14,
        v15))
  {
    v16[0] = MEMORY[0x24BDAC760];
    v16[1] = 3221225472;
    v16[2] = __72__FLSpecifierTapHandler_actionTapped_eventSource_withCompletionHandler___block_invoke;
    v16[3] = &unk_24D55CDE0;
    v16[4] = self;
    v17 = v11;
    v18 = v8;
    v20 = a4;
    v19 = v9;
    objc_msgSend(v13, "preflightNetworkConnectivityForHandler:withCompletionHandler:", self, v16);

  }
  else
  {
    -[FLSpecifierTapHandler _handleActionForItem:fromSpecifier:eventSource:withCompletionHandler:](self, "_handleActionForItem:fromSpecifier:eventSource:withCompletionHandler:", v11, v8, a4, v9);
  }

}

void __72__FLSpecifierTapHandler_actionTapped_eventSource_withCompletionHandler___block_invoke(uint64_t a1, int a2, void *a3)
{
  id v5;

  v5 = a3;
  if (a2)
  {
    objc_msgSend(*(id *)(a1 + 32), "_handleActionForItem:fromSpecifier:eventSource:withCompletionHandler:", *(_QWORD *)(a1 + 40), *(_QWORD *)(a1 + 48), *(_QWORD *)(a1 + 64), *(_QWORD *)(a1 + 56));
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 48), "fl_stopSpinner");
    (*(void (**)(void))(*(_QWORD *)(a1 + 56) + 16))();
  }

}

- (void)_handleActionForItem:(id)a3 fromSpecifier:(id)a4 eventSource:(unint64_t)a5 withCompletionHandler:(id)a6
{
  id v10;
  id v11;
  id v12;
  NSObject *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  void *v17;
  void *v18;
  id v19;
  id v20;
  _QWORD v21[4];
  id v22;
  id v23;
  uint64_t *v24;
  _QWORD v25[4];
  id v26;
  uint64_t v27;
  uint64_t *v28;
  uint64_t v29;
  uint64_t (*v30)(uint64_t, uint64_t);
  void (*v31)(uint64_t);
  id v32;
  uint8_t buf[4];
  uint64_t v34;
  uint64_t v35;

  v35 = *MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a4;
  v12 = a6;
  v27 = 0;
  v28 = &v27;
  v29 = 0x3032000000;
  v30 = __Block_byref_object_copy__1;
  v31 = __Block_byref_object_dispose__1;
  +[FLHeadlessActionHandler handlerWithItem:](FLFollowUpActionHandler, "handlerWithItem:", v10);
  v32 = (id)objc_claimAutoreleasedReturnValue();
  _FLLogSystem();
  v13 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    v14 = v28[5];
    *(_DWORD *)buf = 138412290;
    v34 = v14;
    _os_log_impl(&dword_21641D000, v13, OS_LOG_TYPE_DEFAULT, "Handling item with handler: %@", buf, 0xCu);
  }

  objc_initWeak((id *)buf, self);
  v15 = (void *)v28[5];
  v16 = MEMORY[0x24BDAC760];
  v25[0] = MEMORY[0x24BDAC760];
  v25[1] = 3221225472;
  v25[2] = __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke;
  v25[3] = &unk_24D55CE08;
  objc_copyWeak(&v26, (id *)buf);
  objc_msgSend(v15, "setExtensionRequestedViewControllerPresentation:", v25);
  objc_msgSend(v11, "propertyForKey:", *MEMORY[0x24BE1B2C0]);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setEventSource:", a5);
  v18 = (void *)v28[5];
  v21[0] = v16;
  v21[1] = 3221225472;
  v21[2] = __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_4;
  v21[3] = &unk_24D55CE30;
  v19 = v11;
  v22 = v19;
  v24 = &v27;
  v20 = v12;
  v23 = v20;
  objc_msgSend(v18, "handleAction:completion:", v17, v21);

  objc_destroyWeak(&v26);
  objc_destroyWeak((id *)buf);
  _Block_object_dispose(&v27, 8);

}

void __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke(uint64_t a1, void *a2)
{
  id v3;
  id WeakRetained;
  void *v5;
  uint64_t v6;
  NSObject *v7;
  void *v8;

  v3 = a2;
  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = objc_msgSend(v5, "userInterfaceIdiom");

    if (v6 == 1)
    {
      _FLLogSystem();
      v7 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_cold_1(v7);

      objc_msgSend(v3, "setModalPresentationStyle:", 5);
    }
    objc_msgSend(WeakRetained, "delegate");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "startPresentingForHandler:withRemoteController:", WeakRetained, v3);

  }
}

void __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_4(_QWORD *a1, uint64_t a2, void *a3)
{
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  v4 = (void *)a1[4];
  v7 = a3;
  objc_msgSend(v4, "fl_stopSpinner");
  v5 = *(_QWORD *)(a1[6] + 8);
  v6 = *(void **)(v5 + 40);
  *(_QWORD *)(v5 + 40) = 0;

  (*(void (**)(void))(a1[5] + 16))();
}

- (id)description
{
  void *v3;
  void *v4;
  void *v5;

  v3 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend((id)objc_opt_class(), "description");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@: %p>"), v4, self);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[4];
  FLSpecifierTapHandler *v6;
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
  v4.super_class = (Class)FLSpecifierTapHandler;
  -[FLSpecifierTapHandler dealloc](&v4, sel_dealloc);
}

- (FLSpecifierTapHandlerDelegate)delegate
{
  return (FLSpecifierTapHandlerDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
}

void __94__FLSpecifierTapHandler__handleActionForItem_fromSpecifier_eventSource_withCompletionHandler___block_invoke_cold_1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_debug_impl(&dword_21641D000, log, OS_LOG_TYPE_DEBUG, "Overriding presentation for iPad.", v1, 2u);
}

@end

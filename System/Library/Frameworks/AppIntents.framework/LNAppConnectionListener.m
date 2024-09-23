@implementation LNAppConnectionListener

void __41__LNAppConnectionListener_sharedListener__block_invoke()
{
  LNAppConnectionListener *v0;
  uint64_t v1;
  void *v2;
  id v3;

  v0 = [LNAppConnectionListener alloc];
  objc_msgSend(MEMORY[0x24BDD1998], "anonymousListener");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  v1 = -[LNConnectionListener initWithListener:](v0, "initWithListener:", v3);
  v2 = (void *)sharedListener_value;
  sharedListener_value = v1;

}

+ (id)sharedListener
{
  if (sharedListener_onceToken[0] != -1)
    dispatch_once(sharedListener_onceToken, &__block_literal_global);
  return (id)sharedListener_value;
}

- (void)handleAction:(id)a3 completionHandler:(id)a4
{
  id v6;
  id v7;
  void *v8;
  uint64_t v9;
  id v10;
  NSObject *v11;
  id v12;
  id v13;
  void (**v14)(_QWORD);
  id v15;
  void *v16;
  void *v17;
  id v18;
  _QWORD aBlock[5];
  id v20;
  id v21;
  uint64_t v22;
  uint64_t *v23;
  uint64_t v24;
  uint64_t v25;
  __int128 buf;
  void (*v27)(uint64_t);
  void *v28;
  uint64_t *v29;
  uint64_t v30;

  v30 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v7 = a4;
  v22 = 0;
  v23 = &v22;
  v24 = 0x2050000000;
  v8 = (void *)getUILinkConnectionActionClass_softClass;
  v25 = getUILinkConnectionActionClass_softClass;
  v9 = MEMORY[0x24BDAC760];
  if (!getUILinkConnectionActionClass_softClass)
  {
    *(_QWORD *)&buf = MEMORY[0x24BDAC760];
    *((_QWORD *)&buf + 1) = 3221225472;
    v27 = __getUILinkConnectionActionClass_block_invoke;
    v28 = &unk_24F0CB408;
    v29 = &v22;
    __getUILinkConnectionActionClass_block_invoke((uint64_t)&buf);
    v8 = (void *)v23[3];
  }
  v10 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v22, 8);
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_msgSend(MEMORY[0x24BDBCE88], "exceptionWithName:reason:userInfo:", *MEMORY[0x24BDBCAB0], CFSTR("This method can only handle UILinkConnectionAction objects"), 0);
    v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v18);
  }
  getLNLogCategoryConnection();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138543362;
    *(_QWORD *)((char *)&buf + 4) = v6;
    _os_log_impl(&dword_227EAE000, v11, OS_LOG_TYPE_INFO, "Received UILinkConnectionAction: %{public}@)", (uint8_t *)&buf, 0xCu);
  }

  objc_msgSend(v6, "action");
  aBlock[0] = v9;
  aBlock[1] = 3221225472;
  aBlock[2] = __58__LNAppConnectionListener_handleAction_completionHandler___block_invoke;
  aBlock[3] = &unk_24F0CB368;
  aBlock[4] = self;
  v12 = (id)objc_claimAutoreleasedReturnValue();
  v20 = v12;
  v13 = v7;
  v21 = v13;
  v14 = (void (**)(_QWORD))_Block_copy(aBlock);
  v15 = v12;
  if (v15 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    objc_msgSend(v15, "action");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "executorOptions");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[LNAppConnectionListener performOneShotAction:executorOptions:completionHandler:](self, "performOneShotAction:executorOptions:completionHandler:", v16, v17, v14);

  }
  else
  {

    v14[2](v14);
  }

}

- (NSXPCListenerEndpoint)listenerEndpoint
{
  void *v2;
  void *v3;

  -[LNConnectionListener xpcListener](self, "xpcListener");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "endpoint");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSXPCListenerEndpoint *)v3;
}

- (void)performOneShotAction:(id)a3 executorOptions:(id)a4 completionHandler:(id)a5
{
  id v9;
  id v10;
  id v11;
  LNOneShotActionExecutor *v12;
  void *v13;
  LNOneShotActionExecutor *v14;
  id v15;
  LNOneShotActionExecutor *v16;
  void *v17;
  void *v18;
  void *v19;
  _QWORD v20[4];
  LNOneShotActionExecutor *v21;
  id v22;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  if (v9)
  {
    if (v10)
      goto LABEL_3;
LABEL_6:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppConnectionListener.m"), 79, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("executorOptions"));

    if (v11)
      goto LABEL_4;
LABEL_7:
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppConnectionListener.m"), 80, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("completionHandler"));

    goto LABEL_4;
  }
  objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("LNAppConnectionListener.m"), 78, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("action"));

  if (!v10)
    goto LABEL_6;
LABEL_3:
  if (!v11)
    goto LABEL_7;
LABEL_4:
  v12 = [LNOneShotActionExecutor alloc];
  -[LNConnectionListener appContext](self, "appContext");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = -[LNOneShotActionExecutor initWithAction:executorOptions:appContext:](v12, "initWithAction:executorOptions:appContext:", v9, v10, v13);

  v20[0] = MEMORY[0x24BDAC760];
  v20[1] = 3221225472;
  v20[2] = __82__LNAppConnectionListener_performOneShotAction_executorOptions_completionHandler___block_invoke;
  v20[3] = &unk_24F0CB318;
  v21 = v14;
  v22 = v11;
  v15 = v11;
  v16 = v14;
  -[LNOneShotActionExecutor performWithCompletionHandler:](v16, "performWithCompletionHandler:", v20);

}

uint64_t __82__LNAppConnectionListener_performOneShotAction_executorOptions_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

void __58__LNAppConnectionListener_handleAction_completionHandler___block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_class *v9;
  void *v10;
  NSObject *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  _OWORD v16[2];
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  _BYTE buf[24];
  void *v22;
  uint64_t *v23;
  uint64_t v24;

  v24 = *MEMORY[0x24BDAC8D0];
  v2 = objc_alloc(MEMORY[0x24BE60050]);
  objc_msgSend(*(id *)(a1 + 32), "xpcListener");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "endpoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x24BDD1760], "processInfo");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5)
    objc_msgSend(v5, "if_auditToken");
  else
    memset(v16, 0, sizeof(v16));
  v7 = (void *)objc_msgSend(v2, "initWithXPCListenerEndpoint:auditToken:", v4, v16);

  v17 = 0;
  v18 = &v17;
  v19 = 0x2050000000;
  v8 = (void *)getUILinkConnectionActionResponseClass_softClass;
  v20 = getUILinkConnectionActionResponseClass_softClass;
  if (!getUILinkConnectionActionResponseClass_softClass)
  {
    *(_QWORD *)buf = MEMORY[0x24BDAC760];
    *(_QWORD *)&buf[8] = 3221225472;
    *(_QWORD *)&buf[16] = __getUILinkConnectionActionResponseClass_block_invoke;
    v22 = &unk_24F0CB408;
    v23 = &v17;
    __getUILinkConnectionActionResponseClass_block_invoke((uint64_t)buf);
    v8 = (void *)v18[3];
  }
  v9 = objc_retainAutorelease(v8);
  _Block_object_dispose(&v17, 8);
  v10 = (void *)objc_msgSend([v9 alloc], "initWithActionResponse:", v7);
  getLNLogCategoryConnection();
  v11 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    v12 = *(_QWORD *)(a1 + 40);
    *(_DWORD *)buf = 138543618;
    *(_QWORD *)&buf[4] = v10;
    *(_WORD *)&buf[12] = 2114;
    *(_QWORD *)&buf[14] = v12;
    _os_log_impl(&dword_227EAE000, v11, OS_LOG_TYPE_INFO, "Sending UILinkConnectionActionResponse: %{public}@ for %{public}@", buf, 0x16u);
  }

  (*(void (**)(_QWORD, void *, uint64_t, uint64_t, uint64_t))(*(_QWORD *)(a1 + 48) + 16))(*(_QWORD *)(a1 + 48), v10, v13, v14, v15);
}

@end

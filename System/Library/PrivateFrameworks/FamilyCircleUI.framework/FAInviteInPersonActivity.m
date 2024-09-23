@implementation FAInviteInPersonActivity

- (FAInviteInPersonActivity)init
{
  FAInviteInPersonActivity *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)FAInviteInPersonActivity;
  v2 = -[UIActivity init](&v5, sel_init);
  if (v2)
  {
    objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "addObserver:selector:name:object:", v2, sel__handleRUIDismiss_, *MEMORY[0x24BE30918], 0);

  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  objc_msgSend(MEMORY[0x24BDD1530], "defaultCenter");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObserver:", self);

  v4.receiver = self;
  v4.super_class = (Class)FAInviteInPersonActivity;
  -[FAInviteInPersonActivity dealloc](&v4, sel_dealloc);
}

- (id)activityType
{
  return CFSTR("FAInviteInPersonActivity");
}

- (id)activityTitle
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDD1488], "bundleForClass:", objc_opt_class());
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "localizedStringForKey:value:table:", CFSTR("INVITE_IN_PERSON"), &stru_24C8A3000, CFSTR("Localizable"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (BOOL)canPerformWithActivityItems:(id)a3
{
  return 1;
}

- (id)activityImage
{
  return (id)objc_msgSend(MEMORY[0x24BEBD640], "systemImageNamed:", CFSTR("person.crop.circle.badge.plus"));
}

- (int64_t)activityCategory
{
  return 0;
}

- (void)performActivity
{
  FACircleContext *v3;
  void *v4;
  void *v5;
  _QWORD v6[6];
  uint64_t v7;
  uint64_t *v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, uint64_t);
  void (*v11)(uint64_t);
  FACircleStateController *v12;

  v3 = -[FACircleContext initWithEventType:]([FACircleContext alloc], "initWithEventType:", CFSTR("FACircleEventTypeAddMemberInline"));
  v7 = 0;
  v8 = &v7;
  v9 = 0x3032000000;
  v10 = __Block_byref_object_copy__5;
  v11 = __Block_byref_object_dispose__5;
  v12 = objc_alloc_init(FACircleStateController);
  objc_msgSend((id)v8[5], "setPresentationType:", 1);
  -[FAInviteInPersonActivity presentingViewController](self, "presentingViewController");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend((id)v8[5], "setPresenter:", v4);

  v5 = (void *)v8[5];
  v6[0] = MEMORY[0x24BDAC760];
  v6[1] = 3221225472;
  v6[2] = __43__FAInviteInPersonActivity_performActivity__block_invoke;
  v6[3] = &unk_24C88D430;
  v6[4] = self;
  v6[5] = &v7;
  objc_msgSend(v5, "performWithContext:completion:", v3, v6);
  _Block_object_dispose(&v7, 8);

}

void __43__FAInviteInPersonActivity_performActivity__block_invoke(uint64_t a1, void *a2)
{
  id v3;
  uint64_t v4;
  void *v5;
  NSObject *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  void *v16;
  uint64_t v17;
  void *v18;
  uint64_t v19;
  void *v20;

  v3 = a2;
  v4 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
  v5 = *(void **)(v4 + 40);
  *(_QWORD *)(v4 + 40) = 0;

  _FALogSystem();
  v6 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    __43__FAInviteInPersonActivity_performActivity__block_invoke_cold_1((uint64_t)v3, v6, v7, v8, v9, v10, v11, v12);

  objc_msgSend(v3, "userInfo");
  v13 = objc_claimAutoreleasedReturnValue();
  v14 = *(_QWORD *)(a1 + 32);
  v15 = *(void **)(v14 + 128);
  *(_QWORD *)(v14 + 128) = v13;

  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v17 = objc_msgSend(v16, "userInterfaceIdiom");

  if (v17 != 1)
  {
    v18 = *(void **)(a1 + 32);
    v19 = objc_msgSend(v3, "success");
    objc_msgSend(v3, "userInfo");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "_notifyCompletionWithSuccess:userInfo:", v19, v20);

  }
}

- (void)_notifyCompletionWithSuccess:(BOOL)a3 userInfo:(id)a4
{
  id v6;
  id v7;
  _QWORD block[5];
  id v9;
  BOOL v10;

  v6 = a4;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __66__FAInviteInPersonActivity__notifyCompletionWithSuccess_userInfo___block_invoke;
  block[3] = &unk_24C88D3C0;
  block[4] = self;
  v9 = v6;
  v10 = a3;
  v7 = v6;
  dispatch_async(MEMORY[0x24BDAC9B8], block);

}

uint64_t __66__FAInviteInPersonActivity__notifyCompletionWithSuccess_userInfo___block_invoke(uint64_t a1)
{
  objc_storeStrong((id *)(*(_QWORD *)(a1 + 32) + 128), *(id *)(a1 + 40));
  return objc_msgSend(*(id *)(a1 + 32), "activityDidFinish:", *(unsigned __int8 *)(a1 + 48));
}

- (void)_handleRUIDismiss:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  NSObject *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  void *v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x24BEBD538], "currentDevice");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "userInterfaceIdiom");

  if (v6 == 1)
  {
    objc_msgSend(v4, "userInfo");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "objectForKeyedSubscript:", CFSTR("success"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (objc_msgSend(v8, "length"))
    {
      _FALogSystem();
      v9 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        -[FAInviteInPersonActivity _handleRUIDismiss:].cold.1((uint64_t)v8, v9, v10, v11, v12, v13, v14, v15);

      v16 = objc_msgSend(v8, "BOOLValue");
      objc_msgSend(v4, "userInfo");
      v17 = (void *)objc_claimAutoreleasedReturnValue();
      -[FAInviteInPersonActivity _notifyCompletionWithSuccess:userInfo:](self, "_notifyCompletionWithSuccess:userInfo:", v16, v17);

    }
  }

}

- (UIViewController)presentingViewController
{
  return (UIViewController *)objc_loadWeakRetained((id *)&self->_presentingViewController);
}

- (void)setPresentingViewController:(id)a3
{
  objc_storeWeak((id *)&self->_presentingViewController, a3);
}

- (NSDictionary)response
{
  return self->_response;
}

- (void)setResponse:(id)a3
{
  objc_storeStrong((id *)&self->_response, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_response, 0);
  objc_destroyWeak((id *)&self->_presentingViewController);
}

void __43__FAInviteInPersonActivity_performActivity__block_invoke_cold_1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20DE41000, a2, a3, "Finished FAInviteInPersonActivity %@", a5, a6, a7, a8, 2u);
}

- (void)_handleRUIDismiss:(uint64_t)a3 .cold.1(uint64_t a1, NSObject *a2, uint64_t a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, uint64_t a8)
{
  OUTLINED_FUNCTION_0_3(&dword_20DE41000, a2, a3, "Server indicated success: %@", a5, a6, a7, a8, 2u);
}

@end

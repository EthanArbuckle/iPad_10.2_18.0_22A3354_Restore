@implementation FLHeadlessActionHandler

- (FLHeadlessActionHandler)initWithItem:(id)a3
{
  id v5;
  FLHeadlessActionHandler *v6;
  FLHeadlessActionHandler *v7;

  v5 = a3;
  v6 = -[FLHeadlessActionHandler init](self, "init");
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_item, a3);

  return v7;
}

+ (id)handlerWithItem:(id)a3
{
  id v4;
  void *v5;

  v4 = a3;
  v5 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithItem:", v4);

  return v5;
}

- (void)handleAction:(id)a3 completion:(id)a4
{
  id v6;
  void (**v7)(id, uint64_t, _QWORD);
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  int v12;
  NSObject *v13;
  void *v14;
  void *v15;
  void *v16;
  os_activity_scope_state_s v17;
  uint8_t buf[4];
  id v19;
  __int16 v20;
  void *v21;
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = (void (**)(id, uint64_t, _QWORD))a4;
  v8 = _os_activity_create(&dword_1B8D53000, "followup/handling-action", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  v17.opaque[0] = 0;
  v17.opaque[1] = 0;
  os_activity_scope_enter(v8, &v17);
  -[FLHeadlessActionHandler item](self, "item");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "extensionIdentifier");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    +[FLEnvironment currentEnvironment](FLEnvironment, "currentEnvironment");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v12 = objc_msgSend(v11, "followUpExtensionSupportEnabled");

    if (v12)
    {
      -[FLHeadlessActionHandler handleExtensionBasedAction:completion:](self, "handleExtensionBasedAction:completion:", v6, v7);
      goto LABEL_10;
    }
  }
  else
  {

  }
  if ((objc_msgSend(v6, "_loadActionURL") & 1) != 0)
  {
    v7[2](v7, 1, 0);
  }
  else
  {
    _FLLogSystem();
    v13 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      -[FLHeadlessActionHandler item](self, "item");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "uniqueIdentifier");
      v16 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v19 = v6;
      v20 = 2112;
      v21 = v16;
      _os_log_error_impl(&dword_1B8D53000, v13, OS_LOG_TYPE_ERROR, "Action could not be handled for %@ - %@", buf, 0x16u);

    }
    FLError(1666);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    ((void (**)(id, uint64_t, void *))v7)[2](v7, 0, v14);

  }
LABEL_10:
  os_activity_scope_leave(&v17);

}

- (void)handleExtensionBasedAction:(id)a3 completion:(id)a4
{
  id v6;
  id v7;
  NSObject *v8;
  NSObject *v9;
  void *v10;
  NSObject *v11;
  id v12;
  id v13;
  _QWORD block[5];
  id v15;
  id v16;
  os_activity_scope_state_s state;
  uint8_t buf[4];
  void *v19;
  uint64_t v20;

  v20 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  v8 = _os_activity_create(&dword_1B8D53000, "followup/silent-handling-action", MEMORY[0x1E0C80FC8], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v8, &state);
  _FLLogSystem();
  v9 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    -[FLHeadlessActionHandler item](self, "item");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412290;
    v19 = v10;
    _os_log_impl(&dword_1B8D53000, v9, OS_LOG_TYPE_DEFAULT, "Starting to load extension for follow up: %@", buf, 0xCu);

  }
  +[FLHeadlessExtensionLoader sharedExtensionQueue](FLHeadlessExtensionLoader, "sharedExtensionQueue");
  v11 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke;
  block[3] = &unk_1E6F1E628;
  block[4] = self;
  v15 = v6;
  v16 = v7;
  v12 = v7;
  v13 = v6;
  dispatch_async(v11, block);

  os_activity_scope_leave(&state);
}

void __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke(uint64_t a1)
{
  FLHeadlessExtensionLoader *v2;
  void *v3;
  void *v4;
  FLHeadlessExtensionLoader *v5;
  void *v6;
  NSObject *v7;
  void *v8;
  uint64_t v9;
  void *v10;
  uint64_t v11;
  _QWORD v12[4];
  FLHeadlessExtensionLoader *v13;
  id v14;
  uint8_t buf[16];

  v2 = [FLHeadlessExtensionLoader alloc];
  objc_msgSend(*(id *)(a1 + 32), "item");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "extensionIdentifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = -[FLHeadlessExtensionLoader initWithIdentifier:](v2, "initWithIdentifier:", v4);

  -[FLHeadlessExtensionLoader remoteInterface](v5, "remoteInterface");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  _FLLogSystem();
  v7 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v7, OS_LOG_TYPE_DEFAULT, "Extension context loaded", buf, 2u);
  }

  if (v6)
  {
    objc_msgSend(*(id *)(a1 + 32), "item");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke_2;
    v12[3] = &unk_1E6F1E600;
    v9 = *(_QWORD *)(a1 + 40);
    v14 = *(id *)(a1 + 48);
    v13 = v5;
    objc_msgSend(v6, "processFollowUpItem:selectedAction:completion:", v8, v9, v12);

    v10 = v14;
  }
  else
  {
    v11 = *(_QWORD *)(a1 + 48);
    FLError(1660);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    (*(void (**)(uint64_t, _QWORD, void *))(v11 + 16))(v11, 0, v10);
  }

}

uint64_t __65__FLHeadlessActionHandler_handleExtensionBasedAction_completion___block_invoke_2(uint64_t a1, uint64_t a2)
{
  NSObject *v4;
  void *v5;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v4 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", a2);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = 138412290;
    v8 = v5;
    _os_log_impl(&dword_1B8D53000, v4, OS_LOG_TYPE_DEFAULT, "Headless extension processed follow up: %@", (uint8_t *)&v7, 0xCu);

  }
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
}

- (void)dealloc
{
  NSObject *v3;
  objc_super v4;
  uint8_t buf[16];

  _FLLogSystem();
  v3 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v3, OS_LOG_TYPE_DEFAULT, "Handler checking out", buf, 2u);
  }

  v4.receiver = self;
  v4.super_class = (Class)FLHeadlessActionHandler;
  -[FLHeadlessActionHandler dealloc](&v4, sel_dealloc);
}

- (FLFollowUpItem)item
{
  return self->_item;
}

- (void)setItem:(id)a3
{
  objc_storeStrong((id *)&self->_item, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_item, 0);
}

@end

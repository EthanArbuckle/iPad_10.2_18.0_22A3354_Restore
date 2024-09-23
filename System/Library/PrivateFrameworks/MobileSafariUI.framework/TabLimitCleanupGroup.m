@implementation TabLimitCleanupGroup

- (TabLimitCleanupGroup)initWithAlertMesssage:(id)a3 actionTitle:(id)a4 tabs:(id)a5 browserController:(id)a6 resultHandler:(id)a7
{
  id v12;
  id v13;
  id v14;
  id v15;
  id v16;
  TabLimitCleanupGroup *v17;
  void *v18;
  uint64_t v19;
  UIAlertAction *action;
  uint64_t v21;
  NSString *message;
  _QWORD v24[4];
  id v25;
  id v26;
  id v27;
  objc_super v28;

  v12 = a3;
  v13 = a4;
  v14 = a5;
  v15 = a6;
  v16 = a7;
  if (objc_msgSend(v14, "count"))
  {
    v28.receiver = self;
    v28.super_class = (Class)TabLimitCleanupGroup;
    v17 = -[TabLimitCleanupGroup init](&v28, sel_init);
    if (v17)
    {
      v18 = (void *)MEMORY[0x1E0DC3448];
      v24[0] = MEMORY[0x1E0C809B0];
      v24[1] = 3221225472;
      v24[2] = __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke;
      v24[3] = &unk_1E9CF9B88;
      v25 = v15;
      v26 = v14;
      v27 = v16;
      objc_msgSend(v18, "actionWithTitle:style:handler:", v13, 2, v24);
      v19 = objc_claimAutoreleasedReturnValue();
      action = v17->_action;
      v17->_action = (UIAlertAction *)v19;

      v21 = objc_msgSend(v12, "copy");
      message = v17->_message;
      v17->_message = (NSString *)v21;

      self = v17;
      v17 = self;
    }
    else
    {
      self = 0;
    }
  }
  else
  {
    v17 = 0;
  }

  return v17;
}

void __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke(uint64_t a1)
{
  void *v2;
  char v3;
  id v4;
  _QWORD v5[4];
  id v6;
  id v7;
  char v8;

  objc_msgSend(*(id *)(a1 + 32), "tabController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(*(id *)(a1 + 32), "isSuspendedOrSuspending") ^ 1;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke_2;
  v5[3] = &unk_1E9CF3550;
  v4 = v2;
  v6 = v4;
  v7 = *(id *)(a1 + 40);
  v8 = v3;
  objc_msgSend(v4, "registerUndoWithType:actions:", 2, v5);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();

}

uint64_t __95__TabLimitCleanupGroup_initWithAlertMesssage_actionTitle_tabs_browserController_resultHandler___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "closeTabs:animated:", *(_QWORD *)(a1 + 40), *(unsigned __int8 *)(a1 + 48));
}

- (UIAlertAction)action
{
  return self->_action;
}

- (NSString)message
{
  return self->_message;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_message, 0);
  objc_storeStrong((id *)&self->_action, 0);
}

@end

@implementation CSAdjunctListActionManager

- (CSAdjunctListActionManager)initWithItemDestination:(id)a3
{
  id v5;
  CSAdjunctListActionManager *v6;
  CSAdjunctListActionManager *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CSAdjunctListActionManager;
  v6 = -[CSAdjunctListActionManager init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_itemDestination, a3);

  return v7;
}

- (BOOL)handlesActionWithClass:(Class)a3
{
  return -[objc_class isSubclassOfClass:](a3, "isSubclassOfClass:", objc_opt_class());
}

- (BOOL)handleAction:(id)a3 forProvider:(id)a4
{
  id v5;
  uint64_t v6;
  id v7;
  void *v8;
  BOOL v9;
  id v10;

  v5 = a3;
  if (objc_msgSend(v5, "isValid"))
  {
    v6 = objc_opt_class();
    v7 = v5;
    if (v6)
    {
      if ((objc_opt_isKindOfClass() & 1) != 0)
        v8 = v7;
      else
        v8 = 0;
    }
    else
    {
      v8 = 0;
    }
    v10 = v8;

    if (-[CSAdjunctListActionManager _actionIsInRelevantSlot:](self, "_actionIsInRelevantSlot:", v10))
      v9 = -[CSAdjunctListActionManager _handleLockScreenContentAction:](self, "_handleLockScreenContentAction:", v10);
    else
      v9 = 0;

  }
  else
  {
    v9 = 0;
  }

  return v9;
}

- (BOOL)_actionIsInRelevantSlot:(id)a3
{
  void *v3;
  char v4;

  if (!a3)
    return 0;
  objc_msgSend(a3, "slot");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "isEqualToString:", *MEMORY[0x1E0DAB7C8]);

  return v4;
}

- (BOOL)_handleLockScreenContentAction:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  id v7;
  CSAdjunctListItem *v8;
  void *v9;
  CSAdjunctListItem *v10;
  _QWORD v12[4];
  id v13;
  id v14;
  id location;

  v4 = a3;
  v5 = v4;
  if (v4 && objc_msgSend(v4, "isValid"))
  {
    objc_initWeak(&location, self);
    objc_msgSend(v5, "identifier");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v12[0] = MEMORY[0x1E0C809B0];
    v12[1] = 3221225472;
    v12[2] = __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke;
    v12[3] = &unk_1E8E30230;
    v7 = v6;
    v13 = v7;
    objc_copyWeak(&v14, &location);
    objc_msgSend(v5, "setNullificationHandler:", v12);
    v8 = [CSAdjunctListItem alloc];
    objc_msgSend(v5, "identifier");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = -[CSAdjunctListItem initWithIdentifier:](v8, "initWithIdentifier:", v9);

    -[CSAdjunctListItem addAction:](v10, "addAction:", v5);
    -[CSItemDestination addOrUpdateItem:](self->_itemDestination, "addOrUpdateItem:", v10);

    objc_destroyWeak(&v14);
    objc_destroyWeak(&location);
  }

  return 1;
}

void __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke(uint64_t a1)
{
  NSObject *v2;
  uint64_t v3;
  _QWORD v4[4];
  id v5;
  id v6;
  uint8_t buf[4];
  uint64_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  SBLogDashBoard();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = *(_QWORD *)(a1 + 32);
    *(_DWORD *)buf = 138412290;
    v8 = v3;
    _os_log_impl(&dword_1D0337000, v2, OS_LOG_TYPE_DEFAULT, "Setting content action nullification handler with identifier: %@", buf, 0xCu);
  }

  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke_1;
  v4[3] = &unk_1E8E2E958;
  objc_copyWeak(&v6, (id *)(a1 + 40));
  v5 = *(id *)(a1 + 32);
  dispatch_async(MEMORY[0x1E0C80D38], v4);

  objc_destroyWeak(&v6);
}

void __61__CSAdjunctListActionManager__handleLockScreenContentAction___block_invoke_1(uint64_t a1)
{
  id *WeakRetained;
  id *v3;

  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
  if (WeakRetained)
  {
    v3 = WeakRetained;
    objc_msgSend(WeakRetained[1], "removeItemForIdentifier:", *(_QWORD *)(a1 + 32));
    WeakRetained = v3;
  }

}

- (CSItemDestination)itemDestination
{
  return self->_itemDestination;
}

- (void)setItemDestination:(id)a3
{
  objc_storeStrong((id *)&self->_itemDestination, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_itemDestination, 0);
}

@end

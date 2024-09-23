@implementation FLItemChangeObserver

- (void)setItemChangeHandler:(id)a3
{
  id v4;
  NSObject *v5;
  int notifyToken;
  void *v7;
  id itemChangeObserver;
  id v9;
  NSObject *v10;
  _BOOL4 v11;
  _QWORD handler[5];
  uint8_t buf[16];

  v4 = a3;
  _FLLogSystem();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1B8D53000, v5, OS_LOG_TYPE_DEFAULT, "setItemChangeHandler", buf, 2u);
  }

  notifyToken = self->_notifyToken;
  if (notifyToken)
  {
    notify_cancel(notifyToken);
    self->_notifyToken = 0;
  }
  v7 = _Block_copy(v4);
  itemChangeObserver = self->_itemChangeObserver;
  self->_itemChangeObserver = v7;

  v9 = self->_itemChangeObserver;
  _FLLogSystem();
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT);
  if (v9)
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8D53000, v10, OS_LOG_TYPE_DEFAULT, "Register ItemChangeHandler", buf, 2u);
    }

    handler[0] = MEMORY[0x1E0C809B0];
    handler[1] = 3221225472;
    handler[2] = __45__FLItemChangeObserver_setItemChangeHandler___block_invoke;
    handler[3] = &unk_1E6F1EA18;
    handler[4] = self;
    notify_register_dispatch("com.apple.corefollowup.items_changed", &self->_notifyToken, MEMORY[0x1E0C80D38], handler);
  }
  else
  {
    if (v11)
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1B8D53000, v10, OS_LOG_TYPE_DEFAULT, "Unregister ItemChangeHandler", buf, 2u);
    }

  }
}

+ (FLItemChangeObserver)observerWithChangeHandler:(id)a3
{
  id v3;
  FLItemChangeObserver *v4;

  v3 = a3;
  v4 = objc_alloc_init(FLItemChangeObserver);
  -[FLItemChangeObserver setItemChangeHandler:](v4, "setItemChangeHandler:", v3);

  return v4;
}

uint64_t __45__FLItemChangeObserver_setItemChangeHandler___block_invoke(uint64_t a1)
{
  NSObject *v2;
  void *v3;
  uint64_t v4;
  uint64_t result;
  int v6;
  void *v7;
  __int16 v8;
  uint64_t v9;
  uint64_t v10;

  v10 = *MEMORY[0x1E0C80C00];
  _FLLogSystem();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    objc_msgSend((id)objc_opt_class(), "description");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = *(_QWORD *)(a1 + 32);
    v6 = 138412546;
    v7 = v3;
    v8 = 2048;
    v9 = v4;
    _os_log_impl(&dword_1B8D53000, v2, OS_LOG_TYPE_DEFAULT, "Observer <%@ : %p> detected store changed, calling observer...", (uint8_t *)&v6, 0x16u);

  }
  result = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 16);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

- (void)timerUpdated
{
  void (**itemChangeObserver)(void);

  itemChangeObserver = (void (**)(void))self->_itemChangeObserver;
  if (itemChangeObserver)
    itemChangeObserver[2]();
}

- (void)dealloc
{
  objc_super v3;

  -[FLItemChangeObserver setItemChangeHandler:](self, "setItemChangeHandler:", 0);
  v3.receiver = self;
  v3.super_class = (Class)FLItemChangeObserver;
  -[FLItemChangeObserver dealloc](&v3, sel_dealloc);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_itemChangeObserver, 0);
}

@end

@implementation MTAppIntentsProvider

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

+ (id)sharedInstance
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __38__MTAppIntentsProvider_sharedInstance__block_invoke;
  block[3] = &__block_descriptor_40_e5_v8__0l;
  block[4] = a1;
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, block);
  return (id)sharedInstance_sharedInstance;
}

void __38__MTAppIntentsProvider_sharedInstance__block_invoke()
{
  id v0;
  void *v1;

  v0 = objc_alloc_init((Class)objc_opt_class());
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (MTAppIntentsProvider)init
{
  MTAppIntentsProvider *v2;
  void *v3;
  void *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MTAppIntentsProvider;
  v2 = -[MTAppIntentsProvider init](&v6, sel_init);
  if (v2)
  {
    +[MTAppIntentsManager sharedManager](_TtC18MobileTimerSupport19MTAppIntentsManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    -[MTAppIntentsProvider setManager:](v2, "setManager:", v3);

    -[MTAppIntentsProvider manager](v2, "manager");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "setDelegate:", v2);

  }
  return v2;
}

- (void)setManager:(id)a3
{
  objc_storeStrong((id *)&self->_manager, a3);
}

- (_TtC18MobileTimerSupport19MTAppIntentsManager)manager
{
  return self->_manager;
}

- (void)didSelectTabWithManager:(id)a3 tab:(int64_t)a4
{
  int64_t v5;
  id v6;

  if ((unint64_t)(a4 - 1) >= 3)
    v5 = 0;
  else
    v5 = a4;
  -[MTAppIntentsProvider delegate](self, "delegate", a3);
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "appIntentsProvider:didSelectTab:", self, v5);

}

- (void)didAddNewWorldClockWithNameWithManager:(id)a3 name:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MTAppIntentsProvider delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didAddNewWorldClockWithName:provider:", v5, self);

}

- (void)didRemoveWorldClockWithNameWithManager:(id)a3 name:(id)a4
{
  id v5;
  id v6;

  v5 = a4;
  -[MTAppIntentsProvider delegate](self, "delegate");
  v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "didRemoveWorldClockWithName:provider:", v5, self);

}

- (MTAppIntentsProviderDelegate)delegate
{
  return (MTAppIntentsProviderDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_manager, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

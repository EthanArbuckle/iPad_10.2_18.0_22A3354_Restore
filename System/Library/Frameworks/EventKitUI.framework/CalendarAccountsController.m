@implementation CalendarAccountsController

+ (id)sharedInstance
{
  void *v2;
  CalendarAccountsController *v3;
  void *v4;
  uint64_t v5;
  void *v6;
  id v7;

  os_unfair_lock_lock((os_unfair_lock_t)&_sharedRefreshControllerLock);
  v2 = (void *)_sharedRefreshController;
  if (!_sharedRefreshController)
  {
    v3 = [CalendarAccountsController alloc];
    objc_msgSend(MEMORY[0x1E0D0CD00], "sharedInstance");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = -[CalendarAccountsController initWithController:](v3, "initWithController:", v4);
    v6 = (void *)_sharedRefreshController;
    _sharedRefreshController = v5;

    v2 = (void *)_sharedRefreshController;
  }
  v7 = v2;
  os_unfair_lock_unlock((os_unfair_lock_t)&_sharedRefreshControllerLock);
  return v7;
}

- (CalendarAccountsController)initWithController:(id)a3
{
  id v5;
  CalendarAccountsController *v6;
  CalendarAccountsController *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)CalendarAccountsController;
  v6 = -[CalendarAccountsController init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_controller, a3);

  return v7;
}

- (int)sortOrderForSource:(id)a3
{
  return -[CUIKAccountsController sortOrderForSource:](self->_controller, "sortOrderForSource:", a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_controller, 0);
}

@end

@implementation MNNavdStateUpdater

+ (id)sharedUpdater
{
  if (qword_1ED0C40E0 != -1)
    dispatch_once(&qword_1ED0C40E0, &__block_literal_global_42);
  return (id)_MergedGlobals_44;
}

void __35__MNNavdStateUpdater_sharedUpdater__block_invoke()
{
  id v0;
  void *v1;

  v0 = -[MNNavdStateUpdater initPrivate]([MNNavdStateUpdater alloc], "initPrivate");
  v1 = (void *)_MergedGlobals_44;
  _MergedGlobals_44 = (uint64_t)v0;

}

- (id)initPrivate
{
  void *v3;
  int v4;
  MNNavdStateUpdater *v5;
  MNNavdStateUpdater *v6;
  MNObserverHashTable *v7;
  MNObserverHashTable *innerObservers;
  NSObject *v9;
  dispatch_queue_t v10;
  OS_dispatch_queue *queue;
  MNNavdStateUpdater *v12;
  objc_super v14;

  objc_msgSend(MEMORY[0x1E0CB3898], "processInfo");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = objc_msgSend(v3, "_navigation_isNavd");

  if (v4)
  {
    v14.receiver = self;
    v14.super_class = (Class)MNNavdStateUpdater;
    v5 = -[MNNavdStateUpdater init](&v14, sel_init);
    v6 = v5;
    if (v5)
    {
      v5->_hasObservers = 0;
      v7 = -[MNObserverHashTable initWithProtocol:]([MNObserverHashTable alloc], "initWithProtocol:", &unk_1EEF095E0);
      innerObservers = v6->_innerObservers;
      v6->_innerObservers = v7;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v9 = objc_claimAutoreleasedReturnValue();
      v10 = dispatch_queue_create("MNNavdUpdaterQueue", v9);
      queue = v6->_queue;
      v6->_queue = (OS_dispatch_queue *)v10;

    }
    self = v6;
    v12 = self;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

- (void)registerObserver:(id)a3
{
  MNObserverHashTable *v4;
  void *v5;
  id v6;

  v6 = a3;
  v4 = self->_innerObservers;
  objc_sync_enter(v4);
  if (v6)
  {
    -[MNObserverHashTable registerObserver:](self->_innerObservers, "registerObserver:");
    if (!self->_hasObservers)
    {
      self->_hasObservers = 1;
      +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "registerObserver:", self);

    }
  }
  objc_sync_exit(v4);

}

- (void)unregisterObserver:(id)a3
{
  id v4;
  MNObserverHashTable *v5;
  void *v6;
  id v7;

  v4 = a3;
  if (v4)
  {
    v7 = v4;
    v5 = self->_innerObservers;
    objc_sync_enter(v5);
    -[MNObserverHashTable unregisterObserver:](self->_innerObservers, "unregisterObserver:", v7);
    if (!-[MNObserverHashTable count](self->_innerObservers, "count"))
    {
      self->_hasObservers = 0;
      +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "unregisterObserver:", self);

    }
    objc_sync_exit(v5);

    v4 = v7;
  }

}

- (BOOL)isNavigatingOrPredictingDestination
{
  void *v2;
  void *v3;
  BOOL v4;
  void *v5;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v2, "currentStateType"))
  {
    +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v3, "currentStateType") == 2)
    {
      v4 = 1;
    }
    else
    {
      +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      v4 = objc_msgSend(v5, "currentStateType") == 1;

    }
  }
  else
  {
    v4 = 1;
  }

  return !v4;
}

- (BOOL)isNavigatingWithETA
{
  void *v2;
  uint64_t v3;

  +[MNNavigationStateManager sharedManager](MNNavigationStateManager, "sharedManager");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "currentStateType");

  return ((unint64_t)(v3 + 1) > 7) | (0x70u >> (v3 + 1)) & 1;
}

- (void)stateManager:(id)a3 didChangeFromState:(unint64_t)a4 toState:(unint64_t)a5
{
  -[MNObserverHashTable didNavigationStateChange](self->_innerObservers, "didNavigationStateChange", a3, a4, a5);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_innerObservers, 0);
}

@end

@implementation HKWatchAppInstallationManager

- (HKWatchAppInstallationManager)initWithBundleIdentifier:(id)a3
{
  id v5;
  HKWatchAppInstallationManager *v6;
  HKWatchAppInstallationManager *v7;
  uint64_t v8;
  OS_dispatch_queue *queue;
  HKObserverSet *v10;
  void *v11;
  void *v12;
  uint64_t v13;
  HKObserverSet *observers;
  objc_super v16;

  v5 = a3;
  v16.receiver = self;
  v16.super_class = (Class)HKWatchAppInstallationManager;
  v6 = -[HKWatchAppInstallationManager init](&v16, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_bundleIdentifier, a3);
    HKCreateSerialDispatchQueue(v7, CFSTR("HKWatchAppInstallationManager private queue"));
    v8 = objc_claimAutoreleasedReturnValue();
    queue = v7->_queue;
    v7->_queue = (OS_dispatch_queue *)v8;

    v10 = [HKObserverSet alloc];
    -[HKWatchAppInstallationManager description](v7, "description");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    HKLogInfrastructure();
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    v13 = -[HKObserverSet initWithName:loggingCategory:](v10, "initWithName:loggingCategory:", v11, v12);
    observers = v7->_observers;
    v7->_observers = (HKObserverSet *)v13;

  }
  return v7;
}

- (void)registerObserver:(id)a3
{
  -[HKWatchAppInstallationManager registerObserver:queue:](self, "registerObserver:queue:", a3, 0);
}

- (void)registerObserver:(id)a3 queue:(id)a4
{
  HKObserverSet *observers;
  _QWORD v5[5];

  observers = self->_observers;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __56__HKWatchAppInstallationManager_registerObserver_queue___block_invoke;
  v5[3] = &unk_1E37E6770;
  v5[4] = self;
  -[HKObserverSet registerObserver:queue:runIfFirstObserver:](observers, "registerObserver:queue:runIfFirstObserver:", a3, a4, v5);
}

uint64_t __56__HKWatchAppInstallationManager_registerObserver_queue___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "startObserving");
}

- (void)unregisterObserver:(id)a3
{
  HKObserverSet *observers;
  _QWORD v4[5];

  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __52__HKWatchAppInstallationManager_unregisterObserver___block_invoke;
  v4[3] = &unk_1E37E6770;
  v4[4] = self;
  -[HKObserverSet unregisterObserver:runIfLastObserver:](observers, "unregisterObserver:runIfLastObserver:", a3, v4);
}

uint64_t __52__HKWatchAppInstallationManager_unregisterObserver___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "stopObserving");
}

- (void)_queue_notifyObservers
{
  HKObserverSet *observers;
  _QWORD v4[5];

  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  observers = self->_observers;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = __55__HKWatchAppInstallationManager__queue_notifyObservers__block_invoke;
  v4[3] = &unk_1E37E9728;
  v4[4] = self;
  -[HKObserverSet notifyObservers:](observers, "notifyObservers:", v4);
}

uint64_t __55__HKWatchAppInstallationManager__queue_notifyObservers__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "watchAppInstallationManagerDidObserveChange:", *(_QWORD *)(a1 + 32));
}

- (NSString)bundleIdentifier
{
  return self->_bundleIdentifier;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifier, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

- (id)isWatchAppInstalledWithError:(id *)a3
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  NSRequestConcreteImplementation();
  return 0;
}

- (void)startObserving
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2();
}

- (void)stopObserving
{
  OUTLINED_FUNCTION_1_2();
  OUTLINED_FUNCTION_2_1();
  OUTLINED_FUNCTION_0_2();
}

@end

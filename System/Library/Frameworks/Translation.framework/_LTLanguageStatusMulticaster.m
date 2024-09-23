@implementation _LTLanguageStatusMulticaster

+ (id)shared
{
  if (shared_onceToken != -1)
    dispatch_once(&shared_onceToken, &__block_literal_global_4);
  return (id)shared_shared;
}

- (_LTLanguageStatusMulticaster)init
{
  _LTLanguageStatusMulticaster *v2;
  dispatch_queue_t v3;
  OS_dispatch_queue *queue;
  uint64_t v5;
  NSMapTable *statusObservers;
  uint64_t v7;
  NSMutableDictionary *lastStatusObservations;
  uint64_t v9;
  NSMutableDictionary *connectionIdentifiers;
  _LTLanguageStatusMulticaster *v11;
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)_LTLanguageStatusMulticaster;
  v2 = -[_LTLanguageStatusMulticaster init](&v13, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_create("com.apple.translation.LanguageStatusMulticast", 0);
    queue = v2->_queue;
    v2->_queue = (OS_dispatch_queue *)v3;

    objc_msgSend(MEMORY[0x24BDD1650], "strongToWeakObjectsMapTable");
    v5 = objc_claimAutoreleasedReturnValue();
    statusObservers = v2->_statusObservers;
    v2->_statusObservers = (NSMapTable *)v5;

    v7 = objc_opt_new();
    lastStatusObservations = v2->_lastStatusObservations;
    v2->_lastStatusObservations = (NSMutableDictionary *)v7;

    v9 = objc_opt_new();
    connectionIdentifiers = v2->_connectionIdentifiers;
    v2->_connectionIdentifiers = (NSMutableDictionary *)v9;

    v11 = v2;
  }

  return v2;
}

- (void)dealloc
{
  NSMapTable *statusObservers;
  NSMutableDictionary *lastStatusObservations;
  NSMutableDictionary *connectionIdentifiers;
  objc_super v6;

  -[_LTLanguageStatusMulticaster _removeAllObservers](self, "_removeAllObservers");
  -[NSMapTable removeAllObjects](self->_statusObservers, "removeAllObjects");
  statusObservers = self->_statusObservers;
  self->_statusObservers = 0;

  lastStatusObservations = self->_lastStatusObservations;
  self->_lastStatusObservations = 0;

  connectionIdentifiers = self->_connectionIdentifiers;
  self->_connectionIdentifiers = 0;

  v6.receiver = self;
  v6.super_class = (Class)_LTLanguageStatusMulticaster;
  -[_LTLanguageStatusMulticaster dealloc](&v6, sel_dealloc);
}

- (void)_removeAllObservers
{
  NSObject *queue;
  _QWORD v4[4];
  id v5;
  id location;

  objc_initWeak(&location, self);
  queue = self->_queue;
  v4[0] = MEMORY[0x24BDAC760];
  v4[1] = 3221225472;
  v4[2] = __51___LTLanguageStatusMulticaster__removeAllObservers__block_invoke;
  v4[3] = &unk_250693730;
  objc_copyWeak(&v5, &location);
  dispatch_async(queue, v4);
  objc_destroyWeak(&v5);
  objc_destroyWeak(&location);
}

- (void)addObserver:(id)a3
{
  id v4;
  NSObject *queue;
  id v6;
  _QWORD block[4];
  id v8;
  id v9;
  id location;

  v4 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __44___LTLanguageStatusMulticaster_addObserver___block_invoke;
  block[3] = &unk_250693708;
  objc_copyWeak(&v9, &location);
  v8 = v4;
  v6 = v4;
  dispatch_async(queue, block);

  objc_destroyWeak(&v9);
  objc_destroyWeak(&location);
}

- (void)removeObserver:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;
  NSObject *queue;
  id v9;
  _QWORD block[4];
  id v11;
  id v12[2];
  char v13;
  id location;

  v4 = a3;
  objc_msgSend(v4, "identifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)objc_msgSend(v4, "observationType");
  v7 = objc_msgSend(v4, "useDedicatedMachPort");

  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __47___LTLanguageStatusMulticaster_removeObserver___block_invoke;
  block[3] = &unk_250693AB0;
  objc_copyWeak(v12, &location);
  v11 = v5;
  v12[1] = v6;
  v13 = v7;
  v9 = v5;
  dispatch_async(queue, block);

  objc_destroyWeak(v12);
  objc_destroyWeak(&location);
}

- (void)_multicastObservations:(id)a3 observationType:(unint64_t)a4 progress:(BOOL)a5
{
  id v8;
  NSObject *queue;
  id v10;
  _QWORD block[4];
  id v12;
  id v13[2];
  BOOL v14;
  id location;

  v8 = a3;
  objc_initWeak(&location, self);
  queue = self->_queue;
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __80___LTLanguageStatusMulticaster__multicastObservations_observationType_progress___block_invoke;
  block[3] = &unk_250693AB0;
  objc_copyWeak(v13, &location);
  v14 = a5;
  v13[1] = (id)a4;
  v12 = v8;
  v10 = v8;
  dispatch_async(queue, block);

  objc_destroyWeak(v13);
  objc_destroyWeak(&location);
}

- (void)_reconnectIfStreamingWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5
{
  id v8;
  void *v9;
  int v10;
  NSObject *v11;
  NSObject *queue;
  _QWORD v13[4];
  id v14;
  id v15[2];
  BOOL v16;
  uint8_t buf[4];
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x24BDAC8D0];
  v8 = a3;
  -[NSMutableDictionary allValues](self->_connectionIdentifiers, "allValues");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "containsObject:", v8);

  if (v10)
  {
    v11 = _LTOSLogAssets();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138543362;
      v18 = v8;
      _os_log_impl(&dword_235438000, v11, OS_LOG_TYPE_INFO, "Reconnecting language status observation connection %{public}@", buf, 0xCu);
    }
    objc_initWeak((id *)buf, self);
    queue = self->_queue;
    v13[0] = MEMORY[0x24BDAC760];
    v13[1] = 3221225472;
    v13[2] = __115___LTLanguageStatusMulticaster__reconnectIfStreamingWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke;
    v13[3] = &unk_250693AB0;
    objc_copyWeak(v15, (id *)buf);
    v14 = v8;
    v15[1] = (id)a4;
    v16 = a5;
    dispatch_async(queue, v13);

    objc_destroyWeak(v15);
    objc_destroyWeak((id *)buf);
  }

}

- (void)_startWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5
{
  _BOOL8 v5;
  id v8;
  _LTLanguageStatusMulticaster *v9;
  uint64_t v10;
  id v11;
  id v12;
  _QWORD v13[4];
  id v14;
  id v15[2];
  BOOL v16;
  _QWORD v17[4];
  id v18;
  id v19[2];
  BOOL v20;
  id location;

  v5 = a5;
  v8 = a3;
  objc_initWeak(&location, self);
  v9 = self;
  v10 = MEMORY[0x24BDAC760];
  v17[0] = MEMORY[0x24BDAC760];
  v17[1] = 3221225472;
  v17[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke;
  v17[3] = &unk_250693AD8;
  objc_copyWeak(v19, &location);
  v11 = v8;
  v18 = v11;
  v19[1] = (id)a4;
  v20 = v5;
  v13[0] = v10;
  v13[1] = 3221225472;
  v13[2] = __100___LTLanguageStatusMulticaster__startWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_9;
  v13[3] = &unk_250693B50;
  objc_copyWeak(v15, &location);
  v12 = v11;
  v14 = v12;
  v15[1] = (id)a4;
  v16 = v5;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", v9, v5, v17, v13);

  objc_destroyWeak(v15);
  objc_destroyWeak(v19);

  objc_destroyWeak(&location);
}

- (void)_cancelWithConnectionIdentifier:(id)a3 observationType:(unint64_t)a4 useDedicatedMachPort:(BOOL)a5
{
  _BOOL8 v5;
  id v7;
  _LTLanguageStatusMulticaster *v8;
  id v9;
  _QWORD v10[4];
  id v11;
  id v12;
  id location;

  v5 = a5;
  v7 = a3;
  objc_initWeak(&location, self);
  v8 = self;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __101___LTLanguageStatusMulticaster__cancelWithConnectionIdentifier_observationType_useDedicatedMachPort___block_invoke_12;
  v10[3] = &unk_250693BC0;
  objc_copyWeak(&v12, &location);
  v9 = v7;
  v11 = v9;
  +[_LTTranslator _getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:](_LTTranslator, "_getTextServiceProxyWithDelegate:useDedicatedTextMachPort:errorHandler:block:", v8, v5, &__block_literal_global_11, v10);

  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

}

- (void)languageStatusChangedForType:(unint64_t)a3 progress:(BOOL)a4 observations:(id)a5
{
  -[_LTLanguageStatusMulticaster _multicastObservations:observationType:progress:](self, "_multicastObservations:observationType:progress:", a5, a3, a4);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_connectionIdentifiers, 0);
  objc_storeStrong((id *)&self->_lastStatusObservations, 0);
  objc_storeStrong((id *)&self->_statusObservers, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

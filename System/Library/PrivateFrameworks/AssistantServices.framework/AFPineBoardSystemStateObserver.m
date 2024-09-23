@implementation AFPineBoardSystemStateObserver

- (AFPineBoardSystemStateObserver)initWithQueue:(id)a3
{
  id v5;
  AFPineBoardSystemStateObserver *v6;
  AFPineBoardSystemStateObserver *v7;
  uint64_t v8;
  NSHashTable *listeners;
  NSObject *queue;
  _QWORD block[4];
  AFPineBoardSystemStateObserver *v13;
  objc_super v14;

  v5 = a3;
  v14.receiver = self;
  v14.super_class = (Class)AFPineBoardSystemStateObserver;
  v6 = -[AFPineBoardSystemStateObserver init](&v14, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_queue, a3);
    v7->_pineBoardStateGroupDepth = 0;
    v8 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
    listeners = v7->_listeners;
    v7->_listeners = (NSHashTable *)v8;

    -[AFPineBoardSystemStateObserver _beginGroup](v7, "_beginGroup");
    queue = v7->_queue;
    block[0] = MEMORY[0x1E0C809B0];
    block[1] = 3221225472;
    block[2] = __48__AFPineBoardSystemStateObserver_initWithQueue___block_invoke;
    block[3] = &unk_1E3A36F30;
    v13 = v7;
    dispatch_async(queue, block);

  }
  return v7;
}

- (void)addListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __46__AFPineBoardSystemStateObserver_addListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)removeListener:(id)a3
{
  id v4;
  void *v5;
  NSObject *queue;
  _QWORD v7[5];
  id v8;

  v4 = a3;
  v5 = v4;
  if (v4)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __49__AFPineBoardSystemStateObserver_removeListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)_startObservingPineBoardSystemState
{
  NSObject *v2;
  int v3;
  const char *v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  v2 = AFSiriLogContextDaemon;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextDaemon, OS_LOG_TYPE_INFO))
  {
    v3 = 136315138;
    v4 = "-[AFPineBoardSystemStateObserver _startObservingPineBoardSystemState]";
    _os_log_impl(&dword_19AF50000, v2, OS_LOG_TYPE_INFO, "%s ", (uint8_t *)&v3, 0xCu);
    v2 = AFSiriLogContextDaemon;
  }
  if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
  {
    v3 = 136315138;
    v4 = "-[AFPineBoardSystemStateObserver _startObservingPineBoardSystemState]";
    _os_log_error_impl(&dword_19AF50000, v2, OS_LOG_TYPE_ERROR, "%s PineBoard is not available", (uint8_t *)&v3, 0xCu);
  }
}

- (void)_handlePineBoardStateChange:(int64_t)a3
{
  int64_t pineBoardSystemState;
  NSHashTable *v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  dispatch_assert_queue_V2((dispatch_queue_t)self->_queue);
  pineBoardSystemState = self->_pineBoardSystemState;
  if (pineBoardSystemState != a3)
  {
    self->_pineBoardSystemState = a3;
    v12 = 0u;
    v13 = 0u;
    v14 = 0u;
    v15 = 0u;
    v6 = self->_listeners;
    v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v13;
      do
      {
        v10 = 0;
        do
        {
          if (*(_QWORD *)v13 != v9)
            objc_enumerationMutation(v6);
          v11 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * v10);
          if ((objc_opt_respondsToSelector() & 1) != 0)
            objc_msgSend(v11, "pineBoardSystemStateObserver:pineBoardStateDidChangeFrom:to:", self, pineBoardSystemState, self->_pineBoardSystemState, (_QWORD)v12);
          ++v10;
        }
        while (v8 != v10);
        v8 = -[NSHashTable countByEnumeratingWithState:objects:count:](v6, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      }
      while (v8);
    }

  }
}

- (void)_beginGroup
{
  NSObject *pineBoardStateGroup;
  OS_dispatch_group *v4;
  OS_dispatch_group *v5;

  pineBoardStateGroup = self->_pineBoardStateGroup;
  if (!pineBoardStateGroup)
  {
    v4 = (OS_dispatch_group *)dispatch_group_create();
    v5 = self->_pineBoardStateGroup;
    self->_pineBoardStateGroup = v4;

    pineBoardStateGroup = self->_pineBoardStateGroup;
  }
  dispatch_group_enter(pineBoardStateGroup);
  ++self->_pineBoardStateGroupDepth;
}

- (void)_endGroup
{
  NSObject *pineBoardStateGroup;
  OS_dispatch_group **p_pineBoardStateGroup;
  OS_dispatch_group *v5;

  p_pineBoardStateGroup = &self->_pineBoardStateGroup;
  pineBoardStateGroup = self->_pineBoardStateGroup;
  self->_pineBoardStateGroupDepth = (int64_t)p_pineBoardStateGroup[1] - 1;
  dispatch_group_leave(pineBoardStateGroup);
  if (!self->_pineBoardStateGroupDepth)
  {
    v5 = self->_pineBoardStateGroup;
    self->_pineBoardStateGroup = 0;

  }
}

- (int64_t)pineBoardSystemState
{
  return self->_pineBoardSystemState;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_pineBoardStateGroup, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __49__AFPineBoardSystemStateObserver_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __46__AFPineBoardSystemStateObserver_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 40), "addObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __48__AFPineBoardSystemStateObserver_initWithQueue___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_startObservingPineBoardSystemState");
  return objc_msgSend(*(id *)(a1 + 32), "_endGroup");
}

+ (id)defaultObserver
{
  if (defaultObserver_onceToken != -1)
    dispatch_once(&defaultObserver_onceToken, &__block_literal_global_18579);
  return (id)defaultObserver_defaultObserver;
}

void __49__AFPineBoardSystemStateObserver_defaultObserver__block_invoke()
{
  AFPineBoardSystemStateObserver *v0;
  NSObject *v1;
  NSObject *v2;
  uint64_t v3;
  void *v4;
  dispatch_queue_t v5;

  v0 = [AFPineBoardSystemStateObserver alloc];
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v1 = objc_claimAutoreleasedReturnValue();
  dispatch_queue_attr_make_with_qos_class(v1, QOS_CLASS_USER_INITIATED, 0);
  v2 = objc_claimAutoreleasedReturnValue();

  v5 = dispatch_queue_create("AFPineBoardSystemStateObserver.defaultObserver", v2);
  v3 = -[AFPineBoardSystemStateObserver initWithQueue:](v0, "initWithQueue:", v5);
  v4 = (void *)defaultObserver_defaultObserver;
  defaultObserver_defaultObserver = v3;

}

@end

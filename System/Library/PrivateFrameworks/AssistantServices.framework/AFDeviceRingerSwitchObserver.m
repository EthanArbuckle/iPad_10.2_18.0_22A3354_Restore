@implementation AFDeviceRingerSwitchObserver

- (AFDeviceRingerSwitchObserver)init
{
  AFDeviceRingerSwitchObserver *v2;
  NSObject *v3;
  dispatch_queue_t v4;
  OS_dispatch_queue *queue;
  uint64_t v6;
  NSHashTable *listeners;
  AFNotifyObserver *v8;
  AFNotifyObserver *notifyObserver;
  int v11;
  objc_super v12;

  v12.receiver = self;
  v12.super_class = (Class)AFDeviceRingerSwitchObserver;
  v2 = -[AFDeviceRingerSwitchObserver init](&v12, sel_init);
  if (v2)
  {
    if (AFHasRingerSwitch())
      goto LABEL_6;
    if (AFIsPad_onceToken != -1)
      dispatch_once(&AFIsPad_onceToken, &__block_literal_global_132_40147);
    if (AFIsPad_isPad)
    {
LABEL_6:
      v2->_isActive = 1;
LABEL_7:
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v3 = objc_claimAutoreleasedReturnValue();
      v4 = dispatch_queue_create("AFDeviceRingerSwitchObserver", v3);
      queue = v2->_queue;
      v2->_queue = (OS_dispatch_queue *)v4;

      v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3690]), "initWithOptions:capacity:", 5, 0);
      listeners = v2->_listeners;
      v2->_listeners = (NSHashTable *)v6;

      v8 = -[AFNotifyObserver initWithName:options:queue:delegate:]([AFNotifyObserver alloc], "initWithName:options:queue:delegate:", CFSTR("com.apple.springboard.ringerstate"), 1, v2->_queue, v2);
      notifyObserver = v2->_notifyObserver;
      v2->_notifyObserver = v8;

      return v2;
    }
    if (AFIsIPod_onceToken != -1)
      dispatch_once(&AFIsIPod_onceToken, &__block_literal_global_135_40232);
    v11 = AFIsIPod_isIPod;
    v2->_isActive = AFIsIPod_isIPod;
    if (v11)
      goto LABEL_7;
  }
  return v2;
}

- (int64_t)state
{
  if (!self->_isActive)
    return 0;
  if (-[AFNotifyObserver state](self->_notifyObserver, "state"))
    return 1;
  return 2;
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
  if (v4 && self->_isActive)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __44__AFDeviceRingerSwitchObserver_addListener___block_invoke;
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
  if (v4 && self->_isActive)
  {
    queue = self->_queue;
    v7[0] = MEMORY[0x1E0C809B0];
    v7[1] = 3221225472;
    v7[2] = __47__AFDeviceRingerSwitchObserver_removeListener___block_invoke;
    v7[3] = &unk_1E3A36FC8;
    v7[4] = self;
    v8 = v4;
    dispatch_async(queue, v7);

  }
}

- (void)notifyObserver:(id)a3 didChangeStateFrom:(unint64_t)a4 to:(unint64_t)a5
{
  if (self->_notifyObserver == a3)
    -[AFDeviceRingerSwitchObserver _updateStateWithNotifyState:](self, "_updateStateWithNotifyState:", a5, a4);
}

- (void)_updateStateWithNotifyState:(unint64_t)a3
{
  uint64_t v4;
  NSHashTable *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  if (a3)
    v4 = 1;
  else
    v4 = 2;
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v5 = self->_listeners;
  v6 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(*(id *)(*((_QWORD *)&v10 + 1) + 8 * v9++), "deviceRingerObserver:didChangeState:", self, v4, (_QWORD)v10);
      }
      while (v7 != v9);
      v7 = -[NSHashTable countByEnumeratingWithState:objects:count:](v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_listeners, 0);
  objc_storeStrong((id *)&self->_notifyObserver, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

uint64_t __47__AFDeviceRingerSwitchObserver_removeListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "removeObject:", *(_QWORD *)(a1 + 40));
}

uint64_t __44__AFDeviceRingerSwitchObserver_addListener___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 24), "addObject:", *(_QWORD *)(a1 + 40));
}

+ (id)sharedObserver
{
  if (sharedObserver_onceToken_27529 != -1)
    dispatch_once(&sharedObserver_onceToken_27529, &__block_literal_global_27530);
  return (id)sharedObserver_sharedObserver_27531;
}

void __46__AFDeviceRingerSwitchObserver_sharedObserver__block_invoke()
{
  AFDeviceRingerSwitchObserver *v0;
  void *v1;

  v0 = objc_alloc_init(AFDeviceRingerSwitchObserver);
  v1 = (void *)sharedObserver_sharedObserver_27531;
  sharedObserver_sharedObserver_27531 = (uint64_t)v0;

}

@end

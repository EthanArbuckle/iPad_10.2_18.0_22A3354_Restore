@implementation LACKeyBagMKBAdapter

- (LACKeyBagMKBAdapter)initWithUserId:(unsigned int)a3
{
  LACKeyBagStateProviderMKBAdapter *v4;
  void *v5;
  LACKeyBagMKBAdapter *v6;

  v4 = -[LACKeyBagStateProviderMKBAdapter initWithUserId:]([LACKeyBagStateProviderMKBAdapter alloc], "initWithUserId:", *(_QWORD *)&a3);
  +[LACDarwinNotificationCenter sharedInstance](LACDarwinNotificationCenter, "sharedInstance");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[LACKeyBagMKBAdapter initWithKeyBagStateProvider:notificationCenter:](self, "initWithKeyBagStateProvider:notificationCenter:", v4, v5);

  return v6;
}

- (LACKeyBagMKBAdapter)initWithKeyBagStateProvider:(id)a3 notificationCenter:(id)a4
{
  id v7;
  id v8;
  LACKeyBagMKBAdapter *v9;
  LACKeyBagMKBAdapter *v10;
  LACKeyBagObserverCollection *v11;
  LACKeyBagObserverCollection *observers;
  objc_super v14;

  v7 = a3;
  v8 = a4;
  v14.receiver = self;
  v14.super_class = (Class)LACKeyBagMKBAdapter;
  v9 = -[LACKeyBagMKBAdapter init](&v14, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_keyBagStateProvider, a3);
    v10->_state = -[LACKeyBagStateProviderMKBAdapter state](v10->_keyBagStateProvider, "state");
    v11 = -[LACKeyBagObserverCollection initWithState:]([LACKeyBagObserverCollection alloc], "initWithState:", v10->_state);
    observers = v10->_observers;
    v10->_observers = v11;

    objc_storeStrong((id *)&v10->_notificationCenter, a4);
    -[LACKeyBagMKBAdapter _addKeybagStatusObserver](v10, "_addKeybagStatusObserver");
  }

  return v10;
}

- (void)dealloc
{
  objc_super v3;

  -[LACKeyBagMKBAdapter _removeKeybagStatusObserver](self, "_removeKeybagStatusObserver");
  v3.receiver = self;
  v3.super_class = (Class)LACKeyBagMKBAdapter;
  -[LACKeyBagMKBAdapter dealloc](&v3, sel_dealloc);
}

- (int64_t)state
{
  -[LACKeyBagMKBAdapter _updateKeybagState](self, "_updateKeybagState");
  return self->_state;
}

- (void)addObserver:(id)a3
{
  -[LACKeyBagObserverCollection addObserver:](self->_observers, "addObserver:", a3);
}

- (void)removeObserver:(id)a3
{
  -[LACKeyBagObserverCollection removeObserver:](self->_observers, "removeObserver:", a3);
}

- (void)notificationCenter:(id)a3 didReceiveNotification:(__CFString *)a4
{
  if (LACDarwinNotificationsEqual(a4, CFSTR("com.apple.mobile.keybagd.lock_status")))
    -[LACKeyBagMKBAdapter _updateKeybagState](self, "_updateKeybagState");
}

- (void)_addKeybagStatusObserver
{
  -[LACDarwinNotificationCenter addObserver:notification:](self->_notificationCenter, "addObserver:notification:", self, CFSTR("com.apple.mobile.keybagd.lock_status"));
}

- (void)_removeKeybagStatusObserver
{
  -[LACDarwinNotificationCenter removeObserver:](self->_notificationCenter, "removeObserver:", self);
}

- (void)_updateKeybagState
{
  int64_t v3;

  v3 = -[LACKeyBagStateProviderMKBAdapter state](self->_keyBagStateProvider, "state");
  self->_state = v3;
  -[LACKeyBagObserverCollection publishKeybagStateUpdate:state:](self->_observers, "publishKeybagStateUpdate:state:", self, v3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_notificationCenter, 0);
  objc_storeStrong((id *)&self->_observers, 0);
  objc_storeStrong((id *)&self->_keyBagStateProvider, 0);
}

@end

@implementation LACKeyBagObserverCollection

- (LACKeyBagObserverCollection)initWithState:(int64_t)a3
{
  LACKeyBagObserverCollection *v4;
  uint64_t v5;
  LACThreadSafeCollection *observers;
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)LACKeyBagObserverCollection;
  v4 = -[LACKeyBagObserverCollection init](&v8, sel_init);
  if (v4)
  {
    +[LACThreadSafeCollection weakObjectsCollection](LACThreadSafeCollection, "weakObjectsCollection");
    v5 = objc_claimAutoreleasedReturnValue();
    observers = v4->_observers;
    v4->_observers = (LACThreadSafeCollection *)v5;

    v4->_lastPublishedState = a3;
  }
  return v4;
}

- (void)addObserver:(id)a3
{
  -[LACThreadSafeCollection append:](self->_observers, "append:", a3);
}

- (void)removeObserver:(id)a3
{
  -[LACThreadSafeCollection remove:](self->_observers, "remove:", a3);
}

- (void)publishKeybagStateUpdate:(id)a3 state:(int64_t)a4
{
  id v6;
  NSObject *v7;
  void *v8;
  void *v9;
  LACThreadSafeCollection *observers;
  _QWORD v11[4];
  id v12;
  uint8_t buf[4];
  void *v14;
  __int16 v15;
  void *v16;
  uint64_t v17;

  v17 = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  if (self->_lastPublishedState != a4)
  {
    LACLogKeybag();
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      NSStringFromLACKeyBagState(self->_lastPublishedState);
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      NSStringFromLACKeyBagState(a4);
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      v14 = v8;
      v15 = 2112;
      v16 = v9;
      _os_log_impl(&dword_2409DC000, v7, OS_LOG_TYPE_DEFAULT, "Keybag state changed from %@ to %@", buf, 0x16u);

    }
    self->_lastPublishedState = a4;
    observers = self->_observers;
    v11[0] = MEMORY[0x24BDAC760];
    v11[1] = 3221225472;
    v11[2] = __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke;
    v11[3] = &unk_2510C1498;
    v12 = v6;
    -[LACThreadSafeCollection forEach:](observers, "forEach:", v11);

  }
}

void __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke(uint64_t a1, void *a2)
{
  id v3;

  v3 = a2;
  if ((objc_msgSend(v3, "conformsToProtocol:", &unk_257084E40) & 1) == 0)
    __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke_cold_1();
  objc_msgSend(v3, "keybagStateDidChange:", *(_QWORD *)(a1 + 32));

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);
}

void __62__LACKeyBagObserverCollection_publishKeybagStateUpdate_state___block_invoke_cold_1()
{
  __assert_rtn("-[LACKeyBagObserverCollection publishKeybagStateUpdate:state:]_block_invoke", "LACKeyBagObserverCollection.m", 43, "[observer conformsToProtocol:@protocol(LACKeyBagObserver)]");
}

@end

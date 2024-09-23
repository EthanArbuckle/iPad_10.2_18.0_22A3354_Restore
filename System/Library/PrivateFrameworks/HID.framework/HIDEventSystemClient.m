@implementation HIDEventSystemClient

- (void)dealloc
{
  __IOHIDEventSystemClient *client;
  objc_super v4;

  client = self->_client;
  if (client)
    CFRelease(client);
  v4.receiver = self;
  v4.super_class = (Class)HIDEventSystemClient;
  -[HIDEventSystemClient dealloc](&v4, sel_dealloc);
}

- (void)setDispatchQueue:(id)a3
{
  IOHIDEventSystemClientSetDispatchQueue();
}

- (void)setCancelHandler:(id)a3
{
  void *v4;
  id cancelHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_activated)
    -[HIDEventSystemClient setCancelHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = v4;

  os_unfair_recursive_lock_unlock();
}

- (HIDEventSystemClient)initWithType:(int64_t)a3 andAttributes:(id)a4
{
  id v5;
  HIDEventSystemClient *v6;
  uint64_t v7;
  HIDEventSystemClient *v8;
  objc_super v10;

  v5 = a4;
  v10.receiver = self;
  v10.super_class = (Class)HIDEventSystemClient;
  v6 = -[HIDEventSystemClient init](&v10, sel_init);
  if (v6 && (v7 = IOHIDEventSystemClientCreateWithType(), (v6->_client = (__IOHIDEventSystemClient *)v7) != 0))
    v8 = v6;
  else
    v8 = 0;

  return v8;
}

- (HIDEventSystemClient)initWithType:(int64_t)a3
{
  return -[HIDEventSystemClient initWithType:andAttributes:](self, "initWithType:andAttributes:", a3, 0);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_propertyChangedHandler, 0);
  objc_storeStrong(&self->_serviceHandler, 0);
  objc_storeStrong(&self->_filterHandler, 0);
  objc_storeStrong(&self->_resetHandler, 0);
  objc_storeStrong(&self->_eventHandler, 0);
}

- (void)cancel
{
  IOHIDEventSystemClientCancel();
}

- (__IOHIDEventSystemClient)client
{
  return self->_client;
}

- (void)activate
{
  os_unfair_recursive_lock_lock_with_options();
  self->_activated = 1;
  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientSetCancelHandler();
  IOHIDEventSystemClientActivate();
}

void __32__HIDEventSystemClient_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 56);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 56);
    *(_QWORD *)(v3 + 56) = 0;

  }
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_client);
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)IOHIDEventSystemClientCopyProperty(self->_client, (CFStringRef)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDEventSystemClientSetProperty(self->_client, (CFStringRef)a4, a3) != 0;
}

- (void)setMatching:(id)a3
{
  id v3;
  uint64_t v4;
  _OWORD v5[5];
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[HIDManager setInputElementMatching:].cold.1(&v4, v5);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "count");
    IOHIDEventSystemClientSetMatching();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "count");
      IOHIDEventSystemClientSetMatchingMultiple();
    }
  }

}

- (NSArray)services
{
  return (NSArray *)IOHIDEventSystemClientCopyServices(self->_client);
}

- (void)setEventHandler:(id)a3
{
  void *v4;
  id eventHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_eventHandler)
    -[HIDEventSystemClient setEventHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  eventHandler = self->_eventHandler;
  self->_eventHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterEventCallback();

}

- (void)setResetHandler:(id)a3
{
  void *v4;
  id resetHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_resetHandler)
    -[HIDEventSystemClient setResetHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  resetHandler = self->_resetHandler;
  self->_resetHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterResetCallback();

}

- (void)setEventFilterHandler:(id)a3
{
  void *v4;
  id filterHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_filterHandler)
    -[HIDEventSystemClient setEventFilterHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  filterHandler = self->_filterHandler;
  self->_filterHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterEventFilterCallback();

}

- (void)setServiceNotificationHandler:(id)a3
{
  void *v4;
  id serviceHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_serviceHandler)
    -[HIDEventSystemClient setServiceNotificationHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  serviceHandler = self->_serviceHandler;
  self->_serviceHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDEventSystemClientRegisterDeviceMatchingCallback();

}

- (void)setPropertyChangedHandler:(id)a3 matching:(id)a4
{
  id v6;
  id v7;
  void *v8;
  id propertyChangedHandler;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  __int128 v15;
  __int128 v16;
  __int128 v17;
  __int128 v18;
  uint64_t v19;
  _BYTE v20[128];
  _OWORD v21[5];
  uint64_t v22;

  v22 = *MEMORY[0x1E0C80C00];
  v6 = a3;
  v7 = a4;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[HIDManager setInputElementMatching:].cold.1(&v19, v21);
  }
  os_unfair_recursive_lock_lock_with_options();
  if (self->_propertyChangedHandler)
    -[HIDEventSystemClient setPropertyChangedHandler:matching:].cold.1();
  v8 = _Block_copy(v6);
  propertyChangedHandler = self->_propertyChangedHandler;
  self->_propertyChangedHandler = v8;

  os_unfair_recursive_lock_unlock();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    IOHIDEventSystemClientRegisterPropertyChangedCallback();
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v17 = 0u;
      v18 = 0u;
      v15 = 0u;
      v16 = 0u;
      v10 = v7;
      v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
      if (v11)
      {
        v12 = v11;
        v13 = *(_QWORD *)v16;
        do
        {
          v14 = 0;
          do
          {
            if (*(_QWORD *)v16 != v13)
              objc_enumerationMutation(v10);
            IOHIDEventSystemClientRegisterPropertyChangedCallback();
            ++v14;
          }
          while (v12 != v14);
          v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v15, v20, 16);
        }
        while (v12);
      }

    }
  }

}

- (void)setCancelHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setEventHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setResetHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setEventFilterHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setServiceNotificationHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setPropertyChangedHandler:matching:.cold.1()
{
  _os_crash();
  __break(1u);
}

@end

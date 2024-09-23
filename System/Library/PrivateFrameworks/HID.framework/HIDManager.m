@implementation HIDManager

- (HIDManager)init
{
  HIDManager *v2;
  IOHIDManagerRef v3;
  HIDManager *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)HIDManager;
  v2 = -[HIDManager init](&v6, sel_init);
  if (v2
    && (v3 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], 0),
        v2->_manager = v3,
        v2->_handlerLock.ourl_lock._os_unfair_lock_opaque = 0,
        v2->_handlerLock.ourl_count = 0,
        v3))
  {
    v4 = v2;
  }
  else
  {
    v4 = 0;
  }

  return v4;
}

- (HIDManager)initWithOptions:(int64_t)a3
{
  IOOptionBits v3;
  HIDManager *v4;
  IOHIDManagerRef v5;
  HIDManager *v6;
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)HIDManager;
  v4 = -[HIDManager init](&v8, sel_init);
  if (v4
    && (v5 = IOHIDManagerCreate((CFAllocatorRef)*MEMORY[0x1E0C9AE00], v3),
        v4->_manager = v5,
        v4->_handlerLock.ourl_lock._os_unfair_lock_opaque = 0,
        v4->_handlerLock.ourl_count = 0,
        v5))
  {
    v6 = v4;
  }
  else
  {
    v6 = 0;
  }

  return v6;
}

- (void)dealloc
{
  __IOHIDManager *manager;
  objc_super v4;

  manager = self->_manager;
  if (manager)
    CFRelease(manager);
  v4.receiver = self;
  v4.super_class = (Class)HIDManager;
  -[HIDManager dealloc](&v4, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_manager);
}

- (NSArray)devices
{
  CFSetRef v2;
  void *v3;

  v2 = IOHIDManagerCopyDevices(self->_manager);
  -[__CFSet allObjects](v2, "allObjects");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v3;
}

- (id)propertyForKey:(id)a3
{
  return (id)IOHIDManagerGetProperty(self->_manager, (CFStringRef)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDManagerSetProperty(self->_manager, (CFStringRef)a4, a3) != 0;
}

- (void)setInputElementMatching:(id)a3
{
  const __CFDictionary *v4;
  const __CFArray *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFDictionary *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[HIDManager setInputElementMatching:].cold.1(&v7, v8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[__CFDictionary count](v6, "count"))
      v4 = v6;
    else
      v4 = 0;
    IOHIDManagerSetInputValueMatching(self->_manager, v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFDictionary count](v6, "count"))
        v5 = v6;
      else
        v5 = 0;
      IOHIDManagerSetInputValueMatchingMultiple(self->_manager, v5);
    }
  }

}

- (void)setInputElementHandler:(id)a3
{
  void *v4;
  id elementHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_elementHandler)
    -[HIDManager setInputElementHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  elementHandler = self->_elementHandler;
  self->_elementHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDManagerRegisterInputValueCallback(self->_manager, (IOHIDValueCallback)inputValueCallback, self);

}

- (void)setDeviceMatching:(id)a3
{
  const __CFDictionary *v4;
  const __CFArray *v5;
  const __CFDictionary *v6;
  uint64_t v7;
  _OWORD v8[5];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v6 = (const __CFDictionary *)a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) == 0)
      -[HIDManager setInputElementMatching:].cold.1(&v7, v8);
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    if (-[__CFDictionary count](v6, "count"))
      v4 = v6;
    else
      v4 = 0;
    IOHIDManagerSetDeviceMatching(self->_manager, v4);
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      if (-[__CFDictionary count](v6, "count"))
        v5 = v6;
      else
        v5 = 0;
      IOHIDManagerSetDeviceMatchingMultiple(self->_manager, v5);
    }
  }

}

- (void)setDeviceNotificationHandler:(id)a3
{
  void *v4;
  id deviceNotificationHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_deviceNotificationHandler)
    -[HIDManager setDeviceNotificationHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  deviceNotificationHandler = self->_deviceNotificationHandler;
  self->_deviceNotificationHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDManagerRegisterDeviceMatchingCallback(self->_manager, (IOHIDDeviceCallback)deviceAddedCallback, self);
  IOHIDManagerRegisterDeviceRemovalCallback(self->_manager, (IOHIDDeviceCallback)deviceRemovedCallback, self);

}

- (void)setInputReportHandler:(id)a3
{
  void *v4;
  id inputReportHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_inputReportHandler)
    -[HIDManager setInputReportHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  inputReportHandler = self->_inputReportHandler;
  self->_inputReportHandler = v4;

  os_unfair_recursive_lock_unlock();
  IOHIDManagerRegisterInputReportWithTimeStampCallback(self->_manager, (IOHIDReportWithTimeStampCallback)inputReportCallback, self);

}

- (void)setCancelHandler:(id)a3
{
  void *v4;
  id cancelHandler;
  id aBlock;

  aBlock = a3;
  os_unfair_recursive_lock_lock_with_options();
  if (self->_activated)
    -[HIDManager setCancelHandler:].cold.1();
  v4 = _Block_copy(aBlock);
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = v4;

  os_unfair_recursive_lock_unlock();
}

- (void)setDispatchQueue:(id)a3
{
  IOHIDManagerSetDispatchQueue(self->_manager, (dispatch_queue_t)a3);
}

- (void)open
{
  IOHIDManagerOpen(self->_manager, 0);
}

- (void)openWithOptions:(int64_t)a3
{
  IOHIDManagerOpen(self->_manager, a3);
}

- (void)close
{
  IOHIDManagerClose(self->_manager, 0);
}

- (void)activate
{
  __IOHIDManager *manager;
  _QWORD handler[5];

  os_unfair_recursive_lock_lock_with_options();
  self->_activated = 1;
  os_unfair_recursive_lock_unlock();
  manager = self->_manager;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __22__HIDManager_activate__block_invoke;
  handler[3] = &unk_1E94E7040;
  handler[4] = self;
  IOHIDManagerSetCancelHandler(manager, handler);
  IOHIDManagerActivate(self->_manager);
}

void __22__HIDManager_activate__block_invoke(uint64_t a1)
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = *(_QWORD *)(*(_QWORD *)(a1 + 32) + 40);
  if (v2)
  {
    (*(void (**)(void))(v2 + 16))();
    v3 = *(_QWORD *)(a1 + 32);
    v4 = *(void **)(v3 + 40);
    *(_QWORD *)(v3 + 40) = 0;

  }
}

- (void)cancel
{
  IOHIDManagerCancel(self->_manager);
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_inputReportHandler, 0);
  objc_storeStrong(&self->_deviceNotificationHandler, 0);
  objc_storeStrong(&self->_elementHandler, 0);
}

- (void)setInputElementMatching:(_QWORD *)a1 .cold.1(_QWORD *a1, _OWORD *a2)
{
  OUTLINED_FUNCTION_2(a1, a2);
  OUTLINED_FUNCTION_1();
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_3();
  __break(1u);
}

- (void)setInputElementHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setDeviceNotificationHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setInputReportHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setCancelHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

@end

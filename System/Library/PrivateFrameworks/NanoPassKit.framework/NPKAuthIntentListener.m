@implementation NPKAuthIntentListener

- (NPKAuthIntentListener)init
{
  NSObject *v3;
  dispatch_queue_t v4;
  NPKAuthIntentListener *v5;
  NPKAuthIntentListener *v6;
  objc_super v8;

  dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = dispatch_queue_create("NPSButtonListener", v3);
  v8.receiver = self;
  v8.super_class = (Class)NPKAuthIntentListener;
  v5 = -[NPKButtonListener initWithHandlerQueue:](&v8, sel_initWithHandlerQueue_, v4);
  v6 = v5;
  if (v5)
    -[NPKAuthIntentListener _initializeHIDClient](v5, "_initializeHIDClient");

  return v6;
}

- (void)dealloc
{
  __IOHIDEventSystemClient *hidSystemClient;
  void *v4;
  objc_super v5;

  hidSystemClient = self->_hidSystemClient;
  if (hidSystemClient)
  {
    IOHIDEventSystemClientUnregisterEventBlock();
    -[NPKButtonListener handlerQueue](self, "handlerQueue");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    MEMORY[0x2199B5BA4](hidSystemClient, v4);

    CFRelease(hidSystemClient);
    self->_hidSystemClient = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)NPKAuthIntentListener;
  -[NPKAuthIntentListener dealloc](&v5, sel_dealloc);
}

- (void)_initializeHIDClient
{
  NSObject *v3;
  _BOOL4 v4;
  NSObject *v5;
  uint64_t v6;
  uint64_t v7;
  void *v8;
  NSObject *v9;
  _BOOL4 v10;
  NSObject *v11;
  id v12;
  id buf[2];

  pk_Payment_log();
  v3 = objc_claimAutoreleasedReturnValue();
  v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    pk_Payment_log();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(buf[0]) = 0;
      _os_log_impl(&dword_213518000, v5, OS_LOG_TYPE_DEFAULT, "Notice: initializing HID client", (uint8_t *)buf, 2u);
    }

  }
  v6 = IOHIDEventSystemClientCreate();
  if (v6)
  {
    v7 = v6;
    IOHIDEventSystemClientSetMatching();
    -[NPKButtonListener handlerQueue](self, "handlerQueue");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientScheduleWithDispatchQueue();

    objc_initWeak(buf, self);
    objc_copyWeak(&v12, buf);
    IOHIDEventSystemClientRegisterEventBlock();
    -[NPKAuthIntentListener setHidSystemClient:](self, "setHidSystemClient:", v7);
    objc_destroyWeak(&v12);
    objc_destroyWeak(buf);
  }
  else
  {
    pk_Payment_log();
    v9 = objc_claimAutoreleasedReturnValue();
    v10 = os_log_type_enabled(v9, OS_LOG_TYPE_ERROR);

    if (v10)
    {
      pk_Payment_log();
      v11 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_213518000, v11, OS_LOG_TYPE_ERROR, "Error: ButtonController:IOHIDEventSystemClientCreate create failed\n", (uint8_t *)buf, 2u);
      }

    }
  }
}

void __45__NPKAuthIntentListener__initializeHIDClient__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, uint64_t a4, uint64_t a5)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_handleButtonEvent:", a5);

}

- (void)_handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v5;
  uint64_t v6;
  void (**v7)(_QWORD, _QWORD);
  id v8;

  IntegerValue = IOHIDEventGetIntegerValue();
  v5 = IOHIDEventGetIntegerValue();
  v6 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 12 && v5 == 442 && v6)
  {
    kdebug_trace();
    -[NPKButtonListener _handlerQueue_buttonHandler](self, "_handlerQueue_buttonHandler");
    v7 = (void (**)(_QWORD, _QWORD))objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v8 = v7;
      v7[2](v7, 0);
      v7 = (void (**)(_QWORD, _QWORD))v8;
    }

  }
}

- (__IOHIDEventSystemClient)hidSystemClient
{
  return self->_hidSystemClient;
}

- (void)setHidSystemClient:(__IOHIDEventSystemClient *)a3
{
  self->_hidSystemClient = a3;
}

@end

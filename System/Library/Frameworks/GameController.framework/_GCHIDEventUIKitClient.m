@implementation _GCHIDEventUIKitClient

- (_GCHIDEventUIKitClient)initWithQueue:(id)a3
{
  id v4;
  _GCHIDEventUIKitClient *v5;
  _GCHIDEventUIKitClient *v6;
  BKSHIDEventDeliveryPolicyObserver *v7;
  BKSHIDEventDeliveryPolicyObserver *hidObserver;
  void *v9;
  uint64_t v11;
  uint64_t v12;
  void (*v13)(uint64_t, uint64_t);
  void *v14;
  id v15;
  id location;
  objc_super v17;

  v4 = a3;
  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  v17.receiver = self;
  v17.super_class = (Class)_GCHIDEventUIKitClient;
  v5 = -[_GCHIDEventSubject init](&v17, sel_init);
  if (!v5)
    goto LABEL_4;
  +[UIApplication sharedApplication](&off_254DF2320, "sharedApplication");
  v6 = (_GCHIDEventUIKitClient *)objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    objc_initWeak(&location, v5);
    v11 = MEMORY[0x24BDAC760];
    v12 = 3221225472;
    v13 = __40___GCHIDEventUIKitClient_initWithQueue___block_invoke;
    v14 = &unk_24D2B6630;
    objc_copyWeak(&v15, &location);
    -[_GCHIDEventUIKitClient _setHIDGameControllerEventObserver:onQueue:](v6, "_setHIDGameControllerEventObserver:onQueue:", &v11, v4);
    v7 = (BKSHIDEventDeliveryPolicyObserver *)objc_alloc_init((Class)&off_254E06248);
    hidObserver = v5->_hidObserver;
    v5->_hidObserver = v7;

    +[BKSHIDEventDeferringEnvironment keyboardFocusEnvironment](&off_254E06998, "keyboardFocusEnvironment", v11, v12, v13, v14);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[BKSHIDEventDeliveryPolicyObserver setDeferringEnvironment:](v5->_hidObserver, "setDeferringEnvironment:", v9);

    -[BKSHIDEventDeliveryPolicyObserver addObserver:](v5->_hidObserver, "addObserver:", v5);
    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);

LABEL_4:
    v6 = v5;
  }

  return v6;
}

- (_GCHIDEventUIKitClient)init
{
  return -[_GCHIDEventUIKitClient initWithQueue:](self, "initWithQueue:", MEMORY[0x24BDAC9B8]);
}

- (void)dealloc
{
  void *v3;
  objc_super v4;

  dispatch_assert_queue_V2(MEMORY[0x24BDAC9B8]);
  -[BKSHIDEventDeliveryPolicyObserver removeObserver:](self->_hidObserver, "removeObserver:", self);
  +[UIApplication sharedApplication](&off_254DF2320, "sharedApplication");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "_removeHIDGameControllerEventObserver");

  v4.receiver = self;
  v4.super_class = (Class)_GCHIDEventUIKitClient;
  -[_GCHIDEventUIKitClient dealloc](&v4, sel_dealloc);
}

- (void)publishHIDEvent:(__IOHIDEvent *)a3
{
  objc_super v3;

  self->_hidObserverWasActive = 1;
  v3.receiver = self;
  v3.super_class = (Class)_GCHIDEventUIKitClient;
  -[_GCHIDEventSubject publishHIDEvent:](&v3, sel_publishHIDEvent_, a3);
}

- (void)observerDeliveryPolicyDidChange:(id)a3
{
  id v4;
  const void *v5;
  NSObject *v6;
  _BOOL4 hidObserverWasActive;
  objc_super v8;
  uint8_t buf[4];
  _BOOL4 v10;
  __int16 v11;
  int v12;
  uint64_t v13;

  v13 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v6 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      hidObserverWasActive = self->_hidObserverWasActive;
      *(_DWORD *)buf = 67109376;
      v10 = hidObserverWasActive;
      v11 = 1024;
      v12 = objc_msgSend(v4, "canReceiveEvents");
      _os_log_impl(&dword_215181000, v6, OS_LOG_TYPE_INFO, "BKSHIDEventDeliveryPolicy did change %{BOOL}d -> %{BOOL}d", buf, 0xEu);
    }

  }
  if (self->_hidObserverWasActive && (objc_msgSend(v4, "canReceiveEvents") & 1) == 0)
  {
    mach_absolute_time();
    v5 = (const void *)IOHIDEventCreate();
    IOHIDEventSetSenderID();
    v8.receiver = self;
    v8.super_class = (Class)_GCHIDEventUIKitClient;
    -[_GCHIDEventSubject publishHIDEvent:](&v8, sel_publishHIDEvent_, v5);
    CFRelease(v5);
    self->_hidObserverWasActive = 0;
  }

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_hidObserver, 0);
}

@end

@implementation MX_HIDEventObserver

- (MX_HIDEventObserver)init
{
  MX_HIDEventObserver *v2;
  NSObject *v3;
  NSObject *v4;
  uint64_t v5;
  _QWORD v7[5];
  objc_super v8;

  v8.receiver = self;
  v8.super_class = (Class)MX_HIDEventObserver;
  v2 = -[MX_HIDEventObserver init](&v8, sel_init);
  if (v2)
  {
    v3 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    v4 = dispatch_queue_create("com.apple.mediaexperience.hideventobserver", v3);
    v5 = MEMORY[0x1E0C809B0];
    v2->_accessQueue = (OS_dispatch_queue *)v4;
    v7[0] = v5;
    v7[1] = 3221225472;
    v7[2] = __27__MX_HIDEventObserver_init__block_invoke;
    v7[3] = &unk_1E3099900;
    v7[4] = v2;
    MXDispatchAsync((uint64_t)"-[MX_HIDEventObserver init]", (uint64_t)"MX_IOKit.m", 73, 0, 0, v4, (uint64_t)v7);
  }
  return v2;
}

- (void)dealloc
{
  void *v3;
  NSObject *accessQueue;
  __IOHIDEventSystemClient *mHIDClient;
  objc_super v6;

  v3 = (void *)MEMORY[0x194035B20](self, a2);
  accessQueue = self->_accessQueue;
  if (accessQueue)
    dispatch_release(accessQueue);
  mHIDClient = self->mHIDClient;
  if (mHIDClient)
    CFRelease(mHIDClient);
  v6.receiver = self;
  v6.super_class = (Class)MX_HIDEventObserver;
  -[MX_HIDEventObserver dealloc](&v6, sel_dealloc);
  objc_autoreleasePoolPop(v3);
}

- (void)handleButtonEvent:(__IOHIDEvent *)a3
{
  uint64_t IntegerValue;
  uint64_t v5;
  NSObject *os_log_and_send_and_compose_flags_and_os_log_type;
  BOOL v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  IntegerValue = IOHIDEventGetIntegerValue();
  v5 = IOHIDEventGetIntegerValue();
  if (IntegerValue == 65289 && v5 == 2)
  {
    gFlap1StateIsEngaged = IOHIDEventGetIntegerValue() == 1;
    if (!dword_1EE2B3F38)
      goto LABEL_11;
  }
  else
  {
    if (IntegerValue != 65289)
      goto LABEL_11;
    if (v5 != 1)
      goto LABEL_11;
    gOpenStateIsEngaged = IOHIDEventGetIntegerValue() == 1;
    if (!dword_1EE2B3F38)
      goto LABEL_11;
  }
  os_log_and_send_and_compose_flags_and_os_log_type = fig_log_emitter_get_os_log_and_send_and_compose_flags_and_os_log_type();
  os_log_type_enabled(os_log_and_send_and_compose_flags_and_os_log_type, OS_LOG_TYPE_DEFAULT);
  fig_log_call_emit_and_clean_up_after_send_and_compose();
LABEL_11:
  if (gFlap1StateIsEngaged)
    v8 = gOpenStateIsEngaged == 0;
  else
    v8 = 1;
  v9 = !v8;
  -[MX_HIDEventObserver setSmartCoverClosed:](self, "setSmartCoverClosed:", v9, v10, v11);
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  OS_dispatch_queue *v4;
  _QWORD v5[6];
  _QWORD v6[4];

  v6[0] = 0;
  v6[1] = v6;
  v6[2] = 0x2020000000;
  v6[3] = a3;
  if (a3)
    CFRetain(a3);
  v4 = -[MX_HIDEventObserver accessQueue](self, "accessQueue");
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __35__MX_HIDEventObserver_handleEvent___block_invoke;
  v5[3] = &unk_1E309C368;
  v5[4] = self;
  v5[5] = v6;
  MXDispatchAsync((uint64_t)"-[MX_HIDEventObserver handleEvent:]", (uint64_t)"MX_IOKit.m", 157, 0, 0, v4, (uint64_t)v5);
  _Block_object_dispose(v6, 8);
}

- (OS_dispatch_queue)accessQueue
{
  return self->_accessQueue;
}

- (void)setAccessQueue:(id)a3
{
  objc_setProperty_nonatomic(self, a2, a3, 24);
}

- (BOOL)smartCoverClosed
{
  return self->_smartCoverClosed;
}

- (void)setSmartCoverClosed:(BOOL)a3
{
  self->_smartCoverClosed = a3;
}

@end

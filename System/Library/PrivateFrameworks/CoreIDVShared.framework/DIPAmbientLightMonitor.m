@implementation DIPAmbientLightMonitor

- (DIPAmbientLightMonitor)init
{
  __IOHIDEventSystemClient *v3;
  NSObject *v4;
  OS_dispatch_queue *v5;
  OS_dispatch_queue *almQueue;
  const __CFArray *v7;
  const __CFArray *v8;
  const void *ValueAtIndex;
  uint64_t v10;
  const void *v11;
  DIPAmbientLightMonitor *v12;
  _QWORD v14[2];
  _QWORD v15[3];

  v15[2] = *MEMORY[0x1E0C80C00];
  self->_luxLevel = -1;
  v3 = (__IOHIDEventSystemClient *)IOHIDEventSystemClientCreateWithType();
  self->_client = v3;
  if (v3)
  {
    v14[0] = CFSTR("PrimaryUsagePage");
    v14[1] = CFSTR("PrimaryUsage");
    v15[0] = &unk_1E8CFA468;
    v15[1] = &unk_1E8CFA480;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v15, v14, 2);
    v4 = objc_claimAutoreleasedReturnValue();
    IOHIDEventSystemClientSetMatching();
    v5 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.CoreIDVShared.almQueue", 0);
    almQueue = self->_almQueue;
    self->_almQueue = v5;

    IOHIDEventSystemClientSetDispatchQueue();
    IOHIDEventSystemClientRegisterEventCallback();
    IOHIDEventSystemClientActivate();
    v7 = IOHIDEventSystemClientCopyServices(self->_client);
    if (v7)
    {
      v8 = v7;
      ValueAtIndex = CFArrayGetValueAtIndex(v7, 0);
      self->_service = (__IOHIDServiceClient *)CFRetain(ValueAtIndex);
      CFRelease(v8);
      v10 = IOHIDServiceClientCopyEvent();
      if (v10)
      {
        v11 = (const void *)v10;
        -[DIPAmbientLightMonitor handleEvent:](self, "handleEvent:", v10);
        CFRelease(v11);
      }
    }
    v12 = self;
  }
  else
  {
    v4 = os_log_create("com.apple.CoreIDV", "DIPAmbientLightMonitor");
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
      -[DIPAmbientLightMonitor init].cold.1(v4);
    v12 = 0;
  }

  return v12;
}

- (void)dealloc
{
  __IOHIDServiceClient *service;
  objc_super v4;

  if (self->_client)
  {
    IOHIDEventSystemClientCancel();
    CFRelease(self->_client);
  }
  service = self->_service;
  if (service)
    CFRelease(service);
  v4.receiver = self;
  v4.super_class = (Class)DIPAmbientLightMonitor;
  -[DIPAmbientLightMonitor dealloc](&v4, sel_dealloc);
}

- (void)handleEvent:(__IOHIDEvent *)a3
{
  if (a3)
  {
    if (IOHIDEventGetType() == 12)
      self->_luxLevel = IOHIDEventGetIntegerValue();
  }
}

- (int)luxLevel
{
  NSObject *almQueue;
  int v3;
  _QWORD v5[6];
  uint64_t v6;
  uint64_t *v7;
  uint64_t v8;
  int v9;

  v6 = 0;
  v7 = &v6;
  v8 = 0x2020000000;
  v9 = 0;
  almQueue = self->_almQueue;
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __34__DIPAmbientLightMonitor_luxLevel__block_invoke;
  v5[3] = &unk_1E8CD9E00;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(almQueue, v5);
  v3 = *((_DWORD *)v7 + 6);
  _Block_object_dispose(&v6, 8);
  return v3;
}

uint64_t __34__DIPAmbientLightMonitor_luxLevel__block_invoke(uint64_t result)
{
  *(_DWORD *)(*(_QWORD *)(*(_QWORD *)(result + 40) + 8) + 24) = *(_DWORD *)(*(_QWORD *)(result + 32) + 32);
  return result;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_almQueue, 0);
}

- (void)init
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_1CF917000, log, OS_LOG_TYPE_ERROR, "Failed to create HID Client Monitor, returning nil", v1, 2u);
}

@end

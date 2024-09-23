@implementation HIDUserDevice

- (HIDUserDevice)initWithProperties:(id)a3
{
  id v4;
  HIDUserDevice *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  uint64_t v9;
  HIDUserDevice *v10;
  objc_super v12;

  v4 = a3;
  v12.receiver = self;
  v12.super_class = (Class)HIDUserDevice;
  v5 = -[HIDUserDevice init](&v12, sel_init);
  if (!v5)
    goto LABEL_6;
  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HIDUserDeviceCreateInactive"));
  v6 = objc_claimAutoreleasedReturnValue();
  if (v6)
  {
    v7 = (void *)v6;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HIDUserDeviceCreateInactive"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "isEqual:", MEMORY[0x1E0C9AAB0]);

  }
  v9 = IOHIDUserDeviceCreateWithOptions();
  v5->_device = (__IOHIDUserDevice *)v9;
  if (v9)
  {
    v5->_service = IOHIDUserDeviceCopyService();
    v10 = v5;
  }
  else
  {
LABEL_6:
    v10 = 0;
  }

  return v10;
}

- (void)dealloc
{
  io_object_t service;
  __IOHIDUserDevice *device;
  objc_super v5;

  service = self->_service;
  if (service)
    IOObjectRelease(service);
  device = self->_device;
  if (device)
    CFRelease(device);
  v5.receiver = self;
  v5.super_class = (Class)HIDUserDevice;
  -[HIDUserDevice dealloc](&v5, sel_dealloc);
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@"), self->_device);
}

- (id)propertyForKey:(id)a3
{
  return (id)(id)IOHIDUserDeviceCopyProperty(self->_device, (CFStringRef)a3);
}

- (BOOL)setProperty:(id)a3 forKey:(id)a4
{
  return IOHIDUserDeviceSetProperty(self->_device, (CFStringRef)a4, a3) != 0;
}

- (void)setCancelHandler:(id)a3
{
  void *v4;
  id cancelHandler;

  v4 = _Block_copy(a3);
  cancelHandler = self->_cancelHandler;
  self->_cancelHandler = v4;

}

- (void)setDispatchQueue:(id)a3
{
  IOHIDUserDeviceSetDispatchQueue(self->_device, (dispatch_queue_t)a3);
}

- (void)activate
{
  __IOHIDUserDevice *device;
  _QWORD handler[5];

  device = self->_device;
  handler[0] = MEMORY[0x1E0C809B0];
  handler[1] = 3221225472;
  handler[2] = __25__HIDUserDevice_activate__block_invoke;
  handler[3] = &unk_1E94E7040;
  handler[4] = self;
  IOHIDUserDeviceSetCancelHandler(device, handler);
  IOHIDUserDeviceActivate(self->_device);
}

void __25__HIDUserDevice_activate__block_invoke(uint64_t a1)
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
  IOHIDUserDeviceCancel(self->_device);
}

- (void)setGetReportHandler:(id)a3
{
  id v4;
  void *v5;
  id getReportHandler;
  id v7;

  v4 = a3;
  if (self->_getReportHandler)
    -[HIDUserDevice setGetReportHandler:].cold.1();
  v7 = v4;
  v5 = _Block_copy(v4);
  getReportHandler = self->_getReportHandler;
  self->_getReportHandler = v5;

  IOHIDUserDeviceRegisterGetReportWithReturnLengthCallback();
}

- (void)setSetReportHandler:(id)a3
{
  id v4;
  void *v5;
  id setReportHandler;
  id v7;

  v4 = a3;
  if (self->_setReportHandler)
    -[HIDUserDevice setSetReportHandler:].cold.1();
  v7 = v4;
  v5 = _Block_copy(v4);
  setReportHandler = self->_setReportHandler;
  self->_setReportHandler = v5;

  IOHIDUserDeviceRegisterSetReportCallback();
}

- (BOOL)handleReport:(id)a3 error:(id *)a4
{
  id v5;
  uint64_t v6;
  int v7;

  v5 = objc_retainAutorelease(a3);
  objc_msgSend(v5, "bytes");
  objc_msgSend(v5, "length");

  v6 = IOHIDUserDeviceHandleReport();
  v7 = v6;
  if (a4 && (_DWORD)v6)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", v6);
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v7 == 0;
}

- (BOOL)handleReport:(id)a3 withTimestamp:(unint64_t)a4 error:(id *)a5
{
  __IOHIDUserDevice *device;
  id v8;
  const uint8_t *v9;
  CFIndex v10;
  uint64_t v11;
  int v12;

  device = self->_device;
  v8 = objc_retainAutorelease(a3);
  v9 = (const uint8_t *)objc_msgSend(v8, "bytes");
  v10 = objc_msgSend(v8, "length");

  v11 = IOHIDUserDeviceHandleReportWithTimeStamp(device, a4, v9, v10);
  v12 = v11;
  if (a5 && (_DWORD)v11)
  {
    objc_msgSend(MEMORY[0x1E0CB35C8], "errorWithIOReturn:", v11);
    *a5 = (id)objc_claimAutoreleasedReturnValue();
  }
  return v12 == 0;
}

- (unsigned)service
{
  return self->_service;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_cancelHandler, 0);
  objc_storeStrong(&self->_setReportHandler, 0);
  objc_storeStrong(&self->_getReportHandler, 0);
}

- (void)setGetReportHandler:.cold.1()
{
  _os_crash();
  __break(1u);
}

- (void)setSetReportHandler:.cold.1()
{
  const __CFAllocator *v0;
  CFIndex v1;
  const CFArrayCallBacks *v2;

  v0 = (const __CFAllocator *)_os_crash();
  __break(1u);
  CFArrayCreateMutable(v0, v1, v2);
}

@end

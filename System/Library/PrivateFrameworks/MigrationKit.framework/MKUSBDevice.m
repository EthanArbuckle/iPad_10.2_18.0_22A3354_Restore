@implementation MKUSBDevice

- (MKUSBDevice)init
{
  MKUSBDevice *v2;
  NSMutableArray *v3;
  NSMutableArray *endpoints;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MKUSBDevice;
  v2 = -[MKUSBDevice init](&v6, sel_init);
  if (v2)
  {
    v3 = (NSMutableArray *)objc_alloc_init(MEMORY[0x24BDBCEB8]);
    endpoints = v2->_endpoints;
    v2->_endpoints = v3;

  }
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  -[MKUSBDevice cancel](self, "cancel");
  v3.receiver = self;
  v3.super_class = (Class)MKUSBDevice;
  -[MKUSBDevice dealloc](&v3, sel_dealloc);
}

- (void)cancel
{
  MKUSBDevice *v2;
  __CFRunLoop *runloop;
  id WeakRetained;
  id *obj;

  v2 = self;
  objc_sync_enter(v2);
  runloop = v2->_runloop;
  if (runloop)
  {
    CFRunLoopStop(runloop);
    v2->_runloop = 0;
  }
  -[NSThread cancel](v2->_thread, "cancel");
  objc_sync_exit(v2);

  -[MKUSBDevice restore](v2, "restore");
  -[MKUSBDevice cleanup](v2, "cleanup");
  obj = v2;
  objc_sync_enter(obj);
  WeakRetained = objc_loadWeakRetained(obj + 8);
  objc_msgSend(WeakRetained, "deviceDidCancel:", obj);

  objc_msgSend(obj, "setDelegate:", 0);
  objc_sync_exit(obj);

}

- (void)run
{
  NSThread *v3;
  NSThread *thread;

  v3 = (NSThread *)objc_msgSend(objc_alloc(MEMORY[0x24BDD17F0]), "initWithTarget:selector:object:", self, sel_configure, 0);
  thread = self->_thread;
  self->_thread = v3;

  -[NSThread start](self->_thread, "start");
}

- (id)endpoints
{
  NSMutableArray *v3;
  uint64_t endpoints;
  uint64_t i;
  uint64_t v6;
  NSMutableArray *v7;
  MKUSBEndpoint *v8;
  void *v9;
  MKUSBEndpoint *v10;
  NSMutableArray *v11;
  int v13;

  v3 = self->_endpoints;
  objc_sync_enter(v3);
  if (!-[NSMutableArray count](self->_endpoints, "count"))
  {
    v13 = 0;
    endpoints = migrationkit::usb::device::interface::get_endpoints((migrationkit::usb::device::interface *)self->_interface, &v13);
    if (endpoints)
    {
      if (v13 >= 1)
      {
        for (i = 0; i < v13; ++i)
        {
          v6 = *(_QWORD *)(endpoints + 8 * i);
          v7 = self->_endpoints;
          v8 = [MKUSBEndpoint alloc];
          objc_msgSend(MEMORY[0x24BDD1968], "valueWithPointer:", v6);
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          v10 = -[MKUSBEndpoint initWithValue:](v8, "initWithValue:", v9);
          -[NSMutableArray addObject:](v7, "addObject:", v10);

        }
      }
    }
  }
  v11 = self->_endpoints;
  objc_sync_exit(v3);

  return v11;
}

- (int)read:(char *)a3 fromEndpoint:(id)a4
{
  id v6;
  void *v7;
  _QWORD *v8;

  v6 = a4;
  objc_msgSend(v6, "value");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = (_QWORD *)objc_msgSend(v7, "pointerValue");

  LODWORD(a3) = migrationkit::usb::device::interface::read((uint64_t)self->_interface, v8, (void **)a3);
  return (int)a3;
}

- (int)write:(char *)a3 length:(int)a4 toEndpoint:(id)a5
{
  id v8;
  void *v9;
  uint64_t v10;
  int v11;

  v8 = a5;
  objc_msgSend(v8, "value");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = objc_msgSend(v9, "pointerValue");

  v11 = migrationkit::usb::device::interface::write((uint64_t)self->_interface, v10, a3, a4);
  return v11;
}

- (void)configure
{
  uint64_t v3;
  void *v4;
  void *v5;
  void *v6;
  id v7;
  __IOUSBDeviceDescription *v8;
  __IOUSBDeviceDescription *v9;
  __IOUSBDeviceController *v10;
  __CFRunLoop **v11;
  id WeakRetained;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x24BDAC8D0];
  if (IOUSBDeviceControllerCreate())
  {
    v3 = 1;
  }
  else
  {
    v8 = -[MKUSBDevice copyCurrentDescription:](self, "copyCurrentDescription:", self->_controller);
    self->_previousDescription = v8;
    if (v8)
    {
      v9 = -[MKUSBDevice createMigrationDescription:](self, "createMigrationDescription:", self->_controller);
      self->_migrationDescription = v9;
      if (v9)
      {
        v11 = migrationkit::usb::device::interface::create((migrationkit::usb::device::interface *)self->_controller, v10);
        self->_interface = (interface *)v11;
        if (v11)
        {
          migrationkit::usb::device::interface::set_state_callback((uint64_t)v11, (uint64_t)self, (uint64_t)device_interface_state_callback);
          if (IOUSBDeviceControllerSetDescription())
          {
            v3 = 5;
          }
          else
          {
            if (!IOUSBDeviceControllerGoOffAndOnBus())
            {
              WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
              objc_msgSend(WeakRetained, "deviceDidOpen:", self);

              self->_runloop = CFRunLoopGetCurrent();
              CFRunLoopRun();
              goto LABEL_4;
            }
            v3 = 6;
          }
        }
        else
        {
          v3 = 4;
        }
      }
      else
      {
        v3 = 3;
      }
    }
    else
    {
      v3 = 2;
    }
  }
  v4 = (void *)MEMORY[0x24BDD1540];
  v13 = *MEMORY[0x24BDD0FC8];
  v14[0] = CFSTR("MKUSBDevice could not initialize because an underlying issue occurred unexpectedly.");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "errorWithDomain:code:userInfo:", CFSTR("MKUSBDeviceErrorDomain"), v3, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  v7 = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(v7, "device:didFail:", self, v6);

  -[MKUSBDevice setDelegate:](self, "setDelegate:", 0);
LABEL_4:
  -[MKUSBDevice cancel](self, "cancel");
}

- (void)restore
{
  MKUSBDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MKUSBDevice _restore](obj, "_restore");
  objc_sync_exit(obj);

}

- (void)_restore
{
  if (self->_controller && self->_previousDescription)
  {
    if (!IOUSBDeviceControllerSetDescription())
      IOUSBDeviceControllerGoOffAndOnBus();
    -[MKUSBDevice cleanup](self, "cleanup");
  }
}

- (void)cleanup
{
  MKUSBDevice *obj;

  obj = self;
  objc_sync_enter(obj);
  -[MKUSBDevice _cleanup](obj, "_cleanup");
  objc_sync_exit(obj);

}

- (void)_cleanup
{
  __CFRunLoop **interface;
  interface *v4;
  __IOUSBDeviceDescription *migrationDescription;
  __IOUSBDeviceDescription *previousDescription;
  __IOUSBDeviceController *controller;

  interface = (__CFRunLoop **)self->_interface;
  if (interface)
  {
    migrationkit::usb::device::interface::stop(interface);
    migrationkit::usb::device::interface::close((migrationkit::usb::device::interface *)self->_interface);
    v4 = self->_interface;
    if (v4)
      MEMORY[0x2207B9754](v4, 0x10A0C403D4A21E0);
    self->_interface = 0;
  }
  migrationDescription = self->_migrationDescription;
  if (migrationDescription)
  {
    CFRelease(migrationDescription);
    self->_migrationDescription = 0;
  }
  previousDescription = self->_previousDescription;
  if (previousDescription)
  {
    CFRelease(previousDescription);
    self->_previousDescription = 0;
  }
  controller = self->_controller;
  if (controller)
  {
    CFRelease(controller);
    self->_controller = 0;
  }
}

- (__IOUSBDeviceDescription)copyCurrentDescription:(__IOUSBDeviceController *)a3
{
  __IOUSBDeviceDescription *v3;

  v3 = (__IOUSBDeviceDescription *)IOUSBDeviceDescriptionCreateFromController();
  if (v3)
    IOUSBDeviceDescriptionSetAllowOverride();
  return v3;
}

- (__IOUSBDeviceDescription)createMigrationDescription:(__IOUSBDeviceController *)a3
{
  __IOUSBDeviceDescription *v3;

  v3 = (__IOUSBDeviceDescription *)IOUSBDeviceDescriptionCreateFromController();
  if (v3)
  {
    IOUSBDeviceDescriptionRemoveAllConfigurations();
    if (IOUSBDeviceDescriptionAppendConfiguration()
      || IOUSBDeviceDescriptionAppendInterfaceToConfiguration())
    {
      CFRelease(v3);
      return 0;
    }
    else
    {
      IOUSBDeviceDescriptionSetAllowOverride();
      IOUSBDeviceDescriptionSetVendorID();
      IOUSBDeviceDescriptionSetProductID();
    }
  }
  return v3;
}

- (void)interfaceDidChangeState:(int)a3
{
  unsigned __int8 v3;
  id WeakRetained;

  v3 = a3;
  WeakRetained = objc_loadWeakRetained((id *)&self->_delegate);
  objc_msgSend(WeakRetained, "device:didChangeState:", self, v3);

}

- (MKUSBDeviceDelegate)delegate
{
  return (MKUSBDeviceDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_delegate);
  objc_storeStrong((id *)&self->_endpoints, 0);
  objc_storeStrong((id *)&self->_thread, 0);
}

@end

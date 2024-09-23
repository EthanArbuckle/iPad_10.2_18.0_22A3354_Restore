@implementation CMIndoorOutdoorManagerInternal

- (CMIndoorOutdoorManagerInternal)init
{
  id v2;
  uint64_t v3;
  void *__p[2];
  char v6;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)CMIndoorOutdoorManagerInternal;
  v2 = -[CMIndoorOutdoorManagerInternal init](&v7, sel_init);
  if (v2)
  {
    *((_QWORD *)v2 + 1) = dispatch_queue_create("com.apple.CoreMotion.CMIndoorOutdoor.InternalQueue", 0);
    v3 = operator new();
    sub_18F270374(__p, "com.apple.locationd.registration");
    MEMORY[0x19400100C](v3, __p, *((_QWORD *)v2 + 1));
    *((_QWORD *)v2 + 4) = v3;
    if (v6 < 0)
      operator delete(__p[0]);
    CLConnectionClient::setDefaultMessageHandler();
    CLConnectionClient::setInterruptionHandler();
    CLConnectionClient::start(*((CLConnectionClient **)v2 + 4));
  }
  return (CMIndoorOutdoorManagerInternal *)v2;
}

- (void)dealloc
{
  objc_super v3;

  dispatch_release((dispatch_object_t)self->_internalQueue);
  self->_internalQueue = 0;
  v3.receiver = self;
  v3.super_class = (Class)CMIndoorOutdoorManagerInternal;
  -[CMIndoorOutdoorManagerInternal dealloc](&v3, sel_dealloc);
}

- (void)_teardown
{
  uint64_t v3;
  void *__p;
  char v5;

  sub_18F270374(&__p, "kCLConnectionMessageIndoorOutdoorUpdate");
  CLConnectionClient::setHandlerForMessage();
  if (v5 < 0)
    operator delete(__p);
  if (self->_connection)
  {
    v3 = MEMORY[0x194001018]();
    MEMORY[0x194001438](v3, 0xB0C40BC2CC919);
  }
  self->_connection = 0;
}

- (void)_startIndoorOutdoorUpdates
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3C48E0;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_async(internalQueue, block);
}

- (void)_stopIndoorOutdoorUpdates
{
  NSObject *internalQueue;
  _QWORD block[5];

  internalQueue = self->_internalQueue;
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F3C4E90;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(internalQueue, block);
}

- (void)_lastKnownIndoorOutdoorStateWithHandler:(id)a3
{
  NSObject *internalQueue;
  _QWORD v4[6];

  internalQueue = self->_internalQueue;
  v4[0] = MEMORY[0x1E0C809B0];
  v4[1] = 3221225472;
  v4[2] = sub_18F3C51EC;
  v4[3] = &unk_1E2955B38;
  v4[4] = self;
  v4[5] = a3;
  dispatch_async(internalQueue, v4);
}

@end

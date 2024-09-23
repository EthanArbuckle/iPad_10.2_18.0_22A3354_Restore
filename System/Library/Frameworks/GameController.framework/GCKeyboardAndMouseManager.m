@implementation GCKeyboardAndMouseManager

+ (GCKeyboardAndMouseManager)managerWithQueue:(id)a3
{
  id v3;
  objc_class *v4;
  void *v5;

  v3 = a3;
  v4 = NSClassFromString(CFSTR("GCKeyboardAndMouseManagerImpl"));
  if (!v4)
    v4 = (objc_class *)objc_opt_class();
  v5 = (void *)objc_msgSend([v4 alloc], "initWithQueue:", v3);

  return (GCKeyboardAndMouseManager *)v5;
}

- (GCKeyboardAndMouseManager)initWithQueue:(id)a3
{
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)GCKeyboardAndMouseManager;
  return -[GCKeyboardAndMouseManager init](&v4, sel_init, a3);
}

- (GCKeyboardAndMouseManager)init
{
  dispatch_queue_t v3;
  GCKeyboardAndMouseManager *v4;

  v3 = dispatch_queue_create("GCKeyboardAndMouseManager", MEMORY[0x24BDAC9C0]);
  v4 = -[GCKeyboardAndMouseManager initWithQueue:](self, "initWithQueue:", v3);

  return v4;
}

- (id)coalescedKeyboard
{
  return 0;
}

- (id)mice
{
  return (id)MEMORY[0x24BDBD1A8];
}

- (GCMouse)currentMouse
{
  return 0;
}

- (BOOL)addDeviceWithServiceRef:(__IOHIDServiceClient *)a3
{
  return 0;
}

- (BOOL)handleHIDEvent:(__IOHIDEvent *)a3
{
  return 0;
}

- (int)emulatedControllerMapping
{
  return self->_emulatedControllerMapping;
}

- (void)setEmulatedControllerMapping:(int)a3
{
  self->_emulatedControllerMapping = a3;
}

@end

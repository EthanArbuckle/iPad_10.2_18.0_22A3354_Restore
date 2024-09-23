@implementation _GCGenericPhysicalDevicePending(GameController)

- (_GCDefaultPhysicalDevice)_onqueue_createDeviceWithModel:()GameController service:
{
  id v6;
  id v7;
  _GCDefaultPhysicalDevice *v8;
  void *v9;
  _GCDefaultPhysicalDevice *v10;

  v6 = a4;
  v7 = a3;
  v8 = [_GCDefaultPhysicalDevice alloc];
  objc_msgSend(a1, "manager");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = -[_GCDefaultPhysicalDevice initWithHIDDevice:manager:](v8, "initWithHIDDevice:manager:", v6, v9);

  -[_GCDefaultPhysicalDevice setDelegate:](v10, "setDelegate:", v7);
  objc_setAssociatedObject(v10, "Model", v7, (void *)0x301);

  return v10;
}

@end

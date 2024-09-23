@implementation IFDeviceInfo

+ (id)sharedInstance
{
  if (sharedInstance_onceToken != -1)
    dispatch_once(&sharedInstance_onceToken, &__block_literal_global);
  return (id)sharedInstance_sharedInstance;
}

void __30__IFDeviceInfo_sharedInstance__block_invoke()
{
  IFDeviceInfo *v0;
  void *v1;

  v0 = objc_alloc_init(IFDeviceInfo);
  v1 = (void *)sharedInstance_sharedInstance;
  sharedInstance_sharedInstance = (uint64_t)v0;

}

- (IFDeviceInfo)init
{
  IFDeviceInfo *v2;
  void *v3;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)IFDeviceInfo;
  v2 = -[IFDeviceInfo init](&v5, sel_init);
  if (v2)
  {
    v3 = (void *)MGCopyAnswer();
    v2->_deviceClass = objc_msgSend(v3, "intValue");

  }
  return v2;
}

- (int)deviceClass
{
  return self->_deviceClass;
}

@end

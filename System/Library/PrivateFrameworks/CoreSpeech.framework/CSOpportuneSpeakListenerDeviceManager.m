@implementation CSOpportuneSpeakListenerDeviceManager

- (NSString)deviceId
{
  return self->_deviceId;
}

- (void)setDeviceId:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 8);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_deviceId, 0);
}

+ (id)sharedManager
{
  if (sharedManager_onceToken != -1)
    dispatch_once(&sharedManager_onceToken, &__block_literal_global_6170);
  return (id)sharedManager_sharedManager;
}

void __54__CSOpportuneSpeakListenerDeviceManager_sharedManager__block_invoke()
{
  CSOpportuneSpeakListenerDeviceManager *v0;
  void *v1;

  v0 = objc_alloc_init(CSOpportuneSpeakListenerDeviceManager);
  v1 = (void *)sharedManager_sharedManager;
  sharedManager_sharedManager = (uint64_t)v0;

}

@end

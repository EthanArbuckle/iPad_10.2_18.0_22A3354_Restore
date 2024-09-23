@implementation CMDeviceOrientationManagerInternal

- (CMDeviceOrientationManagerInternal)init
{
  CMDeviceOrientationManagerInternal *result;
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMDeviceOrientationManagerInternal;
  result = -[CMDeviceOrientationManagerInternal init](&v3, sel_init);
  if (result)
  {
    result->fSampleLock._os_unfair_lock_opaque = 0;
    *(_OWORD *)&result->fDeviceOrientationDispatcher = 0u;
    *(_OWORD *)&result->fDeviceOrientationQueue = 0u;
    result->fDidSignalSemaphore = 1;
    result->fOrientationCallbackMode = -1;
    result->fEnableOrientationNotification = 0;
    result->fLatestDeviceOrientationSample.timestamp = -1.0;
    result->fLatestDeviceOrientationSample.acceleration.x = 0.0;
    *(_OWORD *)&result->fLatestDeviceOrientationSample.acceleration.z = *(_OWORD *)&result->fLatestDeviceOrientationSample.timestamp;
  }
  return result;
}

- (void)dealloc
{
  objc_super v2;

  v2.receiver = self;
  v2.super_class = (Class)CMDeviceOrientationManagerInternal;
  -[CMDeviceOrientationManagerInternal dealloc](&v2, sel_dealloc);
}

@end

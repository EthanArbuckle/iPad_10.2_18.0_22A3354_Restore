@implementation NotificationCallback

void __NotificationCallback_block_invoke()
{
  void *v0;
  void *v1;

  objc_msgSend((id)_currentControllerInstance, "forcePushDetailViewForDevice:", _currentBTSDevice);
  v0 = (void *)_currentControllerInstance;
  _currentControllerInstance = 0;

  v1 = (void *)_currentBTSDevice;
  _currentBTSDevice = 0;

}

@end

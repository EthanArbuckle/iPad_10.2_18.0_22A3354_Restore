@implementation ComponentCameraRear

- (id)serialNumberComponentPropertyKey
{
  return CFSTR("BackCameraModuleSerialNumString");
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end

@implementation ComponentCameraRearSuperWide

- (BOOL)isPresent
{
  void *v2;
  uint64_t v3;
  BOOL result;

  v2 = (void *)objc_claimAutoreleasedReturnValue(-[ComponentCameraBase IORegClassName](self, "IORegClassName"));

  result = MGGetBoolAnswer(CFSTR("hnXJ1OpiiIL0+p3jUG/XxQ"), v3);
  if (!v2)
    return 0;
  return result;
}

- (id)serialNumberComponentPropertyKey
{
  return CFSTR("BackSuperWideCameraModuleSerialNumString");
}

- (int64_t)cameraModuleType
{
  return 1;
}

@end

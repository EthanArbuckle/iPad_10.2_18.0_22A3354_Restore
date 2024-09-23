@implementation DEDBugSession(EasyDevice)

- (id)deviceFromManager:()EasyDevice
{
  id v4;
  void *v5;
  void *v6;

  v4 = a3;
  objc_msgSend(a1, "deviceIdentifier");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  deviceWithIdentifier(v5, v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

@end

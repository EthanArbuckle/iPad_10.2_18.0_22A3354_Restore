@implementation DADevice(DeviceMembership)

- (BOOL)isKnown
{
  void *v2;
  void *v3;
  _BOOL8 v4;

  objc_msgSend(a1, "bluetoothIdentifier");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "networkEndpoint");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = v3 != 0;

  }
  else
  {
    v4 = 1;
  }

  return v4;
}

@end

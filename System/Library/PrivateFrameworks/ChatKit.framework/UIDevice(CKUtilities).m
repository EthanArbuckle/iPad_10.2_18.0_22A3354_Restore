@implementation UIDevice(CKUtilities)

+ (uint64_t)__ck_currentDeviceIsPadOrMac
{
  _BOOL8 v2;
  void *v3;

  if ((objc_msgSend(a1, "__ck_currentDeviceIsMac") & 1) != 0)
    return 1;
  objc_msgSend(a1, "currentDevice");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v3, "userInterfaceIdiom") == 1;

  return v2;
}

+ (BOOL)__ck_currentDeviceIsMac
{
  void *v1;
  _BOOL8 v2;

  objc_msgSend(a1, "currentDevice");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = objc_msgSend(v1, "userInterfaceIdiom") == 5;

  return v2;
}

@end

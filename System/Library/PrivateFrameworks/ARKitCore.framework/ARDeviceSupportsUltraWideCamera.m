@implementation ARDeviceSupportsUltraWideCamera

void __ARDeviceSupportsUltraWideCamera_block_invoke()
{
  int v0;
  id v1;

  v1 = (id)MGCopyAnswer();
  v0 = objc_msgSend(v1, "BOOLValue");
  if (v0)
    LOBYTE(v0) = +[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.imagesensor.back.ultrawide.enabled"));
  ARDeviceSupportsUltraWideCamera_ultraWideAvailable = v0;

}

@end

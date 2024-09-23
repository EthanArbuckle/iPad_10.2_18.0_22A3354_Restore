@implementation ARFaceTrackingDevice

void __ARFaceTrackingDevice_block_invoke()
{
  id *v0;

  if (ARRGBFaceTrackingEnabled_onceToken[0] != -1)
    dispatch_once(ARRGBFaceTrackingEnabled_onceToken, &__block_literal_global_90);
  if (!ARRGBFaceTrackingEnabled_faceTrackingEnabled)
    goto LABEL_7;
  if (ARPearlCameraSupported_onceToken != -1)
    dispatch_once(&ARPearlCameraSupported_onceToken, &__block_literal_global_47);
  if (!ARPearlCameraSupported_supported)
    v0 = (id *)MEMORY[0x1E0C89FA0];
  else
LABEL_7:
    v0 = (id *)MEMORY[0x1E0C89F90];
  objc_storeStrong((id *)&ARFaceTrackingDevice_deviceType, *v0);
}

@end

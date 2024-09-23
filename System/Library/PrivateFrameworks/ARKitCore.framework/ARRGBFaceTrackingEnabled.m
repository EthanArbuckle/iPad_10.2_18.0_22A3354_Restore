@implementation ARRGBFaceTrackingEnabled

void __ARRGBFaceTrackingEnabled_block_invoke()
{
  BOOL v0;

  if (+[ARKitUserDefaults BOOLForKey:](ARKitUserDefaults, "BOOLForKey:", CFSTR("com.apple.arkit.faceTracking.rgbOnly.enabled")))
  {
    if (ARAppleNeuralEngine_onceToken[0] != -1)
      dispatch_once(ARAppleNeuralEngine_onceToken, &__block_literal_global_57);
    v0 = s_deviceSupportsANE != 0;
  }
  else
  {
    v0 = 0;
  }
  ARRGBFaceTrackingEnabled_faceTrackingEnabled = v0;
}

@end

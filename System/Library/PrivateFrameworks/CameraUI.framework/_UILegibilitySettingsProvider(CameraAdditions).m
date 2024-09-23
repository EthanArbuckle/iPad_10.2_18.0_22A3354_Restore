@implementation _UILegibilitySettingsProvider(CameraAdditions)

- (void)cam_primeForUseWithCameraOverlays
{
  id v2;

  objc_msgSend(MEMORY[0x1E0DC3658], "colorWithWhite:alpha:", 0.7, 1.0);
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "clearContentColorAccumulator");
  objc_msgSend(a1, "accumulateChangesToContentColor:", v2);

}

@end

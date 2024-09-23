@implementation HFCameraSignificantEventConfiguration(HUAdditions)

+ (uint64_t)defaultNotificationAnyMotionIsDetected
{
  return objc_msgSend(MEMORY[0x1E0D31268], "configurationWithEventTypes:personFamiliarityOptions:", 0, 0);
}

@end

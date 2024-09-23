@implementation ComponentAudioVibrationMotor

- (BOOL)isPresent
{
  return findDeviceWithName("vibrator");
}

@end

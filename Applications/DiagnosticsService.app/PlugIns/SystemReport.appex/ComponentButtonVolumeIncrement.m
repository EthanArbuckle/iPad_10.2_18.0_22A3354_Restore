@implementation ComponentButtonVolumeIncrement

- (BOOL)isPresent
{
  return MGGetBoolAnswer(CFSTR("volume-buttons"), a2);
}

@end

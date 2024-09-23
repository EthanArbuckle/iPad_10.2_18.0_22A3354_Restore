@implementation CLSEIEvent

- (NSTimeZone)timeZone
{
  uint64_t v2;

  v2 = -[CLSEIEvent timeZoneOffset](self, "timeZoneOffset");
  return (NSTimeZone *)objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneForSecondsFromGMT:", v2);
}

@end

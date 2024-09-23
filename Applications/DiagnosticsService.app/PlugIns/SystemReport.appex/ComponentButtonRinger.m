@implementation ComponentButtonRinger

- (BOOL)isPresent
{
  char v2;
  uint64_t v3;

  v2 = MGGetBoolAnswer(CFSTR("ringer-switch"), a2);
  return v2 & ~MGGetBoolAnswer(CFSTR("cT44WE1EohiwRzhsZ8xEsw"), v3);
}

@end

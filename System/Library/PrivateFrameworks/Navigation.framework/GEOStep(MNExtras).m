@implementation GEOStep(MNExtras)

- (BOOL)maneuverIsTakeNthExitAtRoundabout
{
  return objc_msgSend(a1, "maneuverType") - 41 < 0x13;
}

@end

@implementation GDConnectedToPower

+ (BOOL)connectedToPower
{
  return IOPSGetTimeRemainingEstimate() == -2.0;
}

@end

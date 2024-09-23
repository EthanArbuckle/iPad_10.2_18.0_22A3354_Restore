@implementation PRNotifyEvents

+ (BOOL)notifyIncomingCallAction:(id)a3
{
  NSLog(CFSTR("PRNotifyEvents: notifyIncomingCallAction, no longer active"), a2, a3);
  return 1;
}

@end

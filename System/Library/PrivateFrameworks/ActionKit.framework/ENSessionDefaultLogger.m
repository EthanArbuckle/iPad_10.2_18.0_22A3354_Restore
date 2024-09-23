@implementation ENSessionDefaultLogger

- (void)evernoteLogInfoString:(id)a3
{
  NSLog(CFSTR("ENSDK: %@"), a2, a3);
}

- (void)evernoteLogErrorString:(id)a3
{
  NSLog(CFSTR("ENSDK ERROR: %@"), a2, a3);
}

@end

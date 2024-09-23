@implementation NFRestoreService

- (BOOL)canRun
{
  if ((NFProductIsDevBoard() & 1) == 0)
    IOPSGetPercentRemaining();
  return 1;
}

- (id)serviceName
{
  return CFSTR("com.apple.stockholm.services.NFRestoreService");
}

@end

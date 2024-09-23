@implementation DTOSLogLoaderTicket

- (BOOL)needsHold
{
  return 1;
}

- (void)holdAgent:(id)a3 loader:(id)a4
{
  objc_msgSend(a4, "_welcomeAgent:", a3);
}

@end

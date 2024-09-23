@implementation AFUIPasscodeViewFactory

+ (id)lockView
{
  return (id)objc_msgSend(MEMORY[0x24BEB0F80], "passcodeLockViewForUsersCurrentStyle");
}

@end

@implementation IDSXPCFirewallInterface

+ (id)interface
{
  if (qword_1ECDD64B0 != -1)
    dispatch_once(&qword_1ECDD64B0, &unk_1E2C5FE30);
  return (id)qword_1ECDD6540;
}

@end

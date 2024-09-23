@implementation IDSXPCDaemonInterface

+ (id)interface
{
  if (qword_1ECDD6468 != -1)
    dispatch_once(&qword_1ECDD6468, &unk_1E2C5F950);
  return (id)qword_1ECDD64F8;
}

@end

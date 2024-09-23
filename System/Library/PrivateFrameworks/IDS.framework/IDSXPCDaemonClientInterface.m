@implementation IDSXPCDaemonClientInterface

+ (id)interface
{
  if (qword_1EE1E1FC0 != -1)
    dispatch_once(&qword_1EE1E1FC0, &unk_1E2C5F610);
  return (id)qword_1EE1E1FB8;
}

@end

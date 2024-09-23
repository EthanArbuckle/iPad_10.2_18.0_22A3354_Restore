@implementation IDSXPCActivityMonitorInterface

+ (id)interface
{
  if (qword_1ECDD6498 != -1)
    dispatch_once(&qword_1ECDD6498, &unk_1E2C5FD90);
  return (id)qword_1ECDD6528;
}

@end

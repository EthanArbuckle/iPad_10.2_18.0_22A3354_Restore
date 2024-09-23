@implementation IDSXPCOffGridStateManagerInterface

+ (id)interface
{
  if (qword_1ECDD6478 != -1)
    dispatch_once(&qword_1ECDD6478, &unk_1E2C5FAB0);
  return (id)qword_1ECDD6508;
}

@end

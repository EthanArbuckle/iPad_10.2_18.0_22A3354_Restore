@implementation IDSXPCServerMessagingInterface

+ (id)interface
{
  if (qword_1ECDD64B8 != -1)
    dispatch_once(&qword_1ECDD64B8, &unk_1E2C5FE70);
  return (id)qword_1ECDD6548;
}

@end

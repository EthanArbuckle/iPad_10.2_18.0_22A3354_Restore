@implementation IDSXPCBAASignerInterface

+ (id)interface
{
  if (qword_1ECDD64A8 != -1)
    dispatch_once(&qword_1ECDD64A8, &unk_1E2C5FE10);
  return (id)qword_1ECDD6538;
}

@end

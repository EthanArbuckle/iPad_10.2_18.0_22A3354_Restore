@implementation IDSXPCInternalTestingInterface

+ (id)interface
{
  if (qword_1ECDD6438 != -1)
    dispatch_once(&qword_1ECDD6438, &unk_1E2C5F6F0);
  return (id)qword_1ECDD64C8;
}

@end

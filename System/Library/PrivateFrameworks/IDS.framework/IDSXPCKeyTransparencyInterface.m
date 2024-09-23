@implementation IDSXPCKeyTransparencyInterface

+ (id)interface
{
  if (qword_1ECDD6440 != -1)
    dispatch_once(&qword_1ECDD6440, &unk_1E2C5F730);
  return (id)qword_1ECDD64D0;
}

@end

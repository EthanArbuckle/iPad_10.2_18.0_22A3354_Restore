@implementation IDSXPCRegistrationInterface

+ (id)interface
{
  if (qword_1ECDD6450 != -1)
    dispatch_once(&qword_1ECDD6450, &unk_1E2C5F7B0);
  return (id)qword_1ECDD64E0;
}

@end

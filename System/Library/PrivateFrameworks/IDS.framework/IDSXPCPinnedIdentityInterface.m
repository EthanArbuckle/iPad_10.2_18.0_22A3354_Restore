@implementation IDSXPCPinnedIdentityInterface

+ (id)interface
{
  if (qword_1ECDD6458 != -1)
    dispatch_once(&qword_1ECDD6458, &unk_1E2C5F910);
  return (id)qword_1ECDD64E8;
}

@end

@implementation IDSXPCFeatureTogglerInterface

+ (id)interface
{
  if (qword_1ECDD64A0 != -1)
    dispatch_once(&qword_1ECDD64A0, &unk_1E2C5FDB0);
  return (id)qword_1ECDD6530;
}

@end

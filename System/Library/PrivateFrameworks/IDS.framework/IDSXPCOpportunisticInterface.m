@implementation IDSXPCOpportunisticInterface

+ (id)interface
{
  if (qword_1ECDD6490 != -1)
    dispatch_once(&qword_1ECDD6490, &unk_1E2C5FD30);
  return (id)qword_1ECDD6520;
}

@end

@implementation IDSXPCOffGridMessengerInterface

+ (id)interface
{
  if (qword_1ECDD6470 != -1)
    dispatch_once(&qword_1ECDD6470, &unk_1E2C5FA90);
  return (id)qword_1ECDD6500;
}

@end

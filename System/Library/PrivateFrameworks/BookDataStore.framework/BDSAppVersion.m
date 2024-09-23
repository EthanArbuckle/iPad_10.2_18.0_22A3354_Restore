@implementation BDSAppVersion

+ (id)appVersion
{
  if (qword_25592A4F8 != -1)
    dispatch_once(&qword_25592A4F8, &unk_24F08A4B0);
  return (id)qword_25592A4F0;
}

@end

@implementation IMAppleStoreHelper

+ (BOOL)isInAppleStoreDemoMode
{
  if (qword_1ECFC7398 != -1)
    dispatch_once(&qword_1ECFC7398, &unk_1E3FB3CA8);
  return byte_1EE503DD0;
}

@end

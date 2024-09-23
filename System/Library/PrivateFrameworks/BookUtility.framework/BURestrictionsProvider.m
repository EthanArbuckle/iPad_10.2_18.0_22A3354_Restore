@implementation BURestrictionsProvider

+ (BURestrictionsProviding)sharedInstance
{
  if (qword_253DB25C8 != -1)
    dispatch_once(&qword_253DB25C8, &unk_24CED9FA8);
  return (BURestrictionsProviding *)(id)qword_253DB25D0;
}

@end

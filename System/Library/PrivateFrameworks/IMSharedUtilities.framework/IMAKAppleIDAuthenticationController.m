@implementation IMAKAppleIDAuthenticationController

+ (NSString)IMAKUserInfoChangedNotification
{
  if (qword_1EE504620 != -1)
    dispatch_once(&qword_1EE504620, &unk_1E3FB3E28);
  return (NSString *)(id)qword_1EE504618;
}

+ (NSString)IMAKUserInfoChangedAltDSIDKey
{
  if (qword_1EE504630 != -1)
    dispatch_once(&qword_1EE504630, &unk_1E3FB43C8);
  return (NSString *)(id)qword_1EE504628;
}

+ (NSString)IMAKUserInfoChangedSecurityLevelKey
{
  if (qword_1EE504640[0] != -1)
    dispatch_once(qword_1EE504640, &unk_1E3FB45E8);
  return (NSString *)(id)qword_1EE504638;
}

@end

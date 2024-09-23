@implementation CLSPerson(CRKReverseConformance)

- (BOOL)isAccountFailedPasswordLocked
{
  return objc_msgSend(a1, "axmAccountStatus") == 4;
}

- (BOOL)isAccountATOLocked
{
  return objc_msgSend(a1, "axmAccountStatus") == 3;
}

@end

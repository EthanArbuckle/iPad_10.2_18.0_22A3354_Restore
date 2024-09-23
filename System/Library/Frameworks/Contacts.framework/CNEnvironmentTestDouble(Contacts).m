@implementation CNEnvironmentTestDouble(Contacts)

- (uint64_t)setNicknameProvider:()Contacts
{
  return objc_msgSend(a1, "setValue:forKey:", a3, CFSTR("nickname-provider"));
}

@end

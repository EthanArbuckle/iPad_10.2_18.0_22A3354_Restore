@implementation CNEnvironment(Contacts)

- (uint64_t)nicknameProvider
{
  return objc_msgSend(a1, "valueForKey:onCacheMiss:", CFSTR("nickname-provider"), &__block_literal_global_25);
}

@end

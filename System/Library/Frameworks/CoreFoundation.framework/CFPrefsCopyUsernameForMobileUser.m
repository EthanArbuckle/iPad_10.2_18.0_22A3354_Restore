@implementation CFPrefsCopyUsernameForMobileUser

CFStringRef ___CFPrefsCopyUsernameForMobileUser_block_invoke()
{
  passwd *v0;
  CFStringRef result;

  v0 = getpwnam("mobile");
  result = CFStringCreateWithCString((CFAllocatorRef)&__kCFAllocatorSystemDefault, v0->pw_name, 0x8000100u);
  _CFPrefsCopyUsernameForMobileUser_mobileUserName = (uint64_t)result;
  return result;
}

@end

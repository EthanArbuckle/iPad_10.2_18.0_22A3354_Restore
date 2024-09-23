@implementation AALocalContactInfo(AppleAccountSettings)

- (BOOL)shouldGrayOutContactRow
{
  return (objc_msgSend(a1, "contactType") & 1) != 0
      && ((objc_msgSend(a1, "trustedContactStatus") - 1) & 0xFFFFFFFFFFFFFFFDLL) == 0;
}

@end

@implementation CNContact(SuggestedHandler)

- (id)suggestedHandle
{
  return objc_getAssociatedObject(a1, CFSTR("GK_CNCONTACT_SUGGESTED_HANDLE_KEY"));
}

- (void)setSuggestedHandle:()SuggestedHandler
{
  objc_setAssociatedObject(a1, CFSTR("GK_CNCONTACT_SUGGESTED_HANDLE_KEY"), a3, (void *)0x301);
}

@end

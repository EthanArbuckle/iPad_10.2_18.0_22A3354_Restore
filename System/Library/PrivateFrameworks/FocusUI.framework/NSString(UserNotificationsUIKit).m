@implementation NSString(UserNotificationsUIKit)

- (BOOL)fcui_containsExcessiveLineHeightCharacters
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(MEMORY[0x24BEBB520], "fcui_excessiveLineHeightChars");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(a1, "rangeOfCharacterFromSet:", v2) != 0x7FFFFFFFFFFFFFFFLL;

  return v3;
}

@end

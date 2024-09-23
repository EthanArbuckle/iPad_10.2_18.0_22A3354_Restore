@implementation NSMutableAttributedString(MFUtilities)

- (void)mf_addAttribute:()MFUtilities value:
{
  id v6;
  id v7;

  v7 = a3;
  v6 = a4;
  objc_msgSend(a1, "addAttribute:value:range:", v7, v6, 0, objc_msgSend(a1, "length"));

}

- (void)mf_removeAttribute:()MFUtilities
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "removeAttribute:range:", v4, 0, objc_msgSend(a1, "length"));

}

- (void)mf_setString:()MFUtilities
{
  id v4;

  v4 = a3;
  objc_msgSend(a1, "replaceCharactersInRange:withString:", 0, objc_msgSend(a1, "length"), v4);

}

@end

@implementation UITraitCollection(ForCoreChatController)

- (BOOL)ck_chatItemLayoutNeedsInvalidationForPreviousTraitCollection:()ForCoreChatController
{
  id v4;
  uint64_t v5;
  _BOOL8 v6;
  uint64_t v7;

  v4 = a3;
  v5 = objc_msgSend(a1, "userInterfaceStyle");
  if (v5 == objc_msgSend(v4, "userInterfaceStyle"))
  {
    if (objc_msgSend(a1, "userInterfaceStyle") == 1)
    {
      v6 = 0;
    }
    else
    {
      v7 = objc_msgSend(a1, "userInterfaceLevel");
      v6 = v7 != objc_msgSend(v4, "userInterfaceLevel");
    }
  }
  else
  {
    v6 = 1;
  }

  return v6;
}

@end

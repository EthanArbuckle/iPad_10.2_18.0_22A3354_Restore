@implementation ACAccount(AccountsUI)

- (id)displayUsername
{
  id v3;
  id v4;
  id v5[2];
  id v6;

  v6 = a1;
  v5[1] = a2;
  v4 = (id)objc_msgSend(a1, "accountProperties");
  v5[0] = (id)objc_msgSend(v4, "objectForKey:", CFSTR("ACUIDisplayUsername"));

  if (!v5[0])
  {
    v5[0] = (id)objc_msgSend(v6, "username");

  }
  v3 = v5[0];
  objc_storeStrong(v5, 0);
  return v3;
}

@end

@implementation ACAccount(AppleIDInternal)

- (void)storeOriginalUsername
{
  void *v2;
  void *v3;
  void *v4;
  id v5;

  objc_msgSend(a1, "accountProperties");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectForKeyedSubscript:", CFSTR("originalUsername"));
  v5 = (id)objc_claimAutoreleasedReturnValue();

  v3 = v5;
  if (!v5)
  {
    objc_msgSend(a1, "username");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "setAccountProperty:forKey:", v4, CFSTR("originalUsername"));

    v3 = 0;
  }

}

@end

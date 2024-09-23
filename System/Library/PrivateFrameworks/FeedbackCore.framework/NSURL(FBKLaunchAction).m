@implementation NSURL(FBKLaunchAction)

- (BOOL)handlesLogin
{
  _BOOL8 v2;
  void *v3;
  void *v4;
  void *v5;
  int v6;
  void *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;

  v2 = 1;
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDD1808]), "initWithURL:resolvingAgainstBaseURL:", a1, 1);
  objc_msgSend(v3, "queryItemsAsDictionary");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "host");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "isEqualToString:", CFSTR("login"));

  objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("config"));
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v6 || !v7)
  {
    if (FBKIsInternalInstall(v8, v9))
    {
      objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("login_token"));
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v2 = v10 != 0;

    }
    else
    {
      v2 = 0;
    }
  }

  return v2;
}

@end

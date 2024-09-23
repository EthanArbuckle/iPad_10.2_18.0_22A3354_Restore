@implementation ACAccount(HMDRemoteLoginUtilities)

- (id)description
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;

  v2 = (void *)MEMORY[0x24BDD17C8];
  objc_msgSend(a1, "username");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "aa_altDSID");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringWithFormat:", CFSTR("[ACAccount: %@/%@]"), v3, v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

@implementation CALNDefaultIconIdentifierVersionProvider

- (int64_t)iconIdentifierVersion
{
  void *v2;
  int64_t v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "integerForKey:", CFSTR("CALNNotificationIconIdentifierVersion"));

  return v3;
}

- (void)setIconIdentifierVersion:(int64_t)a3
{
  id v4;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setInteger:forKey:", a3, CFSTR("CALNNotificationIconIdentifierVersion"));

}

- (int64_t)iconVersionToUpgradeTo
{
  return 4;
}

@end

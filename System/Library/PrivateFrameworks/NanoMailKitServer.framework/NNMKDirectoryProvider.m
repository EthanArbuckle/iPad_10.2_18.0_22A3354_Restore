@implementation NNMKDirectoryProvider

- (NSString)pairedDeviceRegistryPath
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringForKey:", CFSTR("kPairedDeviceRegistryPathKey"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v3;
}

- (void)setPairedDeviceRegistryPath:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  v5 = a3;
  if (v5)
  {
    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("kPairedDeviceRegistryPathKey"));

    objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "synchronize");

  }
  else
  {
    objc_msgSend((id)objc_opt_class(), "removePairedDeviceRegistryPathFromUserDefaults");
  }

}

+ (void)removePairedDeviceRegistryPathFromUserDefaults
{
  void *v2;
  id v3;

  CFPreferencesSetAppValue(CFSTR("kPairedDeviceRegistryPathKey"), 0, (CFStringRef)*MEMORY[0x24BDBD568]);
  CFPreferencesSetAppValue(CFSTR("kPairedDeviceRegistryPathKey"), 0, (CFStringRef)*MEMORY[0x24BDBD580]);
  objc_msgSend(MEMORY[0x24BDBCF50], "resetStandardUserDefaults");
  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "removeObjectForKey:", CFSTR("kPairedDeviceRegistryPathKey"));

  objc_msgSend(MEMORY[0x24BDBCF50], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "synchronize");

}

@end

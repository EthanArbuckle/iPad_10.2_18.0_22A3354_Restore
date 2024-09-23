@implementation MCUIConcreteAppSignerUninstaller

- (void)uninstallProvisioningProfileWithUUID:(id)a3
{
  id v3;
  void *v4;
  id v5;
  id v6;

  v3 = a3;
  NSLog(CFSTR("MCUIAppSignerUninstaller uninstalling provisioning profile with UUID '%@'..."), v3);
  objc_msgSend(MEMORY[0x1E0D47230], "sharedConnection");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = 0;
  objc_msgSend(v4, "removeProvisioningProfileWithUUID:outError:", v3, &v6);
  v5 = v6;

  if (v5)
    NSLog(CFSTR("MCUIAppSignerUninstaller failed to uninstall provisioning profile with UUID '%@' through MCProfileConnection with error: %@"), v3, v5);

}

- (void)uninstallApplicationWithBundleID:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  id v6;
  id v7;

  v3 = a3;
  NSLog(CFSTR("MCUIAppSignerUninstaller uninstalling app with bundle ID '%@'..."), v3);
  v4 = (void *)MEMORY[0x1E0D3AC78];
  v5 = (void *)objc_opt_new();
  v7 = 0;
  objc_msgSend(v4, "uninstallAppWithBundleID:options:disposition:error:", v3, v5, 0, &v7);
  v6 = v7;

  if (v6)
    NSLog(CFSTR("MCUIAppSignerUninstaller failed to uninstall app with bundle ID '%@' through IXAppInstallCoordinator with error: %@"), v3, v6);

}

@end

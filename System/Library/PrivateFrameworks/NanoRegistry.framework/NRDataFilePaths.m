@implementation NRDataFilePaths

+ (id)pathToNanoRegistryStateDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("DeviceRegistry.state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)pathToNanoRegistryHistoryFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("history.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pathToNanoRegistryMigrationRoutingSlip
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("MigrationRoutingSlip.archive"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pathToNanoRegistryClassAFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("ClassAFile.txt"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pathToNanoRegistryHistorySecurePropertiesFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("historySecureProperties.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pathToNanoRegistryUDIDFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("UDIDChangeTracker.plist"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)pathToNanoRegistryHistoryRecoveryManagerFile:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  if (a3)
  {
    v4 = (void *)MEMORY[0x1E0CB3940];
    objc_msgSend(a3, "UUIDString");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "stringWithFormat:", CFSTR("recoveryManager-%@.plist"), v5);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "stringByAppendingPathComponent:", v6);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    objc_msgSend(a1, "pathToNanoRegistryStateDirectory");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "stringByAppendingPathComponent:", CFSTR("recoveryState.bin"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }

  return v8;
}

+ (id)_pathToNanoRegistryStateDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("DeviceRegistry.state"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_pathToNanoRegistryPairingStorePathDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("DeviceRegistry"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_pathToDevicePropertiesFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("properties.bin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_pathToSecureDevicePropertiesFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("secureProperties.bin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_pathToRecoveryStateFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_pathToNanoRegistryStateDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("recoveryState.bin"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

+ (id)_pathToNanoRegistryUnpairTriggerFileDirectory
{
  void *v2;
  void *v3;
  void *v4;

  NSSearchPathForDirectoriesInDomains(NSLibraryDirectory, 1uLL, 1);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "objectAtIndex:", 0);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringByAppendingPathComponent:", CFSTR("DeviceRegistry.dontBackUp"));
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)_pathToUnpairTriggerFile
{
  void *v2;
  void *v3;

  objc_msgSend(a1, "_pathToNanoRegistryUnpairTriggerFileDirectory");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "stringByAppendingPathComponent:", CFSTR("deleteMeToUnpair2"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

@end

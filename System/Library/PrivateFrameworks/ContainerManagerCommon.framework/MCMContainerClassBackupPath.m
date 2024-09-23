@implementation MCMContainerClassBackupPath

+ (id)systemContainerBackupBaseDirectoryWithUserIdentity:(id)a3
{
  id v3;
  id v4;
  int v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  void *v10;
  uint64_t v11;
  void *v12;

  v3 = a3;
  v4 = containermanager_copy_global_configuration();
  v5 = objc_msgSend(v4, "systemContainerMode");

  if (v5 == 1)
  {
    v6 = containermanager_copy_global_configuration();
    objc_msgSend(v6, "defaultUser");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "homeDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    if (_os_feature_enabled_impl())
    {
      v9 = containermanager_copy_global_configuration();
      objc_msgSend(v9, "currentUser");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v10, "homeDirectoryURL");
      v11 = objc_claimAutoreleasedReturnValue();

      v8 = (void *)v11;
    }
  }
  else
  {
    objc_msgSend(v3, "homeDirectoryURL");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v8, "URLByAppendingPathComponent:isDirectory:", CFSTR("Library/Backup/SystemContainers"), 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();

  return v12;
}

+ (id)systemContainerBackupDirectoryWithUserIdentity:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "systemContainerBackupBaseDirectoryWithUserIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Data"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

+ (id)systemGroupContainerBackupDirectoryWithUserIdentity:(id)a3
{
  void *v3;
  void *v4;

  objc_msgSend(a1, "systemContainerBackupBaseDirectoryWithUserIdentity:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "URLByAppendingPathComponent:isDirectory:", CFSTR("Shared"), 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

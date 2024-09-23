@implementation MBAppGroup

- (id)domain
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  -[MBContainer identifier](self, "identifier");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer volumeMountPoint](self, "volumeMountPoint");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer containerDir](self, "containerDir");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  +[MBDomain appGroupDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "appGroupDomainWithIdentifier:volumeMountPoint:rootPath:", v3, v4, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (MBAppGroupRelativePathsToBackupAndRestore_onceToken != -1)
    dispatch_once(&MBAppGroupRelativePathsToBackupAndRestore_onceToken, &__block_literal_global_189);
  objc_msgSend(v6, "setRelativePathsToBackupAndRestore:", MBAppGroupRelativePathsToBackupAndRestore_sSet);
  if (MBAppGroupRelativePathsNotToBackup_onceToken != -1)
    dispatch_once(&MBAppGroupRelativePathsNotToBackup_onceToken, &__block_literal_global_190);
  objc_msgSend(v6, "setRelativePathsNotToBackup:", MBAppGroupRelativePathsNotToBackup_sSet);
  if (MBAppGroupRelativePathsNotToRestore_onceToken != -1)
    dispatch_once(&MBAppGroupRelativePathsNotToRestore_onceToken, &__block_literal_global_191);
  objc_msgSend(v6, "setRelativePathsNotToRestore:", MBAppGroupRelativePathsNotToRestore_sSet);
  objc_msgSend(v6, "setShouldDigest:", 0);
  return v6;
}

@end

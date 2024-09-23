@implementation MBSystemContainer

+ (id)systemContainerWithDomainName:(id)a3 containerDir:(id)a4 isShared:(BOOL)a5
{
  __CFString *v7;
  __CFString *v8;
  id v9;
  void *v10;
  void *v11;
  MBSystemContainer *v12;
  MBSystemContainer *v13;
  _QWORD v15[3];
  _QWORD v16[4];

  v16[3] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("System/Data");
  if (a5)
    v7 = CFSTR("System/Shared");
  v15[0] = *MEMORY[0x1E0C9AE78];
  v8 = v7;
  v9 = a4;
  +[MBDomain containerIDWithName:](MBDomain, "containerIDWithName:", a3);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v16[0] = v10;
  v16[1] = v8;
  v15[1] = CFSTR("ContainerContentClass");
  v15[2] = CFSTR("Container");
  v16[2] = v9;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v16, v15, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  v12 = [MBSystemContainer alloc];
  v13 = -[MBContainer initWithPropertyList:volumeMountPoint:](v12, "initWithPropertyList:volumeMountPoint:", v11, 0);

  return v13;
}

- (id)domain
{
  int v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = -[MBContainer containerType](self, "containerType");
  -[MBContainer identifier](self, "identifier");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer volumeMountPoint](self, "volumeMountPoint");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[MBContainer containerDir](self, "containerDir");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (v3 == 4)
    +[MBDomain systemContainerDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "systemContainerDomainWithIdentifier:volumeMountPoint:rootPath:", v4, v5, v6);
  else
    +[MBDomain systemSharedContainerDomainWithIdentifier:volumeMountPoint:rootPath:](MBDomain, "systemSharedContainerDomainWithIdentifier:volumeMountPoint:rootPath:", v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  if (MBSystemContainerRelativePathsToBackupAndRestore_onceToken != -1)
    dispatch_once(&MBSystemContainerRelativePathsToBackupAndRestore_onceToken, &__block_literal_global_143);
  objc_msgSend(v7, "setRelativePathsToBackupAndRestore:", MBSystemContainerRelativePathsToBackupAndRestore_sSet);
  if (MBSystemContainerRelativePathsNotToBackup_onceToken != -1)
    dispatch_once(&MBSystemContainerRelativePathsNotToBackup_onceToken, &__block_literal_global_146);
  objc_msgSend(v7, "setRelativePathsNotToBackup:", MBSystemContainerRelativePathsNotToBackup_sSet);
  if (MBSystemContainerRelativePathsNotToRestore_onceToken != -1)
    dispatch_once(&MBSystemContainerRelativePathsNotToRestore_onceToken, &__block_literal_global_153);
  objc_msgSend(v7, "setRelativePathsNotToRestore:", MBSystemContainerRelativePathsNotToRestore_sSet);
  objc_msgSend(v7, "setShouldDigest:", 0);
  return v7;
}

@end

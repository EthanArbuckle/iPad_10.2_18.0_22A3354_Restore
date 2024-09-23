@implementation DMTManagedConfigurationBackedProfileInstallationPrimitives

- (id)installProfileData:(id)a3 error:(id *)a4
{
  void *v5;
  id v6;
  void *v7;
  void *v8;
  id v9;
  NSObject *v10;
  id v12;

  v5 = (void *)MEMORY[0x24BE63CB0];
  v6 = a3;
  objc_msgSend(v5, "sharedConnection");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = 0;
  objc_msgSend(v7, "installProfileData:options:outError:", v6, MEMORY[0x24BDBD1B8], &v12);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = v12;
  if (!v8)
  {
    if (_DMTLogGeneral_onceToken_11 != -1)
      dispatch_once(&_DMTLogGeneral_onceToken_11, &__block_literal_global_15);
    v10 = _DMTLogGeneral_logObj_11;
    if (os_log_type_enabled((os_log_t)_DMTLogGeneral_logObj_11, OS_LOG_TYPE_ERROR))
    {
      -[DMTManagedConfigurationBackedProfileInstallationPrimitives installProfileData:error:].cold.1((uint64_t)v9, v10);
      if (!a4)
        goto LABEL_7;
      goto LABEL_6;
    }
    if (a4)
LABEL_6:
      *a4 = objc_retainAutorelease(v9);
  }
LABEL_7:

  return v8;
}

- (BOOL)uninstallProfileWithIdentifier:(id)a3 error:(id *)a4
{
  void *v4;
  id v5;
  void *v6;

  v4 = (void *)MEMORY[0x24BE63CB0];
  v5 = a3;
  objc_msgSend(v4, "sharedConnection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "removeProfileWithIdentifier:", v5);

  return 1;
}

- (void)installProfileData:(uint64_t)a1 error:(NSObject *)a2 .cold.1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x24BDAC8D0];
  v2 = 138543362;
  v3 = a1;
  _os_log_error_impl(&dword_21FD69000, a2, OS_LOG_TYPE_ERROR, "Failed to install profile: %{public}@", (uint8_t *)&v2, 0xCu);
}

@end

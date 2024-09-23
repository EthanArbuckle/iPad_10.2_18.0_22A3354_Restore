@implementation LSServerCleanEphemeralMobileContainersForFirstBoot

void ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  void *v5;
  FSNode *v6;
  id v7;
  NSObject *v8;
  void *v9;
  void *v10;
  void *v11;
  BOOL v12;
  NSObject *v13;
  void *v14;
  id v15;
  uint8_t buf[4];
  void *v17;
  uint64_t v18;

  v18 = *MEMORY[0x1E0C80C00];
  _LSAliasGetPath(**(void ***)(a1 + 40), *(_DWORD *)(a3 + 12));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v15 = 0;
    v6 = -[FSNode initWithPath:flags:error:]([FSNode alloc], "initWithPath:flags:error:", v5, 0, &v15);
    v7 = v15;
    if (!v6)
    {
      _LSDefaultLog();
      v8 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
        ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke_cold_1();
      goto LABEL_10;
    }
    +[FSNode rootVolumeNode](FSNode, "rootVolumeNode");
    v8 = objc_claimAutoreleasedReturnValue();
    if (!-[FSNode isEqual:](v6, "isEqual:", v8))
    {
      +[FSNode systemDataVolumeNode](FSNode, "systemDataVolumeNode");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[FSNode isEqual:](v6, "isEqual:", v9))
      {
LABEL_7:

        goto LABEL_10;
      }
      +[FSNode prebootVolumeNode](FSNode, "prebootVolumeNode");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      if (-[FSNode isEqual:](v6, "isEqual:", v10))
      {

        goto LABEL_7;
      }
      +[FSNode userDataVolumeNode](FSNode, "userDataVolumeNode");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      v12 = -[FSNode isEqual:](v6, "isEqual:", v11);

      if (v12)
        goto LABEL_11;
      _LSDefaultLog();
      v13 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138543362;
        v17 = v5;
        _os_log_impl(&dword_182882000, v13, OS_LOG_TYPE_DEFAULT, "Marking container at %{public}@ for removal", buf, 0xCu);
      }

      v14 = *(void **)(a1 + 32);
      objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", a2);
      v8 = objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "addObject:", v8);
    }
LABEL_10:

LABEL_11:
  }

}

void ___LSServerCleanEphemeralMobileContainersForFirstBoot_block_invoke_cold_1()
{
  uint64_t v0;
  NSObject *v1;
  uint8_t v2[14];
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_3_7();
  v3 = v0;
  OUTLINED_FUNCTION_4_0(&dword_182882000, v1, (uint64_t)v1, "Could not create node for container with path %{public}@: %@", v2);
  OUTLINED_FUNCTION_1();
}

@end

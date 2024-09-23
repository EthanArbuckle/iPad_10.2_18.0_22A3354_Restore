@implementation LSInvokeMIForShimmedInstall

void ___LSInvokeMIForShimmedInstall_block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  char v7;
  id v8;
  void *v9;
  NSObject *v10;
  void *v11;
  id v12;
  uint64_t v13;
  const __CFString *v14;
  uint8_t buf[4];
  uint64_t v16;
  __int16 v17;
  uint64_t v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  _LSInstallLog();
  v2 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    v3 = a1[4];
    v4 = a1[5];
    *(_DWORD *)buf = 138412546;
    v16 = v3;
    v17 = 2112;
    v18 = v4;
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "now processing install of %@ with options %@", buf, 0x16u);
  }

  v5 = (void *)objc_msgSend(objc_alloc((Class)getMIInstallOptionsClass[0]()), "initWithLegacyOptionsDictionary:", a1[5]);
  v6 = (void *)a1[4];
  v12 = 0;
  v7 = ((uint64_t (*)(void *, uint64_t, void *, void *, uint64_t, uint64_t, uint64_t, void *))softLinkMobileInstallationInstallForInstallCoordinationWithError[0])(v6, 1, v5, 0, 0, 0, (uint64_t)&v12, 0);
  v8 = v12;
  v9 = v8;
  if ((v7 & 1) == 0 && !v8)
  {
    _LSInstallLog();
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      ___LSInvokeMIForShimmedInstall_block_invoke_cold_1();

    v13 = *MEMORY[0x1E0CB2938];
    v14 = CFSTR("unknown error installing via mobileinstallation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v14, &v13, 1);
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -101, (uint64_t)"_LSInvokeMIForShimmedInstall_block_invoke", 787, v11);
    v9 = (void *)objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void ___LSInvokeMIForShimmedInstall_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "MobileInstallationInstallForInstallCoordinationWithError returned NO but did not emit an error?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

@end

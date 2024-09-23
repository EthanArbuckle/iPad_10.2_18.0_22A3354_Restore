@implementation LSInvokeMIForShimmedUninstall

void ___LSInvokeMIForShimmedUninstall_block_invoke(_QWORD *a1)
{
  NSObject *v2;
  uint64_t v3;
  uint64_t v4;
  void *v5;
  void *v6;
  uint64_t v7;
  uint64_t v8;
  NSObject *v9;
  void *v10;
  id v11;
  uint64_t v12;
  const __CFString *v13;
  uint64_t v14;
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
    _os_log_impl(&dword_182882000, v2, OS_LOG_TYPE_DEFAULT, "now processing uninstall of %@ with options %@", buf, 0x16u);
  }

  v14 = a1[4];
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", &v14, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = (void *)a1[5];
  v11 = 0;
  ((void (*)(void *, void *, void *, uint64_t, void *))softLinkMobileInstallationUninstallForInstallCoordinationWithError[0])(v5, v6, 0, (uint64_t)&v11, 0);
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (uint64_t)v11;

  if (!(v7 | v8))
  {
    _LSInstallLog();
    v9 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      ___LSInvokeMIForShimmedUninstall_block_invoke_cold_1();

    v12 = *MEMORY[0x1E0CB2938];
    v13 = CFSTR("unknown error uninstalling via mobileinstallation");
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v13, &v12, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    _LSMakeNSErrorImpl(CFSTR("LSApplicationWorkspaceErrorDomain"), -101, (uint64_t)"_LSInvokeMIForShimmedUninstall_block_invoke", 804, v10);
    v8 = objc_claimAutoreleasedReturnValue();

  }
  (*(void (**)(void))(a1[6] + 16))();

}

void ___LSInvokeMIForShimmedUninstall_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_20(&dword_182882000, v0, v1, "MobileInstallationUninstallForInstallCoordinationWithError returned NO but did not emit an error?", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_33();
}

@end

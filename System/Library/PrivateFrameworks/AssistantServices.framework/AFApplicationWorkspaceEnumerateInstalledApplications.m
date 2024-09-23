@implementation AFApplicationWorkspaceEnumerateInstalledApplications

void __AFApplicationWorkspaceEnumerateInstalledApplications_block_invoke(uint64_t a1, void *a2)
{
  id v3;
  void *v4;
  NSObject *v5;
  const char *v6;
  NSObject *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  uint64_t v12;
  void *v13;
  char v14;
  int v15;
  const char *v16;
  __int16 v17;
  id v18;
  uint64_t v19;

  v19 = *MEMORY[0x1E0C80C00];
  v3 = a2;
  if (!*(_QWORD *)(a1 + 48) || (objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v3, "bundleIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    if (!v4)
    {
      v5 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        v15 = 136315394;
        v16 = "AFApplicationWorkspaceEnumerateInstalledApplications_block_invoke";
        v17 = 2112;
        v18 = v3;
        v6 = "%s Encountered an application proxy without bundle identifier: %@";
        goto LABEL_11;
      }
LABEL_24:

      goto LABEL_25;
    }
    if (objc_msgSend(*(id *)(a1 + 32), "containsObject:", v4))
    {
      v5 = AFSiriLogContextUtility;
      if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_INFO))
      {
        v15 = 136315394;
        v16 = "AFApplicationWorkspaceEnumerateInstalledApplications_block_invoke";
        v17 = 2112;
        v18 = v3;
        v6 = "%s Encountered an application proxy with an identical bundle identifier: %@";
LABEL_11:
        _os_log_impl(&dword_19AF50000, v5, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v15, 0x16u);
        goto LABEL_24;
      }
      goto LABEL_24;
    }
    v8 = v3;
    v9 = v8;
    if (!v8)
    {
LABEL_23:

      goto LABEL_24;
    }
    objc_msgSend(v8, "applicationType");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    v11 = v10;
    v12 = *(_QWORD *)(a1 + 56);
    if ((v12 & 1) != 0)
    {
      if ((objc_msgSend(v10, "isEqualToString:", CFSTR("Internal")) & 1) != 0)
      {
LABEL_22:

        goto LABEL_23;
      }
      v12 = *(_QWORD *)(a1 + 56);
    }
    if ((v12 & 2) == 0
      || !objc_msgSend(v11, "isEqualToString:", CFSTR("System"))
      || (objc_msgSend(v9, "appTags"),
          v13 = (void *)objc_claimAutoreleasedReturnValue(),
          v14 = objc_msgSend(v13, "containsObject:", CFSTR("hidden")),
          v13,
          (v14 & 1) == 0))
    {
      if ((*(_BYTE *)(a1 + 56) & 4) == 0 || (objc_msgSend(v9, "isLaunchProhibited") & 1) == 0)
      {
        objc_msgSend(*(id *)(a1 + 32), "addObject:", v4);
        (*(void (**)(void))(*(_QWORD *)(a1 + 40) + 16))();
      }
    }
    goto LABEL_22;
  }
  v7 = AFSiriLogContextUtility;
  if (os_log_type_enabled((os_log_t)AFSiriLogContextUtility, OS_LOG_TYPE_ERROR))
  {
    v15 = 136315394;
    v16 = "AFApplicationWorkspaceEnumerateInstalledApplications_block_invoke";
    v17 = 2112;
    v18 = v3;
    _os_log_error_impl(&dword_19AF50000, v7, OS_LOG_TYPE_ERROR, "%s Encountered a bundle proxy that is not a LSApplicationProxy: %@", (uint8_t *)&v15, 0x16u);
  }
LABEL_25:

}

@end

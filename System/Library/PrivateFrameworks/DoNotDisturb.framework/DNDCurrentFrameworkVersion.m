@implementation DNDCurrentFrameworkVersion

void ___DNDCurrentFrameworkVersion_block_invoke()
{
  void *v0;
  void *v1;
  NSObject *v2;
  void *v3;
  NSObject *v4;
  void *v5;
  __int128 v6;
  uint64_t v7;
  _BYTE buf[24];
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0CB34D0], "bundleForClass:", objc_opt_class());
  v0 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v0, "objectForInfoDictionaryKey:", *MEMORY[0x1E0C9AE90]);
  v1 = (void *)objc_claimAutoreleasedReturnValue();

  v6 = 0uLL;
  v7 = 0;
  DNDOperatingSystemVersionFromString(v1, &v6);
  if ((_QWORD)v6)
  {
    _DNDCurrentFrameworkVersion_currentVersion = v6;
    qword_1ED0275D0 = v7;
  }
  else
  {
    v2 = DNDLogSettings;
    if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_ERROR))
      ___DNDCurrentFrameworkVersion_block_invoke_cold_1((uint64_t)v1, v2);
  }
  v3 = (void *)DNDLogSettings;
  if (os_log_type_enabled((os_log_t)DNDLogSettings, OS_LOG_TYPE_DEFAULT))
  {
    *(_OWORD *)buf = _DNDCurrentFrameworkVersion_currentVersion;
    *(_QWORD *)&buf[16] = qword_1ED0275D0;
    v4 = v3;
    DNDStringFromOperatingSystemVersion(buf);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    *(_DWORD *)buf = 138412546;
    *(_QWORD *)&buf[4] = v5;
    *(_WORD *)&buf[12] = 2112;
    *(_QWORD *)&buf[14] = v1;
    _os_log_impl(&dword_19ABEB000, v4, OS_LOG_TYPE_DEFAULT, "Parsed current version: %@; source: %@", buf, 0x16u);

  }
}

void ___DNDCurrentFrameworkVersion_block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  int v2;
  uint64_t v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  v2 = 138412290;
  v3 = a1;
  _os_log_error_impl(&dword_19ABEB000, a2, OS_LOG_TYPE_ERROR, "Unexpected Project Source Version: %@", (uint8_t *)&v2, 0xCu);
}

@end

@implementation IXAppInstallCoordinator(IXPersonaBasedMultiUser)

+ (void)associateMultiPersonaAppsWithBundleIDs:()IXPersonaBasedMultiUser withPersona:withError:.cold.1(os_log_t log)
{
  int v1;
  const char *v2;
  __int16 v3;
  const char *v4;
  __int16 v5;
  uint64_t v6;
  uint64_t v7;

  v7 = *MEMORY[0x1E0C80C00];
  v1 = 136315650;
  v2 = "+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]";
  v3 = 2080;
  v4 = "+[IXAppInstallCoordinator(IXPersonaBasedMultiUser) associateMultiPersonaAppsWithBundleIDs:withPersona:withError:]";
  v5 = 2112;
  v6 = 0;
  _os_log_error_impl(&dword_1A4BF6000, log, OS_LOG_TYPE_ERROR, "%s: %s is not available on this platform. : %@", (uint8_t *)&v1, 0x20u);
}

@end

@implementation SUUIMutableApplicationControllerOptions

- (void)setPageRenderMetricsEnabled:(BOOL)a3
{
  self->super._pageRenderMetricsEnabled = a3;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;

  result = objc_alloc_init(SUUIApplicationControllerOptions);
  *((_BYTE *)result + 8) = self->super._supportsFullApplicationReload;
  *((_QWORD *)result + 2) = self->super._tabBarControllerStyle;
  *((_BYTE *)result + 24) = self->super._pageRenderMetricsEnabled;
  *((_BYTE *)result + 25) = self->super._requiresLocalBootstrapScript;
  *((_BYTE *)result + 26) = self->super._bootstrapScriptFallbackEnabled;
  *((_QWORD *)result + 4) = *(_QWORD *)&self->super._bootstrapScriptFallbackMaximumAge;
  *((_QWORD *)result + 5) = *(_QWORD *)&self->super._bootstrapScriptTimeoutInterval;
  *((_BYTE *)result + 48) = self->super._useTransientStorageForTests;
  return result;
}

- (void)setSupportsFullApplicationReload:(BOOL)a3
{
  self->super._supportsFullApplicationReload = a3;
}

- (void)setTabBarControllerStyle:(int64_t)a3
{
  self->super._tabBarControllerStyle = a3;
}

- (void)setRequiresLocalBootstrapScript:(BOOL)a3
{
  self->super._requiresLocalBootstrapScript = a3;
}

- (void)setBootstrapScriptFallbackEnabled:(BOOL)a3
{
  self->super._bootstrapScriptFallbackEnabled = a3;
}

- (void)setBootstrapScriptFallbackMaximumAge:(double)a3
{
  self->super._bootstrapScriptFallbackMaximumAge = a3;
}

- (void)setBootstrapScriptTimeoutInterval:(double)a3
{
  self->super._bootstrapScriptTimeoutInterval = a3;
}

- (void)setUseTransientStorageForTests:(BOOL)a3
{
  self->super._useTransientStorageForTests = a3;
}

@end

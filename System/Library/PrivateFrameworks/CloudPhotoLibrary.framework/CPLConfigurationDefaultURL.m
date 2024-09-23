@implementation CPLConfigurationDefaultURL

void ___CPLConfigurationDefaultURL_block_invoke()
{
  uint64_t v0;
  void *v1;
  NSObject *v2;
  void *v3;
  void *v4;
  void *v5;
  uint8_t v6[16];

  v0 = objc_msgSend(objc_alloc(MEMORY[0x1E0C99E98]), "initWithString:", CFSTR("https://configuration.apple.com/configurations/internetservices/cloudkit/cloudphotos/cloudphotos-1.0.plist"));
  v1 = (void *)_CPLConfigurationDefaultURL_url;
  _CPLConfigurationDefaultURL_url = v0;

  if (!_CPLConfigurationDefaultURL_url)
  {
    if (!_CPLSilentLogging)
    {
      __CPLGenericOSLogDomain();
      v2 = objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_ERROR))
      {
        *(_WORD *)v6 = 0;
        _os_log_impl(&dword_1B03C2000, v2, OS_LOG_TYPE_ERROR, "Invalid built-in configuration URL", v6, 2u);
      }

    }
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "NSURL * _Nonnull _CPLConfigurationDefaultURL(void)_block_invoke");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithUTF8String:", "/Library/Caches/com.apple.xbs/Sources/Photos/workspaces/cloudphotolibrary/Framework/Sources/CPLConfiguration.m");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "handleFailureInFunction:file:lineNumber:description:", v4, v5, 36, CFSTR("Invalid built-in configuration URL"));

    abort();
  }
}

@end

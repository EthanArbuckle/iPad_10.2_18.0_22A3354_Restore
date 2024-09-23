@implementation LA

void __LA_LOG_LAUIAuthenticationView_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LAUIAuthenticationView");
  v1 = (void *)LA_LOG_LAUIAuthenticationView_log;
  LA_LOG_LAUIAuthenticationView_log = (uint64_t)v0;

}

void __LA_LOG_LAUIPKGlyphWrapper_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LAUIPKGlyphWrapper");
  v1 = (void *)LA_LOG_LAUIPKGlyphWrapper_log;
  LA_LOG_LAUIPKGlyphWrapper_log = (uint64_t)v0;

}

void __LA_LOG_LAUIAuthenticationCore_block_invoke()
{
  os_log_t v0;
  void *v1;

  v0 = os_log_create("com.apple.LocalAuthentication", "LAUIAuthenticationCore");
  v1 = (void *)LA_LOG_LAUIAuthenticationCore_log;
  LA_LOG_LAUIAuthenticationCore_log = (uint64_t)v0;

}

@end

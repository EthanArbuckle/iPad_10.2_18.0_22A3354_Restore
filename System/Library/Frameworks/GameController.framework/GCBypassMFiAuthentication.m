@implementation GCBypassMFiAuthentication

void __GCBypassMFiAuthentication_block_invoke()
{
  void *v0;
  NSObject *v1;
  _DWORD v2[2];
  uint64_t v3;

  v3 = *MEMORY[0x24BDAC8D0];
  v0 = (void *)objc_msgSend(objc_alloc((Class)&off_254DEF040), "initWithSuiteName:", CFSTR("com.apple.GameController"));
  GCBypassMFiAuthentication_bypassMFiAuthentication = objc_msgSend(v0, "BOOLForKey:", CFSTR("GCMFiAuthBypassEnable"));
  if (gc_isInternalBuild())
  {
    getGCLogger();
    v1 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v1, OS_LOG_TYPE_INFO))
    {
      v2[0] = 67109120;
      v2[1] = GCBypassMFiAuthentication_bypassMFiAuthentication;
      _os_log_impl(&dword_215181000, v1, OS_LOG_TYPE_INFO, "Bypassing MFi authentication via user default? %d", (uint8_t *)v2, 8u);
    }

  }
}

@end

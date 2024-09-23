@implementation CIContext

void __67__CIContext_IconServicesAdditions___MI_sharedIconCompositorContext__block_invoke()
{
  uint64_t v0;
  uint64_t v1;
  void *v2;
  void *v3;
  char *v4;
  NSObject *v5;
  uint64_t v6;
  LICacheClearScheduler *v7;
  void *v8;
  uint8_t v9[8];
  _QWORD v10[4];
  _QWORD v11[5];

  v11[4] = *MEMORY[0x24BDAC8D0];
  v0 = *MEMORY[0x24BDBF818];
  v10[0] = *MEMORY[0x24BDBF820];
  v10[1] = v0;
  v11[0] = MEMORY[0x24BDBD1C8];
  v11[1] = MEMORY[0x24BDBD1C0];
  v1 = *MEMORY[0x24BDBF838];
  v10[2] = *MEMORY[0x24BDBF828];
  v10[3] = v1;
  v11[2] = &unk_24BFDBD60;
  v11[3] = CFSTR("MobileIcons-Scaler");
  objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v11, v10, 4);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x24BDBF648]), "initWithOptions:", v2);
  v4 = getenv("HOLD_OS_TRANSACTION_UNTIL_CICONTEXT_CACHE_CLEAR");
  if (v4 && atoi(v4))
  {
    if (_LIDefaultLog_onceToken_0 != -1)
      dispatch_once(&_LIDefaultLog_onceToken_0, &__block_literal_global_89);
    v5 = _LIDefaultLog_log_0;
    v6 = 1;
    if (os_log_type_enabled((os_log_t)_LIDefaultLog_log_0, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v9 = 0;
      _os_log_impl(&dword_2067A1000, v5, OS_LOG_TYPE_INFO, "iconservicesagent will hold an os_transaction while the scheduled CIContext cache clear is pending.", v9, 2u);
    }
  }
  else
  {
    v6 = 0;
  }
  v7 = -[LICacheClearScheduler initWithObject:delay:holdTransaction:clearHandler:]([LICacheClearScheduler alloc], "initWithObject:delay:holdTransaction:clearHandler:", v3, v6, &__block_literal_global_84, 5.0);
  v8 = (void *)_MI_sharedIconCompositorContext_contextCacheClearScheduler;
  _MI_sharedIconCompositorContext_contextCacheClearScheduler = (uint64_t)v7;

}

uint64_t __67__CIContext_IconServicesAdditions___MI_sharedIconCompositorContext__block_invoke_82(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "clearCaches");
}

@end

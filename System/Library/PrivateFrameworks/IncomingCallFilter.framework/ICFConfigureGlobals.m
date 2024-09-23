@implementation ICFConfigureGlobals

uint64_t ___ICFConfigureGlobals_block_invoke()
{
  sFilterLock = (uint64_t)objc_alloc_init(MEMORY[0x24BDD1788]);
  return IMDispatchForNotify();
}

uint64_t ___ICFConfigureGlobals_block_invoke_2()
{
  NSObject *v0;
  uint64_t v1;
  NSObject *v2;
  _BOOL4 v3;
  uint8_t v5[16];
  uint8_t v6[16];
  uint8_t buf[16];

  v0 = ICFDefaultLog();
  if (os_log_type_enabled(v0, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_2084A6000, v0, OS_LOG_TYPE_DEFAULT, "Server came alive", buf, 2u);
  }
  objc_msgSend((id)sFilterLock, "lock");
  v1 = objc_msgSend((id)sFilterBlocks, "count");
  v2 = ICFDefaultLog();
  v3 = os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT);
  if (v1)
  {
    if (v3)
    {
      *(_WORD *)v6 = 0;
      _os_log_impl(&dword_2084A6000, v2, OS_LOG_TYPE_DEFAULT, " => We have active filters, connecting", v6, 2u);
    }
    _ICFConnectToServer();
  }
  else if (v3)
  {
    *(_WORD *)v5 = 0;
    _os_log_impl(&dword_2084A6000, v2, OS_LOG_TYPE_DEFAULT, " => No active filters, ignoring", v5, 2u);
  }
  return objc_msgSend((id)sFilterLock, "unlock");
}

@end

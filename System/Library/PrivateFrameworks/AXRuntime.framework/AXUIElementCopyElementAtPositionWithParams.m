@implementation AXUIElementCopyElementAtPositionWithParams

void ___AXUIElementCopyElementAtPositionWithParams_block_invoke(uint64_t a1, void *a2, int a3)
{
  id v4;
  NSObject *v5;
  _DWORD v6[2];
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v4 = a2;
  AXRuntimeLogCommon();
  v5 = objc_claimAutoreleasedReturnValue();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    v6[0] = 67109378;
    v6[1] = a3;
    v7 = 2112;
    v8 = v4;
    _os_log_impl(&dword_1B54A6000, v5, OS_LOG_TYPE_INFO, "\t%d: %@", (uint8_t *)v6, 0x12u);
  }

}

BOOL ___AXUIElementCopyElementAtPositionWithParams_block_invoke_17(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  _BOOL8 v5;

  v3 = a2;
  if (objc_msgSend(v3, "contextId") == *(_DWORD *)(a1 + 40))
  {
    v4 = objc_msgSend(v3, "remotePid");
    v5 = v4 == objc_msgSend(*(id *)(a1 + 32), "unsignedIntValue");
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

@end

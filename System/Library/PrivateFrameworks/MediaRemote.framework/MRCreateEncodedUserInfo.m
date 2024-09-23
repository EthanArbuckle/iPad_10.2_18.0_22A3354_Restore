@implementation MRCreateEncodedUserInfo

void __MRCreateEncodedUserInfo_block_invoke_11(uint64_t a1, void *a2, void *a3)
{
  id v5;
  id v6;
  NSObject *v7;

  v5 = a2;
  v6 = a3;
  if ((objc_msgSend(v6, "conformsToProtocol:", &unk_1EE2C1C88) & 1) == 0
    && !CFPropertyListIsValid(v6, kCFPropertyListBinaryFormat_v1_0))
  {
    _MRLogForCategory(0);
    v7 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      __MRCreateEncodedUserInfo_block_invoke_11_cold_1();

    objc_msgSend(*(id *)(a1 + 32), "removeObjectForKey:", v5);
  }

}

uint64_t __MRCreateEncodedUserInfo_block_invoke_5(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_6(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_10(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
}

uint64_t __MRCreateEncodedUserInfo_block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_2(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_118(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_2_121(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_3_123(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_4_126(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_5_129(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_6_132(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "data");
}

id __MRCreateEncodedUserInfo_block_invoke_7(uint64_t a1, uint64_t a2)
{
  return +[MRCommandInfo dataFromCommandInfos:](MRCommandInfo, "dataFromCommandInfos:", a2);
}

id __MRCreateEncodedUserInfo_block_invoke_8(uint64_t a1, void *a2)
{
  void *v2;
  void *v3;

  objc_msgSend(a2, "descriptor");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "data");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

uint64_t __MRCreateEncodedUserInfo_block_invoke_9(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(MEMORY[0x1E0CB36F8], "archivedDataWithRootObject:requiringSecureCoding:error:", a2, 1, 0);
}

void __MRCreateEncodedUserInfo_block_invoke_11_cold_1()
{
  uint64_t v0;
  os_log_t v1;
  uint8_t v2[12];
  __int16 v3;
  uint64_t v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  OUTLINED_FUNCTION_2_5();
  v3 = 2114;
  v4 = v0;
  _os_log_debug_impl(&dword_193827000, v1, OS_LOG_TYPE_DEBUG, "Removing %{public}@ for key %{public}@ for notification user info", v2, 0x16u);
  OUTLINED_FUNCTION_8();
}

@end

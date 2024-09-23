@implementation DPToolCommand

void __35___DPToolCommand_supportedCommands__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[12];

  v2[11] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("recordnumbers");
  v2[1] = CFSTR("recordnumbersvectors");
  v2[2] = CFSTR("recordbitvalues");
  v2[3] = CFSTR("recordbitvectors");
  v2[4] = CFSTR("recordfloatvectors");
  v2[5] = CFSTR("recordstrings");
  v2[6] = CFSTR("recordwords");
  v2[7] = CFSTR("query");
  v2[8] = CFSTR("submitrecords");
  v2[9] = CFSTR("listreports");
  v2[10] = CFSTR("listkeys");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 11);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DPToolSupportedCommands;
  _DPToolSupportedCommands = v0;

}

void __39___DPToolCommand_supportedMetadataKeys__block_invoke()
{
  uint64_t v0;
  void *v1;
  _QWORD v2[6];

  v2[5] = *MEMORY[0x1E0C80C00];
  v2[0] = CFSTR("CountryCode");
  v2[1] = CFSTR("State");
  v2[2] = CFSTR("VersionHash");
  v2[3] = CFSTR("AlgorithmParameters");
  v2[4] = CFSTR("DediscoTaskConfig");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v2, 5);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)_DPToolSupportedMetadataKeys;
  _DPToolSupportedMetadataKeys = v0;

}

void __30___DPToolCommand_queryForKey___block_invoke(uint64_t a1, char a2, void *a3, void *a4)
{
  id v8;
  id v9;
  NSObject *v10;

  v8 = a3;
  v9 = a4;
  if ((a2 & 1) != 0)
  {
    objc_storeStrong((id *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 40), a3);
  }
  else
  {
    +[_DPLog tool](_DPLog, "tool");
    v10 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR))
      __30___DPToolCommand_queryForKey___block_invoke_cold_1(a1);

  }
  dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 32));

}

void __30___DPToolCommand_queryForKey___block_invoke_cold_1(uint64_t a1)
{
  void *v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;

  NSStringFromSelector(*(SEL *)(a1 + 48));
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  OUTLINED_FUNCTION_1_1(&dword_1D3FAA000, v2, v3, "%@: record fetch failed with %@", v4, v5, v6, v7, 2u);

  OUTLINED_FUNCTION_1_0();
}

@end

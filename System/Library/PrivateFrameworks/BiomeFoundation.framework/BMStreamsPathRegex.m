@implementation BMStreamsPathRegex

void __BMStreamsPathRegex_block_invoke()
{
  uint64_t v0;
  void *v1;
  uint64_t v2;
  id v3;
  void *v4;
  NSObject *v5;
  void *v6;
  void *v7;
  id v8;
  _QWORD v9[15];

  v9[14] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("path");
  v9[1] = CFSTR("streamType");
  v9[2] = CFSTR("stream");
  v9[3] = CFSTR("lock");
  v9[4] = CFSTR("metadata");
  v9[5] = CFSTR("deviceType");
  v9[6] = CFSTR("tombstone");
  v9[7] = CFSTR("segment");
  v9[8] = CFSTR("deviceType");
  v9[9] = CFSTR("device");
  v9[10] = CFSTR("tombstone");
  v9[11] = CFSTR("segment");
  v9[12] = CFSTR("subscriptions");
  v9[13] = CFSTR("segment");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 14);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BMStreamsPathRegex_names;
  BMStreamsPathRegex_names = v0;

  v8 = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^streams/(public|restricted)(?:/([a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)(?:(/lock)|(/metadata)|(/local)(/tombstone)?(/[0-9][0-9]*+)?|(/remote)(?:(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})(/tombstone)?(/[0-9][0-9]*+)?)?|(/subscriptions)(/[0-9][0-9]*+)?))?$"), 0, &v8);
  v3 = v8;
  v4 = (void *)BMStreamsPathRegex_regex;
  BMStreamsPathRegex_regex = v2;

  if (v3)
  {
    __biome_log_for_category(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __BMStreamsPathRegex_block_invoke_cold_1();

    v6 = (void *)BMStreamsPathRegex_regex;
    BMStreamsPathRegex_regex = 0;

    v7 = (void *)BMStreamsPathRegex_names;
    BMStreamsPathRegex_names = 0;

  }
}

void __BMStreamsPathRegex_block_invoke_cold_1()
{
  NSObject *v0;
  uint64_t v1;
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint8_t v6;

  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_0_4(&dword_1AEB31000, v0, v1, "Failed to parse path validation regular expression", v2, v3, v4, v5, v6);
  OUTLINED_FUNCTION_4();
}

@end

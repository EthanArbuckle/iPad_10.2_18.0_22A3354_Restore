@implementation BMComputePathRegex

void __BMComputePathRegex_block_invoke()
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
  _QWORD v9[17];

  v9[16] = *MEMORY[0x1E0C80C00];
  v9[0] = CFSTR("path");
  v9[1] = CFSTR("artifacts");
  v9[2] = CFSTR("artifactIdentifier");
  v9[3] = CFSTR("persistent");
  v9[4] = CFSTR("clientIdentifier");
  v9[5] = CFSTR("subscriptionIdentifier");
  v9[6] = CFSTR("sessions");
  v9[7] = CFSTR("sessionIdentifier");
  v9[8] = CFSTR("bookmarks");
  v9[9] = CFSTR("client");
  v9[10] = CFSTR("clientIdentifier");
  v9[11] = CFSTR("subscriptionIdentifier");
  v9[12] = CFSTR("sessions");
  v9[13] = CFSTR("sessionIdentifier");
  v9[14] = CFSTR("subscriptions");
  v9[15] = CFSTR("stream");
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v9, 16);
  v0 = objc_claimAutoreleasedReturnValue();
  v1 = (void *)BMComputePathRegex_names;
  BMComputePathRegex_names = v0;

  v8 = 0;
  v2 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB38E8]), "initWithPattern:options:error:", CFSTR("^compute(?:(/artifacts)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)|(/persistent)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)?|(/sessions)(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})(/bookmarks)(/client)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)?|(/sessions)(/[0-9A-F]{8}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{4}-[0-9A-F]{12})(/subscriptions)(/[a-zA-Z0-9_][a-zA-Z0-9_\\-\\.:]*+)?)$"), 0, &v8);
  v3 = v8;
  v4 = (void *)BMComputePathRegex_regex;
  BMComputePathRegex_regex = v2;

  if (v3)
  {
    __biome_log_for_category(0);
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      __BMStreamsPathRegex_block_invoke_cold_1();

    v6 = (void *)BMComputePathRegex_regex;
    BMComputePathRegex_regex = 0;

    v7 = (void *)BMComputePathRegex_names;
    BMComputePathRegex_names = 0;

  }
}

@end

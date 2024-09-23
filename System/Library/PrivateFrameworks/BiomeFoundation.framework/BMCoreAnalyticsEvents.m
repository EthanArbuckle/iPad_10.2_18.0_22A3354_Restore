@implementation BMCoreAnalyticsEvents

+ (void)sendAllStreamsEventWritten:(BOOL)a3 size:(unsigned int)a4 streamIdentifier:(id)a5
{
  id v5;

  +[BMCoreAnalyticsEvents dictionaryWithAllStreamsEventWritten:size:streamIdentifier:](BMCoreAnalyticsEvents, "dictionaryWithAllStreamsEventWritten:size:streamIdentifier:", a3, *(_QWORD *)&a4, a5);
  v5 = (id)objc_claimAutoreleasedReturnValue();
  +[BMCoreAnalyticsEvents sendEvent:payload:](BMCoreAnalyticsEvents, "sendEvent:payload:", CFSTR("com.apple.biome.streamWrites"), v5);

}

+ (id)dictionaryWithAllStreamsEventWritten:(BOOL)a3 size:(unsigned int)a4 streamIdentifier:(id)a5
{
  uint64_t v5;
  _BOOL8 v6;
  void *v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v13[3];
  _QWORD v14[4];

  v5 = *(_QWORD *)&a4;
  v6 = a3;
  v14[3] = *MEMORY[0x1E0C80C00];
  v13[0] = CFSTR("isWritten");
  v7 = (void *)MEMORY[0x1E0CB37E8];
  v8 = a5;
  objc_msgSend(v7, "numberWithBool:", v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v14[0] = v9;
  v13[1] = CFSTR("size");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v13[2] = CFSTR("streamIdentifier");
  v14[1] = v10;
  v14[2] = v8;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, v13, 3);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  return v11;
}

+ (void)sendEvent:(id)a3 payload:(id)a4
{
  AnalyticsSendEvent();
}

+ (void)sendDatavaultEntitlementUsage:(id)a3
{
  id v3;

  +[BMCoreAnalyticsEvents dictionaryWithDatavaultByUsageExecutableName:](BMCoreAnalyticsEvents, "dictionaryWithDatavaultByUsageExecutableName:", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  +[BMCoreAnalyticsEvents sendEvent:payload:](BMCoreAnalyticsEvents, "sendEvent:payload:", CFSTR("com.apple.biome.datavault-entitlement-usage"), v3);

}

+ (void)sendDeletionPolicyMetrics:(id)a3 stream:(id)a4 numDeleted:(unsigned int)a5 exception:(BOOL)a6
{
  _BOOL8 v6;
  uint64_t v7;
  id v9;
  void *v10;
  id v11;

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v11 = a3;
  v9 = a4;
  if (os_variant_has_internal_content())
  {
    +[BMCoreAnalyticsEvents dictionaryWithDeletionPolicyMetrics:stream:numDeleted:exception:](BMCoreAnalyticsEvents, "dictionaryWithDeletionPolicyMetrics:stream:numDeleted:exception:", v11, v9, v7, v6);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    +[BMCoreAnalyticsEvents sendEvent:payload:](BMCoreAnalyticsEvents, "sendEvent:payload:", CFSTR("com.apple.biome.deletion-policy-metrics"), v10);

  }
}

+ (id)dictionaryWithDatavaultByUsageExecutableName:(id)a3
{
  void *v3;
  id v4;
  void *v5;
  const __CFString *v7;
  _QWORD v8[2];

  v8[1] = *MEMORY[0x1E0C80C00];
  v7 = CFSTR("executableName");
  v8[0] = a3;
  v3 = (void *)MEMORY[0x1E0C99D80];
  v4 = a3;
  objc_msgSend(v3, "dictionaryWithObjects:forKeys:count:", v8, &v7, 1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)dictionaryWithDeletionPolicyMetrics:(id)a3 stream:(id)a4 numDeleted:(unsigned int)a5 exception:(BOOL)a6
{
  _BOOL4 v6;
  uint64_t v7;
  void *v9;
  id v10;
  id v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  _QWORD v17[4];
  _QWORD v18[5];

  v6 = a6;
  v7 = *(_QWORD *)&a5;
  v18[4] = *MEMORY[0x1E0C80C00];
  v17[0] = CFSTR("policyID");
  v17[1] = CFSTR("stream");
  v18[0] = a3;
  v18[1] = a4;
  v17[2] = CFSTR("numDeleted");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  v10 = a4;
  v11 = a3;
  objc_msgSend(v9, "numberWithUnsignedInt:", v7);
  v12 = objc_claimAutoreleasedReturnValue();
  v13 = (void *)v12;
  v17[3] = CFSTR("exception");
  v14 = MEMORY[0x1E0C9AAA0];
  if (v6)
    v14 = MEMORY[0x1E0C9AAB0];
  v18[2] = v12;
  v18[3] = v14;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, v17, 4);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

@end

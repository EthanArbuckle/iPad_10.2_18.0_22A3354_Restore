@implementation MRAnalyticsTrackTopologyChangeEvent

id __MRAnalyticsTrackTopologyChangeEvent_block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  uint64_t v4;
  void *v5;
  const __CFString *v6;
  int v7;
  void *v8;
  void *v9;
  double v10;
  void *v11;
  uint64_t v12;
  void *v13;
  uint64_t v14;
  void *v15;
  uint64_t v16;
  const __CFString *v17;
  void *v18;
  void *v19;
  void *v20;
  _QWORD v22[10];
  _QWORD v23[12];

  v23[10] = *MEMORY[0x1E0C80C00];
  v22[0] = CFSTR("originator");
  if (MRAnalyticsCompositionForLocalDevice_onceToken != -1)
    dispatch_once(&MRAnalyticsCompositionForLocalDevice_onceToken, &__block_literal_global_63);
  MRAnalyticsDeviceCompositionDescription(MRAnalyticsCompositionForLocalDevice_localDeviceComposition);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v23[0] = v2;
  objc_msgSend(MEMORY[0x1E0CB34D0], "mainBundle", v22[0], CFSTR("appBundle"));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bundleIdentifier");
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  if (v4)
    v6 = (const __CFString *)v4;
  else
    v6 = CFSTR("unknown");
  v23[1] = v6;
  v22[2] = CFSTR("destination");
  v7 = MRAnalyticsCompositionForOutputDevices(*(void **)(a1 + 32));
  MRAnalyticsDeviceCompositionDescription(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v23[2] = v8;
  v22[3] = CFSTR("duration");
  v9 = (void *)MEMORY[0x1E0CB37E8];
  objc_msgSend(*(id *)(a1 + 40), "timeIntervalSinceNow");
  objc_msgSend(v9, "numberWithDouble:", fabs(v10));
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = *(_QWORD *)(a1 + 48);
  v23[3] = v11;
  v23[4] = v12;
  v22[4] = CFSTR("type");
  v22[5] = CFSTR("leader");
  MRAnalyticsDeviceCompositionDescription(*(_DWORD *)(a1 + 72));
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v23[5] = v13;
  v22[6] = CFSTR("isLocal");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", *(unsigned __int8 *)(a1 + 76));
  v14 = objc_claimAutoreleasedReturnValue();
  v15 = (void *)v14;
  v17 = *(const __CFString **)(a1 + 56);
  v16 = *(_QWORD *)(a1 + 64);
  if (!v17)
    v17 = CFSTR("unknown");
  v23[6] = v14;
  v23[7] = v17;
  v22[7] = CFSTR("initiator");
  v22[8] = CFSTR("initialGroupSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v16);
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  v23[8] = v18;
  v22[9] = CFSTR("changeSetSize");
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", objc_msgSend(*(id *)(a1 + 32), "count"));
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v23[9] = v19;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v23, v22, 10);
  v20 = (void *)objc_claimAutoreleasedReturnValue();

  return v20;
}

@end

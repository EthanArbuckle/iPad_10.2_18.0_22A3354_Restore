@implementation NTKSubmitAnalyticsForSharedFace

void __NTKSubmitAnalyticsForSharedFace_block_invoke(uint64_t a1)
{
  id v2;
  void *v3;
  uint64_t v4;
  void *v5;
  __CFString *v6;
  __CFString *v7;
  _BOOL8 v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  _QWORD v13[4];
  id v14;
  uint64_t *v15;
  uint64_t *v16;
  uint64_t v17;
  uint64_t *v18;
  uint64_t v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t *v22;
  uint64_t v23;
  uint64_t v24;

  v2 = objc_alloc_init(MEMORY[0x1E0C99E08]);
  NTKFirstPartyDistributionMechanism(*(void **)(a1 + 32));
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v3, CFSTR("firstPartyDistributionMechanism"));

  NTKAnalyticsValueForFace(*(void **)(a1 + 40));
  v4 = objc_claimAutoreleasedReturnValue();
  v5 = (void *)v4;
  v6 = CFSTR("ntk_unknown");
  if (v4)
    v6 = (__CFString *)v4;
  v7 = v6;

  objc_msgSend(v2, "setObject:forKeyedSubscript:", v7, CFSTR("faceStyle"));
  v8 = objc_msgSend(*(id *)(a1 + 40), "origin") == 11 || objc_msgSend(*(id *)(a1 + 40), "origin") == 12;
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithBool:", v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v9, CFSTR("isWatchFaceSharedAgain"));

  v21 = 0;
  v22 = &v21;
  v23 = 0x2020000000;
  v24 = 0;
  v17 = 0;
  v18 = &v17;
  v19 = 0x2020000000;
  v20 = 0;
  v10 = *(void **)(a1 + 40);
  v13[0] = MEMORY[0x1E0C809B0];
  v13[1] = 3221225472;
  v13[2] = __NTKSubmitAnalyticsForSharedFace_block_invoke_2;
  v13[3] = &unk_1E6BD49A8;
  v14 = v10;
  v15 = &v17;
  v16 = &v21;
  objc_msgSend(v14, "enumerateVisibleComplicationSlotsForCurrentConfigurationWithBlock:", v13);
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v18[3]);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v11, CFSTR("numberOfThirdPartyComplications"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", v22[3] - v18[3]);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setObject:forKeyedSubscript:", v12, CFSTR("numberOfFirstPartyComplications"));

  AnalyticsSendEvent();
  _Block_object_dispose(&v17, 8);
  _Block_object_dispose(&v21, 8);

}

void __NTKSubmitAnalyticsForSharedFace_block_invoke_2(uint64_t a1, uint64_t a2)
{
  void *v3;
  id v4;
  void *v5;
  __CFString *v6;
  void *v7;
  uint64_t v8;
  void *v9;
  const __CFString *v10;
  _QWORD v11[2];

  v11[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "complicationType") == 31)
  {
    v4 = v3;
    objc_msgSend(v4, "appBundleIdentifier");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v5, "length"))
    {
      objc_msgSend(v4, "appBundleIdentifier");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("ntk_unknown");
    }

  }
  else
  {
    objc_msgSend(v3, "appIdentifier");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = objc_msgSend(v7, "length");

    if (v8)
    {
      objc_msgSend(v3, "appIdentifier");
      v6 = (__CFString *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v6 = CFSTR("ntk_unknown");
    }
  }
  if ((-[__CFString isEqualToString:](v6, "isEqualToString:", CFSTR("com.apple.nanotimekit.off")) & 1) == 0)
  {
    if ((_isFirstPartyComplicationBundleID(v6) & 1) == 0)
    {
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 40) + 8) + 24);

      v6 = CFSTR("ntk_third_party");
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
    v10 = CFSTR("firstPartyFaceComplications");
    v11[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v11, &v10, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

@end

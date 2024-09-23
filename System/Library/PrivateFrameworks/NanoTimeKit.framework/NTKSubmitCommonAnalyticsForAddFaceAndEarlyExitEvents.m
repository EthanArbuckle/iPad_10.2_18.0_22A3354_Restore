@implementation NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents

void ___NTKSubmitCommonAnalyticsForAddFaceAndEarlyExitEvents_block_invoke(uint64_t a1, uint64_t a2)
{
  void *v3;
  void *v4;
  uint64_t v5;
  __CFString *v6;
  uint64_t v7;
  void *v8;
  __CFString *v9;
  void *v10;
  const __CFString *v11;
  _QWORD v12[2];

  v12[1] = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "complicationForSlot:", a2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v3, "complicationType") == 31 || !objc_msgSend(v3, "complicationType"))
  {
    objc_msgSend(v3, "appIdentifier");
    v7 = objc_claimAutoreleasedReturnValue();
    v8 = (void *)v7;
    v9 = CFSTR("ntk_unknown");
    if (v7)
      v9 = (__CFString *)v7;
    v6 = v9;

  }
  else
  {
    objc_msgSend(v3, "appIdentifier");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    v5 = objc_msgSend(v4, "length");

    if (v5)
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
      ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);

      v6 = CFSTR("ntk_third_party");
    }
    ++*(_QWORD *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24);
    v11 = CFSTR("firstPartyFaceComplications");
    v12[0] = v6;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v12, &v11, 1);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    AnalyticsSendEvent();

  }
}

@end

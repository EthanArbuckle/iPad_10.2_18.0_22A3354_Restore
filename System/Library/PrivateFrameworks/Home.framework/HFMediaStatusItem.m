@implementation HFMediaStatusItem

- (id)_subclass_updateWithOptions:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  _QWORD *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  id v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t v31;
  void *v32;
  __CFString *v33;
  const __CFString *v34;
  void *v35;
  void *v36;
  HFImageIconDescriptor *v37;
  id v38;
  void *v39;
  void *v40;
  _QWORD v42[4];
  id v43;
  _QWORD v44[5];
  const __CFString *v45;
  _QWORD v46[2];

  v46[1] = *MEMORY[0x1E0C80C00];
  v4 = (void *)MEMORY[0x1E0C99E60];
  -[HFStatusItem home](self, "home", a3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "hf_allUniqueMediaProfileContainers");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setWithArray:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  -[HFStatusItem room](self, "room");
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  v9 = MEMORY[0x1E0C809B0];
  if (v8)
  {
    v44[0] = MEMORY[0x1E0C809B0];
    v44[1] = 3221225472;
    v44[2] = __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke;
    v44[3] = &unk_1EA72B900;
    v44[4] = self;
    v10 = v44;
  }
  else
  {
    v10 = &__block_literal_global_42;
  }
  objc_msgSend(v7, "na_filter:", v10);
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  if (objc_msgSend(v11, "count"))
  {
    objc_msgSend(v11, "na_filter:", &__block_literal_global_5_2);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "na_filter:", &__block_literal_global_6_1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0C99E60], "set");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "count");
    if (v15)
    {
      v16 = v13;

      v17 = &unk_1EA7CBB18;
      v18 = 2;
      v14 = v16;
    }
    else
    {
      v18 = objc_msgSend(v12, "count") != 0;
      v17 = &unk_1EA7CBB30;
    }
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", v18);
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v24, CFSTR("state"));

    objc_msgSend(v23, "setObject:forKeyedSubscript:", v17, CFSTR("priority"));
    if ((unint64_t)objc_msgSend(v14, "count") > 1)
    {
      v25 = objc_msgSend(v14, "count");
      HFLocalizedStringWithFormat(CFSTR("HFStatusTitleSpeaker_Multiple"), CFSTR("%lu"), v26, v27, v28, v29, v30, v31, v25);
    }
    else
    {
      _HFLocalizedStringWithDefaultValue(CFSTR("HFStatusTitleSpeaker_One"), CFSTR("HFStatusTitleSpeaker_One"), 1);
    }
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v32, CFSTR("title"));

    if (v15)
      v33 = CFSTR("HFStatusDescriptionSpeaker_Playing");
    else
      v33 = CFSTR("HFStatusDescriptionSpeaker_NotPlaying");
    if (v15)
      v34 = CFSTR("hifispeaker.fill");
    else
      v34 = CFSTR("hifispeaker");
    _HFLocalizedStringWithDefaultValue(v33, v33, 1);
    v35 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v35, CFSTR("description"));

    objc_msgSend(MEMORY[0x1E0CEA650], "configurationWithPointSize:", 24.0);
    v36 = (void *)objc_claimAutoreleasedReturnValue();
    v37 = -[HFImageIconDescriptor initWithSystemImageNamed:configuration:]([HFImageIconDescriptor alloc], "initWithSystemImageNamed:configuration:", v34, v36);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v37, CFSTR("icon"));

    objc_msgSend(v23, "setObject:forKeyedSubscript:", v14, CFSTR("representedHomeKitObjects"));
    if (!v15)
      objc_msgSend(v23, "setObject:forKeyedSubscript:", MEMORY[0x1E0C9AAB0], CFSTR("hidden"));
    objc_msgSend(MEMORY[0x1E0C99E20], "set");
    v42[0] = v9;
    v42[1] = 3221225472;
    v42[2] = __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_27;
    v42[3] = &unk_1EA72B9A8;
    v43 = (id)objc_claimAutoreleasedReturnValue();
    v38 = v43;
    objc_msgSend(v11, "na_each:", v42);
    objc_msgSend(v23, "setObject:forKeyedSubscript:", v38, CFSTR("dependentHomeKitObjects"));
    v39 = (void *)MEMORY[0x1E0D519C0];
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v23);
    v40 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v39, "futureWithResult:", v40);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v19 = (void *)MEMORY[0x1E0D519C0];
    v45 = CFSTR("hidden");
    v46[0] = MEMORY[0x1E0C9AAB0];
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v46, &v45, 1);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    +[HFItemUpdateOutcome outcomeWithResults:](HFItemUpdateOutcome, "outcomeWithResults:", v20);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "futureWithResult:", v21);
    v22 = (void *)objc_claimAutoreleasedReturnValue();

  }
  return v22;
}

uint64_t __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke(uint64_t a1, void *a2)
{
  void *v3;
  uint64_t v4;
  _QWORD v6[5];

  objc_msgSend(a2, "accessories");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_2;
  v6[3] = &unk_1EA727840;
  v6[4] = *(_QWORD *)(a1 + 32);
  v4 = objc_msgSend(v3, "na_any:", v6);

  return v4;
}

BOOL __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_2(uint64_t a1, void *a2)
{
  void *v3;
  void *v4;
  _BOOL8 v5;

  objc_msgSend(a2, "room");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 32), "room");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v3 == v4;

  return v5;
}

uint64_t __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_3(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isVisibleInHomeStatus");
}

uint64_t __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_4(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "hf_isReachable");
}

BOOL __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_5(uint64_t a1, void *a2)
{
  void *v2;
  _BOOL8 v3;

  objc_msgSend(a2, "mediaSession");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "playbackState") == 1;

  return v3;
}

void __49__HFMediaStatusItem__subclass_updateWithOptions___block_invoke_27(uint64_t a1, void *a2)
{
  void *v3;
  id v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  id v9;

  v3 = *(void **)(a1 + 32);
  v4 = a2;
  objc_msgSend(v4, "accessories");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "unionSet:", v5);

  v6 = *(void **)(a1 + 32);
  objc_msgSend(v4, "mediaProfiles");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "unionSet:", v7);

  v8 = *(void **)(a1 + 32);
  objc_msgSend(v4, "mediaSession");
  v9 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v8, "na_safeAddObject:", v9);
}

@end

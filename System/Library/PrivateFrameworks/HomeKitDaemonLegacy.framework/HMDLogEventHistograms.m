@implementation HMDLogEventHistograms

+ (void)initialize
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  uint64_t v14;
  void *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  void *v19;
  void *v20;
  void *v21;
  uint64_t v22;
  void *v23;
  void *v24;
  void *v25;
  uint64_t v26;
  void *v27;
  void *v28;
  uint64_t v29;
  void *v30;
  void *v31;

  objc_opt_self();
  v3 = (id)objc_claimAutoreleasedReturnValue();

  if (v3 == a1)
  {
    v4 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B344D0, &unk_1E8B344E8, &unk_1E8B34500, &unk_1E8B34518, &unk_1E8B34530, &unk_1E8B34548, &unk_1E8B34560, &unk_1E8B34578, &unk_1E8B34590, &unk_1E8B345A8, &unk_1E8B345C0, &unk_1E8B345D8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsignedClosedOpenFixedIntervalMapper:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_memoryHistogram;
    _memoryHistogram = v6;

    v8 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B345F0, &unk_1E8B345C0, &unk_1E8B34608, &unk_1E8B34620, &unk_1E8B34638, &unk_1E8B34650, &unk_1E8B34668, &unk_1E8B34680, &unk_1E8B34698, &unk_1E8B346B0, &unk_1E8B346C8, &unk_1E8B346E0, &unk_1E8B346F8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unsignedClosedOpenFixedIntervalMapper:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_latencyHistogram;
    _latencyHistogram = v10;

    v12 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B344D0, &unk_1E8B344E8, &unk_1E8B34500, &unk_1E8B34518, &unk_1E8B34710, &unk_1E8B34530, &unk_1E8B34728, &unk_1E8B34740, &unk_1E8B34758, &unk_1E8B34548, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unsignedClosedOpenFixedIntervalMapper:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)_successRateHistogram;
    _successRateHistogram = v14;

    v16 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B34770, &unk_1E8B34788, &unk_1E8B347A0, &unk_1E8B347B8, &unk_1E8B347D0, &unk_1E8B344D0, &unk_1E8B347E8, &unk_1E8B34800, &unk_1E8B34818, &unk_1E8B34548, &unk_1E8B345F0, &unk_1E8B345C0, &unk_1E8B345D8, &unk_1E8B34830, &unk_1E8B34848, &unk_1E8B34860, &unk_1E8B34878,
      &unk_1E8B34890,
      0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unsignedClosedOpenFixedIntervalMapper:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)_lowVolumeHistogram;
    _lowVolumeHistogram = v18;

    v20 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B34770, &unk_1E8B344D0, &unk_1E8B34818, &unk_1E8B34548, &unk_1E8B345F0, &unk_1E8B345C0, &unk_1E8B345D8, &unk_1E8B34848, &unk_1E8B34860, &unk_1E8B34878, &unk_1E8B34890, &unk_1E8B348A8, &unk_1E8B348C0, &unk_1E8B348D8, &unk_1E8B348F0, &unk_1E8B34908, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unsignedClosedOpenFixedIntervalMapper:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)_highVolumeHistogram;
    _highVolumeHistogram = v22;

    v24 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B34770, &unk_1E8B34788, &unk_1E8B347A0, &unk_1E8B347B8, &unk_1E8B347D0, &unk_1E8B344D0, &unk_1E8B344E8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "unsignedClosedOpenFixedIntervalMapper:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)_configurationDataHistogram;
    _configurationDataHistogram = v26;

    v28 = (void *)MEMORY[0x1E0D33488];
    objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:", &unk_1E8B34920, &unk_1E8B34860, &unk_1E8B34878, &unk_1E8B34890, &unk_1E8B348A8, &unk_1E8B348C0, &unk_1E8B348D8, &unk_1E8B34908, &unk_1E8B34938, &unk_1E8B34950, &unk_1E8B34968, &unk_1E8B34980, &unk_1E8B34998, &unk_1E8B349B0, 0);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v28, "unsignedOpenClosedFixedIntervalMapper:", v31);
    v29 = objc_claimAutoreleasedReturnValue();
    v30 = (void *)_fileSizeHistogram;
    _fileSizeHistogram = v29;

  }
}

+ (HMMIntervalMapper)memoryHistogram
{
  return (HMMIntervalMapper *)(id)_memoryHistogram;
}

+ (HMMIntervalMapper)latencyHistogram
{
  return (HMMIntervalMapper *)(id)_latencyHistogram;
}

+ (HMMIntervalMapper)successRateHistogram
{
  return (HMMIntervalMapper *)(id)_successRateHistogram;
}

+ (HMMIntervalMapper)lowVolumeHistogram
{
  return (HMMIntervalMapper *)(id)_lowVolumeHistogram;
}

+ (HMMIntervalMapper)highVolumeHistogram
{
  return (HMMIntervalMapper *)(id)_highVolumeHistogram;
}

+ (HMMIntervalMapper)configurationDataHistogram
{
  return (HMMIntervalMapper *)(id)_configurationDataHistogram;
}

+ (HMMIntervalMapper)fileSizeHistogram
{
  return (HMMIntervalMapper *)(id)_fileSizeHistogram;
}

@end

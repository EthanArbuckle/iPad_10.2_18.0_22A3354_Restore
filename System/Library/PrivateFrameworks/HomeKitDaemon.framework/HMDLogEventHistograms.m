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
    v4 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96C6B0, &unk_24E96C6C8, &unk_24E96C6E0, &unk_24E96C6F8, &unk_24E96C710, &unk_24E96C728, &unk_24E96C740, &unk_24E96C758, &unk_24E96C770, &unk_24E96C788, &unk_24E96C7A0, &unk_24E96C7B8, 0);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "unsignedClosedOpenFixedIntervalMapper:", v5);
    v6 = objc_claimAutoreleasedReturnValue();
    v7 = (void *)_memoryHistogram;
    _memoryHistogram = v6;

    v8 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96C7D0, &unk_24E96C7A0, &unk_24E96C7E8, &unk_24E96C800, &unk_24E96C818, &unk_24E96C830, &unk_24E96C848, &unk_24E96C860, &unk_24E96C878, &unk_24E96C890, &unk_24E96C8A8, &unk_24E96C8C0, &unk_24E96C8D8, 0);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "unsignedClosedOpenFixedIntervalMapper:", v9);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)_latencyHistogram;
    _latencyHistogram = v10;

    v12 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96C6B0, &unk_24E96C6C8, &unk_24E96C6E0, &unk_24E96C6F8, &unk_24E96C8F0, &unk_24E96C710, &unk_24E96C908, &unk_24E96C920, &unk_24E96C938, &unk_24E96C728, 0);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "unsignedClosedOpenFixedIntervalMapper:", v13);
    v14 = objc_claimAutoreleasedReturnValue();
    v15 = (void *)_successRateHistogram;
    _successRateHistogram = v14;

    v16 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96C950, &unk_24E96C968, &unk_24E96C980, &unk_24E96C998, &unk_24E96C9B0, &unk_24E96C6B0, &unk_24E96C9C8, &unk_24E96C9E0, &unk_24E96C9F8, &unk_24E96C728, &unk_24E96C7D0, &unk_24E96C7A0, &unk_24E96C7B8, &unk_24E96CA10, &unk_24E96CA28, &unk_24E96CA40, &unk_24E96CA58,
      &unk_24E96CA70,
      0);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "unsignedClosedOpenFixedIntervalMapper:", v17);
    v18 = objc_claimAutoreleasedReturnValue();
    v19 = (void *)_lowVolumeHistogram;
    _lowVolumeHistogram = v18;

    v20 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96C950, &unk_24E96C6B0, &unk_24E96C9F8, &unk_24E96C728, &unk_24E96C7D0, &unk_24E96C7A0, &unk_24E96C7B8, &unk_24E96CA28, &unk_24E96CA40, &unk_24E96CA58, &unk_24E96CA70, &unk_24E96CA88, &unk_24E96CAA0, &unk_24E96CAB8, &unk_24E96CAD0, &unk_24E96CAE8, 0);
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "unsignedClosedOpenFixedIntervalMapper:", v21);
    v22 = objc_claimAutoreleasedReturnValue();
    v23 = (void *)_highVolumeHistogram;
    _highVolumeHistogram = v22;

    v24 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96C950, &unk_24E96C968, &unk_24E96C980, &unk_24E96C998, &unk_24E96C9B0, &unk_24E96C6B0, &unk_24E96C6C8, 0);
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v24, "unsignedClosedOpenFixedIntervalMapper:", v25);
    v26 = objc_claimAutoreleasedReturnValue();
    v27 = (void *)_configurationDataHistogram;
    _configurationDataHistogram = v26;

    v28 = (void *)MEMORY[0x24BE4F190];
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:", &unk_24E96CB00, &unk_24E96CA40, &unk_24E96CA58, &unk_24E96CA70, &unk_24E96CA88, &unk_24E96CAA0, &unk_24E96CAB8, &unk_24E96CAE8, &unk_24E96CB18, &unk_24E96CB30, &unk_24E96CB48, &unk_24E96CB60, &unk_24E96CB78, &unk_24E96CB90, 0);
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

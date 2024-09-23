@implementation HKHeartbeatSeriesSample(HKDataMetadataSampleExtensions)

- (HKHeartbeatSequenceChartData)sequenceChartData
{
  HKHeartbeatSequenceChartData *v2;
  HKHeartbeatSequenceChartData *v3;
  HKHeartbeatSequenceChartData *v4;
  void *v5;
  void *v6;
  uint64_t v8;
  uint64_t v9;
  uint64_t (*v10)(uint64_t, char, double);
  void *v11;
  HKHeartbeatSequenceChartData *v12;
  _QWORD *v13;
  uint64_t *v14;
  _QWORD *v15;
  _QWORD v16[4];
  _QWORD v17[3];
  char v18;
  uint64_t v19;
  double *v20;
  uint64_t v21;
  uint64_t v22;

  v2 = objc_alloc_init(HKHeartbeatSequenceChartData);
  v19 = 0;
  v20 = (double *)&v19;
  v21 = 0x2020000000;
  v22 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x2020000000;
  v18 = 1;
  v16[0] = 0;
  v16[1] = v16;
  v16[2] = 0x2020000000;
  v16[3] = 0;
  v8 = MEMORY[0x1E0C809B0];
  v9 = 3221225472;
  v10 = __76__HKHeartbeatSeriesSample_HKDataMetadataSampleExtensions__sequenceChartData__block_invoke;
  v11 = &unk_1E9C41198;
  v13 = v17;
  v14 = &v19;
  v3 = v2;
  v12 = v3;
  v15 = v16;
  objc_msgSend(a1, "_enumerateHeartbeatDataWithBlock:", &v8);
  if (v20[3] == 0.0)
  {
    v4 = 0;
  }
  else
  {
    objc_msgSend(a1, "metadata", v8, v9, v10, v11);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "objectForKeyedSubscript:", *MEMORY[0x1E0CB72B8]);
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (v6)
    {
      objc_msgSend(v6, "doubleValue");
      -[HKHeartbeatSequenceChartData setInitialXAxisOffset:](v3, "setInitialXAxisOffset:");
    }
    v4 = v3;

  }
  _Block_object_dispose(v16, 8);
  _Block_object_dispose(v17, 8);
  _Block_object_dispose(&v19, 8);

  return v4;
}

@end

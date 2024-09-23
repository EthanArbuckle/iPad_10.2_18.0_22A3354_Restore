@implementation GTProfileInfo

- (id)initFromProfileInfo:(id)a3
{
  id v4;
  GTProfileInfo *v5;
  GTProfileInfo *v6;
  void *v7;
  uint64_t v8;
  NSArray *counters;
  uint64_t v10;
  NSArray *profileCounters;
  uint64_t v12;
  NSDictionary *derivedCounterData;
  uint64_t v14;
  NSString *metalPluginName;
  uint64_t v16;
  NSString *gpuTarget;
  uint64_t v18;
  NSArray *encoderBatchPriorityList;
  uint64_t v20;
  NSArray *highPriorityBatches;
  uint64_t v22;
  NSDictionary *highPriorityBatchInfo;
  uint64_t v24;
  NSArray *batchFilteredDerivedCounters;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  uint64_t v30;
  NSDictionary *perEncoderDrawCallCount;
  uint64_t v32;
  NSDictionary *perEncoderIndexDrawCallCount;
  uint64_t v34;
  NSDictionary *withoutBlitEncoderToDrawCallCountDict;
  uint64_t v36;
  NSArray *blitEncoderIndices;
  uint64_t v38;
  NSArray *activePerEncoderDrawCallCount;
  uint64_t v40;
  NSArray *splitEncoderCommandCount;
  uint64_t v42;
  NSArray *splitPerEncoderKickCount;
  uint64_t v44;
  NSArray *perFrameCommandBufferCount;
  uint64_t v46;
  NSArray *perEncoderKickCount;
  void *v48;
  uint64_t v49;
  NSArray *perCommandBufferEncoderCount;
  uint64_t v51;
  NSDictionary *profilingConfig;
  uint64_t v53;
  NSDictionary *counterConfig;
  uint64_t v55;
  NSDictionary *timelineConfig;
  uint64_t v57;
  NSDictionary *derivedCounterInfo;
  void *v59;
  GTProfileInfo *v60;
  objc_super v62;

  v4 = a3;
  v62.receiver = self;
  v62.super_class = (Class)GTProfileInfo;
  v5 = -[GTProfileInfo init](&v62, sel_init);
  v6 = v5;
  if (v5)
  {
    v5->_version = 1;
    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gpuState"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_gpuState = objc_msgSend(v7, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counters"));
    v8 = objc_claimAutoreleasedReturnValue();
    counters = v6->_counters;
    v6->_counters = (NSArray *)v8;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profileCounters"));
    v10 = objc_claimAutoreleasedReturnValue();
    profileCounters = v6->_profileCounters;
    v6->_profileCounters = (NSArray *)v10;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("derivedCounterData"));
    v12 = objc_claimAutoreleasedReturnValue();
    derivedCounterData = v6->_derivedCounterData;
    v6->_derivedCounterData = (NSDictionary *)v12;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("metalPluginName"));
    v14 = objc_claimAutoreleasedReturnValue();
    metalPluginName = v6->_metalPluginName;
    v6->_metalPluginName = (NSString *)v14;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("gpuTarget"));
    v16 = objc_claimAutoreleasedReturnValue();
    gpuTarget = v6->_gpuTarget;
    v6->_gpuTarget = (NSString *)v16;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("encoderBatchPriorityList"));
    v18 = objc_claimAutoreleasedReturnValue();
    encoderBatchPriorityList = v6->_encoderBatchPriorityList;
    v6->_encoderBatchPriorityList = (NSArray *)v18;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("highPriorityBatches"));
    v20 = objc_claimAutoreleasedReturnValue();
    highPriorityBatches = v6->_highPriorityBatches;
    v6->_highPriorityBatches = (NSArray *)v20;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("HighPriorityBatchInfo"));
    v22 = objc_claimAutoreleasedReturnValue();
    highPriorityBatchInfo = v6->_highPriorityBatchInfo;
    v6->_highPriorityBatchInfo = (NSDictionary *)v22;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("batchFilteredDerivedCounters"));
    v24 = objc_claimAutoreleasedReturnValue();
    batchFilteredDerivedCounters = v6->_batchFilteredDerivedCounters;
    v6->_batchFilteredDerivedCounters = (NSArray *)v24;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("pause"));
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_pause = objc_msgSend(v26, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("resume"));
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_resume = objc_msgSend(v27, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("xpState"));
    v28 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_xpState = objc_msgSend(v28, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("analyzeBinaries"));
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_analyzeBinaries = objc_msgSend(v29, "BOOLValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perEncoderDrawCallCount"));
    v30 = objc_claimAutoreleasedReturnValue();
    perEncoderDrawCallCount = v6->_perEncoderDrawCallCount;
    v6->_perEncoderDrawCallCount = (NSDictionary *)v30;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perEncoderIndexDrawCallCount"));
    v32 = objc_claimAutoreleasedReturnValue();
    perEncoderIndexDrawCallCount = v6->_perEncoderIndexDrawCallCount;
    v6->_perEncoderIndexDrawCallCount = (NSDictionary *)v32;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("withoutBlitEncoderToDrawCallCountDict"));
    v34 = objc_claimAutoreleasedReturnValue();
    withoutBlitEncoderToDrawCallCountDict = v6->_withoutBlitEncoderToDrawCallCountDict;
    v6->_withoutBlitEncoderToDrawCallCountDict = (NSDictionary *)v34;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("blitEncoderIndices"));
    v36 = objc_claimAutoreleasedReturnValue();
    blitEncoderIndices = v6->_blitEncoderIndices;
    v6->_blitEncoderIndices = (NSArray *)v36;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("activePerEncoderDrawCallCount"));
    v38 = objc_claimAutoreleasedReturnValue();
    activePerEncoderDrawCallCount = v6->_activePerEncoderDrawCallCount;
    v6->_activePerEncoderDrawCallCount = (NSArray *)v38;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("splitEncoderCommandCount"));
    v40 = objc_claimAutoreleasedReturnValue();
    splitEncoderCommandCount = v6->_splitEncoderCommandCount;
    v6->_splitEncoderCommandCount = (NSArray *)v40;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("splitPerEncoderKickCount"));
    v42 = objc_claimAutoreleasedReturnValue();
    splitPerEncoderKickCount = v6->_splitPerEncoderKickCount;
    v6->_splitPerEncoderKickCount = (NSArray *)v42;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perFrameCommandBufferCount"));
    v44 = objc_claimAutoreleasedReturnValue();
    perFrameCommandBufferCount = v6->_perFrameCommandBufferCount;
    v6->_perFrameCommandBufferCount = (NSArray *)v44;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perEncoderKickCount"));
    v46 = objc_claimAutoreleasedReturnValue();
    perEncoderKickCount = v6->_perEncoderKickCount;
    v6->_perEncoderKickCount = (NSArray *)v46;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("totalDrawCallCount"));
    v48 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_totalDrawCallCount = objc_msgSend(v48, "unsignedIntValue");

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("perCommandBufferEncoderCount"));
    v49 = objc_claimAutoreleasedReturnValue();
    perCommandBufferEncoderCount = v6->_perCommandBufferEncoderCount;
    v6->_perCommandBufferEncoderCount = (NSArray *)v49;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("profilingConfig"));
    v51 = objc_claimAutoreleasedReturnValue();
    profilingConfig = v6->_profilingConfig;
    v6->_profilingConfig = (NSDictionary *)v51;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("counterConfig"));
    v53 = objc_claimAutoreleasedReturnValue();
    counterConfig = v6->_counterConfig;
    v6->_counterConfig = (NSDictionary *)v53;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("timelineConfig"));
    v55 = objc_claimAutoreleasedReturnValue();
    timelineConfig = v6->_timelineConfig;
    v6->_timelineConfig = (NSDictionary *)v55;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("derivedCounterInfo"));
    v57 = objc_claimAutoreleasedReturnValue();
    derivedCounterInfo = v6->_derivedCounterInfo;
    v6->_derivedCounterInfo = (NSDictionary *)v57;

    objc_msgSend(v4, "objectForKeyedSubscript:", CFSTR("useOverlap"));
    v59 = (void *)objc_claimAutoreleasedReturnValue();
    v6->_useOverlap = objc_msgSend(v59, "BOOLValue");

    v60 = v6;
  }

  return v6;
}

- (GTProfileInfo)initWithCoder:(id)a3
{
  id v4;
  GTProfileInfo *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  NSArray *counters;
  uint64_t v11;
  NSArray *profileCounters;
  uint64_t v13;
  NSDictionary *derivedCounterData;
  uint64_t v15;
  NSString *metalPluginName;
  uint64_t v17;
  NSString *gpuTarget;
  uint64_t v19;
  NSArray *encoderBatchPriorityList;
  uint64_t v21;
  NSArray *highPriorityBatches;
  uint64_t v23;
  NSDictionary *highPriorityBatchInfo;
  uint64_t v25;
  NSArray *batchFilteredDerivedCounters;
  uint64_t v27;
  NSDictionary *perEncoderDrawCallCount;
  uint64_t v29;
  NSDictionary *perEncoderIndexDrawCallCount;
  uint64_t v31;
  NSDictionary *v32;
  uint64_t v33;
  NSArray *blitEncoderIndices;
  uint64_t v35;
  NSArray *activePerEncoderDrawCallCount;
  uint64_t v37;
  NSArray *splitEncoderCommandCount;
  uint64_t v39;
  NSArray *splitPerEncoderKickCount;
  uint64_t v41;
  NSArray *perFrameCommandBufferCount;
  uint64_t v43;
  NSArray *perEncoderKickCount;
  uint64_t v45;
  NSArray *perCommandBufferEncoderCount;
  uint64_t v47;
  NSDictionary *profilingConfig;
  uint64_t v49;
  NSDictionary *counterConfig;
  uint64_t v51;
  NSDictionary *timelineConfig;
  uint64_t v53;
  NSDictionary *derivedCounterInfo;
  GTProfileInfo *v55;
  objc_super v57;
  _QWORD v58[7];

  v58[6] = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  v57.receiver = self;
  v57.super_class = (Class)GTProfileInfo;
  v5 = -[GTProfileInfo init](&v57, sel_init);
  if (v5)
  {
    v6 = (void *)MEMORY[0x24BDBCF20];
    v58[0] = objc_opt_class();
    v58[1] = objc_opt_class();
    v58[2] = objc_opt_class();
    v58[3] = objc_opt_class();
    v58[4] = objc_opt_class();
    v58[5] = objc_opt_class();
    objc_msgSend(MEMORY[0x24BDBCE30], "arrayWithObjects:count:", v58, 6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "setWithArray:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();

    v5->_version = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("version"));
    v5->_gpuState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("state"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("counters"));
    v9 = objc_claimAutoreleasedReturnValue();
    counters = v5->_counters;
    v5->_counters = (NSArray *)v9;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("profileCounters"));
    v11 = objc_claimAutoreleasedReturnValue();
    profileCounters = v5->_profileCounters;
    v5->_profileCounters = (NSArray *)v11;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("derivedCounterData"));
    v13 = objc_claimAutoreleasedReturnValue();
    derivedCounterData = v5->_derivedCounterData;
    v5->_derivedCounterData = (NSDictionary *)v13;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("metalPluginName"));
    v15 = objc_claimAutoreleasedReturnValue();
    metalPluginName = v5->_metalPluginName;
    v5->_metalPluginName = (NSString *)v15;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("gpuTarget"));
    v17 = objc_claimAutoreleasedReturnValue();
    gpuTarget = v5->_gpuTarget;
    v5->_gpuTarget = (NSString *)v17;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("encoderBatchPriorityList"));
    v19 = objc_claimAutoreleasedReturnValue();
    encoderBatchPriorityList = v5->_encoderBatchPriorityList;
    v5->_encoderBatchPriorityList = (NSArray *)v19;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("highPriorityBatches"));
    v21 = objc_claimAutoreleasedReturnValue();
    highPriorityBatches = v5->_highPriorityBatches;
    v5->_highPriorityBatches = (NSArray *)v21;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("HighPriorityBatchInfo"));
    v23 = objc_claimAutoreleasedReturnValue();
    highPriorityBatchInfo = v5->_highPriorityBatchInfo;
    v5->_highPriorityBatchInfo = (NSDictionary *)v23;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("batchFilteredDerivedCounters"));
    v25 = objc_claimAutoreleasedReturnValue();
    batchFilteredDerivedCounters = v5->_batchFilteredDerivedCounters;
    v5->_batchFilteredDerivedCounters = (NSArray *)v25;

    v5->_pause = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("pause"));
    v5->_resume = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("resume"));
    v5->_xpState = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("XPState"));
    v5->_analyzeBinaries = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("AnalyzeBinaries"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("perEncoderDrawCallCount"));
    v27 = objc_claimAutoreleasedReturnValue();
    perEncoderDrawCallCount = v5->_perEncoderDrawCallCount;
    v5->_perEncoderDrawCallCount = (NSDictionary *)v27;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("perEncoderIndexDrawCallCount"));
    v29 = objc_claimAutoreleasedReturnValue();
    perEncoderIndexDrawCallCount = v5->_perEncoderIndexDrawCallCount;
    v5->_perEncoderIndexDrawCallCount = (NSDictionary *)v29;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("perEncoderIndexDrawCallCount"));
    v31 = objc_claimAutoreleasedReturnValue();
    v32 = v5->_perEncoderIndexDrawCallCount;
    v5->_perEncoderIndexDrawCallCount = (NSDictionary *)v31;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("blitEncoderIndices"));
    v33 = objc_claimAutoreleasedReturnValue();
    blitEncoderIndices = v5->_blitEncoderIndices;
    v5->_blitEncoderIndices = (NSArray *)v33;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("activePerEncoderDrawCallCount"));
    v35 = objc_claimAutoreleasedReturnValue();
    activePerEncoderDrawCallCount = v5->_activePerEncoderDrawCallCount;
    v5->_activePerEncoderDrawCallCount = (NSArray *)v35;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("splitEncoderCommandCount"));
    v37 = objc_claimAutoreleasedReturnValue();
    splitEncoderCommandCount = v5->_splitEncoderCommandCount;
    v5->_splitEncoderCommandCount = (NSArray *)v37;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("splitPerEncoderKickCount"));
    v39 = objc_claimAutoreleasedReturnValue();
    splitPerEncoderKickCount = v5->_splitPerEncoderKickCount;
    v5->_splitPerEncoderKickCount = (NSArray *)v39;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("perFrameCommandBufferCount"));
    v41 = objc_claimAutoreleasedReturnValue();
    perFrameCommandBufferCount = v5->_perFrameCommandBufferCount;
    v5->_perFrameCommandBufferCount = (NSArray *)v41;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("perEncoderKickCount"));
    v43 = objc_claimAutoreleasedReturnValue();
    perEncoderKickCount = v5->_perEncoderKickCount;
    v5->_perEncoderKickCount = (NSArray *)v43;

    v5->_totalDrawCallCount = objc_msgSend(v4, "decodeInt32ForKey:", CFSTR("totalDrawCallCount"));
    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("perCommandBufferEncoderCount"));
    v45 = objc_claimAutoreleasedReturnValue();
    perCommandBufferEncoderCount = v5->_perCommandBufferEncoderCount;
    v5->_perCommandBufferEncoderCount = (NSArray *)v45;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("profilingConfig"));
    v47 = objc_claimAutoreleasedReturnValue();
    profilingConfig = v5->_profilingConfig;
    v5->_profilingConfig = (NSDictionary *)v47;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("counterConfig"));
    v49 = objc_claimAutoreleasedReturnValue();
    counterConfig = v5->_counterConfig;
    v5->_counterConfig = (NSDictionary *)v49;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("timelineConfig"));
    v51 = objc_claimAutoreleasedReturnValue();
    timelineConfig = v5->_timelineConfig;
    v5->_timelineConfig = (NSDictionary *)v51;

    objc_msgSend(v4, "decodeObjectOfClasses:forKey:", v8, CFSTR("derivedCounterInfo"));
    v53 = objc_claimAutoreleasedReturnValue();
    derivedCounterInfo = v5->_derivedCounterInfo;
    v5->_derivedCounterInfo = (NSDictionary *)v53;

    v5->_useOverlap = objc_msgSend(v4, "decodeBoolForKey:", CFSTR("useOverlap"));
    v55 = v5;

  }
  return v5;
}

- (void)encodeWithCoder:(id)a3
{
  NSArray *counters;
  NSArray *profileCounters;
  NSDictionary *derivedCounterData;
  void *v7;
  NSString *metalPluginName;
  NSString *gpuTarget;
  NSArray *encoderBatchPriorityList;
  NSArray *highPriorityBatches;
  NSDictionary *highPriorityBatchInfo;
  NSArray *batchFilteredDerivedCounters;
  uint64_t xpState;
  NSDictionary *perEncoderDrawCallCount;
  NSDictionary *perEncoderIndexDrawCallCount;
  NSDictionary *withoutBlitEncoderToDrawCallCountDict;
  NSArray *blitEncoderIndices;
  NSArray *activePerEncoderDrawCallCount;
  NSArray *splitEncoderCommandCount;
  NSArray *splitPerEncoderKickCount;
  NSArray *perFrameCommandBufferCount;
  NSArray *perEncoderKickCount;
  uint64_t totalDrawCallCount;
  NSArray *perCommandBufferEncoderCount;
  NSDictionary *profilingConfig;
  NSDictionary *counterConfig;
  NSDictionary *timelineConfig;
  NSDictionary *derivedCounterInfo;
  id v30;

  v30 = a3;
  objc_msgSend(v30, "encodeInt32:forKey:", self->_version, CFSTR("version"));
  objc_msgSend(v30, "encodeInt32:forKey:", self->_gpuState, CFSTR("state"));
  counters = self->_counters;
  if (counters)
    objc_msgSend(v30, "encodeObject:forKey:", counters, CFSTR("counters"));
  profileCounters = self->_profileCounters;
  if (profileCounters)
    objc_msgSend(v30, "encodeObject:forKey:", profileCounters, CFSTR("profileCounters"));
  derivedCounterData = self->_derivedCounterData;
  v7 = v30;
  if (derivedCounterData)
  {
    objc_msgSend(v30, "encodeObject:forKey:", derivedCounterData, CFSTR("derivedCounterData"));
    v7 = v30;
  }
  metalPluginName = self->_metalPluginName;
  if (metalPluginName)
  {
    objc_msgSend(v30, "encodeObject:forKey:", metalPluginName, CFSTR("metalPluginName"));
    v7 = v30;
  }
  gpuTarget = self->_gpuTarget;
  if (gpuTarget)
  {
    objc_msgSend(v30, "encodeObject:forKey:", gpuTarget, CFSTR("gpuTarget"));
    v7 = v30;
  }
  encoderBatchPriorityList = self->_encoderBatchPriorityList;
  if (encoderBatchPriorityList)
  {
    objc_msgSend(v30, "encodeObject:forKey:", encoderBatchPriorityList, CFSTR("encoderBatchPriorityList"));
    v7 = v30;
  }
  highPriorityBatches = self->_highPriorityBatches;
  if (highPriorityBatches)
  {
    objc_msgSend(v30, "encodeObject:forKey:", highPriorityBatches, CFSTR("highPriorityBatches"));
    v7 = v30;
  }
  highPriorityBatchInfo = self->_highPriorityBatchInfo;
  if (highPriorityBatchInfo)
  {
    objc_msgSend(v30, "encodeObject:forKey:", highPriorityBatchInfo, CFSTR("HighPriorityBatchInfo"));
    v7 = v30;
  }
  batchFilteredDerivedCounters = self->_batchFilteredDerivedCounters;
  if (batchFilteredDerivedCounters)
  {
    objc_msgSend(v30, "encodeObject:forKey:", batchFilteredDerivedCounters, CFSTR("batchFilteredDerivedCounters"));
    v7 = v30;
  }
  if (self->_pause)
  {
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("pause"));
    v7 = v30;
  }
  if (self->_resume)
  {
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("resume"));
    v7 = v30;
  }
  xpState = self->_xpState;
  if ((_DWORD)xpState)
  {
    objc_msgSend(v30, "encodeInt32:forKey:", xpState, CFSTR("XPState"));
    v7 = v30;
  }
  if (self->_analyzeBinaries)
  {
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("AnalyzeBinaries"));
    v7 = v30;
  }
  perEncoderDrawCallCount = self->_perEncoderDrawCallCount;
  if (perEncoderDrawCallCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", perEncoderDrawCallCount, CFSTR("perEncoderDrawCallCount"));
    v7 = v30;
  }
  perEncoderIndexDrawCallCount = self->_perEncoderIndexDrawCallCount;
  if (perEncoderIndexDrawCallCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", perEncoderIndexDrawCallCount, CFSTR("perEncoderIndexDrawCallCount"));
    v7 = v30;
  }
  withoutBlitEncoderToDrawCallCountDict = self->_withoutBlitEncoderToDrawCallCountDict;
  if (withoutBlitEncoderToDrawCallCountDict)
  {
    objc_msgSend(v30, "encodeObject:forKey:", withoutBlitEncoderToDrawCallCountDict, CFSTR("withoutBlitEncoderToDrawCallCountDict"));
    v7 = v30;
  }
  blitEncoderIndices = self->_blitEncoderIndices;
  if (blitEncoderIndices)
  {
    objc_msgSend(v30, "encodeObject:forKey:", blitEncoderIndices, CFSTR("blitEncoderIndices"));
    v7 = v30;
  }
  activePerEncoderDrawCallCount = self->_activePerEncoderDrawCallCount;
  if (activePerEncoderDrawCallCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", activePerEncoderDrawCallCount, CFSTR("activePerEncoderDrawCallCount"));
    v7 = v30;
  }
  splitEncoderCommandCount = self->_splitEncoderCommandCount;
  if (splitEncoderCommandCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", splitEncoderCommandCount, CFSTR("splitEncoderCommandCount"));
    v7 = v30;
  }
  splitPerEncoderKickCount = self->_splitPerEncoderKickCount;
  if (splitPerEncoderKickCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", splitPerEncoderKickCount, CFSTR("splitPerEncoderKickCount"));
    v7 = v30;
  }
  perFrameCommandBufferCount = self->_perFrameCommandBufferCount;
  if (perFrameCommandBufferCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", perFrameCommandBufferCount, CFSTR("perFrameCommandBufferCount"));
    v7 = v30;
  }
  perEncoderKickCount = self->_perEncoderKickCount;
  if (perEncoderKickCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", perEncoderKickCount, CFSTR("perEncoderKickCount"));
    v7 = v30;
  }
  totalDrawCallCount = self->_totalDrawCallCount;
  if ((_DWORD)totalDrawCallCount)
  {
    objc_msgSend(v30, "encodeInt32:forKey:", totalDrawCallCount, CFSTR("totalDrawCallCount"));
    v7 = v30;
  }
  perCommandBufferEncoderCount = self->_perCommandBufferEncoderCount;
  if (perCommandBufferEncoderCount)
  {
    objc_msgSend(v30, "encodeObject:forKey:", perCommandBufferEncoderCount, CFSTR("perCommandBufferEncoderCount"));
    v7 = v30;
  }
  profilingConfig = self->_profilingConfig;
  if (profilingConfig)
  {
    objc_msgSend(v30, "encodeObject:forKey:", profilingConfig, CFSTR("profilingConfig"));
    v7 = v30;
  }
  counterConfig = self->_counterConfig;
  if (counterConfig)
  {
    objc_msgSend(v30, "encodeObject:forKey:", counterConfig, CFSTR("counterConfig"));
    v7 = v30;
  }
  timelineConfig = self->_timelineConfig;
  if (timelineConfig)
  {
    objc_msgSend(v30, "encodeObject:forKey:", timelineConfig, CFSTR("timelineConfig"));
    v7 = v30;
  }
  derivedCounterInfo = self->_derivedCounterInfo;
  if (derivedCounterInfo)
  {
    objc_msgSend(v30, "encodeObject:forKey:", derivedCounterInfo, CFSTR("derivedCounterInfo"));
    v7 = v30;
  }
  if (self->_useOverlap)
  {
    objc_msgSend(v30, "encodeBool:forKey:", 1, CFSTR("useOverlap"));
    v7 = v30;
  }

}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

- (id)toDictionary
{
  void *v3;
  void *v4;
  NSArray *counters;
  NSArray *profileCounters;
  NSDictionary *derivedCounterData;
  NSString *metalPluginName;
  NSString *gpuTarget;
  NSArray *encoderBatchPriorityList;
  NSArray *highPriorityBatches;
  NSDictionary *highPriorityBatchInfo;
  NSArray *batchFilteredDerivedCounters;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  NSDictionary *perEncoderDrawCallCount;
  NSDictionary *perEncoderIndexDrawCallCount;
  NSDictionary *withoutBlitEncoderToDrawCallCountDict;
  NSArray *blitEncoderIndices;
  NSArray *activePerEncoderDrawCallCount;
  NSArray *splitEncoderCommandCount;
  NSArray *splitPerEncoderKickCount;
  NSArray *perFrameCommandBufferCount;
  NSArray *perEncoderKickCount;
  void *v27;
  NSArray *perCommandBufferEncoderCount;
  NSDictionary *profilingConfig;
  NSDictionary *counterConfig;
  NSDictionary *timelineConfig;
  NSDictionary *derivedCounterInfo;
  void *v33;

  v3 = (void *)objc_opt_new();
  if (self->_gpuState)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v4, CFSTR("gpuState"));

  }
  counters = self->_counters;
  if (counters)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", counters, CFSTR("counters"));
  profileCounters = self->_profileCounters;
  if (profileCounters)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", profileCounters, CFSTR("profileCounters"));
  derivedCounterData = self->_derivedCounterData;
  if (derivedCounterData)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", derivedCounterData, CFSTR("derivedCounterData"));
  metalPluginName = self->_metalPluginName;
  if (metalPluginName)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", metalPluginName, CFSTR("metalPluginName"));
  gpuTarget = self->_gpuTarget;
  if (gpuTarget)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", gpuTarget, CFSTR("gpuTarget"));
  encoderBatchPriorityList = self->_encoderBatchPriorityList;
  if (encoderBatchPriorityList)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", encoderBatchPriorityList, CFSTR("encoderBatchPriorityList"));
  highPriorityBatches = self->_highPriorityBatches;
  if (highPriorityBatches)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", highPriorityBatches, CFSTR("highPriorityBatches"));
  highPriorityBatchInfo = self->_highPriorityBatchInfo;
  if (highPriorityBatchInfo)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", highPriorityBatchInfo, CFSTR("HighPriorityBatchInfo"));
  batchFilteredDerivedCounters = self->_batchFilteredDerivedCounters;
  if (batchFilteredDerivedCounters)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", batchFilteredDerivedCounters, CFSTR("batchFilteredDerivedCounters"));
  if (self->_pause)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v14, CFSTR("pause"));

  }
  if (self->_resume)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v15, CFSTR("resume"));

  }
  if (self->_xpState)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v16, CFSTR("XPState"));

  }
  if (self->_analyzeBinaries)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v17, CFSTR("AnalyzeBinaries"));

  }
  perEncoderDrawCallCount = self->_perEncoderDrawCallCount;
  if (perEncoderDrawCallCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", perEncoderDrawCallCount, CFSTR("perEncoderDrawCallCount"));
  perEncoderIndexDrawCallCount = self->_perEncoderIndexDrawCallCount;
  if (perEncoderIndexDrawCallCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", perEncoderIndexDrawCallCount, CFSTR("perEncoderIndexDrawCallCount"));
  withoutBlitEncoderToDrawCallCountDict = self->_withoutBlitEncoderToDrawCallCountDict;
  if (withoutBlitEncoderToDrawCallCountDict)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", withoutBlitEncoderToDrawCallCountDict, CFSTR("withoutBlitEncoderToDrawCallCountDict"));
  blitEncoderIndices = self->_blitEncoderIndices;
  if (blitEncoderIndices)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", blitEncoderIndices, CFSTR("blitEncoderIndices"));
  activePerEncoderDrawCallCount = self->_activePerEncoderDrawCallCount;
  if (activePerEncoderDrawCallCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", activePerEncoderDrawCallCount, CFSTR("activePerEncoderDrawCallCount"));
  splitEncoderCommandCount = self->_splitEncoderCommandCount;
  if (splitEncoderCommandCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", splitEncoderCommandCount, CFSTR("splitEncoderCommandCount"));
  splitPerEncoderKickCount = self->_splitPerEncoderKickCount;
  if (splitPerEncoderKickCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", splitPerEncoderKickCount, CFSTR("splitPerEncoderKickCount"));
  perFrameCommandBufferCount = self->_perFrameCommandBufferCount;
  if (perFrameCommandBufferCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", perFrameCommandBufferCount, CFSTR("perFrameCommandBufferCount"));
  perEncoderKickCount = self->_perEncoderKickCount;
  if (perEncoderKickCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", perEncoderKickCount, CFSTR("perEncoderKickCount"));
  if (self->_totalDrawCallCount)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithUnsignedInt:");
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v27, CFSTR("totalDrawCallCount"));

  }
  perCommandBufferEncoderCount = self->_perCommandBufferEncoderCount;
  if (perCommandBufferEncoderCount)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", perCommandBufferEncoderCount, CFSTR("perCommandBufferEncoderCount"));
  profilingConfig = self->_profilingConfig;
  if (profilingConfig)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", profilingConfig, CFSTR("profilingConfig"));
  counterConfig = self->_counterConfig;
  if (counterConfig)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", counterConfig, CFSTR("counterConfig"));
  timelineConfig = self->_timelineConfig;
  if (timelineConfig)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", timelineConfig, CFSTR("timelineConfig"));
  derivedCounterInfo = self->_derivedCounterInfo;
  if (derivedCounterInfo)
    objc_msgSend(v3, "setObject:forKeyedSubscript:", derivedCounterInfo, CFSTR("derivedCounterInfo"));
  if (self->_useOverlap)
  {
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithBool:", 1);
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setObject:forKeyedSubscript:", v33, CFSTR("useOverlap"));

  }
  return v3;
}

- (unsigned)gpuState
{
  return self->_gpuState;
}

- (void)setGpuState:(unsigned int)a3
{
  self->_gpuState = a3;
}

- (NSArray)counters
{
  return self->_counters;
}

- (void)setCounters:(id)a3
{
  objc_storeStrong((id *)&self->_counters, a3);
}

- (NSArray)profileCounters
{
  return self->_profileCounters;
}

- (void)setProfileCounters:(id)a3
{
  objc_storeStrong((id *)&self->_profileCounters, a3);
}

- (NSDictionary)derivedCounterData
{
  return self->_derivedCounterData;
}

- (void)setDerivedCounterData:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounterData, a3);
}

- (NSString)metalPluginName
{
  return self->_metalPluginName;
}

- (void)setMetalPluginName:(id)a3
{
  objc_storeStrong((id *)&self->_metalPluginName, a3);
}

- (NSString)gpuTarget
{
  return self->_gpuTarget;
}

- (void)setGpuTarget:(id)a3
{
  objc_storeStrong((id *)&self->_gpuTarget, a3);
}

- (NSArray)encoderBatchPriorityList
{
  return self->_encoderBatchPriorityList;
}

- (void)setEncoderBatchPriorityList:(id)a3
{
  objc_storeStrong((id *)&self->_encoderBatchPriorityList, a3);
}

- (NSArray)highPriorityBatches
{
  return self->_highPriorityBatches;
}

- (void)setHighPriorityBatches:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityBatches, a3);
}

- (NSDictionary)highPriorityBatchInfo
{
  return self->_highPriorityBatchInfo;
}

- (void)setHighPriorityBatchInfo:(id)a3
{
  objc_storeStrong((id *)&self->_highPriorityBatchInfo, a3);
}

- (NSArray)batchFilteredDerivedCounters
{
  return self->_batchFilteredDerivedCounters;
}

- (void)setBatchFilteredDerivedCounters:(id)a3
{
  objc_storeStrong((id *)&self->_batchFilteredDerivedCounters, a3);
}

- (BOOL)pause
{
  return self->_pause;
}

- (void)setPause:(BOOL)a3
{
  self->_pause = a3;
}

- (BOOL)resume
{
  return self->_resume;
}

- (void)setResume:(BOOL)a3
{
  self->_resume = a3;
}

- (unsigned)xpState
{
  return self->_xpState;
}

- (void)setXpState:(unsigned int)a3
{
  self->_xpState = a3;
}

- (BOOL)analyzeBinaries
{
  return self->_analyzeBinaries;
}

- (void)setAnalyzeBinaries:(BOOL)a3
{
  self->_analyzeBinaries = a3;
}

- (NSDictionary)perEncoderDrawCallCount
{
  return self->_perEncoderDrawCallCount;
}

- (void)setPerEncoderDrawCallCount:(id)a3
{
  objc_storeStrong((id *)&self->_perEncoderDrawCallCount, a3);
}

- (NSDictionary)perEncoderIndexDrawCallCount
{
  return self->_perEncoderIndexDrawCallCount;
}

- (void)setPerEncoderIndexDrawCallCount:(id)a3
{
  objc_storeStrong((id *)&self->_perEncoderIndexDrawCallCount, a3);
}

- (NSDictionary)withoutBlitEncoderToDrawCallCountDict
{
  return self->_withoutBlitEncoderToDrawCallCountDict;
}

- (void)setWithoutBlitEncoderToDrawCallCountDict:(id)a3
{
  objc_storeStrong((id *)&self->_withoutBlitEncoderToDrawCallCountDict, a3);
}

- (NSArray)blitEncoderIndices
{
  return self->_blitEncoderIndices;
}

- (void)setBlitEncoderIndices:(id)a3
{
  objc_storeStrong((id *)&self->_blitEncoderIndices, a3);
}

- (NSArray)activePerEncoderDrawCallCount
{
  return self->_activePerEncoderDrawCallCount;
}

- (void)setActivePerEncoderDrawCallCount:(id)a3
{
  objc_storeStrong((id *)&self->_activePerEncoderDrawCallCount, a3);
}

- (NSDictionary)profilingConfig
{
  return self->_profilingConfig;
}

- (void)setProfilingConfig:(id)a3
{
  objc_storeStrong((id *)&self->_profilingConfig, a3);
}

- (NSDictionary)counterConfig
{
  return self->_counterConfig;
}

- (void)setCounterConfig:(id)a3
{
  objc_storeStrong((id *)&self->_counterConfig, a3);
}

- (NSDictionary)timelineConfig
{
  return self->_timelineConfig;
}

- (void)setTimelineConfig:(id)a3
{
  objc_storeStrong((id *)&self->_timelineConfig, a3);
}

- (NSDictionary)derivedCounterInfo
{
  return self->_derivedCounterInfo;
}

- (void)setDerivedCounterInfo:(id)a3
{
  objc_storeStrong((id *)&self->_derivedCounterInfo, a3);
}

- (NSArray)splitEncoderCommandCount
{
  return self->_splitEncoderCommandCount;
}

- (void)setSplitEncoderCommandCount:(id)a3
{
  objc_storeStrong((id *)&self->_splitEncoderCommandCount, a3);
}

- (NSArray)splitPerEncoderKickCount
{
  return self->_splitPerEncoderKickCount;
}

- (void)setSplitPerEncoderKickCount:(id)a3
{
  objc_storeStrong((id *)&self->_splitPerEncoderKickCount, a3);
}

- (NSArray)perFrameCommandBufferCount
{
  return self->_perFrameCommandBufferCount;
}

- (void)setPerFrameCommandBufferCount:(id)a3
{
  objc_storeStrong((id *)&self->_perFrameCommandBufferCount, a3);
}

- (NSArray)perEncoderKickCount
{
  return self->_perEncoderKickCount;
}

- (void)setPerEncoderKickCount:(id)a3
{
  objc_storeStrong((id *)&self->_perEncoderKickCount, a3);
}

- (unsigned)totalDrawCallCount
{
  return self->_totalDrawCallCount;
}

- (void)setTotalDrawCallCount:(unsigned int)a3
{
  self->_totalDrawCallCount = a3;
}

- (NSArray)perCommandBufferEncoderCount
{
  return self->_perCommandBufferEncoderCount;
}

- (void)setPerCommandBufferEncoderCount:(id)a3
{
  objc_storeStrong((id *)&self->_perCommandBufferEncoderCount, a3);
}

- (BOOL)useOverlap
{
  return self->_useOverlap;
}

- (void)setUseOverlap:(BOOL)a3
{
  self->_useOverlap = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_perCommandBufferEncoderCount, 0);
  objc_storeStrong((id *)&self->_perEncoderKickCount, 0);
  objc_storeStrong((id *)&self->_perFrameCommandBufferCount, 0);
  objc_storeStrong((id *)&self->_splitPerEncoderKickCount, 0);
  objc_storeStrong((id *)&self->_splitEncoderCommandCount, 0);
  objc_storeStrong((id *)&self->_derivedCounterInfo, 0);
  objc_storeStrong((id *)&self->_timelineConfig, 0);
  objc_storeStrong((id *)&self->_counterConfig, 0);
  objc_storeStrong((id *)&self->_profilingConfig, 0);
  objc_storeStrong((id *)&self->_activePerEncoderDrawCallCount, 0);
  objc_storeStrong((id *)&self->_blitEncoderIndices, 0);
  objc_storeStrong((id *)&self->_withoutBlitEncoderToDrawCallCountDict, 0);
  objc_storeStrong((id *)&self->_perEncoderIndexDrawCallCount, 0);
  objc_storeStrong((id *)&self->_perEncoderDrawCallCount, 0);
  objc_storeStrong((id *)&self->_batchFilteredDerivedCounters, 0);
  objc_storeStrong((id *)&self->_highPriorityBatchInfo, 0);
  objc_storeStrong((id *)&self->_highPriorityBatches, 0);
  objc_storeStrong((id *)&self->_encoderBatchPriorityList, 0);
  objc_storeStrong((id *)&self->_gpuTarget, 0);
  objc_storeStrong((id *)&self->_metalPluginName, 0);
  objc_storeStrong((id *)&self->_derivedCounterData, 0);
  objc_storeStrong((id *)&self->_profileCounters, 0);
  objc_storeStrong((id *)&self->_counters, 0);
}

@end

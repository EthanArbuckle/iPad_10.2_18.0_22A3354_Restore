@implementation ENExposureDetectionSummary

- (ENExposureDetectionSummary)initWithXPCObject:(id)a3 error:(id *)a4
{
  id v6;
  ENExposureDetectionSummary *v7;
  int v8;
  int v9;
  int v10;
  id v11;
  void *v12;
  void *v13;
  void *v14;
  uint64_t v15;
  NSArray *daySummaries;
  ENExposureDetectionSummary *v17;
  NSArray *attenuationDurations;
  void *v19;
  void *v20;
  uint64_t v21;
  NSDictionary *metadata;
  _QWORD applier[6];
  unint64_t v25;
  unint64_t *v26;
  uint64_t v27;
  uint64_t (*v28)(uint64_t, uint64_t);
  void (*v29)(uint64_t);
  id v30;
  objc_super v31;
  _QWORD v32[3];
  _QWORD v33[4];

  v33[3] = *MEMORY[0x24BDAC8D0];
  v6 = a3;
  v31.receiver = self;
  v31.super_class = (Class)ENExposureDetectionSummary;
  v7 = -[ENExposureDetectionSummary init](&v31, sel_init);
  if (!v7)
  {
    if (!a4)
      goto LABEL_29;
LABEL_28:
    ENErrorF(2);
    v17 = 0;
    *a4 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_24;
  }
  if (MEMORY[0x20BD2F7B8](v6) != MEMORY[0x24BDACFA0])
  {
    if (!a4)
      goto LABEL_29;
    goto LABEL_28;
  }
  if (!CUXPCDecodeNSArrayOfInteger())
    goto LABEL_29;
  v25 = 0;
  v8 = CUXPCDecodeSInt64RangedEx();
  if (v8 == 6)
  {
    v7->_daysSinceLastExposure = v25;
  }
  else if (v8 == 5)
  {
    goto LABEL_29;
  }
  v25 = 0;
  v9 = CUXPCDecodeUInt64RangedEx();
  if (v9 == 6)
  {
    v7->_matchedKeyCount = v25;
  }
  else if (v9 == 5)
  {
    goto LABEL_29;
  }
  v25 = 0;
  v10 = CUXPCDecodeUInt64RangedEx();
  if (v10 != 6)
  {
    if (v10 != 5)
      goto LABEL_13;
LABEL_29:
    v17 = 0;
    goto LABEL_24;
  }
  v7->_maximumRiskScore = v25;
LABEL_13:
  if (!CUXPCDecodeDouble() || !CUXPCDecodeDouble())
    goto LABEL_29;
  v11 = objc_alloc_init(MEMORY[0x24BDBCEB8]);
  xpc_dictionary_get_array(v6, "daySummaries");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = v12;
  if (!v12)
    goto LABEL_20;
  v25 = 0;
  v26 = &v25;
  v27 = 0x3032000000;
  v28 = __Block_byref_object_copy_;
  v29 = __Block_byref_object_dispose_;
  v30 = 0;
  applier[0] = MEMORY[0x24BDAC760];
  applier[1] = 3221225472;
  applier[2] = __54__ENExposureDetectionSummary_initWithXPCObject_error___block_invoke;
  applier[3] = &unk_24C38AFC8;
  applier[4] = v11;
  applier[5] = &v25;
  xpc_array_apply(v12, applier);
  v14 = (void *)v26[5];
  if (v14)
  {
    if (a4)
      *a4 = objc_retainAutorelease(v14);
  }
  else
  {
    v15 = objc_msgSend(v11, "copy");
    daySummaries = v7->_daySummaries;
    v7->_daySummaries = (NSArray *)v15;

  }
  _Block_object_dispose(&v25, 8);

  if (v14)
  {
    v17 = 0;
  }
  else
  {
LABEL_20:
    attenuationDurations = v7->_attenuationDurations;
    if (!attenuationDurations)
      attenuationDurations = (NSArray *)MEMORY[0x24BDBD1A8];
    v33[0] = attenuationDurations;
    v32[0] = CFSTR("attenuationDurations");
    v32[1] = CFSTR("maximumRiskScoreFullRange");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7->_maximumRiskScoreFullRange);
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    v33[1] = v19;
    v32[2] = CFSTR("riskScoreSumFullRange");
    objc_msgSend(MEMORY[0x24BDD16E0], "numberWithDouble:", v7->_riskScoreSumFullRange);
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    v33[2] = v20;
    objc_msgSend(MEMORY[0x24BDBCE70], "dictionaryWithObjects:forKeys:count:", v33, v32, 3);
    v21 = objc_claimAutoreleasedReturnValue();
    metadata = v7->_metadata;
    v7->_metadata = (NSDictionary *)v21;

    v17 = v7;
  }

LABEL_24:
  return v17;
}

BOOL __54__ENExposureDetectionSummary_initWithXPCObject_error___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v4;
  ENExposureDaySummary *v5;
  uint64_t v6;
  ENExposureDaySummary *v7;
  _BOOL8 v8;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  void *v15;
  id obj;

  v4 = a3;
  if (MEMORY[0x20BD2F7B8]() == MEMORY[0x24BDACFA0])
  {
    v5 = [ENExposureDaySummary alloc];
    v6 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    obj = *(id *)(v6 + 40);
    v7 = -[ENExposureDaySummary initWithXPCObject:error:](v5, "initWithXPCObject:error:", v4, &obj);
    objc_storeStrong((id *)(v6 + 40), obj);
    v8 = v7 != 0;
    if (v7)
    {
      objc_msgSend(*(id *)(a1 + 32), "addObject:", v7);
    }
    else
    {
      ENErrorF(12);
      v13 = objc_claimAutoreleasedReturnValue();
      v14 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
      v15 = *(void **)(v14 + 40);
      *(_QWORD *)(v14 + 40) = v13;

    }
  }
  else
  {
    ENErrorF(15);
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = *(_QWORD *)(*(_QWORD *)(a1 + 40) + 8);
    v12 = *(void **)(v11 + 40);
    *(_QWORD *)(v11 + 40) = v10;

    v8 = 0;
  }

  return v8;
}

- (void)encodeWithXPCObject:(id)a3
{
  id v4;
  int64_t daysSinceLastExposure;
  uint64_t matchedKeyCount;
  double maximumRiskScoreFullRange;
  double riskScoreSumFullRange;
  NSArray *v9;
  xpc_object_t v10;
  NSArray *v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t i;
  void *v16;
  xpc_object_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x24BDAC8D0];
  v4 = a3;
  CUXPCEncodeNSArrayOfNSNumber();
  daysSinceLastExposure = self->_daysSinceLastExposure;
  if (daysSinceLastExposure)
    xpc_dictionary_set_int64(v4, "daLE", daysSinceLastExposure);
  matchedKeyCount = self->_matchedKeyCount;
  if (matchedKeyCount)
    xpc_dictionary_set_uint64(v4, "mtKC", matchedKeyCount);
  if (self->_maximumRiskScore)
    xpc_dictionary_set_uint64(v4, "mxRS", self->_maximumRiskScore);
  maximumRiskScoreFullRange = self->_maximumRiskScoreFullRange;
  if (maximumRiskScoreFullRange != 0.0)
    xpc_dictionary_set_double(v4, "mxRSFR", maximumRiskScoreFullRange);
  riskScoreSumFullRange = self->_riskScoreSumFullRange;
  if (riskScoreSumFullRange != 0.0)
    xpc_dictionary_set_double(v4, "rssFR", riskScoreSumFullRange);
  v9 = self->_daySummaries;
  if (v9)
  {
    v10 = xpc_array_create(0, 0);
    v18 = 0u;
    v19 = 0u;
    v20 = 0u;
    v21 = 0u;
    v11 = self->_daySummaries;
    v12 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    if (v12)
    {
      v13 = v12;
      v14 = *(_QWORD *)v19;
      do
      {
        for (i = 0; i != v13; ++i)
        {
          if (*(_QWORD *)v19 != v14)
            objc_enumerationMutation(v11);
          v16 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * i);
          v17 = xpc_dictionary_create(0, 0, 0);
          objc_msgSend(v16, "encodeWithXPCObject:", v17, (_QWORD)v18);
          xpc_array_set_value(v10, 0xFFFFFFFFFFFFFFFFLL, v17);

        }
        v13 = -[NSArray countByEnumeratingWithState:objects:count:](v11, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
      }
      while (v13);
    }

    xpc_dictionary_set_value(v4, "daySummaries", v10);
  }

}

- (id)description
{
  id v3;
  NSArray *v4;
  id v5;
  id v6;
  id v7;
  id v8;
  id v9;
  id v10;
  double riskScoreSumFullRange;
  double maximumRiskScoreFullRange;

  NSAppendPrintF_safe();
  v3 = 0;
  v4 = self->_attenuationDurations;
  if (-[NSArray count](v4, "count"))
  {
    NSAppendPrintF();
    v5 = v3;

    v3 = v5;
  }
  NSAppendPrintF_safe();
  v6 = v3;

  NSAppendPrintF_safe();
  v7 = v6;

  maximumRiskScoreFullRange = self->_maximumRiskScoreFullRange;
  NSAppendPrintF_safe();
  v8 = v7;

  riskScoreSumFullRange = self->_riskScoreSumFullRange;
  NSAppendPrintF_safe();
  v9 = v8;

  -[NSArray count](self->_daySummaries, "count", *(_QWORD *)&riskScoreSumFullRange, *(_QWORD *)&maximumRiskScoreFullRange);
  NSAppendPrintF_safe();
  v10 = v9;

  return v10;
}

- (NSArray)attenuationDurations
{
  return self->_attenuationDurations;
}

- (void)setAttenuationDurations:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 16);
}

- (NSInteger)daysSinceLastExposure
{
  return self->_daysSinceLastExposure;
}

- (void)setDaysSinceLastExposure:(int64_t)a3
{
  self->_daysSinceLastExposure = a3;
}

- (uint64_t)matchedKeyCount
{
  return self->_matchedKeyCount;
}

- (void)setMatchedKeyCount:(unint64_t)a3
{
  self->_matchedKeyCount = a3;
}

- (ENRiskScore)maximumRiskScore
{
  return self->_maximumRiskScore;
}

- (void)setMaximumRiskScore:(unsigned __int8)a3
{
  self->_maximumRiskScore = a3;
}

- (double)maximumRiskScoreFullRange
{
  return self->_maximumRiskScoreFullRange;
}

- (void)setMaximumRiskScoreFullRange:(double)a3
{
  self->_maximumRiskScoreFullRange = a3;
}

- (NSDictionary)metadata
{
  return self->_metadata;
}

- (double)riskScoreSumFullRange
{
  return self->_riskScoreSumFullRange;
}

- (void)setRiskScoreSumFullRange:(double)a3
{
  self->_riskScoreSumFullRange = a3;
}

- (NSArray)daySummaries
{
  return self->_daySummaries;
}

- (void)setDaySummaries:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_daySummaries, 0);
  objc_storeStrong((id *)&self->_metadata, 0);
  objc_storeStrong((id *)&self->_attenuationDurations, 0);
}

@end

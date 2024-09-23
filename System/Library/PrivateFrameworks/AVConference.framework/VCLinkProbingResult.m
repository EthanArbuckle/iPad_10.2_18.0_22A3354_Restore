@implementation VCLinkProbingResult

- (VCLinkProbingResult)initWithProbingResults:(id)a3 linkProbingResultConfig:(id *)a4
{
  char *v6;
  VCLinkProbingResult *v7;
  __int128 v8;
  __int128 v9;
  objc_super v11;
  uint64_t v12;

  v12 = *MEMORY[0x1E0C80C00];
  v11.receiver = self;
  v11.super_class = (Class)VCLinkProbingResult;
  v6 = -[VCLinkProbingResult init](&v11, sel_init);
  v7 = (VCLinkProbingResult *)v6;
  if (v6)
  {
    v8 = *(_OWORD *)&a4->var0;
    v9 = *(_OWORD *)&a4->var3;
    *((_QWORD *)v6 + 11) = a4->var5;
    *(_OWORD *)(v6 + 72) = v9;
    *(_OWORD *)(v6 + 56) = v8;
    *((_QWORD *)v6 + 4) = objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", 0.0);
    v7->_plrEnvelopeValue = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", -1.0);
    v7->_plrTier = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithUnsignedInt:", 0);
    -[VCLinkProbingResult updateProbingResult:initialResult:](v7, "updateProbingResult:initialResult:", a3, 1);
  }
  return v7;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];

  v3.receiver = self;
  v3.super_class = (Class)VCLinkProbingResult;
  -[VCLinkProbingResult dealloc](&v3, sel_dealloc);
}

- (void)mergeProbingResults:(id)a3
{
  -[VCLinkProbingResult updateProbingResult:initialResult:](self, "updateProbingResult:initialResult:", a3, 0);
}

- (void)updateProbingResult:(id)a3 initialResult:(BOOL)a4
{
  _BOOL4 v4;
  unsigned __int16 v7;
  unsigned __int16 v8;
  unsigned __int16 v9;
  int v10;
  unsigned int reorderedPacketsCount;
  unsigned int v12;
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  unsigned __int16 v17;
  unsigned __int16 v18;
  uint64_t v19;
  uint64_t i;
  void *v21;
  unsigned __int16 v22;
  unsigned __int16 v23;
  NSMutableArray *v24;
  unsigned __int16 v25;
  double v26;
  double v27;
  int v28;
  unsigned __int16 v29;
  int v30;
  _QWORD v31[2];
  _BYTE v32[128];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  uint64_t v37;

  v4 = a4;
  v37 = *MEMORY[0x1E0C80C00];
  v7 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EF0]), "unsignedIntValue");
  v8 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EF8]), "unsignedIntValue");
  v9 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33EE8]), "unsignedIntValue");
  v10 = v7;
  if (v4)
  {
    self->_sentRequestCount = v7;
    self->_receivedResponseCount = v8;
    self->_reorderedPacketsCount = v9;
    self->_requestTimestampAndRTTList = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E0C99DE8]);
  }
  else
  {
    reorderedPacketsCount = self->_reorderedPacketsCount;
    v12 = self->_receivedResponseCount + v8;
    self->_sentRequestCount += v7;
    self->_receivedResponseCount = v12;
    self->_reorderedPacketsCount = reorderedPacketsCount + v9;
  }
  v13 = (void *)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33F78]);
  v30 = objc_msgSend((id)objc_msgSend(a3, "objectForKeyedSubscript:", *MEMORY[0x1E0D33FF0]), "unsignedIntValue");
  v33 = 0u;
  v34 = 0u;
  v35 = 0u;
  v36 = 0u;
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
  v15 = 0.0;
  if (v14)
  {
    v16 = v14;
    v28 = v10;
    v29 = v8;
    v17 = 0;
    v18 = 0;
    v19 = *(_QWORD *)v34;
    do
    {
      for (i = 0; i != v16; ++i)
      {
        if (*(_QWORD *)v34 != v19)
          objc_enumerationMutation(v13);
        v21 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
        v22 = objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 0), "unsignedIntValue");
        v23 = objc_msgSend((id)objc_msgSend(v21, "objectAtIndexedSubscript:", 1), "unsignedIntValue");
        if ((unint64_t)-[NSMutableArray count](-[VCLinkProbingResult requestTimestampAndRTTList](self, "requestTimestampAndRTTList"), "count") >= 0x3E8)-[NSMutableArray removeFirstObject](-[VCLinkProbingResult requestTimestampAndRTTList](self, "requestTimestampAndRTTList"), "removeFirstObject");
        v24 = -[VCLinkProbingResult requestTimestampAndRTTList](self, "requestTimestampAndRTTList");
        v31[0] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInt:", v30 + v22);
        v31[1] = objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedShort:", v23);
        -[NSMutableArray addObject:](v24, "addObject:", objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v31, 2));
        if (v23 == 0xFFFF)
          v25 = 0;
        else
          v25 = v23;
        v17 += v25;
        if (v23 != 0xFFFF)
          ++v18;
      }
      v16 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v33, v32, 16);
    }
    while (v16);
    v26 = (double)v17;
    v10 = v28;
    v8 = v29;
  }
  else
  {
    v18 = 0;
    v26 = 0.0;
  }
  if (self->_linkProbingResultConfig.linkProbingCapabilityVersion == 2)
    v15 = (double)(v10 - v8) / (double)v10;
  if (v18)
    v27 = v26 / (double)v18;
  else
    v27 = 0.0;
  -[VCLinkProbingResult updateLinkStatsWithArrivingNewValueMeanRTT:arrivingNewValuePLR:](self, "updateLinkStatsWithArrivingNewValueMeanRTT:arrivingNewValuePLR:", v27, v15);
}

- (void)updateLinkStatsWithArrivingNewValueMeanRTT:(double)a3 arrivingNewValuePLR:(double)a4
{
  uint64_t v7;
  double v8;
  double v9;
  double v10;
  double v11;
  id v12;
  double v13;
  double expMovMeanFactor;
  double v15;

  -[NSNumber doubleValue](self->_plrEnvelopeValue, "doubleValue");
  v7 = 80;
  if (v8 < a4)
    v7 = 72;
  v9 = *(double *)((char *)&self->super.isa + v7);
  -[NSNumber doubleValue](self->_plrEnvelopeValue, "doubleValue");
  if (v10 != -1.0)
  {
    -[NSNumber doubleValue](self->_plrEnvelopeValue, "doubleValue");
    a4 = (1.0 - v9) * v11 + a4 * v9;
  }

  self->_plrEnvelopeValue = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a4);
  v12 = objc_alloc(MEMORY[0x1E0CB37E8]);
  -[NSNumber doubleValue](self->_plrEnvelopeValue, "doubleValue");
  self->_plrTier = (NSNumber *)objc_msgSend(v12, "initWithUnsignedInt:", -[VCLinkProbingResult getPLRTierFromPLREnvelope:](self, "getPLRTierFromPLREnvelope:"));
  if (a3 > 0.0)
  {
    -[NSNumber doubleValue](self->_expMovMeanRTT, "doubleValue");
    if (v13 != 0.0)
    {
      expMovMeanFactor = self->_linkProbingResultConfig.expMovMeanFactor;
      -[NSNumber doubleValue](self->_expMovMeanRTT, "doubleValue");
      a3 = v15 * (1.0 - self->_linkProbingResultConfig.expMovMeanFactor) + a3 * expMovMeanFactor;
    }

    self->_expMovMeanRTT = (NSNumber *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB37E8]), "initWithDouble:", a3);
  }
}

- (unsigned)getPLRTierFromPLREnvelope:(double)a3
{
  uint64_t v5;
  unsigned __int8 v6;
  double v7;
  double v8;

  if (!-[NSArray count](self->_linkProbingResultConfig.plrBuckets, "count"))
    return 0;
  v5 = 0;
  v6 = 0;
  v7 = a3 * 100.0;
  do
  {
    objc_msgSend(-[NSArray objectAtIndexedSubscript:](self->_linkProbingResultConfig.plrBuckets, "objectAtIndexedSubscript:", v5), "doubleValue");
    if (v7 < v8)
      break;
    v5 = ++v6;
  }
  while (-[NSArray count](self->_linkProbingResultConfig.plrBuckets, "count") > v6);
  return v6;
}

- (id)description
{
  void *v3;
  objc_class *v4;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  return (id)objc_msgSend(v3, "stringWithFormat:", CFSTR("%@[%p][CUMULATIVE] reorderedPacketsCount[%d] sentRequestCount[%d] receivedResponseCount[%d] ExpMovMeanRTT[%@] plrEnvelopeValue[%@] plrTier[%@]"), NSStringFromClass(v4), self, self->_reorderedPacketsCount, self->_sentRequestCount, self->_receivedResponseCount, self->_expMovMeanRTT, self->_plrEnvelopeValue, self->_plrTier);
}

- (unsigned)reorderedPacketsCount
{
  return self->_reorderedPacketsCount;
}

- (unsigned)sentRequestCount
{
  return self->_sentRequestCount;
}

- (unsigned)receivedResponseCount
{
  return self->_receivedResponseCount;
}

- (NSMutableArray)requestTimestampAndRTTList
{
  return self->_requestTimestampAndRTTList;
}

- (NSNumber)expMovMeanRTT
{
  return self->_expMovMeanRTT;
}

- (NSNumber)plrEnvelopeValue
{
  return self->_plrEnvelopeValue;
}

- (NSNumber)plrTier
{
  return self->_plrTier;
}

@end

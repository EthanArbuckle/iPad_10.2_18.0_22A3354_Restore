@implementation HDRollingBaselineRelativeQuantityCalculator

- (HDRollingBaselineRelativeQuantityCalculator)initWithConfiguration:(id)a3
{
  id v6;
  HDRollingBaselineRelativeQuantityCalculator *v7;
  HDRollingBaselineRelativeQuantityCalculator *v8;
  uint64_t v9;
  NSMutableDictionary *baselineBySourceID;
  void *v12;
  objc_super v13;

  v6 = a3;
  if ((objc_msgSend(v6, "options") & 1) == 0)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDRollingBaselineRelativeQuantityCalculator.m"), 47, CFSTR("Only per-source baselining is supported at this time"));

  }
  v13.receiver = self;
  v13.super_class = (Class)HDRollingBaselineRelativeQuantityCalculator;
  v7 = -[HDRollingBaselineRelativeQuantityCalculator init](&v13, sel_init);
  v8 = v7;
  if (v7)
  {
    objc_storeStrong((id *)&v7->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
    v9 = objc_claimAutoreleasedReturnValue();
    baselineBySourceID = v8->_baselineBySourceID;
    v8->_baselineBySourceID = (NSMutableDictionary *)v9;

  }
  return v8;
}

- (double)mostRecentSampleStartTimeForSourceID:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mostRecentSampleStartTime");
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v6 = v8;

  }
  return v6;
}

- (double)mostRecentSupplementarySampleStartTimeForSourceID:(id)a3
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  void *v7;
  double v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
  {
    objc_msgSend(v3, "mostRecentSupplementarySampleStartTime");
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "timeIntervalSinceReferenceDate");
    v6 = v8;

  }
  return v6;
}

- (BOOL)hasSufficientDataToBaselineSampleWithSourceID:(id)a3
{
  void *v3;
  void *v4;
  char v5;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:", a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = v3;
  if (v3)
    v5 = objc_msgSend(v3, "hasSufficientDataToBaseline");
  else
    v5 = 0;

  return v5;
}

- (int64_t)additionalSampleCountRequiredToBaselineSampleWithSourceID:(id)a3
{
  void *v4;
  void *v5;
  uint64_t v6;
  int64_t v7;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
    v6 = objc_msgSend(v4, "additionalSampleCountRequiredToBaseline");
  else
    v6 = -[HKRollingBaselineConfiguration minimumSampleCount](self->_configuration, "minimumSampleCount");
  v7 = v6;

  return v7;
}

- (void)pruneForNextSampleStartTime:(double)a3 sourceID:(id)a4
{
  void *v5;
  id v6;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    v6 = v5;
    objc_msgSend(v5, "pruneForNextSampleStartTime:", a3);
    v5 = v6;
  }

}

- (void)addNextSampleValue:(double)a3 startTime:(double)a4 sourceID:(id)a5
{
  _HDRollingBaseline *v8;
  _HDRollingBaseline *v9;
  id v10;

  v10 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:");
  v8 = (_HDRollingBaseline *)objc_claimAutoreleasedReturnValue();
  if (v8)
  {
    v9 = v8;
    -[_HDRollingBaseline pruneForNextSampleStartTime:](v8, "pruneForNextSampleStartTime:", a4);
  }
  else
  {
    v9 = -[_HDRollingBaseline initWithConfiguration:]([_HDRollingBaseline alloc], "initWithConfiguration:", self->_configuration);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_baselineBySourceID, "setObject:forKeyedSubscript:", v9, v10);
  }
  -[_HDRollingBaseline addNextSampleValue:startTime:](v9, "addNextSampleValue:startTime:", a3, a4);

}

- (void)addSupplementarySampleValue:(double)a3 startTime:(double)a4 sourceID:(id)a5
{
  _HDRollingBaseline *v8;
  id v9;

  v9 = a5;
  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:");
  v8 = (_HDRollingBaseline *)objc_claimAutoreleasedReturnValue();
  if (!v8)
  {
    v8 = -[_HDRollingBaseline initWithConfiguration:]([_HDRollingBaseline alloc], "initWithConfiguration:", self->_configuration);
    -[NSMutableDictionary setObject:forKeyedSubscript:](self->_baselineBySourceID, "setObject:forKeyedSubscript:", v8, v9);
  }
  -[_HDRollingBaseline addSupplementarySampleValue:startTime:](v8, "addSupplementarySampleValue:startTime:", a3, a4);

}

- (double)baselineRelativeValueForSampleValue:(double)a3 sourceID:(id)a4
{
  void *v5;
  void *v6;
  double v7;
  double v8;

  -[NSMutableDictionary objectForKeyedSubscript:](self->_baselineBySourceID, "objectForKeyedSubscript:", a4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v5 && objc_msgSend(v5, "hasSufficientDataToBaseline"))
  {
    objc_msgSend(v6, "currentBaseline");
    v8 = a3 - v7;
  }
  else
  {
    v8 = -1.79769313e308;
  }

  return v8;
}

- (HKRollingBaselineConfiguration)configuration
{
  return self->_configuration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_configuration, 0);
  objc_storeStrong((id *)&self->_baselineBySourceID, 0);
}

@end

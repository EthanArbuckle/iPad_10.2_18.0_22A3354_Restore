@implementation _HDRollingBaseline

- (_HDRollingBaseline)initWithConfiguration:(id)a3
{
  id v5;
  _HDRollingBaseline *v6;
  _HDRollingBaseline *v7;
  uint64_t v8;
  NSMutableArray *samples;
  uint64_t v10;
  NSMutableArray *supplementarySamples;
  objc_super v13;

  v5 = a3;
  v13.receiver = self;
  v13.super_class = (Class)_HDRollingBaseline;
  v6 = -[_HDRollingBaseline init](&v13, sel_init);
  v7 = v6;
  if (v6)
  {
    objc_storeStrong((id *)&v6->_configuration, a3);
    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v8 = objc_claimAutoreleasedReturnValue();
    samples = v7->_samples;
    v7->_samples = (NSMutableArray *)v8;

    objc_msgSend(MEMORY[0x1E0C99DE8], "array");
    v10 = objc_claimAutoreleasedReturnValue();
    supplementarySamples = v7->_supplementarySamples;
    v7->_supplementarySamples = (NSMutableArray *)v10;

    v7->_samplesSum = 0.0;
    v7->_supplementarySamplesSum = 0.0;
  }

  return v7;
}

- (double)_sum
{
  return self->_samplesSum + self->_supplementarySamplesSum;
}

- (unint64_t)_sampleCount
{
  uint64_t v3;

  v3 = -[NSMutableArray count](self->_samples, "count");
  return -[NSMutableArray count](self->_supplementarySamples, "count") + v3;
}

- (BOOL)hasSufficientDataToBaseline
{
  return -[_HDRollingBaseline additionalSampleCountRequiredToBaseline](self, "additionalSampleCountRequiredToBaseline") == 0;
}

- (int64_t)additionalSampleCountRequiredToBaseline
{
  uint64_t v3;
  unint64_t v4;

  v3 = -[HKRollingBaselineConfiguration minimumSampleCount](self->_configuration, "minimumSampleCount");
  v4 = -[_HDRollingBaseline _sampleCount](self, "_sampleCount");
  return (v3 - v4) & ~((uint64_t)(v3 - v4) >> 63);
}

- (double)currentBaseline
{
  double v4;
  void *v6;

  if (!-[_HDRollingBaseline hasSufficientDataToBaseline](self, "hasSufficientDataToBaseline"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

  }
  -[_HDRollingBaseline _sum](self, "_sum");
  return v4 / (double)-[_HDRollingBaseline _sampleCount](self, "_sampleCount");
}

- (double)mostRecentSampleStartTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[NSMutableArray lastObject](self->_samples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSMutableArray lastObject](self->_samples, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_hd_trivialQuantitySampleValue");
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v7;
  }

  return v6;
}

- (double)mostRecentSupplementarySampleStartTime
{
  void *v3;
  void *v4;
  double v5;
  double v6;
  double v7;

  -[NSMutableArray lastObject](self->_supplementarySamples, "lastObject");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[NSMutableArray lastObject](self->_supplementarySamples, "lastObject");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "_hd_trivialQuantitySampleValue");
    v6 = v5;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    v6 = v7;
  }

  return v6;
}

- (void)pruneForNextSampleStartTime:(double)a3
{
  NSMutableArray *v5;
  NSMutableArray *supplementarySamples;
  double v7;
  double v8;
  NSMutableArray *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  double v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  double v18;
  double v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  _BYTE v24[128];
  uint64_t v25;

  v25 = *MEMORY[0x1E0C80C00];
  objc_msgSend(MEMORY[0x1E0C99DE8], "array");
  v5 = (NSMutableArray *)objc_claimAutoreleasedReturnValue();
  supplementarySamples = self->_supplementarySamples;
  self->_supplementarySamples = v5;

  self->_supplementarySamplesSum = 0.0;
  if (-[NSMutableArray count](self->_samples, "count"))
  {
    -[HKRollingBaselineConfiguration maximumWindowDuration](self->_configuration, "maximumWindowDuration");
    v8 = v7;
    v20 = 0u;
    v21 = 0u;
    v22 = 0u;
    v23 = 0u;
    v9 = self->_samples;
    v10 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
    if (v10)
    {
      v11 = v10;
      v12 = 0;
      v13 = a3 - v8;
      v14 = *(_QWORD *)v21;
      v15 = 0.0;
      while (2)
      {
        v16 = 0;
        v17 = v11 + v12;
        do
        {
          if (*(_QWORD *)v21 != v14)
            objc_enumerationMutation(v9);
          objc_msgSend(*(id *)(*((_QWORD *)&v20 + 1) + 8 * v16), "_hd_trivialQuantitySampleValue", (_QWORD)v20);
          if (v19 >= v13)
          {
            v17 = v12 + v16;
            goto LABEL_12;
          }
          v15 = v15 + v18;
          ++v16;
        }
        while (v11 != v16);
        v11 = -[NSMutableArray countByEnumeratingWithState:objects:count:](v9, "countByEnumeratingWithState:objects:count:", &v20, v24, 16);
        v12 = v17;
        if (v11)
          continue;
        break;
      }
LABEL_12:

      if (v17)
      {
        -[NSMutableArray removeObjectsInRange:](self->_samples, "removeObjectsInRange:", 0, v17);
        self->_samplesSum = self->_samplesSum - v15;
      }
    }
    else
    {

    }
  }
}

- (void)addNextSampleValue:(double)a3 startTime:(double)a4
{
  uint64_t v7;
  void *v8;
  double v9;
  double v10;
  id v11;

  -[_HDRollingBaseline _assertValidNextStartTime:](self, "_assertValidNextStartTime:", a4);
  v7 = -[NSMutableArray count](self->_samples, "count");
  if (v7 == -[HKRollingBaselineConfiguration maximumSampleCount](self->_configuration, "maximumSampleCount"))
  {
    -[NSMutableArray firstObject](self->_samples, "firstObject");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_hd_trivialQuantitySampleValue");
    v10 = v9;

    -[NSMutableArray removeObjectAtIndex:](self->_samples, "removeObjectAtIndex:", 0);
    self->_samplesSum = self->_samplesSum - v10;
  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "_hd_valueWithTrivialQuantitySample:", a3, a4);
  v11 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_samples, "addObject:", v11);
  self->_samplesSum = self->_samplesSum + a3;

}

- (void)_assertValidNextStartTime:(double)a3
{
  void *v6;
  double v7;
  double v8;
  id v9;

  if (-[NSMutableArray count](self->_samples, "count"))
  {
    -[NSMutableArray lastObject](self->_samples, "lastObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "_hd_trivialQuantitySampleValue");
    v8 = v7;

    if (v8 > a3)
    {
      objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
      v9 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("HDRollingBaselineRelativeQuantityCalculator.m"), 275, CFSTR("Values must be added in ascending order by date for baseline calculations"));

    }
  }
}

- (void)addSupplementarySampleValue:(double)a3 startTime:(double)a4
{
  void *v8;
  id v9;

  if (-[_HDRollingBaseline hasSufficientDataToBaseline](self, "hasSufficientDataToBaseline"))
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v8 = (void *)objc_claimAutoreleasedReturnValue();

  }
  objc_msgSend(MEMORY[0x1E0CB3B18], "_hd_valueWithTrivialQuantitySample:", a3, a4);
  v9 = (id)objc_claimAutoreleasedReturnValue();
  -[NSMutableArray addObject:](self->_supplementarySamples, "addObject:", v9);
  self->_supplementarySamplesSum = self->_supplementarySamplesSum + a3;

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_supplementarySamples, 0);
  objc_storeStrong((id *)&self->_samples, 0);
  objc_storeStrong((id *)&self->_configuration, 0);
}

@end

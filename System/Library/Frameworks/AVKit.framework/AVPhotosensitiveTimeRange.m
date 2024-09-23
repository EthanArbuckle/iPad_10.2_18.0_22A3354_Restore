@implementation AVPhotosensitiveTimeRange

- (AVPhotosensitiveTimeRange)init
{
  __int128 v2;
  _OWORD v4[3];

  v2 = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 16);
  v4[0] = *MEMORY[0x1E0CA2E50];
  v4[1] = v2;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0CA2E50] + 32);
  return -[AVPhotosensitiveTimeRange initWithTimeRange:risk:](self, "initWithTimeRange:risk:", v4, 0.0);
}

- (AVPhotosensitiveTimeRange)initWithTimeRange:(id *)a3 risk:(double)a4
{
  AVPhotosensitiveTimeRange *result;
  __int128 v7;
  __int128 v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)AVPhotosensitiveTimeRange;
  result = -[AVPhotosensitiveTimeRange init](&v9, sel_init);
  v8 = *(_OWORD *)&a3->var0.var3;
  v7 = *(_OWORD *)&a3->var1.var1;
  *(_OWORD *)&result->_timeRange.start.value = *(_OWORD *)&a3->var0.var0;
  *(_OWORD *)&result->_timeRange.start.epoch = v8;
  *(_OWORD *)&result->_timeRange.duration.timescale = v7;
  result->_risk = a4;
  return result;
}

- (id)copyWithZone:(_NSZone *)a3
{
  id result;
  __int128 v5;
  __int128 v6;

  result = -[AVPhotosensitiveTimeRange init](+[AVPhotosensitiveTimeRange allocWithZone:](AVPhotosensitiveTimeRange, "allocWithZone:", a3), "init");
  v5 = *(_OWORD *)&self->_timeRange.start.epoch;
  v6 = *(_OWORD *)&self->_timeRange.duration.timescale;
  *(_OWORD *)((char *)result + 8) = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)((char *)result + 40) = v6;
  *(_OWORD *)((char *)result + 24) = v5;
  *((_QWORD *)result + 7) = *(_QWORD *)&self->_risk;
  return result;
}

- (void)encodeWithCoder:(id)a3
{
  double risk;
  id v5;
  __int128 v6;
  void *v7;
  _OWORD v8[3];

  risk = self->_risk;
  v5 = a3;
  objc_msgSend(v5, "encodeDouble:forKey:", CFSTR("risk"), risk);
  v6 = *(_OWORD *)&self->_timeRange.start.epoch;
  v8[0] = *(_OWORD *)&self->_timeRange.start.value;
  v8[1] = v6;
  v8[2] = *(_OWORD *)&self->_timeRange.duration.timescale;
  objc_msgSend(MEMORY[0x1E0CB3B18], "valueWithCMTimeRange:", v8);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "encodeObject:forKey:", v7, CFSTR("timeRange"));

}

- (AVPhotosensitiveTimeRange)initWithCoder:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  AVPhotosensitiveTimeRange *v7;
  _OWORD v9[3];
  __int128 v10;
  __int128 v11;
  __int128 v12;

  v4 = a3;
  objc_msgSend(v4, "decodeObjectOfClass:forKey:", objc_opt_class(), CFSTR("timeRange"));
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  v11 = 0u;
  v12 = 0u;
  v10 = 0u;
  if (v5)
    objc_msgSend(v5, "CMTimeRangeValue");
  objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("risk"));
  v9[0] = v10;
  v9[1] = v11;
  v9[2] = v12;
  v7 = -[AVPhotosensitiveTimeRange initWithTimeRange:risk:](self, "initWithTimeRange:risk:", v9);

  return v7;
}

- (NSArray)colors
{
  return (NSArray *)&unk_1E5BF3FD8;
}

- (id)description
{
  __int128 v3;
  __CFString *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  objc_super v10;
  CMTimeRange range;

  v3 = *(_OWORD *)&self->_timeRange.start.epoch;
  *(_OWORD *)&range.start.value = *(_OWORD *)&self->_timeRange.start.value;
  *(_OWORD *)&range.start.epoch = v3;
  *(_OWORD *)&range.duration.timescale = *(_OWORD *)&self->_timeRange.duration.timescale;
  v4 = (__CFString *)CMTimeRangeCopyDescription(0, &range);
  v5 = (void *)MEMORY[0x1E0CB3940];
  v10.receiver = self;
  v10.super_class = (Class)AVPhotosensitiveTimeRange;
  -[AVPhotosensitiveTimeRange description](&v10, sel_description);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_risk);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "stringWithFormat:", CFSTR("%@ timeRange: %@, risk: %@"), v6, v4, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- ($008D8879F9973785877FFE498A5CE36E)timeRange
{
  $008D8879F9973785877FFE498A5CE36E *result;

  objc_copyStruct(retstr, &self->_timeRange, 48, 1, 0);
  return result;
}

- (void)setTimeRange:(id *)a3
{
  objc_copyStruct(&self->_timeRange, a3, 48, 1, 0);
}

- (double)risk
{
  return self->_risk;
}

- (void)setRisk:(double)a3
{
  self->_risk = a3;
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

+ (id)timeRangesFromMetadata:(id)a3 initialDate:(id)a4
{
  id v5;
  id v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  void *v11;
  void *v12;
  void *v13;
  double v14;
  id v15;
  double v16;
  id v17;
  Float64 v18;
  Float64 v19;
  void *v20;
  uint64_t v21;
  double v22;
  uint64_t v23;
  uint64_t v24;
  uint64_t i;
  void *v26;
  void *v27;
  void *v28;
  int v29;
  void *v30;
  double v31;
  AVPhotosensitiveTimeRange *v32;
  AVPhotosensitiveTimeRange *v33;
  id v35;
  uint64_t v36;
  id v37;
  uint64_t v38;
  id v39;
  id obj;
  void *v41;
  void *v42;
  CMTime rhs;
  CMTime lhs;
  CMTime duration;
  CMTimeRange v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CMTime v51;
  CMTime v52;
  __int128 v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  _BYTE v57[128];
  _BYTE v58[128];
  uint64_t v59;

  v59 = *MEMORY[0x1E0C80C00];
  v5 = a3;
  v6 = a4;
  if (objc_msgSend(v5, "count"))
  {
    v39 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99DE8]), "initWithCapacity:", objc_msgSend(v5, "count"));
    v53 = 0u;
    v54 = 0u;
    v55 = 0u;
    v56 = 0u;
    v35 = v5;
    obj = v5;
    v7 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
    if (v7)
    {
      v8 = v7;
      v9 = *(_QWORD *)v54;
      v36 = *(_QWORD *)v54;
      v37 = v6;
      do
      {
        v10 = 0;
        v38 = v8;
        do
        {
          if (*(_QWORD *)v54 != v9)
            objc_enumerationMutation(obj);
          v11 = *(void **)(*((_QWORD *)&v53 + 1) + 8 * v10);
          objc_msgSend(v11, "startDate", v35);
          v12 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v11, "endDate");
          v13 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v12, "timeIntervalSinceDate:", v6);
          if (v14 < 0.0)
          {
            v15 = v6;

            v12 = v15;
          }
          objc_msgSend(v13, "timeIntervalSinceDate:", v6);
          if (v16 < 0.0)
          {
            v17 = v6;

            v13 = v17;
          }
          if ((objc_msgSend(v12, "isEqualToDate:", v13) & 1) == 0)
          {
            memset(&v52, 0, sizeof(v52));
            objc_msgSend(v12, "timeIntervalSinceDate:", v6);
            CMTimeMakeWithSeconds(&v52, v18, 1000);
            memset(&v51, 0, sizeof(v51));
            v42 = v13;
            objc_msgSend(v13, "timeIntervalSinceDate:", v6);
            CMTimeMakeWithSeconds(&v51, v19, 1000);
            v49 = 0u;
            v50 = 0u;
            v47 = 0u;
            v48 = 0u;
            objc_msgSend(v11, "items");
            v20 = (void *)objc_claimAutoreleasedReturnValue();
            v21 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
            v22 = 0.0;
            if (v21)
            {
              v23 = v21;
              v41 = v12;
              v24 = *(_QWORD *)v48;
              do
              {
                for (i = 0; i != v23; ++i)
                {
                  if (*(_QWORD *)v48 != v24)
                    objc_enumerationMutation(v20);
                  v26 = *(void **)(*((_QWORD *)&v47 + 1) + 8 * i);
                  objc_msgSend(v26, "key");
                  v27 = (void *)objc_claimAutoreleasedReturnValue();
                  objc_opt_class();
                  if ((objc_opt_isKindOfClass() & 1) != 0)
                  {
                    objc_msgSend(v26, "key");
                    v28 = (void *)objc_claimAutoreleasedReturnValue();
                    v29 = objc_msgSend(v28, "isEqualToString:", CFSTR("X-RISK-LEVEL"));

                    if (v29)
                    {
                      objc_msgSend(v26, "numberValue");
                      v30 = (void *)objc_claimAutoreleasedReturnValue();
                      objc_msgSend(v30, "doubleValue");
                      v22 = v31;

                      goto LABEL_23;
                    }
                  }
                  else
                  {

                  }
                }
                v23 = objc_msgSend(v20, "countByEnumeratingWithState:objects:count:", &v47, v57, 16);
              }
              while (v23);
LABEL_23:
              v9 = v36;
              v6 = v37;
              v8 = v38;
              v12 = v41;
            }

            v32 = [AVPhotosensitiveTimeRange alloc];
            lhs = v51;
            rhs = v52;
            CMTimeSubtract(&duration, &lhs, &rhs);
            lhs = v52;
            CMTimeRangeMake(&v46, &lhs, &duration);
            v33 = -[AVPhotosensitiveTimeRange initWithTimeRange:risk:](v32, "initWithTimeRange:risk:", &v46, v22 / 100.0);
            objc_msgSend(v39, "addObject:", v33);

            v13 = v42;
          }

          ++v10;
        }
        while (v10 != v8);
        v8 = objc_msgSend(obj, "countByEnumeratingWithState:objects:count:", &v53, v58, 16);
      }
      while (v8);
    }

    v5 = v35;
  }
  else
  {
    v39 = 0;
  }

  return v39;
}

@end

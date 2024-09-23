@implementation MMCSOperationStateTimeRange

- (MMCSOperationStateTimeRange)initWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v9;
  MMCSOperationStateTimeRange *v10;
  MMCSOperationStateTimeRange *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)MMCSOperationStateTimeRange;
  v10 = -[MMCSOperationStateTimeRange init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_operationState = a3;
    objc_storeStrong((id *)&v10->_startDate, a4);
    v11->_duration = a5;
  }

  return v11;
}

+ (id)stringForOperationState:(unint64_t)a3
{
  if (a3 > 2)
    return CFSTR("unknown");
  else
    return *(&off_1E9580C40 + a3);
}

+ (id)descriptionWithOperationState:(unint64_t)a3 absoluteStart:(double)a4 duration:(double)a5
{
  void *v7;
  void *v8;
  double v9;
  void *v10;

  v7 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend(a1, "stringForOperationState:", a3);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  mmcs_operation_metric_reference_time();
  objc_msgSend(v7, "stringWithFormat:", CFSTR("[%@ %0.3lf, %0.3lf]"), v8, a4 - v9, *(_QWORD *)&a5);
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  return v10;
}

- (NSString)description
{
  void *v3;
  unint64_t operationState;

  v3 = (void *)objc_opt_class();
  operationState = self->_operationState;
  -[MMCSOperationStateTimeRange absoluteStart](self, "absoluteStart");
  return (NSString *)objc_msgSend(v3, "descriptionWithOperationState:absoluteStart:duration:", operationState);
}

+ (id)describedSortedRanges:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  double v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  void *v16;
  double v17;

  v4 = a3;
  objc_msgSend(MEMORY[0x1E0CB37A0], "string");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v4, "count");
  if (v6)
  {
    v7 = v6;
    v8 = 0;
    v9 = 0.0;
    do
    {
      objc_msgSend(v4, "objectAtIndexedSubscript:", v8);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = v10;
      if (v8)
      {
        objc_msgSend(v10, "absoluteStart");
        if (v12 > v9)
        {
          objc_msgSend(v5, "appendString:", CFSTR(" "));
          objc_msgSend(v11, "absoluteStart");
          objc_msgSend(a1, "descriptionWithOperationState:absoluteStart:duration:", 2, v9, v13 - v9);
          v14 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v5, "appendString:", v14);

        }
        objc_msgSend(v5, "appendString:", CFSTR(" "));
        objc_msgSend(v11, "description");
        v15 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v15);

      }
      else
      {
        objc_msgSend(v10, "description");
        v16 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v5, "appendString:", v16);

        objc_msgSend(v11, "absoluteStop");
        v9 = v17;
      }

      ++v8;
    }
    while (v7 != v8);
  }

  return v5;
}

- (double)absoluteStart
{
  void *v2;
  double v3;
  double v4;

  -[MMCSOperationStateTimeRange startDate](self, "startDate");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "timeIntervalSinceReferenceDate");
  v4 = v3;

  return v4;
}

- (double)queueing
{
  double result;

  result = 0.0;
  if (!self->_operationState)
    return self->_duration;
  return result;
}

- (double)executing
{
  double result;

  result = 0.0;
  if (self->_operationState == 1)
    return self->_duration;
  return result;
}

- (int64_t)compareStartTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[MMCSOperationStateTimeRange absoluteStart](self, "absoluteStart");
  v6 = v5;
  objc_msgSend(v4, "absoluteStart");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (int64_t)compareStopTime:(id)a3
{
  id v4;
  double v5;
  double v6;
  double v7;
  double v8;

  v4 = a3;
  -[MMCSOperationStateTimeRange absoluteStop](self, "absoluteStop");
  v6 = v5;
  objc_msgSend(v4, "absoluteStop");
  v8 = v7;

  if (v6 < v8)
    return -1;
  else
    return v6 > v8;
}

- (double)absoluteStop
{
  double v3;
  double v4;
  double v5;

  -[MMCSOperationStateTimeRange absoluteStart](self, "absoluteStart");
  v4 = v3;
  -[MMCSOperationStateTimeRange duration](self, "duration");
  return v4 + v5;
}

- (double)relativeStart
{
  double v2;
  double v3;
  double v4;

  -[MMCSOperationStateTimeRange absoluteStart](self, "absoluteStart");
  v3 = v2;
  mmcs_operation_metric_reference_time();
  return v3 - v4;
}

- (unint64_t)operationState
{
  return self->_operationState;
}

- (NSDate)startDate
{
  return self->_startDate;
}

- (void)setStartDate:(id)a3
{
  objc_storeStrong((id *)&self->_startDate, a3);
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
}

@end

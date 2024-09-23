@implementation CNObservedResult

+ (id)resultWithTime:(unint64_t)a3 value:(id)a4
{
  return (id)objc_msgSend(a1, "resultWithTime:tolerance:value:", a3, 0, a4);
}

+ (id)resultWithTime:(unint64_t)a3 tolerance:(unint64_t)a4 value:(id)a5
{
  id v7;
  CNObservedResult *v8;

  v7 = a5;
  v8 = -[CNObservedResult initWithValue:time:tolerance:]([CNObservedResult alloc], "initWithValue:time:tolerance:", v7, a3, a4);

  return v8;
}

+ (id)resultWithTimeInterval:(double)a3 tolerance:(double)a4 value:(id)a5
{
  return (id)objc_msgSend(a1, "resultWithTime:tolerance:value:", (unint64_t)((double)0x2710uLL * a3), (unint64_t)((double)0x2710uLL * a4), a5);
}

+ (id)completionResultWithTime:(unint64_t)a3
{
  return (id)objc_msgSend(a1, "completionResultWithTime:tolerance:", a3, 0);
}

+ (id)completionResultWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  return -[CNObservedResult initWithValue:time:tolerance:]([CNObservedCompletionResult alloc], "initWithValue:time:tolerance:", 0, a3, a4);
}

+ (id)completionResultWithTimeInterval:(double)a3 tolerance:(double)a4
{
  return (id)objc_msgSend(a1, "completionResultWithTime:tolerance:", (unint64_t)((double)0x2710uLL * a3), (unint64_t)((double)0x2710uLL * a4));
}

+ (id)failureWithError:(id)a3 time:(unint64_t)a4
{
  return (id)objc_msgSend(a1, "failureWithError:time:tolerance:", a3, a4, 0);
}

+ (id)failureWithError:(id)a3 time:(unint64_t)a4 tolerance:(unint64_t)a5
{
  id v7;
  CNObservedFailureResult *v8;

  v7 = a3;
  v8 = -[CNObservedResult initWithValue:time:tolerance:]([CNObservedFailureResult alloc], "initWithValue:time:tolerance:", v7, a4, a5);

  return v8;
}

+ (id)failureWithError:(id)a3 timeInterval:(double)a4 tolerance:(double)a5
{
  return (id)objc_msgSend(a1, "failureWithError:time:tolerance:", a3, (unint64_t)((double)0x2710uLL * a4), (unint64_t)((double)0x2710uLL * a5));
}

- (CNObservedResult)initWithValue:(id)a3 time:(unint64_t)a4 tolerance:(unint64_t)a5
{
  id v9;
  CNObservedResult *v10;
  CNObservedResult *v11;
  CNObservedResult *v12;
  objc_super v14;

  v9 = a3;
  v14.receiver = self;
  v14.super_class = (Class)CNObservedResult;
  v10 = -[CNObservedResult init](&v14, sel_init);
  v11 = v10;
  if (v10)
  {
    objc_storeStrong(&v10->_value, a3);
    v11->_time = a4;
    v11->_tolerance = a5;
    v12 = v11;
  }

  return v11;
}

- (id)logValue
{
  return self->_value;
}

- (id)formattedTimeString
{
  id v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = objc_alloc_init(MEMORY[0x1E0CB37F0]);
  objc_msgSend(v3, "setPaddingPosition:", 1);
  objc_msgSend(v3, "setFormatWidth:", 6);
  objc_msgSend(MEMORY[0x1E0CB37A0], "stringWithString:", CFSTR("@ "));
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", self->_time);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringFromNumber:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "appendString:", v6);

  if (-[CNObservedResult tolerance](self, "tolerance"))
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedInteger:", -[CNObservedResult tolerance](self, "tolerance"));
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "appendFormat:", CFSTR(" +/- %@"), v7);

  }
  return v4;
}

- (id)description
{
  void *v3;
  objc_class *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = (objc_class *)objc_opt_class();
  NSStringFromClass(v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservedResult formattedTimeString](self, "formattedTimeString");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNObservedResult logValue](self, "logValue");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("<%@ %p: %@ Observed: %@>"), v5, self, v6, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  return v8;
}

- (BOOL)isResultEvent
{
  return 1;
}

- (BOOL)isEqual:(id)a3
{
  _QWORD *v4;
  objc_class *v5;
  void *v6;
  objc_class *v7;
  void *v8;
  int v9;
  NSUInteger v10;
  NSUInteger v11;
  NSUInteger v12;
  NSUInteger v13;
  void *v14;
  void *v15;
  char v16;
  NSRange v18;
  NSRange v19;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
    goto LABEL_8;
  v5 = (objc_class *)objc_opt_class();
  NSStringFromClass(v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v6, "isEqual:", v8);

  if (!v9)
    goto LABEL_8;
  v10 = -[CNObservedResult timeRange](self, "timeRange");
  v12 = v11;
  v19.location = objc_msgSend(v4, "timeRange");
  v19.length = v13;
  v18.location = v10;
  v18.length = v12;
  if (NSIntersectionRange(v18, v19).length)
  {
    -[CNObservedResult value](self, "value");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    if (v14 || v4[2])
    {
      -[CNObservedResult value](self, "value");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      v16 = objc_msgSend(v15, "isEqual:", v4[2]);

    }
    else
    {
      v16 = 1;
    }

  }
  else
  {
LABEL_8:
    v16 = 0;
  }

  return v16;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;
  _QWORD aBlock[5];
  _QWORD v6[5];

  aBlock[4] = self;
  v6[0] = MEMORY[0x1E0C809B0];
  v6[1] = 3221225472;
  v6[2] = __24__CNObservedResult_hash__block_invoke;
  v6[3] = &unk_1E29B9B10;
  v6[4] = self;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __24__CNObservedResult_hash__block_invoke_2;
  aBlock[3] = &unk_1E29B9B10;
  v2 = _Block_copy(aBlock);
  v3 = +[CNHashBuilder hashWithBlocks:](CNHashBuilder, "hashWithBlocks:", v6, v2, 0);

  return v3;
}

unint64_t __24__CNObservedResult_hash__block_invoke()
{
  objc_class *v0;
  void *v1;
  unint64_t v2;

  v0 = (objc_class *)objc_opt_class();
  NSStringFromClass(v0);
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

unint64_t __24__CNObservedResult_hash__block_invoke_2(uint64_t a1)
{
  void *v1;
  unint64_t v2;

  objc_msgSend(*(id *)(a1 + 32), "value");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  v2 = +[CNHashBuilder objectHash:](CNHashBuilder, "objectHash:", v1);

  return v2;
}

- (_NSRange)timeRange
{
  unint64_t tolerance;
  void *v4;
  unint64_t time;
  NSUInteger v6;
  NSUInteger v7;
  _NSRange result;

  tolerance = self->_tolerance;
  v4 = (void *)objc_opt_class();
  time = self->_time;
  if (tolerance)
    v6 = objc_msgSend(v4, "rangeWithTime:tolerance:", time, self->_tolerance);
  else
    v6 = objc_msgSend(v4, "rangeWithExactTime:", time);
  result.length = v7;
  result.location = v6;
  return result;
}

+ (_NSRange)rangeWithExactTime:(unint64_t)a3
{
  NSUInteger v4;
  _NSRange result;

  v4 = 1;
  result.length = v4;
  result.location = a3;
  return result;
}

+ (_NSRange)rangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  NSUInteger v7;
  NSUInteger v8;
  _NSRange result;

  if (objc_msgSend(a1, "rangeWouldUnderflowWithTime:tolerance:"))
  {
    v7 = objc_msgSend(a1, "underflowSafeRangeWithTime:tolerance:", a3, a4);
  }
  else if (objc_msgSend(a1, "rangeWouldOverflowWithTime:tolerance:", a3, a4))
  {
    v7 = objc_msgSend(a1, "overflowSafeRangeWithTime:tolerance:", a3, a4);
  }
  else
  {
    v7 = a3 - a4;
    v8 = (2 * a4) | 1;
  }
  result.length = v8;
  result.location = v7;
  return result;
}

+ (BOOL)rangeWouldUnderflowWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  return a3 < a4;
}

+ (_NSRange)underflowSafeRangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = a4 + a3;
  v5 = 0;
  result.length = v4;
  result.location = v5;
  return result;
}

+ (BOOL)rangeWouldOverflowWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  return -2 - a4 < a3;
}

+ (_NSRange)overflowSafeRangeWithTime:(unint64_t)a3 tolerance:(unint64_t)a4
{
  NSUInteger v4;
  NSUInteger v5;
  _NSRange result;

  v4 = a3 - a4;
  v5 = ~a3 + a4;
  result.length = v5;
  result.location = v4;
  return result;
}

- (unint64_t)time
{
  return self->_time;
}

- (id)value
{
  return objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)tolerance
{
  return self->_tolerance;
}

- (unint64_t)logTime
{
  return self->_logTime;
}

- (void).cxx_destruct
{
  objc_storeStrong(&self->_value, 0);
}

@end

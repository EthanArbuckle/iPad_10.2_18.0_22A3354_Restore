@implementation CKOperationStateTimeRange

- (int64_t)compareStopTime:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend_absoluteStop(self, v5, v6);
  v8 = v7;
  objc_msgSend_absoluteStop(v4, v9, v10);
  v12 = v11;

  if (v8 < v12)
    return -1;
  else
    return v8 > v12;
}

- (CKOperationStateTimeRange)initWithOperationState:(unint64_t)a3 startDate:(id)a4 duration:(double)a5
{
  id v9;
  CKOperationStateTimeRange *v10;
  CKOperationStateTimeRange *v11;
  objc_super v13;

  v9 = a4;
  v13.receiver = self;
  v13.super_class = (Class)CKOperationStateTimeRange;
  v10 = -[CKOperationStateTimeRange init](&v13, sel_init);
  v11 = v10;
  if (v10)
  {
    v10->_operationState = a3;
    objc_storeStrong((id *)&v10->_startDate, a4);
    v11->_duration = a5;
  }

  return v11;
}

- (int64_t)compareStartTime:(id)a3
{
  id v4;
  const char *v5;
  uint64_t v6;
  double v7;
  double v8;
  const char *v9;
  uint64_t v10;
  double v11;
  double v12;

  v4 = a3;
  objc_msgSend_absoluteStart(self, v5, v6);
  v8 = v7;
  objc_msgSend_absoluteStart(v4, v9, v10);
  v12 = v11;

  if (v8 < v12)
    return -1;
  else
    return v8 > v12;
}

- (double)absoluteStop
{
  uint64_t v2;
  double v4;
  double v5;
  const char *v6;
  uint64_t v7;
  double v8;

  objc_msgSend_absoluteStart(self, a2, v2);
  v5 = v4;
  objc_msgSend_duration(self, v6, v7);
  return v5 + v8;
}

- (double)absoluteStart
{
  uint64_t v2;
  void *v3;
  const char *v4;
  uint64_t v5;
  double v6;
  double v7;

  objc_msgSend_startDate(self, a2, v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_timeIntervalSinceReferenceDate(v3, v4, v5);
  v7 = v6;

  return v7;
}

- (NSDate)startDate
{
  return (NSDate *)objc_getProperty(self, a2, 16, 1);
}

- (unint64_t)operationState
{
  return self->_operationState;
}

- (double)duration
{
  return self->_duration;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_startDate, 0);
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

- (double)relativeStart
{
  uint64_t v2;
  double v3;
  double v4;
  double Current;

  objc_msgSend_absoluteStart(self, a2, v2);
  v4 = v3;
  Current = *(double *)&qword_1EF577A40;
  if (*(double *)&qword_1EF577A40 == 0.0)
  {
    Current = CFAbsoluteTimeGetCurrent();
    qword_1EF577A40 = *(_QWORD *)&Current;
  }
  return v4 - Current;
}

- (id)CKPropertiesDescription
{
  uint64_t v2;
  unint64_t v4;
  const char *v5;
  uint64_t v6;
  const __CFString *v7;
  void *v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  const char *v12;
  uint64_t v13;
  void *v14;

  v4 = objc_msgSend_operationState(self, a2, v2);
  if (v4 > 2)
    v7 = CFSTR("(UNKNOWN)");
  else
    v7 = off_1E7838640[v4];
  v8 = (void *)MEMORY[0x1E0CB3940];
  objc_msgSend_startDate(self, v5, v6);
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend_duration(self, v10, v11);
  objc_msgSend_stringWithFormat_(v8, v12, (uint64_t)CFSTR("startDate=%@, duration=%0.3f, state=%@"), v9, v13, v7);
  v14 = (void *)objc_claimAutoreleasedReturnValue();

  return v14;
}

- (NSString)description
{
  return (NSString *)((uint64_t (*)(CKOperationStateTimeRange *, char *))MEMORY[0x1E0DE7D20])(self, sel_CKDescription);
}

@end

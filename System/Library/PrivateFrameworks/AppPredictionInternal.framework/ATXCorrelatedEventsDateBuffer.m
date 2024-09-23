@implementation ATXCorrelatedEventsDateBuffer

- (ATXCorrelatedEventsDateBuffer)initWithBufferSeconds:(double)a3 andBufferType:(int64_t)a4
{
  ATXCorrelatedEventsDateBuffer *v4;
  NSObject *v5;
  ATXCorrelatedEventsDateBuffer *v6;
  ATXCorrelatedEventsDateBuffer *v9;
  objc_super v11;

  v4 = self;
  if (a4 < 3)
  {
    v11.receiver = self;
    v11.super_class = (Class)ATXCorrelatedEventsDateBuffer;
    v9 = -[ATXCorrelatedEventsDateBuffer init](&v11, sel_init);
    if (v9)
    {
      v9->_bufferSeconds = a3;
      v9->_bufferType = a4;
    }
    v4 = v9;
    v6 = v4;
  }
  else
  {
    __atxlog_handle_default();
    v5 = objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT))
      -[ATXCorrelatedEventsDateBuffer initWithBufferSeconds:andBufferType:].cold.1(v5);

    v6 = 0;
  }

  return v6;
}

- (id)startDateWithBufferForEvent:(id)a3
{
  id v5;
  void *v6;
  double v7;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXCorrelatedEventsDateBuffer.m"), 36, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v6 = (void *)MEMORY[0x1E0C99D68];
  v7 = -self->_bufferSeconds;
  if ((self->_bufferType | 2) == 2)
    objc_msgSend(v5, "startDate");
  else
    objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v8, v7);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (id)endDateWithBufferForEvent:(id)a3
{
  id v5;
  void *v6;
  double bufferSeconds;
  void *v8;
  void *v9;
  void *v11;

  v5 = a3;
  if (!v5)
  {
    objc_msgSend(MEMORY[0x1E0CB3488], "currentHandler");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "handleFailureInMethod:object:file:lineNumber:description:", a2, self, CFSTR("ATXCorrelatedEventsDateBuffer.m"), 48, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("event"));

  }
  v6 = (void *)MEMORY[0x1E0C99D68];
  bufferSeconds = self->_bufferSeconds;
  if ((unint64_t)(self->_bufferType - 1) > 1)
    objc_msgSend(v5, "startDate");
  else
    objc_msgSend(v5, "endDate");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "dateWithTimeInterval:sinceDate:", v8, bufferSeconds);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

- (double)bufferSeconds
{
  return self->_bufferSeconds;
}

- (int64_t)bufferType
{
  return self->_bufferType;
}

- (void)initWithBufferSeconds:(os_log_t)log andBufferType:.cold.1(os_log_t log)
{
  uint8_t v1[16];

  *(_WORD *)v1 = 0;
  _os_log_fault_impl(&dword_1C9A3B000, log, OS_LOG_TYPE_FAULT, "Tried to initialize an ATXCorrelatedEventsDateBuffer without specifying bufferSeconds or bufferType", v1, 2u);
}

@end

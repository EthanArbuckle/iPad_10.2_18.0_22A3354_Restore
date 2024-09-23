@implementation CMStepCounter

- (CMStepCounter)init
{
  CMStepCounter *v2;
  objc_super v4;

  v4.receiver = self;
  v4.super_class = (Class)CMStepCounter;
  v2 = -[CMStepCounter init](&v4, sel_init);
  if (v2)
    v2->_stepcounterProxy = objc_alloc_init(CMStepCounterProxy);
  return v2;
}

- (void)dealloc
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)CMStepCounter;
  -[CMStepCounter dealloc](&v3, sel_dealloc);
}

+ (BOOL)isStepCountingAvailable
{
  const char *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if ((sub_18F1F7758() & 1) != 0)
    return 0;
  else
    return objc_msgSend_isStepCountingAvailable(CMPedometer, v2, v3, v4, v5);
}

- (void)queryStepCountStartingFrom:(NSDate *)start to:(NSDate *)end toQueue:(NSOperationQueue *)queue withHandler:(CMStepQueryHandler)handler
{
  NSObject *v12;
  void *v13;
  const char *v14;
  void *v15;
  const char *v16;
  void *v17;
  const char *v18;
  void *v19;
  const char *v20;
  _QWORD block[9];

  if (start)
  {
    if (end)
      goto LABEL_3;
  }
  else
  {
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, (uint64_t)end, (uint64_t)queue);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMStepCounter.mm"), 218, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("start"));
    if (end)
    {
LABEL_3:
      if (queue)
        goto LABEL_4;
LABEL_8:
      v17 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v17, v18, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMStepCounter.mm"), 220, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
      if (handler)
        goto LABEL_5;
LABEL_9:
      v19 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue);
      objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v19, v20, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMStepCounter.mm"), 221, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
      goto LABEL_5;
    }
  }
  v15 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue);
  objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v15, v16, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMStepCounter.mm"), 219, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("end"));
  if (!queue)
    goto LABEL_8;
LABEL_4:
  if (!handler)
    goto LABEL_9;
LABEL_5:
  v12 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, (uint64_t)start, (uint64_t)end, (uint64_t)queue) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4B1700;
  block[3] = &unk_1E2955C48;
  block[4] = self;
  block[5] = start;
  block[6] = end;
  block[7] = queue;
  block[8] = handler;
  dispatch_async(v12, block);
}

- (void)startStepCountingUpdatesToQueue:(NSOperationQueue *)queue updateOn:(NSInteger)stepCounts withHandler:(CMStepUpdateHandler)handler
{
  NSObject *v10;
  void *v11;
  const char *v12;
  void *v13;
  const char *v14;
  _QWORD block[8];

  if (!queue)
  {
    v11 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, 0, stepCounts, (uint64_t)handler);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v11, v12, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMStepCounter.mm"), 237, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("queue"));
    if (handler)
      goto LABEL_3;
LABEL_5:
    v13 = (void *)objc_msgSend_currentHandler(MEMORY[0x1E0CB3488], a2, (uint64_t)queue, stepCounts, (uint64_t)handler);
    objc_msgSend_handleFailureInMethod_object_file_lineNumber_description_(v13, v14, (uint64_t)a2, (uint64_t)self, (uint64_t)CFSTR("CMStepCounter.mm"), 238, CFSTR("Invalid parameter not satisfying: %@"), CFSTR("handler"));
    goto LABEL_3;
  }
  if (!handler)
    goto LABEL_5;
LABEL_3:
  v10 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, (uint64_t)queue, stepCounts, (uint64_t)handler) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4B1924;
  block[3] = &unk_1E29568A8;
  block[4] = self;
  block[5] = queue;
  block[6] = handler;
  block[7] = stepCounts;
  dispatch_async(v10, block);
}

- (void)stopStepCountingUpdates
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, v2, v3, v4) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4B1C14;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (BOOL)enabled
{
  return 0;
}

- (void)getTotalCountToQueue:(id)a3 withHandler:(id)a4
{
  uint64_t v4;
  void *v7;
  const char *v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;

  v7 = (void *)objc_msgSend_date(MEMORY[0x1E0C99D68], a2, (uint64_t)a3, (uint64_t)a4, v4);
  v12 = objc_msgSend_dateByAddingTimeInterval_(v7, v8, v9, v10, v11, -5184000.0);
  MEMORY[0x1E0DE7D20](self, sel_queryStepCountStartingFrom_to_toQueue_withHandler_, v12, v7, a3);
}

- (void)deleteHistory
{
  uint64_t v2;
  uint64_t v3;
  uint64_t v4;
  NSObject *v6;
  _QWORD block[5];

  v6 = *(NSObject **)(objc_msgSend_stepcounterProxy(self, a2, v2, v3, v4) + 24);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = sub_18F4B1FFC;
  block[3] = &unk_1E2955938;
  block[4] = self;
  dispatch_sync(v6, block);
}

- (CMStepCounterProxy)stepcounterProxy
{
  return self->_stepcounterProxy;
}

@end

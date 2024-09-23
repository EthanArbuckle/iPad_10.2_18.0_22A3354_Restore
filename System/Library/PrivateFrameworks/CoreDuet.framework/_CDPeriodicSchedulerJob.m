@implementation _CDPeriodicSchedulerJob

- (_CDPeriodicSchedulerJob)init
{

  return 0;
}

+ (_CDPeriodicSchedulerJob)jobWithPeriod:(int64_t)a3 schedulerJobName:(id)a4 handler:(id)a5
{
  uint64_t *v8;
  uint64_t v9;
  uint64_t v10;
  const char *v11;
  NSObject *v12;
  id v13;
  id v14;
  dispatch_queue_t v15;
  _CDPeriodicSchedulerJob *v16;

  switch(a3)
  {
    case 1:
      v8 = (uint64_t *)MEMORY[0x1E0C807C0];
      goto LABEL_10;
    case 2:
      v8 = (uint64_t *)MEMORY[0x1E0C807D8];
      goto LABEL_10;
    case 3:
      v9 = 3 * *MEMORY[0x1E0C807C0];
      goto LABEL_8;
    case 4:
      v10 = 12 * *MEMORY[0x1E0C807C0];
      goto LABEL_11;
    case 5:
      v9 = 9 * *MEMORY[0x1E0C807C0];
LABEL_8:
      v10 = 2 * v9;
      goto LABEL_11;
    case 6:
      v8 = (uint64_t *)MEMORY[0x1E0C807B8];
      goto LABEL_10;
    default:
      v8 = (uint64_t *)MEMORY[0x1E0C807E8];
LABEL_10:
      v10 = *v8;
LABEL_11:
      v11 = (const char *)_CDPeriodicSchedulerDefaultQueueName;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v12 = objc_claimAutoreleasedReturnValue();
      v13 = a5;
      v14 = a4;
      v15 = dispatch_queue_create(v11, v12);

      v16 = -[_CDPeriodicSchedulerJob initWithPeriod:interval:schedulerJobName:queue:asynchronousHandler:handler:]([_CDPeriodicSchedulerJob alloc], "initWithPeriod:interval:schedulerJobName:queue:asynchronousHandler:handler:", a3, v14, v15, 0, v13, (double)v10);
      return v16;
  }
}

+ (_CDPeriodicSchedulerJob)jobWithInterval:(double)a3 schedulerJobName:(id)a4 handler:(id)a5
{
  uint64_t v8;
  const char *v9;
  NSObject *v10;
  id v11;
  id v12;
  dispatch_queue_t v13;
  _CDPeriodicSchedulerJob *v14;

  v8 = _MAPIntervalToCDPeriod((uint64_t)a3);
  v9 = (const char *)_CDPeriodicSchedulerDefaultQueueName;
  dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  v10 = objc_claimAutoreleasedReturnValue();
  v11 = a5;
  v12 = a4;
  v13 = dispatch_queue_create(v9, v10);

  v14 = -[_CDPeriodicSchedulerJob initWithPeriod:interval:schedulerJobName:queue:asynchronousHandler:handler:]([_CDPeriodicSchedulerJob alloc], "initWithPeriod:interval:schedulerJobName:queue:asynchronousHandler:handler:", v8, v12, v13, 0, v11, a3);
  return v14;
}

+ (_CDPeriodicSchedulerJob)jobWithInterval:(double)a3 schedulerJobName:(id)a4 queue:(id)a5 asynchronousHandler:(BOOL)a6 handler:(id)a7
{
  _BOOL8 v8;
  uint64_t v12;
  id v13;
  id v14;
  id v15;
  _CDPeriodicSchedulerJob *v16;

  v8 = a6;
  v12 = _MAPIntervalToCDPeriod((uint64_t)a3);
  v13 = a7;
  v14 = a5;
  v15 = a4;
  v16 = -[_CDPeriodicSchedulerJob initWithPeriod:interval:schedulerJobName:queue:asynchronousHandler:handler:]([_CDPeriodicSchedulerJob alloc], "initWithPeriod:interval:schedulerJobName:queue:asynchronousHandler:handler:", v12, v15, v14, v8, v13, a3);

  return v16;
}

- (_CDPeriodicSchedulerJob)initWithPeriod:(int64_t)a3 interval:(double)a4 schedulerJobName:(id)a5 queue:(id)a6 asynchronousHandler:(BOOL)a7 handler:(id)a8
{
  id v15;
  id v16;
  id v17;
  _CDPeriodicSchedulerJob *v18;
  _CDPeriodicSchedulerJob *v19;
  uint64_t v20;
  id handler;
  char *v22;
  char *v23;
  char *v24;
  OS_xpc_object *v25;
  OS_xpc_object *executionCriteria;
  uint64_t i;
  objc_super v29;
  xpc_object_t values[6];
  char *keys[7];

  keys[6] = *(char **)MEMORY[0x1E0C80C00];
  v15 = a5;
  v16 = a6;
  v17 = a8;
  v29.receiver = self;
  v29.super_class = (Class)_CDPeriodicSchedulerJob;
  v18 = -[_CDPeriodicSchedulerJob init](&v29, sel_init);
  v19 = v18;
  if (v18)
  {
    v18->_period = a3;
    v18->_interval = a4;
    objc_storeStrong((id *)&v18->_queue, a6);
    objc_storeStrong((id *)&v19->_jobName, a5);
    v19->_isHandlerAsynchronous = a7;
    v20 = MEMORY[0x193FEEAF4](v17);
    handler = v19->_handler;
    v19->_handler = (id)v20;

    v22 = (char *)*MEMORY[0x1E0C80898];
    keys[0] = *(char **)MEMORY[0x1E0C807A8];
    keys[1] = v22;
    v23 = (char *)*MEMORY[0x1E0C808D8];
    keys[2] = *(char **)MEMORY[0x1E0C80878];
    keys[3] = v23;
    v24 = (char *)*MEMORY[0x1E0C808B8];
    keys[4] = *(char **)MEMORY[0x1E0C80868];
    keys[5] = v24;
    values[0] = xpc_int64_create((uint64_t)a4);
    values[1] = xpc_BOOL_create(1);
    values[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80880]);
    values[3] = xpc_BOOL_create(1);
    values[4] = xpc_BOOL_create(1);
    values[5] = xpc_BOOL_create(1);
    v25 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 6uLL);
    executionCriteria = v19->_executionCriteria;
    v19->_executionCriteria = v25;

    for (i = 5; i != -1; --i)
  }

  return v19;
}

- (void)setExecutionCriteria:(id)a3
{
  id v5;
  void *v6;
  BOOL v7;
  void *v8;
  id v9;

  v5 = a3;
  v6 = v5;
  if (v5)
  {
    v9 = v5;
    v7 = xpc_equal(v5, self->_executionCriteria);
    v6 = v9;
    if (!v7)
    {
      objc_storeStrong((id *)&self->_executionCriteria, a3);
      +[_CDPeriodicScheduler sharedInstance](_CDPeriodicScheduler, "sharedInstance");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "updateExecutionCriteriaOnJob:", self);

      v6 = v9;
    }
  }

}

- (int64_t)period
{
  return self->_period;
}

- (double)interval
{
  return self->_interval;
}

- (NSString)jobName
{
  return (NSString *)objc_getProperty(self, a2, 24, 1);
}

- (OS_dispatch_queue)queue
{
  return (OS_dispatch_queue *)objc_getProperty(self, a2, 32, 1);
}

- (id)handler
{
  return objc_getProperty(self, a2, 40, 1);
}

- (OS_xpc_object)executionCriteria
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 48, 1);
}

- (OS_xpc_object)activity
{
  return (OS_xpc_object *)objc_getProperty(self, a2, 64, 1);
}

- (void)setActivity:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (BOOL)isHandlerAsynchronous
{
  return self->_isHandlerAsynchronous;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activity, 0);
  objc_storeStrong((id *)&self->_executionCriteria, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong((id *)&self->_jobName, 0);
}

@end

@implementation _KSSystemTask

- (_KSSystemTask)init
{

  return 0;
}

- (_KSSystemTask)initWithName:(id)a3 isPeriodic:(BOOL)a4 period:(unint64_t)a5 handler:(id)a6
{
  id v10;
  id v11;
  void *v12;
  _KSSystemTask *v13;
  _KSSystemTask *v14;
  uint64_t v15;
  NSString *name;
  unint64_t v17;
  uint64_t v18;
  id handler;
  NSObject *v20;
  dispatch_queue_t v21;
  OS_dispatch_queue *queue;
  char *v23;
  char *v24;
  char *v25;
  OS_xpc_object *v26;
  OS_xpc_object *executionCriteria;
  uint64_t i;
  objc_super v30;
  xpc_object_t values[7];
  char *keys[8];

  keys[7] = *(char **)MEMORY[0x24BDAC8D0];
  v10 = a3;
  v11 = a6;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v30.receiver = self;
    v30.super_class = (Class)_KSSystemTask;
    v14 = -[_KSSystemTask init](&v30, sel_init);
    if (v14)
    {
      v15 = objc_msgSend(v10, "copy");
      name = v14->_name;
      v14->_name = (NSString *)v15;

      v17 = 5;
      if (a5 > 5)
        v17 = a5;
      v14->_periodSeconds = v17;
      v18 = MEMORY[0x2207A8D04](v12);
      handler = v14->_handler;
      v14->_handler = (id)v18;

      v14->_maxRunTime = 300.0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_queue_create("com.apple._KSTasks.defaultQueue", v20);
      queue = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v21;

      v23 = (char *)*MEMORY[0x24BDAC6B8];
      keys[0] = *(char **)MEMORY[0x24BDAC5F0];
      keys[1] = v23;
      v24 = (char *)*MEMORY[0x24BDAC6E8];
      keys[2] = *(char **)MEMORY[0x24BDAC698];
      keys[3] = v24;
      v25 = (char *)*MEMORY[0x24BDAC598];
      keys[4] = *(char **)MEMORY[0x24BDAC6E0];
      keys[5] = v25;
      keys[6] = *(char **)MEMORY[0x24BDAC6D0];
      values[0] = xpc_int64_create(v14->_periodSeconds);
      values[1] = xpc_BOOL_create(a4);
      values[2] = xpc_string_create((const char *)*MEMORY[0x24BDAC6A8]);
      values[3] = xpc_BOOL_create(1);
      values[4] = xpc_BOOL_create(1);
      values[5] = xpc_BOOL_create(0);
      values[6] = xpc_BOOL_create(1);
      v26 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 7uLL);
      executionCriteria = v14->_executionCriteria;
      v14->_executionCriteria = v26;

      for (i = 6; i != -1; --i)
    }
    self = v14;
    v13 = self;
  }

  return v13;
}

- (_KSSystemTask)initWithName:(id)a3 delay:(unint64_t)a4 handler:(id)a5
{
  id v8;
  id v9;
  void *v10;
  _KSSystemTask *v11;
  _KSSystemTask *v12;
  uint64_t v13;
  NSString *name;
  uint64_t v15;
  id handler;
  NSObject *v17;
  dispatch_queue_t v18;
  OS_dispatch_queue *queue;
  char *v20;
  char *v21;
  char *v22;
  OS_xpc_object *v23;
  OS_xpc_object *executionCriteria;
  uint64_t i;
  objc_super v27;
  xpc_object_t values[7];
  char *keys[8];

  keys[7] = *(char **)MEMORY[0x24BDAC8D0];
  v8 = a3;
  v9 = a5;
  v10 = v9;
  v11 = 0;
  if (v8 && v9)
  {
    v27.receiver = self;
    v27.super_class = (Class)_KSSystemTask;
    v12 = -[_KSSystemTask init](&v27, sel_init);
    if (v12)
    {
      v13 = objc_msgSend(v8, "copy");
      name = v12->_name;
      v12->_name = (NSString *)v13;

      v15 = MEMORY[0x2207A8D04](v10);
      handler = v12->_handler;
      v12->_handler = (id)v15;

      v12->_maxRunTime = 300.0;
      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v17 = objc_claimAutoreleasedReturnValue();
      v18 = dispatch_queue_create("com.apple._KSTasks.defaultQueue", v17);
      queue = v12->_queue;
      v12->_queue = (OS_dispatch_queue *)v18;

      v20 = (char *)*MEMORY[0x24BDAC6B8];
      keys[0] = *(char **)MEMORY[0x24BDAC5F0];
      keys[1] = v20;
      v21 = (char *)*MEMORY[0x24BDAC698];
      keys[2] = *(char **)MEMORY[0x24BDAC5B8];
      keys[3] = v21;
      v22 = (char *)*MEMORY[0x24BDAC6E0];
      keys[4] = *(char **)MEMORY[0x24BDAC6E8];
      keys[5] = v22;
      keys[6] = *(char **)MEMORY[0x24BDAC6D0];
      values[0] = xpc_int64_create(a4);
      values[1] = xpc_BOOL_create(0);
      values[2] = xpc_int64_create(a4);
      values[3] = xpc_string_create((const char *)*MEMORY[0x24BDAC6A8]);
      values[4] = xpc_BOOL_create(1);
      values[5] = xpc_BOOL_create(1);
      values[6] = xpc_BOOL_create(1);
      v23 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 7uLL);
      executionCriteria = v12->_executionCriteria;
      v12->_executionCriteria = v23;

      for (i = 6; i != -1; --i)
    }
    self = v12;
    v11 = self;
  }

  return v11;
}

- (unint64_t)periodSeconds
{
  return self->_periodSeconds;
}

- (NSString)name
{
  return self->_name;
}

- (id)handler
{
  return self->_handler;
}

- (double)maxRunTime
{
  return self->_maxRunTime;
}

- (void)setMaxRunTime:(double)a3
{
  self->_maxRunTime = a3;
}

- (double)checkInTime
{
  return self->_checkInTime;
}

- (void)setCheckInTime:(double)a3
{
  self->_checkInTime = a3;
}

- (OS_dispatch_queue)queue
{
  return self->_queue;
}

- (OS_xpc_object)executionCriteria
{
  return self->_executionCriteria;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_executionCriteria, 0);
  objc_storeStrong((id *)&self->_queue, 0);
  objc_storeStrong(&self->_handler, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

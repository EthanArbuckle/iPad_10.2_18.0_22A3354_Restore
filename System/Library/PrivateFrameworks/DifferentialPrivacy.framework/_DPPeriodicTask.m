@implementation _DPPeriodicTask

- (_DPPeriodicTask)init
{

  return 0;
}

- (_DPPeriodicTask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5
{
  return -[_DPPeriodicTask initWithName:period:handler:networkingRequired:](self, "initWithName:period:handler:networkingRequired:", a3, a4, a5, 0);
}

- (_DPPeriodicTask)initWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5 networkingRequired:(BOOL)a6
{
  id v10;
  id v11;
  void *v12;
  _DPPeriodicTask *v13;
  _DPPeriodicTask *v14;
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
  OS_xpc_object *v28;
  const char *v29;
  xpc_object_t v30;
  uint64_t i;
  objc_super v33;
  xpc_object_t values[6];
  char *keys[7];

  keys[6] = *(char **)MEMORY[0x1E0C80C00];
  v10 = a3;
  v11 = a5;
  v12 = v11;
  v13 = 0;
  if (v10 && v11)
  {
    v33.receiver = self;
    v33.super_class = (Class)_DPPeriodicTask;
    v14 = -[_DPPeriodicTask init](&v33, sel_init);
    if (v14)
    {
      v15 = objc_msgSend(v10, "copy");
      name = v14->_name;
      v14->_name = (NSString *)v15;

      v14->_networkingRequired = a6;
      v17 = 5;
      if (a4 > 5)
        v17 = a4;
      v14->_periodSeconds = v17;
      v18 = MEMORY[0x1D8256D34](v12);
      handler = v14->_handler;
      v14->_handler = (id)v18;

      dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
      v20 = objc_claimAutoreleasedReturnValue();
      v21 = dispatch_queue_create("com.apple._DPPeriodicTasks.defaultQueue", v20);
      queue = v14->_queue;
      v14->_queue = (OS_dispatch_queue *)v21;

      v23 = (char *)*MEMORY[0x1E0C80898];
      keys[0] = *(char **)MEMORY[0x1E0C807A8];
      keys[1] = v23;
      v24 = (char *)*MEMORY[0x1E0C808D8];
      keys[2] = *(char **)MEMORY[0x1E0C80878];
      keys[3] = v24;
      v25 = (char *)*MEMORY[0x1E0C808B8];
      keys[4] = *(char **)MEMORY[0x1E0C80868];
      keys[5] = v25;
      values[0] = xpc_int64_create(v14->_periodSeconds);
      values[1] = xpc_BOOL_create(1);
      values[2] = xpc_string_create((const char *)*MEMORY[0x1E0C80880]);
      values[3] = xpc_BOOL_create(1);
      values[4] = xpc_BOOL_create(1);
      values[5] = xpc_BOOL_create(1);
      v26 = (OS_xpc_object *)xpc_dictionary_create((const char *const *)keys, values, 6uLL);
      executionCriteria = v14->_executionCriteria;
      v14->_executionCriteria = v26;

      if (v14->_networkingRequired)
      {
        v28 = v14->_executionCriteria;
        v29 = (const char *)*MEMORY[0x1E0C808C8];
        v30 = xpc_BOOL_create(1);
        xpc_dictionary_set_BOOL(v28, v29, v30 != 0);

      }
      for (i = 5; i != -1; --i)

    }
    self = v14;
    v13 = self;
  }

  return v13;
}

+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5
{
  id v7;
  id v8;
  void *v9;

  v7 = a5;
  v8 = a3;
  objc_msgSend((id)objc_opt_class(), "taskWithName:period:handler:networkingRequired:", v8, a4, v7, 0);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  return v9;
}

+ (id)taskWithName:(id)a3 period:(unint64_t)a4 handler:(id)a5 networkingRequired:(BOOL)a6
{
  _BOOL8 v6;
  id v10;
  id v11;
  void *v12;

  v6 = a6;
  v10 = a5;
  v11 = a3;
  v12 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithName:period:handler:networkingRequired:", v11, a4, v10, v6);

  return v12;
}

- (unint64_t)periodSeconds
{
  return self->_periodSeconds;
}

- (NSString)name
{
  return self->_name;
}

- (BOOL)networkingRequired
{
  return self->_networkingRequired;
}

- (id)handler
{
  return self->_handler;
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

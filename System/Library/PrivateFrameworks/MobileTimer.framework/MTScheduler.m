@implementation MTScheduler

+ (unsigned)defaultPriority
{
  return 0;
}

+ (id)serialSchedulerWithName:(id)a3 priority:(unsigned int)a4
{
  NSObject *v5;
  dispatch_queue_t v6;
  void *v7;

  dispatch_queue_attr_make_with_qos_class(0, (dispatch_qos_class_t)a4, -1);
  v5 = objc_claimAutoreleasedReturnValue();
  v6 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), v5);
  +[MTScheduler serialSchedulerWithQueue:](MTScheduler, "serialSchedulerWithQueue:", v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)serialSchedulerWithQueue:(id)a3
{
  id v3;
  _MTSerialQueueScheduler *v4;

  v3 = a3;
  v4 = -[_MTSerialQueueScheduler initWithQueue:]([_MTSerialQueueScheduler alloc], "initWithQueue:", v3);

  return v4;
}

+ (id)serialSchedulerWithName:(id)a3
{
  dispatch_queue_t v4;
  void *v5;

  v4 = dispatch_queue_create((const char *)objc_msgSend(objc_retainAutorelease(a3), "UTF8String"), 0);
  objc_msgSend(a1, "serialSchedulerWithQueue:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)serialSchedulerForObject:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@.serial"), objc_opt_class());
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serialSchedulerWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

+ (id)serialSchedulerForObject:(id)a3 priority:(unsigned int)a4
{
  uint64_t v4;
  void *v6;
  void *v7;

  v4 = *(_QWORD *)&a4;
  objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("com.apple.%@.serial"), objc_opt_class());
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "serialSchedulerWithName:priority:", v6, v4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

+ (id)globalAsyncSchedulerWithPriority:(unsigned int)a3
{
  _MTSerialQueueScheduler *v4;
  void *v5;
  _MTSerialQueueScheduler *v6;

  v4 = [_MTSerialQueueScheduler alloc];
  dispatch_get_global_queue(a3, 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = -[_MTSerialQueueScheduler initWithQueue:](v4, "initWithQueue:", v5);

  return v6;
}

@end

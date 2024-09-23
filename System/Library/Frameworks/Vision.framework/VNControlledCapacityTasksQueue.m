@implementation VNControlledCapacityTasksQueue

- (void)dispatchSyncByPreservingQueueCapacity:(id)a3
{
  NSObject *semaphore;
  id v5;

  semaphore = self->_semaphore;
  v5 = a3;
  dispatch_semaphore_wait(semaphore, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_sync((dispatch_queue_t)self->_queue, v5);

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
}

- (BOOL)currentQueueIsSynchronizationQueue
{
  const char *label;
  const char *v3;

  label = dispatch_queue_get_label((dispatch_queue_t)self->_queue);
  +[VNError VNAssert:log:](VNError, "VNAssert:log:", label != 0, CFSTR("Synchronization queue must be initialized"));
  v3 = dispatch_queue_get_label(0);
  if (v3)
    LOBYTE(v3) = strcmp(label, v3) == 0;
  return (char)v3;
}

+ (void)setTasksTimeout:(int64_t)a3
{
  os_unfair_lock_lock((os_unfair_lock_t)&_tasksTimeoutLock);
  _tasksTimeout = a3;
  os_unfair_lock_unlock((os_unfair_lock_t)&_tasksTimeoutLock);
}

- (void)dispatchReportBlockCompletion
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;

  dispatch_semaphore_signal((dispatch_semaphore_t)self->_semaphore);
  VNValidatedLog(1, (uint64_t)CFSTR("Finished processing a task from the queue: %@"), v3, v4, v5, v6, v7, v8, (uint64_t)self->_queue);
}

- (BOOL)dispatchGroupWait:(id)a3 error:(id *)a4
{
  NSObject *v5;
  int64_t v6;
  dispatch_time_t v7;
  intptr_t v8;
  intptr_t v9;

  v5 = a3;
  v6 = +[VNControlledCapacityTasksQueue tasksTimeout](VNControlledCapacityTasksQueue, "tasksTimeout");
  if (v6 < 1)
    v7 = -1;
  else
    v7 = dispatch_time(0, v6);
  v8 = dispatch_group_wait(v5, v7);
  v9 = v8;
  if (a4 && v8)
  {
    +[VNError errorForExecutionTimeoutWithLocalizedDescription:](VNError, "errorForExecutionTimeoutWithLocalizedDescription:", CFSTR("Timed out waiting for dispatch_group_wait completion"));
    *a4 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v9 == 0;
}

+ (int64_t)tasksTimeout
{
  return _tasksTimeout;
}

- (void)dispatchGroupAsyncByPreservingQueueCapacity:(id)a3 block:(id)a4
{
  NSObject *semaphore;
  id v7;
  NSObject *group;

  semaphore = self->_semaphore;
  v7 = a4;
  group = a3;
  dispatch_semaphore_wait(semaphore, 0xFFFFFFFFFFFFFFFFLL);
  dispatch_group_async(group, (dispatch_queue_t)self->_queue, v7);

}

- (VNControlledCapacityTasksQueue)initWithDispatchQueueLabel:(id)a3 maximumTasksCount:(int64_t)a4
{
  id v6;
  VNControlledCapacityTasksQueue *v7;
  VNControlledCapacityTasksQueue *v8;
  VNControlledCapacityTasksQueue *v9;
  const char *v10;
  NSObject *v11;
  dispatch_queue_t v12;
  OS_dispatch_queue *queue;
  dispatch_semaphore_t v14;
  OS_dispatch_semaphore *semaphore;
  objc_super v17;

  v6 = a3;
  v17.receiver = self;
  v17.super_class = (Class)VNControlledCapacityTasksQueue;
  v7 = -[VNControlledCapacityTasksQueue init](&v17, sel_init);
  v8 = v7;
  v9 = 0;
  if (a4 >= 1 && v7)
  {
    v10 = (const char *)objc_msgSend(objc_retainAutorelease(v6), "UTF8String");
    objc_msgSend((id)objc_opt_class(), "dispatchQueueAttribute");
    v11 = objc_claimAutoreleasedReturnValue();
    v12 = dispatch_queue_create(v10, v11);
    queue = v8->_queue;
    v8->_queue = (OS_dispatch_queue *)v12;

    v8->_maximumTasksCount = a4;
    v14 = dispatch_semaphore_create(a4);
    semaphore = v8->_semaphore;
    v8->_semaphore = (OS_dispatch_semaphore *)v14;

    v9 = v8;
  }

  return v9;
}

- (void)setMaximumTasksCount:(int64_t)a3
{
  OS_dispatch_semaphore *v4;
  OS_dispatch_semaphore *semaphore;
  uint64_t v6;

  if (a3 <= 0)
  {
    v6 = objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Maximum queue tasks count (%ld) must be a positive number"), a3);
    +[VNError VNAssert:log:](VNError, "VNAssert:log:", 0);
    semaphore = (OS_dispatch_semaphore *)v6;
  }
  else
  {
    self->_maximumTasksCount = a3;
    v4 = (OS_dispatch_semaphore *)dispatch_semaphore_create(a3);
    semaphore = self->_semaphore;
    self->_semaphore = v4;
  }

}

- (int64_t)maximumTasksCount
{
  return self->_maximumTasksCount;
}

- (id)description
{
  return objc_autoreleaseReturnValue((id)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3940]), "initWithFormat:", CFSTR("Controlled Capacity Tasks Queue: %@; %@"),
                                           self->_queue,
                                           self->_semaphore));
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_semaphore, 0);
  objc_storeStrong((id *)&self->_queue, 0);
}

@end

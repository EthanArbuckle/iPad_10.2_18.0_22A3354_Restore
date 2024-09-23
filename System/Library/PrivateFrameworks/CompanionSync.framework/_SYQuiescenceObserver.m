@implementation _SYQuiescenceObserver

+ (BOOL)isQuiescenceEnabled
{
  return 0;
}

+ (id)sharedInstance
{
  return 0;
}

- (_SYQuiescenceObserver)init
{

  return 0;
}

- (void)registerQueue:(id)a3
{
  id v4;
  NSPointerArray *v5;
  id v6;

  v4 = a3;
  if (v4)
  {
    v6 = v4;
    v5 = self->_quiescenceQueues;
    objc_sync_enter(v5);
    -[NSPointerArray addPointer:](self->_quiescenceQueues, "addPointer:", v6);
    objc_sync_exit(v5);

    v4 = v6;
  }

}

- (BOOL)waitForQuiescenceWithTimeout:(double)a3
{
  dispatch_time_t v5;
  void *v6;
  BOOL v7;

  if (a3 >= 0.0)
    v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  else
    v5 = -1;
  _EnqueueOnNewGroup(self->_quiescenceQueues);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = _dispatch_group_wait_off_main_thread(v6, v5, a3) == 0;

  return v7;
}

- (void)notifyOnQuiescence:(id)a3
{
  NSPointerArray *quiescenceQueues;
  id v4;
  NSObject *v5;
  NSObject *group;

  quiescenceQueues = self->_quiescenceQueues;
  v4 = a3;
  _EnqueueOnNewGroup(quiescenceQueues);
  group = objc_claimAutoreleasedReturnValue();
  dispatch_get_global_queue(21, 0);
  v5 = objc_claimAutoreleasedReturnValue();
  dispatch_group_notify(group, v5, v4);

}

- (void)incrementAllocationCount:(id)a3
{
  uint64_t v3;
  void *v5;
  NSMutableSet *v6;
  id v7;

  v7 = a3;
  v5 = (void *)objc_opt_new();
  objc_msgSend(v5, "setObject:", v7);
  objc_msgSend(v5, "setReturnAddress:", v3);
  v6 = self->_allocations;
  objc_sync_enter(v6);
  -[NSMutableSet addObject:](self->_allocations, "addObject:", v5);
  objc_sync_exit(v6);

  dispatch_group_enter((dispatch_group_t)self->_allocationGroup);
}

- (void)decrementAllocationCount:(id)a3
{
  NSMutableSet *v4;
  id v5;

  v5 = a3;
  v4 = self->_allocations;
  objc_sync_enter(v4);
  _CleanupAllocations(self->_allocations);
  objc_sync_exit(v4);

  dispatch_group_leave((dispatch_group_t)self->_allocationGroup);
}

- (BOOL)waitForDeallocationCompleteWithTimeout:(double)a3
{
  dispatch_time_t v5;
  intptr_t v6;
  NSMutableSet *v7;

  if (a3 >= 0.0)
    v5 = dispatch_time(0, (uint64_t)(a3 * 1000000000.0));
  else
    v5 = -1;
  v6 = _dispatch_group_wait_off_main_thread(self->_allocationGroup, v5, a3);
  v7 = self->_allocations;
  objc_sync_enter(v7);
  _CleanupAllocations(self->_allocations);
  objc_sync_exit(v7);

  if (v6)
    NSLog(CFSTR("ARGH, break here plz"));
  return v6 == 0;
}

- (void)notifyOnDeallocationComplete:(id)a3
{
  void *v4;
  NSObject *allocationGroup;
  NSObject *v6;
  id v7;
  _QWORD block[4];
  id v9;

  v4 = (void *)objc_msgSend(a3, "copy");
  allocationGroup = self->_allocationGroup;
  dispatch_get_global_queue(21, 0);
  v6 = objc_claimAutoreleasedReturnValue();
  block[0] = MEMORY[0x24BDAC760];
  block[1] = 3221225472;
  block[2] = __54___SYQuiescenceObserver_notifyOnDeallocationComplete___block_invoke;
  block[3] = &unk_24CC65FB8;
  v9 = v4;
  v7 = v4;
  dispatch_group_notify(allocationGroup, v6, block);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_allocations, 0);
  objc_storeStrong((id *)&self->_allocationGroup, 0);
  objc_storeStrong((id *)&self->_quiescenceQueues, 0);
}

@end

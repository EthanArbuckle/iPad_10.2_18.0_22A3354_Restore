@implementation HandsDispatchHelpers

+ (id)createPthreadBackedGCDQueueWithKey:(id)a3 width:(unsigned __int8)a4
{
  id v4;
  void *v5;
  sched_param v7;
  pthread_attr_t v8;
  uint64_t v9;

  v9 = *MEMORY[0x24BDAC8D0];
  v4 = objc_retainAutorelease(a3);
  objc_msgSend(v4, "UTF8String");
  if (pthread_attr_init(&v8))
  {
    v5 = 0;
  }
  else
  {
    if (pthread_attr_setschedpolicy(&v8, 4)
      || pthread_attr_getschedparam(&v8, &v7)
      || (v7.sched_priority = 60, pthread_attr_setschedparam(&v8, &v7))
      || pthread_attr_setdetachstate(&v8, 1))
    {
      v5 = 0;
    }
    else
    {
      v5 = (void *)dispatch_pthread_root_queue_create();
    }
    pthread_attr_destroy(&v8);
  }

  return v5;
}

uint64_t __65__HandsDispatchHelpers_createPthreadBackedGCDQueueWithKey_width___block_invoke(uint64_t a1)
{
  return pthread_setname_np(*(const char **)(a1 + 32));
}

+ (id)createHighPriorityQueueWithKey:(id)a3
{
  id v3;
  void *v4;

  v3 = a3;
  if (!v3)
    abort();
  objc_msgSend((id)objc_opt_class(), "createPthreadBackedGCDQueueWithKey:width:", v3, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

@end

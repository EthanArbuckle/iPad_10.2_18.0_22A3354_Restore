@implementation _PFTask

- (void)release
{
  int *p_cd_rc;
  int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 - 1, (unsigned int *)p_cd_rc));
  if (v3 <= 0)
  {
    self->_cd_rc += 0x20000000;
    -[_PFTask dealloc](self, "dealloc");
  }
}

- (_PFTask)initWithFunction:(void *)a3 withArgument:(void *)a4 andPriority:(int)a5
{
  _PFTask *v8;
  NSObject *global_queue;

  v8 = self;
  pthread_mutex_init(&self->lock, 0);
  pthread_cond_init(&v8->condition, 0);
  v8->isFinishedFlag = 0;
  v8->_task = a3;
  v8->arguments = a4;
  CFRetain(v8);
  __dmb(0xBu);
  global_queue = dispatch_get_global_queue(a5, 2uLL);
  if (global_queue)
  {
    dispatch_async_f(global_queue, v8, (dispatch_function_t)minion_duties2);
  }
  else
  {
    CFRelease(v8);

    return 0;
  }
  return v8;
}

- (_PFTask)retain
{
  int *p_cd_rc;
  unsigned int v3;

  p_cd_rc = &self->_cd_rc;
  do
    v3 = __ldxr((unsigned int *)p_cd_rc);
  while (__stxr(v3 + 1, (unsigned int *)p_cd_rc));
  return self;
}

- (void)dealloc
{
  void *arguments;
  malloc_zone_t *v4;
  objc_super v5;

  pthread_cond_destroy(&self->condition);
  pthread_mutex_destroy(&self->lock);
  arguments = self->arguments;
  if (arguments)
  {
    v4 = (malloc_zone_t *)_PF_Private_Malloc_Zone;
    if (!_PF_Private_Malloc_Zone)
    {
      v4 = malloc_default_zone();
      arguments = self->arguments;
    }
    malloc_zone_free(v4, arguments);
    self->arguments = 0;
  }
  v5.receiver = self;
  v5.super_class = (Class)_PFTask;
  -[_PFTask dealloc](&v5, sel_dealloc);
}

+ (uint64_t)getNumActiveProcessors
{
  size_t v1;
  unsigned int v2;

  objc_opt_self();
  v2 = 0;
  v1 = 4;
  sysctlbyname("hw.activecpu", &v2, &v1, 0, 0);
  return v2;
}

+ (uint64_t)getPhysicalMemory
{
  size_t v1;
  uint64_t v2;

  objc_opt_self();
  v1 = 8;
  v2 = 0;
  if (sysctlbyname("hw.memsize", &v2, &v1, 0, 0))
    return 0;
  else
    return v2;
}

- (unint64_t)retainCount
{
  return self->_cd_rc + 1;
}

- (BOOL)_tryRetain
{
  return 0;
}

- (BOOL)_isDeallocating
{
  return 1;
}

@end

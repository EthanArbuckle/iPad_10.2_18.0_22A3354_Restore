@implementation NSCondition

- (NSCondition)init
{
  NSCondition *v2;
  objc_super v4;
  objc_super v5;
  uint64_t v6;

  v6 = *MEMORY[0x1E0C80C00];
  v5.receiver = self;
  v5.super_class = (Class)NSCondition;
  v2 = -[NSCondition init](&v5, sel_init);
  if (pthread_mutex_init(&v2->m, 0))
  {
    v4.receiver = v2;
    v4.super_class = (Class)NSCondition;
    -[NSCondition dealloc](&v4, sel_dealloc);
    return 0;
  }
  else
  {
    pthread_cond_init(&v2->c, 0);
    v2->n = 0;
  }
  return v2;
}

- (void)wait
{
  pthread_cond_wait(&self->c, &self->m);
}

- (void)broadcast
{
  pthread_cond_broadcast(&self->c);
}

- (void)lock
{
  pthread_mutex_lock(&self->m);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->m);
}

- (BOOL)waitUntilDate:(NSDate *)limit
{
  double v4;
  double v5;
  timespec v7;
  uint64_t v8;

  v8 = *MEMORY[0x1E0C80C00];
  -[NSDate timeIntervalSinceReferenceDate](limit, "timeIntervalSinceReferenceDate");
  v5 = v4 - CFAbsoluteTimeGetCurrent();
  if (v5 < 0.0)
    return 0;
  v7.tv_sec = vcvtmd_s64_f64(v5);
  v7.tv_nsec = (int)((v5 - floor(v5)) * 1000000000.0);
  return pthread_cond_timedwait_relative_np(&self->c, &self->m, &v7) == 0;
}

- (void)dealloc
{
  objc_super v3;
  uint64_t v4;

  v4 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->m);
  pthread_cond_destroy(&self->c);

  v3.receiver = self;
  v3.super_class = (Class)NSCondition;
  -[NSCondition dealloc](&v3, sel_dealloc);
}

- (void)signal
{
  pthread_cond_signal(&self->c);
}

- (void)setName:(NSString *)name
{
  NSString *n;

  n = self->n;
  if (n != name)
  {

    self->n = (NSString *)-[NSString copy](name, "copy");
  }
}

- (id)description
{
  id v3;
  const char *v4;
  NSString *n;
  NSString *v6;
  objc_super v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v8.receiver = self;
  v8.super_class = (Class)NSCondition;
  v3 = -[NSCondition description](&v8, sel_description);
  v4 = "'";
  n = self->n;
  if (!n)
    v4 = "";
  v6 = (NSString *)CFSTR("nil");
  if (n)
    v6 = self->n;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{name = %s%@%s}"), v3, v4, v6, v4);
}

- (NSString)name
{
  return self->n;
}

@end

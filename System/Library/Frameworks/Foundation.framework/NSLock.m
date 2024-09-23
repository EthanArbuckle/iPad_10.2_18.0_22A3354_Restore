@implementation NSLock

- (void)unlock
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *cd;

  pthread_mutex_unlock(&self->_priv.m);
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_mutex_lock((pthread_mutex_t *)cd);
    pthread_cond_broadcast((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_unlock((pthread_mutex_t *)cd);
  }
}

- (void)lock
{
  pthread_mutex_lock(&self->_priv.m);
}

- (void)dealloc
{
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *cd;
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  pthread_mutex_destroy(&self->_priv.m);
  cd = self->_priv.cd;
  if (cd)
  {
    pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_destroy((pthread_mutex_t *)cd);
    free(cd);
  }

  v4.receiver = self;
  v4.super_class = (Class)NSLock;
  -[NSLock dealloc](&v4, sel_dealloc);
}

- (NSLock)init
{
  NSLock *v2;
  objc_super v4;
  uint64_t v5;

  v2 = self;
  v5 = *MEMORY[0x1E0C80C00];
  if (pthread_mutex_init(&self->_priv.m, 0))
  {
    v4.receiver = v2;
    v4.super_class = (Class)NSLock;
    -[NSLock dealloc](&v4, sel_dealloc);
    return 0;
  }
  else
  {
    v2->_priv.n = 0;
  }
  return v2;
}

- (void)setName:(NSString *)name
{
  NSString *n;

  n = self->_priv.n;
  if (n != name)
  {

    self->_priv.n = (NSString *)-[NSString copy](name, "copy");
  }
}

- (BOOL)tryLock
{
  return pthread_mutex_trylock(&self->_priv.m) == 0;
}

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  double v4;
  double v5;
  unint64_t v6;
  unint64_t *p_cd;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *cd;
  pthread_mutex_t *v9;
  pthread_mutex_t *v10;
  double v12;
  BOOL v13;
  timespec v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  -[NSDate timeIntervalSinceReferenceDate](limit, "timeIntervalSinceReferenceDate");
  v5 = v4;
  cd = self->_priv.cd;
  p_cd = (unint64_t *)&self->_priv.cd;
  v6 = (unint64_t)cd;
  v9 = (pthread_mutex_t *)(p_cd - 8);
  if (!cd)
  {
    v10 = (pthread_mutex_t *)malloc_type_malloc(0x70uLL, 0x1000040AC4F46D1uLL);
    v6 = (unint64_t)v10;
    if (!v10)
      goto LABEL_7;
    if (!pthread_mutex_init(v10, 0))
    {
      if (!pthread_cond_init((pthread_cond_t *)(v6 + 64), 0))
        goto LABEL_7;
      pthread_mutex_destroy((pthread_mutex_t *)v6);
    }
    free((void *)v6);
    v6 = 0;
LABEL_7:
    while (!__ldaxr(p_cd))
    {
      if (!__stlxr(v6, p_cd))
        goto LABEL_11;
    }
    __clrex();
    pthread_cond_destroy((pthread_cond_t *)(v6 + 64));
    pthread_mutex_destroy((pthread_mutex_t *)v6);
    free((void *)v6);
    v6 = *p_cd;
  }
LABEL_11:
  pthread_mutex_lock((pthread_mutex_t *)v6);
  if (pthread_mutex_trylock((pthread_mutex_t *)p_cd - 1) == 16)
  {
    do
    {
      v12 = v5 - CFAbsoluteTimeGetCurrent();
      v13 = v12 >= 0.0;
      if (v12 < 0.0)
        break;
      v15.tv_sec = vcvtmd_s64_f64(v12);
      v15.tv_nsec = (int)((v12 - floor(v12)) * 1000000000.0);
      pthread_cond_timedwait_relative_np((pthread_cond_t *)(v6 + 64), (pthread_mutex_t *)v6, &v15);
    }
    while (pthread_mutex_trylock(v9) == 16);
  }
  else
  {
    v13 = 1;
  }
  pthread_mutex_unlock((pthread_mutex_t *)v6);
  return v13;
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
  v8.super_class = (Class)NSLock;
  v3 = -[NSLock description](&v8, sel_description);
  v4 = "'";
  n = self->_priv.n;
  if (!n)
    v4 = "";
  v6 = (NSString *)CFSTR("nil");
  if (n)
    v6 = self->_priv.n;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{name = %s%@%s}"), v3, v4, v6, v4);
}

- (NSString)name
{
  return self->_priv.n;
}

@end

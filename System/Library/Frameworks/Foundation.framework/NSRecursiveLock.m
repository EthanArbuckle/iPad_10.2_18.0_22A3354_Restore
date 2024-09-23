@implementation NSRecursiveLock

+ (NSRecursiveLock)allocWithZone:(_NSZone *)a3
{
  return (NSRecursiveLock *)NSAllocateObject((Class)a1, 0x60uLL, a3);
}

- (void)unlock
{
  $A8564EBFA6B1C2D9201EF3397A73F7C8 *p_priv;
  unint64_t v4;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *cd;

  p_priv = &self->_priv;
  v4 = self->_priv.cnt - 1;
  self->_priv.cnt = v4;
  if (!v4)
    self->_priv.t = 0;
  pthread_mutex_unlock(&p_priv->m);
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
  _opaque_pthread_t *v3;
  unint64_t v4;

  pthread_mutex_lock(&self->_priv.m);
  v3 = pthread_self();
  v4 = self->_priv.cnt + 1;
  self->_priv.t = v3;
  self->_priv.cnt = v4;
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
  v4.super_class = (Class)NSRecursiveLock;
  -[NSRecursiveLock dealloc](&v4, sel_dealloc);
}

- (NSRecursiveLock)init
{
  objc_super v4;
  uint64_t v5;

  v5 = *MEMORY[0x1E0C80C00];
  if (_MergedGlobals_107 != -1)
    dispatch_once(&_MergedGlobals_107, &__block_literal_global_24);
  if (pthread_mutex_init(&self->_priv.m, &stru_1ECD09D90))
  {
    v4.receiver = self;
    v4.super_class = (Class)NSRecursiveLock;
    -[NSRecursiveLock dealloc](&v4, sel_dealloc);
    return 0;
  }
  else
  {
    self->_priv.n = 0;
    self->_priv.t = 0;
    self->_priv.cnt = 0;
  }
  return self;
}

uint64_t __23__NSRecursiveLock_init__block_invoke()
{
  pthread_mutexattr_init(&stru_1ECD09D90);
  return pthread_mutexattr_settype(&stru_1ECD09D90, 2);
}

- (BOOL)tryLock
{
  int v3;
  _opaque_pthread_t *v4;
  unint64_t v5;

  v3 = pthread_mutex_trylock(&self->_priv.m);
  if (!v3)
  {
    v4 = pthread_self();
    v5 = self->_priv.cnt + 1;
    self->_priv.t = v4;
    self->_priv.cnt = v5;
  }
  return v3 == 0;
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

- (BOOL)lockBeforeDate:(NSDate *)limit
{
  double v4;
  double v5;
  $8EF4127CF77ECA3DDB612FCF233DC3A8 *cd;
  unint64_t *p_cd;
  pthread_mutex_t *v8;
  double v10;
  _opaque_pthread_t *v11;
  unint64_t v12;
  timespec v14;
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  -[NSDate timeIntervalSinceReferenceDate](limit, "timeIntervalSinceReferenceDate");
  v5 = v4;
  p_cd = (unint64_t *)&self->_priv.cd;
  cd = self->_priv.cd;
  if (!cd)
  {
    v8 = (pthread_mutex_t *)malloc_type_malloc(0x70uLL, 0x1000040AC4F46D1uLL);
    cd = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)v8;
    if (!v8)
      goto LABEL_7;
    if (!pthread_mutex_init(v8, 0))
    {
      if (!pthread_cond_init((pthread_cond_t *)((char *)cd + 64), 0))
        goto LABEL_7;
      pthread_mutex_destroy((pthread_mutex_t *)cd);
    }
    free(cd);
    cd = 0;
LABEL_7:
    while (!__ldaxr(p_cd))
    {
      if (!__stlxr((unint64_t)cd, p_cd))
        goto LABEL_11;
    }
    __clrex();
    pthread_cond_destroy((pthread_cond_t *)((char *)cd + 64));
    pthread_mutex_destroy((pthread_mutex_t *)cd);
    free(cd);
    cd = ($8EF4127CF77ECA3DDB612FCF233DC3A8 *)*p_cd;
  }
LABEL_11:
  pthread_mutex_lock((pthread_mutex_t *)cd);
  if (pthread_mutex_trylock(&self->_priv.m) == 16)
  {
    while (1)
    {
      v10 = v5 - CFAbsoluteTimeGetCurrent();
      if (v10 < 0.0)
        break;
      v14.tv_sec = vcvtmd_s64_f64(v10);
      v14.tv_nsec = (int)((v10 - floor(v10)) * 1000000000.0);
      pthread_cond_timedwait_relative_np((pthread_cond_t *)((char *)cd + 64), (pthread_mutex_t *)cd, &v14);
      if (pthread_mutex_trylock(&self->_priv.m) != 16)
        goto LABEL_14;
    }
    pthread_mutex_unlock((pthread_mutex_t *)cd);
    return 0;
  }
  else
  {
LABEL_14:
    pthread_mutex_unlock((pthread_mutex_t *)cd);
    v11 = pthread_self();
    v12 = self->_priv.cnt + 1;
    self->_priv.t = v11;
    self->_priv.cnt = v12;
    return 1;
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
  v8.super_class = (Class)NSRecursiveLock;
  v3 = -[NSRecursiveLock description](&v8, sel_description);
  v4 = "'";
  n = self->_priv.n;
  if (!n)
    v4 = "";
  v6 = (NSString *)CFSTR("nil");
  if (n)
    v6 = self->_priv.n;
  return +[NSString stringWithFormat:](NSString, "stringWithFormat:", CFSTR("%@{recursion count = %ld, name = %s%@%s}"), v3, self->_priv.cnt, v4, v6, v4);
}

- (NSString)name
{
  return self->_priv.n;
}

- (BOOL)isLocking
{
  _opaque_pthread_t *v4;

  if (pthread_equal(0, self->_priv.t))
    return 0;
  v4 = pthread_self();
  return pthread_equal(v4, self->_priv.t) != 0;
}

@end

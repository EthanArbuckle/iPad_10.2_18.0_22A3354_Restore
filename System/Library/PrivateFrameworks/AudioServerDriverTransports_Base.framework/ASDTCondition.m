@implementation ASDTCondition

- (ASDTCondition)init
{
  ASDTCondition *v2;
  ASDTCondition *v3;
  ASDTCondition *v4;
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)ASDTCondition;
  v2 = -[ASDTCondition init](&v6, sel_init);
  v3 = v2;
  if (v2)
  {
    pthread_cond_init(&v2->_cond, 0);
    pthread_mutex_init(&v3->_mutex, 0);
    v4 = v3;
  }

  return v3;
}

+ (ASDTCondition)conditionWithName:(id)a3
{
  id v4;
  id v5;

  v4 = a3;
  v5 = objc_alloc_init((Class)a1);
  objc_msgSend(v5, "setName:", v4);

  return (ASDTCondition *)v5;
}

- (void)dealloc
{
  objc_super v3;

  pthread_mutex_destroy(&self->_mutex);
  pthread_cond_destroy(&self->_cond);
  v3.receiver = self;
  v3.super_class = (Class)ASDTCondition;
  -[ASDTCondition dealloc](&v3, sel_dealloc);
}

- (void)lock
{
  pthread_mutex_lock(&self->_mutex);
}

- (void)unlock
{
  pthread_mutex_unlock(&self->_mutex);
}

- (void)wait
{
  pthread_cond_wait(&self->_cond, &self->_mutex);
}

- (BOOL)waitUntilTime:(ASDTTime *)a3
{
  uint64_t v5;
  unsigned __int16 *v6;
  _opaque_pthread_cond_t *p_cond;
  _opaque_pthread_mutex_t *p_mutex;
  ASDTTime *v9;
  BOOL v10;
  __int128 v12;
  uint64_t v13;
  timespec v14;
  __int128 v15;
  uint64_t v16;

  ASDTTime::machAbsoluteTime((ASDTTime *)self, (uint64_t)&v15);
  if ((uint64_t)v15 >= a3->var0)
    return 0;
  p_cond = &self->_cond;
  p_mutex = &self->_mutex;
  do
  {
    v12 = *(_OWORD *)&a3->var0;
    v13 = *(_QWORD *)&a3->var2;
    ASDTTime::operator-=((_anonymous_namespace_ **)&v12, (uint64_t *)&v15, v5, v6);
    v14.tv_sec = (uint64_t)v12 / 1000000000;
    v14.tv_nsec = (uint64_t)v12 % 1000000000;
    v9 = (ASDTTime *)pthread_cond_timedwait_relative_np(p_cond, p_mutex, &v14);
    v10 = (_DWORD)v9 != 60;
    if ((_DWORD)v9 != 60)
      break;
    ASDTTime::machAbsoluteTime(v9, (uint64_t)&v12);
    v15 = v12;
    v16 = v13;
  }
  while ((uint64_t)v12 < a3->var0);
  return v10;
}

- (void)signal
{
  pthread_cond_signal(&self->_cond);
}

- (void)broadcast
{
  pthread_cond_broadcast(&self->_cond);
}

- (NSString)name
{
  return self->_name;
}

- (void)setName:(id)a3
{
  objc_storeStrong((id *)&self->_name, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_name, 0);
}

@end

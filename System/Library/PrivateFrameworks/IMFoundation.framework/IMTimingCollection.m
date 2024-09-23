@implementation IMTimingCollection

- (IMTimingCollection)init
{
  IMTimingCollection *v2;
  IMTimingCollection *v3;
  NSMutableDictionary *v4;
  NSMutableDictionary *timings;
  objc_super v7;

  v7.receiver = self;
  v7.super_class = (Class)IMTimingCollection;
  v2 = -[IMTimingCollection init](&v7, sel_init);
  v3 = v2;
  if (v2)
  {
    v2->_lock._os_unfair_lock_opaque = 0;
    v4 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E0C99E08]);
    timings = v3->_timings;
    v3->_timings = v4;

  }
  return v3;
}

- (void)stopTimingForKey:(id)a3
{
  id v4;
  double v5;
  os_unfair_lock_s *p_lock;
  const char *v7;
  uint64_t v8;
  void *v9;
  const char *v10;
  uint64_t v11;
  uint64_t v12;

  v4 = a3;
  v5 = IMTimeOfDay();
  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKey_(self->_timings, v7, (uint64_t)v4, v8);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_stopUsingTime_(v9, v10, v11, v12, v5);
  os_unfair_lock_unlock(p_lock);
}

- (void)startTimingForKey:(id)a3
{
  double v4;
  const char *v5;
  uint64_t v6;
  const char *v7;
  uint64_t v8;
  uint64_t v9;
  void *v10;
  double v11;
  const char *v12;
  id v13;

  v13 = a3;
  v4 = IMTimeOfDay();
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_objectForKey_(self->_timings, v5, (uint64_t)v13, v6);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10)
  {
    *(float *)&v11 = v4;
    objc_msgSend_createTimingInstanceWithStartTime_(_IMTimingInstance, v7, v8, v9, v11);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(self->_timings, v12, (uint64_t)v10, (uint64_t)v13);
  }
  objc_msgSend_startUsingTime_(v10, v7, v8, v9, v4);
  os_unfair_lock_unlock(&self->_lock);

}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_timings, 0);
}

- (double)totalTimeForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;
  const char *v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double v13;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_objectForKey_(self->_timings, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  objc_msgSend_totalTime(v8, v9, v10, v11);
  v13 = v12;
  os_unfair_lock_unlock(p_lock);

  return v13;
}

- (void)removeTimingForKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  uint64_t v7;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_removeObjectForKey_(self->_timings, v6, (uint64_t)v5, v7);

  os_unfair_lock_unlock(p_lock);
}

- (id)description
{
  os_unfair_lock_s *p_lock;
  const char *v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend_description(self->_timings, v4, v5, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return v7;
}

- (BOOL)hasKey:(id)a3
{
  os_unfair_lock_s *p_lock;
  id v5;
  const char *v6;
  uint64_t v7;
  void *v8;

  p_lock = &self->_lock;
  v5 = a3;
  os_unfair_lock_lock(p_lock);
  objc_msgSend_objectForKey_(self->_timings, v6, (uint64_t)v5, v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();

  os_unfair_lock_unlock(p_lock);
  return v8 != 0;
}

@end

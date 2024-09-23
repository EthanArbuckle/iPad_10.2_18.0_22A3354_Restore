@implementation _CDPerfMetric

- (_CDPerfMetric)initWithName:(id)a3 string:(id)a4 family:(id)a5
{
  id v9;
  id v10;
  id v11;
  _CDPerfMetric *v12;
  _CDPerfMetric *v13;
  objc_super v15;

  v9 = a3;
  v10 = a4;
  v11 = a5;
  v15.receiver = self;
  v15.super_class = (Class)_CDPerfMetric;
  v12 = -[_CDPerfMetric init](&v15, sel_init);
  v13 = v12;
  if (v12)
  {
    v12->_lock._os_unfair_lock_opaque = 0;
    objc_storeStrong((id *)&v12->_name, a3);
    objc_storeStrong((id *)&v13->_string, a4);
    objc_storeWeak((id *)&v13->_family, v11);
  }

  return v13;
}

- (unint64_t)count
{
  os_unfair_lock_s *p_lock;
  unint64_t count;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  count = self->_count;
  os_unfair_lock_unlock(p_lock);
  return count;
}

- (double)lastElapsedTime
{
  os_unfair_lock_s *p_lock;
  double lastElapsedTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastElapsedTime = self->_lastElapsedTime;
  os_unfair_lock_unlock(p_lock);
  return lastElapsedTime;
}

- (double)minimumElapsedTime
{
  os_unfair_lock_s *p_lock;
  double minimumElapsedTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  minimumElapsedTime = self->_minimumElapsedTime;
  os_unfair_lock_unlock(p_lock);
  return minimumElapsedTime;
}

- (double)maximumElapsedTime
{
  os_unfair_lock_s *p_lock;
  double maximumElapsedTime;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  maximumElapsedTime = self->_maximumElapsedTime;
  os_unfair_lock_unlock(p_lock);
  return maximumElapsedTime;
}

- (double)averageElapsedTime
{
  os_unfair_lock_s *p_lock;
  unint64_t count;
  double v5;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  count = self->_count;
  if (count)
    v5 = self->_totalElapsedTime / (double)count;
  else
    v5 = 0.0;
  os_unfair_lock_unlock(p_lock);
  return v5;
}

- (NSDate)lastUpdate
{
  os_unfair_lock_s *p_lock;
  void *v4;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", self->_lastUpdateTime);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_unlock(p_lock);
  return (NSDate *)v4;
}

- (unint64_t)lastResultCount
{
  os_unfair_lock_s *p_lock;
  unint64_t lastResultCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  lastResultCount = self->_lastResultCount;
  os_unfair_lock_unlock(p_lock);
  return lastResultCount;
}

- (unint64_t)errorCount
{
  os_unfair_lock_s *p_lock;
  unint64_t errorCount;

  p_lock = &self->_lock;
  os_unfair_lock_lock(&self->_lock);
  errorCount = self->_errorCount;
  os_unfair_lock_unlock(p_lock);
  return errorCount;
}

- (NSString)name
{
  return (NSString *)objc_getProperty(self, a2, 80, 1);
}

- (NSString)string
{
  return (NSString *)objc_getProperty(self, a2, 88, 1);
}

- (double)totalElapsedTime
{
  return self->_totalElapsedTime;
}

- (_CDPerfMetricFamily)family
{
  return (_CDPerfMetricFamily *)objc_loadWeakRetained((id *)&self->_family);
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_family);
  objc_storeStrong((id *)&self->_string, 0);
  objc_storeStrong((id *)&self->_name, 0);
}

@end

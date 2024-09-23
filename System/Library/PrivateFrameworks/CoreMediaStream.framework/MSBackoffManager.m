@implementation MSBackoffManager

- (MSBackoffManager)initWithInitialInterval:(double)a3 backoffFactor:(double)a4 randomizeFactor:(double)a5 maxBackoffInterval:(double)a6 retryAfterDate:(id)a7
{
  id v13;
  MSBackoffManager *v14;
  MSBackoffManager *v15;
  objc_super v17;

  v13 = a7;
  v17.receiver = self;
  v17.super_class = (Class)MSBackoffManager;
  v14 = -[MSBackoffManager init](&v17, sel_init);
  v15 = v14;
  if (v14)
  {
    v14->_initialInterval = a3;
    v14->_backoffFactor = a4;
    v14->_randomizeFactor = a5;
    v14->_maxBackoffInterval = a6;
    v14->_currentInterval = 0.0;
    objc_storeStrong((id *)&v14->_retryAfterDate, a7);
  }

  return v15;
}

- (void)setCurrentInterval:(double)a3
{
  double maxBackoffInterval;
  id v5;

  if (self->_maxBackoffInterval <= a3)
    maxBackoffInterval = self->_maxBackoffInterval;
  else
    maxBackoffInterval = 1.0;
  self->_currentInterval = maxBackoffInterval;
  if (maxBackoffInterval <= 0.0)
  {
    self->_currentInterval = 0.0;
    -[MSBackoffManager setNextExpiryDate:](self, "setNextExpiryDate:", 0);
  }
  else
  {
    v5 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", self->_currentInterval);
    -[MSBackoffManager setNextExpiryDate:](self, "setNextExpiryDate:", v5);

  }
}

- (void)setNextExpiryDate:(id)a3
{
  NSDate *v4;
  NSDate *nextExpiryDate;
  MSBackoffManager *obj;

  v4 = (NSDate *)a3;
  obj = self;
  objc_sync_enter(obj);
  nextExpiryDate = obj->_nextExpiryDate;
  obj->_nextExpiryDate = v4;

  objc_sync_exit(obj);
}

- (NSDate)nextExpiryDate
{
  MSBackoffManager *v2;
  NSDate *nextExpiryDate;
  NSDate *v4;
  NSDate *v5;
  void *v6;
  void *v7;
  NSDate *v8;

  v2 = self;
  objc_sync_enter(v2);
  nextExpiryDate = v2->_nextExpiryDate;
  if (nextExpiryDate)
  {
    v4 = nextExpiryDate;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0C99D68], "distantPast");
    v4 = (NSDate *)objc_claimAutoreleasedReturnValue();
  }
  v5 = v4;
  -[MSBackoffManager retryAfterDate](v2, "retryAfterDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6 && objc_msgSend(v6, "compare:", v5) == 1)
  {
    v8 = v7;

    v5 = v8;
  }

  objc_sync_exit(v2);
  return v5;
}

- (void)didReceiveRetryAfterDate:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  id v8;
  __int16 v9;
  void *v10;
  uint64_t v11;

  v11 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  -[MSBackoffManager retryAfterDate](self, "retryAfterDate");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (v4)
  {
    if (v5 && objc_msgSend(v5, "compare:", v4) == 1)
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543618;
        v8 = v4;
        v9 = 2114;
        v10 = v6;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Not resetting retry-after date, because the new date %{public}@ is not later than the existing date %{public}@", (uint8_t *)&v7, 0x16u);
      }
    }
    else
    {
      if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT))
      {
        v7 = 138543618;
        v8 = v4;
        v9 = 2114;
        v10 = v6;
        _os_log_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEFAULT, "Setting retry-after date to %{public}@. Old retry-after date was %{public}@", (uint8_t *)&v7, 0x16u);
      }
      -[MSBackoffManager setRetryAfterDate:](self, "setRetryAfterDate:", v4);
    }
  }
  else if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    LOWORD(v7) = 0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Not setting retry-after date because the new date is nil.", (uint8_t *)&v7, 2u);
  }
  -[MSBackoffManagerDelegate MSBackoffManagerDidUpdateNextExpiryDate:](self->_delegate, "MSBackoffManagerDidUpdateNextExpiryDate:", self);

}

- (void)reset
{
  uint8_t v3[16];

  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)v3 = 0;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Backoff manager reset to zero seconds.", v3, 2u);
  }
  self->_currentInterval = 0.0;
  -[MSBackoffManager setNextExpiryDate:](self, "setNextExpiryDate:", 0);
  -[MSBackoffManager setRetryAfterDate:](self, "setRetryAfterDate:", 0);
  -[MSBackoffManagerDelegate MSBackoffManagerDidUpdateNextExpiryDate:](self->_delegate, "MSBackoffManagerDidUpdateNextExpiryDate:", self);
}

- (void)backoff
{
  double currentInterval;
  double initialInterval;
  double randomizeFactor;
  uint32_t v6;
  double maxBackoffInterval;
  void *v8;
  double v9;
  int v10;
  double v11;
  __int16 v12;
  double v13;
  __int16 v14;
  void *v15;
  uint64_t v16;

  v16 = *MEMORY[0x1E0C80C00];
  currentInterval = self->_currentInterval;
  if (currentInterval <= 0.0)
    initialInterval = self->_initialInterval;
  else
    initialInterval = currentInterval * self->_backoffFactor;
  randomizeFactor = self->_randomizeFactor;
  v6 = arc4random();
  if (initialInterval * (randomizeFactor * (double)v6 / 4294967300.0 + 1.0) <= self->_maxBackoffInterval)
    maxBackoffInterval = initialInterval * (randomizeFactor * (double)v6 / 4294967300.0 + 1.0);
  else
    maxBackoffInterval = self->_maxBackoffInterval;
  v8 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0C99D68]), "initWithTimeIntervalSinceNow:", maxBackoffInterval);
  -[MSBackoffManager setNextExpiryDate:](self, "setNextExpiryDate:", v8);
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG))
  {
    v9 = self->_currentInterval;
    v10 = 134218498;
    v11 = v9;
    v12 = 2048;
    v13 = maxBackoffInterval;
    v14 = 2114;
    v15 = v8;
    _os_log_debug_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_DEBUG, "Backing off. Old interval: %0.3lf sec, new interval: %0.3lf. Next fire date: %{public}@", (uint8_t *)&v10, 0x20u);
  }
  self->_currentInterval = maxBackoffInterval;
  -[MSBackoffManagerDelegate MSBackoffManagerDidUpdateNextExpiryDate:](self->_delegate, "MSBackoffManagerDidUpdateNextExpiryDate:", self);

}

- (BOOL)isEqual:(id)a3
{
  MSBackoffManager *v4;
  MSBackoffManager *v5;
  double initialInterval;
  double v7;
  double backoffFactor;
  double v9;
  double randomizeFactor;
  double v11;
  double maxBackoffInterval;
  double v13;
  double currentInterval;
  double v15;
  NSDate *retryAfterDate;
  void *v17;
  unsigned __int8 v18;
  objc_super v20;

  v4 = (MSBackoffManager *)a3;
  if (self == v4)
  {
    v18 = 1;
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v5 = v4;
      initialInterval = self->_initialInterval;
      -[MSBackoffManager initialInterval](v5, "initialInterval");
      if (vabdd_f64(initialInterval, v7) >= 2.22044605e-16)
        goto LABEL_11;
      backoffFactor = self->_backoffFactor;
      -[MSBackoffManager backoffFactor](v5, "backoffFactor");
      if (vabdd_f64(backoffFactor, v9) >= 2.22044605e-16
        || (randomizeFactor = self->_randomizeFactor,
            -[MSBackoffManager randomizeFactor](v5, "randomizeFactor"),
            vabdd_f64(randomizeFactor, v11) >= 2.22044605e-16)
        || (maxBackoffInterval = self->_maxBackoffInterval,
            -[MSBackoffManager maxBackoffInterval](v5, "maxBackoffInterval"),
            vabdd_f64(maxBackoffInterval, v13) >= 2.22044605e-16)
        || (currentInterval = self->_currentInterval,
            -[MSBackoffManager currentInterval](v5, "currentInterval"),
            vabdd_f64(currentInterval, v15) >= 2.22044605e-16))
      {
LABEL_11:
        v18 = 0;
      }
      else
      {
        retryAfterDate = self->_retryAfterDate;
        -[MSBackoffManager retryAfterDate](v5, "retryAfterDate");
        v17 = (void *)objc_claimAutoreleasedReturnValue();
        v18 = -[NSDate isEqual:](retryAfterDate, "isEqual:", v17);

      }
    }
    else
    {
      v20.receiver = self;
      v20.super_class = (Class)MSBackoffManager;
      v18 = -[MSBackoffManager isEqual:](&v20, sel_isEqual_, v4);
    }
  }

  return v18;
}

- (void)encodeWithCoder:(id)a3
{
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v8 = a3;
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("initialInterval"), self->_initialInterval);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("backoffFactor"), self->_backoffFactor);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("randomizeFactor"), self->_randomizeFactor);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("maxBackoffInterval"), self->_maxBackoffInterval);
  objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("currentInterval"), self->_currentInterval);
  -[MSBackoffManager nextExpiryDate](self, "nextExpiryDate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = v4;
  if (v4)
  {
    objc_msgSend(v4, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("nextExpiryDate"));
  }
  -[MSBackoffManager retryAfterDate](self, "retryAfterDate");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = v6;
  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    objc_msgSend(v8, "encodeDouble:forKey:", CFSTR("retryAfterDate"));
  }

}

- (id)copyParameters
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;

  objc_msgSend(MEMORY[0x1E0C99E08], "dictionary");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_initialInterval);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v4, CFSTR("initialInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_backoffFactor);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v5, CFSTR("backoffFactor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_randomizeFactor);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v6, CFSTR("randomizeFactor"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_maxBackoffInterval);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v7, CFSTR("maxBackoffInterval"));

  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithDouble:", self->_currentInterval);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setObject:forKey:", v8, CFSTR("currentInterval"));

  -[MSBackoffManager nextExpiryDate](self, "nextExpiryDate");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  if (v9)
    objc_msgSend(v3, "setObject:forKey:", v9, CFSTR("nextExpiryDate"));
  -[MSBackoffManager retryAfterDate](self, "retryAfterDate");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (v10)
    objc_msgSend(v3, "setObject:forKey:", v10, CFSTR("retryAfterDate"));

  return v3;
}

- (void)_complainAboutMissingKeyInArchive:(id)a3
{
  int v5;
  MSBackoffManager *v6;
  __int16 v7;
  id v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  if (os_log_type_enabled(MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR))
  {
    v5 = 138543618;
    v6 = self;
    v7 = 2114;
    v8 = a3;
    _os_log_error_impl(&dword_1D3E94000, MEMORY[0x1E0C81028], OS_LOG_TYPE_ERROR, "%{public}@: Missing key in archive: “%{public}@”.", (uint8_t *)&v5, 0x16u);
  }
}

- (MSBackoffManager)initWithCoder:(id)a3
{
  id v4;
  MSBackoffManager *v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  NSDate *nextExpiryDate;
  void *v14;
  uint64_t v15;
  NSDate *retryAfterDate;
  objc_super v18;

  v4 = a3;
  v18.receiver = self;
  v18.super_class = (Class)MSBackoffManager;
  v5 = -[MSBackoffManager init](&v18, sel_init);
  if (v5)
  {
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("initialInterval")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("initialInterval"));
      v5->_initialInterval = v6;
    }
    else
    {
      -[MSBackoffManager _complainAboutMissingKeyInArchive:](v5, "_complainAboutMissingKeyInArchive:", CFSTR("initialInterval"));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("backoffFactor")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("backoffFactor"));
      v5->_backoffFactor = v7;
    }
    else
    {
      -[MSBackoffManager _complainAboutMissingKeyInArchive:](v5, "_complainAboutMissingKeyInArchive:", CFSTR("backoffFactor"));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("randomizeFactor")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("randomizeFactor"));
      v5->_randomizeFactor = v8;
    }
    else
    {
      -[MSBackoffManager _complainAboutMissingKeyInArchive:](v5, "_complainAboutMissingKeyInArchive:", CFSTR("randomizeFactor"));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("maxBackoffInterval")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("maxBackoffInterval"));
      v5->_maxBackoffInterval = v9;
    }
    else
    {
      -[MSBackoffManager _complainAboutMissingKeyInArchive:](v5, "_complainAboutMissingKeyInArchive:", CFSTR("maxBackoffInterval"));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("currentInterval")))
    {
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("currentInterval"));
      v5->_currentInterval = v10;
    }
    else
    {
      -[MSBackoffManager _complainAboutMissingKeyInArchive:](v5, "_complainAboutMissingKeyInArchive:", CFSTR("currentInterval"));
    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("nextExpiryDate")))
    {
      v11 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("nextExpiryDate"));
      objc_msgSend(v11, "dateWithTimeIntervalSinceReferenceDate:");
      v12 = objc_claimAutoreleasedReturnValue();
      nextExpiryDate = v5->_nextExpiryDate;
      v5->_nextExpiryDate = (NSDate *)v12;

    }
    if (objc_msgSend(v4, "containsValueForKey:", CFSTR("retryAfterDate")))
    {
      v14 = (void *)MEMORY[0x1E0C99D68];
      objc_msgSend(v4, "decodeDoubleForKey:", CFSTR("retryAfterDate"));
      objc_msgSend(v14, "dateWithTimeIntervalSinceReferenceDate:");
      v15 = objc_claimAutoreleasedReturnValue();
      retryAfterDate = v5->_retryAfterDate;
      v5->_retryAfterDate = (NSDate *)v15;

    }
  }

  return v5;
}

- (MSBackoffManagerDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
  self->_delegate = (MSBackoffManagerDelegate *)a3;
}

- (double)initialInterval
{
  return self->_initialInterval;
}

- (void)setInitialInterval:(double)a3
{
  self->_initialInterval = a3;
}

- (double)backoffFactor
{
  return self->_backoffFactor;
}

- (void)setBackoffFactor:(double)a3
{
  self->_backoffFactor = a3;
}

- (double)randomizeFactor
{
  return self->_randomizeFactor;
}

- (void)setRandomizeFactor:(double)a3
{
  self->_randomizeFactor = a3;
}

- (double)maxBackoffInterval
{
  return self->_maxBackoffInterval;
}

- (void)setMaxBackoffInterval:(double)a3
{
  self->_maxBackoffInterval = a3;
}

- (double)currentInterval
{
  return self->_currentInterval;
}

- (NSDate)retryAfterDate
{
  return (NSDate *)objc_getProperty(self, a2, 64, 1);
}

- (void)setRetryAfterDate:(id)a3
{
  objc_setProperty_atomic(self, a2, a3, 64);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_retryAfterDate, 0);
  objc_storeStrong((id *)&self->_nextExpiryDate, 0);
}

+ (BOOL)supportsSecureCoding
{
  return 1;
}

@end

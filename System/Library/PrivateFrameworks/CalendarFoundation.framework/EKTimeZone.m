@implementation EKTimeZone

+ (id)timeZoneWithName:(id)a3
{
  __CFString *v4;
  __CFString *v5;
  void *v6;
  void *v7;
  void *v8;
  uint64_t v9;
  void *v10;

  v4 = (__CFString *)a3;
  if (v4)
    v5 = v4;
  else
    v5 = CFSTR("UTC");
  pthread_mutex_lock(&sTimeZonesLock);
  if (!sTimeZones
    || (objc_msgSend((id)sTimeZones, "objectForKey:", v5), (v6 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
  {
    objc_msgSend(MEMORY[0x1E0C99E80], "timeZoneWithName:", v5);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
    {
      v6 = (void *)objc_msgSend(objc_alloc((Class)a1), "initWithNSTimeZone:", v7);
      if (v6)
      {
        v8 = (void *)sTimeZones;
        if (!sTimeZones)
        {
          objc_msgSend(MEMORY[0x1E0C99E08], "dictionaryWithCapacity:", 0);
          v9 = objc_claimAutoreleasedReturnValue();
          v10 = (void *)sTimeZones;
          sTimeZones = v9;

          v8 = (void *)sTimeZones;
        }
        objc_msgSend(v8, "setObject:forKey:", v6, v5);
      }
    }
    else
    {
      v6 = 0;
    }

  }
  pthread_mutex_unlock(&sTimeZonesLock);

  return v6;
}

+ (id)timeZoneWithNSTimeZone:(id)a3
{
  void *v4;
  void *v5;

  objc_msgSend(a3, "name");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "timeZoneWithName:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (EKTimeZone)initWithNSTimeZone:(id)a3
{
  id v5;
  EKTimeZone *v6;
  EKTimeZone *v7;
  objc_super v9;

  v5 = a3;
  v9.receiver = self;
  v9.super_class = (Class)EKTimeZone;
  v6 = -[EKTimeZone init](&v9, sel_init);
  v7 = v6;
  if (v6)
    objc_storeStrong((id *)&v6->_nsTimeZone, a3);

  return v7;
}

- (BOOL)isEqual:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  char v7;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v4, "nsTimeZone");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    -[EKTimeZone nsTimeZone](self, "nsTimeZone");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v5, "isEqual:", v6);

  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (unint64_t)hash
{
  void *v2;
  unint64_t v3;

  -[EKTimeZone nsTimeZone](self, "nsTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "hash");

  return v3;
}

- (id)description
{
  void *v3;
  uint64_t v4;
  void *v5;
  void *v6;
  void *v7;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v4 = objc_opt_class();
  -[EKTimeZone nsTimeZone](self, "nsTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "name");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ <%p> {name = %@}"), v4, self, v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

- (double)secondsFromGMTForAbsoluteTime:(double)a3
{
  void *v4;
  void *v5;
  uint64_t v6;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTimeZone nsTimeZone](self, "nsTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "secondsFromGMTForDate:", v4);

  return (double)v6;
}

- (double)nextDaylightSavingTimeTransitionAfterAbsoluteTime:(double)a3
{
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;

  objc_msgSend(MEMORY[0x1E0C99D68], "dateWithTimeIntervalSinceReferenceDate:", a3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[EKTimeZone nsTimeZone](self, "nsTimeZone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "nextDaylightSavingTimeTransitionAfterDate:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v6)
  {
    objc_msgSend(v6, "timeIntervalSinceReferenceDate");
    v8 = v7;
  }
  else
  {
    v8 = 1.79769313e308;
  }

  return v8;
}

- (NSTimeZone)nsTimeZone
{
  return self->_nsTimeZone;
}

- (void)setNsTimeZone:(id)a3
{
  objc_storeStrong((id *)&self->_nsTimeZone, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_nsTimeZone, 0);
}

@end

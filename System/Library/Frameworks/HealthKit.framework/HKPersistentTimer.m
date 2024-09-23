@implementation HKPersistentTimer

+ (id)timerWithKey:(id)a3
{
  id v4;
  HKPersistentTimer *v5;
  uint64_t v6;
  NSString *fullTimerKey;

  v4 = a3;
  v5 = objc_alloc_init(HKPersistentTimer);
  objc_msgSend(a1, "_prefixedKeyWithTimerKey:", v4);
  v6 = objc_claimAutoreleasedReturnValue();

  fullTimerKey = v5->_fullTimerKey;
  v5->_fullTimerKey = (NSString *)v6;

  return v5;
}

+ (id)_prefixedKeyWithTimerKey:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@_%@"), CFSTR("HKPersistentTimerPrefixKey"), a3);
}

- (void)start
{
  uint64_t v3;
  void *v4;
  id v5;

  v3 = mach_absolute_time();
  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithUnsignedLongLong:", v3);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setObject:forKey:", v4, self->_fullTimerKey);

}

- (void)clear
{
  id v3;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeObjectForKey:", self->_fullTimerKey);

}

- (id)timerValue
{
  void *v3;
  void *v4;

  objc_msgSend(MEMORY[0x1E0C99EA0], "standardUserDefaults");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectForKey:", self->_fullTimerKey);
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  return v4;
}

- (unint64_t)elapsedSeconds
{
  return vcvtad_u64_f64((double)-[HKPersistentTimer elapsedNanoseconds](self, "elapsedNanoseconds") / 1000000000.0);
}

- (unint64_t)elapsedMilliSeconds
{
  return vcvtad_u64_f64((double)-[HKPersistentTimer elapsedNanoseconds](self, "elapsedNanoseconds") / 1000000.0);
}

- (unint64_t)elapsedNanoseconds
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  unsigned int v6;
  unint64_t v7;

  -[HKPersistentTimer timerValue](self, "timerValue");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = v2;
  if (v2)
  {
    v4 = objc_msgSend(v2, "unsignedLongLongValue");
    v5 = mach_absolute_time() - v4;
    v6 = dword_1EE39981C;
    if (!dword_1EE39981C)
    {
      mach_timebase_info((mach_timebase_info_t)&elapsedNanoseconds_timebaseInfo);
      v6 = dword_1EE39981C;
    }
    v7 = v5 * elapsedNanoseconds_timebaseInfo / v6;
  }
  else
  {
    v7 = 0;
  }

  return v7;
}

- (NSString)fullTimerKey
{
  return self->_fullTimerKey;
}

- (void)setFullTimerKey:(id)a3
{
  objc_storeStrong((id *)&self->_fullTimerKey, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_fullTimerKey, 0);
}

@end

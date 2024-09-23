@implementation NSDateComponents(HKSleepSchedule)

+ (id)hk_componentsWithHour:()HKSleepSchedule minute:
{
  id v6;

  v6 = objc_alloc_init(a1);
  objc_msgSend(v6, "setHour:", a3);
  objc_msgSend(v6, "setMinute:", a4);
  return v6;
}

- (id)hk_hourNumber
{
  void *v2;

  if (objc_msgSend(a1, "hour") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "hour"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)hk_minuteNumber
{
  void *v2;

  if (objc_msgSend(a1, "minute") == 0x7FFFFFFFFFFFFFFFLL)
  {
    v2 = 0;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB37E8], "numberWithInteger:", objc_msgSend(a1, "minute"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v2;
}

- (id)hk_dateOptionalDescription
{
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;

  if (objc_msgSend(a1, "day") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(a1, "month") == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend(a1, "year") == 0x7FFFFFFFFFFFFFFFLL)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%02lu:%02lu"), objc_msgSend(a1, "hour"), objc_msgSend(a1, "minute"), v3, v4, v5);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%lu-%lu-%lu %02lu:%02lu"), objc_msgSend(a1, "month"), objc_msgSend(a1, "day"), objc_msgSend(a1, "year"), objc_msgSend(a1, "hour"), objc_msgSend(a1, "minute"));
  }
  return (id)objc_claimAutoreleasedReturnValue();
}

@end

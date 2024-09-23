@implementation NSDate(HMFoundation)

+ (NSString)shortDescription
{
  objc_class *v0;

  v0 = (objc_class *)objc_opt_class();
  return NSStringFromClass(v0);
}

- (id)hmf_localTimeDescription
{
  void *v2;
  void *v3;
  char v4;
  void *v5;

  if (qword_1ED013220 != -1)
    dispatch_once(&qword_1ED013220, &__block_literal_global_40);
  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  os_unfair_lock_lock_with_options();
  objc_msgSend((id)qword_1ED013218, "timeZone");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = HMFEqualObjects(v3, v2);

  if ((v4 & 1) == 0)
    objc_msgSend((id)qword_1ED013218, "setTimeZone:", v2);
  os_unfair_lock_unlock((os_unfair_lock_t)&_MergedGlobals_72);
  objc_msgSend((id)qword_1ED013218, "stringFromDate:", a1);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (id)hmf_dateComponents
{
  void *v2;
  void *v3;

  objc_msgSend(MEMORY[0x1E0C99E80], "localTimeZone");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "hmf_dateComponentsUsingTimeZone:", v2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  return v3;
}

- (id)hmf_dateComponentsUsingTimeZone:()HMFoundation
{
  void *v4;
  id v5;
  void *v6;
  void *v7;

  v4 = (void *)MEMORY[0x1E0C99D48];
  v5 = a3;
  objc_msgSend(v4, "currentCalendar");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "setTimeZone:", v5);

  objc_msgSend(v6, "components:fromDate:", 124, a1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  return v7;
}

@end

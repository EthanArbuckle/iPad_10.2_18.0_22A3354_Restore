@implementation DDSManagerDataSource

- (NSDate)date
{
  return (NSDate *)objc_msgSend(MEMORY[0x1E0C99D68], "date");
}

- (id)dateForPreferenceKey:(id)a3
{
  void *v3;
  void *v4;
  id v5;

  DDSGetPreferenceObjectForKey((__CFString *)a3);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v4 = v3;
  else
    v4 = 0;
  v5 = v4;

  return v5;
}

- (void)setDate:(id)a3 forPreferenceKey:(id)a4
{
  DDSSetPreferenceObjectForKey((const __CFString *)a4, a3);
}

@end

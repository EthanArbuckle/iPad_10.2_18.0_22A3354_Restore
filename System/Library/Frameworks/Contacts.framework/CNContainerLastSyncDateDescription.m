@implementation CNContainerLastSyncDateDescription

- (int)abPropertyID
{
  return *MEMORY[0x1E0CF6308];
}

- (id)CNValueFromABValue:(void *)a3
{
  return a3;
}

- (void)setCNValue:(id)a3 onContainer:(id)a4
{
  id v5;
  id v6;
  void *v7;
  id v8;
  id v9;

  v5 = a3;
  v6 = a4;
  objc_opt_class();
  v9 = v5;
  if (v9)
  {
    if ((objc_opt_isKindOfClass() & 1) != 0)
      v7 = v9;
    else
      v7 = 0;
    v8 = v7;
  }
  else
  {
    v8 = 0;
  }

  objc_msgSend(v6, "setLastSyncDate:", v8);
}

- (id)key
{
  return CFSTR("lastSyncDate");
}

- (Class)valueClass
{
  return (Class)objc_opt_class();
}

- (BOOL)isWritable
{
  return 1;
}

- (id)CNValueForContainer:(id)a3
{
  return (id)objc_msgSend(a3, "lastSyncDate");
}

- (void)ABValueFromCNValue:(id)a3
{
  return a3;
}

@end

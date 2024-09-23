@implementation NSDictionary(LSRecordBuilderAdditions)

- (uint64_t)_LS_BoolForKey:()LSRecordBuilderAdditions
{
  void *v1;
  uint64_t v2;

  objc_msgSend(a1, "objectForKey:");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  if (v1 && (objc_opt_respondsToSelector() & 1) != 0)
    v2 = objc_msgSend(v1, "BOOLValue");
  else
    v2 = 0;

  return v2;
}

- (uint64_t)_LS_integerForKey:()LSRecordBuilderAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  BOOL v7;
  uint64_t v8;

  v4 = a3;
  v5 = objc_opt_class();
  objc_msgSend(a1, "objectForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  if (v5)
    v7 = v6 == 0;
  else
    v7 = 1;
  if (!v7 && (objc_opt_isKindOfClass() & 1) == 0)
  {

    v6 = 0;
  }
  v8 = objc_msgSend(v6, "integerValue");

  return v8;
}

@end

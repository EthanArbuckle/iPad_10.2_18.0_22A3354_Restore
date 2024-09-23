@implementation NSObject(FMCoreAdditions)

- (id)fm_nullToNil
{
  void *v2;
  id v3;

  objc_msgSend(MEMORY[0x1E0C99E38], "null");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (v2 == a1)
    v3 = 0;
  else
    v3 = a1;
  return v3;
}

- (uint64_t)fm_logID
{
  return objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("%@(0x%X)"), objc_opt_class(), a1);
}

@end

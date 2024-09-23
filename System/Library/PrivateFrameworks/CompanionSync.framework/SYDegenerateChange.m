@implementation SYDegenerateChange

+ (id)degenerateChange
{
  if (degenerateChange_onceToken != -1)
    dispatch_once(&degenerateChange_onceToken, &__block_literal_global_2);
  return (id)degenerateChange_instance;
}

void __38__SYDegenerateChange_degenerateChange__block_invoke()
{
  SYDegenerateChange *v0;
  void *v1;

  v0 = objc_alloc_init(SYDegenerateChange);
  v1 = (void *)degenerateChange_instance;
  degenerateChange_instance = (uint64_t)v0;

}

+ (BOOL)isDegenerate:(id)a3
{
  id v3;
  id v4;

  v3 = a3;
  +[SYDegenerateChange degenerateChange](SYDegenerateChange, "degenerateChange");
  v4 = (id)objc_claimAutoreleasedReturnValue();

  return v4 == v3;
}

- (NSString)sequencer
{
  return 0;
}

- (NSString)objectIdentifier
{
  return (NSString *)CFSTR("SY:degenerate");
}

- (int64_t)changeType
{
  return 2;
}

@end

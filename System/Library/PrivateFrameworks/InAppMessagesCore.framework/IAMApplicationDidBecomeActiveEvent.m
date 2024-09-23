@implementation IAMApplicationDidBecomeActiveEvent

- (id)name
{
  return CFSTR("applicationDidBecomeActive");
}

- (IAMApplicationDidBecomeActiveEvent)initWithName:(id)a3
{
  void *v4;
  uint64_t v5;
  objc_class *v6;
  void *v7;

  v4 = (void *)MEMORY[0x24BDBCE88];
  v5 = *MEMORY[0x24BDBCAB8];
  v6 = (objc_class *)objc_opt_class();
  NSStringFromClass(v6);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "raise:format:", v5, CFSTR("%@ -initWithName: is not supported, use -init"), v7);

  return 0;
}

- (IAMApplicationDidBecomeActiveEvent)initWithName:(id)a3 type:(int64_t)a4
{
  void *v5;
  uint64_t v6;
  objc_class *v7;
  void *v8;

  v5 = (void *)MEMORY[0x24BDBCE88];
  v6 = *MEMORY[0x24BDBCAB8];
  v7 = (objc_class *)objc_opt_class();
  NSStringFromClass(v7);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "raise:format:", v6, CFSTR("%@ -initWithName:type: is not supported, use -init"), v8);

  return 0;
}

- (int64_t)type
{
  return 0;
}

@end

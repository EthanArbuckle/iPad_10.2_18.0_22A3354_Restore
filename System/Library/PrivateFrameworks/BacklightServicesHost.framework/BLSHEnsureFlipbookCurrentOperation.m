@implementation BLSHEnsureFlipbookCurrentOperation

+ (id)operation
{
  return objc_alloc_init((Class)a1);
}

- (int64_t)type
{
  return 5;
}

- (NSString)description
{
  void *v3;
  id v4;
  id v5;
  void *v6;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHEnsureFlipbookCurrentOperation isStarted](self, "isStarted"), CFSTR("started"));
  v5 = (id)objc_msgSend(v3, "appendBool:withName:", -[BLSHEnsureFlipbookCurrentOperation isCompleted](self, "isCompleted"), CFSTR("completed"));
  objc_msgSend(v3, "build");
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSString *)v6;
}

- (BOOL)isStarted
{
  return self->_started;
}

- (void)setStarted:(BOOL)a3
{
  self->_started = a3;
}

- (BOOL)isCompleted
{
  return self->_completed;
}

- (void)setCompleted:(BOOL)a3
{
  self->_completed = a3;
}

@end

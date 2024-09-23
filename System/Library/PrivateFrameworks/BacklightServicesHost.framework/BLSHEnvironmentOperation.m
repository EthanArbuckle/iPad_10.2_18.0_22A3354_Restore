@implementation BLSHEnvironmentOperation

- (BLSHEnvironmentOperation)initWithBacklightState:(int64_t)a3
{
  BLSHEnvironmentOperation *result;
  objc_super v5;

  v5.receiver = self;
  v5.super_class = (Class)BLSHEnvironmentOperation;
  result = -[BLSHEnvironmentOperation init](&v5, sel_init);
  if (result)
    result->_backlightState = a3;
  return result;
}

- (id)description
{
  void *v2;
  void *v3;
  id v4;
  void *v5;

  objc_msgSend(MEMORY[0x24BE0BE08], "builderWithObject:", self);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  NSStringFromBLSBacklightState();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (id)objc_msgSend(v2, "appendObject:withName:", v3, CFSTR("backlightState"));

  objc_msgSend(v2, "build");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

- (int64_t)backlightState
{
  return self->_backlightState;
}

@end

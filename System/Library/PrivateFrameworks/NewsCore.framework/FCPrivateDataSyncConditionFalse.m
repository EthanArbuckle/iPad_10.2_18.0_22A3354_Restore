@implementation FCPrivateDataSyncConditionFalse

- (BOOL)isSatisfied
{
  return 0;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p condition=False>"), self);
}

@end

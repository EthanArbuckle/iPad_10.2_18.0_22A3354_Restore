@implementation FCPrivateDataSyncConditionTrue

- (BOOL)isSatisfied
{
  return 1;
}

- (id)description
{
  return (id)objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("<%p condition=True>"), self);
}

@end

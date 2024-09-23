@implementation _MFSatisfiedActivityCondition

- (BOOL)isSatisfied
{
  return 1;
}

- (EFObservable)conditionsObservable
{
  return (EFObservable *)objc_msgSend(MEMORY[0x1E0D1EF28], "observableWithResult:", MEMORY[0x1E0C9AAB0]);
}

@end

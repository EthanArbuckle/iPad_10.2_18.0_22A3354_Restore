@implementation SNBooleanCancellable

- (BOOL)isCancelled
{
  return sub_1D4466664() & 1;
}

- (void)setIsCancelled:(BOOL)a3
{
  sub_1D4466698(a3);
}

- (SNBooleanCancellable)init
{
  return (SNBooleanCancellable *)sub_1D44666A8();
}

- (void)cancel
{
  sub_1D4466708();
}

@end

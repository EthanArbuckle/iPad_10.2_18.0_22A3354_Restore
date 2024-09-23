@implementation CalPerformSelectorAsyncBlockPerformer

- (id)performAsync:(id)a3
{
  return -[CalPerformSelectorAsyncBlockPerformer performAfterDelay:block:](self, "performAfterDelay:block:", a3, 0.0);
}

- (id)performAfterDelay:(double)a3 block:(id)a4
{
  id v5;
  CalCancelablePerformSelector *v6;

  v5 = a4;
  v6 = -[CalCancelablePerformSelector initWithBlock:]([CalCancelablePerformSelector alloc], "initWithBlock:", v5);

  -[CalCancelablePerformSelector performAfterDelay:](v6, "performAfterDelay:", a3);
  return v6;
}

@end

@implementation GKOperationQueue

- (void)_gkAddOperationWithDelay:(double)a3 operation:(id)a4
{
  id v6;
  GKDelayOperation *v7;

  v6 = a4;
  v7 = -[GKDelayOperation initWithDelay:andOperation:]([GKDelayOperation alloc], "initWithDelay:andOperation:", v6, a3);

  -[GKOperationQueue addOperation:](self, "addOperation:", v7);
}

@end

@implementation GKNetworkActivityIndicatorDelegate

- (void)beginNetworkActivity
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__GKNetworkActivityIndicatorDelegate_beginNetworkActivity__block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__GKNetworkActivityIndicatorDelegate_beginNetworkActivity__block_invoke()
{
  _BOOL8 v0;
  id v1;

  v0 = (int)GKAtomicIncrement32() > 0;
  objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
  v1 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setNetworkActivityIndicatorVisible:", v0);

}

- (void)endNetworkActivity
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __56__GKNetworkActivityIndicatorDelegate_endNetworkActivity__block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __56__GKNetworkActivityIndicatorDelegate_endNetworkActivity__block_invoke(uint64_t a1)
{
  _BOOL8 v1;
  id v2;

  if (*(int *)(*(_QWORD *)(a1 + 32) + 8) >= 1)
  {
    v1 = (int)GKAtomicDecrement32() > 0;
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v2 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v2, "setNetworkActivityIndicatorVisible:", v1);

  }
}

- (void)resetNetworkActivity
{
  _QWORD block[5];

  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __58__GKNetworkActivityIndicatorDelegate_resetNetworkActivity__block_invoke;
  block[3] = &unk_1E59C4148;
  block[4] = self;
  dispatch_async(MEMORY[0x1E0C80D38], block);
}

void __58__GKNetworkActivityIndicatorDelegate_resetNetworkActivity__block_invoke()
{
  id v0;

  if (GKAtomicCompareAndSwap32())
  {
    objc_msgSend(MEMORY[0x1E0DC3470], "sharedApplication");
    v0 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v0, "setNetworkActivityIndicatorVisible:", 0);

  }
}

- (int)networkIndicatorCount
{
  return self->_networkIndicatorCount;
}

- (void)setNetworkIndicatorCount:(int)a3
{
  self->_networkIndicatorCount = a3;
}

@end

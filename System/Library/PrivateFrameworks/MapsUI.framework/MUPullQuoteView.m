@implementation MUPullQuoteView

- (BOOL)isExpanded
{
  return 0;
}

- (void)_expand
{
  void *v3;
  void (**v4)(void);

  -[MUExpandingLabel labelResizedBlock](self, "labelResizedBlock");
  v3 = (void *)objc_claimAutoreleasedReturnValue();

  if (v3)
  {
    -[MUExpandingLabel labelResizedBlock](self, "labelResizedBlock");
    v4 = (void (**)(void))objc_claimAutoreleasedReturnValue();
    v4[2]();

  }
}

@end

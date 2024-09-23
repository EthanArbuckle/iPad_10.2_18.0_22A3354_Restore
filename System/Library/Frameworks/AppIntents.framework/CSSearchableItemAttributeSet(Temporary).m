@implementation CSSearchableItemAttributeSet(Temporary)

- (void)setCachedViewDataSafe:()Temporary
{
  id v4;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
    objc_msgSend(a1, "setCachedViewData:", v4);

}

@end

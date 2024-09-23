@implementation INIntent(WK)

- (id)_wk_asMigratedAppIntent
{
  id v2;

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v2 = a1;
  }
  else if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(a1, "_asMigratedAppIntent");
    v2 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    v2 = 0;
  }
  return v2;
}

@end

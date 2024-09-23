@implementation UIView(APUIWidgetAdditions)

- (id)apuiFindInnermostSuperviewOfClass:()APUIWidgetAdditions
{
  id v5;
  void *v6;

  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = a1;
  }
  else
  {
    objc_msgSend(a1, "superview");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "apuiFindInnermostSuperviewOfClass:", a3);
    v5 = (id)objc_claimAutoreleasedReturnValue();

  }
  return v5;
}

@end

@implementation UIViewController(CNPeopleCardTransition)

- (void)set_cardViewControllerTransitioning:()CNPeopleCardTransition
{
  objc_setAssociatedObject(a1, "CardViewControllerTransitioning", a3, (void *)1);
}

- (id)_cardViewControllerTransitioning
{
  id v2;

  objc_getAssociatedObject(a1, "CardViewControllerTransitioning");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  if (!v2)
  {
    if (objc_msgSend(a1, "conformsToProtocol:", &unk_1EDFD7198))
      v2 = a1;
    else
      v2 = 0;
  }
  return v2;
}

@end

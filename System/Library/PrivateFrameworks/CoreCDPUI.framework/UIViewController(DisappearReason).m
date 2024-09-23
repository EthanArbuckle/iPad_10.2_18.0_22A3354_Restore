@implementation UIViewController(DisappearReason)

- (uint64_t)isDisappearingDueToPop
{
  void *v2;
  void *v3;
  void *v4;
  uint64_t v5;

  objc_msgSend(a1, "navigationController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
    return 0;
  objc_msgSend(a1, "navigationController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "viewControllers");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "containsObject:", a1) ^ 1;

  return v5;
}

@end

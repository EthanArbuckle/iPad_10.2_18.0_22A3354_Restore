@implementation UIStoryboard(UISafeStoryboard)

- (id)tryToInstantiateViewControllerWithIdentifier:()UISafeStoryboard
{
  id v4;
  void *v5;

  v4 = a3;
  objc_msgSend(a1, "instantiateViewControllerWithIdentifier:", v4);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return v5;
}

@end

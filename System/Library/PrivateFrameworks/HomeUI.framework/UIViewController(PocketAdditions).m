@implementation UIViewController(PocketAdditions)

- (id)hu_pocketedContainerViewController
{
  void *v2;
  void *v3;
  id v4;

  objc_opt_class();
  objc_msgSend(a1, "parentViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    v3 = v2;
  else
    v3 = 0;
  v4 = v3;

  return v4;
}

@end

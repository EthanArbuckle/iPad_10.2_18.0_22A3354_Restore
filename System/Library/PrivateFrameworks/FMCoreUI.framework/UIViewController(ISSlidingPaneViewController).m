@implementation UIViewController(ISSlidingPaneViewController)

- (id)slidingPaneViewController
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "parentViewController");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
      if (!v2)
        goto LABEL_6;
    }
    v1 = v1;
  }
LABEL_6:

  return v1;
}

@end

@implementation PXUIScrollViewController(EnsureSubview)

- (void)ae_ensureSubview:()EnsureSubview
{
  void *v4;
  void *v5;
  id v6;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "scrollView");
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  if (v4 != v5)
    objc_msgSend(a1, "addSubview:", v6);

}

@end

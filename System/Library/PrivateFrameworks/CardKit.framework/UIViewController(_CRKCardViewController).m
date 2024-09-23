@implementation UIViewController(_CRKCardViewController)

- (uint64_t)_crk_isDescendantOfViewController:()_CRKCardViewController
{
  id v4;
  id v5;
  void *v6;
  uint64_t v7;

  v4 = a3;
  objc_msgSend(a1, "parentViewController");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  if (v5 == v4)
  {
    v7 = 1;
  }
  else
  {
    objc_msgSend(a1, "parentViewController");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    v7 = objc_msgSend(v6, "_crk_isDescendantOfViewController:", v4);

  }
  return v7;
}

@end

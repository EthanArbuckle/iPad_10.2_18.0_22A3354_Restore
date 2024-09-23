@implementation UIView(DOCExtensions)

- (id)doc_nearestAncestorViewController
{
  id v1;
  void *v2;
  uint64_t v3;
  void *v4;

  v1 = a1;
  if (v1)
  {
    v2 = v1;
    while (1)
    {
      objc_msgSend(v2, "doc_owningViewController");
      v3 = objc_claimAutoreleasedReturnValue();
      if (v3)
        break;
      objc_msgSend(v2, "superview");
      v4 = (void *)objc_claimAutoreleasedReturnValue();

      v2 = v4;
      if (!v4)
        return v4;
    }
    v4 = (void *)v3;

  }
  else
  {
    v4 = 0;
  }
  return v4;
}

- (uint64_t)doc_owningViewController
{
  return objc_msgSend(MEMORY[0x24BDF6F98], "viewControllerForView:", a1);
}

- (id)doc_presentingViewController
{
  void *v1;
  void *v2;

  objc_msgSend(a1, "doc_nearestAncestorViewController");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "presentingViewController");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  return v2;
}

@end

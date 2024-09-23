@implementation DOMNode(DDCleanupExtensions)

- (void)dd_removeResultLinks
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  void *v6;
  id v7;

  if (objc_msgSend(a1, "nodeType") == 1)
  {
    v7 = a1;
    objc_msgSend(v7, "getElementsByTagName:", CFSTR("A"));
    v2 = (void *)objc_claimAutoreleasedReturnValue();
    _DDArrayWithList(v2);
    v3 = (void *)objc_claimAutoreleasedReturnValue();

    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      objc_msgSend(v3, "arrayByAddingObject:", v7);
      v4 = objc_claimAutoreleasedReturnValue();

      v3 = (void *)v4;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
      _DDRemoveResultLinksFromArrayOfAnchors(v3, 0);

  }
  else
  {
    objc_msgSend(a1, "childNodes");
    v7 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "length"))
    {
      v5 = 0;
      do
      {
        objc_msgSend(v7, "item:", v5);
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "dd_removeResultLinks");

        v5 = (v5 + 1);
      }
      while (v5 < objc_msgSend(v7, "length"));
    }
  }

}

@end

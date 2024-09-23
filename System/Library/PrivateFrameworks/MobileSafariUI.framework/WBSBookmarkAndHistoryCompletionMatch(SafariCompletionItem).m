@implementation WBSBookmarkAndHistoryCompletionMatch(SafariCompletionItem)

- (uint64_t)shouldPrefetchWithMatchLength:()SafariCompletionItem
{
  uint64_t v2;

  v2 = objc_msgSend(a1, "shouldPreload");
  if ((_DWORD)v2)
    objc_msgSend(a1, "weight");
  return v2;
}

- (uint64_t)isEquivalentTo:()SafariCompletionItem
{
  id v4;
  id v5;
  void *v6;
  void *v7;
  char v8;
  void *v9;
  void *v10;
  uint64_t v11;

  v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v5 = v4;
    objc_msgSend(a1, "title");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "title");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = WBSIsEqual();

    if ((v8 & 1) != 0)
    {
      objc_msgSend(a1, "userVisibleURLString");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "userVisibleURLString");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      v11 = WBSIsEqual();

    }
    else
    {
      v11 = 0;
    }

  }
  else
  {
    v11 = 0;
  }

  return v11;
}

@end

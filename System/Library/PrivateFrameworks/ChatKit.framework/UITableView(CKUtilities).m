@implementation UITableView(CKUtilities)

- (id)__ck_indexPathForLastRow
{
  uint64_t v2;
  uint64_t v3;
  void *v4;

  v2 = objc_msgSend(a1, "numberOfSections");
  v3 = objc_msgSend(a1, "numberOfRowsInSection:", v2 - 1);
  v4 = 0;
  if (v2 >= 1 && v3 >= 1)
  {
    objc_msgSend(MEMORY[0x1E0CB36B0], "indexPathForRow:inSection:", v3 - 1, v2 - 1);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
  }
  return v4;
}

- (double)__ck_contentSize
{
  void *v2;
  void *v3;
  double v4;
  CGFloat v5;
  double v6;
  CGFloat v7;
  double v8;
  double v9;
  double v10;
  CGFloat v11;
  CGRect v13;

  objc_msgSend(a1, "__ck_indexPathForLastRow");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  if (v2)
  {
    objc_msgSend(a1, "__ck_indexPathForLastRow");
    v3 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "rectForRowAtIndexPath:", v3);
    v5 = v4;
    v7 = v6;
    v9 = v8;
    v11 = v10;

    v13.origin.x = v5;
    v13.origin.y = v7;
    v13.size.width = v9;
    v13.size.height = v11;
    CGRectGetMaxY(v13);
  }
  else
  {
    v9 = *MEMORY[0x1E0C9D820];
  }

  return v9;
}

@end

@implementation UIScrollView(FMCoreUI)

- (BOOL)isContentLargerThanBounds
{
  double v2;
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;

  objc_msgSend(a1, "layoutIfNeeded");
  objc_msgSend(a1, "bounds");
  v3 = v2;
  v5 = v4;
  objc_msgSend(a1, "contentSize");
  return v7 > v5 || v6 > v3;
}

- (uint64_t)centerContentIfNecessary
{
  uint64_t result;

  result = objc_msgSend(a1, "isContentLargerThanBounds");
  if ((result & 1) == 0)
    return objc_msgSend(a1, "centerContentWithOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
  return result;
}

- (uint64_t)centerContent
{
  return objc_msgSend(a1, "centerContentWithOffset:animated:", 0, *MEMORY[0x24BDBEFB0], *(double *)(MEMORY[0x24BDBEFB0] + 8));
}

- (uint64_t)centerContentWithOffset:()FMCoreUI animated:
{
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;

  objc_msgSend(a1, "layoutIfNeeded");
  objc_msgSend(a1, "contentSize");
  v10 = v9;
  v12 = v11 * 0.5;
  objc_msgSend(a1, "bounds");
  v14 = v12 - v13 * 0.5;
  objc_msgSend(a1, "bounds");
  return objc_msgSend(a1, "setContentOffset:animated:", a5, v14 - a2, v10 * 0.5 - v15 * 0.5 - a3);
}

- (uint64_t)scrollSubviewToVisible:()FMCoreUI animated:
{
  id v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;

  v6 = a3;
  objc_msgSend(v6, "superview");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "frame");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;

  objc_msgSend(v7, "convertRect:toView:", a1, v9, v11, v13, v15);
  v17 = v16;
  v19 = v18;
  v21 = v20;
  v23 = v22;

  return objc_msgSend(a1, "scrollRectToVisible:animated:", a4, v17, v19, v21, v23);
}

@end

@implementation UIView(_CRKCardViewVisibility)

- (uint64_t)_crk_otherSubviewsOccludeSubview:()_CRKCardViewVisibility
{
  id v4;
  void *v5;
  uint64_t v6;
  id v7;
  uint64_t v8;
  _QWORD v10[4];
  id v11;
  uint64_t *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t *v15;
  uint64_t v16;
  char v17;

  v4 = a3;
  objc_msgSend(a1, "subviews");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "indexOfObject:", v4);
  v14 = 0;
  v15 = &v14;
  v16 = 0x2020000000;
  v17 = 0;
  v10[0] = MEMORY[0x24BDAC760];
  v10[1] = 3221225472;
  v10[2] = __67__UIView__CRKCardViewVisibility___crk_otherSubviewsOccludeSubview___block_invoke;
  v10[3] = &unk_24DA4D0B0;
  v13 = v6;
  v7 = v4;
  v11 = v7;
  v12 = &v14;
  objc_msgSend(v5, "enumerateObjectsUsingBlock:", v10);
  v8 = *((unsigned __int8 *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (uint64_t)_crk_subviewIsVisible:()_CRKCardViewVisibility
{
  id v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  CGFloat v12;
  CGFloat v13;
  CGFloat v14;
  CGFloat v15;
  CGFloat v16;
  uint64_t v17;
  CGRect v19;
  CGRect v20;

  v4 = a3;
  objc_msgSend(a1, "bounds");
  v6 = v5;
  v8 = v7;
  v10 = v9;
  v12 = v11;
  objc_msgSend(v4, "frame");
  v20.origin.x = v13;
  v20.origin.y = v14;
  v20.size.width = v15;
  v20.size.height = v16;
  v19.origin.x = v6;
  v19.origin.y = v8;
  v19.size.width = v10;
  v19.size.height = v12;
  if (CGRectIntersectsRect(v19, v20))
    v17 = objc_msgSend(a1, "_crk_otherSubviewsOccludeSubview:", v4) ^ 1;
  else
    v17 = 0;

  return v17;
}

@end

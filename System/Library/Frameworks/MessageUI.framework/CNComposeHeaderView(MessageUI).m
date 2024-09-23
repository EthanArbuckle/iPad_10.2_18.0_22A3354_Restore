@implementation CNComposeHeaderView(MessageUI)

- (double)mf_scribbleFrame
{
  void *v2;
  void *v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  double v12;
  double MaxX;
  double v14;
  CGFloat v15;
  double v16;
  CGFloat v17;
  double v18;
  CGFloat v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t v23;
  uint64_t v24;
  CGRect v26;
  CGRect v27;

  objc_msgSend(a1, "labelView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "labelView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bounds");
  objc_msgSend(v2, "convertRect:toView:", a1);
  v5 = v4;
  v7 = v6;
  v9 = v8;
  v11 = v10;

  objc_msgSend(a1, "bounds");
  MaxX = v12;
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v20 = objc_msgSend(a1, "effectiveUserInterfaceLayoutDirection");
  v21 = v5;
  v22 = v7;
  v23 = v9;
  v24 = v11;
  if (v20 == 1)
  {
    CGRectGetMinX(*(CGRect *)&v21);
  }
  else
  {
    MaxX = CGRectGetMaxX(*(CGRect *)&v21);
    objc_msgSend(a1, "bounds");
    CGRectGetMaxX(v26);
  }
  v27.origin.x = MaxX;
  v27.origin.y = v15;
  v27.size.width = v17;
  v27.size.height = v19;
  CGRectGetMinX(v27);
  return MaxX;
}

@end

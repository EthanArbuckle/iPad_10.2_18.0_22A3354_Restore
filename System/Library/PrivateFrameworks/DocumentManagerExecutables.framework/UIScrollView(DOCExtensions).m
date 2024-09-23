@implementation UIScrollView(DOCExtensions)

- (void)doc_setAutomaticContentOffsetAdjustmentDisabledCount:()DOCExtensions
{
  void *v6;
  id v7;

  if (a3 < 0)
  {
    objc_msgSend(MEMORY[0x24BDD1448], "currentHandler");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "handleFailureInMethod:object:file:lineNumber:description:", a2, a1, CFSTR("UIScrollView+DOCExtensions.m"), 20, CFSTR("Unbalanced calls to begin/endDisablingAutomaticContentOffsetAdjustment detected"));

  }
  objc_msgSend(MEMORY[0x24BDD16E0], "numberWithInteger:", a3);
  v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_setAssociatedObject(a1, &doc_automaticContentOffsetAdjustmentDisabledCountKey, v7, (void *)0x301);

}

- (uint64_t)doc_automaticContentOffsetAdjustmentDisabledCount
{
  uint64_t v1;
  void *v2;
  void *v3;
  id v4;
  uint64_t v5;

  objc_getAssociatedObject(a1, &doc_automaticContentOffsetAdjustmentDisabledCountKey);
  v1 = objc_claimAutoreleasedReturnValue();
  v2 = (void *)v1;
  v3 = &unk_24E33E710;
  if (v1)
    v3 = (void *)v1;
  v4 = v3;

  v5 = objc_msgSend(v4, "integerValue");
  return v5;
}

- (uint64_t)doc_adjustForAutomaticKeyboardInfo:()DOCExtensions animated:lastAdjustment:
{
  double v7;
  uint64_t result;
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

  v7 = *a5;
  result = objc_msgSend(a1, "doc_verticalOverlapIntoSafeAreaForView:usingKeyboardInfo:", a1, a3);
  if (v7 != v9)
  {
    *a5 = v9;
    v10 = v9 - v7;
    objc_msgSend(a1, "contentInset");
    v12 = v11;
    v14 = v13;
    v16 = v15;
    v18 = v10 + v17;
    objc_msgSend(a1, "setContentInset:");
    return objc_msgSend(a1, "setScrollIndicatorInsets:", v12, v14, v18, v16);
  }
  return result;
}

- (double)doc_verticalOverlapIntoSafeAreaForView:()DOCExtensions usingKeyboardInfo:
{
  id v6;
  id v7;
  void *v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  double v30;
  double v31;
  void *v32;
  void *v33;
  void *v34;
  double v35;
  CGFloat v36;
  double v37;
  double v38;
  double v39;
  CGFloat v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double MaxY;
  void *v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v7)
  {
    objc_msgSend(v7, "objectForKey:", *MEMORY[0x24BEBE468]);
    v50 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v50, "CGRectValue");
    v10 = v9;
    v12 = v11;
    v14 = v13;
    v16 = v15;
    objc_msgSend(a1, "window");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "windowScene");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "coordinateSpace");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(a1, "window");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "windowScene");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "screen");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v22, "coordinateSpace");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v19, "convertRect:fromCoordinateSpace:", v23, v10, v12, v14, v16);
    v25 = v24;
    v27 = v26;
    v29 = v28;
    v31 = v30;

    objc_msgSend(a1, "window");
    v32 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v32, "windowScene");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v33, "coordinateSpace");
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v34, "convertRect:toCoordinateSpace:", v6, v25, v27, v29, v31);
    v36 = v35;
    v38 = v37;
    v40 = v39;
    v42 = v41;

    objc_msgSend(a1, "safeAreaInsets");
    v44 = v42 - v43;
    objc_msgSend(a1, "safeAreaInsets");
    v46 = v38 + v45;

  }
  else
  {
    v36 = *MEMORY[0x24BDBF090];
    v46 = *(double *)(MEMORY[0x24BDBF090] + 8);
    v40 = *(double *)(MEMORY[0x24BDBF090] + 16);
    v44 = *(double *)(MEMORY[0x24BDBF090] + 24);
  }
  v51.origin.x = v36;
  v51.origin.y = v46;
  v51.size.width = v40;
  v51.size.height = v44;
  v47 = 0.0;
  if (!CGRectIsEmpty(v51))
  {
    objc_msgSend(v6, "bounds");
    MaxY = CGRectGetMaxY(v52);
    v53.origin.x = v36;
    v53.origin.y = v46;
    v53.size.width = v40;
    v53.size.height = v44;
    v47 = fmax(MaxY - CGRectGetMinY(v53), 0.0);
  }

  return v47;
}

@end

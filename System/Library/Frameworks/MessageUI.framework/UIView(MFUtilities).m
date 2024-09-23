@implementation UIView(MFUtilities)

- (id)mf_enclosingScrollView
{
  id v1;
  uint64_t v2;

  v1 = a1;
  if (v1)
  {
    do
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
        break;
      objc_msgSend(v1, "superview");
      v2 = objc_claimAutoreleasedReturnValue();

      v1 = (id)v2;
    }
    while (v2);
  }
  return v1;
}

- (id)mf_frontSibling
{
  void *v1;
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;

  v1 = a1;
  objc_msgSend(a1, "superview");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "subviews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "objectEnumerator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();

  v5 = 0;
  while (1)
  {
    objc_msgSend(v4, "nextObject");
    v6 = (void *)objc_claimAutoreleasedReturnValue();

    if (!v6)
      break;
    v5 = v6;
    if (v6 == v1)
    {
      objc_msgSend(v4, "nextObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      goto LABEL_6;
    }
  }
  v1 = 0;
LABEL_6:

  return v6;
}

- (double)mf_currentScreenScale
{
  void *v1;
  void *v2;
  double v3;
  double v4;

  objc_msgSend(a1, "window");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "screen");
  v2 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v2)
  {
    objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
    v2 = (void *)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend(v2, "scale");
  v4 = v3;

  return v4;
}

- (uint64_t)mf_pinToView:()MFUtilities usingLayoutMargins:
{
  uint64_t v4;

  if (a4)
    v4 = 15;
  else
    v4 = 0;
  return objc_msgSend(a1, "mf_pinToView:layoutMarginEdges:flexibleEdges:", a3, v4, 0);
}

- (void)mf_pinToView:()MFUtilities layoutMarginEdges:flexibleEdges:
{
  id v8;
  id v9;
  void (**v10)(void *, uint64_t);
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  _QWORD aBlock[5];
  id v18;
  uint64_t v19;
  uint64_t v20;
  _QWORD v21[5];

  v21[4] = *MEMORY[0x1E0C80C00];
  v8 = a3;
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __68__UIView_MFUtilities__mf_pinToView_layoutMarginEdges_flexibleEdges___block_invoke;
  aBlock[3] = &unk_1E5A69F08;
  v19 = a5;
  aBlock[4] = a1;
  v9 = v8;
  v18 = v9;
  v20 = a4;
  v10 = (void (**)(void *, uint64_t))_Block_copy(aBlock);
  v11 = (void *)MEMORY[0x1E0CB3718];
  v10[2](v10, 1);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v21[0] = v12;
  v10[2](v10, 4);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v21[1] = v13;
  v10[2](v10, 2);
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  v21[2] = v14;
  v10[2](v10, 8);
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v21[3] = v15;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v21, 4);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "activateConstraints:", v16);

}

- (id)_mf_anchorForEdge:()MFUtilities relativeToMargin:
{
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;

  if ((a3 & 1) != 0)
  {
    if (!a4)
    {
      objc_msgSend(a1, "topAnchor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    objc_msgSend(a1, "layoutMarginsGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "topAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
LABEL_16:
    v4 = (void *)v6;

    return v4;
  }
  if ((a3 & 4) != 0)
  {
    if (!a4)
    {
      objc_msgSend(a1, "bottomAnchor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    objc_msgSend(a1, "layoutMarginsGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bottomAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a3 & 2) != 0)
  {
    if (!a4)
    {
      objc_msgSend(a1, "leadingAnchor");
      v7 = objc_claimAutoreleasedReturnValue();
      goto LABEL_19;
    }
    objc_msgSend(a1, "layoutMarginsGuide");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "leadingAnchor");
    v6 = objc_claimAutoreleasedReturnValue();
    goto LABEL_16;
  }
  if ((a3 & 8) != 0)
  {
    if (a4)
    {
      objc_msgSend(a1, "layoutMarginsGuide");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v5, "trailingAnchor");
      v6 = objc_claimAutoreleasedReturnValue();
      goto LABEL_16;
    }
    objc_msgSend(a1, "trailingAnchor");
    v7 = objc_claimAutoreleasedReturnValue();
LABEL_19:
    v4 = (void *)v7;
    return v4;
  }
  v4 = 0;
  return v4;
}

@end

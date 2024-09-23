@implementation UIView(PKAdditions)

- (id)PK_enclosingScrollableScrollView
{
  id v1;
  void *v2;

  v1 = (id)objc_msgSend(a1, "superview");
  if (v1)
  {
    v2 = v1;
    while (1)
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) != 0)
      {
        if (objc_msgSend(v2, "isScrollEnabled"))
          break;
      }
      v1 = (id)objc_msgSend(v2, "superview");
      v2 = v1;
      if (!v1)
        return v1;
    }
    v1 = v2;
  }
  return v1;
}

- (uint64_t)PK_convertPoint:()PKAdditions fromView:
{
  return objc_msgSend(a3, "PK_convertPoint:toView:", a1);
}

- (uint64_t)PK_convertPoint:()PKAdditions toView:
{
  return objc_msgSend(a1, "PK_convertRect:toView:", a3, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (double)PK_convertRect:()PKAdditions toView:
{
  id v12;
  id v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  double v27;
  double v28;
  double v29;
  void *v30;
  void *v31;
  void *v32;
  double v33;
  double v34;
  double v35;
  double v36;
  id v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  void *v47;
  void *v48;
  double v49;
  double v50;
  double v51;
  double v52;
  double v53;
  double v54;

  v12 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v13 = a1;
  }
  else
  {
    objc_msgSend(a1, "window");
    v13 = (id)objc_claimAutoreleasedReturnValue();
  }
  v14 = v13;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    v15 = v12;
  }
  else
  {
    objc_msgSend(v12, "window");
    v15 = (id)objc_claimAutoreleasedReturnValue();
  }
  v16 = v15;
  v17 = a1;
  v18 = a2;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  if (v14 != v16)
  {
    objc_msgSend(a1, "convertRect:toView:", v14, a2, a3, a4, a5);
    v23 = v22;
    v25 = v24;
    v27 = v26;
    v29 = v28;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v30 = (void *)MEMORY[0x1E0DC3DB0];
      objc_msgSend(v14, "windowScene");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v30, "activeTextEffectsWindowForWindowScene:", v31);
      v32 = (void *)objc_claimAutoreleasedReturnValue();

      if (v32 && v32 != v14)
      {
        objc_msgSend(v32, "convertRect:fromWindow:", v14, v23, v25, v27, v29);
        v23 = v33;
        v25 = v34;
        v27 = v35;
        v29 = v36;
        v37 = v32;

        v14 = v37;
      }

    }
    objc_msgSend(v16, "convertRect:toCoordinateSpace:", v14, v23, v25, v27, v29);
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0)
    {
      v46 = (void *)MEMORY[0x1E0DC3DB0];
      objc_msgSend(v16, "windowScene");
      v47 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v46, "activeTextEffectsWindowForWindowScene:", v47);
      v48 = (void *)objc_claimAutoreleasedReturnValue();

      if (v48)
      {
        objc_msgSend(v48, "convertRect:toWindow:", v16, v23, v25, v27, v29);
        v39 = v49;
        v41 = v50;
        v43 = v51;
        v45 = v52;
      }

    }
    v17 = v16;
    v18 = v39;
    v19 = v41;
    v20 = v43;
    v21 = v45;
  }
  objc_msgSend(v17, "convertRect:toView:", v12, v18, v19, v20, v21);
  v54 = v53;

  return v54;
}

- (uint64_t)PK_convertRect:()PKAdditions fromView:
{
  return objc_msgSend(a3, "PK_convertRect:toView:", a1);
}

- (uint64_t)PK_convertPoint:()PKAdditions toCoordinateSpace:
{
  return objc_msgSend(a1, "PK_convertRect:toCoordinateSpace:", a3, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (uint64_t)PK_convertPoint:()PKAdditions fromCoordinateSpace:
{
  return objc_msgSend(a1, "PK_convertRect:fromCoordinateSpace:", a3, a4, *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
}

- (double)PK_convertRect:()PKAdditions toCoordinateSpace:
{
  id v12;
  double v13;
  double v14;

  v12 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "PK_convertRect:toView:", v12, a2, a3, a4, a5);
  else
    objc_msgSend(v12, "convertRect:fromCoordinateSpace:", a1, a2, a3, a4, a5);
  v14 = v13;

  return v14;
}

- (double)PK_convertRect:()PKAdditions fromCoordinateSpace:
{
  id v12;
  double v13;
  double v14;

  v12 = a7;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
    objc_msgSend(a1, "PK_convertRect:fromView:", v12, a2, a3, a4, a5);
  else
    objc_msgSend(v12, "convertRect:toCoordinateSpace:", a1, a2, a3, a4, a5);
  v14 = v13;

  return v14;
}

- (id)pk_autoFadeOutShapeRectLayer
{
  void *v1;
  id v2;

  objc_msgSend(a1, "pk_autoFadeOutShapePointLayer");
  v1 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v1, "setBorderColor:", objc_msgSend(v1, "backgroundColor"));
  objc_msgSend(v1, "setBorderWidth:", 2.0);
  objc_msgSend(MEMORY[0x1E0DC3658], "clearColor");
  v2 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v1, "setBackgroundColor:", objc_msgSend(v2, "CGColor"));

  return v1;
}

- (id)pk_autoFadeOutShapePointLayer
{
  id v2;
  void *v3;
  id v4;
  void *v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v10;

  v2 = objc_alloc_init(MEMORY[0x1E0CD27A8]);
  objc_msgSend(MEMORY[0x1E0DC3658], "pk_randomColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "colorWithAlphaComponent:", 0.8);
  v4 = objc_retainAutorelease((id)objc_claimAutoreleasedReturnValue());
  objc_msgSend(v2, "setBackgroundColor:", objc_msgSend(v4, "CGColor"));

  objc_msgSend(v2, "setBounds:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8), 10.0, 10.0);
  objc_msgSend(a1, "layer");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "addSublayer:", v2);

  v6 = dispatch_time(0, 1000000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __52__UIView_PKAdditions__pk_autoFadeOutShapePointLayer__block_invoke;
  block[3] = &unk_1E7778020;
  v7 = v2;
  v10 = v7;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

  return v7;
}

- (BOOL)PK_isBelowViewInDepth:()PKAdditions
{
  id v4;
  id v5;
  id v6;
  uint64_t v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  unint64_t v14;
  void *v15;
  _BOOL8 v16;

  v4 = a3;
  v5 = a1;
  v6 = v4;
  objc_msgSend(v5, "superview");
  v7 = objc_claimAutoreleasedReturnValue();
  v8 = (void *)v7;
  if (v6 && v7)
  {
    while ((objc_msgSend(v6, "isDescendantOfView:", v8) & 1) == 0)
    {
      v9 = v8;

      objc_msgSend(v9, "superview");
      v8 = (void *)objc_claimAutoreleasedReturnValue();

      v5 = v9;
      if (!v8)
        goto LABEL_7;
    }
  }
  v9 = v5;
LABEL_7:
  objc_msgSend(v6, "superview");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  if (!v10 || v10 == v8)
  {
    v11 = v6;
  }
  else
  {
    v11 = v6;
    do
    {
      v12 = v11;
      v11 = v10;

      objc_msgSend(v11, "superview");
      v10 = (void *)objc_claimAutoreleasedReturnValue();
    }
    while (v10 && v10 != v8);
  }

  objc_msgSend(v8, "subviews");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "indexOfObject:", v9);
  objc_msgSend(v8, "subviews");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  v16 = v14 < objc_msgSend(v15, "indexOfObject:", v11);

  return v16;
}

@end

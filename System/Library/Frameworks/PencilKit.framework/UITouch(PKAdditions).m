@implementation UITouch(PKAdditions)

- (double)PK_locationInView:()PKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  objc_msgSend(a1, "window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  objc_msgSend(v4, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
LABEL_6:
    objc_msgSend(a1, "locationInView:", v4);
    v18 = v19;
    goto LABEL_7;
  }
  objc_msgSend(a1, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "locationInView:", v11);
  v13 = v12;
  v15 = v14;

  objc_msgSend(a1, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "PK_convertPoint:toView:", v4, v13, v15);
  v18 = v17;

LABEL_7:
  return v18;
}

- (double)PK_preciseLocationInView:()PKAdditions
{
  id v4;
  uint64_t v5;
  void *v6;
  uint64_t v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  void *v16;
  double v17;
  double v18;
  double v19;

  v4 = a3;
  objc_msgSend(v4, "window");
  v5 = objc_claimAutoreleasedReturnValue();
  if (!v5)
    goto LABEL_6;
  v6 = (void *)v5;
  objc_msgSend(a1, "window");
  v7 = objc_claimAutoreleasedReturnValue();
  if (!v7)
  {

    goto LABEL_6;
  }
  v8 = (void *)v7;
  objc_msgSend(v4, "window");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "window");
  v10 = (void *)objc_claimAutoreleasedReturnValue();

  if (v9 == v10)
  {
LABEL_6:
    objc_msgSend(a1, "preciseLocationInView:", v4);
    v18 = v19;
    goto LABEL_7;
  }
  objc_msgSend(a1, "window");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(a1, "preciseLocationInView:", v11);
  v13 = v12;
  v15 = v14;

  objc_msgSend(a1, "window");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "PK_convertPoint:toView:", v4, v13, v15);
  v18 = v17;

LABEL_7:
  return v18;
}

- (double)PK_rollAngle
{
  double result;

  if ((objc_opt_respondsToSelector() & 1) == 0)
    return 0.0;
  objc_msgSend(a1, "_rollAngle");
  return result;
}

@end

@implementation UIViewController(EffectiveInterface)

- (uint64_t)dc_effectiveInterfaceOrientation
{
  void *v2;
  double v3;
  double v4;
  void *v5;
  double v6;
  double v7;

  objc_msgSend(a1, "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "bounds");
  v4 = v3;
  objc_msgSend(a1, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "bounds");
  v7 = v6;

  if (v4 <= v7)
    return 1;
  else
    return 4;
}

- (void)dc_getEffectiveInterfaceOrientation:()EffectiveInterface andEffectiveInterfaceIdiom:
{
  void *v7;
  uint64_t v8;
  uint64_t v9;
  uint64_t v10;
  uint64_t v11;
  void *v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  id v20;

  objc_msgSend(MEMORY[0x24BDF69C8], "currentDevice");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v7, "userInterfaceIdiom");

  if (v8)
  {
    objc_msgSend(a1, "traitCollection");
    v20 = (id)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v20, "horizontalSizeClass");
    v10 = objc_msgSend(v20, "verticalSizeClass");
    v11 = v10;
    if (v9 == 1 && v10 == 2)
      goto LABEL_7;
    objc_msgSend(a1, "view");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "bounds");
    v14 = v13;
    objc_msgSend(a1, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "bounds");
    v17 = v16;

    if (v9 != 2)
      goto LABEL_9;
    if (v11 == 2 && v14 / v17 + 0.01 < 0.75)
    {
LABEL_7:
      v18 = 0;
      v19 = 1;
    }
    else
    {
LABEL_9:
      v19 = objc_msgSend(a1, "dc_effectiveInterfaceOrientation");
      v18 = 1;
    }
    *a3 = v19;
    *a4 = v18;

  }
  else
  {
    *a3 = objc_msgSend(a1, "dc_effectiveInterfaceOrientation");
    *a4 = 0;
  }
}

@end

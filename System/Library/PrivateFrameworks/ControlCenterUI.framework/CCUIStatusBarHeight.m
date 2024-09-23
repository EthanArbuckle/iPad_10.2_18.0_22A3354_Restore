@implementation CCUIStatusBarHeight

void __CCUIStatusBarHeight_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  void *v3;
  double Width;
  double v5;
  double v6;
  double v7;
  void *v8;
  uint64_t v9;
  double v10;
  uint64_t v11;
  double v12;
  double v13;
  id v14;
  CGRect v15;
  CGRect v16;
  CGRect v17;
  CGRect v18;
  CGRect v19;
  CGRect v20;
  CGRect v21;
  CGRect v22;
  CGRect v23;
  CGRect v24;
  CGRect v25;
  CGRect v26;
  CGRect v27;

  CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v15);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIStatusBarHeight_height = 0x4032000000000000;
LABEL_38:

      goto LABEL_39;
    }
  }
  CCUIReferenceScreenBounds();
  v5 = CGRectGetWidth(v16);
  if (v5 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v17);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIStatusBarHeight_height = 0x4032000000000000;
LABEL_34:

LABEL_35:
        if (v5 < 1024.0)
          goto LABEL_37;
        goto LABEL_36;
      }
    }
    CCUIReferenceScreenBounds();
    v7 = CGRectGetWidth(v18);
    if (v7 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v3, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        CCUIStatusBarHeight_height = 0x4032000000000000;
LABEL_32:

LABEL_33:
        if (v6 < 834.0)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v9 = objc_msgSend(v8, "userInterfaceIdiom");
    v10 = 18.0;
    if (v9 != 1)
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v19) >= 430.0)
      {
LABEL_25:
        v11 = 0x4049000000000000;
LABEL_28:
        v10 = *(double *)&v11;
        goto LABEL_29;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v20) >= 428.0)
        goto LABEL_27;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v21) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
        goto LABEL_27;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v22) >= 414.0)
      {
        v10 = 31.5;
        goto LABEL_29;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v23) >= 393.0)
      {
LABEL_27:
        v11 = 0x4046000000000000;
        goto LABEL_28;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v24) >= 390.0)
        goto LABEL_25;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v25) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
        goto LABEL_25;
      CCUIReferenceScreenBounds();
      CGRectGetWidth(v27);
      v10 = 22.0;
    }
LABEL_29:
    CCUIStatusBarHeight_height = *(_QWORD *)&v10;

    if (v7 < 834.0)
      goto LABEL_33;
    goto LABEL_32;
  }
  CCUIStatusBarHeight_height = 0x4032000000000000;
LABEL_36:

LABEL_37:
  if (Width >= 1024.0)
    goto LABEL_38;
LABEL_39:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v14 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v14, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
  {

  }
  else
  {
    CCUIReferenceScreenBounds();
    v12 = CGRectGetWidth(v26);

    if (v12 < 375.0)
    {
      v13 = *(double *)&CCUIStatusBarHeight_height;
      if (*(double *)&CCUIStatusBarHeight_height < 50.0)
        v13 = 50.0;
      CCUIStatusBarHeight_height = *(_QWORD *)&v13;
    }
  }
}

@end

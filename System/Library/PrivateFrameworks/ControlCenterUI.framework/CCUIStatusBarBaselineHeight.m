@implementation CCUIStatusBarBaselineHeight

void __CCUIStatusBarBaselineHeight_block_invoke()
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
  double v9;
  double v10;
  double v11;
  id v12;
  CGRect v13;
  CGRect v14;
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

  CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v13);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIStatusBarBaselineHeight_height = 0x4020000000000000;
LABEL_36:

      goto LABEL_37;
    }
  }
  CCUIReferenceScreenBounds();
  v5 = CGRectGetWidth(v14);
  if (v5 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v15);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIStatusBarBaselineHeight_height = 0x4014000000000000;
LABEL_32:

LABEL_33:
        if (v5 < 1024.0)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    CCUIReferenceScreenBounds();
    v7 = CGRectGetWidth(v16);
    if (v7 >= 834.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIStatusBarBaselineHeight_height = 0x4014000000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 6.0;
      if (objc_msgSend(v8, "userInterfaceIdiom") != 1)
      {
        CCUIReferenceScreenBounds();
        v9 = 14.0;
        if (CGRectGetWidth(v17) < 430.0)
        {
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v18) < 428.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v19) < 414.0 || (v9 = 15.0, SBFEffectiveHomeButtonType() != 2))
            {
              CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v20) >= 414.0)
              {
                v9 = 14.3333333;
              }
              else
              {
                CCUIReferenceScreenBounds();
                v9 = 16.0;
                if (CGRectGetWidth(v21) < 393.0)
                {
                  CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v22) < 390.0)
                  {
                    CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v23) < 375.0 || (v9 = 17.0, SBFEffectiveHomeButtonType() != 2))
                    {
                      CCUIReferenceScreenBounds();
                      CGRectGetWidth(v24);
                      v9 = 5.0;
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUIStatusBarBaselineHeight_height = *(_QWORD *)&v9;

      if (v7 < 834.0)
      {
LABEL_31:
        if (v6 < 834.0)
          goto LABEL_33;
        goto LABEL_32;
      }
    }

    goto LABEL_31;
  }
  CCUIStatusBarBaselineHeight_height = 0x4020000000000000;
LABEL_34:

LABEL_35:
  if (Width >= 1024.0)
    goto LABEL_36;
LABEL_37:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
  {

  }
  else
  {
    CCUIReferenceScreenBounds();
    v10 = CGRectGetWidth(v25);

    if (v10 < 375.0)
    {
      v11 = *(double *)&CCUIStatusBarBaselineHeight_height;
      if (*(double *)&CCUIStatusBarBaselineHeight_height < 17.0)
        v11 = 17.0;
      CCUIStatusBarBaselineHeight_height = *(_QWORD *)&v11;
    }
  }
}

@end

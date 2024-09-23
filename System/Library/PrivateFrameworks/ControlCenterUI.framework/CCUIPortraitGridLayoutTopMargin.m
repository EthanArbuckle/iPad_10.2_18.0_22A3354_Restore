@implementation CCUIPortraitGridLayoutTopMargin

void __CCUIPortraitGridLayoutTopMargin_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  double Width;
  double v4;
  double v5;
  double v6;
  void *v7;
  double v8;
  uint64_t v9;
  id v10;
  CGRect v11;
  CGRect v12;
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

  CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v11);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIPortraitGridLayoutTopMargin_margin = 0x4041000000000000;

      return;
    }
  }
  CCUIReferenceScreenBounds();
  v4 = CGRectGetWidth(v12);
  if (v4 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v13);
    if (v5 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIPortraitGridLayoutTopMargin_margin = 0x403C000000000000;
LABEL_35:

LABEL_36:
        if (v4 < 1024.0)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v14);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        CCUIPortraitGridLayoutTopMargin_margin = 0x403C000000000000;
LABEL_33:

LABEL_34:
        if (v5 < 834.0)
          goto LABEL_36;
        goto LABEL_35;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 28.0;
    if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v15) >= 430.0)
      {
        v8 = 37.0;
        goto LABEL_32;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v16) >= 428.0)
      {
        v9 = 0x4042000000000000;
      }
      else
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v17) < 414.0 || SBFEffectiveHomeButtonType() != 2)
        {
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v18) < 414.0)
          {
            CCUIReferenceScreenBounds();
            v8 = 30.0;
            if (CGRectGetWidth(v19) < 393.0)
            {
              CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v20) < 390.0)
              {
                CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v21) < 375.0 || (v8 = 28.0, SBFEffectiveHomeButtonType() != 2))
                {
                  CCUIReferenceScreenBounds();
                  CGRectGetWidth(v22);
                  v8 = 13.0;
                }
              }
            }
            goto LABEL_32;
          }
        }
        v9 = 0x4041000000000000;
      }
      v8 = *(double *)&v9;
    }
LABEL_32:
    CCUIPortraitGridLayoutTopMargin_margin = *(_QWORD *)&v8;

    if (v6 < 834.0)
      goto LABEL_34;
    goto LABEL_33;
  }
  CCUIPortraitGridLayoutTopMargin_margin = 0x4041000000000000;
LABEL_37:

LABEL_38:
  if (Width >= 1024.0)

}

@end

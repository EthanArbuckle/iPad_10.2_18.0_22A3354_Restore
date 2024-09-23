@implementation CCUIPortraitStatusBarBaselineToTopOffsetHeight

void ___CCUIPortraitStatusBarBaselineToTopOffsetHeight_block_invoke()
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
  void *v11;
  double v12;
  double v13;
  double v14;
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
  CGRect v28;

  CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v15);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_40:

      goto LABEL_41;
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
        _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_36:

LABEL_37:
        if (v5 < 1024.0)
          goto LABEL_39;
        goto LABEL_38;
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
        _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_34:

LABEL_35:
        if (v6 < 834.0)
          goto LABEL_37;
        goto LABEL_36;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceIdiom") == 1)
    {
      v9 = 0x4052000000000000;
    }
    else
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v19) < 430.0)
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v20) >= 428.0)
        {
          v10 = 125.0;
          goto LABEL_33;
        }
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v21) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
        {
          v10 = 122.0;
          goto LABEL_33;
        }
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v22) >= 414.0)
        {
          v9 = 0x4055000000000000;
          goto LABEL_32;
        }
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v23) < 393.0)
        {
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v24) < 390.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v25) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
            {
              v10 = 97.0;
            }
            else
            {
              CCUIReferenceScreenBounds();
              CGRectGetWidth(v28);
              v10 = 27.0;
            }
LABEL_33:
            _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = *(_QWORD *)&v10;

            if (v7 < 834.0)
              goto LABEL_35;
            goto LABEL_34;
          }
        }
      }
      v9 = 0x4059000000000000;
    }
LABEL_32:
    v10 = *(double *)&v9;
    goto LABEL_33;
  }
  _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4052000000000000;
LABEL_38:

LABEL_39:
  if (Width >= 1024.0)
    goto LABEL_40;
LABEL_41:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v11, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
  {

  }
  else
  {
    CCUIReferenceScreenBounds();
    v12 = CGRectGetWidth(v26);

    if (v12 < 375.0)
    {
      v13 = *(double *)&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_height;
      if (*(double *)&_CCUIPortraitStatusBarBaselineToTopOffsetHeight_height < 97.0)
        v13 = 97.0;
      _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = *(_QWORD *)&v13;
    }
  }
  CCUIReferenceScreenBounds();
  if (CGRectGetWidth(v27) <= 375.0)
  {
    CCUIScreenSafeAreaInsets();
    if (v14 >= 50.0)
      _CCUIPortraitStatusBarBaselineToTopOffsetHeight_height = 0x4059C00000000000;
  }
}

@end

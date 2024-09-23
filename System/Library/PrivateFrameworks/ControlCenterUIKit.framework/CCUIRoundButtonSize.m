@implementation CCUIRoundButtonSize

void ___CCUIRoundButtonSize_block_invoke()
{
  void *v0;
  void *v1;
  void *v2;
  double Width;
  double v4;
  double v5;
  double v6;
  void *v7;
  uint64_t v8;
  double v9;
  void *v10;
  BOOL v11;
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

  v13.origin.x = CCUIReferenceScreenBounds();
  if (CGRectGetWidth(v13) < 375.0)
  {
    _CCUIRoundButtonSize_size = 0x4047000000000000;
    return;
  }
  v14.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v14);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      _CCUIRoundButtonSize_size = 0x404B000000000000;
      v10 = v12;
LABEL_41:

      return;
    }
  }
  v15.origin.x = CCUIReferenceScreenBounds();
  v4 = CGRectGetWidth(v15);
  if (v4 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v16.origin.x = CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v16);
    if (v5 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        _CCUIRoundButtonSize_size = 0x404A000000000000;
LABEL_37:

LABEL_38:
        if (v4 < 1024.0)
          goto LABEL_40;
        goto LABEL_39;
      }
    }
    v17.origin.x = CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v17);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        _CCUIRoundButtonSize_size = 0x404A000000000000;
        goto LABEL_35;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    {
      v8 = 0x404A000000000000;
    }
    else
    {
      v18.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v18) >= 430.0
        || (v19.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v19) >= 428.0)
        || (v20.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v20) >= 414.0)
        && SBFEffectiveHomeButtonType() == 2
        || (v21.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v21) >= 414.0))
      {
        v8 = 0x404E000000000000;
      }
      else
      {
        v22.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v22) >= 393.0 || (v23.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v23) >= 390.0))
        {
          v8 = 0x404C000000000000;
        }
        else
        {
          v24.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v24) < 375.0 || SBFEffectiveHomeButtonType() != 2)
          {
            v25.origin.x = CCUIReferenceScreenBounds();
            v11 = CGRectGetWidth(v25) < 375.0;
            v9 = 52.0;
            if (!v11)
              v9 = 54.0;
LABEL_31:
            _CCUIRoundButtonSize_size = *(_QWORD *)&v9;

            if (v6 < 834.0)
            {
LABEL_36:
              if (v5 < 834.0)
                goto LABEL_38;
              goto LABEL_37;
            }
LABEL_35:

            goto LABEL_36;
          }
          v8 = 0x404B000000000000;
        }
      }
    }
    v9 = *(double *)&v8;
    goto LABEL_31;
  }
  _CCUIRoundButtonSize_size = 0x404B000000000000;
LABEL_39:

LABEL_40:
  v10 = v12;
  if (Width >= 1024.0)
    goto LABEL_41;
}

@end

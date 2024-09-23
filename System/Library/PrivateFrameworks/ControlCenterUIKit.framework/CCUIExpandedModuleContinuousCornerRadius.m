@implementation CCUIExpandedModuleContinuousCornerRadius

void __CCUIExpandedModuleContinuousCornerRadius_block_invoke()
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

  v13.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v13);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v12 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v12, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIExpandedModuleContinuousCornerRadius_radius = 0x4043000000000000;
      v10 = v12;
LABEL_39:

      return;
    }
  }
  v14.origin.x = CCUIReferenceScreenBounds();
  v4 = CGRectGetWidth(v14);
  if (v4 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v15.origin.x = CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v15);
    if (v5 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIExpandedModuleContinuousCornerRadius_radius = 0x4041000000000000;
LABEL_35:

LABEL_36:
        if (v4 < 1024.0)
          goto LABEL_38;
        goto LABEL_37;
      }
    }
    v16.origin.x = CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v16);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        CCUIExpandedModuleContinuousCornerRadius_radius = 0x4041000000000000;
        goto LABEL_33;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v7, "userInterfaceIdiom") == 1)
    {
      v8 = 0x4041000000000000;
    }
    else
    {
      v17.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v17) >= 430.0
        || (v18.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v18) >= 428.0)
        || (v19.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v19) >= 414.0)
        && SBFEffectiveHomeButtonType() == 2
        || (v20.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v20) >= 414.0))
      {
        v8 = 0x4045000000000000;
      }
      else
      {
        v21.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v21) >= 393.0 || (v22.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v22) >= 390.0))
        {
          v8 = 0x4044000000000000;
        }
        else
        {
          v23.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v23) < 375.0 || SBFEffectiveHomeButtonType() != 2)
          {
            v24.origin.x = CCUIReferenceScreenBounds();
            v11 = CGRectGetWidth(v24) < 375.0;
            v9 = 34.0;
            if (!v11)
              v9 = 38.0;
LABEL_29:
            CCUIExpandedModuleContinuousCornerRadius_radius = *(_QWORD *)&v9;

            if (v6 < 834.0)
            {
LABEL_34:
              if (v5 < 834.0)
                goto LABEL_36;
              goto LABEL_35;
            }
LABEL_33:

            goto LABEL_34;
          }
          v8 = 0x4043000000000000;
        }
      }
    }
    v9 = *(double *)&v8;
    goto LABEL_29;
  }
  CCUIExpandedModuleContinuousCornerRadius_radius = 0x4043000000000000;
LABEL_37:

LABEL_38:
  v10 = v12;
  if (Width >= 1024.0)
    goto LABEL_39;
}

@end

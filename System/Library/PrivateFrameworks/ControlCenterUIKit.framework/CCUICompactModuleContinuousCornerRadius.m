@implementation CCUICompactModuleContinuousCornerRadius

void __CCUICompactModuleContinuousCornerRadius_block_invoke()
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
  id v9;
  CGRect v10;
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

  v10.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v10);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v9 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v9, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUICompactModuleContinuousCornerRadius_radius = 0x4033000000000000;

      return;
    }
  }
  v11.origin.x = CCUIReferenceScreenBounds();
  v4 = CGRectGetWidth(v11);
  if (v4 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v12.origin.x = CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v12);
    if (v5 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUICompactModuleContinuousCornerRadius_radius = 0x4031000000000000;
LABEL_34:

LABEL_35:
        if (v4 < 1024.0)
          goto LABEL_37;
        goto LABEL_36;
      }
    }
    v13.origin.x = CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v13);
    if (v6 >= 834.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUICompactModuleContinuousCornerRadius_radius = 0x4031000000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      v8 = 17.0;
      if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
      {
        v14.origin.x = CCUIReferenceScreenBounds();
        v8 = 21.0;
        if (CGRectGetWidth(v14) < 430.0)
        {
          v15.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v15) < 428.0)
          {
            v16.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v16) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v17.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v17) < 414.0)
              {
                v18.origin.x = CCUIReferenceScreenBounds();
                v8 = 20.0;
                if (CGRectGetWidth(v18) < 393.0)
                {
                  v19.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v19) < 390.0)
                  {
                    v20.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v20) < 375.0 || (v8 = 19.0, SBFEffectiveHomeButtonType() != 2))
                    {
                      v21.origin.x = CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v21) < 375.0)
                        v8 = 17.0;
                      else
                        v8 = 19.0;
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUICompactModuleContinuousCornerRadius_radius = *(_QWORD *)&v8;

      if (v6 < 834.0)
      {
LABEL_33:
        if (v5 < 834.0)
          goto LABEL_35;
        goto LABEL_34;
      }
    }

    goto LABEL_33;
  }
  CCUICompactModuleContinuousCornerRadius_radius = 0x4033000000000000;
LABEL_36:

LABEL_37:
  if (Width >= 1024.0)

}

@end

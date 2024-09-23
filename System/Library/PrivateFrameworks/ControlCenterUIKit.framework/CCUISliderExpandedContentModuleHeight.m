@implementation CCUISliderExpandedContentModuleHeight

void __CCUISliderExpandedContentModuleHeight_block_invoke()
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

  v13.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v13);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v0 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v0, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
LABEL_32:

      goto LABEL_33;
    }
  }
  v14.origin.x = CCUIReferenceScreenBounds();
  v5 = CGRectGetWidth(v14);
  if (v5 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v1 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v1, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v15.origin.x = CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v15);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
LABEL_28:

LABEL_29:
        if (v5 < 1024.0)
          goto LABEL_31;
        goto LABEL_30;
      }
    }
    v16.origin.x = CCUIReferenceScreenBounds();
    v7 = CGRectGetWidth(v16);
    if (v7 >= 834.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v3 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v3, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      v9 = 0x4075400000000000;
      if (objc_msgSend(v8, "userInterfaceIdiom") != 1)
      {
        v17.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v17) >= 430.0 || (v18.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v18) >= 428.0))
        {
          v9 = 0x4079000000000000;
        }
        else
        {
          v19.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v19) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
          {
            v9 = 0x4078600000000000;
          }
          else
          {
            v21.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v21) < 414.0)
            {
              v22.origin.x = CCUIReferenceScreenBounds();
              v9 = 0x4077200000000000;
              if (CGRectGetWidth(v22) < 393.0)
              {
                v23.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v23) < 390.0)
                {
                  v24.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v24) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
                  {
                    v9 = 0x4076800000000000;
                  }
                  else
                  {
                    v25.origin.x = CCUIReferenceScreenBounds();
                    v9 = qword_1D03216B0[CGRectGetWidth(v25) >= 375.0];
                  }
                }
              }
            }
          }
        }
      }
      CCUISliderExpandedContentModuleHeight_height = v9;

      if (v7 < 834.0)
      {
LABEL_27:
        if (v6 < 834.0)
          goto LABEL_29;
        goto LABEL_28;
      }
    }

    goto LABEL_27;
  }
  CCUISliderExpandedContentModuleHeight_height = 0x4075400000000000;
LABEL_30:

LABEL_31:
  if (Width >= 1024.0)
    goto LABEL_32;
LABEL_33:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
  {

  }
  else
  {
    v20.origin.x = CCUIReferenceScreenBounds();
    v10 = CGRectGetWidth(v20);

    if (v10 < 375.0)
    {
      v11 = *(double *)&CCUISliderExpandedContentModuleHeight_height;
      if (*(double *)&CCUISliderExpandedContentModuleHeight_height < 360.0)
        v11 = 360.0;
      CCUISliderExpandedContentModuleHeight_height = *(_QWORD *)&v11;
    }
  }
}

@end

@implementation CCUISliderExpandedContentModuleWidth

void __CCUISliderExpandedContentModuleWidth_block_invoke()
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
      CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
LABEL_38:

      goto LABEL_39;
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
        CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
LABEL_34:

LABEL_35:
        if (v5 < 1024.0)
          goto LABEL_37;
        goto LABEL_36;
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
      CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v8 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v8, "userInterfaceIdiom") == 1)
      {
        v9 = 0x405EC00000000000;
      }
      else
      {
        v17.origin.x = CCUIReferenceScreenBounds();
        v9 = 0x4062C00000000000;
        if (CGRectGetWidth(v17) < 430.0)
        {
          v18.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v18) < 428.0)
          {
            v19.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v19) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
            {
              v9 = 0x4062400000000000;
            }
            else
            {
              v20.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v20) >= 414.0)
              {
                v9 = 0x4060800000000000;
              }
              else
              {
                v21.origin.x = CCUIReferenceScreenBounds();
                v9 = 0x4061800000000000;
                if (CGRectGetWidth(v21) < 393.0)
                {
                  v22.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v22) < 390.0)
                  {
                    v23.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v23) >= 375.0 && SBFEffectiveHomeButtonType() == 2)
                    {
                      v9 = 0x4060E00000000000;
                    }
                    else
                    {
                      v25.origin.x = CCUIReferenceScreenBounds();
                      v9 = qword_1D03216A0[CGRectGetWidth(v25) >= 375.0];
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUISliderExpandedContentModuleWidth_width = v9;

      if (v7 < 834.0)
      {
LABEL_33:
        if (v6 < 834.0)
          goto LABEL_35;
        goto LABEL_34;
      }
    }

    goto LABEL_33;
  }
  CCUISliderExpandedContentModuleWidth_width = 0x405EC00000000000;
LABEL_36:

LABEL_37:
  if (Width >= 1024.0)
    goto LABEL_38;
LABEL_39:
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userInterfaceIdiom") || SBFEffectiveHomeButtonType() != 2)
  {

  }
  else
  {
    v24.origin.x = CCUIReferenceScreenBounds();
    v10 = CGRectGetWidth(v24);

    if (v10 < 375.0)
    {
      v11 = *(double *)&CCUISliderExpandedContentModuleWidth_width;
      if (*(double *)&CCUISliderExpandedContentModuleWidth_width < 135.0)
        v11 = 135.0;
      CCUISliderExpandedContentModuleWidth_width = *(_QWORD *)&v11;
    }
  }
}

@end

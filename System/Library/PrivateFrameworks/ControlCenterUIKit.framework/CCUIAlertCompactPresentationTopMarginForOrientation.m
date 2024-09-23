@implementation CCUIAlertCompactPresentationTopMarginForOrientation

void __CCUIAlertCompactPresentationTopMarginForOrientation_block_invoke()
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
  void *v9;
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

  v11.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v11);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v10 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v10, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
      v9 = v10;
LABEL_36:

      return;
    }
  }
  v12.origin.x = CCUIReferenceScreenBounds();
  v4 = CGRectGetWidth(v12);
  if (v4 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v13.origin.x = CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v13);
    if (v5 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
LABEL_32:

LABEL_33:
        if (v4 < 1024.0)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    v14.origin.x = CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v14);
    if (v6 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v2 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v2, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
        goto LABEL_30;
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    v8 = 24.0;
    if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
    {
      v15.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v15) >= 430.0)
        goto LABEL_25;
      v16.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v16) >= 428.0)
        goto LABEL_25;
      v17.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v17) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
        goto LABEL_25;
      v18.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v18) >= 414.0)
        goto LABEL_26;
      v19.origin.x = CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v19) >= 393.0
        || (v20.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v20) >= 390.0)
        || (v21.origin.x = CCUIReferenceScreenBounds(), CGRectGetWidth(v21) >= 375.0)
        && SBFEffectiveHomeButtonType() == 2)
      {
LABEL_25:
        v8 = 48.0;
      }
      else
      {
        v22.origin.x = CCUIReferenceScreenBounds();
        CGRectGetWidth(v22);
      }
    }
LABEL_26:
    CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = *(_QWORD *)&v8;

    if (v6 < 834.0)
    {
LABEL_31:
      if (v5 < 834.0)
        goto LABEL_33;
      goto LABEL_32;
    }
LABEL_30:

    goto LABEL_31;
  }
  CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForPortrait = 0x4038000000000000;
LABEL_34:

LABEL_35:
  v9 = v10;
  if (Width >= 1024.0)
    goto LABEL_36;
}

void __CCUIAlertCompactPresentationTopMarginForOrientation_block_invoke_2()
{
  void *v0;
  void *v1;
  void *v2;
  double Width;
  double v4;
  double v5;
  double v6;
  void *v7;
  id v8;
  CGRect v9;
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

  v9.origin.x = CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v9);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v8 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v8, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;

      return;
    }
  }
  v10.origin.x = CCUIReferenceScreenBounds();
  v4 = CGRectGetWidth(v10);
  if (v4 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v0 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v0, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    v11.origin.x = CCUIReferenceScreenBounds();
    v5 = CGRectGetWidth(v11);
    if (v5 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v1 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v1, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
LABEL_32:

LABEL_33:
        if (v4 < 1024.0)
          goto LABEL_35;
        goto LABEL_34;
      }
    }
    v12.origin.x = CCUIReferenceScreenBounds();
    v6 = CGRectGetWidth(v12);
    if (v6 >= 834.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v2 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v2, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v7, "userInterfaceIdiom") != 1)
      {
        v13.origin.x = CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v13) < 430.0)
        {
          v14.origin.x = CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v14) < 428.0)
          {
            v15.origin.x = CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v15) < 414.0 || SBFEffectiveHomeButtonType() != 2)
            {
              v16.origin.x = CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v16) < 414.0)
              {
                v17.origin.x = CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v17) < 393.0)
                {
                  v18.origin.x = CCUIReferenceScreenBounds();
                  if (CGRectGetWidth(v18) < 390.0)
                  {
                    v19.origin.x = CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v19) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      v20.origin.x = CCUIReferenceScreenBounds();
                      CGRectGetWidth(v20);
                    }
                  }
                }
              }
            }
          }
        }
      }
      CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;

      if (v6 < 834.0)
      {
LABEL_31:
        if (v5 < 834.0)
          goto LABEL_33;
        goto LABEL_32;
      }
    }

    goto LABEL_31;
  }
  CCUIAlertCompactPresentationTopMarginForOrientation_topMarginForLandscape = 0x4038000000000000;
LABEL_34:

LABEL_35:
  if (Width >= 1024.0)

}

@end

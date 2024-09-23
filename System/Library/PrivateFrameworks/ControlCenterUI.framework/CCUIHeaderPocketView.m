@implementation CCUIHeaderPocketView

- (void)sensorAttributionsChanged:(id)a3
{
  id v4;

  CCUIFixSpecialAttributions(a3);
  v4 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionCompactControl sensorAttributionsChanged:](self->_compactSensorAttributionControl, "sensorAttributionsChanged:", v4);
  -[CCUISensorAttributionExpandedViewController sensorAttributionsChanged:](self->_sensorAttributionExpandedViewController, "sensorAttributionsChanged:", v4);
  -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
  -[CCUIHeaderPocketView _preheatEntityIconsForAttributions:](self, "_preheatEntityIconsForAttributions:", v4);

}

- (void)_preheatEntityIconsForAttributions:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v3 = a3;
  +[CCUISensorEntityIconCache sharedInstance](CCUISensorEntityIconCache, "sharedInstance");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  CCUIUniqueSensorAttributionEntitiesForSensorActivityData(v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v11;
    do
    {
      v9 = 0;
      do
      {
        if (*(_QWORD *)v11 != v8)
          objc_enumerationMutation(v5);
        objc_msgSend(v4, "preheatImageForSensorEntity:", *(_QWORD *)(*((_QWORD *)&v10 + 1) + 8 * v9++));
      }
      while (v7 != v9);
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v7);
  }

}

- (CCUIStatusBar)statusBar
{
  return self->_statusBar;
}

- (void)setInterfaceOrientation:(int64_t)a3
{
  self->_interfaceOrientation = a3;
}

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  if (self->_edgeInsets.left != a3.left
    || self->_edgeInsets.top != a3.top
    || self->_edgeInsets.right != a3.right
    || self->_edgeInsets.bottom != a3.bottom)
  {
    self->_edgeInsets = a3;
    -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSensorAttributionEdgeInsets:(UIEdgeInsets)a3
{
  double right;
  double bottom;
  double left;
  double top;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  unint64_t v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;

  right = a3.right;
  bottom = a3.bottom;
  left = a3.left;
  top = a3.top;
  self->_sensorAttributionEdgeInsets = a3;
  CCUIEdgeInsetsRTLSwap();
  v9 = v8;
  CCUIEdgeInsetsRTLSwap();
  v11 = v10;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v12, "userInterfaceIdiom"))
  {

  }
  else
  {
    v13 = self->_interfaceOrientation - 3;

    if (v13 <= 1)
    {
      objc_msgSend(MEMORY[0x1E0DC3BF8], "mainScreen");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "_referenceBounds");
      v16 = v15;
      v18 = v17;

      v11 = (v18 - v16) * 0.5;
      top = 0.0;
      v9 = v11;
      left = v11;
      bottom = 0.0;
      right = v11;
    }
  }
  -[CCUIHeaderPocketView bounds](self, "bounds");
  -[CCUISensorAttributionCompactControl setMaximumAllowableWidth:](self->_compactSensorAttributionControl, "setMaximumAllowableWidth:", v19 - v9 - v11);
  -[CCUISensorAttributionExpandedViewController setEdgeInsets:](self->_sensorAttributionExpandedViewController, "setEdgeInsets:", top, left, bottom, right);
  -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
}

- (CGRect)compactModeFrameForSensorView
{
  double v3;
  CGFloat v4;
  double v5;
  double v6;
  double v7;
  CGFloat v8;
  double v9;
  void *v10;
  uint64_t v11;
  double v12;
  void *v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  double v26;
  CGRect v27;
  CGRect result;

  CCUIEdgeInsetsRTLSwap();
  CCUIEdgeInsetsRTLSwap();
  -[CCUISensorAttributionCompactControl fixedHeight](self->_compactSensorAttributionControl, "fixedHeight");
  v4 = v3;
  -[CCUIHeaderPocketView bounds](self, "bounds");
  -[CCUIHeaderPocketView bounds](self, "bounds");
  UIRectGetCenter();
  v6 = v5;
  -[CCUISensorAttributionCompactControl sizeThatFitsMaximumAllowableWidth](self->_compactSensorAttributionControl, "sizeThatFitsMaximumAllowableWidth");
  v8 = v7;
  v9 = v6 + v7 * -0.5;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v11 = objc_msgSend(v10, "userInterfaceIdiom");

  if (v11 == 1)
  {
    v27.origin.y = 0.0;
    v27.origin.x = v9;
    v27.size.width = v8;
    v27.size.height = v4;
    v12 = CGRectGetHeight(v27) * -0.5;
  }
  -[CCUIHeaderPocketView traitCollection](self, "traitCollection", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "displayScale");
  UIRectIntegralWithScale();
  v15 = v14;
  v17 = v16;
  v19 = v18;
  v21 = v20;

  -[CCUIHeaderPocketView yOriginForCompactControlForFrame:](self, "yOriginForCompactControlForFrame:", v15, v17, v19, v21);
  v23 = v22;
  v24 = v15;
  v25 = v19;
  v26 = v21;
  result.size.height = v26;
  result.size.width = v25;
  result.origin.y = v23;
  result.origin.x = v24;
  return result;
}

- (double)yOriginForCompactControlForFrame:(CGRect)a3
{
  void *v3;
  void *v4;
  void *v5;
  double Height;
  double v8;
  CGFloat v9;
  double v10;
  CGFloat v11;
  double v12;
  CGFloat v13;
  double v14;
  CGFloat v15;
  void *v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  double v22;
  void *v23;
  void *v24;
  void *v25;
  double Width;
  double v27;
  double v28;
  void *v29;
  double v30;
  void *v31;
  void *v32;
  uint64_t v33;
  void *v34;
  uint64_t v35;
  void *v36;
  double v37;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  CGRect v49;
  CGRect v50;
  CGRect v51;
  CGRect v52;
  CGRect v53;
  CGRect v54;
  CGRect v55;
  CGRect v56;
  CGRect v57;
  CGRect v58;
  CGRect v59;
  CGRect v60;
  CGRect v61;
  CGRect v62;
  CGRect v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect v70;
  CGRect v71;
  CGRect v72;
  CGRect v73;
  CGRect v74;
  CGRect v75;
  CGRect v76;
  CGRect v77;
  CGRect v78;
  CGRect v79;
  CGRect v80;
  CGRect v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  Height = CGRectGetHeight(a3);
  -[CCUIHeaderPocketView contentBounds](self, "contentBounds");
  v9 = v8;
  v11 = v10;
  v13 = v12;
  v15 = v14;
  -[CCUIStatusBar sizeThatFits:](self->_statusBar, "sizeThatFits:", v12, v14);
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v16, "userInterfaceIdiom") && (unint64_t)(self->_interfaceOrientation - 3) <= 1)
  {
    CCUILandscapeGridLayoutTopMargin();
    CCUIStatusBarBaselineHeight();
  }

  v49.origin.x = v9;
  v49.origin.y = v11;
  v49.size.width = v13;
  v49.size.height = v15;
  CGRectGetMinX(v49);
  v50.origin.x = v9;
  v50.origin.y = v11;
  v50.size.width = v13;
  v50.size.height = v15;
  CGRectGetMaxY(v50);
  if ((self->_mode | 2) != 3)
  {
    v22 = Height * 0.5;
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    v24 = (void *)objc_msgSend(v23, "userInterfaceIdiom");

    if (v24 == (void *)1)
    {
      v17 = -v22;
      goto LABEL_99;
    }
    v25 = (void *)(self->_interfaceOrientation - 3);
    CCUIReferenceScreenBounds();
    Width = CGRectGetWidth(v63);
    if ((unint64_t)v25 <= 1)
    {
      if (Width >= 1024.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 1024.0);
        v25 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v25, "userInterfaceIdiom") == 1)
        {
          v27 = 0.0;
          if (SBFEffectiveHomeButtonType() != 2)
            goto LABEL_97;
        }
      }
      CCUIReferenceScreenBounds();
      v28 = CGRectGetWidth(v64);
      if (v28 >= 1024.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v24 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v24, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
        {

          v27 = 0.0;
          goto LABEL_96;
        }
      }
      v47 = v28;
      CCUIReferenceScreenBounds();
      v45 = CGRectGetWidth(v76);
      if (v45 >= 834.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v4 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
        {
          v27 = 0.0;
          if (SBFEffectiveHomeButtonType() == 2)
          {
LABEL_113:

LABEL_114:
            if (v47 >= 1024.0)

            if (Width < 1024.0)
              goto LABEL_98;
            goto LABEL_97;
          }
        }
      }
      CCUIReferenceScreenBounds();
      v30 = CGRectGetWidth(v77);
      if (v30 >= 834.0)
      {
        objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
        v5 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v5, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
        {

          v27 = 0.0;
          goto LABEL_112;
        }
      }
      v42 = v30;
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v31 = (void *)objc_claimAutoreleasedReturnValue();
      v27 = 0.0;
      if (objc_msgSend(v31, "userInterfaceIdiom") == 1)
        goto LABEL_110;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v78) >= 430.0)
      {
        *(double *)&v39 = 38.0;
      }
      else
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v79) < 428.0)
        {
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v80) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
          {
LABEL_108:
            *(double *)&v39 = 34.0;
            goto LABEL_109;
          }
          CCUIReferenceScreenBounds();
          if (CGRectGetWidth(v81) < 414.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v82) < 393.0)
            {
              CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v83) >= 390.0)
              {
                v27 = 20.5;
              }
              else
              {
                CCUIReferenceScreenBounds();
                if (CGRectGetWidth(v84) < 375.0 || (v27 = 30.0, SBFEffectiveHomeButtonType() != 2))
                {
                  CCUIReferenceScreenBounds();
                  CGRectGetWidth(v85);
                  v27 = 8.0;
                }
              }
              goto LABEL_110;
            }
            goto LABEL_108;
          }
          v27 = 23.5;
LABEL_110:

          if (v42 >= 834.0)
LABEL_112:
          if (v45 < 834.0)
            goto LABEL_114;
          goto LABEL_113;
        }
        *(double *)&v39 = 36.0;
      }
LABEL_109:
      v27 = *(double *)&v39;
      goto LABEL_110;
    }
    if (Width >= 1024.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", 1024.0);
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v25, "userInterfaceIdiom") == 1)
      {
        v27 = 30.0;
        if (SBFEffectiveHomeButtonType() != 2)
          goto LABEL_97;
      }
    }
    CCUIReferenceScreenBounds();
    v46 = CGRectGetWidth(v65);
    if (v46 >= 1024.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v24, "userInterfaceIdiom") == 1)
      {
        v27 = 30.0;
        if (SBFEffectiveHomeButtonType() == 2)
        {
LABEL_95:

LABEL_96:
          if (Width < 1024.0)
          {
LABEL_98:
            v17 = v27 - v22;
            goto LABEL_99;
          }
LABEL_97:

          goto LABEL_98;
        }
      }
    }
    CCUIReferenceScreenBounds();
    v44 = CGRectGetWidth(v66);
    if (v44 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
      {
        v27 = 30.0;
        if (SBFEffectiveHomeButtonType() == 2)
        {
LABEL_93:

LABEL_94:
          if (v46 < 1024.0)
            goto LABEL_96;
          goto LABEL_95;
        }
      }
    }
    CCUIReferenceScreenBounds();
    v41 = CGRectGetWidth(v67);
    if (v41 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
      {
        v27 = 30.0;
        if (SBFEffectiveHomeButtonType() != 2)
        {
LABEL_91:

LABEL_92:
          if (v44 < 834.0)
            goto LABEL_94;
          goto LABEL_93;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v29 = (void *)objc_claimAutoreleasedReturnValue();
    v27 = 30.0;
    if (objc_msgSend(v29, "userInterfaceIdiom") == 1)
      goto LABEL_89;
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v68) >= 430.0)
      goto LABEL_88;
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v69) >= 428.0)
      goto LABEL_89;
    CCUIReferenceScreenBounds();
    v40 = 0x4079E00000000000;
    if (CGRectGetWidth(v70) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
      goto LABEL_89;
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v71) >= 414.0)
      goto LABEL_89;
    CCUIReferenceScreenBounds();
    if (CGRectGetWidth(v72) >= 393.0)
    {
LABEL_88:
      v27 = 46.0;
    }
    else
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v73) < 390.0)
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v74) < 375.0 || SBFEffectiveHomeButtonType() != 2)
        {
          CCUIReferenceScreenBounds();
          CGRectGetWidth(v75);

          v27 = 12.0;
          goto LABEL_90;
        }
      }
    }
LABEL_89:

LABEL_90:
    if (v41 < 834.0)
      goto LABEL_92;
    goto LABEL_91;
  }
  v17 = 12.0;
  if ((unint64_t)(self->_interfaceOrientation - 3) < 2)
    goto LABEL_99;
  CCUIReferenceScreenBounds();
  v18 = CGRectGetWidth(v51);
  if (v18 >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend(v16, "userInterfaceIdiom") == 1)
    {
      v17 = 30.0;
      if (SBFEffectiveHomeButtonType() != 2)
        goto LABEL_87;
    }
  }
  CCUIReferenceScreenBounds();
  v48 = CGRectGetWidth(v52);
  if (v48 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "userInterfaceIdiom") != 1)
    || (v17 = 30.0, SBFEffectiveHomeButtonType() != 2))
  {
    v43 = v18;
    CCUIReferenceScreenBounds();
    v19 = CGRectGetWidth(v53);
    if (v19 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "userInterfaceIdiom") == 1)
      {
        v17 = 30.0;
        if (SBFEffectiveHomeButtonType() == 2)
        {
LABEL_83:

LABEL_84:
          v18 = v43;
          if (v48 < 1024.0)
            goto LABEL_86;
          goto LABEL_85;
        }
      }
    }
    CCUIReferenceScreenBounds();
    v20 = CGRectGetWidth(v54);
    if (v20 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v5 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v5, "userInterfaceIdiom") == 1)
      {
        v17 = 30.0;
        if (SBFEffectiveHomeButtonType() != 2)
        {
LABEL_81:

LABEL_82:
          if (v19 < 834.0)
            goto LABEL_84;
          goto LABEL_83;
        }
      }
    }
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    v17 = 30.0;
    if (objc_msgSend(v21, "userInterfaceIdiom") != 1)
    {
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v55) >= 430.0)
        goto LABEL_79;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v56) >= 428.0)
        goto LABEL_80;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v57) >= 414.0 && SBFEffectiveHomeButtonType() == 2)
        goto LABEL_80;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v58) >= 414.0)
        goto LABEL_80;
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v59) >= 393.0)
      {
LABEL_79:
        v17 = 46.0;
        goto LABEL_80;
      }
      CCUIReferenceScreenBounds();
      if (CGRectGetWidth(v60) < 390.0)
      {
        CCUIReferenceScreenBounds();
        if (CGRectGetWidth(v61) < 375.0 || SBFEffectiveHomeButtonType() != 2)
        {
          CCUIReferenceScreenBounds();
          CGRectGetWidth(v62);
          v17 = 12.0;
        }
      }
    }
LABEL_80:

    if (v20 < 834.0)
      goto LABEL_82;
    goto LABEL_81;
  }
LABEL_85:

LABEL_86:
  if (v18 >= 1024.0)
LABEL_87:

LABEL_99:
  UIRectGetCenter();
  -[CCUIStatusBar verticalSecondaryServiceDelta](self->_statusBar, "verticalSecondaryServiceDelta");
  UIRectCenteredXInRect();
  if (SBFEffectiveHomeButtonType() == 2
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v32 = (void *)objc_claimAutoreleasedReturnValue(),
        v33 = objc_msgSend(v32, "userInterfaceIdiom"),
        v32,
        v33))
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice", v40);
    v34 = (void *)objc_claimAutoreleasedReturnValue();
    v35 = objc_msgSend(v34, "userInterfaceIdiom");

    if (v35 == 1)
    {
      -[CCUIHeaderPocketView editButton](self, "editButton");
      v36 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v36, "frame");
      v17 = CGRectGetMaxY(v86) + 14.0;

    }
    else
    {
      UIRectCenteredAboutPoint();
      v17 = v37;
    }
  }
  return v17 + self->_verticalContentTranslation;
}

- (double)additionalHeightForOrientation:(int64_t)a3
{
  void *v3;
  void *v4;
  void *v5;
  void *v8;
  uint64_t v9;
  double v10;
  double Width;
  double v12;
  double v13;
  double v14;
  void *v15;
  double v16;
  double v17;
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
  CGRect v29;
  CGRect v30;

  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  v9 = objc_msgSend(v8, "userInterfaceIdiom");
  if ((unint64_t)(a3 - 1) >= 2)
  {
    v10 = 0.0;
    if (v9 != 1)
      goto LABEL_42;
  }
  CCUIReferenceScreenBounds();
  Width = CGRectGetWidth(v19);
  if (Width >= 1024.0)
  {
    objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
    a3 = objc_claimAutoreleasedReturnValue();
    if (objc_msgSend((id)a3, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() != 2)
    {
      v10 = 44.0;
LABEL_41:

      goto LABEL_42;
    }
  }
  CCUIReferenceScreenBounds();
  v12 = CGRectGetWidth(v20);
  if (v12 < 1024.0
    || (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
        v3 = (void *)objc_claimAutoreleasedReturnValue(),
        objc_msgSend(v3, "userInterfaceIdiom") != 1)
    || SBFEffectiveHomeButtonType() != 2)
  {
    CCUIReferenceScreenBounds();
    v13 = CGRectGetWidth(v21);
    if (v13 >= 834.0)
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v4 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v4, "userInterfaceIdiom") == 1 && SBFEffectiveHomeButtonType() == 2)
      {
        v10 = 44.0;
LABEL_37:

LABEL_38:
        if (v12 < 1024.0)
          goto LABEL_40;
        goto LABEL_39;
      }
    }
    CCUIReferenceScreenBounds();
    v14 = CGRectGetWidth(v22);
    if (v14 >= 834.0
      && (objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice"),
          v5 = (void *)objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v5, "userInterfaceIdiom") == 1)
      && SBFEffectiveHomeButtonType() != 2)
    {
      v10 = 44.0;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      if (objc_msgSend(v15, "userInterfaceIdiom") == 1)
      {
        v10 = 44.0;
      }
      else
      {
        CCUIReferenceScreenBounds();
        v10 = 20.0;
        if (CGRectGetWidth(v23) < 430.0)
        {
          CCUIReferenceScreenBounds();
          v10 = 0.0;
          if (CGRectGetWidth(v24) < 428.0)
          {
            CCUIReferenceScreenBounds();
            if (CGRectGetWidth(v25) < 414.0 || (v10 = -10.0, SBFEffectiveHomeButtonType() != 2))
            {
              CCUIReferenceScreenBounds();
              if (CGRectGetWidth(v26) >= 414.0)
              {
                v10 = 49.5;
              }
              else
              {
                CCUIReferenceScreenBounds();
                v10 = 16.0;
                if (CGRectGetWidth(v27) < 393.0)
                {
                  CCUIReferenceScreenBounds();
                  v10 = 30.0;
                  if (CGRectGetWidth(v28) < 390.0)
                  {
                    CCUIReferenceScreenBounds();
                    if (CGRectGetWidth(v29) < 375.0 || SBFEffectiveHomeButtonType() != 2)
                    {
                      CCUIReferenceScreenBounds();
                      if (CGRectGetWidth(v30) < 375.0)
                        v10 = 40.0;
                      else
                        v10 = 30.0;
                    }
                  }
                }
              }
            }
          }
        }
      }

      if (v14 < 834.0)
      {
LABEL_36:
        if (v13 < 834.0)
          goto LABEL_38;
        goto LABEL_37;
      }
    }

    goto LABEL_36;
  }
  v10 = 44.0;
LABEL_39:

LABEL_40:
  if (Width >= 1024.0)
    goto LABEL_41;
LABEL_42:

  if (-[CCUIHeaderPocketView isDisplayingSensorStatus](self, "isDisplayingSensorStatus")
    || (v16 = 0.0, SBFEffectiveHomeButtonType() != 2))
  {
    v16 = v10;
  }
  -[CCUIStatusBar verticalSecondaryServiceDelta](self->_statusBar, "verticalSecondaryServiceDelta");
  return v16 + v17;
}

- (BOOL)isDisplayingSensorStatus
{
  return -[CCUISensorAttributionCompactControl isDisplayingSensorStatus](self->_compactSensorAttributionControl, "isDisplayingSensorStatus");
}

- (void)layoutSubviews
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  void *v19;
  uint64_t v20;
  uint64_t v21;
  uint64_t v22;
  uint64_t i;
  SBUIChevronView *headerChevronView;
  double v25;
  double v26;
  void *v27;
  _BOOL8 v28;
  double v29;
  double v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double MinX;
  double v36;
  CCUIStatusBar *statusBar;
  UIView *statusLabelView;
  double v39;
  CGFloat v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  void *v46;
  void *v47;
  double v48;
  double v49;
  void *v50;
  CGFloat x;
  uint64_t v52;
  double v53;
  double v54;
  double v55;
  double v56;
  void *v57;
  uint64_t v58;
  double v59;
  double v60;
  double v61;
  double v62;
  int v63;
  double v64;
  CCUISensorAttributionCompactControl *compactSensorAttributionControl;
  CCUISensorAttributionCompactControl *v66;
  CGFloat rect;
  __int128 v68;
  __int128 v69;
  __int128 v70;
  CGRect v71;
  __int128 v72;
  __int128 v73;
  __int128 v74;
  __int128 v75;
  __int128 v76;
  __int128 v77;
  __int128 v78;
  objc_super v79;
  _BYTE v80[128];
  uint64_t v81;
  CGRect v82;
  CGRect v83;
  CGRect v84;
  CGRect v85;
  CGRect v86;

  v81 = *MEMORY[0x1E0C80C00];
  v79.receiver = self;
  v79.super_class = (Class)CCUIHeaderPocketView;
  -[CCUIHeaderPocketView layoutSubviews](&v79, sel_layoutSubviews);
  -[CCUIHeaderPocketView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CCUIHeaderPocketView contentBounds](self, "contentBounds");
  v12 = v11;
  v14 = v13;
  v16 = v15;
  v18 = v17;
  v75 = 0u;
  v76 = 0u;
  v77 = 0u;
  v78 = 0u;
  -[CCUIHeaderPocketView subviews](self, "subviews");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  v20 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
  if (v20)
  {
    v21 = v20;
    v22 = *(_QWORD *)v76;
    do
    {
      for (i = 0; i != v21; ++i)
      {
        if (*(_QWORD *)v76 != v22)
          objc_enumerationMutation(v19);
        objc_msgSend(*(id *)(*((_QWORD *)&v75 + 1) + 8 * i), "setFrame:", v12, v14, v16, v18);
      }
      v21 = objc_msgSend(v19, "countByEnumeratingWithState:objects:count:", &v75, v80, 16);
    }
    while (v21);
  }

  -[UIView setFrame:](self->_headerBackgroundView, "setFrame:", v4, v6, v8, v10);
  -[SBUIChevronView sizeToFit](self->_headerChevronView, "sizeToFit");
  headerChevronView = self->_headerChevronView;
  if (self->_mode == 1)
  {
    UIRectGetCenter();
  }
  else
  {
    v25 = v12 + v16 * 0.5;
    v26 = 30.0;
  }
  -[SBUIChevronView setCenter:](headerChevronView, "setCenter:", v25, v26);
  -[SBUIChevronView setHidden:](self->_headerChevronView, "setHidden:", -[CCUIHeaderPocketView isDisplayingSensorStatus](self, "isDisplayingSensorStatus"));
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  v71.size.width = v8;
  v71.size.height = v10;
  v71.origin.y = v6;
  if (objc_msgSend(v27, "userInterfaceIdiom"))
    v28 = 0;
  else
    v28 = (unint64_t)(self->_interfaceOrientation - 3) < 2;
  v71.origin.x = v4;

  -[CCUIStatusBar sizeThatFits:](self->_statusBar, "sizeThatFits:", v16, v18);
  v30 = v29;
  v32 = v31;
  v33 = 0.0;
  if (v28)
  {
    v34 = CCUILandscapeGridLayoutTopMargin();
    v33 = v34 - CCUIStatusBarBaselineHeight();
  }
  v82.origin.x = v12;
  v82.origin.y = v14;
  v82.size.width = v16;
  v82.size.height = v18;
  MinX = CGRectGetMinX(v82);
  v83.origin.x = v12;
  v83.origin.y = v14;
  v83.size.width = v16;
  v83.size.height = v18;
  v36 = CGRectGetMaxY(v83) - v32 - v33;
  statusBar = self->_statusBar;
  v69 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v70 = *MEMORY[0x1E0C9BAA8];
  v72 = *MEMORY[0x1E0C9BAA8];
  v73 = v69;
  v68 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v74 = v68;
  -[CCUIStatusBar setTransform:](statusBar, "setTransform:", &v72);
  -[CCUIStatusBar setFrame:](self->_statusBar, "setFrame:", MinX, v36, v30, v32);
  -[CCUIStatusBar controlCenterApplyPrimaryContentShadow](self->_statusBar, "controlCenterApplyPrimaryContentShadow");
  statusLabelView = self->_statusLabelView;
  if (statusLabelView)
  {
    -[UIView frame](statusLabelView, "frame");
    v40 = v39;
    v42 = v41;
    v44 = v43;
    rect = v45;
    CGRectGetMaxY(v71);
    v84.origin.x = MinX;
    v84.origin.y = v36;
    v84.size.width = v30;
    v84.size.height = v32;
    CGRectGetMidY(v84);
    v85.origin.x = v40;
    v85.origin.y = v42;
    v85.size.width = v44;
    v85.size.height = rect;
    CGRectGetHeight(v85);
    UIRectCenteredYInRect();
    -[UIView setFrame:](self->_statusLabelView, "setFrame:");
  }
  -[CCUIHeaderPocketView editButton](self, "editButton");
  v46 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIHeaderPocketView powerButton](self, "powerButton");
  v47 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIHeaderPocketView _topButtonSymbolPointSize](self, "_topButtonSymbolPointSize");
  v49 = v48;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v50, "userInterfaceIdiom"))
  {

    x = v71.origin.x;
  }
  else
  {
    v52 = SBFEffectiveHomeButtonType();

    x = v71.origin.x;
    if (v52 != 2)
    {
      v61 = CCUILayoutEdgeInsetsForInterfaceOrientation(1) + -7.0;
      v60 = CGRectGetMaxX(v71) + -5.0;
      v59 = 5.0;
      goto LABEL_27;
    }
  }
  CCUIEdgeInsetsRTLSwap();
  v54 = v53 + -7.0;
  CCUIEdgeInsetsRTLSwap();
  v56 = v55 + -7.0;
  objc_msgSend(MEMORY[0x1E0DC3708], "currentDevice");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  v58 = objc_msgSend(v57, "userInterfaceIdiom");

  if (v58 == 1)
    v59 = v54 + 6.0;
  else
    v59 = v54;
  if (v58 == 1)
    v56 = v56 + 10.0;
  v86.origin.x = x;
  v86.origin.y = v71.origin.y;
  v86.size.width = v71.size.width;
  v86.size.height = v71.size.height;
  v60 = CGRectGetMaxX(v86) - v56;
  v61 = 23.0;
LABEL_27:
  v62 = v60 - (v49 + 14.0);
  v63 = -[CCUIHeaderPocketView _shouldReverseLayoutDirection](self, "_shouldReverseLayoutDirection");
  if (v63)
    v64 = v62;
  else
    v64 = v59;
  if (!v63)
    v59 = v62;
  objc_msgSend(v46, "setFrame:", v64, v61, v49 + 14.0, v49 + 14.0);
  objc_msgSend(v47, "setFrame:", v59, v61, v49 + 14.0, v49 + 14.0);
  objc_msgSend(v46, "setHidden:", v28);
  objc_msgSend(v47, "setHidden:", v28);
  compactSensorAttributionControl = self->_compactSensorAttributionControl;
  v72 = v70;
  v73 = v69;
  v74 = v68;
  -[CCUISensorAttributionCompactControl setTransform:](compactSensorAttributionControl, "setTransform:", &v72);
  v66 = self->_compactSensorAttributionControl;
  -[CCUIHeaderPocketView compactModeFrameForSensorView](self, "compactModeFrameForSensorView");
  -[CCUISensorAttributionCompactControl setFrame:](v66, "setFrame:");
  -[CCUIHeaderPocketView _updateContentTransform](self, "_updateContentTransform");

}

- (CGRect)contentBounds
{
  double v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  CGRect result;

  -[CCUIHeaderPocketView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CCUIHeaderPocketView edgeInsets](self, "edgeInsets");
  v12 = v6 + v11;
  v15 = v8 - (v13 + v14);
  v17 = v10 - (v11 + v16);
  v18 = v4 + v13;
  v19 = v12;
  v20 = v15;
  result.size.height = v17;
  result.size.width = v20;
  result.origin.y = v19;
  result.origin.x = v18;
  return result;
}

- (UIEdgeInsets)edgeInsets
{
  double top;
  double left;
  double bottom;
  double right;
  UIEdgeInsets result;

  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  bottom = self->_edgeInsets.bottom;
  right = self->_edgeInsets.right;
  result.right = right;
  result.bottom = bottom;
  result.left = left;
  result.top = top;
  return result;
}

- (void)_updateContentTransform
{
  SBUIChevronView *headerChevronView;
  __int128 v4;
  CCUIStatusBar *statusBar;
  __int128 v6;
  CCUISensorAttributionCompactControl *compactSensorAttributionControl;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;

  headerChevronView = self->_headerChevronView;
  v4 = *(_OWORD *)&self->_contentTransform.c;
  v9 = *(_OWORD *)&self->_contentTransform.a;
  v10 = v4;
  v11 = *(_OWORD *)&self->_contentTransform.tx;
  -[SBUIChevronView setTransform:](headerChevronView, "setTransform:", &v9);
  statusBar = self->_statusBar;
  v6 = *(_OWORD *)&self->_contentTransform.c;
  v9 = *(_OWORD *)&self->_contentTransform.a;
  v10 = v6;
  v11 = *(_OWORD *)&self->_contentTransform.tx;
  -[CCUIStatusBar setTransform:](statusBar, "setTransform:", &v9);
  compactSensorAttributionControl = self->_compactSensorAttributionControl;
  v8 = *(_OWORD *)&self->_contentTransform.c;
  v9 = *(_OWORD *)&self->_contentTransform.a;
  v10 = v8;
  v11 = *(_OWORD *)&self->_contentTransform.tx;
  -[CCUISensorAttributionCompactControl setTransform:](compactSensorAttributionControl, "setTransform:", &v9);
  -[UIView frame](self->_sensorAttributionExpandedWrapperView, "frame");
  -[UIView setFrame:](self->_sensorAttributionExpandedWrapperView, "setFrame:");
}

- (CCUIHeaderPocketView)initWithFrame:(CGRect)a3 moduleInstanceManager:(id)a4
{
  double height;
  double width;
  double y;
  double x;
  id v9;
  CCUIHeaderPocketView *v10;
  CCUIHeaderPocketView *v11;
  id v12;
  dispatch_group_t v13;
  OS_dispatch_group *expandedViewControllerCloseDispatchGroup;
  CCUISensorAttributionCompactControl *v15;
  uint64_t v16;
  CCUISensorAttributionCompactControl *compactSensorAttributionControl;
  objc_super v19;

  height = a3.size.height;
  width = a3.size.width;
  y = a3.origin.y;
  x = a3.origin.x;
  v9 = a4;
  v19.receiver = self;
  v19.super_class = (Class)CCUIHeaderPocketView;
  v10 = -[CCUIHeaderPocketView initWithFrame:](&v19, sel_initWithFrame_, x, y, width, height);
  v11 = v10;
  if (v10)
  {
    objc_storeWeak((id *)&v10->_moduleInstanceManager, v9);
    v12 = -[CCUIHeaderPocketView _newDefaultBackgroundView](v11, "_newDefaultBackgroundView");
    -[CCUIHeaderPocketView _setHeaderBackgroundView:](v11, "_setHeaderBackgroundView:", v12);

    v13 = dispatch_group_create();
    expandedViewControllerCloseDispatchGroup = v11->_expandedViewControllerCloseDispatchGroup;
    v11->_expandedViewControllerCloseDispatchGroup = (OS_dispatch_group *)v13;

    v15 = [CCUISensorAttributionCompactControl alloc];
    v16 = -[CCUISensorAttributionCompactControl initWithFrame:](v15, "initWithFrame:", *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
    compactSensorAttributionControl = v11->_compactSensorAttributionControl;
    v11->_compactSensorAttributionControl = (CCUISensorAttributionCompactControl *)v16;

    -[CCUISensorAttributionCompactControl setDelegate:](v11->_compactSensorAttributionControl, "setDelegate:", v11);
    -[CCUIHeaderPocketView addSubview:](v11, "addSubview:", v11->_compactSensorAttributionControl);
    -[CCUIHeaderPocketView setChevronAlpha:](v11, "setChevronAlpha:", 1.0);
    -[CCUIHeaderPocketView setStatusBarAlpha:](v11, "setStatusBarAlpha:", 1.0);
    -[CCUIHeaderPocketView setSensorStatusViewAlpha:](v11, "setSensorStatusViewAlpha:", 1.0);
    -[CCUIHeaderPocketView setContentAlphaMultiplier:](v11, "setContentAlphaMultiplier:", 1.0);
    -[CCUIHeaderPocketView setAdditionalContentAlphaMultiplier:](v11, "setAdditionalContentAlphaMultiplier:", 1.0);
    -[CCUIHeaderPocketView _configureTopButtons](v11, "_configureTopButtons");
  }

  return v11;
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  CGFloat y;
  CGFloat x;
  void *v7;
  CCUISensorAttributionCompactControl *v8;
  objc_super v10;
  CGPoint v11;
  CGRect v12;
  CGRect v13;

  y = a3.y;
  x = a3.x;
  v10.receiver = self;
  v10.super_class = (Class)CCUIHeaderPocketView;
  -[CCUIHeaderPocketView hitTest:withEvent:](&v10, sel_hitTest_withEvent_, a4);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CCUISensorAttributionCompactControl activeIndicatorsCount](self->_compactSensorAttributionControl, "activeIndicatorsCount") >= 1)
  {
    -[CCUISensorAttributionCompactControl frame](self->_compactSensorAttributionControl, "frame");
    v13 = CGRectInset(v12, -20.0, -20.0);
    v11.x = x;
    v11.y = y;
    if (CGRectContainsPoint(v13, v11))
    {
      v8 = self->_compactSensorAttributionControl;

      v7 = v8;
    }
  }
  return v7;
}

- (void)handleCompactControlTouchBeganEvent
{
  void *v3;
  CCUISensorAttributionExpandedViewController *sensorAttributionExpandedViewController;
  void *v5;

  -[UIView superview](self->_sensorAttributionExpandedWrapperView, "superview");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "bringSubviewToFront:", self->_sensorAttributionExpandedWrapperView);

  -[CCUISensorAttributionExpandedViewController setDelegate:](self->_sensorAttributionExpandedViewController, "setDelegate:", self);
  sensorAttributionExpandedViewController = self->_sensorAttributionExpandedViewController;
  -[CCUISensorAttributionCompactControl clone](self->_compactSensorAttributionControl, "clone");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUISensorAttributionExpandedViewController prepareForInteractionWithClonedCompactControl:](sensorAttributionExpandedViewController, "prepareForInteractionWithClonedCompactControl:", v5);

  if (!UIAccessibilityIsReduceMotionEnabled())
    -[CCUISensorAttributionCompactControl setHidden:](self->_compactSensorAttributionControl, "setHidden:", 1);
}

- (void)handleCompactControlExpansionEvent
{
  -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self->_sensorAttributionExpandedViewController, "setExpanded:animated:", 1, 1);
}

- (void)handleCompactControlCompactionEvent
{
  -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self->_sensorAttributionExpandedViewController, "setExpanded:animated:", 0, 1);
}

- (id)bundleIdentifierUsingAudioVideoControlsForSensorAttributionCompactControl:(id)a3
{
  return self->_bundleIdentifierUsingAudioVideoControls;
}

- (BOOL)hitTestedViewWantsToBlockGestures:(id)a3
{
  return self->_compactSensorAttributionControl == a3 || self->_powerButton == a3;
}

- (void)addSensorAttributionViewControllerAsChildOfViewController:(id)a3
{
  objc_class *v4;
  id v5;
  id v6;
  void *v7;
  UIView *v8;
  UIView *sensorAttributionExpandedWrapperView;
  CCUISensorAttributionExpandedViewController *v10;
  CCUISensorAttributionExpandedViewController *sensorAttributionExpandedViewController;
  void *v12;
  void *v13;
  void *v14;
  UIView *v15;
  void *v16;
  id v17;

  v4 = (objc_class *)MEMORY[0x1E0DC3F10];
  v5 = a3;
  v6 = [v4 alloc];
  objc_msgSend(v5, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "bounds");
  v8 = (UIView *)objc_msgSend(v6, "initWithFrame:");
  sensorAttributionExpandedWrapperView = self->_sensorAttributionExpandedWrapperView;
  self->_sensorAttributionExpandedWrapperView = v8;

  -[UIView setAutoresizingMask:](self->_sensorAttributionExpandedWrapperView, "setAutoresizingMask:", 18);
  -[CCUIHeaderPocketView addSubview:](self, "addSubview:", self->_sensorAttributionExpandedWrapperView);
  -[CCUIHeaderPocketView moduleInstanceManager](self, "moduleInstanceManager");
  v17 = (id)objc_claimAutoreleasedReturnValue();
  v10 = -[CCUISensorAttributionExpandedViewController initWithModuleInstanceManager:]([CCUISensorAttributionExpandedViewController alloc], "initWithModuleInstanceManager:", v17);
  sensorAttributionExpandedViewController = self->_sensorAttributionExpandedViewController;
  self->_sensorAttributionExpandedViewController = v10;

  objc_msgSend(v5, "addChildViewController:", self->_sensorAttributionExpandedViewController);
  -[CCUISensorAttributionExpandedViewController view](self->_sensorAttributionExpandedViewController, "view");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView bounds](self->_sensorAttributionExpandedWrapperView, "bounds");
  objc_msgSend(v12, "setFrame:");

  objc_msgSend(v5, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v13, "addSubview:", self->_sensorAttributionExpandedWrapperView);

  -[CCUISensorAttributionExpandedViewController view](self->_sensorAttributionExpandedViewController, "view");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "setAutoresizingMask:", 18);

  v15 = self->_sensorAttributionExpandedWrapperView;
  -[CCUISensorAttributionExpandedViewController view](self->_sensorAttributionExpandedViewController, "view");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIView addSubview:](v15, "addSubview:", v16);

  -[CCUISensorAttributionExpandedViewController didMoveToParentViewController:](self->_sensorAttributionExpandedViewController, "didMoveToParentViewController:", v5);
  -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self->_sensorAttributionExpandedViewController, "setExpanded:animated:", 0, 0);
  -[UIView setHidden:](self->_sensorAttributionExpandedWrapperView, "setHidden:", 1);

}

- (CCUISensorActivityData)audioVideoModeSelectionAttribution
{
  return -[CCUISensorAttributionExpandedViewController audioVideoModeSelectionAttribution](self->_sensorAttributionExpandedViewController, "audioVideoModeSelectionAttribution");
}

- (void)setAudioVideoModeSelectionAttribution:(id)a3
{
  -[CCUISensorAttributionExpandedViewController setAudioVideoModeSelectionAttribution:](self->_sensorAttributionExpandedViewController, "setAudioVideoModeSelectionAttribution:", a3);
}

- (void)gameModeStateDidChange:(unint64_t)a3
{
  -[CCUISensorAttributionCompactControl gameModeStateDidChange:](self->_compactSensorAttributionControl, "gameModeStateDidChange:");
  -[CCUISensorAttributionExpandedViewController gameModeStateDidChange:](self->_sensorAttributionExpandedViewController, "gameModeStateDidChange:", a3);
  -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
}

- (void)inactiveMicModeSelectionAttributionChanged:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  id v8;

  v4 = a3;
  if (v4)
  {
    v5 = v4;
    objc_msgSend(MEMORY[0x1E0C99E60], "setWithObject:", v4);
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    CCUIFixSpecialAttributions(v6);
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v7, "anyObject");
    v8 = (id)objc_claimAutoreleasedReturnValue();

  }
  else
  {
    v8 = 0;
  }
  -[CCUISensorAttributionCompactControl inactiveMicModeSelectionAttributionChanged:](self->_compactSensorAttributionControl, "inactiveMicModeSelectionAttributionChanged:", v8);
  -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");

}

- (void)setGameModeActivityDataProvider:(id)a3
{
  -[CCUISensorAttributionExpandedViewController setGameModeActivityDataProvider:](self->_sensorAttributionExpandedViewController, "setGameModeActivityDataProvider:", a3);
}

- (void)setAudioVideoControlsEnabled:(BOOL)a3 forBundleIdentifier:(id)a4
{
  _BOOL8 v4;
  id v6;

  v4 = a3;
  v6 = a4;
  -[CCUIHeaderPocketView setAudioVideoControlsEnabled:](self, "setAudioVideoControlsEnabled:", v4);
  -[CCUIHeaderPocketView setBundleIdentifierUsingAudioVideoControls:](self, "setBundleIdentifierUsingAudioVideoControls:", v6);

  -[CCUISensorAttributionExpandedViewController setAudioVideoControlsEnabled:](self->_sensorAttributionExpandedViewController, "setAudioVideoControlsEnabled:", v4);
  -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
}

- (BOOL)isSensorAttributionViewControllerExpanded
{
  return -[CCUISensorAttributionExpandedViewController isExpanded](self->_sensorAttributionExpandedViewController, "isExpanded");
}

- (void)presentSensorAttributionExpandedView:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  CCUISensorAttributionExpandedViewController *sensorAttributionExpandedViewController;
  void *v7;

  v3 = a3;
  if (!-[CCUIHeaderPocketView isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded"))
  {
    -[UIView superview](self->_sensorAttributionExpandedWrapperView, "superview");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bringSubviewToFront:", self->_sensorAttributionExpandedWrapperView);

    -[CCUISensorAttributionExpandedViewController setDelegate:](self->_sensorAttributionExpandedViewController, "setDelegate:", self);
    sensorAttributionExpandedViewController = self->_sensorAttributionExpandedViewController;
    -[CCUISensorAttributionCompactControl clone](self->_compactSensorAttributionControl, "clone");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[CCUISensorAttributionExpandedViewController prepareForInteractionWithClonedCompactControl:](sensorAttributionExpandedViewController, "prepareForInteractionWithClonedCompactControl:", v7);

    if (!UIAccessibilityIsReduceMotionEnabled() && v3)
      -[CCUISensorAttributionCompactControl setHidden:](self->_compactSensorAttributionControl, "setHidden:", 1);
    -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self->_sensorAttributionExpandedViewController, "setExpanded:animated:", 1, v3);
  }
}

- (void)dismissSensorAttributionExpandedView:(BOOL)a3 completion:(id)a4
{
  _BOOL8 v4;
  void (**v6)(_QWORD);
  NSObject *expandedViewControllerCloseDispatchGroup;
  _QWORD block[4];
  void (**v9)(_QWORD);

  v4 = a3;
  v6 = (void (**)(_QWORD))a4;
  if (-[CCUIHeaderPocketView isSensorAttributionViewControllerExpanded](self, "isSensorAttributionViewControllerExpanded"))
  {
    if (v6)
    {
      expandedViewControllerCloseDispatchGroup = self->_expandedViewControllerCloseDispatchGroup;
      block[0] = MEMORY[0x1E0C809B0];
      block[1] = 3221225472;
      block[2] = __72__CCUIHeaderPocketView_dismissSensorAttributionExpandedView_completion___block_invoke;
      block[3] = &unk_1E8CFC738;
      v9 = v6;
      dispatch_group_notify(expandedViewControllerCloseDispatchGroup, MEMORY[0x1E0C80D38], block);

    }
    -[CCUISensorAttributionExpandedViewController setExpanded:animated:](self->_sensorAttributionExpandedViewController, "setExpanded:animated:", 0, v4);
  }
  else if (v6)
  {
    v6[2](v6);
  }

}

uint64_t __72__CCUIHeaderPocketView_dismissSensorAttributionExpandedView_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setStatusBarDelegate:(id)a3
{
  CCUIStatusBar *statusBar;
  id v5;

  objc_storeWeak((id *)&self->_statusBarDelegate, a3);
  statusBar = self->_statusBar;
  -[CCUIHeaderPocketView statusBarDelegate](self, "statusBarDelegate");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[CCUIStatusBar setDelegate:](statusBar, "setDelegate:", v5);

}

- (void)setMode:(unint64_t)a3 orientationHint:(int64_t)a4
{
  id *p_headerChevronView;
  id v7;
  id *p_statusBar;
  CCUIStatusBar *statusBar;
  unint64_t mode;
  id v11;
  void *v12;
  uint64_t v13;
  id v14;
  CCUIStatusBar *v15;
  uint64_t v16;
  id v17;
  id v18;
  uint64_t v19;
  id v20;
  void *v21;
  uint64_t v22;
  id v23;
  CCUIStatusBar *v24;
  uint64_t v25;
  id v26;
  id v27;
  void *v28;

  if (self->_mode != a3)
  {
    self->_mode = a3;
    p_headerChevronView = (id *)&self->_headerChevronView;
    -[SBUIChevronView removeFromSuperview](self->_headerChevronView, "removeFromSuperview");
    v7 = *p_headerChevronView;
    *p_headerChevronView = 0;

    p_statusBar = (id *)&self->_statusBar;
    -[CCUIStatusBar removeFromSuperview](self->_statusBar, "removeFromSuperview");
    statusBar = self->_statusBar;
    self->_statusBar = 0;

    mode = self->_mode;
    if (mode == 1)
    {
      v20 = objc_alloc(MEMORY[0x1E0DAC278]);
      objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
      v21 = (void *)objc_claimAutoreleasedReturnValue();
      v22 = objc_msgSend(v20, "initWithColor:", v21);
      v23 = *p_headerChevronView;
      *p_headerChevronView = (id)v22;

      objc_msgSend(*p_headerChevronView, "configureForLightStyle");
    }
    else
    {
      if (mode == 2)
      {
        v24 = [CCUIStatusBar alloc];
        -[CCUIHeaderPocketView bounds](self, "bounds");
        v25 = -[CCUIStatusBar initWithFrame:](v24, "initWithFrame:");
        v26 = *p_statusBar;
        *p_statusBar = (id)v25;

        objc_msgSend(*p_statusBar, "setOrientation:", a4);
        v18 = *p_statusBar;
        v19 = 1;
      }
      else
      {
        if (mode != 3)
        {
LABEL_10:
          objc_msgSend(*p_statusBar, "prepareForPresentation");
          objc_msgSend(*p_statusBar, "setNeedsLayout");
          objc_msgSend(*p_statusBar, "layoutIfNeeded");
          -[CCUIHeaderPocketView _updateAlpha](self, "_updateAlpha");
          -[CCUIHeaderPocketView _updateContentTransform](self, "_updateContentTransform");
          return;
        }
        v11 = objc_alloc(MEMORY[0x1E0DAC278]);
        objc_msgSend(MEMORY[0x1E0DC3658], "blackColor");
        v12 = (void *)objc_claimAutoreleasedReturnValue();
        v13 = objc_msgSend(v11, "initWithColor:", v12);
        v14 = *p_headerChevronView;
        *p_headerChevronView = (id)v13;

        objc_msgSend(*p_headerChevronView, "configureForLightStyle");
        -[CCUIHeaderPocketView addSubview:](self, "addSubview:", *p_headerChevronView);
        v15 = [CCUIStatusBar alloc];
        -[CCUIHeaderPocketView bounds](self, "bounds");
        v16 = -[CCUIStatusBar initWithFrame:](v15, "initWithFrame:");
        v17 = *p_statusBar;
        *p_statusBar = (id)v16;

        objc_msgSend(*p_statusBar, "setOrientation:", a4);
        v18 = *p_statusBar;
        v19 = 0;
      }
      objc_msgSend(v18, "setAlignCompactAndExpandedStatusBars:", v19);
      v27 = *p_statusBar;
      -[CCUIHeaderPocketView statusBarDelegate](self, "statusBarDelegate");
      v28 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v27, "setDelegate:", v28);

      p_headerChevronView = (id *)&self->_statusBar;
    }
    -[CCUIHeaderPocketView addSubview:](self, "addSubview:", *p_headerChevronView);
    goto LABEL_10;
  }
}

- (void)setBackgroundAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_backgroundAlpha = a3;
    -[UIView setAlpha:](self->_headerBackgroundView, "setAlpha:", a3);
  }
}

- (void)setCustomBackgroundView:(id)a3
{
  UIView *v4;
  UIView *v5;
  UIView *v6;
  UIView *v7;

  v4 = (UIView *)a3;
  if (self->_customBackgroundView != v4)
  {
    self->_customBackgroundView = v4;
    v7 = v4;
    if (v4)
      v5 = v4;
    else
      v5 = -[CCUIHeaderPocketView _newDefaultBackgroundView](self, "_newDefaultBackgroundView");
    v6 = v5;
    -[CCUIHeaderPocketView _setHeaderBackgroundView:](self, "_setHeaderBackgroundView:", v5);

    v4 = v7;
  }

}

- (void)setChevronAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_chevronAlpha = a3;
    -[CCUIHeaderPocketView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)setStatusBarAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_statusBarAlpha = a3;
    -[CCUIHeaderPocketView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)setSensorStatusViewAlpha:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_sensorStatusViewAlpha = a3;
    -[CCUIHeaderPocketView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)setContentAlphaMultiplier:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_contentAlphaMultiplier = a3;
    -[CCUIHeaderPocketView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)setAdditionalContentAlphaMultiplier:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_additionalContentAlphaMultiplier = a3;
    -[CCUIHeaderPocketView _updateAlpha](self, "_updateAlpha");
  }
}

- (void)setVerticalContentTranslation:(double)a3
{
  if ((BSFloatEqualToFloat() & 1) == 0)
  {
    self->_verticalContentTranslation = a3;
    -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setContentTransform:(CGAffineTransform *)a3
{
  CGAffineTransform *p_contentTransform;
  __int128 v6;
  __int128 v7;
  __int128 v8;
  __int128 v9;
  CGAffineTransform v10;
  CGAffineTransform t1;

  p_contentTransform = &self->_contentTransform;
  v6 = *(_OWORD *)&self->_contentTransform.c;
  *(_OWORD *)&t1.a = *(_OWORD *)&self->_contentTransform.a;
  *(_OWORD *)&t1.c = v6;
  *(_OWORD *)&t1.tx = *(_OWORD *)&self->_contentTransform.tx;
  v7 = *(_OWORD *)&a3->c;
  *(_OWORD *)&v10.a = *(_OWORD *)&a3->a;
  *(_OWORD *)&v10.c = v7;
  *(_OWORD *)&v10.tx = *(_OWORD *)&a3->tx;
  if (!CGAffineTransformEqualToTransform(&t1, &v10))
  {
    v8 = *(_OWORD *)&a3->a;
    v9 = *(_OWORD *)&a3->tx;
    *(_OWORD *)&p_contentTransform->c = *(_OWORD *)&a3->c;
    *(_OWORD *)&p_contentTransform->tx = v9;
    *(_OWORD *)&p_contentTransform->a = v8;
    -[CCUIHeaderPocketView _updateContentTransform](self, "_updateContentTransform");
  }
}

- (CGAffineTransform)compactScaleTransform
{
  CGAffineTransform *result;

  result = (CGAffineTransform *)self->_statusBar;
  if (result)
    return (CGAffineTransform *)-[CGAffineTransform compactScaleTransform](result, "compactScaleTransform");
  *(_OWORD *)&retstr->c = 0u;
  *(_OWORD *)&retstr->tx = 0u;
  *(_OWORD *)&retstr->a = 0u;
  return result;
}

- (void)setCompactScaleTransform:(CGAffineTransform *)a3
{
  CCUIStatusBar *statusBar;
  __int128 v4;
  _OWORD v5[3];

  statusBar = self->_statusBar;
  v4 = *(_OWORD *)&a3->c;
  v5[0] = *(_OWORD *)&a3->a;
  v5[1] = v4;
  v5[2] = *(_OWORD *)&a3->tx;
  -[CCUIStatusBar setCompactScaleTransform:](statusBar, "setCompactScaleTransform:", v5);
}

- (unint64_t)chevronState
{
  return -[SBUIChevronView state](self->_headerChevronView, "state") == 1;
}

- (void)setChevronState:(unint64_t)a3
{
  if (a3 <= 1)
    -[SBUIChevronView setState:animated:](self->_headerChevronView, "setState:animated:");
}

- (void)_configureTopButtons
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  CCUIPowerButton *v11;
  CCUIPowerButtonGlyphView *v12;
  id v13;
  void *v14;
  void *v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t);
  void *v19;
  id v20;
  id location;

  -[CCUIHeaderPocketView _topButtonSymbolPointSize](self, "_topButtonSymbolPointSize");
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 6, 2);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_initWeak(&location, self);
  objc_msgSend(MEMORY[0x1E0DC3520], "plainButtonConfiguration");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(MEMORY[0x1E0DC3870], "_systemImageNamed:withConfiguration:", CFSTR("plus"), v3);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setImage:", v5);
  objc_msgSend(MEMORY[0x1E0DC3658], "systemWhiteColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setBaseForegroundColor:", v6);

  v7 = (void *)MEMORY[0x1E0DC3428];
  v16 = MEMORY[0x1E0C809B0];
  v17 = 3221225472;
  v18 = __44__CCUIHeaderPocketView__configureTopButtons__block_invoke;
  v19 = &unk_1E8CFC890;
  objc_copyWeak(&v20, &location);
  objc_msgSend(v7, "actionWithHandler:", &v16);
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  +[CCUIAccessoryButton buttonWithConfiguration:primaryAction:](CCUIAccessoryButton, "buttonWithConfiguration:primaryAction:", v4, v8, v16, v17, v18, v19);
  v9 = (void *)objc_claimAutoreleasedReturnValue();

  v10 = objc_alloc_init(MEMORY[0x1E0DC3998]);
  objc_msgSend(v9, "addInteraction:", v10);

  objc_msgSend(v9, "setShowsLargeContentViewer:", 1);
  objc_msgSend(v9, "setScalesLargeContentImage:", 1);
  -[CCUIHeaderPocketView addSubview:](self, "addSubview:", v9);
  -[CCUIHeaderPocketView setEditButton:](self, "setEditButton:", v9);
  v11 = objc_alloc_init(CCUIPowerButton);
  v12 = -[CCUIPowerButtonGlyphView initWithSymbolConfiguration:]([CCUIPowerButtonGlyphView alloc], "initWithSymbolConfiguration:", v3);
  -[CSProminentButtonControl setGlyphView:](v11, "setGlyphView:", v12);
  -[CSProminentButtonControl setShouldAnimateBackgroundDuringInteraction:](v11, "setShouldAnimateBackgroundDuringInteraction:", 1);
  -[CCUIPowerButton addTarget:action:forControlEvents:](v11, "addTarget:action:forControlEvents:", self, sel__powerButtonPrimaryActionTriggered, 0x2000);
  v13 = objc_alloc_init(MEMORY[0x1E0DC3998]);
  -[CCUIPowerButton addInteraction:](v11, "addInteraction:", v13);

  -[CCUIPowerButton setShowsLargeContentViewer:](v11, "setShowsLargeContentViewer:", 1);
  -[CCUIPowerButton setScalesLargeContentImage:](v11, "setScalesLargeContentImage:", 1);
  -[CCUIPowerButtonGlyphView imageView](v12, "imageView");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "largeContentImage");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  -[CCUIPowerButton setLargeContentImage:](v11, "setLargeContentImage:", v15);

  -[CCUIHeaderPocketView addSubview:](self, "addSubview:", v11);
  -[CCUIHeaderPocketView setPowerButton:](self, "setPowerButton:", v11);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);

}

void __44__CCUIHeaderPocketView__configureTopButtons__block_invoke(uint64_t a1)
{
  id WeakRetained;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  objc_msgSend(WeakRetained, "_editButtonPrimaryActionTriggered");

}

- (double)_topButtonSymbolPointSize
{
  void *v2;
  double v3;
  double v4;

  objc_msgSend(MEMORY[0x1E0DC1350], "defaultFontForTextStyle:", *MEMORY[0x1E0DC4B10]);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "pointSize");
  v4 = v3;

  return v4;
}

- (void)_editButtonPrimaryActionTriggered
{
  id v2;

  -[CCUIHeaderPocketView actionsDelegate](self, "actionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTriggerEditButtonPrimaryAction");

}

- (void)_powerButtonPrimaryActionTriggered
{
  id v2;

  -[CCUIHeaderPocketView actionsDelegate](self, "actionsDelegate");
  v2 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "didTriggerPowerButtonPrimaryAction");

}

- (void)_updateAlpha
{
  double v3;
  double v4;
  void *v5;

  v3 = self->_contentAlphaMultiplier * self->_additionalContentAlphaMultiplier;
  -[SBUIChevronView setAlpha:](self->_headerChevronView, "setAlpha:", v3 * self->_chevronAlpha);
  -[CCUIStatusBar setAlpha:](self->_statusBar, "setAlpha:", v3 * self->_statusBarAlpha);
  v4 = v3 * self->_sensorStatusViewAlpha;
  -[CCUISensorAttributionCompactControl setAlpha:](self->_compactSensorAttributionControl, "setAlpha:", v4);
  -[CCUISensorAttributionExpandedViewController view](self->_sensorAttributionExpandedViewController, "view");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "setAlpha:", v4);

  -[UIButton setAlpha:](self->_editButton, "setAlpha:", v4);
  -[CCUIPowerButton setAlpha:](self->_powerButton, "setAlpha:", v4);
}

- (id)_newDefaultBackgroundView
{
  return (id)objc_msgSend(objc_alloc(MEMORY[0x1E0DA9E00]), "initWithRecipe:", 7);
}

- (void)_setHeaderBackgroundView:(id)a3
{
  UIView *v5;
  UIView **p_headerBackgroundView;
  UIView *v7;

  v5 = (UIView *)a3;
  p_headerBackgroundView = &self->_headerBackgroundView;
  if (self->_headerBackgroundView != v5)
  {
    v7 = v5;
    -[UIView setAlpha:](v5, "setAlpha:", self->_backgroundAlpha);
    -[UIView removeFromSuperview](*p_headerBackgroundView, "removeFromSuperview");
    objc_storeStrong((id *)&self->_headerBackgroundView, a3);
    -[CCUIHeaderPocketView insertSubview:atIndex:](self, "insertSubview:atIndex:", *p_headerBackgroundView, 0);
    -[CCUIHeaderPocketView setNeedsLayout](self, "setNeedsLayout");
    v5 = v7;
  }

}

- (void)willOpenExpandedSensorAttributionViewController
{
  id WeakRetained;

  -[UIView setHidden:](self->_sensorAttributionExpandedWrapperView, "setHidden:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerPocketViewDelegate);
  objc_msgSend(WeakRetained, "willOpenExpandedSensorAttributionViewController");

}

- (void)didCloseExpandedSensorAttributionViewController
{
  id WeakRetained;

  -[UIView setHidden:](self->_sensorAttributionExpandedWrapperView, "setHidden:", 1);
  -[CCUISensorAttributionCompactControl setHidden:](self->_compactSensorAttributionControl, "setHidden:", 0);
  WeakRetained = objc_loadWeakRetained((id *)&self->_headerPocketViewDelegate);
  objc_msgSend(WeakRetained, "didCloseExpandedSensorAttributionViewController");

}

- (CCUIStatusBarDelegate)statusBarDelegate
{
  return (CCUIStatusBarDelegate *)objc_loadWeakRetained((id *)&self->_statusBarDelegate);
}

- (unint64_t)mode
{
  return self->_mode;
}

- (void)setMode:(unint64_t)a3
{
  self->_mode = a3;
}

- (double)backgroundAlpha
{
  return self->_backgroundAlpha;
}

- (UIView)customBackgroundView
{
  return self->_customBackgroundView;
}

- (double)chevronAlpha
{
  return self->_chevronAlpha;
}

- (double)statusBarAlpha
{
  return self->_statusBarAlpha;
}

- (double)sensorStatusViewAlpha
{
  return self->_sensorStatusViewAlpha;
}

- (double)contentAlphaMultiplier
{
  return self->_contentAlphaMultiplier;
}

- (double)additionalContentAlphaMultiplier
{
  return self->_additionalContentAlphaMultiplier;
}

- (double)verticalContentTranslation
{
  return self->_verticalContentTranslation;
}

- (CGAffineTransform)contentTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[14].ty;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[14].d;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[15].b;
  return self;
}

- (int64_t)interfaceOrientation
{
  return self->_interfaceOrientation;
}

- (UIView)statusLabelView
{
  return self->_statusLabelView;
}

- (void)setStatusLabelView:(id)a3
{
  objc_storeStrong((id *)&self->_statusLabelView, a3);
}

- (CCUIHeaderPocketViewSensorAttributionDelegate)headerPocketViewDelegate
{
  return (CCUIHeaderPocketViewSensorAttributionDelegate *)objc_loadWeakRetained((id *)&self->_headerPocketViewDelegate);
}

- (void)setHeaderPocketViewDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_headerPocketViewDelegate, a3);
}

- (CCUIHeaderPocketViewActionsDelegate)actionsDelegate
{
  return (CCUIHeaderPocketViewActionsDelegate *)objc_loadWeakRetained((id *)&self->_actionsDelegate);
}

- (void)setActionsDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_actionsDelegate, a3);
}

- (CCUIModuleInstanceManager)moduleInstanceManager
{
  return (CCUIModuleInstanceManager *)objc_loadWeakRetained((id *)&self->_moduleInstanceManager);
}

- (void)setModuleInstanceManager:(id)a3
{
  objc_storeWeak((id *)&self->_moduleInstanceManager, a3);
}

- (UIButton)editButton
{
  return self->_editButton;
}

- (void)setEditButton:(id)a3
{
  objc_storeStrong((id *)&self->_editButton, a3);
}

- (CCUIPowerButton)powerButton
{
  return self->_powerButton;
}

- (void)setPowerButton:(id)a3
{
  objc_storeStrong((id *)&self->_powerButton, a3);
}

- (BOOL)audioVideoControlsAreEnabled
{
  return self->_audioVideoControlsEnabled;
}

- (void)setAudioVideoControlsEnabled:(BOOL)a3
{
  self->_audioVideoControlsEnabled = a3;
}

- (NSString)bundleIdentifierUsingAudioVideoControls
{
  return self->_bundleIdentifierUsingAudioVideoControls;
}

- (void)setBundleIdentifierUsingAudioVideoControls:(id)a3
{
  objc_storeStrong((id *)&self->_bundleIdentifierUsingAudioVideoControls, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_bundleIdentifierUsingAudioVideoControls, 0);
  objc_storeStrong((id *)&self->_powerButton, 0);
  objc_storeStrong((id *)&self->_editButton, 0);
  objc_destroyWeak((id *)&self->_moduleInstanceManager);
  objc_destroyWeak((id *)&self->_actionsDelegate);
  objc_destroyWeak((id *)&self->_headerPocketViewDelegate);
  objc_storeStrong((id *)&self->_statusLabelView, 0);
  objc_destroyWeak((id *)&self->_statusBarDelegate);
  objc_storeStrong((id *)&self->_statusBar, 0);
  objc_storeStrong((id *)&self->_expandedViewControllerCloseDispatchGroup, 0);
  objc_storeStrong((id *)&self->_sensorAttributionExpandedWrapperView, 0);
  objc_storeStrong((id *)&self->_sensorAttributionExpandedViewController, 0);
  objc_storeStrong((id *)&self->_compactSensorAttributionControl, 0);
  objc_storeStrong((id *)&self->_headerChevronView, 0);
  objc_storeStrong((id *)&self->_headerBackgroundView, 0);
}

@end

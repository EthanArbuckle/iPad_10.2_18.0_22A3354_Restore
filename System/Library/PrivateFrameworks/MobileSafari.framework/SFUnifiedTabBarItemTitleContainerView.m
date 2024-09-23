@implementation SFUnifiedTabBarItemTitleContainerView

uint64_t __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke(uint64_t a1, uint64_t a2)
{
  return objc_msgSend(*(id *)(a1 + 32), "_showsView:", a2);
}

- (void)_layoutArrangedViews
{
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void (**v12)(void *, uint64_t, void *);
  void *v13;
  uint64_t v14;
  double v15;
  uint64_t v16;
  uint64_t i;
  SFURLLabel *v18;
  _BOOL4 v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double v24;
  double v25;
  BOOL v26;
  void *v27;
  double v28;
  double v29;
  double v30;
  double v31;
  double *v32;
  double *v33;
  uint64_t v34;
  BOOL v35;
  void (**v36)(void *, uint64_t, void *);
  double v37;
  CGFloat v38;
  BOOL v39;
  double v40;
  SFURLLabel *v41;
  _QWORD v42[5];
  id v43;
  void (**v44)(void *, uint64_t, void *);
  uint64_t *v45;
  CGFloat v46;
  CGFloat v47;
  CGFloat v48;
  CGFloat v49;
  CGFloat v50;
  BOOL v51;
  BOOL v52;
  uint64_t v53;
  double *v54;
  uint64_t v55;
  double v56;
  __int128 v57;
  __int128 v58;
  __int128 v59;
  __int128 v60;
  _QWORD aBlock[5];
  _BYTE v62[128];
  uint64_t v63;
  CGRect v64;
  CGRect v65;
  CGRect v66;

  v63 = *MEMORY[0x1E0C80C00];
  -[SFUnifiedTabBarItemTitleContainerView bounds](self, "bounds");
  x = v64.origin.x;
  y = v64.origin.y;
  width = v64.size.width;
  height = v64.size.height;
  v7 = CGRectGetWidth(v64);
  v65.origin.x = x;
  v65.origin.y = y;
  v65.size.width = width;
  v65.size.height = height;
  v38 = CGRectGetHeight(v65);
  v39 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
  -[SFUnifiedTabBarItemTitleContainerView _effectiveDirectionalLayoutMargins](self, "_effectiveDirectionalLayoutMargins");
  v40 = v8;
  v10 = v9;
  -[SFUnifiedTabBarItemTitleContainerView _arrangedViews](self, "_arrangedViews");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView _lastVisibleViewInViews:](self, "_lastVisibleViewInViews:", v11);
  v41 = (SFURLLabel *)objc_claimAutoreleasedReturnValue();
  if (v41)
  {
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke;
    aBlock[3] = &unk_1E21E5090;
    aBlock[4] = self;
    v12 = (void (**)(void *, uint64_t, void *))_Block_copy(aBlock);
    v59 = 0u;
    v60 = 0u;
    v57 = 0u;
    v58 = 0u;
    -[SFUnifiedTabBarItemTitleContainerView _arrangedViewsByContentCompressionResistancePriority](self, "_arrangedViewsByContentCompressionResistancePriority");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
    v37 = v40 + v10;
    v15 = v7 - (v40 + v10);
    if (v14)
    {
      v16 = *(_QWORD *)v58;
      do
      {
        for (i = 0; i != v14; ++i)
        {
          if (*(_QWORD *)v58 != v16)
            objc_enumerationMutation(v13);
          v18 = *(SFURLLabel **)(*((_QWORD *)&v57 + 1) + 8 * i);
          v19 = -[SFUnifiedTabBarItemTitleContainerView _showsView:](self, "_showsView:", v18, *(_QWORD *)&v37);
          -[SFUnifiedTabBarItemTitleContainerView _preferredSizeForView:](self, "_preferredSizeForView:", v18);
          v21 = v20;
          v23 = v22;
          if (v19)
          {
            -[SFUnifiedTabBarItemTitleContainerView _collapsedWidthForView:](self, "_collapsedWidthForView:", v18);
            v25 = fmax(fmin(v21, v15), v24);
            v26 = v25 + 15.0 > v15 && v18 == self->_leadingAnnotationLabel;
            v21 = v26 ? v15 + -15.0 : v25;
            v15 = v15 - v21;
            if (v18 != v41)
            {
              v12[2](v12, objc_msgSend(v11, "indexOfObject:", v18), v11);
              v27 = (void *)objc_claimAutoreleasedReturnValue();
              -[SFUnifiedTabBarItemTitleContainerView _spacingBetweenView:nextView:](self, "_spacingBetweenView:nextView:", v18, v27);
              v29 = v28;

              v15 = v15 - v29;
            }
          }
          if (v18 != (SFURLLabel *)self->_iconView)
          {
            v66.origin.x = x;
            v66.origin.y = y;
            v66.size.width = width;
            v66.size.height = height;
            v23 = CGRectGetHeight(v66);
          }
          -[SFURLLabel setBounds:](v18, "setBounds:", 0.0, 0.0, v21, v23);
        }
        v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v57, v62, 16);
      }
      while (v14);
    }

    v53 = 0;
    v54 = (double *)&v53;
    v30 = v40;
    v55 = 0x2020000000;
    v56 = v40;
    if (self->_narrow || self->_alignment == 1)
    {
      v31 = _SFRoundFloatToPixels((v37 + v15) * 0.5);
      v32 = v54;
      v30 = fmax(v40, fmin(v40 + v15, v31));
      v54[3] = v30;
      v33 = v32 + 3;
    }
    else
    {
      v33 = &v56;
    }
    v34 = MEMORY[0x1E0C809B0];
    *v33 = self->_contentOffset + v30;
    v35 = self->_showsSearchField || self->_suppressesText;
    v42[0] = v34;
    v42[1] = 3221225472;
    v42[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_2;
    v42[3] = &unk_1E21E5108;
    v42[4] = self;
    v46 = v38;
    v36 = v12;
    v44 = v36;
    v51 = v35;
    v43 = v11;
    v45 = &v53;
    v47 = x;
    v48 = y;
    v49 = width;
    v50 = height;
    v52 = v39;
    objc_msgSend(v43, "enumerateObjectsUsingBlock:", v42);
    -[SFUnifiedTabBarItemTitleContainerView _leadingAlignCenteredIconIfNeeded](self, "_leadingAlignCenteredIconIfNeeded");

    _Block_object_dispose(&v53, 8);
  }

}

- (CGSize)_preferredSizeForView:(id)a3
{
  double v3;
  double v4;
  CGSize result;

  if (self->_iconView == a3)
  {
    -[SFUnifiedTabBarItemTitleContainerView _iconSize](self, "_iconSize");
    if (self->_showsSearchIcon && !self->_collapsed)
      -[SFFaviconView intrinsicContentSize](self->_iconView, "intrinsicContentSize");
    else
      v4 = v3;
  }
  else
  {
    objc_msgSend(a3, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  }
  result.height = v4;
  result.width = v3;
  return result;
}

void __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_2(uint64_t a1, void *a2)
{
  id v3;
  int v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  uint64_t v15;
  _BOOL4 v16;
  id v17;
  _BOOL4 v18;
  uint64_t v19;
  int v21;
  uint64_t v22;
  id v23;
  void *v24;
  double v25;
  uint64_t v26;
  int v27;
  id v28;
  void *v29;
  uint64_t v30;
  _BOOL4 v31;
  id v32;
  uint64_t v33;
  id v34;
  _QWORD v35[4];
  id v36;
  uint64_t v37;
  uint64_t v38;
  double v39;
  double v40;
  double v41;
  double v42;
  __int128 v43;
  __int128 v44;
  char v45;
  char v46;
  _QWORD v47[4];
  id v48;
  double v49;
  double v50;
  _QWORD v51[4];
  id v52;
  void *v53;
  char v54;
  char v55;

  v3 = a2;
  v4 = objc_msgSend(*(id *)(a1 + 32), "_showsView:", v3);
  objc_msgSend(v3, "bounds");
  v6 = v5;
  v8 = v7;
  if ((v4 & 1) == 0 && objc_msgSend(*(id *)(a1 + 32), "_viewCollapsesWhenHidden:", v3))
  {
    objc_msgSend(*(id *)(a1 + 32), "_collapsedWidthForView:", v3);
    v6 = v9;
  }
  v10 = _SFRoundFloatToPixels((*(double *)(a1 + 64) - v8) * 0.5);
  v11 = *(void **)(a1 + 32);
  (*(void (**)(void))(*(_QWORD *)(a1 + 48) + 16))();
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "_spacingBetweenView:nextView:", v3, v12);
  v14 = v13;

  v15 = *(_QWORD *)(a1 + 32);
  v16 = *(id *)(v15 + 464) != v3 || *(_BYTE *)(v15 + 531) == 0;
  v17 = *(id *)(v15 + 424);
  v18 = v17 == v3 && *(_BYTE *)(v15 + 528) != 0;
  v19 = *(_QWORD *)(v15 + 480);
  if (v19)
  {
    LODWORD(v19) = *(_BYTE *)(v15 + 531) == 0;
    if (v17 == v3 && *(_BYTE *)(v15 + 531) == 0)
      LODWORD(v19) = *(_QWORD *)(v15 + 416) == 1;
  }
  if (*(_BYTE *)(a1 + 104))
    v21 = 1;
  else
    v21 = v18 | v19;
  v22 = MEMORY[0x1E0C809B0];
  v51[0] = MEMORY[0x1E0C809B0];
  v51[1] = 3221225472;
  v51[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_4;
  v51[3] = &unk_1E21E50B8;
  v23 = v3;
  v54 = v4;
  v55 = v21;
  v24 = *(void **)(a1 + 32);
  v52 = v23;
  v53 = v24;
  if (v16)
  {
    v25 = 0.0;
    if (((v4 ^ 1 | v21) & 1) == 0)
      objc_msgSend(v24, "_alphaForView:", v23, 0.0);
    objc_msgSend(v23, "setAlpha:", v25);
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v51);
  }
  v26 = *(_QWORD *)(a1 + 32);
  if (*(id *)(v26 + 432) != v23 || *(_BYTE *)(v26 + 531) || *(_BYTE *)(v26 + 526))
    v27 = 1;
  else
    v27 = objc_msgSend(v23, "isAnimatingTextSize");
  v47[0] = v22;
  v47[1] = 3221225472;
  v47[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_5;
  v47[3] = &unk_1E21E3710;
  v28 = v23;
  v29 = v28;
  v48 = v28;
  v49 = v6;
  v50 = v8;
  if (v27)
  {
    objc_msgSend(v28, "setBounds:", 0.0, 0.0, v6, v8);
    objc_msgSend(v29, "layoutIfNeeded");
  }
  else
  {
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v47);
  }
  v30 = *(_QWORD *)(a1 + 32);
  v31 = *(void **)(v30 + 464) != v29
     || *(_BYTE *)(v30 + 535)
     || *(_BYTE *)(v30 + 526)
     || *(_QWORD *)(v30 + 416) == 1
     || *(_QWORD *)(v30 + 648) != 0;
  v35[0] = v22;
  v35[1] = 3221225472;
  v35[2] = __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_6;
  v35[3] = &unk_1E21E50E0;
  v38 = *(_QWORD *)(a1 + 56);
  v39 = v10;
  v40 = v6;
  v41 = v8;
  v32 = v29;
  v33 = *(_QWORD *)(a1 + 32);
  v36 = v32;
  v37 = v33;
  v45 = v4;
  v42 = v14;
  v43 = *(_OWORD *)(a1 + 72);
  v44 = *(_OWORD *)(a1 + 88);
  v46 = *(_BYTE *)(a1 + 105);
  v34 = v32;
  if (v31)
  {
    __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_6((uint64_t)v35);
    if (!v4)
      goto LABEL_42;
    goto LABEL_41;
  }
  objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v35);
  if (v4)
LABEL_41:
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8) + 24) = v6
                                                                + v14
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 56) + 8)
                                                                            + 24);
LABEL_42:

}

- (double)_spacingBetweenView:(id)a3 nextView:(id)a4
{
  SFFaviconView *v6;
  id v7;
  void *v8;
  double iconSpacing;
  unsigned int (**v10)(void *, SFFaviconView *);
  _QWORD v12[4];
  SFFaviconView *v13;
  id v14;

  v6 = (SFFaviconView *)a3;
  v7 = a4;
  v8 = v7;
  iconSpacing = 0.0;
  if (v6 && v7)
  {
    if (self->_iconView == v6)
    {
      iconSpacing = self->_iconSpacing;
    }
    else
    {
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __70__SFUnifiedTabBarItemTitleContainerView__spacingBetweenView_nextView___block_invoke;
      v12[3] = &unk_1E21E5130;
      v13 = v6;
      v14 = v8;
      v10 = (unsigned int (**)(void *, SFFaviconView *))_Block_copy(v12);
      if (v10[2](v10, self->_iconView) && v10[2](v10, (SFFaviconView *)self->_lockView) && self->_showsSearchIcon)
      {
        iconSpacing = self->_iconSpacing;
      }
      else if (self->_spacing == 0.0)
      {
        iconSpacing = 4.0;
      }
      else
      {
        iconSpacing = self->_spacing;
      }

    }
  }

  return iconSpacing;
}

id __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5;
  void *v6;
  unint64_t i;
  void *v8;

  v5 = a3;
  v6 = v5;
  for (i = a2 + 1; i < objc_msgSend(v5, "count"); ++i)
  {
    objc_msgSend(v6, "objectAtIndexedSubscript:", i);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    if ((objc_msgSend(*(id *)(a1 + 32), "_showsView:", v8) & 1) != 0)
      goto LABEL_6;

    v5 = v6;
  }
  v8 = 0;
LABEL_6:

  return v8;
}

- (BOOL)_showsView:(id)a3
{
  SFFaviconView *v4;
  SFFaviconView *v5;
  SFFaviconView *iconView;
  BOOL v7;
  uint64_t v8;
  void *v9;
  BOOL v10;

  v4 = (SFFaviconView *)a3;
  v5 = v4;
  if (self->_narrow && self->_iconView != v4)
    goto LABEL_6;
  iconView = self->_iconView;
  if (self->_collapsed)
  {
    if (iconView == v4)
    {
LABEL_12:
      if (self->_alignment == 1 && !self->_leadingAlignsIcon)
      {
        -[SFFaviconView icon](v4, "icon");
        v9 = (void *)objc_claimAutoreleasedReturnValue();

        if (!v9)
          goto LABEL_6;
      }
      if (!self->_showsIcon)
      {
        v8 = 522;
        goto LABEL_19;
      }
LABEL_16:
      v7 = 1;
      goto LABEL_23;
    }
    if ((SFFaviconView *)self->_titleLabel != v4)
    {
LABEL_6:
      v7 = 0;
      goto LABEL_23;
    }
  }
  if (iconView == v4)
    goto LABEL_12;
  if ((SFFaviconView *)self->_lockView == v4)
  {
    v8 = 536;
    goto LABEL_19;
  }
  if ((SFFaviconView *)self->_leadingAnnotationLabel != v4)
  {
    if ((SFFaviconView *)self->_trailingAnnotationLabel == v4)
    {
      v8 = 523;
LABEL_19:
      v10 = *((_BYTE *)&self->super.super.super.isa + v8) == 0;
      goto LABEL_20;
    }
    goto LABEL_16;
  }
  v10 = self->_securityAnnotation == 0;
LABEL_20:
  v7 = !v10;
LABEL_23:

  return v7;
}

uint64_t __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_6(uint64_t a1)
{
  uint64_t v2;
  double v3;
  double v4;
  uint64_t v5;
  double v6;
  CGFloat v7;

  v2 = *(_QWORD *)(a1 + 40);
  v3 = *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 24);
  v4 = *(double *)(a1 + 64);
  v5 = *(_QWORD *)(a1 + 32);
  if (v5 == *(_QWORD *)(v2 + 424) && !*(_BYTE *)(a1 + 120))
    v3 = v3 - (v4 + *(double *)(a1 + 80));
  v6 = *(double *)(a1 + 56);
  v7 = *(double *)(a1 + 72);
  if (v5 == *(_QWORD *)(v2 + 464))
    v6 = v6 - _SFOnePixel();
  _SFFlipRectInCoordinateSpace(*(_BYTE *)(a1 + 121) == 0, v3, v6, v4, v7, *(CGFloat *)(a1 + 88), *(CGFloat *)(a1 + 96), *(CGFloat *)(a1 + 104), *(CGFloat *)(a1 + 112));
  UIRectGetCenter();
  return objc_msgSend(*(id *)(a1 + 32), "setCenter:");
}

- (BOOL)_viewCollapsesWhenHidden:(id)a3
{
  return self->_leadingAnnotationLabel == a3 || self->_titleLabel == a3;
}

BOOL __70__SFUnifiedTabBarItemTitleContainerView__spacingBetweenView_nextView___block_invoke(uint64_t a1, uint64_t a2)
{
  return *(_QWORD *)(a1 + 32) == a2 || *(_QWORD *)(a1 + 40) == a2;
}

- (double)_collapsedWidthForView:(id)a3
{
  double result;

  result = 0.0;
  if (self->_titleLabel == a3)
    return 15.0;
  return result;
}

- (NSArray)_arrangedViews
{
  int *v2;
  int *v3;
  int *v4;
  SFURLLabel **p_leadingAnnotationLabel;
  SFURLLabel *v6;
  UILabel *trailingAnnotationLabel;
  SFURLLabel *leadingAnnotationLabel;
  _QWORD v10[6];

  v10[5] = *MEMORY[0x1E0C80C00];
  if (self->_lockIconEdge == 1)
  {
    v2 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__lockView;
    v10[0] = self->_iconView;
    v3 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__titleLabel;
    v4 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__leadingAnnotationLabel;
    p_leadingAnnotationLabel = (SFURLLabel **)v10;
  }
  else
  {
    v2 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__titleLabel;
    leadingAnnotationLabel = self->_leadingAnnotationLabel;
    v3 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__iconView;
    v4 = &OBJC_IVAR___SFUnifiedTabBarItemTitleContainerView__lockView;
    p_leadingAnnotationLabel = &leadingAnnotationLabel;
  }
  v6 = *(SFURLLabel **)((char *)&self->super.super.super.isa + *v3);
  p_leadingAnnotationLabel[1] = *(SFURLLabel **)((char *)&self->super.super.super.isa + *v4);
  p_leadingAnnotationLabel[2] = v6;
  trailingAnnotationLabel = self->_trailingAnnotationLabel;
  p_leadingAnnotationLabel[3] = *(SFURLLabel **)((char *)&self->super.super.super.isa + *v2);
  p_leadingAnnotationLabel[4] = (SFURLLabel *)trailingAnnotationLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:");
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

- (double)_alphaForView:(id)a3
{
  double result;

  if (self->_iconView == a3 && !self->_showsSearchIcon)
    return self->_iconAlpha;
  result = 0.85;
  if (!self->_dimsText)
    return 1.0;
  return result;
}

- (double)_iconSize
{
  return 18.0;
}

- (void)_leadingAlignCenteredIconIfNeeded
{
  double v3;
  CGFloat v4;
  double v5;
  CGFloat v6;
  double v7;
  CGFloat v8;
  double v9;
  CGFloat v10;
  double v11;
  double v12;
  _BOOL4 v13;
  double v14;
  CGFloat v15;
  CGFloat Height;
  double v17;
  double v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double MinX;
  double v25;
  double v26;
  void *v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t v30;
  uint64_t i;
  void *v32;
  __int128 v33;
  __int128 v34;
  __int128 v35;
  __int128 v36;
  _BYTE v37[128];
  uint64_t v38;
  CGRect v39;
  CGRect v40;
  CGRect v41;
  CGRect v42;
  CGRect v43;

  v38 = *MEMORY[0x1E0C80C00];
  if (self->_alignment == 1
    && self->_leadingAlignsIcon
    && -[SFUnifiedTabBarItemTitleContainerView _showsView:](self, "_showsView:", self->_iconView))
  {
    -[SFUnifiedTabBarItemTitleContainerView bounds](self, "bounds");
    v4 = v3;
    v6 = v5;
    v8 = v7;
    v10 = v9;
    -[SFUnifiedTabBarItemTitleContainerView _iconSize](self, "_iconSize");
    v12 = v11;
    v13 = -[UIView _sf_usesLeftToRightLayout](self, "_sf_usesLeftToRightLayout");
    -[SFUnifiedTabBarItemTitleContainerView directionalLayoutMargins](self, "directionalLayoutMargins");
    v15 = v14;
    v39.origin.x = v4;
    v39.origin.y = v6;
    v39.size.width = v8;
    v39.size.height = v10;
    Height = CGRectGetHeight(v39);
    v17 = _SFFlipRectInCoordinateSpace(!v13, v15, (Height - v12) * 0.5, v12, v12, v4, v6, v8, v10);
    v19 = v18;
    v21 = v20;
    v23 = v22;
    -[SFFaviconView frame](self->_iconView, "frame");
    MinX = CGRectGetMinX(v40);
    v41.origin.x = v17;
    v41.origin.y = v19;
    v41.size.width = v21;
    v41.size.height = v23;
    v25 = fmin(vabdd_f64(MinX, CGRectGetMinX(v41)), (v12 + self->_iconSpacing) * 0.5);
    v33 = 0u;
    v34 = 0u;
    if (v13)
      v26 = -v25;
    else
      v26 = v25;
    v35 = 0uLL;
    v36 = 0uLL;
    -[SFUnifiedTabBarItemTitleContainerView _arrangedViews](self, "_arrangedViews", (_QWORD)v33);
    v27 = (void *)objc_claimAutoreleasedReturnValue();
    v28 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
    if (v28)
    {
      v29 = v28;
      v30 = *(_QWORD *)v34;
      do
      {
        for (i = 0; i != v29; ++i)
        {
          if (*(_QWORD *)v34 != v30)
            objc_enumerationMutation(v27);
          v32 = *(void **)(*((_QWORD *)&v33 + 1) + 8 * i);
          objc_msgSend(v32, "frame");
          v43 = CGRectOffset(v42, v26, 0.0);
          objc_msgSend(v32, "setFrame:", v43.origin.x, v43.origin.y, v43.size.width, v43.size.height);
        }
        v29 = objc_msgSend(v27, "countByEnumeratingWithState:objects:count:", &v33, v37, 16);
      }
      while (v29);
    }

    -[SFFaviconView setFrame:](self->_iconView, "setFrame:", v17, v19, v21, v23);
  }
}

- (id)_lastVisibleViewInViews:(id)a3
{
  void *v4;
  uint64_t v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t i;
  void *v9;
  id v10;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  __int128 v15;
  _BYTE v16[128];
  uint64_t v17;

  v17 = *MEMORY[0x1E0C80C00];
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  v15 = 0u;
  objc_msgSend(a3, "reverseObjectEnumerator", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
  if (v5)
  {
    v6 = v5;
    v7 = *(_QWORD *)v13;
    while (2)
    {
      for (i = 0; i != v6; ++i)
      {
        if (*(_QWORD *)v13 != v7)
          objc_enumerationMutation(v4);
        v9 = *(void **)(*((_QWORD *)&v12 + 1) + 8 * i);
        if (-[SFUnifiedTabBarItemTitleContainerView _showsView:](self, "_showsView:", v9))
        {
          v10 = v9;
          goto LABEL_11;
        }
      }
      v6 = objc_msgSend(v4, "countByEnumeratingWithState:objects:count:", &v12, v16, 16);
      if (v6)
        continue;
      break;
    }
  }
  v10 = 0;
LABEL_11:

  return v10;
}

- (NSDirectionalEdgeInsets)_effectiveDirectionalLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  NSDirectionalEdgeInsets result;

  if (self->_usesInsetFromLayoutMargins && !self->_narrow)
  {
    -[SFUnifiedTabBarItemTitleContainerView directionalLayoutMargins](self, "directionalLayoutMargins");
  }
  else
  {
    v2 = *MEMORY[0x1E0DC3298];
    v3 = *(double *)(MEMORY[0x1E0DC3298] + 8);
    v4 = *(double *)(MEMORY[0x1E0DC3298] + 16);
    v5 = *(double *)(MEMORY[0x1E0DC3298] + 24);
  }
  result.trailing = v5;
  result.bottom = v4;
  result.leading = v3;
  result.top = v2;
  return result;
}

- (NSArray)_arrangedViewsByContentCompressionResistancePriority
{
  UIImageView *lockView;
  SFURLLabel *leadingAnnotationLabel;
  _QWORD v5[6];

  v5[5] = *MEMORY[0x1E0C80C00];
  lockView = self->_lockView;
  v5[0] = self->_iconView;
  v5[1] = lockView;
  leadingAnnotationLabel = self->_leadingAnnotationLabel;
  v5[2] = self->_trailingAnnotationLabel;
  v5[3] = leadingAnnotationLabel;
  v5[4] = self->_titleLabel;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v5, 5);
  return (NSArray *)(id)objc_claimAutoreleasedReturnValue();
}

uint64_t __54__SFUnifiedTabBarItemTitleContainerView_setCollapsed___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (NSString)titleTextStyle
{
  return self->_titleTextStyle;
}

- (NSString)title
{
  return self->_title;
}

- (SFUnifiedTabBarItemTitleContainerView)initWithAlignment:(int64_t)a3
{
  SFUnifiedTabBarItemTitleContainerView *v4;
  SFUnifiedTabBarItemTitleContainerView *v5;
  uint64_t v6;
  NSString *placeholder;
  SFURLLabel *v8;
  SFURLLabel *titleLabel;
  SFFaviconView *v10;
  SFFaviconView *iconView;
  void *v12;
  id v13;
  void *v14;
  uint64_t v15;
  UIImageView *lockView;
  SFURLLabel *v17;
  SFURLLabel *leadingAnnotationLabel;
  void *v19;
  UILabel *v20;
  UILabel *trailingAnnotationLabel;
  void *v22;
  void *v23;
  SFUnifiedTabBarItemTitleContainerViewTheme *v24;
  SFUnifiedTabBarItemTitleContainerView *v25;
  _QWORD v27[4];
  id v28;
  id location;
  objc_super v30;

  v30.receiver = self;
  v30.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  v4 = -[SFUnifiedTabBarItemTitleContainerView initWithFrame:](&v30, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  v5 = v4;
  if (v4)
  {
    v4->_alignment = a3;
    v4->_collapsed = 1;
    _WBSLocalizedString();
    v6 = objc_claimAutoreleasedReturnValue();
    placeholder = v5->_placeholder;
    v5->_placeholder = (NSString *)v6;

    v5->_iconSpacing = 6.0;
    objc_storeStrong((id *)&v5->_titleTextStyle, (id)*MEMORY[0x1E0DC4A88]);
    v5->_usesInsetFromLayoutMargins = 1;
    v5->_titleToSearchIconSpacing = 6.0;
    v8 = -[SFURLLabel initWithFadeOutDistance:]([SFURLLabel alloc], "initWithFadeOutDistance:", 9.5);
    titleLabel = v5->_titleLabel;
    v5->_titleLabel = v8;

    -[SFURLLabel setAdjustsFontForContentSizeCategory:](v5->_titleLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFUnifiedTabBarItemTitleContainerView addSubview:](v5, "addSubview:", v5->_titleLabel);
    v10 = objc_alloc_init(SFFaviconView);
    iconView = v5->_iconView;
    v5->_iconView = v10;

    objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", v5->_titleTextStyle, 1);
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFaviconView setPreferredSymbolConfiguration:](v5->_iconView, "setPreferredSymbolConfiguration:", v12);
    -[SFUnifiedTabBarItemTitleContainerView addSubview:](v5, "addSubview:", v5->_iconView);
    v13 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.fill"));
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    v15 = objc_msgSend(v13, "initWithImage:", v14);
    lockView = v5->_lockView;
    v5->_lockView = (UIImageView *)v15;

    -[UIImageView setPreferredSymbolConfiguration:](v5->_lockView, "setPreferredSymbolConfiguration:", v12);
    -[UIImageView setContentMode:](v5->_lockView, "setContentMode:", 4);
    -[SFUnifiedTabBarItemTitleContainerView addSubview:](v5, "addSubview:", v5->_lockView);
    v17 = -[SFURLLabel initWithFadeOutDistance:]([SFURLLabel alloc], "initWithFadeOutDistance:", 9.5);
    leadingAnnotationLabel = v5->_leadingAnnotationLabel;
    v5->_leadingAnnotationLabel = v17;

    -[SFURLLabel setTextAlignmentEdge:](v5->_leadingAnnotationLabel, "setTextAlignmentEdge:", 0);
    -[SFURLLabel setFadeOutEdge:](v5->_leadingAnnotationLabel, "setFadeOutEdge:", 1);
    -[SFURLLabel setAdjustsFontForContentSizeCategory:](v5->_leadingAnnotationLabel, "setAdjustsFontForContentSizeCategory:", 1);
    -[SFURLLabel setClipsToBounds:](v5->_leadingAnnotationLabel, "setClipsToBounds:", 1);
    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v19 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFURLLabel setTextColor:](v5->_leadingAnnotationLabel, "setTextColor:", v19);

    -[SFUnifiedTabBarItemTitleContainerView addSubview:](v5, "addSubview:", v5->_leadingAnnotationLabel);
    v20 = (UILabel *)objc_alloc_init(MEMORY[0x1E0DC3990]);
    trailingAnnotationLabel = v5->_trailingAnnotationLabel;
    v5->_trailingAnnotationLabel = v20;

    -[UILabel setAdjustsFontForContentSizeCategory:](v5->_trailingAnnotationLabel, "setAdjustsFontForContentSizeCategory:", 1);
    _WBSLocalizedString();
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setText:](v5->_trailingAnnotationLabel, "setText:", v22);

    objc_msgSend(MEMORY[0x1E0DC3658], "secondaryLabelColor");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    -[UILabel setTextColor:](v5->_trailingAnnotationLabel, "setTextColor:", v23);

    -[SFUnifiedTabBarItemTitleContainerView addSubview:](v5, "addSubview:", v5->_trailingAnnotationLabel);
    -[SFUnifiedTabBarItemTitleContainerView setAccessibilityIdentifier:](v5, "setAccessibilityIdentifier:", CFSTR("TabBarItemTitleContainer"));
    v24 = objc_alloc_init(SFUnifiedTabBarItemTitleContainerViewTheme);
    -[SFUnifiedTabBarItemTitleContainerView setTheme:](v5, "setTheme:", v24);

    objc_initWeak(&location, v5);
    v27[0] = MEMORY[0x1E0C809B0];
    v27[1] = 3221225472;
    v27[2] = __59__SFUnifiedTabBarItemTitleContainerView_initWithAlignment___block_invoke;
    v27[3] = &unk_1E21E2AE8;
    objc_copyWeak(&v28, &location);
    -[SFFaviconView setTrailingInsetChangeHandler:](v5->_iconView, "setTrailingInsetChangeHandler:", v27);
    v25 = v5;
    objc_destroyWeak(&v28);
    objc_destroyWeak(&location);

  }
  return v5;
}

- (void)layoutSubviews
{
  _BOOL4 v3;
  double Width;
  BOOL collapsed;
  double v6;
  double v7;
  objc_super v8;
  CGRect v9;

  v8.receiver = self;
  v8.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  -[SFUnifiedTabBarItemTitleContainerView layoutSubviews](&v8, sel_layoutSubviews);
  v3 = (self->_showsSearchIcon
     || self->_collapsed
     || -[SFUnifiedTabBarItemTitleContainerView _showsPlaceholder](self, "_showsPlaceholder"))
    && !self->_titleLanguageIsRightToLeft;
  -[SFURLLabel setTextAlignmentEdge:](self->_titleLabel, "setTextAlignmentEdge:", !v3);
  -[SFURLLabel setFadeOutEdge:](self->_titleLabel, "setFadeOutEdge:", v3);
  -[SFURLLabel setAlpha:](self->_availabilityLabel, "setAlpha:", (double)-[SFUnifiedTabBarItemTitleContainerView _shouldShowAvailabilityLabel](self, "_shouldShowAvailabilityLabel"));
  -[SFUnifiedTabBarItemTitleContainerView bounds](self, "bounds");
  Width = CGRectGetWidth(v9);
  if (Width != 0.0)
  {
    collapsed = self->_collapsed;
    if (collapsed)
    {
      v6 = Width;
      -[SFUnifiedTabBarItemTitleContainerView minimumWidthToShowTitle](self, "minimumWidthToShowTitle");
      collapsed = v6 < v7;
    }
    self->_narrow = collapsed;
    -[SFUnifiedTabBarItemTitleContainerView _layoutArrangedViews](self, "_layoutArrangedViews");
    -[SFUnifiedTabBarItemTitleContainerView _layOutSearchField](self, "_layOutSearchField");
    -[SFUnifiedTabBarItemTitleContainerView _layoutSquishedAccessoryViews](self, "_layoutSquishedAccessoryViews");
  }
}

- (BOOL)_shouldShowAvailabilityLabel
{
  return self->_availabilityLabel && !self->_collapsed && !self->_showsSearchField;
}

- (void)_layoutSquishedAccessoryViews
{
  -[SFUnifiedTabBarItemTitleContainerView _layoutSquishedAccessoryView:forView:](self, "_layoutSquishedAccessoryView:forView:", self->_squishedIconView, self->_iconView);
  -[SFUnifiedTabBarItemTitleContainerView _layoutSquishedAccessoryView:forView:](self, "_layoutSquishedAccessoryView:forView:", self->_squishedLockView, self->_lockView);
}

- (void)_layoutSquishedAccessoryView:(id)a3 forView:(id)a4
{
  id v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  double v15;
  double v16;
  double v17;
  double v18;
  NSObject *v19;
  double v20;

  v6 = a3;
  v7 = a4;
  v8 = v7;
  if (v6)
  {
    objc_msgSend(v7, "setHidden:", self->_showsSquishedAccessoryViews);
    objc_msgSend(v6, "setHidden:", -[SFUnifiedTabBarItemTitleContainerView _showsView:](self, "_showsView:", v8) ^ 1);
    if (self->_showsSquishedAccessoryViews)
    {
      objc_msgSend(v6, "sizeToFit");
      objc_msgSend(v8, "superview");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v8, "center");
      v11 = v10;
      v13 = v12;
      objc_msgSend(v6, "superview");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "convertPoint:toView:", v14, v11, v13);
      v16 = v15;
      v18 = v17;

      if (_SFPointIsInvalid())
      {
        v19 = WBS_LOG_CHANNEL_PREFIXTabBar();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          -[SFUnifiedTabBarItemTitleContainerView _layoutSquishedAccessoryView:forView:].cold.1(v19, v6, (uint64_t)v8);
      }
      else
      {
        objc_msgSend(v6, "setCenter:", v16, v18);
        objc_msgSend(v6, "frame");
        objc_msgSend(v6, "setFrame:", _SFRoundRectToPixels(v20));
        objc_msgSend(v8, "alpha");
        objc_msgSend(v6, "setAlpha:");
      }
    }
  }

}

- (void)_layOutSearchField
{
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  CGFloat v12;
  unint64_t v13;
  void *v14;
  _QWORD v15[5];
  CGRect v16;
  CGRect v17;

  if (self->_searchField)
  {
    if ((objc_msgSend(MEMORY[0x1E0DC3F10], "areAnimationsEnabled") & 1) == 0)
    {
      -[UITextField layer](self->_searchField, "layer");
      v3 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v3, "removeAllAnimations");

    }
    -[SFUnifiedTabBarItemTitleContainerView _updateOffsetOfTitleInSearchField](self, "_updateOffsetOfTitleInSearchField");
    -[SFUnifiedTabBarItemTitleContainerView _searchFieldFrame](self, "_searchFieldFrame");
    v8 = v5;
    v9 = v6;
    v10 = v7;
    if (self->_showsSearchField)
    {
      v11 = v4;
      v12 = CGRectGetMinX(*(CGRect *)&v4) + self->_offsetOfTitleInSearchField;
      -[SFURLLabel frame](self->_titleLabel, "frame");
      -[SFUnifiedTabBarItemTitleContainerView _slideArrangedViewsForSearchField:](self, "_slideArrangedViewsForSearchField:", v12 - CGRectGetMinX(v16));
    }
    else
    {
      -[SFURLLabel frame](self->_titleLabel, "frame");
      v11 = CGRectGetMinX(v17) - self->_offsetOfTitleInSearchField;
    }
    -[UITextField setFrame:](self->_searchField, "setFrame:", v11, v8, v9, v10);
    LOBYTE(v13) = self->_showsSearchField;
    -[UITextField setAlpha:](self->_searchField, "setAlpha:", (double)v13);
    -[SFUnifiedTabBarItemTitleContainerView _placeholderText](self, "_placeholderText");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    -[UITextField setPlaceholder:](self->_searchField, "setPlaceholder:", v14);

    v15[0] = MEMORY[0x1E0C809B0];
    v15[1] = 3221225472;
    v15[2] = __59__SFUnifiedTabBarItemTitleContainerView__layOutSearchField__block_invoke;
    v15[3] = &unk_1E21E2050;
    v15[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v15);
    -[SFUnifiedTabBarItemTitleContainerView _layOutFakeClearButtonUsingPresentationFrame:](self, "_layOutFakeClearButtonUsingPresentationFrame:", 0);
  }
}

- (void)_updateTitleFont
{
  UIFont *placeholderFont;
  void *v4;
  UIFont *v5;

  -[SFUnifiedTabBarItemTitleContainerView _titleFontWithTraitCollection:](self, "_titleFontWithTraitCollection:", 0);
  v5 = (UIFont *)objc_claimAutoreleasedReturnValue();
  if (!-[SFUnifiedTabBarItemTitleContainerView _showsPlaceholder](self, "_showsPlaceholder")
    || (placeholderFont = self->_placeholderFont) == 0)
  {
    placeholderFont = v5;
  }
  -[SFURLLabel setFont:](self->_titleLabel, "setFont:", placeholderFont);
  -[SFURLLabel setFont:](self->_leadingAnnotationLabel, "setFont:", v5);
  -[UILabel setFont:](self->_trailingAnnotationLabel, "setFont:", v5);
  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", self->_titleTextStyle, 1);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFaviconView setPreferredSymbolConfiguration:](self->_iconView, "setPreferredSymbolConfiguration:", v4);
  -[UIImageView setPreferredSymbolConfiguration:](self->_lockView, "setPreferredSymbolConfiguration:", v4);

}

- (void)setTheme:(id)a3
{
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;

  objc_storeStrong((id *)&self->_theme, a3);
  v5 = a3;
  objc_msgSend(v5, "secondaryTextColor");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel setTextColor:](self->_leadingAnnotationLabel, "setTextColor:", v6);

  objc_msgSend(v5, "secondaryTextColor");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[UILabel setTextColor:](self->_trailingAnnotationLabel, "setTextColor:", v7);

  objc_msgSend(v5, "primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel setTextColor:](self->_availabilityLabel, "setTextColor:", v8);

  objc_msgSend(v5, "primaryTextColor");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_squishedIconView, "setTintColor:", v9);

  objc_msgSend(v5, "themeColor");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFFaviconView setThemeColor:](self->_iconView, "setThemeColor:", v10);

  objc_msgSend(v5, "secondaryTextColor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_squishedLockView, "setTintColor:", v11);

  objc_msgSend(v5, "secondaryTextColor");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[UIImageView setTintColor:](self->_lockView, "setTintColor:", v12);

  -[SFUnifiedTabBarItemTitleContainerView _updateTitleColor](self, "_updateTitleColor");
  -[SFUnifiedTabBarItemTitleContainerView _updateSecurityAnnotation](self, "_updateSecurityAnnotation");
  -[SFUnifiedTabBarItemTitleContainerView _updateSearchFieldColor](self, "_updateSearchFieldColor");
}

- (void)_updateTitleColor
{
  BOOL v3;
  SFUnifiedTabBarItemTitleContainerViewTheme *theme;
  id v5;

  v3 = -[SFUnifiedTabBarItemTitleContainerView _showsPlaceholder](self, "_showsPlaceholder");
  theme = self->_theme;
  if (v3)
    -[SFUnifiedTabBarItemTitleContainerViewTheme placeholderTextColor](theme, "placeholderTextColor");
  else
    -[SFUnifiedTabBarItemTitleContainerViewTheme primaryTextColor](theme, "primaryTextColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[SFFaviconView setTintColor:](self->_iconView, "setTintColor:", v5);
  -[SFURLLabel setTextColor:](self->_titleLabel, "setTextColor:", v5);

}

- (void)_updateSearchFieldColor
{
  void *v3;
  void *v4;
  id v5;

  -[SFUnifiedTabBarItemTitleContainerViewTheme primaryTextColor](self->_theme, "primaryTextColor");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  -[UITextField setTextColor:](self->_searchField, "setTextColor:", v3);

  -[SFUnifiedTabBarItemTitleContainerViewTheme placeholderTextColor](self->_theme, "placeholderTextColor");
  v5 = (id)objc_claimAutoreleasedReturnValue();
  -[UITextField _placeholderLabel](self->_searchField, "_placeholderLabel");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "setTextColor:", v5);

}

- (BOOL)_showsPlaceholder
{
  return !self->_collapsed && -[NSString length](self->_title, "length") == 0;
}

- (void)setShowsSearchIcon:(BOOL)a3
{
  if (self->_showsSearchIcon != a3)
  {
    self->_showsSearchIcon = a3;
    -[SFUnifiedTabBarItemTitleContainerView _updateIcon](self, "_updateIcon");
    -[SFUnifiedTabBarItemTitleContainerView _updateIconSpacing](self, "_updateIconSpacing");
    -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateSecurityAnnotation
{
  void *v3;
  SFUnifiedTabBarItemTitleContainerViewTheme *theme;
  void *v5;
  void *v6;
  id v7;
  void *v8;
  id v9;
  void *v10;
  id v11;
  uint64_t v12;
  void *v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  uint64_t v19;
  void *v20;
  uint64_t v21;
  _QWORD v22[2];

  v22[1] = *MEMORY[0x1E0C80C00];
  _WBSLocalizedString();
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  theme = self->_theme;
  if (theme)
  {
    -[SFUnifiedTabBarItemTitleContainerViewTheme overrideTintColor](theme, "overrideTintColor");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = v5;
    if (v5)
    {
      v7 = v5;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E0DC3658], "systemRedColor");
      v7 = (id)objc_claimAutoreleasedReturnValue();
    }
    v8 = v7;

    if (self->_hasFocusedSensitiveInputField)
    {
      v9 = v8;
    }
    else
    {
      -[SFUnifiedTabBarItemTitleContainerViewTheme secondaryTextColor](self->_theme, "secondaryTextColor");
      v9 = (id)objc_claimAutoreleasedReturnValue();
    }
    v10 = v9;
    v11 = objc_alloc(MEMORY[0x1E0CB3778]);
    v21 = *MEMORY[0x1E0DC1140];
    v12 = v21;
    v22[0] = v10;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v22, &v21, 1);
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    v14 = (void *)objc_msgSend(v11, "initWithString:attributes:", v3, v13);

    v15 = objc_alloc(MEMORY[0x1E0CB3498]);
    v19 = v12;
    -[SFUnifiedTabBarItemTitleContainerViewTheme secondaryTextColor](self->_theme, "secondaryTextColor");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    v20 = v16;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", &v20, &v19, 1);
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    v18 = (void *)objc_msgSend(v15, "initWithString:attributes:", CFSTR(" —"), v17);

    objc_msgSend(v14, "appendAttributedString:", v18);
    -[SFURLLabel setAttributedText:](self->_leadingAnnotationLabel, "setAttributedText:", v14);

  }
  else
  {
    objc_msgSend(v3, "stringByAppendingString:", CFSTR(" —"));
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFURLLabel setText:](self->_leadingAnnotationLabel, "setText:", v8);
  }

}

- (SFUnifiedTabBarItemTitleContainerViewTheme)theme
{
  return self->_theme;
}

- (void)_updateTitle
{
  NSString *titleWhenCollapsed;
  NSString *v4;
  void *v5;
  char v6;
  const void *v7;
  NSString *v8;

  -[SFUnifiedTabBarItemTitleContainerView _updateTitleColor](self, "_updateTitleColor");
  -[SFUnifiedTabBarItemTitleContainerView _updateTitleFont](self, "_updateTitleFont");
  -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  if (self->_collapsed)
  {
    titleWhenCollapsed = self->_titleWhenCollapsed;
LABEL_5:
    v4 = titleWhenCollapsed;
    goto LABEL_6;
  }
  if (-[NSString length](self->_title, "length"))
  {
    titleWhenCollapsed = self->_title;
    goto LABEL_5;
  }
  -[SFUnifiedTabBarItemTitleContainerView _placeholderText](self, "_placeholderText");
  v4 = (NSString *)objc_claimAutoreleasedReturnValue();
LABEL_6:
  v8 = v4;
  -[SFURLLabel text](self->_titleLabel, "text");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = WBSIsEqual();

  if ((v6 & 1) == 0)
  {
    -[SFURLLabel setText:](self->_titleLabel, "setText:", v8);
    if (v8)
    {
      v7 = (const void *)CTLineCreateWithString();
      self->_titleLanguageIsRightToLeft = CTLineIsRightToLeft();
      CFRelease(v7);
    }
    else
    {
      self->_titleLanguageIsRightToLeft = 0;
    }
  }

}

- (id)_placeholderText
{
  if (self->_suppressesText)
    return &stru_1E21FE780;
  else
    return self->_placeholder;
}

uint64_t __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setBounds:", 0.0, 0.0, *(double *)(a1 + 40), *(double *)(a1 + 48));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setTitleTextStyle:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_titleTextStyle, a3);
    -[SFUnifiedTabBarItemTitleContainerView _updateTitle](self, "_updateTitle");
  }

}

- (void)setSecurityAnnotation:(int64_t)a3
{
  id v5;

  if (self->_securityAnnotation != a3)
  {
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
    -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    self->_securityAnnotation = a3;
    if (self->_collapsed)
    {
      -[SFUnifiedTabBarItemTitleContainerView _updateSecurityAnnotationAnimated:](self, "_updateSecurityAnnotationAnimated:", 0);
    }
    else
    {
      -[SFUnifiedTabBarItemTitleContainerView window](self, "window");
      v5 = (id)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemTitleContainerView _updateSecurityAnnotationAnimated:](self, "_updateSecurityAnnotationAnimated:", v5 != 0);

    }
  }
}

- (void)setHasFocusedSensitiveInputField:(BOOL)a3
{
  if (self->_hasFocusedSensitiveInputField != a3)
  {
    self->_hasFocusedSensitiveInputField = a3;
    -[SFUnifiedTabBarItemTitleContainerView _updateSecurityAnnotation](self, "_updateSecurityAnnotation");
  }
}

- (void)_updateIconSpacing
{
  int64_t alignment;
  double titleToSearchIconSpacing;
  double v5;

  alignment = self->_alignment;
  if (alignment == 1)
  {
    -[SFFaviconView trailingInset](self->_iconView, "trailingInset");
    titleToSearchIconSpacing = fmax(6.0 - v5, 0.0);
  }
  else
  {
    titleToSearchIconSpacing = 0.0;
    if (!alignment)
      titleToSearchIconSpacing = 6.0;
  }
  if (self->_showsSearchIcon && !-[SFUnifiedTabBarItemTitleContainerView _showsPlaceholder](self, "_showsPlaceholder"))
    titleToSearchIconSpacing = self->_titleToSearchIconSpacing;
  if (self->_iconSpacing != titleToSearchIconSpacing)
  {
    self->_iconSpacing = titleToSearchIconSpacing;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

void __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  double v5;
  double v6;
  id v7;
  void *v8;
  void *v9;
  double v10;
  id v11;

  v11 = a2;
  objc_msgSend(*(id *)(a1 + 32), "_preferredSizeForView:", v11);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v5
                                                              + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                          + 32);
  *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 40) = fmax(*(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)+ 40), v6);
  objc_msgSend(*(id *)(a1 + 40), "lastObject");
  v7 = (id)objc_claimAutoreleasedReturnValue();

  if (v7 != v11)
  {
    v8 = *(void **)(a1 + 32);
    objc_msgSend(*(id *)(a1 + 40), "objectAtIndexedSubscript:", a3 + 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "_spacingBetweenView:nextView:", v11, v9);
    *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8) + 32) = v10
                                                                + *(double *)(*(_QWORD *)(*(_QWORD *)(a1 + 48) + 8)
                                                                            + 32);

  }
}

- (void)setUsesInsetFromLayoutMargins:(BOOL)a3
{
  self->_usesInsetFromLayoutMargins = a3;
}

- (void)setTitleToSearchIconSpacing:(double)a3
{
  if (self->_titleToSearchIconSpacing != a3)
  {
    self->_titleToSearchIconSpacing = a3;
    -[SFUnifiedTabBarItemTitleContainerView _updateIconSpacing](self, "_updateIconSpacing");
  }
}

- (void)setCollapsed:(BOOL)a3
{
  _QWORD v4[5];

  if (self->_collapsed != a3)
  {
    self->_collapsed = a3;
    -[SFUnifiedTabBarItemTitleContainerView _updateIcon](self, "_updateIcon");
    -[SFUnifiedTabBarItemTitleContainerView _updateTitle](self, "_updateTitle");
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __54__SFUnifiedTabBarItemTitleContainerView_setCollapsed___block_invoke;
    v4[3] = &unk_1E21E2050;
    v4[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v4);
  }
}

- (void)_updateIcon
{
  uint64_t v3;
  void *v4;
  id v5;

  if (self->_showsSearchIcon && !self->_collapsed)
  {
    -[SFFaviconView setIconContentMode:](self->_iconView, "setIconContentMode:", 4);
    if (-[SFUnifiedTabBarItemTitleContainerView _showsPlaceholder](self, "_showsPlaceholder"))
    {
      objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithTextStyle:scale:", self->_titleTextStyle, 2);
      v3 = objc_claimAutoreleasedReturnValue();
    }
    else
    {
      v3 = 0;
    }
    v5 = (id)v3;
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:withConfiguration:", CFSTR("magnifyingglass"), v3);
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFFaviconView setIcon:](self->_iconView, "setIcon:", v4);

  }
  else
  {
    -[SFFaviconView setIconContentMode:](self->_iconView, "setIconContentMode:", 1);
    -[SFFaviconView setIcon:](self->_iconView, "setIcon:", self->_icon);
  }
}

- (void)setAnimateLockViewPosition:(BOOL)a3
{
  self->_animateLockViewPosition = a3;
}

- (void)setShowsPrivateAnnotation:(BOOL)a3
{
  self->_showsPrivateAnnotation = a3;
}

- (void)setTitle:(id)a3
{
  int v4;
  int v5;
  NSString *v6;
  NSString *title;
  NSString *v8;
  NSString *v9;
  void *v10;
  id v11;
  _QWORD v12[5];

  v11 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    if (-[SFUnifiedTabBarItemTitleContainerView showsSearchIcon](self, "showsSearchIcon"))
    {
      v4 = -[NSString length](self->_title, "length") == 0;
      v5 = objc_msgSend(v11, "length") == 0;
      v6 = (NSString *)objc_msgSend(v11, "copy");
      title = self->_title;
      self->_title = v6;

      -[SFUnifiedTabBarItemTitleContainerView _updateTitle](self, "_updateTitle");
      if (v4 != v5)
      {
        -[SFUnifiedTabBarItemTitleContainerView _updateIcon](self, "_updateIcon");
        -[SFUnifiedTabBarItemTitleContainerView _updateIconSpacing](self, "_updateIconSpacing");
      }
    }
    else
    {
      v8 = (NSString *)objc_msgSend(v11, "copy");
      v9 = self->_title;
      self->_title = v8;

      -[SFUnifiedTabBarItemTitleContainerView _updateTitle](self, "_updateTitle");
    }
    if (!self->_collapsed && self->_alignment == 1)
    {
      -[SFUnifiedTabBarItemTitleContainerView window](self, "window");
      v10 = (void *)objc_claimAutoreleasedReturnValue();

      if (v10)
      {
        v12[0] = MEMORY[0x1E0C809B0];
        v12[1] = 3221225472;
        v12[2] = __50__SFUnifiedTabBarItemTitleContainerView_setTitle___block_invoke;
        v12[3] = &unk_1E21E2050;
        v12[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v12);
      }
    }
  }

}

- (void)setShowsLockIcon:(BOOL)a3
{
  _BOOL4 v3;
  void *v5;
  _QWORD v6[5];

  if (self->_showsLockIcon != a3)
  {
    v3 = a3;
    self->_showsLockIcon = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
    -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    if (v3 && !self->_collapsed)
    {
      -[SFUnifiedTabBarItemTitleContainerView window](self, "window");
      v5 = (void *)objc_claimAutoreleasedReturnValue();

      if (v5)
      {
        v6[0] = MEMORY[0x1E0C809B0];
        v6[1] = 3221225472;
        v6[2] = __58__SFUnifiedTabBarItemTitleContainerView_setShowsLockIcon___block_invoke;
        v6[3] = &unk_1E21E2050;
        v6[4] = self;
        objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v6, 0);
      }
    }
  }
}

- (void)setPlaceholder:(id)a3
{
  NSString *v4;
  NSString *placeholder;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    placeholder = self->_placeholder;
    self->_placeholder = v4;

    -[SFUnifiedTabBarItemTitleContainerView _updateTitle](self, "_updateTitle");
  }

}

- (UIFont)placeholderFont
{
  return self->_placeholderFont;
}

- (CGSize)intrinsicContentSize
{
  void *v3;
  uint64_t v4;
  void *v5;
  id v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double *v11;
  double v12;
  double v13;
  double v14;
  double v15;
  uint64_t v16;
  uint64_t v17;
  void (*v18)(uint64_t, void *, uint64_t);
  void *v19;
  SFUnifiedTabBarItemTitleContainerView *v20;
  id v21;
  uint64_t *v22;
  _QWORD v23[5];
  uint64_t v24;
  double *v25;
  uint64_t v26;
  void *v27;
  __int128 v28;
  CGSize result;

  v24 = 0;
  v25 = (double *)&v24;
  v26 = 0x3010000000;
  v27 = &unk_18BB4097D;
  v28 = *MEMORY[0x1E0C9D820];
  -[SFUnifiedTabBarItemTitleContainerView _arrangedViews](self, "_arrangedViews");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = MEMORY[0x1E0C809B0];
  v23[0] = MEMORY[0x1E0C809B0];
  v23[1] = 3221225472;
  v23[2] = __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke;
  v23[3] = &unk_1E21E5158;
  v23[4] = self;
  objc_msgSend(v3, "safari_filterObjectsUsingBlock:", v23);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  v16 = v4;
  v17 = 3221225472;
  v18 = __61__SFUnifiedTabBarItemTitleContainerView_intrinsicContentSize__block_invoke_2;
  v19 = &unk_1E21E5180;
  v20 = self;
  v22 = &v24;
  v6 = v5;
  v21 = v6;
  objc_msgSend(v6, "enumerateObjectsUsingBlock:", &v16);
  v7 = v25[4];
  v8 = v25[5];
  if (v7 != 0.0 && v8 != 0.0)
  {
    -[SFUnifiedTabBarItemTitleContainerView _effectiveLayoutMargins](self, "_effectiveLayoutMargins", v16, v17, v18, v19, v20);
    v11 = v25;
    v7 = v9 + v10 + v25[4];
    v8 = v12 + v13 + v25[5];
    v25[4] = v7;
    v11[5] = v8;
  }

  _Block_object_dispose(&v24, 8);
  v14 = v7;
  v15 = v8;
  result.height = v15;
  result.width = v14;
  return result;
}

- (UIEdgeInsets)_effectiveLayoutMargins
{
  double v2;
  double v3;
  double v4;
  double v5;
  UIEdgeInsets result;

  if (self->_usesInsetFromLayoutMargins)
  {
    -[SFUnifiedTabBarItemTitleContainerView layoutMargins](self, "layoutMargins");
  }
  else
  {
    v2 = *MEMORY[0x1E0DC49E8];
    v3 = *(double *)(MEMORY[0x1E0DC49E8] + 8);
    v4 = *(double *)(MEMORY[0x1E0DC49E8] + 16);
    v5 = *(double *)(MEMORY[0x1E0DC49E8] + 24);
  }
  result.right = v5;
  result.bottom = v4;
  result.left = v3;
  result.top = v2;
  return result;
}

- (void)traitCollectionDidChange:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  char v8;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  v4 = a3;
  -[SFUnifiedTabBarItemTitleContainerView traitCollectionDidChange:](&v9, sel_traitCollectionDidChange_, v4);
  objc_msgSend(v4, "preferredContentSizeCategory", v9.receiver, v9.super_class);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  -[SFUnifiedTabBarItemTitleContainerView traitCollection](self, "traitCollection");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "preferredContentSizeCategory");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = objc_msgSend(v5, "isEqual:", v7);

  if ((v8 & 1) == 0)
  {
    -[SFUnifiedTabBarItemTitleContainerView _updateSquishedAccessorySymbolConfigurations](self, "_updateSquishedAccessorySymbolConfigurations");
    -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

void __59__SFUnifiedTabBarItemTitleContainerView_initWithAlignment___block_invoke(uint64_t a1)
{
  id WeakRetained;
  id v2;

  WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    v2 = WeakRetained;
    objc_msgSend(WeakRetained, "_updateIconSpacing");
    WeakRetained = v2;
  }

}

- (void)setAlignment:(int64_t)a3
{
  if (self->_alignment != a3)
  {
    self->_alignment = a3;
    -[SFUnifiedTabBarItemTitleContainerView _updateAlignmentForAvailabilityLabel:](self, "_updateAlignmentForAvailabilityLabel:", self->_availabilityLabel);
    -[SFUnifiedTabBarItemTitleContainerView _updateIconSpacing](self, "_updateIconSpacing");
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setLeadingAlignsIcon:(BOOL)a3
{
  if (self->_leadingAlignsIcon != a3)
  {
    self->_leadingAlignsIcon = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setIcon:(id)a3
{
  UIImage *v5;
  UIImage *v6;

  v5 = (UIImage *)a3;
  if (self->_icon != v5)
  {
    v6 = v5;
    objc_storeStrong((id *)&self->_icon, a3);
    -[SFUnifiedTabBarItemTitleContainerView _updateIcon](self, "_updateIcon");
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
    -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
    v5 = v6;
  }

}

- (void)setTitleWhenCollapsed:(id)a3
{
  NSString *v4;
  NSString *titleWhenCollapsed;
  id v6;

  v6 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    v4 = (NSString *)objc_msgSend(v6, "copy");
    titleWhenCollapsed = self->_titleWhenCollapsed;
    self->_titleWhenCollapsed = v4;

    -[SFUnifiedTabBarItemTitleContainerView _updateTitle](self, "_updateTitle");
  }

}

uint64_t __50__SFUnifiedTabBarItemTitleContainerView_setTitle___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setPlaceholderFont:(id)a3
{
  id v5;

  v5 = a3;
  if ((WBSIsEqual() & 1) == 0)
  {
    objc_storeStrong((id *)&self->_placeholderFont, a3);
    -[SFUnifiedTabBarItemTitleContainerView _updateTitleFont](self, "_updateTitleFont");
  }

}

- (void)setShowsIcon:(BOOL)a3
{
  if (self->_showsIcon != a3)
  {
    self->_showsIcon = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
    -[SFUnifiedTabBarItemTitleContainerView invalidateIntrinsicContentSize](self, "invalidateIntrinsicContentSize");
  }
}

- (void)setIconAlpha:(double)a3
{
  if (self->_iconAlpha != a3)
  {
    self->_iconAlpha = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

uint64_t __58__SFUnifiedTabBarItemTitleContainerView_setShowsLockIcon___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setLockIconEdge:(int64_t)a3
{
  if (self->_lockIconEdge != a3)
  {
    self->_lockIconEdge = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)_updateSecurityAnnotationAnimated:(BOOL)a3
{
  _BOOL4 v3;
  _QWORD v5[5];

  if (self->_securityAnnotation)
  {
    v3 = a3;
    -[SFUnifiedTabBarItemTitleContainerView _updateSecurityAnnotation](self, "_updateSecurityAnnotation");
    if (v3)
    {
      v5[0] = MEMORY[0x1E0C809B0];
      v5[1] = 3221225472;
      v5[2] = __75__SFUnifiedTabBarItemTitleContainerView__updateSecurityAnnotationAnimated___block_invoke;
      v5[3] = &unk_1E21E2050;
      v5[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "_animateUsingDefaultTimingWithOptions:animations:completion:", 0, v5, 0);
    }
  }
}

uint64_t __75__SFUnifiedTabBarItemTitleContainerView__updateSecurityAnnotationAnimated___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setSearchField:(id)a3
{
  UITextField *v5;
  UITextField *searchField;
  SFUnifiedTabBarItemTitleContainerView *v7;
  void *v8;
  UITextField *v9;
  _QWORD v10[5];
  UITextField *v11;

  v5 = (UITextField *)a3;
  searchField = self->_searchField;
  if (searchField != v5)
  {
    v9 = v5;
    -[UITextField superview](searchField, "superview");
    v7 = (SFUnifiedTabBarItemTitleContainerView *)objc_claimAutoreleasedReturnValue();

    if (v7 == self)
      -[UITextField removeFromSuperview](self->_searchField, "removeFromSuperview");
    objc_storeStrong((id *)&self->_searchField, a3);
    v5 = v9;
    if (v9)
    {
      v8 = (void *)MEMORY[0x1E0DC3F10];
      v10[0] = MEMORY[0x1E0C809B0];
      v10[1] = 3221225472;
      v10[2] = __56__SFUnifiedTabBarItemTitleContainerView_setSearchField___block_invoke;
      v10[3] = &unk_1E21E2258;
      v10[4] = self;
      v11 = v9;
      objc_msgSend(v8, "performWithoutAnimation:", v10);

      return;
    }
    self->_showsSearchField = 0;
  }

}

uint64_t __56__SFUnifiedTabBarItemTitleContainerView_setSearchField___block_invoke(uint64_t a1)
{
  uint64_t v2;
  const __CFString *v3;
  void *v4;

  objc_msgSend(*(id *)(a1 + 32), "addSubview:", *(_QWORD *)(a1 + 40));
  v2 = *(_QWORD *)(a1 + 32);
  if (*(_BYTE *)(v2 + 530))
    v3 = &stru_1E21FE780;
  else
    v3 = *(const __CFString **)(v2 + 576);
  objc_msgSend(*(id *)(a1 + 40), "setText:", v3);
  objc_msgSend(*(id *)(a1 + 32), "_titleFontWithTraitCollection:", 0);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(*(id *)(a1 + 40), "setFont:", v4);

  objc_msgSend(*(id *)(a1 + 32), "_updateSearchFieldColor");
  objc_msgSend(*(id *)(a1 + 32), "setNeedsLayout");
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (void)setShowsSearchField:(BOOL)a3
{
  if (self->_showsSearchField != a3)
  {
    self->_showsSearchField = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setSuppressesText:(BOOL)a3
{
  if (self->_suppressesText != a3)
  {
    self->_suppressesText = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (void)setHidesIconForHover:(BOOL)a3
{
  if (self->_hidesIconForHover != a3)
  {
    self->_hidesIconForHover = a3;
    -[SFUnifiedTabBarItemTitleContainerView _layoutArrangedViews](self, "_layoutArrangedViews");
  }
}

- (CGRect)iconFrame
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SFFaviconView frame](self->_iconView, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (void)setDimsText:(BOOL)a3
{
  if (self->_dimsText != a3)
  {
    self->_dimsText = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (BOOL)_iconIsSymbol
{
  return -[UIImage isSymbolImage](self->_icon, "isSymbolImage")
      || -[UIImage sf_isMonogram](self->_icon, "sf_isMonogram")
      || -[UIImage renderingMode](self->_icon, "renderingMode") == UIImageRenderingModeAlwaysTemplate;
}

- (double)leadingIconOffset
{
  return 0.0;
}

- (id)_titleFontWithTraitCollection:(id)a3
{
  return (id)objc_msgSend(MEMORY[0x1E0DC1350], "preferredFontForTextStyle:compatibleWithTraitCollection:", self->_titleTextStyle, a3);
}

- (double)minimumWidthToShowTitle
{
  double v3;
  double v4;
  double v5;

  -[SFUnifiedTabBarItemTitleContainerView _effectiveLayoutMargins](self, "_effectiveLayoutMargins");
  v4 = v3;
  -[SFUnifiedTabBarItemTitleContainerView _iconSize](self, "_iconSize");
  return v4 + v5 + self->_iconSpacing + 15.0;
}

uint64_t __61__SFUnifiedTabBarItemTitleContainerView__layoutArrangedViews__block_invoke_4(uint64_t a1)
{
  double v2;

  v2 = 0.0;
  if (*(_BYTE *)(a1 + 48) && !*(_BYTE *)(a1 + 49))
    objc_msgSend(*(id *)(a1 + 40), "_alphaForView:", *(_QWORD *)(a1 + 32), 0.0);
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", v2);
}

uint64_t __59__SFUnifiedTabBarItemTitleContainerView__layOutSearchField__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 648), "layoutIfNeeded");
}

- (void)_layOutFakeClearButtonUsingPresentationFrame:(BOOL)a3
{
  _BOOL4 v3;
  UITextField *searchField;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  double v12;
  double v13;
  void *v14;
  void *v15;
  double MaxX;
  UIButton *fakeClearButton;
  __int128 v18;
  double v19;
  _QWORD v20[5];
  _OWORD v21[3];
  CGRect v22;
  CGRect v23;

  if (self->_fakeClearButton)
  {
    v3 = a3;
    searchField = self->_searchField;
    -[SFUnifiedTabBarItemTitleContainerView _searchFieldFrame](self, "_searchFieldFrame");
    -[UITextField clearButtonRectForBounds:](searchField, "clearButtonRectForBounds:");
    v7 = v6;
    v9 = v8;
    v11 = v10;
    v13 = v12;
    if (v3)
    {
      -[SFUnifiedTabBarItemTitleContainerView layer](self, "layer");
      v14 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v14, "presentationLayer");
      v15 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v15, "frame");
      MaxX = CGRectGetMaxX(v22);
      -[SFUnifiedTabBarItemTitleContainerView frame](self, "frame");
      v7 = v7 + MaxX - CGRectGetMaxX(v23);

    }
    fakeClearButton = self->_fakeClearButton;
    v18 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v21[0] = *MEMORY[0x1E0C9BAA8];
    v21[1] = v18;
    v21[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    -[UIButton setTransform:](fakeClearButton, "setTransform:", v21);
    -[UIButton setFrame:](self->_fakeClearButton, "setFrame:", v7, v9, v11, v13);
    v19 = 0.0;
    if (self->_showsSearchField)
      v19 = 0.1;
    v20[0] = MEMORY[0x1E0C809B0];
    v20[1] = 3221225472;
    v20[2] = __86__SFUnifiedTabBarItemTitleContainerView__layOutFakeClearButtonUsingPresentationFrame___block_invoke;
    v20[3] = &unk_1E21E2050;
    v20[4] = self;
    objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50659424, v20, 0, 0.2, v19);
  }
}

uint64_t __86__SFUnifiedTabBarItemTitleContainerView__layOutFakeClearButtonUsingPresentationFrame___block_invoke(uint64_t a1)
{
  uint64_t v2;
  double v3;
  void *v4;
  uint64_t v5;
  unint64_t v6;
  CGAffineTransform v8;
  CGAffineTransform v9;

  v2 = *(_QWORD *)(a1 + 32);
  v3 = 0.8;
  if (*(_BYTE *)(v2 + 529))
    v3 = 1.0;
  CGAffineTransformMakeScale(&v9, v3, v3);
  v4 = *(void **)(v2 + 504);
  v8 = v9;
  objc_msgSend(v4, "setTransform:", &v8);
  v5 = *(_QWORD *)(a1 + 32);
  LOBYTE(v6) = *(_BYTE *)(v5 + 529);
  return objc_msgSend(*(id *)(v5 + 504), "setAlpha:", (double)v6);
}

- (CGRect)_searchFieldFrame
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

  -[SFUnifiedTabBarItemTitleContainerView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[SFUnifiedTabBarItemTitleContainerView _effectiveLayoutMargins](self, "_effectiveLayoutMargins");
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

- (void)_slideArrangedViewsForSearchField:(double)a3
{
  void *v5;
  uint64_t v6;
  uint64_t v7;
  uint64_t v8;
  uint64_t i;
  void *v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  __int128 v14;
  _BYTE v15[128];
  uint64_t v16;
  CGRect v17;
  CGRect v18;

  v16 = *MEMORY[0x1E0C80C00];
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v14 = 0u;
  -[SFUnifiedTabBarItemTitleContainerView _arrangedViews](self, "_arrangedViews", 0);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
  if (v6)
  {
    v7 = v6;
    v8 = *(_QWORD *)v12;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(_QWORD *)v12 != v8)
          objc_enumerationMutation(v5);
        v10 = *(void **)(*((_QWORD *)&v11 + 1) + 8 * i);
        if (-[SFUnifiedTabBarItemTitleContainerView _shouldSlideArrangedViewForSearchField:](self, "_shouldSlideArrangedViewForSearchField:", v10))
        {
          objc_msgSend(v10, "frame");
          v18 = CGRectOffset(v17, a3, 0.0);
          objc_msgSend(v10, "setFrame:", v18.origin.x, v18.origin.y, v18.size.width, v18.size.height);
        }
      }
      v7 = objc_msgSend(v5, "countByEnumeratingWithState:objects:count:", &v11, v15, 16);
    }
    while (v7);
  }

}

- (BOOL)_shouldSlideArrangedViewForSearchField:(id)a3
{
  return self->_iconView != a3 || self->_alignment == 1;
}

- (void)layoutMarginsDidChange
{
  objc_super v3;

  v3.receiver = self;
  v3.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  -[SFUnifiedTabBarItemTitleContainerView layoutMarginsDidChange](&v3, sel_layoutMarginsDidChange);
  -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
}

- (CGSize)lockSize
{
  double v2;
  double v3;
  CGSize result;

  if (self->_showsLockIcon)
  {
    -[SFUnifiedTabBarItemTitleContainerView _preferredSizeForView:](self, "_preferredSizeForView:", self->_lockView);
  }
  else
  {
    v2 = *MEMORY[0x1E0C9D820];
    v3 = *(double *)(MEMORY[0x1E0C9D820] + 8);
  }
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)maximumIconWidth
{
  double v2;

  -[SFUnifiedTabBarItemTitleContainerView _preferredSizeForView:](self, "_preferredSizeForView:", self->_iconView);
  return v2 + 6.0;
}

- (CGRect)titleRect
{
  double v2;
  double v3;
  double v4;
  double v5;
  CGRect result;

  -[SFURLLabel frame](self->_titleLabel, "frame");
  result.size.height = v5;
  result.size.width = v4;
  result.origin.y = v3;
  result.origin.x = v2;
  return result;
}

- (CGSize)urlSize
{
  double v2;
  double v3;
  CGSize result;

  -[SFURLLabel urlSize](self->_titleLabel, "urlSize");
  result.height = v3;
  result.width = v2;
  return result;
}

- (double)urlBaselineToBottomBoundsDistanceForHeight:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SFURLLabel urlSize](self->_titleLabel, "urlSize");
  v6 = (a3 - v5) * 0.5;
  -[SFURLLabel baselineOffsetFromBottom](self->_titleLabel, "baselineOffsetFromBottom");
  return v7 + v6;
}

- (double)urlCapHeightToTopBoundsDistanceForHeight:(double)a3
{
  double v5;
  double v6;
  double v7;

  -[SFURLLabel urlSize](self->_titleLabel, "urlSize");
  v6 = (a3 - v5) * 0.5;
  -[SFURLLabel labelCapHeightInsetFromTop](self->_titleLabel, "labelCapHeightInsetFromTop");
  return v7 + v6;
}

- (void)beginTitleTextStyleAnimation
{
  -[SFURLLabel beginTextSizeAnimation](self->_titleLabel, "beginTextSizeAnimation");
}

- (void)endTitleTextStyleAnimation
{
  -[SFURLLabel endTextSizeAnimation](self->_titleLabel, "endTextSizeAnimation");
}

- (void)beginTransitioningSearchField
{
  id v3;

  -[UITextField text](self->_searchField, "text");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView _setShowsFakeClearButton:](self, "_setShowsFakeClearButton:", objc_msgSend(v3, "length") != 0);

}

- (void)endTransitioningSearchField
{
  -[SFUnifiedTabBarItemTitleContainerView _setShowsFakeClearButton:](self, "_setShowsFakeClearButton:", 0);
}

- (BOOL)_showsFakeClearButton
{
  return self->_fakeClearButton != 0;
}

- (void)_setShowsFakeClearButton:(BOOL)a3
{
  _BOOL8 v3;
  void *v5;
  UIButton *v6;
  UIButton *fakeClearButton;
  UIButton *v8;
  void *v9;
  void *v10;
  UIButton *v11;
  _QWORD v12[5];

  v3 = a3;
  if (-[SFUnifiedTabBarItemTitleContainerView _showsFakeClearButton](self, "_showsFakeClearButton") != a3)
  {
    -[UITextField _clearButton](self->_searchField, "_clearButton");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "setHidden:", v3);

    if (v3)
    {
      v6 = (UIButton *)objc_alloc_init(MEMORY[0x1E0DC3518]);
      fakeClearButton = self->_fakeClearButton;
      self->_fakeClearButton = v6;

      v8 = self->_fakeClearButton;
      -[UITextField _clearButton](self->_searchField, "_clearButton");
      v9 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v9, "imageForState:", 0);
      v10 = (void *)objc_claimAutoreleasedReturnValue();
      -[UIButton setImage:forState:](v8, "setImage:forState:", v10, 0);

      -[SFUnifiedTabBarItemTitleContainerView addSubview:](self, "addSubview:", self->_fakeClearButton);
      v12[0] = MEMORY[0x1E0C809B0];
      v12[1] = 3221225472;
      v12[2] = __66__SFUnifiedTabBarItemTitleContainerView__setShowsFakeClearButton___block_invoke;
      v12[3] = &unk_1E21E2050;
      v12[4] = self;
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v12);
    }
    else
    {
      -[UIButton removeFromSuperview](self->_fakeClearButton, "removeFromSuperview");
      v11 = self->_fakeClearButton;
      self->_fakeClearButton = 0;

    }
  }
}

uint64_t __66__SFUnifiedTabBarItemTitleContainerView__setShowsFakeClearButton___block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "_layOutFakeClearButtonUsingPresentationFrame:", 1);
}

- (void)_updateOffsetOfTitleInSearchField
{
  unint64_t v3;
  BOOL v4;
  id v5;
  NSString *textWhenExpanded;
  void *v7;
  void *v8;
  void *v9;
  const __CFAttributedString *v10;
  CFIndex startIndexOfTitleInTextWhenExpanded;
  const __CTLine *v12;
  uint64_t v13;
  _QWORD v14[2];

  v14[1] = *MEMORY[0x1E0C80C00];
  if (-[NSString length](self->_title, "length")
    && -[NSString length](self->_textWhenExpanded, "length")
    && ((v3 = self->_startIndexOfTitleInTextWhenExpanded, v3 != 0x7FFFFFFFFFFFFFFFLL) ? (v4 = v3 == 0) : (v4 = 1), !v4))
  {
    v5 = objc_alloc(MEMORY[0x1E0CB3498]);
    textWhenExpanded = self->_textWhenExpanded;
    v13 = *MEMORY[0x1E0DC1138];
    -[SFUnifiedTabBarItemTitleContainerView traitCollection](self, "traitCollection");
    v7 = (void *)objc_claimAutoreleasedReturnValue();
    -[SFUnifiedTabBarItemTitleContainerView _titleFontWithTraitCollection:](self, "_titleFontWithTraitCollection:", v7);
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    v14[0] = v8;
    objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v14, &v13, 1);
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    v10 = (const __CFAttributedString *)objc_msgSend(v5, "initWithString:attributes:", textWhenExpanded, v9);

    startIndexOfTitleInTextWhenExpanded = self->_startIndexOfTitleInTextWhenExpanded;
    if (-[NSString characterAtIndex:](self->_title, "characterAtIndex:", 0) == 8206)
      ++startIndexOfTitleInTextWhenExpanded;
    v12 = CTLineCreateWithAttributedString(v10);
    self->_offsetOfTitleInSearchField = CTLineGetOffsetForStringIndex(v12, startIndexOfTitleInTextWhenExpanded, 0);
    CFRelease(v12);

  }
  else
  {
    self->_offsetOfTitleInSearchField = 0.0;
  }
}

- (id)hitTest:(CGPoint)a3 withEvent:(id)a4
{
  void *v5;
  void *v6;
  id v7;
  objc_super v9;

  v9.receiver = self;
  v9.super_class = (Class)SFUnifiedTabBarItemTitleContainerView;
  -[SFUnifiedTabBarItemTitleContainerView hitTest:withEvent:](&v9, sel_hitTest_withEvent_, a4, a3.x, a3.y);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  v6 = v5;
  if (self->_showsSearchField && objc_msgSend(v5, "isDescendantOfView:", self->_searchField))
    v7 = v6;
  else
    v7 = 0;

  return v7;
}

- (NSArray)squishedAccessoryViews
{
  void *v3;
  void *v4;
  void *v5;
  _QWORD v7[3];

  v7[2] = *MEMORY[0x1E0C80C00];
  -[SFUnifiedTabBarItemTitleContainerView _squishedIconView](self, "_squishedIconView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v7[0] = v3;
  -[SFUnifiedTabBarItemTitleContainerView _squishedLockView](self, "_squishedLockView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v7[1] = v4;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v7, 2);
  v5 = (void *)objc_claimAutoreleasedReturnValue();

  return (NSArray *)v5;
}

- (void)setShowsSquishedAccessoryViews:(BOOL)a3
{
  if (self->_showsSquishedAccessoryViews != a3)
  {
    self->_showsSquishedAccessoryViews = a3;
    -[SFUnifiedTabBarItemTitleContainerView setNeedsLayout](self, "setNeedsLayout");
  }
}

- (id)_squishedIconView
{
  UIImageView *squishedIconView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;

  squishedIconView = self->_squishedIconView;
  if (!squishedIconView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("magnifyingglass"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_squishedIconView;
    self->_squishedIconView = v6;

    -[SFUnifiedTabBarItemTitleContainerView _squishedAccessorySymbolConfiguration](self, "_squishedAccessorySymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_squishedIconView, "setPreferredSymbolConfiguration:", v8);

    -[SFUnifiedTabBarItemTitleContainerViewTheme primaryTextColor](self->_theme, "primaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_squishedIconView, "setTintColor:", v9);

    squishedIconView = self->_squishedIconView;
  }
  return squishedIconView;
}

- (id)_squishedLockView
{
  UIImageView *squishedLockView;
  id v4;
  void *v5;
  UIImageView *v6;
  UIImageView *v7;
  void *v8;
  void *v9;

  squishedLockView = self->_squishedLockView;
  if (!squishedLockView)
  {
    v4 = objc_alloc(MEMORY[0x1E0DC3890]);
    objc_msgSend(MEMORY[0x1E0DC3870], "systemImageNamed:", CFSTR("lock.fill"));
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v6 = (UIImageView *)objc_msgSend(v4, "initWithImage:", v5);
    v7 = self->_squishedLockView;
    self->_squishedLockView = v6;

    -[SFUnifiedTabBarItemTitleContainerView _squishedAccessorySymbolConfiguration](self, "_squishedAccessorySymbolConfiguration");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setPreferredSymbolConfiguration:](self->_squishedLockView, "setPreferredSymbolConfiguration:", v8);

    -[SFUnifiedTabBarItemTitleContainerViewTheme secondaryTextColor](self->_theme, "secondaryTextColor");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    -[UIImageView setTintColor:](self->_squishedLockView, "setTintColor:", v9);

    squishedLockView = self->_squishedLockView;
  }
  return squishedLockView;
}

- (id)_squishedAccessorySymbolConfiguration
{
  NSString *titleTextStyle;
  void *v4;
  void *v5;
  void *v6;
  double v7;
  double v8;
  double v9;
  double v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  void *v15;

  titleTextStyle = self->_titleTextStyle;
  v4 = (void *)MEMORY[0x1E0DC1350];
  objc_msgSend(MEMORY[0x1E0DC3E88], "traitCollectionWithPreferredContentSizeCategory:", *MEMORY[0x1E0DC4918]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "preferredFontForTextStyle:compatibleWithTraitCollection:", titleTextStyle, v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  +[SFUnifiedBarMetrics minimumSquishScale](SFUnifiedBarMetrics, "minimumSquishScale");
  v8 = v7;
  objc_msgSend(v6, "pointSize");
  v10 = ceil(v8 * v9);
  objc_msgSend(MEMORY[0x1E0DC37F8], "metricsForTextStyle:", self->_titleTextStyle);
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView traitCollection](self, "traitCollection");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "scaledValueForValue:compatibleWithTraitCollection:", v12, v10);
  v14 = v13;

  objc_msgSend(MEMORY[0x1E0DC3888], "configurationWithPointSize:weight:scale:", 4, 1, v14);
  v15 = (void *)objc_claimAutoreleasedReturnValue();

  return v15;
}

- (void)_updateSquishedAccessorySymbolConfigurations
{
  id v3;

  -[SFUnifiedTabBarItemTitleContainerView _squishedAccessorySymbolConfiguration](self, "_squishedAccessorySymbolConfiguration");
  v3 = (id)objc_claimAutoreleasedReturnValue();
  -[UIImageView setPreferredSymbolConfiguration:](self->_squishedIconView, "setPreferredSymbolConfiguration:", v3);
  -[UIImageView setPreferredSymbolConfiguration:](self->_squishedLockView, "setPreferredSymbolConfiguration:", v3);

}

- (void)presentAvailabilityLabelWithText:(id)a3
{
  id v4;
  NSLayoutConstraint *availabilityLabelAlignmentConstraint;
  SFURLLabel *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  SFURLLabel *availabilityLabel;
  SFURLLabel *v19;
  void *v20;
  uint64_t v21;
  SFURLLabel *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  SFURLLabel *v31;
  _QWORD v32[5];
  _QWORD v33[4];
  SFURLLabel *v34;
  _QWORD v35[4];
  SFURLLabel *v36;
  SFUnifiedTabBarItemTitleContainerView *v37;
  _QWORD v38[6];

  v38[4] = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v31 = self->_availabilityLabel;
  if (v31)
  {
    availabilityLabelAlignmentConstraint = self->_availabilityLabelAlignmentConstraint;
    self->_availabilityLabelAlignmentConstraint = 0;

  }
  v6 = objc_alloc_init(SFURLLabel);
  -[SFURLLabel setAdjustsFontForContentSizeCategory:](v6, "setAdjustsFontForContentSizeCategory:", 1);
  -[SFURLLabel setFadeOutEdge:](v6, "setFadeOutEdge:", 1);
  -[SFUnifiedTabBarItemTitleContainerView _titleFontWithTraitCollection:](self, "_titleFontWithTraitCollection:", 0);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel setFont:](v6, "setFont:", v7);

  -[SFUnifiedTabBarItemTitleContainerViewTheme primaryTextColor](self->_theme, "primaryTextColor");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel setTextColor:](v6, "setTextColor:", v8);

  -[SFURLLabel setTranslatesAutoresizingMaskIntoConstraints:](v6, "setTranslatesAutoresizingMaskIntoConstraints:", 0);
  -[SFURLLabel setText:](v6, "setText:", v4);
  -[SFUnifiedTabBarItemTitleContainerView addSubview:](self, "addSubview:", v6);
  -[SFUnifiedTabBarItemTitleContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  v23 = (void *)MEMORY[0x1E0CB3718];
  -[SFURLLabel leadingAnchor](v6, "leadingAnchor");
  v28 = (void *)objc_claimAutoreleasedReturnValue();
  v29 = v9;
  objc_msgSend(v9, "leadingAnchor");
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v28, "constraintGreaterThanOrEqualToAnchor:", v27);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  v38[0] = v26;
  -[SFURLLabel topAnchor](v6, "topAnchor");
  v25 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView topAnchor](self, "topAnchor");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v25, "constraintEqualToAnchor:", v24);
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  v38[1] = v10;
  objc_msgSend(v9, "trailingAnchor");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel trailingAnchor](v6, "trailingAnchor");
  v30 = v4;
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "constraintGreaterThanOrEqualToAnchor:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v38[2] = v13;
  -[SFUnifiedTabBarItemTitleContainerView bottomAnchor](self, "bottomAnchor");
  v14 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFURLLabel bottomAnchor](v6, "bottomAnchor");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v14, "constraintEqualToAnchor:", v15);
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  v38[3] = v16;
  objc_msgSend(MEMORY[0x1E0C99D20], "arrayWithObjects:count:", v38, 4);
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "activateConstraints:", v17);

  -[SFUnifiedTabBarItemTitleContainerView _updateAlignmentForAvailabilityLabel:](self, "_updateAlignmentForAvailabilityLabel:", v6);
  -[SFUnifiedTabBarItemTitleContainerView layoutIfNeeded](self, "layoutIfNeeded");
  availabilityLabel = self->_availabilityLabel;
  self->_availabilityLabel = v6;
  v19 = v6;

  v20 = (void *)MEMORY[0x1E0DC3F10];
  v21 = MEMORY[0x1E0C809B0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke;
  v35[3] = &unk_1E21E2258;
  v36 = v31;
  v37 = self;
  v33[0] = v21;
  v33[1] = 3221225472;
  v33[2] = __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_2;
  v33[3] = &unk_1E21E2190;
  v34 = v36;
  v22 = v36;
  objc_msgSend(v20, "animateWithDuration:delay:options:animations:completion:", 50331648, v35, v33, 0.2, 0.0);
  -[SFURLLabel setAlpha:](self->_availabilityLabel, "setAlpha:", 0.0);
  v32[0] = v21;
  v32[1] = 3221225472;
  v32[2] = __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_3;
  v32[3] = &unk_1E21E2050;
  v32[4] = self;
  objc_msgSend(MEMORY[0x1E0DC3F10], "animateWithDuration:delay:options:animations:completion:", 50331648, v32, 0, 0.5, 0.06);

}

uint64_t __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  return objc_msgSend(*(id *)(a1 + 40), "_layoutArrangedViews");
}

uint64_t __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_2(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __74__SFUnifiedTabBarItemTitleContainerView_presentAvailabilityLabelWithText___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 480), "setAlpha:", (double)objc_msgSend(*(id *)(a1 + 32), "_shouldShowAvailabilityLabel"));
}

- (void)dismissAvailabilityLabelAnimated:(BOOL)a3 withCompletionHandler:(id)a4
{
  _BOOL4 v4;
  id v6;
  uint64_t v7;
  id v8;
  void *v9;
  void *v10;
  SFURLLabel *availabilityLabel;
  SFURLLabel *v12;
  SFURLLabel *v13;
  NSLayoutConstraint *availabilityLabelAlignmentConstraint;
  SFURLLabel *v15;
  void *v16;
  void *v17;
  uint64_t v18;
  uint64_t v19;
  void (*v20)(uint64_t);
  void *v21;
  SFURLLabel *v22;
  SFUnifiedTabBarItemTitleContainerView *v23;
  id v24;
  uint64_t aBlock;
  uint64_t v26;
  uint64_t (*v27)(uint64_t);
  void *v28;
  id v29;

  v4 = a3;
  v6 = a4;
  v7 = MEMORY[0x1E0C809B0];
  aBlock = MEMORY[0x1E0C809B0];
  v26 = 3221225472;
  v27 = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke;
  v28 = &unk_1E21E4698;
  v8 = v6;
  v29 = v8;
  v9 = _Block_copy(&aBlock);
  v10 = v9;
  availabilityLabel = self->_availabilityLabel;
  if (availabilityLabel)
  {
    v12 = availabilityLabel;
    v13 = self->_availabilityLabel;
    self->_availabilityLabel = 0;

    availabilityLabelAlignmentConstraint = self->_availabilityLabelAlignmentConstraint;
    self->_availabilityLabelAlignmentConstraint = 0;

    v18 = v7;
    v19 = 3221225472;
    v20 = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_2;
    v21 = &unk_1E21E2280;
    v22 = v12;
    v23 = self;
    v24 = v10;
    v15 = v12;
    v16 = _Block_copy(&v18);
    v17 = v16;
    if (v4)
      (*((void (**)(void *))v16 + 2))(v16);
    else
      objc_msgSend(MEMORY[0x1E0DC3F10], "performWithoutAnimation:", v16, v18, v19, v20, v21, v22, v23, v24, aBlock, v26, v27, v28);

  }
  else
  {
    (*((void (**)(void *))v9 + 2))(v9);
  }

}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke(uint64_t a1)
{
  uint64_t result;

  result = *(_QWORD *)(a1 + 32);
  if (result)
    return (*(uint64_t (**)(void))(result + 16))();
  return result;
}

void __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  void *v3;
  void *v4;
  void *v5;
  _QWORD v6[4];
  id v7;
  _QWORD v8[5];
  _QWORD v9[4];
  id v10;
  _QWORD v11[4];
  id v12;

  v2 = MEMORY[0x1E0C809B0];
  v3 = (void *)MEMORY[0x1E0DC3F10];
  v11[0] = MEMORY[0x1E0C809B0];
  v11[1] = 3221225472;
  v11[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_3;
  v11[3] = &unk_1E21E2050;
  v12 = *(id *)(a1 + 32);
  v9[0] = v2;
  v9[1] = 3221225472;
  v9[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_4;
  v9[3] = &unk_1E21E2190;
  v10 = *(id *)(a1 + 32);
  objc_msgSend(v3, "animateWithDuration:delay:options:animations:completion:", 50331648, v11, v9, 0.2, 0.0);
  v4 = (void *)MEMORY[0x1E0DC3F10];
  v8[0] = v2;
  v8[1] = 3221225472;
  v8[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_5;
  v8[3] = &unk_1E21E2050;
  v5 = *(void **)(a1 + 48);
  v8[4] = *(_QWORD *)(a1 + 40);
  v6[0] = v2;
  v6[1] = 3221225472;
  v6[2] = __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_6;
  v6[3] = &unk_1E21E2608;
  v7 = v5;
  objc_msgSend(v4, "animateWithDuration:delay:options:animations:completion:", 50331648, v8, v6, 0.5, 0.06);

}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_3(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_4(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "removeFromSuperview");
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_5(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "_layoutArrangedViews");
  return objc_msgSend(*(id *)(a1 + 32), "_layoutSquishedAccessoryViews");
}

uint64_t __96__SFUnifiedTabBarItemTitleContainerView_dismissAvailabilityLabelAnimated_withCompletionHandler___block_invoke_6(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)_updateAlignmentForAvailabilityLabel:(id)a3
{
  id v4;
  int64_t alignment;
  void *v6;
  void *v7;
  NSLayoutConstraint *v8;
  void *v9;
  NSLayoutConstraint *v10;
  NSLayoutConstraint *availabilityLabelAlignmentConstraint;
  id v12;

  v4 = a3;
  if (v4)
  {
    v12 = v4;
    -[NSLayoutConstraint setActive:](self->_availabilityLabelAlignmentConstraint, "setActive:", 0);
    alignment = self->_alignment;
    if (alignment == 1)
    {
      objc_msgSend(v12, "centerXAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFUnifiedTabBarItemTitleContainerView centerXAnchor](self, "centerXAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:", v7);
      v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      if (alignment)
      {
LABEL_10:
        -[NSLayoutConstraint setActive:](self->_availabilityLabelAlignmentConstraint, "setActive:", 1);
        v4 = v12;
        goto LABEL_11;
      }
      if (!self->_showsIcon && !self->_showsSearchIcon)
      {
        objc_msgSend(v12, "leadingAnchor");
        v6 = (void *)objc_claimAutoreleasedReturnValue();
        -[SFUnifiedTabBarItemTitleContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "leadingAnchor");
        v9 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v6, "constraintEqualToAnchor:", v9);
        v10 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
        availabilityLabelAlignmentConstraint = self->_availabilityLabelAlignmentConstraint;
        self->_availabilityLabelAlignmentConstraint = v10;

        goto LABEL_9;
      }
      objc_msgSend(v12, "leadingAnchor");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      -[SFFaviconView trailingAnchor](self->_iconView, "trailingAnchor");
      v7 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v6, "constraintEqualToAnchor:constant:", v7, self->_iconSpacing);
      v8 = (NSLayoutConstraint *)objc_claimAutoreleasedReturnValue();
    }
    v9 = self->_availabilityLabelAlignmentConstraint;
    self->_availabilityLabelAlignmentConstraint = v8;
LABEL_9:

    goto LABEL_10;
  }
LABEL_11:

}

- (BOOL)requiresTruncationToDisplayAvailabilityLabel:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  void *v7;
  const __CFAttributedString *v8;
  const __CTLine *v9;
  CGFloat x;
  CGFloat y;
  CGFloat width;
  CGFloat height;
  double v14;
  void *v15;
  uint64_t v17;
  _QWORD v18[2];
  CGRect BoundsWithOptions;
  CGRect v20;
  CGRect v21;

  v18[1] = *MEMORY[0x1E0C80C00];
  v17 = *MEMORY[0x1E0DC1138];
  v4 = a3;
  -[SFUnifiedTabBarItemTitleContainerView traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  -[SFUnifiedTabBarItemTitleContainerView _titleFontWithTraitCollection:](self, "_titleFontWithTraitCollection:", v5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v18[0] = v6;
  objc_msgSend(MEMORY[0x1E0C99D80], "dictionaryWithObjects:forKeys:count:", v18, &v17, 1);
  v7 = (void *)objc_claimAutoreleasedReturnValue();

  v8 = (const __CFAttributedString *)objc_msgSend(objc_alloc(MEMORY[0x1E0CB3498]), "initWithString:attributes:", v4, v7);
  v9 = CTLineCreateWithAttributedString(v8);
  BoundsWithOptions = CTLineGetBoundsWithOptions(v9, 0);
  x = BoundsWithOptions.origin.x;
  y = BoundsWithOptions.origin.y;
  width = BoundsWithOptions.size.width;
  height = BoundsWithOptions.size.height;
  CFRelease(v9);
  v20.origin.x = x;
  v20.origin.y = y;
  v20.size.width = width;
  v20.size.height = height;
  v14 = CGRectGetWidth(v20);
  -[SFUnifiedTabBarItemTitleContainerView layoutMarginsGuide](self, "layoutMarginsGuide");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "layoutFrame");
  LOBYTE(self) = v14 > CGRectGetWidth(v21);

  return (char)self;
}

- (UIImage)icon
{
  return self->_icon;
}

- (BOOL)showsIcon
{
  return self->_showsIcon;
}

- (double)iconAlpha
{
  return self->_iconAlpha;
}

- (NSString)titleWhenCollapsed
{
  return self->_titleWhenCollapsed;
}

- (NSString)textWhenExpanded
{
  return self->_textWhenExpanded;
}

- (void)setTextWhenExpanded:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 576);
}

- (unint64_t)startIndexOfTitleInTextWhenExpanded
{
  return self->_startIndexOfTitleInTextWhenExpanded;
}

- (void)setStartIndexOfTitleInTextWhenExpanded:(unint64_t)a3
{
  self->_startIndexOfTitleInTextWhenExpanded = a3;
}

- (NSString)placeholder
{
  return self->_placeholder;
}

- (BOOL)showsSearchIcon
{
  return self->_showsSearchIcon;
}

- (BOOL)showsPrivateAnnotation
{
  return self->_showsPrivateAnnotation;
}

- (BOOL)hasFocusedSensitiveInputField
{
  return self->_hasFocusedSensitiveInputField;
}

- (int64_t)securityAnnotation
{
  return self->_securityAnnotation;
}

- (BOOL)usesInsetFromLayoutMargins
{
  return self->_usesInsetFromLayoutMargins;
}

- (BOOL)isAnimatingResize
{
  return self->_animatingResize;
}

- (void)setAnimatingResize:(BOOL)a3
{
  self->_animatingResize = a3;
}

- (BOOL)isNarrow
{
  return self->_narrow;
}

- (double)spacing
{
  return self->_spacing;
}

- (void)setSpacing:(double)a3
{
  self->_spacing = a3;
}

- (double)titleToSearchIconSpacing
{
  return self->_titleToSearchIconSpacing;
}

- (double)contentOffset
{
  return self->_contentOffset;
}

- (void)setContentOffset:(double)a3
{
  self->_contentOffset = a3;
}

- (BOOL)hidesIconForHover
{
  return self->_hidesIconForHover;
}

- (UITextField)searchField
{
  return self->_searchField;
}

- (BOOL)showsSearchField
{
  return self->_showsSearchField;
}

- (BOOL)suppressesText
{
  return self->_suppressesText;
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)dimsText
{
  return self->_dimsText;
}

- (BOOL)showsSquishedAccessoryViews
{
  return self->_showsSquishedAccessoryViews;
}

- (int64_t)alignment
{
  return self->_alignment;
}

- (BOOL)leadingAlignsIcon
{
  return self->_leadingAlignsIcon;
}

- (BOOL)animateLockViewPosition
{
  return self->_animateLockViewPosition;
}

- (int64_t)lockIconEdge
{
  return self->_lockIconEdge;
}

- (BOOL)showsLockIcon
{
  return self->_showsLockIcon;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_theme, 0);
  objc_storeStrong((id *)&self->_searchField, 0);
  objc_storeStrong((id *)&self->_placeholderFont, 0);
  objc_storeStrong((id *)&self->_placeholder, 0);
  objc_storeStrong((id *)&self->_titleTextStyle, 0);
  objc_storeStrong((id *)&self->_textWhenExpanded, 0);
  objc_storeStrong((id *)&self->_title, 0);
  objc_storeStrong((id *)&self->_titleWhenCollapsed, 0);
  objc_storeStrong((id *)&self->_icon, 0);
  objc_storeStrong((id *)&self->_fakeClearButton, 0);
  objc_storeStrong((id *)&self->_availabilityLabelAlignmentConstraint, 0);
  objc_storeStrong((id *)&self->_availabilityLabel, 0);
  objc_storeStrong((id *)&self->_squishedLockView, 0);
  objc_storeStrong((id *)&self->_lockView, 0);
  objc_storeStrong((id *)&self->_trailingAnnotationLabel, 0);
  objc_storeStrong((id *)&self->_leadingAnnotationLabel, 0);
  objc_storeStrong((id *)&self->_squishedIconView, 0);
  objc_storeStrong((id *)&self->_titleLabel, 0);
  objc_storeStrong((id *)&self->_iconView, 0);
}

- (void)_layoutSquishedAccessoryView:(uint64_t)a3 forView:.cold.1(void *a1, void *a2, uint64_t a3)
{
  NSObject *v5;
  void *v6;
  int v7;
  void *v8;
  uint64_t v9;

  v9 = *MEMORY[0x1E0C80C00];
  v5 = a1;
  objc_msgSend(a2, "sf_commonAncestrySummaryWithView:", a3);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = 138412290;
  v8 = v6;
  _os_log_fault_impl(&dword_18B7B2000, v5, OS_LOG_TYPE_FAULT, "Invalid center for squished accessory view:\n%@", (uint8_t *)&v7, 0xCu);

}

@end

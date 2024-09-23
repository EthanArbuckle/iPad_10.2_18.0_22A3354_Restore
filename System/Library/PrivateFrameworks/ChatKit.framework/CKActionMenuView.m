@implementation CKActionMenuView

- (id)description
{
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  objc_super v8;

  v3 = (void *)MEMORY[0x1E0CB3940];
  v8.receiver = self;
  v8.super_class = (Class)CKActionMenuView;
  -[CKActionMenuView description](&v8, sel_description);
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKActionMenuView actionMenuItems](self, "actionMenuItems");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "stringWithFormat:", CFSTR("%@ actionMenuItems: %@ defaultActionIndex: %d"), v4, v5, -[CKActionMenuView defaultActionIndex](self, "defaultActionIndex"));
  v6 = (void *)objc_claimAutoreleasedReturnValue();

  return v6;
}

- (CGSize)sizeThatFits:(CGSize)a3
{
  void *v3;
  double v4;
  double v5;
  double v6;
  CGSize result;

  -[CKActionMenuView actionMenuItems](self, "actionMenuItems", a3.width, a3.height);
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  v4 = (double)(unint64_t)(objc_msgSend(v3, "count") - 1) * 90.0 + 60.0;

  v5 = 60.0;
  v6 = v4;
  result.height = v6;
  result.width = v5;
  return result;
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
  void *v11;
  void *v12;
  double MidX;
  double MidY;
  id v15;
  uint64_t v16;
  uint64_t v17;
  uint64_t v18;
  uint64_t i;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  id v25;
  uint64_t v26;
  uint64_t v27;
  uint64_t v28;
  double v29;
  uint64_t j;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  __int128 v36;
  __int128 v37;
  __int128 v38;
  __int128 v39;
  __int128 v40;
  __int128 v41;
  __int128 v42;
  __int128 v43;
  objc_super v44;
  _BYTE v45[128];
  _BYTE v46[128];
  uint64_t v47;
  CGRect v48;
  CGRect v49;

  v47 = *MEMORY[0x1E0C80C00];
  v44.receiver = self;
  v44.super_class = (Class)CKActionMenuView;
  -[CKActionMenuView layoutSubviews](&v44, sel_layoutSubviews);
  -[CKActionMenuView bounds](self, "bounds");
  v4 = v3;
  v6 = v5;
  v8 = v7;
  v10 = v9;
  -[CKActionMenuView blurView](self, "blurView");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "setFrame:", v4, v6, v8, v10);

  -[CKActionMenuView presentationActionMenuItems](self, "presentationActionMenuItems");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  if (-[CKActionMenuView isCollapsed](self, "isCollapsed"))
  {
    v48.origin.x = v4;
    v48.origin.y = v6;
    v48.size.width = v8;
    v48.size.height = v10;
    MidX = CGRectGetMidX(v48);
    v49.origin.x = v4;
    v49.origin.y = v6;
    v49.size.width = v8;
    v49.size.height = v10;
    MidY = CGRectGetMidY(v49);
    v40 = 0u;
    v41 = 0u;
    v42 = 0u;
    v43 = 0u;
    v15 = v12;
    v16 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
    if (v16)
    {
      v17 = v16;
      v18 = *(_QWORD *)v41;
      do
      {
        for (i = 0; i != v17; ++i)
        {
          if (*(_QWORD *)v41 != v18)
            objc_enumerationMutation(v15);
          v20 = *(void **)(*((_QWORD *)&v40 + 1) + 8 * i);
          objc_msgSend(v20, "view");
          v21 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v21, "layer");
          v22 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v22, "setPosition:", MidX, MidY);

          objc_msgSend(v20, "label");
          v23 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v23, "layer");
          v24 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v24, "setPosition:", 70.0, MidY);

        }
        v17 = objc_msgSend(v15, "countByEnumeratingWithState:objects:count:", &v40, v46, 16);
      }
      while (v17);
    }
  }
  else
  {
    v38 = 0u;
    v39 = 0u;
    v36 = 0u;
    v37 = 0u;
    v25 = v12;
    v26 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
    if (v26)
    {
      v27 = v26;
      v28 = *(_QWORD *)v37;
      v29 = 30.0;
      do
      {
        for (j = 0; j != v27; ++j)
        {
          if (*(_QWORD *)v37 != v28)
            objc_enumerationMutation(v25);
          v31 = *(void **)(*((_QWORD *)&v36 + 1) + 8 * j);
          objc_msgSend(v31, "view", (_QWORD)v36);
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "layer");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v33, "setPosition:", 30.0, v29);

          objc_msgSend(v31, "label");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "layer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setPosition:", 70.0, v29);

          v29 = v29 + 90.0;
        }
        v27 = objc_msgSend(v25, "countByEnumeratingWithState:objects:count:", &v36, v45, 16);
      }
      while (v27);
    }
  }

}

- (CKActionMenuView)initWithActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 blurEffectStyle:(int64_t)a5
{
  id v8;
  CKActionMenuView *v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  objc_super v20;

  v8 = a3;
  v20.receiver = self;
  v20.super_class = (Class)CKActionMenuView;
  v9 = -[CKActionMenuView initWithFrame:](&v20, sel_initWithFrame_, *MEMORY[0x1E0C9D648], *(double *)(MEMORY[0x1E0C9D648] + 8), *(double *)(MEMORY[0x1E0C9D648] + 16), *(double *)(MEMORY[0x1E0C9D648] + 24));
  if (v9)
  {
    objc_msgSend(MEMORY[0x1E0CEA398], "effectWithStyle:", a5);
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    -[CKActionMenuView setBlurEffect:](v9, "setBlurEffect:", v10);

    v11 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0CEABE8]), "initWithEffect:", 0);
    -[CKActionMenuView setBlurView:](v9, "setBlurView:", v11);
    -[CKActionMenuView addSubview:](v9, "addSubview:", v11);
    objc_msgSend(v11, "contentView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setBackgroundColor:", v13);

    objc_msgSend(v11, "contentView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v14, "layer");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v15, "setCompositingFilter:", *MEMORY[0x1E0CD2E50]);

    objc_msgSend(v11, "layer");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setMasksToBounds:", 1);

    objc_msgSend(v11, "layer");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "setCornerRadius:", 30.0);

    -[CKActionMenuView setPresentationTargetBounds:](v9, "setPresentationTargetBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
    -[CKActionMenuView setPresentationActionMenuItems:](v9, "setPresentationActionMenuItems:", v8);
    -[CKActionMenuView setPresentationDefaultActionIndex:](v9, "setPresentationDefaultActionIndex:", a4);
    -[CKActionMenuView setActionMenuItems:defaultActionIndex:animated:](v9, "setActionMenuItems:defaultActionIndex:animated:", v8, a4, 0);
    -[CKActionMenuView setCollapsed:animated:completion:](v9, "setCollapsed:animated:completion:", 1, 0, 0);
    +[CKActionMenuGestureRecognizer actionMenuGestureRecognizer](CKActionMenuGestureRecognizer, "actionMenuGestureRecognizer");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v18, "setMinimumPressDuration:", 0.0);
    -[CKActionMenuView addGestureRecognizer:](v9, "addGestureRecognizer:", v18);

  }
  return v9;
}

- (void)setActionMenuItems:(id)a3 defaultActionIndex:(unint64_t)a4 animated:(BOOL)a5
{
  _BOOL4 v5;
  id v8;
  void *v9;
  double v10;
  void *v11;
  double v12;
  double v13;
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
  void *v24;
  __int128 v25;
  id v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  uint64_t i;
  void *v31;
  void *v32;
  void *v33;
  void *v34;
  void *v35;
  void *v36;
  uint64_t v37;
  id v38;
  id v39;
  void (**v40)(_QWORD);
  id v41;
  id v42;
  void (**v43)(void *, uint64_t);
  id v44;
  _BOOL4 v45;
  _QWORD v46[4];
  id v47;
  id v48;
  _QWORD aBlock[4];
  id v50;
  id v51;
  double v52;
  CGAffineTransform v53;
  __int128 v54;
  __int128 v55;
  __int128 v56;
  __int128 v57;
  CGAffineTransform v58;
  _BYTE v59[128];
  uint64_t v60;
  CGRect v61;

  v5 = a5;
  v60 = *MEMORY[0x1E0C80C00];
  v8 = a3;
  if (objc_msgSend(v8, "count") <= a4)
  {
    objc_msgSend(MEMORY[0x1E0CB3940], "stringWithFormat:", CFSTR("*** %s: defaultActionIndex %d must be a valid index in actionMenuItems %@"), "-[CKActionMenuView setActionMenuItems:defaultActionIndex:animated:]", a4, v8);
    objc_msgSend(MEMORY[0x1E0C99DA0], "exceptionWithName:reason:userInfo:", *MEMORY[0x1E0C99778], objc_claimAutoreleasedReturnValue(), 0);
    v44 = (id)objc_claimAutoreleasedReturnValue();
    objc_exception_throw(v44);
  }
  -[CKActionMenuView actionMenuItems](self, "actionMenuItems");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKActionMenuView setActionMenuItems:](self, "setActionMenuItems:", v8);
  -[CKActionMenuView setDefaultActionIndex:](self, "setDefaultActionIndex:", a4);
  v45 = v5;
  if (-[CKActionMenuView isCollapsed](self, "isCollapsed"))
  {
    memset(&v58, 0, sizeof(v58));
    CGAffineTransformMakeScale(&v58, 0.5, 0.5);
    v10 = 0.0;
  }
  else
  {
    -[CKActionMenuView presentationTargetBounds](self, "presentationTargetBounds");
    if (!CGRectIsNull(v61))
    {
      -[CKActionMenuView layer](self, "layer");
      v11 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v11, "position");
      v13 = v12;
      v15 = v14;

      -[CKActionMenuView presentationTargetPosition](self, "presentationTargetPosition");
      v17 = v16;
      v19 = v18;
      -[CKActionMenuView presentationTargetBounds](self, "presentationTargetBounds");
      -[CKActionMenuView configureForPresentationAtPoint:inRect:](self, "configureForPresentationAtPoint:inRect:", v17, v19, v20, v21, v22, v23);
      -[CKActionMenuView layer](self, "layer");
      v24 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v24, "setPosition:", v13, v15);

    }
    v25 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    *(_OWORD *)&v58.a = *MEMORY[0x1E0C9BAA8];
    *(_OWORD *)&v58.c = v25;
    *(_OWORD *)&v58.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    v10 = 1.0;
  }
  v56 = 0u;
  v57 = 0u;
  v54 = 0u;
  v55 = 0u;
  v26 = v8;
  v27 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
  if (v27)
  {
    v28 = v27;
    v29 = *(_QWORD *)v55;
    do
    {
      for (i = 0; i != v28; ++i)
      {
        if (*(_QWORD *)v55 != v29)
          objc_enumerationMutation(v26);
        v31 = *(void **)(*((_QWORD *)&v54 + 1) + 8 * i);
        if ((objc_msgSend(v9, "ck_containsObjectIdenticalTo:", v31) & 1) == 0)
        {
          objc_msgSend(v31, "view");
          v32 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v32, "setAlpha:", 0.0);
          v53 = v58;
          objc_msgSend(v32, "setTransform:", &v53);
          -[CKActionMenuView blurView](self, "blurView");
          v33 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKActionMenuView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v32, v33);

          objc_msgSend(v31, "label");
          v34 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v34, "setAlpha:", 0.0);
          v53 = v58;
          objc_msgSend(v34, "setTransform:", &v53);
          objc_msgSend(v34, "layer");
          v35 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v35, "setAnchorPoint:", 0.0, 0.5);

          -[CKActionMenuView blurView](self, "blurView");
          v36 = (void *)objc_claimAutoreleasedReturnValue();
          -[CKActionMenuView insertSubview:aboveSubview:](self, "insertSubview:aboveSubview:", v34, v36);

        }
      }
      v28 = objc_msgSend(v26, "countByEnumeratingWithState:objects:count:", &v54, v59, 16);
    }
    while (v28);
  }

  v37 = MEMORY[0x1E0C809B0];
  aBlock[0] = MEMORY[0x1E0C809B0];
  aBlock[1] = 3221225472;
  aBlock[2] = __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke;
  aBlock[3] = &unk_1E274A420;
  v38 = v9;
  v50 = v38;
  v39 = v26;
  v51 = v39;
  v52 = v10;
  v40 = (void (**)(_QWORD))_Block_copy(aBlock);
  v46[0] = v37;
  v46[1] = 3221225472;
  v46[2] = __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke_2;
  v46[3] = &unk_1E274BE58;
  v41 = v38;
  v47 = v41;
  v42 = v39;
  v48 = v42;
  v43 = (void (**)(void *, uint64_t))_Block_copy(v46);
  if (v45)
  {
    +[CKActionMenuItem animate:completion:](CKActionMenuItem, "animate:completion:", v40, v43);
  }
  else
  {
    v40[2](v40);
    v43[2](v43, 1);
  }

}

void __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  id v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  uint64_t j;
  void *v15;
  void *v16;
  void *v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  __int128 v22;
  __int128 v23;
  __int128 v24;
  __int128 v25;
  _BYTE v26[128];
  _BYTE v27[128];
  uint64_t v28;

  v28 = *MEMORY[0x1E0C80C00];
  v22 = 0u;
  v23 = 0u;
  v24 = 0u;
  v25 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v23;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v23 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v22 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "ck_containsObjectIdenticalTo:", v7) & 1) == 0)
        {
          objc_msgSend(v7, "view");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "setAlpha:", 0.0);

          objc_msgSend(v7, "label");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "setAlpha:", 0.0);

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v22, v27, 16);
    }
    while (v4);
  }

  v20 = 0u;
  v21 = 0u;
  v18 = 0u;
  v19 = 0u;
  v10 = *(id *)(a1 + 40);
  v11 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
  if (v11)
  {
    v12 = v11;
    v13 = *(_QWORD *)v19;
    do
    {
      for (j = 0; j != v12; ++j)
      {
        if (*(_QWORD *)v19 != v13)
          objc_enumerationMutation(v10);
        v15 = *(void **)(*((_QWORD *)&v18 + 1) + 8 * j);
        if ((objc_msgSend(*(id *)(a1 + 32), "ck_containsObjectIdenticalTo:", v15, (_QWORD)v18) & 1) == 0)
        {
          objc_msgSend(v15, "view");
          v16 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v16, "setAlpha:", *(double *)(a1 + 48));

          objc_msgSend(v15, "label");
          v17 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v17, "setAlpha:", *(double *)(a1 + 48));

        }
      }
      v12 = objc_msgSend(v10, "countByEnumeratingWithState:objects:count:", &v18, v26, 16);
    }
    while (v12);
  }

}

void __67__CKActionMenuView_setActionMenuItems_defaultActionIndex_animated___block_invoke_2(uint64_t a1)
{
  id v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t i;
  void *v7;
  void *v8;
  void *v9;
  __int128 v10;
  __int128 v11;
  __int128 v12;
  __int128 v13;
  _BYTE v14[128];
  uint64_t v15;

  v15 = *MEMORY[0x1E0C80C00];
  v10 = 0u;
  v11 = 0u;
  v12 = 0u;
  v13 = 0u;
  v2 = *(id *)(a1 + 32);
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v11;
    do
    {
      for (i = 0; i != v4; ++i)
      {
        if (*(_QWORD *)v11 != v5)
          objc_enumerationMutation(v2);
        v7 = *(void **)(*((_QWORD *)&v10 + 1) + 8 * i);
        if ((objc_msgSend(*(id *)(a1 + 40), "ck_containsObjectIdenticalTo:", v7, (_QWORD)v10) & 1) == 0)
        {
          objc_msgSend(v7, "view");
          v8 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v8, "removeFromSuperview");

          objc_msgSend(v7, "label");
          v9 = (void *)objc_claimAutoreleasedReturnValue();
          objc_msgSend(v9, "removeFromSuperview");

        }
      }
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v10, v14, 16);
    }
    while (v4);
  }

}

- (void)presentActionMenuViewFromPoint:(CGPoint)a3 inRect:(CGRect)a4 animated:(BOOL)a5 completion:(id)a6
{
  _BOOL8 v6;
  double height;
  double width;
  double y;
  double x;
  double v11;
  double v12;
  id v14;
  void *v15;
  id v16;

  v6 = a5;
  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v11 = a3.y;
  v12 = a3.x;
  v14 = a6;
  -[CKActionMenuView setPresentationTargetPosition:](self, "setPresentationTargetPosition:", v12, v11);
  -[CKActionMenuView setPresentationTargetBounds:](self, "setPresentationTargetBounds:", x, y, width, height);
  -[CKActionMenuView configureForPresentationAtPoint:inRect:](self, "configureForPresentationAtPoint:inRect:", v12, v11, x, y, width, height);
  -[CKActionMenuView actionMenuItems](self, "actionMenuItems");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "objectAtIndex:", -[CKActionMenuView defaultActionIndex](self, "defaultActionIndex"));
  v16 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend(v16, "updateForState:touchInside:", 1, 1);
  -[CKActionMenuView setTouchInside:](self, "setTouchInside:", 1);
  -[CKActionMenuView setCollapsed:animated:completion:](self, "setCollapsed:animated:completion:", 0, v6, v14);

}

- (void)dismissActionMenuViewAnimated:(BOOL)a3 completion:(id)a4
{
  -[CKActionMenuView setCollapsed:animated:completion:](self, "setCollapsed:animated:completion:", 1, a3, a4);
  -[CKActionMenuView setPresentationTargetPosition:](self, "setPresentationTargetPosition:", *MEMORY[0x1E0C9D538], *(double *)(MEMORY[0x1E0C9D538] + 8));
  -[CKActionMenuView setPresentationTargetBounds:](self, "setPresentationTargetBounds:", *MEMORY[0x1E0C9D628], *(double *)(MEMORY[0x1E0C9D628] + 8), *(double *)(MEMORY[0x1E0C9D628] + 16), *(double *)(MEMORY[0x1E0C9D628] + 24));
}

- (void)actionMenuGestureRecognized:(id)a3
{
  id v4;
  uint64_t v5;
  double v6;
  double v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t v16;
  uint64_t v17;
  __int128 v18;
  __int128 v19;
  __int128 v20;
  __int128 v21;
  _BYTE v22[128];
  uint64_t v23;

  v23 = *MEMORY[0x1E0C80C00];
  v4 = a3;
  v5 = objc_msgSend(v4, "state");
  objc_msgSend(v4, "locationInView:", self);
  v7 = v6;
  v9 = v8;
  objc_msgSend(v4, "velocityInView:", self);
  -[CKActionMenuView actionMenuItemAtPoint:velocity:](self, "actionMenuItemAtPoint:velocity:", v7, v9, v10, v11);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v18 = 0u;
  v19 = 0u;
  v20 = 0u;
  v21 = 0u;
  -[CKActionMenuView actionMenuItems](self, "actionMenuItems", 0);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v14 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
  if (v14)
  {
    v15 = v14;
    v16 = *(_QWORD *)v19;
    do
    {
      v17 = 0;
      do
      {
        if (*(_QWORD *)v19 != v16)
          objc_enumerationMutation(v13);
        objc_msgSend(*(id *)(*((_QWORD *)&v18 + 1) + 8 * v17), "updateForState:touchInside:", v5, *(_QWORD *)(*((_QWORD *)&v18 + 1) + 8 * v17) == (_QWORD)v12);
        ++v17;
      }
      while (v15 != v17);
      v15 = objc_msgSend(v13, "countByEnumeratingWithState:objects:count:", &v18, v22, 16);
    }
    while (v15);
  }

  -[CKActionMenuView setTouchInside:](self, "setTouchInside:", v12 != 0);
}

+ (void)collapseAnimation:(id)a3 completion:(id)a4
{
  id v5;
  dispatch_time_t v6;
  id v7;
  _QWORD block[4];
  id v9;

  v5 = a4;
  objc_msgSend(MEMORY[0x1E0CEABB0], "_animateUsingSpringWithDuration:delay:options:mass:stiffness:damping:initialVelocity:animations:completion:", 6, a3, 0, 1.545, 0.0, 1.0, 400.0, 25.0, 0.0);
  v6 = dispatch_time(0, 300000000);
  block[0] = MEMORY[0x1E0C809B0];
  block[1] = 3221225472;
  block[2] = __49__CKActionMenuView_collapseAnimation_completion___block_invoke;
  block[3] = &unk_1E274AED0;
  v9 = v5;
  v7 = v5;
  dispatch_after(v6, MEMORY[0x1E0C80D38], block);

}

uint64_t __49__CKActionMenuView_collapseAnimation_completion___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(_QWORD *)(a1 + 32) + 16))();
}

- (void)setCollapsed:(BOOL)a3
{
  -[CKActionMenuView setCollapsed:animated:completion:](self, "setCollapsed:animated:completion:", a3, 0, 0);
}

- (void)setCollapsed:(BOOL)a3 animated:(BOOL)a4 completion:(id)a5
{
  _BOOL4 v5;
  _BOOL4 v6;
  id v8;
  void *v9;
  uint64_t v10;
  void *v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  double v18;
  uint64_t v19;
  uint64_t v20;
  __int128 v21;
  uint64_t v22;
  id v23;
  id v24;
  void (**v25)(_QWORD);
  id v26;
  id v27;
  void (**v28)(void *, uint64_t);
  void *v29;
  _BOOL4 v30;
  _QWORD v31[4];
  id v32;
  id v33;
  CKActionMenuView *v34;
  id v35;
  double v36;
  BOOL v37;
  _QWORD aBlock[5];
  id v39;
  id v40;
  uint64_t v41;
  uint64_t v42;
  CGAffineTransform v43;
  double v44;
  BOOL v45;
  BOOL v46;
  __int128 v47;
  __int128 v48;
  __int128 v49;
  __int128 v50;
  CGAffineTransform v51;
  _BYTE v52[128];
  uint64_t v53;

  v5 = a4;
  v6 = a3;
  v53 = *MEMORY[0x1E0C80C00];
  v8 = a5;
  if (self->_collapsed != v6)
  {
    self->_collapsed = v6;
    -[CKActionMenuView actionMenuController](self, "actionMenuController");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "delegate");
    v10 = objc_claimAutoreleasedReturnValue();
    v11 = (void *)v10;
    if (v6)
    {
      v29 = (void *)v10;
      v30 = v5;
      memset(&v51, 0, sizeof(v51));
      CGAffineTransformMakeScale(&v51, 0.5, 0.5);
      v50 = 0u;
      v49 = 0u;
      v48 = 0u;
      v47 = 0u;
      -[CKActionMenuView actionMenuItems](self, "actionMenuItems");
      v12 = (void *)objc_claimAutoreleasedReturnValue();
      v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
      if (v13)
      {
        v14 = v13;
        v15 = *(_QWORD *)v48;
        do
        {
          for (i = 0; i != v14; ++i)
          {
            if (*(_QWORD *)v48 != v15)
              objc_enumerationMutation(v12);
            objc_msgSend(*(id *)(*((_QWORD *)&v47 + 1) + 8 * i), "label");
            v17 = (void *)objc_claimAutoreleasedReturnValue();
            objc_msgSend(v17, "setAlpha:", 0.0);

          }
          v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v47, v52, 16);
        }
        while (v14);
      }

      v18 = 0.0;
      v19 = 0x404E000000000000;
      v20 = 0x404E000000000000;
      v5 = v30;
      v11 = v29;
    }
    else
    {
      -[CKActionMenuView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
      v21 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
      *(_OWORD *)&v51.a = *MEMORY[0x1E0C9BAA8];
      *(_OWORD *)&v51.c = v21;
      *(_OWORD *)&v51.tx = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
      v18 = 1.0;
    }
    v22 = MEMORY[0x1E0C809B0];
    aBlock[0] = MEMORY[0x1E0C809B0];
    aBlock[1] = 3221225472;
    aBlock[2] = __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke;
    aBlock[3] = &unk_1E2756EC8;
    aBlock[4] = self;
    v41 = v19;
    v42 = v20;
    v45 = v6;
    v43 = v51;
    v44 = v18;
    v23 = v11;
    v39 = v23;
    v24 = v9;
    v40 = v24;
    v46 = v5;
    v25 = (void (**)(_QWORD))_Block_copy(aBlock);
    v31[0] = v22;
    v31[1] = 3221225472;
    v31[2] = __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_2;
    v31[3] = &unk_1E2756EF0;
    v35 = v8;
    v37 = v6;
    v26 = v23;
    v32 = v26;
    v27 = v24;
    v33 = v27;
    v34 = self;
    v36 = v18;
    v28 = (void (**)(void *, uint64_t))_Block_copy(v31);
    if (v5)
    {
      +[CKActionMenuView collapseAnimation:completion:](CKActionMenuView, "collapseAnimation:completion:", v25, v28);
    }
    else
    {
      v25[2](v25);
      v28[2](v28, 1);
    }

  }
}

uint64_t __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke(uint64_t a1)
{
  void *v2;
  void *v3;
  void *v4;
  void *v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  void *v10;
  __int128 v11;
  void *v12;
  uint64_t v13;
  uint64_t v14;
  __int128 *v15;
  uint64_t v16;
  uint64_t i;
  void *v18;
  void *v19;
  __int128 v20;
  void *v21;
  __int128 v22;
  uint64_t result;
  __int128 v24;
  __int128 v25;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  __int128 v30;
  _BYTE v31[128];
  uint64_t v32;

  v32 = *MEMORY[0x1E0C80C00];
  objc_msgSend(*(id *)(a1 + 32), "bounds");
  objc_msgSend(*(id *)(a1 + 32), "setBounds:");
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "contentView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  if (*(_BYTE *)(a1 + 128))
  {
    objc_msgSend(MEMORY[0x1E0CEA478], "whiteColor");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v4);
  }
  else
  {
    +[CKUIBehavior sharedBehaviors](CKUIBehavior, "sharedBehaviors");
    v4 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v4, "theme");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "entryFieldAudioRecordingBalloonColor");
    v6 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v3, "setBackgroundColor:", v6);

  }
  objc_msgSend(*(id *)(a1 + 32), "blurView");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  v8 = v7;
  if (*(_BYTE *)(a1 + 128))
  {
    objc_msgSend(v7, "setEffect:", 0);
  }
  else
  {
    objc_msgSend(*(id *)(a1 + 32), "blurEffect");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "setEffect:", v9);

  }
  v10 = *(void **)(a1 + 32);
  v11 = *(_OWORD *)(a1 + 88);
  v28 = *(_OWORD *)(a1 + 72);
  v29 = v11;
  v30 = *(_OWORD *)(a1 + 104);
  objc_msgSend(v10, "setTransform:", &v28);
  v24 = 0u;
  v25 = 0u;
  v26 = 0u;
  v27 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "actionMenuItems", 0);
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  v13 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
  if (v13)
  {
    v14 = v13;
    v15 = (__int128 *)(a1 + 72);
    v16 = *(_QWORD *)v25;
    do
    {
      for (i = 0; i != v14; ++i)
      {
        if (*(_QWORD *)v25 != v16)
          objc_enumerationMutation(v12);
        v18 = *(void **)(*((_QWORD *)&v24 + 1) + 8 * i);
        objc_msgSend(v18, "view");
        v19 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v19, "setAlpha:", *(double *)(a1 + 120));
        v20 = *(_OWORD *)(a1 + 88);
        v28 = *v15;
        v29 = v20;
        v30 = *(_OWORD *)(a1 + 104);
        objc_msgSend(v19, "setTransform:", &v28);
        objc_msgSend(v18, "label");
        v21 = (void *)objc_claimAutoreleasedReturnValue();
        v22 = *(_OWORD *)(a1 + 88);
        v28 = *v15;
        v29 = v22;
        v30 = *(_OWORD *)(a1 + 104);
        objc_msgSend(v21, "setTransform:", &v28);

      }
      v14 = objc_msgSend(v12, "countByEnumeratingWithState:objects:count:", &v24, v31, 16);
    }
    while (v14);
  }

  objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
  if (*(_BYTE *)(a1 + 128))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 40), "actionMenuControllerWillDismissActionMenu:animated:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 129));
  }
  else
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 40), "actionMenuControllerWillPresentActionMenu:animated:", *(_QWORD *)(a1 + 48), *(unsigned __int8 *)(a1 + 129));
  }
  return result;
}

uint64_t __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_2(uint64_t a1)
{
  uint64_t v2;
  uint64_t result;
  _QWORD v4[6];

  v2 = *(_QWORD *)(a1 + 56);
  if (v2)
    (*(void (**)(void))(v2 + 16))();
  if (*(_BYTE *)(a1 + 72))
  {
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "actionMenuControllerDidDismissActionMenu:", *(_QWORD *)(a1 + 40));
  }
  else
  {
    v4[0] = MEMORY[0x1E0C809B0];
    v4[1] = 3221225472;
    v4[2] = __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_3;
    v4[3] = &unk_1E274C9C0;
    v4[4] = *(_QWORD *)(a1 + 48);
    v4[5] = *(_QWORD *)(a1 + 64);
    objc_msgSend(MEMORY[0x1E0CEABB0], "animateWithDuration:animations:", v4, 0.3);
    result = objc_opt_respondsToSelector();
    if ((result & 1) != 0)
      return objc_msgSend(*(id *)(a1 + 32), "actionMenuControllerDidPresentActionMenu:", *(_QWORD *)(a1 + 40));
  }
  return result;
}

void __53__CKActionMenuView_setCollapsed_animated_completion___block_invoke_3(uint64_t a1)
{
  void *v2;
  uint64_t v3;
  uint64_t v4;
  uint64_t v5;
  uint64_t v6;
  void *v7;
  __int128 v8;
  __int128 v9;
  __int128 v10;
  __int128 v11;
  _BYTE v12[128];
  uint64_t v13;

  v13 = *MEMORY[0x1E0C80C00];
  v8 = 0u;
  v9 = 0u;
  v10 = 0u;
  v11 = 0u;
  objc_msgSend(*(id *)(a1 + 32), "actionMenuItems", 0);
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  v3 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
  if (v3)
  {
    v4 = v3;
    v5 = *(_QWORD *)v9;
    do
    {
      v6 = 0;
      do
      {
        if (*(_QWORD *)v9 != v5)
          objc_enumerationMutation(v2);
        objc_msgSend(*(id *)(*((_QWORD *)&v8 + 1) + 8 * v6), "label");
        v7 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v7, "setAlpha:", *(double *)(a1 + 40));

        ++v6;
      }
      while (v4 != v6);
      v4 = objc_msgSend(v2, "countByEnumeratingWithState:objects:count:", &v8, v12, 16);
    }
    while (v4);
  }

}

- (id)actionMenuItemAtPoint:(CGPoint)a3 velocity:(CGPoint)a4
{
  double y;
  double x;
  double v6;
  double v7;
  double v9;
  double v10;
  void *v11;
  uint64_t v12;
  uint64_t v13;
  void *v14;
  uint64_t v15;
  uint64_t i;
  void *v17;
  void *v18;
  id v19;
  double v20;
  double v21;
  CGFloat MaxY;
  double v23;
  BOOL v24;
  __int128 v26;
  __int128 v27;
  __int128 v28;
  __int128 v29;
  _BYTE v30[128];
  uint64_t v31;
  CGRect v32;

  y = a4.y;
  x = a4.x;
  v6 = a3.y;
  v7 = a3.x;
  v31 = *MEMORY[0x1E0C80C00];
  v9 = *MEMORY[0x1E0C9D538];
  v10 = *(double *)(MEMORY[0x1E0C9D538] + 8);
  if (-[UIView pointMostlyInside:threshold:velocity:](self, "pointMostlyInside:threshold:velocity:", a3.x, a3.y, 10.0, *MEMORY[0x1E0C9D538], v10)|| (x == v9 ? (v24 = y == v10) : (v24 = 0), !v24&& -[CKActionMenuView isTouchInside](self, "isTouchInside")&& -[UIView pointMostlyInside:threshold:velocity:](self, "pointMostlyInside:threshold:velocity:", v7, v6, 10.0, x, y)))
  {
    -[CKActionMenuView presentationActionMenuItems](self, "presentationActionMenuItems");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    v26 = 0u;
    v27 = 0u;
    v28 = 0u;
    v29 = 0u;
    v12 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    if (!v12)
      goto LABEL_13;
    v13 = v12;
    v14 = 0;
    v15 = *(_QWORD *)v27;
    do
    {
      for (i = 0; i != v13; ++i)
      {
        if (*(_QWORD *)v27 != v15)
          objc_enumerationMutation(v11);
        v17 = *(void **)(*((_QWORD *)&v26 + 1) + 8 * i);
        objc_msgSend(v17, "view");
        v18 = (void *)objc_claimAutoreleasedReturnValue();
        if (objc_msgSend(v17, "isEnabled"))
        {
          objc_msgSend(v18, "convertPoint:fromView:", self, v7, v6);
          if (objc_msgSend(v18, "pointMostlyInside:threshold:velocity:"))
          {
            v19 = v17;

            v14 = v19;
          }
        }

      }
      v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v26, v30, 16);
    }
    while (v13);
    if (!v14)
    {
LABEL_13:
      v20 = v7 + -30.0;
      v21 = atan2(v6 + -30.0, v20);
      if (v21 < -2.35619449
        || v21 > -0.785398163
        || (objc_msgSend(v11, "firstObject"), (v14 = (void *)objc_claimAutoreleasedReturnValue()) == 0))
      {
        -[CKActionMenuView bounds](self, "bounds");
        MaxY = CGRectGetMaxY(v32);
        v23 = atan2(v6 - (MaxY + -30.0), v20);
        v14 = 0;
        if (v23 >= 0.785398163 && v23 <= 2.35619449)
        {
          objc_msgSend(v11, "lastObject");
          v14 = (void *)objc_claimAutoreleasedReturnValue();
        }
      }
    }

  }
  else
  {
    v14 = 0;
  }
  return v14;
}

- (void)configureForPresentationAtPoint:(CGPoint)a3 inRect:(CGRect)a4
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  double v8;
  double v9;
  void *v11;
  unint64_t v12;
  void *v13;
  double v14;
  CGFloat v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double MinX;
  double v21;
  double v22;
  double MaxX;
  CGFloat v24;
  double v25;
  double MinY;
  BOOL v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  CGFloat v31;
  double v32;
  double v33;
  CGFloat v34;
  CGFloat v35;
  CGFloat v36;
  double MaxY;
  double v38;
  id v39;
  double v40;
  uint64_t v41;
  CGFloat v42;
  uint64_t v43;
  double v44;
  void *v45;
  CGFloat v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  CGFloat v52;
  double v53;
  double v54;
  void *v55;
  void *v56;
  double v57;
  double v58;
  double v59;
  CGFloat v60;
  double v61;
  double v62;
  void *v63;
  CGFloat v64;
  CGFloat rect;
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
  CGRect v87;

  height = a4.size.height;
  width = a4.size.width;
  y = a4.origin.y;
  x = a4.origin.x;
  v8 = a3.y;
  v9 = a3.x;
  -[CKActionMenuView actionMenuItems](self, "actionMenuItems");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12 = -[CKActionMenuView defaultActionIndex](self, "defaultActionIndex");
  objc_msgSend(v11, "objectAtIndex:", v12);
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  -[CKActionMenuView sizeThatFits:](self, "sizeThatFits:", *MEMORY[0x1E0C9D820], *(double *)(MEMORY[0x1E0C9D820] + 8));
  v15 = v14;
  v17 = v16;
  v61 = v9;
  v18 = v9 + v14 * -0.5;
  v57 = (double)v12;
  v62 = v8;
  v19 = v8 + -((double)v12 * 90.0 + 30.0) / v16 * v16;
  v66.origin.x = x;
  rect = y;
  v66.origin.y = y;
  v66.size.width = width;
  v66.size.height = height;
  MinX = CGRectGetMinX(v66);
  v67.origin.x = v18;
  v67.origin.y = v19;
  v67.size.width = v15;
  v67.size.height = v17;
  if (MinX <= CGRectGetMinX(v67))
  {
    v70.origin.x = x;
    v70.origin.y = rect;
    v70.size.width = width;
    v70.size.height = height;
    MaxX = CGRectGetMaxX(v70);
    v71.origin.x = v18;
    v71.origin.y = v19;
    v71.size.width = v15;
    v71.size.height = v17;
    v24 = CGRectGetMaxX(v71);
    v25 = 0.0;
    if (MaxX >= v24)
      goto LABEL_6;
    v72.origin.x = x;
    v72.origin.y = rect;
    v72.size.width = width;
    v72.size.height = height;
    v21 = CGRectGetMaxX(v72);
    v73.origin.x = v18;
    v73.origin.y = v19;
    v73.size.width = v15;
    v73.size.height = v17;
    v22 = CGRectGetMaxX(v73);
  }
  else
  {
    v68.origin.x = x;
    v68.origin.y = rect;
    v68.size.width = width;
    v68.size.height = height;
    v21 = CGRectGetMinX(v68);
    v69.origin.x = v18;
    v69.origin.y = v19;
    v69.size.width = v15;
    v69.size.height = v17;
    v22 = CGRectGetMinX(v69);
  }
  v25 = v21 - v22;
LABEL_6:
  v59 = v25;
  v74.origin.x = x;
  v74.origin.y = rect;
  v74.size.width = width;
  v74.size.height = height;
  MinY = CGRectGetMinY(v74);
  v75.origin.x = v18;
  v75.origin.y = v19;
  v75.size.width = v15;
  v75.size.height = v17;
  v27 = MinY <= CGRectGetMinY(v75);
  v64 = height;
  v28 = x;
  if (v27)
  {
    v34 = rect;
    v35 = width;
    v36 = height;
    MaxY = CGRectGetMaxY(*(CGRect *)&v28);
    v77.origin.x = v18;
    v77.origin.y = v19;
    v77.size.width = v15;
    v77.size.height = v17;
    v38 = 0.0;
    if (MaxY >= CGRectGetMaxY(v77))
      goto LABEL_11;
    v78.origin.x = x;
    v78.size.height = v64;
    v78.origin.y = rect;
    v78.size.width = width;
    v32 = CGRectGetMaxY(v78);
    v79.origin.x = v18;
    v79.origin.y = v19;
    v79.size.width = v15;
    v79.size.height = v17;
    v33 = CGRectGetMaxY(v79);
  }
  else
  {
    v29 = rect;
    v30 = width;
    v31 = height;
    v32 = CGRectGetMinY(*(CGRect *)&v28);
    v76.origin.x = v18;
    v76.origin.y = v19;
    v76.size.width = v15;
    v76.size.height = v17;
    v33 = CGRectGetMinY(v76);
  }
  v38 = v32 - v33;
LABEL_11:
  v39 = v11;
  v40 = fabs(v38);
  v60 = v18;
  v63 = v39;
  if (v40 <= 30.0)
  {
    v42 = v15;
    v44 = v57 * 90.0 + 30.0;
    v45 = v39;
    v46 = v64;
  }
  else
  {
    v41 = (uint64_t)(ceil((v40 + -30.0) / 90.0) * (double)((v38 < 0.0) - (v38 > 0.0)));
    v42 = v15;
    if (v41 < 1)
    {
      if (v41)
        v43 = 0;
      else
        v43 = v12;
    }
    else
    {
      v43 = objc_msgSend(v39, "count") - 1;
      v39 = v63;
    }
    v46 = v64;
    v45 = (void *)objc_msgSend(v39, "mutableCopy", *(_QWORD *)&v57);
    objc_msgSend(v45, "removeObjectAtIndex:", v12);
    objc_msgSend(v45, "insertObject:atIndex:", v13, v43);

    v44 = (double)(unint64_t)v43 * 90.0 + 30.0;
    v12 = v43;
  }
  v58 = v44 / v17;
  v47 = v62 - v44 / v17 * v17;
  v80.origin.x = x;
  v80.origin.y = rect;
  v80.size.width = width;
  v80.size.height = v46;
  v48 = CGRectGetMinY(v80);
  v81.origin.x = v60;
  v81.origin.y = v47;
  v81.size.width = v42;
  v81.size.height = v17;
  if (v48 > CGRectGetMinY(v81))
  {
    v82.origin.x = x;
    v82.origin.y = rect;
    v82.size.width = width;
    v82.size.height = v64;
    v49 = CGRectGetMinY(v82);
    v83.origin.x = v60;
    v83.origin.y = v47;
    v83.size.width = v42;
    v83.size.height = v17;
    v50 = CGRectGetMinY(v83);
LABEL_23:
    v53 = v49 - v50;
    goto LABEL_24;
  }
  v84.origin.x = x;
  v84.origin.y = rect;
  v84.size.width = width;
  v84.size.height = v64;
  v51 = CGRectGetMaxY(v84);
  v85.origin.x = v60;
  v85.origin.y = v47;
  v85.size.width = v42;
  v85.size.height = v17;
  v52 = CGRectGetMaxY(v85);
  v53 = 0.0;
  if (v51 < v52)
  {
    v86.origin.x = x;
    v86.origin.y = rect;
    v86.size.width = width;
    v86.size.height = v64;
    v49 = CGRectGetMaxY(v86);
    v87.origin.x = v60;
    v87.origin.y = v47;
    v87.size.width = v42;
    v87.size.height = v17;
    v50 = CGRectGetMaxY(v87);
    goto LABEL_23;
  }
LABEL_24:
  v54 = v62 + v53;
  -[CKActionMenuView layer](self, "layer", *(_QWORD *)&v57);
  v55 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v55, "setPosition:", v61 + v59, v54);

  -[CKActionMenuView layer](self, "layer");
  v56 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v56, "setAnchorPoint:", 0.5, v58);

  -[CKActionMenuView setPresentationActionMenuItems:](self, "setPresentationActionMenuItems:", v45);
  -[CKActionMenuView setPresentationDefaultActionIndex:](self, "setPresentationDefaultActionIndex:", v12);

}

- (NSArray)actionMenuItems
{
  return self->_actionMenuItems;
}

- (void)setActionMenuItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 424);
}

- (unint64_t)defaultActionIndex
{
  return self->_defaultActionIndex;
}

- (void)setDefaultActionIndex:(unint64_t)a3
{
  self->_defaultActionIndex = a3;
}

- (CKActionMenuController)actionMenuController
{
  return (CKActionMenuController *)objc_loadWeakRetained((id *)&self->_actionMenuController);
}

- (void)setActionMenuController:(id)a3
{
  objc_storeWeak((id *)&self->_actionMenuController, a3);
}

- (NSArray)presentationActionMenuItems
{
  return self->_presentationActionMenuItems;
}

- (void)setPresentationActionMenuItems:(id)a3
{
  objc_setProperty_nonatomic_copy(self, a2, a3, 448);
}

- (unint64_t)presentationDefaultActionIndex
{
  return self->_presentationDefaultActionIndex;
}

- (void)setPresentationDefaultActionIndex:(unint64_t)a3
{
  self->_presentationDefaultActionIndex = a3;
}

- (CGRect)presentationTargetBounds
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_presentationTargetBounds.origin.x;
  y = self->_presentationTargetBounds.origin.y;
  width = self->_presentationTargetBounds.size.width;
  height = self->_presentationTargetBounds.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setPresentationTargetBounds:(CGRect)a3
{
  self->_presentationTargetBounds = a3;
}

- (CGPoint)presentationTargetPosition
{
  double x;
  double y;
  CGPoint result;

  x = self->_presentationTargetPosition.x;
  y = self->_presentationTargetPosition.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setPresentationTargetPosition:(CGPoint)a3
{
  self->_presentationTargetPosition = a3;
}

- (UIVisualEffectView)blurView
{
  return self->_blurView;
}

- (void)setBlurView:(id)a3
{
  objc_storeStrong((id *)&self->_blurView, a3);
}

- (UIBlurEffect)blurEffect
{
  return self->_blurEffect;
}

- (void)setBlurEffect:(id)a3
{
  objc_storeStrong((id *)&self->_blurEffect, a3);
}

- (BOOL)isCollapsed
{
  return self->_collapsed;
}

- (BOOL)isTouchInside
{
  return self->_touchInside;
}

- (void)setTouchInside:(BOOL)a3
{
  self->_touchInside = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_blurEffect, 0);
  objc_storeStrong((id *)&self->_blurView, 0);
  objc_storeStrong((id *)&self->_presentationActionMenuItems, 0);
  objc_destroyWeak((id *)&self->_actionMenuController);
  objc_storeStrong((id *)&self->_actionMenuItems, 0);
}

@end

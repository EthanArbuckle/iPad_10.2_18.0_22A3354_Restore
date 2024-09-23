@implementation CNAvatarCardControllerOrbTransition

- (CNAvatarCardControllerOrbTransition)initWithCardViewController:(id)a3 headerView:(id)a4 sourceView:(id)a5 highlightedView:(id)a6 sourceRect:(CGRect)a7 backgroundVisualEffectView:(id)a8 isDismissing:(BOOL)a9
{
  CGFloat height;
  CGFloat width;
  CGFloat y;
  CGFloat x;
  id v19;
  id v20;
  id v21;
  id v22;
  id v23;
  CNAvatarCardControllerOrbTransition *v24;
  CNAvatarCardControllerOrbTransition *v25;
  CNAvatarCardControllerOrbTransition *v26;
  objc_super v28;

  height = a7.size.height;
  width = a7.size.width;
  y = a7.origin.y;
  x = a7.origin.x;
  v19 = a3;
  v20 = a4;
  v21 = a5;
  v22 = a6;
  v23 = a8;
  v28.receiver = self;
  v28.super_class = (Class)CNAvatarCardControllerOrbTransition;
  v24 = -[CNAvatarCardControllerOrbTransition init](&v28, sel_init);
  v25 = v24;
  if (v24)
  {
    objc_storeWeak((id *)&v24->_cardViewController, v19);
    objc_storeWeak((id *)&v25->_headerView, v20);
    objc_storeWeak((id *)&v25->_sourceView, v21);
    objc_storeWeak((id *)&v25->_highlightedView, v22);
    v25->_sourceRect.origin.x = x;
    v25->_sourceRect.origin.y = y;
    v25->_sourceRect.size.width = width;
    v25->_sourceRect.size.height = height;
    v25->_isDismissing = a9;
    objc_storeStrong((id *)&v25->_visualEffectView, a8);
    v26 = v25;
  }

  return v25;
}

- (void)prepareTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  double v14;
  double v15;
  double v16;
  double v17;
  double v18;
  double v19;
  double v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  void *v25;
  void *v26;
  uint64_t v27;
  uint64_t v28;
  uint64_t v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  void *v37;
  double v38;
  double v39;
  double v40;
  double v41;
  double v42;
  double v43;
  double v44;
  double v45;
  void *v46;
  double v47;
  double v48;
  void *v49;
  double v50;
  double v51;
  double v52;
  float v53;
  double v54;
  void *v55;
  void *v56;
  void *v57;
  uint64_t v58;
  double v59;
  uint64_t v60;
  double v61;
  uint64_t v62;
  double v63;
  id v64;

  v64 = a3;
  v8 = a4;
  v9 = a5;
  if (!-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
  {
    -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
    v10 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v10, "view");
    v11 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v11, "layoutIfNeeded");

    -[CNAvatarCardControllerOrbTransition visualEffectView](self, "visualEffectView");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAutoresizingMask:", 18);

    objc_msgSend(v9, "bounds");
    v14 = v13;
    v16 = v15;
    v18 = v17;
    v20 = v19;
    -[CNAvatarCardControllerOrbTransition visualEffectView](self, "visualEffectView");
    v21 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v21, "setFrame:", v14, v16, v18, v20);

    -[CNAvatarCardControllerOrbTransition visualEffectView](self, "visualEffectView");
    v22 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v22);

    -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
    v23 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v23, "view");
    v24 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", v24);

    -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
    v25 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v25, "view");
    v26 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v26, "frame");
    v58 = v27;
    v60 = v28;
    v62 = v29;

    -[CNAvatarCardControllerOrbTransition headerView](self, "headerView");
    v30 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v30, "bounds");
    v32 = v31 * 0.5;

    -[CNAvatarCardControllerOrbTransition _sourceRectInContainerView:](self, "_sourceRectInContainerView:", v9);
    v34 = v33;
    v36 = v35;
    -[CNAvatarCardControllerOrbTransition headerView](self, "headerView");
    v37 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v37, "bounds");
    v39 = v38;
    v41 = v40;
    v43 = v42;
    v45 = v44;
    -[CNAvatarCardControllerOrbTransition headerView](self, "headerView");
    v46 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "convertRect:fromView:", v46, v39, v41, v43, v45);
    v48 = v47;

    -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
    v49 = (void *)objc_claimAutoreleasedReturnValue();
    LODWORD(v46) = objc_msgSend(v49, "headerOnTop");

    v50 = v34 + v36 * 0.5;
    v51 = v50 - (v32 + v48);
    v52 = v50 - v32;
    if (!(_DWORD)v46)
      v52 = v51;
    v53 = v52;
    v54 = floorf(v53);
    -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController", v58, v60, v62);
    v55 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v55, "view");
    v56 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v56, "setFrame:", v59, v54, v63, v61);

  }
  -[CNAvatarCardControllerOrbTransition setupTransitionFromView:toView:withContainerView:](self, "setupTransitionFromView:toView:withContainerView:", v64, v8, v9);
  -[CNAvatarCardControllerOrbTransition delegate](self, "delegate");
  v57 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v57, "orbTransitionDidPrepareTransition:withContainerView:", self, v9);

}

- (void)setupTransitionFromView:(id)a3 toView:(id)a4 withContainerView:(id)a5
{
  void *v6;
  double v7;
  _BOOL4 v8;
  CGAffineTransform *v9;
  CGAffineTransform *v10;
  __int128 v11;
  void *v12;
  void *v13;
  double v14;
  void *v15;
  void *v16;
  CGAffineTransform *v17;
  __int128 v18;
  void *v19;
  void *v20;
  double v21;
  void *v22;
  void *v23;
  __int128 v24;
  __int128 v25;
  _BOOL4 v26;
  CGAffineTransform *v27;
  __int128 v28;
  _BOOL4 v29;
  double v30;
  _OWORD v31[3];
  _OWORD v32[3];
  __int128 v33;
  __int128 v34;
  __int128 v35;
  _OWORD v36[3];
  __int128 v37;
  __int128 v38;
  __int128 v39;
  _OWORD v40[3];
  __int128 v41;
  __int128 v42;
  __int128 v43;
  CGAffineTransform v44;
  CGAffineTransform t2;
  CGAffineTransform t1;
  CGAffineTransform v47;

  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController", a3, a4, a5);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend(v6, "headerOnTop"))
    v7 = -180.0;
  else
    v7 = 180.0;

  memset(&v47, 0, sizeof(v47));
  CGAffineTransformMakeTranslation(&t1, 0.0, v7);
  CGAffineTransformMakeScale(&t2, 0.5, 0.5);
  CGAffineTransformConcat(&v47, &t1, &t2);
  memset(&v44, 0, sizeof(v44));
  CGAffineTransformMakeScale(&v44, 0.5, 0.5);
  v8 = -[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing");
  v9 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  if (v8)
    v10 = (CGAffineTransform *)MEMORY[0x1E0C9BAA8];
  else
    v10 = &v44;
  v11 = *(_OWORD *)&v10->c;
  v41 = *(_OWORD *)&v10->a;
  v42 = v11;
  v43 = *(_OWORD *)&v10->tx;
  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "headerContainerView");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  v40[0] = v41;
  v40[1] = v42;
  v40[2] = v43;
  objc_msgSend(v13, "setTransform:", v40);

  if (-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
    v14 = 1.0;
  else
    v14 = 0.0;
  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v15 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v15, "headerContainerView");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "setAlpha:", v14);

  if (-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
    v17 = v9;
  else
    v17 = &v47;
  v18 = *(_OWORD *)&v17->c;
  v37 = *(_OWORD *)&v17->a;
  v38 = v18;
  v39 = *(_OWORD *)&v17->tx;
  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "actionsListView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  v36[0] = v37;
  v36[1] = v38;
  v36[2] = v39;
  objc_msgSend(v20, "setTransform:", v36);

  if (-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
    v21 = 1.0;
  else
    v21 = 0.0;
  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "actionsListView");
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v23, "setAlpha:", v21);

  if (-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
  {
    v33 = *(_OWORD *)&v44.a;
    v34 = *(_OWORD *)&v44.c;
    v24 = *(_OWORD *)&v44.tx;
  }
  else
  {
    v25 = *(_OWORD *)&v9->c;
    v33 = *(_OWORD *)&v9->a;
    v34 = v25;
    v24 = *(_OWORD *)&v9->tx;
  }
  v35 = v24;
  v32[0] = v33;
  v32[1] = v34;
  v32[2] = v24;
  -[CNAvatarCardControllerOrbTransition setEndHeaderTransform:](self, "setEndHeaderTransform:", v32);
  v26 = -[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing");
  v27 = &v47;
  if (!v26)
    v27 = v9;
  v28 = *(_OWORD *)&v27->c;
  v31[0] = *(_OWORD *)&v27->a;
  v31[1] = v28;
  v31[2] = *(_OWORD *)&v27->tx;
  -[CNAvatarCardControllerOrbTransition setEndActionListTransform:](self, "setEndActionListTransform:", v31);
  v29 = -[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing");
  v30 = 0.0;
  if (v29)
    v30 = 1.0;
  -[CNAvatarCardControllerOrbTransition setHighlightViewToAlpha:](self, "setHighlightViewToAlpha:", v30);
}

- (void)performTransitionFromView:(id)a3 toView:(id)a4 containerView:(id)a5
{
  id v7;
  id v8;
  void *v9;
  void *v10;
  void *v11;
  void *v12;
  double v13;
  void *v14;
  id v15;
  void *v16;
  void *v17;
  void *v18;
  void *v19;
  void *v20;
  void *v21;
  void *v22;
  void *v23;
  void *v24;
  uint64_t v25;
  _BYTE v26[48];

  v7 = a4;
  v8 = a3;
  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "headerContainerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardControllerOrbTransition endHeaderTransform](self, "endHeaderTransform");
  objc_msgSend(v10, "setTransform:", v26);

  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "actionsListView");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardControllerOrbTransition endActionListTransform](self, "endActionListTransform");
  objc_msgSend(v12, "setTransform:", &v25);

  if (-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
    v13 = 0.0;
  else
    v13 = 1.0;
  if (-[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing"))
    v14 = v7;
  else
    v14 = v8;
  v15 = v14;
  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v16 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v16, "headerContainerView");
  v17 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v17, "setAlpha:", v13);

  -[CNAvatarCardControllerOrbTransition cardViewController](self, "cardViewController");
  v18 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v18, "actionsListView");
  v19 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v19, "setAlpha:", v13);

  -[CNAvatarCardControllerOrbTransition visualEffectView](self, "visualEffectView");
  v20 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v20, "setAlpha:", v13);

  -[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing");
  _UIClickPresentationBackgroundEffects();
  v21 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardControllerOrbTransition visualEffectView](self, "visualEffectView");
  v22 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v22, "setBackgroundEffects:", v21);

  -[CNAvatarCardControllerOrbTransition isDismissing](self, "isDismissing");
  _UIClickPresentationBackgroundColor();
  v23 = (void *)objc_claimAutoreleasedReturnValue();
  -[CNAvatarCardControllerOrbTransition visualEffectView](self, "visualEffectView");
  v24 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v24, "setBackgroundColor:", v23);

  -[CNAvatarCardControllerOrbTransition highlightViewToAlpha](self, "highlightViewToAlpha");
  objc_msgSend(v15, "setAlpha:");

}

- (void)transitionDidEnd:(BOOL)a3
{
  void *v4;
  __int128 v5;
  __int128 v6;
  __int128 v7;
  _OWORD v8[3];
  _OWORD v9[2];
  __int128 v10;

  v7 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v9[0] = *MEMORY[0x1E0C9BAA8];
  v6 = v9[0];
  v9[1] = v7;
  v10 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  v5 = v10;
  -[CNAvatarCardControllerOrbTransition setEndHeaderTransform:](self, "setEndHeaderTransform:", v9);
  v8[0] = v6;
  v8[1] = v7;
  v8[2] = v5;
  -[CNAvatarCardControllerOrbTransition setEndActionListTransform:](self, "setEndActionListTransform:", v8);
  -[CNAvatarCardControllerOrbTransition delegate](self, "delegate");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "orbTransitionDidEndTransition:", self);

}

- (CGRect)_sourceRectInContainerView:(id)a3
{
  id v4;
  void *v5;
  double v6;
  double x;
  double v8;
  double y;
  double v10;
  double width;
  double v12;
  double height;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  void *v19;
  void *v20;
  CGFloat v21;
  CGFloat v22;
  CGFloat v23;
  CGFloat v24;
  void *v25;
  void *v26;
  void *v27;
  void *v28;
  void *v29;
  void *v30;
  double v31;
  double v32;
  double v33;
  double v34;
  double v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  void *v40;
  double v41;
  CGFloat v42;
  double v43;
  CGFloat v44;
  double v45;
  CGFloat v46;
  double v47;
  CGFloat v48;
  void *v49;
  void *v50;
  double v51;
  double v52;
  double v53;
  double v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  double v63;
  double v64;
  CGRect v65;
  CGRect v66;
  CGRect v67;
  CGRect v68;
  CGRect v69;
  CGRect result;
  CGRect v71;
  CGRect v72;
  CGRect v73;

  v4 = a3;
  -[CNAvatarCardControllerOrbTransition sourceRect](self, "sourceRect");
  if (CGRectIsEmpty(v65))
  {
    -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v5, "bounds");
    x = v6;
    y = v8;
    width = v10;
    height = v12;

  }
  else
  {
    -[CNAvatarCardControllerOrbTransition sourceRect](self, "sourceRect");
    x = v14;
    y = v15;
    width = v16;
    height = v17;
  }
  -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
  v18 = objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    v19 = (void *)v18;
    -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
    v20 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v20, "bounds");
    v71.origin.x = v21;
    v71.origin.y = v22;
    v71.size.width = v23;
    v71.size.height = v24;
    v66.origin.x = x;
    v66.origin.y = y;
    v66.size.width = width;
    v66.size.height = height;
    if (CGRectEqualToRect(v66, v71))
    {
      -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
      v25 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v25, "window");
      v26 = (void *)objc_claimAutoreleasedReturnValue();

      if (v26)
      {
        -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
        v27 = (void *)objc_claimAutoreleasedReturnValue();
        -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
        v28 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v28, "window");
        v29 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v29, "safeAreaLayoutGuide");
        v30 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v30, "layoutFrame");
        v32 = v31;
        v34 = v33;
        v36 = v35;
        v38 = v37;
        -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
        v39 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v39, "window");
        v40 = (void *)objc_claimAutoreleasedReturnValue();
        objc_msgSend(v27, "convertRect:fromCoordinateSpace:", v40, v32, v34, v36, v38);
        v42 = v41;
        v44 = v43;
        v46 = v45;
        v48 = v47;

        v67.origin.x = v42;
        v67.origin.y = v44;
        v67.size.width = v46;
        v67.size.height = v48;
        v72.origin.x = x;
        v72.origin.y = y;
        v72.size.width = width;
        v72.size.height = height;
        if (CGRectIntersectsRect(v67, v72))
        {
          v68.origin.x = v42;
          v68.origin.y = v44;
          v68.size.width = v46;
          v68.size.height = v48;
          v73.origin.x = x;
          v73.origin.y = y;
          v73.size.width = width;
          v73.size.height = height;
          v69 = CGRectIntersection(v68, v73);
          x = v69.origin.x;
          y = v69.origin.y;
          width = v69.size.width;
          height = v69.size.height;
        }
        goto LABEL_11;
      }
    }
    else
    {

    }
  }
  -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
  v49 = (void *)objc_claimAutoreleasedReturnValue();

  if (!v49)
  {
    objc_msgSend(v4, "bounds");
    UIRectGetCenter();
    v52 = v59;
    v54 = v60;
    v56 = 0.0;
    v58 = 0.0;
    goto LABEL_13;
  }
LABEL_11:
  -[CNAvatarCardControllerOrbTransition sourceView](self, "sourceView");
  v50 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "convertRect:fromView:", v50, x, y, width, height);
  v52 = v51;
  v54 = v53;
  v56 = v55;
  v58 = v57;

LABEL_13:
  v61 = v52;
  v62 = v54;
  v63 = v56;
  v64 = v58;
  result.size.height = v64;
  result.size.width = v63;
  result.origin.y = v62;
  result.origin.x = v61;
  return result;
}

- (BOOL)isDismissing
{
  return self->_isDismissing;
}

- (void)setIsDismissing:(BOOL)a3
{
  self->_isDismissing = a3;
}

- (CNContactOrbHeaderView)headerView
{
  return (CNContactOrbHeaderView *)objc_loadWeakRetained((id *)&self->_headerView);
}

- (void)setHeaderView:(id)a3
{
  objc_storeWeak((id *)&self->_headerView, a3);
}

- (CNAvatarCardViewController)cardViewController
{
  return (CNAvatarCardViewController *)objc_loadWeakRetained((id *)&self->_cardViewController);
}

- (void)setCardViewController:(id)a3
{
  objc_storeWeak((id *)&self->_cardViewController, a3);
}

- (UIView)sourceView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_sourceView);
}

- (void)setSourceView:(id)a3
{
  objc_storeWeak((id *)&self->_sourceView, a3);
}

- (UIView)highlightedView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_highlightedView);
}

- (void)setHighlightedView:(id)a3
{
  objc_storeWeak((id *)&self->_highlightedView, a3);
}

- (CGRect)sourceRect
{
  double x;
  double y;
  double width;
  double height;
  CGRect result;

  x = self->_sourceRect.origin.x;
  y = self->_sourceRect.origin.y;
  width = self->_sourceRect.size.width;
  height = self->_sourceRect.size.height;
  result.size.height = height;
  result.size.width = width;
  result.origin.y = y;
  result.origin.x = x;
  return result;
}

- (void)setSourceRect:(CGRect)a3
{
  self->_sourceRect = a3;
}

- (CNAvatarCardControllerOrbTransitionDelegate)delegate
{
  return (CNAvatarCardControllerOrbTransitionDelegate *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (CGAffineTransform)endHeaderTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[2].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[2].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[2].ty;
  return self;
}

- (void)setEndHeaderTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_endHeaderTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_endHeaderTransform.c = v4;
  *(_OWORD *)&self->_endHeaderTransform.a = v3;
}

- (CGAffineTransform)endActionListTransform
{
  __int128 v3;

  v3 = *(_OWORD *)&self[3].d;
  *(_OWORD *)&retstr->a = *(_OWORD *)&self[3].b;
  *(_OWORD *)&retstr->c = v3;
  *(_OWORD *)&retstr->tx = *(_OWORD *)&self[3].ty;
  return self;
}

- (void)setEndActionListTransform:(CGAffineTransform *)a3
{
  __int128 v3;
  __int128 v4;

  v3 = *(_OWORD *)&a3->a;
  v4 = *(_OWORD *)&a3->c;
  *(_OWORD *)&self->_endActionListTransform.tx = *(_OWORD *)&a3->tx;
  *(_OWORD *)&self->_endActionListTransform.c = v4;
  *(_OWORD *)&self->_endActionListTransform.a = v3;
}

- (double)highlightViewToAlpha
{
  return self->_highlightViewToAlpha;
}

- (void)setHighlightViewToAlpha:(double)a3
{
  self->_highlightViewToAlpha = a3;
}

- (UIVisualEffectView)visualEffectView
{
  return self->_visualEffectView;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_visualEffectView, 0);
  objc_destroyWeak((id *)&self->_delegate);
  objc_destroyWeak((id *)&self->_highlightedView);
  objc_destroyWeak((id *)&self->_sourceView);
  objc_destroyWeak((id *)&self->_cardViewController);
  objc_destroyWeak((id *)&self->_headerView);
}

@end

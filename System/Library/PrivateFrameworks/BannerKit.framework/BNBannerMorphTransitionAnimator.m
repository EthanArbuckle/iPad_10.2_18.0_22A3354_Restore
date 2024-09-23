@implementation BNBannerMorphTransitionAnimator

- (void)actionsForTransition:(id)a3
{
  uint64_t v4;
  id v5;
  void *v6;
  void *v7;
  void *v8;
  void *v9;
  uint64_t v10;
  uint64_t v11;
  uint64_t v12;
  uint64_t v13;
  double v14;
  double v15;
  double v16;
  double v17;
  uint64_t v18;
  uint64_t v19;
  double v20;
  double v21;
  double v22;
  double v23;
  void *v24;
  id v25;
  void *v26;
  void *v27;
  __int128 v28;
  uint64_t v29;
  double v30;
  uint64_t v31;
  double v32;
  _OWORD v33[3];
  CGAffineTransform v34;
  _QWORD v35[4];
  id v36;
  double v37;
  double v38;
  uint64_t v39;
  uint64_t v40;
  double v41;
  double v42;

  v4 = *MEMORY[0x1E0CEBDA8];
  v5 = a3;
  objc_msgSend(v5, "viewControllerForKey:", v4);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "viewControllerForKey:", *MEMORY[0x1E0CEBDB8]);
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v7, "view");
  v9 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "initialFrameForViewController:", v7);
  v11 = v10;
  v13 = v12;
  v15 = v14;
  v17 = v16;
  objc_msgSend(v5, "finalFrameForViewController:", v7);
  v29 = v19;
  v31 = v18;
  v21 = v20;
  v23 = v22;

  v24 = (void *)MEMORY[0x1E0CEABB0];
  v35[0] = MEMORY[0x1E0C809B0];
  v35[1] = 3221225472;
  v35[2] = __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke;
  v35[3] = &unk_1E7044BA8;
  v36 = v9;
  v37 = v15 / v21;
  v38 = v17 / v23;
  v39 = v11;
  v40 = v13;
  v41 = v15;
  v42 = v17;
  v25 = v9;
  objc_msgSend(v24, "performWithoutAnimation:", v35);
  -[BNBannerMorphTransitionAnimator _materialGroupNameBaseForViewController:](self, "_materialGroupNameBaseForViewController:", v6);
  v26 = (void *)objc_claimAutoreleasedReturnValue();
  -[BNBannerMorphTransitionAnimator _materialGroupNameBaseForViewController:](self, "_materialGroupNameBaseForViewController:", v7);
  v27 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v24) = objc_msgSend(v26, "isEqual:", v27);

  if ((v24 & 1) == 0)
    objc_msgSend(v8, "setAlpha:", 0.0);
  objc_msgSend(v25, "setAlpha:", 1.0, v29, v31);
  CGAffineTransformMakeScale(&v34, 1.0 / (v15 / v21), 1.0 / (v17 / v23));
  objc_msgSend(v8, "setTransform:", &v34);
  v28 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v33[0] = *MEMORY[0x1E0C9BAA8];
  v33[1] = v28;
  v33[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(v25, "setTransform:", v33);
  objc_msgSend(v25, "setFrame:", v32, v30, v21, v23);
  objc_msgSend(v8, "setFrame:", v32, v30, v21, v23);

}

uint64_t __56__BNBannerMorphTransitionAnimator_actionsForTransition___block_invoke(uint64_t a1)
{
  void *v2;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(a1 + 32), "setAlpha:", 0.0);
  v2 = *(void **)(a1 + 32);
  CGAffineTransformMakeScale(&v4, *(CGFloat *)(a1 + 40), *(CGFloat *)(a1 + 48));
  objc_msgSend(v2, "setTransform:", &v4);
  objc_msgSend(*(id *)(a1 + 32), "setFrame:", *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72), *(double *)(a1 + 80));
  return objc_msgSend(*(id *)(a1 + 32), "layoutIfNeeded");
}

- (double)transitionDuration:(id)a3
{
  return 0.375;
}

- (id)_materialGroupNameBaseForView:(id)a3
{
  id v3;
  void *v4;
  void *v5;
  void *v6;

  v3 = a3;
  objc_msgSend(v3, "subviews");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  if ((objc_opt_respondsToSelector() & 1) == 0)
  {
    if (objc_msgSend(v4, "count") == 1)
    {
      objc_msgSend(v4, "lastObject");
      v6 = (void *)objc_claimAutoreleasedReturnValue();
      if ((objc_opt_respondsToSelector() & 1) != 0)
      {
        objc_msgSend(v6, "materialGroupNameBase");
        v5 = (void *)objc_claimAutoreleasedReturnValue();

        goto LABEL_8;
      }

    }
    v5 = 0;
    goto LABEL_8;
  }
  objc_msgSend(v3, "materialGroupNameBase");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
LABEL_8:

  return v5;
}

- (id)_materialGroupNameBaseForViewController:(id)a3
{
  id v4;
  void *v5;
  uint64_t v6;

  v4 = a3;
  if ((objc_opt_respondsToSelector() & 1) != 0)
  {
    objc_msgSend(v4, "materialGroupNameBase");
    v5 = (void *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    objc_msgSend(v4, "view");
    v6 = objc_claimAutoreleasedReturnValue();

    -[BNBannerMorphTransitionAnimator _materialGroupNameBaseForView:](self, "_materialGroupNameBaseForView:", v6);
    v5 = (void *)objc_claimAutoreleasedReturnValue();
    v4 = (id)v6;
  }

  return v5;
}

@end

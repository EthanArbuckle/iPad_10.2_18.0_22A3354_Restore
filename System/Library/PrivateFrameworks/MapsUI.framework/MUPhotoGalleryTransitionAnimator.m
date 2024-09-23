@implementation MUPhotoGalleryTransitionAnimator

- (MUPhotoGalleryTransitionAnimator)initWithView:(id)a3 transitionView:(id)a4
{
  id v7;
  id v8;
  MUPhotoGalleryTransitionAnimator *v9;
  MUPhotoGalleryTransitionAnimator *v10;
  objc_super v12;

  v7 = a3;
  v8 = a4;
  v12.receiver = self;
  v12.super_class = (Class)MUPhotoGalleryTransitionAnimator;
  v9 = -[MUPhotoGalleryTransitionAnimator init](&v12, sel_init);
  v10 = v9;
  if (v9)
  {
    objc_storeStrong((id *)&v9->_view, a3);
    objc_storeStrong((id *)&v10->_transitionView, a4);
  }

  return v10;
}

- (double)transitionDuration:(id)a3
{
  return 0.25;
}

- (void)animateTransition:(id)a3
{
  id v4;
  void *v5;
  void *v6;
  int v7;
  void *v8;
  id v9;
  void *v10;
  void *v11;
  void *v12;
  void *v13;
  void *v14;
  void *v15;
  void *v16;
  void *v17;
  void *v18;
  double v19;
  double v20;
  double v21;
  double v22;
  double v23;
  double Width;
  double v25;
  double Height;
  double v27;
  double v28;
  double v29;
  double v30;
  void *v31;
  char isKindOfClass;
  void *v33;
  void *v34;
  void *v35;
  double v36;
  double v37;
  double v38;
  void *v39;
  char v40;
  void *v41;
  void *v42;
  void *v43;
  double v44;
  double v45;
  double v46;
  double v47;
  double v48;
  double v49;
  double v50;
  double v51;
  double v52;
  void *v53;
  void *v54;
  double v55;
  double v56;
  double v57;
  double v58;
  double v59;
  double v60;
  double v61;
  double v62;
  void *v63;
  double v64;
  double v65;
  double v66;
  double v67;
  double v68;
  double v69;
  double v70;
  double v71;
  void *v72;
  void *v73;
  void *v74;
  void *v75;
  double v76;
  double v77;
  uint64_t v78;
  id v79;
  void *v80;
  void *v81;
  double v82;
  _QWORD v83[5];
  id v84;
  id v85;
  _QWORD v86[4];
  id v87;
  MUPhotoGalleryTransitionAnimator *v88;
  double v89;
  double v90;
  double v91;
  double v92;
  double v93;
  CGRect v94;
  CGRect v95;
  CGRect v96;
  CGRect v97;
  CGRect v98;
  CGRect v99;

  v4 = a3;
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55B8]);
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "viewControllerForKey:", *MEMORY[0x1E0DC55C8]);
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  v7 = objc_msgSend(v6, "isBeingPresented");
  if (v7)
    v8 = v6;
  else
    v8 = v5;
  v9 = v8;
  objc_msgSend(v9, "viewControllers");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "firstObject");
  v11 = (void *)objc_claimAutoreleasedReturnValue();

  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0)
  {
    objc_msgSend(v11, "photoViewForTransition");
    v12 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v12, "setAlpha:", 0.0);
    -[MUPhotoGalleryTransitionAnimator view](self, "view");
    v13 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v13, "setAlpha:", 0.0);

    objc_msgSend(v4, "containerView");
    v14 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v6, "view");
    v15 = (void *)objc_claimAutoreleasedReturnValue();
    if (v7)
      objc_msgSend(v14, "addSubview:", v15);
    else
      objc_msgSend(v14, "sendSubviewToBack:", v15);

    -[MUPhotoGalleryTransitionAnimator transitionView](self, "transitionView");
    v16 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v16, "setClipsToBounds:", 1);

    objc_msgSend(v4, "containerView");
    v17 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPhotoGalleryTransitionAnimator transitionView](self, "transitionView");
    v18 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v17, "addSubview:", v18);

    if (v7)
    {
      objc_msgSend(v4, "finalFrameForViewController:", v6);
      v20 = v19;
      v22 = v21;
      Width = v23;
      Height = v25;
    }
    else
    {
      objc_msgSend(v11, "scrollViewContentOffset");
      v28 = v27;
      v30 = v29;
      objc_msgSend(v12, "frame");
      v20 = CGRectGetMinX(v94) - v28;
      objc_msgSend(v12, "frame");
      v22 = CGRectGetMinY(v95) - v30;
      objc_msgSend(v12, "frame");
      Width = CGRectGetWidth(v96);
      objc_msgSend(v12, "frame");
      Height = CGRectGetHeight(v97);
    }
    v81 = v5;
    -[MUPhotoGalleryTransitionAnimator view](self, "view", v12);
    v31 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    isKindOfClass = objc_opt_isKindOfClass();
    -[MUPhotoGalleryTransitionAnimator view](self, "view");
    v33 = (void *)objc_claimAutoreleasedReturnValue();
    v34 = v33;
    if ((isKindOfClass & 1) != 0)
    {
      objc_msgSend(v33, "image");
      v35 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v35, "size");
      v37 = v36;

    }
    else
    {
      objc_msgSend(v33, "frame");
      v37 = v38;
    }

    -[MUPhotoGalleryTransitionAnimator view](self, "view");
    v39 = (void *)objc_claimAutoreleasedReturnValue();
    objc_opt_class();
    v40 = objc_opt_isKindOfClass();
    -[MUPhotoGalleryTransitionAnimator view](self, "view");
    v41 = (void *)objc_claimAutoreleasedReturnValue();
    v42 = v41;
    if ((v40 & 1) != 0)
    {
      objc_msgSend(v41, "image");
      v43 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v43, "size");
      v45 = v44;

    }
    else
    {
      objc_msgSend(v41, "frame");
      v45 = v46;
    }

    v47 = Width / v37;
    v48 = 0.0;
    if (v37 <= 0.0)
      v47 = 0.0;
    v49 = Height / v45;
    if (v45 <= 0.0)
      v49 = 0.0;
    if (v47 >= v49)
      v47 = v49;
    v50 = v37 * v47;
    v51 = v45 * v47;
    v98.origin.x = v20;
    v98.origin.y = v22;
    v98.size.width = Width;
    v98.size.height = Height;
    v82 = CGRectGetMidX(v98) - v50 * 0.5;
    v99.origin.x = v20;
    v99.origin.y = v22;
    v99.size.width = Width;
    v99.size.height = Height;
    v52 = CGRectGetMidY(v99) - v51 * 0.5;
    objc_msgSend(v4, "containerView");
    v53 = (void *)objc_claimAutoreleasedReturnValue();
    -[MUPhotoGalleryTransitionAnimator view](self, "view");
    v54 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v54, "bounds");
    v56 = v55;
    v58 = v57;
    v60 = v59;
    v62 = v61;
    -[MUPhotoGalleryTransitionAnimator view](self, "view");
    v63 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v53, "convertRect:fromView:", v63, v56, v58, v60, v62);
    v65 = v64;
    v67 = v66;
    v69 = v68;
    v71 = v70;

    -[MUPhotoGalleryTransitionAnimator transitionView](self, "transitionView");
    v72 = (void *)objc_claimAutoreleasedReturnValue();
    v73 = v72;
    if (v7)
    {
      objc_msgSend(v72, "setFrame:", v65, v67, v69, v71);

      objc_msgSend(v6, "view");
      v73 = (void *)objc_claimAutoreleasedReturnValue();
      objc_msgSend(v73, "setAlpha:", 0.0);
      v48 = 1.0;
      v65 = v82;
    }
    else
    {
      objc_msgSend(v72, "setFrame:", v82, v52, v50, v51);
      v52 = v67;
      v50 = v69;
      v51 = v71;
    }

    -[MUPhotoGalleryTransitionAnimator transitionView](self, "transitionView");
    v74 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v74, "layoutIfNeeded");

    v75 = (void *)MEMORY[0x1E0DC3F10];
    -[MUPhotoGalleryTransitionAnimator transitionDuration:](self, "transitionDuration:", v4);
    v77 = v76;
    v78 = MEMORY[0x1E0C809B0];
    v86[0] = MEMORY[0x1E0C809B0];
    v86[1] = 3221225472;
    v86[2] = __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke;
    v86[3] = &unk_1E2E02888;
    v87 = v9;
    v88 = self;
    v89 = v48;
    v90 = v65;
    v91 = v52;
    v92 = v50;
    v93 = v51;
    v83[0] = v78;
    v83[1] = 3221225472;
    v83[2] = __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke_2;
    v83[3] = &unk_1E2E028B0;
    v83[4] = self;
    v84 = v80;
    v85 = v4;
    v79 = v80;
    objc_msgSend(v75, "animateWithDuration:delay:options:animations:completion:", 0x20000, v86, v83, v77, 0.0);

    v5 = v81;
  }
  else
  {
    objc_msgSend(v4, "completeTransition:", 0);
  }

}

void __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke(uint64_t a1)
{
  double v2;
  void *v3;
  double v4;
  double v5;
  double v6;
  double v7;
  void *v8;
  id v9;

  v2 = *(double *)(a1 + 48);
  objc_msgSend(*(id *)(a1 + 32), "view");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "setAlpha:", v2);

  v4 = *(double *)(a1 + 56);
  v5 = *(double *)(a1 + 64);
  v6 = *(double *)(a1 + 72);
  v7 = *(double *)(a1 + 80);
  objc_msgSend(*(id *)(a1 + 40), "transitionView");
  v8 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v8, "setFrame:", v4, v5, v6, v7);

  objc_msgSend(*(id *)(a1 + 40), "transitionView");
  v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v9, "layoutIfNeeded");

}

void __54__MUPhotoGalleryTransitionAnimator_animateTransition___block_invoke_2(id *a1)
{
  void *v2;
  void *v3;
  id v4;

  objc_msgSend(a1[4], "view");
  v2 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v2, "setAlpha:", 1.0);

  objc_msgSend(a1[5], "setAlpha:", 1.0);
  objc_msgSend(a1[4], "transitionView");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "removeFromSuperview");

  objc_msgSend(a1[6], "completeTransition:", objc_msgSend(a1[6], "transitionWasCancelled") ^ 1);
  objc_msgSend(a1[4], "delegate");
  v4 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "photoGalleryTransitionAnimatorDidFinishAnimation");

}

- (MUPhotoGalleryTransitionAnimator)delegate
{
  return (MUPhotoGalleryTransitionAnimator *)objc_loadWeakRetained((id *)&self->_delegate);
}

- (void)setDelegate:(id)a3
{
  objc_storeWeak((id *)&self->_delegate, a3);
}

- (UIView)view
{
  return self->_view;
}

- (void)setView:(id)a3
{
  objc_storeStrong((id *)&self->_view, a3);
}

- (UIView)transitionView
{
  return self->_transitionView;
}

- (void)setTransitionView:(id)a3
{
  objc_storeStrong((id *)&self->_transitionView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transitionView, 0);
  objc_storeStrong((id *)&self->_view, 0);
  objc_destroyWeak((id *)&self->_delegate);
}

@end

@implementation MediaControlsPresentationController

+ (id)_backgroundEffectForTraitCollection:(id)a3 interactive:(BOOL)a4
{
  return 0;
}

- (BOOL)shouldPresentInFullscreen
{
  return 0;
}

- (BOOL)_shouldRespectDefinesPresentationContext
{
  return 1;
}

- (void)presentationTransitionWillBegin
{
  void *v3;
  void *v4;
  id WeakRetained;
  MTMaterialView *v6;
  MTMaterialView *materialView;
  void *v8;
  void *v9;
  void *v10;
  void *v11;
  _QWORD v12[5];
  objc_super v13;

  v13.receiver = self;
  v13.super_class = (Class)MediaControlsPresentationController;
  -[UIPreviewPresentationController presentationTransitionWillBegin](&v13, sel_presentationTransitionWillBegin);
  v3 = (void *)objc_msgSend(objc_alloc(MEMORY[0x1E0DC3D80]), "initWithTarget:action:", self, sel__dismissTap_);
  objc_msgSend(v3, "setDelegate:", self);
  -[MediaControlsPresentationController containerView](self, "containerView");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v4, "addGestureRecognizer:", v3);

  WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
  if (!WeakRetained)
  {
    objc_msgSend(MEMORY[0x1E0D47498], "materialViewWithRecipe:configuration:initialWeighting:", 4, 3, 0.0);
    v6 = (MTMaterialView *)objc_claimAutoreleasedReturnValue();
    materialView = self->_materialView;
    self->_materialView = v6;

    -[MediaControlsPresentationController containerView](self, "containerView");
    v8 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v8, "bounds");
    -[MTMaterialView setFrame:](self->_materialView, "setFrame:");

    -[MTMaterialView setAutoresizingMask:](self->_materialView, "setAutoresizingMask:", 18);
    -[MTMaterialView setShouldCrossfade:](self->_materialView, "setShouldCrossfade:", 1);
    -[MediaControlsPresentationController containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "addSubview:", self->_materialView);

  }
  -[MediaControlsPresentationController presentedViewController](self, "presentedViewController");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v10, "transitionCoordinator");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  v12[0] = MEMORY[0x1E0C809B0];
  v12[1] = 3221225472;
  v12[2] = __70__MediaControlsPresentationController_presentationTransitionWillBegin__block_invoke;
  v12[3] = &unk_1E5819C40;
  v12[4] = self;
  objc_msgSend(v11, "animateAlongsideTransition:completion:", v12, 0);

}

void __70__MediaControlsPresentationController_presentationTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  CGAffineTransform v3;
  CGAffineTransform v4;

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setWeighting:", 1.0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "setAlpha:", 0.0);
  CGAffineTransformMakeScale(&v4, 0.8, 0.8);
  v3 = v4;
  objc_msgSend(WeakRetained, "setTransform:", &v3);

}

- (void)dismissalTransitionWillBegin
{
  void *v3;
  void *v4;
  _QWORD v5[5];
  objc_super v6;

  v6.receiver = self;
  v6.super_class = (Class)MediaControlsPresentationController;
  -[UIPreviewPresentationController dismissalTransitionWillBegin](&v6, sel_dismissalTransitionWillBegin);
  -[MediaControlsPresentationController presentedViewController](self, "presentedViewController");
  v3 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "transitionCoordinator");
  v4 = (void *)objc_claimAutoreleasedReturnValue();
  v5[0] = MEMORY[0x1E0C809B0];
  v5[1] = 3221225472;
  v5[2] = __67__MediaControlsPresentationController_dismissalTransitionWillBegin__block_invoke;
  v5[3] = &unk_1E5819C40;
  v5[4] = self;
  objc_msgSend(v4, "animateAlongsideTransition:completion:", v5, 0);

}

void __67__MediaControlsPresentationController_dismissalTransitionWillBegin__block_invoke(uint64_t a1)
{
  id WeakRetained;
  __int128 v3;
  _OWORD v4[3];

  objc_msgSend(*(id *)(*(_QWORD *)(a1 + 32) + 448), "setWeighting:", 0.0);
  WeakRetained = objc_loadWeakRetained((id *)(*(_QWORD *)(a1 + 32) + 440));
  objc_msgSend(WeakRetained, "setAlpha:", 1.0);
  v3 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
  v4[0] = *MEMORY[0x1E0C9BAA8];
  v4[1] = v3;
  v4[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
  objc_msgSend(WeakRetained, "setTransform:", v4);

}

- (void)dismissalTransitionDidEnd:(BOOL)a3
{
  _BOOL4 v3;
  id WeakRetained;
  __int128 v6;
  _OWORD v7[3];
  objc_super v8;

  v3 = a3;
  v8.receiver = self;
  v8.super_class = (Class)MediaControlsPresentationController;
  -[UIPreviewPresentationController dismissalTransitionDidEnd:](&v8, sel_dismissalTransitionDidEnd_);
  if (v3)
  {
    WeakRetained = objc_loadWeakRetained((id *)&self->_presentingView);
    objc_msgSend(WeakRetained, "setAlpha:", 1.0);
    v6 = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 16);
    v7[0] = *MEMORY[0x1E0C9BAA8];
    v7[1] = v6;
    v7[2] = *(_OWORD *)(MEMORY[0x1E0C9BAA8] + 32);
    objc_msgSend(WeakRetained, "setTransform:", v7);

  }
}

- (CGRect)frameOfPresentedViewInContainerView
{
  double y;
  double x;
  void *v5;
  double v6;
  double v7;
  void *v9;
  void *v10;
  void *v11;
  double top;
  double left;
  double v14;
  double v15;
  double v16;
  CGFloat v17;
  double v18;
  double v19;
  double v20;
  double v21;
  CGFloat v22;
  CGFloat v23;
  double MinX;
  CGFloat v25;
  CGFloat v26;
  double v27;
  CGFloat v28;
  CGFloat v29;
  CGFloat v30;
  double v31;
  double MaxX;
  double v33;
  double MinY;
  double v35;
  double v36;
  double MaxY;
  CGFloat v38;
  double v39;
  CGFloat v40;
  CGFloat v41;
  CGFloat v42;
  CGFloat v43;
  double v44;
  double v45;
  double v46;
  double v47;
  CGFloat height;
  CGFloat width;
  CGFloat rect;
  CGFloat rect_8;
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
  CGRect result;

  x = self->_sourcePoint.x;
  y = self->_sourcePoint.y;
  -[MediaControlsPresentationController traitCollection](self, "traitCollection");
  v5 = (void *)objc_claimAutoreleasedReturnValue();
  if (!objc_msgSend(v5, "userInterfaceIdiom"))
  {

LABEL_8:
    -[MediaControlsPresentationController containerView](self, "containerView");
    v9 = (void *)objc_claimAutoreleasedReturnValue();
    objc_msgSend(v9, "center");

    goto LABEL_9;
  }
  v6 = *MEMORY[0x1E0C9D538];
  v7 = *(double *)(MEMORY[0x1E0C9D538] + 8);

  if (x == v6 && y == v7)
    goto LABEL_8;
LABEL_9:
  -[MediaControlsPresentationController containerView](self, "containerView");
  v10 = (void *)objc_claimAutoreleasedReturnValue();
  -[MediaControlsPresentationController presentedViewController](self, "presentedViewController");
  v11 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v11, "preferredContentSize");

  objc_msgSend(v10, "bounds");
  top = self->_edgeInsets.top;
  left = self->_edgeInsets.left;
  v15 = v14 + left;
  v17 = v16 + top;
  v19 = v18 - (left + self->_edgeInsets.right);
  v21 = v20 - (top + self->_edgeInsets.bottom);
  UIRectCenteredAboutPoint();
  v22 = v52.origin.x;
  v23 = v52.origin.y;
  height = v52.size.height;
  width = v52.size.width;
  MinX = CGRectGetMinX(v52);
  v25 = v15;
  v53.origin.x = v15;
  rect_8 = v17;
  v53.origin.y = v17;
  v53.size.width = v19;
  v53.size.height = v21;
  rect = v22;
  if (MinX >= CGRectGetMinX(v53))
  {
    v56.origin.x = v22;
    v28 = v23;
    v56.origin.y = v23;
    v30 = height;
    v29 = width;
    v56.size.width = width;
    v56.size.height = height;
    MaxX = CGRectGetMaxX(v56);
    v26 = v25;
    v57.origin.x = v25;
    v57.origin.y = rect_8;
    v57.size.width = v19;
    v57.size.height = v21;
    v33 = 0.0;
    if (MaxX <= CGRectGetMaxX(v57))
      goto LABEL_14;
    v58.origin.x = v26;
    v58.origin.y = rect_8;
    v58.size.width = v19;
    v58.size.height = v21;
    v27 = CGRectGetMaxX(v58);
    v59.origin.x = rect;
    v59.origin.y = v28;
    v59.size.width = width;
    v59.size.height = height;
    v31 = CGRectGetMaxX(v59);
  }
  else
  {
    v26 = v15;
    v54.origin.x = v15;
    v54.origin.y = rect_8;
    v54.size.width = v19;
    v54.size.height = v21;
    v27 = CGRectGetMinX(v54);
    v55.origin.x = v22;
    v28 = v23;
    v55.origin.y = v23;
    v30 = height;
    v29 = width;
    v55.size.width = width;
    v55.size.height = height;
    v31 = CGRectGetMinX(v55);
  }
  v33 = v27 - v31 + 0.0;
LABEL_14:
  v60.origin.x = rect;
  v60.origin.y = v28;
  v60.size.width = v29;
  v60.size.height = v30;
  MinY = CGRectGetMinY(v60);
  v61.origin.x = v26;
  v61.origin.y = rect_8;
  v61.size.width = v19;
  v61.size.height = v21;
  if (MinY < CGRectGetMinY(v61))
  {
    v62.origin.x = v26;
    v62.origin.y = rect_8;
    v62.size.width = v19;
    v62.size.height = v21;
    v35 = CGRectGetMinY(v62);
    v63.origin.x = rect;
    v63.origin.y = v28;
    v63.size.width = v29;
    v63.size.height = v30;
    v36 = CGRectGetMinY(v63);
LABEL_18:
    v39 = v35 - v36 + 0.0;
    goto LABEL_19;
  }
  v64.origin.x = rect;
  v64.origin.y = v28;
  v64.size.width = v29;
  v64.size.height = v30;
  MaxY = CGRectGetMaxY(v64);
  v65.origin.x = v26;
  v65.origin.y = rect_8;
  v65.size.width = v19;
  v65.size.height = v21;
  v38 = CGRectGetMaxY(v65);
  v39 = 0.0;
  if (MaxY > v38)
  {
    v66.origin.x = v26;
    v66.origin.y = rect_8;
    v66.size.width = v19;
    v66.size.height = v21;
    v35 = CGRectGetMaxY(v66);
    v67.origin.x = rect;
    v67.origin.y = v28;
    v67.size.width = v29;
    v67.size.height = v30;
    v36 = CGRectGetMaxY(v67);
    goto LABEL_18;
  }
LABEL_19:
  v68.origin.x = rect;
  v68.origin.y = v28;
  v68.size.width = v29;
  v68.size.height = v30;
  v69 = CGRectOffset(v68, v33, v39);
  v40 = v69.origin.x;
  v41 = v69.origin.y;
  v42 = v69.size.width;
  v43 = v69.size.height;

  v44 = v40;
  v45 = v41;
  v46 = v42;
  v47 = v43;
  result.size.height = v47;
  result.size.width = v46;
  result.origin.y = v45;
  result.origin.x = v44;
  return result;
}

- (BOOL)gestureRecognizer:(id)a3 shouldReceiveTouch:(id)a4
{
  id v5;
  void *v6;
  void *v7;
  double v8;
  double v9;
  double v10;
  double v11;
  void *v12;
  void *v13;

  v5 = a4;
  -[MediaControlsPresentationController presentedViewController](self, "presentedViewController");
  v6 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v6, "view");
  v7 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v5, "locationInView:", v7);
  v9 = v8;
  v11 = v10;

  -[MediaControlsPresentationController presentedViewController](self, "presentedViewController");
  v12 = (void *)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v12, "view");
  v13 = (void *)objc_claimAutoreleasedReturnValue();
  LOBYTE(v6) = objc_msgSend(v13, "pointInside:withEvent:", 0, v9, v11) ^ 1;

  return (char)v6;
}

- (void)_dismissTap:(id)a3
{
  id v3;

  -[MediaControlsPresentationController presentedViewController](self, "presentedViewController", a3);
  v3 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend(v3, "dismissViewControllerAnimated:completion:", 1, 0);

}

- (UIView)presentingView
{
  return (UIView *)objc_loadWeakRetained((id *)&self->_presentingView);
}

- (void)setPresentingView:(id)a3
{
  objc_storeWeak((id *)&self->_presentingView, a3);
}

- (CGPoint)sourcePoint
{
  double x;
  double y;
  CGPoint result;

  x = self->_sourcePoint.x;
  y = self->_sourcePoint.y;
  result.y = y;
  result.x = x;
  return result;
}

- (void)setSourcePoint:(CGPoint)a3
{
  self->_sourcePoint = a3;
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

- (void)setEdgeInsets:(UIEdgeInsets)a3
{
  self->_edgeInsets = a3;
}

- (MTMaterialView)materialView
{
  return self->_materialView;
}

- (void)setMaterialView:(id)a3
{
  objc_storeStrong((id *)&self->_materialView, a3);
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_materialView, 0);
  objc_destroyWeak((id *)&self->_presentingView);
}

@end
